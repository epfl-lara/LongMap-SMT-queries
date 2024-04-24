; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77044 () Bool)

(assert start!77044)

(declare-fun b!899744 () Bool)

(declare-fun b_free!16021 () Bool)

(declare-fun b_next!16021 () Bool)

(assert (=> b!899744 (= b_free!16021 (not b_next!16021))))

(declare-fun tp!56137 () Bool)

(declare-fun b_and!26331 () Bool)

(assert (=> b!899744 (= tp!56137 b_and!26331)))

(declare-fun res!607676 () Bool)

(declare-fun e!503427 () Bool)

(assert (=> start!77044 (=> (not res!607676) (not e!503427))))

(declare-datatypes ((array!52777 0))(
  ( (array!52778 (arr!25360 (Array (_ BitVec 32) (_ BitVec 64))) (size!25817 (_ BitVec 32))) )
))
(declare-datatypes ((V!29431 0))(
  ( (V!29432 (val!9225 Int)) )
))
(declare-datatypes ((ValueCell!8693 0))(
  ( (ValueCellFull!8693 (v!11714 V!29431)) (EmptyCell!8693) )
))
(declare-datatypes ((array!52779 0))(
  ( (array!52780 (arr!25361 (Array (_ BitVec 32) ValueCell!8693)) (size!25818 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4402 0))(
  ( (LongMapFixedSize!4403 (defaultEntry!5419 Int) (mask!26203 (_ BitVec 32)) (extraKeys!5137 (_ BitVec 32)) (zeroValue!5241 V!29431) (minValue!5241 V!29431) (_size!2256 (_ BitVec 32)) (_keys!10228 array!52777) (_values!5428 array!52779) (_vacant!2256 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4402)

(declare-fun valid!1705 (LongMapFixedSize!4402) Bool)

(assert (=> start!77044 (= res!607676 (valid!1705 thiss!1181))))

(assert (=> start!77044 e!503427))

(declare-fun e!503428 () Bool)

(assert (=> start!77044 e!503428))

(assert (=> start!77044 true))

(declare-fun b!899738 () Bool)

(declare-fun e!503430 () Bool)

(assert (=> b!899738 (= e!503427 (not e!503430))))

(declare-fun res!607677 () Bool)

(assert (=> b!899738 (=> res!607677 e!503430)))

(declare-datatypes ((SeekEntryResult!8881 0))(
  ( (MissingZero!8881 (index!37895 (_ BitVec 32))) (Found!8881 (index!37896 (_ BitVec 32))) (Intermediate!8881 (undefined!9693 Bool) (index!37897 (_ BitVec 32)) (x!76568 (_ BitVec 32))) (Undefined!8881) (MissingVacant!8881 (index!37898 (_ BitVec 32))) )
))
(declare-fun lt!406205 () SeekEntryResult!8881)

(get-info :version)

(assert (=> b!899738 (= res!607677 (not ((_ is Found!8881) lt!406205)))))

(declare-fun e!503429 () Bool)

(assert (=> b!899738 e!503429))

(declare-fun res!607680 () Bool)

(assert (=> b!899738 (=> res!607680 e!503429)))

(assert (=> b!899738 (= res!607680 (not ((_ is Found!8881) lt!406205)))))

(declare-datatypes ((Unit!30538 0))(
  ( (Unit!30539) )
))
(declare-fun lt!406207 () Unit!30538)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!102 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 64)) Unit!30538)

(assert (=> b!899738 (= lt!406207 (lemmaSeekEntryGivesInRangeIndex!102 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52777 (_ BitVec 32)) SeekEntryResult!8881)

(assert (=> b!899738 (= lt!406205 (seekEntry!0 key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)))))

(declare-fun b!899739 () Bool)

(declare-fun e!503426 () Bool)

(declare-fun tp_is_empty!18349 () Bool)

(assert (=> b!899739 (= e!503426 tp_is_empty!18349)))

(declare-fun b!899740 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899740 (= e!503429 (inRange!0 (index!37896 lt!406205) (mask!26203 thiss!1181)))))

(declare-fun b!899741 () Bool)

(declare-fun e!503433 () Bool)

(assert (=> b!899741 (= e!503433 tp_is_empty!18349)))

(declare-fun b!899742 () Bool)

(declare-fun e!503425 () Bool)

(declare-fun mapRes!29182 () Bool)

(assert (=> b!899742 (= e!503425 (and e!503426 mapRes!29182))))

(declare-fun condMapEmpty!29182 () Bool)

(declare-fun mapDefault!29182 () ValueCell!8693)

(assert (=> b!899742 (= condMapEmpty!29182 (= (arr!25361 (_values!5428 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8693)) mapDefault!29182)))))

(declare-fun mapIsEmpty!29182 () Bool)

(assert (=> mapIsEmpty!29182 mapRes!29182))

(declare-fun b!899743 () Bool)

(declare-fun e!503432 () Bool)

(assert (=> b!899743 (= e!503432 (or (not (= (size!25818 (_values!5428 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26203 thiss!1181)))) (= (size!25817 (_keys!10228 thiss!1181)) (size!25818 (_values!5428 thiss!1181)))))))

(declare-fun array_inv!19956 (array!52777) Bool)

(declare-fun array_inv!19957 (array!52779) Bool)

(assert (=> b!899744 (= e!503428 (and tp!56137 tp_is_empty!18349 (array_inv!19956 (_keys!10228 thiss!1181)) (array_inv!19957 (_values!5428 thiss!1181)) e!503425))))

(declare-fun mapNonEmpty!29182 () Bool)

(declare-fun tp!56136 () Bool)

(assert (=> mapNonEmpty!29182 (= mapRes!29182 (and tp!56136 e!503433))))

(declare-fun mapKey!29182 () (_ BitVec 32))

(declare-fun mapRest!29182 () (Array (_ BitVec 32) ValueCell!8693))

(declare-fun mapValue!29182 () ValueCell!8693)

(assert (=> mapNonEmpty!29182 (= (arr!25361 (_values!5428 thiss!1181)) (store mapRest!29182 mapKey!29182 mapValue!29182))))

(declare-fun b!899745 () Bool)

(declare-fun res!607679 () Bool)

(assert (=> b!899745 (=> (not res!607679) (not e!503427))))

(assert (=> b!899745 (= res!607679 (not (= key!785 (bvneg key!785))))))

(declare-fun b!899746 () Bool)

(assert (=> b!899746 (= e!503430 e!503432)))

(declare-fun res!607678 () Bool)

(assert (=> b!899746 (=> res!607678 e!503432)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899746 (= res!607678 (not (validMask!0 (mask!26203 thiss!1181))))))

(declare-datatypes ((tuple2!11954 0))(
  ( (tuple2!11955 (_1!5988 (_ BitVec 64)) (_2!5988 V!29431)) )
))
(declare-datatypes ((List!17793 0))(
  ( (Nil!17790) (Cons!17789 (h!18938 tuple2!11954) (t!25128 List!17793)) )
))
(declare-datatypes ((ListLongMap!10653 0))(
  ( (ListLongMap!10654 (toList!5342 List!17793)) )
))
(declare-fun contains!4385 (ListLongMap!10653 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2614 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 32) Int) ListLongMap!10653)

(assert (=> b!899746 (contains!4385 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205)))))

(declare-fun lt!406204 () Unit!30538)

(declare-fun lemmaValidKeyInArrayIsInListMap!244 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 32) Int) Unit!30538)

(assert (=> b!899746 (= lt!406204 (lemmaValidKeyInArrayIsInListMap!244 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (index!37896 lt!406205) (defaultEntry!5419 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899746 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406206 () Unit!30538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52777 (_ BitVec 64) (_ BitVec 32)) Unit!30538)

(assert (=> b!899746 (= lt!406206 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10228 thiss!1181) key!785 (index!37896 lt!406205)))))

(assert (= (and start!77044 res!607676) b!899745))

(assert (= (and b!899745 res!607679) b!899738))

(assert (= (and b!899738 (not res!607680)) b!899740))

(assert (= (and b!899738 (not res!607677)) b!899746))

(assert (= (and b!899746 (not res!607678)) b!899743))

(assert (= (and b!899742 condMapEmpty!29182) mapIsEmpty!29182))

(assert (= (and b!899742 (not condMapEmpty!29182)) mapNonEmpty!29182))

(assert (= (and mapNonEmpty!29182 ((_ is ValueCellFull!8693) mapValue!29182)) b!899741))

(assert (= (and b!899742 ((_ is ValueCellFull!8693) mapDefault!29182)) b!899739))

(assert (= b!899744 b!899742))

(assert (= start!77044 b!899744))

(declare-fun m!836627 () Bool)

(assert (=> b!899744 m!836627))

(declare-fun m!836629 () Bool)

(assert (=> b!899744 m!836629))

(declare-fun m!836631 () Bool)

(assert (=> b!899738 m!836631))

(declare-fun m!836633 () Bool)

(assert (=> b!899738 m!836633))

(declare-fun m!836635 () Bool)

(assert (=> b!899746 m!836635))

(declare-fun m!836637 () Bool)

(assert (=> b!899746 m!836637))

(declare-fun m!836639 () Bool)

(assert (=> b!899746 m!836639))

(declare-fun m!836641 () Bool)

(assert (=> b!899746 m!836641))

(declare-fun m!836643 () Bool)

(assert (=> b!899746 m!836643))

(declare-fun m!836645 () Bool)

(assert (=> b!899746 m!836645))

(declare-fun m!836647 () Bool)

(assert (=> b!899746 m!836647))

(assert (=> b!899746 m!836643))

(assert (=> b!899746 m!836641))

(declare-fun m!836649 () Bool)

(assert (=> start!77044 m!836649))

(declare-fun m!836651 () Bool)

(assert (=> mapNonEmpty!29182 m!836651))

(declare-fun m!836653 () Bool)

(assert (=> b!899740 m!836653))

(check-sat b_and!26331 (not mapNonEmpty!29182) (not b!899746) (not b!899740) (not b!899738) tp_is_empty!18349 (not start!77044) (not b_next!16021) (not b!899744))
(check-sat b_and!26331 (not b_next!16021))
(get-model)

(declare-fun d!111671 () Bool)

(declare-fun e!503490 () Bool)

(assert (=> d!111671 e!503490))

(declare-fun res!607713 () Bool)

(assert (=> d!111671 (=> res!607713 e!503490)))

(declare-fun lt!406237 () SeekEntryResult!8881)

(assert (=> d!111671 (= res!607713 (not ((_ is Found!8881) lt!406237)))))

(assert (=> d!111671 (= lt!406237 (seekEntry!0 key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)))))

(declare-fun lt!406236 () Unit!30538)

(declare-fun choose!1501 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 64)) Unit!30538)

(assert (=> d!111671 (= lt!406236 (choose!1501 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) key!785))))

(assert (=> d!111671 (validMask!0 (mask!26203 thiss!1181))))

(assert (=> d!111671 (= (lemmaSeekEntryGivesInRangeIndex!102 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) key!785) lt!406236)))

(declare-fun b!899803 () Bool)

(assert (=> b!899803 (= e!503490 (inRange!0 (index!37896 lt!406237) (mask!26203 thiss!1181)))))

(assert (= (and d!111671 (not res!607713)) b!899803))

(assert (=> d!111671 m!836633))

(declare-fun m!836711 () Bool)

(assert (=> d!111671 m!836711))

(assert (=> d!111671 m!836637))

(declare-fun m!836713 () Bool)

(assert (=> b!899803 m!836713))

(assert (=> b!899738 d!111671))

(declare-fun b!899816 () Bool)

(declare-fun e!503497 () SeekEntryResult!8881)

(declare-fun lt!406249 () SeekEntryResult!8881)

(assert (=> b!899816 (= e!503497 (Found!8881 (index!37897 lt!406249)))))

(declare-fun b!899817 () Bool)

(declare-fun e!503498 () SeekEntryResult!8881)

(assert (=> b!899817 (= e!503498 e!503497)))

(declare-fun lt!406246 () (_ BitVec 64))

(assert (=> b!899817 (= lt!406246 (select (arr!25360 (_keys!10228 thiss!1181)) (index!37897 lt!406249)))))

(declare-fun c!95317 () Bool)

(assert (=> b!899817 (= c!95317 (= lt!406246 key!785))))

(declare-fun b!899818 () Bool)

(assert (=> b!899818 (= e!503498 Undefined!8881)))

(declare-fun d!111673 () Bool)

(declare-fun lt!406248 () SeekEntryResult!8881)

(assert (=> d!111673 (and (or ((_ is MissingVacant!8881) lt!406248) (not ((_ is Found!8881) lt!406248)) (and (bvsge (index!37896 lt!406248) #b00000000000000000000000000000000) (bvslt (index!37896 lt!406248) (size!25817 (_keys!10228 thiss!1181))))) (not ((_ is MissingVacant!8881) lt!406248)) (or (not ((_ is Found!8881) lt!406248)) (= (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406248)) key!785)))))

(assert (=> d!111673 (= lt!406248 e!503498)))

(declare-fun c!95319 () Bool)

(assert (=> d!111673 (= c!95319 (and ((_ is Intermediate!8881) lt!406249) (undefined!9693 lt!406249)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52777 (_ BitVec 32)) SeekEntryResult!8881)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111673 (= lt!406249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26203 thiss!1181)) key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)))))

(assert (=> d!111673 (validMask!0 (mask!26203 thiss!1181))))

(assert (=> d!111673 (= (seekEntry!0 key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)) lt!406248)))

(declare-fun b!899819 () Bool)

(declare-fun e!503499 () SeekEntryResult!8881)

(declare-fun lt!406247 () SeekEntryResult!8881)

(assert (=> b!899819 (= e!503499 (ite ((_ is MissingVacant!8881) lt!406247) (MissingZero!8881 (index!37898 lt!406247)) lt!406247))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52777 (_ BitVec 32)) SeekEntryResult!8881)

(assert (=> b!899819 (= lt!406247 (seekKeyOrZeroReturnVacant!0 (x!76568 lt!406249) (index!37897 lt!406249) (index!37897 lt!406249) key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)))))

(declare-fun b!899820 () Bool)

(assert (=> b!899820 (= e!503499 (MissingZero!8881 (index!37897 lt!406249)))))

(declare-fun b!899821 () Bool)

(declare-fun c!95318 () Bool)

