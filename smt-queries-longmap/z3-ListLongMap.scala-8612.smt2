; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104918 () Bool)

(assert start!104918)

(declare-fun b_free!26709 () Bool)

(declare-fun b_next!26709 () Bool)

(assert (=> start!104918 (= b_free!26709 (not b_next!26709))))

(declare-fun tp!93620 () Bool)

(declare-fun b_and!44485 () Bool)

(assert (=> start!104918 (= tp!93620 b_and!44485)))

(declare-fun b!1250564 () Bool)

(declare-fun e!709978 () Bool)

(declare-fun tp_is_empty!31611 () Bool)

(assert (=> b!1250564 (= e!709978 tp_is_empty!31611)))

(declare-fun b!1250565 () Bool)

(declare-fun res!834152 () Bool)

(declare-fun e!709976 () Bool)

(assert (=> b!1250565 (=> (not res!834152) (not e!709976))))

(declare-datatypes ((array!80890 0))(
  ( (array!80891 (arr!39011 (Array (_ BitVec 32) (_ BitVec 64))) (size!39547 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80890)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80890 (_ BitVec 32)) Bool)

(assert (=> b!1250565 (= res!834152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250566 () Bool)

(declare-fun e!709979 () Bool)

(assert (=> b!1250566 (= e!709979 true)))

(declare-datatypes ((V!47513 0))(
  ( (V!47514 (val!15868 Int)) )
))
(declare-datatypes ((tuple2!20448 0))(
  ( (tuple2!20449 (_1!10235 (_ BitVec 64)) (_2!10235 V!47513)) )
))
(declare-datatypes ((List!27688 0))(
  ( (Nil!27685) (Cons!27684 (h!28893 tuple2!20448) (t!41161 List!27688)) )
))
(declare-datatypes ((ListLongMap!18321 0))(
  ( (ListLongMap!18322 (toList!9176 List!27688)) )
))
(declare-fun lt!564301 () ListLongMap!18321)

(declare-fun -!2001 (ListLongMap!18321 (_ BitVec 64)) ListLongMap!18321)

(assert (=> b!1250566 (= (-!2001 lt!564301 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564301)))

(declare-datatypes ((Unit!41543 0))(
  ( (Unit!41544) )
))
(declare-fun lt!564302 () Unit!41543)

(declare-fun removeNotPresentStillSame!96 (ListLongMap!18321 (_ BitVec 64)) Unit!41543)

(assert (=> b!1250566 (= lt!564302 (removeNotPresentStillSame!96 lt!564301 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49180 () Bool)

(declare-fun mapRes!49180 () Bool)

(declare-fun tp!93619 () Bool)

(assert (=> mapNonEmpty!49180 (= mapRes!49180 (and tp!93619 e!709978))))

(declare-fun mapKey!49180 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15042 0))(
  ( (ValueCellFull!15042 (v!18564 V!47513)) (EmptyCell!15042) )
))
(declare-fun mapValue!49180 () ValueCell!15042)

(declare-datatypes ((array!80892 0))(
  ( (array!80893 (arr!39012 (Array (_ BitVec 32) ValueCell!15042)) (size!39548 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80892)

(declare-fun mapRest!49180 () (Array (_ BitVec 32) ValueCell!15042))

(assert (=> mapNonEmpty!49180 (= (arr!39012 _values!914) (store mapRest!49180 mapKey!49180 mapValue!49180))))

(declare-fun b!1250567 () Bool)

(declare-fun e!709973 () Bool)

(declare-fun e!709977 () Bool)

(assert (=> b!1250567 (= e!709973 (and e!709977 mapRes!49180))))

(declare-fun condMapEmpty!49180 () Bool)

(declare-fun mapDefault!49180 () ValueCell!15042)

(assert (=> b!1250567 (= condMapEmpty!49180 (= (arr!39012 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15042)) mapDefault!49180)))))

(declare-fun b!1250568 () Bool)

(declare-fun res!834157 () Bool)

(assert (=> b!1250568 (=> (not res!834157) (not e!709976))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250568 (= res!834157 (and (= (size!39548 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39547 _keys!1118) (size!39548 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49180 () Bool)

(assert (=> mapIsEmpty!49180 mapRes!49180))

(declare-fun res!834156 () Bool)

(assert (=> start!104918 (=> (not res!834156) (not e!709976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104918 (= res!834156 (validMask!0 mask!1466))))

(assert (=> start!104918 e!709976))

(assert (=> start!104918 true))

(assert (=> start!104918 tp!93620))

(assert (=> start!104918 tp_is_empty!31611))

(declare-fun array_inv!29759 (array!80890) Bool)

(assert (=> start!104918 (array_inv!29759 _keys!1118)))

(declare-fun array_inv!29760 (array!80892) Bool)

(assert (=> start!104918 (and (array_inv!29760 _values!914) e!709973)))

(declare-fun b!1250569 () Bool)

(assert (=> b!1250569 (= e!709977 tp_is_empty!31611)))

(declare-fun b!1250570 () Bool)

(declare-fun e!709975 () Bool)

(assert (=> b!1250570 (= e!709976 (not e!709975))))

(declare-fun res!834154 () Bool)

(assert (=> b!1250570 (=> res!834154 e!709975)))

(assert (=> b!1250570 (= res!834154 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564299 () ListLongMap!18321)

(declare-fun lt!564300 () ListLongMap!18321)

(assert (=> b!1250570 (= lt!564299 lt!564300)))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!564298 () Unit!41543)

(declare-fun minValueAfter!43 () V!47513)

(declare-fun zeroValue!871 () V!47513)

(declare-fun minValueBefore!43 () V!47513)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!942 (array!80890 array!80892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47513 V!47513 V!47513 V!47513 (_ BitVec 32) Int) Unit!41543)

(assert (=> b!1250570 (= lt!564298 (lemmaNoChangeToArrayThenSameMapNoExtras!942 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5578 (array!80890 array!80892 (_ BitVec 32) (_ BitVec 32) V!47513 V!47513 (_ BitVec 32) Int) ListLongMap!18321)

(assert (=> b!1250570 (= lt!564300 (getCurrentListMapNoExtraKeys!5578 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250570 (= lt!564299 (getCurrentListMapNoExtraKeys!5578 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250571 () Bool)

(declare-fun res!834155 () Bool)

(assert (=> b!1250571 (=> (not res!834155) (not e!709976))))

(declare-datatypes ((List!27689 0))(
  ( (Nil!27686) (Cons!27685 (h!28894 (_ BitVec 64)) (t!41162 List!27689)) )
))
(declare-fun arrayNoDuplicates!0 (array!80890 (_ BitVec 32) List!27689) Bool)

(assert (=> b!1250571 (= res!834155 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27686))))

(declare-fun b!1250572 () Bool)

(assert (=> b!1250572 (= e!709975 e!709979)))

(declare-fun res!834153 () Bool)

(assert (=> b!1250572 (=> res!834153 e!709979)))

(declare-fun contains!7489 (ListLongMap!18321 (_ BitVec 64)) Bool)

(assert (=> b!1250572 (= res!834153 (contains!7489 lt!564301 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4450 (array!80890 array!80892 (_ BitVec 32) (_ BitVec 32) V!47513 V!47513 (_ BitVec 32) Int) ListLongMap!18321)

(assert (=> b!1250572 (= lt!564301 (getCurrentListMap!4450 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104918 res!834156) b!1250568))

(assert (= (and b!1250568 res!834157) b!1250565))

(assert (= (and b!1250565 res!834152) b!1250571))

(assert (= (and b!1250571 res!834155) b!1250570))

(assert (= (and b!1250570 (not res!834154)) b!1250572))

(assert (= (and b!1250572 (not res!834153)) b!1250566))

(assert (= (and b!1250567 condMapEmpty!49180) mapIsEmpty!49180))

(assert (= (and b!1250567 (not condMapEmpty!49180)) mapNonEmpty!49180))

(get-info :version)

(assert (= (and mapNonEmpty!49180 ((_ is ValueCellFull!15042) mapValue!49180)) b!1250564))

(assert (= (and b!1250567 ((_ is ValueCellFull!15042) mapDefault!49180)) b!1250569))

(assert (= start!104918 b!1250567))

(declare-fun m!1151389 () Bool)

(assert (=> b!1250572 m!1151389))

(declare-fun m!1151391 () Bool)

(assert (=> b!1250572 m!1151391))

(declare-fun m!1151393 () Bool)

(assert (=> b!1250570 m!1151393))

(declare-fun m!1151395 () Bool)

(assert (=> b!1250570 m!1151395))

(declare-fun m!1151397 () Bool)

(assert (=> b!1250570 m!1151397))

(declare-fun m!1151399 () Bool)

(assert (=> b!1250565 m!1151399))

(declare-fun m!1151401 () Bool)

(assert (=> b!1250571 m!1151401))

(declare-fun m!1151403 () Bool)

(assert (=> b!1250566 m!1151403))

(declare-fun m!1151405 () Bool)

(assert (=> b!1250566 m!1151405))

(declare-fun m!1151407 () Bool)

(assert (=> mapNonEmpty!49180 m!1151407))

(declare-fun m!1151409 () Bool)

(assert (=> start!104918 m!1151409))

(declare-fun m!1151411 () Bool)

(assert (=> start!104918 m!1151411))

(declare-fun m!1151413 () Bool)

(assert (=> start!104918 m!1151413))

(check-sat (not b!1250566) (not b!1250565) b_and!44485 (not mapNonEmpty!49180) (not b!1250571) (not start!104918) (not b!1250572) tp_is_empty!31611 (not b!1250570) (not b_next!26709))
(check-sat b_and!44485 (not b_next!26709))
