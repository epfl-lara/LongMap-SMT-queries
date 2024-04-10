; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95974 () Bool)

(assert start!95974)

(declare-fun b_free!22627 () Bool)

(declare-fun b_next!22627 () Bool)

(assert (=> start!95974 (= b_free!22627 (not b_next!22627))))

(declare-fun tp!79729 () Bool)

(declare-fun b_and!35929 () Bool)

(assert (=> start!95974 (= tp!79729 b_and!35929)))

(declare-fun b!1087534 () Bool)

(declare-fun e!621211 () Bool)

(declare-fun tp_is_empty!26629 () Bool)

(assert (=> b!1087534 (= e!621211 tp_is_empty!26629)))

(declare-fun b!1087535 () Bool)

(declare-fun e!621212 () Bool)

(declare-fun e!621214 () Bool)

(declare-fun mapRes!41698 () Bool)

(assert (=> b!1087535 (= e!621212 (and e!621214 mapRes!41698))))

(declare-fun condMapEmpty!41698 () Bool)

(declare-datatypes ((V!40633 0))(
  ( (V!40634 (val!13371 Int)) )
))
(declare-datatypes ((ValueCell!12605 0))(
  ( (ValueCellFull!12605 (v!15992 V!40633)) (EmptyCell!12605) )
))
(declare-datatypes ((array!70185 0))(
  ( (array!70186 (arr!33766 (Array (_ BitVec 32) ValueCell!12605)) (size!34302 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70185)

(declare-fun mapDefault!41698 () ValueCell!12605)

