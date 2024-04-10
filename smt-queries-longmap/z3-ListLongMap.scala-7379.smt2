; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94016 () Bool)

(assert start!94016)

(declare-fun b_free!21453 () Bool)

(declare-fun b_next!21453 () Bool)

(assert (=> start!94016 (= b_free!21453 (not b_next!21453))))

(declare-fun tp!75787 () Bool)

(declare-fun b_and!34185 () Bool)

(assert (=> start!94016 (= tp!75787 b_and!34185)))

(declare-fun b!1063349 () Bool)

(declare-fun res!709995 () Bool)

(declare-fun e!605874 () Bool)

(assert (=> b!1063349 (=> (not res!709995) (not e!605874))))

(declare-datatypes ((array!67525 0))(
  ( (array!67526 (arr!32468 (Array (_ BitVec 32) (_ BitVec 64))) (size!33004 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67525)

(declare-datatypes ((List!22632 0))(
  ( (Nil!22629) (Cons!22628 (h!23837 (_ BitVec 64)) (t!31945 List!22632)) )
))
(declare-fun arrayNoDuplicates!0 (array!67525 (_ BitVec 32) List!22632) Bool)

(assert (=> b!1063349 (= res!709995 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22629))))

(declare-fun b!1063351 () Bool)

(declare-fun e!605875 () Bool)

(declare-fun e!605873 () Bool)

(declare-fun mapRes!39571 () Bool)

(assert (=> b!1063351 (= e!605875 (and e!605873 mapRes!39571))))

(declare-fun condMapEmpty!39571 () Bool)

(declare-datatypes ((V!38819 0))(
  ( (V!38820 (val!12682 Int)) )
))
(declare-datatypes ((ValueCell!11928 0))(
  ( (ValueCellFull!11928 (v!15293 V!38819)) (EmptyCell!11928) )
))
(declare-datatypes ((array!67527 0))(
  ( (array!67528 (arr!32469 (Array (_ BitVec 32) ValueCell!11928)) (size!33005 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67527)

(declare-fun mapDefault!39571 () ValueCell!11928)

(assert (=> b!1063351 (= condMapEmpty!39571 (= (arr!32469 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11928)) mapDefault!39571)))))

(declare-fun mapIsEmpty!39571 () Bool)

(assert (=> mapIsEmpty!39571 mapRes!39571))

(declare-fun b!1063352 () Bool)

(declare-fun e!605877 () Bool)

(assert (=> b!1063352 (= e!605874 (not e!605877))))

(declare-fun res!709994 () Bool)

(assert (=> b!1063352 (=> res!709994 e!605877)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063352 (= res!709994 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16054 0))(
  ( (tuple2!16055 (_1!8038 (_ BitVec 64)) (_2!8038 V!38819)) )
))
(declare-datatypes ((List!22633 0))(
  ( (Nil!22630) (Cons!22629 (h!23838 tuple2!16054) (t!31946 List!22633)) )
))
(declare-datatypes ((ListLongMap!14023 0))(
  ( (ListLongMap!14024 (toList!7027 List!22633)) )
))
(declare-fun lt!468641 () ListLongMap!14023)

(declare-fun lt!468642 () ListLongMap!14023)

(assert (=> b!1063352 (= lt!468641 lt!468642)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38819)

(declare-datatypes ((Unit!34852 0))(
  ( (Unit!34853) )
))
(declare-fun lt!468645 () Unit!34852)

(declare-fun minValue!907 () V!38819)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38819)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!656 (array!67525 array!67527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38819 V!38819 V!38819 V!38819 (_ BitVec 32) Int) Unit!34852)

(assert (=> b!1063352 (= lt!468645 (lemmaNoChangeToArrayThenSameMapNoExtras!656 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3619 (array!67525 array!67527 (_ BitVec 32) (_ BitVec 32) V!38819 V!38819 (_ BitVec 32) Int) ListLongMap!14023)

(assert (=> b!1063352 (= lt!468642 (getCurrentListMapNoExtraKeys!3619 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063352 (= lt!468641 (getCurrentListMapNoExtraKeys!3619 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39571 () Bool)

(declare-fun tp!75788 () Bool)

(declare-fun e!605878 () Bool)

(assert (=> mapNonEmpty!39571 (= mapRes!39571 (and tp!75788 e!605878))))

(declare-fun mapValue!39571 () ValueCell!11928)

(declare-fun mapKey!39571 () (_ BitVec 32))

(declare-fun mapRest!39571 () (Array (_ BitVec 32) ValueCell!11928))

(assert (=> mapNonEmpty!39571 (= (arr!32469 _values!955) (store mapRest!39571 mapKey!39571 mapValue!39571))))

(declare-fun b!1063353 () Bool)

(declare-fun res!709990 () Bool)

(assert (=> b!1063353 (=> (not res!709990) (not e!605874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67525 (_ BitVec 32)) Bool)

(assert (=> b!1063353 (= res!709990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063350 () Bool)

(declare-fun tp_is_empty!25263 () Bool)

(assert (=> b!1063350 (= e!605878 tp_is_empty!25263)))

(declare-fun res!709993 () Bool)

(assert (=> start!94016 (=> (not res!709993) (not e!605874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94016 (= res!709993 (validMask!0 mask!1515))))

(assert (=> start!94016 e!605874))

(assert (=> start!94016 true))

(assert (=> start!94016 tp_is_empty!25263))

(declare-fun array_inv!25148 (array!67527) Bool)

(assert (=> start!94016 (and (array_inv!25148 _values!955) e!605875)))

(assert (=> start!94016 tp!75787))

(declare-fun array_inv!25149 (array!67525) Bool)

(assert (=> start!94016 (array_inv!25149 _keys!1163)))

(declare-fun b!1063354 () Bool)

(declare-fun res!709991 () Bool)

(assert (=> b!1063354 (=> (not res!709991) (not e!605874))))

(assert (=> b!1063354 (= res!709991 (and (= (size!33005 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33004 _keys!1163) (size!33005 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063355 () Bool)

(declare-fun e!605879 () Bool)

(assert (=> b!1063355 (= e!605879 true)))

(declare-fun lt!468643 () ListLongMap!14023)

(declare-fun -!587 (ListLongMap!14023 (_ BitVec 64)) ListLongMap!14023)

(assert (=> b!1063355 (= (-!587 lt!468643 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468643)))

(declare-fun lt!468644 () Unit!34852)

(declare-fun removeNotPresentStillSame!34 (ListLongMap!14023 (_ BitVec 64)) Unit!34852)

(assert (=> b!1063355 (= lt!468644 (removeNotPresentStillSame!34 lt!468643 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063356 () Bool)

(assert (=> b!1063356 (= e!605873 tp_is_empty!25263)))

(declare-fun b!1063357 () Bool)

(assert (=> b!1063357 (= e!605877 e!605879)))

(declare-fun res!709992 () Bool)

(assert (=> b!1063357 (=> res!709992 e!605879)))

(declare-fun contains!6256 (ListLongMap!14023 (_ BitVec 64)) Bool)

(assert (=> b!1063357 (= res!709992 (contains!6256 lt!468643 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4008 (array!67525 array!67527 (_ BitVec 32) (_ BitVec 32) V!38819 V!38819 (_ BitVec 32) Int) ListLongMap!14023)

(assert (=> b!1063357 (= lt!468643 (getCurrentListMap!4008 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94016 res!709993) b!1063354))

(assert (= (and b!1063354 res!709991) b!1063353))

(assert (= (and b!1063353 res!709990) b!1063349))

(assert (= (and b!1063349 res!709995) b!1063352))

(assert (= (and b!1063352 (not res!709994)) b!1063357))

(assert (= (and b!1063357 (not res!709992)) b!1063355))

(assert (= (and b!1063351 condMapEmpty!39571) mapIsEmpty!39571))

(assert (= (and b!1063351 (not condMapEmpty!39571)) mapNonEmpty!39571))

(get-info :version)

(assert (= (and mapNonEmpty!39571 ((_ is ValueCellFull!11928) mapValue!39571)) b!1063350))

(assert (= (and b!1063351 ((_ is ValueCellFull!11928) mapDefault!39571)) b!1063356))

(assert (= start!94016 b!1063351))

(declare-fun m!982043 () Bool)

(assert (=> mapNonEmpty!39571 m!982043))

(declare-fun m!982045 () Bool)

(assert (=> start!94016 m!982045))

(declare-fun m!982047 () Bool)

(assert (=> start!94016 m!982047))

(declare-fun m!982049 () Bool)

(assert (=> start!94016 m!982049))

(declare-fun m!982051 () Bool)

(assert (=> b!1063349 m!982051))

(declare-fun m!982053 () Bool)

(assert (=> b!1063357 m!982053))

(declare-fun m!982055 () Bool)

(assert (=> b!1063357 m!982055))

(declare-fun m!982057 () Bool)

(assert (=> b!1063352 m!982057))

(declare-fun m!982059 () Bool)

(assert (=> b!1063352 m!982059))

(declare-fun m!982061 () Bool)

(assert (=> b!1063352 m!982061))

(declare-fun m!982063 () Bool)

(assert (=> b!1063353 m!982063))

(declare-fun m!982065 () Bool)

(assert (=> b!1063355 m!982065))

(declare-fun m!982067 () Bool)

(assert (=> b!1063355 m!982067))

(check-sat b_and!34185 (not b!1063349) (not start!94016) (not b!1063355) tp_is_empty!25263 (not b!1063357) (not b!1063352) (not mapNonEmpty!39571) (not b_next!21453) (not b!1063353))
(check-sat b_and!34185 (not b_next!21453))
