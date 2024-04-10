; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93986 () Bool)

(assert start!93986)

(declare-fun b_free!21423 () Bool)

(declare-fun b_next!21423 () Bool)

(assert (=> start!93986 (= b_free!21423 (not b_next!21423))))

(declare-fun tp!75698 () Bool)

(declare-fun b_and!34155 () Bool)

(assert (=> start!93986 (= tp!75698 b_and!34155)))

(declare-fun b!1062944 () Bool)

(declare-fun e!605562 () Bool)

(declare-fun e!605564 () Bool)

(declare-fun mapRes!39526 () Bool)

(assert (=> b!1062944 (= e!605562 (and e!605564 mapRes!39526))))

(declare-fun condMapEmpty!39526 () Bool)

(declare-datatypes ((V!38779 0))(
  ( (V!38780 (val!12667 Int)) )
))
(declare-datatypes ((ValueCell!11913 0))(
  ( (ValueCellFull!11913 (v!15278 V!38779)) (EmptyCell!11913) )
))
(declare-datatypes ((array!67469 0))(
  ( (array!67470 (arr!32440 (Array (_ BitVec 32) ValueCell!11913)) (size!32976 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67469)

(declare-fun mapDefault!39526 () ValueCell!11913)

(assert (=> b!1062944 (= condMapEmpty!39526 (= (arr!32440 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11913)) mapDefault!39526)))))

(declare-fun mapIsEmpty!39526 () Bool)

(assert (=> mapIsEmpty!39526 mapRes!39526))

(declare-fun b!1062945 () Bool)

(declare-fun res!709721 () Bool)

(declare-fun e!605558 () Bool)

(assert (=> b!1062945 (=> (not res!709721) (not e!605558))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67471 0))(
  ( (array!67472 (arr!32441 (Array (_ BitVec 32) (_ BitVec 64))) (size!32977 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67471)

(assert (=> b!1062945 (= res!709721 (and (= (size!32976 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32977 _keys!1163) (size!32976 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062946 () Bool)

(declare-fun e!605560 () Bool)

(declare-fun tp_is_empty!25233 () Bool)

(assert (=> b!1062946 (= e!605560 tp_is_empty!25233)))

(declare-fun b!1062947 () Bool)

(assert (=> b!1062947 (= e!605564 tp_is_empty!25233)))

(declare-fun b!1062948 () Bool)

(declare-fun e!605559 () Bool)

(assert (=> b!1062948 (= e!605559 true)))

(declare-datatypes ((tuple2!16030 0))(
  ( (tuple2!16031 (_1!8026 (_ BitVec 64)) (_2!8026 V!38779)) )
))
(declare-datatypes ((List!22611 0))(
  ( (Nil!22608) (Cons!22607 (h!23816 tuple2!16030) (t!31924 List!22611)) )
))
(declare-datatypes ((ListLongMap!13999 0))(
  ( (ListLongMap!14000 (toList!7015 List!22611)) )
))
(declare-fun lt!468419 () ListLongMap!13999)

(declare-fun -!578 (ListLongMap!13999 (_ BitVec 64)) ListLongMap!13999)

(assert (=> b!1062948 (= (-!578 lt!468419 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468419)))

(declare-datatypes ((Unit!34830 0))(
  ( (Unit!34831) )
))
(declare-fun lt!468417 () Unit!34830)

(declare-fun removeNotPresentStillSame!25 (ListLongMap!13999 (_ BitVec 64)) Unit!34830)

(assert (=> b!1062948 (= lt!468417 (removeNotPresentStillSame!25 lt!468419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062949 () Bool)

(declare-fun e!605563 () Bool)

(assert (=> b!1062949 (= e!605563 e!605559)))

(declare-fun res!709723 () Bool)

(assert (=> b!1062949 (=> res!709723 e!605559)))

(declare-fun contains!6247 (ListLongMap!13999 (_ BitVec 64)) Bool)

(assert (=> b!1062949 (= res!709723 (contains!6247 lt!468419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38779)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38779)

(declare-fun getCurrentListMap!3999 (array!67471 array!67469 (_ BitVec 32) (_ BitVec 32) V!38779 V!38779 (_ BitVec 32) Int) ListLongMap!13999)

(assert (=> b!1062949 (= lt!468419 (getCurrentListMap!3999 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062950 () Bool)

(declare-fun res!709722 () Bool)

(assert (=> b!1062950 (=> (not res!709722) (not e!605558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67471 (_ BitVec 32)) Bool)

(assert (=> b!1062950 (= res!709722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39526 () Bool)

(declare-fun tp!75697 () Bool)

(assert (=> mapNonEmpty!39526 (= mapRes!39526 (and tp!75697 e!605560))))

(declare-fun mapKey!39526 () (_ BitVec 32))

(declare-fun mapRest!39526 () (Array (_ BitVec 32) ValueCell!11913))

(declare-fun mapValue!39526 () ValueCell!11913)

(assert (=> mapNonEmpty!39526 (= (arr!32440 _values!955) (store mapRest!39526 mapKey!39526 mapValue!39526))))

(declare-fun res!709725 () Bool)

(assert (=> start!93986 (=> (not res!709725) (not e!605558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93986 (= res!709725 (validMask!0 mask!1515))))

(assert (=> start!93986 e!605558))

(assert (=> start!93986 true))

(assert (=> start!93986 tp_is_empty!25233))

(declare-fun array_inv!25130 (array!67469) Bool)

(assert (=> start!93986 (and (array_inv!25130 _values!955) e!605562)))

(assert (=> start!93986 tp!75698))

(declare-fun array_inv!25131 (array!67471) Bool)

(assert (=> start!93986 (array_inv!25131 _keys!1163)))

(declare-fun b!1062951 () Bool)

(assert (=> b!1062951 (= e!605558 (not e!605563))))

(declare-fun res!709720 () Bool)

(assert (=> b!1062951 (=> res!709720 e!605563)))

(assert (=> b!1062951 (= res!709720 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468418 () ListLongMap!13999)

(declare-fun lt!468420 () ListLongMap!13999)

(assert (=> b!1062951 (= lt!468418 lt!468420)))

(declare-fun lt!468416 () Unit!34830)

(declare-fun zeroValueAfter!47 () V!38779)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!645 (array!67471 array!67469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38779 V!38779 V!38779 V!38779 (_ BitVec 32) Int) Unit!34830)

(assert (=> b!1062951 (= lt!468416 (lemmaNoChangeToArrayThenSameMapNoExtras!645 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3608 (array!67471 array!67469 (_ BitVec 32) (_ BitVec 32) V!38779 V!38779 (_ BitVec 32) Int) ListLongMap!13999)

(assert (=> b!1062951 (= lt!468420 (getCurrentListMapNoExtraKeys!3608 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062951 (= lt!468418 (getCurrentListMapNoExtraKeys!3608 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062952 () Bool)

(declare-fun res!709724 () Bool)

(assert (=> b!1062952 (=> (not res!709724) (not e!605558))))

(declare-datatypes ((List!22612 0))(
  ( (Nil!22609) (Cons!22608 (h!23817 (_ BitVec 64)) (t!31925 List!22612)) )
))
(declare-fun arrayNoDuplicates!0 (array!67471 (_ BitVec 32) List!22612) Bool)

(assert (=> b!1062952 (= res!709724 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22609))))

(assert (= (and start!93986 res!709725) b!1062945))

(assert (= (and b!1062945 res!709721) b!1062950))

(assert (= (and b!1062950 res!709722) b!1062952))

(assert (= (and b!1062952 res!709724) b!1062951))

(assert (= (and b!1062951 (not res!709720)) b!1062949))

(assert (= (and b!1062949 (not res!709723)) b!1062948))

(assert (= (and b!1062944 condMapEmpty!39526) mapIsEmpty!39526))

(assert (= (and b!1062944 (not condMapEmpty!39526)) mapNonEmpty!39526))

(get-info :version)

(assert (= (and mapNonEmpty!39526 ((_ is ValueCellFull!11913) mapValue!39526)) b!1062946))

(assert (= (and b!1062944 ((_ is ValueCellFull!11913) mapDefault!39526)) b!1062947))

(assert (= start!93986 b!1062944))

(declare-fun m!981653 () Bool)

(assert (=> b!1062951 m!981653))

(declare-fun m!981655 () Bool)

(assert (=> b!1062951 m!981655))

(declare-fun m!981657 () Bool)

(assert (=> b!1062951 m!981657))

(declare-fun m!981659 () Bool)

(assert (=> b!1062948 m!981659))

(declare-fun m!981661 () Bool)

(assert (=> b!1062948 m!981661))

(declare-fun m!981663 () Bool)

(assert (=> b!1062950 m!981663))

(declare-fun m!981665 () Bool)

(assert (=> b!1062952 m!981665))

(declare-fun m!981667 () Bool)

(assert (=> mapNonEmpty!39526 m!981667))

(declare-fun m!981669 () Bool)

(assert (=> start!93986 m!981669))

(declare-fun m!981671 () Bool)

(assert (=> start!93986 m!981671))

(declare-fun m!981673 () Bool)

(assert (=> start!93986 m!981673))

(declare-fun m!981675 () Bool)

(assert (=> b!1062949 m!981675))

(declare-fun m!981677 () Bool)

(assert (=> b!1062949 m!981677))

(check-sat (not b_next!21423) (not b!1062950) (not b!1062951) tp_is_empty!25233 (not b!1062948) (not mapNonEmpty!39526) (not start!93986) (not b!1062949) (not b!1062952) b_and!34155)
(check-sat b_and!34155 (not b_next!21423))
