; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108046 () Bool)

(assert start!108046)

(declare-fun b!1276046 () Bool)

(declare-fun e!728616 () Bool)

(declare-fun tp_is_empty!33319 () Bool)

(assert (=> b!1276046 (= e!728616 tp_is_empty!33319)))

(declare-fun b!1276047 () Bool)

(declare-fun e!728620 () Bool)

(declare-datatypes ((array!83637 0))(
  ( (array!83638 (arr!40331 (Array (_ BitVec 32) (_ BitVec 64))) (size!40883 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83637)

(assert (=> b!1276047 (= e!728620 (bvsgt #b00000000000000000000000000000000 (size!40883 _keys!1427)))))

(declare-fun b!1276048 () Bool)

(declare-fun res!848076 () Bool)

(assert (=> b!1276048 (=> (not res!848076) (not e!728620))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49529 0))(
  ( (V!49530 (val!16734 Int)) )
))
(declare-datatypes ((ValueCell!15761 0))(
  ( (ValueCellFull!15761 (v!19330 V!49529)) (EmptyCell!15761) )
))
(declare-datatypes ((array!83639 0))(
  ( (array!83640 (arr!40332 (Array (_ BitVec 32) ValueCell!15761)) (size!40884 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83639)

(assert (=> b!1276048 (= res!848076 (and (= (size!40884 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40883 _keys!1427) (size!40884 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276049 () Bool)

(declare-fun e!728617 () Bool)

(declare-fun mapRes!51506 () Bool)

(assert (=> b!1276049 (= e!728617 (and e!728616 mapRes!51506))))

(declare-fun condMapEmpty!51506 () Bool)

(declare-fun mapDefault!51506 () ValueCell!15761)

(assert (=> b!1276049 (= condMapEmpty!51506 (= (arr!40332 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15761)) mapDefault!51506)))))

(declare-fun res!848073 () Bool)

(assert (=> start!108046 (=> (not res!848073) (not e!728620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108046 (= res!848073 (validMask!0 mask!1805))))

(assert (=> start!108046 e!728620))

(assert (=> start!108046 true))

(declare-fun array_inv!30807 (array!83639) Bool)

(assert (=> start!108046 (and (array_inv!30807 _values!1187) e!728617)))

(declare-fun array_inv!30808 (array!83637) Bool)

(assert (=> start!108046 (array_inv!30808 _keys!1427)))

(declare-fun b!1276050 () Bool)

(declare-fun res!848074 () Bool)

(assert (=> b!1276050 (=> (not res!848074) (not e!728620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83637 (_ BitVec 32)) Bool)

(assert (=> b!1276050 (= res!848074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276051 () Bool)

(declare-fun e!728618 () Bool)

(assert (=> b!1276051 (= e!728618 tp_is_empty!33319)))

(declare-fun mapNonEmpty!51506 () Bool)

(declare-fun tp!98265 () Bool)

(assert (=> mapNonEmpty!51506 (= mapRes!51506 (and tp!98265 e!728618))))

(declare-fun mapKey!51506 () (_ BitVec 32))

(declare-fun mapValue!51506 () ValueCell!15761)

(declare-fun mapRest!51506 () (Array (_ BitVec 32) ValueCell!15761))

(assert (=> mapNonEmpty!51506 (= (arr!40332 _values!1187) (store mapRest!51506 mapKey!51506 mapValue!51506))))

(declare-fun b!1276052 () Bool)

(declare-fun res!848075 () Bool)

(assert (=> b!1276052 (=> (not res!848075) (not e!728620))))

(declare-datatypes ((List!28712 0))(
  ( (Nil!28709) (Cons!28708 (h!29917 (_ BitVec 64)) (t!42240 List!28712)) )
))
(declare-fun arrayNoDuplicates!0 (array!83637 (_ BitVec 32) List!28712) Bool)

(assert (=> b!1276052 (= res!848075 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28709))))

(declare-fun mapIsEmpty!51506 () Bool)

(assert (=> mapIsEmpty!51506 mapRes!51506))

(assert (= (and start!108046 res!848073) b!1276048))

(assert (= (and b!1276048 res!848076) b!1276050))

(assert (= (and b!1276050 res!848074) b!1276052))

(assert (= (and b!1276052 res!848075) b!1276047))

(assert (= (and b!1276049 condMapEmpty!51506) mapIsEmpty!51506))

(assert (= (and b!1276049 (not condMapEmpty!51506)) mapNonEmpty!51506))

(get-info :version)

(assert (= (and mapNonEmpty!51506 ((_ is ValueCellFull!15761) mapValue!51506)) b!1276051))

(assert (= (and b!1276049 ((_ is ValueCellFull!15761) mapDefault!51506)) b!1276046))

(assert (= start!108046 b!1276049))

(declare-fun m!1171623 () Bool)

(assert (=> start!108046 m!1171623))

(declare-fun m!1171625 () Bool)

(assert (=> start!108046 m!1171625))

(declare-fun m!1171627 () Bool)

(assert (=> start!108046 m!1171627))

(declare-fun m!1171629 () Bool)

(assert (=> b!1276050 m!1171629))

(declare-fun m!1171631 () Bool)

(assert (=> mapNonEmpty!51506 m!1171631))

(declare-fun m!1171633 () Bool)

(assert (=> b!1276052 m!1171633))

(check-sat (not b!1276052) (not start!108046) (not mapNonEmpty!51506) (not b!1276050) tp_is_empty!33319)
(check-sat)
(get-model)

(declare-fun d!140299 () Bool)

(assert (=> d!140299 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108046 d!140299))

(declare-fun d!140301 () Bool)

(assert (=> d!140301 (= (array_inv!30807 _values!1187) (bvsge (size!40884 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108046 d!140301))

(declare-fun d!140303 () Bool)

(assert (=> d!140303 (= (array_inv!30808 _keys!1427) (bvsge (size!40883 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108046 d!140303))

(declare-fun b!1276105 () Bool)

(declare-fun e!728661 () Bool)

(declare-fun call!62628 () Bool)

(assert (=> b!1276105 (= e!728661 call!62628)))

(declare-fun b!1276106 () Bool)

(declare-fun e!728659 () Bool)

(declare-fun e!728660 () Bool)

(assert (=> b!1276106 (= e!728659 e!728660)))

(declare-fun res!848107 () Bool)

(assert (=> b!1276106 (=> (not res!848107) (not e!728660))))

(declare-fun e!728662 () Bool)

(assert (=> b!1276106 (= res!848107 (not e!728662))))

(declare-fun res!848108 () Bool)

(assert (=> b!1276106 (=> (not res!848108) (not e!728662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1276106 (= res!848108 (validKeyInArray!0 (select (arr!40331 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun bm!62625 () Bool)

(declare-fun c!123914 () Bool)

(assert (=> bm!62625 (= call!62628 (arrayNoDuplicates!0 _keys!1427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123914 (Cons!28708 (select (arr!40331 _keys!1427) #b00000000000000000000000000000000) Nil!28709) Nil!28709)))))

(declare-fun b!1276107 () Bool)

(declare-fun contains!7654 (List!28712 (_ BitVec 64)) Bool)

(assert (=> b!1276107 (= e!728662 (contains!7654 Nil!28709 (select (arr!40331 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1276108 () Bool)

(assert (=> b!1276108 (= e!728660 e!728661)))

(assert (=> b!1276108 (= c!123914 (validKeyInArray!0 (select (arr!40331 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140305 () Bool)

(declare-fun res!848109 () Bool)

(assert (=> d!140305 (=> res!848109 e!728659)))

(assert (=> d!140305 (= res!848109 (bvsge #b00000000000000000000000000000000 (size!40883 _keys!1427)))))

(assert (=> d!140305 (= (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28709) e!728659)))

(declare-fun b!1276109 () Bool)

(assert (=> b!1276109 (= e!728661 call!62628)))

(assert (= (and d!140305 (not res!848109)) b!1276106))

(assert (= (and b!1276106 res!848108) b!1276107))

(assert (= (and b!1276106 res!848107) b!1276108))

(assert (= (and b!1276108 c!123914) b!1276109))

(assert (= (and b!1276108 (not c!123914)) b!1276105))

(assert (= (or b!1276109 b!1276105) bm!62625))

(declare-fun m!1171659 () Bool)

(assert (=> b!1276106 m!1171659))

(assert (=> b!1276106 m!1171659))

(declare-fun m!1171661 () Bool)

(assert (=> b!1276106 m!1171661))

(assert (=> bm!62625 m!1171659))

(declare-fun m!1171663 () Bool)

(assert (=> bm!62625 m!1171663))

(assert (=> b!1276107 m!1171659))

(assert (=> b!1276107 m!1171659))

(declare-fun m!1171665 () Bool)

(assert (=> b!1276107 m!1171665))

(assert (=> b!1276108 m!1171659))

(assert (=> b!1276108 m!1171659))

(assert (=> b!1276108 m!1171661))

(assert (=> b!1276052 d!140305))

(declare-fun bm!62628 () Bool)

(declare-fun call!62631 () Bool)

(assert (=> bm!62628 (= call!62631 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1276118 () Bool)

(declare-fun e!728670 () Bool)

(declare-fun e!728669 () Bool)

(assert (=> b!1276118 (= e!728670 e!728669)))

(declare-fun lt!575274 () (_ BitVec 64))

(assert (=> b!1276118 (= lt!575274 (select (arr!40331 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42205 0))(
  ( (Unit!42206) )
))
(declare-fun lt!575273 () Unit!42205)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83637 (_ BitVec 64) (_ BitVec 32)) Unit!42205)

(assert (=> b!1276118 (= lt!575273 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575274 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276118 (arrayContainsKey!0 _keys!1427 lt!575274 #b00000000000000000000000000000000)))

(declare-fun lt!575272 () Unit!42205)

(assert (=> b!1276118 (= lt!575272 lt!575273)))

(declare-fun res!848115 () Bool)

(declare-datatypes ((SeekEntryResult!10004 0))(
  ( (MissingZero!10004 (index!42387 (_ BitVec 32))) (Found!10004 (index!42388 (_ BitVec 32))) (Intermediate!10004 (undefined!10816 Bool) (index!42389 (_ BitVec 32)) (x!113050 (_ BitVec 32))) (Undefined!10004) (MissingVacant!10004 (index!42390 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83637 (_ BitVec 32)) SeekEntryResult!10004)

(assert (=> b!1276118 (= res!848115 (= (seekEntryOrOpen!0 (select (arr!40331 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10004 #b00000000000000000000000000000000)))))

(assert (=> b!1276118 (=> (not res!848115) (not e!728669))))

(declare-fun b!1276119 () Bool)

(declare-fun e!728671 () Bool)

(assert (=> b!1276119 (= e!728671 e!728670)))

(declare-fun c!123917 () Bool)

(assert (=> b!1276119 (= c!123917 (validKeyInArray!0 (select (arr!40331 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1276120 () Bool)

(assert (=> b!1276120 (= e!728670 call!62631)))

(declare-fun d!140307 () Bool)

(declare-fun res!848114 () Bool)

(assert (=> d!140307 (=> res!848114 e!728671)))

(assert (=> d!140307 (= res!848114 (bvsge #b00000000000000000000000000000000 (size!40883 _keys!1427)))))

(assert (=> d!140307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728671)))

(declare-fun b!1276121 () Bool)

(assert (=> b!1276121 (= e!728669 call!62631)))

(assert (= (and d!140307 (not res!848114)) b!1276119))

(assert (= (and b!1276119 c!123917) b!1276118))

(assert (= (and b!1276119 (not c!123917)) b!1276120))

(assert (= (and b!1276118 res!848115) b!1276121))

(assert (= (or b!1276121 b!1276120) bm!62628))

(declare-fun m!1171667 () Bool)

(assert (=> bm!62628 m!1171667))

(assert (=> b!1276118 m!1171659))

(declare-fun m!1171669 () Bool)

(assert (=> b!1276118 m!1171669))

(declare-fun m!1171671 () Bool)

(assert (=> b!1276118 m!1171671))

(assert (=> b!1276118 m!1171659))

(declare-fun m!1171673 () Bool)

(assert (=> b!1276118 m!1171673))

(assert (=> b!1276119 m!1171659))

(assert (=> b!1276119 m!1171659))

(assert (=> b!1276119 m!1171661))

(assert (=> b!1276050 d!140307))

(declare-fun mapIsEmpty!51515 () Bool)

(declare-fun mapRes!51515 () Bool)

(assert (=> mapIsEmpty!51515 mapRes!51515))

(declare-fun mapNonEmpty!51515 () Bool)

(declare-fun tp!98274 () Bool)

(declare-fun e!728677 () Bool)

(assert (=> mapNonEmpty!51515 (= mapRes!51515 (and tp!98274 e!728677))))

(declare-fun mapValue!51515 () ValueCell!15761)

(declare-fun mapKey!51515 () (_ BitVec 32))

(declare-fun mapRest!51515 () (Array (_ BitVec 32) ValueCell!15761))

(assert (=> mapNonEmpty!51515 (= mapRest!51506 (store mapRest!51515 mapKey!51515 mapValue!51515))))

(declare-fun b!1276128 () Bool)

(assert (=> b!1276128 (= e!728677 tp_is_empty!33319)))

(declare-fun condMapEmpty!51515 () Bool)

(declare-fun mapDefault!51515 () ValueCell!15761)

(assert (=> mapNonEmpty!51506 (= condMapEmpty!51515 (= mapRest!51506 ((as const (Array (_ BitVec 32) ValueCell!15761)) mapDefault!51515)))))

(declare-fun e!728676 () Bool)

(assert (=> mapNonEmpty!51506 (= tp!98265 (and e!728676 mapRes!51515))))

(declare-fun b!1276129 () Bool)

(assert (=> b!1276129 (= e!728676 tp_is_empty!33319)))

(assert (= (and mapNonEmpty!51506 condMapEmpty!51515) mapIsEmpty!51515))

(assert (= (and mapNonEmpty!51506 (not condMapEmpty!51515)) mapNonEmpty!51515))

(assert (= (and mapNonEmpty!51515 ((_ is ValueCellFull!15761) mapValue!51515)) b!1276128))

(assert (= (and mapNonEmpty!51506 ((_ is ValueCellFull!15761) mapDefault!51515)) b!1276129))

(declare-fun m!1171675 () Bool)

(assert (=> mapNonEmpty!51515 m!1171675))

(check-sat (not b!1276118) (not bm!62625) (not b!1276107) (not bm!62628) (not mapNonEmpty!51515) tp_is_empty!33319 (not b!1276108) (not b!1276119) (not b!1276106))
(check-sat)
