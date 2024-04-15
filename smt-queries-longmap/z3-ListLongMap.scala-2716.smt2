; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40100 () Bool)

(assert start!40100)

(declare-fun b_free!10381 () Bool)

(declare-fun b_next!10381 () Bool)

(assert (=> start!40100 (= b_free!10381 (not b_next!10381))))

(declare-fun tp!36671 () Bool)

(declare-fun b_and!18323 () Bool)

(assert (=> start!40100 (= tp!36671 b_and!18323)))

(declare-fun b!438229 () Bool)

(declare-fun res!258796 () Bool)

(declare-fun e!258468 () Bool)

(assert (=> b!438229 (=> (not res!258796) (not e!258468))))

(declare-datatypes ((array!26885 0))(
  ( (array!26886 (arr!12892 (Array (_ BitVec 32) (_ BitVec 64))) (size!13245 (_ BitVec 32))) )
))
(declare-fun lt!201743 () array!26885)

(declare-datatypes ((List!7715 0))(
  ( (Nil!7712) (Cons!7711 (h!8567 (_ BitVec 64)) (t!13462 List!7715)) )
))
(declare-fun arrayNoDuplicates!0 (array!26885 (_ BitVec 32) List!7715) Bool)

(assert (=> b!438229 (= res!258796 (arrayNoDuplicates!0 lt!201743 #b00000000000000000000000000000000 Nil!7712))))

(declare-fun b!438230 () Bool)

(declare-fun e!258473 () Bool)

(assert (=> b!438230 (= e!258468 e!258473)))

(declare-fun res!258800 () Bool)

(assert (=> b!438230 (=> (not res!258800) (not e!258473))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438230 (= res!258800 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16483 0))(
  ( (V!16484 (val!5811 Int)) )
))
(declare-fun zeroValue!515 () V!16483)

(declare-datatypes ((tuple2!7728 0))(
  ( (tuple2!7729 (_1!3875 (_ BitVec 64)) (_2!3875 V!16483)) )
))
(declare-datatypes ((List!7716 0))(
  ( (Nil!7713) (Cons!7712 (h!8568 tuple2!7728) (t!13463 List!7716)) )
))
(declare-datatypes ((ListLongMap!6631 0))(
  ( (ListLongMap!6632 (toList!3331 List!7716)) )
))
(declare-fun lt!201745 () ListLongMap!6631)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5423 0))(
  ( (ValueCellFull!5423 (v!8052 V!16483)) (EmptyCell!5423) )
))
(declare-datatypes ((array!26887 0))(
  ( (array!26888 (arr!12893 (Array (_ BitVec 32) ValueCell!5423)) (size!13246 (_ BitVec 32))) )
))
(declare-fun lt!201746 () array!26887)

(declare-fun minValue!515 () V!16483)

(declare-fun getCurrentListMapNoExtraKeys!1530 (array!26885 array!26887 (_ BitVec 32) (_ BitVec 32) V!16483 V!16483 (_ BitVec 32) Int) ListLongMap!6631)

(assert (=> b!438230 (= lt!201745 (getCurrentListMapNoExtraKeys!1530 lt!201743 lt!201746 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26887)

(declare-fun v!412 () V!16483)

(assert (=> b!438230 (= lt!201746 (array!26888 (store (arr!12893 _values!549) i!563 (ValueCellFull!5423 v!412)) (size!13246 _values!549)))))

(declare-fun lt!201742 () ListLongMap!6631)

(declare-fun _keys!709 () array!26885)

(assert (=> b!438230 (= lt!201742 (getCurrentListMapNoExtraKeys!1530 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438231 () Bool)

(declare-fun res!258794 () Bool)

(declare-fun e!258471 () Bool)

(assert (=> b!438231 (=> (not res!258794) (not e!258471))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438231 (= res!258794 (validKeyInArray!0 k0!794))))

(declare-fun res!258799 () Bool)

(assert (=> start!40100 (=> (not res!258799) (not e!258471))))

(assert (=> start!40100 (= res!258799 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13245 _keys!709))))))

(assert (=> start!40100 e!258471))

(declare-fun tp_is_empty!11533 () Bool)

(assert (=> start!40100 tp_is_empty!11533))

(assert (=> start!40100 tp!36671))

(assert (=> start!40100 true))

(declare-fun e!258469 () Bool)

(declare-fun array_inv!9412 (array!26887) Bool)

(assert (=> start!40100 (and (array_inv!9412 _values!549) e!258469)))

(declare-fun array_inv!9413 (array!26885) Bool)

(assert (=> start!40100 (array_inv!9413 _keys!709)))

(declare-fun b!438232 () Bool)

(declare-fun e!258470 () Bool)

(assert (=> b!438232 (= e!258470 tp_is_empty!11533)))

(declare-fun mapIsEmpty!18921 () Bool)

(declare-fun mapRes!18921 () Bool)

(assert (=> mapIsEmpty!18921 mapRes!18921))

(declare-fun b!438233 () Bool)

(declare-fun res!258793 () Bool)

(assert (=> b!438233 (=> (not res!258793) (not e!258471))))

(assert (=> b!438233 (= res!258793 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7712))))

(declare-fun b!438234 () Bool)

(assert (=> b!438234 (= e!258469 (and e!258470 mapRes!18921))))

(declare-fun condMapEmpty!18921 () Bool)

(declare-fun mapDefault!18921 () ValueCell!5423)

(assert (=> b!438234 (= condMapEmpty!18921 (= (arr!12893 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5423)) mapDefault!18921)))))

(declare-fun b!438235 () Bool)

(declare-fun res!258802 () Bool)

(assert (=> b!438235 (=> (not res!258802) (not e!258471))))

(assert (=> b!438235 (= res!258802 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13245 _keys!709))))))

