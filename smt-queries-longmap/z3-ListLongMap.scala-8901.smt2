; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108048 () Bool)

(assert start!108048)

(declare-fun b!1276131 () Bool)

(declare-fun res!848114 () Bool)

(declare-fun e!728663 () Bool)

(assert (=> b!1276131 (=> (not res!848114) (not e!728663))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83736 0))(
  ( (array!83737 (arr!40380 (Array (_ BitVec 32) (_ BitVec 64))) (size!40930 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83736)

(declare-datatypes ((V!49531 0))(
  ( (V!49532 (val!16735 Int)) )
))
(declare-datatypes ((ValueCell!15762 0))(
  ( (ValueCellFull!15762 (v!19332 V!49531)) (EmptyCell!15762) )
))
(declare-datatypes ((array!83738 0))(
  ( (array!83739 (arr!40381 (Array (_ BitVec 32) ValueCell!15762)) (size!40931 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83738)

(assert (=> b!1276131 (= res!848114 (and (= (size!40931 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40930 _keys!1427) (size!40931 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51509 () Bool)

(declare-fun mapRes!51509 () Bool)

(assert (=> mapIsEmpty!51509 mapRes!51509))

(declare-fun b!1276132 () Bool)

(declare-fun e!728661 () Bool)

(declare-fun tp_is_empty!33321 () Bool)

(assert (=> b!1276132 (= e!728661 tp_is_empty!33321)))

(declare-fun mapNonEmpty!51509 () Bool)

(declare-fun tp!98267 () Bool)

(assert (=> mapNonEmpty!51509 (= mapRes!51509 (and tp!98267 e!728661))))

(declare-fun mapRest!51509 () (Array (_ BitVec 32) ValueCell!15762))

(declare-fun mapKey!51509 () (_ BitVec 32))

(declare-fun mapValue!51509 () ValueCell!15762)

(assert (=> mapNonEmpty!51509 (= (arr!40381 _values!1187) (store mapRest!51509 mapKey!51509 mapValue!51509))))

(declare-fun b!1276133 () Bool)

(declare-fun e!728662 () Bool)

(declare-fun e!728660 () Bool)

(assert (=> b!1276133 (= e!728662 (and e!728660 mapRes!51509))))

(declare-fun condMapEmpty!51509 () Bool)

(declare-fun mapDefault!51509 () ValueCell!15762)

(assert (=> b!1276133 (= condMapEmpty!51509 (= (arr!40381 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15762)) mapDefault!51509)))))

(declare-fun b!1276134 () Bool)

(declare-fun res!848112 () Bool)

(assert (=> b!1276134 (=> (not res!848112) (not e!728663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83736 (_ BitVec 32)) Bool)

(assert (=> b!1276134 (= res!848112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276135 () Bool)

(assert (=> b!1276135 (= e!728663 (bvsgt #b00000000000000000000000000000000 (size!40930 _keys!1427)))))

(declare-fun b!1276136 () Bool)

(declare-fun res!848113 () Bool)

(assert (=> b!1276136 (=> (not res!848113) (not e!728663))))

(declare-datatypes ((List!28636 0))(
  ( (Nil!28633) (Cons!28632 (h!29841 (_ BitVec 64)) (t!42172 List!28636)) )
))
(declare-fun arrayNoDuplicates!0 (array!83736 (_ BitVec 32) List!28636) Bool)

(assert (=> b!1276136 (= res!848113 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28633))))

(declare-fun res!848115 () Bool)

(assert (=> start!108048 (=> (not res!848115) (not e!728663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108048 (= res!848115 (validMask!0 mask!1805))))

(assert (=> start!108048 e!728663))

(assert (=> start!108048 true))

(declare-fun array_inv!30689 (array!83738) Bool)

(assert (=> start!108048 (and (array_inv!30689 _values!1187) e!728662)))

(declare-fun array_inv!30690 (array!83736) Bool)

(assert (=> start!108048 (array_inv!30690 _keys!1427)))

(declare-fun b!1276137 () Bool)

(assert (=> b!1276137 (= e!728660 tp_is_empty!33321)))

(assert (= (and start!108048 res!848115) b!1276131))

(assert (= (and b!1276131 res!848114) b!1276134))

(assert (= (and b!1276134 res!848112) b!1276136))

(assert (= (and b!1276136 res!848113) b!1276135))

(assert (= (and b!1276133 condMapEmpty!51509) mapIsEmpty!51509))

(assert (= (and b!1276133 (not condMapEmpty!51509)) mapNonEmpty!51509))

(get-info :version)

(assert (= (and mapNonEmpty!51509 ((_ is ValueCellFull!15762) mapValue!51509)) b!1276132))

(assert (= (and b!1276133 ((_ is ValueCellFull!15762) mapDefault!51509)) b!1276137))

(assert (= start!108048 b!1276133))

(declare-fun m!1172135 () Bool)

(assert (=> mapNonEmpty!51509 m!1172135))

(declare-fun m!1172137 () Bool)

(assert (=> b!1276134 m!1172137))

(declare-fun m!1172139 () Bool)

(assert (=> b!1276136 m!1172139))

(declare-fun m!1172141 () Bool)

(assert (=> start!108048 m!1172141))

(declare-fun m!1172143 () Bool)

(assert (=> start!108048 m!1172143))

(declare-fun m!1172145 () Bool)

(assert (=> start!108048 m!1172145))

(check-sat (not start!108048) (not mapNonEmpty!51509) (not b!1276136) (not b!1276134) tp_is_empty!33321)
(check-sat)
(get-model)

(declare-fun d!140411 () Bool)

(declare-fun res!848135 () Bool)

(declare-fun e!728690 () Bool)

(assert (=> d!140411 (=> res!848135 e!728690)))

(assert (=> d!140411 (= res!848135 (bvsge #b00000000000000000000000000000000 (size!40930 _keys!1427)))))

(assert (=> d!140411 (= (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28633) e!728690)))

(declare-fun b!1276169 () Bool)

(declare-fun e!728688 () Bool)

(declare-fun call!62647 () Bool)

(assert (=> b!1276169 (= e!728688 call!62647)))

(declare-fun b!1276170 () Bool)

(declare-fun e!728689 () Bool)

(declare-fun contains!7685 (List!28636 (_ BitVec 64)) Bool)

(assert (=> b!1276170 (= e!728689 (contains!7685 Nil!28633 (select (arr!40380 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1276171 () Bool)

(declare-fun e!728691 () Bool)

(assert (=> b!1276171 (= e!728691 e!728688)))

(declare-fun c!123930 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1276171 (= c!123930 (validKeyInArray!0 (select (arr!40380 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1276172 () Bool)

(assert (=> b!1276172 (= e!728688 call!62647)))

(declare-fun bm!62644 () Bool)

(assert (=> bm!62644 (= call!62647 (arrayNoDuplicates!0 _keys!1427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123930 (Cons!28632 (select (arr!40380 _keys!1427) #b00000000000000000000000000000000) Nil!28633) Nil!28633)))))

(declare-fun b!1276173 () Bool)

(assert (=> b!1276173 (= e!728690 e!728691)))

(declare-fun res!848134 () Bool)

(assert (=> b!1276173 (=> (not res!848134) (not e!728691))))

(assert (=> b!1276173 (= res!848134 (not e!728689))))

(declare-fun res!848136 () Bool)

(assert (=> b!1276173 (=> (not res!848136) (not e!728689))))

(assert (=> b!1276173 (= res!848136 (validKeyInArray!0 (select (arr!40380 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140411 (not res!848135)) b!1276173))

(assert (= (and b!1276173 res!848136) b!1276170))

(assert (= (and b!1276173 res!848134) b!1276171))

(assert (= (and b!1276171 c!123930) b!1276169))

(assert (= (and b!1276171 (not c!123930)) b!1276172))

(assert (= (or b!1276169 b!1276172) bm!62644))

(declare-fun m!1172159 () Bool)

(assert (=> b!1276170 m!1172159))

(assert (=> b!1276170 m!1172159))

(declare-fun m!1172161 () Bool)

(assert (=> b!1276170 m!1172161))

(assert (=> b!1276171 m!1172159))

(assert (=> b!1276171 m!1172159))

(declare-fun m!1172163 () Bool)

(assert (=> b!1276171 m!1172163))

(assert (=> bm!62644 m!1172159))

(declare-fun m!1172165 () Bool)

(assert (=> bm!62644 m!1172165))

(assert (=> b!1276173 m!1172159))

(assert (=> b!1276173 m!1172159))

(assert (=> b!1276173 m!1172163))

(assert (=> b!1276136 d!140411))

(declare-fun bm!62647 () Bool)

(declare-fun call!62650 () Bool)

(assert (=> bm!62647 (= call!62650 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1276182 () Bool)

(declare-fun e!728700 () Bool)

(assert (=> b!1276182 (= e!728700 call!62650)))

(declare-fun d!140413 () Bool)

(declare-fun res!848141 () Bool)

(declare-fun e!728698 () Bool)

(assert (=> d!140413 (=> res!848141 e!728698)))

(assert (=> d!140413 (= res!848141 (bvsge #b00000000000000000000000000000000 (size!40930 _keys!1427)))))

(assert (=> d!140413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728698)))

(declare-fun b!1276183 () Bool)

(declare-fun e!728699 () Bool)

(assert (=> b!1276183 (= e!728699 e!728700)))

(declare-fun lt!575452 () (_ BitVec 64))

(assert (=> b!1276183 (= lt!575452 (select (arr!40380 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42359 0))(
  ( (Unit!42360) )
))
(declare-fun lt!575451 () Unit!42359)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83736 (_ BitVec 64) (_ BitVec 32)) Unit!42359)

(assert (=> b!1276183 (= lt!575451 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575452 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276183 (arrayContainsKey!0 _keys!1427 lt!575452 #b00000000000000000000000000000000)))

(declare-fun lt!575450 () Unit!42359)

(assert (=> b!1276183 (= lt!575450 lt!575451)))

(declare-fun res!848142 () Bool)

(declare-datatypes ((SeekEntryResult!10005 0))(
  ( (MissingZero!10005 (index!42391 (_ BitVec 32))) (Found!10005 (index!42392 (_ BitVec 32))) (Intermediate!10005 (undefined!10817 Bool) (index!42393 (_ BitVec 32)) (x!113054 (_ BitVec 32))) (Undefined!10005) (MissingVacant!10005 (index!42394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83736 (_ BitVec 32)) SeekEntryResult!10005)

(assert (=> b!1276183 (= res!848142 (= (seekEntryOrOpen!0 (select (arr!40380 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10005 #b00000000000000000000000000000000)))))

(assert (=> b!1276183 (=> (not res!848142) (not e!728700))))

(declare-fun b!1276184 () Bool)

(assert (=> b!1276184 (= e!728699 call!62650)))

(declare-fun b!1276185 () Bool)

(assert (=> b!1276185 (= e!728698 e!728699)))

(declare-fun c!123933 () Bool)

(assert (=> b!1276185 (= c!123933 (validKeyInArray!0 (select (arr!40380 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140413 (not res!848141)) b!1276185))

(assert (= (and b!1276185 c!123933) b!1276183))

(assert (= (and b!1276185 (not c!123933)) b!1276184))

(assert (= (and b!1276183 res!848142) b!1276182))

(assert (= (or b!1276182 b!1276184) bm!62647))

(declare-fun m!1172167 () Bool)

(assert (=> bm!62647 m!1172167))

(assert (=> b!1276183 m!1172159))

(declare-fun m!1172169 () Bool)

(assert (=> b!1276183 m!1172169))

(declare-fun m!1172171 () Bool)

(assert (=> b!1276183 m!1172171))

(assert (=> b!1276183 m!1172159))

(declare-fun m!1172173 () Bool)

(assert (=> b!1276183 m!1172173))

(assert (=> b!1276185 m!1172159))

(assert (=> b!1276185 m!1172159))

(assert (=> b!1276185 m!1172163))

(assert (=> b!1276134 d!140413))

(declare-fun d!140415 () Bool)

(assert (=> d!140415 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108048 d!140415))

(declare-fun d!140417 () Bool)

(assert (=> d!140417 (= (array_inv!30689 _values!1187) (bvsge (size!40931 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108048 d!140417))

(declare-fun d!140419 () Bool)

(assert (=> d!140419 (= (array_inv!30690 _keys!1427) (bvsge (size!40930 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108048 d!140419))

(declare-fun b!1276192 () Bool)

(declare-fun e!728706 () Bool)

(assert (=> b!1276192 (= e!728706 tp_is_empty!33321)))

(declare-fun b!1276193 () Bool)

(declare-fun e!728705 () Bool)

(assert (=> b!1276193 (= e!728705 tp_is_empty!33321)))

(declare-fun mapNonEmpty!51515 () Bool)

(declare-fun mapRes!51515 () Bool)

(declare-fun tp!98273 () Bool)

(assert (=> mapNonEmpty!51515 (= mapRes!51515 (and tp!98273 e!728706))))

(declare-fun mapKey!51515 () (_ BitVec 32))

(declare-fun mapValue!51515 () ValueCell!15762)

(declare-fun mapRest!51515 () (Array (_ BitVec 32) ValueCell!15762))

(assert (=> mapNonEmpty!51515 (= mapRest!51509 (store mapRest!51515 mapKey!51515 mapValue!51515))))

(declare-fun condMapEmpty!51515 () Bool)

(declare-fun mapDefault!51515 () ValueCell!15762)

(assert (=> mapNonEmpty!51509 (= condMapEmpty!51515 (= mapRest!51509 ((as const (Array (_ BitVec 32) ValueCell!15762)) mapDefault!51515)))))

(assert (=> mapNonEmpty!51509 (= tp!98267 (and e!728705 mapRes!51515))))

(declare-fun mapIsEmpty!51515 () Bool)

(assert (=> mapIsEmpty!51515 mapRes!51515))

(assert (= (and mapNonEmpty!51509 condMapEmpty!51515) mapIsEmpty!51515))

(assert (= (and mapNonEmpty!51509 (not condMapEmpty!51515)) mapNonEmpty!51515))

(assert (= (and mapNonEmpty!51515 ((_ is ValueCellFull!15762) mapValue!51515)) b!1276192))

(assert (= (and mapNonEmpty!51509 ((_ is ValueCellFull!15762) mapDefault!51515)) b!1276193))

(declare-fun m!1172175 () Bool)

(assert (=> mapNonEmpty!51515 m!1172175))

(check-sat (not b!1276173) (not bm!62647) (not b!1276185) (not mapNonEmpty!51515) (not b!1276170) (not b!1276171) (not bm!62644) (not b!1276183) tp_is_empty!33321)
(check-sat)
