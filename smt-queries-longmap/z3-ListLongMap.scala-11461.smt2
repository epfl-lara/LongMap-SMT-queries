; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133566 () Bool)

(assert start!133566)

(declare-fun b_free!31983 () Bool)

(declare-fun b_next!31983 () Bool)

(assert (=> start!133566 (= b_free!31983 (not b_next!31983))))

(declare-fun tp!113072 () Bool)

(declare-fun b_and!51477 () Bool)

(assert (=> start!133566 (= tp!113072 b_and!51477)))

(declare-fun mapIsEmpty!59349 () Bool)

(declare-fun mapRes!59349 () Bool)

(assert (=> mapIsEmpty!59349 mapRes!59349))

(declare-fun b!1561529 () Bool)

(declare-fun res!1067681 () Bool)

(declare-fun e!870195 () Bool)

(assert (=> b!1561529 (=> (not res!1067681) (not e!870195))))

(declare-datatypes ((array!104016 0))(
  ( (array!104017 (arr!50200 (Array (_ BitVec 32) (_ BitVec 64))) (size!50750 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104016)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104016 (_ BitVec 32)) Bool)

(assert (=> b!1561529 (= res!1067681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561530 () Bool)

(declare-fun res!1067682 () Bool)

(assert (=> b!1561530 (=> (not res!1067682) (not e!870195))))

(declare-datatypes ((List!36443 0))(
  ( (Nil!36440) (Cons!36439 (h!37885 (_ BitVec 64)) (t!51216 List!36443)) )
))
(declare-fun arrayNoDuplicates!0 (array!104016 (_ BitVec 32) List!36443) Bool)

(assert (=> b!1561530 (= res!1067682 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36440))))

(declare-fun b!1561531 () Bool)

(declare-fun res!1067685 () Bool)

(assert (=> b!1561531 (=> (not res!1067685) (not e!870195))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561531 (= res!1067685 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50750 _keys!637)) (bvslt from!782 (size!50750 _keys!637))))))

(declare-fun mapNonEmpty!59349 () Bool)

(declare-fun tp!113073 () Bool)

(declare-fun e!870196 () Bool)

(assert (=> mapNonEmpty!59349 (= mapRes!59349 (and tp!113073 e!870196))))

(declare-datatypes ((V!59739 0))(
  ( (V!59740 (val!19408 Int)) )
))
(declare-datatypes ((ValueCell!18294 0))(
  ( (ValueCellFull!18294 (v!22160 V!59739)) (EmptyCell!18294) )
))
(declare-fun mapRest!59349 () (Array (_ BitVec 32) ValueCell!18294))

(declare-fun mapValue!59349 () ValueCell!18294)

(declare-fun mapKey!59349 () (_ BitVec 32))

