; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71232 () Bool)

(assert start!71232)

(declare-fun b_free!13379 () Bool)

(declare-fun b_next!13379 () Bool)

(assert (=> start!71232 (= b_free!13379 (not b_next!13379))))

(declare-fun tp!46899 () Bool)

(declare-fun b_and!22317 () Bool)

(assert (=> start!71232 (= tp!46899 b_and!22317)))

(declare-fun res!563972 () Bool)

(declare-fun e!460930 () Bool)

(assert (=> start!71232 (=> (not res!563972) (not e!460930))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71232 (= res!563972 (validMask!0 mask!1312))))

(assert (=> start!71232 e!460930))

(declare-fun tp_is_empty!15089 () Bool)

(assert (=> start!71232 tp_is_empty!15089))

(declare-datatypes ((array!46354 0))(
  ( (array!46355 (arr!22221 (Array (_ BitVec 32) (_ BitVec 64))) (size!22642 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46354)

(declare-fun array_inv!17707 (array!46354) Bool)

(assert (=> start!71232 (array_inv!17707 _keys!976)))

(assert (=> start!71232 true))

(declare-datatypes ((V!25119 0))(
  ( (V!25120 (val!7592 Int)) )
))
(declare-datatypes ((ValueCell!7129 0))(
  ( (ValueCellFull!7129 (v!10027 V!25119)) (EmptyCell!7129) )
))
(declare-datatypes ((array!46356 0))(
  ( (array!46357 (arr!22222 (Array (_ BitVec 32) ValueCell!7129)) (size!22643 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46356)

(declare-fun e!460933 () Bool)

(declare-fun array_inv!17708 (array!46356) Bool)

(assert (=> start!71232 (and (array_inv!17708 _values!788) e!460933)))

(assert (=> start!71232 tp!46899))

(declare-fun b!827428 () Bool)

(declare-fun res!563970 () Bool)

(assert (=> b!827428 (=> (not res!563970) (not e!460930))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827428 (= res!563970 (and (= (size!22643 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22642 _keys!976) (size!22643 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827429 () Bool)

(declare-fun res!563969 () Bool)

(assert (=> b!827429 (=> (not res!563969) (not e!460930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46354 (_ BitVec 32)) Bool)

(assert (=> b!827429 (= res!563969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827430 () Bool)

(assert (=> b!827430 (= e!460930 false)))

(declare-datatypes ((tuple2!10066 0))(
  ( (tuple2!10067 (_1!5044 (_ BitVec 64)) (_2!5044 V!25119)) )
))
(declare-datatypes ((List!15861 0))(
  ( (Nil!15858) (Cons!15857 (h!16986 tuple2!10066) (t!22210 List!15861)) )
))
(declare-datatypes ((ListLongMap!8889 0))(
  ( (ListLongMap!8890 (toList!4460 List!15861)) )
))
(declare-fun lt!374903 () ListLongMap!8889)

(declare-fun zeroValueAfter!34 () V!25119)

(declare-fun minValue!754 () V!25119)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2462 (array!46354 array!46356 (_ BitVec 32) (_ BitVec 32) V!25119 V!25119 (_ BitVec 32) Int) ListLongMap!8889)

(assert (=> b!827430 (= lt!374903 (getCurrentListMapNoExtraKeys!2462 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25119)

(declare-fun lt!374902 () ListLongMap!8889)

(assert (=> b!827430 (= lt!374902 (getCurrentListMapNoExtraKeys!2462 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24262 () Bool)

(declare-fun mapRes!24262 () Bool)

(declare-fun tp!46900 () Bool)

(declare-fun e!460934 () Bool)

(assert (=> mapNonEmpty!24262 (= mapRes!24262 (and tp!46900 e!460934))))

(declare-fun mapValue!24262 () ValueCell!7129)

(declare-fun mapRest!24262 () (Array (_ BitVec 32) ValueCell!7129))

(declare-fun mapKey!24262 () (_ BitVec 32))

(assert (=> mapNonEmpty!24262 (= (arr!22222 _values!788) (store mapRest!24262 mapKey!24262 mapValue!24262))))

(declare-fun b!827431 () Bool)

(assert (=> b!827431 (= e!460934 tp_is_empty!15089)))

(declare-fun b!827432 () Bool)

(declare-fun res!563971 () Bool)

(assert (=> b!827432 (=> (not res!563971) (not e!460930))))

(declare-datatypes ((List!15862 0))(
  ( (Nil!15859) (Cons!15858 (h!16987 (_ BitVec 64)) (t!22211 List!15862)) )
))
(declare-fun arrayNoDuplicates!0 (array!46354 (_ BitVec 32) List!15862) Bool)

(assert (=> b!827432 (= res!563971 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15859))))

(declare-fun mapIsEmpty!24262 () Bool)

(assert (=> mapIsEmpty!24262 mapRes!24262))

(declare-fun b!827433 () Bool)

(declare-fun e!460931 () Bool)

(assert (=> b!827433 (= e!460931 tp_is_empty!15089)))

(declare-fun b!827434 () Bool)

(assert (=> b!827434 (= e!460933 (and e!460931 mapRes!24262))))

(declare-fun condMapEmpty!24262 () Bool)

(declare-fun mapDefault!24262 () ValueCell!7129)

