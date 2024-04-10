; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33982 () Bool)

(assert start!33982)

(declare-fun b_free!7113 () Bool)

(declare-fun b_next!7113 () Bool)

(assert (=> start!33982 (= b_free!7113 (not b_next!7113))))

(declare-fun tp!24857 () Bool)

(declare-fun b_and!14303 () Bool)

(assert (=> start!33982 (= tp!24857 b_and!14303)))

(declare-fun b!338512 () Bool)

(declare-datatypes ((Unit!10518 0))(
  ( (Unit!10519) )
))
(declare-fun e!207703 () Unit!10518)

(declare-fun Unit!10520 () Unit!10518)

(assert (=> b!338512 (= e!207703 Unit!10520)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun lt!160829 () Unit!10518)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10397 0))(
  ( (V!10398 (val!3577 Int)) )
))
(declare-fun zeroValue!1467 () V!10397)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3189 0))(
  ( (ValueCellFull!3189 (v!5744 V!10397)) (EmptyCell!3189) )
))
(declare-datatypes ((array!17725 0))(
  ( (array!17726 (arr!8388 (Array (_ BitVec 32) ValueCell!3189)) (size!8740 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17725)

(declare-datatypes ((array!17727 0))(
  ( (array!17728 (arr!8389 (Array (_ BitVec 32) (_ BitVec 64))) (size!8741 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17727)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10397)

(declare-fun lemmaArrayContainsKeyThenInListMap!274 (array!17727 array!17725 (_ BitVec 32) (_ BitVec 32) V!10397 V!10397 (_ BitVec 64) (_ BitVec 32) Int) Unit!10518)

(declare-fun arrayScanForKey!0 (array!17727 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338512 (= lt!160829 (lemmaArrayContainsKeyThenInListMap!274 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338512 false))

(declare-fun b!338513 () Bool)

(declare-fun e!207701 () Bool)

(declare-fun tp_is_empty!7065 () Bool)

(assert (=> b!338513 (= e!207701 tp_is_empty!7065)))

(declare-fun b!338514 () Bool)

(declare-fun res!186994 () Bool)

(declare-fun e!207702 () Bool)

(assert (=> b!338514 (=> (not res!186994) (not e!207702))))

(assert (=> b!338514 (= res!186994 (and (= (size!8740 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8741 _keys!1895) (size!8740 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12009 () Bool)

(declare-fun mapRes!12009 () Bool)

(assert (=> mapIsEmpty!12009 mapRes!12009))

(declare-fun b!338515 () Bool)

(declare-fun e!207704 () Bool)

(declare-fun e!207700 () Bool)

(assert (=> b!338515 (= e!207704 (and e!207700 mapRes!12009))))

(declare-fun condMapEmpty!12009 () Bool)

(declare-fun mapDefault!12009 () ValueCell!3189)

(assert (=> b!338515 (= condMapEmpty!12009 (= (arr!8388 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3189)) mapDefault!12009)))))

(declare-fun b!338516 () Bool)

(declare-fun res!186991 () Bool)

(assert (=> b!338516 (=> (not res!186991) (not e!207702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17727 (_ BitVec 32)) Bool)

(assert (=> b!338516 (= res!186991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun lt!160830 () Bool)

(declare-fun e!207705 () Bool)

(declare-fun b!338517 () Bool)

(assert (=> b!338517 (= e!207705 (and (not lt!160830) (not (= (size!8741 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun lt!160828 () Unit!10518)

(assert (=> b!338517 (= lt!160828 e!207703)))

(declare-fun c!52431 () Bool)

(assert (=> b!338517 (= c!52431 lt!160830)))

(declare-fun arrayContainsKey!0 (array!17727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338517 (= lt!160830 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338518 () Bool)

(declare-fun res!186990 () Bool)

(assert (=> b!338518 (=> (not res!186990) (not e!207702))))

(declare-datatypes ((tuple2!5196 0))(
  ( (tuple2!5197 (_1!2609 (_ BitVec 64)) (_2!2609 V!10397)) )
))
(declare-datatypes ((List!4811 0))(
  ( (Nil!4808) (Cons!4807 (h!5663 tuple2!5196) (t!9909 List!4811)) )
))
(declare-datatypes ((ListLongMap!4109 0))(
  ( (ListLongMap!4110 (toList!2070 List!4811)) )
))
(declare-fun contains!2119 (ListLongMap!4109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1591 (array!17727 array!17725 (_ BitVec 32) (_ BitVec 32) V!10397 V!10397 (_ BitVec 32) Int) ListLongMap!4109)

(assert (=> b!338518 (= res!186990 (not (contains!2119 (getCurrentListMap!1591 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338519 () Bool)

(assert (=> b!338519 (= e!207702 e!207705)))

(declare-fun res!186992 () Bool)

(assert (=> b!338519 (=> (not res!186992) (not e!207705))))

(declare-datatypes ((SeekEntryResult!3239 0))(
  ( (MissingZero!3239 (index!15135 (_ BitVec 32))) (Found!3239 (index!15136 (_ BitVec 32))) (Intermediate!3239 (undefined!4051 Bool) (index!15137 (_ BitVec 32)) (x!33727 (_ BitVec 32))) (Undefined!3239) (MissingVacant!3239 (index!15138 (_ BitVec 32))) )
))
(declare-fun lt!160831 () SeekEntryResult!3239)

(get-info :version)

(assert (=> b!338519 (= res!186992 (and (not ((_ is Found!3239) lt!160831)) ((_ is MissingZero!3239) lt!160831)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17727 (_ BitVec 32)) SeekEntryResult!3239)

(assert (=> b!338519 (= lt!160831 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338520 () Bool)

(declare-fun Unit!10521 () Unit!10518)

(assert (=> b!338520 (= e!207703 Unit!10521)))

(declare-fun b!338521 () Bool)

(assert (=> b!338521 (= e!207700 tp_is_empty!7065)))

(declare-fun mapNonEmpty!12009 () Bool)

(declare-fun tp!24858 () Bool)

(assert (=> mapNonEmpty!12009 (= mapRes!12009 (and tp!24858 e!207701))))

(declare-fun mapKey!12009 () (_ BitVec 32))

(declare-fun mapRest!12009 () (Array (_ BitVec 32) ValueCell!3189))

(declare-fun mapValue!12009 () ValueCell!3189)

(assert (=> mapNonEmpty!12009 (= (arr!8388 _values!1525) (store mapRest!12009 mapKey!12009 mapValue!12009))))

(declare-fun b!338522 () Bool)

(declare-fun res!186989 () Bool)

(assert (=> b!338522 (=> (not res!186989) (not e!207702))))

(declare-datatypes ((List!4812 0))(
  ( (Nil!4809) (Cons!4808 (h!5664 (_ BitVec 64)) (t!9910 List!4812)) )
))
(declare-fun arrayNoDuplicates!0 (array!17727 (_ BitVec 32) List!4812) Bool)

(assert (=> b!338522 (= res!186989 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4809))))

(declare-fun res!186993 () Bool)

(assert (=> start!33982 (=> (not res!186993) (not e!207702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33982 (= res!186993 (validMask!0 mask!2385))))

(assert (=> start!33982 e!207702))

(assert (=> start!33982 true))

(assert (=> start!33982 tp_is_empty!7065))

(assert (=> start!33982 tp!24857))

(declare-fun array_inv!6222 (array!17725) Bool)

(assert (=> start!33982 (and (array_inv!6222 _values!1525) e!207704)))

(declare-fun array_inv!6223 (array!17727) Bool)

(assert (=> start!33982 (array_inv!6223 _keys!1895)))

(declare-fun b!338523 () Bool)

(declare-fun res!186995 () Bool)

(assert (=> b!338523 (=> (not res!186995) (not e!207702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338523 (= res!186995 (validKeyInArray!0 k0!1348))))

(assert (= (and start!33982 res!186993) b!338514))

(assert (= (and b!338514 res!186994) b!338516))

(assert (= (and b!338516 res!186991) b!338522))

(assert (= (and b!338522 res!186989) b!338523))

(assert (= (and b!338523 res!186995) b!338518))

(assert (= (and b!338518 res!186990) b!338519))

(assert (= (and b!338519 res!186992) b!338517))

(assert (= (and b!338517 c!52431) b!338512))

(assert (= (and b!338517 (not c!52431)) b!338520))

(assert (= (and b!338515 condMapEmpty!12009) mapIsEmpty!12009))

(assert (= (and b!338515 (not condMapEmpty!12009)) mapNonEmpty!12009))

(assert (= (and mapNonEmpty!12009 ((_ is ValueCellFull!3189) mapValue!12009)) b!338513))

(assert (= (and b!338515 ((_ is ValueCellFull!3189) mapDefault!12009)) b!338521))

(assert (= start!33982 b!338515))

(declare-fun m!341743 () Bool)

(assert (=> b!338517 m!341743))

(declare-fun m!341745 () Bool)

(assert (=> start!33982 m!341745))

(declare-fun m!341747 () Bool)

(assert (=> start!33982 m!341747))

(declare-fun m!341749 () Bool)

(assert (=> start!33982 m!341749))

(declare-fun m!341751 () Bool)

(assert (=> mapNonEmpty!12009 m!341751))

(declare-fun m!341753 () Bool)

(assert (=> b!338519 m!341753))

(declare-fun m!341755 () Bool)

(assert (=> b!338523 m!341755))

(declare-fun m!341757 () Bool)

(assert (=> b!338512 m!341757))

(assert (=> b!338512 m!341757))

(declare-fun m!341759 () Bool)

(assert (=> b!338512 m!341759))

(declare-fun m!341761 () Bool)

(assert (=> b!338522 m!341761))

(declare-fun m!341763 () Bool)

(assert (=> b!338516 m!341763))

(declare-fun m!341765 () Bool)

(assert (=> b!338518 m!341765))

(assert (=> b!338518 m!341765))

(declare-fun m!341767 () Bool)

(assert (=> b!338518 m!341767))

(check-sat (not b_next!7113) (not b!338516) (not mapNonEmpty!12009) (not b!338517) (not b!338519) (not start!33982) (not b!338518) (not b!338523) (not b!338522) b_and!14303 tp_is_empty!7065 (not b!338512))
(check-sat b_and!14303 (not b_next!7113))
