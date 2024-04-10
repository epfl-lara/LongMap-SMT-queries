; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95980 () Bool)

(assert start!95980)

(declare-fun b_free!22633 () Bool)

(declare-fun b_next!22633 () Bool)

(assert (=> start!95980 (= b_free!22633 (not b_next!22633))))

(declare-fun tp!79748 () Bool)

(declare-fun b_and!35941 () Bool)

(assert (=> start!95980 (= tp!79748 b_and!35941)))

(declare-fun b!1087666 () Bool)

(declare-fun res!725372 () Bool)

(declare-fun e!621289 () Bool)

(assert (=> b!1087666 (=> (not res!725372) (not e!621289))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087666 (= res!725372 (validKeyInArray!0 k!904))))

(declare-fun b!1087667 () Bool)

(declare-fun e!621283 () Bool)

(assert (=> b!1087667 (= e!621283 true)))

(declare-datatypes ((V!40641 0))(
  ( (V!40642 (val!13374 Int)) )
))
(declare-datatypes ((tuple2!16974 0))(
  ( (tuple2!16975 (_1!8498 (_ BitVec 64)) (_2!8498 V!40641)) )
))
(declare-datatypes ((List!23561 0))(
  ( (Nil!23558) (Cons!23557 (h!24766 tuple2!16974) (t!33252 List!23561)) )
))
(declare-datatypes ((ListLongMap!14943 0))(
  ( (ListLongMap!14944 (toList!7487 List!23561)) )
))
(declare-fun lt!484117 () ListLongMap!14943)

(declare-fun lt!484120 () ListLongMap!14943)

(declare-fun -!812 (ListLongMap!14943 (_ BitVec 64)) ListLongMap!14943)

(assert (=> b!1087667 (= (-!812 lt!484117 k!904) lt!484120)))

(declare-datatypes ((Unit!35790 0))(
  ( (Unit!35791) )
))
(declare-fun lt!484114 () Unit!35790)

(declare-fun lt!484112 () ListLongMap!14943)

(declare-fun zeroValue!831 () V!40641)

(declare-fun addRemoveCommutativeForDiffKeys!43 (ListLongMap!14943 (_ BitVec 64) V!40641 (_ BitVec 64)) Unit!35790)

(assert (=> b!1087667 (= lt!484114 (addRemoveCommutativeForDiffKeys!43 lt!484112 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1087668 () Bool)

(declare-fun e!621288 () Bool)

(assert (=> b!1087668 (= e!621289 e!621288)))

(declare-fun res!725373 () Bool)

(assert (=> b!1087668 (=> (not res!725373) (not e!621288))))

(declare-datatypes ((array!70195 0))(
  ( (array!70196 (arr!33771 (Array (_ BitVec 32) (_ BitVec 64))) (size!34307 (_ BitVec 32))) )
))
(declare-fun lt!484123 () array!70195)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70195 (_ BitVec 32)) Bool)

(assert (=> b!1087668 (= res!725373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484123 mask!1414))))

(declare-fun _keys!1070 () array!70195)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087668 (= lt!484123 (array!70196 (store (arr!33771 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34307 _keys!1070)))))

(declare-fun b!1087669 () Bool)

(declare-fun e!621285 () Bool)

(declare-fun e!621290 () Bool)

(declare-fun mapRes!41707 () Bool)

(assert (=> b!1087669 (= e!621285 (and e!621290 mapRes!41707))))

(declare-fun condMapEmpty!41707 () Bool)

(declare-datatypes ((ValueCell!12608 0))(
  ( (ValueCellFull!12608 (v!15995 V!40641)) (EmptyCell!12608) )
))
(declare-datatypes ((array!70197 0))(
  ( (array!70198 (arr!33772 (Array (_ BitVec 32) ValueCell!12608)) (size!34308 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70197)

(declare-fun mapDefault!41707 () ValueCell!12608)

