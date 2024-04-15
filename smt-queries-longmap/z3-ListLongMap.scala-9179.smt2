; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110400 () Bool)

(assert start!110400)

(declare-fun mapIsEmpty!54103 () Bool)

(declare-fun mapRes!54103 () Bool)

(assert (=> mapIsEmpty!54103 mapRes!54103))

(declare-fun b!1306244 () Bool)

(declare-fun e!745197 () Bool)

(declare-fun tp_is_empty!34987 () Bool)

(assert (=> b!1306244 (= e!745197 tp_is_empty!34987)))

(declare-fun b!1306245 () Bool)

(declare-fun e!745196 () Bool)

(declare-datatypes ((List!29835 0))(
  ( (Nil!29832) (Cons!29831 (h!31040 (_ BitVec 64)) (t!43433 List!29835)) )
))
(declare-fun noDuplicate!2079 (List!29835) Bool)

(assert (=> b!1306245 (= e!745196 (not (noDuplicate!2079 Nil!29832)))))

(declare-fun mapNonEmpty!54103 () Bool)

(declare-fun tp!103184 () Bool)

(declare-fun e!745198 () Bool)

(assert (=> mapNonEmpty!54103 (= mapRes!54103 (and tp!103184 e!745198))))

(declare-datatypes ((V!51753 0))(
  ( (V!51754 (val!17568 Int)) )
))
(declare-datatypes ((ValueCell!16595 0))(
  ( (ValueCellFull!16595 (v!20193 V!51753)) (EmptyCell!16595) )
))
(declare-fun mapRest!54103 () (Array (_ BitVec 32) ValueCell!16595))

(declare-fun mapKey!54103 () (_ BitVec 32))

(declare-fun mapValue!54103 () ValueCell!16595)

