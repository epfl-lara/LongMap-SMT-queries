; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38732 () Bool)

(assert start!38732)

(declare-fun b_free!9283 () Bool)

(declare-fun b_next!9283 () Bool)

(assert (=> start!38732 (= b_free!9283 (not b_next!9283))))

(declare-fun tp!32972 () Bool)

(declare-fun b_and!16683 () Bool)

(assert (=> start!38732 (= tp!32972 b_and!16683)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((V!14659 0))(
  ( (V!14660 (val!5127 Int)) )
))
(declare-datatypes ((tuple2!6690 0))(
  ( (tuple2!6691 (_1!3356 (_ BitVec 64)) (_2!3356 V!14659)) )
))
(declare-datatypes ((List!6609 0))(
  ( (Nil!6606) (Cons!6605 (h!7461 tuple2!6690) (t!11775 List!6609)) )
))
(declare-datatypes ((ListLongMap!5605 0))(
  ( (ListLongMap!5606 (toList!2818 List!6609)) )
))
(declare-fun call!28501 () ListLongMap!5605)

(declare-fun e!242946 () Bool)

(declare-fun v!412 () V!14659)

(declare-fun call!28500 () ListLongMap!5605)

(declare-fun b!403626 () Bool)

(declare-fun +!1155 (ListLongMap!5605 tuple2!6690) ListLongMap!5605)

(assert (=> b!403626 (= e!242946 (= call!28501 (+!1155 call!28500 (tuple2!6691 k0!794 v!412))))))

(declare-fun b!403627 () Bool)

(declare-fun e!242942 () Bool)

(declare-fun tp_is_empty!10165 () Bool)

(assert (=> b!403627 (= e!242942 tp_is_empty!10165)))

(declare-fun b!403628 () Bool)

(declare-fun e!242943 () Bool)

(assert (=> b!403628 (= e!242943 (not true))))

(assert (=> b!403628 e!242946))

(declare-fun c!54858 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403628 (= c!54858 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14659)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4739 0))(
  ( (ValueCellFull!4739 (v!7375 V!14659)) (EmptyCell!4739) )
))
(declare-datatypes ((array!24214 0))(
  ( (array!24215 (arr!11556 (Array (_ BitVec 32) ValueCell!4739)) (size!11908 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24214)

(declare-fun zeroValue!515 () V!14659)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24216 0))(
  ( (array!24217 (arr!11557 (Array (_ BitVec 32) (_ BitVec 64))) (size!11909 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24216)

(declare-datatypes ((Unit!12201 0))(
  ( (Unit!12202) )
))
(declare-fun lt!188093 () Unit!12201)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!368 (array!24216 array!24214 (_ BitVec 32) (_ BitVec 32) V!14659 V!14659 (_ BitVec 32) (_ BitVec 64) V!14659 (_ BitVec 32) Int) Unit!12201)

(assert (=> b!403628 (= lt!188093 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!368 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16869 () Bool)

(declare-fun mapRes!16869 () Bool)

(assert (=> mapIsEmpty!16869 mapRes!16869))

(declare-fun b!403629 () Bool)

(assert (=> b!403629 (= e!242946 (= call!28500 call!28501))))

(declare-fun b!403630 () Bool)

(declare-fun res!232669 () Bool)

(declare-fun e!242944 () Bool)

(assert (=> b!403630 (=> (not res!232669) (not e!242944))))

(declare-fun arrayContainsKey!0 (array!24216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403630 (= res!232669 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403631 () Bool)

(declare-fun res!232674 () Bool)

(assert (=> b!403631 (=> (not res!232674) (not e!242943))))

(assert (=> b!403631 (= res!232674 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11909 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403632 () Bool)

(declare-fun e!242941 () Bool)

(declare-fun e!242945 () Bool)

(assert (=> b!403632 (= e!242941 (and e!242945 mapRes!16869))))

(declare-fun condMapEmpty!16869 () Bool)

(declare-fun mapDefault!16869 () ValueCell!4739)

(assert (=> b!403632 (= condMapEmpty!16869 (= (arr!11556 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4739)) mapDefault!16869)))))

(declare-fun b!403633 () Bool)

(declare-fun res!232671 () Bool)

(assert (=> b!403633 (=> (not res!232671) (not e!242944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403633 (= res!232671 (validKeyInArray!0 k0!794))))

(declare-fun res!232664 () Bool)

(assert (=> start!38732 (=> (not res!232664) (not e!242944))))

(assert (=> start!38732 (= res!232664 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11909 _keys!709))))))

(assert (=> start!38732 e!242944))

(assert (=> start!38732 tp_is_empty!10165))

(assert (=> start!38732 tp!32972))

(assert (=> start!38732 true))

(declare-fun array_inv!8536 (array!24214) Bool)

(assert (=> start!38732 (and (array_inv!8536 _values!549) e!242941)))

(declare-fun array_inv!8537 (array!24216) Bool)

(assert (=> start!38732 (array_inv!8537 _keys!709)))

(declare-fun mapNonEmpty!16869 () Bool)

(declare-fun tp!32973 () Bool)

(assert (=> mapNonEmpty!16869 (= mapRes!16869 (and tp!32973 e!242942))))

(declare-fun mapValue!16869 () ValueCell!4739)

(declare-fun mapRest!16869 () (Array (_ BitVec 32) ValueCell!4739))

(declare-fun mapKey!16869 () (_ BitVec 32))

(assert (=> mapNonEmpty!16869 (= (arr!11556 _values!549) (store mapRest!16869 mapKey!16869 mapValue!16869))))

(declare-fun b!403634 () Bool)

(declare-fun res!232663 () Bool)

(assert (=> b!403634 (=> (not res!232663) (not e!242944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403634 (= res!232663 (validMask!0 mask!1025))))

(declare-fun b!403635 () Bool)

(declare-fun res!232668 () Bool)

(assert (=> b!403635 (=> (not res!232668) (not e!242944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24216 (_ BitVec 32)) Bool)

(assert (=> b!403635 (= res!232668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403636 () Bool)

(declare-fun res!232670 () Bool)

(assert (=> b!403636 (=> (not res!232670) (not e!242943))))

(declare-fun lt!188094 () array!24216)

(declare-datatypes ((List!6610 0))(
  ( (Nil!6607) (Cons!6606 (h!7462 (_ BitVec 64)) (t!11776 List!6610)) )
))
(declare-fun arrayNoDuplicates!0 (array!24216 (_ BitVec 32) List!6610) Bool)

(assert (=> b!403636 (= res!232670 (arrayNoDuplicates!0 lt!188094 #b00000000000000000000000000000000 Nil!6607))))

(declare-fun b!403637 () Bool)

(assert (=> b!403637 (= e!242945 tp_is_empty!10165)))

(declare-fun b!403638 () Bool)

(declare-fun res!232665 () Bool)

(assert (=> b!403638 (=> (not res!232665) (not e!242944))))

(assert (=> b!403638 (= res!232665 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11909 _keys!709))))))

(declare-fun b!403639 () Bool)

(declare-fun res!232673 () Bool)

(assert (=> b!403639 (=> (not res!232673) (not e!242944))))

(assert (=> b!403639 (= res!232673 (and (= (size!11908 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11909 _keys!709) (size!11908 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28497 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1071 (array!24216 array!24214 (_ BitVec 32) (_ BitVec 32) V!14659 V!14659 (_ BitVec 32) Int) ListLongMap!5605)

(assert (=> bm!28497 (= call!28500 (getCurrentListMapNoExtraKeys!1071 (ite c!54858 _keys!709 lt!188094) (ite c!54858 _values!549 (array!24215 (store (arr!11556 _values!549) i!563 (ValueCellFull!4739 v!412)) (size!11908 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403640 () Bool)

(declare-fun res!232672 () Bool)

(assert (=> b!403640 (=> (not res!232672) (not e!242944))))

(assert (=> b!403640 (= res!232672 (or (= (select (arr!11557 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11557 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403641 () Bool)

(declare-fun res!232667 () Bool)

(assert (=> b!403641 (=> (not res!232667) (not e!242944))))

(assert (=> b!403641 (= res!232667 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6607))))

(declare-fun bm!28498 () Bool)

(assert (=> bm!28498 (= call!28501 (getCurrentListMapNoExtraKeys!1071 (ite c!54858 lt!188094 _keys!709) (ite c!54858 (array!24215 (store (arr!11556 _values!549) i!563 (ValueCellFull!4739 v!412)) (size!11908 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403642 () Bool)

(assert (=> b!403642 (= e!242944 e!242943)))

(declare-fun res!232666 () Bool)

(assert (=> b!403642 (=> (not res!232666) (not e!242943))))

(assert (=> b!403642 (= res!232666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188094 mask!1025))))

(assert (=> b!403642 (= lt!188094 (array!24217 (store (arr!11557 _keys!709) i!563 k0!794) (size!11909 _keys!709)))))

(assert (= (and start!38732 res!232664) b!403634))

(assert (= (and b!403634 res!232663) b!403639))

(assert (= (and b!403639 res!232673) b!403635))

(assert (= (and b!403635 res!232668) b!403641))

(assert (= (and b!403641 res!232667) b!403638))

(assert (= (and b!403638 res!232665) b!403633))

(assert (= (and b!403633 res!232671) b!403640))

(assert (= (and b!403640 res!232672) b!403630))

(assert (= (and b!403630 res!232669) b!403642))

(assert (= (and b!403642 res!232666) b!403636))

(assert (= (and b!403636 res!232670) b!403631))

(assert (= (and b!403631 res!232674) b!403628))

(assert (= (and b!403628 c!54858) b!403626))

(assert (= (and b!403628 (not c!54858)) b!403629))

(assert (= (or b!403626 b!403629) bm!28498))

(assert (= (or b!403626 b!403629) bm!28497))

(assert (= (and b!403632 condMapEmpty!16869) mapIsEmpty!16869))

(assert (= (and b!403632 (not condMapEmpty!16869)) mapNonEmpty!16869))

(get-info :version)

(assert (= (and mapNonEmpty!16869 ((_ is ValueCellFull!4739) mapValue!16869)) b!403627))

(assert (= (and b!403632 ((_ is ValueCellFull!4739) mapDefault!16869)) b!403637))

(assert (= start!38732 b!403632))

(declare-fun m!397017 () Bool)

(assert (=> b!403634 m!397017))

(declare-fun m!397019 () Bool)

(assert (=> b!403630 m!397019))

(declare-fun m!397021 () Bool)

(assert (=> b!403628 m!397021))

(declare-fun m!397023 () Bool)

(assert (=> bm!28497 m!397023))

(declare-fun m!397025 () Bool)

(assert (=> bm!28497 m!397025))

(assert (=> bm!28498 m!397023))

(declare-fun m!397027 () Bool)

(assert (=> bm!28498 m!397027))

(declare-fun m!397029 () Bool)

(assert (=> b!403635 m!397029))

(declare-fun m!397031 () Bool)

(assert (=> b!403641 m!397031))

(declare-fun m!397033 () Bool)

(assert (=> start!38732 m!397033))

(declare-fun m!397035 () Bool)

(assert (=> start!38732 m!397035))

(declare-fun m!397037 () Bool)

(assert (=> b!403626 m!397037))

(declare-fun m!397039 () Bool)

(assert (=> b!403640 m!397039))

(declare-fun m!397041 () Bool)

(assert (=> b!403633 m!397041))

(declare-fun m!397043 () Bool)

(assert (=> b!403636 m!397043))

(declare-fun m!397045 () Bool)

(assert (=> mapNonEmpty!16869 m!397045))

(declare-fun m!397047 () Bool)

(assert (=> b!403642 m!397047))

(declare-fun m!397049 () Bool)

(assert (=> b!403642 m!397049))

(check-sat (not b!403642) (not b!403636) (not b!403626) tp_is_empty!10165 (not b!403630) b_and!16683 (not start!38732) (not b!403634) (not bm!28497) (not b!403635) (not b!403641) (not b!403628) (not b!403633) (not bm!28498) (not b_next!9283) (not mapNonEmpty!16869))
(check-sat b_and!16683 (not b_next!9283))
