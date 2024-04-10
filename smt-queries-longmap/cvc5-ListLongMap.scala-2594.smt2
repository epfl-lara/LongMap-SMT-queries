; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39382 () Bool)

(assert start!39382)

(declare-fun b_free!9649 () Bool)

(declare-fun b_next!9649 () Bool)

(assert (=> start!39382 (= b_free!9649 (not b_next!9649))))

(declare-fun tp!34476 () Bool)

(declare-fun b_and!17173 () Bool)

(assert (=> start!39382 (= tp!34476 b_and!17173)))

(declare-fun b!418433 () Bool)

(declare-fun e!249513 () Bool)

(assert (=> b!418433 (= e!249513 true)))

(declare-datatypes ((V!15507 0))(
  ( (V!15508 (val!5445 Int)) )
))
(declare-datatypes ((tuple2!7120 0))(
  ( (tuple2!7121 (_1!3571 (_ BitVec 64)) (_2!3571 V!15507)) )
))
(declare-fun lt!191787 () tuple2!7120)

(declare-datatypes ((List!7133 0))(
  ( (Nil!7130) (Cons!7129 (h!7985 tuple2!7120) (t!12447 List!7133)) )
))
(declare-datatypes ((ListLongMap!6033 0))(
  ( (ListLongMap!6034 (toList!3032 List!7133)) )
))
(declare-fun lt!191783 () ListLongMap!6033)

(declare-fun lt!191789 () V!15507)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1231 (ListLongMap!6033 tuple2!7120) ListLongMap!6033)

(assert (=> b!418433 (= (+!1231 lt!191783 lt!191787) (+!1231 (+!1231 lt!191783 (tuple2!7121 k!794 lt!191789)) lt!191787))))

(declare-fun lt!191782 () V!15507)

(assert (=> b!418433 (= lt!191787 (tuple2!7121 k!794 lt!191782))))

(declare-datatypes ((Unit!12366 0))(
  ( (Unit!12367) )
))
(declare-fun lt!191790 () Unit!12366)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!31 (ListLongMap!6033 (_ BitVec 64) V!15507 V!15507) Unit!12366)

