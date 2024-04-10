; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71142 () Bool)

(assert start!71142)

(declare-fun b_free!13309 () Bool)

(declare-fun b_next!13309 () Bool)

(assert (=> start!71142 (= b_free!13309 (not b_next!13309))))

(declare-fun tp!46686 () Bool)

(declare-fun b_and!22235 () Bool)

(assert (=> start!71142 (= tp!46686 b_and!22235)))

(declare-fun b!826304 () Bool)

(declare-fun res!563267 () Bool)

(declare-fun e!460098 () Bool)

(assert (=> b!826304 (=> (not res!563267) (not e!460098))))

(declare-datatypes ((array!46220 0))(
  ( (array!46221 (arr!22155 (Array (_ BitVec 32) (_ BitVec 64))) (size!22576 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46220)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25027 0))(
  ( (V!25028 (val!7557 Int)) )
))
(declare-datatypes ((ValueCell!7094 0))(
  ( (ValueCellFull!7094 (v!9991 V!25027)) (EmptyCell!7094) )
))
(declare-datatypes ((array!46222 0))(
  ( (array!46223 (arr!22156 (Array (_ BitVec 32) ValueCell!7094)) (size!22577 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46222)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826304 (= res!563267 (and (= (size!22577 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22576 _keys!976) (size!22577 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826305 () Bool)

(declare-fun res!563264 () Bool)

(assert (=> b!826305 (=> (not res!563264) (not e!460098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46220 (_ BitVec 32)) Bool)

(assert (=> b!826305 (= res!563264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826306 () Bool)

(declare-fun e!460094 () Bool)

(declare-fun e!460095 () Bool)

(declare-fun mapRes!24154 () Bool)

(assert (=> b!826306 (= e!460094 (and e!460095 mapRes!24154))))

(declare-fun condMapEmpty!24154 () Bool)

(declare-fun mapDefault!24154 () ValueCell!7094)

