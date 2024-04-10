; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38588 () Bool)

(assert start!38588)

(declare-fun b_free!9125 () Bool)

(declare-fun b_next!9125 () Bool)

(assert (=> start!38588 (= b_free!9125 (not b_next!9125))))

(declare-fun tp!32499 () Bool)

(declare-fun b_and!16511 () Bool)

(assert (=> start!38588 (= tp!32499 b_and!16511)))

(declare-fun mapIsEmpty!16632 () Bool)

(declare-fun mapRes!16632 () Bool)

(assert (=> mapIsEmpty!16632 mapRes!16632))

(declare-fun b!399646 () Bool)

(declare-fun res!229822 () Bool)

(declare-fun e!241319 () Bool)

(assert (=> b!399646 (=> (not res!229822) (not e!241319))))

(declare-datatypes ((array!23925 0))(
  ( (array!23926 (arr!11412 (Array (_ BitVec 32) (_ BitVec 64))) (size!11764 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23925)

(declare-datatypes ((List!6610 0))(
  ( (Nil!6607) (Cons!6606 (h!7462 (_ BitVec 64)) (t!11784 List!6610)) )
))
(declare-fun arrayNoDuplicates!0 (array!23925 (_ BitVec 32) List!6610) Bool)

(assert (=> b!399646 (= res!229822 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6607))))

(declare-fun b!399647 () Bool)

(declare-fun res!229830 () Bool)

(assert (=> b!399647 (=> (not res!229830) (not e!241319))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399647 (= res!229830 (validKeyInArray!0 k!794))))

(declare-fun b!399649 () Bool)

(declare-fun e!241320 () Bool)

(declare-fun tp_is_empty!10007 () Bool)

(assert (=> b!399649 (= e!241320 tp_is_empty!10007)))

(declare-fun b!399650 () Bool)

(declare-fun res!229827 () Bool)

(assert (=> b!399650 (=> (not res!229827) (not e!241319))))

(declare-fun arrayContainsKey!0 (array!23925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399650 (= res!229827 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16632 () Bool)

(declare-fun tp!32498 () Bool)

(assert (=> mapNonEmpty!16632 (= mapRes!16632 (and tp!32498 e!241320))))

(declare-datatypes ((V!14447 0))(
  ( (V!14448 (val!5048 Int)) )
))
(declare-datatypes ((ValueCell!4660 0))(
  ( (ValueCellFull!4660 (v!7295 V!14447)) (EmptyCell!4660) )
))
(declare-datatypes ((array!23927 0))(
  ( (array!23928 (arr!11413 (Array (_ BitVec 32) ValueCell!4660)) (size!11765 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23927)

(declare-fun mapRest!16632 () (Array (_ BitVec 32) ValueCell!4660))

(declare-fun mapValue!16632 () ValueCell!4660)

(declare-fun mapKey!16632 () (_ BitVec 32))

(assert (=> mapNonEmpty!16632 (= (arr!11413 _values!549) (store mapRest!16632 mapKey!16632 mapValue!16632))))

(declare-fun minValue!515 () V!14447)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!187600 () array!23925)

(declare-fun bm!28036 () Bool)

(declare-fun v!412 () V!14447)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!54644 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6684 0))(
  ( (tuple2!6685 (_1!3353 (_ BitVec 64)) (_2!3353 V!14447)) )
))
(declare-datatypes ((List!6611 0))(
  ( (Nil!6608) (Cons!6607 (h!7463 tuple2!6684) (t!11785 List!6611)) )
))
(declare-datatypes ((ListLongMap!5597 0))(
  ( (ListLongMap!5598 (toList!2814 List!6611)) )
))
(declare-fun call!28040 () ListLongMap!5597)

(declare-fun zeroValue!515 () V!14447)

(declare-fun getCurrentListMapNoExtraKeys!1031 (array!23925 array!23927 (_ BitVec 32) (_ BitVec 32) V!14447 V!14447 (_ BitVec 32) Int) ListLongMap!5597)

(assert (=> bm!28036 (= call!28040 (getCurrentListMapNoExtraKeys!1031 (ite c!54644 lt!187600 _keys!709) (ite c!54644 (array!23928 (store (arr!11413 _values!549) i!563 (ValueCellFull!4660 v!412)) (size!11765 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399651 () Bool)

(declare-fun res!229828 () Bool)

(declare-fun e!241317 () Bool)

(assert (=> b!399651 (=> (not res!229828) (not e!241317))))

(assert (=> b!399651 (= res!229828 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11764 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399652 () Bool)

(declare-fun e!241314 () Bool)

(declare-fun call!28039 () ListLongMap!5597)

(assert (=> b!399652 (= e!241314 (= call!28039 call!28040))))

(declare-fun b!399653 () Bool)

(declare-fun res!229825 () Bool)

(assert (=> b!399653 (=> (not res!229825) (not e!241319))))

(assert (=> b!399653 (= res!229825 (or (= (select (arr!11412 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11412 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28037 () Bool)

(assert (=> bm!28037 (= call!28039 (getCurrentListMapNoExtraKeys!1031 (ite c!54644 _keys!709 lt!187600) (ite c!54644 _values!549 (array!23928 (store (arr!11413 _values!549) i!563 (ValueCellFull!4660 v!412)) (size!11765 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399654 () Bool)

(declare-fun res!229829 () Bool)

(assert (=> b!399654 (=> (not res!229829) (not e!241319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399654 (= res!229829 (validMask!0 mask!1025))))

(declare-fun b!399655 () Bool)

(declare-fun res!229823 () Bool)

(assert (=> b!399655 (=> (not res!229823) (not e!241319))))

(assert (=> b!399655 (= res!229823 (and (= (size!11765 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11764 _keys!709) (size!11765 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399656 () Bool)

(declare-fun res!229826 () Bool)

(assert (=> b!399656 (=> (not res!229826) (not e!241319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23925 (_ BitVec 32)) Bool)

(assert (=> b!399656 (= res!229826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399648 () Bool)

(assert (=> b!399648 (= e!241319 e!241317)))

(declare-fun res!229824 () Bool)

(assert (=> b!399648 (=> (not res!229824) (not e!241317))))

(assert (=> b!399648 (= res!229824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187600 mask!1025))))

(assert (=> b!399648 (= lt!187600 (array!23926 (store (arr!11412 _keys!709) i!563 k!794) (size!11764 _keys!709)))))

(declare-fun res!229832 () Bool)

(assert (=> start!38588 (=> (not res!229832) (not e!241319))))

(assert (=> start!38588 (= res!229832 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11764 _keys!709))))))

(assert (=> start!38588 e!241319))

(assert (=> start!38588 tp_is_empty!10007))

(assert (=> start!38588 tp!32499))

(assert (=> start!38588 true))

(declare-fun e!241316 () Bool)

(declare-fun array_inv!8360 (array!23927) Bool)

(assert (=> start!38588 (and (array_inv!8360 _values!549) e!241316)))

(declare-fun array_inv!8361 (array!23925) Bool)

(assert (=> start!38588 (array_inv!8361 _keys!709)))

(declare-fun b!399657 () Bool)

(declare-fun res!229833 () Bool)

(assert (=> b!399657 (=> (not res!229833) (not e!241319))))

(assert (=> b!399657 (= res!229833 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11764 _keys!709))))))

(declare-fun b!399658 () Bool)

(declare-fun e!241315 () Bool)

(assert (=> b!399658 (= e!241315 tp_is_empty!10007)))

(declare-fun b!399659 () Bool)

(assert (=> b!399659 (= e!241317 (not true))))

(assert (=> b!399659 e!241314))

(assert (=> b!399659 (= c!54644 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12112 0))(
  ( (Unit!12113) )
))
(declare-fun lt!187601 () Unit!12112)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!314 (array!23925 array!23927 (_ BitVec 32) (_ BitVec 32) V!14447 V!14447 (_ BitVec 32) (_ BitVec 64) V!14447 (_ BitVec 32) Int) Unit!12112)

(assert (=> b!399659 (= lt!187601 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!314 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399660 () Bool)

(declare-fun +!1102 (ListLongMap!5597 tuple2!6684) ListLongMap!5597)

(assert (=> b!399660 (= e!241314 (= call!28040 (+!1102 call!28039 (tuple2!6685 k!794 v!412))))))

(declare-fun b!399661 () Bool)

(declare-fun res!229831 () Bool)

(assert (=> b!399661 (=> (not res!229831) (not e!241317))))

(assert (=> b!399661 (= res!229831 (arrayNoDuplicates!0 lt!187600 #b00000000000000000000000000000000 Nil!6607))))

(declare-fun b!399662 () Bool)

(assert (=> b!399662 (= e!241316 (and e!241315 mapRes!16632))))

(declare-fun condMapEmpty!16632 () Bool)

(declare-fun mapDefault!16632 () ValueCell!4660)

