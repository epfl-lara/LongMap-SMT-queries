; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43506 () Bool)

(assert start!43506)

(declare-fun b_free!12285 () Bool)

(declare-fun b_next!12285 () Bool)

(assert (=> start!43506 (= b_free!12285 (not b_next!12285))))

(declare-fun tp!43138 () Bool)

(declare-fun b_and!21045 () Bool)

(assert (=> start!43506 (= tp!43138 b_and!21045)))

(declare-fun b!482048 () Bool)

(declare-fun e!283642 () Bool)

(declare-fun tp_is_empty!13797 () Bool)

(assert (=> b!482048 (= e!283642 tp_is_empty!13797)))

(declare-fun mapNonEmpty!22405 () Bool)

(declare-fun mapRes!22405 () Bool)

(declare-fun tp!43137 () Bool)

(declare-fun e!283640 () Bool)

(assert (=> mapNonEmpty!22405 (= mapRes!22405 (and tp!43137 e!283640))))

(declare-datatypes ((V!19467 0))(
  ( (V!19468 (val!6946 Int)) )
))
(declare-datatypes ((ValueCell!6537 0))(
  ( (ValueCellFull!6537 (v!9239 V!19467)) (EmptyCell!6537) )
))
(declare-fun mapValue!22405 () ValueCell!6537)

(declare-fun mapRest!22405 () (Array (_ BitVec 32) ValueCell!6537))

(declare-fun mapKey!22405 () (_ BitVec 32))

(declare-datatypes ((array!31253 0))(
  ( (array!31254 (arr!15029 (Array (_ BitVec 32) ValueCell!6537)) (size!15387 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31253)

(assert (=> mapNonEmpty!22405 (= (arr!15029 _values!1516) (store mapRest!22405 mapKey!22405 mapValue!22405))))

(declare-fun b!482049 () Bool)

(assert (=> b!482049 (= e!283640 tp_is_empty!13797)))

(declare-fun b!482050 () Bool)

(declare-fun e!283641 () Bool)

(assert (=> b!482050 (= e!283641 (and e!283642 mapRes!22405))))

(declare-fun condMapEmpty!22405 () Bool)

(declare-fun mapDefault!22405 () ValueCell!6537)

(assert (=> b!482050 (= condMapEmpty!22405 (= (arr!15029 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6537)) mapDefault!22405)))))

(declare-fun b!482051 () Bool)

(declare-fun res!287362 () Bool)

(declare-fun e!283643 () Bool)

(assert (=> b!482051 (=> (not res!287362) (not e!283643))))

(declare-datatypes ((array!31255 0))(
  ( (array!31256 (arr!15030 (Array (_ BitVec 32) (_ BitVec 64))) (size!15388 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31255)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31255 (_ BitVec 32)) Bool)

(assert (=> b!482051 (= res!287362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!287364 () Bool)

(assert (=> start!43506 (=> (not res!287364) (not e!283643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43506 (= res!287364 (validMask!0 mask!2352))))

(assert (=> start!43506 e!283643))

(assert (=> start!43506 true))

(assert (=> start!43506 tp_is_empty!13797))

(declare-fun array_inv!10840 (array!31253) Bool)

(assert (=> start!43506 (and (array_inv!10840 _values!1516) e!283641)))

(assert (=> start!43506 tp!43138))

(declare-fun array_inv!10841 (array!31255) Bool)

(assert (=> start!43506 (array_inv!10841 _keys!1874)))

(declare-fun mapIsEmpty!22405 () Bool)

(assert (=> mapIsEmpty!22405 mapRes!22405))

(declare-fun b!482052 () Bool)

(assert (=> b!482052 (= e!283643 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218665 () Bool)

(declare-fun minValue!1458 () V!19467)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19467)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9114 0))(
  ( (tuple2!9115 (_1!4568 (_ BitVec 64)) (_2!4568 V!19467)) )
))
(declare-datatypes ((List!9194 0))(
  ( (Nil!9191) (Cons!9190 (h!10046 tuple2!9114) (t!15408 List!9194)) )
))
(declare-datatypes ((ListLongMap!8027 0))(
  ( (ListLongMap!8028 (toList!4029 List!9194)) )
))
(declare-fun contains!2643 (ListLongMap!8027 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2348 (array!31255 array!31253 (_ BitVec 32) (_ BitVec 32) V!19467 V!19467 (_ BitVec 32) Int) ListLongMap!8027)

(assert (=> b!482052 (= lt!218665 (contains!2643 (getCurrentListMap!2348 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482053 () Bool)

(declare-fun res!287365 () Bool)

(assert (=> b!482053 (=> (not res!287365) (not e!283643))))

(declare-datatypes ((List!9195 0))(
  ( (Nil!9192) (Cons!9191 (h!10047 (_ BitVec 64)) (t!15409 List!9195)) )
))
(declare-fun arrayNoDuplicates!0 (array!31255 (_ BitVec 32) List!9195) Bool)

(assert (=> b!482053 (= res!287365 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9192))))

(declare-fun b!482054 () Bool)

(declare-fun res!287363 () Bool)

(assert (=> b!482054 (=> (not res!287363) (not e!283643))))

(assert (=> b!482054 (= res!287363 (and (= (size!15387 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15388 _keys!1874) (size!15387 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43506 res!287364) b!482054))

(assert (= (and b!482054 res!287363) b!482051))

(assert (= (and b!482051 res!287362) b!482053))

(assert (= (and b!482053 res!287365) b!482052))

(assert (= (and b!482050 condMapEmpty!22405) mapIsEmpty!22405))

(assert (= (and b!482050 (not condMapEmpty!22405)) mapNonEmpty!22405))

(get-info :version)

(assert (= (and mapNonEmpty!22405 ((_ is ValueCellFull!6537) mapValue!22405)) b!482049))

(assert (= (and b!482050 ((_ is ValueCellFull!6537) mapDefault!22405)) b!482048))

(assert (= start!43506 b!482050))

(declare-fun m!463395 () Bool)

(assert (=> b!482052 m!463395))

(assert (=> b!482052 m!463395))

(declare-fun m!463397 () Bool)

(assert (=> b!482052 m!463397))

(declare-fun m!463399 () Bool)

(assert (=> b!482053 m!463399))

(declare-fun m!463401 () Bool)

(assert (=> mapNonEmpty!22405 m!463401))

(declare-fun m!463403 () Bool)

(assert (=> b!482051 m!463403))

(declare-fun m!463405 () Bool)

(assert (=> start!43506 m!463405))

(declare-fun m!463407 () Bool)

(assert (=> start!43506 m!463407))

(declare-fun m!463409 () Bool)

(assert (=> start!43506 m!463409))

(check-sat tp_is_empty!13797 (not mapNonEmpty!22405) (not b!482053) b_and!21045 (not b!482052) (not b_next!12285) (not start!43506) (not b!482051))
(check-sat b_and!21045 (not b_next!12285))
