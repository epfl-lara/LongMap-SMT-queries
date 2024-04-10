; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70386 () Bool)

(assert start!70386)

(declare-fun b_free!12743 () Bool)

(declare-fun b_next!12743 () Bool)

(assert (=> start!70386 (= b_free!12743 (not b_next!12743))))

(declare-fun tp!44955 () Bool)

(declare-fun b_and!21555 () Bool)

(assert (=> start!70386 (= tp!44955 b_and!21555)))

(declare-fun b!817656 () Bool)

(declare-fun e!453748 () Bool)

(declare-fun tp_is_empty!14453 () Bool)

(assert (=> b!817656 (= e!453748 tp_is_empty!14453)))

(declare-fun mapNonEmpty!23272 () Bool)

(declare-fun mapRes!23272 () Bool)

(declare-fun tp!44956 () Bool)

(declare-fun e!453749 () Bool)

(assert (=> mapNonEmpty!23272 (= mapRes!23272 (and tp!44956 e!453749))))

(declare-datatypes ((V!24271 0))(
  ( (V!24272 (val!7274 Int)) )
))
(declare-datatypes ((ValueCell!6811 0))(
  ( (ValueCellFull!6811 (v!9703 V!24271)) (EmptyCell!6811) )
))
(declare-fun mapRest!23272 () (Array (_ BitVec 32) ValueCell!6811))

(declare-datatypes ((array!45104 0))(
  ( (array!45105 (arr!21608 (Array (_ BitVec 32) ValueCell!6811)) (size!22029 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45104)

(declare-fun mapKey!23272 () (_ BitVec 32))

(declare-fun mapValue!23272 () ValueCell!6811)

(assert (=> mapNonEmpty!23272 (= (arr!21608 _values!788) (store mapRest!23272 mapKey!23272 mapValue!23272))))

(declare-fun b!817658 () Bool)

(declare-fun res!558103 () Bool)

(declare-fun e!453747 () Bool)

(assert (=> b!817658 (=> (not res!558103) (not e!453747))))

(declare-datatypes ((array!45106 0))(
  ( (array!45107 (arr!21609 (Array (_ BitVec 32) (_ BitVec 64))) (size!22030 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45106)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817658 (= res!558103 (and (= (size!22029 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22030 _keys!976) (size!22029 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817659 () Bool)

(assert (=> b!817659 (= e!453747 (not true))))

(declare-datatypes ((tuple2!9560 0))(
  ( (tuple2!9561 (_1!4791 (_ BitVec 64)) (_2!4791 V!24271)) )
))
(declare-datatypes ((List!15389 0))(
  ( (Nil!15386) (Cons!15385 (h!16514 tuple2!9560) (t!21714 List!15389)) )
))
(declare-datatypes ((ListLongMap!8383 0))(
  ( (ListLongMap!8384 (toList!4207 List!15389)) )
))
(declare-fun lt!366345 () ListLongMap!8383)

(declare-fun lt!366343 () ListLongMap!8383)

(assert (=> b!817659 (= lt!366345 lt!366343)))

(declare-fun zeroValueAfter!34 () V!24271)

(declare-fun minValue!754 () V!24271)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27898 0))(
  ( (Unit!27899) )
))
(declare-fun lt!366344 () Unit!27898)

(declare-fun zeroValueBefore!34 () V!24271)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!358 (array!45106 array!45104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24271 V!24271 V!24271 V!24271 (_ BitVec 32) Int) Unit!27898)

(assert (=> b!817659 (= lt!366344 (lemmaNoChangeToArrayThenSameMapNoExtras!358 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2248 (array!45106 array!45104 (_ BitVec 32) (_ BitVec 32) V!24271 V!24271 (_ BitVec 32) Int) ListLongMap!8383)

(assert (=> b!817659 (= lt!366343 (getCurrentListMapNoExtraKeys!2248 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817659 (= lt!366345 (getCurrentListMapNoExtraKeys!2248 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817660 () Bool)

(declare-fun res!558104 () Bool)

(assert (=> b!817660 (=> (not res!558104) (not e!453747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45106 (_ BitVec 32)) Bool)

(assert (=> b!817660 (= res!558104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817661 () Bool)

(assert (=> b!817661 (= e!453749 tp_is_empty!14453)))

(declare-fun mapIsEmpty!23272 () Bool)

(assert (=> mapIsEmpty!23272 mapRes!23272))

(declare-fun b!817662 () Bool)

(declare-fun e!453750 () Bool)

(assert (=> b!817662 (= e!453750 (and e!453748 mapRes!23272))))

(declare-fun condMapEmpty!23272 () Bool)

(declare-fun mapDefault!23272 () ValueCell!6811)

