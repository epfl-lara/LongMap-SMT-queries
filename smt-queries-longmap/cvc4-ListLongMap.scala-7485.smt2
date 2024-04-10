; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94886 () Bool)

(assert start!94886)

(declare-fun b_free!22091 () Bool)

(declare-fun b_next!22091 () Bool)

(assert (=> start!94886 (= b_free!22091 (not b_next!22091))))

(declare-fun tp!77738 () Bool)

(declare-fun b_and!34945 () Bool)

(assert (=> start!94886 (= tp!77738 b_and!34945)))

(declare-fun mapIsEmpty!40564 () Bool)

(declare-fun mapRes!40564 () Bool)

(assert (=> mapIsEmpty!40564 mapRes!40564))

(declare-fun b!1072901 () Bool)

(declare-fun e!612874 () Bool)

(declare-fun tp_is_empty!25901 () Bool)

(assert (=> b!1072901 (= e!612874 tp_is_empty!25901)))

(declare-fun mapNonEmpty!40564 () Bool)

(declare-fun tp!77737 () Bool)

(assert (=> mapNonEmpty!40564 (= mapRes!40564 (and tp!77737 e!612874))))

(declare-datatypes ((V!39669 0))(
  ( (V!39670 (val!13001 Int)) )
))
(declare-datatypes ((ValueCell!12247 0))(
  ( (ValueCellFull!12247 (v!15619 V!39669)) (EmptyCell!12247) )
))
(declare-fun mapValue!40564 () ValueCell!12247)

(declare-fun mapKey!40564 () (_ BitVec 32))

(declare-datatypes ((array!68769 0))(
  ( (array!68770 (arr!33078 (Array (_ BitVec 32) ValueCell!12247)) (size!33614 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68769)

(declare-fun mapRest!40564 () (Array (_ BitVec 32) ValueCell!12247))

(assert (=> mapNonEmpty!40564 (= (arr!33078 _values!955) (store mapRest!40564 mapKey!40564 mapValue!40564))))

(declare-fun b!1072902 () Bool)

(declare-fun e!612877 () Bool)

(declare-fun e!612875 () Bool)

(assert (=> b!1072902 (= e!612877 (and e!612875 mapRes!40564))))

(declare-fun condMapEmpty!40564 () Bool)

(declare-fun mapDefault!40564 () ValueCell!12247)

