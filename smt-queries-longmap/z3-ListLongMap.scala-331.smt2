; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6042 () Bool)

(assert start!6042)

(declare-fun b_free!1449 () Bool)

(declare-fun b_next!1449 () Bool)

(assert (=> start!6042 (= b_free!1449 (not b_next!1449))))

(declare-fun tp!5861 () Bool)

(declare-fun b_and!2547 () Bool)

(assert (=> start!6042 (= tp!5861 b_and!2547)))

(declare-fun res!25037 () Bool)

(declare-fun e!26575 () Bool)

(assert (=> start!6042 (=> (not res!25037) (not e!26575))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6042 (= res!25037 (validMask!0 mask!853))))

(assert (=> start!6042 e!26575))

(assert (=> start!6042 true))

(assert (=> start!6042 tp!5861))

(declare-fun b!42035 () Bool)

(declare-fun e!26574 () Bool)

(assert (=> b!42035 (= e!26575 (not e!26574))))

(declare-fun res!25038 () Bool)

(assert (=> b!42035 (=> res!25038 e!26574)))

(declare-datatypes ((V!2211 0))(
  ( (V!2212 (val!958 Int)) )
))
(declare-datatypes ((tuple2!1570 0))(
  ( (tuple2!1571 (_1!796 (_ BitVec 64)) (_2!796 V!2211)) )
))
(declare-datatypes ((List!1138 0))(
  ( (Nil!1135) (Cons!1134 (h!1711 tuple2!1570) (t!4083 List!1138)) )
))
(declare-datatypes ((ListLongMap!1147 0))(
  ( (ListLongMap!1148 (toList!589 List!1138)) )
))
(declare-fun lt!17267 () ListLongMap!1147)

(assert (=> b!42035 (= res!25038 (= lt!17267 (ListLongMap!1148 Nil!1135)))))

(declare-datatypes ((array!2763 0))(
  ( (array!2764 (arr!1325 (Array (_ BitVec 32) (_ BitVec 64))) (size!1483 (_ BitVec 32))) )
))
(declare-fun lt!17269 () array!2763)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!17268 () V!2211)

