; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38580 () Bool)

(assert start!38580)

(declare-fun b_free!9117 () Bool)

(declare-fun b_next!9117 () Bool)

(assert (=> start!38580 (= b_free!9117 (not b_next!9117))))

(declare-fun tp!32475 () Bool)

(declare-fun b_and!16503 () Bool)

(assert (=> start!38580 (= tp!32475 b_and!16503)))

(declare-fun res!229683 () Bool)

(declare-fun e!241235 () Bool)

(assert (=> start!38580 (=> (not res!229683) (not e!241235))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23909 0))(
  ( (array!23910 (arr!11404 (Array (_ BitVec 32) (_ BitVec 64))) (size!11756 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23909)

(assert (=> start!38580 (= res!229683 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11756 _keys!709))))))

(assert (=> start!38580 e!241235))

(declare-fun tp_is_empty!9999 () Bool)

(assert (=> start!38580 tp_is_empty!9999))

(assert (=> start!38580 tp!32475))

(assert (=> start!38580 true))

(declare-datatypes ((V!14437 0))(
  ( (V!14438 (val!5044 Int)) )
))
(declare-datatypes ((ValueCell!4656 0))(
  ( (ValueCellFull!4656 (v!7291 V!14437)) (EmptyCell!4656) )
))
(declare-datatypes ((array!23911 0))(
  ( (array!23912 (arr!11405 (Array (_ BitVec 32) ValueCell!4656)) (size!11757 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23911)

(declare-fun e!241233 () Bool)

(declare-fun array_inv!8356 (array!23911) Bool)

(assert (=> start!38580 (and (array_inv!8356 _values!549) e!241233)))

(declare-fun array_inv!8357 (array!23909) Bool)

(assert (=> start!38580 (array_inv!8357 _keys!709)))

(declare-fun b!399442 () Bool)

(declare-fun res!229688 () Bool)

(assert (=> b!399442 (=> (not res!229688) (not e!241235))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!399442 (= res!229688 (and (= (size!11757 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11756 _keys!709) (size!11757 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399443 () Bool)

(declare-fun res!229686 () Bool)

(assert (=> b!399443 (=> (not res!229686) (not e!241235))))

(declare-datatypes ((List!6605 0))(
  ( (Nil!6602) (Cons!6601 (h!7457 (_ BitVec 64)) (t!11779 List!6605)) )
))
(declare-fun arrayNoDuplicates!0 (array!23909 (_ BitVec 32) List!6605) Bool)

(assert (=> b!399443 (= res!229686 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6602))))

(declare-fun b!399444 () Bool)

(declare-fun res!229678 () Bool)

(assert (=> b!399444 (=> (not res!229678) (not e!241235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23909 (_ BitVec 32)) Bool)

(assert (=> b!399444 (= res!229678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399445 () Bool)

(declare-fun res!229689 () Bool)

(assert (=> b!399445 (=> (not res!229689) (not e!241235))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399445 (= res!229689 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11756 _keys!709))))))

(declare-fun b!399446 () Bool)

(declare-fun res!229685 () Bool)

(assert (=> b!399446 (=> (not res!229685) (not e!241235))))

(assert (=> b!399446 (= res!229685 (or (= (select (arr!11404 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11404 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6678 0))(
  ( (tuple2!6679 (_1!3350 (_ BitVec 64)) (_2!3350 V!14437)) )
))
(declare-datatypes ((List!6606 0))(
  ( (Nil!6603) (Cons!6602 (h!7458 tuple2!6678) (t!11780 List!6606)) )
))
(declare-datatypes ((ListLongMap!5591 0))(
  ( (ListLongMap!5592 (toList!2811 List!6606)) )
))
(declare-fun call!28016 () ListLongMap!5591)

(declare-fun e!241234 () Bool)

(declare-fun call!28015 () ListLongMap!5591)

(declare-fun b!399447 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14437)

(declare-fun +!1100 (ListLongMap!5591 tuple2!6678) ListLongMap!5591)

(assert (=> b!399447 (= e!241234 (= call!28015 (+!1100 call!28016 (tuple2!6679 k0!794 v!412))))))

(declare-fun b!399448 () Bool)

(declare-fun e!241230 () Bool)

(assert (=> b!399448 (= e!241230 (not true))))

(assert (=> b!399448 e!241234))

(declare-fun c!54632 () Bool)

(assert (=> b!399448 (= c!54632 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14437)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14437)

(declare-datatypes ((Unit!12106 0))(
  ( (Unit!12107) )
))
(declare-fun lt!187577 () Unit!12106)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!311 (array!23909 array!23911 (_ BitVec 32) (_ BitVec 32) V!14437 V!14437 (_ BitVec 32) (_ BitVec 64) V!14437 (_ BitVec 32) Int) Unit!12106)

(assert (=> b!399448 (= lt!187577 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!311 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399449 () Bool)

(declare-fun res!229680 () Bool)

(assert (=> b!399449 (=> (not res!229680) (not e!241235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399449 (= res!229680 (validKeyInArray!0 k0!794))))

(declare-fun lt!187576 () array!23909)

(declare-fun bm!28012 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1028 (array!23909 array!23911 (_ BitVec 32) (_ BitVec 32) V!14437 V!14437 (_ BitVec 32) Int) ListLongMap!5591)

(assert (=> bm!28012 (= call!28015 (getCurrentListMapNoExtraKeys!1028 (ite c!54632 lt!187576 _keys!709) (ite c!54632 (array!23912 (store (arr!11405 _values!549) i!563 (ValueCellFull!4656 v!412)) (size!11757 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399450 () Bool)

(declare-fun res!229679 () Bool)

(assert (=> b!399450 (=> (not res!229679) (not e!241235))))

(declare-fun arrayContainsKey!0 (array!23909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399450 (= res!229679 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399451 () Bool)

(declare-fun e!241232 () Bool)

(assert (=> b!399451 (= e!241232 tp_is_empty!9999)))

(declare-fun b!399452 () Bool)

(assert (=> b!399452 (= e!241235 e!241230)))

(declare-fun res!229687 () Bool)

(assert (=> b!399452 (=> (not res!229687) (not e!241230))))

(assert (=> b!399452 (= res!229687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187576 mask!1025))))

(assert (=> b!399452 (= lt!187576 (array!23910 (store (arr!11404 _keys!709) i!563 k0!794) (size!11756 _keys!709)))))

(declare-fun mapIsEmpty!16620 () Bool)

(declare-fun mapRes!16620 () Bool)

(assert (=> mapIsEmpty!16620 mapRes!16620))

(declare-fun b!399453 () Bool)

(declare-fun res!229684 () Bool)

(assert (=> b!399453 (=> (not res!229684) (not e!241230))))

(assert (=> b!399453 (= res!229684 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11756 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399454 () Bool)

(declare-fun e!241236 () Bool)

(assert (=> b!399454 (= e!241236 tp_is_empty!9999)))

(declare-fun b!399455 () Bool)

(assert (=> b!399455 (= e!241233 (and e!241232 mapRes!16620))))

(declare-fun condMapEmpty!16620 () Bool)

(declare-fun mapDefault!16620 () ValueCell!4656)

(assert (=> b!399455 (= condMapEmpty!16620 (= (arr!11405 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4656)) mapDefault!16620)))))

(declare-fun b!399456 () Bool)

(assert (=> b!399456 (= e!241234 (= call!28016 call!28015))))

(declare-fun b!399457 () Bool)

(declare-fun res!229682 () Bool)

(assert (=> b!399457 (=> (not res!229682) (not e!241235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399457 (= res!229682 (validMask!0 mask!1025))))

(declare-fun b!399458 () Bool)

(declare-fun res!229681 () Bool)

(assert (=> b!399458 (=> (not res!229681) (not e!241230))))

(assert (=> b!399458 (= res!229681 (arrayNoDuplicates!0 lt!187576 #b00000000000000000000000000000000 Nil!6602))))

(declare-fun bm!28013 () Bool)

(assert (=> bm!28013 (= call!28016 (getCurrentListMapNoExtraKeys!1028 (ite c!54632 _keys!709 lt!187576) (ite c!54632 _values!549 (array!23912 (store (arr!11405 _values!549) i!563 (ValueCellFull!4656 v!412)) (size!11757 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16620 () Bool)

(declare-fun tp!32474 () Bool)

(assert (=> mapNonEmpty!16620 (= mapRes!16620 (and tp!32474 e!241236))))

(declare-fun mapValue!16620 () ValueCell!4656)

(declare-fun mapKey!16620 () (_ BitVec 32))

(declare-fun mapRest!16620 () (Array (_ BitVec 32) ValueCell!4656))

(assert (=> mapNonEmpty!16620 (= (arr!11405 _values!549) (store mapRest!16620 mapKey!16620 mapValue!16620))))

(assert (= (and start!38580 res!229683) b!399457))

(assert (= (and b!399457 res!229682) b!399442))

(assert (= (and b!399442 res!229688) b!399444))

(assert (= (and b!399444 res!229678) b!399443))

(assert (= (and b!399443 res!229686) b!399445))

(assert (= (and b!399445 res!229689) b!399449))

(assert (= (and b!399449 res!229680) b!399446))

(assert (= (and b!399446 res!229685) b!399450))

(assert (= (and b!399450 res!229679) b!399452))

(assert (= (and b!399452 res!229687) b!399458))

(assert (= (and b!399458 res!229681) b!399453))

(assert (= (and b!399453 res!229684) b!399448))

(assert (= (and b!399448 c!54632) b!399447))

(assert (= (and b!399448 (not c!54632)) b!399456))

(assert (= (or b!399447 b!399456) bm!28012))

(assert (= (or b!399447 b!399456) bm!28013))

(assert (= (and b!399455 condMapEmpty!16620) mapIsEmpty!16620))

(assert (= (and b!399455 (not condMapEmpty!16620)) mapNonEmpty!16620))

(get-info :version)

(assert (= (and mapNonEmpty!16620 ((_ is ValueCellFull!4656) mapValue!16620)) b!399454))

(assert (= (and b!399455 ((_ is ValueCellFull!4656) mapDefault!16620)) b!399451))

(assert (= start!38580 b!399455))

(declare-fun m!393965 () Bool)

(assert (=> b!399450 m!393965))

(declare-fun m!393967 () Bool)

(assert (=> b!399443 m!393967))

(declare-fun m!393969 () Bool)

(assert (=> bm!28012 m!393969))

(declare-fun m!393971 () Bool)

(assert (=> bm!28012 m!393971))

(declare-fun m!393973 () Bool)

(assert (=> start!38580 m!393973))

(declare-fun m!393975 () Bool)

(assert (=> start!38580 m!393975))

(declare-fun m!393977 () Bool)

(assert (=> b!399447 m!393977))

(declare-fun m!393979 () Bool)

(assert (=> b!399452 m!393979))

(declare-fun m!393981 () Bool)

(assert (=> b!399452 m!393981))

(declare-fun m!393983 () Bool)

(assert (=> b!399457 m!393983))

(declare-fun m!393985 () Bool)

(assert (=> b!399446 m!393985))

(declare-fun m!393987 () Bool)

(assert (=> b!399449 m!393987))

(declare-fun m!393989 () Bool)

(assert (=> b!399448 m!393989))

(declare-fun m!393991 () Bool)

(assert (=> b!399458 m!393991))

(declare-fun m!393993 () Bool)

(assert (=> mapNonEmpty!16620 m!393993))

(assert (=> bm!28013 m!393969))

(declare-fun m!393995 () Bool)

(assert (=> bm!28013 m!393995))

(declare-fun m!393997 () Bool)

(assert (=> b!399444 m!393997))

(check-sat (not mapNonEmpty!16620) (not b!399448) (not b!399447) (not b_next!9117) b_and!16503 tp_is_empty!9999 (not b!399444) (not b!399457) (not b!399450) (not bm!28012) (not b!399443) (not b!399452) (not start!38580) (not bm!28013) (not b!399449) (not b!399458))
(check-sat b_and!16503 (not b_next!9117))
