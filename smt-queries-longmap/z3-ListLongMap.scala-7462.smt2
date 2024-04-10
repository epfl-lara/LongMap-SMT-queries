; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94682 () Bool)

(assert start!94682)

(declare-fun b_free!21951 () Bool)

(declare-fun b_next!21951 () Bool)

(assert (=> start!94682 (= b_free!21951 (not b_next!21951))))

(declare-fun tp!77308 () Bool)

(declare-fun b_and!34771 () Bool)

(assert (=> start!94682 (= tp!77308 b_and!34771)))

(declare-fun b!1070517 () Bool)

(declare-fun e!611105 () Bool)

(declare-fun tp_is_empty!25761 () Bool)

(assert (=> b!1070517 (= e!611105 tp_is_empty!25761)))

(declare-fun b!1070518 () Bool)

(declare-fun res!714173 () Bool)

(declare-fun e!611104 () Bool)

(assert (=> b!1070518 (=> (not res!714173) (not e!611104))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39483 0))(
  ( (V!39484 (val!12931 Int)) )
))
(declare-datatypes ((ValueCell!12177 0))(
  ( (ValueCellFull!12177 (v!15547 V!39483)) (EmptyCell!12177) )
))
(declare-datatypes ((array!68497 0))(
  ( (array!68498 (arr!32945 (Array (_ BitVec 32) ValueCell!12177)) (size!33481 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68497)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68499 0))(
  ( (array!68500 (arr!32946 (Array (_ BitVec 32) (_ BitVec 64))) (size!33482 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68499)

(assert (=> b!1070518 (= res!714173 (and (= (size!33481 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33482 _keys!1163) (size!33481 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070519 () Bool)

(declare-fun e!611106 () Bool)

(assert (=> b!1070519 (= e!611104 (not e!611106))))

(declare-fun res!714177 () Bool)

(assert (=> b!1070519 (=> res!714177 e!611106)))

(assert (=> b!1070519 (= res!714177 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16444 0))(
  ( (tuple2!16445 (_1!8233 (_ BitVec 64)) (_2!8233 V!39483)) )
))
(declare-datatypes ((List!22988 0))(
  ( (Nil!22985) (Cons!22984 (h!24193 tuple2!16444) (t!32319 List!22988)) )
))
(declare-datatypes ((ListLongMap!14413 0))(
  ( (ListLongMap!14414 (toList!7222 List!22988)) )
))
(declare-fun lt!473112 () ListLongMap!14413)

(declare-fun lt!473111 () ListLongMap!14413)

(assert (=> b!1070519 (= lt!473112 lt!473111)))

(declare-fun zeroValueBefore!47 () V!39483)

(declare-datatypes ((Unit!35243 0))(
  ( (Unit!35244) )
))
(declare-fun lt!473113 () Unit!35243)

(declare-fun minValue!907 () V!39483)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39483)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!835 (array!68499 array!68497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39483 V!39483 V!39483 V!39483 (_ BitVec 32) Int) Unit!35243)

(assert (=> b!1070519 (= lt!473113 (lemmaNoChangeToArrayThenSameMapNoExtras!835 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3798 (array!68499 array!68497 (_ BitVec 32) (_ BitVec 32) V!39483 V!39483 (_ BitVec 32) Int) ListLongMap!14413)

(assert (=> b!1070519 (= lt!473111 (getCurrentListMapNoExtraKeys!3798 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070519 (= lt!473112 (getCurrentListMapNoExtraKeys!3798 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40345 () Bool)

(declare-fun mapRes!40345 () Bool)

(assert (=> mapIsEmpty!40345 mapRes!40345))

(declare-fun b!1070520 () Bool)

(declare-fun e!611103 () Bool)

(declare-fun e!611107 () Bool)

(assert (=> b!1070520 (= e!611103 (and e!611107 mapRes!40345))))

(declare-fun condMapEmpty!40345 () Bool)

(declare-fun mapDefault!40345 () ValueCell!12177)

(assert (=> b!1070520 (= condMapEmpty!40345 (= (arr!32945 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12177)) mapDefault!40345)))))

(declare-fun b!1070521 () Bool)

(declare-fun res!714176 () Bool)

(assert (=> b!1070521 (=> (not res!714176) (not e!611104))))

(declare-datatypes ((List!22989 0))(
  ( (Nil!22986) (Cons!22985 (h!24194 (_ BitVec 64)) (t!32320 List!22989)) )
))
(declare-fun arrayNoDuplicates!0 (array!68499 (_ BitVec 32) List!22989) Bool)

(assert (=> b!1070521 (= res!714176 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22986))))

(declare-fun b!1070522 () Bool)

(assert (=> b!1070522 (= e!611106 true)))

(declare-fun lt!473110 () ListLongMap!14413)

(declare-fun getCurrentListMap!4125 (array!68499 array!68497 (_ BitVec 32) (_ BitVec 32) V!39483 V!39483 (_ BitVec 32) Int) ListLongMap!14413)

(assert (=> b!1070522 (= lt!473110 (getCurrentListMap!4125 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40345 () Bool)

(declare-fun tp!77309 () Bool)

(assert (=> mapNonEmpty!40345 (= mapRes!40345 (and tp!77309 e!611105))))

(declare-fun mapRest!40345 () (Array (_ BitVec 32) ValueCell!12177))

(declare-fun mapKey!40345 () (_ BitVec 32))

(declare-fun mapValue!40345 () ValueCell!12177)

(assert (=> mapNonEmpty!40345 (= (arr!32945 _values!955) (store mapRest!40345 mapKey!40345 mapValue!40345))))

(declare-fun res!714175 () Bool)

(assert (=> start!94682 (=> (not res!714175) (not e!611104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94682 (= res!714175 (validMask!0 mask!1515))))

(assert (=> start!94682 e!611104))

(assert (=> start!94682 true))

(assert (=> start!94682 tp_is_empty!25761))

(declare-fun array_inv!25482 (array!68497) Bool)

(assert (=> start!94682 (and (array_inv!25482 _values!955) e!611103)))

(assert (=> start!94682 tp!77308))

(declare-fun array_inv!25483 (array!68499) Bool)

(assert (=> start!94682 (array_inv!25483 _keys!1163)))

(declare-fun b!1070523 () Bool)

(declare-fun res!714174 () Bool)

(assert (=> b!1070523 (=> (not res!714174) (not e!611104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68499 (_ BitVec 32)) Bool)

(assert (=> b!1070523 (= res!714174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070524 () Bool)

(assert (=> b!1070524 (= e!611107 tp_is_empty!25761)))

(assert (= (and start!94682 res!714175) b!1070518))

(assert (= (and b!1070518 res!714173) b!1070523))

(assert (= (and b!1070523 res!714174) b!1070521))

(assert (= (and b!1070521 res!714176) b!1070519))

(assert (= (and b!1070519 (not res!714177)) b!1070522))

(assert (= (and b!1070520 condMapEmpty!40345) mapIsEmpty!40345))

(assert (= (and b!1070520 (not condMapEmpty!40345)) mapNonEmpty!40345))

(get-info :version)

(assert (= (and mapNonEmpty!40345 ((_ is ValueCellFull!12177) mapValue!40345)) b!1070517))

(assert (= (and b!1070520 ((_ is ValueCellFull!12177) mapDefault!40345)) b!1070524))

(assert (= start!94682 b!1070520))

(declare-fun m!988853 () Bool)

(assert (=> start!94682 m!988853))

(declare-fun m!988855 () Bool)

(assert (=> start!94682 m!988855))

(declare-fun m!988857 () Bool)

(assert (=> start!94682 m!988857))

(declare-fun m!988859 () Bool)

(assert (=> b!1070519 m!988859))

(declare-fun m!988861 () Bool)

(assert (=> b!1070519 m!988861))

(declare-fun m!988863 () Bool)

(assert (=> b!1070519 m!988863))

(declare-fun m!988865 () Bool)

(assert (=> b!1070523 m!988865))

(declare-fun m!988867 () Bool)

(assert (=> b!1070522 m!988867))

(declare-fun m!988869 () Bool)

(assert (=> mapNonEmpty!40345 m!988869))

(declare-fun m!988871 () Bool)

(assert (=> b!1070521 m!988871))

(check-sat tp_is_empty!25761 (not b!1070523) (not b!1070522) (not mapNonEmpty!40345) (not b!1070521) (not b_next!21951) (not b!1070519) (not start!94682) b_and!34771)
(check-sat b_and!34771 (not b_next!21951))
