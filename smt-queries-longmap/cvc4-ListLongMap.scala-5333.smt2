; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71262 () Bool)

(assert start!71262)

(declare-fun b_free!13409 () Bool)

(declare-fun b_next!13409 () Bool)

(assert (=> start!71262 (= b_free!13409 (not b_next!13409))))

(declare-fun tp!46989 () Bool)

(declare-fun b_and!22347 () Bool)

(assert (=> start!71262 (= tp!46989 b_and!22347)))

(declare-fun b!827743 () Bool)

(declare-fun e!461159 () Bool)

(assert (=> b!827743 (= e!461159 false)))

(declare-datatypes ((array!46404 0))(
  ( (array!46405 (arr!22246 (Array (_ BitVec 32) (_ BitVec 64))) (size!22667 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46404)

(declare-datatypes ((V!25159 0))(
  ( (V!25160 (val!7607 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25159)

(declare-fun minValue!754 () V!25159)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10084 0))(
  ( (tuple2!10085 (_1!5053 (_ BitVec 64)) (_2!5053 V!25159)) )
))
(declare-datatypes ((List!15878 0))(
  ( (Nil!15875) (Cons!15874 (h!17003 tuple2!10084) (t!22227 List!15878)) )
))
(declare-datatypes ((ListLongMap!8907 0))(
  ( (ListLongMap!8908 (toList!4469 List!15878)) )
))
(declare-fun lt!374992 () ListLongMap!8907)

(declare-datatypes ((ValueCell!7144 0))(
  ( (ValueCellFull!7144 (v!10042 V!25159)) (EmptyCell!7144) )
))
(declare-datatypes ((array!46406 0))(
  ( (array!46407 (arr!22247 (Array (_ BitVec 32) ValueCell!7144)) (size!22668 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46406)

(declare-fun getCurrentListMapNoExtraKeys!2471 (array!46404 array!46406 (_ BitVec 32) (_ BitVec 32) V!25159 V!25159 (_ BitVec 32) Int) ListLongMap!8907)

(assert (=> b!827743 (= lt!374992 (getCurrentListMapNoExtraKeys!2471 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25159)

(declare-fun lt!374993 () ListLongMap!8907)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827743 (= lt!374993 (getCurrentListMapNoExtraKeys!2471 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827744 () Bool)

(declare-fun res!564149 () Bool)

(assert (=> b!827744 (=> (not res!564149) (not e!461159))))

(assert (=> b!827744 (= res!564149 (and (= (size!22668 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22667 _keys!976) (size!22668 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827745 () Bool)

(declare-fun e!461155 () Bool)

(declare-fun tp_is_empty!15119 () Bool)

(assert (=> b!827745 (= e!461155 tp_is_empty!15119)))

(declare-fun mapIsEmpty!24307 () Bool)

(declare-fun mapRes!24307 () Bool)

(assert (=> mapIsEmpty!24307 mapRes!24307))

(declare-fun b!827746 () Bool)

(declare-fun res!564151 () Bool)

(assert (=> b!827746 (=> (not res!564151) (not e!461159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46404 (_ BitVec 32)) Bool)

(assert (=> b!827746 (= res!564151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!564150 () Bool)

(assert (=> start!71262 (=> (not res!564150) (not e!461159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71262 (= res!564150 (validMask!0 mask!1312))))

(assert (=> start!71262 e!461159))

(assert (=> start!71262 tp_is_empty!15119))

(declare-fun array_inv!17725 (array!46404) Bool)

(assert (=> start!71262 (array_inv!17725 _keys!976)))

(assert (=> start!71262 true))

(declare-fun e!461156 () Bool)

(declare-fun array_inv!17726 (array!46406) Bool)

(assert (=> start!71262 (and (array_inv!17726 _values!788) e!461156)))

(assert (=> start!71262 tp!46989))

(declare-fun mapNonEmpty!24307 () Bool)

(declare-fun tp!46990 () Bool)

(assert (=> mapNonEmpty!24307 (= mapRes!24307 (and tp!46990 e!461155))))

(declare-fun mapRest!24307 () (Array (_ BitVec 32) ValueCell!7144))

(declare-fun mapValue!24307 () ValueCell!7144)

(declare-fun mapKey!24307 () (_ BitVec 32))

(assert (=> mapNonEmpty!24307 (= (arr!22247 _values!788) (store mapRest!24307 mapKey!24307 mapValue!24307))))

(declare-fun b!827747 () Bool)

(declare-fun e!461157 () Bool)

(assert (=> b!827747 (= e!461156 (and e!461157 mapRes!24307))))

(declare-fun condMapEmpty!24307 () Bool)

(declare-fun mapDefault!24307 () ValueCell!7144)

