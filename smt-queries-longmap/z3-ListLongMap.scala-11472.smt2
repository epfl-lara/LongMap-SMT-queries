; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133632 () Bool)

(assert start!133632)

(declare-fun b_free!32049 () Bool)

(declare-fun b_next!32049 () Bool)

(assert (=> start!133632 (= b_free!32049 (not b_next!32049))))

(declare-fun tp!113270 () Bool)

(declare-fun b_and!51609 () Bool)

(assert (=> start!133632 (= tp!113270 b_and!51609)))

(declare-fun mapNonEmpty!59448 () Bool)

(declare-fun mapRes!59448 () Bool)

(declare-fun tp!113271 () Bool)

(declare-fun e!870702 () Bool)

(assert (=> mapNonEmpty!59448 (= mapRes!59448 (and tp!113271 e!870702))))

(declare-datatypes ((V!59827 0))(
  ( (V!59828 (val!19441 Int)) )
))
(declare-datatypes ((ValueCell!18327 0))(
  ( (ValueCellFull!18327 (v!22193 V!59827)) (EmptyCell!18327) )
))
(declare-fun mapRest!59448 () (Array (_ BitVec 32) ValueCell!18327))

(declare-fun mapValue!59448 () ValueCell!18327)

(declare-fun mapKey!59448 () (_ BitVec 32))

