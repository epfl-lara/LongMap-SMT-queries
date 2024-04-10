; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70952 () Bool)

(assert start!70952)

(declare-fun b_free!13169 () Bool)

(declare-fun b_next!13169 () Bool)

(assert (=> start!70952 (= b_free!13169 (not b_next!13169))))

(declare-fun tp!46257 () Bool)

(declare-fun b_and!22065 () Bool)

(assert (=> start!70952 (= tp!46257 b_and!22065)))

(declare-fun mapNonEmpty!23935 () Bool)

(declare-fun mapRes!23935 () Bool)

(declare-fun tp!46258 () Bool)

(declare-fun e!458379 () Bool)

(assert (=> mapNonEmpty!23935 (= mapRes!23935 (and tp!46258 e!458379))))

(declare-fun mapKey!23935 () (_ BitVec 32))

(declare-datatypes ((V!24839 0))(
  ( (V!24840 (val!7487 Int)) )
))
(declare-datatypes ((ValueCell!7024 0))(
  ( (ValueCellFull!7024 (v!9920 V!24839)) (EmptyCell!7024) )
))
(declare-datatypes ((array!45946 0))(
  ( (array!45947 (arr!22021 (Array (_ BitVec 32) ValueCell!7024)) (size!22442 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45946)

(declare-fun mapValue!23935 () ValueCell!7024)

(declare-fun mapRest!23935 () (Array (_ BitVec 32) ValueCell!7024))

(assert (=> mapNonEmpty!23935 (= (arr!22021 _values!788) (store mapRest!23935 mapKey!23935 mapValue!23935))))

(declare-fun b!824011 () Bool)

(declare-fun res!561846 () Bool)

(declare-fun e!458381 () Bool)

(assert (=> b!824011 (=> (not res!561846) (not e!458381))))

(declare-datatypes ((array!45948 0))(
  ( (array!45949 (arr!22022 (Array (_ BitVec 32) (_ BitVec 64))) (size!22443 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45948)

(declare-datatypes ((List!15715 0))(
  ( (Nil!15712) (Cons!15711 (h!16840 (_ BitVec 64)) (t!22056 List!15715)) )
))
(declare-fun arrayNoDuplicates!0 (array!45948 (_ BitVec 32) List!15715) Bool)

(assert (=> b!824011 (= res!561846 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15712))))

(declare-fun b!824012 () Bool)

(declare-fun res!561848 () Bool)

(assert (=> b!824012 (=> (not res!561848) (not e!458381))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824012 (= res!561848 (and (= (size!22442 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22443 _keys!976) (size!22442 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!561845 () Bool)

(assert (=> start!70952 (=> (not res!561845) (not e!458381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70952 (= res!561845 (validMask!0 mask!1312))))

(assert (=> start!70952 e!458381))

(declare-fun tp_is_empty!14879 () Bool)

(assert (=> start!70952 tp_is_empty!14879))

(declare-fun array_inv!17571 (array!45948) Bool)

(assert (=> start!70952 (array_inv!17571 _keys!976)))

(assert (=> start!70952 true))

(declare-fun e!458380 () Bool)

(declare-fun array_inv!17572 (array!45946) Bool)

(assert (=> start!70952 (and (array_inv!17572 _values!788) e!458380)))

(assert (=> start!70952 tp!46257))

(declare-fun b!824013 () Bool)

(assert (=> b!824013 (= e!458381 (not true))))

(declare-datatypes ((tuple2!9904 0))(
  ( (tuple2!9905 (_1!4963 (_ BitVec 64)) (_2!4963 V!24839)) )
))
(declare-datatypes ((List!15716 0))(
  ( (Nil!15713) (Cons!15712 (h!16841 tuple2!9904) (t!22057 List!15716)) )
))
(declare-datatypes ((ListLongMap!8727 0))(
  ( (ListLongMap!8728 (toList!4379 List!15716)) )
))
(declare-fun lt!371629 () ListLongMap!8727)

(declare-fun lt!371628 () ListLongMap!8727)

(assert (=> b!824013 (= lt!371629 lt!371628)))

(declare-fun zeroValueBefore!34 () V!24839)

(declare-fun zeroValueAfter!34 () V!24839)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24839)

(declare-datatypes ((Unit!28226 0))(
  ( (Unit!28227) )
))
(declare-fun lt!371627 () Unit!28226)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!504 (array!45948 array!45946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24839 V!24839 V!24839 V!24839 (_ BitVec 32) Int) Unit!28226)

(assert (=> b!824013 (= lt!371627 (lemmaNoChangeToArrayThenSameMapNoExtras!504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2394 (array!45948 array!45946 (_ BitVec 32) (_ BitVec 32) V!24839 V!24839 (_ BitVec 32) Int) ListLongMap!8727)

(assert (=> b!824013 (= lt!371628 (getCurrentListMapNoExtraKeys!2394 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824013 (= lt!371629 (getCurrentListMapNoExtraKeys!2394 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23935 () Bool)

(assert (=> mapIsEmpty!23935 mapRes!23935))

(declare-fun b!824014 () Bool)

(assert (=> b!824014 (= e!458379 tp_is_empty!14879)))

(declare-fun b!824015 () Bool)

(declare-fun e!458382 () Bool)

(assert (=> b!824015 (= e!458382 tp_is_empty!14879)))

(declare-fun b!824016 () Bool)

(declare-fun res!561847 () Bool)

(assert (=> b!824016 (=> (not res!561847) (not e!458381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45948 (_ BitVec 32)) Bool)

(assert (=> b!824016 (= res!561847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824017 () Bool)

(assert (=> b!824017 (= e!458380 (and e!458382 mapRes!23935))))

(declare-fun condMapEmpty!23935 () Bool)

(declare-fun mapDefault!23935 () ValueCell!7024)

