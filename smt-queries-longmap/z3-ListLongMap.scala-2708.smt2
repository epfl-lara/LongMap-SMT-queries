; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40068 () Bool)

(assert start!40068)

(declare-fun b_free!10335 () Bool)

(declare-fun b_next!10335 () Bool)

(assert (=> start!40068 (= b_free!10335 (not b_next!10335))))

(declare-fun tp!36533 () Bool)

(declare-fun b_and!18303 () Bool)

(assert (=> start!40068 (= tp!36533 b_and!18303)))

(declare-fun b!437396 () Bool)

(declare-fun res!258034 () Bool)

(declare-fun e!258162 () Bool)

(assert (=> b!437396 (=> (not res!258034) (not e!258162))))

(declare-datatypes ((array!26793 0))(
  ( (array!26794 (arr!12846 (Array (_ BitVec 32) (_ BitVec 64))) (size!13198 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26793)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437396 (= res!258034 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437397 () Bool)

(declare-fun res!258028 () Bool)

(assert (=> b!437397 (=> (not res!258028) (not e!258162))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26793 (_ BitVec 32)) Bool)

(assert (=> b!437397 (= res!258028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437398 () Bool)

(declare-fun e!258165 () Bool)

(declare-fun tp_is_empty!11487 () Bool)

(assert (=> b!437398 (= e!258165 tp_is_empty!11487)))

(declare-fun b!437399 () Bool)

(declare-fun res!258036 () Bool)

(assert (=> b!437399 (=> (not res!258036) (not e!258162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437399 (= res!258036 (validKeyInArray!0 k0!794))))

(declare-fun b!437400 () Bool)

(declare-fun e!258159 () Bool)

(assert (=> b!437400 (= e!258159 (not true))))

(declare-datatypes ((V!16421 0))(
  ( (V!16422 (val!5788 Int)) )
))
(declare-fun minValue!515 () V!16421)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!201634 () array!26793)

(declare-datatypes ((ValueCell!5400 0))(
  ( (ValueCellFull!5400 (v!8035 V!16421)) (EmptyCell!5400) )
))
(declare-datatypes ((array!26795 0))(
  ( (array!26796 (arr!12847 (Array (_ BitVec 32) ValueCell!5400)) (size!13199 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26795)

(declare-fun zeroValue!515 () V!16421)

(declare-fun lt!201635 () array!26795)

(declare-fun v!412 () V!16421)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7672 0))(
  ( (tuple2!7673 (_1!3847 (_ BitVec 64)) (_2!3847 V!16421)) )
))
(declare-datatypes ((List!7670 0))(
  ( (Nil!7667) (Cons!7666 (h!8522 tuple2!7672) (t!13426 List!7670)) )
))
(declare-datatypes ((ListLongMap!6585 0))(
  ( (ListLongMap!6586 (toList!3308 List!7670)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1497 (array!26793 array!26795 (_ BitVec 32) (_ BitVec 32) V!16421 V!16421 (_ BitVec 32) Int) ListLongMap!6585)

(declare-fun +!1452 (ListLongMap!6585 tuple2!7672) ListLongMap!6585)

(assert (=> b!437400 (= (getCurrentListMapNoExtraKeys!1497 lt!201634 lt!201635 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1452 (getCurrentListMapNoExtraKeys!1497 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7673 k0!794 v!412)))))

(declare-datatypes ((Unit!13008 0))(
  ( (Unit!13009) )
))
(declare-fun lt!201632 () Unit!13008)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!621 (array!26793 array!26795 (_ BitVec 32) (_ BitVec 32) V!16421 V!16421 (_ BitVec 32) (_ BitVec 64) V!16421 (_ BitVec 32) Int) Unit!13008)

(assert (=> b!437400 (= lt!201632 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!621 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437401 () Bool)

(declare-fun res!258033 () Bool)

(assert (=> b!437401 (=> (not res!258033) (not e!258162))))

(assert (=> b!437401 (= res!258033 (or (= (select (arr!12846 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12846 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!258032 () Bool)

(assert (=> start!40068 (=> (not res!258032) (not e!258162))))

(assert (=> start!40068 (= res!258032 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13198 _keys!709))))))

(assert (=> start!40068 e!258162))

(assert (=> start!40068 tp_is_empty!11487))

(assert (=> start!40068 tp!36533))

(assert (=> start!40068 true))

(declare-fun e!258164 () Bool)

(declare-fun array_inv!9332 (array!26795) Bool)

(assert (=> start!40068 (and (array_inv!9332 _values!549) e!258164)))

(declare-fun array_inv!9333 (array!26793) Bool)

(assert (=> start!40068 (array_inv!9333 _keys!709)))

(declare-fun b!437402 () Bool)

(declare-fun e!258163 () Bool)

(assert (=> b!437402 (= e!258162 e!258163)))

(declare-fun res!258026 () Bool)

(assert (=> b!437402 (=> (not res!258026) (not e!258163))))

(assert (=> b!437402 (= res!258026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201634 mask!1025))))

(assert (=> b!437402 (= lt!201634 (array!26794 (store (arr!12846 _keys!709) i!563 k0!794) (size!13198 _keys!709)))))

(declare-fun b!437403 () Bool)

(declare-fun res!258031 () Bool)

(assert (=> b!437403 (=> (not res!258031) (not e!258163))))

(assert (=> b!437403 (= res!258031 (bvsle from!863 i!563))))

(declare-fun b!437404 () Bool)

(declare-fun res!258030 () Bool)

(assert (=> b!437404 (=> (not res!258030) (not e!258162))))

(declare-datatypes ((List!7671 0))(
  ( (Nil!7668) (Cons!7667 (h!8523 (_ BitVec 64)) (t!13427 List!7671)) )
))
(declare-fun arrayNoDuplicates!0 (array!26793 (_ BitVec 32) List!7671) Bool)

(assert (=> b!437404 (= res!258030 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7668))))

(declare-fun b!437405 () Bool)

(declare-fun res!258035 () Bool)

(assert (=> b!437405 (=> (not res!258035) (not e!258163))))

(assert (=> b!437405 (= res!258035 (arrayNoDuplicates!0 lt!201634 #b00000000000000000000000000000000 Nil!7668))))

(declare-fun mapNonEmpty!18852 () Bool)

(declare-fun mapRes!18852 () Bool)

(declare-fun tp!36534 () Bool)

(assert (=> mapNonEmpty!18852 (= mapRes!18852 (and tp!36534 e!258165))))

(declare-fun mapValue!18852 () ValueCell!5400)

(declare-fun mapKey!18852 () (_ BitVec 32))

(declare-fun mapRest!18852 () (Array (_ BitVec 32) ValueCell!5400))

(assert (=> mapNonEmpty!18852 (= (arr!12847 _values!549) (store mapRest!18852 mapKey!18852 mapValue!18852))))

(declare-fun b!437406 () Bool)

(assert (=> b!437406 (= e!258163 e!258159)))

(declare-fun res!258025 () Bool)

(assert (=> b!437406 (=> (not res!258025) (not e!258159))))

(assert (=> b!437406 (= res!258025 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201633 () ListLongMap!6585)

(assert (=> b!437406 (= lt!201633 (getCurrentListMapNoExtraKeys!1497 lt!201634 lt!201635 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437406 (= lt!201635 (array!26796 (store (arr!12847 _values!549) i!563 (ValueCellFull!5400 v!412)) (size!13199 _values!549)))))

(declare-fun lt!201631 () ListLongMap!6585)

(assert (=> b!437406 (= lt!201631 (getCurrentListMapNoExtraKeys!1497 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437407 () Bool)

(declare-fun res!258024 () Bool)

(assert (=> b!437407 (=> (not res!258024) (not e!258162))))

(assert (=> b!437407 (= res!258024 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13198 _keys!709))))))

(declare-fun b!437408 () Bool)

(declare-fun res!258029 () Bool)

(assert (=> b!437408 (=> (not res!258029) (not e!258162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437408 (= res!258029 (validMask!0 mask!1025))))

(declare-fun b!437409 () Bool)

(declare-fun res!258027 () Bool)

(assert (=> b!437409 (=> (not res!258027) (not e!258162))))

(assert (=> b!437409 (= res!258027 (and (= (size!13199 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13198 _keys!709) (size!13199 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18852 () Bool)

(assert (=> mapIsEmpty!18852 mapRes!18852))

(declare-fun b!437410 () Bool)

(declare-fun e!258161 () Bool)

(assert (=> b!437410 (= e!258161 tp_is_empty!11487)))

(declare-fun b!437411 () Bool)

(assert (=> b!437411 (= e!258164 (and e!258161 mapRes!18852))))

(declare-fun condMapEmpty!18852 () Bool)

(declare-fun mapDefault!18852 () ValueCell!5400)

(assert (=> b!437411 (= condMapEmpty!18852 (= (arr!12847 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5400)) mapDefault!18852)))))

(assert (= (and start!40068 res!258032) b!437408))

(assert (= (and b!437408 res!258029) b!437409))

(assert (= (and b!437409 res!258027) b!437397))

(assert (= (and b!437397 res!258028) b!437404))

(assert (= (and b!437404 res!258030) b!437407))

(assert (= (and b!437407 res!258024) b!437399))

(assert (= (and b!437399 res!258036) b!437401))

(assert (= (and b!437401 res!258033) b!437396))

(assert (= (and b!437396 res!258034) b!437402))

(assert (= (and b!437402 res!258026) b!437405))

(assert (= (and b!437405 res!258035) b!437403))

(assert (= (and b!437403 res!258031) b!437406))

(assert (= (and b!437406 res!258025) b!437400))

(assert (= (and b!437411 condMapEmpty!18852) mapIsEmpty!18852))

(assert (= (and b!437411 (not condMapEmpty!18852)) mapNonEmpty!18852))

(get-info :version)

(assert (= (and mapNonEmpty!18852 ((_ is ValueCellFull!5400) mapValue!18852)) b!437398))

(assert (= (and b!437411 ((_ is ValueCellFull!5400) mapDefault!18852)) b!437410))

(assert (= start!40068 b!437411))

(declare-fun m!425075 () Bool)

(assert (=> b!437400 m!425075))

(declare-fun m!425077 () Bool)

(assert (=> b!437400 m!425077))

(assert (=> b!437400 m!425077))

(declare-fun m!425079 () Bool)

(assert (=> b!437400 m!425079))

(declare-fun m!425081 () Bool)

(assert (=> b!437400 m!425081))

(declare-fun m!425083 () Bool)

(assert (=> b!437405 m!425083))

(declare-fun m!425085 () Bool)

(assert (=> b!437404 m!425085))

(declare-fun m!425087 () Bool)

(assert (=> b!437399 m!425087))

(declare-fun m!425089 () Bool)

(assert (=> mapNonEmpty!18852 m!425089))

(declare-fun m!425091 () Bool)

(assert (=> b!437406 m!425091))

(declare-fun m!425093 () Bool)

(assert (=> b!437406 m!425093))

(declare-fun m!425095 () Bool)

(assert (=> b!437406 m!425095))

(declare-fun m!425097 () Bool)

(assert (=> b!437396 m!425097))

(declare-fun m!425099 () Bool)

(assert (=> b!437397 m!425099))

(declare-fun m!425101 () Bool)

(assert (=> b!437408 m!425101))

(declare-fun m!425103 () Bool)

(assert (=> b!437401 m!425103))

(declare-fun m!425105 () Bool)

(assert (=> start!40068 m!425105))

(declare-fun m!425107 () Bool)

(assert (=> start!40068 m!425107))

(declare-fun m!425109 () Bool)

(assert (=> b!437402 m!425109))

(declare-fun m!425111 () Bool)

(assert (=> b!437402 m!425111))

(check-sat (not mapNonEmpty!18852) b_and!18303 (not b!437404) (not b!437397) (not b!437405) (not b!437408) (not b!437400) tp_is_empty!11487 (not start!40068) (not b_next!10335) (not b!437406) (not b!437396) (not b!437402) (not b!437399))
(check-sat b_and!18303 (not b_next!10335))
