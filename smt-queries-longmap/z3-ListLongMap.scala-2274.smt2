; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37092 () Bool)

(assert start!37092)

(declare-fun b_free!8233 () Bool)

(declare-fun b_next!8233 () Bool)

(assert (=> start!37092 (= b_free!8233 (not b_next!8233))))

(declare-fun tp!29415 () Bool)

(declare-fun b_and!15449 () Bool)

(assert (=> start!37092 (= tp!29415 b_and!15449)))

(declare-fun res!210409 () Bool)

(declare-fun e!227622 () Bool)

(assert (=> start!37092 (=> (not res!210409) (not e!227622))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37092 (= res!210409 (validMask!0 mask!970))))

(assert (=> start!37092 e!227622))

(declare-datatypes ((V!12947 0))(
  ( (V!12948 (val!4485 Int)) )
))
(declare-datatypes ((ValueCell!4097 0))(
  ( (ValueCellFull!4097 (v!6676 V!12947)) (EmptyCell!4097) )
))
(declare-datatypes ((array!21679 0))(
  ( (array!21680 (arr!10308 (Array (_ BitVec 32) ValueCell!4097)) (size!10661 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21679)

(declare-fun e!227624 () Bool)

(declare-fun array_inv!7606 (array!21679) Bool)

(assert (=> start!37092 (and (array_inv!7606 _values!506) e!227624)))

(assert (=> start!37092 tp!29415))

(assert (=> start!37092 true))

(declare-fun tp_is_empty!8881 () Bool)

(assert (=> start!37092 tp_is_empty!8881))

(declare-datatypes ((array!21681 0))(
  ( (array!21682 (arr!10309 (Array (_ BitVec 32) (_ BitVec 64))) (size!10662 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21681)

(declare-fun array_inv!7607 (array!21681) Bool)

(assert (=> start!37092 (array_inv!7607 _keys!658)))

(declare-fun b!373406 () Bool)

(declare-fun e!227617 () Bool)

(assert (=> b!373406 (= e!227617 tp_is_empty!8881)))

(declare-fun b!373407 () Bool)

(declare-fun res!210407 () Bool)

(assert (=> b!373407 (=> (not res!210407) (not e!227622))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373407 (= res!210407 (and (= (size!10661 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10662 _keys!658) (size!10661 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373408 () Bool)

(declare-fun res!210413 () Bool)

(assert (=> b!373408 (=> (not res!210413) (not e!227622))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373408 (= res!210413 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373409 () Bool)

(declare-fun mapRes!14886 () Bool)

(assert (=> b!373409 (= e!227624 (and e!227617 mapRes!14886))))

(declare-fun condMapEmpty!14886 () Bool)

(declare-fun mapDefault!14886 () ValueCell!4097)

(assert (=> b!373409 (= condMapEmpty!14886 (= (arr!10308 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4097)) mapDefault!14886)))))

(declare-fun b!373410 () Bool)

(declare-fun res!210414 () Bool)

(assert (=> b!373410 (=> (not res!210414) (not e!227622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373410 (= res!210414 (validKeyInArray!0 k0!778))))

(declare-fun b!373411 () Bool)

(declare-fun res!210410 () Bool)

(assert (=> b!373411 (=> (not res!210410) (not e!227622))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373411 (= res!210410 (or (= (select (arr!10309 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10309 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373412 () Bool)

(declare-fun e!227619 () Bool)

(assert (=> b!373412 (= e!227619 tp_is_empty!8881)))

(declare-fun b!373413 () Bool)

(declare-fun res!210408 () Bool)

(assert (=> b!373413 (=> (not res!210408) (not e!227622))))

(declare-datatypes ((List!5760 0))(
  ( (Nil!5757) (Cons!5756 (h!6612 (_ BitVec 64)) (t!10901 List!5760)) )
))
(declare-fun arrayNoDuplicates!0 (array!21681 (_ BitVec 32) List!5760) Bool)

(assert (=> b!373413 (= res!210408 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5757))))

(declare-fun b!373414 () Bool)

(declare-fun res!210415 () Bool)

(assert (=> b!373414 (=> (not res!210415) (not e!227622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21681 (_ BitVec 32)) Bool)

(assert (=> b!373414 (= res!210415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14886 () Bool)

(assert (=> mapIsEmpty!14886 mapRes!14886))

(declare-fun mapNonEmpty!14886 () Bool)

(declare-fun tp!29414 () Bool)

(assert (=> mapNonEmpty!14886 (= mapRes!14886 (and tp!29414 e!227619))))

(declare-fun mapValue!14886 () ValueCell!4097)

(declare-fun mapKey!14886 () (_ BitVec 32))

(declare-fun mapRest!14886 () (Array (_ BitVec 32) ValueCell!4097))

(assert (=> mapNonEmpty!14886 (= (arr!10308 _values!506) (store mapRest!14886 mapKey!14886 mapValue!14886))))

(declare-fun b!373415 () Bool)

(declare-fun res!210412 () Bool)

(assert (=> b!373415 (=> (not res!210412) (not e!227622))))

(assert (=> b!373415 (= res!210412 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10662 _keys!658))))))

(declare-fun b!373416 () Bool)

(declare-fun e!227620 () Bool)

(declare-fun e!227623 () Bool)

(assert (=> b!373416 (= e!227620 (not e!227623))))

(declare-fun res!210411 () Bool)

(assert (=> b!373416 (=> res!210411 e!227623)))

(assert (=> b!373416 (= res!210411 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5924 0))(
  ( (tuple2!5925 (_1!2973 (_ BitVec 64)) (_2!2973 V!12947)) )
))
(declare-datatypes ((List!5761 0))(
  ( (Nil!5758) (Cons!5757 (h!6613 tuple2!5924) (t!10902 List!5761)) )
))
(declare-datatypes ((ListLongMap!4827 0))(
  ( (ListLongMap!4828 (toList!2429 List!5761)) )
))
(declare-fun lt!171521 () ListLongMap!4827)

(declare-fun zeroValue!472 () V!12947)

(declare-fun minValue!472 () V!12947)

(declare-fun getCurrentListMap!1851 (array!21681 array!21679 (_ BitVec 32) (_ BitVec 32) V!12947 V!12947 (_ BitVec 32) Int) ListLongMap!4827)

(assert (=> b!373416 (= lt!171521 (getCurrentListMap!1851 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171513 () ListLongMap!4827)

(declare-fun lt!171520 () array!21681)

(declare-fun lt!171523 () array!21679)

(assert (=> b!373416 (= lt!171513 (getCurrentListMap!1851 lt!171520 lt!171523 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171526 () ListLongMap!4827)

(declare-fun lt!171522 () ListLongMap!4827)

(assert (=> b!373416 (and (= lt!171526 lt!171522) (= lt!171522 lt!171526))))

(declare-fun lt!171515 () ListLongMap!4827)

(declare-fun lt!171516 () tuple2!5924)

(declare-fun +!797 (ListLongMap!4827 tuple2!5924) ListLongMap!4827)

(assert (=> b!373416 (= lt!171522 (+!797 lt!171515 lt!171516))))

(declare-fun v!373 () V!12947)

(assert (=> b!373416 (= lt!171516 (tuple2!5925 k0!778 v!373))))

(declare-datatypes ((Unit!11466 0))(
  ( (Unit!11467) )
))
(declare-fun lt!171512 () Unit!11466)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!44 (array!21681 array!21679 (_ BitVec 32) (_ BitVec 32) V!12947 V!12947 (_ BitVec 32) (_ BitVec 64) V!12947 (_ BitVec 32) Int) Unit!11466)

(assert (=> b!373416 (= lt!171512 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!44 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!716 (array!21681 array!21679 (_ BitVec 32) (_ BitVec 32) V!12947 V!12947 (_ BitVec 32) Int) ListLongMap!4827)

(assert (=> b!373416 (= lt!171526 (getCurrentListMapNoExtraKeys!716 lt!171520 lt!171523 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373416 (= lt!171523 (array!21680 (store (arr!10308 _values!506) i!548 (ValueCellFull!4097 v!373)) (size!10661 _values!506)))))

(assert (=> b!373416 (= lt!171515 (getCurrentListMapNoExtraKeys!716 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373417 () Bool)

(declare-fun e!227618 () Bool)

(assert (=> b!373417 (= e!227618 true)))

(declare-fun lt!171527 () tuple2!5924)

(declare-fun lt!171519 () ListLongMap!4827)

(declare-fun lt!171514 () ListLongMap!4827)

(assert (=> b!373417 (= (+!797 lt!171514 lt!171527) (+!797 lt!171519 lt!171516))))

(declare-fun lt!171518 () ListLongMap!4827)

(declare-fun lt!171517 () Unit!11466)

(declare-fun addCommutativeForDiffKeys!216 (ListLongMap!4827 (_ BitVec 64) V!12947 (_ BitVec 64) V!12947) Unit!11466)

(assert (=> b!373417 (= lt!171517 (addCommutativeForDiffKeys!216 lt!171518 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373418 () Bool)

(assert (=> b!373418 (= e!227622 e!227620)))

(declare-fun res!210406 () Bool)

(assert (=> b!373418 (=> (not res!210406) (not e!227620))))

(assert (=> b!373418 (= res!210406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171520 mask!970))))

(assert (=> b!373418 (= lt!171520 (array!21682 (store (arr!10309 _keys!658) i!548 k0!778) (size!10662 _keys!658)))))

(declare-fun b!373419 () Bool)

(assert (=> b!373419 (= e!227623 e!227618)))

(declare-fun res!210416 () Bool)

(assert (=> b!373419 (=> res!210416 e!227618)))

(assert (=> b!373419 (= res!210416 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171524 () ListLongMap!4827)

(assert (=> b!373419 (= lt!171524 lt!171514)))

(assert (=> b!373419 (= lt!171514 (+!797 lt!171518 lt!171516))))

(declare-fun lt!171528 () Unit!11466)

(assert (=> b!373419 (= lt!171528 (addCommutativeForDiffKeys!216 lt!171515 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!373419 (= lt!171513 (+!797 lt!171524 lt!171527))))

(declare-fun lt!171525 () tuple2!5924)

(assert (=> b!373419 (= lt!171524 (+!797 lt!171522 lt!171525))))

(assert (=> b!373419 (= lt!171521 lt!171519)))

(assert (=> b!373419 (= lt!171519 (+!797 lt!171518 lt!171527))))

(assert (=> b!373419 (= lt!171518 (+!797 lt!171515 lt!171525))))

(assert (=> b!373419 (= lt!171513 (+!797 (+!797 lt!171526 lt!171525) lt!171527))))

(assert (=> b!373419 (= lt!171527 (tuple2!5925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373419 (= lt!171525 (tuple2!5925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373420 () Bool)

(declare-fun res!210405 () Bool)

(assert (=> b!373420 (=> (not res!210405) (not e!227620))))

(assert (=> b!373420 (= res!210405 (arrayNoDuplicates!0 lt!171520 #b00000000000000000000000000000000 Nil!5757))))

(assert (= (and start!37092 res!210409) b!373407))

(assert (= (and b!373407 res!210407) b!373414))

(assert (= (and b!373414 res!210415) b!373413))

(assert (= (and b!373413 res!210408) b!373415))

(assert (= (and b!373415 res!210412) b!373410))

(assert (= (and b!373410 res!210414) b!373411))

(assert (= (and b!373411 res!210410) b!373408))

(assert (= (and b!373408 res!210413) b!373418))

(assert (= (and b!373418 res!210406) b!373420))

(assert (= (and b!373420 res!210405) b!373416))

(assert (= (and b!373416 (not res!210411)) b!373419))

(assert (= (and b!373419 (not res!210416)) b!373417))

(assert (= (and b!373409 condMapEmpty!14886) mapIsEmpty!14886))

(assert (= (and b!373409 (not condMapEmpty!14886)) mapNonEmpty!14886))

(get-info :version)

(assert (= (and mapNonEmpty!14886 ((_ is ValueCellFull!4097) mapValue!14886)) b!373412))

(assert (= (and b!373409 ((_ is ValueCellFull!4097) mapDefault!14886)) b!373406))

(assert (= start!37092 b!373409))

(declare-fun m!368951 () Bool)

(assert (=> b!373411 m!368951))

(declare-fun m!368953 () Bool)

(assert (=> b!373417 m!368953))

(declare-fun m!368955 () Bool)

(assert (=> b!373417 m!368955))

(declare-fun m!368957 () Bool)

(assert (=> b!373417 m!368957))

(declare-fun m!368959 () Bool)

(assert (=> b!373419 m!368959))

(declare-fun m!368961 () Bool)

(assert (=> b!373419 m!368961))

(declare-fun m!368963 () Bool)

(assert (=> b!373419 m!368963))

(declare-fun m!368965 () Bool)

(assert (=> b!373419 m!368965))

(declare-fun m!368967 () Bool)

(assert (=> b!373419 m!368967))

(declare-fun m!368969 () Bool)

(assert (=> b!373419 m!368969))

(declare-fun m!368971 () Bool)

(assert (=> b!373419 m!368971))

(assert (=> b!373419 m!368965))

(declare-fun m!368973 () Bool)

(assert (=> b!373419 m!368973))

(declare-fun m!368975 () Bool)

(assert (=> b!373418 m!368975))

(declare-fun m!368977 () Bool)

(assert (=> b!373418 m!368977))

(declare-fun m!368979 () Bool)

(assert (=> b!373413 m!368979))

(declare-fun m!368981 () Bool)

(assert (=> mapNonEmpty!14886 m!368981))

(declare-fun m!368983 () Bool)

(assert (=> b!373414 m!368983))

(declare-fun m!368985 () Bool)

(assert (=> b!373420 m!368985))

(declare-fun m!368987 () Bool)

(assert (=> start!37092 m!368987))

(declare-fun m!368989 () Bool)

(assert (=> start!37092 m!368989))

(declare-fun m!368991 () Bool)

(assert (=> start!37092 m!368991))

(declare-fun m!368993 () Bool)

(assert (=> b!373416 m!368993))

(declare-fun m!368995 () Bool)

(assert (=> b!373416 m!368995))

(declare-fun m!368997 () Bool)

(assert (=> b!373416 m!368997))

(declare-fun m!368999 () Bool)

(assert (=> b!373416 m!368999))

(declare-fun m!369001 () Bool)

(assert (=> b!373416 m!369001))

(declare-fun m!369003 () Bool)

(assert (=> b!373416 m!369003))

(declare-fun m!369005 () Bool)

(assert (=> b!373416 m!369005))

(declare-fun m!369007 () Bool)

(assert (=> b!373408 m!369007))

(declare-fun m!369009 () Bool)

(assert (=> b!373410 m!369009))

(check-sat b_and!15449 (not start!37092) (not b!373410) (not mapNonEmpty!14886) tp_is_empty!8881 (not b!373414) (not b!373418) (not b_next!8233) (not b!373413) (not b!373416) (not b!373417) (not b!373408) (not b!373419) (not b!373420))
(check-sat b_and!15449 (not b_next!8233))
