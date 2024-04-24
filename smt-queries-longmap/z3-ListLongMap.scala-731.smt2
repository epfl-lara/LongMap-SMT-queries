; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16992 () Bool)

(assert start!16992)

(declare-fun b!170789 () Bool)

(declare-fun b_free!4225 () Bool)

(declare-fun b_next!4225 () Bool)

(assert (=> b!170789 (= b_free!4225 (not b_next!4225))))

(declare-fun tp!15301 () Bool)

(declare-fun b_and!10653 () Bool)

(assert (=> b!170789 (= tp!15301 b_and!10653)))

(declare-fun b!170784 () Bool)

(declare-fun res!81185 () Bool)

(declare-fun e!112725 () Bool)

(assert (=> b!170784 (=> (not res!81185) (not e!112725))))

(declare-datatypes ((V!4977 0))(
  ( (V!4978 (val!2043 Int)) )
))
(declare-datatypes ((ValueCell!1655 0))(
  ( (ValueCellFull!1655 (v!3909 V!4977)) (EmptyCell!1655) )
))
(declare-datatypes ((array!7091 0))(
  ( (array!7092 (arr!3374 (Array (_ BitVec 32) (_ BitVec 64))) (size!3667 (_ BitVec 32))) )
))
(declare-datatypes ((array!7093 0))(
  ( (array!7094 (arr!3375 (Array (_ BitVec 32) ValueCell!1655)) (size!3668 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2218 0))(
  ( (LongMapFixedSize!2219 (defaultEntry!3551 Int) (mask!8375 (_ BitVec 32)) (extraKeys!3292 (_ BitVec 32)) (zeroValue!3394 V!4977) (minValue!3394 V!4977) (_size!1158 (_ BitVec 32)) (_keys!5382 array!7091) (_values!3534 array!7093) (_vacant!1158 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2218)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170784 (= res!81185 (validMask!0 (mask!8375 thiss!1248)))))

(declare-fun b!170785 () Bool)

(declare-fun e!112726 () Bool)

(declare-fun tp_is_empty!3997 () Bool)

(assert (=> b!170785 (= e!112726 tp_is_empty!3997)))

(declare-fun b!170786 () Bool)

(declare-fun res!81184 () Bool)

(assert (=> b!170786 (=> (not res!81184) (not e!112725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7091 (_ BitVec 32)) Bool)

(assert (=> b!170786 (= res!81184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5382 thiss!1248) (mask!8375 thiss!1248)))))

(declare-fun b!170787 () Bool)

(declare-fun res!81182 () Bool)

(assert (=> b!170787 (=> (not res!81182) (not e!112725))))

(assert (=> b!170787 (= res!81182 (and (= (size!3668 (_values!3534 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8375 thiss!1248))) (= (size!3667 (_keys!5382 thiss!1248)) (size!3668 (_values!3534 thiss!1248))) (bvsge (mask!8375 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3292 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3292 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3292 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!170788 () Bool)

(declare-datatypes ((List!2173 0))(
  ( (Nil!2170) (Cons!2169 (h!2786 (_ BitVec 64)) (t!6967 List!2173)) )
))
(declare-fun arrayNoDuplicates!0 (array!7091 (_ BitVec 32) List!2173) Bool)

(assert (=> b!170788 (= e!112725 (not (arrayNoDuplicates!0 (_keys!5382 thiss!1248) #b00000000000000000000000000000000 Nil!2170)))))

(declare-fun e!112723 () Bool)

(declare-fun e!112727 () Bool)

(declare-fun array_inv!2173 (array!7091) Bool)

(declare-fun array_inv!2174 (array!7093) Bool)

(assert (=> b!170789 (= e!112727 (and tp!15301 tp_is_empty!3997 (array_inv!2173 (_keys!5382 thiss!1248)) (array_inv!2174 (_values!3534 thiss!1248)) e!112723))))

(declare-fun b!170790 () Bool)

(declare-fun e!112724 () Bool)

(assert (=> b!170790 (= e!112724 tp_is_empty!3997)))

(declare-fun b!170791 () Bool)

(declare-fun mapRes!6785 () Bool)

(assert (=> b!170791 (= e!112723 (and e!112724 mapRes!6785))))

(declare-fun condMapEmpty!6785 () Bool)

(declare-fun mapDefault!6785 () ValueCell!1655)

(assert (=> b!170791 (= condMapEmpty!6785 (= (arr!3375 (_values!3534 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1655)) mapDefault!6785)))))

(declare-fun mapNonEmpty!6785 () Bool)

(declare-fun tp!15302 () Bool)

(assert (=> mapNonEmpty!6785 (= mapRes!6785 (and tp!15302 e!112726))))

(declare-fun mapKey!6785 () (_ BitVec 32))

(declare-fun mapValue!6785 () ValueCell!1655)

(declare-fun mapRest!6785 () (Array (_ BitVec 32) ValueCell!1655))

(assert (=> mapNonEmpty!6785 (= (arr!3375 (_values!3534 thiss!1248)) (store mapRest!6785 mapKey!6785 mapValue!6785))))

(declare-fun res!81186 () Bool)

(assert (=> start!16992 (=> (not res!81186) (not e!112725))))

(declare-fun valid!961 (LongMapFixedSize!2218) Bool)

(assert (=> start!16992 (= res!81186 (valid!961 thiss!1248))))

(assert (=> start!16992 e!112725))

(assert (=> start!16992 e!112727))

(assert (=> start!16992 true))

(declare-fun mapIsEmpty!6785 () Bool)

(assert (=> mapIsEmpty!6785 mapRes!6785))

(declare-fun b!170792 () Bool)

(declare-fun res!81183 () Bool)

(assert (=> b!170792 (=> (not res!81183) (not e!112725))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170792 (= res!81183 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!16992 res!81186) b!170792))

(assert (= (and b!170792 res!81183) b!170784))

(assert (= (and b!170784 res!81185) b!170787))

(assert (= (and b!170787 res!81182) b!170786))

(assert (= (and b!170786 res!81184) b!170788))

(assert (= (and b!170791 condMapEmpty!6785) mapIsEmpty!6785))

(assert (= (and b!170791 (not condMapEmpty!6785)) mapNonEmpty!6785))

(get-info :version)

(assert (= (and mapNonEmpty!6785 ((_ is ValueCellFull!1655) mapValue!6785)) b!170785))

(assert (= (and b!170791 ((_ is ValueCellFull!1655) mapDefault!6785)) b!170790))

(assert (= b!170789 b!170791))

(assert (= start!16992 b!170789))

(declare-fun m!199281 () Bool)

(assert (=> b!170786 m!199281))

(declare-fun m!199283 () Bool)

(assert (=> mapNonEmpty!6785 m!199283))

(declare-fun m!199285 () Bool)

(assert (=> b!170784 m!199285))

(declare-fun m!199287 () Bool)

(assert (=> b!170789 m!199287))

(declare-fun m!199289 () Bool)

(assert (=> b!170789 m!199289))

(declare-fun m!199291 () Bool)

(assert (=> start!16992 m!199291))

(declare-fun m!199293 () Bool)

(assert (=> b!170788 m!199293))

(check-sat (not b!170788) (not start!16992) (not b!170789) (not b_next!4225) b_and!10653 tp_is_empty!3997 (not b!170786) (not mapNonEmpty!6785) (not b!170784))
(check-sat b_and!10653 (not b_next!4225))
(get-model)

(declare-fun d!51827 () Bool)

(assert (=> d!51827 (= (array_inv!2173 (_keys!5382 thiss!1248)) (bvsge (size!3667 (_keys!5382 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170789 d!51827))

(declare-fun d!51829 () Bool)

(assert (=> d!51829 (= (array_inv!2174 (_values!3534 thiss!1248)) (bvsge (size!3668 (_values!3534 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170789 d!51829))

(declare-fun d!51831 () Bool)

(assert (=> d!51831 (= (validMask!0 (mask!8375 thiss!1248)) (and (or (= (mask!8375 thiss!1248) #b00000000000000000000000000000111) (= (mask!8375 thiss!1248) #b00000000000000000000000000001111) (= (mask!8375 thiss!1248) #b00000000000000000000000000011111) (= (mask!8375 thiss!1248) #b00000000000000000000000000111111) (= (mask!8375 thiss!1248) #b00000000000000000000000001111111) (= (mask!8375 thiss!1248) #b00000000000000000000000011111111) (= (mask!8375 thiss!1248) #b00000000000000000000000111111111) (= (mask!8375 thiss!1248) #b00000000000000000000001111111111) (= (mask!8375 thiss!1248) #b00000000000000000000011111111111) (= (mask!8375 thiss!1248) #b00000000000000000000111111111111) (= (mask!8375 thiss!1248) #b00000000000000000001111111111111) (= (mask!8375 thiss!1248) #b00000000000000000011111111111111) (= (mask!8375 thiss!1248) #b00000000000000000111111111111111) (= (mask!8375 thiss!1248) #b00000000000000001111111111111111) (= (mask!8375 thiss!1248) #b00000000000000011111111111111111) (= (mask!8375 thiss!1248) #b00000000000000111111111111111111) (= (mask!8375 thiss!1248) #b00000000000001111111111111111111) (= (mask!8375 thiss!1248) #b00000000000011111111111111111111) (= (mask!8375 thiss!1248) #b00000000000111111111111111111111) (= (mask!8375 thiss!1248) #b00000000001111111111111111111111) (= (mask!8375 thiss!1248) #b00000000011111111111111111111111) (= (mask!8375 thiss!1248) #b00000000111111111111111111111111) (= (mask!8375 thiss!1248) #b00000001111111111111111111111111) (= (mask!8375 thiss!1248) #b00000011111111111111111111111111) (= (mask!8375 thiss!1248) #b00000111111111111111111111111111) (= (mask!8375 thiss!1248) #b00001111111111111111111111111111) (= (mask!8375 thiss!1248) #b00011111111111111111111111111111) (= (mask!8375 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8375 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170784 d!51831))

(declare-fun b!170855 () Bool)

(declare-fun e!112772 () Bool)

(declare-fun e!112773 () Bool)

(assert (=> b!170855 (= e!112772 e!112773)))

(declare-fun c!30506 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170855 (= c!30506 (validKeyInArray!0 (select (arr!3374 (_keys!5382 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170856 () Bool)

(declare-fun call!17374 () Bool)

(assert (=> b!170856 (= e!112773 call!17374)))

(declare-fun d!51833 () Bool)

(declare-fun res!81222 () Bool)

(assert (=> d!51833 (=> res!81222 e!112772)))

(assert (=> d!51833 (= res!81222 (bvsge #b00000000000000000000000000000000 (size!3667 (_keys!5382 thiss!1248))))))

(assert (=> d!51833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5382 thiss!1248) (mask!8375 thiss!1248)) e!112772)))

(declare-fun b!170857 () Bool)

(declare-fun e!112771 () Bool)

(assert (=> b!170857 (= e!112773 e!112771)))

(declare-fun lt!85086 () (_ BitVec 64))

(assert (=> b!170857 (= lt!85086 (select (arr!3374 (_keys!5382 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5249 0))(
  ( (Unit!5250) )
))
(declare-fun lt!85084 () Unit!5249)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7091 (_ BitVec 64) (_ BitVec 32)) Unit!5249)

(assert (=> b!170857 (= lt!85084 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5382 thiss!1248) lt!85086 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170857 (arrayContainsKey!0 (_keys!5382 thiss!1248) lt!85086 #b00000000000000000000000000000000)))

(declare-fun lt!85085 () Unit!5249)

(assert (=> b!170857 (= lt!85085 lt!85084)))

(declare-fun res!81221 () Bool)

(declare-datatypes ((SeekEntryResult!527 0))(
  ( (MissingZero!527 (index!4276 (_ BitVec 32))) (Found!527 (index!4277 (_ BitVec 32))) (Intermediate!527 (undefined!1339 Bool) (index!4278 (_ BitVec 32)) (x!18921 (_ BitVec 32))) (Undefined!527) (MissingVacant!527 (index!4279 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7091 (_ BitVec 32)) SeekEntryResult!527)

(assert (=> b!170857 (= res!81221 (= (seekEntryOrOpen!0 (select (arr!3374 (_keys!5382 thiss!1248)) #b00000000000000000000000000000000) (_keys!5382 thiss!1248) (mask!8375 thiss!1248)) (Found!527 #b00000000000000000000000000000000)))))

(assert (=> b!170857 (=> (not res!81221) (not e!112771))))

(declare-fun bm!17371 () Bool)

(assert (=> bm!17371 (= call!17374 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5382 thiss!1248) (mask!8375 thiss!1248)))))

(declare-fun b!170858 () Bool)

(assert (=> b!170858 (= e!112771 call!17374)))

(assert (= (and d!51833 (not res!81222)) b!170855))

(assert (= (and b!170855 c!30506) b!170857))

(assert (= (and b!170855 (not c!30506)) b!170856))

(assert (= (and b!170857 res!81221) b!170858))

(assert (= (or b!170858 b!170856) bm!17371))

(declare-fun m!199323 () Bool)

(assert (=> b!170855 m!199323))

(assert (=> b!170855 m!199323))

(declare-fun m!199325 () Bool)

(assert (=> b!170855 m!199325))

(assert (=> b!170857 m!199323))

(declare-fun m!199327 () Bool)

(assert (=> b!170857 m!199327))

(declare-fun m!199329 () Bool)

(assert (=> b!170857 m!199329))

(assert (=> b!170857 m!199323))

(declare-fun m!199331 () Bool)

(assert (=> b!170857 m!199331))

(declare-fun m!199333 () Bool)

(assert (=> bm!17371 m!199333))

(assert (=> b!170786 d!51833))

(declare-fun d!51835 () Bool)

(declare-fun res!81229 () Bool)

(declare-fun e!112776 () Bool)

(assert (=> d!51835 (=> (not res!81229) (not e!112776))))

(declare-fun simpleValid!134 (LongMapFixedSize!2218) Bool)

(assert (=> d!51835 (= res!81229 (simpleValid!134 thiss!1248))))

(assert (=> d!51835 (= (valid!961 thiss!1248) e!112776)))

(declare-fun b!170865 () Bool)

(declare-fun res!81230 () Bool)

(assert (=> b!170865 (=> (not res!81230) (not e!112776))))

(declare-fun arrayCountValidKeys!0 (array!7091 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170865 (= res!81230 (= (arrayCountValidKeys!0 (_keys!5382 thiss!1248) #b00000000000000000000000000000000 (size!3667 (_keys!5382 thiss!1248))) (_size!1158 thiss!1248)))))

(declare-fun b!170866 () Bool)

(declare-fun res!81231 () Bool)

(assert (=> b!170866 (=> (not res!81231) (not e!112776))))

(assert (=> b!170866 (= res!81231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5382 thiss!1248) (mask!8375 thiss!1248)))))

(declare-fun b!170867 () Bool)

(assert (=> b!170867 (= e!112776 (arrayNoDuplicates!0 (_keys!5382 thiss!1248) #b00000000000000000000000000000000 Nil!2170))))

(assert (= (and d!51835 res!81229) b!170865))

(assert (= (and b!170865 res!81230) b!170866))

(assert (= (and b!170866 res!81231) b!170867))

(declare-fun m!199335 () Bool)

(assert (=> d!51835 m!199335))

(declare-fun m!199337 () Bool)

(assert (=> b!170865 m!199337))

(assert (=> b!170866 m!199281))

(assert (=> b!170867 m!199293))

(assert (=> start!16992 d!51835))

(declare-fun b!170878 () Bool)

(declare-fun e!112785 () Bool)

(declare-fun call!17377 () Bool)

(assert (=> b!170878 (= e!112785 call!17377)))

(declare-fun d!51837 () Bool)

(declare-fun res!81238 () Bool)

(declare-fun e!112787 () Bool)

(assert (=> d!51837 (=> res!81238 e!112787)))

(assert (=> d!51837 (= res!81238 (bvsge #b00000000000000000000000000000000 (size!3667 (_keys!5382 thiss!1248))))))

(assert (=> d!51837 (= (arrayNoDuplicates!0 (_keys!5382 thiss!1248) #b00000000000000000000000000000000 Nil!2170) e!112787)))

(declare-fun b!170879 () Bool)

(declare-fun e!112786 () Bool)

(declare-fun contains!1138 (List!2173 (_ BitVec 64)) Bool)

(assert (=> b!170879 (= e!112786 (contains!1138 Nil!2170 (select (arr!3374 (_keys!5382 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170880 () Bool)

(declare-fun e!112788 () Bool)

(assert (=> b!170880 (= e!112787 e!112788)))

(declare-fun res!81240 () Bool)

(assert (=> b!170880 (=> (not res!81240) (not e!112788))))

(assert (=> b!170880 (= res!81240 (not e!112786))))

(declare-fun res!81239 () Bool)

(assert (=> b!170880 (=> (not res!81239) (not e!112786))))

(assert (=> b!170880 (= res!81239 (validKeyInArray!0 (select (arr!3374 (_keys!5382 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170881 () Bool)

(assert (=> b!170881 (= e!112788 e!112785)))

(declare-fun c!30509 () Bool)

(assert (=> b!170881 (= c!30509 (validKeyInArray!0 (select (arr!3374 (_keys!5382 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17374 () Bool)

(assert (=> bm!17374 (= call!17377 (arrayNoDuplicates!0 (_keys!5382 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30509 (Cons!2169 (select (arr!3374 (_keys!5382 thiss!1248)) #b00000000000000000000000000000000) Nil!2170) Nil!2170)))))

(declare-fun b!170882 () Bool)

(assert (=> b!170882 (= e!112785 call!17377)))

(assert (= (and d!51837 (not res!81238)) b!170880))

(assert (= (and b!170880 res!81239) b!170879))

(assert (= (and b!170880 res!81240) b!170881))

(assert (= (and b!170881 c!30509) b!170878))

(assert (= (and b!170881 (not c!30509)) b!170882))

(assert (= (or b!170878 b!170882) bm!17374))

(assert (=> b!170879 m!199323))

(assert (=> b!170879 m!199323))

(declare-fun m!199339 () Bool)

(assert (=> b!170879 m!199339))

(assert (=> b!170880 m!199323))

(assert (=> b!170880 m!199323))

(assert (=> b!170880 m!199325))

(assert (=> b!170881 m!199323))

(assert (=> b!170881 m!199323))

(assert (=> b!170881 m!199325))

(assert (=> bm!17374 m!199323))

(declare-fun m!199341 () Bool)

(assert (=> bm!17374 m!199341))

(assert (=> b!170788 d!51837))

(declare-fun b!170890 () Bool)

(declare-fun e!112794 () Bool)

(assert (=> b!170890 (= e!112794 tp_is_empty!3997)))

(declare-fun mapNonEmpty!6794 () Bool)

(declare-fun mapRes!6794 () Bool)

(declare-fun tp!15317 () Bool)

(declare-fun e!112793 () Bool)

(assert (=> mapNonEmpty!6794 (= mapRes!6794 (and tp!15317 e!112793))))

(declare-fun mapKey!6794 () (_ BitVec 32))

(declare-fun mapRest!6794 () (Array (_ BitVec 32) ValueCell!1655))

(declare-fun mapValue!6794 () ValueCell!1655)

(assert (=> mapNonEmpty!6794 (= mapRest!6785 (store mapRest!6794 mapKey!6794 mapValue!6794))))

(declare-fun b!170889 () Bool)

(assert (=> b!170889 (= e!112793 tp_is_empty!3997)))

(declare-fun condMapEmpty!6794 () Bool)

(declare-fun mapDefault!6794 () ValueCell!1655)

(assert (=> mapNonEmpty!6785 (= condMapEmpty!6794 (= mapRest!6785 ((as const (Array (_ BitVec 32) ValueCell!1655)) mapDefault!6794)))))

(assert (=> mapNonEmpty!6785 (= tp!15302 (and e!112794 mapRes!6794))))

(declare-fun mapIsEmpty!6794 () Bool)

(assert (=> mapIsEmpty!6794 mapRes!6794))

(assert (= (and mapNonEmpty!6785 condMapEmpty!6794) mapIsEmpty!6794))

(assert (= (and mapNonEmpty!6785 (not condMapEmpty!6794)) mapNonEmpty!6794))

(assert (= (and mapNonEmpty!6794 ((_ is ValueCellFull!1655) mapValue!6794)) b!170889))

(assert (= (and mapNonEmpty!6785 ((_ is ValueCellFull!1655) mapDefault!6794)) b!170890))

(declare-fun m!199343 () Bool)

(assert (=> mapNonEmpty!6794 m!199343))

(check-sat (not b!170879) (not b!170855) (not bm!17371) (not b!170866) (not b!170881) (not b_next!4225) b_and!10653 (not bm!17374) tp_is_empty!3997 (not b!170857) (not b!170880) (not d!51835) (not mapNonEmpty!6794) (not b!170867) (not b!170865))
(check-sat b_and!10653 (not b_next!4225))
