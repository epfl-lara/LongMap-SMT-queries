; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38548 () Bool)

(assert start!38548)

(declare-fun b_free!9085 () Bool)

(declare-fun b_next!9085 () Bool)

(assert (=> start!38548 (= b_free!9085 (not b_next!9085))))

(declare-fun tp!32378 () Bool)

(declare-fun b_and!16471 () Bool)

(assert (=> start!38548 (= tp!32378 b_and!16471)))

(declare-fun c!54584 () Bool)

(declare-datatypes ((V!14395 0))(
  ( (V!14396 (val!5028 Int)) )
))
(declare-fun minValue!515 () V!14395)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4640 0))(
  ( (ValueCellFull!4640 (v!7275 V!14395)) (EmptyCell!4640) )
))
(declare-datatypes ((array!23845 0))(
  ( (array!23846 (arr!11372 (Array (_ BitVec 32) ValueCell!4640)) (size!11724 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23845)

(declare-fun zeroValue!515 () V!14395)

(declare-datatypes ((array!23847 0))(
  ( (array!23848 (arr!11373 (Array (_ BitVec 32) (_ BitVec 64))) (size!11725 (_ BitVec 32))) )
))
(declare-fun lt!187481 () array!23847)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!6650 0))(
  ( (tuple2!6651 (_1!3336 (_ BitVec 64)) (_2!3336 V!14395)) )
))
(declare-datatypes ((List!6578 0))(
  ( (Nil!6575) (Cons!6574 (h!7430 tuple2!6650) (t!11752 List!6578)) )
))
(declare-datatypes ((ListLongMap!5563 0))(
  ( (ListLongMap!5564 (toList!2797 List!6578)) )
))
(declare-fun call!27919 () ListLongMap!5563)

(declare-fun v!412 () V!14395)

(declare-fun _keys!709 () array!23847)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!27916 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1016 (array!23847 array!23845 (_ BitVec 32) (_ BitVec 32) V!14395 V!14395 (_ BitVec 32) Int) ListLongMap!5563)

(assert (=> bm!27916 (= call!27919 (getCurrentListMapNoExtraKeys!1016 (ite c!54584 _keys!709 lt!187481) (ite c!54584 _values!549 (array!23846 (store (arr!11372 _values!549) i!563 (ValueCellFull!4640 v!412)) (size!11724 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398626 () Bool)

(declare-fun e!240897 () Bool)

(declare-fun e!240896 () Bool)

(declare-fun mapRes!16572 () Bool)

(assert (=> b!398626 (= e!240897 (and e!240896 mapRes!16572))))

(declare-fun condMapEmpty!16572 () Bool)

(declare-fun mapDefault!16572 () ValueCell!4640)

