; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37314 () Bool)

(assert start!37314)

(declare-fun b_free!8455 () Bool)

(declare-fun b_next!8455 () Bool)

(assert (=> start!37314 (= b_free!8455 (not b_next!8455))))

(declare-fun tp!30081 () Bool)

(declare-fun b_and!15671 () Bool)

(assert (=> start!37314 (= tp!30081 b_and!15671)))

(declare-fun b!378419 () Bool)

(declare-fun res!214422 () Bool)

(declare-fun e!230284 () Bool)

(assert (=> b!378419 (=> (not res!214422) (not e!230284))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378419 (= res!214422 (validKeyInArray!0 k0!778))))

(declare-fun b!378420 () Bool)

(declare-fun e!230283 () Bool)

(declare-fun tp_is_empty!9103 () Bool)

(assert (=> b!378420 (= e!230283 tp_is_empty!9103)))

(declare-fun b!378421 () Bool)

(declare-fun res!214429 () Bool)

(declare-fun e!230286 () Bool)

(assert (=> b!378421 (=> (not res!214429) (not e!230286))))

(declare-datatypes ((array!22113 0))(
  ( (array!22114 (arr!10525 (Array (_ BitVec 32) (_ BitVec 64))) (size!10878 (_ BitVec 32))) )
))
(declare-fun lt!176302 () array!22113)

(declare-datatypes ((List!5947 0))(
  ( (Nil!5944) (Cons!5943 (h!6799 (_ BitVec 64)) (t!11088 List!5947)) )
))
(declare-fun arrayNoDuplicates!0 (array!22113 (_ BitVec 32) List!5947) Bool)

