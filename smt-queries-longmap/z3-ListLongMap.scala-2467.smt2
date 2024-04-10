; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38622 () Bool)

(assert start!38622)

(declare-fun b_free!9159 () Bool)

(declare-fun b_next!9159 () Bool)

(assert (=> start!38622 (= b_free!9159 (not b_next!9159))))

(declare-fun tp!32601 () Bool)

(declare-fun b_and!16545 () Bool)

(assert (=> start!38622 (= tp!32601 b_and!16545)))

(declare-fun b!400513 () Bool)

(declare-fun res!230439 () Bool)

(declare-fun e!241675 () Bool)

(assert (=> b!400513 (=> (not res!230439) (not e!241675))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400513 (= res!230439 (validKeyInArray!0 k0!794))))

(declare-fun b!400514 () Bool)

(declare-fun res!230440 () Bool)

(assert (=> b!400514 (=> (not res!230440) (not e!241675))))

(declare-datatypes ((array!23991 0))(
  ( (array!23992 (arr!11445 (Array (_ BitVec 32) (_ BitVec 64))) (size!11797 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23991)

(declare-datatypes ((List!6640 0))(
  ( (Nil!6637) (Cons!6636 (h!7492 (_ BitVec 64)) (t!11814 List!6640)) )
))
(declare-fun arrayNoDuplicates!0 (array!23991 (_ BitVec 32) List!6640) Bool)

(assert (=> b!400514 (= res!230440 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6637))))

(declare-fun mapIsEmpty!16683 () Bool)

(declare-fun mapRes!16683 () Bool)

(assert (=> mapIsEmpty!16683 mapRes!16683))

(declare-fun b!400516 () Bool)

(declare-fun res!230441 () Bool)

(assert (=> b!400516 (=> (not res!230441) (not e!241675))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400516 (= res!230441 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11797 _keys!709))))))

(declare-fun b!400517 () Bool)

(declare-fun res!230434 () Bool)

