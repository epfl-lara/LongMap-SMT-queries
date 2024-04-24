; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43246 () Bool)

(assert start!43246)

(declare-fun b_free!12127 () Bool)

(declare-fun b_next!12127 () Bool)

(assert (=> start!43246 (= b_free!12127 (not b_next!12127))))

(declare-fun tp!42651 () Bool)

(declare-fun b_and!20889 () Bool)

(assert (=> start!43246 (= tp!42651 b_and!20889)))

(declare-fun b!479239 () Bool)

(declare-fun e!281930 () Bool)

(declare-fun e!281929 () Bool)

(declare-fun mapRes!22156 () Bool)

(assert (=> b!479239 (= e!281930 (and e!281929 mapRes!22156))))

(declare-fun condMapEmpty!22156 () Bool)

(declare-datatypes ((V!19257 0))(
  ( (V!19258 (val!6867 Int)) )
))
(declare-datatypes ((ValueCell!6458 0))(
  ( (ValueCellFull!6458 (v!9157 V!19257)) (EmptyCell!6458) )
))
(declare-datatypes ((array!30934 0))(
  ( (array!30935 (arr!14873 (Array (_ BitVec 32) ValueCell!6458)) (size!15231 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30934)

(declare-fun mapDefault!22156 () ValueCell!6458)

(assert (=> b!479239 (= condMapEmpty!22156 (= (arr!14873 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6458)) mapDefault!22156)))))

(declare-fun b!479240 () Bool)

(declare-fun res!285903 () Bool)

(declare-fun e!281931 () Bool)

(assert (=> b!479240 (=> (not res!285903) (not e!281931))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30936 0))(
  ( (array!30937 (arr!14874 (Array (_ BitVec 32) (_ BitVec 64))) (size!15232 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30936)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479240 (= res!285903 (and (= (size!15231 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15232 _keys!1874) (size!15231 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479241 () Bool)

(declare-fun res!285902 () Bool)

(assert (=> b!479241 (=> (not res!285902) (not e!281931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30936 (_ BitVec 32)) Bool)

(assert (=> b!479241 (= res!285902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479242 () Bool)

(declare-fun tp_is_empty!13639 () Bool)

(assert (=> b!479242 (= e!281929 tp_is_empty!13639)))

(declare-fun b!479243 () Bool)

(declare-fun res!285905 () Bool)

(assert (=> b!479243 (=> (not res!285905) (not e!281931))))

(declare-datatypes ((List!9000 0))(
  ( (Nil!8997) (Cons!8996 (h!9852 (_ BitVec 64)) (t!15198 List!9000)) )
))
(declare-fun arrayNoDuplicates!0 (array!30936 (_ BitVec 32) List!9000) Bool)

(assert (=> b!479243 (= res!285905 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8997))))

(declare-fun b!479244 () Bool)

(assert (=> b!479244 (= e!281931 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217855 () Bool)

(declare-fun zeroValue!1458 () V!19257)

(declare-fun minValue!1458 () V!19257)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8934 0))(
  ( (tuple2!8935 (_1!4478 (_ BitVec 64)) (_2!4478 V!19257)) )
))
(declare-datatypes ((List!9001 0))(
  ( (Nil!8998) (Cons!8997 (h!9853 tuple2!8934) (t!15199 List!9001)) )
))
(declare-datatypes ((ListLongMap!7849 0))(
  ( (ListLongMap!7850 (toList!3940 List!9001)) )
))
(declare-fun contains!2568 (ListLongMap!7849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2254 (array!30936 array!30934 (_ BitVec 32) (_ BitVec 32) V!19257 V!19257 (_ BitVec 32) Int) ListLongMap!7849)

(assert (=> b!479244 (= lt!217855 (contains!2568 (getCurrentListMap!2254 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapIsEmpty!22156 () Bool)

(assert (=> mapIsEmpty!22156 mapRes!22156))

(declare-fun b!479245 () Bool)

(declare-fun e!281927 () Bool)

(assert (=> b!479245 (= e!281927 tp_is_empty!13639)))

(declare-fun res!285904 () Bool)

(assert (=> start!43246 (=> (not res!285904) (not e!281931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43246 (= res!285904 (validMask!0 mask!2352))))

(assert (=> start!43246 e!281931))

(assert (=> start!43246 true))

(assert (=> start!43246 tp_is_empty!13639))

(declare-fun array_inv!10808 (array!30934) Bool)

(assert (=> start!43246 (and (array_inv!10808 _values!1516) e!281930)))

(assert (=> start!43246 tp!42651))

(declare-fun array_inv!10809 (array!30936) Bool)

(assert (=> start!43246 (array_inv!10809 _keys!1874)))

(declare-fun mapNonEmpty!22156 () Bool)

(declare-fun tp!42652 () Bool)

(assert (=> mapNonEmpty!22156 (= mapRes!22156 (and tp!42652 e!281927))))

(declare-fun mapValue!22156 () ValueCell!6458)

(declare-fun mapKey!22156 () (_ BitVec 32))

(declare-fun mapRest!22156 () (Array (_ BitVec 32) ValueCell!6458))

(assert (=> mapNonEmpty!22156 (= (arr!14873 _values!1516) (store mapRest!22156 mapKey!22156 mapValue!22156))))

(assert (= (and start!43246 res!285904) b!479240))

(assert (= (and b!479240 res!285903) b!479241))

(assert (= (and b!479241 res!285902) b!479243))

(assert (= (and b!479243 res!285905) b!479244))

(assert (= (and b!479239 condMapEmpty!22156) mapIsEmpty!22156))

(assert (= (and b!479239 (not condMapEmpty!22156)) mapNonEmpty!22156))

(get-info :version)

(assert (= (and mapNonEmpty!22156 ((_ is ValueCellFull!6458) mapValue!22156)) b!479245))

(assert (= (and b!479239 ((_ is ValueCellFull!6458) mapDefault!22156)) b!479242))

(assert (= start!43246 b!479239))

(declare-fun m!461461 () Bool)

(assert (=> b!479241 m!461461))

(declare-fun m!461463 () Bool)

(assert (=> b!479243 m!461463))

(declare-fun m!461465 () Bool)

(assert (=> start!43246 m!461465))

(declare-fun m!461467 () Bool)

(assert (=> start!43246 m!461467))

(declare-fun m!461469 () Bool)

(assert (=> start!43246 m!461469))

(declare-fun m!461471 () Bool)

(assert (=> mapNonEmpty!22156 m!461471))

(declare-fun m!461473 () Bool)

(assert (=> b!479244 m!461473))

(assert (=> b!479244 m!461473))

(declare-fun m!461475 () Bool)

(assert (=> b!479244 m!461475))

(check-sat (not b!479243) (not b!479241) (not b_next!12127) (not start!43246) tp_is_empty!13639 (not b!479244) (not mapNonEmpty!22156) b_and!20889)
(check-sat b_and!20889 (not b_next!12127))
