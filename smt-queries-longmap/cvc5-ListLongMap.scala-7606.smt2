; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95956 () Bool)

(assert start!95956)

(declare-fun b_free!22609 () Bool)

(declare-fun b_next!22609 () Bool)

(assert (=> start!95956 (= b_free!22609 (not b_next!22609))))

(declare-fun tp!79675 () Bool)

(declare-fun b_and!35893 () Bool)

(assert (=> start!95956 (= tp!79675 b_and!35893)))

(declare-fun b!1087129 () Bool)

(declare-fun e!620997 () Bool)

(declare-fun tp_is_empty!26611 () Bool)

(assert (=> b!1087129 (= e!620997 tp_is_empty!26611)))

(declare-fun b!1087130 () Bool)

(declare-fun e!621001 () Bool)

(assert (=> b!1087130 (= e!621001 tp_is_empty!26611)))

(declare-fun b!1087131 () Bool)

(declare-fun e!620996 () Bool)

(declare-fun e!620995 () Bool)

(assert (=> b!1087131 (= e!620996 e!620995)))

(declare-fun res!724969 () Bool)

(assert (=> b!1087131 (=> res!724969 e!620995)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1087131 (= res!724969 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40609 0))(
  ( (V!40610 (val!13362 Int)) )
))
(declare-datatypes ((tuple2!16952 0))(
  ( (tuple2!16953 (_1!8487 (_ BitVec 64)) (_2!8487 V!40609)) )
))
(declare-datatypes ((List!23542 0))(
  ( (Nil!23539) (Cons!23538 (h!24747 tuple2!16952) (t!33209 List!23542)) )
))
(declare-datatypes ((ListLongMap!14921 0))(
  ( (ListLongMap!14922 (toList!7476 List!23542)) )
))
(declare-fun lt!483651 () ListLongMap!14921)

(declare-fun lt!483658 () ListLongMap!14921)

(assert (=> b!1087131 (= lt!483651 lt!483658)))

(declare-fun lt!483653 () ListLongMap!14921)

(declare-fun -!802 (ListLongMap!14921 (_ BitVec 64)) ListLongMap!14921)

(assert (=> b!1087131 (= lt!483651 (-!802 lt!483653 k!904))))

(declare-datatypes ((Unit!35770 0))(
  ( (Unit!35771) )
))
(declare-fun lt!483656 () Unit!35770)

(declare-fun lt!483650 () ListLongMap!14921)

(declare-fun zeroValue!831 () V!40609)

(declare-fun addRemoveCommutativeForDiffKeys!38 (ListLongMap!14921 (_ BitVec 64) V!40609 (_ BitVec 64)) Unit!35770)

(assert (=> b!1087131 (= lt!483656 (addRemoveCommutativeForDiffKeys!38 lt!483650 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!483655 () ListLongMap!14921)

(declare-fun lt!483645 () tuple2!16952)

(declare-fun +!3282 (ListLongMap!14921 tuple2!16952) ListLongMap!14921)

(assert (=> b!1087131 (= lt!483655 (+!3282 lt!483658 lt!483645))))

(declare-fun lt!483643 () ListLongMap!14921)

(declare-fun lt!483644 () tuple2!16952)

(assert (=> b!1087131 (= lt!483658 (+!3282 lt!483643 lt!483644))))

(declare-fun lt!483657 () ListLongMap!14921)

(declare-fun lt!483652 () ListLongMap!14921)

(assert (=> b!1087131 (= lt!483657 lt!483652)))

(assert (=> b!1087131 (= lt!483652 (+!3282 lt!483653 lt!483645))))

(assert (=> b!1087131 (= lt!483653 (+!3282 lt!483650 lt!483644))))

(declare-fun lt!483654 () ListLongMap!14921)

(assert (=> b!1087131 (= lt!483655 (+!3282 (+!3282 lt!483654 lt!483644) lt!483645))))

(declare-fun minValue!831 () V!40609)

(assert (=> b!1087131 (= lt!483645 (tuple2!16953 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087131 (= lt!483644 (tuple2!16953 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!724966 () Bool)

(declare-fun e!621000 () Bool)

(assert (=> start!95956 (=> (not res!724966) (not e!621000))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95956 (= res!724966 (validMask!0 mask!1414))))

(assert (=> start!95956 e!621000))

(assert (=> start!95956 tp!79675))

(assert (=> start!95956 true))

(assert (=> start!95956 tp_is_empty!26611))

(declare-datatypes ((array!70149 0))(
  ( (array!70150 (arr!33748 (Array (_ BitVec 32) (_ BitVec 64))) (size!34284 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70149)

(declare-fun array_inv!26034 (array!70149) Bool)

(assert (=> start!95956 (array_inv!26034 _keys!1070)))

(declare-datatypes ((ValueCell!12596 0))(
  ( (ValueCellFull!12596 (v!15983 V!40609)) (EmptyCell!12596) )
))
(declare-datatypes ((array!70151 0))(
  ( (array!70152 (arr!33749 (Array (_ BitVec 32) ValueCell!12596)) (size!34285 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70151)

(declare-fun e!620998 () Bool)

(declare-fun array_inv!26035 (array!70151) Bool)

(assert (=> start!95956 (and (array_inv!26035 _values!874) e!620998)))

(declare-fun b!1087132 () Bool)

(declare-fun mapRes!41671 () Bool)

(assert (=> b!1087132 (= e!620998 (and e!620997 mapRes!41671))))

(declare-fun condMapEmpty!41671 () Bool)

(declare-fun mapDefault!41671 () ValueCell!12596)

