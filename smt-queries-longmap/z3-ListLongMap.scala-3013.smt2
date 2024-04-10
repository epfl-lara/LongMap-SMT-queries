; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42414 () Bool)

(assert start!42414)

(declare-fun b_free!11889 () Bool)

(declare-fun b_next!11889 () Bool)

(assert (=> start!42414 (= b_free!11889 (not b_next!11889))))

(declare-fun tp!41701 () Bool)

(declare-fun b_and!20345 () Bool)

(assert (=> start!42414 (= tp!41701 b_and!20345)))

(declare-fun b!473240 () Bool)

(declare-fun res!282672 () Bool)

(declare-fun e!277607 () Bool)

(assert (=> b!473240 (=> (not res!282672) (not e!277607))))

(declare-datatypes ((array!30393 0))(
  ( (array!30394 (arr!14616 (Array (_ BitVec 32) (_ BitVec 64))) (size!14968 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30393)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30393 (_ BitVec 32)) Bool)

(assert (=> b!473240 (= res!282672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21688 () Bool)

(declare-fun mapRes!21688 () Bool)

(assert (=> mapIsEmpty!21688 mapRes!21688))

(declare-fun b!473241 () Bool)

(declare-fun e!277603 () Bool)

(assert (=> b!473241 (= e!277607 (not e!277603))))

(declare-fun res!282673 () Bool)

(assert (=> b!473241 (=> res!282673 e!277603)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473241 (= res!282673 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18861 0))(
  ( (V!18862 (val!6703 Int)) )
))
(declare-datatypes ((tuple2!8830 0))(
  ( (tuple2!8831 (_1!4426 (_ BitVec 64)) (_2!4426 V!18861)) )
))
(declare-datatypes ((List!8913 0))(
  ( (Nil!8910) (Cons!8909 (h!9765 tuple2!8830) (t!14883 List!8913)) )
))
(declare-datatypes ((ListLongMap!7743 0))(
  ( (ListLongMap!7744 (toList!3887 List!8913)) )
))
(declare-fun lt!214944 () ListLongMap!7743)

(declare-fun lt!214946 () ListLongMap!7743)

(assert (=> b!473241 (= lt!214944 lt!214946)))

(declare-fun minValueBefore!38 () V!18861)

(declare-fun zeroValue!794 () V!18861)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13930 0))(
  ( (Unit!13931) )
))
(declare-fun lt!214947 () Unit!13930)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6315 0))(
  ( (ValueCellFull!6315 (v!8994 V!18861)) (EmptyCell!6315) )
))
(declare-datatypes ((array!30395 0))(
  ( (array!30396 (arr!14617 (Array (_ BitVec 32) ValueCell!6315)) (size!14969 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30395)

(declare-fun minValueAfter!38 () V!18861)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!227 (array!30393 array!30395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18861 V!18861 V!18861 V!18861 (_ BitVec 32) Int) Unit!13930)

(assert (=> b!473241 (= lt!214947 (lemmaNoChangeToArrayThenSameMapNoExtras!227 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2047 (array!30393 array!30395 (_ BitVec 32) (_ BitVec 32) V!18861 V!18861 (_ BitVec 32) Int) ListLongMap!7743)

(assert (=> b!473241 (= lt!214946 (getCurrentListMapNoExtraKeys!2047 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473241 (= lt!214944 (getCurrentListMapNoExtraKeys!2047 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473242 () Bool)

(declare-fun e!277605 () Bool)

(declare-fun tp_is_empty!13317 () Bool)

(assert (=> b!473242 (= e!277605 tp_is_empty!13317)))

(declare-fun b!473243 () Bool)

(declare-fun e!277602 () Bool)

(assert (=> b!473243 (= e!277602 tp_is_empty!13317)))

(declare-fun res!282675 () Bool)

(assert (=> start!42414 (=> (not res!282675) (not e!277607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42414 (= res!282675 (validMask!0 mask!1365))))

(assert (=> start!42414 e!277607))

(assert (=> start!42414 tp_is_empty!13317))

(assert (=> start!42414 tp!41701))

(assert (=> start!42414 true))

(declare-fun array_inv!10546 (array!30393) Bool)

(assert (=> start!42414 (array_inv!10546 _keys!1025)))

(declare-fun e!277604 () Bool)

(declare-fun array_inv!10547 (array!30395) Bool)

(assert (=> start!42414 (and (array_inv!10547 _values!833) e!277604)))

(declare-fun b!473244 () Bool)

(declare-fun res!282674 () Bool)

(assert (=> b!473244 (=> (not res!282674) (not e!277607))))

(assert (=> b!473244 (= res!282674 (and (= (size!14969 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14968 _keys!1025) (size!14969 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473245 () Bool)

(assert (=> b!473245 (= e!277604 (and e!277605 mapRes!21688))))

(declare-fun condMapEmpty!21688 () Bool)

(declare-fun mapDefault!21688 () ValueCell!6315)

(assert (=> b!473245 (= condMapEmpty!21688 (= (arr!14617 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6315)) mapDefault!21688)))))

(declare-fun mapNonEmpty!21688 () Bool)

(declare-fun tp!41700 () Bool)

(assert (=> mapNonEmpty!21688 (= mapRes!21688 (and tp!41700 e!277602))))

(declare-fun mapValue!21688 () ValueCell!6315)

(declare-fun mapRest!21688 () (Array (_ BitVec 32) ValueCell!6315))

(declare-fun mapKey!21688 () (_ BitVec 32))

(assert (=> mapNonEmpty!21688 (= (arr!14617 _values!833) (store mapRest!21688 mapKey!21688 mapValue!21688))))

(declare-fun b!473246 () Bool)

(declare-fun res!282676 () Bool)

(assert (=> b!473246 (=> (not res!282676) (not e!277607))))

(declare-datatypes ((List!8914 0))(
  ( (Nil!8911) (Cons!8910 (h!9766 (_ BitVec 64)) (t!14884 List!8914)) )
))
(declare-fun arrayNoDuplicates!0 (array!30393 (_ BitVec 32) List!8914) Bool)

(assert (=> b!473246 (= res!282676 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8911))))

(declare-fun b!473247 () Bool)

(assert (=> b!473247 (= e!277603 true)))

(declare-fun lt!214945 () ListLongMap!7743)

(declare-fun lt!214943 () tuple2!8830)

(declare-fun +!1726 (ListLongMap!7743 tuple2!8830) ListLongMap!7743)

(assert (=> b!473247 (= (+!1726 lt!214945 lt!214943) (+!1726 (+!1726 lt!214945 (tuple2!8831 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214943))))

(assert (=> b!473247 (= lt!214943 (tuple2!8831 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214948 () Unit!13930)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!135 (ListLongMap!7743 (_ BitVec 64) V!18861 V!18861) Unit!13930)

(assert (=> b!473247 (= lt!214948 (addSameAsAddTwiceSameKeyDiffValues!135 lt!214945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473247 (= lt!214945 (+!1726 lt!214944 (tuple2!8831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214942 () ListLongMap!7743)

(declare-fun getCurrentListMap!2255 (array!30393 array!30395 (_ BitVec 32) (_ BitVec 32) V!18861 V!18861 (_ BitVec 32) Int) ListLongMap!7743)

(assert (=> b!473247 (= lt!214942 (getCurrentListMap!2255 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214941 () ListLongMap!7743)

(assert (=> b!473247 (= lt!214941 (getCurrentListMap!2255 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42414 res!282675) b!473244))

(assert (= (and b!473244 res!282674) b!473240))

(assert (= (and b!473240 res!282672) b!473246))

(assert (= (and b!473246 res!282676) b!473241))

(assert (= (and b!473241 (not res!282673)) b!473247))

(assert (= (and b!473245 condMapEmpty!21688) mapIsEmpty!21688))

(assert (= (and b!473245 (not condMapEmpty!21688)) mapNonEmpty!21688))

(get-info :version)

(assert (= (and mapNonEmpty!21688 ((_ is ValueCellFull!6315) mapValue!21688)) b!473243))

(assert (= (and b!473245 ((_ is ValueCellFull!6315) mapDefault!21688)) b!473242))

(assert (= start!42414 b!473245))

(declare-fun m!455225 () Bool)

(assert (=> b!473240 m!455225))

(declare-fun m!455227 () Bool)

(assert (=> b!473247 m!455227))

(declare-fun m!455229 () Bool)

(assert (=> b!473247 m!455229))

(declare-fun m!455231 () Bool)

(assert (=> b!473247 m!455231))

(declare-fun m!455233 () Bool)

(assert (=> b!473247 m!455233))

(declare-fun m!455235 () Bool)

(assert (=> b!473247 m!455235))

(assert (=> b!473247 m!455229))

(declare-fun m!455237 () Bool)

(assert (=> b!473247 m!455237))

(declare-fun m!455239 () Bool)

(assert (=> b!473247 m!455239))

(declare-fun m!455241 () Bool)

(assert (=> b!473246 m!455241))

(declare-fun m!455243 () Bool)

(assert (=> mapNonEmpty!21688 m!455243))

(declare-fun m!455245 () Bool)

(assert (=> b!473241 m!455245))

(declare-fun m!455247 () Bool)

(assert (=> b!473241 m!455247))

(declare-fun m!455249 () Bool)

(assert (=> b!473241 m!455249))

(declare-fun m!455251 () Bool)

(assert (=> start!42414 m!455251))

(declare-fun m!455253 () Bool)

(assert (=> start!42414 m!455253))

(declare-fun m!455255 () Bool)

(assert (=> start!42414 m!455255))

(check-sat (not b_next!11889) (not b!473241) (not start!42414) (not mapNonEmpty!21688) (not b!473240) b_and!20345 (not b!473247) tp_is_empty!13317 (not b!473246))
(check-sat b_and!20345 (not b_next!11889))
