; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113018 () Bool)

(assert start!113018)

(declare-fun b_free!31069 () Bool)

(declare-fun b_next!31069 () Bool)

(assert (=> start!113018 (= b_free!31069 (not b_next!31069))))

(declare-fun tp!109012 () Bool)

(declare-fun b_and!50081 () Bool)

(assert (=> start!113018 (= tp!109012 b_and!50081)))

(declare-fun b!1339478 () Bool)

(declare-fun e!762965 () Bool)

(assert (=> b!1339478 (= e!762965 false)))

(declare-datatypes ((V!54529 0))(
  ( (V!54530 (val!18609 Int)) )
))
(declare-fun minValue!1245 () V!54529)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90941 0))(
  ( (array!90942 (arr!43927 (Array (_ BitVec 32) (_ BitVec 64))) (size!44479 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90941)

(declare-fun zeroValue!1245 () V!54529)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17636 0))(
  ( (ValueCellFull!17636 (v!21256 V!54529)) (EmptyCell!17636) )
))
(declare-datatypes ((array!90943 0))(
  ( (array!90944 (arr!43928 (Array (_ BitVec 32) ValueCell!17636)) (size!44480 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90943)

(declare-fun lt!593712 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24008 0))(
  ( (tuple2!24009 (_1!12015 (_ BitVec 64)) (_2!12015 V!54529)) )
))
(declare-datatypes ((List!31158 0))(
  ( (Nil!31155) (Cons!31154 (h!32363 tuple2!24008) (t!45482 List!31158)) )
))
(declare-datatypes ((ListLongMap!21665 0))(
  ( (ListLongMap!21666 (toList!10848 List!31158)) )
))
(declare-fun contains!8953 (ListLongMap!21665 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5701 (array!90941 array!90943 (_ BitVec 32) (_ BitVec 32) V!54529 V!54529 (_ BitVec 32) Int) ListLongMap!21665)

(assert (=> b!1339478 (= lt!593712 (contains!8953 (getCurrentListMap!5701 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339479 () Bool)

(declare-fun res!888588 () Bool)

(assert (=> b!1339479 (=> (not res!888588) (not e!762965))))

(declare-datatypes ((List!31159 0))(
  ( (Nil!31156) (Cons!31155 (h!32364 (_ BitVec 64)) (t!45483 List!31159)) )
))
(declare-fun arrayNoDuplicates!0 (array!90941 (_ BitVec 32) List!31159) Bool)

(assert (=> b!1339479 (= res!888588 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31156))))

(declare-fun b!1339480 () Bool)

(declare-fun res!888589 () Bool)

(assert (=> b!1339480 (=> (not res!888589) (not e!762965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90941 (_ BitVec 32)) Bool)

(assert (=> b!1339480 (= res!888589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339481 () Bool)

(declare-fun e!762961 () Bool)

(declare-fun tp_is_empty!37069 () Bool)

(assert (=> b!1339481 (= e!762961 tp_is_empty!37069)))

(declare-fun b!1339482 () Bool)

(declare-fun res!888590 () Bool)

(assert (=> b!1339482 (=> (not res!888590) (not e!762965))))

(assert (=> b!1339482 (= res!888590 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44479 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339483 () Bool)

(declare-fun e!762963 () Bool)

(declare-fun mapRes!57310 () Bool)

(assert (=> b!1339483 (= e!762963 (and e!762961 mapRes!57310))))

(declare-fun condMapEmpty!57310 () Bool)

(declare-fun mapDefault!57310 () ValueCell!17636)

(assert (=> b!1339483 (= condMapEmpty!57310 (= (arr!43928 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17636)) mapDefault!57310)))))

(declare-fun mapNonEmpty!57310 () Bool)

(declare-fun tp!109013 () Bool)

(declare-fun e!762964 () Bool)

(assert (=> mapNonEmpty!57310 (= mapRes!57310 (and tp!109013 e!762964))))

(declare-fun mapValue!57310 () ValueCell!17636)

(declare-fun mapRest!57310 () (Array (_ BitVec 32) ValueCell!17636))

(declare-fun mapKey!57310 () (_ BitVec 32))

(assert (=> mapNonEmpty!57310 (= (arr!43928 _values!1303) (store mapRest!57310 mapKey!57310 mapValue!57310))))

(declare-fun b!1339484 () Bool)

(assert (=> b!1339484 (= e!762964 tp_is_empty!37069)))

(declare-fun res!888591 () Bool)

(assert (=> start!113018 (=> (not res!888591) (not e!762965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113018 (= res!888591 (validMask!0 mask!1977))))

(assert (=> start!113018 e!762965))

(assert (=> start!113018 tp_is_empty!37069))

(assert (=> start!113018 true))

(declare-fun array_inv!33313 (array!90941) Bool)

(assert (=> start!113018 (array_inv!33313 _keys!1571)))

(declare-fun array_inv!33314 (array!90943) Bool)

(assert (=> start!113018 (and (array_inv!33314 _values!1303) e!762963)))

(assert (=> start!113018 tp!109012))

(declare-fun b!1339485 () Bool)

(declare-fun res!888592 () Bool)

(assert (=> b!1339485 (=> (not res!888592) (not e!762965))))

(assert (=> b!1339485 (= res!888592 (and (= (size!44480 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44479 _keys!1571) (size!44480 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57310 () Bool)

(assert (=> mapIsEmpty!57310 mapRes!57310))

(assert (= (and start!113018 res!888591) b!1339485))

(assert (= (and b!1339485 res!888592) b!1339480))

(assert (= (and b!1339480 res!888589) b!1339479))

(assert (= (and b!1339479 res!888588) b!1339482))

(assert (= (and b!1339482 res!888590) b!1339478))

(assert (= (and b!1339483 condMapEmpty!57310) mapIsEmpty!57310))

(assert (= (and b!1339483 (not condMapEmpty!57310)) mapNonEmpty!57310))

(get-info :version)

(assert (= (and mapNonEmpty!57310 ((_ is ValueCellFull!17636) mapValue!57310)) b!1339484))

(assert (= (and b!1339483 ((_ is ValueCellFull!17636) mapDefault!57310)) b!1339481))

(assert (= start!113018 b!1339483))

(declare-fun m!1227049 () Bool)

(assert (=> mapNonEmpty!57310 m!1227049))

(declare-fun m!1227051 () Bool)

(assert (=> start!113018 m!1227051))

(declare-fun m!1227053 () Bool)

(assert (=> start!113018 m!1227053))

(declare-fun m!1227055 () Bool)

(assert (=> start!113018 m!1227055))

(declare-fun m!1227057 () Bool)

(assert (=> b!1339478 m!1227057))

(assert (=> b!1339478 m!1227057))

(declare-fun m!1227059 () Bool)

(assert (=> b!1339478 m!1227059))

(declare-fun m!1227061 () Bool)

(assert (=> b!1339480 m!1227061))

(declare-fun m!1227063 () Bool)

(assert (=> b!1339479 m!1227063))

(check-sat tp_is_empty!37069 (not start!113018) (not b!1339479) (not b_next!31069) (not b!1339478) b_and!50081 (not b!1339480) (not mapNonEmpty!57310))
(check-sat b_and!50081 (not b_next!31069))