(declare-datatypes ((array!86901 0))(
  ( (array!86902 (arr!41933 (Array (_ BitVec 32) ValueCell!16595)) (size!42485 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86901)

(assert (=> mapNonEmpty!54103 (= (arr!41933 _values!1354) (store mapRest!54103 mapKey!54103 mapValue!54103))))

(declare-fun b!1306247 () Bool)

(declare-fun res!867203 () Bool)

(assert (=> b!1306247 (=> (not res!867203) (not e!745196))))

(declare-datatypes ((array!86903 0))(
  ( (array!86904 (arr!41934 (Array (_ BitVec 32) (_ BitVec 64))) (size!42486 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86903)

(assert (=> b!1306247 (= res!867203 (and (bvsle #b00000000000000000000000000000000 (size!42486 _keys!1628)) (bvslt (size!42486 _keys!1628) #b01111111111111111111111111111111)))))

(declare-fun b!1306248 () Bool)

(assert (=> b!1306248 (= e!745198 tp_is_empty!34987)))

(declare-fun b!1306249 () Bool)

(declare-fun res!867201 () Bool)

(assert (=> b!1306249 (=> (not res!867201) (not e!745196))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86903 (_ BitVec 32)) Bool)

(assert (=> b!1306249 (= res!867201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306250 () Bool)

(declare-fun e!745199 () Bool)

(assert (=> b!1306250 (= e!745199 (and e!745197 mapRes!54103))))

(declare-fun condMapEmpty!54103 () Bool)

(declare-fun mapDefault!54103 () ValueCell!16595)

(assert (=> b!1306250 (= condMapEmpty!54103 (= (arr!41933 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16595)) mapDefault!54103)))))

(declare-fun res!867202 () Bool)

(assert (=> start!110400 (=> (not res!867202) (not e!745196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110400 (= res!867202 (validMask!0 mask!2040))))

(assert (=> start!110400 e!745196))

(assert (=> start!110400 true))

(declare-fun array_inv!31891 (array!86901) Bool)

(assert (=> start!110400 (and (array_inv!31891 _values!1354) e!745199)))

(declare-fun array_inv!31892 (array!86903) Bool)

(assert (=> start!110400 (array_inv!31892 _keys!1628)))

(declare-fun b!1306246 () Bool)

(declare-fun res!867200 () Bool)

(assert (=> b!1306246 (=> (not res!867200) (not e!745196))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306246 (= res!867200 (and (= (size!42485 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42486 _keys!1628) (size!42485 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110400 res!867202) b!1306246))

(assert (= (and b!1306246 res!867200) b!1306249))

(assert (= (and b!1306249 res!867201) b!1306247))

(assert (= (and b!1306247 res!867203) b!1306245))

(assert (= (and b!1306250 condMapEmpty!54103) mapIsEmpty!54103))

(assert (= (and b!1306250 (not condMapEmpty!54103)) mapNonEmpty!54103))

(get-info :version)

(assert (= (and mapNonEmpty!54103 ((_ is ValueCellFull!16595) mapValue!54103)) b!1306248))

(assert (= (and b!1306250 ((_ is ValueCellFull!16595) mapDefault!54103)) b!1306244))

(assert (= start!110400 b!1306250))

(declare-fun m!1196879 () Bool)

(assert (=> b!1306245 m!1196879))

(declare-fun m!1196881 () Bool)

(assert (=> mapNonEmpty!54103 m!1196881))

(declare-fun m!1196883 () Bool)

(assert (=> b!1306249 m!1196883))

(declare-fun m!1196885 () Bool)

(assert (=> start!110400 m!1196885))

(declare-fun m!1196887 () Bool)

(assert (=> start!110400 m!1196887))

(declare-fun m!1196889 () Bool)

(assert (=> start!110400 m!1196889))

(check-sat (not mapNonEmpty!54103) (not b!1306245) tp_is_empty!34987 (not start!110400) (not b!1306249))
(check-sat)
(get-model)

(declare-fun d!142127 () Bool)

(declare-fun res!867232 () Bool)

(declare-fun e!745235 () Bool)

(assert (=> d!142127 (=> res!867232 e!745235)))

(assert (=> d!142127 (= res!867232 ((_ is Nil!29832) Nil!29832))))

(assert (=> d!142127 (= (noDuplicate!2079 Nil!29832) e!745235)))

(declare-fun b!1306297 () Bool)

(declare-fun e!745236 () Bool)

(assert (=> b!1306297 (= e!745235 e!745236)))

(declare-fun res!867233 () Bool)

(assert (=> b!1306297 (=> (not res!867233) (not e!745236))))

(declare-fun contains!8284 (List!29835 (_ BitVec 64)) Bool)

(assert (=> b!1306297 (= res!867233 (not (contains!8284 (t!43433 Nil!29832) (h!31040 Nil!29832))))))

(declare-fun b!1306298 () Bool)

(assert (=> b!1306298 (= e!745236 (noDuplicate!2079 (t!43433 Nil!29832)))))

(assert (= (and d!142127 (not res!867232)) b!1306297))

(assert (= (and b!1306297 res!867233) b!1306298))

(declare-fun m!1196915 () Bool)

(assert (=> b!1306297 m!1196915))

(declare-fun m!1196917 () Bool)

(assert (=> b!1306298 m!1196917))

(assert (=> b!1306245 d!142127))

(declare-fun b!1306307 () Bool)

(declare-fun e!745244 () Bool)

(declare-fun call!64610 () Bool)

(assert (=> b!1306307 (= e!745244 call!64610)))

(declare-fun b!1306308 () Bool)

(declare-fun e!745245 () Bool)

(assert (=> b!1306308 (= e!745245 e!745244)))

(declare-fun lt!584728 () (_ BitVec 64))

(assert (=> b!1306308 (= lt!584728 (select (arr!41934 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43109 0))(
  ( (Unit!43110) )
))
(declare-fun lt!584727 () Unit!43109)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86903 (_ BitVec 64) (_ BitVec 32)) Unit!43109)

(assert (=> b!1306308 (= lt!584727 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!584728 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306308 (arrayContainsKey!0 _keys!1628 lt!584728 #b00000000000000000000000000000000)))

(declare-fun lt!584729 () Unit!43109)

(assert (=> b!1306308 (= lt!584729 lt!584727)))

(declare-fun res!867238 () Bool)

(declare-datatypes ((SeekEntryResult!10032 0))(
  ( (MissingZero!10032 (index!42499 (_ BitVec 32))) (Found!10032 (index!42500 (_ BitVec 32))) (Intermediate!10032 (undefined!10844 Bool) (index!42501 (_ BitVec 32)) (x!116015 (_ BitVec 32))) (Undefined!10032) (MissingVacant!10032 (index!42502 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86903 (_ BitVec 32)) SeekEntryResult!10032)

(assert (=> b!1306308 (= res!867238 (= (seekEntryOrOpen!0 (select (arr!41934 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10032 #b00000000000000000000000000000000)))))

(assert (=> b!1306308 (=> (not res!867238) (not e!745244))))

(declare-fun bm!64607 () Bool)

(assert (=> bm!64607 (= call!64610 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1306309 () Bool)

(assert (=> b!1306309 (= e!745245 call!64610)))

(declare-fun b!1306310 () Bool)

(declare-fun e!745243 () Bool)

(assert (=> b!1306310 (= e!745243 e!745245)))

(declare-fun c!125526 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306310 (= c!125526 (validKeyInArray!0 (select (arr!41934 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun d!142129 () Bool)

(declare-fun res!867239 () Bool)

(assert (=> d!142129 (=> res!867239 e!745243)))

(assert (=> d!142129 (= res!867239 (bvsge #b00000000000000000000000000000000 (size!42486 _keys!1628)))))

(assert (=> d!142129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!745243)))

(assert (= (and d!142129 (not res!867239)) b!1306310))

(assert (= (and b!1306310 c!125526) b!1306308))

(assert (= (and b!1306310 (not c!125526)) b!1306309))

(assert (= (and b!1306308 res!867238) b!1306307))

(assert (= (or b!1306307 b!1306309) bm!64607))

(declare-fun m!1196919 () Bool)

(assert (=> b!1306308 m!1196919))

(declare-fun m!1196921 () Bool)

(assert (=> b!1306308 m!1196921))

(declare-fun m!1196923 () Bool)

(assert (=> b!1306308 m!1196923))

(assert (=> b!1306308 m!1196919))

(declare-fun m!1196925 () Bool)

(assert (=> b!1306308 m!1196925))

(declare-fun m!1196927 () Bool)

(assert (=> bm!64607 m!1196927))

(assert (=> b!1306310 m!1196919))

(assert (=> b!1306310 m!1196919))

(declare-fun m!1196929 () Bool)

(assert (=> b!1306310 m!1196929))

(assert (=> b!1306249 d!142129))

(declare-fun d!142131 () Bool)

(assert (=> d!142131 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110400 d!142131))

(declare-fun d!142133 () Bool)

(assert (=> d!142133 (= (array_inv!31891 _values!1354) (bvsge (size!42485 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110400 d!142133))

(declare-fun d!142135 () Bool)

(assert (=> d!142135 (= (array_inv!31892 _keys!1628) (bvsge (size!42486 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110400 d!142135))

(declare-fun b!1306317 () Bool)

(declare-fun e!745251 () Bool)

(assert (=> b!1306317 (= e!745251 tp_is_empty!34987)))

(declare-fun mapIsEmpty!54112 () Bool)

(declare-fun mapRes!54112 () Bool)

(assert (=> mapIsEmpty!54112 mapRes!54112))

(declare-fun mapNonEmpty!54112 () Bool)

(declare-fun tp!103193 () Bool)

(assert (=> mapNonEmpty!54112 (= mapRes!54112 (and tp!103193 e!745251))))

(declare-fun mapRest!54112 () (Array (_ BitVec 32) ValueCell!16595))

(declare-fun mapValue!54112 () ValueCell!16595)

(declare-fun mapKey!54112 () (_ BitVec 32))

(assert (=> mapNonEmpty!54112 (= mapRest!54103 (store mapRest!54112 mapKey!54112 mapValue!54112))))

(declare-fun b!1306318 () Bool)

(declare-fun e!745250 () Bool)

(assert (=> b!1306318 (= e!745250 tp_is_empty!34987)))

(declare-fun condMapEmpty!54112 () Bool)

(declare-fun mapDefault!54112 () ValueCell!16595)

(assert (=> mapNonEmpty!54103 (= condMapEmpty!54112 (= mapRest!54103 ((as const (Array (_ BitVec 32) ValueCell!16595)) mapDefault!54112)))))

(assert (=> mapNonEmpty!54103 (= tp!103184 (and e!745250 mapRes!54112))))

(assert (= (and mapNonEmpty!54103 condMapEmpty!54112) mapIsEmpty!54112))

(assert (= (and mapNonEmpty!54103 (not condMapEmpty!54112)) mapNonEmpty!54112))

(assert (= (and mapNonEmpty!54112 ((_ is ValueCellFull!16595) mapValue!54112)) b!1306317))

(assert (= (and mapNonEmpty!54103 ((_ is ValueCellFull!16595) mapDefault!54112)) b!1306318))

(declare-fun m!1196931 () Bool)

(assert (=> mapNonEmpty!54112 m!1196931))

(check-sat tp_is_empty!34987 (not bm!64607) (not b!1306310) (not b!1306297) (not b!1306298) (not b!1306308) (not mapNonEmpty!54112))
(check-sat)