(declare-datatypes ((ValueCell!672 0))(
  ( (ValueCellFull!672 (v!2042 V!2211)) (EmptyCell!672) )
))
(declare-datatypes ((array!2765 0))(
  ( (array!2766 (arr!1326 (Array (_ BitVec 32) ValueCell!672)) (size!1484 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!324 0))(
  ( (LongMapFixedSize!325 (defaultEntry!1855 Int) (mask!5289 (_ BitVec 32)) (extraKeys!1746 (_ BitVec 32)) (zeroValue!1773 V!2211) (minValue!1773 V!2211) (_size!211 (_ BitVec 32)) (_keys!3368 array!2763) (_values!1838 array!2765) (_vacant!211 (_ BitVec 32))) )
))
(declare-fun map!760 (LongMapFixedSize!324) ListLongMap!1147)

(assert (=> b!42035 (= lt!17267 (map!760 (LongMapFixedSize!325 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17268 lt!17268 #b00000000000000000000000000000000 lt!17269 (array!2766 ((as const (Array (_ BitVec 32) ValueCell!672)) EmptyCell!672) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1139 0))(
  ( (Nil!1136) (Cons!1135 (h!1712 (_ BitVec 64)) (t!4084 List!1139)) )
))
(declare-fun arrayNoDuplicates!0 (array!2763 (_ BitVec 32) List!1139) Bool)

(assert (=> b!42035 (arrayNoDuplicates!0 lt!17269 #b00000000000000000000000000000000 Nil!1136)))

(declare-datatypes ((Unit!1085 0))(
  ( (Unit!1086) )
))
(declare-fun lt!17265 () Unit!1085)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2763 (_ BitVec 32) (_ BitVec 32) List!1139) Unit!1085)

(assert (=> b!42035 (= lt!17265 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17269 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2763 (_ BitVec 32)) Bool)

(assert (=> b!42035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17269 mask!853)))

(declare-fun lt!17270 () Unit!1085)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2763 (_ BitVec 32) (_ BitVec 32)) Unit!1085)

(assert (=> b!42035 (= lt!17270 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17269 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2763 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42035 (= (arrayCountValidKeys!0 lt!17269 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17266 () Unit!1085)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2763 (_ BitVec 32) (_ BitVec 32)) Unit!1085)

(assert (=> b!42035 (= lt!17266 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17269 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42035 (= lt!17269 (array!2764 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!233 (Int (_ BitVec 64)) V!2211)

(assert (=> b!42035 (= lt!17268 (dynLambda!233 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42036 () Bool)

(declare-fun isEmpty!272 (List!1138) Bool)

(assert (=> b!42036 (= e!26574 (not (isEmpty!272 (toList!589 lt!17267))))))

(assert (= (and start!6042 res!25037) b!42035))

(assert (= (and b!42035 (not res!25038)) b!42036))

(declare-fun b_lambda!2179 () Bool)

(assert (=> (not b_lambda!2179) (not b!42035)))

(declare-fun t!4082 () Bool)

(declare-fun tb!931 () Bool)

(assert (=> (and start!6042 (= defaultEntry!470 defaultEntry!470) t!4082) tb!931))

(declare-fun result!1613 () Bool)

(declare-fun tp_is_empty!1839 () Bool)

(assert (=> tb!931 (= result!1613 tp_is_empty!1839)))

(assert (=> b!42035 t!4082))

(declare-fun b_and!2549 () Bool)

(assert (= b_and!2547 (and (=> t!4082 result!1613) b_and!2549)))

(declare-fun m!35637 () Bool)

(assert (=> start!6042 m!35637))

(declare-fun m!35639 () Bool)

(assert (=> b!42035 m!35639))

(declare-fun m!35641 () Bool)

(assert (=> b!42035 m!35641))

(declare-fun m!35643 () Bool)

(assert (=> b!42035 m!35643))

(declare-fun m!35645 () Bool)

(assert (=> b!42035 m!35645))

(declare-fun m!35647 () Bool)

(assert (=> b!42035 m!35647))

(declare-fun m!35649 () Bool)

(assert (=> b!42035 m!35649))

(declare-fun m!35651 () Bool)

(assert (=> b!42035 m!35651))

(declare-fun m!35653 () Bool)

(assert (=> b!42035 m!35653))

(declare-fun m!35655 () Bool)

(assert (=> b!42036 m!35655))

(check-sat (not b_lambda!2179) b_and!2549 tp_is_empty!1839 (not b_next!1449) (not b!42035) (not start!6042) (not b!42036))
(check-sat b_and!2549 (not b_next!1449))
(get-model)

(declare-fun b_lambda!2187 () Bool)

(assert (= b_lambda!2179 (or (and start!6042 b_free!1449) b_lambda!2187)))

(check-sat b_and!2549 tp_is_empty!1839 (not b_lambda!2187) (not b_next!1449) (not b!42035) (not start!6042) (not b!42036))
(check-sat b_and!2549 (not b_next!1449))
(get-model)

(declare-fun d!7535 () Bool)

(get-info :version)

(assert (=> d!7535 (= (isEmpty!272 (toList!589 lt!17267)) ((_ is Nil!1135) (toList!589 lt!17267)))))

(assert (=> b!42036 d!7535))

(declare-fun d!7539 () Bool)

(assert (=> d!7539 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6042 d!7539))

(declare-fun d!7545 () Bool)

(assert (=> d!7545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17269 mask!853)))

(declare-fun lt!17300 () Unit!1085)

(declare-fun choose!34 (array!2763 (_ BitVec 32) (_ BitVec 32)) Unit!1085)

(assert (=> d!7545 (= lt!17300 (choose!34 lt!17269 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7545 (validMask!0 mask!853)))

(assert (=> d!7545 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17269 mask!853 #b00000000000000000000000000000000) lt!17300)))

(declare-fun bs!1812 () Bool)

(assert (= bs!1812 d!7545))

(assert (=> bs!1812 m!35641))

(declare-fun m!35689 () Bool)

(assert (=> bs!1812 m!35689))

(assert (=> bs!1812 m!35637))

(assert (=> b!42035 d!7545))

(declare-fun bm!3266 () Bool)

(declare-fun call!3269 () Bool)

(declare-fun c!5258 () Bool)

(assert (=> bm!3266 (= call!3269 (arrayNoDuplicates!0 lt!17269 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5258 (Cons!1135 (select (arr!1325 lt!17269) #b00000000000000000000000000000000) Nil!1136) Nil!1136)))))

(declare-fun b!42084 () Bool)

(declare-fun e!26613 () Bool)

(declare-fun contains!552 (List!1139 (_ BitVec 64)) Bool)

(assert (=> b!42084 (= e!26613 (contains!552 Nil!1136 (select (arr!1325 lt!17269) #b00000000000000000000000000000000)))))

(declare-fun b!42085 () Bool)

(declare-fun e!26612 () Bool)

(assert (=> b!42085 (= e!26612 call!3269)))

(declare-fun b!42086 () Bool)

(declare-fun e!26611 () Bool)

(assert (=> b!42086 (= e!26611 e!26612)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42086 (= c!5258 (validKeyInArray!0 (select (arr!1325 lt!17269) #b00000000000000000000000000000000)))))

(declare-fun d!7549 () Bool)

(declare-fun res!25066 () Bool)

(declare-fun e!26614 () Bool)

(assert (=> d!7549 (=> res!25066 e!26614)))

(assert (=> d!7549 (= res!25066 (bvsge #b00000000000000000000000000000000 (size!1483 lt!17269)))))

(assert (=> d!7549 (= (arrayNoDuplicates!0 lt!17269 #b00000000000000000000000000000000 Nil!1136) e!26614)))

(declare-fun b!42087 () Bool)

(assert (=> b!42087 (= e!26614 e!26611)))

(declare-fun res!25067 () Bool)

(assert (=> b!42087 (=> (not res!25067) (not e!26611))))

(assert (=> b!42087 (= res!25067 (not e!26613))))

(declare-fun res!25068 () Bool)

(assert (=> b!42087 (=> (not res!25068) (not e!26613))))

(assert (=> b!42087 (= res!25068 (validKeyInArray!0 (select (arr!1325 lt!17269) #b00000000000000000000000000000000)))))

(declare-fun b!42088 () Bool)

(assert (=> b!42088 (= e!26612 call!3269)))

(assert (= (and d!7549 (not res!25066)) b!42087))

(assert (= (and b!42087 res!25068) b!42084))

(assert (= (and b!42087 res!25067) b!42086))

(assert (= (and b!42086 c!5258) b!42088))

(assert (= (and b!42086 (not c!5258)) b!42085))

(assert (= (or b!42088 b!42085) bm!3266))

(declare-fun m!35707 () Bool)

(assert (=> bm!3266 m!35707))

(declare-fun m!35709 () Bool)

(assert (=> bm!3266 m!35709))

(assert (=> b!42084 m!35707))

(assert (=> b!42084 m!35707))

(declare-fun m!35711 () Bool)

(assert (=> b!42084 m!35711))

(assert (=> b!42086 m!35707))

(assert (=> b!42086 m!35707))

(declare-fun m!35713 () Bool)

(assert (=> b!42086 m!35713))

(assert (=> b!42087 m!35707))

(assert (=> b!42087 m!35707))

(assert (=> b!42087 m!35713))

(assert (=> b!42035 d!7549))

(declare-fun d!7561 () Bool)

(assert (=> d!7561 (= (arrayCountValidKeys!0 lt!17269 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17320 () Unit!1085)

(declare-fun choose!59 (array!2763 (_ BitVec 32) (_ BitVec 32)) Unit!1085)

(assert (=> d!7561 (= lt!17320 (choose!59 lt!17269 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7561 (bvslt (size!1483 lt!17269) #b01111111111111111111111111111111)))

(assert (=> d!7561 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17269 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17320)))

(declare-fun bs!1817 () Bool)

(assert (= bs!1817 d!7561))

(assert (=> bs!1817 m!35653))

(declare-fun m!35715 () Bool)

(assert (=> bs!1817 m!35715))

(assert (=> b!42035 d!7561))

(declare-fun b!42132 () Bool)

(declare-fun e!26645 () Bool)

(declare-fun e!26644 () Bool)

(assert (=> b!42132 (= e!26645 e!26644)))

(declare-fun lt!17330 () (_ BitVec 64))

(assert (=> b!42132 (= lt!17330 (select (arr!1325 lt!17269) #b00000000000000000000000000000000))))

(declare-fun lt!17332 () Unit!1085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2763 (_ BitVec 64) (_ BitVec 32)) Unit!1085)

(assert (=> b!42132 (= lt!17332 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17269 lt!17330 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42132 (arrayContainsKey!0 lt!17269 lt!17330 #b00000000000000000000000000000000)))

(declare-fun lt!17331 () Unit!1085)

(assert (=> b!42132 (= lt!17331 lt!17332)))

(declare-fun res!25083 () Bool)

(declare-datatypes ((SeekEntryResult!180 0))(
  ( (MissingZero!180 (index!2842 (_ BitVec 32))) (Found!180 (index!2843 (_ BitVec 32))) (Intermediate!180 (undefined!992 Bool) (index!2844 (_ BitVec 32)) (x!8009 (_ BitVec 32))) (Undefined!180) (MissingVacant!180 (index!2845 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2763 (_ BitVec 32)) SeekEntryResult!180)

(assert (=> b!42132 (= res!25083 (= (seekEntryOrOpen!0 (select (arr!1325 lt!17269) #b00000000000000000000000000000000) lt!17269 mask!853) (Found!180 #b00000000000000000000000000000000)))))

(assert (=> b!42132 (=> (not res!25083) (not e!26644))))

(declare-fun b!42133 () Bool)

(declare-fun e!26643 () Bool)

(assert (=> b!42133 (= e!26643 e!26645)))

(declare-fun c!5274 () Bool)

(assert (=> b!42133 (= c!5274 (validKeyInArray!0 (select (arr!1325 lt!17269) #b00000000000000000000000000000000)))))

(declare-fun bm!3277 () Bool)

(declare-fun call!3280 () Bool)

(assert (=> bm!3277 (= call!3280 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17269 mask!853))))

(declare-fun b!42134 () Bool)

(assert (=> b!42134 (= e!26645 call!3280)))

(declare-fun d!7563 () Bool)

(declare-fun res!25082 () Bool)

(assert (=> d!7563 (=> res!25082 e!26643)))

(assert (=> d!7563 (= res!25082 (bvsge #b00000000000000000000000000000000 (size!1483 lt!17269)))))

(assert (=> d!7563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17269 mask!853) e!26643)))

(declare-fun b!42135 () Bool)

(assert (=> b!42135 (= e!26644 call!3280)))

(assert (= (and d!7563 (not res!25082)) b!42133))

(assert (= (and b!42133 c!5274) b!42132))

(assert (= (and b!42133 (not c!5274)) b!42134))

(assert (= (and b!42132 res!25083) b!42135))

(assert (= (or b!42135 b!42134) bm!3277))

(assert (=> b!42132 m!35707))

(declare-fun m!35729 () Bool)

(assert (=> b!42132 m!35729))

(declare-fun m!35731 () Bool)

(assert (=> b!42132 m!35731))

(assert (=> b!42132 m!35707))

(declare-fun m!35733 () Bool)

(assert (=> b!42132 m!35733))

(assert (=> b!42133 m!35707))

(assert (=> b!42133 m!35707))

(assert (=> b!42133 m!35713))

(declare-fun m!35735 () Bool)

(assert (=> bm!3277 m!35735))

(assert (=> b!42035 d!7563))

(declare-fun d!7571 () Bool)

(declare-fun getCurrentListMap!344 (array!2763 array!2765 (_ BitVec 32) (_ BitVec 32) V!2211 V!2211 (_ BitVec 32) Int) ListLongMap!1147)

(assert (=> d!7571 (= (map!760 (LongMapFixedSize!325 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17268 lt!17268 #b00000000000000000000000000000000 lt!17269 (array!2766 ((as const (Array (_ BitVec 32) ValueCell!672)) EmptyCell!672) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!344 (_keys!3368 (LongMapFixedSize!325 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17268 lt!17268 #b00000000000000000000000000000000 lt!17269 (array!2766 ((as const (Array (_ BitVec 32) ValueCell!672)) EmptyCell!672) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1838 (LongMapFixedSize!325 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17268 lt!17268 #b00000000000000000000000000000000 lt!17269 (array!2766 ((as const (Array (_ BitVec 32) ValueCell!672)) EmptyCell!672) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5289 (LongMapFixedSize!325 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17268 lt!17268 #b00000000000000000000000000000000 lt!17269 (array!2766 ((as const (Array (_ BitVec 32) ValueCell!672)) EmptyCell!672) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1746 (LongMapFixedSize!325 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17268 lt!17268 #b00000000000000000000000000000000 lt!17269 (array!2766 ((as const (Array (_ BitVec 32) ValueCell!672)) EmptyCell!672) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1773 (LongMapFixedSize!325 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17268 lt!17268 #b00000000000000000000000000000000 lt!17269 (array!2766 ((as const (Array (_ BitVec 32) ValueCell!672)) EmptyCell!672) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1773 (LongMapFixedSize!325 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17268 lt!17268 #b00000000000000000000000000000000 lt!17269 (array!2766 ((as const (Array (_ BitVec 32) ValueCell!672)) EmptyCell!672) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1855 (LongMapFixedSize!325 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17268 lt!17268 #b00000000000000000000000000000000 lt!17269 (array!2766 ((as const (Array (_ BitVec 32) ValueCell!672)) EmptyCell!672) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1820 () Bool)

(assert (= bs!1820 d!7571))

(declare-fun m!35741 () Bool)

(assert (=> bs!1820 m!35741))

(assert (=> b!42035 d!7571))

(declare-fun d!7577 () Bool)

(assert (=> d!7577 (arrayNoDuplicates!0 lt!17269 #b00000000000000000000000000000000 Nil!1136)))

(declare-fun lt!17348 () Unit!1085)

(declare-fun choose!111 (array!2763 (_ BitVec 32) (_ BitVec 32) List!1139) Unit!1085)

(assert (=> d!7577 (= lt!17348 (choose!111 lt!17269 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1136))))

(assert (=> d!7577 (= (size!1483 lt!17269) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7577 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!17269 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1136) lt!17348)))

(declare-fun bs!1821 () Bool)

(assert (= bs!1821 d!7577))

(assert (=> bs!1821 m!35651))

(declare-fun m!35751 () Bool)

(assert (=> bs!1821 m!35751))

(assert (=> b!42035 d!7577))

(declare-fun b!42160 () Bool)

(declare-fun e!26661 () (_ BitVec 32))

(declare-fun call!3287 () (_ BitVec 32))

(assert (=> b!42160 (= e!26661 call!3287)))

(declare-fun b!42161 () Bool)

(assert (=> b!42161 (= e!26661 (bvadd #b00000000000000000000000000000001 call!3287))))

(declare-fun b!42162 () Bool)

(declare-fun e!26662 () (_ BitVec 32))

(assert (=> b!42162 (= e!26662 e!26661)))

(declare-fun c!5284 () Bool)

(assert (=> b!42162 (= c!5284 (validKeyInArray!0 (select (arr!1325 lt!17269) #b00000000000000000000000000000000)))))

(declare-fun d!7581 () Bool)

(declare-fun lt!17351 () (_ BitVec 32))

(assert (=> d!7581 (and (bvsge lt!17351 #b00000000000000000000000000000000) (bvsle lt!17351 (bvsub (size!1483 lt!17269) #b00000000000000000000000000000000)))))

(assert (=> d!7581 (= lt!17351 e!26662)))

(declare-fun c!5285 () Bool)

(assert (=> d!7581 (= c!5285 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7581 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1483 lt!17269)))))

(assert (=> d!7581 (= (arrayCountValidKeys!0 lt!17269 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17351)))

(declare-fun b!42163 () Bool)

(assert (=> b!42163 (= e!26662 #b00000000000000000000000000000000)))

(declare-fun bm!3284 () Bool)

(assert (=> bm!3284 (= call!3287 (arrayCountValidKeys!0 lt!17269 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7581 c!5285) b!42163))

(assert (= (and d!7581 (not c!5285)) b!42162))

(assert (= (and b!42162 c!5284) b!42161))

(assert (= (and b!42162 (not c!5284)) b!42160))

(assert (= (or b!42161 b!42160) bm!3284))

(assert (=> b!42162 m!35707))

(assert (=> b!42162 m!35707))

(assert (=> b!42162 m!35713))

(declare-fun m!35753 () Bool)

(assert (=> bm!3284 m!35753))

(assert (=> b!42035 d!7581))

(check-sat (not bm!3277) b_and!2549 (not b!42086) (not d!7577) (not b!42162) (not d!7545) (not b!42132) (not b_next!1449) (not d!7571) (not bm!3284) (not b!42084) (not b!42133) (not b!42087) tp_is_empty!1839 (not b_lambda!2187) (not bm!3266) (not d!7561))
(check-sat b_and!2549 (not b_next!1449))
