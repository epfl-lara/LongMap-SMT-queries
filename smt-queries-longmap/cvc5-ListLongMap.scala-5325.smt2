; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71210 () Bool)

(assert start!71210)

(declare-fun b_free!13357 () Bool)

(declare-fun b_next!13357 () Bool)

(assert (=> start!71210 (= b_free!13357 (not b_next!13357))))

(declare-fun tp!46833 () Bool)

(declare-fun b_and!22295 () Bool)

(assert (=> start!71210 (= tp!46833 b_and!22295)))

(declare-fun b!827197 () Bool)

(declare-fun e!460765 () Bool)

(declare-fun tp_is_empty!15067 () Bool)

(assert (=> b!827197 (= e!460765 tp_is_empty!15067)))

(declare-fun b!827198 () Bool)

(declare-fun res!563839 () Bool)

(declare-fun e!460769 () Bool)

(assert (=> b!827198 (=> (not res!563839) (not e!460769))))

(declare-datatypes ((array!46312 0))(
  ( (array!46313 (arr!22200 (Array (_ BitVec 32) (_ BitVec 64))) (size!22621 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46312)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46312 (_ BitVec 32)) Bool)

(assert (=> b!827198 (= res!563839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827199 () Bool)

(declare-fun e!460768 () Bool)

(assert (=> b!827199 (= e!460768 tp_is_empty!15067)))

(declare-fun res!563838 () Bool)

(assert (=> start!71210 (=> (not res!563838) (not e!460769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71210 (= res!563838 (validMask!0 mask!1312))))

(assert (=> start!71210 e!460769))

(assert (=> start!71210 tp_is_empty!15067))

(declare-fun array_inv!17693 (array!46312) Bool)

(assert (=> start!71210 (array_inv!17693 _keys!976)))

(assert (=> start!71210 true))

(declare-datatypes ((V!25091 0))(
  ( (V!25092 (val!7581 Int)) )
))
(declare-datatypes ((ValueCell!7118 0))(
  ( (ValueCellFull!7118 (v!10016 V!25091)) (EmptyCell!7118) )
))
(declare-datatypes ((array!46314 0))(
  ( (array!46315 (arr!22201 (Array (_ BitVec 32) ValueCell!7118)) (size!22622 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46314)

(declare-fun e!460767 () Bool)

(declare-fun array_inv!17694 (array!46314) Bool)

(assert (=> start!71210 (and (array_inv!17694 _values!788) e!460767)))

(assert (=> start!71210 tp!46833))

(declare-fun b!827200 () Bool)

(declare-fun mapRes!24229 () Bool)

(assert (=> b!827200 (= e!460767 (and e!460768 mapRes!24229))))

(declare-fun condMapEmpty!24229 () Bool)

(declare-fun mapDefault!24229 () ValueCell!7118)

