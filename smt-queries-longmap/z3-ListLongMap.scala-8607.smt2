; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105110 () Bool)

(assert start!105110)

(declare-fun b_free!26677 () Bool)

(declare-fun b_next!26677 () Bool)

(assert (=> start!105110 (= b_free!26677 (not b_next!26677))))

(declare-fun tp!93523 () Bool)

(declare-fun b_and!44455 () Bool)

(assert (=> start!105110 (= tp!93523 b_and!44455)))

(declare-fun mapIsEmpty!49132 () Bool)

(declare-fun mapRes!49132 () Bool)

(assert (=> mapIsEmpty!49132 mapRes!49132))

(declare-fun b!1251437 () Bool)

(declare-fun e!710484 () Bool)

(declare-fun e!710489 () Bool)

(assert (=> b!1251437 (= e!710484 e!710489)))

(declare-fun res!834386 () Bool)

(assert (=> b!1251437 (=> res!834386 e!710489)))

(declare-datatypes ((V!47471 0))(
  ( (V!47472 (val!15852 Int)) )
))
(declare-datatypes ((tuple2!20454 0))(
  ( (tuple2!20455 (_1!10238 (_ BitVec 64)) (_2!10238 V!47471)) )
))
(declare-datatypes ((List!27706 0))(
  ( (Nil!27703) (Cons!27702 (h!28920 tuple2!20454) (t!41171 List!27706)) )
))
(declare-datatypes ((ListLongMap!18335 0))(
  ( (ListLongMap!18336 (toList!9183 List!27706)) )
))
(declare-fun lt!564546 () ListLongMap!18335)

(declare-fun contains!7512 (ListLongMap!18335 (_ BitVec 64)) Bool)