(declare-datatypes ((array!104146 0))(
  ( (array!104147 (arr!50265 (Array (_ BitVec 32) ValueCell!18327)) (size!50815 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104146)

(assert (=> mapNonEmpty!59448 (= (arr!50265 _values!487) (store mapRest!59448 mapKey!59448 mapValue!59448))))

(declare-fun res!1068283 () Bool)

(declare-fun e!870701 () Bool)

(assert (=> start!133632 (=> (not res!1068283) (not e!870701))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133632 (= res!1068283 (validMask!0 mask!947))))

(assert (=> start!133632 e!870701))

(assert (=> start!133632 tp!113270))

(declare-fun tp_is_empty!38715 () Bool)

(assert (=> start!133632 tp_is_empty!38715))

(assert (=> start!133632 true))

(declare-datatypes ((array!104148 0))(
  ( (array!104149 (arr!50266 (Array (_ BitVec 32) (_ BitVec 64))) (size!50816 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104148)

(declare-fun array_inv!39067 (array!104148) Bool)

(assert (=> start!133632 (array_inv!39067 _keys!637)))

(declare-fun e!870703 () Bool)

(declare-fun array_inv!39068 (array!104146) Bool)

(assert (=> start!133632 (and (array_inv!39068 _values!487) e!870703)))

(declare-fun b!1562495 () Bool)

(declare-fun res!1068285 () Bool)

(assert (=> b!1562495 (=> (not res!1068285) (not e!870701))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562495 (= res!1068285 (validKeyInArray!0 (select (arr!50266 _keys!637) from!782)))))

(declare-fun b!1562496 () Bool)

(assert (=> b!1562496 (= e!870701 (not true))))

(declare-fun lt!671690 () Bool)

(declare-datatypes ((tuple2!25116 0))(
  ( (tuple2!25117 (_1!12569 (_ BitVec 64)) (_2!12569 V!59827)) )
))
(declare-datatypes ((List!36487 0))(
  ( (Nil!36484) (Cons!36483 (h!37929 tuple2!25116) (t!51326 List!36487)) )
))
(declare-datatypes ((ListLongMap!22551 0))(
  ( (ListLongMap!22552 (toList!11291 List!36487)) )
))
(declare-fun lt!671693 () ListLongMap!22551)

(declare-fun contains!10281 (ListLongMap!22551 (_ BitVec 64)) Bool)

(assert (=> b!1562496 (= lt!671690 (contains!10281 lt!671693 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562496 (not (contains!10281 lt!671693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671692 () V!59827)

(declare-fun lt!671691 () ListLongMap!22551)

(declare-fun +!5061 (ListLongMap!22551 tuple2!25116) ListLongMap!22551)

(assert (=> b!1562496 (= lt!671693 (+!5061 lt!671691 (tuple2!25117 (select (arr!50266 _keys!637) from!782) lt!671692)))))

(declare-datatypes ((Unit!51976 0))(
  ( (Unit!51977) )
))
(declare-fun lt!671694 () Unit!51976)

(declare-fun addStillNotContains!551 (ListLongMap!22551 (_ BitVec 64) V!59827 (_ BitVec 64)) Unit!51976)

(assert (=> b!1562496 (= lt!671694 (addStillNotContains!551 lt!671691 (select (arr!50266 _keys!637) from!782) lt!671692 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26254 (ValueCell!18327 V!59827) V!59827)

(declare-fun dynLambda!3845 (Int (_ BitVec 64)) V!59827)

(assert (=> b!1562496 (= lt!671692 (get!26254 (select (arr!50265 _values!487) from!782) (dynLambda!3845 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59827)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59827)

(declare-fun getCurrentListMapNoExtraKeys!6675 (array!104148 array!104146 (_ BitVec 32) (_ BitVec 32) V!59827 V!59827 (_ BitVec 32) Int) ListLongMap!22551)

(assert (=> b!1562496 (= lt!671691 (getCurrentListMapNoExtraKeys!6675 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562497 () Bool)

(assert (=> b!1562497 (= e!870702 tp_is_empty!38715)))

(declare-fun mapIsEmpty!59448 () Bool)

(assert (=> mapIsEmpty!59448 mapRes!59448))

(declare-fun b!1562498 () Bool)

(declare-fun res!1068286 () Bool)

(assert (=> b!1562498 (=> (not res!1068286) (not e!870701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104148 (_ BitVec 32)) Bool)

(assert (=> b!1562498 (= res!1068286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562499 () Bool)

(declare-fun res!1068284 () Bool)

(assert (=> b!1562499 (=> (not res!1068284) (not e!870701))))

(declare-datatypes ((List!36488 0))(
  ( (Nil!36485) (Cons!36484 (h!37930 (_ BitVec 64)) (t!51327 List!36488)) )
))
(declare-fun arrayNoDuplicates!0 (array!104148 (_ BitVec 32) List!36488) Bool)

(assert (=> b!1562499 (= res!1068284 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36485))))

(declare-fun b!1562500 () Bool)

(declare-fun e!870700 () Bool)

(assert (=> b!1562500 (= e!870700 tp_is_empty!38715)))

(declare-fun b!1562501 () Bool)

(declare-fun res!1068288 () Bool)

(assert (=> b!1562501 (=> (not res!1068288) (not e!870701))))

(assert (=> b!1562501 (= res!1068288 (and (= (size!50815 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50816 _keys!637) (size!50815 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562502 () Bool)

(assert (=> b!1562502 (= e!870703 (and e!870700 mapRes!59448))))

(declare-fun condMapEmpty!59448 () Bool)

(declare-fun mapDefault!59448 () ValueCell!18327)

(assert (=> b!1562502 (= condMapEmpty!59448 (= (arr!50265 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18327)) mapDefault!59448)))))

(declare-fun b!1562503 () Bool)

(declare-fun res!1068287 () Bool)

(assert (=> b!1562503 (=> (not res!1068287) (not e!870701))))

(assert (=> b!1562503 (= res!1068287 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50816 _keys!637)) (bvslt from!782 (size!50816 _keys!637))))))

(assert (= (and start!133632 res!1068283) b!1562501))

(assert (= (and b!1562501 res!1068288) b!1562498))

(assert (= (and b!1562498 res!1068286) b!1562499))

(assert (= (and b!1562499 res!1068284) b!1562503))

(assert (= (and b!1562503 res!1068287) b!1562495))

(assert (= (and b!1562495 res!1068285) b!1562496))

(assert (= (and b!1562502 condMapEmpty!59448) mapIsEmpty!59448))

(assert (= (and b!1562502 (not condMapEmpty!59448)) mapNonEmpty!59448))

(get-info :version)

(assert (= (and mapNonEmpty!59448 ((_ is ValueCellFull!18327) mapValue!59448)) b!1562497))

(assert (= (and b!1562502 ((_ is ValueCellFull!18327) mapDefault!59448)) b!1562500))

(assert (= start!133632 b!1562502))

(declare-fun b_lambda!24923 () Bool)

(assert (=> (not b_lambda!24923) (not b!1562496)))

(declare-fun t!51325 () Bool)

(declare-fun tb!12593 () Bool)

(assert (=> (and start!133632 (= defaultEntry!495 defaultEntry!495) t!51325) tb!12593))

(declare-fun result!26467 () Bool)

(assert (=> tb!12593 (= result!26467 tp_is_empty!38715)))

(assert (=> b!1562496 t!51325))

(declare-fun b_and!51611 () Bool)

(assert (= b_and!51609 (and (=> t!51325 result!26467) b_and!51611)))

(declare-fun m!1438257 () Bool)

(assert (=> b!1562499 m!1438257))

(declare-fun m!1438259 () Bool)

(assert (=> start!133632 m!1438259))

(declare-fun m!1438261 () Bool)

(assert (=> start!133632 m!1438261))

(declare-fun m!1438263 () Bool)

(assert (=> start!133632 m!1438263))

(declare-fun m!1438265 () Bool)

(assert (=> mapNonEmpty!59448 m!1438265))

(declare-fun m!1438267 () Bool)

(assert (=> b!1562498 m!1438267))

(declare-fun m!1438269 () Bool)

(assert (=> b!1562495 m!1438269))

(assert (=> b!1562495 m!1438269))

(declare-fun m!1438271 () Bool)

(assert (=> b!1562495 m!1438271))

(declare-fun m!1438273 () Bool)

(assert (=> b!1562496 m!1438273))

(declare-fun m!1438275 () Bool)

(assert (=> b!1562496 m!1438275))

(declare-fun m!1438277 () Bool)

(assert (=> b!1562496 m!1438277))

(assert (=> b!1562496 m!1438269))

(declare-fun m!1438279 () Bool)

(assert (=> b!1562496 m!1438279))

(assert (=> b!1562496 m!1438273))

(assert (=> b!1562496 m!1438269))

(declare-fun m!1438281 () Bool)

(assert (=> b!1562496 m!1438281))

(assert (=> b!1562496 m!1438275))

(declare-fun m!1438283 () Bool)

(assert (=> b!1562496 m!1438283))

(declare-fun m!1438285 () Bool)

(assert (=> b!1562496 m!1438285))

(declare-fun m!1438287 () Bool)

(assert (=> b!1562496 m!1438287))

(check-sat (not b_lambda!24923) (not b!1562495) (not b!1562498) (not b!1562499) (not b!1562496) (not mapNonEmpty!59448) tp_is_empty!38715 (not start!133632) (not b_next!32049) b_and!51611)
(check-sat b_and!51611 (not b_next!32049))
