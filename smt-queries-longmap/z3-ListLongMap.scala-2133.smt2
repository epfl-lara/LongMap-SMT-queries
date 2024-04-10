; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36062 () Bool)

(assert start!36062)

(declare-fun b!362072 () Bool)

(declare-fun res!201443 () Bool)

(declare-fun e!221768 () Bool)

(assert (=> b!362072 (=> (not res!201443) (not e!221768))))

(declare-datatypes ((array!20399 0))(
  ( (array!20400 (arr!9684 (Array (_ BitVec 32) (_ BitVec 64))) (size!10036 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20399)

(declare-datatypes ((List!5522 0))(
  ( (Nil!5519) (Cons!5518 (h!6374 (_ BitVec 64)) (t!10672 List!5522)) )
))
(declare-fun arrayNoDuplicates!0 (array!20399 (_ BitVec 32) List!5522) Bool)

(assert (=> b!362072 (= res!201443 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5519))))

(declare-fun mapNonEmpty!14166 () Bool)

(declare-fun mapRes!14166 () Bool)

(declare-fun tp!28242 () Bool)

(declare-fun e!221766 () Bool)

(assert (=> mapNonEmpty!14166 (= mapRes!14166 (and tp!28242 e!221766))))

(declare-datatypes ((V!12205 0))(
  ( (V!12206 (val!4255 Int)) )
))
(declare-datatypes ((ValueCell!3867 0))(
  ( (ValueCellFull!3867 (v!6450 V!12205)) (EmptyCell!3867) )
))
(declare-datatypes ((array!20401 0))(
  ( (array!20402 (arr!9685 (Array (_ BitVec 32) ValueCell!3867)) (size!10037 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20401)

(declare-fun mapRest!14166 () (Array (_ BitVec 32) ValueCell!3867))

(declare-fun mapKey!14166 () (_ BitVec 32))

(declare-fun mapValue!14166 () ValueCell!3867)

(assert (=> mapNonEmpty!14166 (= (arr!9685 _values!1277) (store mapRest!14166 mapKey!14166 mapValue!14166))))

(declare-fun b!362073 () Bool)

(declare-fun res!201437 () Bool)

(assert (=> b!362073 (=> (not res!201437) (not e!221768))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(assert (=> b!362073 (= res!201437 (and (= (size!10037 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10036 _keys!1541) (size!10037 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-fun b!362074 () Bool)

(declare-fun k0!1134 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!362074 (= e!221768 (not (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd #b00000000000000000000000000000001 from!1924))))))

(declare-fun b!362076 () Bool)

(declare-fun res!201441 () Bool)

(assert (=> b!362076 (=> (not res!201441) (not e!221768))))

(assert (=> b!362076 (= res!201441 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10036 _keys!1541))))))

(declare-fun b!362077 () Bool)

(declare-fun e!221765 () Bool)

(declare-fun e!221769 () Bool)

(assert (=> b!362077 (= e!221765 (and e!221769 mapRes!14166))))

(declare-fun condMapEmpty!14166 () Bool)

(declare-fun mapDefault!14166 () ValueCell!3867)

(assert (=> b!362077 (= condMapEmpty!14166 (= (arr!9685 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3867)) mapDefault!14166)))))

(declare-fun b!362078 () Bool)

(declare-fun tp_is_empty!8421 () Bool)

(assert (=> b!362078 (= e!221769 tp_is_empty!8421)))

(declare-fun b!362079 () Bool)

(declare-fun res!201438 () Bool)

(assert (=> b!362079 (=> (not res!201438) (not e!221768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20399 (_ BitVec 32)) Bool)

(assert (=> b!362079 (= res!201438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!362080 () Bool)

(declare-fun res!201440 () Bool)

(assert (=> b!362080 (=> (not res!201440) (not e!221768))))

(assert (=> b!362080 (= res!201440 (not (= (select (arr!9684 _keys!1541) from!1924) k0!1134)))))

(declare-fun mapIsEmpty!14166 () Bool)

(assert (=> mapIsEmpty!14166 mapRes!14166))

(declare-fun b!362081 () Bool)

(assert (=> b!362081 (= e!221766 tp_is_empty!8421)))

(declare-fun res!201442 () Bool)

(assert (=> start!36062 (=> (not res!201442) (not e!221768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36062 (= res!201442 (validMask!0 mask!1943))))

(assert (=> start!36062 e!221768))

(assert (=> start!36062 true))

(declare-fun array_inv!7126 (array!20399) Bool)

(assert (=> start!36062 (array_inv!7126 _keys!1541)))

(declare-fun array_inv!7127 (array!20401) Bool)

(assert (=> start!36062 (and (array_inv!7127 _values!1277) e!221765)))

(declare-fun b!362075 () Bool)

(declare-fun res!201439 () Bool)

(assert (=> b!362075 (=> (not res!201439) (not e!221768))))

(assert (=> b!362075 (= res!201439 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(assert (= (and start!36062 res!201442) b!362073))

(assert (= (and b!362073 res!201437) b!362079))

(assert (= (and b!362079 res!201438) b!362072))

(assert (= (and b!362072 res!201443) b!362076))

(assert (= (and b!362076 res!201441) b!362075))

(assert (= (and b!362075 res!201439) b!362080))

(assert (= (and b!362080 res!201440) b!362074))

(assert (= (and b!362077 condMapEmpty!14166) mapIsEmpty!14166))

(assert (= (and b!362077 (not condMapEmpty!14166)) mapNonEmpty!14166))

(get-info :version)

(assert (= (and mapNonEmpty!14166 ((_ is ValueCellFull!3867) mapValue!14166)) b!362081))

(assert (= (and b!362077 ((_ is ValueCellFull!3867) mapDefault!14166)) b!362078))

(assert (= start!36062 b!362077))

(declare-fun m!358637 () Bool)

(assert (=> mapNonEmpty!14166 m!358637))

(declare-fun m!358639 () Bool)

(assert (=> start!36062 m!358639))

(declare-fun m!358641 () Bool)

(assert (=> start!36062 m!358641))

(declare-fun m!358643 () Bool)

(assert (=> start!36062 m!358643))

(declare-fun m!358645 () Bool)

(assert (=> b!362074 m!358645))

(declare-fun m!358647 () Bool)

(assert (=> b!362075 m!358647))

(declare-fun m!358649 () Bool)

(assert (=> b!362080 m!358649))

(declare-fun m!358651 () Bool)

(assert (=> b!362072 m!358651))

(declare-fun m!358653 () Bool)

(assert (=> b!362079 m!358653))

(check-sat (not b!362072) (not b!362079) (not b!362074) (not mapNonEmpty!14166) (not start!36062) tp_is_empty!8421 (not b!362075))
(check-sat)
(get-model)

(declare-fun d!71985 () Bool)

(assert (=> d!71985 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!36062 d!71985))

(declare-fun d!71987 () Bool)

(assert (=> d!71987 (= (array_inv!7126 _keys!1541) (bvsge (size!10036 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!36062 d!71987))

(declare-fun d!71989 () Bool)

(assert (=> d!71989 (= (array_inv!7127 _values!1277) (bvsge (size!10037 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!36062 d!71989))

(declare-fun b!362121 () Bool)

(declare-fun e!221792 () Bool)

(declare-fun call!27199 () Bool)

(assert (=> b!362121 (= e!221792 call!27199)))

(declare-fun b!362122 () Bool)

(declare-fun e!221791 () Bool)

(assert (=> b!362122 (= e!221791 call!27199)))

(declare-fun b!362123 () Bool)

(declare-fun e!221793 () Bool)

(assert (=> b!362123 (= e!221793 e!221791)))

(declare-fun c!53748 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362123 (= c!53748 (validKeyInArray!0 (select (arr!9684 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27196 () Bool)

(assert (=> bm!27196 (= call!27199 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!362120 () Bool)

(assert (=> b!362120 (= e!221791 e!221792)))

(declare-fun lt!166618 () (_ BitVec 64))

(assert (=> b!362120 (= lt!166618 (select (arr!9684 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11122 0))(
  ( (Unit!11123) )
))
(declare-fun lt!166619 () Unit!11122)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20399 (_ BitVec 64) (_ BitVec 32)) Unit!11122)

(assert (=> b!362120 (= lt!166619 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166618 #b00000000000000000000000000000000))))

(assert (=> b!362120 (arrayContainsKey!0 _keys!1541 lt!166618 #b00000000000000000000000000000000)))

(declare-fun lt!166620 () Unit!11122)

(assert (=> b!362120 (= lt!166620 lt!166619)))

(declare-fun res!201470 () Bool)

(declare-datatypes ((SeekEntryResult!3499 0))(
  ( (MissingZero!3499 (index!16175 (_ BitVec 32))) (Found!3499 (index!16176 (_ BitVec 32))) (Intermediate!3499 (undefined!4311 Bool) (index!16177 (_ BitVec 32)) (x!36087 (_ BitVec 32))) (Undefined!3499) (MissingVacant!3499 (index!16178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20399 (_ BitVec 32)) SeekEntryResult!3499)

(assert (=> b!362120 (= res!201470 (= (seekEntryOrOpen!0 (select (arr!9684 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3499 #b00000000000000000000000000000000)))))

(assert (=> b!362120 (=> (not res!201470) (not e!221792))))

(declare-fun d!71991 () Bool)

(declare-fun res!201469 () Bool)

(assert (=> d!71991 (=> res!201469 e!221793)))

(assert (=> d!71991 (= res!201469 (bvsge #b00000000000000000000000000000000 (size!10036 _keys!1541)))))

(assert (=> d!71991 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221793)))

(assert (= (and d!71991 (not res!201469)) b!362123))

(assert (= (and b!362123 c!53748) b!362120))

(assert (= (and b!362123 (not c!53748)) b!362122))

(assert (= (and b!362120 res!201470) b!362121))

(assert (= (or b!362121 b!362122) bm!27196))

(declare-fun m!358673 () Bool)

(assert (=> b!362123 m!358673))

(assert (=> b!362123 m!358673))

(declare-fun m!358675 () Bool)

(assert (=> b!362123 m!358675))

(declare-fun m!358677 () Bool)

(assert (=> bm!27196 m!358677))

(assert (=> b!362120 m!358673))

(declare-fun m!358679 () Bool)

(assert (=> b!362120 m!358679))

(declare-fun m!358681 () Bool)

(assert (=> b!362120 m!358681))

(assert (=> b!362120 m!358673))

(declare-fun m!358683 () Bool)

(assert (=> b!362120 m!358683))

(assert (=> b!362079 d!71991))

(declare-fun d!71993 () Bool)

(declare-fun res!201475 () Bool)

(declare-fun e!221798 () Bool)

(assert (=> d!71993 (=> res!201475 e!221798)))

(assert (=> d!71993 (= res!201475 (= (select (arr!9684 _keys!1541) (bvadd #b00000000000000000000000000000001 from!1924)) k0!1134))))

(assert (=> d!71993 (= (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd #b00000000000000000000000000000001 from!1924)) e!221798)))

(declare-fun b!362128 () Bool)

(declare-fun e!221799 () Bool)

(assert (=> b!362128 (= e!221798 e!221799)))

(declare-fun res!201476 () Bool)

(assert (=> b!362128 (=> (not res!201476) (not e!221799))))

(assert (=> b!362128 (= res!201476 (bvslt (bvadd #b00000000000000000000000000000001 from!1924 #b00000000000000000000000000000001) (size!10036 _keys!1541)))))

(declare-fun b!362129 () Bool)

(assert (=> b!362129 (= e!221799 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd #b00000000000000000000000000000001 from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!71993 (not res!201475)) b!362128))

(assert (= (and b!362128 res!201476) b!362129))

(declare-fun m!358685 () Bool)

(assert (=> d!71993 m!358685))

(declare-fun m!358687 () Bool)

(assert (=> b!362129 m!358687))

(assert (=> b!362074 d!71993))

(declare-fun d!71995 () Bool)

(declare-fun res!201477 () Bool)

(declare-fun e!221800 () Bool)

(assert (=> d!71995 (=> res!201477 e!221800)))

(assert (=> d!71995 (= res!201477 (= (select (arr!9684 _keys!1541) from!1924) k0!1134))))

(assert (=> d!71995 (= (arrayContainsKey!0 _keys!1541 k0!1134 from!1924) e!221800)))

(declare-fun b!362130 () Bool)

(declare-fun e!221801 () Bool)

(assert (=> b!362130 (= e!221800 e!221801)))

(declare-fun res!201478 () Bool)

(assert (=> b!362130 (=> (not res!201478) (not e!221801))))

(assert (=> b!362130 (= res!201478 (bvslt (bvadd from!1924 #b00000000000000000000000000000001) (size!10036 _keys!1541)))))

(declare-fun b!362131 () Bool)

(assert (=> b!362131 (= e!221801 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!71995 (not res!201477)) b!362130))

(assert (= (and b!362130 res!201478) b!362131))

(assert (=> d!71995 m!358649))

(declare-fun m!358689 () Bool)

(assert (=> b!362131 m!358689))

(assert (=> b!362075 d!71995))

(declare-fun b!362142 () Bool)

(declare-fun e!221810 () Bool)

(declare-fun e!221813 () Bool)

(assert (=> b!362142 (= e!221810 e!221813)))

(declare-fun res!201486 () Bool)

(assert (=> b!362142 (=> (not res!201486) (not e!221813))))

(declare-fun e!221811 () Bool)

(assert (=> b!362142 (= res!201486 (not e!221811))))

(declare-fun res!201485 () Bool)

(assert (=> b!362142 (=> (not res!201485) (not e!221811))))

(assert (=> b!362142 (= res!201485 (validKeyInArray!0 (select (arr!9684 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!362143 () Bool)

(declare-fun e!221812 () Bool)

(assert (=> b!362143 (= e!221813 e!221812)))

(declare-fun c!53751 () Bool)

(assert (=> b!362143 (= c!53751 (validKeyInArray!0 (select (arr!9684 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!362144 () Bool)

(declare-fun call!27202 () Bool)

(assert (=> b!362144 (= e!221812 call!27202)))

(declare-fun b!362145 () Bool)

(assert (=> b!362145 (= e!221812 call!27202)))

(declare-fun d!71997 () Bool)

(declare-fun res!201487 () Bool)

(assert (=> d!71997 (=> res!201487 e!221810)))

(assert (=> d!71997 (= res!201487 (bvsge #b00000000000000000000000000000000 (size!10036 _keys!1541)))))

(assert (=> d!71997 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5519) e!221810)))

(declare-fun b!362146 () Bool)

(declare-fun contains!2430 (List!5522 (_ BitVec 64)) Bool)

(assert (=> b!362146 (= e!221811 (contains!2430 Nil!5519 (select (arr!9684 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27199 () Bool)

(assert (=> bm!27199 (= call!27202 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53751 (Cons!5518 (select (arr!9684 _keys!1541) #b00000000000000000000000000000000) Nil!5519) Nil!5519)))))

(assert (= (and d!71997 (not res!201487)) b!362142))

(assert (= (and b!362142 res!201485) b!362146))

(assert (= (and b!362142 res!201486) b!362143))

(assert (= (and b!362143 c!53751) b!362144))

(assert (= (and b!362143 (not c!53751)) b!362145))

(assert (= (or b!362144 b!362145) bm!27199))

(assert (=> b!362142 m!358673))

(assert (=> b!362142 m!358673))

(assert (=> b!362142 m!358675))

(assert (=> b!362143 m!358673))

(assert (=> b!362143 m!358673))

(assert (=> b!362143 m!358675))

(assert (=> b!362146 m!358673))

(assert (=> b!362146 m!358673))

(declare-fun m!358691 () Bool)

(assert (=> b!362146 m!358691))

(assert (=> bm!27199 m!358673))

(declare-fun m!358693 () Bool)

(assert (=> bm!27199 m!358693))

(assert (=> b!362072 d!71997))

(declare-fun b!362154 () Bool)

(declare-fun e!221819 () Bool)

(assert (=> b!362154 (= e!221819 tp_is_empty!8421)))

(declare-fun condMapEmpty!14172 () Bool)

(declare-fun mapDefault!14172 () ValueCell!3867)

(assert (=> mapNonEmpty!14166 (= condMapEmpty!14172 (= mapRest!14166 ((as const (Array (_ BitVec 32) ValueCell!3867)) mapDefault!14172)))))

(declare-fun mapRes!14172 () Bool)

(assert (=> mapNonEmpty!14166 (= tp!28242 (and e!221819 mapRes!14172))))

(declare-fun mapIsEmpty!14172 () Bool)

(assert (=> mapIsEmpty!14172 mapRes!14172))

(declare-fun b!362153 () Bool)

(declare-fun e!221818 () Bool)

(assert (=> b!362153 (= e!221818 tp_is_empty!8421)))

(declare-fun mapNonEmpty!14172 () Bool)

(declare-fun tp!28248 () Bool)

(assert (=> mapNonEmpty!14172 (= mapRes!14172 (and tp!28248 e!221818))))

(declare-fun mapRest!14172 () (Array (_ BitVec 32) ValueCell!3867))

(declare-fun mapKey!14172 () (_ BitVec 32))

(declare-fun mapValue!14172 () ValueCell!3867)

(assert (=> mapNonEmpty!14172 (= mapRest!14166 (store mapRest!14172 mapKey!14172 mapValue!14172))))

(assert (= (and mapNonEmpty!14166 condMapEmpty!14172) mapIsEmpty!14172))

(assert (= (and mapNonEmpty!14166 (not condMapEmpty!14172)) mapNonEmpty!14172))

(assert (= (and mapNonEmpty!14172 ((_ is ValueCellFull!3867) mapValue!14172)) b!362153))

(assert (= (and mapNonEmpty!14166 ((_ is ValueCellFull!3867) mapDefault!14172)) b!362154))

(declare-fun m!358695 () Bool)

(assert (=> mapNonEmpty!14172 m!358695))

(check-sat (not b!362142) (not b!362143) (not bm!27199) (not b!362146) (not b!362120) tp_is_empty!8421 (not b!362123) (not b!362131) (not mapNonEmpty!14172) (not bm!27196) (not b!362129))
(check-sat)
