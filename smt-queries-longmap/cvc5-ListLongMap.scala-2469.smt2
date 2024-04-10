; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38632 () Bool)

(assert start!38632)

(declare-fun b_free!9169 () Bool)

(declare-fun b_next!9169 () Bool)

(assert (=> start!38632 (= b_free!9169 (not b_next!9169))))

(declare-fun tp!32631 () Bool)

(declare-fun b_and!16555 () Bool)

(assert (=> start!38632 (= tp!32631 b_and!16555)))

(declare-fun b!400768 () Bool)

(declare-fun res!230615 () Bool)

(declare-fun e!241781 () Bool)

(assert (=> b!400768 (=> (not res!230615) (not e!241781))))

(declare-datatypes ((array!24011 0))(
  ( (array!24012 (arr!11455 (Array (_ BitVec 32) (_ BitVec 64))) (size!11807 (_ BitVec 32))) )
))
(declare-fun lt!187732 () array!24011)

(declare-datatypes ((List!6648 0))(
  ( (Nil!6645) (Cons!6644 (h!7500 (_ BitVec 64)) (t!11822 List!6648)) )
))
(declare-fun arrayNoDuplicates!0 (array!24011 (_ BitVec 32) List!6648) Bool)

(assert (=> b!400768 (= res!230615 (arrayNoDuplicates!0 lt!187732 #b00000000000000000000000000000000 Nil!6645))))

(declare-fun b!400769 () Bool)

(assert (=> b!400769 (= e!241781 (not true))))

(declare-fun e!241779 () Bool)

(assert (=> b!400769 e!241779))

(declare-fun c!54710 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400769 (= c!54710 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14507 0))(
  ( (V!14508 (val!5070 Int)) )
))
(declare-fun minValue!515 () V!14507)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((Unit!12140 0))(
  ( (Unit!12141) )
))
(declare-fun lt!187733 () Unit!12140)

(declare-datatypes ((ValueCell!4682 0))(
  ( (ValueCellFull!4682 (v!7317 V!14507)) (EmptyCell!4682) )
))
(declare-datatypes ((array!24013 0))(
  ( (array!24014 (arr!11456 (Array (_ BitVec 32) ValueCell!4682)) (size!11808 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24013)

(declare-fun zeroValue!515 () V!14507)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!14507)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!24011)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!328 (array!24011 array!24013 (_ BitVec 32) (_ BitVec 32) V!14507 V!14507 (_ BitVec 32) (_ BitVec 64) V!14507 (_ BitVec 32) Int) Unit!12140)

(assert (=> b!400769 (= lt!187733 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!328 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400770 () Bool)

(declare-fun e!241776 () Bool)

(declare-fun e!241778 () Bool)

(declare-fun mapRes!16698 () Bool)

(assert (=> b!400770 (= e!241776 (and e!241778 mapRes!16698))))

(declare-fun condMapEmpty!16698 () Bool)

(declare-fun mapDefault!16698 () ValueCell!4682)

