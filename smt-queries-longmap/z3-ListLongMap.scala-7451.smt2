; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94602 () Bool)

(assert start!94602)

(declare-fun b_free!21885 () Bool)

(declare-fun b_next!21885 () Bool)

(assert (=> start!94602 (= b_free!21885 (not b_next!21885))))

(declare-fun tp!77108 () Bool)

(declare-fun b_and!34697 () Bool)

(assert (=> start!94602 (= tp!77108 b_and!34697)))

(declare-fun b!1069681 () Bool)

(declare-fun res!713690 () Bool)

(declare-fun e!610494 () Bool)

(assert (=> b!1069681 (=> (not res!713690) (not e!610494))))

(declare-datatypes ((array!68367 0))(
  ( (array!68368 (arr!32881 (Array (_ BitVec 32) (_ BitVec 64))) (size!33417 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68367)

(declare-datatypes ((List!22937 0))(
  ( (Nil!22934) (Cons!22933 (h!24142 (_ BitVec 64)) (t!32266 List!22937)) )
))
(declare-fun arrayNoDuplicates!0 (array!68367 (_ BitVec 32) List!22937) Bool)

(assert (=> b!1069681 (= res!713690 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22934))))

(declare-fun b!1069682 () Bool)

(declare-fun res!713688 () Bool)

(assert (=> b!1069682 (=> (not res!713688) (not e!610494))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68367 (_ BitVec 32)) Bool)

(assert (=> b!1069682 (= res!713688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40243 () Bool)

(declare-fun mapRes!40243 () Bool)

(assert (=> mapIsEmpty!40243 mapRes!40243))

(declare-fun mapNonEmpty!40243 () Bool)

(declare-fun tp!77107 () Bool)

(declare-fun e!610495 () Bool)

(assert (=> mapNonEmpty!40243 (= mapRes!40243 (and tp!77107 e!610495))))

(declare-datatypes ((V!39395 0))(
  ( (V!39396 (val!12898 Int)) )
))
(declare-datatypes ((ValueCell!12144 0))(
  ( (ValueCellFull!12144 (v!15514 V!39395)) (EmptyCell!12144) )
))
(declare-fun mapValue!40243 () ValueCell!12144)

(declare-fun mapKey!40243 () (_ BitVec 32))

(declare-fun mapRest!40243 () (Array (_ BitVec 32) ValueCell!12144))

(declare-datatypes ((array!68369 0))(
  ( (array!68370 (arr!32882 (Array (_ BitVec 32) ValueCell!12144)) (size!33418 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68369)

(assert (=> mapNonEmpty!40243 (= (arr!32882 _values!955) (store mapRest!40243 mapKey!40243 mapValue!40243))))

(declare-fun b!1069683 () Bool)

(declare-fun e!610496 () Bool)

(declare-fun e!610493 () Bool)

(assert (=> b!1069683 (= e!610496 (and e!610493 mapRes!40243))))

(declare-fun condMapEmpty!40243 () Bool)

(declare-fun mapDefault!40243 () ValueCell!12144)

(assert (=> b!1069683 (= condMapEmpty!40243 (= (arr!32882 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12144)) mapDefault!40243)))))

(declare-fun b!1069680 () Bool)

(declare-fun tp_is_empty!25695 () Bool)

(assert (=> b!1069680 (= e!610495 tp_is_empty!25695)))

(declare-fun res!713689 () Bool)

(assert (=> start!94602 (=> (not res!713689) (not e!610494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94602 (= res!713689 (validMask!0 mask!1515))))

(assert (=> start!94602 e!610494))

(assert (=> start!94602 true))

(assert (=> start!94602 tp_is_empty!25695))

(declare-fun array_inv!25442 (array!68369) Bool)

(assert (=> start!94602 (and (array_inv!25442 _values!955) e!610496)))

(assert (=> start!94602 tp!77108))

(declare-fun array_inv!25443 (array!68367) Bool)

(assert (=> start!94602 (array_inv!25443 _keys!1163)))

(declare-fun b!1069684 () Bool)

(assert (=> b!1069684 (= e!610494 (not true))))

(declare-datatypes ((tuple2!16394 0))(
  ( (tuple2!16395 (_1!8208 (_ BitVec 64)) (_2!8208 V!39395)) )
))
(declare-datatypes ((List!22938 0))(
  ( (Nil!22935) (Cons!22934 (h!24143 tuple2!16394) (t!32267 List!22938)) )
))
(declare-datatypes ((ListLongMap!14363 0))(
  ( (ListLongMap!14364 (toList!7197 List!22938)) )
))
(declare-fun lt!472714 () ListLongMap!14363)

(declare-fun lt!472715 () ListLongMap!14363)

(assert (=> b!1069684 (= lt!472714 lt!472715)))

(declare-fun zeroValueBefore!47 () V!39395)

(declare-datatypes ((Unit!35193 0))(
  ( (Unit!35194) )
))
(declare-fun lt!472716 () Unit!35193)

(declare-fun minValue!907 () V!39395)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39395)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!810 (array!68367 array!68369 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39395 V!39395 V!39395 V!39395 (_ BitVec 32) Int) Unit!35193)

(assert (=> b!1069684 (= lt!472716 (lemmaNoChangeToArrayThenSameMapNoExtras!810 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3773 (array!68367 array!68369 (_ BitVec 32) (_ BitVec 32) V!39395 V!39395 (_ BitVec 32) Int) ListLongMap!14363)

(assert (=> b!1069684 (= lt!472715 (getCurrentListMapNoExtraKeys!3773 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069684 (= lt!472714 (getCurrentListMapNoExtraKeys!3773 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069685 () Bool)

(assert (=> b!1069685 (= e!610493 tp_is_empty!25695)))

(declare-fun b!1069686 () Bool)

(declare-fun res!713687 () Bool)

(assert (=> b!1069686 (=> (not res!713687) (not e!610494))))

(assert (=> b!1069686 (= res!713687 (and (= (size!33418 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33417 _keys!1163) (size!33418 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94602 res!713689) b!1069686))

(assert (= (and b!1069686 res!713687) b!1069682))

(assert (= (and b!1069682 res!713688) b!1069681))

(assert (= (and b!1069681 res!713690) b!1069684))

(assert (= (and b!1069683 condMapEmpty!40243) mapIsEmpty!40243))

(assert (= (and b!1069683 (not condMapEmpty!40243)) mapNonEmpty!40243))

(get-info :version)

(assert (= (and mapNonEmpty!40243 ((_ is ValueCellFull!12144) mapValue!40243)) b!1069680))

(assert (= (and b!1069683 ((_ is ValueCellFull!12144) mapDefault!40243)) b!1069685))

(assert (= start!94602 b!1069683))

(declare-fun m!988155 () Bool)

(assert (=> b!1069681 m!988155))

(declare-fun m!988157 () Bool)

(assert (=> b!1069684 m!988157))

(declare-fun m!988159 () Bool)

(assert (=> b!1069684 m!988159))

(declare-fun m!988161 () Bool)

(assert (=> b!1069684 m!988161))

(declare-fun m!988163 () Bool)

(assert (=> mapNonEmpty!40243 m!988163))

(declare-fun m!988165 () Bool)

(assert (=> b!1069682 m!988165))

(declare-fun m!988167 () Bool)

(assert (=> start!94602 m!988167))

(declare-fun m!988169 () Bool)

(assert (=> start!94602 m!988169))

(declare-fun m!988171 () Bool)

(assert (=> start!94602 m!988171))

(check-sat (not b!1069681) (not start!94602) b_and!34697 tp_is_empty!25695 (not b!1069682) (not b_next!21885) (not b!1069684) (not mapNonEmpty!40243))
(check-sat b_and!34697 (not b_next!21885))
