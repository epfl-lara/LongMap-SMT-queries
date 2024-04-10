; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71252 () Bool)

(assert start!71252)

(declare-fun b_free!13399 () Bool)

(declare-fun b_next!13399 () Bool)

(assert (=> start!71252 (= b_free!13399 (not b_next!13399))))

(declare-fun tp!46960 () Bool)

(declare-fun b_and!22337 () Bool)

(assert (=> start!71252 (= tp!46960 b_and!22337)))

(declare-fun res!564090 () Bool)

(declare-fun e!461083 () Bool)

(assert (=> start!71252 (=> (not res!564090) (not e!461083))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71252 (= res!564090 (validMask!0 mask!1312))))

(assert (=> start!71252 e!461083))

(declare-fun tp_is_empty!15109 () Bool)

(assert (=> start!71252 tp_is_empty!15109))

(declare-datatypes ((array!46386 0))(
  ( (array!46387 (arr!22237 (Array (_ BitVec 32) (_ BitVec 64))) (size!22658 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46386)

(declare-fun array_inv!17719 (array!46386) Bool)

(assert (=> start!71252 (array_inv!17719 _keys!976)))

(assert (=> start!71252 true))

(declare-datatypes ((V!25147 0))(
  ( (V!25148 (val!7602 Int)) )
))
(declare-datatypes ((ValueCell!7139 0))(
  ( (ValueCellFull!7139 (v!10037 V!25147)) (EmptyCell!7139) )
))
(declare-datatypes ((array!46388 0))(
  ( (array!46389 (arr!22238 (Array (_ BitVec 32) ValueCell!7139)) (size!22659 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46388)

(declare-fun e!461082 () Bool)

(declare-fun array_inv!17720 (array!46388) Bool)

(assert (=> start!71252 (and (array_inv!17720 _values!788) e!461082)))

(assert (=> start!71252 tp!46960))

(declare-fun mapIsEmpty!24292 () Bool)

(declare-fun mapRes!24292 () Bool)

(assert (=> mapIsEmpty!24292 mapRes!24292))

(declare-fun mapNonEmpty!24292 () Bool)

(declare-fun tp!46959 () Bool)

(declare-fun e!461081 () Bool)

(assert (=> mapNonEmpty!24292 (= mapRes!24292 (and tp!46959 e!461081))))

(declare-fun mapKey!24292 () (_ BitVec 32))

(declare-fun mapRest!24292 () (Array (_ BitVec 32) ValueCell!7139))

(declare-fun mapValue!24292 () ValueCell!7139)

(assert (=> mapNonEmpty!24292 (= (arr!22238 _values!788) (store mapRest!24292 mapKey!24292 mapValue!24292))))

(declare-fun b!827638 () Bool)

(assert (=> b!827638 (= e!461083 false)))

(declare-datatypes ((tuple2!10076 0))(
  ( (tuple2!10077 (_1!5049 (_ BitVec 64)) (_2!5049 V!25147)) )
))
(declare-datatypes ((List!15872 0))(
  ( (Nil!15869) (Cons!15868 (h!16997 tuple2!10076) (t!22221 List!15872)) )
))
(declare-datatypes ((ListLongMap!8899 0))(
  ( (ListLongMap!8900 (toList!4465 List!15872)) )
))
(declare-fun lt!374962 () ListLongMap!8899)

(declare-fun zeroValueAfter!34 () V!25147)

(declare-fun minValue!754 () V!25147)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2467 (array!46386 array!46388 (_ BitVec 32) (_ BitVec 32) V!25147 V!25147 (_ BitVec 32) Int) ListLongMap!8899)

(assert (=> b!827638 (= lt!374962 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25147)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374963 () ListLongMap!8899)

(assert (=> b!827638 (= lt!374963 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827639 () Bool)

(declare-fun e!461080 () Bool)

(assert (=> b!827639 (= e!461080 tp_is_empty!15109)))

(declare-fun b!827640 () Bool)

(assert (=> b!827640 (= e!461082 (and e!461080 mapRes!24292))))

(declare-fun condMapEmpty!24292 () Bool)

(declare-fun mapDefault!24292 () ValueCell!7139)

