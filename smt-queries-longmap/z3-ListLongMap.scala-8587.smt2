; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104754 () Bool)

(assert start!104754)

(declare-fun b_free!26559 () Bool)

(declare-fun b_next!26559 () Bool)

(assert (=> start!104754 (= b_free!26559 (not b_next!26559))))

(declare-fun tp!93166 () Bool)

(declare-fun b_and!44327 () Bool)

(assert (=> start!104754 (= tp!93166 b_and!44327)))

(declare-fun res!833077 () Bool)

(declare-fun e!708652 () Bool)

(assert (=> start!104754 (=> (not res!833077) (not e!708652))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104754 (= res!833077 (validMask!0 mask!1466))))

(assert (=> start!104754 e!708652))

(assert (=> start!104754 true))

(assert (=> start!104754 tp!93166))

(declare-fun tp_is_empty!31461 () Bool)

(assert (=> start!104754 tp_is_empty!31461))

(declare-datatypes ((array!80610 0))(
  ( (array!80611 (arr!38872 (Array (_ BitVec 32) (_ BitVec 64))) (size!39408 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80610)

(declare-fun array_inv!29667 (array!80610) Bool)

(assert (=> start!104754 (array_inv!29667 _keys!1118)))

(declare-datatypes ((V!47313 0))(
  ( (V!47314 (val!15793 Int)) )
))
(declare-datatypes ((ValueCell!14967 0))(
  ( (ValueCellFull!14967 (v!18489 V!47313)) (EmptyCell!14967) )
))
(declare-datatypes ((array!80612 0))(
  ( (array!80613 (arr!38873 (Array (_ BitVec 32) ValueCell!14967)) (size!39409 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80612)

(declare-fun e!708649 () Bool)

(declare-fun array_inv!29668 (array!80612) Bool)

(assert (=> start!104754 (and (array_inv!29668 _values!914) e!708649)))

(declare-fun b!1248759 () Bool)

(declare-fun e!708651 () Bool)

(assert (=> b!1248759 (= e!708651 tp_is_empty!31461)))

(declare-fun b!1248760 () Bool)

(declare-fun res!833079 () Bool)

(assert (=> b!1248760 (=> (not res!833079) (not e!708652))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248760 (= res!833079 (and (= (size!39409 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39408 _keys!1118) (size!39409 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48952 () Bool)

(declare-fun mapRes!48952 () Bool)

(assert (=> mapIsEmpty!48952 mapRes!48952))

(declare-fun mapNonEmpty!48952 () Bool)

(declare-fun tp!93167 () Bool)

(assert (=> mapNonEmpty!48952 (= mapRes!48952 (and tp!93167 e!708651))))

(declare-fun mapRest!48952 () (Array (_ BitVec 32) ValueCell!14967))

(declare-fun mapValue!48952 () ValueCell!14967)

(declare-fun mapKey!48952 () (_ BitVec 32))

(assert (=> mapNonEmpty!48952 (= (arr!38873 _values!914) (store mapRest!48952 mapKey!48952 mapValue!48952))))

(declare-fun b!1248761 () Bool)

(declare-fun e!708650 () Bool)

(assert (=> b!1248761 (= e!708650 tp_is_empty!31461)))

(declare-fun b!1248762 () Bool)

(assert (=> b!1248762 (= e!708649 (and e!708650 mapRes!48952))))

(declare-fun condMapEmpty!48952 () Bool)

(declare-fun mapDefault!48952 () ValueCell!14967)

(assert (=> b!1248762 (= condMapEmpty!48952 (= (arr!38873 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14967)) mapDefault!48952)))))

(declare-fun b!1248763 () Bool)

(assert (=> b!1248763 (= e!708652 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47313)

(declare-fun zeroValue!871 () V!47313)

(declare-datatypes ((tuple2!20338 0))(
  ( (tuple2!20339 (_1!10180 (_ BitVec 64)) (_2!10180 V!47313)) )
))
(declare-datatypes ((List!27585 0))(
  ( (Nil!27582) (Cons!27581 (h!28790 tuple2!20338) (t!41056 List!27585)) )
))
(declare-datatypes ((ListLongMap!18211 0))(
  ( (ListLongMap!18212 (toList!9121 List!27585)) )
))
(declare-fun lt!563506 () ListLongMap!18211)

(declare-fun getCurrentListMapNoExtraKeys!5528 (array!80610 array!80612 (_ BitVec 32) (_ BitVec 32) V!47313 V!47313 (_ BitVec 32) Int) ListLongMap!18211)

(assert (=> b!1248763 (= lt!563506 (getCurrentListMapNoExtraKeys!5528 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!47313)

(declare-fun lt!563505 () ListLongMap!18211)

(assert (=> b!1248763 (= lt!563505 (getCurrentListMapNoExtraKeys!5528 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248764 () Bool)

(declare-fun res!833078 () Bool)

(assert (=> b!1248764 (=> (not res!833078) (not e!708652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80610 (_ BitVec 32)) Bool)

(assert (=> b!1248764 (= res!833078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248765 () Bool)

(declare-fun res!833076 () Bool)

(assert (=> b!1248765 (=> (not res!833076) (not e!708652))))

(declare-datatypes ((List!27586 0))(
  ( (Nil!27583) (Cons!27582 (h!28791 (_ BitVec 64)) (t!41057 List!27586)) )
))
(declare-fun arrayNoDuplicates!0 (array!80610 (_ BitVec 32) List!27586) Bool)

(assert (=> b!1248765 (= res!833076 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27583))))

(assert (= (and start!104754 res!833077) b!1248760))

(assert (= (and b!1248760 res!833079) b!1248764))

(assert (= (and b!1248764 res!833078) b!1248765))

(assert (= (and b!1248765 res!833076) b!1248763))

(assert (= (and b!1248762 condMapEmpty!48952) mapIsEmpty!48952))

(assert (= (and b!1248762 (not condMapEmpty!48952)) mapNonEmpty!48952))

(get-info :version)

(assert (= (and mapNonEmpty!48952 ((_ is ValueCellFull!14967) mapValue!48952)) b!1248759))

(assert (= (and b!1248762 ((_ is ValueCellFull!14967) mapDefault!48952)) b!1248761))

(assert (= start!104754 b!1248762))

(declare-fun m!1149831 () Bool)

(assert (=> b!1248764 m!1149831))

(declare-fun m!1149833 () Bool)

(assert (=> start!104754 m!1149833))

(declare-fun m!1149835 () Bool)

(assert (=> start!104754 m!1149835))

(declare-fun m!1149837 () Bool)

(assert (=> start!104754 m!1149837))

(declare-fun m!1149839 () Bool)

(assert (=> mapNonEmpty!48952 m!1149839))

(declare-fun m!1149841 () Bool)

(assert (=> b!1248765 m!1149841))

(declare-fun m!1149843 () Bool)

(assert (=> b!1248763 m!1149843))

(declare-fun m!1149845 () Bool)

(assert (=> b!1248763 m!1149845))

(check-sat (not b!1248763) (not mapNonEmpty!48952) (not b!1248765) (not start!104754) (not b_next!26559) b_and!44327 (not b!1248764) tp_is_empty!31461)
(check-sat b_and!44327 (not b_next!26559))