(assert (=> b!378421 (= res!214429 (arrayNoDuplicates!0 lt!176302 #b00000000000000000000000000000000 Nil!5944))))

(declare-fun b!378422 () Bool)

(declare-fun e!230282 () Bool)

(declare-fun e!230285 () Bool)

(assert (=> b!378422 (= e!230282 e!230285)))

(declare-fun res!214430 () Bool)

(assert (=> b!378422 (=> res!214430 e!230285)))

(assert (=> b!378422 (= res!214430 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13243 0))(
  ( (V!13244 (val!4596 Int)) )
))
(declare-datatypes ((tuple2!6118 0))(
  ( (tuple2!6119 (_1!3070 (_ BitVec 64)) (_2!3070 V!13243)) )
))
(declare-datatypes ((List!5948 0))(
  ( (Nil!5945) (Cons!5944 (h!6800 tuple2!6118) (t!11089 List!5948)) )
))
(declare-datatypes ((ListLongMap!5021 0))(
  ( (ListLongMap!5022 (toList!2526 List!5948)) )
))
(declare-fun lt!176301 () ListLongMap!5021)

(declare-fun lt!176303 () ListLongMap!5021)

(assert (=> b!378422 (= lt!176301 lt!176303)))

(declare-fun lt!176310 () ListLongMap!5021)

(declare-fun lt!176307 () tuple2!6118)

(declare-fun +!894 (ListLongMap!5021 tuple2!6118) ListLongMap!5021)

(assert (=> b!378422 (= lt!176303 (+!894 lt!176310 lt!176307))))

(declare-fun lt!176313 () ListLongMap!5021)

(declare-fun lt!176305 () ListLongMap!5021)

(assert (=> b!378422 (= lt!176313 lt!176305)))

(declare-fun lt!176304 () ListLongMap!5021)

(assert (=> b!378422 (= lt!176305 (+!894 lt!176304 lt!176307))))

(declare-fun lt!176306 () ListLongMap!5021)

(assert (=> b!378422 (= lt!176313 (+!894 lt!176306 lt!176307))))

(declare-fun minValue!472 () V!13243)

(assert (=> b!378422 (= lt!176307 (tuple2!6119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15219 () Bool)

(declare-fun mapRes!15219 () Bool)

(declare-fun tp!30080 () Bool)

(declare-fun e!230287 () Bool)

(assert (=> mapNonEmpty!15219 (= mapRes!15219 (and tp!30080 e!230287))))

(declare-datatypes ((ValueCell!4208 0))(
  ( (ValueCellFull!4208 (v!6787 V!13243)) (EmptyCell!4208) )
))
(declare-datatypes ((array!22115 0))(
  ( (array!22116 (arr!10526 (Array (_ BitVec 32) ValueCell!4208)) (size!10879 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22115)

(declare-fun mapRest!15219 () (Array (_ BitVec 32) ValueCell!4208))

(declare-fun mapKey!15219 () (_ BitVec 32))

(declare-fun mapValue!15219 () ValueCell!4208)

(assert (=> mapNonEmpty!15219 (= (arr!10526 _values!506) (store mapRest!15219 mapKey!15219 mapValue!15219))))

(declare-fun b!378423 () Bool)

(assert (=> b!378423 (= e!230284 e!230286)))

(declare-fun res!214424 () Bool)

(assert (=> b!378423 (=> (not res!214424) (not e!230286))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22113 (_ BitVec 32)) Bool)

(assert (=> b!378423 (= res!214424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176302 mask!970))))

(declare-fun _keys!658 () array!22113)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378423 (= lt!176302 (array!22114 (store (arr!10525 _keys!658) i!548 k0!778) (size!10878 _keys!658)))))

(declare-fun b!378424 () Bool)

(declare-fun res!214421 () Bool)

(assert (=> b!378424 (=> (not res!214421) (not e!230284))))

(assert (=> b!378424 (= res!214421 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10878 _keys!658))))))

(declare-fun b!378425 () Bool)

(declare-fun res!214426 () Bool)

(assert (=> b!378425 (=> (not res!214426) (not e!230284))))

(assert (=> b!378425 (= res!214426 (or (= (select (arr!10525 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10525 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378426 () Bool)

(declare-fun res!214428 () Bool)

(assert (=> b!378426 (=> (not res!214428) (not e!230284))))

(declare-fun arrayContainsKey!0 (array!22113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378426 (= res!214428 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378427 () Bool)

(assert (=> b!378427 (= e!230286 (not e!230282))))

(declare-fun res!214423 () Bool)

(assert (=> b!378427 (=> res!214423 e!230282)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378427 (= res!214423 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13243)

(declare-fun getCurrentListMap!1930 (array!22113 array!22115 (_ BitVec 32) (_ BitVec 32) V!13243 V!13243 (_ BitVec 32) Int) ListLongMap!5021)

(assert (=> b!378427 (= lt!176301 (getCurrentListMap!1930 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176308 () array!22115)

(assert (=> b!378427 (= lt!176313 (getCurrentListMap!1930 lt!176302 lt!176308 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378427 (and (= lt!176306 lt!176304) (= lt!176304 lt!176306))))

(declare-fun lt!176311 () tuple2!6118)

(assert (=> b!378427 (= lt!176304 (+!894 lt!176310 lt!176311))))

(declare-fun v!373 () V!13243)

(assert (=> b!378427 (= lt!176311 (tuple2!6119 k0!778 v!373))))

(declare-datatypes ((Unit!11654 0))(
  ( (Unit!11655) )
))
(declare-fun lt!176312 () Unit!11654)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!123 (array!22113 array!22115 (_ BitVec 32) (_ BitVec 32) V!13243 V!13243 (_ BitVec 32) (_ BitVec 64) V!13243 (_ BitVec 32) Int) Unit!11654)

(assert (=> b!378427 (= lt!176312 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!123 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!795 (array!22113 array!22115 (_ BitVec 32) (_ BitVec 32) V!13243 V!13243 (_ BitVec 32) Int) ListLongMap!5021)

(assert (=> b!378427 (= lt!176306 (getCurrentListMapNoExtraKeys!795 lt!176302 lt!176308 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378427 (= lt!176308 (array!22116 (store (arr!10526 _values!506) i!548 (ValueCellFull!4208 v!373)) (size!10879 _values!506)))))

(assert (=> b!378427 (= lt!176310 (getCurrentListMapNoExtraKeys!795 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378428 () Bool)

(declare-fun res!214427 () Bool)

(assert (=> b!378428 (=> (not res!214427) (not e!230284))))

(assert (=> b!378428 (= res!214427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378429 () Bool)

(assert (=> b!378429 (= e!230285 true)))

(assert (=> b!378429 (= lt!176305 (+!894 lt!176303 lt!176311))))

(declare-fun lt!176309 () Unit!11654)

(declare-fun addCommutativeForDiffKeys!295 (ListLongMap!5021 (_ BitVec 64) V!13243 (_ BitVec 64) V!13243) Unit!11654)

(assert (=> b!378429 (= lt!176309 (addCommutativeForDiffKeys!295 lt!176310 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378430 () Bool)

(declare-fun res!214420 () Bool)

(assert (=> b!378430 (=> (not res!214420) (not e!230284))))

(assert (=> b!378430 (= res!214420 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5944))))

(declare-fun b!378431 () Bool)

(declare-fun res!214419 () Bool)

(assert (=> b!378431 (=> (not res!214419) (not e!230284))))

(assert (=> b!378431 (= res!214419 (and (= (size!10879 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10878 _keys!658) (size!10879 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378432 () Bool)

(assert (=> b!378432 (= e!230287 tp_is_empty!9103)))

(declare-fun b!378433 () Bool)

(declare-fun e!230288 () Bool)

(assert (=> b!378433 (= e!230288 (and e!230283 mapRes!15219))))

(declare-fun condMapEmpty!15219 () Bool)

(declare-fun mapDefault!15219 () ValueCell!4208)

(assert (=> b!378433 (= condMapEmpty!15219 (= (arr!10526 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4208)) mapDefault!15219)))))

(declare-fun mapIsEmpty!15219 () Bool)

(assert (=> mapIsEmpty!15219 mapRes!15219))

(declare-fun res!214425 () Bool)

(assert (=> start!37314 (=> (not res!214425) (not e!230284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37314 (= res!214425 (validMask!0 mask!970))))

(assert (=> start!37314 e!230284))

(declare-fun array_inv!7758 (array!22115) Bool)

(assert (=> start!37314 (and (array_inv!7758 _values!506) e!230288)))

(assert (=> start!37314 tp!30081))

(assert (=> start!37314 true))

(assert (=> start!37314 tp_is_empty!9103))

(declare-fun array_inv!7759 (array!22113) Bool)

(assert (=> start!37314 (array_inv!7759 _keys!658)))

(assert (= (and start!37314 res!214425) b!378431))

(assert (= (and b!378431 res!214419) b!378428))

(assert (= (and b!378428 res!214427) b!378430))

(assert (= (and b!378430 res!214420) b!378424))

(assert (= (and b!378424 res!214421) b!378419))

(assert (= (and b!378419 res!214422) b!378425))

(assert (= (and b!378425 res!214426) b!378426))

(assert (= (and b!378426 res!214428) b!378423))

(assert (= (and b!378423 res!214424) b!378421))

(assert (= (and b!378421 res!214429) b!378427))

(assert (= (and b!378427 (not res!214423)) b!378422))

(assert (= (and b!378422 (not res!214430)) b!378429))

(assert (= (and b!378433 condMapEmpty!15219) mapIsEmpty!15219))

(assert (= (and b!378433 (not condMapEmpty!15219)) mapNonEmpty!15219))

(get-info :version)

(assert (= (and mapNonEmpty!15219 ((_ is ValueCellFull!4208) mapValue!15219)) b!378432))

(assert (= (and b!378433 ((_ is ValueCellFull!4208) mapDefault!15219)) b!378420))

(assert (= start!37314 b!378433))

(declare-fun m!374795 () Bool)

(assert (=> b!378426 m!374795))

(declare-fun m!374797 () Bool)

(assert (=> b!378421 m!374797))

(declare-fun m!374799 () Bool)

(assert (=> b!378427 m!374799))

(declare-fun m!374801 () Bool)

(assert (=> b!378427 m!374801))

(declare-fun m!374803 () Bool)

(assert (=> b!378427 m!374803))

(declare-fun m!374805 () Bool)

(assert (=> b!378427 m!374805))

(declare-fun m!374807 () Bool)

(assert (=> b!378427 m!374807))

(declare-fun m!374809 () Bool)

(assert (=> b!378427 m!374809))

(declare-fun m!374811 () Bool)

(assert (=> b!378427 m!374811))

(declare-fun m!374813 () Bool)

(assert (=> mapNonEmpty!15219 m!374813))

(declare-fun m!374815 () Bool)

(assert (=> b!378422 m!374815))

(declare-fun m!374817 () Bool)

(assert (=> b!378422 m!374817))

(declare-fun m!374819 () Bool)

(assert (=> b!378422 m!374819))

(declare-fun m!374821 () Bool)

(assert (=> b!378425 m!374821))

(declare-fun m!374823 () Bool)

(assert (=> b!378423 m!374823))

(declare-fun m!374825 () Bool)

(assert (=> b!378423 m!374825))

(declare-fun m!374827 () Bool)

(assert (=> b!378430 m!374827))

(declare-fun m!374829 () Bool)

(assert (=> b!378429 m!374829))

(declare-fun m!374831 () Bool)

(assert (=> b!378429 m!374831))

(declare-fun m!374833 () Bool)

(assert (=> start!37314 m!374833))

(declare-fun m!374835 () Bool)

(assert (=> start!37314 m!374835))

(declare-fun m!374837 () Bool)

(assert (=> start!37314 m!374837))

(declare-fun m!374839 () Bool)

(assert (=> b!378419 m!374839))

(declare-fun m!374841 () Bool)

(assert (=> b!378428 m!374841))

(check-sat (not b!378429) (not start!37314) b_and!15671 (not b!378422) (not b_next!8455) (not mapNonEmpty!15219) (not b!378426) (not b!378419) (not b!378427) (not b!378421) (not b!378430) (not b!378428) (not b!378423) tp_is_empty!9103)
(check-sat b_and!15671 (not b_next!8455))
