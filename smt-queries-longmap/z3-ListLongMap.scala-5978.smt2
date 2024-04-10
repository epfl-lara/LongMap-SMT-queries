; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77696 () Bool)

(assert start!77696)

(declare-fun b_free!16281 () Bool)

(declare-fun b_next!16281 () Bool)

(assert (=> start!77696 (= b_free!16281 (not b_next!16281))))

(declare-fun tp!57105 () Bool)

(declare-fun b_and!26715 () Bool)

(assert (=> start!77696 (= tp!57105 b_and!26715)))

(declare-fun b!906271 () Bool)

(declare-fun res!611602 () Bool)

(declare-fun e!507873 () Bool)

(assert (=> b!906271 (=> (not res!611602) (not e!507873))))

(declare-datatypes ((array!53440 0))(
  ( (array!53441 (arr!25679 (Array (_ BitVec 32) (_ BitVec 64))) (size!26138 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53440)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53440 (_ BitVec 32)) Bool)

(assert (=> b!906271 (= res!611602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29761 () Bool)

(declare-fun mapRes!29761 () Bool)

(declare-fun tp!57104 () Bool)

(declare-fun e!507869 () Bool)

(assert (=> mapNonEmpty!29761 (= mapRes!29761 (and tp!57104 e!507869))))

(declare-datatypes ((V!29897 0))(
  ( (V!29898 (val!9400 Int)) )
))
(declare-datatypes ((ValueCell!8868 0))(
  ( (ValueCellFull!8868 (v!11905 V!29897)) (EmptyCell!8868) )
))
(declare-datatypes ((array!53442 0))(
  ( (array!53443 (arr!25680 (Array (_ BitVec 32) ValueCell!8868)) (size!26139 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53442)

(declare-fun mapRest!29761 () (Array (_ BitVec 32) ValueCell!8868))

(declare-fun mapValue!29761 () ValueCell!8868)

(declare-fun mapKey!29761 () (_ BitVec 32))

(assert (=> mapNonEmpty!29761 (= (arr!25680 _values!1152) (store mapRest!29761 mapKey!29761 mapValue!29761))))

(declare-fun b!906272 () Bool)

(declare-fun tp_is_empty!18699 () Bool)

(assert (=> b!906272 (= e!507869 tp_is_empty!18699)))

(declare-fun b!906273 () Bool)

(declare-fun res!611607 () Bool)

(assert (=> b!906273 (=> (not res!611607) (not e!507873))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!906273 (= res!611607 (and (= (size!26139 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26138 _keys!1386) (size!26139 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906274 () Bool)

(declare-fun res!611608 () Bool)

(declare-fun e!507868 () Bool)

(assert (=> b!906274 (=> res!611608 e!507868)))

(declare-datatypes ((tuple2!12234 0))(
  ( (tuple2!12235 (_1!6128 (_ BitVec 64)) (_2!6128 V!29897)) )
))
(declare-datatypes ((List!18041 0))(
  ( (Nil!18038) (Cons!18037 (h!19183 tuple2!12234) (t!25494 List!18041)) )
))
(declare-datatypes ((ListLongMap!10931 0))(
  ( (ListLongMap!10932 (toList!5481 List!18041)) )
))
(declare-fun lt!408857 () ListLongMap!10931)

(declare-fun lt!408860 () V!29897)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!468 (ListLongMap!10931 (_ BitVec 64)) V!29897)

(assert (=> b!906274 (= res!611608 (not (= (apply!468 lt!408857 k0!1033) lt!408860)))))

(declare-fun b!906275 () Bool)

(declare-fun e!507872 () Bool)

(assert (=> b!906275 (= e!507873 e!507872)))

(declare-fun res!611604 () Bool)

(assert (=> b!906275 (=> (not res!611604) (not e!507872))))

(declare-fun lt!408858 () ListLongMap!10931)

(declare-fun contains!4526 (ListLongMap!10931 (_ BitVec 64)) Bool)

(assert (=> b!906275 (= res!611604 (contains!4526 lt!408858 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29897)

(declare-fun minValue!1094 () V!29897)

(declare-fun getCurrentListMap!2747 (array!53440 array!53442 (_ BitVec 32) (_ BitVec 32) V!29897 V!29897 (_ BitVec 32) Int) ListLongMap!10931)

(assert (=> b!906275 (= lt!408858 (getCurrentListMap!2747 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906276 () Bool)

(declare-fun res!611609 () Bool)

(assert (=> b!906276 (=> (not res!611609) (not e!507873))))

(declare-datatypes ((List!18042 0))(
  ( (Nil!18039) (Cons!18038 (h!19184 (_ BitVec 64)) (t!25495 List!18042)) )
))
(declare-fun arrayNoDuplicates!0 (array!53440 (_ BitVec 32) List!18042) Bool)

(assert (=> b!906276 (= res!611609 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18039))))

(declare-fun b!906277 () Bool)

(declare-fun e!507866 () Bool)

(assert (=> b!906277 (= e!507872 (not e!507866))))

(declare-fun res!611603 () Bool)

(assert (=> b!906277 (=> res!611603 e!507866)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906277 (= res!611603 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26138 _keys!1386))))))

(declare-fun get!13498 (ValueCell!8868 V!29897) V!29897)

(declare-fun dynLambda!1344 (Int (_ BitVec 64)) V!29897)

(assert (=> b!906277 (= lt!408860 (get!13498 (select (arr!25680 _values!1152) i!717) (dynLambda!1344 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906277 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30756 0))(
  ( (Unit!30757) )
))
(declare-fun lt!408859 () Unit!30756)

(declare-fun lemmaKeyInListMapIsInArray!216 (array!53440 array!53442 (_ BitVec 32) (_ BitVec 32) V!29897 V!29897 (_ BitVec 64) Int) Unit!30756)

(assert (=> b!906277 (= lt!408859 (lemmaKeyInListMapIsInArray!216 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29761 () Bool)

(assert (=> mapIsEmpty!29761 mapRes!29761))

(declare-fun b!906279 () Bool)

(assert (=> b!906279 (= e!507868 true)))

(assert (=> b!906279 (= (apply!468 lt!408858 k0!1033) lt!408860)))

(declare-fun lt!408861 () Unit!30756)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!23 (array!53440 array!53442 (_ BitVec 32) (_ BitVec 32) V!29897 V!29897 (_ BitVec 64) V!29897 (_ BitVec 32) Int) Unit!30756)

(assert (=> b!906279 (= lt!408861 (lemmaListMapApplyFromThenApplyFromZero!23 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408860 i!717 defaultEntry!1160))))

(declare-fun b!906280 () Bool)

(declare-fun e!507871 () Bool)

(assert (=> b!906280 (= e!507871 tp_is_empty!18699)))

(declare-fun b!906281 () Bool)

(assert (=> b!906281 (= e!507866 e!507868)))

(declare-fun res!611605 () Bool)

(assert (=> b!906281 (=> res!611605 e!507868)))

(assert (=> b!906281 (= res!611605 (not (contains!4526 lt!408857 k0!1033)))))

(assert (=> b!906281 (= lt!408857 (getCurrentListMap!2747 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906282 () Bool)

(declare-fun res!611606 () Bool)

(assert (=> b!906282 (=> (not res!611606) (not e!507872))))

(assert (=> b!906282 (= res!611606 (and (= (select (arr!25679 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906283 () Bool)

(declare-fun res!611600 () Bool)

(assert (=> b!906283 (=> (not res!611600) (not e!507872))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906283 (= res!611600 (inRange!0 i!717 mask!1756))))

(declare-fun res!611601 () Bool)

(assert (=> start!77696 (=> (not res!611601) (not e!507873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77696 (= res!611601 (validMask!0 mask!1756))))

(assert (=> start!77696 e!507873))

(declare-fun e!507870 () Bool)

(declare-fun array_inv!20118 (array!53442) Bool)

(assert (=> start!77696 (and (array_inv!20118 _values!1152) e!507870)))

(assert (=> start!77696 tp!57105))

(assert (=> start!77696 true))

(assert (=> start!77696 tp_is_empty!18699))

(declare-fun array_inv!20119 (array!53440) Bool)

(assert (=> start!77696 (array_inv!20119 _keys!1386)))

(declare-fun b!906278 () Bool)

(assert (=> b!906278 (= e!507870 (and e!507871 mapRes!29761))))

(declare-fun condMapEmpty!29761 () Bool)

(declare-fun mapDefault!29761 () ValueCell!8868)

(assert (=> b!906278 (= condMapEmpty!29761 (= (arr!25680 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8868)) mapDefault!29761)))))

(assert (= (and start!77696 res!611601) b!906273))

(assert (= (and b!906273 res!611607) b!906271))

(assert (= (and b!906271 res!611602) b!906276))

(assert (= (and b!906276 res!611609) b!906275))

(assert (= (and b!906275 res!611604) b!906283))

(assert (= (and b!906283 res!611600) b!906282))

(assert (= (and b!906282 res!611606) b!906277))

(assert (= (and b!906277 (not res!611603)) b!906281))

(assert (= (and b!906281 (not res!611605)) b!906274))

(assert (= (and b!906274 (not res!611608)) b!906279))

(assert (= (and b!906278 condMapEmpty!29761) mapIsEmpty!29761))

(assert (= (and b!906278 (not condMapEmpty!29761)) mapNonEmpty!29761))

(get-info :version)

(assert (= (and mapNonEmpty!29761 ((_ is ValueCellFull!8868) mapValue!29761)) b!906272))

(assert (= (and b!906278 ((_ is ValueCellFull!8868) mapDefault!29761)) b!906280))

(assert (= start!77696 b!906278))

(declare-fun b_lambda!13155 () Bool)

(assert (=> (not b_lambda!13155) (not b!906277)))

(declare-fun t!25493 () Bool)

(declare-fun tb!5303 () Bool)

(assert (=> (and start!77696 (= defaultEntry!1160 defaultEntry!1160) t!25493) tb!5303))

(declare-fun result!10401 () Bool)

(assert (=> tb!5303 (= result!10401 tp_is_empty!18699)))

(assert (=> b!906277 t!25493))

(declare-fun b_and!26717 () Bool)

(assert (= b_and!26715 (and (=> t!25493 result!10401) b_and!26717)))

(declare-fun m!841655 () Bool)

(assert (=> b!906281 m!841655))

(declare-fun m!841657 () Bool)

(assert (=> b!906281 m!841657))

(declare-fun m!841659 () Bool)

(assert (=> b!906276 m!841659))

(declare-fun m!841661 () Bool)

(assert (=> b!906274 m!841661))

(declare-fun m!841663 () Bool)

(assert (=> b!906283 m!841663))

(declare-fun m!841665 () Bool)

(assert (=> b!906271 m!841665))

(declare-fun m!841667 () Bool)

(assert (=> start!77696 m!841667))

(declare-fun m!841669 () Bool)

(assert (=> start!77696 m!841669))

(declare-fun m!841671 () Bool)

(assert (=> start!77696 m!841671))

(declare-fun m!841673 () Bool)

(assert (=> b!906279 m!841673))

(declare-fun m!841675 () Bool)

(assert (=> b!906279 m!841675))

(declare-fun m!841677 () Bool)

(assert (=> b!906282 m!841677))

(declare-fun m!841679 () Bool)

(assert (=> mapNonEmpty!29761 m!841679))

(declare-fun m!841681 () Bool)

(assert (=> b!906275 m!841681))

(declare-fun m!841683 () Bool)

(assert (=> b!906275 m!841683))

(declare-fun m!841685 () Bool)

(assert (=> b!906277 m!841685))

(declare-fun m!841687 () Bool)

(assert (=> b!906277 m!841687))

(declare-fun m!841689 () Bool)

(assert (=> b!906277 m!841689))

(declare-fun m!841691 () Bool)

(assert (=> b!906277 m!841691))

(assert (=> b!906277 m!841685))

(assert (=> b!906277 m!841689))

(declare-fun m!841693 () Bool)

(assert (=> b!906277 m!841693))

(check-sat (not b!906275) (not b_lambda!13155) (not b!906271) (not b_next!16281) b_and!26717 (not start!77696) tp_is_empty!18699 (not b!906283) (not b!906277) (not b!906279) (not b!906276) (not b!906281) (not mapNonEmpty!29761) (not b!906274))
(check-sat b_and!26717 (not b_next!16281))
