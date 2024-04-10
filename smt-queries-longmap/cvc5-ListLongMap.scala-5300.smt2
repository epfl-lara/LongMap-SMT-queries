; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71004 () Bool)

(assert start!71004)

(declare-fun b_free!13207 () Bool)

(declare-fun b_next!13207 () Bool)

(assert (=> start!71004 (= b_free!13207 (not b_next!13207))))

(declare-fun tp!46375 () Bool)

(declare-fun b_and!22111 () Bool)

(assert (=> start!71004 (= tp!46375 b_and!22111)))

(declare-fun b!824524 () Bool)

(declare-fun e!458751 () Bool)

(declare-fun e!458753 () Bool)

(assert (=> b!824524 (= e!458751 (not e!458753))))

(declare-fun res!562135 () Bool)

(assert (=> b!824524 (=> res!562135 e!458753)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824524 (= res!562135 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24891 0))(
  ( (V!24892 (val!7506 Int)) )
))
(declare-datatypes ((tuple2!9934 0))(
  ( (tuple2!9935 (_1!4978 (_ BitVec 64)) (_2!4978 V!24891)) )
))
(declare-datatypes ((List!15745 0))(
  ( (Nil!15742) (Cons!15741 (h!16870 tuple2!9934) (t!22088 List!15745)) )
))
(declare-datatypes ((ListLongMap!8757 0))(
  ( (ListLongMap!8758 (toList!4394 List!15745)) )
))
(declare-fun lt!371870 () ListLongMap!8757)

(declare-fun lt!371868 () ListLongMap!8757)

(assert (=> b!824524 (= lt!371870 lt!371868)))

(declare-fun zeroValueBefore!34 () V!24891)

(declare-datatypes ((array!46022 0))(
  ( (array!46023 (arr!22058 (Array (_ BitVec 32) (_ BitVec 64))) (size!22479 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46022)

(declare-fun zeroValueAfter!34 () V!24891)

(declare-fun minValue!754 () V!24891)

(declare-datatypes ((ValueCell!7043 0))(
  ( (ValueCellFull!7043 (v!9939 V!24891)) (EmptyCell!7043) )
))
(declare-datatypes ((array!46024 0))(
  ( (array!46025 (arr!22059 (Array (_ BitVec 32) ValueCell!7043)) (size!22480 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46024)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28256 0))(
  ( (Unit!28257) )
))
(declare-fun lt!371867 () Unit!28256)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!519 (array!46022 array!46024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24891 V!24891 V!24891 V!24891 (_ BitVec 32) Int) Unit!28256)

(assert (=> b!824524 (= lt!371867 (lemmaNoChangeToArrayThenSameMapNoExtras!519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2409 (array!46022 array!46024 (_ BitVec 32) (_ BitVec 32) V!24891 V!24891 (_ BitVec 32) Int) ListLongMap!8757)

(assert (=> b!824524 (= lt!371868 (getCurrentListMapNoExtraKeys!2409 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824524 (= lt!371870 (getCurrentListMapNoExtraKeys!2409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824526 () Bool)

(declare-fun e!458749 () Bool)

(declare-fun tp_is_empty!14917 () Bool)

(assert (=> b!824526 (= e!458749 tp_is_empty!14917)))

(declare-fun b!824527 () Bool)

(declare-fun e!458748 () Bool)

(assert (=> b!824527 (= e!458748 tp_is_empty!14917)))

(declare-fun b!824528 () Bool)

(declare-fun e!458752 () Bool)

(declare-fun mapRes!23995 () Bool)

(assert (=> b!824528 (= e!458752 (and e!458748 mapRes!23995))))

(declare-fun condMapEmpty!23995 () Bool)

(declare-fun mapDefault!23995 () ValueCell!7043)

