; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38648 () Bool)

(assert start!38648)

(declare-fun b_free!9185 () Bool)

(declare-fun b_next!9185 () Bool)

(assert (=> start!38648 (= b_free!9185 (not b_next!9185))))

(declare-fun tp!32679 () Bool)

(declare-fun b_and!16571 () Bool)

(assert (=> start!38648 (= tp!32679 b_and!16571)))

(declare-fun b!401176 () Bool)

(declare-fun e!241949 () Bool)

(declare-datatypes ((V!14527 0))(
  ( (V!14528 (val!5078 Int)) )
))
(declare-datatypes ((tuple2!6736 0))(
  ( (tuple2!6737 (_1!3379 (_ BitVec 64)) (_2!3379 V!14527)) )
))
(declare-datatypes ((List!6660 0))(
  ( (Nil!6657) (Cons!6656 (h!7512 tuple2!6736) (t!11834 List!6660)) )
))
(declare-datatypes ((ListLongMap!5649 0))(
  ( (ListLongMap!5650 (toList!2840 List!6660)) )
))
(declare-fun call!28220 () ListLongMap!5649)

(declare-fun call!28219 () ListLongMap!5649)

(assert (=> b!401176 (= e!241949 (= call!28220 call!28219))))

(declare-fun b!401177 () Bool)

(declare-fun res!230904 () Bool)

(declare-fun e!241946 () Bool)

(assert (=> b!401177 (=> (not res!230904) (not e!241946))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401177 (= res!230904 (validMask!0 mask!1025))))

(declare-fun b!401178 () Bool)

(declare-fun e!241950 () Bool)

(declare-fun e!241948 () Bool)

(declare-fun mapRes!16722 () Bool)

(assert (=> b!401178 (= e!241950 (and e!241948 mapRes!16722))))

(declare-fun condMapEmpty!16722 () Bool)

(declare-datatypes ((ValueCell!4690 0))(
  ( (ValueCellFull!4690 (v!7325 V!14527)) (EmptyCell!4690) )
))
(declare-datatypes ((array!24043 0))(
  ( (array!24044 (arr!11471 (Array (_ BitVec 32) ValueCell!4690)) (size!11823 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24043)

(declare-fun mapDefault!16722 () ValueCell!4690)

