; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70954 () Bool)

(assert start!70954)

(declare-fun b_free!13171 () Bool)

(declare-fun b_next!13171 () Bool)

(assert (=> start!70954 (= b_free!13171 (not b_next!13171))))

(declare-fun tp!46263 () Bool)

(declare-fun b_and!22067 () Bool)

(assert (=> start!70954 (= tp!46263 b_and!22067)))

(declare-fun b!824032 () Bool)

(declare-fun res!561857 () Bool)

(declare-fun e!458396 () Bool)

(assert (=> b!824032 (=> (not res!561857) (not e!458396))))

(declare-datatypes ((array!45950 0))(
  ( (array!45951 (arr!22023 (Array (_ BitVec 32) (_ BitVec 64))) (size!22444 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45950)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45950 (_ BitVec 32)) Bool)

(assert (=> b!824032 (= res!561857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824033 () Bool)

(declare-fun e!458397 () Bool)

(declare-fun tp_is_empty!14881 () Bool)

(assert (=> b!824033 (= e!458397 tp_is_empty!14881)))

(declare-fun b!824034 () Bool)

(declare-fun res!561858 () Bool)

(assert (=> b!824034 (=> (not res!561858) (not e!458396))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24843 0))(
  ( (V!24844 (val!7488 Int)) )
))
(declare-datatypes ((ValueCell!7025 0))(
  ( (ValueCellFull!7025 (v!9921 V!24843)) (EmptyCell!7025) )
))
(declare-datatypes ((array!45952 0))(
  ( (array!45953 (arr!22024 (Array (_ BitVec 32) ValueCell!7025)) (size!22445 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45952)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824034 (= res!561858 (and (= (size!22445 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22444 _keys!976) (size!22445 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23938 () Bool)

(declare-fun mapRes!23938 () Bool)

(declare-fun tp!46264 () Bool)

(assert (=> mapNonEmpty!23938 (= mapRes!23938 (and tp!46264 e!458397))))

(declare-fun mapKey!23938 () (_ BitVec 32))

(declare-fun mapRest!23938 () (Array (_ BitVec 32) ValueCell!7025))

(declare-fun mapValue!23938 () ValueCell!7025)

(assert (=> mapNonEmpty!23938 (= (arr!22024 _values!788) (store mapRest!23938 mapKey!23938 mapValue!23938))))

(declare-fun mapIsEmpty!23938 () Bool)

(assert (=> mapIsEmpty!23938 mapRes!23938))

(declare-fun b!824035 () Bool)

(declare-fun res!561859 () Bool)

(assert (=> b!824035 (=> (not res!561859) (not e!458396))))

(declare-datatypes ((List!15717 0))(
  ( (Nil!15714) (Cons!15713 (h!16842 (_ BitVec 64)) (t!22058 List!15717)) )
))
(declare-fun arrayNoDuplicates!0 (array!45950 (_ BitVec 32) List!15717) Bool)

(assert (=> b!824035 (= res!561859 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15714))))

(declare-fun b!824036 () Bool)

(declare-fun e!458394 () Bool)

(assert (=> b!824036 (= e!458394 tp_is_empty!14881)))

(declare-fun res!561860 () Bool)

(assert (=> start!70954 (=> (not res!561860) (not e!458396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70954 (= res!561860 (validMask!0 mask!1312))))

(assert (=> start!70954 e!458396))

(assert (=> start!70954 tp_is_empty!14881))

(declare-fun array_inv!17573 (array!45950) Bool)

(assert (=> start!70954 (array_inv!17573 _keys!976)))

(assert (=> start!70954 true))

(declare-fun e!458398 () Bool)

(declare-fun array_inv!17574 (array!45952) Bool)

(assert (=> start!70954 (and (array_inv!17574 _values!788) e!458398)))

(assert (=> start!70954 tp!46263))

(declare-fun b!824037 () Bool)

(assert (=> b!824037 (= e!458396 (not true))))

(declare-datatypes ((tuple2!9906 0))(
  ( (tuple2!9907 (_1!4964 (_ BitVec 64)) (_2!4964 V!24843)) )
))
(declare-datatypes ((List!15718 0))(
  ( (Nil!15715) (Cons!15714 (h!16843 tuple2!9906) (t!22059 List!15718)) )
))
(declare-datatypes ((ListLongMap!8729 0))(
  ( (ListLongMap!8730 (toList!4380 List!15718)) )
))
(declare-fun lt!371637 () ListLongMap!8729)

(declare-fun lt!371636 () ListLongMap!8729)

(assert (=> b!824037 (= lt!371637 lt!371636)))

(declare-fun zeroValueBefore!34 () V!24843)

(declare-fun zeroValueAfter!34 () V!24843)

(declare-fun minValue!754 () V!24843)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28228 0))(
  ( (Unit!28229) )
))
(declare-fun lt!371638 () Unit!28228)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!505 (array!45950 array!45952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24843 V!24843 V!24843 V!24843 (_ BitVec 32) Int) Unit!28228)

(assert (=> b!824037 (= lt!371638 (lemmaNoChangeToArrayThenSameMapNoExtras!505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2395 (array!45950 array!45952 (_ BitVec 32) (_ BitVec 32) V!24843 V!24843 (_ BitVec 32) Int) ListLongMap!8729)

(assert (=> b!824037 (= lt!371636 (getCurrentListMapNoExtraKeys!2395 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824037 (= lt!371637 (getCurrentListMapNoExtraKeys!2395 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824038 () Bool)

(assert (=> b!824038 (= e!458398 (and e!458394 mapRes!23938))))

(declare-fun condMapEmpty!23938 () Bool)

(declare-fun mapDefault!23938 () ValueCell!7025)

