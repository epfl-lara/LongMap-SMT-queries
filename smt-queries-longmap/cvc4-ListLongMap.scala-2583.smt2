; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39320 () Bool)

(assert start!39320)

(declare-fun b_free!9587 () Bool)

(declare-fun b_next!9587 () Bool)

(assert (=> start!39320 (= b_free!9587 (not b_next!9587))))

(declare-fun tp!34290 () Bool)

(declare-fun b_and!17049 () Bool)

(assert (=> start!39320 (= tp!34290 b_and!17049)))

(declare-fun mapNonEmpty!17730 () Bool)

(declare-fun mapRes!17730 () Bool)

(declare-fun tp!34289 () Bool)

(declare-fun e!248674 () Bool)

(assert (=> mapNonEmpty!17730 (= mapRes!17730 (and tp!34289 e!248674))))

(declare-fun mapKey!17730 () (_ BitVec 32))

(declare-datatypes ((V!15423 0))(
  ( (V!15424 (val!5414 Int)) )
))
(declare-datatypes ((ValueCell!5026 0))(
  ( (ValueCellFull!5026 (v!7661 V!15423)) (EmptyCell!5026) )
))
(declare-datatypes ((array!25333 0))(
  ( (array!25334 (arr!12116 (Array (_ BitVec 32) ValueCell!5026)) (size!12468 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25333)

(declare-fun mapRest!17730 () (Array (_ BitVec 32) ValueCell!5026))

(declare-fun mapValue!17730 () ValueCell!5026)

(assert (=> mapNonEmpty!17730 (= (arr!12116 _values!549) (store mapRest!17730 mapKey!17730 mapValue!17730))))

(declare-fun b!416604 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!7062 0))(
  ( (tuple2!7063 (_1!3542 (_ BitVec 64)) (_2!3542 V!15423)) )
))
(declare-datatypes ((List!7080 0))(
  ( (Nil!7077) (Cons!7076 (h!7932 tuple2!7062) (t!12332 List!7080)) )
))
(declare-datatypes ((ListLongMap!5975 0))(
  ( (ListLongMap!5976 (toList!3003 List!7080)) )
))
(declare-fun call!28940 () ListLongMap!5975)

(declare-fun call!28939 () ListLongMap!5975)

(declare-fun e!248677 () Bool)

(declare-fun v!412 () V!15423)

(declare-fun +!1205 (ListLongMap!5975 tuple2!7062) ListLongMap!5975)

(assert (=> b!416604 (= e!248677 (= call!28939 (+!1205 call!28940 (tuple2!7063 k!794 v!412))))))

(declare-fun b!416605 () Bool)

(declare-fun res!242521 () Bool)

(declare-fun e!248675 () Bool)

(assert (=> b!416605 (=> (not res!242521) (not e!248675))))

(declare-datatypes ((array!25335 0))(
  ( (array!25336 (arr!12117 (Array (_ BitVec 32) (_ BitVec 64))) (size!12469 (_ BitVec 32))) )
))
(declare-fun lt!190766 () array!25335)

(declare-datatypes ((List!7081 0))(
  ( (Nil!7078) (Cons!7077 (h!7933 (_ BitVec 64)) (t!12333 List!7081)) )
))
(declare-fun arrayNoDuplicates!0 (array!25335 (_ BitVec 32) List!7081) Bool)

(assert (=> b!416605 (= res!242521 (arrayNoDuplicates!0 lt!190766 #b00000000000000000000000000000000 Nil!7078))))

(declare-fun b!416606 () Bool)

(declare-fun tp_is_empty!10739 () Bool)

(assert (=> b!416606 (= e!248674 tp_is_empty!10739)))

(declare-fun b!416607 () Bool)

(declare-fun e!248678 () Bool)

(declare-fun e!248681 () Bool)

(assert (=> b!416607 (= e!248678 (not e!248681))))

(declare-fun res!242511 () Bool)

(assert (=> b!416607 (=> res!242511 e!248681)))

(declare-fun _keys!709 () array!25335)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416607 (= res!242511 (validKeyInArray!0 (select (arr!12117 _keys!709) from!863)))))

(assert (=> b!416607 e!248677))

(declare-fun c!55094 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416607 (= c!55094 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15423)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15423)

(declare-datatypes ((Unit!12314 0))(
  ( (Unit!12315) )
))
(declare-fun lt!190769 () Unit!12314)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!413 (array!25335 array!25333 (_ BitVec 32) (_ BitVec 32) V!15423 V!15423 (_ BitVec 32) (_ BitVec 64) V!15423 (_ BitVec 32) Int) Unit!12314)

(assert (=> b!416607 (= lt!190769 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!413 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416608 () Bool)

(declare-fun res!242518 () Bool)

(declare-fun e!248679 () Bool)

(assert (=> b!416608 (=> (not res!242518) (not e!248679))))

(assert (=> b!416608 (= res!242518 (and (= (size!12468 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12469 _keys!709) (size!12468 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17730 () Bool)

(assert (=> mapIsEmpty!17730 mapRes!17730))

(declare-fun b!416609 () Bool)

(assert (=> b!416609 (= e!248675 e!248678)))

(declare-fun res!242523 () Bool)

(assert (=> b!416609 (=> (not res!242523) (not e!248678))))

(assert (=> b!416609 (= res!242523 (= from!863 i!563))))

(declare-fun lt!190763 () array!25333)

(declare-fun lt!190760 () ListLongMap!5975)

(declare-fun getCurrentListMapNoExtraKeys!1208 (array!25335 array!25333 (_ BitVec 32) (_ BitVec 32) V!15423 V!15423 (_ BitVec 32) Int) ListLongMap!5975)

(assert (=> b!416609 (= lt!190760 (getCurrentListMapNoExtraKeys!1208 lt!190766 lt!190763 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416609 (= lt!190763 (array!25334 (store (arr!12116 _values!549) i!563 (ValueCellFull!5026 v!412)) (size!12468 _values!549)))))

(declare-fun lt!190767 () ListLongMap!5975)

(assert (=> b!416609 (= lt!190767 (getCurrentListMapNoExtraKeys!1208 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416610 () Bool)

(assert (=> b!416610 (= e!248677 (= call!28940 call!28939))))

(declare-fun b!416611 () Bool)

(declare-fun res!242513 () Bool)

(assert (=> b!416611 (=> (not res!242513) (not e!248679))))

(assert (=> b!416611 (= res!242513 (validKeyInArray!0 k!794))))

(declare-fun b!416612 () Bool)

(declare-fun res!242520 () Bool)

(assert (=> b!416612 (=> (not res!242520) (not e!248679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25335 (_ BitVec 32)) Bool)

(assert (=> b!416612 (= res!242520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416613 () Bool)

(declare-fun res!242516 () Bool)

(assert (=> b!416613 (=> (not res!242516) (not e!248675))))

(assert (=> b!416613 (= res!242516 (bvsle from!863 i!563))))

(declare-fun b!416614 () Bool)

(declare-fun res!242512 () Bool)

(assert (=> b!416614 (=> (not res!242512) (not e!248679))))

(declare-fun arrayContainsKey!0 (array!25335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416614 (= res!242512 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!242514 () Bool)

(assert (=> start!39320 (=> (not res!242514) (not e!248679))))

(assert (=> start!39320 (= res!242514 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12469 _keys!709))))))

(assert (=> start!39320 e!248679))

(assert (=> start!39320 tp_is_empty!10739))

(assert (=> start!39320 tp!34290))

(assert (=> start!39320 true))

(declare-fun e!248682 () Bool)

(declare-fun array_inv!8836 (array!25333) Bool)

(assert (=> start!39320 (and (array_inv!8836 _values!549) e!248682)))

(declare-fun array_inv!8837 (array!25335) Bool)

(assert (=> start!39320 (array_inv!8837 _keys!709)))

(declare-fun b!416615 () Bool)

(declare-fun e!248676 () Bool)

(assert (=> b!416615 (= e!248676 tp_is_empty!10739)))

(declare-fun b!416616 () Bool)

(declare-fun res!242510 () Bool)

(assert (=> b!416616 (=> (not res!242510) (not e!248679))))

(assert (=> b!416616 (= res!242510 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12469 _keys!709))))))

(declare-fun b!416617 () Bool)

(assert (=> b!416617 (= e!248681 true)))

(declare-fun lt!190768 () V!15423)

(declare-fun lt!190762 () tuple2!7062)

(declare-fun lt!190759 () ListLongMap!5975)

(assert (=> b!416617 (= (+!1205 lt!190759 lt!190762) (+!1205 (+!1205 lt!190759 (tuple2!7063 k!794 lt!190768)) lt!190762))))

(declare-fun lt!190761 () V!15423)

(assert (=> b!416617 (= lt!190762 (tuple2!7063 k!794 lt!190761))))

(declare-fun lt!190764 () Unit!12314)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!9 (ListLongMap!5975 (_ BitVec 64) V!15423 V!15423) Unit!12314)

(assert (=> b!416617 (= lt!190764 (addSameAsAddTwiceSameKeyDiffValues!9 lt!190759 k!794 lt!190768 lt!190761))))

(declare-fun lt!190765 () V!15423)

(declare-fun get!5989 (ValueCell!5026 V!15423) V!15423)

(assert (=> b!416617 (= lt!190768 (get!5989 (select (arr!12116 _values!549) from!863) lt!190765))))

(assert (=> b!416617 (= lt!190760 (+!1205 lt!190759 (tuple2!7063 (select (arr!12117 lt!190766) from!863) lt!190761)))))

(assert (=> b!416617 (= lt!190761 (get!5989 (select (store (arr!12116 _values!549) i!563 (ValueCellFull!5026 v!412)) from!863) lt!190765))))

(declare-fun dynLambda!680 (Int (_ BitVec 64)) V!15423)

(assert (=> b!416617 (= lt!190765 (dynLambda!680 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416617 (= lt!190759 (getCurrentListMapNoExtraKeys!1208 lt!190766 lt!190763 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416618 () Bool)

(assert (=> b!416618 (= e!248682 (and e!248676 mapRes!17730))))

(declare-fun condMapEmpty!17730 () Bool)

(declare-fun mapDefault!17730 () ValueCell!5026)

