; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42112 () Bool)

(assert start!42112)

(declare-fun b_free!11659 () Bool)

(declare-fun b_next!11659 () Bool)

(assert (=> start!42112 (= b_free!11659 (not b_next!11659))))

(declare-fun tp!40998 () Bool)

(declare-fun b_and!20055 () Bool)

(assert (=> start!42112 (= tp!40998 b_and!20055)))

(declare-fun b!470029 () Bool)

(declare-fun e!275326 () Bool)

(declare-fun tp_is_empty!13087 () Bool)

(assert (=> b!470029 (= e!275326 tp_is_empty!13087)))

(declare-fun b!470030 () Bool)

(declare-fun res!280891 () Bool)

(declare-fun e!275325 () Bool)

(assert (=> b!470030 (=> (not res!280891) (not e!275325))))

(declare-datatypes ((array!29929 0))(
  ( (array!29930 (arr!14388 (Array (_ BitVec 32) (_ BitVec 64))) (size!14741 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29929)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29929 (_ BitVec 32)) Bool)

(assert (=> b!470030 (= res!280891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470031 () Bool)

(declare-fun res!280893 () Bool)

(assert (=> b!470031 (=> (not res!280893) (not e!275325))))

(declare-datatypes ((List!8782 0))(
  ( (Nil!8779) (Cons!8778 (h!9634 (_ BitVec 64)) (t!14735 List!8782)) )
))
(declare-fun arrayNoDuplicates!0 (array!29929 (_ BitVec 32) List!8782) Bool)

(assert (=> b!470031 (= res!280893 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8779))))

(declare-fun res!280892 () Bool)

(assert (=> start!42112 (=> (not res!280892) (not e!275325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42112 (= res!280892 (validMask!0 mask!1365))))

(assert (=> start!42112 e!275325))

(assert (=> start!42112 tp_is_empty!13087))

(assert (=> start!42112 tp!40998))

(assert (=> start!42112 true))

(declare-fun array_inv!10466 (array!29929) Bool)

(assert (=> start!42112 (array_inv!10466 _keys!1025)))

(declare-datatypes ((V!18555 0))(
  ( (V!18556 (val!6588 Int)) )
))
(declare-datatypes ((ValueCell!6200 0))(
  ( (ValueCellFull!6200 (v!8873 V!18555)) (EmptyCell!6200) )
))
(declare-datatypes ((array!29931 0))(
  ( (array!29932 (arr!14389 (Array (_ BitVec 32) ValueCell!6200)) (size!14742 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29931)

(declare-fun e!275323 () Bool)

(declare-fun array_inv!10467 (array!29931) Bool)

(assert (=> start!42112 (and (array_inv!10467 _values!833) e!275323)))

(declare-fun b!470032 () Bool)

(declare-fun e!275324 () Bool)

(assert (=> b!470032 (= e!275324 tp_is_empty!13087)))

(declare-fun mapNonEmpty!21331 () Bool)

(declare-fun mapRes!21331 () Bool)

(declare-fun tp!40999 () Bool)

(assert (=> mapNonEmpty!21331 (= mapRes!21331 (and tp!40999 e!275326))))

(declare-fun mapRest!21331 () (Array (_ BitVec 32) ValueCell!6200))

(declare-fun mapValue!21331 () ValueCell!6200)

(declare-fun mapKey!21331 () (_ BitVec 32))

(assert (=> mapNonEmpty!21331 (= (arr!14389 _values!833) (store mapRest!21331 mapKey!21331 mapValue!21331))))

(declare-fun mapIsEmpty!21331 () Bool)

(assert (=> mapIsEmpty!21331 mapRes!21331))

(declare-fun b!470033 () Bool)

(assert (=> b!470033 (= e!275325 (not true))))

(declare-datatypes ((tuple2!8712 0))(
  ( (tuple2!8713 (_1!4367 (_ BitVec 64)) (_2!4367 V!18555)) )
))
(declare-datatypes ((List!8783 0))(
  ( (Nil!8780) (Cons!8779 (h!9635 tuple2!8712) (t!14736 List!8783)) )
))
(declare-datatypes ((ListLongMap!7615 0))(
  ( (ListLongMap!7616 (toList!3823 List!8783)) )
))
(declare-fun lt!213161 () ListLongMap!7615)

(declare-fun lt!213160 () ListLongMap!7615)

(assert (=> b!470033 (= lt!213161 lt!213160)))

(declare-datatypes ((Unit!13747 0))(
  ( (Unit!13748) )
))
(declare-fun lt!213162 () Unit!13747)

(declare-fun minValueBefore!38 () V!18555)

(declare-fun zeroValue!794 () V!18555)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18555)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!155 (array!29929 array!29931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18555 V!18555 V!18555 V!18555 (_ BitVec 32) Int) Unit!13747)

(assert (=> b!470033 (= lt!213162 (lemmaNoChangeToArrayThenSameMapNoExtras!155 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1998 (array!29929 array!29931 (_ BitVec 32) (_ BitVec 32) V!18555 V!18555 (_ BitVec 32) Int) ListLongMap!7615)

(assert (=> b!470033 (= lt!213160 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470033 (= lt!213161 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470034 () Bool)

(assert (=> b!470034 (= e!275323 (and e!275324 mapRes!21331))))

(declare-fun condMapEmpty!21331 () Bool)

(declare-fun mapDefault!21331 () ValueCell!6200)

(assert (=> b!470034 (= condMapEmpty!21331 (= (arr!14389 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6200)) mapDefault!21331)))))

(declare-fun b!470035 () Bool)

(declare-fun res!280890 () Bool)

(assert (=> b!470035 (=> (not res!280890) (not e!275325))))

(assert (=> b!470035 (= res!280890 (and (= (size!14742 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14741 _keys!1025) (size!14742 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42112 res!280892) b!470035))

(assert (= (and b!470035 res!280890) b!470030))

(assert (= (and b!470030 res!280891) b!470031))

(assert (= (and b!470031 res!280893) b!470033))

(assert (= (and b!470034 condMapEmpty!21331) mapIsEmpty!21331))

(assert (= (and b!470034 (not condMapEmpty!21331)) mapNonEmpty!21331))

(get-info :version)

(assert (= (and mapNonEmpty!21331 ((_ is ValueCellFull!6200) mapValue!21331)) b!470029))

(assert (= (and b!470034 ((_ is ValueCellFull!6200) mapDefault!21331)) b!470032))

(assert (= start!42112 b!470034))

(declare-fun m!451875 () Bool)

(assert (=> b!470033 m!451875))

(declare-fun m!451877 () Bool)

(assert (=> b!470033 m!451877))

(declare-fun m!451879 () Bool)

(assert (=> b!470033 m!451879))

(declare-fun m!451881 () Bool)

(assert (=> start!42112 m!451881))

(declare-fun m!451883 () Bool)

(assert (=> start!42112 m!451883))

(declare-fun m!451885 () Bool)

(assert (=> start!42112 m!451885))

(declare-fun m!451887 () Bool)

(assert (=> b!470030 m!451887))

(declare-fun m!451889 () Bool)

(assert (=> b!470031 m!451889))

(declare-fun m!451891 () Bool)

(assert (=> mapNonEmpty!21331 m!451891))

(check-sat (not start!42112) (not b!470030) (not b!470033) (not b!470031) (not b_next!11659) tp_is_empty!13087 (not mapNonEmpty!21331) b_and!20055)
(check-sat b_and!20055 (not b_next!11659))
