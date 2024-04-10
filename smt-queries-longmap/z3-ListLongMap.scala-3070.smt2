; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43274 () Bool)

(assert start!43274)

(declare-fun b_free!12141 () Bool)

(declare-fun b_next!12141 () Bool)

(assert (=> start!43274 (= b_free!12141 (not b_next!12141))))

(declare-fun tp!42694 () Bool)

(declare-fun b_and!20893 () Bool)

(assert (=> start!43274 (= tp!42694 b_and!20893)))

(declare-fun b!479447 () Bool)

(declare-fun res!285994 () Bool)

(declare-fun e!282071 () Bool)

(assert (=> b!479447 (=> (not res!285994) (not e!282071))))

(declare-datatypes ((array!30979 0))(
  ( (array!30980 (arr!14896 (Array (_ BitVec 32) (_ BitVec 64))) (size!15254 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30979)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30979 (_ BitVec 32)) Bool)

(assert (=> b!479447 (= res!285994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479448 () Bool)

(declare-fun res!285995 () Bool)

(assert (=> b!479448 (=> (not res!285995) (not e!282071))))

(declare-datatypes ((List!9100 0))(
  ( (Nil!9097) (Cons!9096 (h!9952 (_ BitVec 64)) (t!15306 List!9100)) )
))
(declare-fun arrayNoDuplicates!0 (array!30979 (_ BitVec 32) List!9100) Bool)

(assert (=> b!479448 (= res!285995 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9097))))

(declare-fun b!479450 () Bool)

(declare-fun e!282074 () Bool)

(declare-fun e!282075 () Bool)

(declare-fun mapRes!22177 () Bool)

(assert (=> b!479450 (= e!282074 (and e!282075 mapRes!22177))))

(declare-fun condMapEmpty!22177 () Bool)

(declare-datatypes ((V!19275 0))(
  ( (V!19276 (val!6874 Int)) )
))
(declare-datatypes ((ValueCell!6465 0))(
  ( (ValueCellFull!6465 (v!9163 V!19275)) (EmptyCell!6465) )
))
(declare-datatypes ((array!30981 0))(
  ( (array!30982 (arr!14897 (Array (_ BitVec 32) ValueCell!6465)) (size!15255 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30981)

(declare-fun mapDefault!22177 () ValueCell!6465)

(assert (=> b!479450 (= condMapEmpty!22177 (= (arr!14897 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6465)) mapDefault!22177)))))

(declare-fun mapNonEmpty!22177 () Bool)

(declare-fun tp!42693 () Bool)

(declare-fun e!282073 () Bool)

(assert (=> mapNonEmpty!22177 (= mapRes!22177 (and tp!42693 e!282073))))

(declare-fun mapRest!22177 () (Array (_ BitVec 32) ValueCell!6465))

(declare-fun mapKey!22177 () (_ BitVec 32))

(declare-fun mapValue!22177 () ValueCell!6465)

(assert (=> mapNonEmpty!22177 (= (arr!14897 _values!1516) (store mapRest!22177 mapKey!22177 mapValue!22177))))

(declare-fun b!479451 () Bool)

(assert (=> b!479451 (= e!282071 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19275)

(declare-fun zeroValue!1458 () V!19275)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lt!217864 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((tuple2!9022 0))(
  ( (tuple2!9023 (_1!4522 (_ BitVec 64)) (_2!4522 V!19275)) )
))
(declare-datatypes ((List!9101 0))(
  ( (Nil!9098) (Cons!9097 (h!9953 tuple2!9022) (t!15307 List!9101)) )
))
(declare-datatypes ((ListLongMap!7935 0))(
  ( (ListLongMap!7936 (toList!3983 List!9101)) )
))
(declare-fun contains!2593 (ListLongMap!7935 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2302 (array!30979 array!30981 (_ BitVec 32) (_ BitVec 32) V!19275 V!19275 (_ BitVec 32) Int) ListLongMap!7935)

(assert (=> b!479451 (= lt!217864 (contains!2593 (getCurrentListMap!2302 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479452 () Bool)

(declare-fun tp_is_empty!13653 () Bool)

(assert (=> b!479452 (= e!282075 tp_is_empty!13653)))

(declare-fun b!479449 () Bool)

(declare-fun res!285996 () Bool)

(assert (=> b!479449 (=> (not res!285996) (not e!282071))))

(assert (=> b!479449 (= res!285996 (and (= (size!15255 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15254 _keys!1874) (size!15255 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!285993 () Bool)

(assert (=> start!43274 (=> (not res!285993) (not e!282071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43274 (= res!285993 (validMask!0 mask!2352))))

(assert (=> start!43274 e!282071))

(assert (=> start!43274 true))

(assert (=> start!43274 tp_is_empty!13653))

(declare-fun array_inv!10744 (array!30981) Bool)

(assert (=> start!43274 (and (array_inv!10744 _values!1516) e!282074)))

(assert (=> start!43274 tp!42694))

(declare-fun array_inv!10745 (array!30979) Bool)

(assert (=> start!43274 (array_inv!10745 _keys!1874)))

(declare-fun b!479453 () Bool)

(assert (=> b!479453 (= e!282073 tp_is_empty!13653)))

(declare-fun mapIsEmpty!22177 () Bool)

(assert (=> mapIsEmpty!22177 mapRes!22177))

(assert (= (and start!43274 res!285993) b!479449))

(assert (= (and b!479449 res!285996) b!479447))

(assert (= (and b!479447 res!285994) b!479448))

(assert (= (and b!479448 res!285995) b!479451))

(assert (= (and b!479450 condMapEmpty!22177) mapIsEmpty!22177))

(assert (= (and b!479450 (not condMapEmpty!22177)) mapNonEmpty!22177))

(get-info :version)

(assert (= (and mapNonEmpty!22177 ((_ is ValueCellFull!6465) mapValue!22177)) b!479453))

(assert (= (and b!479450 ((_ is ValueCellFull!6465) mapDefault!22177)) b!479452))

(assert (= start!43274 b!479450))

(declare-fun m!461391 () Bool)

(assert (=> start!43274 m!461391))

(declare-fun m!461393 () Bool)

(assert (=> start!43274 m!461393))

(declare-fun m!461395 () Bool)

(assert (=> start!43274 m!461395))

(declare-fun m!461397 () Bool)

(assert (=> mapNonEmpty!22177 m!461397))

(declare-fun m!461399 () Bool)

(assert (=> b!479447 m!461399))

(declare-fun m!461401 () Bool)

(assert (=> b!479448 m!461401))

(declare-fun m!461403 () Bool)

(assert (=> b!479451 m!461403))

(assert (=> b!479451 m!461403))

(declare-fun m!461405 () Bool)

(assert (=> b!479451 m!461405))

(check-sat (not b!479447) b_and!20893 (not mapNonEmpty!22177) (not b!479448) (not start!43274) (not b!479451) (not b_next!12141) tp_is_empty!13653)
(check-sat b_and!20893 (not b_next!12141))
