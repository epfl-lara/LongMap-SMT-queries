; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43508 () Bool)

(assert start!43508)

(declare-fun b_free!12301 () Bool)

(declare-fun b_next!12301 () Bool)

(assert (=> start!43508 (= b_free!12301 (not b_next!12301))))

(declare-fun tp!43186 () Bool)

(declare-fun b_and!21035 () Bool)

(assert (=> start!43508 (= tp!43186 b_and!21035)))

(declare-fun mapIsEmpty!22429 () Bool)

(declare-fun mapRes!22429 () Bool)

(assert (=> mapIsEmpty!22429 mapRes!22429))

(declare-fun b!481945 () Bool)

(declare-fun res!287331 () Bool)

(declare-fun e!283590 () Bool)

(assert (=> b!481945 (=> (not res!287331) (not e!283590))))

(declare-datatypes ((array!31279 0))(
  ( (array!31280 (arr!15042 (Array (_ BitVec 32) (_ BitVec 64))) (size!15401 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31279)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31279 (_ BitVec 32)) Bool)

(assert (=> b!481945 (= res!287331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!287332 () Bool)

(assert (=> start!43508 (=> (not res!287332) (not e!283590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43508 (= res!287332 (validMask!0 mask!2352))))

(assert (=> start!43508 e!283590))

(assert (=> start!43508 true))

(declare-fun tp_is_empty!13813 () Bool)

(assert (=> start!43508 tp_is_empty!13813))

(declare-datatypes ((V!19489 0))(
  ( (V!19490 (val!6954 Int)) )
))
(declare-datatypes ((ValueCell!6545 0))(
  ( (ValueCellFull!6545 (v!9241 V!19489)) (EmptyCell!6545) )
))
(declare-datatypes ((array!31281 0))(
  ( (array!31282 (arr!15043 (Array (_ BitVec 32) ValueCell!6545)) (size!15402 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31281)

(declare-fun e!283589 () Bool)

(declare-fun array_inv!10940 (array!31281) Bool)

(assert (=> start!43508 (and (array_inv!10940 _values!1516) e!283589)))

(assert (=> start!43508 tp!43186))

(declare-fun array_inv!10941 (array!31279) Bool)

(assert (=> start!43508 (array_inv!10941 _keys!1874)))

(declare-fun b!481946 () Bool)

(declare-fun e!283586 () Bool)

(assert (=> b!481946 (= e!283586 tp_is_empty!13813)))

(declare-fun b!481947 () Bool)

(declare-fun res!287330 () Bool)

(assert (=> b!481947 (=> (not res!287330) (not e!283590))))

(declare-datatypes ((List!9242 0))(
  ( (Nil!9239) (Cons!9238 (h!10094 (_ BitVec 64)) (t!15447 List!9242)) )
))
(declare-fun arrayNoDuplicates!0 (array!31279 (_ BitVec 32) List!9242) Bool)

(assert (=> b!481947 (= res!287330 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9239))))

(declare-fun b!481948 () Bool)

(assert (=> b!481948 (= e!283590 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19489)

(declare-fun zeroValue!1458 () V!19489)

(declare-fun defaultEntry!1519 () Int)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun lt!218455 () Bool)

(declare-datatypes ((tuple2!9178 0))(
  ( (tuple2!9179 (_1!4600 (_ BitVec 64)) (_2!4600 V!19489)) )
))
(declare-datatypes ((List!9243 0))(
  ( (Nil!9240) (Cons!9239 (h!10095 tuple2!9178) (t!15448 List!9243)) )
))
(declare-datatypes ((ListLongMap!8081 0))(
  ( (ListLongMap!8082 (toList!4056 List!9243)) )
))
(declare-fun contains!2635 (ListLongMap!8081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2309 (array!31279 array!31281 (_ BitVec 32) (_ BitVec 32) V!19489 V!19489 (_ BitVec 32) Int) ListLongMap!8081)

(assert (=> b!481948 (= lt!218455 (contains!2635 (getCurrentListMap!2309 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapNonEmpty!22429 () Bool)

(declare-fun tp!43185 () Bool)

(declare-fun e!283588 () Bool)

(assert (=> mapNonEmpty!22429 (= mapRes!22429 (and tp!43185 e!283588))))

(declare-fun mapValue!22429 () ValueCell!6545)

(declare-fun mapKey!22429 () (_ BitVec 32))

(declare-fun mapRest!22429 () (Array (_ BitVec 32) ValueCell!6545))

(assert (=> mapNonEmpty!22429 (= (arr!15043 _values!1516) (store mapRest!22429 mapKey!22429 mapValue!22429))))

(declare-fun b!481949 () Bool)

(assert (=> b!481949 (= e!283589 (and e!283586 mapRes!22429))))

(declare-fun condMapEmpty!22429 () Bool)

(declare-fun mapDefault!22429 () ValueCell!6545)

(assert (=> b!481949 (= condMapEmpty!22429 (= (arr!15043 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6545)) mapDefault!22429)))))

(declare-fun b!481950 () Bool)

(assert (=> b!481950 (= e!283588 tp_is_empty!13813)))

(declare-fun b!481951 () Bool)

(declare-fun res!287329 () Bool)

(assert (=> b!481951 (=> (not res!287329) (not e!283590))))

(assert (=> b!481951 (= res!287329 (and (= (size!15402 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15401 _keys!1874) (size!15402 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43508 res!287332) b!481951))

(assert (= (and b!481951 res!287329) b!481945))

(assert (= (and b!481945 res!287331) b!481947))

(assert (= (and b!481947 res!287330) b!481948))

(assert (= (and b!481949 condMapEmpty!22429) mapIsEmpty!22429))

(assert (= (and b!481949 (not condMapEmpty!22429)) mapNonEmpty!22429))

(get-info :version)

(assert (= (and mapNonEmpty!22429 ((_ is ValueCellFull!6545) mapValue!22429)) b!481950))

(assert (= (and b!481949 ((_ is ValueCellFull!6545) mapDefault!22429)) b!481946))

(assert (= start!43508 b!481949))

(declare-fun m!462789 () Bool)

(assert (=> start!43508 m!462789))

(declare-fun m!462791 () Bool)

(assert (=> start!43508 m!462791))

(declare-fun m!462793 () Bool)

(assert (=> start!43508 m!462793))

(declare-fun m!462795 () Bool)

(assert (=> mapNonEmpty!22429 m!462795))

(declare-fun m!462797 () Bool)

(assert (=> b!481945 m!462797))

(declare-fun m!462799 () Bool)

(assert (=> b!481947 m!462799))

(declare-fun m!462801 () Bool)

(assert (=> b!481948 m!462801))

(assert (=> b!481948 m!462801))

(declare-fun m!462803 () Bool)

(assert (=> b!481948 m!462803))

(check-sat (not b!481948) b_and!21035 (not start!43508) (not mapNonEmpty!22429) (not b!481945) tp_is_empty!13813 (not b!481947) (not b_next!12301))
(check-sat b_and!21035 (not b_next!12301))
