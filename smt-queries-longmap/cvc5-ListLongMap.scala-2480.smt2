; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38698 () Bool)

(assert start!38698)

(declare-fun b_free!9235 () Bool)

(declare-fun b_next!9235 () Bool)

(assert (=> start!38698 (= b_free!9235 (not b_next!9235))))

(declare-fun tp!32829 () Bool)

(declare-fun b_and!16621 () Bool)

(assert (=> start!38698 (= tp!32829 b_and!16621)))

(declare-fun b!402451 () Bool)

(declare-fun e!242474 () Bool)

(assert (=> b!402451 (= e!242474 (not true))))

(declare-fun e!242472 () Bool)

(assert (=> b!402451 e!242472))

(declare-fun c!54809 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402451 (= c!54809 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14595 0))(
  ( (V!14596 (val!5103 Int)) )
))
(declare-fun minValue!515 () V!14595)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4715 0))(
  ( (ValueCellFull!4715 (v!7350 V!14595)) (EmptyCell!4715) )
))
(declare-datatypes ((array!24139 0))(
  ( (array!24140 (arr!11519 (Array (_ BitVec 32) ValueCell!4715)) (size!11871 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24139)

(declare-fun zeroValue!515 () V!14595)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12184 0))(
  ( (Unit!12185) )
))
(declare-fun lt!187930 () Unit!12184)

(declare-fun v!412 () V!14595)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24141 0))(
  ( (array!24142 (arr!11520 (Array (_ BitVec 32) (_ BitVec 64))) (size!11872 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24141)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!350 (array!24141 array!24139 (_ BitVec 32) (_ BitVec 32) V!14595 V!14595 (_ BitVec 32) (_ BitVec 64) V!14595 (_ BitVec 32) Int) Unit!12184)

(assert (=> b!402451 (= lt!187930 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!350 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402452 () Bool)

(declare-fun res!231809 () Bool)

(declare-fun e!242470 () Bool)

(assert (=> b!402452 (=> (not res!231809) (not e!242470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402452 (= res!231809 (validMask!0 mask!1025))))

(declare-fun b!402453 () Bool)

(declare-fun res!231808 () Bool)

(assert (=> b!402453 (=> (not res!231808) (not e!242470))))

(declare-fun arrayContainsKey!0 (array!24141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402453 (= res!231808 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!402454 () Bool)

(declare-fun e!242473 () Bool)

(declare-fun e!242471 () Bool)

(declare-fun mapRes!16797 () Bool)

(assert (=> b!402454 (= e!242473 (and e!242471 mapRes!16797))))

(declare-fun condMapEmpty!16797 () Bool)

(declare-fun mapDefault!16797 () ValueCell!4715)

