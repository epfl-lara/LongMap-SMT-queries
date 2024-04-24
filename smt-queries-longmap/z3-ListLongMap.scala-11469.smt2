; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134024 () Bool)

(assert start!134024)

(declare-fun b_free!32029 () Bool)

(declare-fun b_next!32029 () Bool)

(assert (=> start!134024 (= b_free!32029 (not b_next!32029))))

(declare-fun tp!113211 () Bool)

(declare-fun b_and!51571 () Bool)

(assert (=> start!134024 (= tp!113211 b_and!51571)))

(declare-fun mapIsEmpty!59418 () Bool)

(declare-fun mapRes!59418 () Bool)

(assert (=> mapIsEmpty!59418 mapRes!59418))

(declare-fun b!1564641 () Bool)

(declare-fun e!872061 () Bool)

(assert (=> b!1564641 (= e!872061 (not true))))

(declare-fun lt!672450 () Bool)

(declare-datatypes ((V!59801 0))(
  ( (V!59802 (val!19431 Int)) )
))
(declare-datatypes ((tuple2!25164 0))(
  ( (tuple2!25165 (_1!12593 (_ BitVec 64)) (_2!12593 V!59801)) )
))
(declare-datatypes ((List!36505 0))(
  ( (Nil!36502) (Cons!36501 (h!37965 tuple2!25164) (t!51316 List!36505)) )
))
(declare-datatypes ((ListLongMap!22607 0))(
  ( (ListLongMap!22608 (toList!11319 List!36505)) )
))
(declare-fun lt!672451 () ListLongMap!22607)

(declare-fun contains!10320 (ListLongMap!22607 (_ BitVec 64)) Bool)

