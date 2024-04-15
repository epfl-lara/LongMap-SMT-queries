; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93978 () Bool)

(assert start!93978)

(declare-fun b_free!21421 () Bool)

(declare-fun b_next!21421 () Bool)

(assert (=> start!93978 (= b_free!21421 (not b_next!21421))))

(declare-fun tp!75692 () Bool)

(declare-fun b_and!34127 () Bool)

(assert (=> start!93978 (= tp!75692 b_and!34127)))

(declare-fun b!1062764 () Bool)

(declare-fun e!605448 () Bool)

(declare-fun tp_is_empty!25231 () Bool)

(assert (=> b!1062764 (= e!605448 tp_is_empty!25231)))

(declare-fun b!1062765 () Bool)

(declare-fun e!605444 () Bool)

(declare-fun e!605445 () Bool)

(assert (=> b!1062765 (= e!605444 e!605445)))

(declare-fun res!709633 () Bool)

(assert (=> b!1062765 (=> res!709633 e!605445)))

(declare-datatypes ((V!38777 0))(
  ( (V!38778 (val!12666 Int)) )
))
(declare-datatypes ((tuple2!16094 0))(
  ( (tuple2!16095 (_1!8058 (_ BitVec 64)) (_2!8058 V!38777)) )
))
(declare-datatypes ((List!22645 0))(
  ( (Nil!22642) (Cons!22641 (h!23850 tuple2!16094) (t!31949 List!22645)) )
))
(declare-datatypes ((ListLongMap!14063 0))(
  ( (ListLongMap!14064 (toList!7047 List!22645)) )
))
(declare-fun lt!468202 () ListLongMap!14063)

(declare-fun contains!6216 (ListLongMap!14063 (_ BitVec 64)) Bool)

