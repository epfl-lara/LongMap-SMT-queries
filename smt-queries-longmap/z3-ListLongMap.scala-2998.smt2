; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42278 () Bool)

(assert start!42278)

(declare-fun b_free!11797 () Bool)

(declare-fun b_next!11797 () Bool)

(assert (=> start!42278 (= b_free!11797 (not b_next!11797))))

(declare-fun tp!41419 () Bool)

(declare-fun b_and!20245 () Bool)

(assert (=> start!42278 (= tp!41419 b_and!20245)))

(declare-fun res!281904 () Bool)

(declare-fun e!276606 () Bool)

(assert (=> start!42278 (=> (not res!281904) (not e!276606))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42278 (= res!281904 (validMask!0 mask!1365))))

(assert (=> start!42278 e!276606))

(declare-fun tp_is_empty!13225 () Bool)

(assert (=> start!42278 tp_is_empty!13225))

(assert (=> start!42278 tp!41419))

(assert (=> start!42278 true))

(declare-datatypes ((array!30196 0))(
  ( (array!30197 (arr!14519 (Array (_ BitVec 32) (_ BitVec 64))) (size!14871 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30196)

(declare-fun array_inv!10562 (array!30196) Bool)

(assert (=> start!42278 (array_inv!10562 _keys!1025)))

(declare-datatypes ((V!18739 0))(
  ( (V!18740 (val!6657 Int)) )
))
(declare-datatypes ((ValueCell!6269 0))(
  ( (ValueCellFull!6269 (v!8949 V!18739)) (EmptyCell!6269) )
))
(declare-datatypes ((array!30198 0))(
  ( (array!30199 (arr!14520 (Array (_ BitVec 32) ValueCell!6269)) (size!14872 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30198)

(declare-fun e!276603 () Bool)

(declare-fun array_inv!10563 (array!30198) Bool)

(assert (=> start!42278 (and (array_inv!10563 _values!833) e!276603)))

(declare-fun mapNonEmpty!21544 () Bool)

(declare-fun mapRes!21544 () Bool)

(declare-fun tp!41418 () Bool)

(declare-fun e!276605 () Bool)

(assert (=> mapNonEmpty!21544 (= mapRes!21544 (and tp!41418 e!276605))))

(declare-fun mapValue!21544 () ValueCell!6269)

(declare-fun mapKey!21544 () (_ BitVec 32))

(declare-fun mapRest!21544 () (Array (_ BitVec 32) ValueCell!6269))

(assert (=> mapNonEmpty!21544 (= (arr!14520 _values!833) (store mapRest!21544 mapKey!21544 mapValue!21544))))

(declare-fun b!471858 () Bool)

(declare-fun res!281903 () Bool)

(assert (=> b!471858 (=> (not res!281903) (not e!276606))))

(declare-datatypes ((List!8754 0))(
  ( (Nil!8751) (Cons!8750 (h!9606 (_ BitVec 64)) (t!14712 List!8754)) )
))
(declare-fun arrayNoDuplicates!0 (array!30196 (_ BitVec 32) List!8754) Bool)

(assert (=> b!471858 (= res!281903 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8751))))

(declare-fun b!471859 () Bool)

(declare-fun e!276602 () Bool)

(assert (=> b!471859 (= e!276603 (and e!276602 mapRes!21544))))

(declare-fun condMapEmpty!21544 () Bool)

(declare-fun mapDefault!21544 () ValueCell!6269)

(assert (=> b!471859 (= condMapEmpty!21544 (= (arr!14520 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6269)) mapDefault!21544)))))

(declare-fun b!471860 () Bool)

(declare-fun res!281902 () Bool)

(assert (=> b!471860 (=> (not res!281902) (not e!276606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30196 (_ BitVec 32)) Bool)

(assert (=> b!471860 (= res!281902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471861 () Bool)

(assert (=> b!471861 (= e!276606 (not true))))

(declare-datatypes ((tuple2!8688 0))(
  ( (tuple2!8689 (_1!4355 (_ BitVec 64)) (_2!4355 V!18739)) )
))
(declare-datatypes ((List!8755 0))(
  ( (Nil!8752) (Cons!8751 (h!9607 tuple2!8688) (t!14713 List!8755)) )
))
(declare-datatypes ((ListLongMap!7603 0))(
  ( (ListLongMap!7604 (toList!3817 List!8755)) )
))
(declare-fun lt!214107 () ListLongMap!7603)

(declare-fun lt!214108 () ListLongMap!7603)

(assert (=> b!471861 (= lt!214107 lt!214108)))

(declare-fun minValueBefore!38 () V!18739)

(declare-datatypes ((Unit!13847 0))(
  ( (Unit!13848) )
))
(declare-fun lt!214109 () Unit!13847)

(declare-fun zeroValue!794 () V!18739)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18739)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!192 (array!30196 array!30198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18739 V!18739 V!18739 V!18739 (_ BitVec 32) Int) Unit!13847)

(assert (=> b!471861 (= lt!214109 (lemmaNoChangeToArrayThenSameMapNoExtras!192 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2032 (array!30196 array!30198 (_ BitVec 32) (_ BitVec 32) V!18739 V!18739 (_ BitVec 32) Int) ListLongMap!7603)

(assert (=> b!471861 (= lt!214108 (getCurrentListMapNoExtraKeys!2032 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471861 (= lt!214107 (getCurrentListMapNoExtraKeys!2032 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471862 () Bool)

(assert (=> b!471862 (= e!276602 tp_is_empty!13225)))

(declare-fun b!471863 () Bool)

(assert (=> b!471863 (= e!276605 tp_is_empty!13225)))

(declare-fun mapIsEmpty!21544 () Bool)

(assert (=> mapIsEmpty!21544 mapRes!21544))

(declare-fun b!471864 () Bool)

(declare-fun res!281905 () Bool)

(assert (=> b!471864 (=> (not res!281905) (not e!276606))))

(assert (=> b!471864 (= res!281905 (and (= (size!14872 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14871 _keys!1025) (size!14872 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42278 res!281904) b!471864))

(assert (= (and b!471864 res!281905) b!471860))

(assert (= (and b!471860 res!281902) b!471858))

(assert (= (and b!471858 res!281903) b!471861))

(assert (= (and b!471859 condMapEmpty!21544) mapIsEmpty!21544))

(assert (= (and b!471859 (not condMapEmpty!21544)) mapNonEmpty!21544))

(get-info :version)

(assert (= (and mapNonEmpty!21544 ((_ is ValueCellFull!6269) mapValue!21544)) b!471863))

(assert (= (and b!471859 ((_ is ValueCellFull!6269) mapDefault!21544)) b!471862))

(assert (= start!42278 b!471859))

(declare-fun m!454165 () Bool)

(assert (=> b!471861 m!454165))

(declare-fun m!454167 () Bool)

(assert (=> b!471861 m!454167))

(declare-fun m!454169 () Bool)

(assert (=> b!471861 m!454169))

(declare-fun m!454171 () Bool)

(assert (=> b!471860 m!454171))

(declare-fun m!454173 () Bool)

(assert (=> mapNonEmpty!21544 m!454173))

(declare-fun m!454175 () Bool)

(assert (=> b!471858 m!454175))

(declare-fun m!454177 () Bool)

(assert (=> start!42278 m!454177))

(declare-fun m!454179 () Bool)

(assert (=> start!42278 m!454179))

(declare-fun m!454181 () Bool)

(assert (=> start!42278 m!454181))

(check-sat (not start!42278) (not b_next!11797) (not mapNonEmpty!21544) (not b!471858) b_and!20245 (not b!471861) tp_is_empty!13225 (not b!471860))
(check-sat b_and!20245 (not b_next!11797))