(assert (=> b!400517 (=> (not res!230434) (not e!241675))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14493 0))(
  ( (V!14494 (val!5065 Int)) )
))
(declare-datatypes ((ValueCell!4677 0))(
  ( (ValueCellFull!4677 (v!7312 V!14493)) (EmptyCell!4677) )
))
(declare-datatypes ((array!23993 0))(
  ( (array!23994 (arr!11446 (Array (_ BitVec 32) ValueCell!4677)) (size!11798 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23993)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!400517 (= res!230434 (and (= (size!11798 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11797 _keys!709) (size!11798 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400518 () Bool)

(declare-fun res!230445 () Bool)

(assert (=> b!400518 (=> (not res!230445) (not e!241675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23991 (_ BitVec 32)) Bool)

(assert (=> b!400518 (= res!230445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400519 () Bool)

(declare-fun e!241674 () Bool)

(assert (=> b!400519 (= e!241674 (not true))))

(declare-fun e!241673 () Bool)

(assert (=> b!400519 e!241673))

(declare-fun c!54695 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400519 (= c!54695 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14493)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14493)

(declare-fun v!412 () V!14493)

(declare-datatypes ((Unit!12134 0))(
  ( (Unit!12135) )
))
(declare-fun lt!187702 () Unit!12134)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!325 (array!23991 array!23993 (_ BitVec 32) (_ BitVec 32) V!14493 V!14493 (_ BitVec 32) (_ BitVec 64) V!14493 (_ BitVec 32) Int) Unit!12134)

(assert (=> b!400519 (= lt!187702 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!325 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400520 () Bool)

(declare-datatypes ((tuple2!6718 0))(
  ( (tuple2!6719 (_1!3370 (_ BitVec 64)) (_2!3370 V!14493)) )
))
(declare-datatypes ((List!6641 0))(
  ( (Nil!6638) (Cons!6637 (h!7493 tuple2!6718) (t!11815 List!6641)) )
))
(declare-datatypes ((ListLongMap!5631 0))(
  ( (ListLongMap!5632 (toList!2831 List!6641)) )
))
(declare-fun call!28141 () ListLongMap!5631)

(declare-fun call!28142 () ListLongMap!5631)

(declare-fun +!1116 (ListLongMap!5631 tuple2!6718) ListLongMap!5631)

(assert (=> b!400520 (= e!241673 (= call!28142 (+!1116 call!28141 (tuple2!6719 k0!794 v!412))))))

(declare-fun bm!28138 () Bool)

(declare-fun lt!187703 () array!23991)

(declare-fun getCurrentListMapNoExtraKeys!1044 (array!23991 array!23993 (_ BitVec 32) (_ BitVec 32) V!14493 V!14493 (_ BitVec 32) Int) ListLongMap!5631)

(assert (=> bm!28138 (= call!28141 (getCurrentListMapNoExtraKeys!1044 (ite c!54695 _keys!709 lt!187703) (ite c!54695 _values!549 (array!23994 (store (arr!11446 _values!549) i!563 (ValueCellFull!4677 v!412)) (size!11798 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400521 () Bool)

(declare-fun res!230436 () Bool)

(assert (=> b!400521 (=> (not res!230436) (not e!241675))))

(declare-fun arrayContainsKey!0 (array!23991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400521 (= res!230436 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400522 () Bool)

(declare-fun e!241672 () Bool)

(declare-fun tp_is_empty!10041 () Bool)

(assert (=> b!400522 (= e!241672 tp_is_empty!10041)))

(declare-fun b!400523 () Bool)

(assert (=> b!400523 (= e!241673 (= call!28141 call!28142))))

(declare-fun bm!28139 () Bool)

(assert (=> bm!28139 (= call!28142 (getCurrentListMapNoExtraKeys!1044 (ite c!54695 lt!187703 _keys!709) (ite c!54695 (array!23994 (store (arr!11446 _values!549) i!563 (ValueCellFull!4677 v!412)) (size!11798 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400524 () Bool)

(declare-fun res!230442 () Bool)

(assert (=> b!400524 (=> (not res!230442) (not e!241674))))

(assert (=> b!400524 (= res!230442 (arrayNoDuplicates!0 lt!187703 #b00000000000000000000000000000000 Nil!6637))))

(declare-fun res!230437 () Bool)

(assert (=> start!38622 (=> (not res!230437) (not e!241675))))

(assert (=> start!38622 (= res!230437 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11797 _keys!709))))))

(assert (=> start!38622 e!241675))

(assert (=> start!38622 tp_is_empty!10041))

(assert (=> start!38622 tp!32601))

(assert (=> start!38622 true))

(declare-fun e!241671 () Bool)

(declare-fun array_inv!8382 (array!23993) Bool)

(assert (=> start!38622 (and (array_inv!8382 _values!549) e!241671)))

(declare-fun array_inv!8383 (array!23991) Bool)

(assert (=> start!38622 (array_inv!8383 _keys!709)))

(declare-fun b!400515 () Bool)

(assert (=> b!400515 (= e!241671 (and e!241672 mapRes!16683))))

(declare-fun condMapEmpty!16683 () Bool)

(declare-fun mapDefault!16683 () ValueCell!4677)

(assert (=> b!400515 (= condMapEmpty!16683 (= (arr!11446 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4677)) mapDefault!16683)))))

(declare-fun b!400525 () Bool)

(declare-fun res!230438 () Bool)

(assert (=> b!400525 (=> (not res!230438) (not e!241674))))

(assert (=> b!400525 (= res!230438 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11797 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16683 () Bool)

(declare-fun tp!32600 () Bool)

(declare-fun e!241677 () Bool)

(assert (=> mapNonEmpty!16683 (= mapRes!16683 (and tp!32600 e!241677))))

(declare-fun mapValue!16683 () ValueCell!4677)

(declare-fun mapRest!16683 () (Array (_ BitVec 32) ValueCell!4677))

(declare-fun mapKey!16683 () (_ BitVec 32))

(assert (=> mapNonEmpty!16683 (= (arr!11446 _values!549) (store mapRest!16683 mapKey!16683 mapValue!16683))))

(declare-fun b!400526 () Bool)

(assert (=> b!400526 (= e!241675 e!241674)))

(declare-fun res!230435 () Bool)

(assert (=> b!400526 (=> (not res!230435) (not e!241674))))

(assert (=> b!400526 (= res!230435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187703 mask!1025))))

(assert (=> b!400526 (= lt!187703 (array!23992 (store (arr!11445 _keys!709) i!563 k0!794) (size!11797 _keys!709)))))

(declare-fun b!400527 () Bool)

(declare-fun res!230444 () Bool)

(assert (=> b!400527 (=> (not res!230444) (not e!241675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400527 (= res!230444 (validMask!0 mask!1025))))

(declare-fun b!400528 () Bool)

(declare-fun res!230443 () Bool)

(assert (=> b!400528 (=> (not res!230443) (not e!241675))))

(assert (=> b!400528 (= res!230443 (or (= (select (arr!11445 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11445 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400529 () Bool)

(assert (=> b!400529 (= e!241677 tp_is_empty!10041)))

(assert (= (and start!38622 res!230437) b!400527))

(assert (= (and b!400527 res!230444) b!400517))

(assert (= (and b!400517 res!230434) b!400518))

(assert (= (and b!400518 res!230445) b!400514))

(assert (= (and b!400514 res!230440) b!400516))

(assert (= (and b!400516 res!230441) b!400513))

(assert (= (and b!400513 res!230439) b!400528))

(assert (= (and b!400528 res!230443) b!400521))

(assert (= (and b!400521 res!230436) b!400526))

(assert (= (and b!400526 res!230435) b!400524))

(assert (= (and b!400524 res!230442) b!400525))

(assert (= (and b!400525 res!230438) b!400519))

(assert (= (and b!400519 c!54695) b!400520))

(assert (= (and b!400519 (not c!54695)) b!400523))

(assert (= (or b!400520 b!400523) bm!28139))

(assert (= (or b!400520 b!400523) bm!28138))

(assert (= (and b!400515 condMapEmpty!16683) mapIsEmpty!16683))

(assert (= (and b!400515 (not condMapEmpty!16683)) mapNonEmpty!16683))

(get-info :version)

(assert (= (and mapNonEmpty!16683 ((_ is ValueCellFull!4677) mapValue!16683)) b!400529))

(assert (= (and b!400515 ((_ is ValueCellFull!4677) mapDefault!16683)) b!400522))

(assert (= start!38622 b!400515))

(declare-fun m!394679 () Bool)

(assert (=> bm!28139 m!394679))

(declare-fun m!394681 () Bool)

(assert (=> bm!28139 m!394681))

(declare-fun m!394683 () Bool)

(assert (=> b!400526 m!394683))

(declare-fun m!394685 () Bool)

(assert (=> b!400526 m!394685))

(declare-fun m!394687 () Bool)

(assert (=> b!400524 m!394687))

(declare-fun m!394689 () Bool)

(assert (=> start!38622 m!394689))

(declare-fun m!394691 () Bool)

(assert (=> start!38622 m!394691))

(declare-fun m!394693 () Bool)

(assert (=> b!400527 m!394693))

(declare-fun m!394695 () Bool)

(assert (=> b!400528 m!394695))

(declare-fun m!394697 () Bool)

(assert (=> b!400520 m!394697))

(declare-fun m!394699 () Bool)

(assert (=> b!400519 m!394699))

(declare-fun m!394701 () Bool)

(assert (=> b!400518 m!394701))

(assert (=> bm!28138 m!394679))

(declare-fun m!394703 () Bool)

(assert (=> bm!28138 m!394703))

(declare-fun m!394705 () Bool)

(assert (=> mapNonEmpty!16683 m!394705))

(declare-fun m!394707 () Bool)

(assert (=> b!400521 m!394707))

(declare-fun m!394709 () Bool)

(assert (=> b!400514 m!394709))

(declare-fun m!394711 () Bool)

(assert (=> b!400513 m!394711))

(check-sat (not b!400524) (not b_next!9159) (not b!400519) (not b!400527) tp_is_empty!10041 (not b!400514) (not b!400520) (not b!400526) (not b!400513) (not b!400518) b_and!16545 (not bm!28138) (not mapNonEmpty!16683) (not start!38622) (not bm!28139) (not b!400521))
(check-sat b_and!16545 (not b_next!9159))
