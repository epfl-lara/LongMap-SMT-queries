; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94894 () Bool)

(assert start!94894)

(declare-fun b_free!22099 () Bool)

(declare-fun b_next!22099 () Bool)

(assert (=> start!94894 (= b_free!22099 (not b_next!22099))))

(declare-fun tp!77761 () Bool)

(declare-fun b_and!34953 () Bool)

(assert (=> start!94894 (= tp!77761 b_and!34953)))

(declare-fun mapNonEmpty!40576 () Bool)

(declare-fun mapRes!40576 () Bool)

(declare-fun tp!77762 () Bool)

(declare-fun e!612935 () Bool)

(assert (=> mapNonEmpty!40576 (= mapRes!40576 (and tp!77762 e!612935))))

(declare-fun mapKey!40576 () (_ BitVec 32))

(declare-datatypes ((V!39681 0))(
  ( (V!39682 (val!13005 Int)) )
))
(declare-datatypes ((ValueCell!12251 0))(
  ( (ValueCellFull!12251 (v!15623 V!39681)) (EmptyCell!12251) )
))
(declare-fun mapValue!40576 () ValueCell!12251)

(declare-datatypes ((array!68783 0))(
  ( (array!68784 (arr!33085 (Array (_ BitVec 32) ValueCell!12251)) (size!33621 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68783)

(declare-fun mapRest!40576 () (Array (_ BitVec 32) ValueCell!12251))

(assert (=> mapNonEmpty!40576 (= (arr!33085 _values!955) (store mapRest!40576 mapKey!40576 mapValue!40576))))

(declare-fun b!1072985 () Bool)

(declare-fun e!612938 () Bool)

(declare-fun e!612937 () Bool)

(assert (=> b!1072985 (= e!612938 (and e!612937 mapRes!40576))))

(declare-fun condMapEmpty!40576 () Bool)

(declare-fun mapDefault!40576 () ValueCell!12251)

