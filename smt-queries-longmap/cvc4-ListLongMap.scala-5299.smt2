; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71002 () Bool)

(assert start!71002)

(declare-fun b_free!13205 () Bool)

(declare-fun b_next!13205 () Bool)

(assert (=> start!71002 (= b_free!13205 (not b_next!13205))))

(declare-fun tp!46368 () Bool)

(declare-fun b_and!22109 () Bool)

(assert (=> start!71002 (= tp!46368 b_and!22109)))

(declare-fun mapNonEmpty!23992 () Bool)

(declare-fun mapRes!23992 () Bool)

(declare-fun tp!46369 () Bool)

(declare-fun e!458730 () Bool)

(assert (=> mapNonEmpty!23992 (= mapRes!23992 (and tp!46369 e!458730))))

(declare-datatypes ((V!24887 0))(
  ( (V!24888 (val!7505 Int)) )
))
(declare-datatypes ((ValueCell!7042 0))(
  ( (ValueCellFull!7042 (v!9938 V!24887)) (EmptyCell!7042) )
))
(declare-datatypes ((array!46018 0))(
  ( (array!46019 (arr!22056 (Array (_ BitVec 32) ValueCell!7042)) (size!22477 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46018)

(declare-fun mapKey!23992 () (_ BitVec 32))

(declare-fun mapValue!23992 () ValueCell!7042)

(declare-fun mapRest!23992 () (Array (_ BitVec 32) ValueCell!7042))

(assert (=> mapNonEmpty!23992 (= (arr!22056 _values!788) (store mapRest!23992 mapKey!23992 mapValue!23992))))

(declare-fun b!824500 () Bool)

(declare-fun e!458734 () Bool)

(declare-fun e!458733 () Bool)

(assert (=> b!824500 (= e!458734 (not e!458733))))

(declare-fun res!562119 () Bool)

(assert (=> b!824500 (=> res!562119 e!458733)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824500 (= res!562119 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9932 0))(
  ( (tuple2!9933 (_1!4977 (_ BitVec 64)) (_2!4977 V!24887)) )
))
(declare-datatypes ((List!15744 0))(
  ( (Nil!15741) (Cons!15740 (h!16869 tuple2!9932) (t!22087 List!15744)) )
))
(declare-datatypes ((ListLongMap!8755 0))(
  ( (ListLongMap!8756 (toList!4393 List!15744)) )
))
(declare-fun lt!371856 () ListLongMap!8755)

(declare-fun lt!371855 () ListLongMap!8755)

(assert (=> b!824500 (= lt!371856 lt!371855)))

(declare-fun zeroValueBefore!34 () V!24887)

(declare-fun zeroValueAfter!34 () V!24887)

(declare-fun minValue!754 () V!24887)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!46020 0))(
  ( (array!46021 (arr!22057 (Array (_ BitVec 32) (_ BitVec 64))) (size!22478 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46020)

(declare-datatypes ((Unit!28254 0))(
  ( (Unit!28255) )
))
(declare-fun lt!371857 () Unit!28254)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!518 (array!46020 array!46018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24887 V!24887 V!24887 V!24887 (_ BitVec 32) Int) Unit!28254)

(assert (=> b!824500 (= lt!371857 (lemmaNoChangeToArrayThenSameMapNoExtras!518 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2408 (array!46020 array!46018 (_ BitVec 32) (_ BitVec 32) V!24887 V!24887 (_ BitVec 32) Int) ListLongMap!8755)

(assert (=> b!824500 (= lt!371855 (getCurrentListMapNoExtraKeys!2408 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824500 (= lt!371856 (getCurrentListMapNoExtraKeys!2408 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824501 () Bool)

(declare-fun e!458732 () Bool)

(declare-fun tp_is_empty!14915 () Bool)

(assert (=> b!824501 (= e!458732 tp_is_empty!14915)))

(declare-fun b!824502 () Bool)

(declare-fun res!562118 () Bool)

(assert (=> b!824502 (=> (not res!562118) (not e!458734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46020 (_ BitVec 32)) Bool)

(assert (=> b!824502 (= res!562118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824503 () Bool)

(declare-fun res!562120 () Bool)

(assert (=> b!824503 (=> (not res!562120) (not e!458734))))

(assert (=> b!824503 (= res!562120 (and (= (size!22477 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22478 _keys!976) (size!22477 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824504 () Bool)

(declare-fun e!458731 () Bool)

(assert (=> b!824504 (= e!458731 (and e!458732 mapRes!23992))))

(declare-fun condMapEmpty!23992 () Bool)

(declare-fun mapDefault!23992 () ValueCell!7042)

