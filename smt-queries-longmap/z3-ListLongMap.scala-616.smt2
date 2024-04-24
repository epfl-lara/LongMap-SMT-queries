; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16034 () Bool)

(assert start!16034)

(declare-fun b!159123 () Bool)

(declare-fun b_free!3505 () Bool)

(declare-fun b_next!3505 () Bool)

(assert (=> b!159123 (= b_free!3505 (not b_next!3505))))

(declare-fun tp!13081 () Bool)

(declare-fun b_and!9933 () Bool)

(assert (=> b!159123 (= tp!13081 b_and!9933)))

(declare-fun b!159117 () Bool)

(declare-fun e!104180 () Bool)

(declare-datatypes ((V!4057 0))(
  ( (V!4058 (val!1698 Int)) )
))
(declare-datatypes ((ValueCell!1310 0))(
  ( (ValueCellFull!1310 (v!3564 V!4057)) (EmptyCell!1310) )
))
(declare-datatypes ((array!5677 0))(
  ( (array!5678 (arr!2684 (Array (_ BitVec 32) (_ BitVec 64))) (size!2968 (_ BitVec 32))) )
))
(declare-datatypes ((array!5679 0))(
  ( (array!5680 (arr!2685 (Array (_ BitVec 32) ValueCell!1310)) (size!2969 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1528 0))(
  ( (LongMapFixedSize!1529 (defaultEntry!3206 Int) (mask!7747 (_ BitVec 32)) (extraKeys!2947 (_ BitVec 32)) (zeroValue!3049 V!4057) (minValue!3049 V!4057) (_size!813 (_ BitVec 32)) (_keys!5005 array!5677) (_values!3189 array!5679) (_vacant!813 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1528)

(assert (=> b!159117 (= e!104180 (bvsgt #b00000000000000000000000000000000 (size!2968 (_keys!5005 thiss!1248))))))

(declare-fun b!159118 () Bool)

(declare-fun res!75132 () Bool)

(assert (=> b!159118 (=> (not res!75132) (not e!104180))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!300 0))(
  ( (MissingZero!300 (index!3368 (_ BitVec 32))) (Found!300 (index!3369 (_ BitVec 32))) (Intermediate!300 (undefined!1112 Bool) (index!3370 (_ BitVec 32)) (x!17564 (_ BitVec 32))) (Undefined!300) (MissingVacant!300 (index!3371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5677 (_ BitVec 32)) SeekEntryResult!300)

(assert (=> b!159118 (= res!75132 ((_ is Undefined!300) (seekEntryOrOpen!0 key!828 (_keys!5005 thiss!1248) (mask!7747 thiss!1248))))))

(declare-fun res!75136 () Bool)

(assert (=> start!16034 (=> (not res!75136) (not e!104180))))

(declare-fun valid!736 (LongMapFixedSize!1528) Bool)

(assert (=> start!16034 (= res!75136 (valid!736 thiss!1248))))

(assert (=> start!16034 e!104180))

(declare-fun e!104179 () Bool)

(assert (=> start!16034 e!104179))

(assert (=> start!16034 true))

(declare-fun b!159119 () Bool)

(declare-fun res!75134 () Bool)

(assert (=> b!159119 (=> (not res!75134) (not e!104180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159119 (= res!75134 (validMask!0 (mask!7747 thiss!1248)))))

(declare-fun b!159120 () Bool)

(declare-fun e!104178 () Bool)

(declare-fun e!104177 () Bool)

(declare-fun mapRes!5645 () Bool)

(assert (=> b!159120 (= e!104178 (and e!104177 mapRes!5645))))

(declare-fun condMapEmpty!5645 () Bool)

(declare-fun mapDefault!5645 () ValueCell!1310)

(assert (=> b!159120 (= condMapEmpty!5645 (= (arr!2685 (_values!3189 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1310)) mapDefault!5645)))))

(declare-fun b!159121 () Bool)

(declare-fun res!75137 () Bool)

(assert (=> b!159121 (=> (not res!75137) (not e!104180))))

(assert (=> b!159121 (= res!75137 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159122 () Bool)

(declare-fun e!104181 () Bool)

(declare-fun tp_is_empty!3307 () Bool)

(assert (=> b!159122 (= e!104181 tp_is_empty!3307)))

(declare-fun array_inv!1711 (array!5677) Bool)

(declare-fun array_inv!1712 (array!5679) Bool)

(assert (=> b!159123 (= e!104179 (and tp!13081 tp_is_empty!3307 (array_inv!1711 (_keys!5005 thiss!1248)) (array_inv!1712 (_values!3189 thiss!1248)) e!104178))))

(declare-fun b!159124 () Bool)

(declare-fun res!75135 () Bool)

(assert (=> b!159124 (=> (not res!75135) (not e!104180))))

(assert (=> b!159124 (= res!75135 (and (= (size!2969 (_values!3189 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7747 thiss!1248))) (= (size!2968 (_keys!5005 thiss!1248)) (size!2969 (_values!3189 thiss!1248))) (bvsge (mask!7747 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2947 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2947 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159125 () Bool)

(declare-fun res!75133 () Bool)

(assert (=> b!159125 (=> (not res!75133) (not e!104180))))

(declare-datatypes ((List!1879 0))(
  ( (Nil!1876) (Cons!1875 (h!2488 (_ BitVec 64)) (t!6673 List!1879)) )
))
(declare-fun arrayNoDuplicates!0 (array!5677 (_ BitVec 32) List!1879) Bool)

(assert (=> b!159125 (= res!75133 (arrayNoDuplicates!0 (_keys!5005 thiss!1248) #b00000000000000000000000000000000 Nil!1876))))

(declare-fun b!159126 () Bool)

(declare-fun res!75131 () Bool)

(assert (=> b!159126 (=> (not res!75131) (not e!104180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5677 (_ BitVec 32)) Bool)

(assert (=> b!159126 (= res!75131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5005 thiss!1248) (mask!7747 thiss!1248)))))

(declare-fun mapNonEmpty!5645 () Bool)

(declare-fun tp!13082 () Bool)

(assert (=> mapNonEmpty!5645 (= mapRes!5645 (and tp!13082 e!104181))))

(declare-fun mapRest!5645 () (Array (_ BitVec 32) ValueCell!1310))

(declare-fun mapKey!5645 () (_ BitVec 32))

(declare-fun mapValue!5645 () ValueCell!1310)

(assert (=> mapNonEmpty!5645 (= (arr!2685 (_values!3189 thiss!1248)) (store mapRest!5645 mapKey!5645 mapValue!5645))))

(declare-fun b!159127 () Bool)

(assert (=> b!159127 (= e!104177 tp_is_empty!3307)))

(declare-fun mapIsEmpty!5645 () Bool)

(assert (=> mapIsEmpty!5645 mapRes!5645))

(assert (= (and start!16034 res!75136) b!159121))

(assert (= (and b!159121 res!75137) b!159118))

(assert (= (and b!159118 res!75132) b!159119))

(assert (= (and b!159119 res!75134) b!159124))

(assert (= (and b!159124 res!75135) b!159126))

(assert (= (and b!159126 res!75131) b!159125))

(assert (= (and b!159125 res!75133) b!159117))

(assert (= (and b!159120 condMapEmpty!5645) mapIsEmpty!5645))

(assert (= (and b!159120 (not condMapEmpty!5645)) mapNonEmpty!5645))

(assert (= (and mapNonEmpty!5645 ((_ is ValueCellFull!1310) mapValue!5645)) b!159122))

(assert (= (and b!159120 ((_ is ValueCellFull!1310) mapDefault!5645)) b!159127))

(assert (= b!159123 b!159120))

(assert (= start!16034 b!159123))

(declare-fun m!191675 () Bool)

(assert (=> b!159126 m!191675))

(declare-fun m!191677 () Bool)

(assert (=> mapNonEmpty!5645 m!191677))

(declare-fun m!191679 () Bool)

(assert (=> start!16034 m!191679))

(declare-fun m!191681 () Bool)

(assert (=> b!159119 m!191681))

(declare-fun m!191683 () Bool)

(assert (=> b!159123 m!191683))

(declare-fun m!191685 () Bool)

(assert (=> b!159123 m!191685))

(declare-fun m!191687 () Bool)

(assert (=> b!159125 m!191687))

(declare-fun m!191689 () Bool)

(assert (=> b!159118 m!191689))

(check-sat (not b!159125) (not start!16034) (not mapNonEmpty!5645) (not b!159118) tp_is_empty!3307 (not b_next!3505) b_and!9933 (not b!159123) (not b!159119) (not b!159126))
(check-sat b_and!9933 (not b_next!3505))
(get-model)

(declare-fun d!51329 () Bool)

(assert (=> d!51329 (= (validMask!0 (mask!7747 thiss!1248)) (and (or (= (mask!7747 thiss!1248) #b00000000000000000000000000000111) (= (mask!7747 thiss!1248) #b00000000000000000000000000001111) (= (mask!7747 thiss!1248) #b00000000000000000000000000011111) (= (mask!7747 thiss!1248) #b00000000000000000000000000111111) (= (mask!7747 thiss!1248) #b00000000000000000000000001111111) (= (mask!7747 thiss!1248) #b00000000000000000000000011111111) (= (mask!7747 thiss!1248) #b00000000000000000000000111111111) (= (mask!7747 thiss!1248) #b00000000000000000000001111111111) (= (mask!7747 thiss!1248) #b00000000000000000000011111111111) (= (mask!7747 thiss!1248) #b00000000000000000000111111111111) (= (mask!7747 thiss!1248) #b00000000000000000001111111111111) (= (mask!7747 thiss!1248) #b00000000000000000011111111111111) (= (mask!7747 thiss!1248) #b00000000000000000111111111111111) (= (mask!7747 thiss!1248) #b00000000000000001111111111111111) (= (mask!7747 thiss!1248) #b00000000000000011111111111111111) (= (mask!7747 thiss!1248) #b00000000000000111111111111111111) (= (mask!7747 thiss!1248) #b00000000000001111111111111111111) (= (mask!7747 thiss!1248) #b00000000000011111111111111111111) (= (mask!7747 thiss!1248) #b00000000000111111111111111111111) (= (mask!7747 thiss!1248) #b00000000001111111111111111111111) (= (mask!7747 thiss!1248) #b00000000011111111111111111111111) (= (mask!7747 thiss!1248) #b00000000111111111111111111111111) (= (mask!7747 thiss!1248) #b00000001111111111111111111111111) (= (mask!7747 thiss!1248) #b00000011111111111111111111111111) (= (mask!7747 thiss!1248) #b00000111111111111111111111111111) (= (mask!7747 thiss!1248) #b00001111111111111111111111111111) (= (mask!7747 thiss!1248) #b00011111111111111111111111111111) (= (mask!7747 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7747 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!159119 d!51329))

(declare-fun b!159204 () Bool)

(declare-fun e!104228 () Bool)

(declare-fun e!104227 () Bool)

(assert (=> b!159204 (= e!104228 e!104227)))

(declare-fun res!75187 () Bool)

(assert (=> b!159204 (=> (not res!75187) (not e!104227))))

(declare-fun e!104229 () Bool)

(assert (=> b!159204 (= res!75187 (not e!104229))))

(declare-fun res!75186 () Bool)

(assert (=> b!159204 (=> (not res!75186) (not e!104229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!159204 (= res!75186 (validKeyInArray!0 (select (arr!2684 (_keys!5005 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51331 () Bool)

(declare-fun res!75188 () Bool)

(assert (=> d!51331 (=> res!75188 e!104228)))

(assert (=> d!51331 (= res!75188 (bvsge #b00000000000000000000000000000000 (size!2968 (_keys!5005 thiss!1248))))))

(assert (=> d!51331 (= (arrayNoDuplicates!0 (_keys!5005 thiss!1248) #b00000000000000000000000000000000 Nil!1876) e!104228)))

(declare-fun b!159205 () Bool)

(declare-fun contains!967 (List!1879 (_ BitVec 64)) Bool)

(assert (=> b!159205 (= e!104229 (contains!967 Nil!1876 (select (arr!2684 (_keys!5005 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17266 () Bool)

(declare-fun call!17269 () Bool)

(declare-fun c!29933 () Bool)

(assert (=> bm!17266 (= call!17269 (arrayNoDuplicates!0 (_keys!5005 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29933 (Cons!1875 (select (arr!2684 (_keys!5005 thiss!1248)) #b00000000000000000000000000000000) Nil!1876) Nil!1876)))))

(declare-fun b!159206 () Bool)

(declare-fun e!104226 () Bool)

(assert (=> b!159206 (= e!104226 call!17269)))

(declare-fun b!159207 () Bool)

(assert (=> b!159207 (= e!104226 call!17269)))

(declare-fun b!159208 () Bool)

(assert (=> b!159208 (= e!104227 e!104226)))

(assert (=> b!159208 (= c!29933 (validKeyInArray!0 (select (arr!2684 (_keys!5005 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51331 (not res!75188)) b!159204))

(assert (= (and b!159204 res!75186) b!159205))

(assert (= (and b!159204 res!75187) b!159208))

(assert (= (and b!159208 c!29933) b!159207))

(assert (= (and b!159208 (not c!29933)) b!159206))

(assert (= (or b!159207 b!159206) bm!17266))

(declare-fun m!191723 () Bool)

(assert (=> b!159204 m!191723))

(assert (=> b!159204 m!191723))

(declare-fun m!191725 () Bool)

(assert (=> b!159204 m!191725))

(assert (=> b!159205 m!191723))

(assert (=> b!159205 m!191723))

(declare-fun m!191727 () Bool)

(assert (=> b!159205 m!191727))

(assert (=> bm!17266 m!191723))

(declare-fun m!191729 () Bool)

(assert (=> bm!17266 m!191729))

(assert (=> b!159208 m!191723))

(assert (=> b!159208 m!191723))

(assert (=> b!159208 m!191725))

(assert (=> b!159125 d!51331))

(declare-fun d!51333 () Bool)

(declare-fun res!75193 () Bool)

(declare-fun e!104237 () Bool)

(assert (=> d!51333 (=> res!75193 e!104237)))

(assert (=> d!51333 (= res!75193 (bvsge #b00000000000000000000000000000000 (size!2968 (_keys!5005 thiss!1248))))))

(assert (=> d!51333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5005 thiss!1248) (mask!7747 thiss!1248)) e!104237)))

(declare-fun bm!17269 () Bool)

(declare-fun call!17272 () Bool)

(assert (=> bm!17269 (= call!17272 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5005 thiss!1248) (mask!7747 thiss!1248)))))

(declare-fun b!159217 () Bool)

(declare-fun e!104236 () Bool)

(assert (=> b!159217 (= e!104236 call!17272)))

(declare-fun b!159218 () Bool)

(declare-fun e!104238 () Bool)

(assert (=> b!159218 (= e!104238 e!104236)))

(declare-fun lt!82024 () (_ BitVec 64))

(assert (=> b!159218 (= lt!82024 (select (arr!2684 (_keys!5005 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4999 0))(
  ( (Unit!5000) )
))
(declare-fun lt!82026 () Unit!4999)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5677 (_ BitVec 64) (_ BitVec 32)) Unit!4999)

(assert (=> b!159218 (= lt!82026 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5005 thiss!1248) lt!82024 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!159218 (arrayContainsKey!0 (_keys!5005 thiss!1248) lt!82024 #b00000000000000000000000000000000)))

(declare-fun lt!82025 () Unit!4999)

(assert (=> b!159218 (= lt!82025 lt!82026)))

(declare-fun res!75194 () Bool)

(assert (=> b!159218 (= res!75194 (= (seekEntryOrOpen!0 (select (arr!2684 (_keys!5005 thiss!1248)) #b00000000000000000000000000000000) (_keys!5005 thiss!1248) (mask!7747 thiss!1248)) (Found!300 #b00000000000000000000000000000000)))))

(assert (=> b!159218 (=> (not res!75194) (not e!104236))))

(declare-fun b!159219 () Bool)

(assert (=> b!159219 (= e!104238 call!17272)))

(declare-fun b!159220 () Bool)

(assert (=> b!159220 (= e!104237 e!104238)))

(declare-fun c!29936 () Bool)

(assert (=> b!159220 (= c!29936 (validKeyInArray!0 (select (arr!2684 (_keys!5005 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51333 (not res!75193)) b!159220))

(assert (= (and b!159220 c!29936) b!159218))

(assert (= (and b!159220 (not c!29936)) b!159219))

(assert (= (and b!159218 res!75194) b!159217))

(assert (= (or b!159217 b!159219) bm!17269))

(declare-fun m!191731 () Bool)

(assert (=> bm!17269 m!191731))

(assert (=> b!159218 m!191723))

(declare-fun m!191733 () Bool)

(assert (=> b!159218 m!191733))

(declare-fun m!191735 () Bool)

(assert (=> b!159218 m!191735))

(assert (=> b!159218 m!191723))

(declare-fun m!191737 () Bool)

(assert (=> b!159218 m!191737))

(assert (=> b!159220 m!191723))

(assert (=> b!159220 m!191723))

(assert (=> b!159220 m!191725))

(assert (=> b!159126 d!51333))

(declare-fun d!51335 () Bool)

(declare-fun res!75201 () Bool)

(declare-fun e!104241 () Bool)

(assert (=> d!51335 (=> (not res!75201) (not e!104241))))

(declare-fun simpleValid!117 (LongMapFixedSize!1528) Bool)

(assert (=> d!51335 (= res!75201 (simpleValid!117 thiss!1248))))

(assert (=> d!51335 (= (valid!736 thiss!1248) e!104241)))

(declare-fun b!159227 () Bool)

(declare-fun res!75202 () Bool)

(assert (=> b!159227 (=> (not res!75202) (not e!104241))))

(declare-fun arrayCountValidKeys!0 (array!5677 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!159227 (= res!75202 (= (arrayCountValidKeys!0 (_keys!5005 thiss!1248) #b00000000000000000000000000000000 (size!2968 (_keys!5005 thiss!1248))) (_size!813 thiss!1248)))))

(declare-fun b!159228 () Bool)

(declare-fun res!75203 () Bool)

(assert (=> b!159228 (=> (not res!75203) (not e!104241))))

(assert (=> b!159228 (= res!75203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5005 thiss!1248) (mask!7747 thiss!1248)))))

(declare-fun b!159229 () Bool)

(assert (=> b!159229 (= e!104241 (arrayNoDuplicates!0 (_keys!5005 thiss!1248) #b00000000000000000000000000000000 Nil!1876))))

(assert (= (and d!51335 res!75201) b!159227))

(assert (= (and b!159227 res!75202) b!159228))

(assert (= (and b!159228 res!75203) b!159229))

(declare-fun m!191739 () Bool)

(assert (=> d!51335 m!191739))

(declare-fun m!191741 () Bool)

(assert (=> b!159227 m!191741))

(assert (=> b!159228 m!191675))

(assert (=> b!159229 m!191687))

(assert (=> start!16034 d!51335))

(declare-fun d!51337 () Bool)

(assert (=> d!51337 (= (array_inv!1711 (_keys!5005 thiss!1248)) (bvsge (size!2968 (_keys!5005 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!159123 d!51337))

(declare-fun d!51339 () Bool)

(assert (=> d!51339 (= (array_inv!1712 (_values!3189 thiss!1248)) (bvsge (size!2969 (_values!3189 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!159123 d!51339))

(declare-fun b!159242 () Bool)

(declare-fun e!104248 () SeekEntryResult!300)

(declare-fun lt!82033 () SeekEntryResult!300)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5677 (_ BitVec 32)) SeekEntryResult!300)

(assert (=> b!159242 (= e!104248 (seekKeyOrZeroReturnVacant!0 (x!17564 lt!82033) (index!3370 lt!82033) (index!3370 lt!82033) key!828 (_keys!5005 thiss!1248) (mask!7747 thiss!1248)))))

(declare-fun b!159243 () Bool)

(declare-fun e!104249 () SeekEntryResult!300)

(assert (=> b!159243 (= e!104249 Undefined!300)))

(declare-fun b!159244 () Bool)

(declare-fun e!104250 () SeekEntryResult!300)

(assert (=> b!159244 (= e!104250 (Found!300 (index!3370 lt!82033)))))

(declare-fun d!51341 () Bool)

(declare-fun lt!82035 () SeekEntryResult!300)

(assert (=> d!51341 (and (or ((_ is Undefined!300) lt!82035) (not ((_ is Found!300) lt!82035)) (and (bvsge (index!3369 lt!82035) #b00000000000000000000000000000000) (bvslt (index!3369 lt!82035) (size!2968 (_keys!5005 thiss!1248))))) (or ((_ is Undefined!300) lt!82035) ((_ is Found!300) lt!82035) (not ((_ is MissingZero!300) lt!82035)) (and (bvsge (index!3368 lt!82035) #b00000000000000000000000000000000) (bvslt (index!3368 lt!82035) (size!2968 (_keys!5005 thiss!1248))))) (or ((_ is Undefined!300) lt!82035) ((_ is Found!300) lt!82035) ((_ is MissingZero!300) lt!82035) (not ((_ is MissingVacant!300) lt!82035)) (and (bvsge (index!3371 lt!82035) #b00000000000000000000000000000000) (bvslt (index!3371 lt!82035) (size!2968 (_keys!5005 thiss!1248))))) (or ((_ is Undefined!300) lt!82035) (ite ((_ is Found!300) lt!82035) (= (select (arr!2684 (_keys!5005 thiss!1248)) (index!3369 lt!82035)) key!828) (ite ((_ is MissingZero!300) lt!82035) (= (select (arr!2684 (_keys!5005 thiss!1248)) (index!3368 lt!82035)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!300) lt!82035) (= (select (arr!2684 (_keys!5005 thiss!1248)) (index!3371 lt!82035)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51341 (= lt!82035 e!104249)))

(declare-fun c!29944 () Bool)

(assert (=> d!51341 (= c!29944 (and ((_ is Intermediate!300) lt!82033) (undefined!1112 lt!82033)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5677 (_ BitVec 32)) SeekEntryResult!300)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51341 (= lt!82033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7747 thiss!1248)) key!828 (_keys!5005 thiss!1248) (mask!7747 thiss!1248)))))

(assert (=> d!51341 (validMask!0 (mask!7747 thiss!1248))))

(assert (=> d!51341 (= (seekEntryOrOpen!0 key!828 (_keys!5005 thiss!1248) (mask!7747 thiss!1248)) lt!82035)))

(declare-fun b!159245 () Bool)

(assert (=> b!159245 (= e!104248 (MissingZero!300 (index!3370 lt!82033)))))

(declare-fun b!159246 () Bool)

(assert (=> b!159246 (= e!104249 e!104250)))

(declare-fun lt!82034 () (_ BitVec 64))

(assert (=> b!159246 (= lt!82034 (select (arr!2684 (_keys!5005 thiss!1248)) (index!3370 lt!82033)))))

(declare-fun c!29945 () Bool)

(assert (=> b!159246 (= c!29945 (= lt!82034 key!828))))

(declare-fun b!159247 () Bool)

(declare-fun c!29943 () Bool)

(assert (=> b!159247 (= c!29943 (= lt!82034 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!159247 (= e!104250 e!104248)))

(assert (= (and d!51341 c!29944) b!159243))

(assert (= (and d!51341 (not c!29944)) b!159246))

(assert (= (and b!159246 c!29945) b!159244))

(assert (= (and b!159246 (not c!29945)) b!159247))

(assert (= (and b!159247 c!29943) b!159245))

(assert (= (and b!159247 (not c!29943)) b!159242))

(declare-fun m!191743 () Bool)

(assert (=> b!159242 m!191743))

(declare-fun m!191745 () Bool)

(assert (=> d!51341 m!191745))

(declare-fun m!191747 () Bool)

(assert (=> d!51341 m!191747))

(declare-fun m!191749 () Bool)

(assert (=> d!51341 m!191749))

(assert (=> d!51341 m!191745))

(declare-fun m!191751 () Bool)

(assert (=> d!51341 m!191751))

(declare-fun m!191753 () Bool)

(assert (=> d!51341 m!191753))

(assert (=> d!51341 m!191681))

(declare-fun m!191755 () Bool)

(assert (=> b!159246 m!191755))

(assert (=> b!159118 d!51341))

(declare-fun b!159255 () Bool)

(declare-fun e!104256 () Bool)

(assert (=> b!159255 (= e!104256 tp_is_empty!3307)))

(declare-fun mapNonEmpty!5654 () Bool)

(declare-fun mapRes!5654 () Bool)

(declare-fun tp!13097 () Bool)

(declare-fun e!104255 () Bool)

(assert (=> mapNonEmpty!5654 (= mapRes!5654 (and tp!13097 e!104255))))

(declare-fun mapKey!5654 () (_ BitVec 32))

(declare-fun mapValue!5654 () ValueCell!1310)

(declare-fun mapRest!5654 () (Array (_ BitVec 32) ValueCell!1310))

(assert (=> mapNonEmpty!5654 (= mapRest!5645 (store mapRest!5654 mapKey!5654 mapValue!5654))))

(declare-fun condMapEmpty!5654 () Bool)

(declare-fun mapDefault!5654 () ValueCell!1310)

(assert (=> mapNonEmpty!5645 (= condMapEmpty!5654 (= mapRest!5645 ((as const (Array (_ BitVec 32) ValueCell!1310)) mapDefault!5654)))))

(assert (=> mapNonEmpty!5645 (= tp!13082 (and e!104256 mapRes!5654))))

(declare-fun mapIsEmpty!5654 () Bool)

(assert (=> mapIsEmpty!5654 mapRes!5654))

(declare-fun b!159254 () Bool)

(assert (=> b!159254 (= e!104255 tp_is_empty!3307)))

(assert (= (and mapNonEmpty!5645 condMapEmpty!5654) mapIsEmpty!5654))

(assert (= (and mapNonEmpty!5645 (not condMapEmpty!5654)) mapNonEmpty!5654))

(assert (= (and mapNonEmpty!5654 ((_ is ValueCellFull!1310) mapValue!5654)) b!159254))

(assert (= (and mapNonEmpty!5645 ((_ is ValueCellFull!1310) mapDefault!5654)) b!159255))

(declare-fun m!191757 () Bool)

(assert (=> mapNonEmpty!5654 m!191757))

(check-sat (not bm!17269) (not b!159205) b_and!9933 (not b!159229) (not b!159228) (not b!159220) (not mapNonEmpty!5654) (not b!159204) (not d!51341) tp_is_empty!3307 (not b_next!3505) (not b!159227) (not b!159218) (not bm!17266) (not b!159242) (not b!159208) (not d!51335))
(check-sat b_and!9933 (not b_next!3505))
