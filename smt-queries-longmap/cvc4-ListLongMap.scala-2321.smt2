; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37392 () Bool)

(assert start!37392)

(declare-fun b_free!8519 () Bool)

(declare-fun b_next!8519 () Bool)

(assert (=> start!37392 (= b_free!8519 (not b_next!8519))))

(declare-fun tp!30272 () Bool)

(declare-fun b_and!15761 () Bool)

(assert (=> start!37392 (= tp!30272 b_and!15761)))

(declare-fun b!380130 () Bool)

(declare-fun res!215700 () Bool)

(declare-fun e!231223 () Bool)

(assert (=> b!380130 (=> (not res!215700) (not e!231223))))

(declare-datatypes ((array!22253 0))(
  ( (array!22254 (arr!10595 (Array (_ BitVec 32) (_ BitVec 64))) (size!10947 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22253)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380130 (= res!215700 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!380132 () Bool)

(declare-fun res!215701 () Bool)

(declare-fun e!231228 () Bool)

(assert (=> b!380132 (=> (not res!215701) (not e!231228))))

(declare-fun lt!177788 () array!22253)

(declare-datatypes ((List!6035 0))(
  ( (Nil!6032) (Cons!6031 (h!6887 (_ BitVec 64)) (t!11185 List!6035)) )
))
(declare-fun arrayNoDuplicates!0 (array!22253 (_ BitVec 32) List!6035) Bool)

(assert (=> b!380132 (= res!215701 (arrayNoDuplicates!0 lt!177788 #b00000000000000000000000000000000 Nil!6032))))

(declare-fun b!380133 () Bool)

(declare-fun e!231226 () Bool)

(assert (=> b!380133 (= e!231228 (not e!231226))))

(declare-fun res!215711 () Bool)

(assert (=> b!380133 (=> res!215711 e!231226)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380133 (= res!215711 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13327 0))(
  ( (V!13328 (val!4628 Int)) )
))
(declare-datatypes ((ValueCell!4240 0))(
  ( (ValueCellFull!4240 (v!6825 V!13327)) (EmptyCell!4240) )
))
(declare-datatypes ((array!22255 0))(
  ( (array!22256 (arr!10596 (Array (_ BitVec 32) ValueCell!4240)) (size!10948 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22255)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6200 0))(
  ( (tuple2!6201 (_1!3111 (_ BitVec 64)) (_2!3111 V!13327)) )
))
(declare-datatypes ((List!6036 0))(
  ( (Nil!6033) (Cons!6032 (h!6888 tuple2!6200) (t!11186 List!6036)) )
))
(declare-datatypes ((ListLongMap!5113 0))(
  ( (ListLongMap!5114 (toList!2572 List!6036)) )
))
(declare-fun lt!177784 () ListLongMap!5113)

(declare-fun zeroValue!472 () V!13327)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13327)

(declare-fun getCurrentListMap!1989 (array!22253 array!22255 (_ BitVec 32) (_ BitVec 32) V!13327 V!13327 (_ BitVec 32) Int) ListLongMap!5113)

(assert (=> b!380133 (= lt!177784 (getCurrentListMap!1989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177794 () array!22255)

(declare-fun lt!177790 () ListLongMap!5113)

(assert (=> b!380133 (= lt!177790 (getCurrentListMap!1989 lt!177788 lt!177794 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177791 () ListLongMap!5113)

(declare-fun lt!177783 () ListLongMap!5113)

(assert (=> b!380133 (and (= lt!177791 lt!177783) (= lt!177783 lt!177791))))

(declare-fun lt!177792 () ListLongMap!5113)

(declare-fun lt!177793 () tuple2!6200)

(declare-fun +!918 (ListLongMap!5113 tuple2!6200) ListLongMap!5113)

(assert (=> b!380133 (= lt!177783 (+!918 lt!177792 lt!177793))))

(declare-fun v!373 () V!13327)

(assert (=> b!380133 (= lt!177793 (tuple2!6201 k!778 v!373))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((Unit!11730 0))(
  ( (Unit!11731) )
))
(declare-fun lt!177789 () Unit!11730)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!147 (array!22253 array!22255 (_ BitVec 32) (_ BitVec 32) V!13327 V!13327 (_ BitVec 32) (_ BitVec 64) V!13327 (_ BitVec 32) Int) Unit!11730)

(assert (=> b!380133 (= lt!177789 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!147 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!823 (array!22253 array!22255 (_ BitVec 32) (_ BitVec 32) V!13327 V!13327 (_ BitVec 32) Int) ListLongMap!5113)

(assert (=> b!380133 (= lt!177791 (getCurrentListMapNoExtraKeys!823 lt!177788 lt!177794 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380133 (= lt!177794 (array!22256 (store (arr!10596 _values!506) i!548 (ValueCellFull!4240 v!373)) (size!10948 _values!506)))))

(assert (=> b!380133 (= lt!177792 (getCurrentListMapNoExtraKeys!823 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380134 () Bool)

(declare-fun res!215703 () Bool)

(assert (=> b!380134 (=> (not res!215703) (not e!231223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22253 (_ BitVec 32)) Bool)

(assert (=> b!380134 (= res!215703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380135 () Bool)

(declare-fun res!215706 () Bool)

(assert (=> b!380135 (=> (not res!215706) (not e!231223))))

(assert (=> b!380135 (= res!215706 (and (= (size!10948 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10947 _keys!658) (size!10948 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380136 () Bool)

(declare-fun e!231230 () Bool)

(assert (=> b!380136 (= e!231226 e!231230)))

(declare-fun res!215704 () Bool)

(assert (=> b!380136 (=> res!215704 e!231230)))

(assert (=> b!380136 (= res!215704 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177785 () ListLongMap!5113)

(assert (=> b!380136 (= lt!177784 lt!177785)))

(declare-fun lt!177786 () tuple2!6200)

(assert (=> b!380136 (= lt!177785 (+!918 lt!177792 lt!177786))))

(declare-fun lt!177787 () ListLongMap!5113)

(assert (=> b!380136 (= lt!177790 lt!177787)))

(assert (=> b!380136 (= lt!177787 (+!918 lt!177783 lt!177786))))

(assert (=> b!380136 (= lt!177790 (+!918 lt!177791 lt!177786))))

(assert (=> b!380136 (= lt!177786 (tuple2!6201 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380137 () Bool)

(declare-fun res!215708 () Bool)

(assert (=> b!380137 (=> (not res!215708) (not e!231223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380137 (= res!215708 (validKeyInArray!0 k!778))))

(declare-fun b!380138 () Bool)

(assert (=> b!380138 (= e!231230 true)))

(assert (=> b!380138 (= lt!177787 (+!918 lt!177785 lt!177793))))

(declare-fun lt!177795 () Unit!11730)

(declare-fun addCommutativeForDiffKeys!315 (ListLongMap!5113 (_ BitVec 64) V!13327 (_ BitVec 64) V!13327) Unit!11730)

(assert (=> b!380138 (= lt!177795 (addCommutativeForDiffKeys!315 lt!177792 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380139 () Bool)

(declare-fun e!231224 () Bool)

(declare-fun e!231229 () Bool)

(declare-fun mapRes!15315 () Bool)

(assert (=> b!380139 (= e!231224 (and e!231229 mapRes!15315))))

(declare-fun condMapEmpty!15315 () Bool)

(declare-fun mapDefault!15315 () ValueCell!4240)

