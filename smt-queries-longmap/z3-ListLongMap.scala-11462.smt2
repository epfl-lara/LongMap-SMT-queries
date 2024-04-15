; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133520 () Bool)

(assert start!133520)

(declare-fun b_free!31987 () Bool)

(declare-fun b_next!31987 () Bool)

(assert (=> start!133520 (= b_free!31987 (not b_next!31987))))

(declare-fun tp!113086 () Bool)

(declare-fun b_and!51467 () Bool)

(assert (=> start!133520 (= tp!113086 b_and!51467)))

(declare-fun b!1561274 () Bool)

(declare-fun res!1067587 () Bool)

(declare-fun e!870031 () Bool)

(assert (=> b!1561274 (=> (not res!1067587) (not e!870031))))

(declare-datatypes ((array!103936 0))(
  ( (array!103937 (arr!50161 (Array (_ BitVec 32) (_ BitVec 64))) (size!50713 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103936)

(declare-datatypes ((List!36478 0))(
  ( (Nil!36475) (Cons!36474 (h!37921 (_ BitVec 64)) (t!51247 List!36478)) )
))
(declare-fun arrayNoDuplicates!0 (array!103936 (_ BitVec 32) List!36478) Bool)

(assert (=> b!1561274 (= res!1067587 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36475))))

(declare-fun b!1561275 () Bool)

(declare-fun res!1067591 () Bool)

(assert (=> b!1561275 (=> (not res!1067591) (not e!870031))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561275 (= res!1067591 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50713 _keys!637)) (bvslt from!782 (size!50713 _keys!637))))))

(declare-fun b!1561276 () Bool)

(declare-fun e!870027 () Bool)

(declare-fun tp_is_empty!38653 () Bool)

(assert (=> b!1561276 (= e!870027 tp_is_empty!38653)))

(declare-fun b!1561277 () Bool)

(declare-fun e!870029 () Bool)

(declare-fun mapRes!59355 () Bool)

(assert (=> b!1561277 (= e!870029 (and e!870027 mapRes!59355))))

(declare-fun condMapEmpty!59355 () Bool)

