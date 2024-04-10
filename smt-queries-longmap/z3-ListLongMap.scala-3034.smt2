; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42580 () Bool)

(assert start!42580)

(declare-fun b_free!12015 () Bool)

(declare-fun b_next!12015 () Bool)

(assert (=> start!42580 (= b_free!12015 (not b_next!12015))))

(declare-fun tp!42085 () Bool)

(declare-fun b_and!20495 () Bool)

(assert (=> start!42580 (= tp!42085 b_and!20495)))

(declare-fun res!283709 () Bool)

(declare-fun e!278897 () Bool)

(assert (=> start!42580 (=> (not res!283709) (not e!278897))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42580 (= res!283709 (validMask!0 mask!1365))))

(assert (=> start!42580 e!278897))

(declare-fun tp_is_empty!13443 () Bool)

(assert (=> start!42580 tp_is_empty!13443))

(assert (=> start!42580 tp!42085))

(assert (=> start!42580 true))

(declare-datatypes ((array!30627 0))(
  ( (array!30628 (arr!14731 (Array (_ BitVec 32) (_ BitVec 64))) (size!15083 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30627)

(declare-fun array_inv!10628 (array!30627) Bool)

(assert (=> start!42580 (array_inv!10628 _keys!1025)))

(declare-datatypes ((V!19029 0))(
  ( (V!19030 (val!6766 Int)) )
))
(declare-datatypes ((ValueCell!6378 0))(
  ( (ValueCellFull!6378 (v!9059 V!19029)) (EmptyCell!6378) )
))
(declare-datatypes ((array!30629 0))(
  ( (array!30630 (arr!14732 (Array (_ BitVec 32) ValueCell!6378)) (size!15084 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30629)

(declare-fun e!278894 () Bool)

(declare-fun array_inv!10629 (array!30629) Bool)

(assert (=> start!42580 (and (array_inv!10629 _values!833) e!278894)))

(declare-fun b!475046 () Bool)

(declare-fun res!283710 () Bool)

(assert (=> b!475046 (=> (not res!283710) (not e!278897))))

(declare-datatypes ((List!9001 0))(
  ( (Nil!8998) (Cons!8997 (h!9853 (_ BitVec 64)) (t!14975 List!9001)) )
))
(declare-fun arrayNoDuplicates!0 (array!30627 (_ BitVec 32) List!9001) Bool)

(assert (=> b!475046 (= res!283710 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8998))))

(declare-fun b!475047 () Bool)

(declare-fun res!283707 () Bool)

(assert (=> b!475047 (=> (not res!283707) (not e!278897))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!475047 (= res!283707 (and (= (size!15084 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15083 _keys!1025) (size!15084 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475048 () Bool)

(declare-fun e!278895 () Bool)

(assert (=> b!475048 (= e!278895 tp_is_empty!13443)))

(declare-fun b!475049 () Bool)

(assert (=> b!475049 (= e!278897 false)))

(declare-datatypes ((tuple2!8924 0))(
  ( (tuple2!8925 (_1!4473 (_ BitVec 64)) (_2!4473 V!19029)) )
))
(declare-datatypes ((List!9002 0))(
  ( (Nil!8999) (Cons!8998 (h!9854 tuple2!8924) (t!14976 List!9002)) )
))
(declare-datatypes ((ListLongMap!7837 0))(
  ( (ListLongMap!7838 (toList!3934 List!9002)) )
))
(declare-fun lt!216365 () ListLongMap!7837)

(declare-fun zeroValue!794 () V!19029)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19029)

(declare-fun getCurrentListMapNoExtraKeys!2091 (array!30627 array!30629 (_ BitVec 32) (_ BitVec 32) V!19029 V!19029 (_ BitVec 32) Int) ListLongMap!7837)

(assert (=> b!475049 (= lt!216365 (getCurrentListMapNoExtraKeys!2091 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19029)

(declare-fun lt!216364 () ListLongMap!7837)

(assert (=> b!475049 (= lt!216364 (getCurrentListMapNoExtraKeys!2091 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21883 () Bool)

(declare-fun mapRes!21883 () Bool)

(assert (=> mapIsEmpty!21883 mapRes!21883))

(declare-fun b!475050 () Bool)

(assert (=> b!475050 (= e!278894 (and e!278895 mapRes!21883))))

(declare-fun condMapEmpty!21883 () Bool)

(declare-fun mapDefault!21883 () ValueCell!6378)

(assert (=> b!475050 (= condMapEmpty!21883 (= (arr!14732 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6378)) mapDefault!21883)))))

(declare-fun b!475051 () Bool)

(declare-fun e!278898 () Bool)

(assert (=> b!475051 (= e!278898 tp_is_empty!13443)))

(declare-fun mapNonEmpty!21883 () Bool)

(declare-fun tp!42084 () Bool)

(assert (=> mapNonEmpty!21883 (= mapRes!21883 (and tp!42084 e!278898))))

(declare-fun mapRest!21883 () (Array (_ BitVec 32) ValueCell!6378))

(declare-fun mapKey!21883 () (_ BitVec 32))

(declare-fun mapValue!21883 () ValueCell!6378)

(assert (=> mapNonEmpty!21883 (= (arr!14732 _values!833) (store mapRest!21883 mapKey!21883 mapValue!21883))))

(declare-fun b!475052 () Bool)

(declare-fun res!283708 () Bool)

(assert (=> b!475052 (=> (not res!283708) (not e!278897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30627 (_ BitVec 32)) Bool)

(assert (=> b!475052 (= res!283708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42580 res!283709) b!475047))

(assert (= (and b!475047 res!283707) b!475052))

(assert (= (and b!475052 res!283708) b!475046))

(assert (= (and b!475046 res!283710) b!475049))

(assert (= (and b!475050 condMapEmpty!21883) mapIsEmpty!21883))

(assert (= (and b!475050 (not condMapEmpty!21883)) mapNonEmpty!21883))

(get-info :version)

(assert (= (and mapNonEmpty!21883 ((_ is ValueCellFull!6378) mapValue!21883)) b!475051))

(assert (= (and b!475050 ((_ is ValueCellFull!6378) mapDefault!21883)) b!475048))

(assert (= start!42580 b!475050))

(declare-fun m!457319 () Bool)

(assert (=> b!475049 m!457319))

(declare-fun m!457321 () Bool)

(assert (=> b!475049 m!457321))

(declare-fun m!457323 () Bool)

(assert (=> mapNonEmpty!21883 m!457323))

(declare-fun m!457325 () Bool)

(assert (=> b!475046 m!457325))

(declare-fun m!457327 () Bool)

(assert (=> b!475052 m!457327))

(declare-fun m!457329 () Bool)

(assert (=> start!42580 m!457329))

(declare-fun m!457331 () Bool)

(assert (=> start!42580 m!457331))

(declare-fun m!457333 () Bool)

(assert (=> start!42580 m!457333))

(check-sat (not b_next!12015) b_and!20495 (not mapNonEmpty!21883) (not start!42580) tp_is_empty!13443 (not b!475046) (not b!475052) (not b!475049))
(check-sat b_and!20495 (not b_next!12015))
