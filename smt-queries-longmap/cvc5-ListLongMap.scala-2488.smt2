; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38746 () Bool)

(assert start!38746)

(declare-fun b_free!9283 () Bool)

(declare-fun b_next!9283 () Bool)

(assert (=> start!38746 (= b_free!9283 (not b_next!9283))))

(declare-fun tp!32973 () Bool)

(declare-fun b_and!16669 () Bool)

(assert (=> start!38746 (= tp!32973 b_and!16669)))

(declare-fun b!403675 () Bool)

(declare-fun res!232671 () Bool)

(declare-fun e!242979 () Bool)

(assert (=> b!403675 (=> (not res!232671) (not e!242979))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24229 0))(
  ( (array!24230 (arr!11564 (Array (_ BitVec 32) (_ BitVec 64))) (size!11916 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24229)

(assert (=> b!403675 (= res!232671 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11916 _keys!709))))))

(declare-fun b!403676 () Bool)

(declare-fun res!232675 () Bool)

(assert (=> b!403676 (=> (not res!232675) (not e!242979))))

(assert (=> b!403676 (= res!232675 (or (= (select (arr!11564 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11564 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!14659 0))(
  ( (V!14660 (val!5127 Int)) )
))
(declare-fun minValue!515 () V!14659)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4739 0))(
  ( (ValueCellFull!4739 (v!7374 V!14659)) (EmptyCell!4739) )
))
(declare-datatypes ((array!24231 0))(
  ( (array!24232 (arr!11565 (Array (_ BitVec 32) ValueCell!4739)) (size!11917 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24231)

(declare-fun lt!188075 () array!24229)

(declare-fun zeroValue!515 () V!14659)

(declare-datatypes ((tuple2!6816 0))(
  ( (tuple2!6817 (_1!3419 (_ BitVec 64)) (_2!3419 V!14659)) )
))
(declare-datatypes ((List!6734 0))(
  ( (Nil!6731) (Cons!6730 (h!7586 tuple2!6816) (t!11908 List!6734)) )
))
(declare-datatypes ((ListLongMap!5729 0))(
  ( (ListLongMap!5730 (toList!2880 List!6734)) )
))
(declare-fun call!28514 () ListLongMap!5729)

(declare-fun c!54881 () Bool)

(declare-fun bm!28510 () Bool)

(declare-fun v!412 () V!14659)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1089 (array!24229 array!24231 (_ BitVec 32) (_ BitVec 32) V!14659 V!14659 (_ BitVec 32) Int) ListLongMap!5729)

(assert (=> bm!28510 (= call!28514 (getCurrentListMapNoExtraKeys!1089 (ite c!54881 _keys!709 lt!188075) (ite c!54881 _values!549 (array!24232 (store (arr!11565 _values!549) i!563 (ValueCellFull!4739 v!412)) (size!11917 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403678 () Bool)

(declare-fun res!232677 () Bool)

(assert (=> b!403678 (=> (not res!232677) (not e!242979))))

(declare-datatypes ((List!6735 0))(
  ( (Nil!6732) (Cons!6731 (h!7587 (_ BitVec 64)) (t!11909 List!6735)) )
))
(declare-fun arrayNoDuplicates!0 (array!24229 (_ BitVec 32) List!6735) Bool)

(assert (=> b!403678 (= res!232677 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6732))))

(declare-fun b!403679 () Bool)

(declare-fun res!232672 () Bool)

(assert (=> b!403679 (=> (not res!232672) (not e!242979))))

(assert (=> b!403679 (= res!232672 (and (= (size!11917 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11916 _keys!709) (size!11917 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403680 () Bool)

(declare-fun e!242973 () Bool)

(declare-fun call!28513 () ListLongMap!5729)

(assert (=> b!403680 (= e!242973 (= call!28514 call!28513))))

(declare-fun mapNonEmpty!16869 () Bool)

(declare-fun mapRes!16869 () Bool)

(declare-fun tp!32972 () Bool)

(declare-fun e!242975 () Bool)

(assert (=> mapNonEmpty!16869 (= mapRes!16869 (and tp!32972 e!242975))))

(declare-fun mapValue!16869 () ValueCell!4739)

(declare-fun mapRest!16869 () (Array (_ BitVec 32) ValueCell!4739))

(declare-fun mapKey!16869 () (_ BitVec 32))

(assert (=> mapNonEmpty!16869 (= (arr!11565 _values!549) (store mapRest!16869 mapKey!16869 mapValue!16869))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun b!403681 () Bool)

(declare-fun +!1154 (ListLongMap!5729 tuple2!6816) ListLongMap!5729)

(assert (=> b!403681 (= e!242973 (= call!28513 (+!1154 call!28514 (tuple2!6817 k!794 v!412))))))

(declare-fun b!403682 () Bool)

(declare-fun res!232676 () Bool)

(assert (=> b!403682 (=> (not res!232676) (not e!242979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403682 (= res!232676 (validMask!0 mask!1025))))

(declare-fun b!403683 () Bool)

(declare-fun e!242974 () Bool)

(assert (=> b!403683 (= e!242974 (not true))))

(assert (=> b!403683 e!242973))

(assert (=> b!403683 (= c!54881 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12210 0))(
  ( (Unit!12211) )
))
(declare-fun lt!188074 () Unit!12210)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!363 (array!24229 array!24231 (_ BitVec 32) (_ BitVec 32) V!14659 V!14659 (_ BitVec 32) (_ BitVec 64) V!14659 (_ BitVec 32) Int) Unit!12210)

(assert (=> b!403683 (= lt!188074 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!363 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28511 () Bool)

(assert (=> bm!28511 (= call!28513 (getCurrentListMapNoExtraKeys!1089 (ite c!54881 lt!188075 _keys!709) (ite c!54881 (array!24232 (store (arr!11565 _values!549) i!563 (ValueCellFull!4739 v!412)) (size!11917 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403684 () Bool)

(declare-fun tp_is_empty!10165 () Bool)

(assert (=> b!403684 (= e!242975 tp_is_empty!10165)))

(declare-fun b!403685 () Bool)

(declare-fun res!232669 () Bool)

(assert (=> b!403685 (=> (not res!232669) (not e!242979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24229 (_ BitVec 32)) Bool)

(assert (=> b!403685 (= res!232669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403677 () Bool)

(declare-fun res!232670 () Bool)

(assert (=> b!403677 (=> (not res!232670) (not e!242979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403677 (= res!232670 (validKeyInArray!0 k!794))))

(declare-fun res!232674 () Bool)

(assert (=> start!38746 (=> (not res!232674) (not e!242979))))

(assert (=> start!38746 (= res!232674 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11916 _keys!709))))))

(assert (=> start!38746 e!242979))

(assert (=> start!38746 tp_is_empty!10165))

(assert (=> start!38746 tp!32973))

(assert (=> start!38746 true))

(declare-fun e!242978 () Bool)

(declare-fun array_inv!8460 (array!24231) Bool)

(assert (=> start!38746 (and (array_inv!8460 _values!549) e!242978)))

(declare-fun array_inv!8461 (array!24229) Bool)

(assert (=> start!38746 (array_inv!8461 _keys!709)))

(declare-fun b!403686 () Bool)

(declare-fun e!242977 () Bool)

(assert (=> b!403686 (= e!242978 (and e!242977 mapRes!16869))))

(declare-fun condMapEmpty!16869 () Bool)

(declare-fun mapDefault!16869 () ValueCell!4739)

