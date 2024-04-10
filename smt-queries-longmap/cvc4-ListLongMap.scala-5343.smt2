; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71406 () Bool)

(assert start!71406)

(declare-fun b_free!13469 () Bool)

(declare-fun b_next!13469 () Bool)

(assert (=> start!71406 (= b_free!13469 (not b_next!13469))))

(declare-fun tp!47185 () Bool)

(declare-fun b_and!22463 () Bool)

(assert (=> start!71406 (= tp!47185 b_and!22463)))

(declare-fun b!829292 () Bool)

(declare-fun e!462234 () Bool)

(declare-fun e!462233 () Bool)

(assert (=> b!829292 (= e!462234 (not e!462233))))

(declare-fun res!564970 () Bool)

(assert (=> b!829292 (=> res!564970 e!462233)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829292 (= res!564970 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun e!462239 () Bool)

(assert (=> b!829292 e!462239))

(declare-fun res!564966 () Bool)

(assert (=> b!829292 (=> (not res!564966) (not e!462239))))

(declare-datatypes ((V!25239 0))(
  ( (V!25240 (val!7637 Int)) )
))
(declare-datatypes ((tuple2!10128 0))(
  ( (tuple2!10129 (_1!5075 (_ BitVec 64)) (_2!5075 V!25239)) )
))
(declare-datatypes ((List!15921 0))(
  ( (Nil!15918) (Cons!15917 (h!17046 tuple2!10128) (t!22280 List!15921)) )
))
(declare-datatypes ((ListLongMap!8951 0))(
  ( (ListLongMap!8952 (toList!4491 List!15921)) )
))
(declare-fun lt!375990 () ListLongMap!8951)

(declare-fun lt!375989 () ListLongMap!8951)

(assert (=> b!829292 (= res!564966 (= lt!375990 lt!375989))))

(declare-fun zeroValueBefore!34 () V!25239)

(declare-datatypes ((array!46522 0))(
  ( (array!46523 (arr!22300 (Array (_ BitVec 32) (_ BitVec 64))) (size!22721 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46522)

(declare-fun zeroValueAfter!34 () V!25239)

(declare-fun minValue!754 () V!25239)

(declare-datatypes ((ValueCell!7174 0))(
  ( (ValueCellFull!7174 (v!10076 V!25239)) (EmptyCell!7174) )
))
(declare-datatypes ((array!46524 0))(
  ( (array!46525 (arr!22301 (Array (_ BitVec 32) ValueCell!7174)) (size!22722 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46524)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28403 0))(
  ( (Unit!28404) )
))
(declare-fun lt!375988 () Unit!28403)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!579 (array!46522 array!46524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25239 V!25239 V!25239 V!25239 (_ BitVec 32) Int) Unit!28403)

(assert (=> b!829292 (= lt!375988 (lemmaNoChangeToArrayThenSameMapNoExtras!579 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2491 (array!46522 array!46524 (_ BitVec 32) (_ BitVec 32) V!25239 V!25239 (_ BitVec 32) Int) ListLongMap!8951)

(assert (=> b!829292 (= lt!375989 (getCurrentListMapNoExtraKeys!2491 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829292 (= lt!375990 (getCurrentListMapNoExtraKeys!2491 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829293 () Bool)

(declare-fun getCurrentListMap!2591 (array!46522 array!46524 (_ BitVec 32) (_ BitVec 32) V!25239 V!25239 (_ BitVec 32) Int) ListLongMap!8951)

(declare-fun +!1972 (ListLongMap!8951 tuple2!10128) ListLongMap!8951)

(assert (=> b!829293 (= e!462233 (= (getCurrentListMap!2591 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1972 (+!1972 lt!375990 (tuple2!10129 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829294 () Bool)

(declare-fun e!462238 () Bool)

(assert (=> b!829294 (= e!462239 e!462238)))

(declare-fun res!564967 () Bool)

(assert (=> b!829294 (=> res!564967 e!462238)))

(assert (=> b!829294 (= res!564967 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829295 () Bool)

(declare-fun e!462237 () Bool)

(declare-fun e!462236 () Bool)

(declare-fun mapRes!24412 () Bool)

(assert (=> b!829295 (= e!462237 (and e!462236 mapRes!24412))))

(declare-fun condMapEmpty!24412 () Bool)

(declare-fun mapDefault!24412 () ValueCell!7174)