(declare-datatypes ((array!104018 0))(
  ( (array!104019 (arr!50201 (Array (_ BitVec 32) ValueCell!18294)) (size!50751 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104018)

(assert (=> mapNonEmpty!59349 (= (arr!50201 _values!487) (store mapRest!59349 mapKey!59349 mapValue!59349))))

(declare-fun b!1561532 () Bool)

(declare-fun e!870199 () Bool)

(declare-fun tp_is_empty!38649 () Bool)

(assert (=> b!1561532 (= e!870199 tp_is_empty!38649)))

(declare-fun res!1067683 () Bool)

(assert (=> start!133566 (=> (not res!1067683) (not e!870195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133566 (= res!1067683 (validMask!0 mask!947))))

(assert (=> start!133566 e!870195))

(assert (=> start!133566 tp!113072))

(assert (=> start!133566 tp_is_empty!38649))

(assert (=> start!133566 true))

(declare-fun array_inv!39021 (array!104016) Bool)

(assert (=> start!133566 (array_inv!39021 _keys!637)))

(declare-fun e!870198 () Bool)

(declare-fun array_inv!39022 (array!104018) Bool)

(assert (=> start!133566 (and (array_inv!39022 _values!487) e!870198)))

(declare-fun b!1561533 () Bool)

(assert (=> b!1561533 (= e!870195 (not true))))

(declare-fun lt!671241 () V!59739)

(declare-datatypes ((tuple2!25074 0))(
  ( (tuple2!25075 (_1!12548 (_ BitVec 64)) (_2!12548 V!59739)) )
))
(declare-datatypes ((List!36444 0))(
  ( (Nil!36441) (Cons!36440 (h!37886 tuple2!25074) (t!51217 List!36444)) )
))
(declare-datatypes ((ListLongMap!22509 0))(
  ( (ListLongMap!22510 (toList!11270 List!36444)) )
))
(declare-fun lt!671239 () ListLongMap!22509)

(declare-fun contains!10260 (ListLongMap!22509 (_ BitVec 64)) Bool)

(declare-fun +!5040 (ListLongMap!22509 tuple2!25074) ListLongMap!22509)

(assert (=> b!1561533 (not (contains!10260 (+!5040 lt!671239 (tuple2!25075 (select (arr!50200 _keys!637) from!782) lt!671241)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51934 0))(
  ( (Unit!51935) )
))
(declare-fun lt!671240 () Unit!51934)

(declare-fun addStillNotContains!530 (ListLongMap!22509 (_ BitVec 64) V!59739 (_ BitVec 64)) Unit!51934)

(assert (=> b!1561533 (= lt!671240 (addStillNotContains!530 lt!671239 (select (arr!50200 _keys!637) from!782) lt!671241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26211 (ValueCell!18294 V!59739) V!59739)

(declare-fun dynLambda!3824 (Int (_ BitVec 64)) V!59739)

(assert (=> b!1561533 (= lt!671241 (get!26211 (select (arr!50201 _values!487) from!782) (dynLambda!3824 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59739)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59739)

(declare-fun getCurrentListMapNoExtraKeys!6654 (array!104016 array!104018 (_ BitVec 32) (_ BitVec 32) V!59739 V!59739 (_ BitVec 32) Int) ListLongMap!22509)

(assert (=> b!1561533 (= lt!671239 (getCurrentListMapNoExtraKeys!6654 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561534 () Bool)

(assert (=> b!1561534 (= e!870196 tp_is_empty!38649)))

(declare-fun b!1561535 () Bool)

(declare-fun res!1067684 () Bool)

(assert (=> b!1561535 (=> (not res!1067684) (not e!870195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561535 (= res!1067684 (validKeyInArray!0 (select (arr!50200 _keys!637) from!782)))))

(declare-fun b!1561536 () Bool)

(declare-fun res!1067680 () Bool)

(assert (=> b!1561536 (=> (not res!1067680) (not e!870195))))

(assert (=> b!1561536 (= res!1067680 (and (= (size!50751 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50750 _keys!637) (size!50751 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561537 () Bool)

(assert (=> b!1561537 (= e!870198 (and e!870199 mapRes!59349))))

(declare-fun condMapEmpty!59349 () Bool)

(declare-fun mapDefault!59349 () ValueCell!18294)

(assert (=> b!1561537 (= condMapEmpty!59349 (= (arr!50201 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18294)) mapDefault!59349)))))

(assert (= (and start!133566 res!1067683) b!1561536))

(assert (= (and b!1561536 res!1067680) b!1561529))

(assert (= (and b!1561529 res!1067681) b!1561530))

(assert (= (and b!1561530 res!1067682) b!1561531))

(assert (= (and b!1561531 res!1067685) b!1561535))

(assert (= (and b!1561535 res!1067684) b!1561533))

(assert (= (and b!1561537 condMapEmpty!59349) mapIsEmpty!59349))

(assert (= (and b!1561537 (not condMapEmpty!59349)) mapNonEmpty!59349))

(get-info :version)

(assert (= (and mapNonEmpty!59349 ((_ is ValueCellFull!18294) mapValue!59349)) b!1561534))

(assert (= (and b!1561537 ((_ is ValueCellFull!18294) mapDefault!59349)) b!1561532))

(assert (= start!133566 b!1561537))

(declare-fun b_lambda!24857 () Bool)

(assert (=> (not b_lambda!24857) (not b!1561533)))

(declare-fun t!51215 () Bool)

(declare-fun tb!12527 () Bool)

(assert (=> (and start!133566 (= defaultEntry!495 defaultEntry!495) t!51215) tb!12527))

(declare-fun result!26335 () Bool)

(assert (=> tb!12527 (= result!26335 tp_is_empty!38649)))

(assert (=> b!1561533 t!51215))

(declare-fun b_and!51479 () Bool)

(assert (= b_and!51477 (and (=> t!51215 result!26335) b_and!51479)))

(declare-fun m!1437211 () Bool)

(assert (=> b!1561530 m!1437211))

(declare-fun m!1437213 () Bool)

(assert (=> b!1561535 m!1437213))

(assert (=> b!1561535 m!1437213))

(declare-fun m!1437215 () Bool)

(assert (=> b!1561535 m!1437215))

(declare-fun m!1437217 () Bool)

(assert (=> mapNonEmpty!59349 m!1437217))

(declare-fun m!1437219 () Bool)

(assert (=> start!133566 m!1437219))

(declare-fun m!1437221 () Bool)

(assert (=> start!133566 m!1437221))

(declare-fun m!1437223 () Bool)

(assert (=> start!133566 m!1437223))

(declare-fun m!1437225 () Bool)

(assert (=> b!1561533 m!1437225))

(declare-fun m!1437227 () Bool)

(assert (=> b!1561533 m!1437227))

(declare-fun m!1437229 () Bool)

(assert (=> b!1561533 m!1437229))

(assert (=> b!1561533 m!1437213))

(declare-fun m!1437231 () Bool)

(assert (=> b!1561533 m!1437231))

(assert (=> b!1561533 m!1437225))

(assert (=> b!1561533 m!1437227))

(declare-fun m!1437233 () Bool)

(assert (=> b!1561533 m!1437233))

(declare-fun m!1437235 () Bool)

(assert (=> b!1561533 m!1437235))

(assert (=> b!1561533 m!1437235))

(declare-fun m!1437237 () Bool)

(assert (=> b!1561533 m!1437237))

(assert (=> b!1561533 m!1437213))

(declare-fun m!1437239 () Bool)

(assert (=> b!1561529 m!1437239))

(check-sat b_and!51479 (not b_lambda!24857) (not b!1561530) (not b!1561535) tp_is_empty!38649 (not mapNonEmpty!59349) (not start!133566) (not b!1561533) (not b!1561529) (not b_next!31983))
(check-sat b_and!51479 (not b_next!31983))
