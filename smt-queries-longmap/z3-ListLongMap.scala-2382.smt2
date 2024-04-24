; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37740 () Bool)

(assert start!37740)

(declare-fun b_free!8857 () Bool)

(declare-fun b_next!8857 () Bool)

(assert (=> start!37740 (= b_free!8857 (not b_next!8857))))

(declare-fun tp!31323 () Bool)

(declare-fun b_and!16113 () Bool)

(assert (=> start!37740 (= tp!31323 b_and!16113)))

(declare-fun mapNonEmpty!15858 () Bool)

(declare-fun mapRes!15858 () Bool)

(declare-fun tp!31322 () Bool)

(declare-fun e!234847 () Bool)

(assert (=> mapNonEmpty!15858 (= mapRes!15858 (and tp!31322 e!234847))))

(declare-datatypes ((V!13811 0))(
  ( (V!13812 (val!4809 Int)) )
))
(declare-datatypes ((ValueCell!4421 0))(
  ( (ValueCellFull!4421 (v!7007 V!13811)) (EmptyCell!4421) )
))
(declare-datatypes ((array!22942 0))(
  ( (array!22943 (arr!10939 (Array (_ BitVec 32) ValueCell!4421)) (size!11291 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22942)

(declare-fun mapValue!15858 () ValueCell!4421)

(declare-fun mapRest!15858 () (Array (_ BitVec 32) ValueCell!4421))

(declare-fun mapKey!15858 () (_ BitVec 32))

(assert (=> mapNonEmpty!15858 (= (arr!10939 _values!506) (store mapRest!15858 mapKey!15858 mapValue!15858))))

(declare-fun b!387367 () Bool)

(declare-fun e!234852 () Bool)

(assert (=> b!387367 (= e!234852 false)))

(declare-datatypes ((tuple2!6328 0))(
  ( (tuple2!6329 (_1!3175 (_ BitVec 64)) (_2!3175 V!13811)) )
))
(declare-datatypes ((List!6179 0))(
  ( (Nil!6176) (Cons!6175 (h!7031 tuple2!6328) (t!11321 List!6179)) )
))
(declare-datatypes ((ListLongMap!5243 0))(
  ( (ListLongMap!5244 (toList!2637 List!6179)) )
))
(declare-fun lt!182051 () ListLongMap!5243)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13811)

(declare-datatypes ((array!22944 0))(
  ( (array!22945 (arr!10940 (Array (_ BitVec 32) (_ BitVec 64))) (size!11292 (_ BitVec 32))) )
))
(declare-fun lt!182052 () array!22944)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13811)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13811)

(declare-fun getCurrentListMapNoExtraKeys!912 (array!22944 array!22942 (_ BitVec 32) (_ BitVec 32) V!13811 V!13811 (_ BitVec 32) Int) ListLongMap!5243)

(assert (=> b!387367 (= lt!182051 (getCurrentListMapNoExtraKeys!912 lt!182052 (array!22943 (store (arr!10939 _values!506) i!548 (ValueCellFull!4421 v!373)) (size!11291 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182053 () ListLongMap!5243)

(declare-fun _keys!658 () array!22944)

(assert (=> b!387367 (= lt!182053 (getCurrentListMapNoExtraKeys!912 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387368 () Bool)

(declare-fun res!221358 () Bool)

(declare-fun e!234849 () Bool)

(assert (=> b!387368 (=> (not res!221358) (not e!234849))))

(assert (=> b!387368 (= res!221358 (or (= (select (arr!10940 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10940 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!221363 () Bool)

(assert (=> start!37740 (=> (not res!221363) (not e!234849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37740 (= res!221363 (validMask!0 mask!970))))

(assert (=> start!37740 e!234849))

(declare-fun e!234848 () Bool)

(declare-fun array_inv!8084 (array!22942) Bool)

(assert (=> start!37740 (and (array_inv!8084 _values!506) e!234848)))

(assert (=> start!37740 tp!31323))

(assert (=> start!37740 true))

(declare-fun tp_is_empty!9529 () Bool)

(assert (=> start!37740 tp_is_empty!9529))

(declare-fun array_inv!8085 (array!22944) Bool)

(assert (=> start!37740 (array_inv!8085 _keys!658)))

(declare-fun b!387369 () Bool)

(assert (=> b!387369 (= e!234849 e!234852)))

(declare-fun res!221357 () Bool)

(assert (=> b!387369 (=> (not res!221357) (not e!234852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22944 (_ BitVec 32)) Bool)

(assert (=> b!387369 (= res!221357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182052 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!387369 (= lt!182052 (array!22945 (store (arr!10940 _keys!658) i!548 k0!778) (size!11292 _keys!658)))))

(declare-fun b!387370 () Bool)

(declare-fun res!221355 () Bool)

(assert (=> b!387370 (=> (not res!221355) (not e!234849))))

(assert (=> b!387370 (= res!221355 (and (= (size!11291 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11292 _keys!658) (size!11291 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387371 () Bool)

(declare-fun res!221361 () Bool)

(assert (=> b!387371 (=> (not res!221361) (not e!234849))))

(assert (=> b!387371 (= res!221361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387372 () Bool)

(assert (=> b!387372 (= e!234847 tp_is_empty!9529)))

(declare-fun b!387373 () Bool)

(declare-fun e!234851 () Bool)

(assert (=> b!387373 (= e!234851 tp_is_empty!9529)))

(declare-fun b!387374 () Bool)

(declare-fun res!221360 () Bool)

(assert (=> b!387374 (=> (not res!221360) (not e!234849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387374 (= res!221360 (validKeyInArray!0 k0!778))))

(declare-fun b!387375 () Bool)

(assert (=> b!387375 (= e!234848 (and e!234851 mapRes!15858))))

(declare-fun condMapEmpty!15858 () Bool)

(declare-fun mapDefault!15858 () ValueCell!4421)

(assert (=> b!387375 (= condMapEmpty!15858 (= (arr!10939 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4421)) mapDefault!15858)))))

(declare-fun b!387376 () Bool)

(declare-fun res!221359 () Bool)

(assert (=> b!387376 (=> (not res!221359) (not e!234852))))

(declare-datatypes ((List!6180 0))(
  ( (Nil!6177) (Cons!6176 (h!7032 (_ BitVec 64)) (t!11322 List!6180)) )
))
(declare-fun arrayNoDuplicates!0 (array!22944 (_ BitVec 32) List!6180) Bool)

(assert (=> b!387376 (= res!221359 (arrayNoDuplicates!0 lt!182052 #b00000000000000000000000000000000 Nil!6177))))

(declare-fun b!387377 () Bool)

(declare-fun res!221362 () Bool)

(assert (=> b!387377 (=> (not res!221362) (not e!234849))))

(assert (=> b!387377 (= res!221362 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11292 _keys!658))))))

(declare-fun b!387378 () Bool)

(declare-fun res!221354 () Bool)

(assert (=> b!387378 (=> (not res!221354) (not e!234849))))

(declare-fun arrayContainsKey!0 (array!22944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387378 (= res!221354 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15858 () Bool)

(assert (=> mapIsEmpty!15858 mapRes!15858))

(declare-fun b!387379 () Bool)

(declare-fun res!221356 () Bool)

(assert (=> b!387379 (=> (not res!221356) (not e!234849))))

(assert (=> b!387379 (= res!221356 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6177))))

(assert (= (and start!37740 res!221363) b!387370))

(assert (= (and b!387370 res!221355) b!387371))

(assert (= (and b!387371 res!221361) b!387379))

(assert (= (and b!387379 res!221356) b!387377))

(assert (= (and b!387377 res!221362) b!387374))

(assert (= (and b!387374 res!221360) b!387368))

(assert (= (and b!387368 res!221358) b!387378))

(assert (= (and b!387378 res!221354) b!387369))

(assert (= (and b!387369 res!221357) b!387376))

(assert (= (and b!387376 res!221359) b!387367))

(assert (= (and b!387375 condMapEmpty!15858) mapIsEmpty!15858))

(assert (= (and b!387375 (not condMapEmpty!15858)) mapNonEmpty!15858))

(get-info :version)

(assert (= (and mapNonEmpty!15858 ((_ is ValueCellFull!4421) mapValue!15858)) b!387372))

(assert (= (and b!387375 ((_ is ValueCellFull!4421) mapDefault!15858)) b!387373))

(assert (= start!37740 b!387375))

(declare-fun m!383765 () Bool)

(assert (=> b!387374 m!383765))

(declare-fun m!383767 () Bool)

(assert (=> b!387368 m!383767))

(declare-fun m!383769 () Bool)

(assert (=> mapNonEmpty!15858 m!383769))

(declare-fun m!383771 () Bool)

(assert (=> b!387367 m!383771))

(declare-fun m!383773 () Bool)

(assert (=> b!387367 m!383773))

(declare-fun m!383775 () Bool)

(assert (=> b!387367 m!383775))

(declare-fun m!383777 () Bool)

(assert (=> b!387379 m!383777))

(declare-fun m!383779 () Bool)

(assert (=> start!37740 m!383779))

(declare-fun m!383781 () Bool)

(assert (=> start!37740 m!383781))

(declare-fun m!383783 () Bool)

(assert (=> start!37740 m!383783))

(declare-fun m!383785 () Bool)

(assert (=> b!387376 m!383785))

(declare-fun m!383787 () Bool)

(assert (=> b!387369 m!383787))

(declare-fun m!383789 () Bool)

(assert (=> b!387369 m!383789))

(declare-fun m!383791 () Bool)

(assert (=> b!387378 m!383791))

(declare-fun m!383793 () Bool)

(assert (=> b!387371 m!383793))

(check-sat (not b!387374) (not mapNonEmpty!15858) (not b!387367) (not b!387371) tp_is_empty!9529 (not b!387379) (not b!387376) (not b!387378) (not b_next!8857) b_and!16113 (not b!387369) (not start!37740))
(check-sat b_and!16113 (not b_next!8857))
