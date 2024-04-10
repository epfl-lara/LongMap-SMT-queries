; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95932 () Bool)

(assert start!95932)

(declare-fun b_free!22585 () Bool)

(declare-fun b_next!22585 () Bool)

(assert (=> start!95932 (= b_free!22585 (not b_next!22585))))

(declare-fun tp!79603 () Bool)

(declare-fun b_and!35845 () Bool)

(assert (=> start!95932 (= tp!79603 b_and!35845)))

(declare-fun b!1086601 () Bool)

(declare-fun res!724576 () Bool)

(declare-fun e!620710 () Bool)

(assert (=> b!1086601 (=> (not res!724576) (not e!620710))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086601 (= res!724576 (validKeyInArray!0 k!904))))

(declare-fun b!1086602 () Bool)

(declare-fun e!620711 () Bool)

(declare-fun e!620708 () Bool)

(assert (=> b!1086602 (= e!620711 e!620708)))

(declare-fun res!724569 () Bool)

(assert (=> b!1086602 (=> res!724569 e!620708)))

(assert (=> b!1086602 (= res!724569 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40577 0))(
  ( (V!40578 (val!13350 Int)) )
))
(declare-datatypes ((tuple2!16936 0))(
  ( (tuple2!16937 (_1!8479 (_ BitVec 64)) (_2!8479 V!40577)) )
))
(declare-datatypes ((List!23525 0))(
  ( (Nil!23522) (Cons!23521 (h!24730 tuple2!16936) (t!33168 List!23525)) )
))
(declare-datatypes ((ListLongMap!14905 0))(
  ( (ListLongMap!14906 (toList!7468 List!23525)) )
))
(declare-fun lt!483037 () ListLongMap!14905)

(declare-fun lt!483032 () ListLongMap!14905)

(assert (=> b!1086602 (= lt!483037 lt!483032)))

(declare-fun lt!483045 () ListLongMap!14905)

(declare-fun -!794 (ListLongMap!14905 (_ BitVec 64)) ListLongMap!14905)

(assert (=> b!1086602 (= lt!483037 (-!794 lt!483045 k!904))))

(declare-fun lt!483042 () ListLongMap!14905)

(declare-datatypes ((Unit!35754 0))(
  ( (Unit!35755) )
))
(declare-fun lt!483031 () Unit!35754)

(declare-fun zeroValue!831 () V!40577)

(declare-fun addRemoveCommutativeForDiffKeys!31 (ListLongMap!14905 (_ BitVec 64) V!40577 (_ BitVec 64)) Unit!35754)

(assert (=> b!1086602 (= lt!483031 (addRemoveCommutativeForDiffKeys!31 lt!483042 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!483039 () ListLongMap!14905)

(declare-fun lt!483046 () tuple2!16936)

(declare-fun +!3275 (ListLongMap!14905 tuple2!16936) ListLongMap!14905)

(assert (=> b!1086602 (= lt!483039 (+!3275 lt!483032 lt!483046))))

(declare-fun lt!483033 () ListLongMap!14905)

(declare-fun lt!483043 () tuple2!16936)

(assert (=> b!1086602 (= lt!483032 (+!3275 lt!483033 lt!483043))))

(declare-fun lt!483044 () ListLongMap!14905)

(declare-fun lt!483041 () ListLongMap!14905)

(assert (=> b!1086602 (= lt!483044 lt!483041)))

(assert (=> b!1086602 (= lt!483041 (+!3275 lt!483045 lt!483046))))

(assert (=> b!1086602 (= lt!483045 (+!3275 lt!483042 lt!483043))))

(declare-fun lt!483035 () ListLongMap!14905)

(assert (=> b!1086602 (= lt!483039 (+!3275 (+!3275 lt!483035 lt!483043) lt!483046))))

(declare-fun minValue!831 () V!40577)

(assert (=> b!1086602 (= lt!483046 (tuple2!16937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086602 (= lt!483043 (tuple2!16937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086603 () Bool)

(declare-fun res!724577 () Bool)

(assert (=> b!1086603 (=> (not res!724577) (not e!620710))))

(declare-datatypes ((array!70107 0))(
  ( (array!70108 (arr!33727 (Array (_ BitVec 32) (_ BitVec 64))) (size!34263 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70107)

(declare-datatypes ((List!23526 0))(
  ( (Nil!23523) (Cons!23522 (h!24731 (_ BitVec 64)) (t!33169 List!23526)) )
))
(declare-fun arrayNoDuplicates!0 (array!70107 (_ BitVec 32) List!23526) Bool)

(assert (=> b!1086603 (= res!724577 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23523))))

(declare-fun b!1086605 () Bool)

(declare-fun e!620707 () Bool)

(declare-fun e!620712 () Bool)

(declare-fun mapRes!41635 () Bool)

(assert (=> b!1086605 (= e!620707 (and e!620712 mapRes!41635))))

(declare-fun condMapEmpty!41635 () Bool)

(declare-datatypes ((ValueCell!12584 0))(
  ( (ValueCellFull!12584 (v!15971 V!40577)) (EmptyCell!12584) )
))
(declare-datatypes ((array!70109 0))(
  ( (array!70110 (arr!33728 (Array (_ BitVec 32) ValueCell!12584)) (size!34264 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70109)

(declare-fun mapDefault!41635 () ValueCell!12584)

