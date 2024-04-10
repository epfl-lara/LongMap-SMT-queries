; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16356 () Bool)

(assert start!16356)

(declare-fun b!163078 () Bool)

(declare-fun b_free!3783 () Bool)

(declare-fun b_next!3783 () Bool)

(assert (=> b!163078 (= b_free!3783 (not b_next!3783))))

(declare-fun tp!13925 () Bool)

(declare-fun b_and!10197 () Bool)

(assert (=> b!163078 (= tp!13925 b_and!10197)))

(declare-fun b!163071 () Bool)

(declare-fun e!106979 () Bool)

(declare-fun tp_is_empty!3585 () Bool)

(assert (=> b!163071 (= e!106979 tp_is_empty!3585)))

(declare-fun mapNonEmpty!6072 () Bool)

(declare-fun mapRes!6072 () Bool)

(declare-fun tp!13926 () Bool)

(assert (=> mapNonEmpty!6072 (= mapRes!6072 (and tp!13926 e!106979))))

(declare-datatypes ((V!4427 0))(
  ( (V!4428 (val!1837 Int)) )
))
(declare-datatypes ((ValueCell!1449 0))(
  ( (ValueCellFull!1449 (v!3702 V!4427)) (EmptyCell!1449) )
))
(declare-fun mapRest!6072 () (Array (_ BitVec 32) ValueCell!1449))

(declare-fun mapValue!6072 () ValueCell!1449)

(declare-fun mapKey!6072 () (_ BitVec 32))