(assert (=> b!899821 (= c!95318 (= lt!406246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899821 (= e!503497 e!503499)))

(assert (= (and d!111673 c!95319) b!899818))

(assert (= (and d!111673 (not c!95319)) b!899817))

(assert (= (and b!899817 c!95317) b!899816))

(assert (= (and b!899817 (not c!95317)) b!899821))

(assert (= (and b!899821 c!95318) b!899820))

(assert (= (and b!899821 (not c!95318)) b!899819))

(declare-fun m!836715 () Bool)

(assert (=> b!899817 m!836715))

(declare-fun m!836717 () Bool)

(assert (=> d!111673 m!836717))

(declare-fun m!836719 () Bool)

(assert (=> d!111673 m!836719))

(assert (=> d!111673 m!836719))

(declare-fun m!836721 () Bool)

(assert (=> d!111673 m!836721))

(assert (=> d!111673 m!836637))

(declare-fun m!836723 () Bool)

(assert (=> b!899819 m!836723))

(assert (=> b!899738 d!111673))

(declare-fun d!111675 () Bool)

(declare-fun res!607720 () Bool)

(declare-fun e!503502 () Bool)

(assert (=> d!111675 (=> (not res!607720) (not e!503502))))

(declare-fun simpleValid!325 (LongMapFixedSize!4402) Bool)

(assert (=> d!111675 (= res!607720 (simpleValid!325 thiss!1181))))

(assert (=> d!111675 (= (valid!1705 thiss!1181) e!503502)))

(declare-fun b!899828 () Bool)

(declare-fun res!607721 () Bool)

(assert (=> b!899828 (=> (not res!607721) (not e!503502))))

(declare-fun arrayCountValidKeys!0 (array!52777 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899828 (= res!607721 (= (arrayCountValidKeys!0 (_keys!10228 thiss!1181) #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))) (_size!2256 thiss!1181)))))

(declare-fun b!899829 () Bool)

(declare-fun res!607722 () Bool)

(assert (=> b!899829 (=> (not res!607722) (not e!503502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52777 (_ BitVec 32)) Bool)

(assert (=> b!899829 (= res!607722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)))))

(declare-fun b!899830 () Bool)

(declare-datatypes ((List!17795 0))(
  ( (Nil!17792) (Cons!17791 (h!18940 (_ BitVec 64)) (t!25132 List!17795)) )
))
(declare-fun arrayNoDuplicates!0 (array!52777 (_ BitVec 32) List!17795) Bool)

(assert (=> b!899830 (= e!503502 (arrayNoDuplicates!0 (_keys!10228 thiss!1181) #b00000000000000000000000000000000 Nil!17792))))

(assert (= (and d!111675 res!607720) b!899828))

(assert (= (and b!899828 res!607721) b!899829))

(assert (= (and b!899829 res!607722) b!899830))

(declare-fun m!836725 () Bool)

(assert (=> d!111675 m!836725))

(declare-fun m!836727 () Bool)

(assert (=> b!899828 m!836727))

(declare-fun m!836729 () Bool)

(assert (=> b!899829 m!836729))

(declare-fun m!836731 () Bool)

(assert (=> b!899830 m!836731))

(assert (=> start!77044 d!111675))

(declare-fun d!111677 () Bool)

(assert (=> d!111677 (= (validMask!0 (mask!26203 thiss!1181)) (and (or (= (mask!26203 thiss!1181) #b00000000000000000000000000000111) (= (mask!26203 thiss!1181) #b00000000000000000000000000001111) (= (mask!26203 thiss!1181) #b00000000000000000000000000011111) (= (mask!26203 thiss!1181) #b00000000000000000000000000111111) (= (mask!26203 thiss!1181) #b00000000000000000000000001111111) (= (mask!26203 thiss!1181) #b00000000000000000000000011111111) (= (mask!26203 thiss!1181) #b00000000000000000000000111111111) (= (mask!26203 thiss!1181) #b00000000000000000000001111111111) (= (mask!26203 thiss!1181) #b00000000000000000000011111111111) (= (mask!26203 thiss!1181) #b00000000000000000000111111111111) (= (mask!26203 thiss!1181) #b00000000000000000001111111111111) (= (mask!26203 thiss!1181) #b00000000000000000011111111111111) (= (mask!26203 thiss!1181) #b00000000000000000111111111111111) (= (mask!26203 thiss!1181) #b00000000000000001111111111111111) (= (mask!26203 thiss!1181) #b00000000000000011111111111111111) (= (mask!26203 thiss!1181) #b00000000000000111111111111111111) (= (mask!26203 thiss!1181) #b00000000000001111111111111111111) (= (mask!26203 thiss!1181) #b00000000000011111111111111111111) (= (mask!26203 thiss!1181) #b00000000000111111111111111111111) (= (mask!26203 thiss!1181) #b00000000001111111111111111111111) (= (mask!26203 thiss!1181) #b00000000011111111111111111111111) (= (mask!26203 thiss!1181) #b00000000111111111111111111111111) (= (mask!26203 thiss!1181) #b00000001111111111111111111111111) (= (mask!26203 thiss!1181) #b00000011111111111111111111111111) (= (mask!26203 thiss!1181) #b00000111111111111111111111111111) (= (mask!26203 thiss!1181) #b00001111111111111111111111111111) (= (mask!26203 thiss!1181) #b00011111111111111111111111111111) (= (mask!26203 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26203 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!899746 d!111677))

(declare-fun d!111679 () Bool)

(declare-fun res!607727 () Bool)

(declare-fun e!503507 () Bool)

(assert (=> d!111679 (=> res!607727 e!503507)))

(assert (=> d!111679 (= res!607727 (= (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111679 (= (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 #b00000000000000000000000000000000) e!503507)))

(declare-fun b!899835 () Bool)

(declare-fun e!503508 () Bool)

(assert (=> b!899835 (= e!503507 e!503508)))

(declare-fun res!607728 () Bool)

(assert (=> b!899835 (=> (not res!607728) (not e!503508))))

(assert (=> b!899835 (= res!607728 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun b!899836 () Bool)

(assert (=> b!899836 (= e!503508 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111679 (not res!607727)) b!899835))

(assert (= (and b!899835 res!607728) b!899836))

(declare-fun m!836733 () Bool)

(assert (=> d!111679 m!836733))

(declare-fun m!836735 () Bool)

(assert (=> b!899836 m!836735))

(assert (=> b!899746 d!111679))

(declare-fun d!111681 () Bool)

(assert (=> d!111681 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406252 () Unit!30538)

(declare-fun choose!13 (array!52777 (_ BitVec 64) (_ BitVec 32)) Unit!30538)

(assert (=> d!111681 (= lt!406252 (choose!13 (_keys!10228 thiss!1181) key!785 (index!37896 lt!406205)))))

(assert (=> d!111681 (bvsge (index!37896 lt!406205) #b00000000000000000000000000000000)))

(assert (=> d!111681 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10228 thiss!1181) key!785 (index!37896 lt!406205)) lt!406252)))

(declare-fun bs!25244 () Bool)

(assert (= bs!25244 d!111681))

(assert (=> bs!25244 m!836635))

(declare-fun m!836737 () Bool)

(assert (=> bs!25244 m!836737))

(assert (=> b!899746 d!111681))

(declare-fun d!111683 () Bool)

(declare-fun e!503511 () Bool)

(assert (=> d!111683 e!503511))

(declare-fun res!607731 () Bool)

(assert (=> d!111683 (=> (not res!607731) (not e!503511))))

(assert (=> d!111683 (= res!607731 (and (bvsge (index!37896 lt!406205) #b00000000000000000000000000000000) (bvslt (index!37896 lt!406205) (size!25817 (_keys!10228 thiss!1181)))))))

(declare-fun lt!406255 () Unit!30538)

(declare-fun choose!1502 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 32) Int) Unit!30538)

(assert (=> d!111683 (= lt!406255 (choose!1502 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (index!37896 lt!406205) (defaultEntry!5419 thiss!1181)))))

(assert (=> d!111683 (validMask!0 (mask!26203 thiss!1181))))

(assert (=> d!111683 (= (lemmaValidKeyInArrayIsInListMap!244 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (index!37896 lt!406205) (defaultEntry!5419 thiss!1181)) lt!406255)))

(declare-fun b!899839 () Bool)

(assert (=> b!899839 (= e!503511 (contains!4385 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))

(assert (= (and d!111683 res!607731) b!899839))

(declare-fun m!836739 () Bool)

(assert (=> d!111683 m!836739))

(assert (=> d!111683 m!836637))

(assert (=> b!899839 m!836641))

(assert (=> b!899839 m!836643))

(assert (=> b!899839 m!836641))

(assert (=> b!899839 m!836643))

(assert (=> b!899839 m!836645))

(assert (=> b!899746 d!111683))

(declare-fun b!899882 () Bool)

(declare-fun e!503548 () ListLongMap!10653)

(declare-fun call!39954 () ListLongMap!10653)

(assert (=> b!899882 (= e!503548 call!39954)))

(declare-fun b!899884 () Bool)

(declare-fun e!503539 () Bool)

(declare-fun call!39955 () Bool)

(assert (=> b!899884 (= e!503539 (not call!39955))))

(declare-fun b!899885 () Bool)

(declare-fun e!503547 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!899885 (= e!503547 (validKeyInArray!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899886 () Bool)

(declare-fun e!503545 () Bool)

(assert (=> b!899886 (= e!503545 (validKeyInArray!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899887 () Bool)

(declare-fun e!503543 () Bool)

(declare-fun e!503550 () Bool)

(assert (=> b!899887 (= e!503543 e!503550)))

(declare-fun res!607755 () Bool)

(declare-fun call!39951 () Bool)

(assert (=> b!899887 (= res!607755 call!39951)))

(assert (=> b!899887 (=> (not res!607755) (not e!503550))))

(declare-fun bm!39946 () Bool)

(declare-fun call!39953 () ListLongMap!10653)

(declare-fun call!39950 () ListLongMap!10653)

(assert (=> bm!39946 (= call!39953 call!39950)))

(declare-fun b!899888 () Bool)

(declare-fun e!503538 () Unit!30538)

(declare-fun lt!406318 () Unit!30538)

(assert (=> b!899888 (= e!503538 lt!406318)))

(declare-fun lt!406319 () ListLongMap!10653)

(declare-fun getCurrentListMapNoExtraKeys!3323 (array!52777 array!52779 (_ BitVec 32) (_ BitVec 32) V!29431 V!29431 (_ BitVec 32) Int) ListLongMap!10653)

(assert (=> b!899888 (= lt!406319 (getCurrentListMapNoExtraKeys!3323 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun lt!406320 () (_ BitVec 64))

(assert (=> b!899888 (= lt!406320 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406312 () (_ BitVec 64))

(assert (=> b!899888 (= lt!406312 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406309 () Unit!30538)

(declare-fun addStillContains!333 (ListLongMap!10653 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30538)

(assert (=> b!899888 (= lt!406309 (addStillContains!333 lt!406319 lt!406320 (zeroValue!5241 thiss!1181) lt!406312))))

(declare-fun +!2602 (ListLongMap!10653 tuple2!11954) ListLongMap!10653)

(assert (=> b!899888 (contains!4385 (+!2602 lt!406319 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181))) lt!406312)))

(declare-fun lt!406313 () Unit!30538)

(assert (=> b!899888 (= lt!406313 lt!406309)))

(declare-fun lt!406317 () ListLongMap!10653)

(assert (=> b!899888 (= lt!406317 (getCurrentListMapNoExtraKeys!3323 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun lt!406304 () (_ BitVec 64))

(assert (=> b!899888 (= lt!406304 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406302 () (_ BitVec 64))

(assert (=> b!899888 (= lt!406302 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406316 () Unit!30538)

(declare-fun addApplyDifferent!333 (ListLongMap!10653 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30538)

(assert (=> b!899888 (= lt!406316 (addApplyDifferent!333 lt!406317 lt!406304 (minValue!5241 thiss!1181) lt!406302))))

(declare-fun apply!407 (ListLongMap!10653 (_ BitVec 64)) V!29431)

(assert (=> b!899888 (= (apply!407 (+!2602 lt!406317 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181))) lt!406302) (apply!407 lt!406317 lt!406302))))

(declare-fun lt!406307 () Unit!30538)

(assert (=> b!899888 (= lt!406307 lt!406316)))

(declare-fun lt!406311 () ListLongMap!10653)

(assert (=> b!899888 (= lt!406311 (getCurrentListMapNoExtraKeys!3323 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun lt!406321 () (_ BitVec 64))

(assert (=> b!899888 (= lt!406321 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406303 () (_ BitVec 64))

(assert (=> b!899888 (= lt!406303 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406305 () Unit!30538)

(assert (=> b!899888 (= lt!406305 (addApplyDifferent!333 lt!406311 lt!406321 (zeroValue!5241 thiss!1181) lt!406303))))

(assert (=> b!899888 (= (apply!407 (+!2602 lt!406311 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181))) lt!406303) (apply!407 lt!406311 lt!406303))))

(declare-fun lt!406310 () Unit!30538)

(assert (=> b!899888 (= lt!406310 lt!406305)))

(declare-fun lt!406315 () ListLongMap!10653)

(assert (=> b!899888 (= lt!406315 (getCurrentListMapNoExtraKeys!3323 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun lt!406300 () (_ BitVec 64))

(assert (=> b!899888 (= lt!406300 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406301 () (_ BitVec 64))

(assert (=> b!899888 (= lt!406301 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899888 (= lt!406318 (addApplyDifferent!333 lt!406315 lt!406300 (minValue!5241 thiss!1181) lt!406301))))

(assert (=> b!899888 (= (apply!407 (+!2602 lt!406315 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181))) lt!406301) (apply!407 lt!406315 lt!406301))))

(declare-fun b!899889 () Bool)

(declare-fun e!503544 () Bool)

(declare-fun lt!406314 () ListLongMap!10653)

(declare-fun get!13349 (ValueCell!8693 V!29431) V!29431)

(declare-fun dynLambda!1322 (Int (_ BitVec 64)) V!29431)

(assert (=> b!899889 (= e!503544 (= (apply!407 lt!406314 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) (get!13349 (select (arr!25361 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1322 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25818 (_values!5428 thiss!1181))))))

(assert (=> b!899889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun b!899890 () Bool)

(declare-fun e!503542 () ListLongMap!10653)

(declare-fun call!39949 () ListLongMap!10653)

(assert (=> b!899890 (= e!503542 (+!2602 call!39949 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))

(declare-fun b!899883 () Bool)

(assert (=> b!899883 (= e!503550 (= (apply!407 lt!406314 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5241 thiss!1181)))))

(declare-fun d!111685 () Bool)

(declare-fun e!503546 () Bool)

(assert (=> d!111685 e!503546))

(declare-fun res!607750 () Bool)

(assert (=> d!111685 (=> (not res!607750) (not e!503546))))

(assert (=> d!111685 (= res!607750 (or (bvsge #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))))

(declare-fun lt!406308 () ListLongMap!10653)

(assert (=> d!111685 (= lt!406314 lt!406308)))

(declare-fun lt!406306 () Unit!30538)

(assert (=> d!111685 (= lt!406306 e!503538)))

(declare-fun c!95333 () Bool)

(assert (=> d!111685 (= c!95333 e!503547)))

(declare-fun res!607756 () Bool)

(assert (=> d!111685 (=> (not res!607756) (not e!503547))))

(assert (=> d!111685 (= res!607756 (bvslt #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(assert (=> d!111685 (= lt!406308 e!503542)))

(declare-fun c!95332 () Bool)

(assert (=> d!111685 (= c!95332 (and (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111685 (validMask!0 (mask!26203 thiss!1181))))

(assert (=> d!111685 (= (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) lt!406314)))

(declare-fun b!899891 () Bool)

(declare-fun e!503549 () ListLongMap!10653)

(assert (=> b!899891 (= e!503549 call!39954)))

(declare-fun b!899892 () Bool)

(assert (=> b!899892 (= e!503543 (not call!39951))))

(declare-fun b!899893 () Bool)

(declare-fun e!503540 () Bool)

(assert (=> b!899893 (= e!503539 e!503540)))

(declare-fun res!607757 () Bool)

(assert (=> b!899893 (= res!607757 call!39955)))

(assert (=> b!899893 (=> (not res!607757) (not e!503540))))

(declare-fun bm!39947 () Bool)

(declare-fun call!39952 () ListLongMap!10653)

(assert (=> bm!39947 (= call!39952 call!39953)))

(declare-fun bm!39948 () Bool)

(declare-fun c!95335 () Bool)

(assert (=> bm!39948 (= call!39949 (+!2602 (ite c!95332 call!39950 (ite c!95335 call!39953 call!39952)) (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(declare-fun b!899894 () Bool)

(declare-fun res!607751 () Bool)

(assert (=> b!899894 (=> (not res!607751) (not e!503546))))

(declare-fun e!503541 () Bool)

(assert (=> b!899894 (= res!607751 e!503541)))

(declare-fun res!607758 () Bool)

(assert (=> b!899894 (=> res!607758 e!503541)))

(assert (=> b!899894 (= res!607758 (not e!503545))))

(declare-fun res!607752 () Bool)

(assert (=> b!899894 (=> (not res!607752) (not e!503545))))

(assert (=> b!899894 (= res!607752 (bvslt #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun b!899895 () Bool)

(assert (=> b!899895 (= e!503540 (= (apply!407 lt!406314 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5241 thiss!1181)))))

(declare-fun bm!39949 () Bool)

(assert (=> bm!39949 (= call!39951 (contains!4385 lt!406314 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899896 () Bool)

(assert (=> b!899896 (= e!503549 call!39952)))

(declare-fun b!899897 () Bool)

(assert (=> b!899897 (= e!503542 e!503548)))

(assert (=> b!899897 (= c!95335 (and (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39950 () Bool)

(assert (=> bm!39950 (= call!39955 (contains!4385 lt!406314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899898 () Bool)

(assert (=> b!899898 (= e!503546 e!503543)))

(declare-fun c!95334 () Bool)

(assert (=> b!899898 (= c!95334 (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39951 () Bool)

(assert (=> bm!39951 (= call!39950 (getCurrentListMapNoExtraKeys!3323 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))

(declare-fun bm!39952 () Bool)

(assert (=> bm!39952 (= call!39954 call!39949)))

(declare-fun b!899899 () Bool)

(declare-fun res!607754 () Bool)

(assert (=> b!899899 (=> (not res!607754) (not e!503546))))

(assert (=> b!899899 (= res!607754 e!503539)))

(declare-fun c!95336 () Bool)

(assert (=> b!899899 (= c!95336 (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!899900 () Bool)

(declare-fun c!95337 () Bool)

(assert (=> b!899900 (= c!95337 (and (not (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!899900 (= e!503548 e!503549)))

(declare-fun b!899901 () Bool)

(declare-fun Unit!30544 () Unit!30538)

(assert (=> b!899901 (= e!503538 Unit!30544)))

(declare-fun b!899902 () Bool)

(assert (=> b!899902 (= e!503541 e!503544)))

(declare-fun res!607753 () Bool)

(assert (=> b!899902 (=> (not res!607753) (not e!503544))))

(assert (=> b!899902 (= res!607753 (contains!4385 lt!406314 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899902 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(assert (= (and d!111685 c!95332) b!899890))

(assert (= (and d!111685 (not c!95332)) b!899897))

(assert (= (and b!899897 c!95335) b!899882))

(assert (= (and b!899897 (not c!95335)) b!899900))

(assert (= (and b!899900 c!95337) b!899891))

(assert (= (and b!899900 (not c!95337)) b!899896))

(assert (= (or b!899891 b!899896) bm!39947))

(assert (= (or b!899882 bm!39947) bm!39946))

(assert (= (or b!899882 b!899891) bm!39952))

(assert (= (or b!899890 bm!39946) bm!39951))

(assert (= (or b!899890 bm!39952) bm!39948))

(assert (= (and d!111685 res!607756) b!899885))

(assert (= (and d!111685 c!95333) b!899888))

(assert (= (and d!111685 (not c!95333)) b!899901))

(assert (= (and d!111685 res!607750) b!899894))

(assert (= (and b!899894 res!607752) b!899886))

(assert (= (and b!899894 (not res!607758)) b!899902))

(assert (= (and b!899902 res!607753) b!899889))

(assert (= (and b!899894 res!607751) b!899899))

(assert (= (and b!899899 c!95336) b!899893))

(assert (= (and b!899899 (not c!95336)) b!899884))

(assert (= (and b!899893 res!607757) b!899895))

(assert (= (or b!899893 b!899884) bm!39950))

(assert (= (and b!899899 res!607754) b!899898))

(assert (= (and b!899898 c!95334) b!899887))

(assert (= (and b!899898 (not c!95334)) b!899892))

(assert (= (and b!899887 res!607755) b!899883))

(assert (= (or b!899887 b!899892) bm!39949))

(declare-fun b_lambda!12989 () Bool)

(assert (=> (not b_lambda!12989) (not b!899889)))

(declare-fun t!25131 () Bool)

(declare-fun tb!5187 () Bool)

(assert (=> (and b!899744 (= (defaultEntry!5419 thiss!1181) (defaultEntry!5419 thiss!1181)) t!25131) tb!5187))

(declare-fun result!10149 () Bool)

(assert (=> tb!5187 (= result!10149 tp_is_empty!18349)))

(assert (=> b!899889 t!25131))

(declare-fun b_and!26337 () Bool)

(assert (= b_and!26331 (and (=> t!25131 result!10149) b_and!26337)))

(declare-fun m!836741 () Bool)

(assert (=> b!899890 m!836741))

(declare-fun m!836743 () Bool)

(assert (=> bm!39948 m!836743))

(assert (=> b!899902 m!836733))

(assert (=> b!899902 m!836733))

(declare-fun m!836745 () Bool)

(assert (=> b!899902 m!836745))

(declare-fun m!836747 () Bool)

(assert (=> bm!39949 m!836747))

(assert (=> b!899886 m!836733))

(assert (=> b!899886 m!836733))

(declare-fun m!836749 () Bool)

(assert (=> b!899886 m!836749))

(assert (=> b!899885 m!836733))

(assert (=> b!899885 m!836733))

(assert (=> b!899885 m!836749))

(assert (=> d!111685 m!836637))

(declare-fun m!836751 () Bool)

(assert (=> b!899888 m!836751))

(declare-fun m!836753 () Bool)

(assert (=> b!899888 m!836753))

(declare-fun m!836755 () Bool)

(assert (=> b!899888 m!836755))

(declare-fun m!836757 () Bool)

(assert (=> b!899888 m!836757))

(declare-fun m!836759 () Bool)

(assert (=> b!899888 m!836759))

(declare-fun m!836761 () Bool)

(assert (=> b!899888 m!836761))

(declare-fun m!836763 () Bool)

(assert (=> b!899888 m!836763))

(declare-fun m!836765 () Bool)

(assert (=> b!899888 m!836765))

(declare-fun m!836767 () Bool)

(assert (=> b!899888 m!836767))

(assert (=> b!899888 m!836753))

(declare-fun m!836769 () Bool)

(assert (=> b!899888 m!836769))

(declare-fun m!836771 () Bool)

(assert (=> b!899888 m!836771))

(assert (=> b!899888 m!836767))

(declare-fun m!836773 () Bool)

(assert (=> b!899888 m!836773))

(assert (=> b!899888 m!836761))

(declare-fun m!836775 () Bool)

(assert (=> b!899888 m!836775))

(declare-fun m!836777 () Bool)

(assert (=> b!899888 m!836777))

(assert (=> b!899888 m!836733))

(declare-fun m!836779 () Bool)

(assert (=> b!899888 m!836779))

(assert (=> b!899888 m!836763))

(declare-fun m!836781 () Bool)

(assert (=> b!899888 m!836781))

(declare-fun m!836783 () Bool)

(assert (=> b!899889 m!836783))

(declare-fun m!836785 () Bool)

(assert (=> b!899889 m!836785))

(declare-fun m!836787 () Bool)

(assert (=> b!899889 m!836787))

(assert (=> b!899889 m!836783))

(assert (=> b!899889 m!836785))

(assert (=> b!899889 m!836733))

(declare-fun m!836789 () Bool)

(assert (=> b!899889 m!836789))

(assert (=> b!899889 m!836733))

(declare-fun m!836791 () Bool)

(assert (=> b!899883 m!836791))

(declare-fun m!836793 () Bool)

(assert (=> b!899895 m!836793))

(declare-fun m!836795 () Bool)

(assert (=> bm!39950 m!836795))

(assert (=> bm!39951 m!836751))

(assert (=> b!899746 d!111685))

(declare-fun d!111687 () Bool)

(declare-fun e!503556 () Bool)

(assert (=> d!111687 e!503556))

(declare-fun res!607761 () Bool)

(assert (=> d!111687 (=> res!607761 e!503556)))

(declare-fun lt!406331 () Bool)

(assert (=> d!111687 (= res!607761 (not lt!406331))))

(declare-fun lt!406332 () Bool)

(assert (=> d!111687 (= lt!406331 lt!406332)))

(declare-fun lt!406330 () Unit!30538)

(declare-fun e!503555 () Unit!30538)

(assert (=> d!111687 (= lt!406330 e!503555)))

(declare-fun c!95340 () Bool)

(assert (=> d!111687 (= c!95340 lt!406332)))

(declare-fun containsKey!428 (List!17793 (_ BitVec 64)) Bool)

(assert (=> d!111687 (= lt!406332 (containsKey!428 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))

(assert (=> d!111687 (= (contains!4385 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))) lt!406331)))

(declare-fun b!899911 () Bool)

(declare-fun lt!406333 () Unit!30538)

(assert (=> b!899911 (= e!503555 lt!406333)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!322 (List!17793 (_ BitVec 64)) Unit!30538)

(assert (=> b!899911 (= lt!406333 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))

(declare-datatypes ((Option!461 0))(
  ( (Some!460 (v!11717 V!29431)) (None!459) )
))
(declare-fun isDefined!330 (Option!461) Bool)

(declare-fun getValueByKey!455 (List!17793 (_ BitVec 64)) Option!461)

(assert (=> b!899911 (isDefined!330 (getValueByKey!455 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))

(declare-fun b!899912 () Bool)

(declare-fun Unit!30545 () Unit!30538)

(assert (=> b!899912 (= e!503555 Unit!30545)))

(declare-fun b!899913 () Bool)

(assert (=> b!899913 (= e!503556 (isDefined!330 (getValueByKey!455 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205)))))))

(assert (= (and d!111687 c!95340) b!899911))

(assert (= (and d!111687 (not c!95340)) b!899912))

(assert (= (and d!111687 (not res!607761)) b!899913))

(assert (=> d!111687 m!836643))

(declare-fun m!836797 () Bool)

(assert (=> d!111687 m!836797))

(assert (=> b!899911 m!836643))

(declare-fun m!836799 () Bool)

(assert (=> b!899911 m!836799))

(assert (=> b!899911 m!836643))

(declare-fun m!836801 () Bool)

(assert (=> b!899911 m!836801))

(assert (=> b!899911 m!836801))

(declare-fun m!836803 () Bool)

(assert (=> b!899911 m!836803))

(assert (=> b!899913 m!836643))

(assert (=> b!899913 m!836801))

(assert (=> b!899913 m!836801))

(assert (=> b!899913 m!836803))

(assert (=> b!899746 d!111687))

(declare-fun d!111689 () Bool)

(assert (=> d!111689 (= (array_inv!19956 (_keys!10228 thiss!1181)) (bvsge (size!25817 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899744 d!111689))

(declare-fun d!111691 () Bool)

(assert (=> d!111691 (= (array_inv!19957 (_values!5428 thiss!1181)) (bvsge (size!25818 (_values!5428 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899744 d!111691))

(declare-fun d!111693 () Bool)

(assert (=> d!111693 (= (inRange!0 (index!37896 lt!406205) (mask!26203 thiss!1181)) (and (bvsge (index!37896 lt!406205) #b00000000000000000000000000000000) (bvslt (index!37896 lt!406205) (bvadd (mask!26203 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899740 d!111693))

(declare-fun mapNonEmpty!29191 () Bool)

(declare-fun mapRes!29191 () Bool)

(declare-fun tp!56152 () Bool)

(declare-fun e!503562 () Bool)

(assert (=> mapNonEmpty!29191 (= mapRes!29191 (and tp!56152 e!503562))))

(declare-fun mapRest!29191 () (Array (_ BitVec 32) ValueCell!8693))

(declare-fun mapKey!29191 () (_ BitVec 32))

(declare-fun mapValue!29191 () ValueCell!8693)

(assert (=> mapNonEmpty!29191 (= mapRest!29182 (store mapRest!29191 mapKey!29191 mapValue!29191))))

(declare-fun mapIsEmpty!29191 () Bool)

(assert (=> mapIsEmpty!29191 mapRes!29191))

(declare-fun condMapEmpty!29191 () Bool)

(declare-fun mapDefault!29191 () ValueCell!8693)

(assert (=> mapNonEmpty!29182 (= condMapEmpty!29191 (= mapRest!29182 ((as const (Array (_ BitVec 32) ValueCell!8693)) mapDefault!29191)))))

(declare-fun e!503561 () Bool)

(assert (=> mapNonEmpty!29182 (= tp!56136 (and e!503561 mapRes!29191))))

(declare-fun b!899920 () Bool)

(assert (=> b!899920 (= e!503562 tp_is_empty!18349)))

(declare-fun b!899921 () Bool)

(assert (=> b!899921 (= e!503561 tp_is_empty!18349)))

(assert (= (and mapNonEmpty!29182 condMapEmpty!29191) mapIsEmpty!29191))

(assert (= (and mapNonEmpty!29182 (not condMapEmpty!29191)) mapNonEmpty!29191))

(assert (= (and mapNonEmpty!29191 ((_ is ValueCellFull!8693) mapValue!29191)) b!899920))

(assert (= (and mapNonEmpty!29182 ((_ is ValueCellFull!8693) mapDefault!29191)) b!899921))

(declare-fun m!836805 () Bool)

(assert (=> mapNonEmpty!29191 m!836805))

(declare-fun b_lambda!12991 () Bool)

(assert (= b_lambda!12989 (or (and b!899744 b_free!16021) b_lambda!12991)))

(check-sat (not b!899886) (not bm!39951) (not d!111683) (not b!899890) (not b_next!16021) (not b!899911) (not d!111673) (not b!899839) (not b!899803) (not b!899888) (not b!899830) (not b!899895) (not d!111687) (not b!899885) (not d!111675) tp_is_empty!18349 (not b!899902) (not b!899828) (not b!899829) (not bm!39950) (not d!111685) (not d!111671) (not b!899913) (not b!899889) (not bm!39948) (not b!899883) b_and!26337 (not bm!39949) (not b_lambda!12991) (not mapNonEmpty!29191) (not d!111681) (not b!899819) (not b!899836))
(check-sat b_and!26337 (not b_next!16021))
(get-model)

(declare-fun d!111695 () Bool)

(assert (=> d!111695 (isDefined!330 (getValueByKey!455 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))

(declare-fun lt!406336 () Unit!30538)

(declare-fun choose!1503 (List!17793 (_ BitVec 64)) Unit!30538)

(assert (=> d!111695 (= lt!406336 (choose!1503 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))

(declare-fun e!503565 () Bool)

(assert (=> d!111695 e!503565))

(declare-fun res!607764 () Bool)

(assert (=> d!111695 (=> (not res!607764) (not e!503565))))

(declare-fun isStrictlySorted!486 (List!17793) Bool)

(assert (=> d!111695 (= res!607764 (isStrictlySorted!486 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))))

(assert (=> d!111695 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))) lt!406336)))

(declare-fun b!899924 () Bool)

(assert (=> b!899924 (= e!503565 (containsKey!428 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))

(assert (= (and d!111695 res!607764) b!899924))

(assert (=> d!111695 m!836643))

(assert (=> d!111695 m!836801))

(assert (=> d!111695 m!836801))

(assert (=> d!111695 m!836803))

(assert (=> d!111695 m!836643))

(declare-fun m!836807 () Bool)

(assert (=> d!111695 m!836807))

(declare-fun m!836809 () Bool)

(assert (=> d!111695 m!836809))

(assert (=> b!899924 m!836643))

(assert (=> b!899924 m!836797))

(assert (=> b!899911 d!111695))

(declare-fun d!111697 () Bool)

(declare-fun isEmpty!692 (Option!461) Bool)

(assert (=> d!111697 (= (isDefined!330 (getValueByKey!455 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205)))) (not (isEmpty!692 (getValueByKey!455 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))))

(declare-fun bs!25245 () Bool)

(assert (= bs!25245 d!111697))

(assert (=> bs!25245 m!836801))

(declare-fun m!836811 () Bool)

(assert (=> bs!25245 m!836811))

(assert (=> b!899911 d!111697))

(declare-fun b!899936 () Bool)

(declare-fun e!503571 () Option!461)

(assert (=> b!899936 (= e!503571 None!459)))

(declare-fun d!111699 () Bool)

(declare-fun c!95345 () Bool)

(assert (=> d!111699 (= c!95345 (and ((_ is Cons!17789) (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (= (_1!5988 (h!18938 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205)))))))

(declare-fun e!503570 () Option!461)

(assert (=> d!111699 (= (getValueByKey!455 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))) e!503570)))

(declare-fun b!899933 () Bool)

(assert (=> b!899933 (= e!503570 (Some!460 (_2!5988 (h!18938 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))))))))

(declare-fun b!899935 () Bool)

(assert (=> b!899935 (= e!503571 (getValueByKey!455 (t!25128 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))

(declare-fun b!899934 () Bool)

(assert (=> b!899934 (= e!503570 e!503571)))

(declare-fun c!95346 () Bool)

(assert (=> b!899934 (= c!95346 (and ((_ is Cons!17789) (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (not (= (_1!5988 (h!18938 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))))

(assert (= (and d!111699 c!95345) b!899933))

(assert (= (and d!111699 (not c!95345)) b!899934))

(assert (= (and b!899934 c!95346) b!899935))

(assert (= (and b!899934 (not c!95346)) b!899936))

(assert (=> b!899935 m!836643))

(declare-fun m!836813 () Bool)

(assert (=> b!899935 m!836813))

(assert (=> b!899911 d!111699))

(declare-fun d!111701 () Bool)

(declare-fun get!13350 (Option!461) V!29431)

(assert (=> d!111701 (= (apply!407 lt!406314 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) (get!13350 (getValueByKey!455 (toList!5342 lt!406314) (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25246 () Bool)

(assert (= bs!25246 d!111701))

(assert (=> bs!25246 m!836733))

(declare-fun m!836815 () Bool)

(assert (=> bs!25246 m!836815))

(assert (=> bs!25246 m!836815))

(declare-fun m!836817 () Bool)

(assert (=> bs!25246 m!836817))

(assert (=> b!899889 d!111701))

(declare-fun d!111703 () Bool)

(declare-fun c!95349 () Bool)

(assert (=> d!111703 (= c!95349 ((_ is ValueCellFull!8693) (select (arr!25361 (_values!5428 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503574 () V!29431)

(assert (=> d!111703 (= (get!13349 (select (arr!25361 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1322 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!503574)))

(declare-fun b!899941 () Bool)

(declare-fun get!13351 (ValueCell!8693 V!29431) V!29431)

(assert (=> b!899941 (= e!503574 (get!13351 (select (arr!25361 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1322 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899942 () Bool)

(declare-fun get!13352 (ValueCell!8693 V!29431) V!29431)

(assert (=> b!899942 (= e!503574 (get!13352 (select (arr!25361 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1322 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111703 c!95349) b!899941))

(assert (= (and d!111703 (not c!95349)) b!899942))

(assert (=> b!899941 m!836783))

(assert (=> b!899941 m!836785))

(declare-fun m!836819 () Bool)

(assert (=> b!899941 m!836819))

(assert (=> b!899942 m!836783))

(assert (=> b!899942 m!836785))

(declare-fun m!836821 () Bool)

(assert (=> b!899942 m!836821))

(assert (=> b!899889 d!111703))

(declare-fun d!111705 () Bool)

(assert (=> d!111705 (= (inRange!0 (index!37896 lt!406237) (mask!26203 thiss!1181)) (and (bvsge (index!37896 lt!406237) #b00000000000000000000000000000000) (bvslt (index!37896 lt!406237) (bvadd (mask!26203 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899803 d!111705))

(declare-fun d!111707 () Bool)

(declare-fun e!503577 () Bool)

(assert (=> d!111707 e!503577))

(declare-fun res!607769 () Bool)

(assert (=> d!111707 (=> (not res!607769) (not e!503577))))

(declare-fun lt!406348 () ListLongMap!10653)

(assert (=> d!111707 (= res!607769 (contains!4385 lt!406348 (_1!5988 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(declare-fun lt!406345 () List!17793)

(assert (=> d!111707 (= lt!406348 (ListLongMap!10654 lt!406345))))

(declare-fun lt!406346 () Unit!30538)

(declare-fun lt!406347 () Unit!30538)

(assert (=> d!111707 (= lt!406346 lt!406347)))

(assert (=> d!111707 (= (getValueByKey!455 lt!406345 (_1!5988 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!250 (List!17793 (_ BitVec 64) V!29431) Unit!30538)

(assert (=> d!111707 (= lt!406347 (lemmaContainsTupThenGetReturnValue!250 lt!406345 (_1!5988 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(declare-fun insertStrictlySorted!307 (List!17793 (_ BitVec 64) V!29431) List!17793)

(assert (=> d!111707 (= lt!406345 (insertStrictlySorted!307 (toList!5342 call!39949) (_1!5988 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(assert (=> d!111707 (= (+!2602 call!39949 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))) lt!406348)))

(declare-fun b!899947 () Bool)

(declare-fun res!607770 () Bool)

(assert (=> b!899947 (=> (not res!607770) (not e!503577))))

(assert (=> b!899947 (= res!607770 (= (getValueByKey!455 (toList!5342 lt!406348) (_1!5988 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(declare-fun b!899948 () Bool)

(declare-fun contains!4387 (List!17793 tuple2!11954) Bool)

(assert (=> b!899948 (= e!503577 (contains!4387 (toList!5342 lt!406348) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))

(assert (= (and d!111707 res!607769) b!899947))

(assert (= (and b!899947 res!607770) b!899948))

(declare-fun m!836823 () Bool)

(assert (=> d!111707 m!836823))

(declare-fun m!836825 () Bool)

(assert (=> d!111707 m!836825))

(declare-fun m!836827 () Bool)

(assert (=> d!111707 m!836827))

(declare-fun m!836829 () Bool)

(assert (=> d!111707 m!836829))

(declare-fun m!836831 () Bool)

(assert (=> b!899947 m!836831))

(declare-fun m!836833 () Bool)

(assert (=> b!899948 m!836833))

(assert (=> b!899890 d!111707))

(declare-fun d!111709 () Bool)

(declare-fun e!503579 () Bool)

(assert (=> d!111709 e!503579))

(declare-fun res!607771 () Bool)

(assert (=> d!111709 (=> res!607771 e!503579)))

(declare-fun lt!406350 () Bool)

(assert (=> d!111709 (= res!607771 (not lt!406350))))

(declare-fun lt!406351 () Bool)

(assert (=> d!111709 (= lt!406350 lt!406351)))

(declare-fun lt!406349 () Unit!30538)

(declare-fun e!503578 () Unit!30538)

(assert (=> d!111709 (= lt!406349 e!503578)))

(declare-fun c!95350 () Bool)

(assert (=> d!111709 (= c!95350 lt!406351)))

(assert (=> d!111709 (= lt!406351 (containsKey!428 (toList!5342 lt!406314) (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111709 (= (contains!4385 lt!406314 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) lt!406350)))

(declare-fun b!899949 () Bool)

(declare-fun lt!406352 () Unit!30538)

(assert (=> b!899949 (= e!503578 lt!406352)))

(assert (=> b!899949 (= lt!406352 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5342 lt!406314) (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899949 (isDefined!330 (getValueByKey!455 (toList!5342 lt!406314) (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899950 () Bool)

(declare-fun Unit!30546 () Unit!30538)

(assert (=> b!899950 (= e!503578 Unit!30546)))

(declare-fun b!899951 () Bool)

(assert (=> b!899951 (= e!503579 (isDefined!330 (getValueByKey!455 (toList!5342 lt!406314) (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111709 c!95350) b!899949))

(assert (= (and d!111709 (not c!95350)) b!899950))

(assert (= (and d!111709 (not res!607771)) b!899951))

(assert (=> d!111709 m!836733))

(declare-fun m!836835 () Bool)

(assert (=> d!111709 m!836835))

(assert (=> b!899949 m!836733))

(declare-fun m!836837 () Bool)

(assert (=> b!899949 m!836837))

(assert (=> b!899949 m!836733))

(assert (=> b!899949 m!836815))

(assert (=> b!899949 m!836815))

(declare-fun m!836839 () Bool)

(assert (=> b!899949 m!836839))

(assert (=> b!899951 m!836733))

(assert (=> b!899951 m!836815))

(assert (=> b!899951 m!836815))

(assert (=> b!899951 m!836839))

(assert (=> b!899902 d!111709))

(declare-fun d!111711 () Bool)

(assert (=> d!111711 (= (apply!407 (+!2602 lt!406311 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181))) lt!406303) (get!13350 (getValueByKey!455 (toList!5342 (+!2602 lt!406311 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181)))) lt!406303)))))

(declare-fun bs!25247 () Bool)

(assert (= bs!25247 d!111711))

(declare-fun m!836841 () Bool)

(assert (=> bs!25247 m!836841))

(assert (=> bs!25247 m!836841))

(declare-fun m!836843 () Bool)

(assert (=> bs!25247 m!836843))

(assert (=> b!899888 d!111711))

(declare-fun d!111713 () Bool)

(declare-fun e!503580 () Bool)

(assert (=> d!111713 e!503580))

(declare-fun res!607772 () Bool)

(assert (=> d!111713 (=> (not res!607772) (not e!503580))))

(declare-fun lt!406356 () ListLongMap!10653)

(assert (=> d!111713 (= res!607772 (contains!4385 lt!406356 (_1!5988 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))))))

(declare-fun lt!406353 () List!17793)

(assert (=> d!111713 (= lt!406356 (ListLongMap!10654 lt!406353))))

(declare-fun lt!406354 () Unit!30538)

(declare-fun lt!406355 () Unit!30538)

(assert (=> d!111713 (= lt!406354 lt!406355)))

(assert (=> d!111713 (= (getValueByKey!455 lt!406353 (_1!5988 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111713 (= lt!406355 (lemmaContainsTupThenGetReturnValue!250 lt!406353 (_1!5988 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111713 (= lt!406353 (insertStrictlySorted!307 (toList!5342 lt!406319) (_1!5988 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111713 (= (+!2602 lt!406319 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181))) lt!406356)))

(declare-fun b!899952 () Bool)

(declare-fun res!607773 () Bool)

(assert (=> b!899952 (=> (not res!607773) (not e!503580))))

(assert (=> b!899952 (= res!607773 (= (getValueByKey!455 (toList!5342 lt!406356) (_1!5988 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181))))))))

(declare-fun b!899953 () Bool)

(assert (=> b!899953 (= e!503580 (contains!4387 (toList!5342 lt!406356) (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181))))))

(assert (= (and d!111713 res!607772) b!899952))

(assert (= (and b!899952 res!607773) b!899953))

(declare-fun m!836845 () Bool)

(assert (=> d!111713 m!836845))

(declare-fun m!836847 () Bool)

(assert (=> d!111713 m!836847))

(declare-fun m!836849 () Bool)

(assert (=> d!111713 m!836849))

(declare-fun m!836851 () Bool)

(assert (=> d!111713 m!836851))

(declare-fun m!836853 () Bool)

(assert (=> b!899952 m!836853))

(declare-fun m!836855 () Bool)

(assert (=> b!899953 m!836855))

(assert (=> b!899888 d!111713))

(declare-fun d!111715 () Bool)

(declare-fun e!503581 () Bool)

(assert (=> d!111715 e!503581))

(declare-fun res!607774 () Bool)

(assert (=> d!111715 (=> (not res!607774) (not e!503581))))

(declare-fun lt!406360 () ListLongMap!10653)

(assert (=> d!111715 (= res!607774 (contains!4385 lt!406360 (_1!5988 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181)))))))

(declare-fun lt!406357 () List!17793)

(assert (=> d!111715 (= lt!406360 (ListLongMap!10654 lt!406357))))

(declare-fun lt!406358 () Unit!30538)

(declare-fun lt!406359 () Unit!30538)

(assert (=> d!111715 (= lt!406358 lt!406359)))

(assert (=> d!111715 (= (getValueByKey!455 lt!406357 (_1!5988 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181)))))))

(assert (=> d!111715 (= lt!406359 (lemmaContainsTupThenGetReturnValue!250 lt!406357 (_1!5988 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181)))))))

(assert (=> d!111715 (= lt!406357 (insertStrictlySorted!307 (toList!5342 lt!406317) (_1!5988 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181)))))))

(assert (=> d!111715 (= (+!2602 lt!406317 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181))) lt!406360)))

(declare-fun b!899954 () Bool)

(declare-fun res!607775 () Bool)

(assert (=> b!899954 (=> (not res!607775) (not e!503581))))

(assert (=> b!899954 (= res!607775 (= (getValueByKey!455 (toList!5342 lt!406360) (_1!5988 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181))))))))

(declare-fun b!899955 () Bool)

(assert (=> b!899955 (= e!503581 (contains!4387 (toList!5342 lt!406360) (tuple2!11955 lt!406304 (minValue!5241 thiss!1181))))))

(assert (= (and d!111715 res!607774) b!899954))

(assert (= (and b!899954 res!607775) b!899955))

(declare-fun m!836857 () Bool)

(assert (=> d!111715 m!836857))

(declare-fun m!836859 () Bool)

(assert (=> d!111715 m!836859))

(declare-fun m!836861 () Bool)

(assert (=> d!111715 m!836861))

(declare-fun m!836863 () Bool)

(assert (=> d!111715 m!836863))

(declare-fun m!836865 () Bool)

(assert (=> b!899954 m!836865))

(declare-fun m!836867 () Bool)

(assert (=> b!899955 m!836867))

(assert (=> b!899888 d!111715))

(declare-fun d!111717 () Bool)

(assert (=> d!111717 (= (apply!407 lt!406317 lt!406302) (get!13350 (getValueByKey!455 (toList!5342 lt!406317) lt!406302)))))

(declare-fun bs!25248 () Bool)

(assert (= bs!25248 d!111717))

(declare-fun m!836869 () Bool)

(assert (=> bs!25248 m!836869))

(assert (=> bs!25248 m!836869))

(declare-fun m!836871 () Bool)

(assert (=> bs!25248 m!836871))

(assert (=> b!899888 d!111717))

(declare-fun d!111719 () Bool)

(assert (=> d!111719 (= (apply!407 lt!406315 lt!406301) (get!13350 (getValueByKey!455 (toList!5342 lt!406315) lt!406301)))))

(declare-fun bs!25249 () Bool)

(assert (= bs!25249 d!111719))

(declare-fun m!836873 () Bool)

(assert (=> bs!25249 m!836873))

(assert (=> bs!25249 m!836873))

(declare-fun m!836875 () Bool)

(assert (=> bs!25249 m!836875))

(assert (=> b!899888 d!111719))

(declare-fun d!111721 () Bool)

(assert (=> d!111721 (= (apply!407 (+!2602 lt!406317 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181))) lt!406302) (get!13350 (getValueByKey!455 (toList!5342 (+!2602 lt!406317 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181)))) lt!406302)))))

(declare-fun bs!25250 () Bool)

(assert (= bs!25250 d!111721))

(declare-fun m!836877 () Bool)

(assert (=> bs!25250 m!836877))

(assert (=> bs!25250 m!836877))

(declare-fun m!836879 () Bool)

(assert (=> bs!25250 m!836879))

(assert (=> b!899888 d!111721))

(declare-fun d!111723 () Bool)

(assert (=> d!111723 (= (apply!407 (+!2602 lt!406315 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181))) lt!406301) (get!13350 (getValueByKey!455 (toList!5342 (+!2602 lt!406315 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181)))) lt!406301)))))

(declare-fun bs!25251 () Bool)

(assert (= bs!25251 d!111723))

(declare-fun m!836881 () Bool)

(assert (=> bs!25251 m!836881))

(assert (=> bs!25251 m!836881))

(declare-fun m!836883 () Bool)

(assert (=> bs!25251 m!836883))

(assert (=> b!899888 d!111723))

(declare-fun d!111725 () Bool)

(assert (=> d!111725 (= (apply!407 (+!2602 lt!406317 (tuple2!11955 lt!406304 (minValue!5241 thiss!1181))) lt!406302) (apply!407 lt!406317 lt!406302))))

(declare-fun lt!406363 () Unit!30538)

(declare-fun choose!1504 (ListLongMap!10653 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30538)

(assert (=> d!111725 (= lt!406363 (choose!1504 lt!406317 lt!406304 (minValue!5241 thiss!1181) lt!406302))))

(declare-fun e!503584 () Bool)

(assert (=> d!111725 e!503584))

(declare-fun res!607778 () Bool)

(assert (=> d!111725 (=> (not res!607778) (not e!503584))))

(assert (=> d!111725 (= res!607778 (contains!4385 lt!406317 lt!406302))))

(assert (=> d!111725 (= (addApplyDifferent!333 lt!406317 lt!406304 (minValue!5241 thiss!1181) lt!406302) lt!406363)))

(declare-fun b!899959 () Bool)

(assert (=> b!899959 (= e!503584 (not (= lt!406302 lt!406304)))))

(assert (= (and d!111725 res!607778) b!899959))

(assert (=> d!111725 m!836779))

(declare-fun m!836885 () Bool)

(assert (=> d!111725 m!836885))

(assert (=> d!111725 m!836763))

(declare-fun m!836887 () Bool)

(assert (=> d!111725 m!836887))

(assert (=> d!111725 m!836763))

(assert (=> d!111725 m!836765))

(assert (=> b!899888 d!111725))

(declare-fun d!111727 () Bool)

(assert (=> d!111727 (= (apply!407 (+!2602 lt!406311 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181))) lt!406303) (apply!407 lt!406311 lt!406303))))

(declare-fun lt!406364 () Unit!30538)

(assert (=> d!111727 (= lt!406364 (choose!1504 lt!406311 lt!406321 (zeroValue!5241 thiss!1181) lt!406303))))

(declare-fun e!503585 () Bool)

(assert (=> d!111727 e!503585))

(declare-fun res!607779 () Bool)

(assert (=> d!111727 (=> (not res!607779) (not e!503585))))

(assert (=> d!111727 (= res!607779 (contains!4385 lt!406311 lt!406303))))

(assert (=> d!111727 (= (addApplyDifferent!333 lt!406311 lt!406321 (zeroValue!5241 thiss!1181) lt!406303) lt!406364)))

(declare-fun b!899960 () Bool)

(assert (=> b!899960 (= e!503585 (not (= lt!406303 lt!406321)))))

(assert (= (and d!111727 res!607779) b!899960))

(assert (=> d!111727 m!836777))

(declare-fun m!836889 () Bool)

(assert (=> d!111727 m!836889))

(assert (=> d!111727 m!836753))

(declare-fun m!836891 () Bool)

(assert (=> d!111727 m!836891))

(assert (=> d!111727 m!836753))

(assert (=> d!111727 m!836755))

(assert (=> b!899888 d!111727))

(declare-fun d!111729 () Bool)

(assert (=> d!111729 (contains!4385 (+!2602 lt!406319 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181))) lt!406312)))

(declare-fun lt!406367 () Unit!30538)

(declare-fun choose!1505 (ListLongMap!10653 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30538)

(assert (=> d!111729 (= lt!406367 (choose!1505 lt!406319 lt!406320 (zeroValue!5241 thiss!1181) lt!406312))))

(assert (=> d!111729 (contains!4385 lt!406319 lt!406312)))

(assert (=> d!111729 (= (addStillContains!333 lt!406319 lt!406320 (zeroValue!5241 thiss!1181) lt!406312) lt!406367)))

(declare-fun bs!25252 () Bool)

(assert (= bs!25252 d!111729))

(assert (=> bs!25252 m!836761))

(assert (=> bs!25252 m!836761))

(assert (=> bs!25252 m!836775))

(declare-fun m!836893 () Bool)

(assert (=> bs!25252 m!836893))

(declare-fun m!836895 () Bool)

(assert (=> bs!25252 m!836895))

(assert (=> b!899888 d!111729))

(declare-fun d!111731 () Bool)

(declare-fun e!503587 () Bool)

(assert (=> d!111731 e!503587))

(declare-fun res!607780 () Bool)

(assert (=> d!111731 (=> res!607780 e!503587)))

(declare-fun lt!406369 () Bool)

(assert (=> d!111731 (= res!607780 (not lt!406369))))

(declare-fun lt!406370 () Bool)

(assert (=> d!111731 (= lt!406369 lt!406370)))

(declare-fun lt!406368 () Unit!30538)

(declare-fun e!503586 () Unit!30538)

(assert (=> d!111731 (= lt!406368 e!503586)))

(declare-fun c!95351 () Bool)

(assert (=> d!111731 (= c!95351 lt!406370)))

(assert (=> d!111731 (= lt!406370 (containsKey!428 (toList!5342 (+!2602 lt!406319 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))) lt!406312))))

(assert (=> d!111731 (= (contains!4385 (+!2602 lt!406319 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181))) lt!406312) lt!406369)))

(declare-fun b!899962 () Bool)

(declare-fun lt!406371 () Unit!30538)

(assert (=> b!899962 (= e!503586 lt!406371)))

(assert (=> b!899962 (= lt!406371 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5342 (+!2602 lt!406319 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))) lt!406312))))

(assert (=> b!899962 (isDefined!330 (getValueByKey!455 (toList!5342 (+!2602 lt!406319 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))) lt!406312))))

(declare-fun b!899963 () Bool)

(declare-fun Unit!30547 () Unit!30538)

(assert (=> b!899963 (= e!503586 Unit!30547)))

(declare-fun b!899964 () Bool)

(assert (=> b!899964 (= e!503587 (isDefined!330 (getValueByKey!455 (toList!5342 (+!2602 lt!406319 (tuple2!11955 lt!406320 (zeroValue!5241 thiss!1181)))) lt!406312)))))

(assert (= (and d!111731 c!95351) b!899962))

(assert (= (and d!111731 (not c!95351)) b!899963))

(assert (= (and d!111731 (not res!607780)) b!899964))

(declare-fun m!836897 () Bool)

(assert (=> d!111731 m!836897))

(declare-fun m!836899 () Bool)

(assert (=> b!899962 m!836899))

(declare-fun m!836901 () Bool)

(assert (=> b!899962 m!836901))

(assert (=> b!899962 m!836901))

(declare-fun m!836903 () Bool)

(assert (=> b!899962 m!836903))

(assert (=> b!899964 m!836901))

(assert (=> b!899964 m!836901))

(assert (=> b!899964 m!836903))

(assert (=> b!899888 d!111731))

(declare-fun d!111733 () Bool)

(declare-fun e!503588 () Bool)

(assert (=> d!111733 e!503588))

(declare-fun res!607781 () Bool)

(assert (=> d!111733 (=> (not res!607781) (not e!503588))))

(declare-fun lt!406375 () ListLongMap!10653)

(assert (=> d!111733 (= res!607781 (contains!4385 lt!406375 (_1!5988 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181)))))))

(declare-fun lt!406372 () List!17793)

(assert (=> d!111733 (= lt!406375 (ListLongMap!10654 lt!406372))))

(declare-fun lt!406373 () Unit!30538)

(declare-fun lt!406374 () Unit!30538)

(assert (=> d!111733 (= lt!406373 lt!406374)))

(assert (=> d!111733 (= (getValueByKey!455 lt!406372 (_1!5988 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111733 (= lt!406374 (lemmaContainsTupThenGetReturnValue!250 lt!406372 (_1!5988 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111733 (= lt!406372 (insertStrictlySorted!307 (toList!5342 lt!406311) (_1!5988 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181)))))))

(assert (=> d!111733 (= (+!2602 lt!406311 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181))) lt!406375)))

(declare-fun b!899965 () Bool)

(declare-fun res!607782 () Bool)

(assert (=> b!899965 (=> (not res!607782) (not e!503588))))

(assert (=> b!899965 (= res!607782 (= (getValueByKey!455 (toList!5342 lt!406375) (_1!5988 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181))))))))

(declare-fun b!899966 () Bool)

(assert (=> b!899966 (= e!503588 (contains!4387 (toList!5342 lt!406375) (tuple2!11955 lt!406321 (zeroValue!5241 thiss!1181))))))

(assert (= (and d!111733 res!607781) b!899965))

(assert (= (and b!899965 res!607782) b!899966))

(declare-fun m!836905 () Bool)

(assert (=> d!111733 m!836905))

(declare-fun m!836907 () Bool)

(assert (=> d!111733 m!836907))

(declare-fun m!836909 () Bool)

(assert (=> d!111733 m!836909))

(declare-fun m!836911 () Bool)

(assert (=> d!111733 m!836911))

(declare-fun m!836913 () Bool)

(assert (=> b!899965 m!836913))

(declare-fun m!836915 () Bool)

(assert (=> b!899966 m!836915))

(assert (=> b!899888 d!111733))

(declare-fun d!111735 () Bool)

(assert (=> d!111735 (= (apply!407 lt!406311 lt!406303) (get!13350 (getValueByKey!455 (toList!5342 lt!406311) lt!406303)))))

(declare-fun bs!25253 () Bool)

(assert (= bs!25253 d!111735))

(declare-fun m!836917 () Bool)

(assert (=> bs!25253 m!836917))

(assert (=> bs!25253 m!836917))

(declare-fun m!836919 () Bool)

(assert (=> bs!25253 m!836919))

(assert (=> b!899888 d!111735))

(declare-fun b!899991 () Bool)

(declare-fun e!503608 () Bool)

(declare-fun e!503609 () Bool)

(assert (=> b!899991 (= e!503608 e!503609)))

(declare-fun c!95360 () Bool)

(declare-fun e!503606 () Bool)

(assert (=> b!899991 (= c!95360 e!503606)))

(declare-fun res!607791 () Bool)

(assert (=> b!899991 (=> (not res!607791) (not e!503606))))

(assert (=> b!899991 (= res!607791 (bvslt #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun b!899992 () Bool)

(declare-fun e!503607 () ListLongMap!10653)

(assert (=> b!899992 (= e!503607 (ListLongMap!10654 Nil!17790))))

(declare-fun b!899993 () Bool)

(declare-fun e!503604 () Bool)

(declare-fun lt!406392 () ListLongMap!10653)

(declare-fun isEmpty!693 (ListLongMap!10653) Bool)

(assert (=> b!899993 (= e!503604 (isEmpty!693 lt!406392))))

(declare-fun b!899994 () Bool)

(declare-fun lt!406391 () Unit!30538)

(declare-fun lt!406394 () Unit!30538)

(assert (=> b!899994 (= lt!406391 lt!406394)))

(declare-fun lt!406393 () (_ BitVec 64))

(declare-fun lt!406395 () ListLongMap!10653)

(declare-fun lt!406396 () V!29431)

(declare-fun lt!406390 () (_ BitVec 64))

(assert (=> b!899994 (not (contains!4385 (+!2602 lt!406395 (tuple2!11955 lt!406393 lt!406396)) lt!406390))))

(declare-fun addStillNotContains!217 (ListLongMap!10653 (_ BitVec 64) V!29431 (_ BitVec 64)) Unit!30538)

(assert (=> b!899994 (= lt!406394 (addStillNotContains!217 lt!406395 lt!406393 lt!406396 lt!406390))))

(assert (=> b!899994 (= lt!406390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!899994 (= lt!406396 (get!13349 (select (arr!25361 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1322 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!899994 (= lt!406393 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun call!39958 () ListLongMap!10653)

(assert (=> b!899994 (= lt!406395 call!39958)))

(declare-fun e!503603 () ListLongMap!10653)

(assert (=> b!899994 (= e!503603 (+!2602 call!39958 (tuple2!11955 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) (get!13349 (select (arr!25361 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1322 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!111737 () Bool)

(assert (=> d!111737 e!503608))

(declare-fun res!607792 () Bool)

(assert (=> d!111737 (=> (not res!607792) (not e!503608))))

(assert (=> d!111737 (= res!607792 (not (contains!4385 lt!406392 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111737 (= lt!406392 e!503607)))

(declare-fun c!95361 () Bool)

(assert (=> d!111737 (= c!95361 (bvsge #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(assert (=> d!111737 (validMask!0 (mask!26203 thiss!1181))))

(assert (=> d!111737 (= (getCurrentListMapNoExtraKeys!3323 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) lt!406392)))

(declare-fun b!899995 () Bool)

(assert (=> b!899995 (= e!503607 e!503603)))

(declare-fun c!95363 () Bool)

(assert (=> b!899995 (= c!95363 (validKeyInArray!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899996 () Bool)

(declare-fun res!607793 () Bool)

(assert (=> b!899996 (=> (not res!607793) (not e!503608))))

(assert (=> b!899996 (= res!607793 (not (contains!4385 lt!406392 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899997 () Bool)

(assert (=> b!899997 (= e!503603 call!39958)))

(declare-fun b!899998 () Bool)

(assert (=> b!899998 (= e!503609 e!503604)))

(declare-fun c!95362 () Bool)

(assert (=> b!899998 (= c!95362 (bvslt #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun bm!39955 () Bool)

(assert (=> bm!39955 (= call!39958 (getCurrentListMapNoExtraKeys!3323 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5419 thiss!1181)))))

(declare-fun b!899999 () Bool)

(assert (=> b!899999 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(assert (=> b!899999 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25818 (_values!5428 thiss!1181))))))

(declare-fun e!503605 () Bool)

(assert (=> b!899999 (= e!503605 (= (apply!407 lt!406392 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) (get!13349 (select (arr!25361 (_values!5428 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1322 (defaultEntry!5419 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!900000 () Bool)

(assert (=> b!900000 (= e!503609 e!503605)))

(assert (=> b!900000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun res!607794 () Bool)

(assert (=> b!900000 (= res!607794 (contains!4385 lt!406392 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900000 (=> (not res!607794) (not e!503605))))

(declare-fun b!900001 () Bool)

(assert (=> b!900001 (= e!503604 (= lt!406392 (getCurrentListMapNoExtraKeys!3323 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5419 thiss!1181))))))

(declare-fun b!900002 () Bool)

(assert (=> b!900002 (= e!503606 (validKeyInArray!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900002 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!111737 c!95361) b!899992))

(assert (= (and d!111737 (not c!95361)) b!899995))

(assert (= (and b!899995 c!95363) b!899994))

(assert (= (and b!899995 (not c!95363)) b!899997))

(assert (= (or b!899994 b!899997) bm!39955))

(assert (= (and d!111737 res!607792) b!899996))

(assert (= (and b!899996 res!607793) b!899991))

(assert (= (and b!899991 res!607791) b!900002))

(assert (= (and b!899991 c!95360) b!900000))

(assert (= (and b!899991 (not c!95360)) b!899998))

(assert (= (and b!900000 res!607794) b!899999))

(assert (= (and b!899998 c!95362) b!900001))

(assert (= (and b!899998 (not c!95362)) b!899993))

(declare-fun b_lambda!12993 () Bool)

(assert (=> (not b_lambda!12993) (not b!899994)))

(assert (=> b!899994 t!25131))

(declare-fun b_and!26339 () Bool)

(assert (= b_and!26337 (and (=> t!25131 result!10149) b_and!26339)))

(declare-fun b_lambda!12995 () Bool)

(assert (=> (not b_lambda!12995) (not b!899999)))

(assert (=> b!899999 t!25131))

(declare-fun b_and!26341 () Bool)

(assert (= b_and!26339 (and (=> t!25131 result!10149) b_and!26341)))

(assert (=> b!900002 m!836733))

(assert (=> b!900002 m!836733))

(assert (=> b!900002 m!836749))

(declare-fun m!836921 () Bool)

(assert (=> b!899996 m!836921))

(declare-fun m!836923 () Bool)

(assert (=> b!900001 m!836923))

(assert (=> b!899999 m!836733))

(declare-fun m!836925 () Bool)

(assert (=> b!899999 m!836925))

(assert (=> b!899999 m!836785))

(assert (=> b!899999 m!836783))

(assert (=> b!899999 m!836783))

(assert (=> b!899999 m!836785))

(assert (=> b!899999 m!836787))

(assert (=> b!899999 m!836733))

(assert (=> b!899995 m!836733))

(assert (=> b!899995 m!836733))

(assert (=> b!899995 m!836749))

(declare-fun m!836927 () Bool)

(assert (=> d!111737 m!836927))

(assert (=> d!111737 m!836637))

(assert (=> bm!39955 m!836923))

(declare-fun m!836929 () Bool)

(assert (=> b!899993 m!836929))

(assert (=> b!899994 m!836785))

(declare-fun m!836931 () Bool)

(assert (=> b!899994 m!836931))

(assert (=> b!899994 m!836783))

(declare-fun m!836933 () Bool)

(assert (=> b!899994 m!836933))

(assert (=> b!899994 m!836783))

(assert (=> b!899994 m!836785))

(assert (=> b!899994 m!836787))

(assert (=> b!899994 m!836733))

(declare-fun m!836935 () Bool)

(assert (=> b!899994 m!836935))

(assert (=> b!899994 m!836931))

(declare-fun m!836937 () Bool)

(assert (=> b!899994 m!836937))

(assert (=> b!900000 m!836733))

(assert (=> b!900000 m!836733))

(declare-fun m!836939 () Bool)

(assert (=> b!900000 m!836939))

(assert (=> b!899888 d!111737))

(declare-fun d!111739 () Bool)

(assert (=> d!111739 (= (apply!407 (+!2602 lt!406315 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181))) lt!406301) (apply!407 lt!406315 lt!406301))))

(declare-fun lt!406397 () Unit!30538)

(assert (=> d!111739 (= lt!406397 (choose!1504 lt!406315 lt!406300 (minValue!5241 thiss!1181) lt!406301))))

(declare-fun e!503610 () Bool)

(assert (=> d!111739 e!503610))

(declare-fun res!607795 () Bool)

(assert (=> d!111739 (=> (not res!607795) (not e!503610))))

(assert (=> d!111739 (= res!607795 (contains!4385 lt!406315 lt!406301))))

(assert (=> d!111739 (= (addApplyDifferent!333 lt!406315 lt!406300 (minValue!5241 thiss!1181) lt!406301) lt!406397)))

(declare-fun b!900003 () Bool)

(assert (=> b!900003 (= e!503610 (not (= lt!406301 lt!406300)))))

(assert (= (and d!111739 res!607795) b!900003))

(assert (=> d!111739 m!836759))

(declare-fun m!836941 () Bool)

(assert (=> d!111739 m!836941))

(assert (=> d!111739 m!836767))

(declare-fun m!836943 () Bool)

(assert (=> d!111739 m!836943))

(assert (=> d!111739 m!836767))

(assert (=> d!111739 m!836773))

(assert (=> b!899888 d!111739))

(declare-fun d!111741 () Bool)

(declare-fun e!503611 () Bool)

(assert (=> d!111741 e!503611))

(declare-fun res!607796 () Bool)

(assert (=> d!111741 (=> (not res!607796) (not e!503611))))

(declare-fun lt!406401 () ListLongMap!10653)

(assert (=> d!111741 (= res!607796 (contains!4385 lt!406401 (_1!5988 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181)))))))

(declare-fun lt!406398 () List!17793)

(assert (=> d!111741 (= lt!406401 (ListLongMap!10654 lt!406398))))

(declare-fun lt!406399 () Unit!30538)

(declare-fun lt!406400 () Unit!30538)

(assert (=> d!111741 (= lt!406399 lt!406400)))

(assert (=> d!111741 (= (getValueByKey!455 lt!406398 (_1!5988 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181)))))))

(assert (=> d!111741 (= lt!406400 (lemmaContainsTupThenGetReturnValue!250 lt!406398 (_1!5988 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181)))))))

(assert (=> d!111741 (= lt!406398 (insertStrictlySorted!307 (toList!5342 lt!406315) (_1!5988 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181))) (_2!5988 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181)))))))

(assert (=> d!111741 (= (+!2602 lt!406315 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181))) lt!406401)))

(declare-fun b!900004 () Bool)

(declare-fun res!607797 () Bool)

(assert (=> b!900004 (=> (not res!607797) (not e!503611))))

(assert (=> b!900004 (= res!607797 (= (getValueByKey!455 (toList!5342 lt!406401) (_1!5988 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181)))) (Some!460 (_2!5988 (tuple2!11955 lt!406300 (minValue!5241 thiss!1181))))))))

(declare-fun b!900005 () Bool)

(assert (=> b!900005 (= e!503611 (contains!4387 (toList!5342 lt!406401) (tuple2!11955 lt!406300 (minValue!5241 thiss!1181))))))

(assert (= (and d!111741 res!607796) b!900004))

(assert (= (and b!900004 res!607797) b!900005))

(declare-fun m!836945 () Bool)

(assert (=> d!111741 m!836945))

(declare-fun m!836947 () Bool)

(assert (=> d!111741 m!836947))

(declare-fun m!836949 () Bool)

(assert (=> d!111741 m!836949))

(declare-fun m!836951 () Bool)

(assert (=> d!111741 m!836951))

(declare-fun m!836953 () Bool)

(assert (=> b!900004 m!836953))

(declare-fun m!836955 () Bool)

(assert (=> b!900005 m!836955))

(assert (=> b!899888 d!111741))

(assert (=> d!111671 d!111673))

(declare-fun d!111743 () Bool)

(declare-fun e!503614 () Bool)

(assert (=> d!111743 e!503614))

(declare-fun res!607800 () Bool)

(assert (=> d!111743 (=> res!607800 e!503614)))

(declare-fun lt!406404 () SeekEntryResult!8881)

(assert (=> d!111743 (= res!607800 (not ((_ is Found!8881) lt!406404)))))

(assert (=> d!111743 (= lt!406404 (seekEntry!0 key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)))))

(assert (=> d!111743 true))

(declare-fun _$36!369 () Unit!30538)

(assert (=> d!111743 (= (choose!1501 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) key!785) _$36!369)))

(declare-fun b!900008 () Bool)

(assert (=> b!900008 (= e!503614 (inRange!0 (index!37896 lt!406404) (mask!26203 thiss!1181)))))

(assert (= (and d!111743 (not res!607800)) b!900008))

(assert (=> d!111743 m!836633))

(declare-fun m!836957 () Bool)

(assert (=> b!900008 m!836957))

(assert (=> d!111671 d!111743))

(assert (=> d!111671 d!111677))

(declare-fun d!111745 () Bool)

(assert (=> d!111745 (= (validKeyInArray!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899885 d!111745))

(assert (=> b!899886 d!111745))

(declare-fun b!900021 () Bool)

(declare-fun e!503621 () SeekEntryResult!8881)

(assert (=> b!900021 (= e!503621 Undefined!8881)))

(declare-fun b!900022 () Bool)

(declare-fun e!503622 () SeekEntryResult!8881)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900022 (= e!503622 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76568 lt!406249) #b00000000000000000000000000000001) (nextIndex!0 (index!37897 lt!406249) (bvadd (x!76568 lt!406249) #b00000000000000000000000000000001) (mask!26203 thiss!1181)) (index!37897 lt!406249) key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)))))

(declare-fun b!900023 () Bool)

(declare-fun c!95371 () Bool)

(declare-fun lt!406409 () (_ BitVec 64))

(assert (=> b!900023 (= c!95371 (= lt!406409 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503623 () SeekEntryResult!8881)

(assert (=> b!900023 (= e!503623 e!503622)))

(declare-fun b!900024 () Bool)

(assert (=> b!900024 (= e!503622 (MissingVacant!8881 (index!37897 lt!406249)))))

(declare-fun b!900025 () Bool)

(assert (=> b!900025 (= e!503623 (Found!8881 (index!37897 lt!406249)))))

(declare-fun d!111747 () Bool)

(declare-fun lt!406410 () SeekEntryResult!8881)

(assert (=> d!111747 (and (or ((_ is Undefined!8881) lt!406410) (not ((_ is Found!8881) lt!406410)) (and (bvsge (index!37896 lt!406410) #b00000000000000000000000000000000) (bvslt (index!37896 lt!406410) (size!25817 (_keys!10228 thiss!1181))))) (or ((_ is Undefined!8881) lt!406410) ((_ is Found!8881) lt!406410) (not ((_ is MissingVacant!8881) lt!406410)) (not (= (index!37898 lt!406410) (index!37897 lt!406249))) (and (bvsge (index!37898 lt!406410) #b00000000000000000000000000000000) (bvslt (index!37898 lt!406410) (size!25817 (_keys!10228 thiss!1181))))) (or ((_ is Undefined!8881) lt!406410) (ite ((_ is Found!8881) lt!406410) (= (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406410)) key!785) (and ((_ is MissingVacant!8881) lt!406410) (= (index!37898 lt!406410) (index!37897 lt!406249)) (= (select (arr!25360 (_keys!10228 thiss!1181)) (index!37898 lt!406410)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111747 (= lt!406410 e!503621)))

(declare-fun c!95372 () Bool)

(assert (=> d!111747 (= c!95372 (bvsge (x!76568 lt!406249) #b01111111111111111111111111111110))))

(assert (=> d!111747 (= lt!406409 (select (arr!25360 (_keys!10228 thiss!1181)) (index!37897 lt!406249)))))

(assert (=> d!111747 (validMask!0 (mask!26203 thiss!1181))))

(assert (=> d!111747 (= (seekKeyOrZeroReturnVacant!0 (x!76568 lt!406249) (index!37897 lt!406249) (index!37897 lt!406249) key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)) lt!406410)))

(declare-fun b!900026 () Bool)

(assert (=> b!900026 (= e!503621 e!503623)))

(declare-fun c!95370 () Bool)

(assert (=> b!900026 (= c!95370 (= lt!406409 key!785))))

(assert (= (and d!111747 c!95372) b!900021))

(assert (= (and d!111747 (not c!95372)) b!900026))

(assert (= (and b!900026 c!95370) b!900025))

(assert (= (and b!900026 (not c!95370)) b!900023))

(assert (= (and b!900023 c!95371) b!900024))

(assert (= (and b!900023 (not c!95371)) b!900022))

(declare-fun m!836959 () Bool)

(assert (=> b!900022 m!836959))

(assert (=> b!900022 m!836959))

(declare-fun m!836961 () Bool)

(assert (=> b!900022 m!836961))

(declare-fun m!836963 () Bool)

(assert (=> d!111747 m!836963))

(declare-fun m!836965 () Bool)

(assert (=> d!111747 m!836965))

(assert (=> d!111747 m!836715))

(assert (=> d!111747 m!836637))

(assert (=> b!899819 d!111747))

(assert (=> d!111681 d!111679))

(declare-fun d!111749 () Bool)

(assert (=> d!111749 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111749 true))

(declare-fun _$60!421 () Unit!30538)

(assert (=> d!111749 (= (choose!13 (_keys!10228 thiss!1181) key!785 (index!37896 lt!406205)) _$60!421)))

(declare-fun bs!25254 () Bool)

(assert (= bs!25254 d!111749))

(assert (=> bs!25254 m!836635))

(assert (=> d!111681 d!111749))

(declare-fun d!111751 () Bool)

(assert (=> d!111751 (= (apply!407 lt!406314 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13350 (getValueByKey!455 (toList!5342 lt!406314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25255 () Bool)

(assert (= bs!25255 d!111751))

(declare-fun m!836967 () Bool)

(assert (=> bs!25255 m!836967))

(assert (=> bs!25255 m!836967))

(declare-fun m!836969 () Bool)

(assert (=> bs!25255 m!836969))

(assert (=> b!899883 d!111751))

(assert (=> bm!39951 d!111737))

(declare-fun b!900035 () Bool)

(declare-fun e!503628 () (_ BitVec 32))

(declare-fun call!39961 () (_ BitVec 32))

(assert (=> b!900035 (= e!503628 call!39961)))

(declare-fun b!900036 () Bool)

(assert (=> b!900036 (= e!503628 (bvadd #b00000000000000000000000000000001 call!39961))))

(declare-fun d!111753 () Bool)

(declare-fun lt!406413 () (_ BitVec 32))

(assert (=> d!111753 (and (bvsge lt!406413 #b00000000000000000000000000000000) (bvsle lt!406413 (bvsub (size!25817 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503629 () (_ BitVec 32))

(assert (=> d!111753 (= lt!406413 e!503629)))

(declare-fun c!95378 () Bool)

(assert (=> d!111753 (= c!95378 (bvsge #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(assert (=> d!111753 (and (bvsle #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25817 (_keys!10228 thiss!1181)) (size!25817 (_keys!10228 thiss!1181))))))

(assert (=> d!111753 (= (arrayCountValidKeys!0 (_keys!10228 thiss!1181) #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))) lt!406413)))

(declare-fun b!900037 () Bool)

(assert (=> b!900037 (= e!503629 #b00000000000000000000000000000000)))

(declare-fun bm!39958 () Bool)

(assert (=> bm!39958 (= call!39961 (arrayCountValidKeys!0 (_keys!10228 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun b!900038 () Bool)

(assert (=> b!900038 (= e!503629 e!503628)))

(declare-fun c!95377 () Bool)

(assert (=> b!900038 (= c!95377 (validKeyInArray!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111753 c!95378) b!900037))

(assert (= (and d!111753 (not c!95378)) b!900038))

(assert (= (and b!900038 c!95377) b!900036))

(assert (= (and b!900038 (not c!95377)) b!900035))

(assert (= (or b!900036 b!900035) bm!39958))

(declare-fun m!836971 () Bool)

(assert (=> bm!39958 m!836971))

(assert (=> b!900038 m!836733))

(assert (=> b!900038 m!836733))

(assert (=> b!900038 m!836749))

(assert (=> b!899828 d!111753))

(assert (=> d!111685 d!111677))

(declare-fun bm!39961 () Bool)

(declare-fun call!39964 () Bool)

(declare-fun c!95381 () Bool)

(assert (=> bm!39961 (= call!39964 (arrayNoDuplicates!0 (_keys!10228 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95381 (Cons!17791 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) Nil!17792) Nil!17792)))))

(declare-fun b!900049 () Bool)

(declare-fun e!503640 () Bool)

(declare-fun e!503639 () Bool)

(assert (=> b!900049 (= e!503640 e!503639)))

(assert (=> b!900049 (= c!95381 (validKeyInArray!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900050 () Bool)

(declare-fun e!503638 () Bool)

(declare-fun contains!4388 (List!17795 (_ BitVec 64)) Bool)

(assert (=> b!900050 (= e!503638 (contains!4388 Nil!17792 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900051 () Bool)

(assert (=> b!900051 (= e!503639 call!39964)))

(declare-fun d!111755 () Bool)

(declare-fun res!607809 () Bool)

(declare-fun e!503641 () Bool)

(assert (=> d!111755 (=> res!607809 e!503641)))

(assert (=> d!111755 (= res!607809 (bvsge #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(assert (=> d!111755 (= (arrayNoDuplicates!0 (_keys!10228 thiss!1181) #b00000000000000000000000000000000 Nil!17792) e!503641)))

(declare-fun b!900052 () Bool)

(assert (=> b!900052 (= e!503641 e!503640)))

(declare-fun res!607807 () Bool)

(assert (=> b!900052 (=> (not res!607807) (not e!503640))))

(assert (=> b!900052 (= res!607807 (not e!503638))))

(declare-fun res!607808 () Bool)

(assert (=> b!900052 (=> (not res!607808) (not e!503638))))

(assert (=> b!900052 (= res!607808 (validKeyInArray!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900053 () Bool)

(assert (=> b!900053 (= e!503639 call!39964)))

(assert (= (and d!111755 (not res!607809)) b!900052))

(assert (= (and b!900052 res!607808) b!900050))

(assert (= (and b!900052 res!607807) b!900049))

(assert (= (and b!900049 c!95381) b!900053))

(assert (= (and b!900049 (not c!95381)) b!900051))

(assert (= (or b!900053 b!900051) bm!39961))

(assert (=> bm!39961 m!836733))

(declare-fun m!836973 () Bool)

(assert (=> bm!39961 m!836973))

(assert (=> b!900049 m!836733))

(assert (=> b!900049 m!836733))

(assert (=> b!900049 m!836749))

(assert (=> b!900050 m!836733))

(assert (=> b!900050 m!836733))

(declare-fun m!836975 () Bool)

(assert (=> b!900050 m!836975))

(assert (=> b!900052 m!836733))

(assert (=> b!900052 m!836733))

(assert (=> b!900052 m!836749))

(assert (=> b!899830 d!111755))

(declare-fun d!111757 () Bool)

(declare-fun e!503643 () Bool)

(assert (=> d!111757 e!503643))

(declare-fun res!607810 () Bool)

(assert (=> d!111757 (=> res!607810 e!503643)))

(declare-fun lt!406415 () Bool)

(assert (=> d!111757 (= res!607810 (not lt!406415))))

(declare-fun lt!406416 () Bool)

(assert (=> d!111757 (= lt!406415 lt!406416)))

(declare-fun lt!406414 () Unit!30538)

(declare-fun e!503642 () Unit!30538)

(assert (=> d!111757 (= lt!406414 e!503642)))

(declare-fun c!95382 () Bool)

(assert (=> d!111757 (= c!95382 lt!406416)))

(assert (=> d!111757 (= lt!406416 (containsKey!428 (toList!5342 lt!406314) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111757 (= (contains!4385 lt!406314 #b0000000000000000000000000000000000000000000000000000000000000000) lt!406415)))

(declare-fun b!900054 () Bool)

(declare-fun lt!406417 () Unit!30538)

(assert (=> b!900054 (= e!503642 lt!406417)))

(assert (=> b!900054 (= lt!406417 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5342 lt!406314) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900054 (isDefined!330 (getValueByKey!455 (toList!5342 lt!406314) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900055 () Bool)

(declare-fun Unit!30548 () Unit!30538)

(assert (=> b!900055 (= e!503642 Unit!30548)))

(declare-fun b!900056 () Bool)

(assert (=> b!900056 (= e!503643 (isDefined!330 (getValueByKey!455 (toList!5342 lt!406314) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111757 c!95382) b!900054))

(assert (= (and d!111757 (not c!95382)) b!900055))

(assert (= (and d!111757 (not res!607810)) b!900056))

(declare-fun m!836977 () Bool)

(assert (=> d!111757 m!836977))

(declare-fun m!836979 () Bool)

(assert (=> b!900054 m!836979))

(declare-fun m!836981 () Bool)

(assert (=> b!900054 m!836981))

(assert (=> b!900054 m!836981))

(declare-fun m!836983 () Bool)

(assert (=> b!900054 m!836983))

(assert (=> b!900056 m!836981))

(assert (=> b!900056 m!836981))

(assert (=> b!900056 m!836983))

(assert (=> bm!39950 d!111757))

(declare-fun b!900065 () Bool)

(declare-fun e!503651 () Bool)

(declare-fun call!39967 () Bool)

(assert (=> b!900065 (= e!503651 call!39967)))

(declare-fun d!111759 () Bool)

(declare-fun res!607816 () Bool)

(declare-fun e!503650 () Bool)

(assert (=> d!111759 (=> res!607816 e!503650)))

(assert (=> d!111759 (= res!607816 (bvsge #b00000000000000000000000000000000 (size!25817 (_keys!10228 thiss!1181))))))

(assert (=> d!111759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)) e!503650)))

(declare-fun b!900066 () Bool)

(declare-fun e!503652 () Bool)

(assert (=> b!900066 (= e!503651 e!503652)))

(declare-fun lt!406425 () (_ BitVec 64))

(assert (=> b!900066 (= lt!406425 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406424 () Unit!30538)

(assert (=> b!900066 (= lt!406424 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10228 thiss!1181) lt!406425 #b00000000000000000000000000000000))))

(assert (=> b!900066 (arrayContainsKey!0 (_keys!10228 thiss!1181) lt!406425 #b00000000000000000000000000000000)))

(declare-fun lt!406426 () Unit!30538)

(assert (=> b!900066 (= lt!406426 lt!406424)))

(declare-fun res!607815 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52777 (_ BitVec 32)) SeekEntryResult!8881)

(assert (=> b!900066 (= res!607815 (= (seekEntryOrOpen!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) (_keys!10228 thiss!1181) (mask!26203 thiss!1181)) (Found!8881 #b00000000000000000000000000000000)))))

(assert (=> b!900066 (=> (not res!607815) (not e!503652))))

(declare-fun bm!39964 () Bool)

(assert (=> bm!39964 (= call!39967 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10228 thiss!1181) (mask!26203 thiss!1181)))))

(declare-fun b!900067 () Bool)

(assert (=> b!900067 (= e!503652 call!39967)))

(declare-fun b!900068 () Bool)

(assert (=> b!900068 (= e!503650 e!503651)))

(declare-fun c!95385 () Bool)

(assert (=> b!900068 (= c!95385 (validKeyInArray!0 (select (arr!25360 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111759 (not res!607816)) b!900068))

(assert (= (and b!900068 c!95385) b!900066))

(assert (= (and b!900068 (not c!95385)) b!900065))

(assert (= (and b!900066 res!607815) b!900067))

(assert (= (or b!900067 b!900065) bm!39964))

(assert (=> b!900066 m!836733))

(declare-fun m!836985 () Bool)

(assert (=> b!900066 m!836985))

(declare-fun m!836987 () Bool)

(assert (=> b!900066 m!836987))

(assert (=> b!900066 m!836733))

(declare-fun m!836989 () Bool)

(assert (=> b!900066 m!836989))

(declare-fun m!836991 () Bool)

(assert (=> bm!39964 m!836991))

(assert (=> b!900068 m!836733))

(assert (=> b!900068 m!836733))

(assert (=> b!900068 m!836749))

(assert (=> b!899829 d!111759))

(declare-fun d!111761 () Bool)

(assert (=> d!111761 (= (apply!407 lt!406314 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13350 (getValueByKey!455 (toList!5342 lt!406314) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25256 () Bool)

(assert (= bs!25256 d!111761))

(assert (=> bs!25256 m!836981))

(assert (=> bs!25256 m!836981))

(declare-fun m!836993 () Bool)

(assert (=> bs!25256 m!836993))

(assert (=> b!899895 d!111761))

(declare-fun d!111763 () Bool)

(declare-fun res!607821 () Bool)

(declare-fun e!503657 () Bool)

(assert (=> d!111763 (=> res!607821 e!503657)))

(assert (=> d!111763 (= res!607821 (and ((_ is Cons!17789) (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (= (_1!5988 (h!18938 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205)))))))

(assert (=> d!111763 (= (containsKey!428 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))) e!503657)))

(declare-fun b!900073 () Bool)

(declare-fun e!503658 () Bool)

(assert (=> b!900073 (= e!503657 e!503658)))

(declare-fun res!607822 () Bool)

(assert (=> b!900073 (=> (not res!607822) (not e!503658))))

(assert (=> b!900073 (= res!607822 (and (or (not ((_ is Cons!17789) (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (bvsle (_1!5988 (h!18938 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205)))) ((_ is Cons!17789) (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (bvslt (_1!5988 (h!18938 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181))))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205)))))))

(declare-fun b!900074 () Bool)

(assert (=> b!900074 (= e!503658 (containsKey!428 (t!25128 (toList!5342 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)))) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205))))))

(assert (= (and d!111763 (not res!607821)) b!900073))

(assert (= (and b!900073 res!607822) b!900074))

(assert (=> b!900074 m!836643))

(declare-fun m!836995 () Bool)

(assert (=> b!900074 m!836995))

(assert (=> d!111687 d!111763))

(declare-fun d!111765 () Bool)

(declare-fun res!607823 () Bool)

(declare-fun e!503659 () Bool)

(assert (=> d!111765 (=> res!607823 e!503659)))

(assert (=> d!111765 (= res!607823 (= (select (arr!25360 (_keys!10228 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111765 (= (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!503659)))

(declare-fun b!900075 () Bool)

(declare-fun e!503660 () Bool)

(assert (=> b!900075 (= e!503659 e!503660)))

(declare-fun res!607824 () Bool)

(assert (=> b!900075 (=> (not res!607824) (not e!503660))))

(assert (=> b!900075 (= res!607824 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun b!900076 () Bool)

(assert (=> b!900076 (= e!503660 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111765 (not res!607823)) b!900075))

(assert (= (and b!900075 res!607824) b!900076))

(declare-fun m!836997 () Bool)

(assert (=> d!111765 m!836997))

(declare-fun m!836999 () Bool)

(assert (=> b!900076 m!836999))

(assert (=> b!899836 d!111765))

(declare-fun b!900095 () Bool)

(declare-fun e!503675 () SeekEntryResult!8881)

(assert (=> b!900095 (= e!503675 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26203 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!26203 thiss!1181)) key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)))))

(declare-fun b!900096 () Bool)

(declare-fun lt!406431 () SeekEntryResult!8881)

(assert (=> b!900096 (and (bvsge (index!37897 lt!406431) #b00000000000000000000000000000000) (bvslt (index!37897 lt!406431) (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun res!607832 () Bool)

(assert (=> b!900096 (= res!607832 (= (select (arr!25360 (_keys!10228 thiss!1181)) (index!37897 lt!406431)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503673 () Bool)

(assert (=> b!900096 (=> res!607832 e!503673)))

(declare-fun b!900097 () Bool)

(declare-fun e!503671 () SeekEntryResult!8881)

(assert (=> b!900097 (= e!503671 e!503675)))

(declare-fun c!95392 () Bool)

(declare-fun lt!406432 () (_ BitVec 64))

(assert (=> b!900097 (= c!95392 (or (= lt!406432 key!785) (= (bvadd lt!406432 lt!406432) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!900098 () Bool)

(assert (=> b!900098 (= e!503675 (Intermediate!8881 false (toIndex!0 key!785 (mask!26203 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!900099 () Bool)

(declare-fun e!503674 () Bool)

(declare-fun e!503672 () Bool)

(assert (=> b!900099 (= e!503674 e!503672)))

(declare-fun res!607831 () Bool)

(assert (=> b!900099 (= res!607831 (and ((_ is Intermediate!8881) lt!406431) (not (undefined!9693 lt!406431)) (bvslt (x!76568 lt!406431) #b01111111111111111111111111111110) (bvsge (x!76568 lt!406431) #b00000000000000000000000000000000) (bvsge (x!76568 lt!406431) #b00000000000000000000000000000000)))))

(assert (=> b!900099 (=> (not res!607831) (not e!503672))))

(declare-fun d!111767 () Bool)

(assert (=> d!111767 e!503674))

(declare-fun c!95394 () Bool)

(assert (=> d!111767 (= c!95394 (and ((_ is Intermediate!8881) lt!406431) (undefined!9693 lt!406431)))))

(assert (=> d!111767 (= lt!406431 e!503671)))

(declare-fun c!95393 () Bool)

(assert (=> d!111767 (= c!95393 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111767 (= lt!406432 (select (arr!25360 (_keys!10228 thiss!1181)) (toIndex!0 key!785 (mask!26203 thiss!1181))))))

(assert (=> d!111767 (validMask!0 (mask!26203 thiss!1181))))

(assert (=> d!111767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26203 thiss!1181)) key!785 (_keys!10228 thiss!1181) (mask!26203 thiss!1181)) lt!406431)))

(declare-fun b!900100 () Bool)

(assert (=> b!900100 (and (bvsge (index!37897 lt!406431) #b00000000000000000000000000000000) (bvslt (index!37897 lt!406431) (size!25817 (_keys!10228 thiss!1181))))))

(declare-fun res!607833 () Bool)

(assert (=> b!900100 (= res!607833 (= (select (arr!25360 (_keys!10228 thiss!1181)) (index!37897 lt!406431)) key!785))))

(assert (=> b!900100 (=> res!607833 e!503673)))

(assert (=> b!900100 (= e!503672 e!503673)))

(declare-fun b!900101 () Bool)

(assert (=> b!900101 (and (bvsge (index!37897 lt!406431) #b00000000000000000000000000000000) (bvslt (index!37897 lt!406431) (size!25817 (_keys!10228 thiss!1181))))))

(assert (=> b!900101 (= e!503673 (= (select (arr!25360 (_keys!10228 thiss!1181)) (index!37897 lt!406431)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900102 () Bool)

(assert (=> b!900102 (= e!503671 (Intermediate!8881 true (toIndex!0 key!785 (mask!26203 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!900103 () Bool)

(assert (=> b!900103 (= e!503674 (bvsge (x!76568 lt!406431) #b01111111111111111111111111111110))))

(assert (= (and d!111767 c!95393) b!900102))

(assert (= (and d!111767 (not c!95393)) b!900097))

(assert (= (and b!900097 c!95392) b!900098))

(assert (= (and b!900097 (not c!95392)) b!900095))

(assert (= (and d!111767 c!95394) b!900103))

(assert (= (and d!111767 (not c!95394)) b!900099))

(assert (= (and b!900099 res!607831) b!900100))

(assert (= (and b!900100 (not res!607833)) b!900096))

(assert (= (and b!900096 (not res!607832)) b!900101))

(assert (=> d!111767 m!836719))

(declare-fun m!837001 () Bool)

(assert (=> d!111767 m!837001))

(assert (=> d!111767 m!836637))

(declare-fun m!837003 () Bool)

(assert (=> b!900100 m!837003))

(assert (=> b!900095 m!836719))

(declare-fun m!837005 () Bool)

(assert (=> b!900095 m!837005))

(assert (=> b!900095 m!837005))

(declare-fun m!837007 () Bool)

(assert (=> b!900095 m!837007))

(assert (=> b!900096 m!837003))

(assert (=> b!900101 m!837003))

(assert (=> d!111673 d!111767))

(declare-fun d!111769 () Bool)

(declare-fun lt!406438 () (_ BitVec 32))

(declare-fun lt!406437 () (_ BitVec 32))

(assert (=> d!111769 (= lt!406438 (bvmul (bvxor lt!406437 (bvlshr lt!406437 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111769 (= lt!406437 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111769 (and (bvsge (mask!26203 thiss!1181) #b00000000000000000000000000000000) (let ((res!607834 (let ((h!18941 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76588 (bvmul (bvxor h!18941 (bvlshr h!18941 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76588 (bvlshr x!76588 #b00000000000000000000000000001101)) (mask!26203 thiss!1181)))))) (and (bvslt res!607834 (bvadd (mask!26203 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607834 #b00000000000000000000000000000000))))))

(assert (=> d!111769 (= (toIndex!0 key!785 (mask!26203 thiss!1181)) (bvand (bvxor lt!406438 (bvlshr lt!406438 #b00000000000000000000000000001101)) (mask!26203 thiss!1181)))))

(assert (=> d!111673 d!111769))

(assert (=> d!111673 d!111677))

(declare-fun b!900113 () Bool)

(declare-fun res!607844 () Bool)

(declare-fun e!503678 () Bool)

(assert (=> b!900113 (=> (not res!607844) (not e!503678))))

(declare-fun size!25823 (LongMapFixedSize!4402) (_ BitVec 32))

(assert (=> b!900113 (= res!607844 (bvsge (size!25823 thiss!1181) (_size!2256 thiss!1181)))))

(declare-fun b!900112 () Bool)

(declare-fun res!607846 () Bool)

(assert (=> b!900112 (=> (not res!607846) (not e!503678))))

(assert (=> b!900112 (= res!607846 (and (= (size!25818 (_values!5428 thiss!1181)) (bvadd (mask!26203 thiss!1181) #b00000000000000000000000000000001)) (= (size!25817 (_keys!10228 thiss!1181)) (size!25818 (_values!5428 thiss!1181))) (bvsge (_size!2256 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2256 thiss!1181) (bvadd (mask!26203 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!900115 () Bool)

(assert (=> b!900115 (= e!503678 (and (bvsge (extraKeys!5137 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5137 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2256 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!111771 () Bool)

(declare-fun res!607845 () Bool)

(assert (=> d!111771 (=> (not res!607845) (not e!503678))))

(assert (=> d!111771 (= res!607845 (validMask!0 (mask!26203 thiss!1181)))))

(assert (=> d!111771 (= (simpleValid!325 thiss!1181) e!503678)))

(declare-fun b!900114 () Bool)

(declare-fun res!607843 () Bool)

(assert (=> b!900114 (=> (not res!607843) (not e!503678))))

(assert (=> b!900114 (= res!607843 (= (size!25823 thiss!1181) (bvadd (_size!2256 thiss!1181) (bvsdiv (bvadd (extraKeys!5137 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!111771 res!607845) b!900112))

(assert (= (and b!900112 res!607846) b!900113))

(assert (= (and b!900113 res!607844) b!900114))

(assert (= (and b!900114 res!607843) b!900115))

(declare-fun m!837009 () Bool)

(assert (=> b!900113 m!837009))

(assert (=> d!111771 m!836637))

(assert (=> b!900114 m!837009))

(assert (=> d!111675 d!111771))

(declare-fun d!111773 () Bool)

(declare-fun e!503680 () Bool)

(assert (=> d!111773 e!503680))

(declare-fun res!607847 () Bool)

(assert (=> d!111773 (=> res!607847 e!503680)))

(declare-fun lt!406440 () Bool)

(assert (=> d!111773 (= res!607847 (not lt!406440))))

(declare-fun lt!406441 () Bool)

(assert (=> d!111773 (= lt!406440 lt!406441)))

(declare-fun lt!406439 () Unit!30538)

(declare-fun e!503679 () Unit!30538)

(assert (=> d!111773 (= lt!406439 e!503679)))

(declare-fun c!95395 () Bool)

(assert (=> d!111773 (= c!95395 lt!406441)))

(assert (=> d!111773 (= lt!406441 (containsKey!428 (toList!5342 lt!406314) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111773 (= (contains!4385 lt!406314 #b1000000000000000000000000000000000000000000000000000000000000000) lt!406440)))

(declare-fun b!900116 () Bool)

(declare-fun lt!406442 () Unit!30538)

(assert (=> b!900116 (= e!503679 lt!406442)))

(assert (=> b!900116 (= lt!406442 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5342 lt!406314) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900116 (isDefined!330 (getValueByKey!455 (toList!5342 lt!406314) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900117 () Bool)

(declare-fun Unit!30549 () Unit!30538)

(assert (=> b!900117 (= e!503679 Unit!30549)))

(declare-fun b!900118 () Bool)

(assert (=> b!900118 (= e!503680 (isDefined!330 (getValueByKey!455 (toList!5342 lt!406314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111773 c!95395) b!900116))

(assert (= (and d!111773 (not c!95395)) b!900117))

(assert (= (and d!111773 (not res!607847)) b!900118))

(declare-fun m!837011 () Bool)

(assert (=> d!111773 m!837011))

(declare-fun m!837013 () Bool)

(assert (=> b!900116 m!837013))

(assert (=> b!900116 m!836967))

(assert (=> b!900116 m!836967))

(declare-fun m!837015 () Bool)

(assert (=> b!900116 m!837015))

(assert (=> b!900118 m!836967))

(assert (=> b!900118 m!836967))

(assert (=> b!900118 m!837015))

(assert (=> bm!39949 d!111773))

(declare-fun d!111775 () Bool)

(assert (=> d!111775 (contains!4385 (getCurrentListMap!2614 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5419 thiss!1181)) (select (arr!25360 (_keys!10228 thiss!1181)) (index!37896 lt!406205)))))

(assert (=> d!111775 true))

(declare-fun _$16!181 () Unit!30538)

(assert (=> d!111775 (= (choose!1502 (_keys!10228 thiss!1181) (_values!5428 thiss!1181) (mask!26203 thiss!1181) (extraKeys!5137 thiss!1181) (zeroValue!5241 thiss!1181) (minValue!5241 thiss!1181) (index!37896 lt!406205) (defaultEntry!5419 thiss!1181)) _$16!181)))

(declare-fun bs!25257 () Bool)

(assert (= bs!25257 d!111775))

(assert (=> bs!25257 m!836641))

(assert (=> bs!25257 m!836643))

(assert (=> bs!25257 m!836641))

(assert (=> bs!25257 m!836643))

(assert (=> bs!25257 m!836645))

(assert (=> d!111683 d!111775))

(assert (=> d!111683 d!111677))

(declare-fun d!111777 () Bool)

(declare-fun e!503681 () Bool)

(assert (=> d!111777 e!503681))

(declare-fun res!607848 () Bool)

(assert (=> d!111777 (=> (not res!607848) (not e!503681))))

(declare-fun lt!406446 () ListLongMap!10653)

(assert (=> d!111777 (= res!607848 (contains!4385 lt!406446 (_1!5988 (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(declare-fun lt!406443 () List!17793)

(assert (=> d!111777 (= lt!406446 (ListLongMap!10654 lt!406443))))

(declare-fun lt!406444 () Unit!30538)

(declare-fun lt!406445 () Unit!30538)

(assert (=> d!111777 (= lt!406444 lt!406445)))

(assert (=> d!111777 (= (getValueByKey!455 lt!406443 (_1!5988 (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))) (Some!460 (_2!5988 (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(assert (=> d!111777 (= lt!406445 (lemmaContainsTupThenGetReturnValue!250 lt!406443 (_1!5988 (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) (_2!5988 (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(assert (=> d!111777 (= lt!406443 (insertStrictlySorted!307 (toList!5342 (ite c!95332 call!39950 (ite c!95335 call!39953 call!39952))) (_1!5988 (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) (_2!5988 (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))))))

(assert (=> d!111777 (= (+!2602 (ite c!95332 call!39950 (ite c!95335 call!39953 call!39952)) (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))) lt!406446)))

(declare-fun b!900119 () Bool)

(declare-fun res!607849 () Bool)

(assert (=> b!900119 (=> (not res!607849) (not e!503681))))

(assert (=> b!900119 (= res!607849 (= (getValueByKey!455 (toList!5342 lt!406446) (_1!5988 (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181))))) (Some!460 (_2!5988 (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))))

(declare-fun b!900120 () Bool)

(assert (=> b!900120 (= e!503681 (contains!4387 (toList!5342 lt!406446) (ite (or c!95332 c!95335) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5241 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5241 thiss!1181)))))))

(assert (= (and d!111777 res!607848) b!900119))

(assert (= (and b!900119 res!607849) b!900120))

(declare-fun m!837017 () Bool)

(assert (=> d!111777 m!837017))

(declare-fun m!837019 () Bool)

(assert (=> d!111777 m!837019))

(declare-fun m!837021 () Bool)

(assert (=> d!111777 m!837021))

(declare-fun m!837023 () Bool)

(assert (=> d!111777 m!837023))

(declare-fun m!837025 () Bool)

(assert (=> b!900119 m!837025))

(declare-fun m!837027 () Bool)

(assert (=> b!900120 m!837027))

(assert (=> bm!39948 d!111777))

(assert (=> b!899839 d!111687))

(assert (=> b!899839 d!111685))

(assert (=> b!899913 d!111697))

(assert (=> b!899913 d!111699))

(declare-fun mapNonEmpty!29192 () Bool)

(declare-fun mapRes!29192 () Bool)

(declare-fun tp!56153 () Bool)

(declare-fun e!503683 () Bool)

(assert (=> mapNonEmpty!29192 (= mapRes!29192 (and tp!56153 e!503683))))

(declare-fun mapKey!29192 () (_ BitVec 32))

(declare-fun mapValue!29192 () ValueCell!8693)

(declare-fun mapRest!29192 () (Array (_ BitVec 32) ValueCell!8693))

(assert (=> mapNonEmpty!29192 (= mapRest!29191 (store mapRest!29192 mapKey!29192 mapValue!29192))))

(declare-fun mapIsEmpty!29192 () Bool)

(assert (=> mapIsEmpty!29192 mapRes!29192))

(declare-fun condMapEmpty!29192 () Bool)

(declare-fun mapDefault!29192 () ValueCell!8693)

(assert (=> mapNonEmpty!29191 (= condMapEmpty!29192 (= mapRest!29191 ((as const (Array (_ BitVec 32) ValueCell!8693)) mapDefault!29192)))))

(declare-fun e!503682 () Bool)

(assert (=> mapNonEmpty!29191 (= tp!56152 (and e!503682 mapRes!29192))))

(declare-fun b!900121 () Bool)

(assert (=> b!900121 (= e!503683 tp_is_empty!18349)))

(declare-fun b!900122 () Bool)

(assert (=> b!900122 (= e!503682 tp_is_empty!18349)))

(assert (= (and mapNonEmpty!29191 condMapEmpty!29192) mapIsEmpty!29192))

(assert (= (and mapNonEmpty!29191 (not condMapEmpty!29192)) mapNonEmpty!29192))

(assert (= (and mapNonEmpty!29192 ((_ is ValueCellFull!8693) mapValue!29192)) b!900121))

(assert (= (and mapNonEmpty!29191 ((_ is ValueCellFull!8693) mapDefault!29192)) b!900122))

(declare-fun m!837029 () Bool)

(assert (=> mapNonEmpty!29192 m!837029))

(declare-fun b_lambda!12997 () Bool)

(assert (= b_lambda!12993 (or (and b!899744 b_free!16021) b_lambda!12997)))

(declare-fun b_lambda!12999 () Bool)

(assert (= b_lambda!12995 (or (and b!899744 b_free!16021) b_lambda!12999)))

(check-sat (not d!111731) (not d!111751) (not d!111773) (not b!900005) (not b!900116) (not b!900052) (not b!900076) (not b!899962) (not b!900113) (not b!899999) (not b!900038) (not d!111697) (not b!899942) (not b!899952) (not b!900118) (not d!111749) (not d!111711) (not b!900120) (not d!111757) (not b!899954) (not d!111777) (not d!111733) (not b!899951) (not d!111761) (not b!900119) (not b!899995) (not d!111707) (not d!111721) (not d!111771) (not b!899935) (not d!111709) (not b!900054) (not d!111775) (not bm!39964) (not bm!39958) (not b!900056) (not b!899949) (not b_lambda!12999) (not b!899994) (not b!899948) (not d!111719) (not b!900004) (not b!900000) (not d!111747) (not b!900095) b_and!26341 (not b!900114) (not b!900074) (not b!899955) (not b!899953) tp_is_empty!18349 (not d!111701) (not b_next!16021) (not bm!39961) (not d!111713) (not b!899993) (not b!900008) (not b!899966) (not b!899941) (not bm!39955) (not d!111729) (not b!899947) (not d!111743) (not d!111737) (not b!900002) (not mapNonEmpty!29192) (not b!900022) (not b!899996) (not b_lambda!12997) (not b!900066) (not d!111739) (not b_lambda!12991) (not b!900049) (not d!111725) (not b!899964) (not d!111695) (not d!111723) (not d!111715) (not d!111735) (not d!111717) (not b!899965) (not d!111767) (not b!899924) (not d!111741) (not b!900050) (not d!111727) (not b!900001) (not b!900068))
(check-sat b_and!26341 (not b_next!16021))
