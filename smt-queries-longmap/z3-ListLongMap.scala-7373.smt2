; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93972 () Bool)

(assert start!93972)

(declare-fun b_free!21415 () Bool)

(declare-fun b_next!21415 () Bool)

(assert (=> start!93972 (= b_free!21415 (not b_next!21415))))

(declare-fun tp!75673 () Bool)

(declare-fun b_and!34121 () Bool)

(assert (=> start!93972 (= tp!75673 b_and!34121)))

(declare-fun b!1062683 () Bool)

(declare-fun e!605387 () Bool)

(declare-fun tp_is_empty!25225 () Bool)

(assert (=> b!1062683 (= e!605387 tp_is_empty!25225)))

(declare-fun b!1062684 () Bool)

(declare-fun e!605385 () Bool)

(declare-fun e!605384 () Bool)

(assert (=> b!1062684 (= e!605385 e!605384)))

(declare-fun res!709584 () Bool)

(assert (=> b!1062684 (=> res!709584 e!605384)))

(declare-datatypes ((V!38769 0))(
  ( (V!38770 (val!12663 Int)) )
))
(declare-datatypes ((tuple2!16090 0))(
  ( (tuple2!16091 (_1!8056 (_ BitVec 64)) (_2!8056 V!38769)) )
))
(declare-datatypes ((List!22641 0))(
  ( (Nil!22638) (Cons!22637 (h!23846 tuple2!16090) (t!31945 List!22641)) )
))
(declare-datatypes ((ListLongMap!14059 0))(
  ( (ListLongMap!14060 (toList!7045 List!22641)) )
))
(declare-fun lt!468156 () ListLongMap!14059)

(declare-fun contains!6214 (ListLongMap!14059 (_ BitVec 64)) Bool)

