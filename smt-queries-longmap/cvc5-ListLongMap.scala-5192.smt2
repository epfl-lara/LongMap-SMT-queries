; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70152 () Bool)

(assert start!70152)

(declare-fun b_free!12559 () Bool)

(declare-fun b_next!12559 () Bool)

(assert (=> start!70152 (= b_free!12559 (not b_next!12559))))

(declare-fun tp!44394 () Bool)

(declare-fun b_and!21339 () Bool)

(assert (=> start!70152 (= tp!44394 b_and!21339)))

(declare-fun mapNonEmpty!22987 () Bool)

(declare-fun mapRes!22987 () Bool)

(declare-fun tp!44395 () Bool)

(declare-fun e!451929 () Bool)

(assert (=> mapNonEmpty!22987 (= mapRes!22987 (and tp!44395 e!451929))))

(declare-datatypes ((V!24027 0))(
  ( (V!24028 (val!7182 Int)) )
))
(declare-datatypes ((ValueCell!6719 0))(
  ( (ValueCellFull!6719 (v!9609 V!24027)) (EmptyCell!6719) )
))
(declare-fun mapRest!22987 () (Array (_ BitVec 32) ValueCell!6719))

(declare-fun mapValue!22987 () ValueCell!6719)

(declare-fun mapKey!22987 () (_ BitVec 32))

(declare-datatypes ((array!44742 0))(
  ( (array!44743 (arr!21430 (Array (_ BitVec 32) ValueCell!6719)) (size!21851 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44742)

(assert (=> mapNonEmpty!22987 (= (arr!21430 _values!788) (store mapRest!22987 mapKey!22987 mapValue!22987))))

(declare-fun b!815109 () Bool)

(declare-fun res!556643 () Bool)

(declare-fun e!451932 () Bool)

(assert (=> b!815109 (=> (not res!556643) (not e!451932))))

(declare-datatypes ((array!44744 0))(
  ( (array!44745 (arr!21431 (Array (_ BitVec 32) (_ BitVec 64))) (size!21852 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44744)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815109 (= res!556643 (and (= (size!21851 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21852 _keys!976) (size!21851 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815110 () Bool)

(assert (=> b!815110 (= e!451932 (not true))))

(declare-datatypes ((tuple2!9418 0))(
  ( (tuple2!9419 (_1!4720 (_ BitVec 64)) (_2!4720 V!24027)) )
))
(declare-datatypes ((List!15249 0))(
  ( (Nil!15246) (Cons!15245 (h!16374 tuple2!9418) (t!21568 List!15249)) )
))
(declare-datatypes ((ListLongMap!8241 0))(
  ( (ListLongMap!8242 (toList!4136 List!15249)) )
))
(declare-fun lt!364909 () ListLongMap!8241)

(declare-fun lt!364908 () ListLongMap!8241)

(assert (=> b!815110 (= lt!364909 lt!364908)))

(declare-fun zeroValueBefore!34 () V!24027)

(declare-fun zeroValueAfter!34 () V!24027)

(declare-fun minValue!754 () V!24027)

(declare-datatypes ((Unit!27770 0))(
  ( (Unit!27771) )
))
(declare-fun lt!364907 () Unit!27770)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!296 (array!44744 array!44742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24027 V!24027 V!24027 V!24027 (_ BitVec 32) Int) Unit!27770)

(assert (=> b!815110 (= lt!364907 (lemmaNoChangeToArrayThenSameMapNoExtras!296 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2186 (array!44744 array!44742 (_ BitVec 32) (_ BitVec 32) V!24027 V!24027 (_ BitVec 32) Int) ListLongMap!8241)

(assert (=> b!815110 (= lt!364908 (getCurrentListMapNoExtraKeys!2186 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815110 (= lt!364909 (getCurrentListMapNoExtraKeys!2186 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815111 () Bool)

(declare-fun res!556644 () Bool)

(assert (=> b!815111 (=> (not res!556644) (not e!451932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44744 (_ BitVec 32)) Bool)

(assert (=> b!815111 (= res!556644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556645 () Bool)

(assert (=> start!70152 (=> (not res!556645) (not e!451932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70152 (= res!556645 (validMask!0 mask!1312))))

(assert (=> start!70152 e!451932))

(declare-fun tp_is_empty!14269 () Bool)

(assert (=> start!70152 tp_is_empty!14269))

(declare-fun array_inv!17147 (array!44744) Bool)

(assert (=> start!70152 (array_inv!17147 _keys!976)))

(assert (=> start!70152 true))

(declare-fun e!451931 () Bool)

(declare-fun array_inv!17148 (array!44742) Bool)

(assert (=> start!70152 (and (array_inv!17148 _values!788) e!451931)))

(assert (=> start!70152 tp!44394))

(declare-fun b!815112 () Bool)

(assert (=> b!815112 (= e!451929 tp_is_empty!14269)))

(declare-fun b!815113 () Bool)

(declare-fun res!556642 () Bool)

(assert (=> b!815113 (=> (not res!556642) (not e!451932))))

(declare-datatypes ((List!15250 0))(
  ( (Nil!15247) (Cons!15246 (h!16375 (_ BitVec 64)) (t!21569 List!15250)) )
))
(declare-fun arrayNoDuplicates!0 (array!44744 (_ BitVec 32) List!15250) Bool)

(assert (=> b!815113 (= res!556642 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15247))))

(declare-fun mapIsEmpty!22987 () Bool)

(assert (=> mapIsEmpty!22987 mapRes!22987))

(declare-fun b!815114 () Bool)

(declare-fun e!451933 () Bool)

(assert (=> b!815114 (= e!451931 (and e!451933 mapRes!22987))))

(declare-fun condMapEmpty!22987 () Bool)

(declare-fun mapDefault!22987 () ValueCell!6719)

