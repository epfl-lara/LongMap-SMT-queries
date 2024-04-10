; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71208 () Bool)

(assert start!71208)

(declare-fun b_free!13355 () Bool)

(declare-fun b_next!13355 () Bool)

(assert (=> start!71208 (= b_free!13355 (not b_next!13355))))

(declare-fun tp!46827 () Bool)

(declare-fun b_and!22293 () Bool)

(assert (=> start!71208 (= tp!46827 b_and!22293)))

(declare-fun b!827176 () Bool)

(declare-fun e!460753 () Bool)

(declare-fun tp_is_empty!15065 () Bool)

(assert (=> b!827176 (= e!460753 tp_is_empty!15065)))

(declare-fun b!827177 () Bool)

(declare-fun e!460750 () Bool)

(assert (=> b!827177 (= e!460750 tp_is_empty!15065)))

(declare-fun b!827178 () Bool)

(declare-fun res!563825 () Bool)

(declare-fun e!460752 () Bool)

(assert (=> b!827178 (=> (not res!563825) (not e!460752))))

(declare-datatypes ((array!46308 0))(
  ( (array!46309 (arr!22198 (Array (_ BitVec 32) (_ BitVec 64))) (size!22619 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46308)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25087 0))(
  ( (V!25088 (val!7580 Int)) )
))
(declare-datatypes ((ValueCell!7117 0))(
  ( (ValueCellFull!7117 (v!10015 V!25087)) (EmptyCell!7117) )
))
(declare-datatypes ((array!46310 0))(
  ( (array!46311 (arr!22199 (Array (_ BitVec 32) ValueCell!7117)) (size!22620 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46310)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827178 (= res!563825 (and (= (size!22620 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22619 _keys!976) (size!22620 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827179 () Bool)

(declare-fun e!460751 () Bool)

(declare-fun mapRes!24226 () Bool)

(assert (=> b!827179 (= e!460751 (and e!460753 mapRes!24226))))

(declare-fun condMapEmpty!24226 () Bool)

(declare-fun mapDefault!24226 () ValueCell!7117)

