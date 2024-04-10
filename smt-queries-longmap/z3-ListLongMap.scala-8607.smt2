; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104888 () Bool)

(assert start!104888)

(declare-fun b_free!26679 () Bool)

(declare-fun b_next!26679 () Bool)

(assert (=> start!104888 (= b_free!26679 (not b_next!26679))))

(declare-fun tp!93530 () Bool)

(declare-fun b_and!44455 () Bool)

(assert (=> start!104888 (= tp!93530 b_and!44455)))

(declare-fun mapIsEmpty!49135 () Bool)

(declare-fun mapRes!49135 () Bool)

(assert (=> mapIsEmpty!49135 mapRes!49135))

(declare-fun mapNonEmpty!49135 () Bool)

(declare-fun tp!93529 () Bool)

(declare-fun e!709664 () Bool)

(assert (=> mapNonEmpty!49135 (= mapRes!49135 (and tp!93529 e!709664))))

(declare-datatypes ((V!47473 0))(
  ( (V!47474 (val!15853 Int)) )
))
(declare-datatypes ((ValueCell!15027 0))(
  ( (ValueCellFull!15027 (v!18549 V!47473)) (EmptyCell!15027) )
))
(declare-fun mapRest!49135 () (Array (_ BitVec 32) ValueCell!15027))

(declare-fun mapValue!49135 () ValueCell!15027)

(declare-fun mapKey!49135 () (_ BitVec 32))

