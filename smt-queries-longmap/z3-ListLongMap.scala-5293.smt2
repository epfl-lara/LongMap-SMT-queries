; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70950 () Bool)

(assert start!70950)

(declare-fun b_free!13167 () Bool)

(declare-fun b_next!13167 () Bool)

(assert (=> start!70950 (= b_free!13167 (not b_next!13167))))

(declare-fun tp!46252 () Bool)

(declare-fun b_and!22063 () Bool)

(assert (=> start!70950 (= tp!46252 b_and!22063)))

(declare-fun mapNonEmpty!23932 () Bool)

(declare-fun mapRes!23932 () Bool)

(declare-fun tp!46251 () Bool)

(declare-fun e!458368 () Bool)

(assert (=> mapNonEmpty!23932 (= mapRes!23932 (and tp!46251 e!458368))))

(declare-datatypes ((V!24837 0))(
  ( (V!24838 (val!7486 Int)) )
))
(declare-datatypes ((ValueCell!7023 0))(
  ( (ValueCellFull!7023 (v!9919 V!24837)) (EmptyCell!7023) )
))
(declare-fun mapRest!23932 () (Array (_ BitVec 32) ValueCell!7023))

(declare-datatypes ((array!45942 0))(
  ( (array!45943 (arr!22019 (Array (_ BitVec 32) ValueCell!7023)) (size!22440 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45942)

(declare-fun mapValue!23932 () ValueCell!7023)

(declare-fun mapKey!23932 () (_ BitVec 32))

(assert (=> mapNonEmpty!23932 (= (arr!22019 _values!788) (store mapRest!23932 mapKey!23932 mapValue!23932))))

(declare-fun mapIsEmpty!23932 () Bool)

(assert (=> mapIsEmpty!23932 mapRes!23932))

(declare-fun res!561836 () Bool)

(declare-fun e!458367 () Bool)

(assert (=> start!70950 (=> (not res!561836) (not e!458367))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70950 (= res!561836 (validMask!0 mask!1312))))

(assert (=> start!70950 e!458367))

(declare-fun tp_is_empty!14877 () Bool)

(assert (=> start!70950 tp_is_empty!14877))

(declare-datatypes ((array!45944 0))(
  ( (array!45945 (arr!22020 (Array (_ BitVec 32) (_ BitVec 64))) (size!22441 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45944)

(declare-fun array_inv!17569 (array!45944) Bool)

(assert (=> start!70950 (array_inv!17569 _keys!976)))

(assert (=> start!70950 true))

(declare-fun e!458365 () Bool)

(declare-fun array_inv!17570 (array!45942) Bool)

(assert (=> start!70950 (and (array_inv!17570 _values!788) e!458365)))

(assert (=> start!70950 tp!46252))

(declare-fun b!823990 () Bool)

(assert (=> b!823990 (= e!458368 tp_is_empty!14877)))

(declare-fun b!823991 () Bool)

(declare-fun res!561833 () Bool)

(assert (=> b!823991 (=> (not res!561833) (not e!458367))))

(declare-datatypes ((List!15713 0))(
  ( (Nil!15710) (Cons!15709 (h!16838 (_ BitVec 64)) (t!22054 List!15713)) )
))
(declare-fun arrayNoDuplicates!0 (array!45944 (_ BitVec 32) List!15713) Bool)

(assert (=> b!823991 (= res!561833 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15710))))

(declare-fun b!823992 () Bool)

(declare-fun e!458366 () Bool)

(assert (=> b!823992 (= e!458366 tp_is_empty!14877)))

(declare-fun b!823993 () Bool)

(declare-fun res!561834 () Bool)

(assert (=> b!823993 (=> (not res!561834) (not e!458367))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823993 (= res!561834 (and (= (size!22440 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22441 _keys!976) (size!22440 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823994 () Bool)

(assert (=> b!823994 (= e!458367 (not true))))

(declare-datatypes ((tuple2!9902 0))(
  ( (tuple2!9903 (_1!4962 (_ BitVec 64)) (_2!4962 V!24837)) )
))
(declare-datatypes ((List!15714 0))(
  ( (Nil!15711) (Cons!15710 (h!16839 tuple2!9902) (t!22055 List!15714)) )
))
(declare-datatypes ((ListLongMap!8725 0))(
  ( (ListLongMap!8726 (toList!4378 List!15714)) )
))
(declare-fun lt!371620 () ListLongMap!8725)

(declare-fun lt!371619 () ListLongMap!8725)

(assert (=> b!823994 (= lt!371620 lt!371619)))

(declare-fun zeroValueBefore!34 () V!24837)

(declare-fun zeroValueAfter!34 () V!24837)

(declare-fun minValue!754 () V!24837)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28224 0))(
  ( (Unit!28225) )
))
(declare-fun lt!371618 () Unit!28224)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!503 (array!45944 array!45942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24837 V!24837 V!24837 V!24837 (_ BitVec 32) Int) Unit!28224)

(assert (=> b!823994 (= lt!371618 (lemmaNoChangeToArrayThenSameMapNoExtras!503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2393 (array!45944 array!45942 (_ BitVec 32) (_ BitVec 32) V!24837 V!24837 (_ BitVec 32) Int) ListLongMap!8725)

(assert (=> b!823994 (= lt!371619 (getCurrentListMapNoExtraKeys!2393 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823994 (= lt!371620 (getCurrentListMapNoExtraKeys!2393 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823995 () Bool)

(assert (=> b!823995 (= e!458365 (and e!458366 mapRes!23932))))

(declare-fun condMapEmpty!23932 () Bool)

(declare-fun mapDefault!23932 () ValueCell!7023)

(assert (=> b!823995 (= condMapEmpty!23932 (= (arr!22019 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7023)) mapDefault!23932)))))

(declare-fun b!823996 () Bool)

(declare-fun res!561835 () Bool)

(assert (=> b!823996 (=> (not res!561835) (not e!458367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45944 (_ BitVec 32)) Bool)

(assert (=> b!823996 (= res!561835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70950 res!561836) b!823993))

(assert (= (and b!823993 res!561834) b!823996))

(assert (= (and b!823996 res!561835) b!823991))

(assert (= (and b!823991 res!561833) b!823994))

(assert (= (and b!823995 condMapEmpty!23932) mapIsEmpty!23932))

(assert (= (and b!823995 (not condMapEmpty!23932)) mapNonEmpty!23932))

(get-info :version)

(assert (= (and mapNonEmpty!23932 ((_ is ValueCellFull!7023) mapValue!23932)) b!823990))

(assert (= (and b!823995 ((_ is ValueCellFull!7023) mapDefault!23932)) b!823992))

(assert (= start!70950 b!823995))

(declare-fun m!766153 () Bool)

(assert (=> b!823994 m!766153))

(declare-fun m!766155 () Bool)

(assert (=> b!823994 m!766155))

(declare-fun m!766157 () Bool)

(assert (=> b!823994 m!766157))

(declare-fun m!766159 () Bool)

(assert (=> b!823996 m!766159))

(declare-fun m!766161 () Bool)

(assert (=> b!823991 m!766161))

(declare-fun m!766163 () Bool)

(assert (=> start!70950 m!766163))

(declare-fun m!766165 () Bool)

(assert (=> start!70950 m!766165))

(declare-fun m!766167 () Bool)

(assert (=> start!70950 m!766167))

(declare-fun m!766169 () Bool)

(assert (=> mapNonEmpty!23932 m!766169))

(check-sat (not mapNonEmpty!23932) b_and!22063 (not b!823994) (not start!70950) (not b!823996) tp_is_empty!14877 (not b_next!13167) (not b!823991))
(check-sat b_and!22063 (not b_next!13167))
