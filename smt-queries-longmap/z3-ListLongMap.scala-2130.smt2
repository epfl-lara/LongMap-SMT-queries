; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36020 () Bool)

(assert start!36020)

(declare-fun b!361769 () Bool)

(declare-fun res!201257 () Bool)

(declare-fun e!221567 () Bool)

(assert (=> b!361769 (=> (not res!201257) (not e!221567))))

(declare-datatypes ((array!20359 0))(
  ( (array!20360 (arr!9666 (Array (_ BitVec 32) (_ BitVec 64))) (size!10018 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20359)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20359 (_ BitVec 32)) Bool)

(assert (=> b!361769 (= res!201257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361770 () Bool)

(declare-fun res!201259 () Bool)

(assert (=> b!361770 (=> (not res!201259) (not e!221567))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-fun k0!1134 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361770 (= res!201259 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun b!361771 () Bool)

(declare-fun e!221568 () Bool)

(declare-fun e!221565 () Bool)

(declare-fun mapRes!14133 () Bool)

(assert (=> b!361771 (= e!221568 (and e!221565 mapRes!14133))))

(declare-fun condMapEmpty!14133 () Bool)

(declare-datatypes ((V!12181 0))(
  ( (V!12182 (val!4246 Int)) )
))
(declare-datatypes ((ValueCell!3858 0))(
  ( (ValueCellFull!3858 (v!6441 V!12181)) (EmptyCell!3858) )
))
(declare-datatypes ((array!20361 0))(
  ( (array!20362 (arr!9667 (Array (_ BitVec 32) ValueCell!3858)) (size!10019 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20361)

(declare-fun mapDefault!14133 () ValueCell!3858)

(assert (=> b!361771 (= condMapEmpty!14133 (= (arr!9667 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3858)) mapDefault!14133)))))

(declare-fun res!201256 () Bool)

(assert (=> start!36020 (=> (not res!201256) (not e!221567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36020 (= res!201256 (validMask!0 mask!1943))))

(assert (=> start!36020 e!221567))

(assert (=> start!36020 true))

(declare-fun array_inv!7110 (array!20359) Bool)

(assert (=> start!36020 (array_inv!7110 _keys!1541)))

(declare-fun array_inv!7111 (array!20361) Bool)

(assert (=> start!36020 (and (array_inv!7111 _values!1277) e!221568)))

(declare-fun b!361772 () Bool)

(declare-fun e!221566 () Bool)

(declare-fun tp_is_empty!8403 () Bool)

(assert (=> b!361772 (= e!221566 tp_is_empty!8403)))

(declare-fun b!361773 () Bool)

(declare-fun res!201260 () Bool)

(assert (=> b!361773 (=> (not res!201260) (not e!221567))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361773 (= res!201260 (and (= (size!10019 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10018 _keys!1541) (size!10019 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361774 () Bool)

(declare-fun res!201255 () Bool)

(assert (=> b!361774 (=> (not res!201255) (not e!221567))))

(assert (=> b!361774 (= res!201255 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10018 _keys!1541))))))

(declare-fun b!361775 () Bool)

(assert (=> b!361775 (= e!221567 (and (not (= (select (arr!9666 _keys!1541) from!1924) k0!1134)) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) (size!10018 _keys!1541))))))

(declare-fun mapNonEmpty!14133 () Bool)

(declare-fun tp!28209 () Bool)

(assert (=> mapNonEmpty!14133 (= mapRes!14133 (and tp!28209 e!221566))))

(declare-fun mapKey!14133 () (_ BitVec 32))

(declare-fun mapValue!14133 () ValueCell!3858)

(declare-fun mapRest!14133 () (Array (_ BitVec 32) ValueCell!3858))

(assert (=> mapNonEmpty!14133 (= (arr!9667 _values!1277) (store mapRest!14133 mapKey!14133 mapValue!14133))))

(declare-fun mapIsEmpty!14133 () Bool)

(assert (=> mapIsEmpty!14133 mapRes!14133))

(declare-fun b!361776 () Bool)

(assert (=> b!361776 (= e!221565 tp_is_empty!8403)))

(declare-fun b!361777 () Bool)

(declare-fun res!201258 () Bool)

(assert (=> b!361777 (=> (not res!201258) (not e!221567))))

(declare-datatypes ((List!5515 0))(
  ( (Nil!5512) (Cons!5511 (h!6367 (_ BitVec 64)) (t!10665 List!5515)) )
))
(declare-fun arrayNoDuplicates!0 (array!20359 (_ BitVec 32) List!5515) Bool)

(assert (=> b!361777 (= res!201258 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5512))))

(assert (= (and start!36020 res!201256) b!361773))

(assert (= (and b!361773 res!201260) b!361769))

(assert (= (and b!361769 res!201257) b!361777))

(assert (= (and b!361777 res!201258) b!361774))

(assert (= (and b!361774 res!201255) b!361770))

(assert (= (and b!361770 res!201259) b!361775))

(assert (= (and b!361771 condMapEmpty!14133) mapIsEmpty!14133))

(assert (= (and b!361771 (not condMapEmpty!14133)) mapNonEmpty!14133))

(get-info :version)

(assert (= (and mapNonEmpty!14133 ((_ is ValueCellFull!3858) mapValue!14133)) b!361772))

(assert (= (and b!361771 ((_ is ValueCellFull!3858) mapDefault!14133)) b!361776))

(assert (= start!36020 b!361771))

(declare-fun m!358463 () Bool)

(assert (=> mapNonEmpty!14133 m!358463))

(declare-fun m!358465 () Bool)

(assert (=> b!361777 m!358465))

(declare-fun m!358467 () Bool)

(assert (=> b!361775 m!358467))

(declare-fun m!358469 () Bool)

(assert (=> start!36020 m!358469))

(declare-fun m!358471 () Bool)

(assert (=> start!36020 m!358471))

(declare-fun m!358473 () Bool)

(assert (=> start!36020 m!358473))

(declare-fun m!358475 () Bool)

(assert (=> b!361770 m!358475))

(declare-fun m!358477 () Bool)

(assert (=> b!361769 m!358477))

(check-sat tp_is_empty!8403 (not mapNonEmpty!14133) (not start!36020) (not b!361770) (not b!361777) (not b!361769))
(check-sat)
(get-model)

(declare-fun d!71955 () Bool)

(declare-fun res!201283 () Bool)

(declare-fun e!221588 () Bool)

(assert (=> d!71955 (=> res!201283 e!221588)))

(assert (=> d!71955 (= res!201283 (= (select (arr!9666 _keys!1541) from!1924) k0!1134))))

(assert (=> d!71955 (= (arrayContainsKey!0 _keys!1541 k0!1134 from!1924) e!221588)))

(declare-fun b!361809 () Bool)

(declare-fun e!221589 () Bool)

(assert (=> b!361809 (= e!221588 e!221589)))

(declare-fun res!201284 () Bool)

(assert (=> b!361809 (=> (not res!201284) (not e!221589))))

(assert (=> b!361809 (= res!201284 (bvslt (bvadd from!1924 #b00000000000000000000000000000001) (size!10018 _keys!1541)))))

(declare-fun b!361810 () Bool)

(assert (=> b!361810 (= e!221589 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!71955 (not res!201283)) b!361809))

(assert (= (and b!361809 res!201284) b!361810))

(assert (=> d!71955 m!358467))

(declare-fun m!358495 () Bool)

(assert (=> b!361810 m!358495))

(assert (=> b!361770 d!71955))

(declare-fun d!71957 () Bool)

(assert (=> d!71957 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!36020 d!71957))

(declare-fun d!71959 () Bool)

(assert (=> d!71959 (= (array_inv!7110 _keys!1541) (bvsge (size!10018 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!36020 d!71959))

(declare-fun d!71961 () Bool)

(assert (=> d!71961 (= (array_inv!7111 _values!1277) (bvsge (size!10019 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!36020 d!71961))

(declare-fun b!361819 () Bool)

(declare-fun e!221596 () Bool)

(declare-fun e!221597 () Bool)

(assert (=> b!361819 (= e!221596 e!221597)))

(declare-fun lt!166591 () (_ BitVec 64))

(assert (=> b!361819 (= lt!166591 (select (arr!9666 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11118 0))(
  ( (Unit!11119) )
))
(declare-fun lt!166592 () Unit!11118)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20359 (_ BitVec 64) (_ BitVec 32)) Unit!11118)

(assert (=> b!361819 (= lt!166592 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166591 #b00000000000000000000000000000000))))

(assert (=> b!361819 (arrayContainsKey!0 _keys!1541 lt!166591 #b00000000000000000000000000000000)))

(declare-fun lt!166593 () Unit!11118)

(assert (=> b!361819 (= lt!166593 lt!166592)))

(declare-fun res!201290 () Bool)

(declare-datatypes ((SeekEntryResult!3497 0))(
  ( (MissingZero!3497 (index!16167 (_ BitVec 32))) (Found!3497 (index!16168 (_ BitVec 32))) (Intermediate!3497 (undefined!4309 Bool) (index!16169 (_ BitVec 32)) (x!36057 (_ BitVec 32))) (Undefined!3497) (MissingVacant!3497 (index!16170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20359 (_ BitVec 32)) SeekEntryResult!3497)

(assert (=> b!361819 (= res!201290 (= (seekEntryOrOpen!0 (select (arr!9666 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3497 #b00000000000000000000000000000000)))))

(assert (=> b!361819 (=> (not res!201290) (not e!221597))))

(declare-fun d!71963 () Bool)

(declare-fun res!201289 () Bool)

(declare-fun e!221598 () Bool)

(assert (=> d!71963 (=> res!201289 e!221598)))

(assert (=> d!71963 (= res!201289 (bvsge #b00000000000000000000000000000000 (size!10018 _keys!1541)))))

(assert (=> d!71963 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221598)))

(declare-fun bm!27184 () Bool)

(declare-fun call!27187 () Bool)

(assert (=> bm!27184 (= call!27187 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361820 () Bool)

(assert (=> b!361820 (= e!221598 e!221596)))

(declare-fun c!53736 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361820 (= c!53736 (validKeyInArray!0 (select (arr!9666 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361821 () Bool)

(assert (=> b!361821 (= e!221596 call!27187)))

(declare-fun b!361822 () Bool)

(assert (=> b!361822 (= e!221597 call!27187)))

(assert (= (and d!71963 (not res!201289)) b!361820))

(assert (= (and b!361820 c!53736) b!361819))

(assert (= (and b!361820 (not c!53736)) b!361821))

(assert (= (and b!361819 res!201290) b!361822))

(assert (= (or b!361822 b!361821) bm!27184))

(declare-fun m!358497 () Bool)

(assert (=> b!361819 m!358497))

(declare-fun m!358499 () Bool)

(assert (=> b!361819 m!358499))

(declare-fun m!358501 () Bool)

(assert (=> b!361819 m!358501))

(assert (=> b!361819 m!358497))

(declare-fun m!358503 () Bool)

(assert (=> b!361819 m!358503))

(declare-fun m!358505 () Bool)

(assert (=> bm!27184 m!358505))

(assert (=> b!361820 m!358497))

(assert (=> b!361820 m!358497))

(declare-fun m!358507 () Bool)

(assert (=> b!361820 m!358507))

(assert (=> b!361769 d!71963))

(declare-fun b!361833 () Bool)

(declare-fun e!221610 () Bool)

(declare-fun call!27190 () Bool)

(assert (=> b!361833 (= e!221610 call!27190)))

(declare-fun b!361834 () Bool)

(declare-fun e!221609 () Bool)

(assert (=> b!361834 (= e!221609 e!221610)))

(declare-fun c!53739 () Bool)

(assert (=> b!361834 (= c!53739 (validKeyInArray!0 (select (arr!9666 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71965 () Bool)

(declare-fun res!201298 () Bool)

(declare-fun e!221607 () Bool)

(assert (=> d!71965 (=> res!201298 e!221607)))

(assert (=> d!71965 (= res!201298 (bvsge #b00000000000000000000000000000000 (size!10018 _keys!1541)))))

(assert (=> d!71965 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5512) e!221607)))

(declare-fun b!361835 () Bool)

(assert (=> b!361835 (= e!221607 e!221609)))

(declare-fun res!201299 () Bool)

(assert (=> b!361835 (=> (not res!201299) (not e!221609))))

(declare-fun e!221608 () Bool)

(assert (=> b!361835 (= res!201299 (not e!221608))))

(declare-fun res!201297 () Bool)

(assert (=> b!361835 (=> (not res!201297) (not e!221608))))

(assert (=> b!361835 (= res!201297 (validKeyInArray!0 (select (arr!9666 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27187 () Bool)

(assert (=> bm!27187 (= call!27190 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53739 (Cons!5511 (select (arr!9666 _keys!1541) #b00000000000000000000000000000000) Nil!5512) Nil!5512)))))

(declare-fun b!361836 () Bool)

(declare-fun contains!2428 (List!5515 (_ BitVec 64)) Bool)

(assert (=> b!361836 (= e!221608 (contains!2428 Nil!5512 (select (arr!9666 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361837 () Bool)

(assert (=> b!361837 (= e!221610 call!27190)))

(assert (= (and d!71965 (not res!201298)) b!361835))

(assert (= (and b!361835 res!201297) b!361836))

(assert (= (and b!361835 res!201299) b!361834))

(assert (= (and b!361834 c!53739) b!361837))

(assert (= (and b!361834 (not c!53739)) b!361833))

(assert (= (or b!361837 b!361833) bm!27187))

(assert (=> b!361834 m!358497))

(assert (=> b!361834 m!358497))

(assert (=> b!361834 m!358507))

(assert (=> b!361835 m!358497))

(assert (=> b!361835 m!358497))

(assert (=> b!361835 m!358507))

(assert (=> bm!27187 m!358497))

(declare-fun m!358509 () Bool)

(assert (=> bm!27187 m!358509))

(assert (=> b!361836 m!358497))

(assert (=> b!361836 m!358497))

(declare-fun m!358511 () Bool)

(assert (=> b!361836 m!358511))

(assert (=> b!361777 d!71965))

(declare-fun b!361845 () Bool)

(declare-fun e!221615 () Bool)

(assert (=> b!361845 (= e!221615 tp_is_empty!8403)))

(declare-fun mapNonEmpty!14139 () Bool)

(declare-fun mapRes!14139 () Bool)

(declare-fun tp!28215 () Bool)

(declare-fun e!221616 () Bool)

(assert (=> mapNonEmpty!14139 (= mapRes!14139 (and tp!28215 e!221616))))

(declare-fun mapKey!14139 () (_ BitVec 32))

(declare-fun mapRest!14139 () (Array (_ BitVec 32) ValueCell!3858))

(declare-fun mapValue!14139 () ValueCell!3858)

(assert (=> mapNonEmpty!14139 (= mapRest!14133 (store mapRest!14139 mapKey!14139 mapValue!14139))))

(declare-fun mapIsEmpty!14139 () Bool)

(assert (=> mapIsEmpty!14139 mapRes!14139))

(declare-fun b!361844 () Bool)

(assert (=> b!361844 (= e!221616 tp_is_empty!8403)))

(declare-fun condMapEmpty!14139 () Bool)

(declare-fun mapDefault!14139 () ValueCell!3858)

(assert (=> mapNonEmpty!14133 (= condMapEmpty!14139 (= mapRest!14133 ((as const (Array (_ BitVec 32) ValueCell!3858)) mapDefault!14139)))))

(assert (=> mapNonEmpty!14133 (= tp!28209 (and e!221615 mapRes!14139))))

(assert (= (and mapNonEmpty!14133 condMapEmpty!14139) mapIsEmpty!14139))

(assert (= (and mapNonEmpty!14133 (not condMapEmpty!14139)) mapNonEmpty!14139))

(assert (= (and mapNonEmpty!14139 ((_ is ValueCellFull!3858) mapValue!14139)) b!361844))

(assert (= (and mapNonEmpty!14133 ((_ is ValueCellFull!3858) mapDefault!14139)) b!361845))

(declare-fun m!358513 () Bool)

(assert (=> mapNonEmpty!14139 m!358513))

(check-sat (not b!361820) (not bm!27184) (not b!361810) (not bm!27187) tp_is_empty!8403 (not b!361834) (not b!361835) (not b!361819) (not mapNonEmpty!14139) (not b!361836))
(check-sat)
