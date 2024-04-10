; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39460 () Bool)

(assert start!39460)

(declare-fun b_free!9727 () Bool)

(declare-fun b_next!9727 () Bool)

(assert (=> start!39460 (= b_free!9727 (not b_next!9727))))

(declare-fun tp!34709 () Bool)

(declare-fun b_and!17329 () Bool)

(assert (=> start!39460 (= tp!34709 b_and!17329)))

(declare-fun mapNonEmpty!17940 () Bool)

(declare-fun mapRes!17940 () Bool)

(declare-fun tp!34710 () Bool)

(declare-fun e!250568 () Bool)

(assert (=> mapNonEmpty!17940 (= mapRes!17940 (and tp!34710 e!250568))))

(declare-datatypes ((V!15611 0))(
  ( (V!15612 (val!5484 Int)) )
))
(declare-datatypes ((ValueCell!5096 0))(
  ( (ValueCellFull!5096 (v!7731 V!15611)) (EmptyCell!5096) )
))
(declare-fun mapRest!17940 () (Array (_ BitVec 32) ValueCell!5096))

(declare-datatypes ((array!25607 0))(
  ( (array!25608 (arr!12253 (Array (_ BitVec 32) ValueCell!5096)) (size!12605 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25607)

(declare-fun mapValue!17940 () ValueCell!5096)

(declare-fun mapKey!17940 () (_ BitVec 32))

(assert (=> mapNonEmpty!17940 (= (arr!12253 _values!549) (store mapRest!17940 mapKey!17940 mapValue!17940))))

(declare-fun b!420734 () Bool)

(declare-fun e!250566 () Bool)

(assert (=> b!420734 (= e!250566 true)))

(declare-datatypes ((tuple2!7190 0))(
  ( (tuple2!7191 (_1!3606 (_ BitVec 64)) (_2!3606 V!15611)) )
))
(declare-datatypes ((List!7197 0))(
  ( (Nil!7194) (Cons!7193 (h!8049 tuple2!7190) (t!12589 List!7197)) )
))
(declare-datatypes ((ListLongMap!6103 0))(
  ( (ListLongMap!6104 (toList!3067 List!7197)) )
))
(declare-fun lt!193073 () ListLongMap!6103)

(declare-fun lt!193075 () tuple2!7190)

(declare-fun lt!193069 () V!15611)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1264 (ListLongMap!6103 tuple2!7190) ListLongMap!6103)

(assert (=> b!420734 (= (+!1264 lt!193073 lt!193075) (+!1264 (+!1264 lt!193073 (tuple2!7191 k!794 lt!193069)) lt!193075))))

(declare-fun lt!193071 () V!15611)

(assert (=> b!420734 (= lt!193075 (tuple2!7191 k!794 lt!193071))))

(declare-datatypes ((Unit!12430 0))(
  ( (Unit!12431) )
))
(declare-fun lt!193072 () Unit!12430)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!59 (ListLongMap!6103 (_ BitVec 64) V!15611 V!15611) Unit!12430)

(assert (=> b!420734 (= lt!193072 (addSameAsAddTwiceSameKeyDiffValues!59 lt!193073 k!794 lt!193069 lt!193071))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!193074 () V!15611)

(declare-fun get!6087 (ValueCell!5096 V!15611) V!15611)

(assert (=> b!420734 (= lt!193069 (get!6087 (select (arr!12253 _values!549) from!863) lt!193074))))

(declare-datatypes ((array!25609 0))(
  ( (array!25610 (arr!12254 (Array (_ BitVec 32) (_ BitVec 64))) (size!12606 (_ BitVec 32))) )
))
(declare-fun lt!193078 () array!25609)

(declare-fun lt!193077 () ListLongMap!6103)

(assert (=> b!420734 (= lt!193077 (+!1264 lt!193073 (tuple2!7191 (select (arr!12254 lt!193078) from!863) lt!193071)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15611)

(assert (=> b!420734 (= lt!193071 (get!6087 (select (store (arr!12253 _values!549) i!563 (ValueCellFull!5096 v!412)) from!863) lt!193074))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!730 (Int (_ BitVec 64)) V!15611)

(assert (=> b!420734 (= lt!193074 (dynLambda!730 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15611)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!193076 () array!25607)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15611)

(declare-fun getCurrentListMapNoExtraKeys!1271 (array!25609 array!25607 (_ BitVec 32) (_ BitVec 32) V!15611 V!15611 (_ BitVec 32) Int) ListLongMap!6103)

(assert (=> b!420734 (= lt!193073 (getCurrentListMapNoExtraKeys!1271 lt!193078 lt!193076 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29360 () ListLongMap!6103)

(declare-fun c!55304 () Bool)

(declare-fun bm!29356 () Bool)

(declare-fun _keys!709 () array!25609)

(assert (=> bm!29356 (= call!29360 (getCurrentListMapNoExtraKeys!1271 (ite c!55304 _keys!709 lt!193078) (ite c!55304 _values!549 lt!193076) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420735 () Bool)

(declare-fun res!245453 () Bool)

(declare-fun e!250565 () Bool)

(assert (=> b!420735 (=> (not res!245453) (not e!250565))))

(assert (=> b!420735 (= res!245453 (and (= (size!12605 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12606 _keys!709) (size!12605 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun call!29359 () ListLongMap!6103)

(declare-fun e!250570 () Bool)

(declare-fun b!420736 () Bool)

(assert (=> b!420736 (= e!250570 (= call!29359 (+!1264 call!29360 (tuple2!7191 k!794 v!412))))))

(declare-fun res!245460 () Bool)

(assert (=> start!39460 (=> (not res!245460) (not e!250565))))

(assert (=> start!39460 (= res!245460 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12606 _keys!709))))))

(assert (=> start!39460 e!250565))

(declare-fun tp_is_empty!10879 () Bool)

(assert (=> start!39460 tp_is_empty!10879))

(assert (=> start!39460 tp!34709))

(assert (=> start!39460 true))

(declare-fun e!250571 () Bool)

(declare-fun array_inv!8932 (array!25607) Bool)

(assert (=> start!39460 (and (array_inv!8932 _values!549) e!250571)))

(declare-fun array_inv!8933 (array!25609) Bool)

(assert (=> start!39460 (array_inv!8933 _keys!709)))

(declare-fun b!420737 () Bool)

(assert (=> b!420737 (= e!250570 (= call!29360 call!29359))))

(declare-fun b!420738 () Bool)

(declare-fun res!245462 () Bool)

(assert (=> b!420738 (=> (not res!245462) (not e!250565))))

(declare-fun arrayContainsKey!0 (array!25609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420738 (= res!245462 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun bm!29357 () Bool)

(assert (=> bm!29357 (= call!29359 (getCurrentListMapNoExtraKeys!1271 (ite c!55304 lt!193078 _keys!709) (ite c!55304 lt!193076 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420739 () Bool)

(assert (=> b!420739 (= e!250568 tp_is_empty!10879)))

(declare-fun b!420740 () Bool)

(declare-fun res!245454 () Bool)

(assert (=> b!420740 (=> (not res!245454) (not e!250565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420740 (= res!245454 (validMask!0 mask!1025))))

(declare-fun b!420741 () Bool)

(declare-fun res!245461 () Bool)

(assert (=> b!420741 (=> (not res!245461) (not e!250565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25609 (_ BitVec 32)) Bool)

(assert (=> b!420741 (= res!245461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420742 () Bool)

(declare-fun res!245463 () Bool)

(assert (=> b!420742 (=> (not res!245463) (not e!250565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420742 (= res!245463 (validKeyInArray!0 k!794))))

(declare-fun b!420743 () Bool)

(declare-fun res!245457 () Bool)

(declare-fun e!250569 () Bool)

(assert (=> b!420743 (=> (not res!245457) (not e!250569))))

(declare-datatypes ((List!7198 0))(
  ( (Nil!7195) (Cons!7194 (h!8050 (_ BitVec 64)) (t!12590 List!7198)) )
))
(declare-fun arrayNoDuplicates!0 (array!25609 (_ BitVec 32) List!7198) Bool)

(assert (=> b!420743 (= res!245457 (arrayNoDuplicates!0 lt!193078 #b00000000000000000000000000000000 Nil!7195))))

(declare-fun mapIsEmpty!17940 () Bool)

(assert (=> mapIsEmpty!17940 mapRes!17940))

(declare-fun b!420744 () Bool)

(declare-fun res!245452 () Bool)

(assert (=> b!420744 (=> (not res!245452) (not e!250565))))

(assert (=> b!420744 (= res!245452 (or (= (select (arr!12254 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12254 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420745 () Bool)

(declare-fun res!245455 () Bool)

(assert (=> b!420745 (=> (not res!245455) (not e!250569))))

(assert (=> b!420745 (= res!245455 (bvsle from!863 i!563))))

(declare-fun b!420746 () Bool)

(declare-fun res!245451 () Bool)

(assert (=> b!420746 (=> (not res!245451) (not e!250565))))

(assert (=> b!420746 (= res!245451 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12606 _keys!709))))))

(declare-fun b!420747 () Bool)

(declare-fun res!245459 () Bool)

(assert (=> b!420747 (=> (not res!245459) (not e!250565))))

(assert (=> b!420747 (= res!245459 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7195))))

(declare-fun b!420748 () Bool)

(declare-fun e!250572 () Bool)

(assert (=> b!420748 (= e!250572 (not e!250566))))

(declare-fun res!245456 () Bool)

(assert (=> b!420748 (=> res!245456 e!250566)))

(assert (=> b!420748 (= res!245456 (validKeyInArray!0 (select (arr!12254 _keys!709) from!863)))))

(assert (=> b!420748 e!250570))

(assert (=> b!420748 (= c!55304 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193070 () Unit!12430)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!462 (array!25609 array!25607 (_ BitVec 32) (_ BitVec 32) V!15611 V!15611 (_ BitVec 32) (_ BitVec 64) V!15611 (_ BitVec 32) Int) Unit!12430)

(assert (=> b!420748 (= lt!193070 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!462 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420749 () Bool)

(declare-fun e!250564 () Bool)

(assert (=> b!420749 (= e!250571 (and e!250564 mapRes!17940))))

(declare-fun condMapEmpty!17940 () Bool)

(declare-fun mapDefault!17940 () ValueCell!5096)

