; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40864 () Bool)

(assert start!40864)

(declare-fun b_free!10813 () Bool)

(declare-fun b_next!10813 () Bool)

(assert (=> start!40864 (= b_free!10813 (not b_next!10813))))

(declare-fun tp!38265 () Bool)

(declare-fun b_and!18965 () Bool)

(assert (=> start!40864 (= tp!38265 b_and!18965)))

(declare-fun b!453856 () Bool)

(declare-fun res!270343 () Bool)

(declare-fun e!265634 () Bool)

(assert (=> b!453856 (=> (not res!270343) (not e!265634))))

(declare-datatypes ((array!28100 0))(
  ( (array!28101 (arr!13493 (Array (_ BitVec 32) (_ BitVec 64))) (size!13845 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28100)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!453856 (= res!270343 (or (= (select (arr!13493 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13493 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453857 () Bool)

(declare-fun res!270344 () Bool)

(assert (=> b!453857 (=> (not res!270344) (not e!265634))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453857 (= res!270344 (validKeyInArray!0 k0!794))))

(declare-fun b!453858 () Bool)

(declare-fun res!270345 () Bool)

(assert (=> b!453858 (=> (not res!270345) (not e!265634))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28100 (_ BitVec 32)) Bool)

(assert (=> b!453858 (= res!270345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!270352 () Bool)

(assert (=> start!40864 (=> (not res!270352) (not e!265634))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40864 (= res!270352 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13845 _keys!709))))))

(assert (=> start!40864 e!265634))

(declare-fun tp_is_empty!12151 () Bool)

(assert (=> start!40864 tp_is_empty!12151))

(assert (=> start!40864 tp!38265))

(assert (=> start!40864 true))

(declare-datatypes ((V!17307 0))(
  ( (V!17308 (val!6120 Int)) )
))
(declare-datatypes ((ValueCell!5732 0))(
  ( (ValueCellFull!5732 (v!8387 V!17307)) (EmptyCell!5732) )
))
(declare-datatypes ((array!28102 0))(
  ( (array!28103 (arr!13494 (Array (_ BitVec 32) ValueCell!5732)) (size!13846 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28102)

(declare-fun e!265635 () Bool)

(declare-fun array_inv!9852 (array!28102) Bool)

(assert (=> start!40864 (and (array_inv!9852 _values!549) e!265635)))

(declare-fun array_inv!9853 (array!28100) Bool)

(assert (=> start!40864 (array_inv!9853 _keys!709)))

(declare-fun b!453859 () Bool)

(declare-fun res!270341 () Bool)

(assert (=> b!453859 (=> (not res!270341) (not e!265634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453859 (= res!270341 (validMask!0 mask!1025))))

(declare-fun b!453860 () Bool)

(declare-fun e!265631 () Bool)

(assert (=> b!453860 (= e!265631 tp_is_empty!12151)))

(declare-fun b!453861 () Bool)

(declare-fun res!270351 () Bool)

(assert (=> b!453861 (=> (not res!270351) (not e!265634))))

(declare-datatypes ((List!8033 0))(
  ( (Nil!8030) (Cons!8029 (h!8885 (_ BitVec 64)) (t!13853 List!8033)) )
))
(declare-fun arrayNoDuplicates!0 (array!28100 (_ BitVec 32) List!8033) Bool)

(assert (=> b!453861 (= res!270351 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8030))))

(declare-fun b!453862 () Bool)

(declare-fun e!265633 () Bool)

(assert (=> b!453862 (= e!265633 tp_is_empty!12151)))

(declare-fun mapNonEmpty!19867 () Bool)

(declare-fun mapRes!19867 () Bool)

(declare-fun tp!38266 () Bool)

(assert (=> mapNonEmpty!19867 (= mapRes!19867 (and tp!38266 e!265631))))

(declare-fun mapKey!19867 () (_ BitVec 32))

(declare-fun mapRest!19867 () (Array (_ BitVec 32) ValueCell!5732))

(declare-fun mapValue!19867 () ValueCell!5732)

(assert (=> mapNonEmpty!19867 (= (arr!13494 _values!549) (store mapRest!19867 mapKey!19867 mapValue!19867))))

(declare-fun b!453863 () Bool)

(declare-fun res!270349 () Bool)

(assert (=> b!453863 (=> (not res!270349) (not e!265634))))

(assert (=> b!453863 (= res!270349 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13845 _keys!709))))))

(declare-fun b!453864 () Bool)

(declare-fun res!270350 () Bool)

(declare-fun e!265636 () Bool)

(assert (=> b!453864 (=> (not res!270350) (not e!265636))))

(assert (=> b!453864 (= res!270350 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19867 () Bool)

(assert (=> mapIsEmpty!19867 mapRes!19867))

(declare-fun b!453865 () Bool)

(declare-fun res!270342 () Bool)

(assert (=> b!453865 (=> (not res!270342) (not e!265636))))

(declare-fun lt!206045 () array!28100)

(assert (=> b!453865 (= res!270342 (arrayNoDuplicates!0 lt!206045 #b00000000000000000000000000000000 Nil!8030))))

(declare-fun b!453866 () Bool)

(assert (=> b!453866 (= e!265636 false)))

(declare-fun minValue!515 () V!17307)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17307)

(declare-datatypes ((tuple2!7966 0))(
  ( (tuple2!7967 (_1!3994 (_ BitVec 64)) (_2!3994 V!17307)) )
))
(declare-datatypes ((List!8034 0))(
  ( (Nil!8031) (Cons!8030 (h!8886 tuple2!7966) (t!13854 List!8034)) )
))
(declare-datatypes ((ListLongMap!6881 0))(
  ( (ListLongMap!6882 (toList!3456 List!8034)) )
))
(declare-fun lt!206043 () ListLongMap!6881)

(declare-fun v!412 () V!17307)

(declare-fun getCurrentListMapNoExtraKeys!1685 (array!28100 array!28102 (_ BitVec 32) (_ BitVec 32) V!17307 V!17307 (_ BitVec 32) Int) ListLongMap!6881)

(assert (=> b!453866 (= lt!206043 (getCurrentListMapNoExtraKeys!1685 lt!206045 (array!28103 (store (arr!13494 _values!549) i!563 (ValueCellFull!5732 v!412)) (size!13846 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206044 () ListLongMap!6881)

(assert (=> b!453866 (= lt!206044 (getCurrentListMapNoExtraKeys!1685 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!453867 () Bool)

(declare-fun res!270346 () Bool)

(assert (=> b!453867 (=> (not res!270346) (not e!265634))))

(assert (=> b!453867 (= res!270346 (and (= (size!13846 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13845 _keys!709) (size!13846 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!453868 () Bool)

(assert (=> b!453868 (= e!265634 e!265636)))

(declare-fun res!270348 () Bool)

(assert (=> b!453868 (=> (not res!270348) (not e!265636))))

(assert (=> b!453868 (= res!270348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206045 mask!1025))))

(assert (=> b!453868 (= lt!206045 (array!28101 (store (arr!13493 _keys!709) i!563 k0!794) (size!13845 _keys!709)))))

(declare-fun b!453869 () Bool)

(assert (=> b!453869 (= e!265635 (and e!265633 mapRes!19867))))

(declare-fun condMapEmpty!19867 () Bool)

(declare-fun mapDefault!19867 () ValueCell!5732)

(assert (=> b!453869 (= condMapEmpty!19867 (= (arr!13494 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5732)) mapDefault!19867)))))

(declare-fun b!453870 () Bool)

(declare-fun res!270347 () Bool)

(assert (=> b!453870 (=> (not res!270347) (not e!265634))))

(declare-fun arrayContainsKey!0 (array!28100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453870 (= res!270347 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40864 res!270352) b!453859))

(assert (= (and b!453859 res!270341) b!453867))

(assert (= (and b!453867 res!270346) b!453858))

(assert (= (and b!453858 res!270345) b!453861))

(assert (= (and b!453861 res!270351) b!453863))

(assert (= (and b!453863 res!270349) b!453857))

(assert (= (and b!453857 res!270344) b!453856))

(assert (= (and b!453856 res!270343) b!453870))

(assert (= (and b!453870 res!270347) b!453868))

(assert (= (and b!453868 res!270348) b!453865))

(assert (= (and b!453865 res!270342) b!453864))

(assert (= (and b!453864 res!270350) b!453866))

(assert (= (and b!453869 condMapEmpty!19867) mapIsEmpty!19867))

(assert (= (and b!453869 (not condMapEmpty!19867)) mapNonEmpty!19867))

(get-info :version)

(assert (= (and mapNonEmpty!19867 ((_ is ValueCellFull!5732) mapValue!19867)) b!453860))

(assert (= (and b!453869 ((_ is ValueCellFull!5732) mapDefault!19867)) b!453862))

(assert (= start!40864 b!453869))

(declare-fun m!438393 () Bool)

(assert (=> mapNonEmpty!19867 m!438393))

(declare-fun m!438395 () Bool)

(assert (=> b!453858 m!438395))

(declare-fun m!438397 () Bool)

(assert (=> start!40864 m!438397))

(declare-fun m!438399 () Bool)

(assert (=> start!40864 m!438399))

(declare-fun m!438401 () Bool)

(assert (=> b!453870 m!438401))

(declare-fun m!438403 () Bool)

(assert (=> b!453856 m!438403))

(declare-fun m!438405 () Bool)

(assert (=> b!453866 m!438405))

(declare-fun m!438407 () Bool)

(assert (=> b!453866 m!438407))

(declare-fun m!438409 () Bool)

(assert (=> b!453866 m!438409))

(declare-fun m!438411 () Bool)

(assert (=> b!453868 m!438411))

(declare-fun m!438413 () Bool)

(assert (=> b!453868 m!438413))

(declare-fun m!438415 () Bool)

(assert (=> b!453859 m!438415))

(declare-fun m!438417 () Bool)

(assert (=> b!453857 m!438417))

(declare-fun m!438419 () Bool)

(assert (=> b!453861 m!438419))

(declare-fun m!438421 () Bool)

(assert (=> b!453865 m!438421))

(check-sat (not b!453857) tp_is_empty!12151 b_and!18965 (not b!453866) (not b_next!10813) (not b!453859) (not b!453865) (not mapNonEmpty!19867) (not b!453868) (not b!453861) (not b!453858) (not b!453870) (not start!40864))
(check-sat b_and!18965 (not b_next!10813))
