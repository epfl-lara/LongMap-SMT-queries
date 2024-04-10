; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70706 () Bool)

(assert start!70706)

(declare-fun b_free!12979 () Bool)

(declare-fun b_next!12979 () Bool)

(assert (=> start!70706 (= b_free!12979 (not b_next!12979))))

(declare-fun tp!45678 () Bool)

(declare-fun b_and!21841 () Bool)

(assert (=> start!70706 (= tp!45678 b_and!21841)))

(declare-fun b!821265 () Bool)

(declare-fun res!560248 () Bool)

(declare-fun e!456394 () Bool)

(assert (=> b!821265 (=> (not res!560248) (not e!456394))))

(declare-datatypes ((array!45574 0))(
  ( (array!45575 (arr!21838 (Array (_ BitVec 32) (_ BitVec 64))) (size!22259 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45574)

(declare-datatypes ((List!15568 0))(
  ( (Nil!15565) (Cons!15564 (h!16693 (_ BitVec 64)) (t!21903 List!15568)) )
))
(declare-fun arrayNoDuplicates!0 (array!45574 (_ BitVec 32) List!15568) Bool)

(assert (=> b!821265 (= res!560248 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15565))))

(declare-fun mapNonEmpty!23641 () Bool)

(declare-fun mapRes!23641 () Bool)

(declare-fun tp!45679 () Bool)

(declare-fun e!456395 () Bool)

(assert (=> mapNonEmpty!23641 (= mapRes!23641 (and tp!45679 e!456395))))

(declare-fun mapKey!23641 () (_ BitVec 32))

(declare-datatypes ((V!24587 0))(
  ( (V!24588 (val!7392 Int)) )
))
(declare-datatypes ((ValueCell!6929 0))(
  ( (ValueCellFull!6929 (v!9823 V!24587)) (EmptyCell!6929) )
))
(declare-datatypes ((array!45576 0))(
  ( (array!45577 (arr!21839 (Array (_ BitVec 32) ValueCell!6929)) (size!22260 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45576)

(declare-fun mapValue!23641 () ValueCell!6929)

(declare-fun mapRest!23641 () (Array (_ BitVec 32) ValueCell!6929))

(assert (=> mapNonEmpty!23641 (= (arr!21839 _values!788) (store mapRest!23641 mapKey!23641 mapValue!23641))))

(declare-fun b!821266 () Bool)

(declare-fun e!456393 () Bool)

(declare-fun tp_is_empty!14689 () Bool)

(assert (=> b!821266 (= e!456393 tp_is_empty!14689)))

(declare-fun b!821267 () Bool)

(declare-fun e!456398 () Bool)

(assert (=> b!821267 (= e!456394 (not e!456398))))

(declare-fun res!560250 () Bool)

(assert (=> b!821267 (=> res!560250 e!456398)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821267 (= res!560250 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9750 0))(
  ( (tuple2!9751 (_1!4886 (_ BitVec 64)) (_2!4886 V!24587)) )
))
(declare-datatypes ((List!15569 0))(
  ( (Nil!15566) (Cons!15565 (h!16694 tuple2!9750) (t!21904 List!15569)) )
))
(declare-datatypes ((ListLongMap!8573 0))(
  ( (ListLongMap!8574 (toList!4302 List!15569)) )
))
(declare-fun lt!369136 () ListLongMap!8573)

(declare-fun lt!369135 () ListLongMap!8573)

(assert (=> b!821267 (= lt!369136 lt!369135)))

(declare-fun zeroValueBefore!34 () V!24587)

(declare-fun zeroValueAfter!34 () V!24587)

(declare-fun minValue!754 () V!24587)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28081 0))(
  ( (Unit!28082) )
))
(declare-fun lt!369137 () Unit!28081)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!438 (array!45574 array!45576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24587 V!24587 V!24587 V!24587 (_ BitVec 32) Int) Unit!28081)

(assert (=> b!821267 (= lt!369137 (lemmaNoChangeToArrayThenSameMapNoExtras!438 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2328 (array!45574 array!45576 (_ BitVec 32) (_ BitVec 32) V!24587 V!24587 (_ BitVec 32) Int) ListLongMap!8573)

(assert (=> b!821267 (= lt!369135 (getCurrentListMapNoExtraKeys!2328 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821267 (= lt!369136 (getCurrentListMapNoExtraKeys!2328 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821268 () Bool)

(declare-fun res!560249 () Bool)

(assert (=> b!821268 (=> (not res!560249) (not e!456394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45574 (_ BitVec 32)) Bool)

(assert (=> b!821268 (= res!560249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23641 () Bool)

(assert (=> mapIsEmpty!23641 mapRes!23641))

(declare-fun res!560252 () Bool)

(assert (=> start!70706 (=> (not res!560252) (not e!456394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70706 (= res!560252 (validMask!0 mask!1312))))

(assert (=> start!70706 e!456394))

(assert (=> start!70706 tp_is_empty!14689))

(declare-fun array_inv!17455 (array!45574) Bool)

(assert (=> start!70706 (array_inv!17455 _keys!976)))

(assert (=> start!70706 true))

(declare-fun e!456397 () Bool)

(declare-fun array_inv!17456 (array!45576) Bool)

(assert (=> start!70706 (and (array_inv!17456 _values!788) e!456397)))

(assert (=> start!70706 tp!45678))

(declare-fun b!821269 () Bool)

(declare-fun res!560251 () Bool)

(assert (=> b!821269 (=> (not res!560251) (not e!456394))))

(assert (=> b!821269 (= res!560251 (and (= (size!22260 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22259 _keys!976) (size!22260 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821270 () Bool)

(assert (=> b!821270 (= e!456397 (and e!456393 mapRes!23641))))

(declare-fun condMapEmpty!23641 () Bool)

(declare-fun mapDefault!23641 () ValueCell!6929)