(assert (=> b!1251437 (= res!834386 (contains!7512 lt!564546 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47471)

(declare-datatypes ((array!80877 0))(
  ( (array!80878 (arr!39000 (Array (_ BitVec 32) (_ BitVec 64))) (size!39537 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80877)

(declare-datatypes ((ValueCell!15026 0))(
  ( (ValueCellFull!15026 (v!18544 V!47471)) (EmptyCell!15026) )
))
(declare-datatypes ((array!80879 0))(
  ( (array!80880 (arr!39001 (Array (_ BitVec 32) ValueCell!15026)) (size!39538 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80879)

(declare-fun minValueBefore!43 () V!47471)

(declare-fun getCurrentListMap!4449 (array!80877 array!80879 (_ BitVec 32) (_ BitVec 32) V!47471 V!47471 (_ BitVec 32) Int) ListLongMap!18335)

(assert (=> b!1251437 (= lt!564546 (getCurrentListMap!4449 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251438 () Bool)

(declare-fun res!834385 () Bool)

(declare-fun e!710485 () Bool)

(assert (=> b!1251438 (=> (not res!834385) (not e!710485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80877 (_ BitVec 32)) Bool)

(assert (=> b!1251438 (= res!834385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251439 () Bool)

(assert (=> b!1251439 (= e!710485 (not e!710484))))

(declare-fun res!834388 () Bool)

(assert (=> b!1251439 (=> res!834388 e!710484)))

(assert (=> b!1251439 (= res!834388 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564543 () ListLongMap!18335)

(declare-fun lt!564544 () ListLongMap!18335)

(assert (=> b!1251439 (= lt!564543 lt!564544)))

(declare-fun minValueAfter!43 () V!47471)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41506 0))(
  ( (Unit!41507) )
))
(declare-fun lt!564545 () Unit!41506)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!932 (array!80877 array!80879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47471 V!47471 V!47471 V!47471 (_ BitVec 32) Int) Unit!41506)

(assert (=> b!1251439 (= lt!564545 (lemmaNoChangeToArrayThenSameMapNoExtras!932 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5618 (array!80877 array!80879 (_ BitVec 32) (_ BitVec 32) V!47471 V!47471 (_ BitVec 32) Int) ListLongMap!18335)

(assert (=> b!1251439 (= lt!564544 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251439 (= lt!564543 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834384 () Bool)

(assert (=> start!105110 (=> (not res!834384) (not e!710485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105110 (= res!834384 (validMask!0 mask!1466))))

(assert (=> start!105110 e!710485))

(assert (=> start!105110 true))

(assert (=> start!105110 tp!93523))

(declare-fun tp_is_empty!31579 () Bool)

(assert (=> start!105110 tp_is_empty!31579))

(declare-fun array_inv!29871 (array!80877) Bool)

(assert (=> start!105110 (array_inv!29871 _keys!1118)))

(declare-fun e!710488 () Bool)

(declare-fun array_inv!29872 (array!80879) Bool)

(assert (=> start!105110 (and (array_inv!29872 _values!914) e!710488)))

(declare-fun b!1251440 () Bool)

(declare-fun e!710487 () Bool)

(assert (=> b!1251440 (= e!710487 tp_is_empty!31579)))

(declare-fun b!1251441 () Bool)

(assert (=> b!1251441 (= e!710488 (and e!710487 mapRes!49132))))

(declare-fun condMapEmpty!49132 () Bool)

(declare-fun mapDefault!49132 () ValueCell!15026)

(assert (=> b!1251441 (= condMapEmpty!49132 (= (arr!39001 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15026)) mapDefault!49132)))))

(declare-fun b!1251442 () Bool)

(declare-fun res!834387 () Bool)

(assert (=> b!1251442 (=> (not res!834387) (not e!710485))))

(assert (=> b!1251442 (= res!834387 (and (= (size!39538 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39537 _keys!1118) (size!39538 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251443 () Bool)

(declare-fun e!710490 () Bool)

(assert (=> b!1251443 (= e!710490 tp_is_empty!31579)))

(declare-fun b!1251444 () Bool)

(assert (=> b!1251444 (= e!710489 true)))

(declare-fun -!1974 (ListLongMap!18335 (_ BitVec 64)) ListLongMap!18335)

(assert (=> b!1251444 (= (-!1974 lt!564546 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564546)))

(declare-fun lt!564542 () Unit!41506)

(declare-fun removeNotPresentStillSame!84 (ListLongMap!18335 (_ BitVec 64)) Unit!41506)

(assert (=> b!1251444 (= lt!564542 (removeNotPresentStillSame!84 lt!564546 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251445 () Bool)

(declare-fun res!834389 () Bool)

(assert (=> b!1251445 (=> (not res!834389) (not e!710485))))

(declare-datatypes ((List!27707 0))(
  ( (Nil!27704) (Cons!27703 (h!28921 (_ BitVec 64)) (t!41172 List!27707)) )
))
(declare-fun arrayNoDuplicates!0 (array!80877 (_ BitVec 32) List!27707) Bool)

(assert (=> b!1251445 (= res!834389 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27704))))

(declare-fun mapNonEmpty!49132 () Bool)

(declare-fun tp!93524 () Bool)

(assert (=> mapNonEmpty!49132 (= mapRes!49132 (and tp!93524 e!710490))))

(declare-fun mapValue!49132 () ValueCell!15026)

(declare-fun mapKey!49132 () (_ BitVec 32))

(declare-fun mapRest!49132 () (Array (_ BitVec 32) ValueCell!15026))

(assert (=> mapNonEmpty!49132 (= (arr!39001 _values!914) (store mapRest!49132 mapKey!49132 mapValue!49132))))

(assert (= (and start!105110 res!834384) b!1251442))

(assert (= (and b!1251442 res!834387) b!1251438))

(assert (= (and b!1251438 res!834385) b!1251445))

(assert (= (and b!1251445 res!834389) b!1251439))

(assert (= (and b!1251439 (not res!834388)) b!1251437))

(assert (= (and b!1251437 (not res!834386)) b!1251444))

(assert (= (and b!1251441 condMapEmpty!49132) mapIsEmpty!49132))

(assert (= (and b!1251441 (not condMapEmpty!49132)) mapNonEmpty!49132))

(get-info :version)

(assert (= (and mapNonEmpty!49132 ((_ is ValueCellFull!15026) mapValue!49132)) b!1251443))

(assert (= (and b!1251441 ((_ is ValueCellFull!15026) mapDefault!49132)) b!1251440))

(assert (= start!105110 b!1251441))

(declare-fun m!1152585 () Bool)

(assert (=> start!105110 m!1152585))

(declare-fun m!1152587 () Bool)

(assert (=> start!105110 m!1152587))

(declare-fun m!1152589 () Bool)

(assert (=> start!105110 m!1152589))

(declare-fun m!1152591 () Bool)

(assert (=> b!1251444 m!1152591))

(declare-fun m!1152593 () Bool)

(assert (=> b!1251444 m!1152593))

(declare-fun m!1152595 () Bool)

(assert (=> b!1251438 m!1152595))

(declare-fun m!1152597 () Bool)

(assert (=> b!1251439 m!1152597))

(declare-fun m!1152599 () Bool)

(assert (=> b!1251439 m!1152599))

(declare-fun m!1152601 () Bool)

(assert (=> b!1251439 m!1152601))

(declare-fun m!1152603 () Bool)

(assert (=> b!1251437 m!1152603))

(declare-fun m!1152605 () Bool)

(assert (=> b!1251437 m!1152605))

(declare-fun m!1152607 () Bool)

(assert (=> b!1251445 m!1152607))

(declare-fun m!1152609 () Bool)

(assert (=> mapNonEmpty!49132 m!1152609))

(check-sat (not b!1251445) b_and!44455 (not b!1251438) (not start!105110) (not mapNonEmpty!49132) (not b!1251444) (not b_next!26677) (not b!1251437) tp_is_empty!31579 (not b!1251439))
(check-sat b_and!44455 (not b_next!26677))