(assert (=> b!418433 (= lt!191790 (addSameAsAddTwiceSameKeyDiffValues!31 lt!191783 k!794 lt!191789 lt!191782))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!191788 () V!15507)

(declare-datatypes ((ValueCell!5057 0))(
  ( (ValueCellFull!5057 (v!7692 V!15507)) (EmptyCell!5057) )
))
(declare-datatypes ((array!25453 0))(
  ( (array!25454 (arr!12176 (Array (_ BitVec 32) ValueCell!5057)) (size!12528 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25453)

(declare-fun get!6033 (ValueCell!5057 V!15507) V!15507)

(assert (=> b!418433 (= lt!191789 (get!6033 (select (arr!12176 _values!549) from!863) lt!191788))))

(declare-fun lt!191791 () ListLongMap!6033)

(declare-datatypes ((array!25455 0))(
  ( (array!25456 (arr!12177 (Array (_ BitVec 32) (_ BitVec 64))) (size!12529 (_ BitVec 32))) )
))
(declare-fun lt!191786 () array!25455)

(assert (=> b!418433 (= lt!191791 (+!1231 lt!191783 (tuple2!7121 (select (arr!12177 lt!191786) from!863) lt!191782)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15507)

(assert (=> b!418433 (= lt!191782 (get!6033 (select (store (arr!12176 _values!549) i!563 (ValueCellFull!5057 v!412)) from!863) lt!191788))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!702 (Int (_ BitVec 64)) V!15507)

(assert (=> b!418433 (= lt!191788 (dynLambda!702 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15507)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15507)

(declare-fun lt!191785 () array!25453)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1237 (array!25455 array!25453 (_ BitVec 32) (_ BitVec 32) V!15507 V!15507 (_ BitVec 32) Int) ListLongMap!6033)

(assert (=> b!418433 (= lt!191783 (getCurrentListMapNoExtraKeys!1237 lt!191786 lt!191785 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418434 () Bool)

(declare-fun res!243825 () Bool)

(declare-fun e!249511 () Bool)

(assert (=> b!418434 (=> (not res!243825) (not e!249511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418434 (= res!243825 (validMask!0 mask!1025))))

(declare-fun call!29125 () ListLongMap!6033)

(declare-fun bm!29122 () Bool)

(declare-fun _keys!709 () array!25455)

(declare-fun c!55187 () Bool)

(assert (=> bm!29122 (= call!29125 (getCurrentListMapNoExtraKeys!1237 (ite c!55187 lt!191786 _keys!709) (ite c!55187 lt!191785 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418436 () Bool)

(declare-fun e!249519 () Bool)

(declare-fun tp_is_empty!10801 () Bool)

(assert (=> b!418436 (= e!249519 tp_is_empty!10801)))

(declare-fun b!418437 () Bool)

(declare-fun res!243823 () Bool)

(declare-fun e!249512 () Bool)

(assert (=> b!418437 (=> (not res!243823) (not e!249512))))

(assert (=> b!418437 (= res!243823 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17823 () Bool)

(declare-fun mapRes!17823 () Bool)

(declare-fun tp!34475 () Bool)

(declare-fun e!249517 () Bool)

(assert (=> mapNonEmpty!17823 (= mapRes!17823 (and tp!34475 e!249517))))

(declare-fun mapValue!17823 () ValueCell!5057)

(declare-fun mapKey!17823 () (_ BitVec 32))

(declare-fun mapRest!17823 () (Array (_ BitVec 32) ValueCell!5057))

(assert (=> mapNonEmpty!17823 (= (arr!12176 _values!549) (store mapRest!17823 mapKey!17823 mapValue!17823))))

(declare-fun b!418438 () Bool)

(declare-fun res!243822 () Bool)

(assert (=> b!418438 (=> (not res!243822) (not e!249511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25455 (_ BitVec 32)) Bool)

(assert (=> b!418438 (= res!243822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun call!29126 () ListLongMap!6033)

(declare-fun bm!29123 () Bool)

(assert (=> bm!29123 (= call!29126 (getCurrentListMapNoExtraKeys!1237 (ite c!55187 _keys!709 lt!191786) (ite c!55187 _values!549 lt!191785) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418439 () Bool)

(declare-fun e!249518 () Bool)

(assert (=> b!418439 (= e!249512 e!249518)))

(declare-fun res!243815 () Bool)

(assert (=> b!418439 (=> (not res!243815) (not e!249518))))

(assert (=> b!418439 (= res!243815 (= from!863 i!563))))

(assert (=> b!418439 (= lt!191791 (getCurrentListMapNoExtraKeys!1237 lt!191786 lt!191785 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418439 (= lt!191785 (array!25454 (store (arr!12176 _values!549) i!563 (ValueCellFull!5057 v!412)) (size!12528 _values!549)))))

(declare-fun lt!191792 () ListLongMap!6033)

(assert (=> b!418439 (= lt!191792 (getCurrentListMapNoExtraKeys!1237 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17823 () Bool)

(assert (=> mapIsEmpty!17823 mapRes!17823))

(declare-fun b!418440 () Bool)

(declare-fun res!243819 () Bool)

(assert (=> b!418440 (=> (not res!243819) (not e!249511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418440 (= res!243819 (validKeyInArray!0 k!794))))

(declare-fun b!418441 () Bool)

(declare-fun res!243812 () Bool)

(assert (=> b!418441 (=> (not res!243812) (not e!249511))))

(assert (=> b!418441 (= res!243812 (or (= (select (arr!12177 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12177 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418442 () Bool)

(declare-fun res!243821 () Bool)

(assert (=> b!418442 (=> (not res!243821) (not e!249511))))

(declare-datatypes ((List!7134 0))(
  ( (Nil!7131) (Cons!7130 (h!7986 (_ BitVec 64)) (t!12448 List!7134)) )
))
(declare-fun arrayNoDuplicates!0 (array!25455 (_ BitVec 32) List!7134) Bool)

(assert (=> b!418442 (= res!243821 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7131))))

(declare-fun b!418443 () Bool)

(declare-fun res!243820 () Bool)

(assert (=> b!418443 (=> (not res!243820) (not e!249512))))

(assert (=> b!418443 (= res!243820 (arrayNoDuplicates!0 lt!191786 #b00000000000000000000000000000000 Nil!7131))))

(declare-fun b!418444 () Bool)

(declare-fun res!243814 () Bool)

(assert (=> b!418444 (=> (not res!243814) (not e!249511))))

(assert (=> b!418444 (= res!243814 (and (= (size!12528 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12529 _keys!709) (size!12528 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418445 () Bool)

(assert (=> b!418445 (= e!249511 e!249512)))

(declare-fun res!243818 () Bool)

(assert (=> b!418445 (=> (not res!243818) (not e!249512))))

(assert (=> b!418445 (= res!243818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191786 mask!1025))))

(assert (=> b!418445 (= lt!191786 (array!25456 (store (arr!12177 _keys!709) i!563 k!794) (size!12529 _keys!709)))))

(declare-fun res!243813 () Bool)

(assert (=> start!39382 (=> (not res!243813) (not e!249511))))

(assert (=> start!39382 (= res!243813 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12529 _keys!709))))))

(assert (=> start!39382 e!249511))

(assert (=> start!39382 tp_is_empty!10801))

(assert (=> start!39382 tp!34476))

(assert (=> start!39382 true))

(declare-fun e!249515 () Bool)

(declare-fun array_inv!8876 (array!25453) Bool)

(assert (=> start!39382 (and (array_inv!8876 _values!549) e!249515)))

(declare-fun array_inv!8877 (array!25455) Bool)

(assert (=> start!39382 (array_inv!8877 _keys!709)))

(declare-fun b!418435 () Bool)

(declare-fun e!249516 () Bool)

(assert (=> b!418435 (= e!249516 (= call!29125 (+!1231 call!29126 (tuple2!7121 k!794 v!412))))))

(declare-fun b!418446 () Bool)

(declare-fun res!243816 () Bool)

(assert (=> b!418446 (=> (not res!243816) (not e!249511))))

(assert (=> b!418446 (= res!243816 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12529 _keys!709))))))

(declare-fun b!418447 () Bool)

(declare-fun res!243817 () Bool)

(assert (=> b!418447 (=> (not res!243817) (not e!249511))))

(declare-fun arrayContainsKey!0 (array!25455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418447 (= res!243817 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!418448 () Bool)

(assert (=> b!418448 (= e!249515 (and e!249519 mapRes!17823))))

(declare-fun condMapEmpty!17823 () Bool)

(declare-fun mapDefault!17823 () ValueCell!5057)

