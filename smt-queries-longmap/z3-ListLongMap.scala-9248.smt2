; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111060 () Bool)

(assert start!111060)

(declare-fun b_free!29671 () Bool)

(declare-fun b_next!29671 () Bool)

(assert (=> start!111060 (= b_free!29671 (not b_next!29671))))

(declare-fun tp!104335 () Bool)

(declare-fun b_and!47881 () Bool)

(assert (=> start!111060 (= tp!104335 b_and!47881)))

(declare-fun res!871541 () Bool)

(declare-fun e!749238 () Bool)

(assert (=> start!111060 (=> (not res!871541) (not e!749238))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111060 (= res!871541 (validMask!0 mask!2040))))

(assert (=> start!111060 e!749238))

(assert (=> start!111060 tp!104335))

(declare-datatypes ((array!87839 0))(
  ( (array!87840 (arr!42395 (Array (_ BitVec 32) (_ BitVec 64))) (size!42946 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87839)

(declare-fun array_inv!32291 (array!87839) Bool)

(assert (=> start!111060 (array_inv!32291 _keys!1628)))

(assert (=> start!111060 true))

(declare-fun tp_is_empty!35401 () Bool)

(assert (=> start!111060 tp_is_empty!35401))

(declare-datatypes ((V!52305 0))(
  ( (V!52306 (val!17775 Int)) )
))
(declare-datatypes ((ValueCell!16802 0))(
  ( (ValueCellFull!16802 (v!20397 V!52305)) (EmptyCell!16802) )
))
(declare-datatypes ((array!87841 0))(
  ( (array!87842 (arr!42396 (Array (_ BitVec 32) ValueCell!16802)) (size!42947 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87841)

(declare-fun e!749240 () Bool)

(declare-fun array_inv!32292 (array!87841) Bool)

(assert (=> start!111060 (and (array_inv!32292 _values!1354) e!749240)))

(declare-fun b!1313290 () Bool)

(declare-fun res!871533 () Bool)

(assert (=> b!1313290 (=> (not res!871533) (not e!749238))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52305)

(declare-fun zeroValue!1296 () V!52305)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22942 0))(
  ( (tuple2!22943 (_1!11482 (_ BitVec 64)) (_2!11482 V!52305)) )
))
(declare-datatypes ((List!30094 0))(
  ( (Nil!30091) (Cons!30090 (h!31308 tuple2!22942) (t!43692 List!30094)) )
))
(declare-datatypes ((ListLongMap!20607 0))(
  ( (ListLongMap!20608 (toList!10319 List!30094)) )
))
(declare-fun contains!8481 (ListLongMap!20607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5323 (array!87839 array!87841 (_ BitVec 32) (_ BitVec 32) V!52305 V!52305 (_ BitVec 32) Int) ListLongMap!20607)

(assert (=> b!1313290 (= res!871533 (contains!8481 (getCurrentListMap!5323 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313291 () Bool)

(assert (=> b!1313291 (= e!749238 (not true))))

(assert (=> b!1313291 (contains!8481 (getCurrentListMap!5323 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43333 0))(
  ( (Unit!43334) )
))
(declare-fun lt!586001 () Unit!43333)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!7 (array!87839 array!87841 (_ BitVec 32) (_ BitVec 32) V!52305 V!52305 (_ BitVec 64) (_ BitVec 32) Int) Unit!43333)

(assert (=> b!1313291 (= lt!586001 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!7 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54730 () Bool)

(declare-fun mapRes!54730 () Bool)

(assert (=> mapIsEmpty!54730 mapRes!54730))

(declare-fun mapNonEmpty!54730 () Bool)

(declare-fun tp!104334 () Bool)

(declare-fun e!749239 () Bool)

(assert (=> mapNonEmpty!54730 (= mapRes!54730 (and tp!104334 e!749239))))

(declare-fun mapRest!54730 () (Array (_ BitVec 32) ValueCell!16802))

(declare-fun mapKey!54730 () (_ BitVec 32))

(declare-fun mapValue!54730 () ValueCell!16802)

(assert (=> mapNonEmpty!54730 (= (arr!42396 _values!1354) (store mapRest!54730 mapKey!54730 mapValue!54730))))

(declare-fun b!1313292 () Bool)

(declare-fun res!871535 () Bool)

(assert (=> b!1313292 (=> (not res!871535) (not e!749238))))

(assert (=> b!1313292 (= res!871535 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42946 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313293 () Bool)

(declare-fun res!871534 () Bool)

(assert (=> b!1313293 (=> (not res!871534) (not e!749238))))

(assert (=> b!1313293 (= res!871534 (and (= (size!42947 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42946 _keys!1628) (size!42947 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313294 () Bool)

(declare-fun res!871536 () Bool)

(assert (=> b!1313294 (=> (not res!871536) (not e!749238))))

(assert (=> b!1313294 (= res!871536 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1313295 () Bool)

(declare-fun res!871538 () Bool)

(assert (=> b!1313295 (=> (not res!871538) (not e!749238))))

(declare-datatypes ((List!30095 0))(
  ( (Nil!30092) (Cons!30091 (h!31309 (_ BitVec 64)) (t!43693 List!30095)) )
))
(declare-fun arrayNoDuplicates!0 (array!87839 (_ BitVec 32) List!30095) Bool)

(assert (=> b!1313295 (= res!871538 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30092))))

(declare-fun b!1313296 () Bool)

(declare-fun e!749236 () Bool)

(assert (=> b!1313296 (= e!749240 (and e!749236 mapRes!54730))))

(declare-fun condMapEmpty!54730 () Bool)

(declare-fun mapDefault!54730 () ValueCell!16802)

(assert (=> b!1313296 (= condMapEmpty!54730 (= (arr!42396 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16802)) mapDefault!54730)))))

(declare-fun b!1313297 () Bool)

(assert (=> b!1313297 (= e!749239 tp_is_empty!35401)))

(declare-fun b!1313298 () Bool)

(declare-fun res!871540 () Bool)

(assert (=> b!1313298 (=> (not res!871540) (not e!749238))))

(assert (=> b!1313298 (= res!871540 (not (= (select (arr!42395 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1313299 () Bool)

(assert (=> b!1313299 (= e!749236 tp_is_empty!35401)))

(declare-fun b!1313300 () Bool)

(declare-fun res!871537 () Bool)

(assert (=> b!1313300 (=> (not res!871537) (not e!749238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313300 (= res!871537 (validKeyInArray!0 (select (arr!42395 _keys!1628) from!2020)))))

(declare-fun b!1313301 () Bool)

(declare-fun res!871539 () Bool)

(assert (=> b!1313301 (=> (not res!871539) (not e!749238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87839 (_ BitVec 32)) Bool)

(assert (=> b!1313301 (= res!871539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!111060 res!871541) b!1313293))

(assert (= (and b!1313293 res!871534) b!1313301))

(assert (= (and b!1313301 res!871539) b!1313295))

(assert (= (and b!1313295 res!871538) b!1313292))

(assert (= (and b!1313292 res!871535) b!1313290))

(assert (= (and b!1313290 res!871533) b!1313298))

(assert (= (and b!1313298 res!871540) b!1313300))

(assert (= (and b!1313300 res!871537) b!1313294))

(assert (= (and b!1313294 res!871536) b!1313291))

(assert (= (and b!1313296 condMapEmpty!54730) mapIsEmpty!54730))

(assert (= (and b!1313296 (not condMapEmpty!54730)) mapNonEmpty!54730))

(get-info :version)

(assert (= (and mapNonEmpty!54730 ((_ is ValueCellFull!16802) mapValue!54730)) b!1313297))

(assert (= (and b!1313296 ((_ is ValueCellFull!16802) mapDefault!54730)) b!1313299))

(assert (= start!111060 b!1313296))

(declare-fun m!1202891 () Bool)

(assert (=> b!1313295 m!1202891))

(declare-fun m!1202893 () Bool)

(assert (=> b!1313301 m!1202893))

(declare-fun m!1202895 () Bool)

(assert (=> b!1313291 m!1202895))

(assert (=> b!1313291 m!1202895))

(declare-fun m!1202897 () Bool)

(assert (=> b!1313291 m!1202897))

(declare-fun m!1202899 () Bool)

(assert (=> b!1313291 m!1202899))

(declare-fun m!1202901 () Bool)

(assert (=> start!111060 m!1202901))

(declare-fun m!1202903 () Bool)

(assert (=> start!111060 m!1202903))

(declare-fun m!1202905 () Bool)

(assert (=> start!111060 m!1202905))

(declare-fun m!1202907 () Bool)

(assert (=> b!1313298 m!1202907))

(declare-fun m!1202909 () Bool)

(assert (=> mapNonEmpty!54730 m!1202909))

(assert (=> b!1313300 m!1202907))

(assert (=> b!1313300 m!1202907))

(declare-fun m!1202911 () Bool)

(assert (=> b!1313300 m!1202911))

(declare-fun m!1202913 () Bool)

(assert (=> b!1313290 m!1202913))

(assert (=> b!1313290 m!1202913))

(declare-fun m!1202915 () Bool)

(assert (=> b!1313290 m!1202915))

(check-sat (not mapNonEmpty!54730) (not b!1313290) (not b_next!29671) (not b!1313291) tp_is_empty!35401 (not b!1313300) (not b!1313295) b_and!47881 (not b!1313301) (not start!111060))
(check-sat b_and!47881 (not b_next!29671))