(assert (=> b!1062684 (= res!709584 (contains!6214 lt!468156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38769)

(declare-datatypes ((ValueCell!11909 0))(
  ( (ValueCellFull!11909 (v!15273 V!38769)) (EmptyCell!11909) )
))
(declare-datatypes ((array!67398 0))(
  ( (array!67399 (arr!32405 (Array (_ BitVec 32) ValueCell!11909)) (size!32943 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67398)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38769)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67400 0))(
  ( (array!67401 (arr!32406 (Array (_ BitVec 32) (_ BitVec 64))) (size!32944 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67400)

(declare-fun getCurrentListMap!3945 (array!67400 array!67398 (_ BitVec 32) (_ BitVec 32) V!38769 V!38769 (_ BitVec 32) Int) ListLongMap!14059)

(assert (=> b!1062684 (= lt!468156 (getCurrentListMap!3945 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709579 () Bool)

(declare-fun e!605386 () Bool)

(assert (=> start!93972 (=> (not res!709579) (not e!605386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93972 (= res!709579 (validMask!0 mask!1515))))

(assert (=> start!93972 e!605386))

(assert (=> start!93972 true))

(assert (=> start!93972 tp_is_empty!25225))

(declare-fun e!605383 () Bool)

(declare-fun array_inv!25108 (array!67398) Bool)

(assert (=> start!93972 (and (array_inv!25108 _values!955) e!605383)))

(assert (=> start!93972 tp!75673))

(declare-fun array_inv!25109 (array!67400) Bool)

(assert (=> start!93972 (array_inv!25109 _keys!1163)))

(declare-fun b!1062685 () Bool)

(assert (=> b!1062685 (= e!605384 true)))

(declare-fun -!565 (ListLongMap!14059 (_ BitVec 64)) ListLongMap!14059)

(assert (=> b!1062685 (= (-!565 lt!468156 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468156)))

(declare-datatypes ((Unit!34683 0))(
  ( (Unit!34684) )
))
(declare-fun lt!468158 () Unit!34683)

(declare-fun removeNotPresentStillSame!17 (ListLongMap!14059 (_ BitVec 64)) Unit!34683)

(assert (=> b!1062685 (= lt!468158 (removeNotPresentStillSame!17 lt!468156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062686 () Bool)

(declare-fun e!605382 () Bool)

(assert (=> b!1062686 (= e!605382 tp_is_empty!25225)))

(declare-fun b!1062687 () Bool)

(declare-fun res!709583 () Bool)

(assert (=> b!1062687 (=> (not res!709583) (not e!605386))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1062687 (= res!709583 (and (= (size!32943 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32944 _keys!1163) (size!32943 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062688 () Bool)

(declare-fun res!709581 () Bool)

(assert (=> b!1062688 (=> (not res!709581) (not e!605386))))

(declare-datatypes ((List!22642 0))(
  ( (Nil!22639) (Cons!22638 (h!23847 (_ BitVec 64)) (t!31946 List!22642)) )
))
(declare-fun arrayNoDuplicates!0 (array!67400 (_ BitVec 32) List!22642) Bool)

(assert (=> b!1062688 (= res!709581 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22639))))

(declare-fun b!1062689 () Bool)

(declare-fun res!709580 () Bool)

(assert (=> b!1062689 (=> (not res!709580) (not e!605386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67400 (_ BitVec 32)) Bool)

(assert (=> b!1062689 (= res!709580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062690 () Bool)

(declare-fun mapRes!39514 () Bool)

(assert (=> b!1062690 (= e!605383 (and e!605387 mapRes!39514))))

(declare-fun condMapEmpty!39514 () Bool)

(declare-fun mapDefault!39514 () ValueCell!11909)

(assert (=> b!1062690 (= condMapEmpty!39514 (= (arr!32405 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11909)) mapDefault!39514)))))

(declare-fun mapIsEmpty!39514 () Bool)

(assert (=> mapIsEmpty!39514 mapRes!39514))

(declare-fun b!1062691 () Bool)

(assert (=> b!1062691 (= e!605386 (not e!605385))))

(declare-fun res!709582 () Bool)

(assert (=> b!1062691 (=> res!709582 e!605385)))

(assert (=> b!1062691 (= res!709582 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468159 () ListLongMap!14059)

(declare-fun lt!468157 () ListLongMap!14059)

(assert (=> b!1062691 (= lt!468159 lt!468157)))

(declare-fun lt!468160 () Unit!34683)

(declare-fun zeroValueAfter!47 () V!38769)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!649 (array!67400 array!67398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38769 V!38769 V!38769 V!38769 (_ BitVec 32) Int) Unit!34683)

(assert (=> b!1062691 (= lt!468160 (lemmaNoChangeToArrayThenSameMapNoExtras!649 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3655 (array!67400 array!67398 (_ BitVec 32) (_ BitVec 32) V!38769 V!38769 (_ BitVec 32) Int) ListLongMap!14059)

(assert (=> b!1062691 (= lt!468157 (getCurrentListMapNoExtraKeys!3655 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062691 (= lt!468159 (getCurrentListMapNoExtraKeys!3655 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39514 () Bool)

(declare-fun tp!75674 () Bool)

(assert (=> mapNonEmpty!39514 (= mapRes!39514 (and tp!75674 e!605382))))

(declare-fun mapKey!39514 () (_ BitVec 32))

(declare-fun mapRest!39514 () (Array (_ BitVec 32) ValueCell!11909))

(declare-fun mapValue!39514 () ValueCell!11909)

(assert (=> mapNonEmpty!39514 (= (arr!32405 _values!955) (store mapRest!39514 mapKey!39514 mapValue!39514))))

(assert (= (and start!93972 res!709579) b!1062687))

(assert (= (and b!1062687 res!709583) b!1062689))

(assert (= (and b!1062689 res!709580) b!1062688))

(assert (= (and b!1062688 res!709581) b!1062691))

(assert (= (and b!1062691 (not res!709582)) b!1062684))

(assert (= (and b!1062684 (not res!709584)) b!1062685))

(assert (= (and b!1062690 condMapEmpty!39514) mapIsEmpty!39514))

(assert (= (and b!1062690 (not condMapEmpty!39514)) mapNonEmpty!39514))

(get-info :version)

(assert (= (and mapNonEmpty!39514 ((_ is ValueCellFull!11909) mapValue!39514)) b!1062686))

(assert (= (and b!1062690 ((_ is ValueCellFull!11909) mapDefault!39514)) b!1062683))

(assert (= start!93972 b!1062690))

(declare-fun m!980923 () Bool)

(assert (=> b!1062684 m!980923))

(declare-fun m!980925 () Bool)

(assert (=> b!1062684 m!980925))

(declare-fun m!980927 () Bool)

(assert (=> mapNonEmpty!39514 m!980927))

(declare-fun m!980929 () Bool)

(assert (=> start!93972 m!980929))

(declare-fun m!980931 () Bool)

(assert (=> start!93972 m!980931))

(declare-fun m!980933 () Bool)

(assert (=> start!93972 m!980933))

(declare-fun m!980935 () Bool)

(assert (=> b!1062689 m!980935))

(declare-fun m!980937 () Bool)

(assert (=> b!1062691 m!980937))

(declare-fun m!980939 () Bool)

(assert (=> b!1062691 m!980939))

(declare-fun m!980941 () Bool)

(assert (=> b!1062691 m!980941))

(declare-fun m!980943 () Bool)

(assert (=> b!1062688 m!980943))

(declare-fun m!980945 () Bool)

(assert (=> b!1062685 m!980945))

(declare-fun m!980947 () Bool)

(assert (=> b!1062685 m!980947))

(check-sat (not b!1062689) (not b!1062691) (not b_next!21415) (not start!93972) b_and!34121 (not b!1062688) tp_is_empty!25225 (not b!1062684) (not b!1062685) (not mapNonEmpty!39514))
(check-sat b_and!34121 (not b_next!21415))
