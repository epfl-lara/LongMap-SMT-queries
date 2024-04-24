; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38612 () Bool)

(assert start!38612)

(declare-fun b_free!9163 () Bool)

(declare-fun b_next!9163 () Bool)

(assert (=> start!38612 (= b_free!9163 (not b_next!9163))))

(declare-fun tp!32612 () Bool)

(declare-fun b_and!16563 () Bool)

(assert (=> start!38612 (= tp!32612 b_and!16563)))

(declare-fun b!400566 () Bool)

(declare-fun e!241683 () Bool)

(declare-fun e!241687 () Bool)

(assert (=> b!400566 (= e!241683 e!241687)))

(declare-fun res!230513 () Bool)

(assert (=> b!400566 (=> (not res!230513) (not e!241687))))

(declare-datatypes ((array!23976 0))(
  ( (array!23977 (arr!11437 (Array (_ BitVec 32) (_ BitVec 64))) (size!11789 (_ BitVec 32))) )
))
(declare-fun lt!187733 () array!23976)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23976 (_ BitVec 32)) Bool)

(assert (=> b!400566 (= res!230513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187733 mask!1025))))

(declare-fun _keys!709 () array!23976)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400566 (= lt!187733 (array!23977 (store (arr!11437 _keys!709) i!563 k0!794) (size!11789 _keys!709)))))

(declare-fun b!400567 () Bool)

(declare-fun res!230508 () Bool)

(assert (=> b!400567 (=> (not res!230508) (not e!241687))))

(declare-datatypes ((List!6502 0))(
  ( (Nil!6499) (Cons!6498 (h!7354 (_ BitVec 64)) (t!11668 List!6502)) )
))
(declare-fun arrayNoDuplicates!0 (array!23976 (_ BitVec 32) List!6502) Bool)

