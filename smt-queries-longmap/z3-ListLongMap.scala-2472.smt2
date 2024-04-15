; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38636 () Bool)

(assert start!38636)

(declare-fun b_free!9187 () Bool)

(declare-fun b_next!9187 () Bool)

(assert (=> start!38636 (= b_free!9187 (not b_next!9187))))

(declare-fun tp!32684 () Bool)

(declare-fun b_and!16547 () Bool)

(assert (=> start!38636 (= tp!32684 b_and!16547)))

(declare-fun b!400956 () Bool)

(declare-fun res!230814 () Bool)

(declare-fun e!241793 () Bool)

(assert (=> b!400956 (=> (not res!230814) (not e!241793))))

(declare-datatypes ((array!24025 0))(
  ( (array!24026 (arr!11462 (Array (_ BitVec 32) (_ BitVec 64))) (size!11815 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24025)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14531 0))(
  ( (V!14532 (val!5079 Int)) )
))
(declare-datatypes ((ValueCell!4691 0))(
  ( (ValueCellFull!4691 (v!7320 V!14531)) (EmptyCell!4691) )
))
(declare-datatypes ((array!24027 0))(
  ( (array!24028 (arr!11463 (Array (_ BitVec 32) ValueCell!4691)) (size!11816 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24027)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!400956 (= res!230814 (and (= (size!11816 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11815 _keys!709) (size!11816 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400957 () Bool)

(declare-fun res!230816 () Bool)

(assert (=> b!400957 (=> (not res!230816) (not e!241793))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400957 (= res!230816 (validKeyInArray!0 k0!794))))

(declare-fun b!400958 () Bool)

(declare-fun res!230815 () Bool)

(assert (=> b!400958 (=> (not res!230815) (not e!241793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400958 (= res!230815 (validMask!0 mask!1025))))

(declare-fun b!400959 () Bool)

(declare-fun e!241792 () Bool)

(assert (=> b!400959 (= e!241792 (not true))))

(declare-fun e!241796 () Bool)

(assert (=> b!400959 e!241796))

(declare-fun c!54666 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400959 (= c!54666 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14531)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14531)

(declare-fun v!412 () V!14531)

(declare-datatypes ((Unit!12120 0))(
  ( (Unit!12121) )
))
(declare-fun lt!187553 () Unit!12120)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!323 (array!24025 array!24027 (_ BitVec 32) (_ BitVec 32) V!14531 V!14531 (_ BitVec 32) (_ BitVec 64) V!14531 (_ BitVec 32) Int) Unit!12120)

(assert (=> b!400959 (= lt!187553 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!323 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400960 () Bool)

(assert (=> b!400960 (= e!241793 e!241792)))

(declare-fun res!230819 () Bool)

(assert (=> b!400960 (=> (not res!230819) (not e!241792))))

(declare-fun lt!187552 () array!24025)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24025 (_ BitVec 32)) Bool)

(assert (=> b!400960 (= res!230819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187552 mask!1025))))

(assert (=> b!400960 (= lt!187552 (array!24026 (store (arr!11462 _keys!709) i!563 k0!794) (size!11815 _keys!709)))))

(declare-fun b!400961 () Bool)

(declare-fun res!230812 () Bool)

(assert (=> b!400961 (=> (not res!230812) (not e!241792))))

(assert (=> b!400961 (= res!230812 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11815 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400962 () Bool)

(declare-datatypes ((tuple2!6718 0))(
  ( (tuple2!6719 (_1!3370 (_ BitVec 64)) (_2!3370 V!14531)) )
))
(declare-datatypes ((List!6624 0))(
  ( (Nil!6621) (Cons!6620 (h!7476 tuple2!6718) (t!11789 List!6624)) )
))
(declare-datatypes ((ListLongMap!5621 0))(
  ( (ListLongMap!5622 (toList!2826 List!6624)) )
))
(declare-fun call!28201 () ListLongMap!5621)

(declare-fun call!28200 () ListLongMap!5621)

(assert (=> b!400962 (= e!241796 (= call!28201 call!28200))))

(declare-fun b!400963 () Bool)

(declare-fun res!230817 () Bool)

(assert (=> b!400963 (=> (not res!230817) (not e!241793))))

(declare-datatypes ((List!6625 0))(
  ( (Nil!6622) (Cons!6621 (h!7477 (_ BitVec 64)) (t!11790 List!6625)) )
))
(declare-fun arrayNoDuplicates!0 (array!24025 (_ BitVec 32) List!6625) Bool)

(assert (=> b!400963 (= res!230817 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6622))))

(declare-fun b!400964 () Bool)

(declare-fun res!230811 () Bool)

(assert (=> b!400964 (=> (not res!230811) (not e!241792))))

(assert (=> b!400964 (= res!230811 (arrayNoDuplicates!0 lt!187552 #b00000000000000000000000000000000 Nil!6622))))

(declare-fun mapNonEmpty!16725 () Bool)

(declare-fun mapRes!16725 () Bool)

(declare-fun tp!32685 () Bool)

(declare-fun e!241791 () Bool)

(assert (=> mapNonEmpty!16725 (= mapRes!16725 (and tp!32685 e!241791))))

(declare-fun mapRest!16725 () (Array (_ BitVec 32) ValueCell!4691))

(declare-fun mapKey!16725 () (_ BitVec 32))

(declare-fun mapValue!16725 () ValueCell!4691)

(assert (=> mapNonEmpty!16725 (= (arr!11463 _values!549) (store mapRest!16725 mapKey!16725 mapValue!16725))))

(declare-fun res!230820 () Bool)

(assert (=> start!38636 (=> (not res!230820) (not e!241793))))

(assert (=> start!38636 (= res!230820 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11815 _keys!709))))))

(assert (=> start!38636 e!241793))

(declare-fun tp_is_empty!10069 () Bool)

(assert (=> start!38636 tp_is_empty!10069))

(assert (=> start!38636 tp!32684))

(assert (=> start!38636 true))

(declare-fun e!241794 () Bool)

(declare-fun array_inv!8406 (array!24027) Bool)

(assert (=> start!38636 (and (array_inv!8406 _values!549) e!241794)))

(declare-fun array_inv!8407 (array!24025) Bool)

(assert (=> start!38636 (array_inv!8407 _keys!709)))

(declare-fun b!400965 () Bool)

(declare-fun +!1132 (ListLongMap!5621 tuple2!6718) ListLongMap!5621)

(assert (=> b!400965 (= e!241796 (= call!28200 (+!1132 call!28201 (tuple2!6719 k0!794 v!412))))))

(declare-fun b!400966 () Bool)

(declare-fun e!241795 () Bool)

(assert (=> b!400966 (= e!241794 (and e!241795 mapRes!16725))))

(declare-fun condMapEmpty!16725 () Bool)

(declare-fun mapDefault!16725 () ValueCell!4691)

(assert (=> b!400966 (= condMapEmpty!16725 (= (arr!11463 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4691)) mapDefault!16725)))))

(declare-fun b!400967 () Bool)

(declare-fun res!230818 () Bool)

(assert (=> b!400967 (=> (not res!230818) (not e!241793))))

(assert (=> b!400967 (= res!230818 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11815 _keys!709))))))

(declare-fun bm!28197 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1044 (array!24025 array!24027 (_ BitVec 32) (_ BitVec 32) V!14531 V!14531 (_ BitVec 32) Int) ListLongMap!5621)

(assert (=> bm!28197 (= call!28200 (getCurrentListMapNoExtraKeys!1044 (ite c!54666 lt!187552 _keys!709) (ite c!54666 (array!24028 (store (arr!11463 _values!549) i!563 (ValueCellFull!4691 v!412)) (size!11816 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28198 () Bool)

(assert (=> bm!28198 (= call!28201 (getCurrentListMapNoExtraKeys!1044 (ite c!54666 _keys!709 lt!187552) (ite c!54666 _values!549 (array!24028 (store (arr!11463 _values!549) i!563 (ValueCellFull!4691 v!412)) (size!11816 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400968 () Bool)

(assert (=> b!400968 (= e!241791 tp_is_empty!10069)))

(declare-fun b!400969 () Bool)

(declare-fun res!230810 () Bool)

(assert (=> b!400969 (=> (not res!230810) (not e!241793))))

(declare-fun arrayContainsKey!0 (array!24025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400969 (= res!230810 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400970 () Bool)

(declare-fun res!230813 () Bool)

(assert (=> b!400970 (=> (not res!230813) (not e!241793))))

(assert (=> b!400970 (= res!230813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400971 () Bool)

(assert (=> b!400971 (= e!241795 tp_is_empty!10069)))

(declare-fun mapIsEmpty!16725 () Bool)

(assert (=> mapIsEmpty!16725 mapRes!16725))

(declare-fun b!400972 () Bool)

(declare-fun res!230809 () Bool)

(assert (=> b!400972 (=> (not res!230809) (not e!241793))))

(assert (=> b!400972 (= res!230809 (or (= (select (arr!11462 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11462 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38636 res!230820) b!400958))

(assert (= (and b!400958 res!230815) b!400956))

(assert (= (and b!400956 res!230814) b!400970))

(assert (= (and b!400970 res!230813) b!400963))

(assert (= (and b!400963 res!230817) b!400967))

(assert (= (and b!400967 res!230818) b!400957))

(assert (= (and b!400957 res!230816) b!400972))

(assert (= (and b!400972 res!230809) b!400969))

(assert (= (and b!400969 res!230810) b!400960))

(assert (= (and b!400960 res!230819) b!400964))

(assert (= (and b!400964 res!230811) b!400961))

(assert (= (and b!400961 res!230812) b!400959))

(assert (= (and b!400959 c!54666) b!400965))

(assert (= (and b!400959 (not c!54666)) b!400962))

(assert (= (or b!400965 b!400962) bm!28197))

(assert (= (or b!400965 b!400962) bm!28198))

(assert (= (and b!400966 condMapEmpty!16725) mapIsEmpty!16725))

(assert (= (and b!400966 (not condMapEmpty!16725)) mapNonEmpty!16725))

(get-info :version)

(assert (= (and mapNonEmpty!16725 ((_ is ValueCellFull!4691) mapValue!16725)) b!400968))

(assert (= (and b!400966 ((_ is ValueCellFull!4691) mapDefault!16725)) b!400971))

(assert (= start!38636 b!400966))

(declare-fun m!394431 () Bool)

(assert (=> b!400969 m!394431))

(declare-fun m!394433 () Bool)

(assert (=> b!400960 m!394433))

(declare-fun m!394435 () Bool)

(assert (=> b!400960 m!394435))

(declare-fun m!394437 () Bool)

(assert (=> b!400965 m!394437))

(declare-fun m!394439 () Bool)

(assert (=> b!400959 m!394439))

(declare-fun m!394441 () Bool)

(assert (=> mapNonEmpty!16725 m!394441))

(declare-fun m!394443 () Bool)

(assert (=> b!400972 m!394443))

(declare-fun m!394445 () Bool)

(assert (=> start!38636 m!394445))

(declare-fun m!394447 () Bool)

(assert (=> start!38636 m!394447))

(declare-fun m!394449 () Bool)

(assert (=> b!400963 m!394449))

(declare-fun m!394451 () Bool)

(assert (=> b!400964 m!394451))

(declare-fun m!394453 () Bool)

(assert (=> b!400958 m!394453))

(declare-fun m!394455 () Bool)

(assert (=> b!400957 m!394455))

(declare-fun m!394457 () Bool)

(assert (=> bm!28197 m!394457))

(declare-fun m!394459 () Bool)

(assert (=> bm!28197 m!394459))

(assert (=> bm!28198 m!394457))

(declare-fun m!394461 () Bool)

(assert (=> bm!28198 m!394461))

(declare-fun m!394463 () Bool)

(assert (=> b!400970 m!394463))

(check-sat (not b!400960) (not start!38636) (not b!400969) (not b!400964) (not b_next!9187) (not b!400970) (not bm!28197) (not bm!28198) (not b!400958) (not b!400957) b_and!16547 (not b!400965) (not b!400963) (not mapNonEmpty!16725) (not b!400959) tp_is_empty!10069)
(check-sat b_and!16547 (not b_next!9187))
