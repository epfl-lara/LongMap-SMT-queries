; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38638 () Bool)

(assert start!38638)

(declare-fun b_free!9175 () Bool)

(declare-fun b_next!9175 () Bool)

(assert (=> start!38638 (= b_free!9175 (not b_next!9175))))

(declare-fun tp!32648 () Bool)

(declare-fun b_and!16561 () Bool)

(assert (=> start!38638 (= tp!32648 b_and!16561)))

(declare-fun b!400921 () Bool)

(declare-fun res!230730 () Bool)

(declare-fun e!241840 () Bool)

(assert (=> b!400921 (=> (not res!230730) (not e!241840))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400921 (= res!230730 (validMask!0 mask!1025))))

(declare-fun b!400922 () Bool)

(declare-fun e!241843 () Bool)

(assert (=> b!400922 (= e!241840 e!241843)))

(declare-fun res!230733 () Bool)

(assert (=> b!400922 (=> (not res!230733) (not e!241843))))

(declare-datatypes ((array!24023 0))(
  ( (array!24024 (arr!11461 (Array (_ BitVec 32) (_ BitVec 64))) (size!11813 (_ BitVec 32))) )
))
(declare-fun lt!187751 () array!24023)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24023 (_ BitVec 32)) Bool)

(assert (=> b!400922 (= res!230733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187751 mask!1025))))

(declare-fun _keys!709 () array!24023)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400922 (= lt!187751 (array!24024 (store (arr!11461 _keys!709) i!563 k!794) (size!11813 _keys!709)))))

(declare-fun b!400923 () Bool)

(declare-fun e!241841 () Bool)

(declare-fun e!241842 () Bool)

(declare-fun mapRes!16707 () Bool)

(assert (=> b!400923 (= e!241841 (and e!241842 mapRes!16707))))

(declare-fun condMapEmpty!16707 () Bool)

(declare-datatypes ((V!14515 0))(
  ( (V!14516 (val!5073 Int)) )
))
(declare-datatypes ((ValueCell!4685 0))(
  ( (ValueCellFull!4685 (v!7320 V!14515)) (EmptyCell!4685) )
))
(declare-datatypes ((array!24025 0))(
  ( (array!24026 (arr!11462 (Array (_ BitVec 32) ValueCell!4685)) (size!11814 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24025)

(declare-fun mapDefault!16707 () ValueCell!4685)

