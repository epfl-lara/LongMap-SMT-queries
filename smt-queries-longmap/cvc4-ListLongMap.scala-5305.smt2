; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71038 () Bool)

(assert start!71038)

(declare-fun b_free!13241 () Bool)

(declare-fun b_next!13241 () Bool)

(assert (=> start!71038 (= b_free!13241 (not b_next!13241))))

(declare-fun tp!46476 () Bool)

(declare-fun b_and!22145 () Bool)

(assert (=> start!71038 (= tp!46476 b_and!22145)))

(declare-fun res!562388 () Bool)

(declare-fun e!459058 () Bool)

(assert (=> start!71038 (=> (not res!562388) (not e!459058))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71038 (= res!562388 (validMask!0 mask!1312))))

(assert (=> start!71038 e!459058))

(declare-fun tp_is_empty!14951 () Bool)

(assert (=> start!71038 tp_is_empty!14951))

(declare-datatypes ((array!46090 0))(
  ( (array!46091 (arr!22092 (Array (_ BitVec 32) (_ BitVec 64))) (size!22513 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46090)

(declare-fun array_inv!17619 (array!46090) Bool)

(assert (=> start!71038 (array_inv!17619 _keys!976)))

(assert (=> start!71038 true))

(declare-datatypes ((V!24935 0))(
  ( (V!24936 (val!7523 Int)) )
))
(declare-datatypes ((ValueCell!7060 0))(
  ( (ValueCellFull!7060 (v!9956 V!24935)) (EmptyCell!7060) )
))
(declare-datatypes ((array!46092 0))(
  ( (array!46093 (arr!22093 (Array (_ BitVec 32) ValueCell!7060)) (size!22514 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46092)

(declare-fun e!459057 () Bool)

(declare-fun array_inv!17620 (array!46092) Bool)

(assert (=> start!71038 (and (array_inv!17620 _values!788) e!459057)))

(assert (=> start!71038 tp!46476))

(declare-fun b!824932 () Bool)

(declare-fun res!562390 () Bool)

(assert (=> b!824932 (=> (not res!562390) (not e!459058))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824932 (= res!562390 (and (= (size!22514 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22513 _keys!976) (size!22514 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24046 () Bool)

(declare-fun mapRes!24046 () Bool)

(declare-fun tp!46477 () Bool)

(declare-fun e!459055 () Bool)

(assert (=> mapNonEmpty!24046 (= mapRes!24046 (and tp!46477 e!459055))))

(declare-fun mapRest!24046 () (Array (_ BitVec 32) ValueCell!7060))

(declare-fun mapKey!24046 () (_ BitVec 32))

(declare-fun mapValue!24046 () ValueCell!7060)

(assert (=> mapNonEmpty!24046 (= (arr!22093 _values!788) (store mapRest!24046 mapKey!24046 mapValue!24046))))

(declare-fun b!824933 () Bool)

(declare-fun e!459056 () Bool)

(assert (=> b!824933 (= e!459057 (and e!459056 mapRes!24046))))

(declare-fun condMapEmpty!24046 () Bool)

(declare-fun mapDefault!24046 () ValueCell!7060)

