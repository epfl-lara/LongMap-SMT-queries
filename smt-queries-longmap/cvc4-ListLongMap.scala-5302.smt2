; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71020 () Bool)

(assert start!71020)

(declare-fun b_free!13223 () Bool)

(declare-fun b_next!13223 () Bool)

(assert (=> start!71020 (= b_free!13223 (not b_next!13223))))

(declare-fun tp!46423 () Bool)

(declare-fun b_and!22127 () Bool)

(assert (=> start!71020 (= tp!46423 b_and!22127)))

(declare-fun b!824716 () Bool)

(declare-fun e!458893 () Bool)

(assert (=> b!824716 (= e!458893 true)))

(declare-datatypes ((V!24911 0))(
  ( (V!24912 (val!7514 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24911)

(declare-datatypes ((array!46054 0))(
  ( (array!46055 (arr!22074 (Array (_ BitVec 32) (_ BitVec 64))) (size!22495 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46054)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24911)

(declare-datatypes ((ValueCell!7051 0))(
  ( (ValueCellFull!7051 (v!9947 V!24911)) (EmptyCell!7051) )
))
(declare-datatypes ((array!46056 0))(
  ( (array!46057 (arr!22075 (Array (_ BitVec 32) ValueCell!7051)) (size!22496 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46056)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9946 0))(
  ( (tuple2!9947 (_1!4984 (_ BitVec 64)) (_2!4984 V!24911)) )
))
(declare-datatypes ((List!15755 0))(
  ( (Nil!15752) (Cons!15751 (h!16880 tuple2!9946) (t!22098 List!15755)) )
))
(declare-datatypes ((ListLongMap!8769 0))(
  ( (ListLongMap!8770 (toList!4400 List!15755)) )
))
(declare-fun lt!371966 () ListLongMap!8769)

(declare-fun getCurrentListMap!2539 (array!46054 array!46056 (_ BitVec 32) (_ BitVec 32) V!24911 V!24911 (_ BitVec 32) Int) ListLongMap!8769)

(assert (=> b!824716 (= lt!371966 (getCurrentListMap!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562256 () Bool)

(declare-fun e!458894 () Bool)

(assert (=> start!71020 (=> (not res!562256) (not e!458894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71020 (= res!562256 (validMask!0 mask!1312))))

(assert (=> start!71020 e!458894))

(declare-fun tp_is_empty!14933 () Bool)

(assert (=> start!71020 tp_is_empty!14933))

(declare-fun array_inv!17611 (array!46054) Bool)

(assert (=> start!71020 (array_inv!17611 _keys!976)))

(assert (=> start!71020 true))

(declare-fun e!458892 () Bool)

(declare-fun array_inv!17612 (array!46056) Bool)

(assert (=> start!71020 (and (array_inv!17612 _values!788) e!458892)))

(assert (=> start!71020 tp!46423))

(declare-fun b!824717 () Bool)

(declare-fun res!562253 () Bool)

(assert (=> b!824717 (=> (not res!562253) (not e!458894))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824717 (= res!562253 (and (= (size!22496 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22495 _keys!976) (size!22496 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824718 () Bool)

(assert (=> b!824718 (= e!458894 (not e!458893))))

(declare-fun res!562257 () Bool)

(assert (=> b!824718 (=> res!562257 e!458893)))

(assert (=> b!824718 (= res!562257 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371964 () ListLongMap!8769)

(declare-fun lt!371965 () ListLongMap!8769)

(assert (=> b!824718 (= lt!371964 lt!371965)))

(declare-fun zeroValueAfter!34 () V!24911)

(declare-datatypes ((Unit!28264 0))(
  ( (Unit!28265) )
))
(declare-fun lt!371963 () Unit!28264)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!523 (array!46054 array!46056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24911 V!24911 V!24911 V!24911 (_ BitVec 32) Int) Unit!28264)

(assert (=> b!824718 (= lt!371963 (lemmaNoChangeToArrayThenSameMapNoExtras!523 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2413 (array!46054 array!46056 (_ BitVec 32) (_ BitVec 32) V!24911 V!24911 (_ BitVec 32) Int) ListLongMap!8769)

(assert (=> b!824718 (= lt!371965 (getCurrentListMapNoExtraKeys!2413 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824718 (= lt!371964 (getCurrentListMapNoExtraKeys!2413 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824719 () Bool)

(declare-fun e!458895 () Bool)

(assert (=> b!824719 (= e!458895 tp_is_empty!14933)))

(declare-fun b!824720 () Bool)

(declare-fun e!458897 () Bool)

(assert (=> b!824720 (= e!458897 tp_is_empty!14933)))

(declare-fun mapNonEmpty!24019 () Bool)

(declare-fun mapRes!24019 () Bool)

(declare-fun tp!46422 () Bool)

(assert (=> mapNonEmpty!24019 (= mapRes!24019 (and tp!46422 e!458895))))

(declare-fun mapValue!24019 () ValueCell!7051)

(declare-fun mapKey!24019 () (_ BitVec 32))

(declare-fun mapRest!24019 () (Array (_ BitVec 32) ValueCell!7051))

(assert (=> mapNonEmpty!24019 (= (arr!22075 _values!788) (store mapRest!24019 mapKey!24019 mapValue!24019))))

(declare-fun b!824721 () Bool)

(declare-fun res!562254 () Bool)

(assert (=> b!824721 (=> (not res!562254) (not e!458894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46054 (_ BitVec 32)) Bool)

(assert (=> b!824721 (= res!562254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824722 () Bool)

(assert (=> b!824722 (= e!458892 (and e!458897 mapRes!24019))))

(declare-fun condMapEmpty!24019 () Bool)

(declare-fun mapDefault!24019 () ValueCell!7051)

