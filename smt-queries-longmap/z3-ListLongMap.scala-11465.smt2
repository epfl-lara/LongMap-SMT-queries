; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134000 () Bool)

(assert start!134000)

(declare-fun b_free!32005 () Bool)

(declare-fun b_next!32005 () Bool)

(assert (=> start!134000 (= b_free!32005 (not b_next!32005))))

(declare-fun tp!113139 () Bool)

(declare-fun b_and!51523 () Bool)

(assert (=> start!134000 (= tp!113139 b_and!51523)))

(declare-fun mapNonEmpty!59382 () Bool)

(declare-fun mapRes!59382 () Bool)

(declare-fun tp!113138 () Bool)

(declare-fun e!871882 () Bool)

(assert (=> mapNonEmpty!59382 (= mapRes!59382 (and tp!113138 e!871882))))

(declare-datatypes ((V!59769 0))(
  ( (V!59770 (val!19419 Int)) )
))
(declare-datatypes ((ValueCell!18305 0))(
  ( (ValueCellFull!18305 (v!22163 V!59769)) (EmptyCell!18305) )
))
(declare-fun mapRest!59382 () (Array (_ BitVec 32) ValueCell!18305))

(declare-datatypes ((array!104174 0))(
  ( (array!104175 (arr!50272 (Array (_ BitVec 32) ValueCell!18305)) (size!50823 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104174)

(declare-fun mapValue!59382 () ValueCell!18305)

(declare-fun mapKey!59382 () (_ BitVec 32))

(assert (=> mapNonEmpty!59382 (= (arr!50272 _values!487) (store mapRest!59382 mapKey!59382 mapValue!59382))))

(declare-fun b!1564293 () Bool)

(declare-fun e!871880 () Bool)

(declare-fun tp_is_empty!38671 () Bool)

(assert (=> b!1564293 (= e!871880 tp_is_empty!38671)))

(declare-fun b!1564294 () Bool)

(declare-fun e!871879 () Bool)

(assert (=> b!1564294 (= e!871879 (not true))))

(declare-fun lt!672271 () Bool)

(declare-datatypes ((tuple2!25146 0))(
  ( (tuple2!25147 (_1!12584 (_ BitVec 64)) (_2!12584 V!59769)) )
))
(declare-datatypes ((List!36486 0))(
  ( (Nil!36483) (Cons!36482 (h!37946 tuple2!25146) (t!51273 List!36486)) )
))
(declare-datatypes ((ListLongMap!22589 0))(
  ( (ListLongMap!22590 (toList!11310 List!36486)) )
))
(declare-fun lt!672269 () ListLongMap!22589)

(declare-fun contains!10311 (ListLongMap!22589 (_ BitVec 64)) Bool)

(assert (=> b!1564294 (= lt!672271 (contains!10311 lt!672269 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564294 (not (contains!10311 lt!672269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672270 () V!59769)

(declare-datatypes ((array!104176 0))(
  ( (array!104177 (arr!50273 (Array (_ BitVec 32) (_ BitVec 64))) (size!50824 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104176)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!672272 () ListLongMap!22589)

(declare-fun +!5086 (ListLongMap!22589 tuple2!25146) ListLongMap!22589)

(assert (=> b!1564294 (= lt!672269 (+!5086 lt!672272 (tuple2!25147 (select (arr!50273 _keys!637) from!782) lt!672270)))))

(declare-datatypes ((Unit!51857 0))(
  ( (Unit!51858) )
))
(declare-fun lt!672268 () Unit!51857)

(declare-fun addStillNotContains!537 (ListLongMap!22589 (_ BitVec 64) V!59769 (_ BitVec 64)) Unit!51857)

(assert (=> b!1564294 (= lt!672268 (addStillNotContains!537 lt!672272 (select (arr!50273 _keys!637) from!782) lt!672270 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26266 (ValueCell!18305 V!59769) V!59769)

(declare-fun dynLambda!3884 (Int (_ BitVec 64)) V!59769)

(assert (=> b!1564294 (= lt!672270 (get!26266 (select (arr!50272 _values!487) from!782) (dynLambda!3884 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59769)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59769)

(declare-fun getCurrentListMapNoExtraKeys!6709 (array!104176 array!104174 (_ BitVec 32) (_ BitVec 32) V!59769 V!59769 (_ BitVec 32) Int) ListLongMap!22589)

(assert (=> b!1564294 (= lt!672272 (getCurrentListMapNoExtraKeys!6709 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564296 () Bool)

(declare-fun res!1068750 () Bool)

(assert (=> b!1564296 (=> (not res!1068750) (not e!871879))))

(assert (=> b!1564296 (= res!1068750 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50824 _keys!637)) (bvslt from!782 (size!50824 _keys!637))))))

(declare-fun b!1564297 () Bool)

(declare-fun res!1068752 () Bool)

(assert (=> b!1564297 (=> (not res!1068752) (not e!871879))))

(declare-datatypes ((List!36487 0))(
  ( (Nil!36484) (Cons!36483 (h!37947 (_ BitVec 64)) (t!51274 List!36487)) )
))
(declare-fun arrayNoDuplicates!0 (array!104176 (_ BitVec 32) List!36487) Bool)

(assert (=> b!1564297 (= res!1068752 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36484))))

(declare-fun mapIsEmpty!59382 () Bool)

(assert (=> mapIsEmpty!59382 mapRes!59382))

(declare-fun b!1564298 () Bool)

(declare-fun res!1068751 () Bool)

(assert (=> b!1564298 (=> (not res!1068751) (not e!871879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104176 (_ BitVec 32)) Bool)

(assert (=> b!1564298 (= res!1068751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564299 () Bool)

(assert (=> b!1564299 (= e!871882 tp_is_empty!38671)))

(declare-fun res!1068749 () Bool)

(assert (=> start!134000 (=> (not res!1068749) (not e!871879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134000 (= res!1068749 (validMask!0 mask!947))))

(assert (=> start!134000 e!871879))

(assert (=> start!134000 tp!113139))

(assert (=> start!134000 tp_is_empty!38671))

(assert (=> start!134000 true))

(declare-fun array_inv!39321 (array!104176) Bool)

(assert (=> start!134000 (array_inv!39321 _keys!637)))

(declare-fun e!871878 () Bool)

(declare-fun array_inv!39322 (array!104174) Bool)

(assert (=> start!134000 (and (array_inv!39322 _values!487) e!871878)))

(declare-fun b!1564295 () Bool)

(declare-fun res!1068747 () Bool)

(assert (=> b!1564295 (=> (not res!1068747) (not e!871879))))

(assert (=> b!1564295 (= res!1068747 (and (= (size!50823 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50824 _keys!637) (size!50823 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564300 () Bool)

(assert (=> b!1564300 (= e!871878 (and e!871880 mapRes!59382))))

(declare-fun condMapEmpty!59382 () Bool)

(declare-fun mapDefault!59382 () ValueCell!18305)

(assert (=> b!1564300 (= condMapEmpty!59382 (= (arr!50272 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18305)) mapDefault!59382)))))

(declare-fun b!1564301 () Bool)

(declare-fun res!1068748 () Bool)

(assert (=> b!1564301 (=> (not res!1068748) (not e!871879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564301 (= res!1068748 (validKeyInArray!0 (select (arr!50273 _keys!637) from!782)))))

(assert (= (and start!134000 res!1068749) b!1564295))

(assert (= (and b!1564295 res!1068747) b!1564298))

(assert (= (and b!1564298 res!1068751) b!1564297))

(assert (= (and b!1564297 res!1068752) b!1564296))

(assert (= (and b!1564296 res!1068750) b!1564301))

(assert (= (and b!1564301 res!1068748) b!1564294))

(assert (= (and b!1564300 condMapEmpty!59382) mapIsEmpty!59382))

(assert (= (and b!1564300 (not condMapEmpty!59382)) mapNonEmpty!59382))

(get-info :version)

(assert (= (and mapNonEmpty!59382 ((_ is ValueCellFull!18305) mapValue!59382)) b!1564299))

(assert (= (and b!1564300 ((_ is ValueCellFull!18305) mapDefault!59382)) b!1564293))

(assert (= start!134000 b!1564300))

(declare-fun b_lambda!24873 () Bool)

(assert (=> (not b_lambda!24873) (not b!1564294)))

(declare-fun t!51272 () Bool)

(declare-fun tb!12541 () Bool)

(assert (=> (and start!134000 (= defaultEntry!495 defaultEntry!495) t!51272) tb!12541))

(declare-fun result!26371 () Bool)

(assert (=> tb!12541 (= result!26371 tp_is_empty!38671)))

(assert (=> b!1564294 t!51272))

(declare-fun b_and!51525 () Bool)

(assert (= b_and!51523 (and (=> t!51272 result!26371) b_and!51525)))

(declare-fun m!1439811 () Bool)

(assert (=> b!1564298 m!1439811))

(declare-fun m!1439813 () Bool)

(assert (=> mapNonEmpty!59382 m!1439813))

(declare-fun m!1439815 () Bool)

(assert (=> b!1564297 m!1439815))

(declare-fun m!1439817 () Bool)

(assert (=> b!1564301 m!1439817))

(assert (=> b!1564301 m!1439817))

(declare-fun m!1439819 () Bool)

(assert (=> b!1564301 m!1439819))

(declare-fun m!1439821 () Bool)

(assert (=> start!134000 m!1439821))

(declare-fun m!1439823 () Bool)

(assert (=> start!134000 m!1439823))

(declare-fun m!1439825 () Bool)

(assert (=> start!134000 m!1439825))

(declare-fun m!1439827 () Bool)

(assert (=> b!1564294 m!1439827))

(assert (=> b!1564294 m!1439817))

(declare-fun m!1439829 () Bool)

(assert (=> b!1564294 m!1439829))

(declare-fun m!1439831 () Bool)

(assert (=> b!1564294 m!1439831))

(declare-fun m!1439833 () Bool)

(assert (=> b!1564294 m!1439833))

(declare-fun m!1439835 () Bool)

(assert (=> b!1564294 m!1439835))

(declare-fun m!1439837 () Bool)

(assert (=> b!1564294 m!1439837))

(assert (=> b!1564294 m!1439817))

(declare-fun m!1439839 () Bool)

(assert (=> b!1564294 m!1439839))

(assert (=> b!1564294 m!1439827))

(assert (=> b!1564294 m!1439829))

(declare-fun m!1439841 () Bool)

(assert (=> b!1564294 m!1439841))

(check-sat (not b!1564297) (not b!1564298) (not b_next!32005) (not b!1564301) tp_is_empty!38671 (not mapNonEmpty!59382) (not b!1564294) (not b_lambda!24873) b_and!51525 (not start!134000))
(check-sat b_and!51525 (not b_next!32005))
