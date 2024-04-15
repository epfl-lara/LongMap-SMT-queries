; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105160 () Bool)

(assert start!105160)

(declare-fun b_free!26881 () Bool)

(declare-fun b_next!26881 () Bool)

(assert (=> start!105160 (= b_free!26881 (not b_next!26881))))

(declare-fun tp!94148 () Bool)

(declare-fun b_and!44677 () Bool)

(assert (=> start!105160 (= tp!94148 b_and!44677)))

(declare-fun mapNonEmpty!49450 () Bool)

(declare-fun mapRes!49450 () Bool)

(declare-fun tp!94147 () Bool)

(declare-fun e!711840 () Bool)

(assert (=> mapNonEmpty!49450 (= mapRes!49450 (and tp!94147 e!711840))))

(declare-datatypes ((V!47743 0))(
  ( (V!47744 (val!15954 Int)) )
))
(declare-datatypes ((ValueCell!15128 0))(
  ( (ValueCellFull!15128 (v!18651 V!47743)) (EmptyCell!15128) )
))
(declare-datatypes ((array!81153 0))(
  ( (array!81154 (arr!39139 (Array (_ BitVec 32) ValueCell!15128)) (size!39677 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81153)

(declare-fun mapValue!49450 () ValueCell!15128)

(declare-fun mapKey!49450 () (_ BitVec 32))

(declare-fun mapRest!49450 () (Array (_ BitVec 32) ValueCell!15128))

(assert (=> mapNonEmpty!49450 (= (arr!39139 _values!914) (store mapRest!49450 mapKey!49450 mapValue!49450))))

(declare-fun b!1253108 () Bool)

(declare-fun e!711845 () Bool)

(assert (=> b!1253108 (= e!711845 true)))

(declare-fun lt!565564 () Bool)

(declare-datatypes ((tuple2!20672 0))(
  ( (tuple2!20673 (_1!10347 (_ BitVec 64)) (_2!10347 V!47743)) )
))
(declare-datatypes ((List!27888 0))(
  ( (Nil!27885) (Cons!27884 (h!29093 tuple2!20672) (t!41360 List!27888)) )
))
(declare-datatypes ((ListLongMap!18545 0))(
  ( (ListLongMap!18546 (toList!9288 List!27888)) )
))
(declare-fun lt!565563 () ListLongMap!18545)

(declare-fun contains!7490 (ListLongMap!18545 (_ BitVec 64)) Bool)

(assert (=> b!1253108 (= lt!565564 (contains!7490 lt!565563 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!711843 () Bool)

(assert (=> b!1253108 e!711843))

(declare-fun res!835629 () Bool)

(assert (=> b!1253108 (=> (not res!835629) (not e!711843))))

(declare-fun lt!565565 () ListLongMap!18545)

(declare-fun minValueBefore!43 () V!47743)

(declare-fun +!4189 (ListLongMap!18545 tuple2!20672) ListLongMap!18545)

(assert (=> b!1253108 (= res!835629 (= lt!565565 (+!4189 lt!565563 (tuple2!20673 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!565562 () ListLongMap!18545)

(declare-fun minValueAfter!43 () V!47743)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47743)

(declare-datatypes ((array!81155 0))(
  ( (array!81156 (arr!39140 (Array (_ BitVec 32) (_ BitVec 64))) (size!39678 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81155)

(declare-fun getCurrentListMap!4425 (array!81155 array!81153 (_ BitVec 32) (_ BitVec 32) V!47743 V!47743 (_ BitVec 32) Int) ListLongMap!18545)

(assert (=> b!1253108 (= lt!565562 (getCurrentListMap!4425 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253108 (= lt!565565 (getCurrentListMap!4425 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253109 () Bool)

(declare-fun res!835630 () Bool)

(declare-fun e!711842 () Bool)

(assert (=> b!1253109 (=> (not res!835630) (not e!711842))))

(declare-datatypes ((List!27889 0))(
  ( (Nil!27886) (Cons!27885 (h!29094 (_ BitVec 64)) (t!41361 List!27889)) )
))
(declare-fun arrayNoDuplicates!0 (array!81155 (_ BitVec 32) List!27889) Bool)

(assert (=> b!1253109 (= res!835630 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27886))))

(declare-fun mapIsEmpty!49450 () Bool)

(assert (=> mapIsEmpty!49450 mapRes!49450))

(declare-fun b!1253110 () Bool)

(declare-fun e!711844 () Bool)

(declare-fun tp_is_empty!31783 () Bool)

(assert (=> b!1253110 (= e!711844 tp_is_empty!31783)))

(declare-fun b!1253111 () Bool)

(assert (=> b!1253111 (= e!711842 (not e!711845))))

(declare-fun res!835628 () Bool)

(assert (=> b!1253111 (=> res!835628 e!711845)))

(assert (=> b!1253111 (= res!835628 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565566 () ListLongMap!18545)

(assert (=> b!1253111 (= lt!565563 lt!565566)))

(declare-datatypes ((Unit!41541 0))(
  ( (Unit!41542) )
))
(declare-fun lt!565567 () Unit!41541)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1013 (array!81155 array!81153 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47743 V!47743 V!47743 V!47743 (_ BitVec 32) Int) Unit!41541)

(assert (=> b!1253111 (= lt!565567 (lemmaNoChangeToArrayThenSameMapNoExtras!1013 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5691 (array!81155 array!81153 (_ BitVec 32) (_ BitVec 32) V!47743 V!47743 (_ BitVec 32) Int) ListLongMap!18545)

(assert (=> b!1253111 (= lt!565566 (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253111 (= lt!565563 (getCurrentListMapNoExtraKeys!5691 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253112 () Bool)

(declare-fun e!711841 () Bool)

(assert (=> b!1253112 (= e!711841 (and e!711844 mapRes!49450))))

(declare-fun condMapEmpty!49450 () Bool)

(declare-fun mapDefault!49450 () ValueCell!15128)

(assert (=> b!1253112 (= condMapEmpty!49450 (= (arr!39139 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15128)) mapDefault!49450)))))

(declare-fun res!835632 () Bool)

(assert (=> start!105160 (=> (not res!835632) (not e!711842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105160 (= res!835632 (validMask!0 mask!1466))))

(assert (=> start!105160 e!711842))

(assert (=> start!105160 true))

(assert (=> start!105160 tp!94148))

(assert (=> start!105160 tp_is_empty!31783))

(declare-fun array_inv!29969 (array!81155) Bool)

(assert (=> start!105160 (array_inv!29969 _keys!1118)))

(declare-fun array_inv!29970 (array!81153) Bool)

(assert (=> start!105160 (and (array_inv!29970 _values!914) e!711841)))

(declare-fun b!1253113 () Bool)

(assert (=> b!1253113 (= e!711840 tp_is_empty!31783)))

(declare-fun b!1253114 () Bool)

(declare-fun res!835631 () Bool)

(assert (=> b!1253114 (=> (not res!835631) (not e!711842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81155 (_ BitVec 32)) Bool)

(assert (=> b!1253114 (= res!835631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253115 () Bool)

(assert (=> b!1253115 (= e!711843 (= lt!565562 lt!565566))))

(declare-fun b!1253116 () Bool)

(declare-fun res!835633 () Bool)

(assert (=> b!1253116 (=> (not res!835633) (not e!711842))))

(assert (=> b!1253116 (= res!835633 (and (= (size!39677 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39678 _keys!1118) (size!39677 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105160 res!835632) b!1253116))

(assert (= (and b!1253116 res!835633) b!1253114))

(assert (= (and b!1253114 res!835631) b!1253109))

(assert (= (and b!1253109 res!835630) b!1253111))

(assert (= (and b!1253111 (not res!835628)) b!1253108))

(assert (= (and b!1253108 res!835629) b!1253115))

(assert (= (and b!1253112 condMapEmpty!49450) mapIsEmpty!49450))

(assert (= (and b!1253112 (not condMapEmpty!49450)) mapNonEmpty!49450))

(get-info :version)

(assert (= (and mapNonEmpty!49450 ((_ is ValueCellFull!15128) mapValue!49450)) b!1253113))

(assert (= (and b!1253112 ((_ is ValueCellFull!15128) mapDefault!49450)) b!1253110))

(assert (= start!105160 b!1253112))

(declare-fun m!1153157 () Bool)

(assert (=> b!1253108 m!1153157))

(declare-fun m!1153159 () Bool)

(assert (=> b!1253108 m!1153159))

(declare-fun m!1153161 () Bool)

(assert (=> b!1253108 m!1153161))

(declare-fun m!1153163 () Bool)

(assert (=> b!1253108 m!1153163))

(declare-fun m!1153165 () Bool)

(assert (=> b!1253111 m!1153165))

(declare-fun m!1153167 () Bool)

(assert (=> b!1253111 m!1153167))

(declare-fun m!1153169 () Bool)

(assert (=> b!1253111 m!1153169))

(declare-fun m!1153171 () Bool)

(assert (=> b!1253109 m!1153171))

(declare-fun m!1153173 () Bool)

(assert (=> start!105160 m!1153173))

(declare-fun m!1153175 () Bool)

(assert (=> start!105160 m!1153175))

(declare-fun m!1153177 () Bool)

(assert (=> start!105160 m!1153177))

(declare-fun m!1153179 () Bool)

(assert (=> b!1253114 m!1153179))

(declare-fun m!1153181 () Bool)

(assert (=> mapNonEmpty!49450 m!1153181))

(check-sat (not mapNonEmpty!49450) (not b!1253114) (not b!1253109) (not b!1253108) (not b!1253111) (not b_next!26881) b_and!44677 (not start!105160) tp_is_empty!31783)
(check-sat b_and!44677 (not b_next!26881))