(declare-datatypes ((array!6253 0))(
  ( (array!6254 (arr!2969 (Array (_ BitVec 32) (_ BitVec 64))) (size!3254 (_ BitVec 32))) )
))
(declare-datatypes ((array!6255 0))(
  ( (array!6256 (arr!2970 (Array (_ BitVec 32) ValueCell!1449)) (size!3255 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1806 0))(
  ( (LongMapFixedSize!1807 (defaultEntry!3345 Int) (mask!7989 (_ BitVec 32)) (extraKeys!3086 (_ BitVec 32)) (zeroValue!3188 V!4427) (minValue!3188 V!4427) (_size!952 (_ BitVec 32)) (_keys!5151 array!6253) (_values!3328 array!6255) (_vacant!952 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1806)

(assert (=> mapNonEmpty!6072 (= (arr!2970 (_values!3328 thiss!1248)) (store mapRest!6072 mapKey!6072 mapValue!6072))))

(declare-fun b!163073 () Bool)

(declare-fun e!106982 () Bool)

(assert (=> b!163073 (= e!106982 (and (= (size!3255 (_values!3328 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7989 thiss!1248))) (not (= (size!3254 (_keys!5151 thiss!1248)) (size!3255 (_values!3328 thiss!1248))))))))

(declare-fun mapIsEmpty!6072 () Bool)

(assert (=> mapIsEmpty!6072 mapRes!6072))

(declare-fun b!163074 () Bool)

(declare-fun e!106983 () Bool)

(assert (=> b!163074 (= e!106983 tp_is_empty!3585)))

(declare-fun b!163075 () Bool)

(declare-fun e!106984 () Bool)

(assert (=> b!163075 (= e!106984 (and e!106983 mapRes!6072))))

(declare-fun condMapEmpty!6072 () Bool)

(declare-fun mapDefault!6072 () ValueCell!1449)

(assert (=> b!163075 (= condMapEmpty!6072 (= (arr!2970 (_values!3328 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1449)) mapDefault!6072)))))

(declare-fun b!163076 () Bool)

(declare-fun res!77205 () Bool)

(assert (=> b!163076 (=> (not res!77205) (not e!106982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163076 (= res!77205 (validMask!0 (mask!7989 thiss!1248)))))

(declare-fun b!163077 () Bool)

(declare-fun res!77203 () Bool)

(declare-fun e!106980 () Bool)

(assert (=> b!163077 (=> (not res!77203) (not e!106980))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163077 (= res!77203 (not (= key!828 (bvneg key!828))))))

(declare-fun e!106981 () Bool)

(declare-fun array_inv!1897 (array!6253) Bool)

(declare-fun array_inv!1898 (array!6255) Bool)

(assert (=> b!163078 (= e!106981 (and tp!13925 tp_is_empty!3585 (array_inv!1897 (_keys!5151 thiss!1248)) (array_inv!1898 (_values!3328 thiss!1248)) e!106984))))

(declare-fun res!77202 () Bool)

(assert (=> start!16356 (=> (not res!77202) (not e!106980))))

(declare-fun valid!811 (LongMapFixedSize!1806) Bool)

(assert (=> start!16356 (= res!77202 (valid!811 thiss!1248))))

(assert (=> start!16356 e!106980))

(assert (=> start!16356 e!106981))

(assert (=> start!16356 true))

(declare-fun b!163072 () Bool)

(assert (=> b!163072 (= e!106980 e!106982)))

(declare-fun res!77204 () Bool)

(assert (=> b!163072 (=> (not res!77204) (not e!106982))))

(declare-datatypes ((SeekEntryResult!395 0))(
  ( (MissingZero!395 (index!3748 (_ BitVec 32))) (Found!395 (index!3749 (_ BitVec 32))) (Intermediate!395 (undefined!1207 Bool) (index!3750 (_ BitVec 32)) (x!18060 (_ BitVec 32))) (Undefined!395) (MissingVacant!395 (index!3751 (_ BitVec 32))) )
))
(declare-fun lt!82606 () SeekEntryResult!395)

(get-info :version)

(assert (=> b!163072 (= res!77204 (and (not ((_ is Undefined!395) lt!82606)) (not ((_ is MissingVacant!395) lt!82606)) (not ((_ is MissingZero!395) lt!82606)) ((_ is Found!395) lt!82606)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6253 (_ BitVec 32)) SeekEntryResult!395)

(assert (=> b!163072 (= lt!82606 (seekEntryOrOpen!0 key!828 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)))))

(assert (= (and start!16356 res!77202) b!163077))

(assert (= (and b!163077 res!77203) b!163072))

(assert (= (and b!163072 res!77204) b!163076))

(assert (= (and b!163076 res!77205) b!163073))

(assert (= (and b!163075 condMapEmpty!6072) mapIsEmpty!6072))

(assert (= (and b!163075 (not condMapEmpty!6072)) mapNonEmpty!6072))

(assert (= (and mapNonEmpty!6072 ((_ is ValueCellFull!1449) mapValue!6072)) b!163071))

(assert (= (and b!163075 ((_ is ValueCellFull!1449) mapDefault!6072)) b!163074))

(assert (= b!163078 b!163075))

(assert (= start!16356 b!163078))

(declare-fun m!193925 () Bool)

(assert (=> b!163078 m!193925))

(declare-fun m!193927 () Bool)

(assert (=> b!163078 m!193927))

(declare-fun m!193929 () Bool)

(assert (=> mapNonEmpty!6072 m!193929))

(declare-fun m!193931 () Bool)

(assert (=> start!16356 m!193931))

(declare-fun m!193933 () Bool)

(assert (=> b!163076 m!193933))

(declare-fun m!193935 () Bool)

(assert (=> b!163072 m!193935))

(check-sat (not b_next!3783) (not b!163076) (not b!163078) (not b!163072) (not start!16356) b_and!10197 (not mapNonEmpty!6072) tp_is_empty!3585)
(check-sat b_and!10197 (not b_next!3783))
(get-model)

(declare-fun d!51395 () Bool)

(assert (=> d!51395 (= (array_inv!1897 (_keys!5151 thiss!1248)) (bvsge (size!3254 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163078 d!51395))

(declare-fun d!51397 () Bool)

(assert (=> d!51397 (= (array_inv!1898 (_values!3328 thiss!1248)) (bvsge (size!3255 (_values!3328 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163078 d!51397))

(declare-fun d!51399 () Bool)

(assert (=> d!51399 (= (validMask!0 (mask!7989 thiss!1248)) (and (or (= (mask!7989 thiss!1248) #b00000000000000000000000000000111) (= (mask!7989 thiss!1248) #b00000000000000000000000000001111) (= (mask!7989 thiss!1248) #b00000000000000000000000000011111) (= (mask!7989 thiss!1248) #b00000000000000000000000000111111) (= (mask!7989 thiss!1248) #b00000000000000000000000001111111) (= (mask!7989 thiss!1248) #b00000000000000000000000011111111) (= (mask!7989 thiss!1248) #b00000000000000000000000111111111) (= (mask!7989 thiss!1248) #b00000000000000000000001111111111) (= (mask!7989 thiss!1248) #b00000000000000000000011111111111) (= (mask!7989 thiss!1248) #b00000000000000000000111111111111) (= (mask!7989 thiss!1248) #b00000000000000000001111111111111) (= (mask!7989 thiss!1248) #b00000000000000000011111111111111) (= (mask!7989 thiss!1248) #b00000000000000000111111111111111) (= (mask!7989 thiss!1248) #b00000000000000001111111111111111) (= (mask!7989 thiss!1248) #b00000000000000011111111111111111) (= (mask!7989 thiss!1248) #b00000000000000111111111111111111) (= (mask!7989 thiss!1248) #b00000000000001111111111111111111) (= (mask!7989 thiss!1248) #b00000000000011111111111111111111) (= (mask!7989 thiss!1248) #b00000000000111111111111111111111) (= (mask!7989 thiss!1248) #b00000000001111111111111111111111) (= (mask!7989 thiss!1248) #b00000000011111111111111111111111) (= (mask!7989 thiss!1248) #b00000000111111111111111111111111) (= (mask!7989 thiss!1248) #b00000001111111111111111111111111) (= (mask!7989 thiss!1248) #b00000011111111111111111111111111) (= (mask!7989 thiss!1248) #b00000111111111111111111111111111) (= (mask!7989 thiss!1248) #b00001111111111111111111111111111) (= (mask!7989 thiss!1248) #b00011111111111111111111111111111) (= (mask!7989 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7989 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163076 d!51399))

(declare-fun lt!82618 () SeekEntryResult!395)

(declare-fun b!163115 () Bool)

(declare-fun e!107013 () SeekEntryResult!395)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6253 (_ BitVec 32)) SeekEntryResult!395)

(assert (=> b!163115 (= e!107013 (seekKeyOrZeroReturnVacant!0 (x!18060 lt!82618) (index!3750 lt!82618) (index!3750 lt!82618) key!828 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)))))

(declare-fun b!163116 () Bool)

(declare-fun e!107014 () SeekEntryResult!395)

(declare-fun e!107015 () SeekEntryResult!395)

(assert (=> b!163116 (= e!107014 e!107015)))

(declare-fun lt!82617 () (_ BitVec 64))

(assert (=> b!163116 (= lt!82617 (select (arr!2969 (_keys!5151 thiss!1248)) (index!3750 lt!82618)))))

(declare-fun c!30033 () Bool)

(assert (=> b!163116 (= c!30033 (= lt!82617 key!828))))

(declare-fun d!51401 () Bool)

(declare-fun lt!82616 () SeekEntryResult!395)

(assert (=> d!51401 (and (or ((_ is Undefined!395) lt!82616) (not ((_ is Found!395) lt!82616)) (and (bvsge (index!3749 lt!82616) #b00000000000000000000000000000000) (bvslt (index!3749 lt!82616) (size!3254 (_keys!5151 thiss!1248))))) (or ((_ is Undefined!395) lt!82616) ((_ is Found!395) lt!82616) (not ((_ is MissingZero!395) lt!82616)) (and (bvsge (index!3748 lt!82616) #b00000000000000000000000000000000) (bvslt (index!3748 lt!82616) (size!3254 (_keys!5151 thiss!1248))))) (or ((_ is Undefined!395) lt!82616) ((_ is Found!395) lt!82616) ((_ is MissingZero!395) lt!82616) (not ((_ is MissingVacant!395) lt!82616)) (and (bvsge (index!3751 lt!82616) #b00000000000000000000000000000000) (bvslt (index!3751 lt!82616) (size!3254 (_keys!5151 thiss!1248))))) (or ((_ is Undefined!395) lt!82616) (ite ((_ is Found!395) lt!82616) (= (select (arr!2969 (_keys!5151 thiss!1248)) (index!3749 lt!82616)) key!828) (ite ((_ is MissingZero!395) lt!82616) (= (select (arr!2969 (_keys!5151 thiss!1248)) (index!3748 lt!82616)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!395) lt!82616) (= (select (arr!2969 (_keys!5151 thiss!1248)) (index!3751 lt!82616)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51401 (= lt!82616 e!107014)))

(declare-fun c!30032 () Bool)

(assert (=> d!51401 (= c!30032 (and ((_ is Intermediate!395) lt!82618) (undefined!1207 lt!82618)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6253 (_ BitVec 32)) SeekEntryResult!395)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51401 (= lt!82618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7989 thiss!1248)) key!828 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)))))

(assert (=> d!51401 (validMask!0 (mask!7989 thiss!1248))))

(assert (=> d!51401 (= (seekEntryOrOpen!0 key!828 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)) lt!82616)))

(declare-fun b!163117 () Bool)

(declare-fun c!30034 () Bool)

(assert (=> b!163117 (= c!30034 (= lt!82617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163117 (= e!107015 e!107013)))

(declare-fun b!163118 () Bool)

(assert (=> b!163118 (= e!107015 (Found!395 (index!3750 lt!82618)))))

(declare-fun b!163119 () Bool)

(assert (=> b!163119 (= e!107014 Undefined!395)))

(declare-fun b!163120 () Bool)

(assert (=> b!163120 (= e!107013 (MissingZero!395 (index!3750 lt!82618)))))

(assert (= (and d!51401 c!30032) b!163119))

(assert (= (and d!51401 (not c!30032)) b!163116))

(assert (= (and b!163116 c!30033) b!163118))

(assert (= (and b!163116 (not c!30033)) b!163117))

(assert (= (and b!163117 c!30034) b!163120))

(assert (= (and b!163117 (not c!30034)) b!163115))

(declare-fun m!193949 () Bool)

(assert (=> b!163115 m!193949))

(declare-fun m!193951 () Bool)

(assert (=> b!163116 m!193951))

(assert (=> d!51401 m!193933))

(declare-fun m!193953 () Bool)

(assert (=> d!51401 m!193953))

(declare-fun m!193955 () Bool)

(assert (=> d!51401 m!193955))

(declare-fun m!193957 () Bool)

(assert (=> d!51401 m!193957))

(declare-fun m!193959 () Bool)

(assert (=> d!51401 m!193959))

(assert (=> d!51401 m!193959))

(declare-fun m!193961 () Bool)

(assert (=> d!51401 m!193961))

(assert (=> b!163072 d!51401))

(declare-fun d!51403 () Bool)

(declare-fun res!77224 () Bool)

(declare-fun e!107018 () Bool)

(assert (=> d!51403 (=> (not res!77224) (not e!107018))))

(declare-fun simpleValid!120 (LongMapFixedSize!1806) Bool)

(assert (=> d!51403 (= res!77224 (simpleValid!120 thiss!1248))))

(assert (=> d!51403 (= (valid!811 thiss!1248) e!107018)))

(declare-fun b!163127 () Bool)

(declare-fun res!77225 () Bool)

(assert (=> b!163127 (=> (not res!77225) (not e!107018))))

(declare-fun arrayCountValidKeys!0 (array!6253 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163127 (= res!77225 (= (arrayCountValidKeys!0 (_keys!5151 thiss!1248) #b00000000000000000000000000000000 (size!3254 (_keys!5151 thiss!1248))) (_size!952 thiss!1248)))))

(declare-fun b!163128 () Bool)

(declare-fun res!77226 () Bool)

(assert (=> b!163128 (=> (not res!77226) (not e!107018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6253 (_ BitVec 32)) Bool)

(assert (=> b!163128 (= res!77226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)))))

(declare-fun b!163129 () Bool)

(declare-datatypes ((List!1989 0))(
  ( (Nil!1986) (Cons!1985 (h!2599 (_ BitVec 64)) (t!6791 List!1989)) )
))
(declare-fun arrayNoDuplicates!0 (array!6253 (_ BitVec 32) List!1989) Bool)

(assert (=> b!163129 (= e!107018 (arrayNoDuplicates!0 (_keys!5151 thiss!1248) #b00000000000000000000000000000000 Nil!1986))))

(assert (= (and d!51403 res!77224) b!163127))

(assert (= (and b!163127 res!77225) b!163128))

(assert (= (and b!163128 res!77226) b!163129))

(declare-fun m!193963 () Bool)

(assert (=> d!51403 m!193963))

(declare-fun m!193965 () Bool)

(assert (=> b!163127 m!193965))

(declare-fun m!193967 () Bool)

(assert (=> b!163128 m!193967))

(declare-fun m!193969 () Bool)

(assert (=> b!163129 m!193969))

(assert (=> start!16356 d!51403))

(declare-fun mapNonEmpty!6078 () Bool)

(declare-fun mapRes!6078 () Bool)

(declare-fun tp!13935 () Bool)

(declare-fun e!107024 () Bool)

(assert (=> mapNonEmpty!6078 (= mapRes!6078 (and tp!13935 e!107024))))

(declare-fun mapValue!6078 () ValueCell!1449)

(declare-fun mapKey!6078 () (_ BitVec 32))

(declare-fun mapRest!6078 () (Array (_ BitVec 32) ValueCell!1449))

(assert (=> mapNonEmpty!6078 (= mapRest!6072 (store mapRest!6078 mapKey!6078 mapValue!6078))))

(declare-fun mapIsEmpty!6078 () Bool)

(assert (=> mapIsEmpty!6078 mapRes!6078))

(declare-fun b!163137 () Bool)

(declare-fun e!107023 () Bool)

(assert (=> b!163137 (= e!107023 tp_is_empty!3585)))

(declare-fun condMapEmpty!6078 () Bool)

(declare-fun mapDefault!6078 () ValueCell!1449)

(assert (=> mapNonEmpty!6072 (= condMapEmpty!6078 (= mapRest!6072 ((as const (Array (_ BitVec 32) ValueCell!1449)) mapDefault!6078)))))

(assert (=> mapNonEmpty!6072 (= tp!13926 (and e!107023 mapRes!6078))))

(declare-fun b!163136 () Bool)

(assert (=> b!163136 (= e!107024 tp_is_empty!3585)))

(assert (= (and mapNonEmpty!6072 condMapEmpty!6078) mapIsEmpty!6078))

(assert (= (and mapNonEmpty!6072 (not condMapEmpty!6078)) mapNonEmpty!6078))

(assert (= (and mapNonEmpty!6078 ((_ is ValueCellFull!1449) mapValue!6078)) b!163136))

(assert (= (and mapNonEmpty!6072 ((_ is ValueCellFull!1449) mapDefault!6078)) b!163137))

(declare-fun m!193971 () Bool)

(assert (=> mapNonEmpty!6078 m!193971))

(check-sat (not b_next!3783) (not b!163127) (not b!163128) (not d!51401) (not mapNonEmpty!6078) (not d!51403) (not b!163129) b_and!10197 tp_is_empty!3585 (not b!163115))
(check-sat b_and!10197 (not b_next!3783))
(get-model)

(declare-fun b!163156 () Bool)

(declare-fun lt!82624 () SeekEntryResult!395)

(assert (=> b!163156 (and (bvsge (index!3750 lt!82624) #b00000000000000000000000000000000) (bvslt (index!3750 lt!82624) (size!3254 (_keys!5151 thiss!1248))))))

(declare-fun res!77233 () Bool)

(assert (=> b!163156 (= res!77233 (= (select (arr!2969 (_keys!5151 thiss!1248)) (index!3750 lt!82624)) key!828))))

(declare-fun e!107035 () Bool)

(assert (=> b!163156 (=> res!77233 e!107035)))

(declare-fun e!107036 () Bool)

(assert (=> b!163156 (= e!107036 e!107035)))

(declare-fun b!163157 () Bool)

(declare-fun e!107038 () SeekEntryResult!395)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163157 (= e!107038 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7989 thiss!1248)) #b00000000000000000000000000000000 (mask!7989 thiss!1248)) key!828 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)))))

(declare-fun b!163158 () Bool)

(assert (=> b!163158 (= e!107038 (Intermediate!395 false (toIndex!0 key!828 (mask!7989 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163159 () Bool)

(declare-fun e!107037 () Bool)

(assert (=> b!163159 (= e!107037 e!107036)))

(declare-fun res!77234 () Bool)

(assert (=> b!163159 (= res!77234 (and ((_ is Intermediate!395) lt!82624) (not (undefined!1207 lt!82624)) (bvslt (x!18060 lt!82624) #b01111111111111111111111111111110) (bvsge (x!18060 lt!82624) #b00000000000000000000000000000000) (bvsge (x!18060 lt!82624) #b00000000000000000000000000000000)))))

(assert (=> b!163159 (=> (not res!77234) (not e!107036))))

(declare-fun d!51405 () Bool)

(assert (=> d!51405 e!107037))

(declare-fun c!30043 () Bool)

(assert (=> d!51405 (= c!30043 (and ((_ is Intermediate!395) lt!82624) (undefined!1207 lt!82624)))))

(declare-fun e!107039 () SeekEntryResult!395)

(assert (=> d!51405 (= lt!82624 e!107039)))

(declare-fun c!30041 () Bool)

(assert (=> d!51405 (= c!30041 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!82623 () (_ BitVec 64))

(assert (=> d!51405 (= lt!82623 (select (arr!2969 (_keys!5151 thiss!1248)) (toIndex!0 key!828 (mask!7989 thiss!1248))))))

(assert (=> d!51405 (validMask!0 (mask!7989 thiss!1248))))

(assert (=> d!51405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7989 thiss!1248)) key!828 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)) lt!82624)))

(declare-fun b!163160 () Bool)

(assert (=> b!163160 (= e!107039 e!107038)))

(declare-fun c!30042 () Bool)

(assert (=> b!163160 (= c!30042 (or (= lt!82623 key!828) (= (bvadd lt!82623 lt!82623) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!163161 () Bool)

(assert (=> b!163161 (and (bvsge (index!3750 lt!82624) #b00000000000000000000000000000000) (bvslt (index!3750 lt!82624) (size!3254 (_keys!5151 thiss!1248))))))

(declare-fun res!77235 () Bool)

(assert (=> b!163161 (= res!77235 (= (select (arr!2969 (_keys!5151 thiss!1248)) (index!3750 lt!82624)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163161 (=> res!77235 e!107035)))

(declare-fun b!163162 () Bool)

(assert (=> b!163162 (= e!107037 (bvsge (x!18060 lt!82624) #b01111111111111111111111111111110))))

(declare-fun b!163163 () Bool)

(assert (=> b!163163 (and (bvsge (index!3750 lt!82624) #b00000000000000000000000000000000) (bvslt (index!3750 lt!82624) (size!3254 (_keys!5151 thiss!1248))))))

(assert (=> b!163163 (= e!107035 (= (select (arr!2969 (_keys!5151 thiss!1248)) (index!3750 lt!82624)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!163164 () Bool)

(assert (=> b!163164 (= e!107039 (Intermediate!395 true (toIndex!0 key!828 (mask!7989 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!51405 c!30041) b!163164))

(assert (= (and d!51405 (not c!30041)) b!163160))

(assert (= (and b!163160 c!30042) b!163158))

(assert (= (and b!163160 (not c!30042)) b!163157))

(assert (= (and d!51405 c!30043) b!163162))

(assert (= (and d!51405 (not c!30043)) b!163159))

(assert (= (and b!163159 res!77234) b!163156))

(assert (= (and b!163156 (not res!77233)) b!163161))

(assert (= (and b!163161 (not res!77235)) b!163163))

(declare-fun m!193973 () Bool)

(assert (=> b!163161 m!193973))

(assert (=> b!163163 m!193973))

(assert (=> d!51405 m!193959))

(declare-fun m!193975 () Bool)

(assert (=> d!51405 m!193975))

(assert (=> d!51405 m!193933))

(assert (=> b!163156 m!193973))

(assert (=> b!163157 m!193959))

(declare-fun m!193977 () Bool)

(assert (=> b!163157 m!193977))

(assert (=> b!163157 m!193977))

(declare-fun m!193979 () Bool)

(assert (=> b!163157 m!193979))

(assert (=> d!51401 d!51405))

(declare-fun d!51407 () Bool)

(declare-fun lt!82630 () (_ BitVec 32))

(declare-fun lt!82629 () (_ BitVec 32))

(assert (=> d!51407 (= lt!82630 (bvmul (bvxor lt!82629 (bvlshr lt!82629 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51407 (= lt!82629 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51407 (and (bvsge (mask!7989 thiss!1248) #b00000000000000000000000000000000) (let ((res!77236 (let ((h!2600 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18076 (bvmul (bvxor h!2600 (bvlshr h!2600 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18076 (bvlshr x!18076 #b00000000000000000000000000001101)) (mask!7989 thiss!1248)))))) (and (bvslt res!77236 (bvadd (mask!7989 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77236 #b00000000000000000000000000000000))))))

(assert (=> d!51407 (= (toIndex!0 key!828 (mask!7989 thiss!1248)) (bvand (bvxor lt!82630 (bvlshr lt!82630 #b00000000000000000000000000001101)) (mask!7989 thiss!1248)))))

(assert (=> d!51401 d!51407))

(assert (=> d!51401 d!51399))

(declare-fun b!163173 () Bool)

(declare-fun e!107045 () (_ BitVec 32))

(declare-fun e!107044 () (_ BitVec 32))

(assert (=> b!163173 (= e!107045 e!107044)))

(declare-fun c!30049 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163173 (= c!30049 (validKeyInArray!0 (select (arr!2969 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17293 () Bool)

(declare-fun call!17296 () (_ BitVec 32))

(assert (=> bm!17293 (= call!17296 (arrayCountValidKeys!0 (_keys!5151 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3254 (_keys!5151 thiss!1248))))))

(declare-fun d!51409 () Bool)

(declare-fun lt!82633 () (_ BitVec 32))

(assert (=> d!51409 (and (bvsge lt!82633 #b00000000000000000000000000000000) (bvsle lt!82633 (bvsub (size!3254 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51409 (= lt!82633 e!107045)))

(declare-fun c!30048 () Bool)

(assert (=> d!51409 (= c!30048 (bvsge #b00000000000000000000000000000000 (size!3254 (_keys!5151 thiss!1248))))))

(assert (=> d!51409 (and (bvsle #b00000000000000000000000000000000 (size!3254 (_keys!5151 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3254 (_keys!5151 thiss!1248)) (size!3254 (_keys!5151 thiss!1248))))))

(assert (=> d!51409 (= (arrayCountValidKeys!0 (_keys!5151 thiss!1248) #b00000000000000000000000000000000 (size!3254 (_keys!5151 thiss!1248))) lt!82633)))

(declare-fun b!163174 () Bool)

(assert (=> b!163174 (= e!107044 call!17296)))

(declare-fun b!163175 () Bool)

(assert (=> b!163175 (= e!107044 (bvadd #b00000000000000000000000000000001 call!17296))))

(declare-fun b!163176 () Bool)

(assert (=> b!163176 (= e!107045 #b00000000000000000000000000000000)))

(assert (= (and d!51409 c!30048) b!163176))

(assert (= (and d!51409 (not c!30048)) b!163173))

(assert (= (and b!163173 c!30049) b!163175))

(assert (= (and b!163173 (not c!30049)) b!163174))

(assert (= (or b!163175 b!163174) bm!17293))

(declare-fun m!193981 () Bool)

(assert (=> b!163173 m!193981))

(assert (=> b!163173 m!193981))

(declare-fun m!193983 () Bool)

(assert (=> b!163173 m!193983))

(declare-fun m!193985 () Bool)

(assert (=> bm!17293 m!193985))

(assert (=> b!163127 d!51409))

(declare-fun b!163189 () Bool)

(declare-fun e!107053 () SeekEntryResult!395)

(assert (=> b!163189 (= e!107053 Undefined!395)))

(declare-fun b!163190 () Bool)

(declare-fun e!107054 () SeekEntryResult!395)

(assert (=> b!163190 (= e!107054 (Found!395 (index!3750 lt!82618)))))

(declare-fun b!163191 () Bool)

(declare-fun c!30057 () Bool)

(declare-fun lt!82638 () (_ BitVec 64))

(assert (=> b!163191 (= c!30057 (= lt!82638 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107052 () SeekEntryResult!395)

(assert (=> b!163191 (= e!107054 e!107052)))

(declare-fun lt!82639 () SeekEntryResult!395)

(declare-fun d!51411 () Bool)

(assert (=> d!51411 (and (or ((_ is Undefined!395) lt!82639) (not ((_ is Found!395) lt!82639)) (and (bvsge (index!3749 lt!82639) #b00000000000000000000000000000000) (bvslt (index!3749 lt!82639) (size!3254 (_keys!5151 thiss!1248))))) (or ((_ is Undefined!395) lt!82639) ((_ is Found!395) lt!82639) (not ((_ is MissingVacant!395) lt!82639)) (not (= (index!3751 lt!82639) (index!3750 lt!82618))) (and (bvsge (index!3751 lt!82639) #b00000000000000000000000000000000) (bvslt (index!3751 lt!82639) (size!3254 (_keys!5151 thiss!1248))))) (or ((_ is Undefined!395) lt!82639) (ite ((_ is Found!395) lt!82639) (= (select (arr!2969 (_keys!5151 thiss!1248)) (index!3749 lt!82639)) key!828) (and ((_ is MissingVacant!395) lt!82639) (= (index!3751 lt!82639) (index!3750 lt!82618)) (= (select (arr!2969 (_keys!5151 thiss!1248)) (index!3751 lt!82639)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51411 (= lt!82639 e!107053)))

(declare-fun c!30058 () Bool)

(assert (=> d!51411 (= c!30058 (bvsge (x!18060 lt!82618) #b01111111111111111111111111111110))))

(assert (=> d!51411 (= lt!82638 (select (arr!2969 (_keys!5151 thiss!1248)) (index!3750 lt!82618)))))

(assert (=> d!51411 (validMask!0 (mask!7989 thiss!1248))))

(assert (=> d!51411 (= (seekKeyOrZeroReturnVacant!0 (x!18060 lt!82618) (index!3750 lt!82618) (index!3750 lt!82618) key!828 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)) lt!82639)))

(declare-fun b!163192 () Bool)

(assert (=> b!163192 (= e!107053 e!107054)))

(declare-fun c!30056 () Bool)

(assert (=> b!163192 (= c!30056 (= lt!82638 key!828))))

(declare-fun b!163193 () Bool)

(assert (=> b!163193 (= e!107052 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18060 lt!82618) #b00000000000000000000000000000001) (nextIndex!0 (index!3750 lt!82618) (x!18060 lt!82618) (mask!7989 thiss!1248)) (index!3750 lt!82618) key!828 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)))))

(declare-fun b!163194 () Bool)

(assert (=> b!163194 (= e!107052 (MissingVacant!395 (index!3750 lt!82618)))))

(assert (= (and d!51411 c!30058) b!163189))

(assert (= (and d!51411 (not c!30058)) b!163192))

(assert (= (and b!163192 c!30056) b!163190))

(assert (= (and b!163192 (not c!30056)) b!163191))

(assert (= (and b!163191 c!30057) b!163194))

(assert (= (and b!163191 (not c!30057)) b!163193))

(declare-fun m!193987 () Bool)

(assert (=> d!51411 m!193987))

(declare-fun m!193989 () Bool)

(assert (=> d!51411 m!193989))

(assert (=> d!51411 m!193951))

(assert (=> d!51411 m!193933))

(declare-fun m!193991 () Bool)

(assert (=> b!163193 m!193991))

(assert (=> b!163193 m!193991))

(declare-fun m!193993 () Bool)

(assert (=> b!163193 m!193993))

(assert (=> b!163115 d!51411))

(declare-fun b!163203 () Bool)

(declare-fun res!77246 () Bool)

(declare-fun e!107057 () Bool)

(assert (=> b!163203 (=> (not res!77246) (not e!107057))))

(assert (=> b!163203 (= res!77246 (and (= (size!3255 (_values!3328 thiss!1248)) (bvadd (mask!7989 thiss!1248) #b00000000000000000000000000000001)) (= (size!3254 (_keys!5151 thiss!1248)) (size!3255 (_values!3328 thiss!1248))) (bvsge (_size!952 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!952 thiss!1248) (bvadd (mask!7989 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!51413 () Bool)

(declare-fun res!77248 () Bool)

(assert (=> d!51413 (=> (not res!77248) (not e!107057))))

(assert (=> d!51413 (= res!77248 (validMask!0 (mask!7989 thiss!1248)))))

(assert (=> d!51413 (= (simpleValid!120 thiss!1248) e!107057)))

(declare-fun b!163204 () Bool)

(declare-fun res!77247 () Bool)

(assert (=> b!163204 (=> (not res!77247) (not e!107057))))

(declare-fun size!3258 (LongMapFixedSize!1806) (_ BitVec 32))

(assert (=> b!163204 (= res!77247 (bvsge (size!3258 thiss!1248) (_size!952 thiss!1248)))))

(declare-fun b!163205 () Bool)

(declare-fun res!77245 () Bool)

(assert (=> b!163205 (=> (not res!77245) (not e!107057))))

(assert (=> b!163205 (= res!77245 (= (size!3258 thiss!1248) (bvadd (_size!952 thiss!1248) (bvsdiv (bvadd (extraKeys!3086 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!163206 () Bool)

(assert (=> b!163206 (= e!107057 (and (bvsge (extraKeys!3086 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3086 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!952 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!51413 res!77248) b!163203))

(assert (= (and b!163203 res!77246) b!163204))

(assert (= (and b!163204 res!77247) b!163205))

(assert (= (and b!163205 res!77245) b!163206))

(assert (=> d!51413 m!193933))

(declare-fun m!193995 () Bool)

(assert (=> b!163204 m!193995))

(assert (=> b!163205 m!193995))

(assert (=> d!51403 d!51413))

(declare-fun b!163215 () Bool)

(declare-fun e!107064 () Bool)

(declare-fun call!17299 () Bool)

(assert (=> b!163215 (= e!107064 call!17299)))

(declare-fun bm!17296 () Bool)

(assert (=> bm!17296 (= call!17299 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5151 thiss!1248) (mask!7989 thiss!1248)))))

(declare-fun b!163216 () Bool)

(declare-fun e!107066 () Bool)

(assert (=> b!163216 (= e!107066 e!107064)))

(declare-fun lt!82647 () (_ BitVec 64))

(assert (=> b!163216 (= lt!82647 (select (arr!2969 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5037 0))(
  ( (Unit!5038) )
))
(declare-fun lt!82646 () Unit!5037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6253 (_ BitVec 64) (_ BitVec 32)) Unit!5037)

(assert (=> b!163216 (= lt!82646 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5151 thiss!1248) lt!82647 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163216 (arrayContainsKey!0 (_keys!5151 thiss!1248) lt!82647 #b00000000000000000000000000000000)))

(declare-fun lt!82648 () Unit!5037)

(assert (=> b!163216 (= lt!82648 lt!82646)))

(declare-fun res!77254 () Bool)

(assert (=> b!163216 (= res!77254 (= (seekEntryOrOpen!0 (select (arr!2969 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000) (_keys!5151 thiss!1248) (mask!7989 thiss!1248)) (Found!395 #b00000000000000000000000000000000)))))

(assert (=> b!163216 (=> (not res!77254) (not e!107064))))

(declare-fun d!51415 () Bool)

(declare-fun res!77253 () Bool)

(declare-fun e!107065 () Bool)

(assert (=> d!51415 (=> res!77253 e!107065)))

(assert (=> d!51415 (= res!77253 (bvsge #b00000000000000000000000000000000 (size!3254 (_keys!5151 thiss!1248))))))

(assert (=> d!51415 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5151 thiss!1248) (mask!7989 thiss!1248)) e!107065)))

(declare-fun b!163217 () Bool)

(assert (=> b!163217 (= e!107065 e!107066)))

(declare-fun c!30061 () Bool)

(assert (=> b!163217 (= c!30061 (validKeyInArray!0 (select (arr!2969 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163218 () Bool)

(assert (=> b!163218 (= e!107066 call!17299)))

(assert (= (and d!51415 (not res!77253)) b!163217))

(assert (= (and b!163217 c!30061) b!163216))

(assert (= (and b!163217 (not c!30061)) b!163218))

(assert (= (and b!163216 res!77254) b!163215))

(assert (= (or b!163215 b!163218) bm!17296))

(declare-fun m!193997 () Bool)

(assert (=> bm!17296 m!193997))

(assert (=> b!163216 m!193981))

(declare-fun m!193999 () Bool)

(assert (=> b!163216 m!193999))

(declare-fun m!194001 () Bool)

(assert (=> b!163216 m!194001))

(assert (=> b!163216 m!193981))

(declare-fun m!194003 () Bool)

(assert (=> b!163216 m!194003))

(assert (=> b!163217 m!193981))

(assert (=> b!163217 m!193981))

(assert (=> b!163217 m!193983))

(assert (=> b!163128 d!51415))

(declare-fun d!51417 () Bool)

(declare-fun res!77262 () Bool)

(declare-fun e!107077 () Bool)

(assert (=> d!51417 (=> res!77262 e!107077)))

(assert (=> d!51417 (= res!77262 (bvsge #b00000000000000000000000000000000 (size!3254 (_keys!5151 thiss!1248))))))

(assert (=> d!51417 (= (arrayNoDuplicates!0 (_keys!5151 thiss!1248) #b00000000000000000000000000000000 Nil!1986) e!107077)))

(declare-fun b!163229 () Bool)

(declare-fun e!107078 () Bool)

(assert (=> b!163229 (= e!107077 e!107078)))

(declare-fun res!77263 () Bool)

(assert (=> b!163229 (=> (not res!77263) (not e!107078))))

(declare-fun e!107076 () Bool)

(assert (=> b!163229 (= res!77263 (not e!107076))))

(declare-fun res!77261 () Bool)

(assert (=> b!163229 (=> (not res!77261) (not e!107076))))

(assert (=> b!163229 (= res!77261 (validKeyInArray!0 (select (arr!2969 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17299 () Bool)

(declare-fun call!17302 () Bool)

(declare-fun c!30064 () Bool)

(assert (=> bm!17299 (= call!17302 (arrayNoDuplicates!0 (_keys!5151 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30064 (Cons!1985 (select (arr!2969 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000) Nil!1986) Nil!1986)))))

(declare-fun b!163230 () Bool)

(declare-fun e!107075 () Bool)

(assert (=> b!163230 (= e!107075 call!17302)))

(declare-fun b!163231 () Bool)

(assert (=> b!163231 (= e!107075 call!17302)))

(declare-fun b!163232 () Bool)

(assert (=> b!163232 (= e!107078 e!107075)))

(assert (=> b!163232 (= c!30064 (validKeyInArray!0 (select (arr!2969 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163233 () Bool)

(declare-fun contains!1037 (List!1989 (_ BitVec 64)) Bool)

(assert (=> b!163233 (= e!107076 (contains!1037 Nil!1986 (select (arr!2969 (_keys!5151 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51417 (not res!77262)) b!163229))

(assert (= (and b!163229 res!77261) b!163233))

(assert (= (and b!163229 res!77263) b!163232))

(assert (= (and b!163232 c!30064) b!163231))

(assert (= (and b!163232 (not c!30064)) b!163230))

(assert (= (or b!163231 b!163230) bm!17299))

(assert (=> b!163229 m!193981))

(assert (=> b!163229 m!193981))

(assert (=> b!163229 m!193983))

(assert (=> bm!17299 m!193981))

(declare-fun m!194005 () Bool)

(assert (=> bm!17299 m!194005))

(assert (=> b!163232 m!193981))

(assert (=> b!163232 m!193981))

(assert (=> b!163232 m!193983))

(assert (=> b!163233 m!193981))

(assert (=> b!163233 m!193981))

(declare-fun m!194007 () Bool)

(assert (=> b!163233 m!194007))

(assert (=> b!163129 d!51417))

(declare-fun mapNonEmpty!6079 () Bool)

(declare-fun mapRes!6079 () Bool)

(declare-fun tp!13936 () Bool)

(declare-fun e!107080 () Bool)

(assert (=> mapNonEmpty!6079 (= mapRes!6079 (and tp!13936 e!107080))))

(declare-fun mapValue!6079 () ValueCell!1449)

(declare-fun mapRest!6079 () (Array (_ BitVec 32) ValueCell!1449))

(declare-fun mapKey!6079 () (_ BitVec 32))

(assert (=> mapNonEmpty!6079 (= mapRest!6078 (store mapRest!6079 mapKey!6079 mapValue!6079))))

(declare-fun mapIsEmpty!6079 () Bool)

(assert (=> mapIsEmpty!6079 mapRes!6079))

(declare-fun b!163235 () Bool)

(declare-fun e!107079 () Bool)

(assert (=> b!163235 (= e!107079 tp_is_empty!3585)))

(declare-fun condMapEmpty!6079 () Bool)

(declare-fun mapDefault!6079 () ValueCell!1449)

(assert (=> mapNonEmpty!6078 (= condMapEmpty!6079 (= mapRest!6078 ((as const (Array (_ BitVec 32) ValueCell!1449)) mapDefault!6079)))))

(assert (=> mapNonEmpty!6078 (= tp!13935 (and e!107079 mapRes!6079))))

(declare-fun b!163234 () Bool)

(assert (=> b!163234 (= e!107080 tp_is_empty!3585)))

(assert (= (and mapNonEmpty!6078 condMapEmpty!6079) mapIsEmpty!6079))

(assert (= (and mapNonEmpty!6078 (not condMapEmpty!6079)) mapNonEmpty!6079))

(assert (= (and mapNonEmpty!6079 ((_ is ValueCellFull!1449) mapValue!6079)) b!163234))

(assert (= (and mapNonEmpty!6078 ((_ is ValueCellFull!1449) mapDefault!6079)) b!163235))

(declare-fun m!194009 () Bool)

(assert (=> mapNonEmpty!6079 m!194009))

(check-sat (not b_next!3783) (not d!51405) (not b!163233) (not b!163173) (not mapNonEmpty!6079) (not bm!17299) (not b!163216) (not b!163229) (not b!163204) (not d!51413) (not b!163193) (not b!163205) (not d!51411) (not bm!17296) (not b!163217) (not bm!17293) (not b!163157) (not b!163232) b_and!10197 tp_is_empty!3585)
(check-sat b_and!10197 (not b_next!3783))
