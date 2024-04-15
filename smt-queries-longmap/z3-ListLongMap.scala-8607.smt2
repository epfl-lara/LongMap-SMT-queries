; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104882 () Bool)

(assert start!104882)

(declare-fun b_free!26677 () Bool)

(declare-fun b_next!26677 () Bool)

(assert (=> start!104882 (= b_free!26677 (not b_next!26677))))

(declare-fun tp!93523 () Bool)

(declare-fun b_and!44435 () Bool)

(assert (=> start!104882 (= tp!93523 b_and!44435)))

(declare-fun res!833827 () Bool)

(declare-fun e!709592 () Bool)

(assert (=> start!104882 (=> (not res!833827) (not e!709592))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104882 (= res!833827 (validMask!0 mask!1466))))

(assert (=> start!104882 e!709592))

(assert (=> start!104882 true))

(assert (=> start!104882 tp!93523))

(declare-fun tp_is_empty!31579 () Bool)

(assert (=> start!104882 tp_is_empty!31579))

(declare-datatypes ((array!80749 0))(
  ( (array!80750 (arr!38941 (Array (_ BitVec 32) (_ BitVec 64))) (size!39479 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80749)

(declare-fun array_inv!29841 (array!80749) Bool)

(assert (=> start!104882 (array_inv!29841 _keys!1118)))

(declare-datatypes ((V!47471 0))(
  ( (V!47472 (val!15852 Int)) )
))
(declare-datatypes ((ValueCell!15026 0))(
  ( (ValueCellFull!15026 (v!18547 V!47471)) (EmptyCell!15026) )
))
(declare-datatypes ((array!80751 0))(
  ( (array!80752 (arr!38942 (Array (_ BitVec 32) ValueCell!15026)) (size!39480 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80751)

(declare-fun e!709594 () Bool)

(declare-fun array_inv!29842 (array!80751) Bool)

(assert (=> start!104882 (and (array_inv!29842 _values!914) e!709594)))

(declare-fun b!1250050 () Bool)

(declare-fun e!709597 () Bool)

(assert (=> b!1250050 (= e!709597 tp_is_empty!31579)))

(declare-fun b!1250051 () Bool)

(declare-fun e!709596 () Bool)

(declare-fun mapRes!49132 () Bool)

(assert (=> b!1250051 (= e!709594 (and e!709596 mapRes!49132))))

(declare-fun condMapEmpty!49132 () Bool)

(declare-fun mapDefault!49132 () ValueCell!15026)

(assert (=> b!1250051 (= condMapEmpty!49132 (= (arr!38942 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15026)) mapDefault!49132)))))

(declare-fun mapIsEmpty!49132 () Bool)

(assert (=> mapIsEmpty!49132 mapRes!49132))

(declare-fun b!1250052 () Bool)

(declare-fun e!709595 () Bool)

(assert (=> b!1250052 (= e!709592 (not e!709595))))

(declare-fun res!833826 () Bool)

(assert (=> b!1250052 (=> res!833826 e!709595)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250052 (= res!833826 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20502 0))(
  ( (tuple2!20503 (_1!10262 (_ BitVec 64)) (_2!10262 V!47471)) )
))
(declare-datatypes ((List!27729 0))(
  ( (Nil!27726) (Cons!27725 (h!28934 tuple2!20502) (t!41193 List!27729)) )
))
(declare-datatypes ((ListLongMap!18375 0))(
  ( (ListLongMap!18376 (toList!9203 List!27729)) )
))
(declare-fun lt!563880 () ListLongMap!18375)

(declare-fun lt!563882 () ListLongMap!18375)

(assert (=> b!1250052 (= lt!563880 lt!563882)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47471)

(declare-fun minValueAfter!43 () V!47471)

(declare-datatypes ((Unit!41372 0))(
  ( (Unit!41373) )
))
(declare-fun lt!563879 () Unit!41372)

(declare-fun minValueBefore!43 () V!47471)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!940 (array!80749 array!80751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47471 V!47471 V!47471 V!47471 (_ BitVec 32) Int) Unit!41372)

(assert (=> b!1250052 (= lt!563879 (lemmaNoChangeToArrayThenSameMapNoExtras!940 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5618 (array!80749 array!80751 (_ BitVec 32) (_ BitVec 32) V!47471 V!47471 (_ BitVec 32) Int) ListLongMap!18375)

(assert (=> b!1250052 (= lt!563882 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250052 (= lt!563880 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250053 () Bool)

(declare-fun res!833825 () Bool)

(assert (=> b!1250053 (=> (not res!833825) (not e!709592))))

(assert (=> b!1250053 (= res!833825 (and (= (size!39480 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39479 _keys!1118) (size!39480 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250054 () Bool)

(declare-fun e!709598 () Bool)

(assert (=> b!1250054 (= e!709598 true)))

(declare-fun lt!563883 () ListLongMap!18375)

(declare-fun -!1950 (ListLongMap!18375 (_ BitVec 64)) ListLongMap!18375)

(assert (=> b!1250054 (= (-!1950 lt!563883 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563883)))

(declare-fun lt!563881 () Unit!41372)

(declare-fun removeNotPresentStillSame!78 (ListLongMap!18375 (_ BitVec 64)) Unit!41372)

(assert (=> b!1250054 (= lt!563881 (removeNotPresentStillSame!78 lt!563883 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250055 () Bool)

(assert (=> b!1250055 (= e!709596 tp_is_empty!31579)))

(declare-fun b!1250056 () Bool)

(declare-fun res!833829 () Bool)

(assert (=> b!1250056 (=> (not res!833829) (not e!709592))))

(declare-datatypes ((List!27730 0))(
  ( (Nil!27727) (Cons!27726 (h!28935 (_ BitVec 64)) (t!41194 List!27730)) )
))
(declare-fun arrayNoDuplicates!0 (array!80749 (_ BitVec 32) List!27730) Bool)

(assert (=> b!1250056 (= res!833829 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27727))))

(declare-fun mapNonEmpty!49132 () Bool)

(declare-fun tp!93524 () Bool)

(assert (=> mapNonEmpty!49132 (= mapRes!49132 (and tp!93524 e!709597))))

(declare-fun mapValue!49132 () ValueCell!15026)

(declare-fun mapRest!49132 () (Array (_ BitVec 32) ValueCell!15026))

(declare-fun mapKey!49132 () (_ BitVec 32))

(assert (=> mapNonEmpty!49132 (= (arr!38942 _values!914) (store mapRest!49132 mapKey!49132 mapValue!49132))))

(declare-fun b!1250057 () Bool)

(declare-fun res!833824 () Bool)

(assert (=> b!1250057 (=> (not res!833824) (not e!709592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80749 (_ BitVec 32)) Bool)

(assert (=> b!1250057 (= res!833824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250058 () Bool)

(assert (=> b!1250058 (= e!709595 e!709598)))

(declare-fun res!833828 () Bool)

(assert (=> b!1250058 (=> res!833828 e!709598)))

(declare-fun contains!7452 (ListLongMap!18375 (_ BitVec 64)) Bool)

(assert (=> b!1250058 (= res!833828 (contains!7452 lt!563883 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4379 (array!80749 array!80751 (_ BitVec 32) (_ BitVec 32) V!47471 V!47471 (_ BitVec 32) Int) ListLongMap!18375)

(assert (=> b!1250058 (= lt!563883 (getCurrentListMap!4379 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104882 res!833827) b!1250053))

(assert (= (and b!1250053 res!833825) b!1250057))

(assert (= (and b!1250057 res!833824) b!1250056))

(assert (= (and b!1250056 res!833829) b!1250052))

(assert (= (and b!1250052 (not res!833826)) b!1250058))

(assert (= (and b!1250058 (not res!833828)) b!1250054))

(assert (= (and b!1250051 condMapEmpty!49132) mapIsEmpty!49132))

(assert (= (and b!1250051 (not condMapEmpty!49132)) mapNonEmpty!49132))

(get-info :version)

(assert (= (and mapNonEmpty!49132 ((_ is ValueCellFull!15026) mapValue!49132)) b!1250050))

(assert (= (and b!1250051 ((_ is ValueCellFull!15026) mapDefault!49132)) b!1250055))

(assert (= start!104882 b!1250051))

(declare-fun m!1150453 () Bool)

(assert (=> mapNonEmpty!49132 m!1150453))

(declare-fun m!1150455 () Bool)

(assert (=> b!1250054 m!1150455))

(declare-fun m!1150457 () Bool)

(assert (=> b!1250054 m!1150457))

(declare-fun m!1150459 () Bool)

(assert (=> b!1250052 m!1150459))

(declare-fun m!1150461 () Bool)

(assert (=> b!1250052 m!1150461))

(declare-fun m!1150463 () Bool)

(assert (=> b!1250052 m!1150463))

(declare-fun m!1150465 () Bool)

(assert (=> b!1250058 m!1150465))

(declare-fun m!1150467 () Bool)

(assert (=> b!1250058 m!1150467))

(declare-fun m!1150469 () Bool)

(assert (=> b!1250056 m!1150469))

(declare-fun m!1150471 () Bool)

(assert (=> b!1250057 m!1150471))

(declare-fun m!1150473 () Bool)

(assert (=> start!104882 m!1150473))

(declare-fun m!1150475 () Bool)

(assert (=> start!104882 m!1150475))

(declare-fun m!1150477 () Bool)

(assert (=> start!104882 m!1150477))

(check-sat (not b_next!26677) (not b!1250052) (not b!1250058) (not b!1250057) b_and!44435 (not b!1250054) (not start!104882) tp_is_empty!31579 (not b!1250056) (not mapNonEmpty!49132))
(check-sat b_and!44435 (not b_next!26677))