(assert (=> b!1062765 (= res!709633 (contains!6216 lt!468202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38777)

(declare-datatypes ((ValueCell!11912 0))(
  ( (ValueCellFull!11912 (v!15276 V!38777)) (EmptyCell!11912) )
))
(declare-datatypes ((array!67408 0))(
  ( (array!67409 (arr!32410 (Array (_ BitVec 32) ValueCell!11912)) (size!32948 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67408)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38777)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67410 0))(
  ( (array!67411 (arr!32411 (Array (_ BitVec 32) (_ BitVec 64))) (size!32949 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67410)

(declare-fun getCurrentListMap!3947 (array!67410 array!67408 (_ BitVec 32) (_ BitVec 32) V!38777 V!38777 (_ BitVec 32) Int) ListLongMap!14063)

(assert (=> b!1062765 (= lt!468202 (getCurrentListMap!3947 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39523 () Bool)

(declare-fun mapRes!39523 () Bool)

(assert (=> mapIsEmpty!39523 mapRes!39523))

(declare-fun mapNonEmpty!39523 () Bool)

(declare-fun tp!75691 () Bool)

(declare-fun e!605449 () Bool)

(assert (=> mapNonEmpty!39523 (= mapRes!39523 (and tp!75691 e!605449))))

(declare-fun mapValue!39523 () ValueCell!11912)

(declare-fun mapKey!39523 () (_ BitVec 32))

(declare-fun mapRest!39523 () (Array (_ BitVec 32) ValueCell!11912))

(assert (=> mapNonEmpty!39523 (= (arr!32410 _values!955) (store mapRest!39523 mapKey!39523 mapValue!39523))))

(declare-fun b!1062767 () Bool)

(declare-fun res!709635 () Bool)

(declare-fun e!605447 () Bool)

(assert (=> b!1062767 (=> (not res!709635) (not e!605447))))

(declare-datatypes ((List!22646 0))(
  ( (Nil!22643) (Cons!22642 (h!23851 (_ BitVec 64)) (t!31950 List!22646)) )
))
(declare-fun arrayNoDuplicates!0 (array!67410 (_ BitVec 32) List!22646) Bool)

(assert (=> b!1062767 (= res!709635 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22643))))

(declare-fun b!1062768 () Bool)

(declare-fun e!605446 () Bool)

(assert (=> b!1062768 (= e!605446 (and e!605448 mapRes!39523))))

(declare-fun condMapEmpty!39523 () Bool)

(declare-fun mapDefault!39523 () ValueCell!11912)

(assert (=> b!1062768 (= condMapEmpty!39523 (= (arr!32410 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11912)) mapDefault!39523)))))

(declare-fun b!1062769 () Bool)

(declare-fun res!709638 () Bool)

(assert (=> b!1062769 (=> (not res!709638) (not e!605447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67410 (_ BitVec 32)) Bool)

(assert (=> b!1062769 (= res!709638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062770 () Bool)

(assert (=> b!1062770 (= e!605445 true)))

(declare-fun -!567 (ListLongMap!14063 (_ BitVec 64)) ListLongMap!14063)

(assert (=> b!1062770 (= (-!567 lt!468202 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468202)))

(declare-datatypes ((Unit!34687 0))(
  ( (Unit!34688) )
))
(declare-fun lt!468203 () Unit!34687)

(declare-fun removeNotPresentStillSame!19 (ListLongMap!14063 (_ BitVec 64)) Unit!34687)

(assert (=> b!1062770 (= lt!468203 (removeNotPresentStillSame!19 lt!468202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062766 () Bool)

(assert (=> b!1062766 (= e!605449 tp_is_empty!25231)))

(declare-fun res!709636 () Bool)

(assert (=> start!93978 (=> (not res!709636) (not e!605447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93978 (= res!709636 (validMask!0 mask!1515))))

(assert (=> start!93978 e!605447))

(assert (=> start!93978 true))

(assert (=> start!93978 tp_is_empty!25231))

(declare-fun array_inv!25112 (array!67408) Bool)

(assert (=> start!93978 (and (array_inv!25112 _values!955) e!605446)))

(assert (=> start!93978 tp!75692))

(declare-fun array_inv!25113 (array!67410) Bool)

(assert (=> start!93978 (array_inv!25113 _keys!1163)))

(declare-fun b!1062771 () Bool)

(declare-fun res!709634 () Bool)

(assert (=> b!1062771 (=> (not res!709634) (not e!605447))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1062771 (= res!709634 (and (= (size!32948 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32949 _keys!1163) (size!32948 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062772 () Bool)

(assert (=> b!1062772 (= e!605447 (not e!605444))))

(declare-fun res!709637 () Bool)

(assert (=> b!1062772 (=> res!709637 e!605444)))

(assert (=> b!1062772 (= res!709637 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468204 () ListLongMap!14063)

(declare-fun lt!468205 () ListLongMap!14063)

(assert (=> b!1062772 (= lt!468204 lt!468205)))

(declare-fun lt!468201 () Unit!34687)

(declare-fun zeroValueAfter!47 () V!38777)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!650 (array!67410 array!67408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38777 V!38777 V!38777 V!38777 (_ BitVec 32) Int) Unit!34687)

(assert (=> b!1062772 (= lt!468201 (lemmaNoChangeToArrayThenSameMapNoExtras!650 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3656 (array!67410 array!67408 (_ BitVec 32) (_ BitVec 32) V!38777 V!38777 (_ BitVec 32) Int) ListLongMap!14063)

(assert (=> b!1062772 (= lt!468205 (getCurrentListMapNoExtraKeys!3656 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062772 (= lt!468204 (getCurrentListMapNoExtraKeys!3656 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!93978 res!709636) b!1062771))

(assert (= (and b!1062771 res!709634) b!1062769))

(assert (= (and b!1062769 res!709638) b!1062767))

(assert (= (and b!1062767 res!709635) b!1062772))

(assert (= (and b!1062772 (not res!709637)) b!1062765))

(assert (= (and b!1062765 (not res!709633)) b!1062770))

(assert (= (and b!1062768 condMapEmpty!39523) mapIsEmpty!39523))

(assert (= (and b!1062768 (not condMapEmpty!39523)) mapNonEmpty!39523))

(get-info :version)

(assert (= (and mapNonEmpty!39523 ((_ is ValueCellFull!11912) mapValue!39523)) b!1062766))

(assert (= (and b!1062768 ((_ is ValueCellFull!11912) mapDefault!39523)) b!1062764))

(assert (= start!93978 b!1062768))

(declare-fun m!981001 () Bool)

(assert (=> mapNonEmpty!39523 m!981001))

(declare-fun m!981003 () Bool)

(assert (=> start!93978 m!981003))

(declare-fun m!981005 () Bool)

(assert (=> start!93978 m!981005))

(declare-fun m!981007 () Bool)

(assert (=> start!93978 m!981007))

(declare-fun m!981009 () Bool)

(assert (=> b!1062772 m!981009))

(declare-fun m!981011 () Bool)

(assert (=> b!1062772 m!981011))

(declare-fun m!981013 () Bool)

(assert (=> b!1062772 m!981013))

(declare-fun m!981015 () Bool)

(assert (=> b!1062765 m!981015))

(declare-fun m!981017 () Bool)

(assert (=> b!1062765 m!981017))

(declare-fun m!981019 () Bool)

(assert (=> b!1062767 m!981019))

(declare-fun m!981021 () Bool)

(assert (=> b!1062770 m!981021))

(declare-fun m!981023 () Bool)

(assert (=> b!1062770 m!981023))

(declare-fun m!981025 () Bool)

(assert (=> b!1062769 m!981025))

(check-sat b_and!34127 (not b!1062767) (not start!93978) (not mapNonEmpty!39523) (not b!1062769) tp_is_empty!25231 (not b!1062765) (not b_next!21421) (not b!1062770) (not b!1062772))
(check-sat b_and!34127 (not b_next!21421))
