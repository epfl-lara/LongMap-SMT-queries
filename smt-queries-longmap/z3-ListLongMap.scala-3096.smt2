; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43518 () Bool)

(assert start!43518)

(declare-fun b_free!12297 () Bool)

(declare-fun b_next!12297 () Bool)

(assert (=> start!43518 (= b_free!12297 (not b_next!12297))))

(declare-fun tp!43173 () Bool)

(declare-fun b_and!21057 () Bool)

(assert (=> start!43518 (= tp!43173 b_and!21057)))

(declare-fun b!482174 () Bool)

(declare-fun res!287437 () Bool)

(declare-fun e!283731 () Bool)

(assert (=> b!482174 (=> (not res!287437) (not e!283731))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31277 0))(
  ( (array!31278 (arr!15041 (Array (_ BitVec 32) (_ BitVec 64))) (size!15399 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31277)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19483 0))(
  ( (V!19484 (val!6952 Int)) )
))
(declare-datatypes ((ValueCell!6543 0))(
  ( (ValueCellFull!6543 (v!9245 V!19483)) (EmptyCell!6543) )
))
(declare-datatypes ((array!31279 0))(
  ( (array!31280 (arr!15042 (Array (_ BitVec 32) ValueCell!6543)) (size!15400 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31279)

(assert (=> b!482174 (= res!287437 (and (= (size!15400 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15399 _keys!1874) (size!15400 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482175 () Bool)

(declare-fun res!287435 () Bool)

(assert (=> b!482175 (=> (not res!287435) (not e!283731))))

(declare-datatypes ((List!9203 0))(
  ( (Nil!9200) (Cons!9199 (h!10055 (_ BitVec 64)) (t!15417 List!9203)) )
))
(declare-fun arrayNoDuplicates!0 (array!31277 (_ BitVec 32) List!9203) Bool)

(assert (=> b!482175 (= res!287435 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9200))))

(declare-fun b!482176 () Bool)

(declare-fun e!283732 () Bool)

(declare-fun tp_is_empty!13809 () Bool)

(assert (=> b!482176 (= e!283732 tp_is_empty!13809)))

(declare-fun b!482177 () Bool)

(declare-fun e!283734 () Bool)

(declare-fun mapRes!22423 () Bool)

(assert (=> b!482177 (= e!283734 (and e!283732 mapRes!22423))))

(declare-fun condMapEmpty!22423 () Bool)

(declare-fun mapDefault!22423 () ValueCell!6543)

(assert (=> b!482177 (= condMapEmpty!22423 (= (arr!15042 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6543)) mapDefault!22423)))))

(declare-fun mapNonEmpty!22423 () Bool)

(declare-fun tp!43174 () Bool)

(declare-fun e!283730 () Bool)

(assert (=> mapNonEmpty!22423 (= mapRes!22423 (and tp!43174 e!283730))))

(declare-fun mapValue!22423 () ValueCell!6543)

(declare-fun mapRest!22423 () (Array (_ BitVec 32) ValueCell!6543))

(declare-fun mapKey!22423 () (_ BitVec 32))

(assert (=> mapNonEmpty!22423 (= (arr!15042 _values!1516) (store mapRest!22423 mapKey!22423 mapValue!22423))))

(declare-fun b!482178 () Bool)

(assert (=> b!482178 (= e!283730 tp_is_empty!13809)))

(declare-fun b!482179 () Bool)

(assert (=> b!482179 (= e!283731 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218683 () Bool)

(declare-fun minValue!1458 () V!19483)

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19483)

(declare-datatypes ((tuple2!9124 0))(
  ( (tuple2!9125 (_1!4573 (_ BitVec 64)) (_2!4573 V!19483)) )
))
(declare-datatypes ((List!9204 0))(
  ( (Nil!9201) (Cons!9200 (h!10056 tuple2!9124) (t!15418 List!9204)) )
))
(declare-datatypes ((ListLongMap!8037 0))(
  ( (ListLongMap!8038 (toList!4034 List!9204)) )
))
(declare-fun contains!2648 (ListLongMap!8037 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2353 (array!31277 array!31279 (_ BitVec 32) (_ BitVec 32) V!19483 V!19483 (_ BitVec 32) Int) ListLongMap!8037)

(assert (=> b!482179 (= lt!218683 (contains!2648 (getCurrentListMap!2353 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482180 () Bool)

(declare-fun res!287436 () Bool)

(assert (=> b!482180 (=> (not res!287436) (not e!283731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31277 (_ BitVec 32)) Bool)

(assert (=> b!482180 (= res!287436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22423 () Bool)

(assert (=> mapIsEmpty!22423 mapRes!22423))

(declare-fun res!287434 () Bool)

(assert (=> start!43518 (=> (not res!287434) (not e!283731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43518 (= res!287434 (validMask!0 mask!2352))))

(assert (=> start!43518 e!283731))

(assert (=> start!43518 true))

(assert (=> start!43518 tp_is_empty!13809))

(declare-fun array_inv!10850 (array!31279) Bool)

(assert (=> start!43518 (and (array_inv!10850 _values!1516) e!283734)))

(assert (=> start!43518 tp!43173))

(declare-fun array_inv!10851 (array!31277) Bool)

(assert (=> start!43518 (array_inv!10851 _keys!1874)))

(assert (= (and start!43518 res!287434) b!482174))

(assert (= (and b!482174 res!287437) b!482180))

(assert (= (and b!482180 res!287436) b!482175))

(assert (= (and b!482175 res!287435) b!482179))

(assert (= (and b!482177 condMapEmpty!22423) mapIsEmpty!22423))

(assert (= (and b!482177 (not condMapEmpty!22423)) mapNonEmpty!22423))

(get-info :version)

(assert (= (and mapNonEmpty!22423 ((_ is ValueCellFull!6543) mapValue!22423)) b!482178))

(assert (= (and b!482177 ((_ is ValueCellFull!6543) mapDefault!22423)) b!482176))

(assert (= start!43518 b!482177))

(declare-fun m!463491 () Bool)

(assert (=> b!482180 m!463491))

(declare-fun m!463493 () Bool)

(assert (=> b!482179 m!463493))

(assert (=> b!482179 m!463493))

(declare-fun m!463495 () Bool)

(assert (=> b!482179 m!463495))

(declare-fun m!463497 () Bool)

(assert (=> start!43518 m!463497))

(declare-fun m!463499 () Bool)

(assert (=> start!43518 m!463499))

(declare-fun m!463501 () Bool)

(assert (=> start!43518 m!463501))

(declare-fun m!463503 () Bool)

(assert (=> b!482175 m!463503))

(declare-fun m!463505 () Bool)

(assert (=> mapNonEmpty!22423 m!463505))

(check-sat (not b_next!12297) (not b!482179) (not b!482180) (not start!43518) b_and!21057 tp_is_empty!13809 (not mapNonEmpty!22423) (not b!482175))
(check-sat b_and!21057 (not b_next!12297))