(assert (=> b!400567 (= res!230508 (arrayNoDuplicates!0 lt!187733 #b00000000000000000000000000000000 Nil!6499))))

(declare-fun b!400568 () Bool)

(declare-fun res!230505 () Bool)

(assert (=> b!400568 (=> (not res!230505) (not e!241683))))

(assert (=> b!400568 (= res!230505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400569 () Bool)

(declare-fun res!230511 () Bool)

(assert (=> b!400569 (=> (not res!230511) (not e!241683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400569 (= res!230511 (validMask!0 mask!1025))))

(declare-fun b!400570 () Bool)

(declare-fun res!230509 () Bool)

(assert (=> b!400570 (=> (not res!230509) (not e!241683))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14499 0))(
  ( (V!14500 (val!5067 Int)) )
))
(declare-datatypes ((ValueCell!4679 0))(
  ( (ValueCellFull!4679 (v!7315 V!14499)) (EmptyCell!4679) )
))
(declare-datatypes ((array!23978 0))(
  ( (array!23979 (arr!11438 (Array (_ BitVec 32) ValueCell!4679)) (size!11790 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23978)

(assert (=> b!400570 (= res!230509 (and (= (size!11790 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11789 _keys!709) (size!11790 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!230503 () Bool)

(assert (=> start!38612 (=> (not res!230503) (not e!241683))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38612 (= res!230503 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11789 _keys!709))))))

(assert (=> start!38612 e!241683))

(declare-fun tp_is_empty!10045 () Bool)

(assert (=> start!38612 tp_is_empty!10045))

(assert (=> start!38612 tp!32612))

(assert (=> start!38612 true))

(declare-fun e!241682 () Bool)

(declare-fun array_inv!8448 (array!23978) Bool)

(assert (=> start!38612 (and (array_inv!8448 _values!549) e!241682)))

(declare-fun array_inv!8449 (array!23976) Bool)

(assert (=> start!38612 (array_inv!8449 _keys!709)))

(declare-fun b!400571 () Bool)

(declare-fun res!230507 () Bool)

(assert (=> b!400571 (=> (not res!230507) (not e!241683))))

(assert (=> b!400571 (= res!230507 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6499))))

(declare-fun b!400572 () Bool)

(declare-fun e!241685 () Bool)

(assert (=> b!400572 (= e!241685 tp_is_empty!10045)))

(declare-fun b!400573 () Bool)

(declare-fun e!241686 () Bool)

(declare-datatypes ((tuple2!6582 0))(
  ( (tuple2!6583 (_1!3302 (_ BitVec 64)) (_2!3302 V!14499)) )
))
(declare-datatypes ((List!6503 0))(
  ( (Nil!6500) (Cons!6499 (h!7355 tuple2!6582) (t!11669 List!6503)) )
))
(declare-datatypes ((ListLongMap!5497 0))(
  ( (ListLongMap!5498 (toList!2764 List!6503)) )
))
(declare-fun call!28141 () ListLongMap!5497)

(declare-fun call!28140 () ListLongMap!5497)

(assert (=> b!400573 (= e!241686 (= call!28141 call!28140))))

(declare-fun b!400574 () Bool)

(declare-fun res!230504 () Bool)

(assert (=> b!400574 (=> (not res!230504) (not e!241687))))

(assert (=> b!400574 (= res!230504 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11789 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400575 () Bool)

(declare-fun mapRes!16689 () Bool)

(assert (=> b!400575 (= e!241682 (and e!241685 mapRes!16689))))

(declare-fun condMapEmpty!16689 () Bool)

(declare-fun mapDefault!16689 () ValueCell!4679)

(assert (=> b!400575 (= condMapEmpty!16689 (= (arr!11438 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4679)) mapDefault!16689)))))

(declare-fun b!400576 () Bool)

(declare-fun e!241684 () Bool)

(assert (=> b!400576 (= e!241684 tp_is_empty!10045)))

(declare-fun b!400577 () Bool)

(declare-fun res!230512 () Bool)

(assert (=> b!400577 (=> (not res!230512) (not e!241683))))

(assert (=> b!400577 (= res!230512 (or (= (select (arr!11437 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11437 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400578 () Bool)

(declare-fun res!230506 () Bool)

(assert (=> b!400578 (=> (not res!230506) (not e!241683))))

(assert (=> b!400578 (= res!230506 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11789 _keys!709))))))

(declare-fun mapIsEmpty!16689 () Bool)

(assert (=> mapIsEmpty!16689 mapRes!16689))

(declare-fun b!400579 () Bool)

(declare-fun v!412 () V!14499)

(declare-fun +!1111 (ListLongMap!5497 tuple2!6582) ListLongMap!5497)

(assert (=> b!400579 (= e!241686 (= call!28140 (+!1111 call!28141 (tuple2!6583 k0!794 v!412))))))

(declare-fun minValue!515 () V!14499)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14499)

(declare-fun bm!28137 () Bool)

(declare-fun c!54678 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1021 (array!23976 array!23978 (_ BitVec 32) (_ BitVec 32) V!14499 V!14499 (_ BitVec 32) Int) ListLongMap!5497)

(assert (=> bm!28137 (= call!28141 (getCurrentListMapNoExtraKeys!1021 (ite c!54678 _keys!709 lt!187733) (ite c!54678 _values!549 (array!23979 (store (arr!11438 _values!549) i!563 (ValueCellFull!4679 v!412)) (size!11790 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28138 () Bool)

(assert (=> bm!28138 (= call!28140 (getCurrentListMapNoExtraKeys!1021 (ite c!54678 lt!187733 _keys!709) (ite c!54678 (array!23979 (store (arr!11438 _values!549) i!563 (ValueCellFull!4679 v!412)) (size!11790 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400580 () Bool)

(declare-fun res!230510 () Bool)

(assert (=> b!400580 (=> (not res!230510) (not e!241683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400580 (= res!230510 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16689 () Bool)

(declare-fun tp!32613 () Bool)

(assert (=> mapNonEmpty!16689 (= mapRes!16689 (and tp!32613 e!241684))))

(declare-fun mapKey!16689 () (_ BitVec 32))

(declare-fun mapRest!16689 () (Array (_ BitVec 32) ValueCell!4679))

(declare-fun mapValue!16689 () ValueCell!4679)

(assert (=> mapNonEmpty!16689 (= (arr!11438 _values!549) (store mapRest!16689 mapKey!16689 mapValue!16689))))

(declare-fun b!400581 () Bool)

(assert (=> b!400581 (= e!241687 (not true))))

(assert (=> b!400581 e!241686))

(assert (=> b!400581 (= c!54678 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12107 0))(
  ( (Unit!12108) )
))
(declare-fun lt!187734 () Unit!12107)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!321 (array!23976 array!23978 (_ BitVec 32) (_ BitVec 32) V!14499 V!14499 (_ BitVec 32) (_ BitVec 64) V!14499 (_ BitVec 32) Int) Unit!12107)

(assert (=> b!400581 (= lt!187734 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!321 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400582 () Bool)

(declare-fun res!230514 () Bool)

(assert (=> b!400582 (=> (not res!230514) (not e!241683))))

(declare-fun arrayContainsKey!0 (array!23976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400582 (= res!230514 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38612 res!230503) b!400569))

(assert (= (and b!400569 res!230511) b!400570))

(assert (= (and b!400570 res!230509) b!400568))

(assert (= (and b!400568 res!230505) b!400571))

(assert (= (and b!400571 res!230507) b!400578))

(assert (= (and b!400578 res!230506) b!400580))

(assert (= (and b!400580 res!230510) b!400577))

(assert (= (and b!400577 res!230512) b!400582))

(assert (= (and b!400582 res!230514) b!400566))

(assert (= (and b!400566 res!230513) b!400567))

(assert (= (and b!400567 res!230508) b!400574))

(assert (= (and b!400574 res!230504) b!400581))

(assert (= (and b!400581 c!54678) b!400579))

(assert (= (and b!400581 (not c!54678)) b!400573))

(assert (= (or b!400579 b!400573) bm!28138))

(assert (= (or b!400579 b!400573) bm!28137))

(assert (= (and b!400575 condMapEmpty!16689) mapIsEmpty!16689))

(assert (= (and b!400575 (not condMapEmpty!16689)) mapNonEmpty!16689))

(get-info :version)

(assert (= (and mapNonEmpty!16689 ((_ is ValueCellFull!4679) mapValue!16689)) b!400576))

(assert (= (and b!400575 ((_ is ValueCellFull!4679) mapDefault!16689)) b!400572))

(assert (= start!38612 b!400575))

(declare-fun m!394977 () Bool)

(assert (=> b!400568 m!394977))

(declare-fun m!394979 () Bool)

(assert (=> b!400580 m!394979))

(declare-fun m!394981 () Bool)

(assert (=> b!400569 m!394981))

(declare-fun m!394983 () Bool)

(assert (=> bm!28137 m!394983))

(declare-fun m!394985 () Bool)

(assert (=> bm!28137 m!394985))

(declare-fun m!394987 () Bool)

(assert (=> start!38612 m!394987))

(declare-fun m!394989 () Bool)

(assert (=> start!38612 m!394989))

(declare-fun m!394991 () Bool)

(assert (=> b!400567 m!394991))

(declare-fun m!394993 () Bool)

(assert (=> b!400579 m!394993))

(declare-fun m!394995 () Bool)

(assert (=> b!400571 m!394995))

(declare-fun m!394997 () Bool)

(assert (=> b!400577 m!394997))

(declare-fun m!394999 () Bool)

(assert (=> b!400582 m!394999))

(assert (=> bm!28138 m!394983))

(declare-fun m!395001 () Bool)

(assert (=> bm!28138 m!395001))

(declare-fun m!395003 () Bool)

(assert (=> mapNonEmpty!16689 m!395003))

(declare-fun m!395005 () Bool)

(assert (=> b!400566 m!395005))

(declare-fun m!395007 () Bool)

(assert (=> b!400566 m!395007))

(declare-fun m!395009 () Bool)

(assert (=> b!400581 m!395009))

(check-sat (not b!400582) (not mapNonEmpty!16689) tp_is_empty!10045 (not bm!28137) (not b!400569) (not start!38612) (not b!400579) (not b!400571) (not b!400566) (not b_next!9163) b_and!16563 (not b!400580) (not b!400568) (not bm!28138) (not b!400581) (not b!400567))
(check-sat b_and!16563 (not b_next!9163))
