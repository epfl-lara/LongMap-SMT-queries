; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43472 () Bool)

(assert start!43472)

(declare-fun b_free!12265 () Bool)

(declare-fun b_next!12265 () Bool)

(assert (=> start!43472 (= b_free!12265 (not b_next!12265))))

(declare-fun tp!43077 () Bool)

(declare-fun b_and!20999 () Bool)

(assert (=> start!43472 (= tp!43077 b_and!20999)))

(declare-fun b!481567 () Bool)

(declare-fun e!283316 () Bool)

(assert (=> b!481567 (= e!283316 false)))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19441 0))(
  ( (V!19442 (val!6936 Int)) )
))
(declare-fun minValue!1458 () V!19441)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6527 0))(
  ( (ValueCellFull!6527 (v!9223 V!19441)) (EmptyCell!6527) )
))
(declare-datatypes ((array!31215 0))(
  ( (array!31216 (arr!15010 (Array (_ BitVec 32) ValueCell!6527)) (size!15369 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31215)

(declare-fun lt!218401 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31217 0))(
  ( (array!31218 (arr!15011 (Array (_ BitVec 32) (_ BitVec 64))) (size!15370 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31217)

(declare-fun zeroValue!1458 () V!19441)

(declare-datatypes ((tuple2!9154 0))(
  ( (tuple2!9155 (_1!4588 (_ BitVec 64)) (_2!4588 V!19441)) )
))
(declare-datatypes ((List!9220 0))(
  ( (Nil!9217) (Cons!9216 (h!10072 tuple2!9154) (t!15425 List!9220)) )
))
(declare-datatypes ((ListLongMap!8057 0))(
  ( (ListLongMap!8058 (toList!4044 List!9220)) )
))
(declare-fun contains!2623 (ListLongMap!8057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2297 (array!31217 array!31215 (_ BitVec 32) (_ BitVec 32) V!19441 V!19441 (_ BitVec 32) Int) ListLongMap!8057)

(assert (=> b!481567 (= lt!218401 (contains!2623 (getCurrentListMap!2297 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!287114 () Bool)

(assert (=> start!43472 (=> (not res!287114) (not e!283316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43472 (= res!287114 (validMask!0 mask!2352))))

(assert (=> start!43472 e!283316))

(assert (=> start!43472 true))

(declare-fun tp_is_empty!13777 () Bool)

(assert (=> start!43472 tp_is_empty!13777))

(declare-fun e!283317 () Bool)

(declare-fun array_inv!10916 (array!31215) Bool)

(assert (=> start!43472 (and (array_inv!10916 _values!1516) e!283317)))

(assert (=> start!43472 tp!43077))

(declare-fun array_inv!10917 (array!31217) Bool)

(assert (=> start!43472 (array_inv!10917 _keys!1874)))

(declare-fun b!481568 () Bool)

(declare-fun res!287116 () Bool)

(assert (=> b!481568 (=> (not res!287116) (not e!283316))))

(declare-datatypes ((List!9221 0))(
  ( (Nil!9218) (Cons!9217 (h!10073 (_ BitVec 64)) (t!15426 List!9221)) )
))
(declare-fun arrayNoDuplicates!0 (array!31217 (_ BitVec 32) List!9221) Bool)

(assert (=> b!481568 (= res!287116 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9218))))

(declare-fun mapNonEmpty!22375 () Bool)

(declare-fun mapRes!22375 () Bool)

(declare-fun tp!43078 () Bool)

(declare-fun e!283320 () Bool)

(assert (=> mapNonEmpty!22375 (= mapRes!22375 (and tp!43078 e!283320))))

(declare-fun mapValue!22375 () ValueCell!6527)

(declare-fun mapKey!22375 () (_ BitVec 32))

(declare-fun mapRest!22375 () (Array (_ BitVec 32) ValueCell!6527))

(assert (=> mapNonEmpty!22375 (= (arr!15010 _values!1516) (store mapRest!22375 mapKey!22375 mapValue!22375))))

(declare-fun b!481569 () Bool)

(declare-fun e!283319 () Bool)

(assert (=> b!481569 (= e!283319 tp_is_empty!13777)))

(declare-fun b!481570 () Bool)

(assert (=> b!481570 (= e!283317 (and e!283319 mapRes!22375))))

(declare-fun condMapEmpty!22375 () Bool)

(declare-fun mapDefault!22375 () ValueCell!6527)

(assert (=> b!481570 (= condMapEmpty!22375 (= (arr!15010 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6527)) mapDefault!22375)))))

(declare-fun b!481571 () Bool)

(assert (=> b!481571 (= e!283320 tp_is_empty!13777)))

(declare-fun b!481572 () Bool)

(declare-fun res!287113 () Bool)

(assert (=> b!481572 (=> (not res!287113) (not e!283316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31217 (_ BitVec 32)) Bool)

(assert (=> b!481572 (= res!287113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22375 () Bool)

(assert (=> mapIsEmpty!22375 mapRes!22375))

(declare-fun b!481573 () Bool)

(declare-fun res!287115 () Bool)

(assert (=> b!481573 (=> (not res!287115) (not e!283316))))

(assert (=> b!481573 (= res!287115 (and (= (size!15369 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15370 _keys!1874) (size!15369 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43472 res!287114) b!481573))

(assert (= (and b!481573 res!287115) b!481572))

(assert (= (and b!481572 res!287113) b!481568))

(assert (= (and b!481568 res!287116) b!481567))

(assert (= (and b!481570 condMapEmpty!22375) mapIsEmpty!22375))

(assert (= (and b!481570 (not condMapEmpty!22375)) mapNonEmpty!22375))

(get-info :version)

(assert (= (and mapNonEmpty!22375 ((_ is ValueCellFull!6527) mapValue!22375)) b!481571))

(assert (= (and b!481570 ((_ is ValueCellFull!6527) mapDefault!22375)) b!481569))

(assert (= start!43472 b!481570))

(declare-fun m!462501 () Bool)

(assert (=> start!43472 m!462501))

(declare-fun m!462503 () Bool)

(assert (=> start!43472 m!462503))

(declare-fun m!462505 () Bool)

(assert (=> start!43472 m!462505))

(declare-fun m!462507 () Bool)

(assert (=> b!481572 m!462507))

(declare-fun m!462509 () Bool)

(assert (=> mapNonEmpty!22375 m!462509))

(declare-fun m!462511 () Bool)

(assert (=> b!481567 m!462511))

(assert (=> b!481567 m!462511))

(declare-fun m!462513 () Bool)

(assert (=> b!481567 m!462513))

(declare-fun m!462515 () Bool)

(assert (=> b!481568 m!462515))

(check-sat (not b!481567) (not b!481572) (not mapNonEmpty!22375) b_and!20999 (not start!43472) (not b!481568) tp_is_empty!13777 (not b_next!12265))
(check-sat b_and!20999 (not b_next!12265))
