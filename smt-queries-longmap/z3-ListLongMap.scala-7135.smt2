; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90774 () Bool)

(assert start!90774)

(declare-fun b!1036975 () Bool)

(declare-fun b_free!20863 () Bool)

(declare-fun b_next!20863 () Bool)

(assert (=> b!1036975 (= b_free!20863 (not b_next!20863))))

(declare-fun tp!73717 () Bool)

(declare-fun b_and!33373 () Bool)

(assert (=> b!1036975 (= tp!73717 b_and!33373)))

(declare-fun b!1036969 () Bool)

(declare-fun res!691962 () Bool)

(declare-fun e!586499 () Bool)

(assert (=> b!1036969 (=> (not res!691962) (not e!586499))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036969 (= res!691962 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036970 () Bool)

(declare-datatypes ((V!37651 0))(
  ( (V!37652 (val!12342 Int)) )
))
(declare-datatypes ((ValueCell!11588 0))(
  ( (ValueCellFull!11588 (v!14918 V!37651)) (EmptyCell!11588) )
))
(declare-datatypes ((array!65309 0))(
  ( (array!65310 (arr!31435 (Array (_ BitVec 32) (_ BitVec 64))) (size!31964 (_ BitVec 32))) )
))
(declare-datatypes ((array!65311 0))(
  ( (array!65312 (arr!31436 (Array (_ BitVec 32) ValueCell!11588)) (size!31965 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5770 0))(
  ( (LongMapFixedSize!5771 (defaultEntry!6263 Int) (mask!30216 (_ BitVec 32)) (extraKeys!5993 (_ BitVec 32)) (zeroValue!6097 V!37651) (minValue!6099 V!37651) (_size!2940 (_ BitVec 32)) (_keys!11488 array!65309) (_values!6286 array!65311) (_vacant!2940 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5770)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65309 (_ BitVec 32)) Bool)

(assert (=> b!1036970 (= e!586499 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11488 thiss!1427) (mask!30216 thiss!1427))))))

(declare-fun b!1036971 () Bool)

(declare-fun e!586500 () Bool)

(declare-fun tp_is_empty!24583 () Bool)

(assert (=> b!1036971 (= e!586500 tp_is_empty!24583)))

(declare-fun b!1036972 () Bool)

(declare-fun res!691963 () Bool)

(assert (=> b!1036972 (=> (not res!691963) (not e!586499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036972 (= res!691963 (validMask!0 (mask!30216 thiss!1427)))))

(declare-fun b!1036974 () Bool)

(declare-fun e!586504 () Bool)

(declare-fun mapRes!38385 () Bool)

(assert (=> b!1036974 (= e!586504 (and e!586500 mapRes!38385))))

(declare-fun condMapEmpty!38385 () Bool)

(declare-fun mapDefault!38385 () ValueCell!11588)

(assert (=> b!1036974 (= condMapEmpty!38385 (= (arr!31436 (_values!6286 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11588)) mapDefault!38385)))))

(declare-fun mapNonEmpty!38385 () Bool)

(declare-fun tp!73716 () Bool)

(declare-fun e!586502 () Bool)

(assert (=> mapNonEmpty!38385 (= mapRes!38385 (and tp!73716 e!586502))))

(declare-fun mapValue!38385 () ValueCell!11588)

(declare-fun mapKey!38385 () (_ BitVec 32))

(declare-fun mapRest!38385 () (Array (_ BitVec 32) ValueCell!11588))

(assert (=> mapNonEmpty!38385 (= (arr!31436 (_values!6286 thiss!1427)) (store mapRest!38385 mapKey!38385 mapValue!38385))))

(declare-fun mapIsEmpty!38385 () Bool)

(assert (=> mapIsEmpty!38385 mapRes!38385))

(declare-fun e!586501 () Bool)

(declare-fun array_inv!24323 (array!65309) Bool)

(declare-fun array_inv!24324 (array!65311) Bool)

(assert (=> b!1036975 (= e!586501 (and tp!73717 tp_is_empty!24583 (array_inv!24323 (_keys!11488 thiss!1427)) (array_inv!24324 (_values!6286 thiss!1427)) e!586504))))

(declare-fun b!1036976 () Bool)

(assert (=> b!1036976 (= e!586502 tp_is_empty!24583)))

(declare-fun b!1036973 () Bool)

(declare-fun res!691961 () Bool)

(assert (=> b!1036973 (=> (not res!691961) (not e!586499))))

(assert (=> b!1036973 (= res!691961 (and (= (size!31965 (_values!6286 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30216 thiss!1427))) (= (size!31964 (_keys!11488 thiss!1427)) (size!31965 (_values!6286 thiss!1427))) (bvsge (mask!30216 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5993 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5993 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!691964 () Bool)

(assert (=> start!90774 (=> (not res!691964) (not e!586499))))

(declare-fun valid!2185 (LongMapFixedSize!5770) Bool)

(assert (=> start!90774 (= res!691964 (valid!2185 thiss!1427))))

(assert (=> start!90774 e!586499))

(assert (=> start!90774 e!586501))

(assert (=> start!90774 true))

(assert (= (and start!90774 res!691964) b!1036969))

(assert (= (and b!1036969 res!691962) b!1036972))

(assert (= (and b!1036972 res!691963) b!1036973))

(assert (= (and b!1036973 res!691961) b!1036970))

(assert (= (and b!1036974 condMapEmpty!38385) mapIsEmpty!38385))

(assert (= (and b!1036974 (not condMapEmpty!38385)) mapNonEmpty!38385))

(get-info :version)

(assert (= (and mapNonEmpty!38385 ((_ is ValueCellFull!11588) mapValue!38385)) b!1036976))

(assert (= (and b!1036974 ((_ is ValueCellFull!11588) mapDefault!38385)) b!1036971))

(assert (= b!1036975 b!1036974))

(assert (= start!90774 b!1036975))

(declare-fun m!957147 () Bool)

(assert (=> b!1036970 m!957147))

(declare-fun m!957149 () Bool)

(assert (=> mapNonEmpty!38385 m!957149))

(declare-fun m!957151 () Bool)

(assert (=> b!1036975 m!957151))

(declare-fun m!957153 () Bool)

(assert (=> b!1036975 m!957153))

(declare-fun m!957155 () Bool)

(assert (=> start!90774 m!957155))

(declare-fun m!957157 () Bool)

(assert (=> b!1036972 m!957157))

(check-sat (not b_next!20863) (not b!1036975) tp_is_empty!24583 (not b!1036972) (not mapNonEmpty!38385) b_and!33373 (not b!1036970) (not start!90774))
(check-sat b_and!33373 (not b_next!20863))
(get-model)

(declare-fun d!124995 () Bool)

(declare-fun res!691995 () Bool)

(declare-fun e!586543 () Bool)

(assert (=> d!124995 (=> (not res!691995) (not e!586543))))

(declare-fun simpleValid!412 (LongMapFixedSize!5770) Bool)

(assert (=> d!124995 (= res!691995 (simpleValid!412 thiss!1427))))

(assert (=> d!124995 (= (valid!2185 thiss!1427) e!586543)))

(declare-fun b!1037031 () Bool)

(declare-fun res!691996 () Bool)

(assert (=> b!1037031 (=> (not res!691996) (not e!586543))))

(declare-fun arrayCountValidKeys!0 (array!65309 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037031 (= res!691996 (= (arrayCountValidKeys!0 (_keys!11488 thiss!1427) #b00000000000000000000000000000000 (size!31964 (_keys!11488 thiss!1427))) (_size!2940 thiss!1427)))))

(declare-fun b!1037032 () Bool)

(declare-fun res!691997 () Bool)

(assert (=> b!1037032 (=> (not res!691997) (not e!586543))))

(assert (=> b!1037032 (= res!691997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11488 thiss!1427) (mask!30216 thiss!1427)))))

(declare-fun b!1037033 () Bool)

(declare-datatypes ((List!21900 0))(
  ( (Nil!21897) (Cons!21896 (h!23107 (_ BitVec 64)) (t!31095 List!21900)) )
))
(declare-fun arrayNoDuplicates!0 (array!65309 (_ BitVec 32) List!21900) Bool)

(assert (=> b!1037033 (= e!586543 (arrayNoDuplicates!0 (_keys!11488 thiss!1427) #b00000000000000000000000000000000 Nil!21897))))

(assert (= (and d!124995 res!691995) b!1037031))

(assert (= (and b!1037031 res!691996) b!1037032))

(assert (= (and b!1037032 res!691997) b!1037033))

(declare-fun m!957183 () Bool)

(assert (=> d!124995 m!957183))

(declare-fun m!957185 () Bool)

(assert (=> b!1037031 m!957185))

(assert (=> b!1037032 m!957147))

(declare-fun m!957187 () Bool)

(assert (=> b!1037033 m!957187))

(assert (=> start!90774 d!124995))

(declare-fun d!124997 () Bool)

(assert (=> d!124997 (= (array_inv!24323 (_keys!11488 thiss!1427)) (bvsge (size!31964 (_keys!11488 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036975 d!124997))

(declare-fun d!124999 () Bool)

(assert (=> d!124999 (= (array_inv!24324 (_values!6286 thiss!1427)) (bvsge (size!31965 (_values!6286 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036975 d!124999))

(declare-fun d!125001 () Bool)

(assert (=> d!125001 (= (validMask!0 (mask!30216 thiss!1427)) (and (or (= (mask!30216 thiss!1427) #b00000000000000000000000000000111) (= (mask!30216 thiss!1427) #b00000000000000000000000000001111) (= (mask!30216 thiss!1427) #b00000000000000000000000000011111) (= (mask!30216 thiss!1427) #b00000000000000000000000000111111) (= (mask!30216 thiss!1427) #b00000000000000000000000001111111) (= (mask!30216 thiss!1427) #b00000000000000000000000011111111) (= (mask!30216 thiss!1427) #b00000000000000000000000111111111) (= (mask!30216 thiss!1427) #b00000000000000000000001111111111) (= (mask!30216 thiss!1427) #b00000000000000000000011111111111) (= (mask!30216 thiss!1427) #b00000000000000000000111111111111) (= (mask!30216 thiss!1427) #b00000000000000000001111111111111) (= (mask!30216 thiss!1427) #b00000000000000000011111111111111) (= (mask!30216 thiss!1427) #b00000000000000000111111111111111) (= (mask!30216 thiss!1427) #b00000000000000001111111111111111) (= (mask!30216 thiss!1427) #b00000000000000011111111111111111) (= (mask!30216 thiss!1427) #b00000000000000111111111111111111) (= (mask!30216 thiss!1427) #b00000000000001111111111111111111) (= (mask!30216 thiss!1427) #b00000000000011111111111111111111) (= (mask!30216 thiss!1427) #b00000000000111111111111111111111) (= (mask!30216 thiss!1427) #b00000000001111111111111111111111) (= (mask!30216 thiss!1427) #b00000000011111111111111111111111) (= (mask!30216 thiss!1427) #b00000000111111111111111111111111) (= (mask!30216 thiss!1427) #b00000001111111111111111111111111) (= (mask!30216 thiss!1427) #b00000011111111111111111111111111) (= (mask!30216 thiss!1427) #b00000111111111111111111111111111) (= (mask!30216 thiss!1427) #b00001111111111111111111111111111) (= (mask!30216 thiss!1427) #b00011111111111111111111111111111) (= (mask!30216 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30216 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1036972 d!125001))

(declare-fun b!1037042 () Bool)

(declare-fun e!586551 () Bool)

(declare-fun call!43861 () Bool)

(assert (=> b!1037042 (= e!586551 call!43861)))

(declare-fun bm!43858 () Bool)

(assert (=> bm!43858 (= call!43861 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11488 thiss!1427) (mask!30216 thiss!1427)))))

(declare-fun b!1037043 () Bool)

(declare-fun e!586552 () Bool)

(assert (=> b!1037043 (= e!586552 call!43861)))

(declare-fun b!1037044 () Bool)

(declare-fun e!586550 () Bool)

(assert (=> b!1037044 (= e!586550 e!586551)))

(declare-fun c!105149 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037044 (= c!105149 (validKeyInArray!0 (select (arr!31435 (_keys!11488 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037045 () Bool)

(assert (=> b!1037045 (= e!586551 e!586552)))

(declare-fun lt!457280 () (_ BitVec 64))

(assert (=> b!1037045 (= lt!457280 (select (arr!31435 (_keys!11488 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33894 0))(
  ( (Unit!33895) )
))
(declare-fun lt!457278 () Unit!33894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65309 (_ BitVec 64) (_ BitVec 32)) Unit!33894)

(assert (=> b!1037045 (= lt!457278 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11488 thiss!1427) lt!457280 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1037045 (arrayContainsKey!0 (_keys!11488 thiss!1427) lt!457280 #b00000000000000000000000000000000)))

(declare-fun lt!457279 () Unit!33894)

(assert (=> b!1037045 (= lt!457279 lt!457278)))

(declare-fun res!692003 () Bool)

(declare-datatypes ((SeekEntryResult!9701 0))(
  ( (MissingZero!9701 (index!41175 (_ BitVec 32))) (Found!9701 (index!41176 (_ BitVec 32))) (Intermediate!9701 (undefined!10513 Bool) (index!41177 (_ BitVec 32)) (x!92392 (_ BitVec 32))) (Undefined!9701) (MissingVacant!9701 (index!41178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65309 (_ BitVec 32)) SeekEntryResult!9701)

(assert (=> b!1037045 (= res!692003 (= (seekEntryOrOpen!0 (select (arr!31435 (_keys!11488 thiss!1427)) #b00000000000000000000000000000000) (_keys!11488 thiss!1427) (mask!30216 thiss!1427)) (Found!9701 #b00000000000000000000000000000000)))))

(assert (=> b!1037045 (=> (not res!692003) (not e!586552))))

(declare-fun d!125003 () Bool)

(declare-fun res!692002 () Bool)

(assert (=> d!125003 (=> res!692002 e!586550)))

(assert (=> d!125003 (= res!692002 (bvsge #b00000000000000000000000000000000 (size!31964 (_keys!11488 thiss!1427))))))

(assert (=> d!125003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11488 thiss!1427) (mask!30216 thiss!1427)) e!586550)))

(assert (= (and d!125003 (not res!692002)) b!1037044))

(assert (= (and b!1037044 c!105149) b!1037045))

(assert (= (and b!1037044 (not c!105149)) b!1037042))

(assert (= (and b!1037045 res!692003) b!1037043))

(assert (= (or b!1037043 b!1037042) bm!43858))

(declare-fun m!957189 () Bool)

(assert (=> bm!43858 m!957189))

(declare-fun m!957191 () Bool)

(assert (=> b!1037044 m!957191))

(assert (=> b!1037044 m!957191))

(declare-fun m!957193 () Bool)

(assert (=> b!1037044 m!957193))

(assert (=> b!1037045 m!957191))

(declare-fun m!957195 () Bool)

(assert (=> b!1037045 m!957195))

(declare-fun m!957197 () Bool)

(assert (=> b!1037045 m!957197))

(assert (=> b!1037045 m!957191))

(declare-fun m!957199 () Bool)

(assert (=> b!1037045 m!957199))

(assert (=> b!1036970 d!125003))

(declare-fun b!1037053 () Bool)

(declare-fun e!586558 () Bool)

(assert (=> b!1037053 (= e!586558 tp_is_empty!24583)))

(declare-fun mapNonEmpty!38394 () Bool)

(declare-fun mapRes!38394 () Bool)

(declare-fun tp!73732 () Bool)

(declare-fun e!586557 () Bool)

(assert (=> mapNonEmpty!38394 (= mapRes!38394 (and tp!73732 e!586557))))

(declare-fun mapKey!38394 () (_ BitVec 32))

(declare-fun mapValue!38394 () ValueCell!11588)

(declare-fun mapRest!38394 () (Array (_ BitVec 32) ValueCell!11588))

(assert (=> mapNonEmpty!38394 (= mapRest!38385 (store mapRest!38394 mapKey!38394 mapValue!38394))))

(declare-fun b!1037052 () Bool)

(assert (=> b!1037052 (= e!586557 tp_is_empty!24583)))

(declare-fun mapIsEmpty!38394 () Bool)

(assert (=> mapIsEmpty!38394 mapRes!38394))

(declare-fun condMapEmpty!38394 () Bool)

(declare-fun mapDefault!38394 () ValueCell!11588)

(assert (=> mapNonEmpty!38385 (= condMapEmpty!38394 (= mapRest!38385 ((as const (Array (_ BitVec 32) ValueCell!11588)) mapDefault!38394)))))

(assert (=> mapNonEmpty!38385 (= tp!73716 (and e!586558 mapRes!38394))))

(assert (= (and mapNonEmpty!38385 condMapEmpty!38394) mapIsEmpty!38394))

(assert (= (and mapNonEmpty!38385 (not condMapEmpty!38394)) mapNonEmpty!38394))

(assert (= (and mapNonEmpty!38394 ((_ is ValueCellFull!11588) mapValue!38394)) b!1037052))

(assert (= (and mapNonEmpty!38385 ((_ is ValueCellFull!11588) mapDefault!38394)) b!1037053))

(declare-fun m!957201 () Bool)

(assert (=> mapNonEmpty!38394 m!957201))

(check-sat (not b_next!20863) (not b!1037032) (not bm!43858) b_and!33373 tp_is_empty!24583 (not b!1037044) (not b!1037045) (not b!1037031) (not d!124995) (not mapNonEmpty!38394) (not b!1037033))
(check-sat b_and!33373 (not b_next!20863))