(assert (=> b!1564641 (= lt!672450 (contains!10320 lt!672451 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564641 (not (contains!10320 lt!672451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672449 () V!59801)

(declare-fun lt!672452 () ListLongMap!22607)

(declare-datatypes ((array!104222 0))(
  ( (array!104223 (arr!50296 (Array (_ BitVec 32) (_ BitVec 64))) (size!50847 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104222)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun +!5095 (ListLongMap!22607 tuple2!25164) ListLongMap!22607)

(assert (=> b!1564641 (= lt!672451 (+!5095 lt!672452 (tuple2!25165 (select (arr!50296 _keys!637) from!782) lt!672449)))))

(declare-datatypes ((Unit!51875 0))(
  ( (Unit!51876) )
))
(declare-fun lt!672448 () Unit!51875)

(declare-fun addStillNotContains!546 (ListLongMap!22607 (_ BitVec 64) V!59801 (_ BitVec 64)) Unit!51875)

(assert (=> b!1564641 (= lt!672448 (addStillNotContains!546 lt!672452 (select (arr!50296 _keys!637) from!782) lt!672449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18317 0))(
  ( (ValueCellFull!18317 (v!22175 V!59801)) (EmptyCell!18317) )
))
(declare-datatypes ((array!104224 0))(
  ( (array!104225 (arr!50297 (Array (_ BitVec 32) ValueCell!18317)) (size!50848 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104224)

(declare-fun get!26283 (ValueCell!18317 V!59801) V!59801)

(declare-fun dynLambda!3893 (Int (_ BitVec 64)) V!59801)

(assert (=> b!1564641 (= lt!672449 (get!26283 (select (arr!50297 _values!487) from!782) (dynLambda!3893 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59801)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59801)

(declare-fun getCurrentListMapNoExtraKeys!6718 (array!104222 array!104224 (_ BitVec 32) (_ BitVec 32) V!59801 V!59801 (_ BitVec 32) Int) ListLongMap!22607)

(assert (=> b!1564641 (= lt!672452 (getCurrentListMapNoExtraKeys!6718 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564642 () Bool)

(declare-fun res!1068966 () Bool)

(assert (=> b!1564642 (=> (not res!1068966) (not e!872061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104222 (_ BitVec 32)) Bool)

(assert (=> b!1564642 (= res!1068966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564643 () Bool)

(declare-fun e!872062 () Bool)

(declare-fun e!872058 () Bool)

(assert (=> b!1564643 (= e!872062 (and e!872058 mapRes!59418))))

(declare-fun condMapEmpty!59418 () Bool)

(declare-fun mapDefault!59418 () ValueCell!18317)

(assert (=> b!1564643 (= condMapEmpty!59418 (= (arr!50297 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18317)) mapDefault!59418)))))

(declare-fun b!1564644 () Bool)

(declare-fun res!1068963 () Bool)

(assert (=> b!1564644 (=> (not res!1068963) (not e!872061))))

(assert (=> b!1564644 (= res!1068963 (and (= (size!50848 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50847 _keys!637) (size!50848 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564645 () Bool)

(declare-fun res!1068965 () Bool)

(assert (=> b!1564645 (=> (not res!1068965) (not e!872061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564645 (= res!1068965 (validKeyInArray!0 (select (arr!50296 _keys!637) from!782)))))

(declare-fun b!1564646 () Bool)

(declare-fun res!1068964 () Bool)

(assert (=> b!1564646 (=> (not res!1068964) (not e!872061))))

(assert (=> b!1564646 (= res!1068964 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50847 _keys!637)) (bvslt from!782 (size!50847 _keys!637))))))

(declare-fun res!1068968 () Bool)

(assert (=> start!134024 (=> (not res!1068968) (not e!872061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134024 (= res!1068968 (validMask!0 mask!947))))

(assert (=> start!134024 e!872061))

(assert (=> start!134024 tp!113211))

(declare-fun tp_is_empty!38695 () Bool)

(assert (=> start!134024 tp_is_empty!38695))

(assert (=> start!134024 true))

(declare-fun array_inv!39343 (array!104222) Bool)

(assert (=> start!134024 (array_inv!39343 _keys!637)))

(declare-fun array_inv!39344 (array!104224) Bool)

(assert (=> start!134024 (and (array_inv!39344 _values!487) e!872062)))

(declare-fun b!1564647 () Bool)

(declare-fun res!1068967 () Bool)

(assert (=> b!1564647 (=> (not res!1068967) (not e!872061))))

(declare-datatypes ((List!36506 0))(
  ( (Nil!36503) (Cons!36502 (h!37966 (_ BitVec 64)) (t!51317 List!36506)) )
))
(declare-fun arrayNoDuplicates!0 (array!104222 (_ BitVec 32) List!36506) Bool)

(assert (=> b!1564647 (= res!1068967 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36503))))

(declare-fun b!1564648 () Bool)

(assert (=> b!1564648 (= e!872058 tp_is_empty!38695)))

(declare-fun b!1564649 () Bool)

(declare-fun e!872060 () Bool)

(assert (=> b!1564649 (= e!872060 tp_is_empty!38695)))

(declare-fun mapNonEmpty!59418 () Bool)

(declare-fun tp!113210 () Bool)

(assert (=> mapNonEmpty!59418 (= mapRes!59418 (and tp!113210 e!872060))))

(declare-fun mapKey!59418 () (_ BitVec 32))

(declare-fun mapRest!59418 () (Array (_ BitVec 32) ValueCell!18317))

(declare-fun mapValue!59418 () ValueCell!18317)

(assert (=> mapNonEmpty!59418 (= (arr!50297 _values!487) (store mapRest!59418 mapKey!59418 mapValue!59418))))

(assert (= (and start!134024 res!1068968) b!1564644))

(assert (= (and b!1564644 res!1068963) b!1564642))

(assert (= (and b!1564642 res!1068966) b!1564647))

(assert (= (and b!1564647 res!1068967) b!1564646))

(assert (= (and b!1564646 res!1068964) b!1564645))

(assert (= (and b!1564645 res!1068965) b!1564641))

(assert (= (and b!1564643 condMapEmpty!59418) mapIsEmpty!59418))

(assert (= (and b!1564643 (not condMapEmpty!59418)) mapNonEmpty!59418))

(get-info :version)

(assert (= (and mapNonEmpty!59418 ((_ is ValueCellFull!18317) mapValue!59418)) b!1564649))

(assert (= (and b!1564643 ((_ is ValueCellFull!18317) mapDefault!59418)) b!1564648))

(assert (= start!134024 b!1564643))

(declare-fun b_lambda!24897 () Bool)

(assert (=> (not b_lambda!24897) (not b!1564641)))

(declare-fun t!51315 () Bool)

(declare-fun tb!12565 () Bool)

(assert (=> (and start!134024 (= defaultEntry!495 defaultEntry!495) t!51315) tb!12565))

(declare-fun result!26419 () Bool)

(assert (=> tb!12565 (= result!26419 tp_is_empty!38695)))

(assert (=> b!1564641 t!51315))

(declare-fun b_and!51573 () Bool)

(assert (= b_and!51571 (and (=> t!51315 result!26419) b_and!51573)))

(declare-fun m!1440195 () Bool)

(assert (=> mapNonEmpty!59418 m!1440195))

(declare-fun m!1440197 () Bool)

(assert (=> start!134024 m!1440197))

(declare-fun m!1440199 () Bool)

(assert (=> start!134024 m!1440199))

(declare-fun m!1440201 () Bool)

(assert (=> start!134024 m!1440201))

(declare-fun m!1440203 () Bool)

(assert (=> b!1564647 m!1440203))

(declare-fun m!1440205 () Bool)

(assert (=> b!1564642 m!1440205))

(declare-fun m!1440207 () Bool)

(assert (=> b!1564645 m!1440207))

(assert (=> b!1564645 m!1440207))

(declare-fun m!1440209 () Bool)

(assert (=> b!1564645 m!1440209))

(declare-fun m!1440211 () Bool)

(assert (=> b!1564641 m!1440211))

(declare-fun m!1440213 () Bool)

(assert (=> b!1564641 m!1440213))

(declare-fun m!1440215 () Bool)

(assert (=> b!1564641 m!1440215))

(assert (=> b!1564641 m!1440211))

(declare-fun m!1440217 () Bool)

(assert (=> b!1564641 m!1440217))

(assert (=> b!1564641 m!1440207))

(declare-fun m!1440219 () Bool)

(assert (=> b!1564641 m!1440219))

(assert (=> b!1564641 m!1440213))

(declare-fun m!1440221 () Bool)

(assert (=> b!1564641 m!1440221))

(assert (=> b!1564641 m!1440207))

(declare-fun m!1440223 () Bool)

(assert (=> b!1564641 m!1440223))

(declare-fun m!1440225 () Bool)

(assert (=> b!1564641 m!1440225))

(check-sat (not b!1564642) (not b_next!32029) tp_is_empty!38695 (not b_lambda!24897) b_and!51573 (not b!1564641) (not start!134024) (not mapNonEmpty!59418) (not b!1564645) (not b!1564647))
(check-sat b_and!51573 (not b_next!32029))
