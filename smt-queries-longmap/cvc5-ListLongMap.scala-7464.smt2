; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94692 () Bool)

(assert start!94692)

(declare-fun b_free!21961 () Bool)

(declare-fun b_next!21961 () Bool)

(assert (=> start!94692 (= b_free!21961 (not b_next!21961))))

(declare-fun tp!77338 () Bool)

(declare-fun b_and!34781 () Bool)

(assert (=> start!94692 (= tp!77338 b_and!34781)))

(declare-fun b!1070637 () Bool)

(declare-fun e!611192 () Bool)

(declare-datatypes ((array!68517 0))(
  ( (array!68518 (arr!32955 (Array (_ BitVec 32) (_ BitVec 64))) (size!33491 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68517)

(assert (=> b!1070637 (= e!611192 (bvsle #b00000000000000000000000000000000 (size!33491 _keys!1163)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39497 0))(
  ( (V!39498 (val!12936 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39497)

(declare-datatypes ((ValueCell!12182 0))(
  ( (ValueCellFull!12182 (v!15552 V!39497)) (EmptyCell!12182) )
))
(declare-datatypes ((array!68519 0))(
  ( (array!68520 (arr!32956 (Array (_ BitVec 32) ValueCell!12182)) (size!33492 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68519)

(declare-fun minValue!907 () V!39497)

(declare-fun defaultEntry!963 () Int)

(declare-datatypes ((tuple2!16454 0))(
  ( (tuple2!16455 (_1!8238 (_ BitVec 64)) (_2!8238 V!39497)) )
))
(declare-datatypes ((List!22998 0))(
  ( (Nil!22995) (Cons!22994 (h!24203 tuple2!16454) (t!32329 List!22998)) )
))
(declare-datatypes ((ListLongMap!14423 0))(
  ( (ListLongMap!14424 (toList!7227 List!22998)) )
))
(declare-fun lt!473170 () ListLongMap!14423)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4130 (array!68517 array!68519 (_ BitVec 32) (_ BitVec 32) V!39497 V!39497 (_ BitVec 32) Int) ListLongMap!14423)

(assert (=> b!1070637 (= lt!473170 (getCurrentListMap!4130 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070638 () Bool)

(declare-fun e!611194 () Bool)

(declare-fun e!611197 () Bool)

(declare-fun mapRes!40360 () Bool)

(assert (=> b!1070638 (= e!611194 (and e!611197 mapRes!40360))))

(declare-fun condMapEmpty!40360 () Bool)

(declare-fun mapDefault!40360 () ValueCell!12182)

