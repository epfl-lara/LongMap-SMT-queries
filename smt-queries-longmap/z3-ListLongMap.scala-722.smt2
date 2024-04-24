; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16872 () Bool)

(assert start!16872)

(declare-fun b!169950 () Bool)

(declare-fun b_free!4171 () Bool)

(declare-fun b_next!4171 () Bool)

(assert (=> b!169950 (= b_free!4171 (not b_next!4171))))

(declare-fun tp!15122 () Bool)

(declare-fun b_and!10599 () Bool)

(assert (=> b!169950 (= tp!15122 b_and!10599)))

(declare-fun b!169948 () Bool)

(declare-fun res!80796 () Bool)

(declare-fun e!112091 () Bool)

(assert (=> b!169948 (=> (not res!80796) (not e!112091))))

(declare-datatypes ((V!4905 0))(
  ( (V!4906 (val!2016 Int)) )
))
(declare-datatypes ((ValueCell!1628 0))(
  ( (ValueCellFull!1628 (v!3882 V!4905)) (EmptyCell!1628) )
))
(declare-datatypes ((array!6973 0))(
  ( (array!6974 (arr!3320 (Array (_ BitVec 32) (_ BitVec 64))) (size!3610 (_ BitVec 32))) )
))
(declare-datatypes ((array!6975 0))(
  ( (array!6976 (arr!3321 (Array (_ BitVec 32) ValueCell!1628)) (size!3611 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2164 0))(
  ( (LongMapFixedSize!2165 (defaultEntry!3524 Int) (mask!8321 (_ BitVec 32)) (extraKeys!3265 (_ BitVec 32)) (zeroValue!3367 V!4905) (minValue!3367 V!4905) (_size!1131 (_ BitVec 32)) (_keys!5351 array!6973) (_values!3507 array!6975) (_vacant!1131 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2164)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169948 (= res!80796 (validMask!0 (mask!8321 thiss!1248)))))

(declare-fun b!169949 () Bool)

(declare-fun e!112090 () Bool)

(declare-fun tp_is_empty!3943 () Bool)

(assert (=> b!169949 (= e!112090 tp_is_empty!3943)))

(declare-fun e!112087 () Bool)

(declare-fun e!112088 () Bool)

(declare-fun array_inv!2131 (array!6973) Bool)

(declare-fun array_inv!2132 (array!6975) Bool)

(assert (=> b!169950 (= e!112087 (and tp!15122 tp_is_empty!3943 (array_inv!2131 (_keys!5351 thiss!1248)) (array_inv!2132 (_values!3507 thiss!1248)) e!112088))))

(declare-fun b!169951 () Bool)

(declare-fun mapRes!6686 () Bool)

(assert (=> b!169951 (= e!112088 (and e!112090 mapRes!6686))))

(declare-fun condMapEmpty!6686 () Bool)

(declare-fun mapDefault!6686 () ValueCell!1628)

(assert (=> b!169951 (= condMapEmpty!6686 (= (arr!3321 (_values!3507 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1628)) mapDefault!6686)))))

(declare-fun b!169952 () Bool)

(assert (=> b!169952 (= e!112091 (and (= (size!3611 (_values!3507 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8321 thiss!1248))) (not (= (size!3610 (_keys!5351 thiss!1248)) (size!3611 (_values!3507 thiss!1248))))))))

(declare-fun mapIsEmpty!6686 () Bool)

(assert (=> mapIsEmpty!6686 mapRes!6686))

(declare-fun res!80794 () Bool)

(assert (=> start!16872 (=> (not res!80794) (not e!112091))))

(declare-fun valid!942 (LongMapFixedSize!2164) Bool)

(assert (=> start!16872 (= res!80794 (valid!942 thiss!1248))))

(assert (=> start!16872 e!112091))

(assert (=> start!16872 e!112087))

(assert (=> start!16872 true))

(declare-fun mapNonEmpty!6686 () Bool)

(declare-fun tp!15121 () Bool)

(declare-fun e!112092 () Bool)

(assert (=> mapNonEmpty!6686 (= mapRes!6686 (and tp!15121 e!112092))))

(declare-fun mapValue!6686 () ValueCell!1628)

(declare-fun mapRest!6686 () (Array (_ BitVec 32) ValueCell!1628))

(declare-fun mapKey!6686 () (_ BitVec 32))

(assert (=> mapNonEmpty!6686 (= (arr!3321 (_values!3507 thiss!1248)) (store mapRest!6686 mapKey!6686 mapValue!6686))))

(declare-fun b!169953 () Bool)

(assert (=> b!169953 (= e!112092 tp_is_empty!3943)))

(declare-fun b!169954 () Bool)

(declare-fun res!80795 () Bool)

(assert (=> b!169954 (=> (not res!80795) (not e!112091))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169954 (= res!80795 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!16872 res!80794) b!169954))

(assert (= (and b!169954 res!80795) b!169948))

(assert (= (and b!169948 res!80796) b!169952))

(assert (= (and b!169951 condMapEmpty!6686) mapIsEmpty!6686))

(assert (= (and b!169951 (not condMapEmpty!6686)) mapNonEmpty!6686))

(get-info :version)

(assert (= (and mapNonEmpty!6686 ((_ is ValueCellFull!1628) mapValue!6686)) b!169953))

(assert (= (and b!169951 ((_ is ValueCellFull!1628) mapDefault!6686)) b!169949))

(assert (= b!169950 b!169951))

(assert (= start!16872 b!169950))

(declare-fun m!198879 () Bool)

(assert (=> b!169948 m!198879))

(declare-fun m!198881 () Bool)

(assert (=> b!169950 m!198881))

(declare-fun m!198883 () Bool)

(assert (=> b!169950 m!198883))

(declare-fun m!198885 () Bool)

(assert (=> start!16872 m!198885))

(declare-fun m!198887 () Bool)

(assert (=> mapNonEmpty!6686 m!198887))

(check-sat tp_is_empty!3943 b_and!10599 (not start!16872) (not b_next!4171) (not mapNonEmpty!6686) (not b!169948) (not b!169950))
(check-sat b_and!10599 (not b_next!4171))
(get-model)

(declare-fun d!51743 () Bool)

(assert (=> d!51743 (= (validMask!0 (mask!8321 thiss!1248)) (and (or (= (mask!8321 thiss!1248) #b00000000000000000000000000000111) (= (mask!8321 thiss!1248) #b00000000000000000000000000001111) (= (mask!8321 thiss!1248) #b00000000000000000000000000011111) (= (mask!8321 thiss!1248) #b00000000000000000000000000111111) (= (mask!8321 thiss!1248) #b00000000000000000000000001111111) (= (mask!8321 thiss!1248) #b00000000000000000000000011111111) (= (mask!8321 thiss!1248) #b00000000000000000000000111111111) (= (mask!8321 thiss!1248) #b00000000000000000000001111111111) (= (mask!8321 thiss!1248) #b00000000000000000000011111111111) (= (mask!8321 thiss!1248) #b00000000000000000000111111111111) (= (mask!8321 thiss!1248) #b00000000000000000001111111111111) (= (mask!8321 thiss!1248) #b00000000000000000011111111111111) (= (mask!8321 thiss!1248) #b00000000000000000111111111111111) (= (mask!8321 thiss!1248) #b00000000000000001111111111111111) (= (mask!8321 thiss!1248) #b00000000000000011111111111111111) (= (mask!8321 thiss!1248) #b00000000000000111111111111111111) (= (mask!8321 thiss!1248) #b00000000000001111111111111111111) (= (mask!8321 thiss!1248) #b00000000000011111111111111111111) (= (mask!8321 thiss!1248) #b00000000000111111111111111111111) (= (mask!8321 thiss!1248) #b00000000001111111111111111111111) (= (mask!8321 thiss!1248) #b00000000011111111111111111111111) (= (mask!8321 thiss!1248) #b00000000111111111111111111111111) (= (mask!8321 thiss!1248) #b00000001111111111111111111111111) (= (mask!8321 thiss!1248) #b00000011111111111111111111111111) (= (mask!8321 thiss!1248) #b00000111111111111111111111111111) (= (mask!8321 thiss!1248) #b00001111111111111111111111111111) (= (mask!8321 thiss!1248) #b00011111111111111111111111111111) (= (mask!8321 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8321 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169948 d!51743))

(declare-fun d!51745 () Bool)

(declare-fun res!80821 () Bool)

(declare-fun e!112131 () Bool)

(assert (=> d!51745 (=> (not res!80821) (not e!112131))))

(declare-fun simpleValid!129 (LongMapFixedSize!2164) Bool)

(assert (=> d!51745 (= res!80821 (simpleValid!129 thiss!1248))))

(assert (=> d!51745 (= (valid!942 thiss!1248) e!112131)))

(declare-fun b!170003 () Bool)

(declare-fun res!80822 () Bool)

(assert (=> b!170003 (=> (not res!80822) (not e!112131))))

(declare-fun arrayCountValidKeys!0 (array!6973 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170003 (= res!80822 (= (arrayCountValidKeys!0 (_keys!5351 thiss!1248) #b00000000000000000000000000000000 (size!3610 (_keys!5351 thiss!1248))) (_size!1131 thiss!1248)))))

(declare-fun b!170004 () Bool)

(declare-fun res!80823 () Bool)

(assert (=> b!170004 (=> (not res!80823) (not e!112131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6973 (_ BitVec 32)) Bool)

(assert (=> b!170004 (= res!80823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5351 thiss!1248) (mask!8321 thiss!1248)))))

(declare-fun b!170005 () Bool)

(declare-datatypes ((List!2168 0))(
  ( (Nil!2165) (Cons!2164 (h!2781 (_ BitVec 64)) (t!6962 List!2168)) )
))
(declare-fun arrayNoDuplicates!0 (array!6973 (_ BitVec 32) List!2168) Bool)

(assert (=> b!170005 (= e!112131 (arrayNoDuplicates!0 (_keys!5351 thiss!1248) #b00000000000000000000000000000000 Nil!2165))))

(assert (= (and d!51745 res!80821) b!170003))

(assert (= (and b!170003 res!80822) b!170004))

(assert (= (and b!170004 res!80823) b!170005))

(declare-fun m!198909 () Bool)

(assert (=> d!51745 m!198909))

(declare-fun m!198911 () Bool)

(assert (=> b!170003 m!198911))

(declare-fun m!198913 () Bool)

(assert (=> b!170004 m!198913))

(declare-fun m!198915 () Bool)

(assert (=> b!170005 m!198915))

(assert (=> start!16872 d!51745))

(declare-fun d!51747 () Bool)

(assert (=> d!51747 (= (array_inv!2131 (_keys!5351 thiss!1248)) (bvsge (size!3610 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169950 d!51747))

(declare-fun d!51749 () Bool)

(assert (=> d!51749 (= (array_inv!2132 (_values!3507 thiss!1248)) (bvsge (size!3611 (_values!3507 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169950 d!51749))

(declare-fun mapIsEmpty!6695 () Bool)

(declare-fun mapRes!6695 () Bool)

(assert (=> mapIsEmpty!6695 mapRes!6695))

(declare-fun mapNonEmpty!6695 () Bool)

(declare-fun tp!15137 () Bool)

(declare-fun e!112136 () Bool)

(assert (=> mapNonEmpty!6695 (= mapRes!6695 (and tp!15137 e!112136))))

(declare-fun mapKey!6695 () (_ BitVec 32))

(declare-fun mapRest!6695 () (Array (_ BitVec 32) ValueCell!1628))

(declare-fun mapValue!6695 () ValueCell!1628)

(assert (=> mapNonEmpty!6695 (= mapRest!6686 (store mapRest!6695 mapKey!6695 mapValue!6695))))

(declare-fun b!170012 () Bool)

(assert (=> b!170012 (= e!112136 tp_is_empty!3943)))

(declare-fun condMapEmpty!6695 () Bool)

(declare-fun mapDefault!6695 () ValueCell!1628)

(assert (=> mapNonEmpty!6686 (= condMapEmpty!6695 (= mapRest!6686 ((as const (Array (_ BitVec 32) ValueCell!1628)) mapDefault!6695)))))

(declare-fun e!112137 () Bool)

(assert (=> mapNonEmpty!6686 (= tp!15121 (and e!112137 mapRes!6695))))

(declare-fun b!170013 () Bool)

(assert (=> b!170013 (= e!112137 tp_is_empty!3943)))

(assert (= (and mapNonEmpty!6686 condMapEmpty!6695) mapIsEmpty!6695))

(assert (= (and mapNonEmpty!6686 (not condMapEmpty!6695)) mapNonEmpty!6695))

(assert (= (and mapNonEmpty!6695 ((_ is ValueCellFull!1628) mapValue!6695)) b!170012))

(assert (= (and mapNonEmpty!6686 ((_ is ValueCellFull!1628) mapDefault!6695)) b!170013))

(declare-fun m!198917 () Bool)

(assert (=> mapNonEmpty!6695 m!198917))

(check-sat tp_is_empty!3943 b_and!10599 (not b!170003) (not b_next!4171) (not d!51745) (not b!170004) (not b!170005) (not mapNonEmpty!6695))
(check-sat b_and!10599 (not b_next!4171))
(get-model)

(declare-fun b!170024 () Bool)

(declare-fun e!112147 () Bool)

(declare-fun e!112149 () Bool)

(assert (=> b!170024 (= e!112147 e!112149)))

(declare-fun c!30467 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170024 (= c!30467 (validKeyInArray!0 (select (arr!3320 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17341 () Bool)

(declare-fun call!17344 () Bool)

(assert (=> bm!17341 (= call!17344 (arrayNoDuplicates!0 (_keys!5351 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30467 (Cons!2164 (select (arr!3320 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000) Nil!2165) Nil!2165)))))

(declare-fun d!51751 () Bool)

(declare-fun res!80830 () Bool)

(declare-fun e!112148 () Bool)

(assert (=> d!51751 (=> res!80830 e!112148)))

(assert (=> d!51751 (= res!80830 (bvsge #b00000000000000000000000000000000 (size!3610 (_keys!5351 thiss!1248))))))

(assert (=> d!51751 (= (arrayNoDuplicates!0 (_keys!5351 thiss!1248) #b00000000000000000000000000000000 Nil!2165) e!112148)))

(declare-fun b!170025 () Bool)

(declare-fun e!112146 () Bool)

(declare-fun contains!1135 (List!2168 (_ BitVec 64)) Bool)

(assert (=> b!170025 (= e!112146 (contains!1135 Nil!2165 (select (arr!3320 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170026 () Bool)

(assert (=> b!170026 (= e!112149 call!17344)))

(declare-fun b!170027 () Bool)

(assert (=> b!170027 (= e!112149 call!17344)))

(declare-fun b!170028 () Bool)

(assert (=> b!170028 (= e!112148 e!112147)))

(declare-fun res!80831 () Bool)

(assert (=> b!170028 (=> (not res!80831) (not e!112147))))

(assert (=> b!170028 (= res!80831 (not e!112146))))

(declare-fun res!80832 () Bool)

(assert (=> b!170028 (=> (not res!80832) (not e!112146))))

(assert (=> b!170028 (= res!80832 (validKeyInArray!0 (select (arr!3320 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51751 (not res!80830)) b!170028))

(assert (= (and b!170028 res!80832) b!170025))

(assert (= (and b!170028 res!80831) b!170024))

(assert (= (and b!170024 c!30467) b!170027))

(assert (= (and b!170024 (not c!30467)) b!170026))

(assert (= (or b!170027 b!170026) bm!17341))

(declare-fun m!198919 () Bool)

(assert (=> b!170024 m!198919))

(assert (=> b!170024 m!198919))

(declare-fun m!198921 () Bool)

(assert (=> b!170024 m!198921))

(assert (=> bm!17341 m!198919))

(declare-fun m!198923 () Bool)

(assert (=> bm!17341 m!198923))

(assert (=> b!170025 m!198919))

(assert (=> b!170025 m!198919))

(declare-fun m!198925 () Bool)

(assert (=> b!170025 m!198925))

(assert (=> b!170028 m!198919))

(assert (=> b!170028 m!198919))

(assert (=> b!170028 m!198921))

(assert (=> b!170005 d!51751))

(declare-fun d!51753 () Bool)

(declare-fun res!80837 () Bool)

(declare-fun e!112156 () Bool)

(assert (=> d!51753 (=> res!80837 e!112156)))

(assert (=> d!51753 (= res!80837 (bvsge #b00000000000000000000000000000000 (size!3610 (_keys!5351 thiss!1248))))))

(assert (=> d!51753 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5351 thiss!1248) (mask!8321 thiss!1248)) e!112156)))

(declare-fun b!170037 () Bool)

(declare-fun e!112158 () Bool)

(declare-fun e!112157 () Bool)

(assert (=> b!170037 (= e!112158 e!112157)))

(declare-fun lt!85041 () (_ BitVec 64))

(assert (=> b!170037 (= lt!85041 (select (arr!3320 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5241 0))(
  ( (Unit!5242) )
))
(declare-fun lt!85040 () Unit!5241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6973 (_ BitVec 64) (_ BitVec 32)) Unit!5241)

(assert (=> b!170037 (= lt!85040 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5351 thiss!1248) lt!85041 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170037 (arrayContainsKey!0 (_keys!5351 thiss!1248) lt!85041 #b00000000000000000000000000000000)))

(declare-fun lt!85039 () Unit!5241)

(assert (=> b!170037 (= lt!85039 lt!85040)))

(declare-fun res!80838 () Bool)

(declare-datatypes ((SeekEntryResult!523 0))(
  ( (MissingZero!523 (index!4260 (_ BitVec 32))) (Found!523 (index!4261 (_ BitVec 32))) (Intermediate!523 (undefined!1335 Bool) (index!4262 (_ BitVec 32)) (x!18793 (_ BitVec 32))) (Undefined!523) (MissingVacant!523 (index!4263 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6973 (_ BitVec 32)) SeekEntryResult!523)

(assert (=> b!170037 (= res!80838 (= (seekEntryOrOpen!0 (select (arr!3320 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000) (_keys!5351 thiss!1248) (mask!8321 thiss!1248)) (Found!523 #b00000000000000000000000000000000)))))

(assert (=> b!170037 (=> (not res!80838) (not e!112157))))

(declare-fun b!170038 () Bool)

(declare-fun call!17347 () Bool)

(assert (=> b!170038 (= e!112157 call!17347)))

(declare-fun bm!17344 () Bool)

(assert (=> bm!17344 (= call!17347 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5351 thiss!1248) (mask!8321 thiss!1248)))))

(declare-fun b!170039 () Bool)

(assert (=> b!170039 (= e!112158 call!17347)))

(declare-fun b!170040 () Bool)

(assert (=> b!170040 (= e!112156 e!112158)))

(declare-fun c!30470 () Bool)

(assert (=> b!170040 (= c!30470 (validKeyInArray!0 (select (arr!3320 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51753 (not res!80837)) b!170040))

(assert (= (and b!170040 c!30470) b!170037))

(assert (= (and b!170040 (not c!30470)) b!170039))

(assert (= (and b!170037 res!80838) b!170038))

(assert (= (or b!170038 b!170039) bm!17344))

(assert (=> b!170037 m!198919))

(declare-fun m!198927 () Bool)

(assert (=> b!170037 m!198927))

(declare-fun m!198929 () Bool)

(assert (=> b!170037 m!198929))

(assert (=> b!170037 m!198919))

(declare-fun m!198931 () Bool)

(assert (=> b!170037 m!198931))

(declare-fun m!198933 () Bool)

(assert (=> bm!17344 m!198933))

(assert (=> b!170040 m!198919))

(assert (=> b!170040 m!198919))

(assert (=> b!170040 m!198921))

(assert (=> b!170004 d!51753))

(declare-fun b!170052 () Bool)

(declare-fun e!112161 () Bool)

(assert (=> b!170052 (= e!112161 (and (bvsge (extraKeys!3265 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3265 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1131 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170051 () Bool)

(declare-fun res!80849 () Bool)

(assert (=> b!170051 (=> (not res!80849) (not e!112161))))

(declare-fun size!3616 (LongMapFixedSize!2164) (_ BitVec 32))

(assert (=> b!170051 (= res!80849 (= (size!3616 thiss!1248) (bvadd (_size!1131 thiss!1248) (bvsdiv (bvadd (extraKeys!3265 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!170050 () Bool)

(declare-fun res!80847 () Bool)

(assert (=> b!170050 (=> (not res!80847) (not e!112161))))

(assert (=> b!170050 (= res!80847 (bvsge (size!3616 thiss!1248) (_size!1131 thiss!1248)))))

(declare-fun d!51755 () Bool)

(declare-fun res!80848 () Bool)

(assert (=> d!51755 (=> (not res!80848) (not e!112161))))

(assert (=> d!51755 (= res!80848 (validMask!0 (mask!8321 thiss!1248)))))

(assert (=> d!51755 (= (simpleValid!129 thiss!1248) e!112161)))

(declare-fun b!170049 () Bool)

(declare-fun res!80850 () Bool)

(assert (=> b!170049 (=> (not res!80850) (not e!112161))))

(assert (=> b!170049 (= res!80850 (and (= (size!3611 (_values!3507 thiss!1248)) (bvadd (mask!8321 thiss!1248) #b00000000000000000000000000000001)) (= (size!3610 (_keys!5351 thiss!1248)) (size!3611 (_values!3507 thiss!1248))) (bvsge (_size!1131 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1131 thiss!1248) (bvadd (mask!8321 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!51755 res!80848) b!170049))

(assert (= (and b!170049 res!80850) b!170050))

(assert (= (and b!170050 res!80847) b!170051))

(assert (= (and b!170051 res!80849) b!170052))

(declare-fun m!198935 () Bool)

(assert (=> b!170051 m!198935))

(assert (=> b!170050 m!198935))

(assert (=> d!51755 m!198879))

(assert (=> d!51745 d!51755))

(declare-fun bm!17347 () Bool)

(declare-fun call!17350 () (_ BitVec 32))

(assert (=> bm!17347 (= call!17350 (arrayCountValidKeys!0 (_keys!5351 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3610 (_keys!5351 thiss!1248))))))

(declare-fun d!51757 () Bool)

(declare-fun lt!85044 () (_ BitVec 32))

(assert (=> d!51757 (and (bvsge lt!85044 #b00000000000000000000000000000000) (bvsle lt!85044 (bvsub (size!3610 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!112166 () (_ BitVec 32))

(assert (=> d!51757 (= lt!85044 e!112166)))

(declare-fun c!30476 () Bool)

(assert (=> d!51757 (= c!30476 (bvsge #b00000000000000000000000000000000 (size!3610 (_keys!5351 thiss!1248))))))

(assert (=> d!51757 (and (bvsle #b00000000000000000000000000000000 (size!3610 (_keys!5351 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3610 (_keys!5351 thiss!1248)) (size!3610 (_keys!5351 thiss!1248))))))

(assert (=> d!51757 (= (arrayCountValidKeys!0 (_keys!5351 thiss!1248) #b00000000000000000000000000000000 (size!3610 (_keys!5351 thiss!1248))) lt!85044)))

(declare-fun b!170061 () Bool)

(declare-fun e!112167 () (_ BitVec 32))

(assert (=> b!170061 (= e!112167 (bvadd #b00000000000000000000000000000001 call!17350))))

(declare-fun b!170062 () Bool)

(assert (=> b!170062 (= e!112166 #b00000000000000000000000000000000)))

(declare-fun b!170063 () Bool)

(assert (=> b!170063 (= e!112166 e!112167)))

(declare-fun c!30475 () Bool)

(assert (=> b!170063 (= c!30475 (validKeyInArray!0 (select (arr!3320 (_keys!5351 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170064 () Bool)

(assert (=> b!170064 (= e!112167 call!17350)))

(assert (= (and d!51757 c!30476) b!170062))

(assert (= (and d!51757 (not c!30476)) b!170063))

(assert (= (and b!170063 c!30475) b!170061))

(assert (= (and b!170063 (not c!30475)) b!170064))

(assert (= (or b!170061 b!170064) bm!17347))

(declare-fun m!198937 () Bool)

(assert (=> bm!17347 m!198937))

(assert (=> b!170063 m!198919))

(assert (=> b!170063 m!198919))

(assert (=> b!170063 m!198921))

(assert (=> b!170003 d!51757))

(declare-fun mapIsEmpty!6696 () Bool)

(declare-fun mapRes!6696 () Bool)

(assert (=> mapIsEmpty!6696 mapRes!6696))

(declare-fun mapNonEmpty!6696 () Bool)

(declare-fun tp!15138 () Bool)

(declare-fun e!112168 () Bool)

(assert (=> mapNonEmpty!6696 (= mapRes!6696 (and tp!15138 e!112168))))

(declare-fun mapValue!6696 () ValueCell!1628)

(declare-fun mapRest!6696 () (Array (_ BitVec 32) ValueCell!1628))

(declare-fun mapKey!6696 () (_ BitVec 32))

(assert (=> mapNonEmpty!6696 (= mapRest!6695 (store mapRest!6696 mapKey!6696 mapValue!6696))))

(declare-fun b!170065 () Bool)

(assert (=> b!170065 (= e!112168 tp_is_empty!3943)))

(declare-fun condMapEmpty!6696 () Bool)

(declare-fun mapDefault!6696 () ValueCell!1628)

(assert (=> mapNonEmpty!6695 (= condMapEmpty!6696 (= mapRest!6695 ((as const (Array (_ BitVec 32) ValueCell!1628)) mapDefault!6696)))))

(declare-fun e!112169 () Bool)

(assert (=> mapNonEmpty!6695 (= tp!15137 (and e!112169 mapRes!6696))))

(declare-fun b!170066 () Bool)

(assert (=> b!170066 (= e!112169 tp_is_empty!3943)))

(assert (= (and mapNonEmpty!6695 condMapEmpty!6696) mapIsEmpty!6696))

(assert (= (and mapNonEmpty!6695 (not condMapEmpty!6696)) mapNonEmpty!6696))

(assert (= (and mapNonEmpty!6696 ((_ is ValueCellFull!1628) mapValue!6696)) b!170065))

(assert (= (and mapNonEmpty!6695 ((_ is ValueCellFull!1628) mapDefault!6696)) b!170066))

(declare-fun m!198939 () Bool)

(assert (=> mapNonEmpty!6696 m!198939))

(check-sat b_and!10599 (not b!170028) (not mapNonEmpty!6696) (not b_next!4171) (not d!51755) (not bm!17341) (not b!170063) (not bm!17347) (not b!170037) (not b!170024) tp_is_empty!3943 (not b!170025) (not b!170040) (not b!170051) (not b!170050) (not bm!17344))
(check-sat b_and!10599 (not b_next!4171))
