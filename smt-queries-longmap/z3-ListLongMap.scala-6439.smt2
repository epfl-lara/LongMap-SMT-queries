; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82454 () Bool)

(assert start!82454)

(declare-fun b!961171 () Bool)

(declare-fun res!643324 () Bool)

(declare-fun e!541894 () Bool)

(assert (=> b!961171 (=> (not res!643324) (not e!541894))))

(declare-datatypes ((array!58915 0))(
  ( (array!58916 (arr!28328 (Array (_ BitVec 32) (_ BitVec 64))) (size!28807 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58915)

(assert (=> b!961171 (= res!643324 (and (bvsle #b00000000000000000000000000000000 (size!28807 _keys!1686)) (bvslt (size!28807 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun b!961173 () Bool)

(declare-datatypes ((List!19682 0))(
  ( (Nil!19679) (Cons!19678 (h!20840 (_ BitVec 64)) (t!28045 List!19682)) )
))
(declare-fun noDuplicate!1366 (List!19682) Bool)

(assert (=> b!961173 (= e!541894 (not (noDuplicate!1366 Nil!19679)))))

(declare-fun b!961174 () Bool)

(declare-fun res!643325 () Bool)

(assert (=> b!961174 (=> (not res!643325) (not e!541894))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33531 0))(
  ( (V!33532 (val!10756 Int)) )
))
(declare-datatypes ((ValueCell!10224 0))(
  ( (ValueCellFull!10224 (v!13313 V!33531)) (EmptyCell!10224) )
))
(declare-datatypes ((array!58917 0))(
  ( (array!58918 (arr!28329 (Array (_ BitVec 32) ValueCell!10224)) (size!28808 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58917)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961174 (= res!643325 (and (= (size!28808 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28807 _keys!1686) (size!28808 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34105 () Bool)

(declare-fun mapRes!34105 () Bool)

(assert (=> mapIsEmpty!34105 mapRes!34105))

(declare-fun mapNonEmpty!34105 () Bool)

(declare-fun tp!65034 () Bool)

(declare-fun e!541896 () Bool)

(assert (=> mapNonEmpty!34105 (= mapRes!34105 (and tp!65034 e!541896))))

(declare-fun mapValue!34105 () ValueCell!10224)

(declare-fun mapRest!34105 () (Array (_ BitVec 32) ValueCell!10224))

(declare-fun mapKey!34105 () (_ BitVec 32))

(assert (=> mapNonEmpty!34105 (= (arr!28329 _values!1400) (store mapRest!34105 mapKey!34105 mapValue!34105))))

(declare-fun b!961175 () Bool)

(declare-fun res!643323 () Bool)

(assert (=> b!961175 (=> (not res!643323) (not e!541894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58915 (_ BitVec 32)) Bool)

(assert (=> b!961175 (= res!643323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961172 () Bool)

(declare-fun tp_is_empty!21411 () Bool)

(assert (=> b!961172 (= e!541896 tp_is_empty!21411)))

(declare-fun res!643322 () Bool)

(assert (=> start!82454 (=> (not res!643322) (not e!541894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82454 (= res!643322 (validMask!0 mask!2110))))

(assert (=> start!82454 e!541894))

(assert (=> start!82454 true))

(declare-fun e!541892 () Bool)

(declare-fun array_inv!21951 (array!58917) Bool)

(assert (=> start!82454 (and (array_inv!21951 _values!1400) e!541892)))

(declare-fun array_inv!21952 (array!58915) Bool)

(assert (=> start!82454 (array_inv!21952 _keys!1686)))

(declare-fun b!961176 () Bool)

(declare-fun e!541895 () Bool)

(assert (=> b!961176 (= e!541892 (and e!541895 mapRes!34105))))

(declare-fun condMapEmpty!34105 () Bool)

(declare-fun mapDefault!34105 () ValueCell!10224)

(assert (=> b!961176 (= condMapEmpty!34105 (= (arr!28329 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10224)) mapDefault!34105)))))

(declare-fun b!961177 () Bool)

(assert (=> b!961177 (= e!541895 tp_is_empty!21411)))

(assert (= (and start!82454 res!643322) b!961174))

(assert (= (and b!961174 res!643325) b!961175))

(assert (= (and b!961175 res!643323) b!961171))

(assert (= (and b!961171 res!643324) b!961173))

(assert (= (and b!961176 condMapEmpty!34105) mapIsEmpty!34105))

(assert (= (and b!961176 (not condMapEmpty!34105)) mapNonEmpty!34105))

(get-info :version)

(assert (= (and mapNonEmpty!34105 ((_ is ValueCellFull!10224) mapValue!34105)) b!961172))

(assert (= (and b!961176 ((_ is ValueCellFull!10224) mapDefault!34105)) b!961177))

(assert (= start!82454 b!961176))

(declare-fun m!891215 () Bool)

(assert (=> b!961173 m!891215))

(declare-fun m!891217 () Bool)

(assert (=> mapNonEmpty!34105 m!891217))

(declare-fun m!891219 () Bool)

(assert (=> b!961175 m!891219))

(declare-fun m!891221 () Bool)

(assert (=> start!82454 m!891221))

(declare-fun m!891223 () Bool)

(assert (=> start!82454 m!891223))

(declare-fun m!891225 () Bool)

(assert (=> start!82454 m!891225))

(check-sat (not mapNonEmpty!34105) tp_is_empty!21411 (not start!82454) (not b!961175) (not b!961173))
(check-sat)
(get-model)

(declare-fun b!961207 () Bool)

(declare-fun e!541918 () Bool)

(declare-fun call!41726 () Bool)

(assert (=> b!961207 (= e!541918 call!41726)))

(declare-fun bm!41723 () Bool)

(assert (=> bm!41723 (= call!41726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun b!961208 () Bool)

(declare-fun e!541919 () Bool)

(declare-fun e!541920 () Bool)

(assert (=> b!961208 (= e!541919 e!541920)))

(declare-fun c!99914 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961208 (= c!99914 (validKeyInArray!0 (select (arr!28328 _keys!1686) #b00000000000000000000000000000000)))))

(declare-fun b!961209 () Bool)

(assert (=> b!961209 (= e!541920 call!41726)))

(declare-fun d!116041 () Bool)

(declare-fun res!643343 () Bool)

(assert (=> d!116041 (=> res!643343 e!541919)))

(assert (=> d!116041 (= res!643343 (bvsge #b00000000000000000000000000000000 (size!28807 _keys!1686)))))

(assert (=> d!116041 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!541919)))

(declare-fun b!961210 () Bool)

(assert (=> b!961210 (= e!541920 e!541918)))

(declare-fun lt!430723 () (_ BitVec 64))

(assert (=> b!961210 (= lt!430723 (select (arr!28328 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32209 0))(
  ( (Unit!32210) )
))
(declare-fun lt!430724 () Unit!32209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58915 (_ BitVec 64) (_ BitVec 32)) Unit!32209)

(assert (=> b!961210 (= lt!430724 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!430723 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!961210 (arrayContainsKey!0 _keys!1686 lt!430723 #b00000000000000000000000000000000)))

(declare-fun lt!430725 () Unit!32209)

(assert (=> b!961210 (= lt!430725 lt!430724)))

(declare-fun res!643342 () Bool)

(declare-datatypes ((SeekEntryResult!9195 0))(
  ( (MissingZero!9195 (index!39151 (_ BitVec 32))) (Found!9195 (index!39152 (_ BitVec 32))) (Intermediate!9195 (undefined!10007 Bool) (index!39153 (_ BitVec 32)) (x!82929 (_ BitVec 32))) (Undefined!9195) (MissingVacant!9195 (index!39154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58915 (_ BitVec 32)) SeekEntryResult!9195)

(assert (=> b!961210 (= res!643342 (= (seekEntryOrOpen!0 (select (arr!28328 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9195 #b00000000000000000000000000000000)))))

(assert (=> b!961210 (=> (not res!643342) (not e!541918))))

(assert (= (and d!116041 (not res!643343)) b!961208))

(assert (= (and b!961208 c!99914) b!961210))

(assert (= (and b!961208 (not c!99914)) b!961209))

(assert (= (and b!961210 res!643342) b!961207))

(assert (= (or b!961207 b!961209) bm!41723))

(declare-fun m!891239 () Bool)

(assert (=> bm!41723 m!891239))

(declare-fun m!891241 () Bool)

(assert (=> b!961208 m!891241))

(assert (=> b!961208 m!891241))

(declare-fun m!891243 () Bool)

(assert (=> b!961208 m!891243))

(assert (=> b!961210 m!891241))

(declare-fun m!891245 () Bool)

(assert (=> b!961210 m!891245))

(declare-fun m!891247 () Bool)

(assert (=> b!961210 m!891247))

(assert (=> b!961210 m!891241))

(declare-fun m!891249 () Bool)

(assert (=> b!961210 m!891249))

(assert (=> b!961175 d!116041))

(declare-fun d!116043 () Bool)

(assert (=> d!116043 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82454 d!116043))

(declare-fun d!116045 () Bool)

(assert (=> d!116045 (= (array_inv!21951 _values!1400) (bvsge (size!28808 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82454 d!116045))

(declare-fun d!116047 () Bool)

(assert (=> d!116047 (= (array_inv!21952 _keys!1686) (bvsge (size!28807 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82454 d!116047))

(declare-fun d!116049 () Bool)

(declare-fun res!643348 () Bool)

(declare-fun e!541925 () Bool)

(assert (=> d!116049 (=> res!643348 e!541925)))

(assert (=> d!116049 (= res!643348 ((_ is Nil!19679) Nil!19679))))

(assert (=> d!116049 (= (noDuplicate!1366 Nil!19679) e!541925)))

(declare-fun b!961215 () Bool)

(declare-fun e!541926 () Bool)

(assert (=> b!961215 (= e!541925 e!541926)))

(declare-fun res!643349 () Bool)

(assert (=> b!961215 (=> (not res!643349) (not e!541926))))

(declare-fun contains!5392 (List!19682 (_ BitVec 64)) Bool)

(assert (=> b!961215 (= res!643349 (not (contains!5392 (t!28045 Nil!19679) (h!20840 Nil!19679))))))

(declare-fun b!961216 () Bool)

(assert (=> b!961216 (= e!541926 (noDuplicate!1366 (t!28045 Nil!19679)))))

(assert (= (and d!116049 (not res!643348)) b!961215))

(assert (= (and b!961215 res!643349) b!961216))

(declare-fun m!891251 () Bool)

(assert (=> b!961215 m!891251))

(declare-fun m!891253 () Bool)

(assert (=> b!961216 m!891253))

(assert (=> b!961173 d!116049))

(declare-fun condMapEmpty!34111 () Bool)

(declare-fun mapDefault!34111 () ValueCell!10224)

(assert (=> mapNonEmpty!34105 (= condMapEmpty!34111 (= mapRest!34105 ((as const (Array (_ BitVec 32) ValueCell!10224)) mapDefault!34111)))))

(declare-fun e!541932 () Bool)

(declare-fun mapRes!34111 () Bool)

(assert (=> mapNonEmpty!34105 (= tp!65034 (and e!541932 mapRes!34111))))

(declare-fun b!961224 () Bool)

(assert (=> b!961224 (= e!541932 tp_is_empty!21411)))

(declare-fun mapNonEmpty!34111 () Bool)

(declare-fun tp!65040 () Bool)

(declare-fun e!541931 () Bool)

(assert (=> mapNonEmpty!34111 (= mapRes!34111 (and tp!65040 e!541931))))

(declare-fun mapValue!34111 () ValueCell!10224)

(declare-fun mapKey!34111 () (_ BitVec 32))

(declare-fun mapRest!34111 () (Array (_ BitVec 32) ValueCell!10224))

(assert (=> mapNonEmpty!34111 (= mapRest!34105 (store mapRest!34111 mapKey!34111 mapValue!34111))))

(declare-fun b!961223 () Bool)

(assert (=> b!961223 (= e!541931 tp_is_empty!21411)))

(declare-fun mapIsEmpty!34111 () Bool)

(assert (=> mapIsEmpty!34111 mapRes!34111))

(assert (= (and mapNonEmpty!34105 condMapEmpty!34111) mapIsEmpty!34111))

(assert (= (and mapNonEmpty!34105 (not condMapEmpty!34111)) mapNonEmpty!34111))

(assert (= (and mapNonEmpty!34111 ((_ is ValueCellFull!10224) mapValue!34111)) b!961223))

(assert (= (and mapNonEmpty!34105 ((_ is ValueCellFull!10224) mapDefault!34111)) b!961224))

(declare-fun m!891255 () Bool)

(assert (=> mapNonEmpty!34111 m!891255))

(check-sat (not b!961210) (not b!961208) tp_is_empty!21411 (not mapNonEmpty!34111) (not b!961216) (not bm!41723) (not b!961215))
(check-sat)