(declare-datatypes ((array!80832 0))(
  ( (array!80833 (arr!38982 (Array (_ BitVec 32) ValueCell!15027)) (size!39518 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80832)

(assert (=> mapNonEmpty!49135 (= (arr!38982 _values!914) (store mapRest!49135 mapKey!49135 mapValue!49135))))

(declare-fun b!1250159 () Bool)

(declare-fun e!709661 () Bool)

(declare-fun tp_is_empty!31581 () Bool)

(assert (=> b!1250159 (= e!709661 tp_is_empty!31581)))

(declare-fun b!1250160 () Bool)

(declare-fun e!709658 () Bool)

(assert (=> b!1250160 (= e!709658 (and e!709661 mapRes!49135))))

(declare-fun condMapEmpty!49135 () Bool)

(declare-fun mapDefault!49135 () ValueCell!15027)

(assert (=> b!1250160 (= condMapEmpty!49135 (= (arr!38982 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15027)) mapDefault!49135)))))

(declare-fun b!1250161 () Bool)

(declare-fun res!833887 () Bool)

(declare-fun e!709663 () Bool)

(assert (=> b!1250161 (=> (not res!833887) (not e!709663))))

(declare-datatypes ((array!80834 0))(
  ( (array!80835 (arr!38983 (Array (_ BitVec 32) (_ BitVec 64))) (size!39519 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80834)

(declare-datatypes ((List!27665 0))(
  ( (Nil!27662) (Cons!27661 (h!28870 (_ BitVec 64)) (t!41138 List!27665)) )
))
(declare-fun arrayNoDuplicates!0 (array!80834 (_ BitVec 32) List!27665) Bool)

(assert (=> b!1250161 (= res!833887 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27662))))

(declare-fun b!1250162 () Bool)

(declare-fun e!709659 () Bool)

(assert (=> b!1250162 (= e!709659 true)))

(declare-datatypes ((tuple2!20422 0))(
  ( (tuple2!20423 (_1!10222 (_ BitVec 64)) (_2!10222 V!47473)) )
))
(declare-datatypes ((List!27666 0))(
  ( (Nil!27663) (Cons!27662 (h!28871 tuple2!20422) (t!41139 List!27666)) )
))
(declare-datatypes ((ListLongMap!18295 0))(
  ( (ListLongMap!18296 (toList!9163 List!27666)) )
))
(declare-fun lt!564077 () ListLongMap!18295)

(declare-fun -!1993 (ListLongMap!18295 (_ BitVec 64)) ListLongMap!18295)

(assert (=> b!1250162 (= (-!1993 lt!564077 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564077)))

(declare-datatypes ((Unit!41521 0))(
  ( (Unit!41522) )
))
(declare-fun lt!564074 () Unit!41521)

(declare-fun removeNotPresentStillSame!88 (ListLongMap!18295 (_ BitVec 64)) Unit!41521)

(assert (=> b!1250162 (= lt!564074 (removeNotPresentStillSame!88 lt!564077 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250164 () Bool)

(declare-fun res!833883 () Bool)

(assert (=> b!1250164 (=> (not res!833883) (not e!709663))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250164 (= res!833883 (and (= (size!39518 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39519 _keys!1118) (size!39518 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250165 () Bool)

(assert (=> b!1250165 (= e!709664 tp_is_empty!31581)))

(declare-fun b!1250163 () Bool)

(declare-fun e!709662 () Bool)

(assert (=> b!1250163 (= e!709662 e!709659)))

(declare-fun res!833882 () Bool)

(assert (=> b!1250163 (=> res!833882 e!709659)))

(declare-fun contains!7479 (ListLongMap!18295 (_ BitVec 64)) Bool)

(assert (=> b!1250163 (= res!833882 (contains!7479 lt!564077 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47473)

(declare-fun minValueBefore!43 () V!47473)

(declare-fun getCurrentListMap!4440 (array!80834 array!80832 (_ BitVec 32) (_ BitVec 32) V!47473 V!47473 (_ BitVec 32) Int) ListLongMap!18295)

(assert (=> b!1250163 (= lt!564077 (getCurrentListMap!4440 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!833886 () Bool)

(assert (=> start!104888 (=> (not res!833886) (not e!709663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104888 (= res!833886 (validMask!0 mask!1466))))

(assert (=> start!104888 e!709663))

(assert (=> start!104888 true))

(assert (=> start!104888 tp!93530))

(assert (=> start!104888 tp_is_empty!31581))

(declare-fun array_inv!29743 (array!80834) Bool)

(assert (=> start!104888 (array_inv!29743 _keys!1118)))

(declare-fun array_inv!29744 (array!80832) Bool)

(assert (=> start!104888 (and (array_inv!29744 _values!914) e!709658)))

(declare-fun b!1250166 () Bool)

(assert (=> b!1250166 (= e!709663 (not e!709662))))

(declare-fun res!833884 () Bool)

(assert (=> b!1250166 (=> res!833884 e!709662)))

(assert (=> b!1250166 (= res!833884 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564075 () ListLongMap!18295)

(declare-fun lt!564076 () ListLongMap!18295)

(assert (=> b!1250166 (= lt!564075 lt!564076)))

(declare-fun lt!564073 () Unit!41521)

(declare-fun minValueAfter!43 () V!47473)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!933 (array!80834 array!80832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47473 V!47473 V!47473 V!47473 (_ BitVec 32) Int) Unit!41521)

(assert (=> b!1250166 (= lt!564073 (lemmaNoChangeToArrayThenSameMapNoExtras!933 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5569 (array!80834 array!80832 (_ BitVec 32) (_ BitVec 32) V!47473 V!47473 (_ BitVec 32) Int) ListLongMap!18295)

(assert (=> b!1250166 (= lt!564076 (getCurrentListMapNoExtraKeys!5569 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250166 (= lt!564075 (getCurrentListMapNoExtraKeys!5569 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250167 () Bool)

(declare-fun res!833885 () Bool)

(assert (=> b!1250167 (=> (not res!833885) (not e!709663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80834 (_ BitVec 32)) Bool)

(assert (=> b!1250167 (= res!833885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104888 res!833886) b!1250164))

(assert (= (and b!1250164 res!833883) b!1250167))

(assert (= (and b!1250167 res!833885) b!1250161))

(assert (= (and b!1250161 res!833887) b!1250166))

(assert (= (and b!1250166 (not res!833884)) b!1250163))

(assert (= (and b!1250163 (not res!833882)) b!1250162))

(assert (= (and b!1250160 condMapEmpty!49135) mapIsEmpty!49135))

(assert (= (and b!1250160 (not condMapEmpty!49135)) mapNonEmpty!49135))

(get-info :version)

(assert (= (and mapNonEmpty!49135 ((_ is ValueCellFull!15027) mapValue!49135)) b!1250165))

(assert (= (and b!1250160 ((_ is ValueCellFull!15027) mapDefault!49135)) b!1250159))

(assert (= start!104888 b!1250160))

(declare-fun m!1150999 () Bool)

(assert (=> mapNonEmpty!49135 m!1150999))

(declare-fun m!1151001 () Bool)

(assert (=> start!104888 m!1151001))

(declare-fun m!1151003 () Bool)

(assert (=> start!104888 m!1151003))

(declare-fun m!1151005 () Bool)

(assert (=> start!104888 m!1151005))

(declare-fun m!1151007 () Bool)

(assert (=> b!1250166 m!1151007))

(declare-fun m!1151009 () Bool)

(assert (=> b!1250166 m!1151009))

(declare-fun m!1151011 () Bool)

(assert (=> b!1250166 m!1151011))

(declare-fun m!1151013 () Bool)

(assert (=> b!1250167 m!1151013))

(declare-fun m!1151015 () Bool)

(assert (=> b!1250162 m!1151015))

(declare-fun m!1151017 () Bool)

(assert (=> b!1250162 m!1151017))

(declare-fun m!1151019 () Bool)

(assert (=> b!1250161 m!1151019))

(declare-fun m!1151021 () Bool)

(assert (=> b!1250163 m!1151021))

(declare-fun m!1151023 () Bool)

(assert (=> b!1250163 m!1151023))

(check-sat (not mapNonEmpty!49135) (not start!104888) (not b_next!26679) (not b!1250162) (not b!1250167) b_and!44455 (not b!1250163) (not b!1250166) (not b!1250161) tp_is_empty!31581)
(check-sat b_and!44455 (not b_next!26679))
