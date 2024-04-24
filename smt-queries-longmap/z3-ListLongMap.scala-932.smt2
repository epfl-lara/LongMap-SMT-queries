; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20692 () Bool)

(assert start!20692)

(declare-fun b_free!5347 () Bool)

(declare-fun b_next!5347 () Bool)

(assert (=> start!20692 (= b_free!5347 (not b_next!5347))))

(declare-fun tp!19072 () Bool)

(declare-fun b_and!12107 () Bool)

(assert (=> start!20692 (= tp!19072 b_and!12107)))

(declare-fun b!206863 () Bool)

(declare-fun res!100291 () Bool)

(declare-fun e!135143 () Bool)

(assert (=> b!206863 (=> (not res!100291) (not e!135143))))

(declare-datatypes ((array!9611 0))(
  ( (array!9612 (arr!4556 (Array (_ BitVec 32) (_ BitVec 64))) (size!4881 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9611)

(declare-datatypes ((List!2853 0))(
  ( (Nil!2850) (Cons!2849 (h!3491 (_ BitVec 64)) (t!7776 List!2853)) )
))
(declare-fun arrayNoDuplicates!0 (array!9611 (_ BitVec 32) List!2853) Bool)

(assert (=> b!206863 (= res!100291 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2850))))

(declare-fun res!100296 () Bool)

(assert (=> start!20692 (=> (not res!100296) (not e!135143))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20692 (= res!100296 (validMask!0 mask!1149))))

(assert (=> start!20692 e!135143))

(declare-datatypes ((V!6585 0))(
  ( (V!6586 (val!2646 Int)) )
))
(declare-datatypes ((ValueCell!2258 0))(
  ( (ValueCellFull!2258 (v!4617 V!6585)) (EmptyCell!2258) )
))
(declare-datatypes ((array!9613 0))(
  ( (array!9614 (arr!4557 (Array (_ BitVec 32) ValueCell!2258)) (size!4882 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9613)

(declare-fun e!135139 () Bool)

(declare-fun array_inv!2983 (array!9613) Bool)

(assert (=> start!20692 (and (array_inv!2983 _values!649) e!135139)))

(assert (=> start!20692 true))

(declare-fun tp_is_empty!5203 () Bool)

(assert (=> start!20692 tp_is_empty!5203))

(declare-fun array_inv!2984 (array!9611) Bool)

(assert (=> start!20692 (array_inv!2984 _keys!825)))

(assert (=> start!20692 tp!19072))

(declare-fun b!206864 () Bool)

(declare-fun res!100297 () Bool)

(assert (=> b!206864 (=> (not res!100297) (not e!135143))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206864 (= res!100297 (= (select (arr!4556 _keys!825) i!601) k0!843))))

(declare-fun b!206865 () Bool)

(declare-fun res!100294 () Bool)

(assert (=> b!206865 (=> (not res!100294) (not e!135143))))

(assert (=> b!206865 (= res!100294 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4881 _keys!825))))))

(declare-fun mapIsEmpty!8873 () Bool)

(declare-fun mapRes!8873 () Bool)

(assert (=> mapIsEmpty!8873 mapRes!8873))

(declare-fun b!206866 () Bool)

(declare-fun res!100293 () Bool)

(assert (=> b!206866 (=> (not res!100293) (not e!135143))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206866 (= res!100293 (and (= (size!4882 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4881 _keys!825) (size!4882 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206867 () Bool)

(declare-fun e!135141 () Bool)

(assert (=> b!206867 (= e!135141 tp_is_empty!5203)))

(declare-fun b!206868 () Bool)

(declare-fun e!135142 () Bool)

(assert (=> b!206868 (= e!135139 (and e!135142 mapRes!8873))))

(declare-fun condMapEmpty!8873 () Bool)

(declare-fun mapDefault!8873 () ValueCell!2258)

(assert (=> b!206868 (= condMapEmpty!8873 (= (arr!4557 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2258)) mapDefault!8873)))))

(declare-fun b!206869 () Bool)

(declare-fun res!100295 () Bool)

(assert (=> b!206869 (=> (not res!100295) (not e!135143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206869 (= res!100295 (validKeyInArray!0 k0!843))))

(declare-fun b!206870 () Bool)

(declare-fun res!100292 () Bool)

(assert (=> b!206870 (=> (not res!100292) (not e!135143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9611 (_ BitVec 32)) Bool)

(assert (=> b!206870 (= res!100292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206871 () Bool)

(assert (=> b!206871 (= e!135142 tp_is_empty!5203)))

(declare-fun b!206872 () Bool)

(assert (=> b!206872 (= e!135143 (not true))))

(declare-datatypes ((tuple2!3966 0))(
  ( (tuple2!3967 (_1!1994 (_ BitVec 64)) (_2!1994 V!6585)) )
))
(declare-datatypes ((List!2854 0))(
  ( (Nil!2851) (Cons!2850 (h!3492 tuple2!3966) (t!7777 List!2854)) )
))
(declare-datatypes ((ListLongMap!2881 0))(
  ( (ListLongMap!2882 (toList!1456 List!2854)) )
))
(declare-fun lt!105894 () ListLongMap!2881)

(declare-fun zeroValue!615 () V!6585)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6585)

(declare-fun getCurrentListMap!1026 (array!9611 array!9613 (_ BitVec 32) (_ BitVec 32) V!6585 V!6585 (_ BitVec 32) Int) ListLongMap!2881)

(assert (=> b!206872 (= lt!105894 (getCurrentListMap!1026 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105897 () ListLongMap!2881)

(declare-fun lt!105899 () array!9613)

(assert (=> b!206872 (= lt!105897 (getCurrentListMap!1026 _keys!825 lt!105899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105893 () ListLongMap!2881)

(declare-fun lt!105898 () ListLongMap!2881)

(assert (=> b!206872 (and (= lt!105893 lt!105898) (= lt!105898 lt!105893))))

(declare-fun lt!105895 () ListLongMap!2881)

(declare-fun v!520 () V!6585)

(declare-fun +!510 (ListLongMap!2881 tuple2!3966) ListLongMap!2881)

(assert (=> b!206872 (= lt!105898 (+!510 lt!105895 (tuple2!3967 k0!843 v!520)))))

(declare-datatypes ((Unit!6296 0))(
  ( (Unit!6297) )
))
(declare-fun lt!105896 () Unit!6296)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!162 (array!9611 array!9613 (_ BitVec 32) (_ BitVec 32) V!6585 V!6585 (_ BitVec 32) (_ BitVec 64) V!6585 (_ BitVec 32) Int) Unit!6296)

(assert (=> b!206872 (= lt!105896 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!162 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!419 (array!9611 array!9613 (_ BitVec 32) (_ BitVec 32) V!6585 V!6585 (_ BitVec 32) Int) ListLongMap!2881)

(assert (=> b!206872 (= lt!105893 (getCurrentListMapNoExtraKeys!419 _keys!825 lt!105899 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206872 (= lt!105899 (array!9614 (store (arr!4557 _values!649) i!601 (ValueCellFull!2258 v!520)) (size!4882 _values!649)))))

(assert (=> b!206872 (= lt!105895 (getCurrentListMapNoExtraKeys!419 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8873 () Bool)

(declare-fun tp!19073 () Bool)

(assert (=> mapNonEmpty!8873 (= mapRes!8873 (and tp!19073 e!135141))))

(declare-fun mapRest!8873 () (Array (_ BitVec 32) ValueCell!2258))

(declare-fun mapValue!8873 () ValueCell!2258)

(declare-fun mapKey!8873 () (_ BitVec 32))

(assert (=> mapNonEmpty!8873 (= (arr!4557 _values!649) (store mapRest!8873 mapKey!8873 mapValue!8873))))

(assert (= (and start!20692 res!100296) b!206866))

(assert (= (and b!206866 res!100293) b!206870))

(assert (= (and b!206870 res!100292) b!206863))

(assert (= (and b!206863 res!100291) b!206865))

(assert (= (and b!206865 res!100294) b!206869))

(assert (= (and b!206869 res!100295) b!206864))

(assert (= (and b!206864 res!100297) b!206872))

(assert (= (and b!206868 condMapEmpty!8873) mapIsEmpty!8873))

(assert (= (and b!206868 (not condMapEmpty!8873)) mapNonEmpty!8873))

(get-info :version)

(assert (= (and mapNonEmpty!8873 ((_ is ValueCellFull!2258) mapValue!8873)) b!206867))

(assert (= (and b!206868 ((_ is ValueCellFull!2258) mapDefault!8873)) b!206871))

(assert (= start!20692 b!206868))

(declare-fun m!234741 () Bool)

(assert (=> b!206863 m!234741))

(declare-fun m!234743 () Bool)

(assert (=> b!206870 m!234743))

(declare-fun m!234745 () Bool)

(assert (=> mapNonEmpty!8873 m!234745))

(declare-fun m!234747 () Bool)

(assert (=> b!206869 m!234747))

(declare-fun m!234749 () Bool)

(assert (=> b!206864 m!234749))

(declare-fun m!234751 () Bool)

(assert (=> start!20692 m!234751))

(declare-fun m!234753 () Bool)

(assert (=> start!20692 m!234753))

(declare-fun m!234755 () Bool)

(assert (=> start!20692 m!234755))

(declare-fun m!234757 () Bool)

(assert (=> b!206872 m!234757))

(declare-fun m!234759 () Bool)

(assert (=> b!206872 m!234759))

(declare-fun m!234761 () Bool)

(assert (=> b!206872 m!234761))

(declare-fun m!234763 () Bool)

(assert (=> b!206872 m!234763))

(declare-fun m!234765 () Bool)

(assert (=> b!206872 m!234765))

(declare-fun m!234767 () Bool)

(assert (=> b!206872 m!234767))

(declare-fun m!234769 () Bool)

(assert (=> b!206872 m!234769))

(check-sat (not b!206869) (not b!206870) (not mapNonEmpty!8873) (not b!206863) b_and!12107 (not b_next!5347) (not start!20692) (not b!206872) tp_is_empty!5203)
(check-sat b_and!12107 (not b_next!5347))
