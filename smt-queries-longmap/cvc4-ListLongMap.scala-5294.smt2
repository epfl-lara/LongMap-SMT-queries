; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70958 () Bool)

(assert start!70958)

(declare-fun b_free!13175 () Bool)

(declare-fun b_next!13175 () Bool)

(assert (=> start!70958 (= b_free!13175 (not b_next!13175))))

(declare-fun tp!46276 () Bool)

(declare-fun b_and!22071 () Bool)

(assert (=> start!70958 (= tp!46276 b_and!22071)))

(declare-fun b!824074 () Bool)

(declare-fun e!458425 () Bool)

(assert (=> b!824074 (= e!458425 (not true))))

(declare-datatypes ((V!24847 0))(
  ( (V!24848 (val!7490 Int)) )
))
(declare-datatypes ((tuple2!9910 0))(
  ( (tuple2!9911 (_1!4966 (_ BitVec 64)) (_2!4966 V!24847)) )
))
(declare-datatypes ((List!15721 0))(
  ( (Nil!15718) (Cons!15717 (h!16846 tuple2!9910) (t!22062 List!15721)) )
))
(declare-datatypes ((ListLongMap!8733 0))(
  ( (ListLongMap!8734 (toList!4382 List!15721)) )
))
(declare-fun lt!371654 () ListLongMap!8733)

(declare-fun lt!371655 () ListLongMap!8733)

(assert (=> b!824074 (= lt!371654 lt!371655)))

(declare-fun zeroValueBefore!34 () V!24847)

(declare-datatypes ((array!45958 0))(
  ( (array!45959 (arr!22027 (Array (_ BitVec 32) (_ BitVec 64))) (size!22448 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45958)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24847)

(declare-fun minValue!754 () V!24847)

(declare-datatypes ((ValueCell!7027 0))(
  ( (ValueCellFull!7027 (v!9923 V!24847)) (EmptyCell!7027) )
))
(declare-datatypes ((array!45960 0))(
  ( (array!45961 (arr!22028 (Array (_ BitVec 32) ValueCell!7027)) (size!22449 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45960)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28232 0))(
  ( (Unit!28233) )
))
(declare-fun lt!371656 () Unit!28232)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!507 (array!45958 array!45960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24847 V!24847 V!24847 V!24847 (_ BitVec 32) Int) Unit!28232)

(assert (=> b!824074 (= lt!371656 (lemmaNoChangeToArrayThenSameMapNoExtras!507 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2397 (array!45958 array!45960 (_ BitVec 32) (_ BitVec 32) V!24847 V!24847 (_ BitVec 32) Int) ListLongMap!8733)

(assert (=> b!824074 (= lt!371655 (getCurrentListMapNoExtraKeys!2397 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824074 (= lt!371654 (getCurrentListMapNoExtraKeys!2397 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23944 () Bool)

(declare-fun mapRes!23944 () Bool)

(assert (=> mapIsEmpty!23944 mapRes!23944))

(declare-fun mapNonEmpty!23944 () Bool)

(declare-fun tp!46275 () Bool)

(declare-fun e!458424 () Bool)

(assert (=> mapNonEmpty!23944 (= mapRes!23944 (and tp!46275 e!458424))))

(declare-fun mapKey!23944 () (_ BitVec 32))

(declare-fun mapRest!23944 () (Array (_ BitVec 32) ValueCell!7027))

(declare-fun mapValue!23944 () ValueCell!7027)

(assert (=> mapNonEmpty!23944 (= (arr!22028 _values!788) (store mapRest!23944 mapKey!23944 mapValue!23944))))

(declare-fun b!824075 () Bool)

(declare-fun tp_is_empty!14885 () Bool)

(assert (=> b!824075 (= e!458424 tp_is_empty!14885)))

(declare-fun b!824077 () Bool)

(declare-fun e!458427 () Bool)

(declare-fun e!458426 () Bool)

(assert (=> b!824077 (= e!458427 (and e!458426 mapRes!23944))))

(declare-fun condMapEmpty!23944 () Bool)

(declare-fun mapDefault!23944 () ValueCell!7027)

