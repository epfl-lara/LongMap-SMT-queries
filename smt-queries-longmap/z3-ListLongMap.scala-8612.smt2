; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104912 () Bool)

(assert start!104912)

(declare-fun b_free!26707 () Bool)

(declare-fun b_next!26707 () Bool)

(assert (=> start!104912 (= b_free!26707 (not b_next!26707))))

(declare-fun tp!93613 () Bool)

(declare-fun b_and!44465 () Bool)

(assert (=> start!104912 (= tp!93613 b_and!44465)))

(declare-fun res!834099 () Bool)

(declare-fun e!709909 () Bool)

(assert (=> start!104912 (=> (not res!834099) (not e!709909))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104912 (= res!834099 (validMask!0 mask!1466))))

(assert (=> start!104912 e!709909))

(assert (=> start!104912 true))

(assert (=> start!104912 tp!93613))

(declare-fun tp_is_empty!31609 () Bool)

(assert (=> start!104912 tp_is_empty!31609))

(declare-datatypes ((array!80807 0))(
  ( (array!80808 (arr!38970 (Array (_ BitVec 32) (_ BitVec 64))) (size!39508 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80807)

(declare-fun array_inv!29861 (array!80807) Bool)

(assert (=> start!104912 (array_inv!29861 _keys!1118)))

(declare-datatypes ((V!47511 0))(
  ( (V!47512 (val!15867 Int)) )
))
(declare-datatypes ((ValueCell!15041 0))(
  ( (ValueCellFull!15041 (v!18562 V!47511)) (EmptyCell!15041) )
))
(declare-datatypes ((array!80809 0))(
  ( (array!80810 (arr!38971 (Array (_ BitVec 32) ValueCell!15041)) (size!39509 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80809)

(declare-fun e!709910 () Bool)

(declare-fun array_inv!29862 (array!80809) Bool)

(assert (=> start!104912 (and (array_inv!29862 _values!914) e!709910)))

(declare-fun b!1250455 () Bool)

(declare-fun e!709912 () Bool)

(assert (=> b!1250455 (= e!709909 (not e!709912))))

(declare-fun res!834095 () Bool)

(assert (=> b!1250455 (=> res!834095 e!709912)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250455 (= res!834095 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20532 0))(
  ( (tuple2!20533 (_1!10277 (_ BitVec 64)) (_2!10277 V!47511)) )
))
(declare-datatypes ((List!27756 0))(
  ( (Nil!27753) (Cons!27752 (h!28961 tuple2!20532) (t!41220 List!27756)) )
))
(declare-datatypes ((ListLongMap!18405 0))(
  ( (ListLongMap!18406 (toList!9218 List!27756)) )
))
(declare-fun lt!564107 () ListLongMap!18405)

(declare-fun lt!564108 () ListLongMap!18405)

(assert (=> b!1250455 (= lt!564107 lt!564108)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47511)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47511)

(declare-fun zeroValue!871 () V!47511)

(declare-datatypes ((Unit!41400 0))(
  ( (Unit!41401) )
))
(declare-fun lt!564105 () Unit!41400)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!950 (array!80807 array!80809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47511 V!47511 V!47511 V!47511 (_ BitVec 32) Int) Unit!41400)

(assert (=> b!1250455 (= lt!564105 (lemmaNoChangeToArrayThenSameMapNoExtras!950 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5628 (array!80807 array!80809 (_ BitVec 32) (_ BitVec 32) V!47511 V!47511 (_ BitVec 32) Int) ListLongMap!18405)

(assert (=> b!1250455 (= lt!564108 (getCurrentListMapNoExtraKeys!5628 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250455 (= lt!564107 (getCurrentListMapNoExtraKeys!5628 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250456 () Bool)

(declare-fun res!834097 () Bool)

(assert (=> b!1250456 (=> (not res!834097) (not e!709909))))

(declare-datatypes ((List!27757 0))(
  ( (Nil!27754) (Cons!27753 (h!28962 (_ BitVec 64)) (t!41221 List!27757)) )
))
(declare-fun arrayNoDuplicates!0 (array!80807 (_ BitVec 32) List!27757) Bool)

(assert (=> b!1250456 (= res!834097 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27754))))

(declare-fun mapIsEmpty!49177 () Bool)

(declare-fun mapRes!49177 () Bool)

(assert (=> mapIsEmpty!49177 mapRes!49177))

(declare-fun b!1250457 () Bool)

(declare-fun e!709911 () Bool)

(assert (=> b!1250457 (= e!709911 true)))

(declare-fun lt!564104 () ListLongMap!18405)

(declare-fun -!1964 (ListLongMap!18405 (_ BitVec 64)) ListLongMap!18405)

(assert (=> b!1250457 (= (-!1964 lt!564104 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564104)))

(declare-fun lt!564106 () Unit!41400)

(declare-fun removeNotPresentStillSame!92 (ListLongMap!18405 (_ BitVec 64)) Unit!41400)

(assert (=> b!1250457 (= lt!564106 (removeNotPresentStillSame!92 lt!564104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250458 () Bool)

(declare-fun e!709913 () Bool)

(assert (=> b!1250458 (= e!709913 tp_is_empty!31609)))

(declare-fun b!1250459 () Bool)

(assert (=> b!1250459 (= e!709910 (and e!709913 mapRes!49177))))

(declare-fun condMapEmpty!49177 () Bool)

(declare-fun mapDefault!49177 () ValueCell!15041)

(assert (=> b!1250459 (= condMapEmpty!49177 (= (arr!38971 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15041)) mapDefault!49177)))))

(declare-fun b!1250460 () Bool)

(declare-fun res!834094 () Bool)

(assert (=> b!1250460 (=> (not res!834094) (not e!709909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80807 (_ BitVec 32)) Bool)

(assert (=> b!1250460 (= res!834094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250461 () Bool)

(declare-fun e!709907 () Bool)

(assert (=> b!1250461 (= e!709907 tp_is_empty!31609)))

(declare-fun b!1250462 () Bool)

(declare-fun res!834098 () Bool)

(assert (=> b!1250462 (=> (not res!834098) (not e!709909))))

(assert (=> b!1250462 (= res!834098 (and (= (size!39509 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39508 _keys!1118) (size!39509 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250463 () Bool)

(assert (=> b!1250463 (= e!709912 e!709911)))

(declare-fun res!834096 () Bool)

(assert (=> b!1250463 (=> res!834096 e!709911)))

(declare-fun contains!7463 (ListLongMap!18405 (_ BitVec 64)) Bool)

(assert (=> b!1250463 (= res!834096 (contains!7463 lt!564104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4390 (array!80807 array!80809 (_ BitVec 32) (_ BitVec 32) V!47511 V!47511 (_ BitVec 32) Int) ListLongMap!18405)

(assert (=> b!1250463 (= lt!564104 (getCurrentListMap!4390 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49177 () Bool)

(declare-fun tp!93614 () Bool)

(assert (=> mapNonEmpty!49177 (= mapRes!49177 (and tp!93614 e!709907))))

(declare-fun mapValue!49177 () ValueCell!15041)

(declare-fun mapKey!49177 () (_ BitVec 32))

(declare-fun mapRest!49177 () (Array (_ BitVec 32) ValueCell!15041))

(assert (=> mapNonEmpty!49177 (= (arr!38971 _values!914) (store mapRest!49177 mapKey!49177 mapValue!49177))))

(assert (= (and start!104912 res!834099) b!1250462))

(assert (= (and b!1250462 res!834098) b!1250460))

(assert (= (and b!1250460 res!834094) b!1250456))

(assert (= (and b!1250456 res!834097) b!1250455))

(assert (= (and b!1250455 (not res!834095)) b!1250463))

(assert (= (and b!1250463 (not res!834096)) b!1250457))

(assert (= (and b!1250459 condMapEmpty!49177) mapIsEmpty!49177))

(assert (= (and b!1250459 (not condMapEmpty!49177)) mapNonEmpty!49177))

(get-info :version)

(assert (= (and mapNonEmpty!49177 ((_ is ValueCellFull!15041) mapValue!49177)) b!1250461))

(assert (= (and b!1250459 ((_ is ValueCellFull!15041) mapDefault!49177)) b!1250458))

(assert (= start!104912 b!1250459))

(declare-fun m!1150843 () Bool)

(assert (=> start!104912 m!1150843))

(declare-fun m!1150845 () Bool)

(assert (=> start!104912 m!1150845))

(declare-fun m!1150847 () Bool)

(assert (=> start!104912 m!1150847))

(declare-fun m!1150849 () Bool)

(assert (=> b!1250457 m!1150849))

(declare-fun m!1150851 () Bool)

(assert (=> b!1250457 m!1150851))

(declare-fun m!1150853 () Bool)

(assert (=> b!1250456 m!1150853))

(declare-fun m!1150855 () Bool)

(assert (=> mapNonEmpty!49177 m!1150855))

(declare-fun m!1150857 () Bool)

(assert (=> b!1250455 m!1150857))

(declare-fun m!1150859 () Bool)

(assert (=> b!1250455 m!1150859))

(declare-fun m!1150861 () Bool)

(assert (=> b!1250455 m!1150861))

(declare-fun m!1150863 () Bool)

(assert (=> b!1250463 m!1150863))

(declare-fun m!1150865 () Bool)

(assert (=> b!1250463 m!1150865))

(declare-fun m!1150867 () Bool)

(assert (=> b!1250460 m!1150867))

(check-sat (not b_next!26707) (not b!1250455) b_and!44465 (not b!1250456) tp_is_empty!31609 (not b!1250457) (not b!1250460) (not start!104912) (not mapNonEmpty!49177) (not b!1250463))
(check-sat b_and!44465 (not b_next!26707))
