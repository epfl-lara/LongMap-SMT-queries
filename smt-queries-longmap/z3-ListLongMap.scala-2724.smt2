; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40148 () Bool)

(assert start!40148)

(declare-fun b_free!10429 () Bool)

(declare-fun b_next!10429 () Bool)

(assert (=> start!40148 (= b_free!10429 (not b_next!10429))))

(declare-fun tp!36815 () Bool)

(declare-fun b_and!18371 () Bool)

(assert (=> start!40148 (= tp!36815 b_and!18371)))

(declare-fun b!439381 () Bool)

(declare-fun res!259736 () Bool)

(declare-fun e!258978 () Bool)

(assert (=> b!439381 (=> (not res!259736) (not e!258978))))

(declare-datatypes ((array!26979 0))(
  ( (array!26980 (arr!12939 (Array (_ BitVec 32) (_ BitVec 64))) (size!13292 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26979)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439381 (= res!259736 (or (= (select (arr!12939 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12939 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439382 () Bool)

(declare-fun e!258975 () Bool)

(assert (=> b!439382 (= e!258978 e!258975)))

(declare-fun res!259735 () Bool)

(assert (=> b!439382 (=> (not res!259735) (not e!258975))))

(declare-fun lt!202106 () array!26979)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26979 (_ BitVec 32)) Bool)

(assert (=> b!439382 (= res!259735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202106 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!439382 (= lt!202106 (array!26980 (store (arr!12939 _keys!709) i!563 k0!794) (size!13292 _keys!709)))))

(declare-fun b!439383 () Bool)

(declare-fun res!259730 () Bool)

(assert (=> b!439383 (=> (not res!259730) (not e!258978))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16547 0))(
  ( (V!16548 (val!5835 Int)) )
))
(declare-datatypes ((ValueCell!5447 0))(
  ( (ValueCellFull!5447 (v!8076 V!16547)) (EmptyCell!5447) )
))
(declare-datatypes ((array!26981 0))(
  ( (array!26982 (arr!12940 (Array (_ BitVec 32) ValueCell!5447)) (size!13293 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26981)

(assert (=> b!439383 (= res!259730 (and (= (size!13293 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13292 _keys!709) (size!13293 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439384 () Bool)

(declare-fun e!258974 () Bool)

(declare-fun e!258973 () Bool)

(declare-fun mapRes!18993 () Bool)

(assert (=> b!439384 (= e!258974 (and e!258973 mapRes!18993))))

(declare-fun condMapEmpty!18993 () Bool)

(declare-fun mapDefault!18993 () ValueCell!5447)

(assert (=> b!439384 (= condMapEmpty!18993 (= (arr!12940 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5447)) mapDefault!18993)))))

(declare-fun b!439385 () Bool)

(declare-fun res!259740 () Bool)

(assert (=> b!439385 (=> (not res!259740) (not e!258978))))

(assert (=> b!439385 (= res!259740 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13292 _keys!709))))))

(declare-fun b!439386 () Bool)

(declare-fun e!258977 () Bool)

(assert (=> b!439386 (= e!258975 e!258977)))

(declare-fun res!259738 () Bool)

(assert (=> b!439386 (=> (not res!259738) (not e!258977))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!439386 (= res!259738 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16547)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7764 0))(
  ( (tuple2!7765 (_1!3893 (_ BitVec 64)) (_2!3893 V!16547)) )
))
(declare-datatypes ((List!7752 0))(
  ( (Nil!7749) (Cons!7748 (h!8604 tuple2!7764) (t!13499 List!7752)) )
))
(declare-datatypes ((ListLongMap!6667 0))(
  ( (ListLongMap!6668 (toList!3349 List!7752)) )
))
(declare-fun lt!202105 () ListLongMap!6667)

(declare-fun lt!202102 () array!26981)

(declare-fun zeroValue!515 () V!16547)

(declare-fun getCurrentListMapNoExtraKeys!1548 (array!26979 array!26981 (_ BitVec 32) (_ BitVec 32) V!16547 V!16547 (_ BitVec 32) Int) ListLongMap!6667)

(assert (=> b!439386 (= lt!202105 (getCurrentListMapNoExtraKeys!1548 lt!202106 lt!202102 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16547)

(assert (=> b!439386 (= lt!202102 (array!26982 (store (arr!12940 _values!549) i!563 (ValueCellFull!5447 v!412)) (size!13293 _values!549)))))

(declare-fun lt!202103 () ListLongMap!6667)

(assert (=> b!439386 (= lt!202103 (getCurrentListMapNoExtraKeys!1548 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439387 () Bool)

(declare-fun res!259734 () Bool)

(assert (=> b!439387 (=> (not res!259734) (not e!258978))))

(declare-fun arrayContainsKey!0 (array!26979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439387 (= res!259734 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439388 () Bool)

(assert (=> b!439388 (= e!258977 (not true))))

(declare-fun +!1513 (ListLongMap!6667 tuple2!7764) ListLongMap!6667)

(assert (=> b!439388 (= (getCurrentListMapNoExtraKeys!1548 lt!202106 lt!202102 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1513 (getCurrentListMapNoExtraKeys!1548 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7765 k0!794 v!412)))))

(declare-datatypes ((Unit!13043 0))(
  ( (Unit!13044) )
))
(declare-fun lt!202104 () Unit!13043)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!651 (array!26979 array!26981 (_ BitVec 32) (_ BitVec 32) V!16547 V!16547 (_ BitVec 32) (_ BitVec 64) V!16547 (_ BitVec 32) Int) Unit!13043)

(assert (=> b!439388 (= lt!202104 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!651 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439389 () Bool)

(declare-fun res!259731 () Bool)

(assert (=> b!439389 (=> (not res!259731) (not e!258975))))

(declare-datatypes ((List!7753 0))(
  ( (Nil!7750) (Cons!7749 (h!8605 (_ BitVec 64)) (t!13500 List!7753)) )
))
(declare-fun arrayNoDuplicates!0 (array!26979 (_ BitVec 32) List!7753) Bool)

(assert (=> b!439389 (= res!259731 (arrayNoDuplicates!0 lt!202106 #b00000000000000000000000000000000 Nil!7750))))

(declare-fun b!439390 () Bool)

(declare-fun e!258976 () Bool)

(declare-fun tp_is_empty!11581 () Bool)

(assert (=> b!439390 (= e!258976 tp_is_empty!11581)))

(declare-fun b!439391 () Bool)

(assert (=> b!439391 (= e!258973 tp_is_empty!11581)))

(declare-fun mapIsEmpty!18993 () Bool)

(assert (=> mapIsEmpty!18993 mapRes!18993))

(declare-fun b!439392 () Bool)

(declare-fun res!259733 () Bool)

(assert (=> b!439392 (=> (not res!259733) (not e!258978))))

(assert (=> b!439392 (= res!259733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439393 () Bool)

(declare-fun res!259732 () Bool)

(assert (=> b!439393 (=> (not res!259732) (not e!258978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439393 (= res!259732 (validKeyInArray!0 k0!794))))

(declare-fun b!439394 () Bool)

(declare-fun res!259737 () Bool)

(assert (=> b!439394 (=> (not res!259737) (not e!258978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439394 (= res!259737 (validMask!0 mask!1025))))

(declare-fun b!439395 () Bool)

(declare-fun res!259739 () Bool)

(assert (=> b!439395 (=> (not res!259739) (not e!258975))))

(assert (=> b!439395 (= res!259739 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18993 () Bool)

(declare-fun tp!36816 () Bool)

(assert (=> mapNonEmpty!18993 (= mapRes!18993 (and tp!36816 e!258976))))

(declare-fun mapValue!18993 () ValueCell!5447)

(declare-fun mapRest!18993 () (Array (_ BitVec 32) ValueCell!5447))

(declare-fun mapKey!18993 () (_ BitVec 32))

(assert (=> mapNonEmpty!18993 (= (arr!12940 _values!549) (store mapRest!18993 mapKey!18993 mapValue!18993))))

(declare-fun b!439396 () Bool)

(declare-fun res!259729 () Bool)

(assert (=> b!439396 (=> (not res!259729) (not e!258978))))

(assert (=> b!439396 (= res!259729 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7750))))

(declare-fun res!259728 () Bool)

(assert (=> start!40148 (=> (not res!259728) (not e!258978))))

(assert (=> start!40148 (= res!259728 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13292 _keys!709))))))

(assert (=> start!40148 e!258978))

(assert (=> start!40148 tp_is_empty!11581))

(assert (=> start!40148 tp!36815))

(assert (=> start!40148 true))

(declare-fun array_inv!9440 (array!26981) Bool)

(assert (=> start!40148 (and (array_inv!9440 _values!549) e!258974)))

(declare-fun array_inv!9441 (array!26979) Bool)

(assert (=> start!40148 (array_inv!9441 _keys!709)))

(assert (= (and start!40148 res!259728) b!439394))

(assert (= (and b!439394 res!259737) b!439383))

(assert (= (and b!439383 res!259730) b!439392))

(assert (= (and b!439392 res!259733) b!439396))

(assert (= (and b!439396 res!259729) b!439385))

(assert (= (and b!439385 res!259740) b!439393))

(assert (= (and b!439393 res!259732) b!439381))

(assert (= (and b!439381 res!259736) b!439387))

(assert (= (and b!439387 res!259734) b!439382))

(assert (= (and b!439382 res!259735) b!439389))

(assert (= (and b!439389 res!259731) b!439395))

(assert (= (and b!439395 res!259739) b!439386))

(assert (= (and b!439386 res!259738) b!439388))

(assert (= (and b!439384 condMapEmpty!18993) mapIsEmpty!18993))

(assert (= (and b!439384 (not condMapEmpty!18993)) mapNonEmpty!18993))

(get-info :version)

(assert (= (and mapNonEmpty!18993 ((_ is ValueCellFull!5447) mapValue!18993)) b!439390))

(assert (= (and b!439384 ((_ is ValueCellFull!5447) mapDefault!18993)) b!439391))

(assert (= start!40148 b!439384))

(declare-fun m!426129 () Bool)

(assert (=> b!439388 m!426129))

(declare-fun m!426131 () Bool)

(assert (=> b!439388 m!426131))

(assert (=> b!439388 m!426131))

(declare-fun m!426133 () Bool)

(assert (=> b!439388 m!426133))

(declare-fun m!426135 () Bool)

(assert (=> b!439388 m!426135))

(declare-fun m!426137 () Bool)

(assert (=> b!439393 m!426137))

(declare-fun m!426139 () Bool)

(assert (=> b!439396 m!426139))

(declare-fun m!426141 () Bool)

(assert (=> b!439381 m!426141))

(declare-fun m!426143 () Bool)

(assert (=> b!439386 m!426143))

(declare-fun m!426145 () Bool)

(assert (=> b!439386 m!426145))

(declare-fun m!426147 () Bool)

(assert (=> b!439386 m!426147))

(declare-fun m!426149 () Bool)

(assert (=> b!439382 m!426149))

(declare-fun m!426151 () Bool)

(assert (=> b!439382 m!426151))

(declare-fun m!426153 () Bool)

(assert (=> start!40148 m!426153))

(declare-fun m!426155 () Bool)

(assert (=> start!40148 m!426155))

(declare-fun m!426157 () Bool)

(assert (=> b!439394 m!426157))

(declare-fun m!426159 () Bool)

(assert (=> b!439389 m!426159))

(declare-fun m!426161 () Bool)

(assert (=> b!439392 m!426161))

(declare-fun m!426163 () Bool)

(assert (=> mapNonEmpty!18993 m!426163))

(declare-fun m!426165 () Bool)

(assert (=> b!439387 m!426165))

(check-sat (not b!439386) tp_is_empty!11581 (not b!439387) (not b!439389) b_and!18371 (not b!439393) (not mapNonEmpty!18993) (not b!439392) (not start!40148) (not b!439382) (not b!439394) (not b_next!10429) (not b!439388) (not b!439396))
(check-sat b_and!18371 (not b_next!10429))
