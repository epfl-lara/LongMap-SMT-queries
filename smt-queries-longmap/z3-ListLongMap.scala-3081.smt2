; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43364 () Bool)

(assert start!43364)

(declare-fun b_free!12205 () Bool)

(declare-fun b_next!12205 () Bool)

(assert (=> start!43364 (= b_free!12205 (not b_next!12205))))

(declare-fun tp!42891 () Bool)

(declare-fun b_and!20935 () Bool)

(assert (=> start!43364 (= tp!42891 b_and!20935)))

(declare-fun b!480323 () Bool)

(declare-fun e!282604 () Bool)

(assert (=> b!480323 (= e!282604 (not true))))

(declare-fun lt!217944 () (_ BitVec 32))

(declare-datatypes ((array!31095 0))(
  ( (array!31096 (arr!14952 (Array (_ BitVec 32) (_ BitVec 64))) (size!15311 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31095)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31095 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480323 (= lt!217944 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!282605 () Bool)

(assert (=> b!480323 e!282605))

(declare-fun c!57722 () Bool)

(assert (=> b!480323 (= c!57722 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19361 0))(
  ( (V!19362 (val!6906 Int)) )
))
(declare-fun minValue!1458 () V!19361)

(declare-datatypes ((Unit!14076 0))(
  ( (Unit!14077) )
))
(declare-fun lt!217945 () Unit!14076)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19361)

(declare-datatypes ((ValueCell!6497 0))(
  ( (ValueCellFull!6497 (v!9191 V!19361)) (EmptyCell!6497) )
))
(declare-datatypes ((array!31097 0))(
  ( (array!31098 (arr!14953 (Array (_ BitVec 32) ValueCell!6497)) (size!15312 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31097)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!127 (array!31095 array!31097 (_ BitVec 32) (_ BitVec 32) V!19361 V!19361 (_ BitVec 64) Int) Unit!14076)

(assert (=> b!480323 (= lt!217945 (lemmaKeyInListMapIsInArray!127 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480324 () Bool)

(assert (=> b!480324 (= e!282605 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22279 () Bool)

(declare-fun mapRes!22279 () Bool)

(declare-fun tp!42892 () Bool)

(declare-fun e!282606 () Bool)

(assert (=> mapNonEmpty!22279 (= mapRes!22279 (and tp!42892 e!282606))))

(declare-fun mapRest!22279 () (Array (_ BitVec 32) ValueCell!6497))

(declare-fun mapKey!22279 () (_ BitVec 32))

(declare-fun mapValue!22279 () ValueCell!6497)

(assert (=> mapNonEmpty!22279 (= (arr!14953 _values!1516) (store mapRest!22279 mapKey!22279 mapValue!22279))))

(declare-fun b!480325 () Bool)

(declare-fun res!286472 () Bool)

(assert (=> b!480325 (=> (not res!286472) (not e!282604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480325 (= res!286472 (validKeyInArray!0 k0!1332))))

(declare-fun res!286473 () Bool)

(assert (=> start!43364 (=> (not res!286473) (not e!282604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43364 (= res!286473 (validMask!0 mask!2352))))

(assert (=> start!43364 e!282604))

(assert (=> start!43364 true))

(declare-fun tp_is_empty!13717 () Bool)

(assert (=> start!43364 tp_is_empty!13717))

(declare-fun e!282609 () Bool)

(declare-fun array_inv!10876 (array!31097) Bool)

(assert (=> start!43364 (and (array_inv!10876 _values!1516) e!282609)))

(assert (=> start!43364 tp!42891))

(declare-fun array_inv!10877 (array!31095) Bool)

(assert (=> start!43364 (array_inv!10877 _keys!1874)))

(declare-fun b!480326 () Bool)

(declare-fun res!286474 () Bool)

(assert (=> b!480326 (=> (not res!286474) (not e!282604))))

(declare-datatypes ((tuple2!9110 0))(
  ( (tuple2!9111 (_1!4566 (_ BitVec 64)) (_2!4566 V!19361)) )
))
(declare-datatypes ((List!9174 0))(
  ( (Nil!9171) (Cons!9170 (h!10026 tuple2!9110) (t!15375 List!9174)) )
))
(declare-datatypes ((ListLongMap!8013 0))(
  ( (ListLongMap!8014 (toList!4022 List!9174)) )
))
(declare-fun contains!2599 (ListLongMap!8013 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2275 (array!31095 array!31097 (_ BitVec 32) (_ BitVec 32) V!19361 V!19361 (_ BitVec 32) Int) ListLongMap!8013)

(assert (=> b!480326 (= res!286474 (contains!2599 (getCurrentListMap!2275 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480327 () Bool)

(declare-fun res!286475 () Bool)

(assert (=> b!480327 (=> (not res!286475) (not e!282604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31095 (_ BitVec 32)) Bool)

(assert (=> b!480327 (= res!286475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480328 () Bool)

(assert (=> b!480328 (= e!282606 tp_is_empty!13717)))

(declare-fun b!480329 () Bool)

(declare-fun e!282608 () Bool)

(assert (=> b!480329 (= e!282608 tp_is_empty!13717)))

(declare-fun b!480330 () Bool)

(declare-fun arrayContainsKey!0 (array!31095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480330 (= e!282605 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480331 () Bool)

(assert (=> b!480331 (= e!282609 (and e!282608 mapRes!22279))))

(declare-fun condMapEmpty!22279 () Bool)

(declare-fun mapDefault!22279 () ValueCell!6497)

(assert (=> b!480331 (= condMapEmpty!22279 (= (arr!14953 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6497)) mapDefault!22279)))))

(declare-fun mapIsEmpty!22279 () Bool)

(assert (=> mapIsEmpty!22279 mapRes!22279))

(declare-fun b!480332 () Bool)

(declare-fun res!286476 () Bool)

(assert (=> b!480332 (=> (not res!286476) (not e!282604))))

(declare-datatypes ((List!9175 0))(
  ( (Nil!9172) (Cons!9171 (h!10027 (_ BitVec 64)) (t!15376 List!9175)) )
))
(declare-fun arrayNoDuplicates!0 (array!31095 (_ BitVec 32) List!9175) Bool)

(assert (=> b!480332 (= res!286476 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9172))))

(declare-fun b!480333 () Bool)

(declare-fun res!286471 () Bool)

(assert (=> b!480333 (=> (not res!286471) (not e!282604))))

(assert (=> b!480333 (= res!286471 (and (= (size!15312 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15311 _keys!1874) (size!15312 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43364 res!286473) b!480333))

(assert (= (and b!480333 res!286471) b!480327))

(assert (= (and b!480327 res!286475) b!480332))

(assert (= (and b!480332 res!286476) b!480326))

(assert (= (and b!480326 res!286474) b!480325))

(assert (= (and b!480325 res!286472) b!480323))

(assert (= (and b!480323 c!57722) b!480330))

(assert (= (and b!480323 (not c!57722)) b!480324))

(assert (= (and b!480331 condMapEmpty!22279) mapIsEmpty!22279))

(assert (= (and b!480331 (not condMapEmpty!22279)) mapNonEmpty!22279))

(get-info :version)

(assert (= (and mapNonEmpty!22279 ((_ is ValueCellFull!6497) mapValue!22279)) b!480328))

(assert (= (and b!480331 ((_ is ValueCellFull!6497) mapDefault!22279)) b!480329))

(assert (= start!43364 b!480331))

(declare-fun m!461469 () Bool)

(assert (=> start!43364 m!461469))

(declare-fun m!461471 () Bool)

(assert (=> start!43364 m!461471))

(declare-fun m!461473 () Bool)

(assert (=> start!43364 m!461473))

(declare-fun m!461475 () Bool)

(assert (=> b!480332 m!461475))

(declare-fun m!461477 () Bool)

(assert (=> b!480323 m!461477))

(declare-fun m!461479 () Bool)

(assert (=> b!480323 m!461479))

(declare-fun m!461481 () Bool)

(assert (=> b!480330 m!461481))

(declare-fun m!461483 () Bool)

(assert (=> b!480327 m!461483))

(declare-fun m!461485 () Bool)

(assert (=> b!480325 m!461485))

(declare-fun m!461487 () Bool)

(assert (=> mapNonEmpty!22279 m!461487))

(declare-fun m!461489 () Bool)

(assert (=> b!480326 m!461489))

(assert (=> b!480326 m!461489))

(declare-fun m!461491 () Bool)

(assert (=> b!480326 m!461491))

(check-sat (not b_next!12205) (not b!480330) (not b!480332) (not b!480327) (not b!480326) (not mapNonEmpty!22279) (not b!480325) tp_is_empty!13717 b_and!20935 (not b!480323) (not start!43364))
(check-sat b_and!20935 (not b_next!12205))
