; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95930 () Bool)

(assert start!95930)

(declare-fun b_free!22583 () Bool)

(declare-fun b_next!22583 () Bool)

(assert (=> start!95930 (= b_free!22583 (not b_next!22583))))

(declare-fun tp!79597 () Bool)

(declare-fun b_and!35841 () Bool)

(assert (=> start!95930 (= tp!79597 b_and!35841)))

(declare-fun b!1086557 () Bool)

(declare-fun res!724545 () Bool)

(declare-fun e!620689 () Bool)

(assert (=> b!1086557 (=> (not res!724545) (not e!620689))))

(declare-datatypes ((array!70103 0))(
  ( (array!70104 (arr!33725 (Array (_ BitVec 32) (_ BitVec 64))) (size!34261 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70103)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086557 (= res!724545 (= (select (arr!33725 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!41632 () Bool)

(declare-fun mapRes!41632 () Bool)

(declare-fun tp!79598 () Bool)

(declare-fun e!620686 () Bool)

(assert (=> mapNonEmpty!41632 (= mapRes!41632 (and tp!79598 e!620686))))

(declare-datatypes ((V!40573 0))(
  ( (V!40574 (val!13349 Int)) )
))
(declare-datatypes ((ValueCell!12583 0))(
  ( (ValueCellFull!12583 (v!15970 V!40573)) (EmptyCell!12583) )
))
(declare-datatypes ((array!70105 0))(
  ( (array!70106 (arr!33726 (Array (_ BitVec 32) ValueCell!12583)) (size!34262 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70105)

(declare-fun mapRest!41632 () (Array (_ BitVec 32) ValueCell!12583))

(declare-fun mapKey!41632 () (_ BitVec 32))

(declare-fun mapValue!41632 () ValueCell!12583)

(assert (=> mapNonEmpty!41632 (= (arr!33726 _values!874) (store mapRest!41632 mapKey!41632 mapValue!41632))))

(declare-fun b!1086558 () Bool)

(declare-fun res!724536 () Bool)

(assert (=> b!1086558 (=> (not res!724536) (not e!620689))))

(assert (=> b!1086558 (= res!724536 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34261 _keys!1070))))))

(declare-fun b!1086559 () Bool)

(declare-fun e!620687 () Bool)

(assert (=> b!1086559 (= e!620687 true)))

(declare-datatypes ((tuple2!16934 0))(
  ( (tuple2!16935 (_1!8478 (_ BitVec 64)) (_2!8478 V!40573)) )
))
(declare-fun lt!482994 () tuple2!16934)

(declare-datatypes ((List!23524 0))(
  ( (Nil!23521) (Cons!23520 (h!24729 tuple2!16934) (t!33165 List!23524)) )
))
(declare-datatypes ((ListLongMap!14903 0))(
  ( (ListLongMap!14904 (toList!7467 List!23524)) )
))
(declare-fun lt!482992 () ListLongMap!14903)

(declare-fun lt!482987 () ListLongMap!14903)

(declare-fun -!793 (ListLongMap!14903 (_ BitVec 64)) ListLongMap!14903)

(declare-fun +!3274 (ListLongMap!14903 tuple2!16934) ListLongMap!14903)

(assert (=> b!1086559 (= (-!793 lt!482987 k!904) (+!3274 lt!482992 lt!482994))))

(declare-fun minValue!831 () V!40573)

(declare-datatypes ((Unit!35752 0))(
  ( (Unit!35753) )
))
(declare-fun lt!482988 () Unit!35752)

(declare-fun lt!482986 () ListLongMap!14903)

(declare-fun addRemoveCommutativeForDiffKeys!30 (ListLongMap!14903 (_ BitVec 64) V!40573 (_ BitVec 64)) Unit!35752)

(assert (=> b!1086559 (= lt!482988 (addRemoveCommutativeForDiffKeys!30 lt!482986 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1086560 () Bool)

(declare-fun e!620688 () Bool)

(declare-fun e!620683 () Bool)

(assert (=> b!1086560 (= e!620688 (and e!620683 mapRes!41632))))

(declare-fun condMapEmpty!41632 () Bool)

(declare-fun mapDefault!41632 () ValueCell!12583)