(declare-datatypes ((V!59745 0))(
  ( (V!59746 (val!19410 Int)) )
))
(declare-datatypes ((ValueCell!18296 0))(
  ( (ValueCellFull!18296 (v!22158 V!59745)) (EmptyCell!18296) )
))
(declare-datatypes ((array!103938 0))(
  ( (array!103939 (arr!50162 (Array (_ BitVec 32) ValueCell!18296)) (size!50714 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103938)

(declare-fun mapDefault!59355 () ValueCell!18296)

(assert (=> b!1561277 (= condMapEmpty!59355 (= (arr!50162 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18296)) mapDefault!59355)))))

(declare-fun res!1067589 () Bool)

(assert (=> start!133520 (=> (not res!1067589) (not e!870031))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133520 (= res!1067589 (validMask!0 mask!947))))

(assert (=> start!133520 e!870031))

(assert (=> start!133520 tp!113086))

(assert (=> start!133520 tp_is_empty!38653))

(assert (=> start!133520 true))

(declare-fun array_inv!39173 (array!103936) Bool)

(assert (=> start!133520 (array_inv!39173 _keys!637)))

(declare-fun array_inv!39174 (array!103938) Bool)

(assert (=> start!133520 (and (array_inv!39174 _values!487) e!870029)))

(declare-fun mapNonEmpty!59355 () Bool)

(declare-fun tp!113085 () Bool)

(declare-fun e!870030 () Bool)

(assert (=> mapNonEmpty!59355 (= mapRes!59355 (and tp!113085 e!870030))))

(declare-fun mapKey!59355 () (_ BitVec 32))

(declare-fun mapRest!59355 () (Array (_ BitVec 32) ValueCell!18296))

(declare-fun mapValue!59355 () ValueCell!18296)

(assert (=> mapNonEmpty!59355 (= (arr!50162 _values!487) (store mapRest!59355 mapKey!59355 mapValue!59355))))

(declare-fun b!1561278 () Bool)

(assert (=> b!1561278 (= e!870031 (not true))))

(declare-datatypes ((tuple2!25138 0))(
  ( (tuple2!25139 (_1!12580 (_ BitVec 64)) (_2!12580 V!59745)) )
))
(declare-datatypes ((List!36479 0))(
  ( (Nil!36476) (Cons!36475 (h!37922 tuple2!25138) (t!51248 List!36479)) )
))
(declare-datatypes ((ListLongMap!22573 0))(
  ( (ListLongMap!22574 (toList!11302 List!36479)) )
))
(declare-fun lt!670971 () ListLongMap!22573)

(declare-fun lt!670972 () V!59745)

(declare-fun contains!10212 (ListLongMap!22573 (_ BitVec 64)) Bool)

(declare-fun +!5067 (ListLongMap!22573 tuple2!25138) ListLongMap!22573)

(assert (=> b!1561278 (not (contains!10212 (+!5067 lt!670971 (tuple2!25139 (select (arr!50161 _keys!637) from!782) lt!670972)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51742 0))(
  ( (Unit!51743) )
))
(declare-fun lt!670973 () Unit!51742)

(declare-fun addStillNotContains!514 (ListLongMap!22573 (_ BitVec 64) V!59745 (_ BitVec 64)) Unit!51742)

(assert (=> b!1561278 (= lt!670973 (addStillNotContains!514 lt!670971 (select (arr!50161 _keys!637) from!782) lt!670972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26208 (ValueCell!18296 V!59745) V!59745)

(declare-fun dynLambda!3843 (Int (_ BitVec 64)) V!59745)

(assert (=> b!1561278 (= lt!670972 (get!26208 (select (arr!50162 _values!487) from!782) (dynLambda!3843 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59745)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59745)

(declare-fun getCurrentListMapNoExtraKeys!6676 (array!103936 array!103938 (_ BitVec 32) (_ BitVec 32) V!59745 V!59745 (_ BitVec 32) Int) ListLongMap!22573)

(assert (=> b!1561278 (= lt!670971 (getCurrentListMapNoExtraKeys!6676 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561279 () Bool)

(declare-fun res!1067590 () Bool)

(assert (=> b!1561279 (=> (not res!1067590) (not e!870031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103936 (_ BitVec 32)) Bool)

(assert (=> b!1561279 (= res!1067590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561280 () Bool)

(assert (=> b!1561280 (= e!870030 tp_is_empty!38653)))

(declare-fun b!1561281 () Bool)

(declare-fun res!1067592 () Bool)

(assert (=> b!1561281 (=> (not res!1067592) (not e!870031))))

(assert (=> b!1561281 (= res!1067592 (and (= (size!50714 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50713 _keys!637) (size!50714 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561282 () Bool)

(declare-fun res!1067588 () Bool)

(assert (=> b!1561282 (=> (not res!1067588) (not e!870031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561282 (= res!1067588 (validKeyInArray!0 (select (arr!50161 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59355 () Bool)

(assert (=> mapIsEmpty!59355 mapRes!59355))

(assert (= (and start!133520 res!1067589) b!1561281))

(assert (= (and b!1561281 res!1067592) b!1561279))

(assert (= (and b!1561279 res!1067590) b!1561274))

(assert (= (and b!1561274 res!1067587) b!1561275))

(assert (= (and b!1561275 res!1067591) b!1561282))

(assert (= (and b!1561282 res!1067588) b!1561278))

(assert (= (and b!1561277 condMapEmpty!59355) mapIsEmpty!59355))

(assert (= (and b!1561277 (not condMapEmpty!59355)) mapNonEmpty!59355))

(get-info :version)

(assert (= (and mapNonEmpty!59355 ((_ is ValueCellFull!18296) mapValue!59355)) b!1561280))

(assert (= (and b!1561277 ((_ is ValueCellFull!18296) mapDefault!59355)) b!1561276))

(assert (= start!133520 b!1561277))

(declare-fun b_lambda!24851 () Bool)

(assert (=> (not b_lambda!24851) (not b!1561278)))

(declare-fun t!51246 () Bool)

(declare-fun tb!12523 () Bool)

(assert (=> (and start!133520 (= defaultEntry!495 defaultEntry!495) t!51246) tb!12523))

(declare-fun result!26335 () Bool)

(assert (=> tb!12523 (= result!26335 tp_is_empty!38653)))

(assert (=> b!1561278 t!51246))

(declare-fun b_and!51469 () Bool)

(assert (= b_and!51467 (and (=> t!51246 result!26335) b_and!51469)))

(declare-fun m!1436379 () Bool)

(assert (=> b!1561274 m!1436379))

(declare-fun m!1436381 () Bool)

(assert (=> mapNonEmpty!59355 m!1436381))

(declare-fun m!1436383 () Bool)

(assert (=> b!1561279 m!1436383))

(declare-fun m!1436385 () Bool)

(assert (=> b!1561282 m!1436385))

(assert (=> b!1561282 m!1436385))

(declare-fun m!1436387 () Bool)

(assert (=> b!1561282 m!1436387))

(declare-fun m!1436389 () Bool)

(assert (=> b!1561278 m!1436389))

(declare-fun m!1436391 () Bool)

(assert (=> b!1561278 m!1436391))

(declare-fun m!1436393 () Bool)

(assert (=> b!1561278 m!1436393))

(declare-fun m!1436395 () Bool)

(assert (=> b!1561278 m!1436395))

(declare-fun m!1436397 () Bool)

(assert (=> b!1561278 m!1436397))

(assert (=> b!1561278 m!1436389))

(assert (=> b!1561278 m!1436385))

(declare-fun m!1436399 () Bool)

(assert (=> b!1561278 m!1436399))

(assert (=> b!1561278 m!1436395))

(assert (=> b!1561278 m!1436385))

(assert (=> b!1561278 m!1436391))

(declare-fun m!1436401 () Bool)

(assert (=> b!1561278 m!1436401))

(declare-fun m!1436403 () Bool)

(assert (=> start!133520 m!1436403))

(declare-fun m!1436405 () Bool)

(assert (=> start!133520 m!1436405))

(declare-fun m!1436407 () Bool)

(assert (=> start!133520 m!1436407))

(check-sat (not b!1561274) (not mapNonEmpty!59355) (not b!1561282) (not b!1561279) (not b_lambda!24851) (not b_next!31987) (not start!133520) (not b!1561278) b_and!51469 tp_is_empty!38653)
(check-sat b_and!51469 (not b_next!31987))
