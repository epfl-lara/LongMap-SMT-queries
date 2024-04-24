; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36022 () Bool)

(assert start!36022)

(declare-fun b!361811 () Bool)

(declare-fun res!201313 () Bool)

(declare-fun e!221594 () Bool)

(assert (=> b!361811 (=> (not res!201313) (not e!221594))))

(declare-datatypes ((array!20356 0))(
  ( (array!20357 (arr!9663 (Array (_ BitVec 32) (_ BitVec 64))) (size!10015 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20356)

(declare-datatypes ((List!5430 0))(
  ( (Nil!5427) (Cons!5426 (h!6282 (_ BitVec 64)) (t!10572 List!5430)) )
))
(declare-fun arrayNoDuplicates!0 (array!20356 (_ BitVec 32) List!5430) Bool)

(assert (=> b!361811 (= res!201313 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5427))))

(declare-fun b!361812 () Bool)

(declare-fun res!201314 () Bool)

(assert (=> b!361812 (=> (not res!201314) (not e!221594))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12187 0))(
  ( (V!12188 (val!4248 Int)) )
))
(declare-datatypes ((ValueCell!3860 0))(
  ( (ValueCellFull!3860 (v!6444 V!12187)) (EmptyCell!3860) )
))
(declare-datatypes ((array!20358 0))(
  ( (array!20359 (arr!9664 (Array (_ BitVec 32) ValueCell!3860)) (size!10016 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20358)

(assert (=> b!361812 (= res!201314 (and (= (size!10016 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10015 _keys!1541) (size!10016 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361813 () Bool)

(declare-fun res!201312 () Bool)

(assert (=> b!361813 (=> (not res!201312) (not e!221594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20356 (_ BitVec 32)) Bool)

(assert (=> b!361813 (= res!201312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun mapNonEmpty!14142 () Bool)

(declare-fun mapRes!14142 () Bool)

(declare-fun tp!28218 () Bool)

(declare-fun e!221596 () Bool)

(assert (=> mapNonEmpty!14142 (= mapRes!14142 (and tp!28218 e!221596))))

(declare-fun mapKey!14142 () (_ BitVec 32))

(declare-fun mapValue!14142 () ValueCell!3860)

(declare-fun mapRest!14142 () (Array (_ BitVec 32) ValueCell!3860))

(assert (=> mapNonEmpty!14142 (= (arr!9664 _values!1277) (store mapRest!14142 mapKey!14142 mapValue!14142))))

(declare-fun b!361814 () Bool)

(declare-fun res!201310 () Bool)

(assert (=> b!361814 (=> (not res!201310) (not e!221594))))

(declare-fun from!1924 () (_ BitVec 32))

(assert (=> b!361814 (= res!201310 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10015 _keys!1541))))))

(declare-fun b!361815 () Bool)

(declare-fun e!221597 () Bool)

(declare-fun tp_is_empty!8407 () Bool)

(assert (=> b!361815 (= e!221597 tp_is_empty!8407)))

(declare-fun b!361816 () Bool)

(declare-fun e!221595 () Bool)

(assert (=> b!361816 (= e!221595 (and e!221597 mapRes!14142))))

(declare-fun condMapEmpty!14142 () Bool)

(declare-fun mapDefault!14142 () ValueCell!3860)

(assert (=> b!361816 (= condMapEmpty!14142 (= (arr!9664 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3860)) mapDefault!14142)))))

(declare-fun res!201311 () Bool)

(assert (=> start!36022 (=> (not res!201311) (not e!221594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36022 (= res!201311 (validMask!0 mask!1943))))

(assert (=> start!36022 e!221594))

(assert (=> start!36022 true))

(declare-fun array_inv!7140 (array!20356) Bool)

(assert (=> start!36022 (array_inv!7140 _keys!1541)))

(declare-fun array_inv!7141 (array!20358) Bool)

(assert (=> start!36022 (and (array_inv!7141 _values!1277) e!221595)))

(declare-fun b!361817 () Bool)

(declare-fun k0!1134 () (_ BitVec 64))

(assert (=> b!361817 (= e!221594 (and (not (= (select (arr!9663 _keys!1541) from!1924) k0!1134)) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1924) (size!10015 _keys!1541)) (bvsge (size!10015 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361818 () Bool)

(declare-fun res!201309 () Bool)

(assert (=> b!361818 (=> (not res!201309) (not e!221594))))

(declare-fun arrayContainsKey!0 (array!20356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361818 (= res!201309 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun mapIsEmpty!14142 () Bool)

(assert (=> mapIsEmpty!14142 mapRes!14142))

(declare-fun b!361819 () Bool)

(assert (=> b!361819 (= e!221596 tp_is_empty!8407)))

(assert (= (and start!36022 res!201311) b!361812))

(assert (= (and b!361812 res!201314) b!361813))

(assert (= (and b!361813 res!201312) b!361811))

(assert (= (and b!361811 res!201313) b!361814))

(assert (= (and b!361814 res!201310) b!361818))

(assert (= (and b!361818 res!201309) b!361817))

(assert (= (and b!361816 condMapEmpty!14142) mapIsEmpty!14142))

(assert (= (and b!361816 (not condMapEmpty!14142)) mapNonEmpty!14142))

(get-info :version)

(assert (= (and mapNonEmpty!14142 ((_ is ValueCellFull!3860) mapValue!14142)) b!361819))

(assert (= (and b!361816 ((_ is ValueCellFull!3860) mapDefault!14142)) b!361815))

(assert (= start!36022 b!361816))

(declare-fun m!358739 () Bool)

(assert (=> b!361811 m!358739))

(declare-fun m!358741 () Bool)

(assert (=> b!361818 m!358741))

(declare-fun m!358743 () Bool)

(assert (=> b!361813 m!358743))

(declare-fun m!358745 () Bool)

(assert (=> b!361817 m!358745))

(declare-fun m!358747 () Bool)

(assert (=> mapNonEmpty!14142 m!358747))

(declare-fun m!358749 () Bool)

(assert (=> start!36022 m!358749))

(declare-fun m!358751 () Bool)

(assert (=> start!36022 m!358751))

(declare-fun m!358753 () Bool)

(assert (=> start!36022 m!358753))

(check-sat (not mapNonEmpty!14142) (not b!361813) (not b!361811) (not start!36022) tp_is_empty!8407 (not b!361818))
(check-sat)
(get-model)

(declare-fun d!71997 () Bool)

(assert (=> d!71997 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!36022 d!71997))

(declare-fun d!71999 () Bool)

(assert (=> d!71999 (= (array_inv!7140 _keys!1541) (bvsge (size!10015 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!36022 d!71999))

(declare-fun d!72001 () Bool)

(assert (=> d!72001 (= (array_inv!7141 _values!1277) (bvsge (size!10016 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!36022 d!72001))

(declare-fun d!72003 () Bool)

(declare-fun res!201355 () Bool)

(declare-fun e!221632 () Bool)

(assert (=> d!72003 (=> res!201355 e!221632)))

(assert (=> d!72003 (= res!201355 (= (select (arr!9663 _keys!1541) from!1924) k0!1134))))

(assert (=> d!72003 (= (arrayContainsKey!0 _keys!1541 k0!1134 from!1924) e!221632)))

(declare-fun b!361878 () Bool)

(declare-fun e!221633 () Bool)

(assert (=> b!361878 (= e!221632 e!221633)))

(declare-fun res!201356 () Bool)

(assert (=> b!361878 (=> (not res!201356) (not e!221633))))

(assert (=> b!361878 (= res!201356 (bvslt (bvadd from!1924 #b00000000000000000000000000000001) (size!10015 _keys!1541)))))

(declare-fun b!361879 () Bool)

(assert (=> b!361879 (= e!221633 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!72003 (not res!201355)) b!361878))

(assert (= (and b!361878 res!201356) b!361879))

(assert (=> d!72003 m!358745))

(declare-fun m!358787 () Bool)

(assert (=> b!361879 m!358787))

(assert (=> b!361818 d!72003))

(declare-fun b!361888 () Bool)

(declare-fun e!221641 () Bool)

(declare-fun e!221640 () Bool)

(assert (=> b!361888 (= e!221641 e!221640)))

(declare-fun c!53717 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361888 (= c!53717 (validKeyInArray!0 (select (arr!9663 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!72005 () Bool)

(declare-fun res!201362 () Bool)

(assert (=> d!72005 (=> res!201362 e!221641)))

(assert (=> d!72005 (= res!201362 (bvsge #b00000000000000000000000000000000 (size!10015 _keys!1541)))))

(assert (=> d!72005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221641)))

(declare-fun b!361889 () Bool)

(declare-fun e!221642 () Bool)

(declare-fun call!27179 () Bool)

(assert (=> b!361889 (= e!221642 call!27179)))

(declare-fun b!361890 () Bool)

(assert (=> b!361890 (= e!221640 call!27179)))

(declare-fun b!361891 () Bool)

(assert (=> b!361891 (= e!221640 e!221642)))

(declare-fun lt!166620 () (_ BitVec 64))

(assert (=> b!361891 (= lt!166620 (select (arr!9663 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11109 0))(
  ( (Unit!11110) )
))
(declare-fun lt!166618 () Unit!11109)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20356 (_ BitVec 64) (_ BitVec 32)) Unit!11109)

(assert (=> b!361891 (= lt!166618 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166620 #b00000000000000000000000000000000))))

(assert (=> b!361891 (arrayContainsKey!0 _keys!1541 lt!166620 #b00000000000000000000000000000000)))

(declare-fun lt!166619 () Unit!11109)

(assert (=> b!361891 (= lt!166619 lt!166618)))

(declare-fun res!201361 () Bool)

(declare-datatypes ((SeekEntryResult!3447 0))(
  ( (MissingZero!3447 (index!15967 (_ BitVec 32))) (Found!3447 (index!15968 (_ BitVec 32))) (Intermediate!3447 (undefined!4259 Bool) (index!15969 (_ BitVec 32)) (x!36014 (_ BitVec 32))) (Undefined!3447) (MissingVacant!3447 (index!15970 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20356 (_ BitVec 32)) SeekEntryResult!3447)

(assert (=> b!361891 (= res!201361 (= (seekEntryOrOpen!0 (select (arr!9663 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3447 #b00000000000000000000000000000000)))))

(assert (=> b!361891 (=> (not res!201361) (not e!221642))))

(declare-fun bm!27176 () Bool)

(assert (=> bm!27176 (= call!27179 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(assert (= (and d!72005 (not res!201362)) b!361888))

(assert (= (and b!361888 c!53717) b!361891))

(assert (= (and b!361888 (not c!53717)) b!361890))

(assert (= (and b!361891 res!201361) b!361889))

(assert (= (or b!361889 b!361890) bm!27176))

(declare-fun m!358789 () Bool)

(assert (=> b!361888 m!358789))

(assert (=> b!361888 m!358789))

(declare-fun m!358791 () Bool)

(assert (=> b!361888 m!358791))

(assert (=> b!361891 m!358789))

(declare-fun m!358793 () Bool)

(assert (=> b!361891 m!358793))

(declare-fun m!358795 () Bool)

(assert (=> b!361891 m!358795))

(assert (=> b!361891 m!358789))

(declare-fun m!358797 () Bool)

(assert (=> b!361891 m!358797))

(declare-fun m!358799 () Bool)

(assert (=> bm!27176 m!358799))

(assert (=> b!361813 d!72005))

(declare-fun d!72007 () Bool)

(declare-fun res!201369 () Bool)

(declare-fun e!221651 () Bool)

(assert (=> d!72007 (=> res!201369 e!221651)))

(assert (=> d!72007 (= res!201369 (bvsge #b00000000000000000000000000000000 (size!10015 _keys!1541)))))

(assert (=> d!72007 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5427) e!221651)))

(declare-fun b!361902 () Bool)

(declare-fun e!221652 () Bool)

(declare-fun contains!2410 (List!5430 (_ BitVec 64)) Bool)

(assert (=> b!361902 (= e!221652 (contains!2410 Nil!5427 (select (arr!9663 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361903 () Bool)

(declare-fun e!221653 () Bool)

(declare-fun e!221654 () Bool)

(assert (=> b!361903 (= e!221653 e!221654)))

(declare-fun c!53720 () Bool)

(assert (=> b!361903 (= c!53720 (validKeyInArray!0 (select (arr!9663 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27179 () Bool)

(declare-fun call!27182 () Bool)

(assert (=> bm!27179 (= call!27182 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53720 (Cons!5426 (select (arr!9663 _keys!1541) #b00000000000000000000000000000000) Nil!5427) Nil!5427)))))

(declare-fun b!361904 () Bool)

(assert (=> b!361904 (= e!221651 e!221653)))

(declare-fun res!201371 () Bool)

(assert (=> b!361904 (=> (not res!201371) (not e!221653))))

(assert (=> b!361904 (= res!201371 (not e!221652))))

(declare-fun res!201370 () Bool)

(assert (=> b!361904 (=> (not res!201370) (not e!221652))))

(assert (=> b!361904 (= res!201370 (validKeyInArray!0 (select (arr!9663 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361905 () Bool)

(assert (=> b!361905 (= e!221654 call!27182)))

(declare-fun b!361906 () Bool)

(assert (=> b!361906 (= e!221654 call!27182)))

(assert (= (and d!72007 (not res!201369)) b!361904))

(assert (= (and b!361904 res!201370) b!361902))

(assert (= (and b!361904 res!201371) b!361903))

(assert (= (and b!361903 c!53720) b!361906))

(assert (= (and b!361903 (not c!53720)) b!361905))

(assert (= (or b!361906 b!361905) bm!27179))

(assert (=> b!361902 m!358789))

(assert (=> b!361902 m!358789))

(declare-fun m!358801 () Bool)

(assert (=> b!361902 m!358801))

(assert (=> b!361903 m!358789))

(assert (=> b!361903 m!358789))

(assert (=> b!361903 m!358791))

(assert (=> bm!27179 m!358789))

(declare-fun m!358803 () Bool)

(assert (=> bm!27179 m!358803))

(assert (=> b!361904 m!358789))

(assert (=> b!361904 m!358789))

(assert (=> b!361904 m!358791))

(assert (=> b!361811 d!72007))

(declare-fun condMapEmpty!14151 () Bool)

(declare-fun mapDefault!14151 () ValueCell!3860)

(assert (=> mapNonEmpty!14142 (= condMapEmpty!14151 (= mapRest!14142 ((as const (Array (_ BitVec 32) ValueCell!3860)) mapDefault!14151)))))

(declare-fun e!221660 () Bool)

(declare-fun mapRes!14151 () Bool)

(assert (=> mapNonEmpty!14142 (= tp!28218 (and e!221660 mapRes!14151))))

(declare-fun b!361913 () Bool)

(declare-fun e!221659 () Bool)

(assert (=> b!361913 (= e!221659 tp_is_empty!8407)))

(declare-fun mapNonEmpty!14151 () Bool)

(declare-fun tp!28227 () Bool)

(assert (=> mapNonEmpty!14151 (= mapRes!14151 (and tp!28227 e!221659))))

(declare-fun mapKey!14151 () (_ BitVec 32))

(declare-fun mapValue!14151 () ValueCell!3860)

(declare-fun mapRest!14151 () (Array (_ BitVec 32) ValueCell!3860))

(assert (=> mapNonEmpty!14151 (= mapRest!14142 (store mapRest!14151 mapKey!14151 mapValue!14151))))

(declare-fun b!361914 () Bool)

(assert (=> b!361914 (= e!221660 tp_is_empty!8407)))

(declare-fun mapIsEmpty!14151 () Bool)

(assert (=> mapIsEmpty!14151 mapRes!14151))

(assert (= (and mapNonEmpty!14142 condMapEmpty!14151) mapIsEmpty!14151))

(assert (= (and mapNonEmpty!14142 (not condMapEmpty!14151)) mapNonEmpty!14151))

(assert (= (and mapNonEmpty!14151 ((_ is ValueCellFull!3860) mapValue!14151)) b!361913))

(assert (= (and mapNonEmpty!14142 ((_ is ValueCellFull!3860) mapDefault!14151)) b!361914))

(declare-fun m!358805 () Bool)

(assert (=> mapNonEmpty!14151 m!358805))

(check-sat (not bm!27176) (not mapNonEmpty!14151) (not b!361904) (not b!361879) (not b!361888) (not b!361903) tp_is_empty!8407 (not bm!27179) (not b!361891) (not b!361902))
(check-sat)
