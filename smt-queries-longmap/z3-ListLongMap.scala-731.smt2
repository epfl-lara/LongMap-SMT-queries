; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16990 () Bool)

(assert start!16990)

(declare-fun b!170767 () Bool)

(declare-fun b_free!4227 () Bool)

(declare-fun b_next!4227 () Bool)

(assert (=> b!170767 (= b_free!4227 (not b_next!4227))))

(declare-fun tp!15307 () Bool)

(declare-fun b_and!10641 () Bool)

(assert (=> b!170767 (= tp!15307 b_and!10641)))

(declare-fun b!170764 () Bool)

(declare-fun e!112720 () Bool)

(declare-fun e!112717 () Bool)

(declare-fun mapRes!6788 () Bool)

(assert (=> b!170764 (= e!112720 (and e!112717 mapRes!6788))))

(declare-fun condMapEmpty!6788 () Bool)

(declare-datatypes ((V!4979 0))(
  ( (V!4980 (val!2044 Int)) )
))
(declare-datatypes ((ValueCell!1656 0))(
  ( (ValueCellFull!1656 (v!3909 V!4979)) (EmptyCell!1656) )
))
(declare-datatypes ((array!7109 0))(
  ( (array!7110 (arr!3383 (Array (_ BitVec 32) (_ BitVec 64))) (size!3676 (_ BitVec 32))) )
))
(declare-datatypes ((array!7111 0))(
  ( (array!7112 (arr!3384 (Array (_ BitVec 32) ValueCell!1656)) (size!3677 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2220 0))(
  ( (LongMapFixedSize!2221 (defaultEntry!3552 Int) (mask!8376 (_ BitVec 32)) (extraKeys!3293 (_ BitVec 32)) (zeroValue!3395 V!4979) (minValue!3395 V!4979) (_size!1159 (_ BitVec 32)) (_keys!5383 array!7109) (_values!3535 array!7111) (_vacant!1159 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2220)

(declare-fun mapDefault!6788 () ValueCell!1656)

(assert (=> b!170764 (= condMapEmpty!6788 (= (arr!3384 (_values!3535 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1656)) mapDefault!6788)))))

(declare-fun b!170765 () Bool)

(declare-fun tp_is_empty!3999 () Bool)

(assert (=> b!170765 (= e!112717 tp_is_empty!3999)))

(declare-fun mapNonEmpty!6788 () Bool)

(declare-fun tp!15308 () Bool)

(declare-fun e!112722 () Bool)

(assert (=> mapNonEmpty!6788 (= mapRes!6788 (and tp!15308 e!112722))))

(declare-fun mapRest!6788 () (Array (_ BitVec 32) ValueCell!1656))

(declare-fun mapKey!6788 () (_ BitVec 32))

(declare-fun mapValue!6788 () ValueCell!1656)

(assert (=> mapNonEmpty!6788 (= (arr!3384 (_values!3535 thiss!1248)) (store mapRest!6788 mapKey!6788 mapValue!6788))))

(declare-fun res!81177 () Bool)

(declare-fun e!112719 () Bool)

(assert (=> start!16990 (=> (not res!81177) (not e!112719))))

(declare-fun valid!945 (LongMapFixedSize!2220) Bool)

(assert (=> start!16990 (= res!81177 (valid!945 thiss!1248))))

(assert (=> start!16990 e!112719))

(declare-fun e!112718 () Bool)

(assert (=> start!16990 e!112718))

(assert (=> start!16990 true))

(declare-fun b!170766 () Bool)

(declare-fun res!81179 () Bool)

(assert (=> b!170766 (=> (not res!81179) (not e!112719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170766 (= res!81179 (validMask!0 (mask!8376 thiss!1248)))))

(declare-fun array_inv!2163 (array!7109) Bool)

(declare-fun array_inv!2164 (array!7111) Bool)

(assert (=> b!170767 (= e!112718 (and tp!15307 tp_is_empty!3999 (array_inv!2163 (_keys!5383 thiss!1248)) (array_inv!2164 (_values!3535 thiss!1248)) e!112720))))

(declare-fun b!170768 () Bool)

(declare-fun res!81180 () Bool)

(assert (=> b!170768 (=> (not res!81180) (not e!112719))))

(assert (=> b!170768 (= res!81180 (and (= (size!3677 (_values!3535 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8376 thiss!1248))) (= (size!3676 (_keys!5383 thiss!1248)) (size!3677 (_values!3535 thiss!1248))) (bvsge (mask!8376 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3293 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3293 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3293 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3293 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3293 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3293 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!3293 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!170769 () Bool)

(declare-fun res!81178 () Bool)

(assert (=> b!170769 (=> (not res!81178) (not e!112719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7109 (_ BitVec 32)) Bool)

(assert (=> b!170769 (= res!81178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5383 thiss!1248) (mask!8376 thiss!1248)))))

(declare-fun b!170770 () Bool)

(declare-fun res!81176 () Bool)

(assert (=> b!170770 (=> (not res!81176) (not e!112719))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170770 (= res!81176 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6788 () Bool)

(assert (=> mapIsEmpty!6788 mapRes!6788))

(declare-fun b!170771 () Bool)

(declare-datatypes ((List!2190 0))(
  ( (Nil!2187) (Cons!2186 (h!2803 (_ BitVec 64)) (t!6992 List!2190)) )
))
(declare-fun arrayNoDuplicates!0 (array!7109 (_ BitVec 32) List!2190) Bool)

(assert (=> b!170771 (= e!112719 (not (arrayNoDuplicates!0 (_keys!5383 thiss!1248) #b00000000000000000000000000000000 Nil!2187)))))

(declare-fun b!170772 () Bool)

(assert (=> b!170772 (= e!112722 tp_is_empty!3999)))

(assert (= (and start!16990 res!81177) b!170770))

(assert (= (and b!170770 res!81176) b!170766))

(assert (= (and b!170766 res!81179) b!170768))

(assert (= (and b!170768 res!81180) b!170769))

(assert (= (and b!170769 res!81178) b!170771))

(assert (= (and b!170764 condMapEmpty!6788) mapIsEmpty!6788))

(assert (= (and b!170764 (not condMapEmpty!6788)) mapNonEmpty!6788))

(get-info :version)

(assert (= (and mapNonEmpty!6788 ((_ is ValueCellFull!1656) mapValue!6788)) b!170772))

(assert (= (and b!170764 ((_ is ValueCellFull!1656) mapDefault!6788)) b!170765))

(assert (= b!170767 b!170764))

(assert (= start!16990 b!170767))

(declare-fun m!199113 () Bool)

(assert (=> b!170771 m!199113))

(declare-fun m!199115 () Bool)

(assert (=> start!16990 m!199115))

(declare-fun m!199117 () Bool)

(assert (=> b!170767 m!199117))

(declare-fun m!199119 () Bool)

(assert (=> b!170767 m!199119))

(declare-fun m!199121 () Bool)

(assert (=> b!170766 m!199121))

(declare-fun m!199123 () Bool)

(assert (=> b!170769 m!199123))

(declare-fun m!199125 () Bool)

(assert (=> mapNonEmpty!6788 m!199125))

(check-sat (not start!16990) (not b_next!4227) (not b!170769) (not b!170771) tp_is_empty!3999 (not mapNonEmpty!6788) (not b!170766) (not b!170767) b_and!10641)
(check-sat b_and!10641 (not b_next!4227))
(get-model)

(declare-fun d!51753 () Bool)

(assert (=> d!51753 (= (validMask!0 (mask!8376 thiss!1248)) (and (or (= (mask!8376 thiss!1248) #b00000000000000000000000000000111) (= (mask!8376 thiss!1248) #b00000000000000000000000000001111) (= (mask!8376 thiss!1248) #b00000000000000000000000000011111) (= (mask!8376 thiss!1248) #b00000000000000000000000000111111) (= (mask!8376 thiss!1248) #b00000000000000000000000001111111) (= (mask!8376 thiss!1248) #b00000000000000000000000011111111) (= (mask!8376 thiss!1248) #b00000000000000000000000111111111) (= (mask!8376 thiss!1248) #b00000000000000000000001111111111) (= (mask!8376 thiss!1248) #b00000000000000000000011111111111) (= (mask!8376 thiss!1248) #b00000000000000000000111111111111) (= (mask!8376 thiss!1248) #b00000000000000000001111111111111) (= (mask!8376 thiss!1248) #b00000000000000000011111111111111) (= (mask!8376 thiss!1248) #b00000000000000000111111111111111) (= (mask!8376 thiss!1248) #b00000000000000001111111111111111) (= (mask!8376 thiss!1248) #b00000000000000011111111111111111) (= (mask!8376 thiss!1248) #b00000000000000111111111111111111) (= (mask!8376 thiss!1248) #b00000000000001111111111111111111) (= (mask!8376 thiss!1248) #b00000000000011111111111111111111) (= (mask!8376 thiss!1248) #b00000000000111111111111111111111) (= (mask!8376 thiss!1248) #b00000000001111111111111111111111) (= (mask!8376 thiss!1248) #b00000000011111111111111111111111) (= (mask!8376 thiss!1248) #b00000000111111111111111111111111) (= (mask!8376 thiss!1248) #b00000001111111111111111111111111) (= (mask!8376 thiss!1248) #b00000011111111111111111111111111) (= (mask!8376 thiss!1248) #b00000111111111111111111111111111) (= (mask!8376 thiss!1248) #b00001111111111111111111111111111) (= (mask!8376 thiss!1248) #b00011111111111111111111111111111) (= (mask!8376 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8376 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170766 d!51753))

(declare-fun d!51755 () Bool)

(declare-fun res!81202 () Bool)

(declare-fun e!112743 () Bool)

(assert (=> d!51755 (=> (not res!81202) (not e!112743))))

(declare-fun simpleValid!134 (LongMapFixedSize!2220) Bool)

(assert (=> d!51755 (= res!81202 (simpleValid!134 thiss!1248))))

(assert (=> d!51755 (= (valid!945 thiss!1248) e!112743)))

(declare-fun b!170806 () Bool)

(declare-fun res!81203 () Bool)

(assert (=> b!170806 (=> (not res!81203) (not e!112743))))

(declare-fun arrayCountValidKeys!0 (array!7109 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170806 (= res!81203 (= (arrayCountValidKeys!0 (_keys!5383 thiss!1248) #b00000000000000000000000000000000 (size!3676 (_keys!5383 thiss!1248))) (_size!1159 thiss!1248)))))

(declare-fun b!170807 () Bool)

(declare-fun res!81204 () Bool)

(assert (=> b!170807 (=> (not res!81204) (not e!112743))))

(assert (=> b!170807 (= res!81204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5383 thiss!1248) (mask!8376 thiss!1248)))))

(declare-fun b!170808 () Bool)

(assert (=> b!170808 (= e!112743 (arrayNoDuplicates!0 (_keys!5383 thiss!1248) #b00000000000000000000000000000000 Nil!2187))))

(assert (= (and d!51755 res!81202) b!170806))

(assert (= (and b!170806 res!81203) b!170807))

(assert (= (and b!170807 res!81204) b!170808))

(declare-fun m!199141 () Bool)

(assert (=> d!51755 m!199141))

(declare-fun m!199143 () Bool)

(assert (=> b!170806 m!199143))

(assert (=> b!170807 m!199123))

(assert (=> b!170808 m!199113))

(assert (=> start!16990 d!51755))

(declare-fun b!170819 () Bool)

(declare-fun e!112754 () Bool)

(declare-fun contains!1142 (List!2190 (_ BitVec 64)) Bool)

(assert (=> b!170819 (= e!112754 (contains!1142 Nil!2187 (select (arr!3383 (_keys!5383 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17383 () Bool)

(declare-fun call!17386 () Bool)

(declare-fun c!30493 () Bool)

(assert (=> bm!17383 (= call!17386 (arrayNoDuplicates!0 (_keys!5383 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30493 (Cons!2186 (select (arr!3383 (_keys!5383 thiss!1248)) #b00000000000000000000000000000000) Nil!2187) Nil!2187)))))

(declare-fun d!51757 () Bool)

(declare-fun res!81213 () Bool)

(declare-fun e!112752 () Bool)

(assert (=> d!51757 (=> res!81213 e!112752)))

(assert (=> d!51757 (= res!81213 (bvsge #b00000000000000000000000000000000 (size!3676 (_keys!5383 thiss!1248))))))

(assert (=> d!51757 (= (arrayNoDuplicates!0 (_keys!5383 thiss!1248) #b00000000000000000000000000000000 Nil!2187) e!112752)))

(declare-fun b!170820 () Bool)

(declare-fun e!112755 () Bool)

(assert (=> b!170820 (= e!112752 e!112755)))

(declare-fun res!81211 () Bool)

(assert (=> b!170820 (=> (not res!81211) (not e!112755))))

(assert (=> b!170820 (= res!81211 (not e!112754))))

(declare-fun res!81212 () Bool)

(assert (=> b!170820 (=> (not res!81212) (not e!112754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170820 (= res!81212 (validKeyInArray!0 (select (arr!3383 (_keys!5383 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170821 () Bool)

(declare-fun e!112753 () Bool)

(assert (=> b!170821 (= e!112755 e!112753)))

(assert (=> b!170821 (= c!30493 (validKeyInArray!0 (select (arr!3383 (_keys!5383 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170822 () Bool)

(assert (=> b!170822 (= e!112753 call!17386)))

(declare-fun b!170823 () Bool)

(assert (=> b!170823 (= e!112753 call!17386)))

(assert (= (and d!51757 (not res!81213)) b!170820))

(assert (= (and b!170820 res!81212) b!170819))

(assert (= (and b!170820 res!81211) b!170821))

(assert (= (and b!170821 c!30493) b!170822))

(assert (= (and b!170821 (not c!30493)) b!170823))

(assert (= (or b!170822 b!170823) bm!17383))

(declare-fun m!199145 () Bool)

(assert (=> b!170819 m!199145))

(assert (=> b!170819 m!199145))

(declare-fun m!199147 () Bool)

(assert (=> b!170819 m!199147))

(assert (=> bm!17383 m!199145))

(declare-fun m!199149 () Bool)

(assert (=> bm!17383 m!199149))

(assert (=> b!170820 m!199145))

(assert (=> b!170820 m!199145))

(declare-fun m!199151 () Bool)

(assert (=> b!170820 m!199151))

(assert (=> b!170821 m!199145))

(assert (=> b!170821 m!199145))

(assert (=> b!170821 m!199151))

(assert (=> b!170771 d!51757))

(declare-fun d!51759 () Bool)

(assert (=> d!51759 (= (array_inv!2163 (_keys!5383 thiss!1248)) (bvsge (size!3676 (_keys!5383 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170767 d!51759))

(declare-fun d!51761 () Bool)

(assert (=> d!51761 (= (array_inv!2164 (_values!3535 thiss!1248)) (bvsge (size!3677 (_values!3535 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170767 d!51761))

(declare-fun b!170832 () Bool)

(declare-fun e!112764 () Bool)

(declare-fun call!17389 () Bool)

(assert (=> b!170832 (= e!112764 call!17389)))

(declare-fun b!170833 () Bool)

(declare-fun e!112763 () Bool)

(assert (=> b!170833 (= e!112763 call!17389)))

(declare-fun bm!17386 () Bool)

(assert (=> bm!17386 (= call!17389 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5383 thiss!1248) (mask!8376 thiss!1248)))))

(declare-fun d!51763 () Bool)

(declare-fun res!81219 () Bool)

(declare-fun e!112762 () Bool)

(assert (=> d!51763 (=> res!81219 e!112762)))

(assert (=> d!51763 (= res!81219 (bvsge #b00000000000000000000000000000000 (size!3676 (_keys!5383 thiss!1248))))))

(assert (=> d!51763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5383 thiss!1248) (mask!8376 thiss!1248)) e!112762)))

(declare-fun b!170834 () Bool)

(assert (=> b!170834 (= e!112763 e!112764)))

(declare-fun lt!85026 () (_ BitVec 64))

(assert (=> b!170834 (= lt!85026 (select (arr!3383 (_keys!5383 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5248 0))(
  ( (Unit!5249) )
))
(declare-fun lt!85025 () Unit!5248)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7109 (_ BitVec 64) (_ BitVec 32)) Unit!5248)

(assert (=> b!170834 (= lt!85025 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5383 thiss!1248) lt!85026 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170834 (arrayContainsKey!0 (_keys!5383 thiss!1248) lt!85026 #b00000000000000000000000000000000)))

(declare-fun lt!85027 () Unit!5248)

(assert (=> b!170834 (= lt!85027 lt!85025)))

(declare-fun res!81218 () Bool)

(declare-datatypes ((SeekEntryResult!533 0))(
  ( (MissingZero!533 (index!4300 (_ BitVec 32))) (Found!533 (index!4301 (_ BitVec 32))) (Intermediate!533 (undefined!1345 Bool) (index!4302 (_ BitVec 32)) (x!18927 (_ BitVec 32))) (Undefined!533) (MissingVacant!533 (index!4303 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7109 (_ BitVec 32)) SeekEntryResult!533)

(assert (=> b!170834 (= res!81218 (= (seekEntryOrOpen!0 (select (arr!3383 (_keys!5383 thiss!1248)) #b00000000000000000000000000000000) (_keys!5383 thiss!1248) (mask!8376 thiss!1248)) (Found!533 #b00000000000000000000000000000000)))))

(assert (=> b!170834 (=> (not res!81218) (not e!112764))))

(declare-fun b!170835 () Bool)

(assert (=> b!170835 (= e!112762 e!112763)))

(declare-fun c!30496 () Bool)

(assert (=> b!170835 (= c!30496 (validKeyInArray!0 (select (arr!3383 (_keys!5383 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51763 (not res!81219)) b!170835))

(assert (= (and b!170835 c!30496) b!170834))

(assert (= (and b!170835 (not c!30496)) b!170833))

(assert (= (and b!170834 res!81218) b!170832))

(assert (= (or b!170832 b!170833) bm!17386))

(declare-fun m!199153 () Bool)

(assert (=> bm!17386 m!199153))

(assert (=> b!170834 m!199145))

(declare-fun m!199155 () Bool)

(assert (=> b!170834 m!199155))

(declare-fun m!199157 () Bool)

(assert (=> b!170834 m!199157))

(assert (=> b!170834 m!199145))

(declare-fun m!199159 () Bool)

(assert (=> b!170834 m!199159))

(assert (=> b!170835 m!199145))

(assert (=> b!170835 m!199145))

(assert (=> b!170835 m!199151))

(assert (=> b!170769 d!51763))

(declare-fun b!170842 () Bool)

(declare-fun e!112770 () Bool)

(assert (=> b!170842 (= e!112770 tp_is_empty!3999)))

(declare-fun mapNonEmpty!6794 () Bool)

(declare-fun mapRes!6794 () Bool)

(declare-fun tp!15317 () Bool)

(assert (=> mapNonEmpty!6794 (= mapRes!6794 (and tp!15317 e!112770))))

(declare-fun mapRest!6794 () (Array (_ BitVec 32) ValueCell!1656))

(declare-fun mapValue!6794 () ValueCell!1656)

(declare-fun mapKey!6794 () (_ BitVec 32))

(assert (=> mapNonEmpty!6794 (= mapRest!6788 (store mapRest!6794 mapKey!6794 mapValue!6794))))

(declare-fun mapIsEmpty!6794 () Bool)

(assert (=> mapIsEmpty!6794 mapRes!6794))

(declare-fun b!170843 () Bool)

(declare-fun e!112769 () Bool)

(assert (=> b!170843 (= e!112769 tp_is_empty!3999)))

(declare-fun condMapEmpty!6794 () Bool)

(declare-fun mapDefault!6794 () ValueCell!1656)

(assert (=> mapNonEmpty!6788 (= condMapEmpty!6794 (= mapRest!6788 ((as const (Array (_ BitVec 32) ValueCell!1656)) mapDefault!6794)))))

(assert (=> mapNonEmpty!6788 (= tp!15308 (and e!112769 mapRes!6794))))

(assert (= (and mapNonEmpty!6788 condMapEmpty!6794) mapIsEmpty!6794))

(assert (= (and mapNonEmpty!6788 (not condMapEmpty!6794)) mapNonEmpty!6794))

(assert (= (and mapNonEmpty!6794 ((_ is ValueCellFull!1656) mapValue!6794)) b!170842))

(assert (= (and mapNonEmpty!6788 ((_ is ValueCellFull!1656) mapDefault!6794)) b!170843))

(declare-fun m!199161 () Bool)

(assert (=> mapNonEmpty!6794 m!199161))

(check-sat (not b!170819) (not b!170808) (not b!170835) (not b_next!4227) (not d!51755) (not b!170807) (not b!170821) (not bm!17386) tp_is_empty!3999 (not b!170820) (not b!170806) (not bm!17383) (not b!170834) b_and!10641 (not mapNonEmpty!6794))
(check-sat b_and!10641 (not b_next!4227))
