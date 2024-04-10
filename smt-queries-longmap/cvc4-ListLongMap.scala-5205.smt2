; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70248 () Bool)

(assert start!70248)

(declare-fun b_free!12641 () Bool)

(declare-fun b_next!12641 () Bool)

(assert (=> start!70248 (= b_free!12641 (not b_next!12641))))

(declare-fun tp!44644 () Bool)

(declare-fun b_and!21429 () Bool)

(assert (=> start!70248 (= tp!44644 b_and!21429)))

(declare-fun b!816143 () Bool)

(declare-fun res!557256 () Bool)

(declare-fun e!452681 () Bool)

(assert (=> b!816143 (=> (not res!557256) (not e!452681))))

(declare-datatypes ((array!44902 0))(
  ( (array!44903 (arr!21509 (Array (_ BitVec 32) (_ BitVec 64))) (size!21930 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44902)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((V!24135 0))(
  ( (V!24136 (val!7223 Int)) )
))
(declare-datatypes ((ValueCell!6760 0))(
  ( (ValueCellFull!6760 (v!9650 V!24135)) (EmptyCell!6760) )
))
(declare-datatypes ((array!44904 0))(
  ( (array!44905 (arr!21510 (Array (_ BitVec 32) ValueCell!6760)) (size!21931 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44904)

(assert (=> b!816143 (= res!557256 (and (= (size!21931 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21930 _keys!976) (size!21931 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23113 () Bool)

(declare-fun mapRes!23113 () Bool)

(declare-fun tp!44643 () Bool)

(declare-fun e!452682 () Bool)

(assert (=> mapNonEmpty!23113 (= mapRes!23113 (and tp!44643 e!452682))))

(declare-fun mapKey!23113 () (_ BitVec 32))

(declare-fun mapRest!23113 () (Array (_ BitVec 32) ValueCell!6760))

(declare-fun mapValue!23113 () ValueCell!6760)

(assert (=> mapNonEmpty!23113 (= (arr!21510 _values!788) (store mapRest!23113 mapKey!23113 mapValue!23113))))

(declare-fun b!816144 () Bool)

(declare-fun e!452684 () Bool)

(assert (=> b!816144 (= e!452681 (not e!452684))))

(declare-fun res!557258 () Bool)

(assert (=> b!816144 (=> res!557258 e!452684)))

(assert (=> b!816144 (= res!557258 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9486 0))(
  ( (tuple2!9487 (_1!4754 (_ BitVec 64)) (_2!4754 V!24135)) )
))
(declare-datatypes ((List!15316 0))(
  ( (Nil!15313) (Cons!15312 (h!16441 tuple2!9486) (t!21637 List!15316)) )
))
(declare-datatypes ((ListLongMap!8309 0))(
  ( (ListLongMap!8310 (toList!4170 List!15316)) )
))
(declare-fun lt!365461 () ListLongMap!8309)

(declare-fun lt!365462 () ListLongMap!8309)

(assert (=> b!816144 (= lt!365461 lt!365462)))

(declare-datatypes ((Unit!27828 0))(
  ( (Unit!27829) )
))
(declare-fun lt!365460 () Unit!27828)

(declare-fun zeroValueBefore!34 () V!24135)

(declare-fun zeroValueAfter!34 () V!24135)

(declare-fun minValue!754 () V!24135)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!325 (array!44902 array!44904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24135 V!24135 V!24135 V!24135 (_ BitVec 32) Int) Unit!27828)

(assert (=> b!816144 (= lt!365460 (lemmaNoChangeToArrayThenSameMapNoExtras!325 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2215 (array!44902 array!44904 (_ BitVec 32) (_ BitVec 32) V!24135 V!24135 (_ BitVec 32) Int) ListLongMap!8309)

(assert (=> b!816144 (= lt!365462 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816144 (= lt!365461 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816145 () Bool)

(declare-fun e!452680 () Bool)

(declare-fun tp_is_empty!14351 () Bool)

(assert (=> b!816145 (= e!452680 tp_is_empty!14351)))

(declare-fun b!816146 () Bool)

(declare-fun res!557257 () Bool)

(assert (=> b!816146 (=> (not res!557257) (not e!452681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44902 (_ BitVec 32)) Bool)

(assert (=> b!816146 (= res!557257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816148 () Bool)

(assert (=> b!816148 (= e!452684 (bvsle #b00000000000000000000000000000000 (size!21930 _keys!976)))))

(declare-fun mapIsEmpty!23113 () Bool)

(assert (=> mapIsEmpty!23113 mapRes!23113))

(declare-fun b!816149 () Bool)

(declare-fun e!452679 () Bool)

(assert (=> b!816149 (= e!452679 (and e!452680 mapRes!23113))))

(declare-fun condMapEmpty!23113 () Bool)

(declare-fun mapDefault!23113 () ValueCell!6760)

