; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104900 () Bool)

(assert start!104900)

(declare-fun b_free!26691 () Bool)

(declare-fun b_next!26691 () Bool)

(assert (=> start!104900 (= b_free!26691 (not b_next!26691))))

(declare-fun tp!93565 () Bool)

(declare-fun b_and!44467 () Bool)

(assert (=> start!104900 (= tp!93565 b_and!44467)))

(declare-fun mapIsEmpty!49153 () Bool)

(declare-fun mapRes!49153 () Bool)

(assert (=> mapIsEmpty!49153 mapRes!49153))

(declare-fun b!1250321 () Bool)

(declare-fun e!709785 () Bool)

(declare-fun tp_is_empty!31593 () Bool)

(assert (=> b!1250321 (= e!709785 tp_is_empty!31593)))

(declare-fun b!1250322 () Bool)

(declare-fun e!709787 () Bool)

(assert (=> b!1250322 (= e!709787 (and e!709785 mapRes!49153))))

(declare-fun condMapEmpty!49153 () Bool)

(declare-datatypes ((V!47489 0))(
  ( (V!47490 (val!15859 Int)) )
))
(declare-datatypes ((ValueCell!15033 0))(
  ( (ValueCellFull!15033 (v!18555 V!47489)) (EmptyCell!15033) )
))
(declare-datatypes ((array!80856 0))(
  ( (array!80857 (arr!38994 (Array (_ BitVec 32) ValueCell!15033)) (size!39530 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80856)

(declare-fun mapDefault!49153 () ValueCell!15033)

(assert (=> b!1250322 (= condMapEmpty!49153 (= (arr!38994 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15033)) mapDefault!49153)))))

(declare-fun b!1250323 () Bool)

(declare-fun res!833993 () Bool)

(declare-fun e!709786 () Bool)

(assert (=> b!1250323 (=> (not res!833993) (not e!709786))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80858 0))(
  ( (array!80859 (arr!38995 (Array (_ BitVec 32) (_ BitVec 64))) (size!39531 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80858)

(assert (=> b!1250323 (= res!833993 (and (= (size!39530 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39531 _keys!1118) (size!39530 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250324 () Bool)

(declare-fun e!709784 () Bool)

(assert (=> b!1250324 (= e!709786 (not e!709784))))

(declare-fun res!833995 () Bool)

(assert (=> b!1250324 (=> res!833995 e!709784)))

(assert (=> b!1250324 (= res!833995 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20432 0))(
  ( (tuple2!20433 (_1!10227 (_ BitVec 64)) (_2!10227 V!47489)) )
))
(declare-datatypes ((List!27674 0))(
  ( (Nil!27671) (Cons!27670 (h!28879 tuple2!20432) (t!41147 List!27674)) )
))
(declare-datatypes ((ListLongMap!18305 0))(
  ( (ListLongMap!18306 (toList!9168 List!27674)) )
))
(declare-fun lt!564166 () ListLongMap!18305)

(declare-fun lt!564167 () ListLongMap!18305)

(assert (=> b!1250324 (= lt!564166 lt!564167)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47489)

(declare-fun minValueBefore!43 () V!47489)

(declare-fun zeroValue!871 () V!47489)

(declare-datatypes ((Unit!41529 0))(
  ( (Unit!41530) )
))
(declare-fun lt!564163 () Unit!41529)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!936 (array!80858 array!80856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47489 V!47489 V!47489 V!47489 (_ BitVec 32) Int) Unit!41529)

(assert (=> b!1250324 (= lt!564163 (lemmaNoChangeToArrayThenSameMapNoExtras!936 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5572 (array!80858 array!80856 (_ BitVec 32) (_ BitVec 32) V!47489 V!47489 (_ BitVec 32) Int) ListLongMap!18305)

(assert (=> b!1250324 (= lt!564167 (getCurrentListMapNoExtraKeys!5572 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250324 (= lt!564166 (getCurrentListMapNoExtraKeys!5572 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49153 () Bool)

(declare-fun tp!93566 () Bool)

(declare-fun e!709788 () Bool)

(assert (=> mapNonEmpty!49153 (= mapRes!49153 (and tp!93566 e!709788))))

(declare-fun mapKey!49153 () (_ BitVec 32))

(declare-fun mapRest!49153 () (Array (_ BitVec 32) ValueCell!15033))

(declare-fun mapValue!49153 () ValueCell!15033)

(assert (=> mapNonEmpty!49153 (= (arr!38994 _values!914) (store mapRest!49153 mapKey!49153 mapValue!49153))))

(declare-fun b!1250325 () Bool)

(declare-fun res!833990 () Bool)

(assert (=> b!1250325 (=> (not res!833990) (not e!709786))))

(declare-datatypes ((List!27675 0))(
  ( (Nil!27672) (Cons!27671 (h!28880 (_ BitVec 64)) (t!41148 List!27675)) )
))
(declare-fun arrayNoDuplicates!0 (array!80858 (_ BitVec 32) List!27675) Bool)

(assert (=> b!1250325 (= res!833990 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27672))))

(declare-fun b!1250326 () Bool)

(declare-fun e!709789 () Bool)

(assert (=> b!1250326 (= e!709784 e!709789)))

(declare-fun res!833992 () Bool)

(assert (=> b!1250326 (=> res!833992 e!709789)))

(declare-fun lt!564165 () ListLongMap!18305)

(declare-fun contains!7484 (ListLongMap!18305 (_ BitVec 64)) Bool)

(assert (=> b!1250326 (= res!833992 (contains!7484 lt!564165 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4445 (array!80858 array!80856 (_ BitVec 32) (_ BitVec 32) V!47489 V!47489 (_ BitVec 32) Int) ListLongMap!18305)

(assert (=> b!1250326 (= lt!564165 (getCurrentListMap!4445 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!833994 () Bool)

(assert (=> start!104900 (=> (not res!833994) (not e!709786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104900 (= res!833994 (validMask!0 mask!1466))))

(assert (=> start!104900 e!709786))

(assert (=> start!104900 true))

(assert (=> start!104900 tp!93565))

(assert (=> start!104900 tp_is_empty!31593))

(declare-fun array_inv!29751 (array!80858) Bool)

(assert (=> start!104900 (array_inv!29751 _keys!1118)))

(declare-fun array_inv!29752 (array!80856) Bool)

(assert (=> start!104900 (and (array_inv!29752 _values!914) e!709787)))

(declare-fun b!1250327 () Bool)

(assert (=> b!1250327 (= e!709788 tp_is_empty!31593)))

(declare-fun b!1250328 () Bool)

(declare-fun res!833991 () Bool)

(assert (=> b!1250328 (=> (not res!833991) (not e!709786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80858 (_ BitVec 32)) Bool)

(assert (=> b!1250328 (= res!833991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250329 () Bool)

(assert (=> b!1250329 (= e!709789 true)))

(declare-fun -!1997 (ListLongMap!18305 (_ BitVec 64)) ListLongMap!18305)

(assert (=> b!1250329 (= (-!1997 lt!564165 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564165)))

(declare-fun lt!564164 () Unit!41529)

(declare-fun removeNotPresentStillSame!92 (ListLongMap!18305 (_ BitVec 64)) Unit!41529)

(assert (=> b!1250329 (= lt!564164 (removeNotPresentStillSame!92 lt!564165 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!104900 res!833994) b!1250323))

(assert (= (and b!1250323 res!833993) b!1250328))

(assert (= (and b!1250328 res!833991) b!1250325))

(assert (= (and b!1250325 res!833990) b!1250324))

(assert (= (and b!1250324 (not res!833995)) b!1250326))

(assert (= (and b!1250326 (not res!833992)) b!1250329))

(assert (= (and b!1250322 condMapEmpty!49153) mapIsEmpty!49153))

(assert (= (and b!1250322 (not condMapEmpty!49153)) mapNonEmpty!49153))

(get-info :version)

(assert (= (and mapNonEmpty!49153 ((_ is ValueCellFull!15033) mapValue!49153)) b!1250327))

(assert (= (and b!1250322 ((_ is ValueCellFull!15033) mapDefault!49153)) b!1250321))

(assert (= start!104900 b!1250322))

(declare-fun m!1151155 () Bool)

(assert (=> start!104900 m!1151155))

(declare-fun m!1151157 () Bool)

(assert (=> start!104900 m!1151157))

(declare-fun m!1151159 () Bool)

(assert (=> start!104900 m!1151159))

(declare-fun m!1151161 () Bool)

(assert (=> b!1250325 m!1151161))

(declare-fun m!1151163 () Bool)

(assert (=> b!1250329 m!1151163))

(declare-fun m!1151165 () Bool)

(assert (=> b!1250329 m!1151165))

(declare-fun m!1151167 () Bool)

(assert (=> mapNonEmpty!49153 m!1151167))

(declare-fun m!1151169 () Bool)

(assert (=> b!1250324 m!1151169))

(declare-fun m!1151171 () Bool)

(assert (=> b!1250324 m!1151171))

(declare-fun m!1151173 () Bool)

(assert (=> b!1250324 m!1151173))

(declare-fun m!1151175 () Bool)

(assert (=> b!1250326 m!1151175))

(declare-fun m!1151177 () Bool)

(assert (=> b!1250326 m!1151177))

(declare-fun m!1151179 () Bool)

(assert (=> b!1250328 m!1151179))

(check-sat (not b_next!26691) (not b!1250324) (not b!1250329) tp_is_empty!31593 (not b!1250325) (not mapNonEmpty!49153) (not b!1250328) (not b!1250326) b_and!44467 (not start!104900))
(check-sat b_and!44467 (not b_next!26691))