(declare-fun b!438236 () Bool)

(declare-fun e!258472 () Bool)

(assert (=> b!438236 (= e!258472 tp_is_empty!11533)))

(declare-fun b!438237 () Bool)

(declare-fun res!258798 () Bool)

(assert (=> b!438237 (=> (not res!258798) (not e!258471))))

(declare-fun arrayContainsKey!0 (array!26885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438237 (= res!258798 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438238 () Bool)

(assert (=> b!438238 (= e!258471 e!258468)))

(declare-fun res!258797 () Bool)

(assert (=> b!438238 (=> (not res!258797) (not e!258468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26885 (_ BitVec 32)) Bool)

(assert (=> b!438238 (= res!258797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201743 mask!1025))))

(assert (=> b!438238 (= lt!201743 (array!26886 (store (arr!12892 _keys!709) i!563 k0!794) (size!13245 _keys!709)))))

(declare-fun b!438239 () Bool)

(declare-fun res!258804 () Bool)

(assert (=> b!438239 (=> (not res!258804) (not e!258471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438239 (= res!258804 (validMask!0 mask!1025))))

(declare-fun b!438240 () Bool)

(declare-fun res!258803 () Bool)

(assert (=> b!438240 (=> (not res!258803) (not e!258468))))

(assert (=> b!438240 (= res!258803 (bvsle from!863 i!563))))

(declare-fun b!438241 () Bool)

(declare-fun res!258801 () Bool)

(assert (=> b!438241 (=> (not res!258801) (not e!258471))))

(assert (=> b!438241 (= res!258801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438242 () Bool)

(declare-fun res!258795 () Bool)

(assert (=> b!438242 (=> (not res!258795) (not e!258471))))

(assert (=> b!438242 (= res!258795 (or (= (select (arr!12892 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12892 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438243 () Bool)

(assert (=> b!438243 (= e!258473 (not true))))

(declare-fun +!1500 (ListLongMap!6631 tuple2!7728) ListLongMap!6631)

(assert (=> b!438243 (= (getCurrentListMapNoExtraKeys!1530 lt!201743 lt!201746 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1500 (getCurrentListMapNoExtraKeys!1530 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7729 k0!794 v!412)))))

(declare-datatypes ((Unit!13017 0))(
  ( (Unit!13018) )
))
(declare-fun lt!201744 () Unit!13017)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!638 (array!26885 array!26887 (_ BitVec 32) (_ BitVec 32) V!16483 V!16483 (_ BitVec 32) (_ BitVec 64) V!16483 (_ BitVec 32) Int) Unit!13017)

(assert (=> b!438243 (= lt!201744 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!638 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18921 () Bool)

(declare-fun tp!36672 () Bool)

(assert (=> mapNonEmpty!18921 (= mapRes!18921 (and tp!36672 e!258472))))

(declare-fun mapRest!18921 () (Array (_ BitVec 32) ValueCell!5423))

(declare-fun mapValue!18921 () ValueCell!5423)

(declare-fun mapKey!18921 () (_ BitVec 32))

(assert (=> mapNonEmpty!18921 (= (arr!12893 _values!549) (store mapRest!18921 mapKey!18921 mapValue!18921))))

(declare-fun b!438244 () Bool)

(declare-fun res!258792 () Bool)

(assert (=> b!438244 (=> (not res!258792) (not e!258471))))

(assert (=> b!438244 (= res!258792 (and (= (size!13246 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13245 _keys!709) (size!13246 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40100 res!258799) b!438239))

(assert (= (and b!438239 res!258804) b!438244))

(assert (= (and b!438244 res!258792) b!438241))

(assert (= (and b!438241 res!258801) b!438233))

(assert (= (and b!438233 res!258793) b!438235))

(assert (= (and b!438235 res!258802) b!438231))

(assert (= (and b!438231 res!258794) b!438242))

(assert (= (and b!438242 res!258795) b!438237))

(assert (= (and b!438237 res!258798) b!438238))

(assert (= (and b!438238 res!258797) b!438229))

(assert (= (and b!438229 res!258796) b!438240))

(assert (= (and b!438240 res!258803) b!438230))

(assert (= (and b!438230 res!258800) b!438243))

(assert (= (and b!438234 condMapEmpty!18921) mapIsEmpty!18921))

(assert (= (and b!438234 (not condMapEmpty!18921)) mapNonEmpty!18921))

(get-info :version)

(assert (= (and mapNonEmpty!18921 ((_ is ValueCellFull!5423) mapValue!18921)) b!438236))

(assert (= (and b!438234 ((_ is ValueCellFull!5423) mapDefault!18921)) b!438232))

(assert (= start!40100 b!438234))

(declare-fun m!425217 () Bool)

(assert (=> b!438239 m!425217))

(declare-fun m!425219 () Bool)

(assert (=> b!438237 m!425219))

(declare-fun m!425221 () Bool)

(assert (=> b!438231 m!425221))

(declare-fun m!425223 () Bool)

(assert (=> b!438233 m!425223))

(declare-fun m!425225 () Bool)

(assert (=> b!438242 m!425225))

(declare-fun m!425227 () Bool)

(assert (=> b!438241 m!425227))

(declare-fun m!425229 () Bool)

(assert (=> b!438238 m!425229))

(declare-fun m!425231 () Bool)

(assert (=> b!438238 m!425231))

(declare-fun m!425233 () Bool)

(assert (=> b!438230 m!425233))

(declare-fun m!425235 () Bool)

(assert (=> b!438230 m!425235))

(declare-fun m!425237 () Bool)

(assert (=> b!438230 m!425237))

(declare-fun m!425239 () Bool)

(assert (=> mapNonEmpty!18921 m!425239))

(declare-fun m!425241 () Bool)

(assert (=> b!438243 m!425241))

(declare-fun m!425243 () Bool)

(assert (=> b!438243 m!425243))

(assert (=> b!438243 m!425243))

(declare-fun m!425245 () Bool)

(assert (=> b!438243 m!425245))

(declare-fun m!425247 () Bool)

(assert (=> b!438243 m!425247))

(declare-fun m!425249 () Bool)

(assert (=> b!438229 m!425249))

(declare-fun m!425251 () Bool)

(assert (=> start!40100 m!425251))

(declare-fun m!425253 () Bool)

(assert (=> start!40100 m!425253))

(check-sat (not b!438243) b_and!18323 (not b_next!10381) (not b!438230) (not b!438229) (not b!438237) (not mapNonEmpty!18921) (not b!438231) (not b!438241) (not start!40100) (not b!438233) (not b!438239) tp_is_empty!11533 (not b!438238))
(check-sat b_and!18323 (not b_next!10381))
