; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104906 () Bool)

(assert start!104906)

(declare-fun b_free!26701 () Bool)

(declare-fun b_next!26701 () Bool)

(assert (=> start!104906 (= b_free!26701 (not b_next!26701))))

(declare-fun tp!93595 () Bool)

(declare-fun b_and!44459 () Bool)

(assert (=> start!104906 (= tp!93595 b_and!44459)))

(declare-fun res!834044 () Bool)

(declare-fun e!709845 () Bool)

(assert (=> start!104906 (=> (not res!834044) (not e!709845))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104906 (= res!834044 (validMask!0 mask!1466))))

(assert (=> start!104906 e!709845))

(assert (=> start!104906 true))

(assert (=> start!104906 tp!93595))

(declare-fun tp_is_empty!31603 () Bool)

(assert (=> start!104906 tp_is_empty!31603))

(declare-datatypes ((array!80795 0))(
  ( (array!80796 (arr!38964 (Array (_ BitVec 32) (_ BitVec 64))) (size!39502 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80795)

(declare-fun array_inv!29855 (array!80795) Bool)

(assert (=> start!104906 (array_inv!29855 _keys!1118)))

(declare-datatypes ((V!47503 0))(
  ( (V!47504 (val!15864 Int)) )
))
(declare-datatypes ((ValueCell!15038 0))(
  ( (ValueCellFull!15038 (v!18559 V!47503)) (EmptyCell!15038) )
))
(declare-datatypes ((array!80797 0))(
  ( (array!80798 (arr!38965 (Array (_ BitVec 32) ValueCell!15038)) (size!39503 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80797)

(declare-fun e!709848 () Bool)

(declare-fun array_inv!29856 (array!80797) Bool)

(assert (=> start!104906 (and (array_inv!29856 _values!914) e!709848)))

(declare-fun mapIsEmpty!49168 () Bool)

(declare-fun mapRes!49168 () Bool)

(assert (=> mapIsEmpty!49168 mapRes!49168))

(declare-fun b!1250374 () Bool)

(declare-fun res!834042 () Bool)

(assert (=> b!1250374 (=> (not res!834042) (not e!709845))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250374 (= res!834042 (and (= (size!39503 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39502 _keys!1118) (size!39503 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49168 () Bool)

(declare-fun tp!93596 () Bool)

(declare-fun e!709850 () Bool)

(assert (=> mapNonEmpty!49168 (= mapRes!49168 (and tp!93596 e!709850))))

(declare-fun mapValue!49168 () ValueCell!15038)

(declare-fun mapKey!49168 () (_ BitVec 32))

(declare-fun mapRest!49168 () (Array (_ BitVec 32) ValueCell!15038))

(assert (=> mapNonEmpty!49168 (= (arr!38965 _values!914) (store mapRest!49168 mapKey!49168 mapValue!49168))))

(declare-fun b!1250375 () Bool)

(declare-fun e!709847 () Bool)

(assert (=> b!1250375 (= e!709845 (not e!709847))))

(declare-fun res!834041 () Bool)

(assert (=> b!1250375 (=> res!834041 e!709847)))

(assert (=> b!1250375 (= res!834041 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20526 0))(
  ( (tuple2!20527 (_1!10274 (_ BitVec 64)) (_2!10274 V!47503)) )
))
(declare-datatypes ((List!27751 0))(
  ( (Nil!27748) (Cons!27747 (h!28956 tuple2!20526) (t!41215 List!27751)) )
))
(declare-datatypes ((ListLongMap!18399 0))(
  ( (ListLongMap!18400 (toList!9215 List!27751)) )
))
(declare-fun lt!564063 () ListLongMap!18399)

(declare-fun lt!564061 () ListLongMap!18399)

(assert (=> b!1250375 (= lt!564063 lt!564061)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47503)

(declare-fun minValueBefore!43 () V!47503)

(declare-datatypes ((Unit!41394 0))(
  ( (Unit!41395) )
))
(declare-fun lt!564062 () Unit!41394)

(declare-fun minValueAfter!43 () V!47503)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!948 (array!80795 array!80797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47503 V!47503 V!47503 V!47503 (_ BitVec 32) Int) Unit!41394)

(assert (=> b!1250375 (= lt!564062 (lemmaNoChangeToArrayThenSameMapNoExtras!948 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5626 (array!80795 array!80797 (_ BitVec 32) (_ BitVec 32) V!47503 V!47503 (_ BitVec 32) Int) ListLongMap!18399)

(assert (=> b!1250375 (= lt!564061 (getCurrentListMapNoExtraKeys!5626 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250375 (= lt!564063 (getCurrentListMapNoExtraKeys!5626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250376 () Bool)

(declare-fun e!709849 () Bool)

(assert (=> b!1250376 (= e!709848 (and e!709849 mapRes!49168))))

(declare-fun condMapEmpty!49168 () Bool)

(declare-fun mapDefault!49168 () ValueCell!15038)

(assert (=> b!1250376 (= condMapEmpty!49168 (= (arr!38965 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15038)) mapDefault!49168)))))

(declare-fun b!1250377 () Bool)

(assert (=> b!1250377 (= e!709849 tp_is_empty!31603)))

(declare-fun b!1250378 () Bool)

(declare-fun e!709844 () Bool)

(assert (=> b!1250378 (= e!709847 e!709844)))

(declare-fun res!834040 () Bool)

(assert (=> b!1250378 (=> res!834040 e!709844)))

(declare-fun lt!564059 () ListLongMap!18399)

(declare-fun contains!7461 (ListLongMap!18399 (_ BitVec 64)) Bool)

(assert (=> b!1250378 (= res!834040 (contains!7461 lt!564059 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4388 (array!80795 array!80797 (_ BitVec 32) (_ BitVec 32) V!47503 V!47503 (_ BitVec 32) Int) ListLongMap!18399)

(assert (=> b!1250378 (= lt!564059 (getCurrentListMap!4388 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250379 () Bool)

(assert (=> b!1250379 (= e!709844 true)))

(declare-fun -!1961 (ListLongMap!18399 (_ BitVec 64)) ListLongMap!18399)

(assert (=> b!1250379 (= (-!1961 lt!564059 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564059)))

(declare-fun lt!564060 () Unit!41394)

(declare-fun removeNotPresentStillSame!89 (ListLongMap!18399 (_ BitVec 64)) Unit!41394)

(assert (=> b!1250379 (= lt!564060 (removeNotPresentStillSame!89 lt!564059 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250380 () Bool)

(declare-fun res!834043 () Bool)

(assert (=> b!1250380 (=> (not res!834043) (not e!709845))))

(declare-datatypes ((List!27752 0))(
  ( (Nil!27749) (Cons!27748 (h!28957 (_ BitVec 64)) (t!41216 List!27752)) )
))
(declare-fun arrayNoDuplicates!0 (array!80795 (_ BitVec 32) List!27752) Bool)

(assert (=> b!1250380 (= res!834043 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27749))))

(declare-fun b!1250381 () Bool)

(assert (=> b!1250381 (= e!709850 tp_is_empty!31603)))

(declare-fun b!1250382 () Bool)

(declare-fun res!834045 () Bool)

(assert (=> b!1250382 (=> (not res!834045) (not e!709845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80795 (_ BitVec 32)) Bool)

(assert (=> b!1250382 (= res!834045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104906 res!834044) b!1250374))

(assert (= (and b!1250374 res!834042) b!1250382))

(assert (= (and b!1250382 res!834045) b!1250380))

(assert (= (and b!1250380 res!834043) b!1250375))

(assert (= (and b!1250375 (not res!834041)) b!1250378))

(assert (= (and b!1250378 (not res!834040)) b!1250379))

(assert (= (and b!1250376 condMapEmpty!49168) mapIsEmpty!49168))

(assert (= (and b!1250376 (not condMapEmpty!49168)) mapNonEmpty!49168))

(get-info :version)

(assert (= (and mapNonEmpty!49168 ((_ is ValueCellFull!15038) mapValue!49168)) b!1250381))

(assert (= (and b!1250376 ((_ is ValueCellFull!15038) mapDefault!49168)) b!1250377))

(assert (= start!104906 b!1250376))

(declare-fun m!1150765 () Bool)

(assert (=> b!1250380 m!1150765))

(declare-fun m!1150767 () Bool)

(assert (=> b!1250379 m!1150767))

(declare-fun m!1150769 () Bool)

(assert (=> b!1250379 m!1150769))

(declare-fun m!1150771 () Bool)

(assert (=> mapNonEmpty!49168 m!1150771))

(declare-fun m!1150773 () Bool)

(assert (=> b!1250378 m!1150773))

(declare-fun m!1150775 () Bool)

(assert (=> b!1250378 m!1150775))

(declare-fun m!1150777 () Bool)

(assert (=> b!1250375 m!1150777))

(declare-fun m!1150779 () Bool)

(assert (=> b!1250375 m!1150779))

(declare-fun m!1150781 () Bool)

(assert (=> b!1250375 m!1150781))

(declare-fun m!1150783 () Bool)

(assert (=> start!104906 m!1150783))

(declare-fun m!1150785 () Bool)

(assert (=> start!104906 m!1150785))

(declare-fun m!1150787 () Bool)

(assert (=> start!104906 m!1150787))

(declare-fun m!1150789 () Bool)

(assert (=> b!1250382 m!1150789))

(check-sat (not b!1250382) tp_is_empty!31603 (not b!1250375) (not b!1250379) (not start!104906) b_and!44459 (not b!1250378) (not mapNonEmpty!49168) (not b!1250380) (not b_next!26701))
(check-sat b_and!44459 (not b_next!26701))
