; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110416 () Bool)

(assert start!110416)

(declare-fun b!1306337 () Bool)

(declare-fun e!745264 () Bool)

(declare-datatypes ((List!29837 0))(
  ( (Nil!29834) (Cons!29833 (h!31042 (_ BitVec 64)) (t!43435 List!29837)) )
))
(declare-fun contains!8285 (List!29837 (_ BitVec 64)) Bool)

(assert (=> b!1306337 (= e!745264 (contains!8285 Nil!29834 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306338 () Bool)

(declare-fun res!867252 () Bool)

(declare-fun e!745266 () Bool)

(assert (=> b!1306338 (=> (not res!867252) (not e!745266))))

(declare-datatypes ((array!86913 0))(
  ( (array!86914 (arr!41938 (Array (_ BitVec 32) (_ BitVec 64))) (size!42490 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86913)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51761 0))(
  ( (V!51762 (val!17571 Int)) )
))
(declare-datatypes ((ValueCell!16598 0))(
  ( (ValueCellFull!16598 (v!20196 V!51761)) (EmptyCell!16598) )
))
(declare-datatypes ((array!86915 0))(
  ( (array!86916 (arr!41939 (Array (_ BitVec 32) ValueCell!16598)) (size!42491 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86915)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306338 (= res!867252 (and (= (size!42491 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42490 _keys!1628) (size!42491 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306339 () Bool)

(declare-fun res!867256 () Bool)

(assert (=> b!1306339 (=> (not res!867256) (not e!745266))))

(declare-fun noDuplicate!2081 (List!29837) Bool)

(assert (=> b!1306339 (= res!867256 (noDuplicate!2081 Nil!29834))))

(declare-fun b!1306340 () Bool)

(declare-fun e!745267 () Bool)

(declare-fun tp_is_empty!34993 () Bool)

(assert (=> b!1306340 (= e!745267 tp_is_empty!34993)))

(declare-fun mapIsEmpty!54115 () Bool)

(declare-fun mapRes!54115 () Bool)

(assert (=> mapIsEmpty!54115 mapRes!54115))

(declare-fun b!1306341 () Bool)

(declare-fun e!745268 () Bool)

(assert (=> b!1306341 (= e!745268 tp_is_empty!34993)))

(declare-fun b!1306342 () Bool)

(declare-fun e!745269 () Bool)

(assert (=> b!1306342 (= e!745269 (and e!745267 mapRes!54115))))

(declare-fun condMapEmpty!54115 () Bool)

(declare-fun mapDefault!54115 () ValueCell!16598)

(assert (=> b!1306342 (= condMapEmpty!54115 (= (arr!41939 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16598)) mapDefault!54115)))))

(declare-fun b!1306343 () Bool)

(declare-fun res!867254 () Bool)

(assert (=> b!1306343 (=> (not res!867254) (not e!745266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86913 (_ BitVec 32)) Bool)

(assert (=> b!1306343 (= res!867254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54115 () Bool)

(declare-fun tp!103196 () Bool)

(assert (=> mapNonEmpty!54115 (= mapRes!54115 (and tp!103196 e!745268))))

(declare-fun mapKey!54115 () (_ BitVec 32))

(declare-fun mapRest!54115 () (Array (_ BitVec 32) ValueCell!16598))

(declare-fun mapValue!54115 () ValueCell!16598)

(assert (=> mapNonEmpty!54115 (= (arr!41939 _values!1354) (store mapRest!54115 mapKey!54115 mapValue!54115))))

(declare-fun res!867253 () Bool)

(assert (=> start!110416 (=> (not res!867253) (not e!745266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110416 (= res!867253 (validMask!0 mask!2040))))

(assert (=> start!110416 e!745266))

(assert (=> start!110416 true))

(declare-fun array_inv!31895 (array!86915) Bool)

(assert (=> start!110416 (and (array_inv!31895 _values!1354) e!745269)))

(declare-fun array_inv!31896 (array!86913) Bool)

(assert (=> start!110416 (array_inv!31896 _keys!1628)))

(declare-fun b!1306344 () Bool)

(assert (=> b!1306344 (= e!745266 e!745264)))

(declare-fun res!867255 () Bool)

(assert (=> b!1306344 (=> res!867255 e!745264)))

(assert (=> b!1306344 (= res!867255 (contains!8285 Nil!29834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306345 () Bool)

(declare-fun res!867257 () Bool)

(assert (=> b!1306345 (=> (not res!867257) (not e!745266))))

(assert (=> b!1306345 (= res!867257 (and (bvsle #b00000000000000000000000000000000 (size!42490 _keys!1628)) (bvslt (size!42490 _keys!1628) #b01111111111111111111111111111111)))))

(assert (= (and start!110416 res!867253) b!1306338))

(assert (= (and b!1306338 res!867252) b!1306343))

(assert (= (and b!1306343 res!867254) b!1306345))

(assert (= (and b!1306345 res!867257) b!1306339))

(assert (= (and b!1306339 res!867256) b!1306344))

(assert (= (and b!1306344 (not res!867255)) b!1306337))

(assert (= (and b!1306342 condMapEmpty!54115) mapIsEmpty!54115))

(assert (= (and b!1306342 (not condMapEmpty!54115)) mapNonEmpty!54115))

(get-info :version)

(assert (= (and mapNonEmpty!54115 ((_ is ValueCellFull!16598) mapValue!54115)) b!1306341))

(assert (= (and b!1306342 ((_ is ValueCellFull!16598) mapDefault!54115)) b!1306340))

(assert (= start!110416 b!1306342))

(declare-fun m!1196933 () Bool)

(assert (=> b!1306344 m!1196933))

(declare-fun m!1196935 () Bool)

(assert (=> b!1306343 m!1196935))

(declare-fun m!1196937 () Bool)

(assert (=> start!110416 m!1196937))

(declare-fun m!1196939 () Bool)

(assert (=> start!110416 m!1196939))

(declare-fun m!1196941 () Bool)

(assert (=> start!110416 m!1196941))

(declare-fun m!1196943 () Bool)

(assert (=> b!1306339 m!1196943))

(declare-fun m!1196945 () Bool)

(assert (=> b!1306337 m!1196945))

(declare-fun m!1196947 () Bool)

(assert (=> mapNonEmpty!54115 m!1196947))

(check-sat (not b!1306343) (not b!1306344) tp_is_empty!34993 (not mapNonEmpty!54115) (not b!1306339) (not b!1306337) (not start!110416))
(check-sat)
(get-model)

(declare-fun d!142139 () Bool)

(declare-fun lt!584732 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!648 (List!29837) (InoxSet (_ BitVec 64)))

(assert (=> d!142139 (= lt!584732 (select (content!648 Nil!29834) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!745310 () Bool)

(assert (=> d!142139 (= lt!584732 e!745310)))

(declare-fun res!867298 () Bool)

(assert (=> d!142139 (=> (not res!867298) (not e!745310))))

(assert (=> d!142139 (= res!867298 ((_ is Cons!29833) Nil!29834))))

(assert (=> d!142139 (= (contains!8285 Nil!29834 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584732)))

(declare-fun b!1306404 () Bool)

(declare-fun e!745311 () Bool)

(assert (=> b!1306404 (= e!745310 e!745311)))

(declare-fun res!867299 () Bool)

(assert (=> b!1306404 (=> res!867299 e!745311)))

(assert (=> b!1306404 (= res!867299 (= (h!31042 Nil!29834) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306405 () Bool)

(assert (=> b!1306405 (= e!745311 (contains!8285 (t!43435 Nil!29834) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142139 res!867298) b!1306404))

(assert (= (and b!1306404 (not res!867299)) b!1306405))

(declare-fun m!1196981 () Bool)

(assert (=> d!142139 m!1196981))

(declare-fun m!1196983 () Bool)

(assert (=> d!142139 m!1196983))

(declare-fun m!1196985 () Bool)

(assert (=> b!1306405 m!1196985))

(assert (=> b!1306337 d!142139))

(declare-fun d!142141 () Bool)

(declare-fun lt!584733 () Bool)

(assert (=> d!142141 (= lt!584733 (select (content!648 Nil!29834) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!745312 () Bool)

(assert (=> d!142141 (= lt!584733 e!745312)))

(declare-fun res!867300 () Bool)

(assert (=> d!142141 (=> (not res!867300) (not e!745312))))

(assert (=> d!142141 (= res!867300 ((_ is Cons!29833) Nil!29834))))

(assert (=> d!142141 (= (contains!8285 Nil!29834 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584733)))

(declare-fun b!1306406 () Bool)

(declare-fun e!745313 () Bool)

(assert (=> b!1306406 (= e!745312 e!745313)))

(declare-fun res!867301 () Bool)

(assert (=> b!1306406 (=> res!867301 e!745313)))

(assert (=> b!1306406 (= res!867301 (= (h!31042 Nil!29834) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306407 () Bool)

(assert (=> b!1306407 (= e!745313 (contains!8285 (t!43435 Nil!29834) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142141 res!867300) b!1306406))

(assert (= (and b!1306406 (not res!867301)) b!1306407))

(assert (=> d!142141 m!1196981))

(declare-fun m!1196987 () Bool)

(assert (=> d!142141 m!1196987))

(declare-fun m!1196989 () Bool)

(assert (=> b!1306407 m!1196989))

(assert (=> b!1306344 d!142141))

(declare-fun d!142143 () Bool)

(assert (=> d!142143 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110416 d!142143))

(declare-fun d!142145 () Bool)

(assert (=> d!142145 (= (array_inv!31895 _values!1354) (bvsge (size!42491 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110416 d!142145))

(declare-fun d!142147 () Bool)

(assert (=> d!142147 (= (array_inv!31896 _keys!1628) (bvsge (size!42490 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110416 d!142147))

(declare-fun d!142149 () Bool)

(declare-fun res!867306 () Bool)

(declare-fun e!745318 () Bool)

(assert (=> d!142149 (=> res!867306 e!745318)))

(assert (=> d!142149 (= res!867306 ((_ is Nil!29834) Nil!29834))))

(assert (=> d!142149 (= (noDuplicate!2081 Nil!29834) e!745318)))

(declare-fun b!1306412 () Bool)

(declare-fun e!745319 () Bool)

(assert (=> b!1306412 (= e!745318 e!745319)))

(declare-fun res!867307 () Bool)

(assert (=> b!1306412 (=> (not res!867307) (not e!745319))))

(assert (=> b!1306412 (= res!867307 (not (contains!8285 (t!43435 Nil!29834) (h!31042 Nil!29834))))))

(declare-fun b!1306413 () Bool)

(assert (=> b!1306413 (= e!745319 (noDuplicate!2081 (t!43435 Nil!29834)))))

(assert (= (and d!142149 (not res!867306)) b!1306412))

(assert (= (and b!1306412 res!867307) b!1306413))

(declare-fun m!1196991 () Bool)

(assert (=> b!1306412 m!1196991))

(declare-fun m!1196993 () Bool)

(assert (=> b!1306413 m!1196993))

(assert (=> b!1306339 d!142149))

(declare-fun bm!64610 () Bool)

(declare-fun call!64613 () Bool)

(assert (=> bm!64610 (= call!64613 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun d!142151 () Bool)

(declare-fun res!867312 () Bool)

(declare-fun e!745328 () Bool)

(assert (=> d!142151 (=> res!867312 e!745328)))

(assert (=> d!142151 (= res!867312 (bvsge #b00000000000000000000000000000000 (size!42490 _keys!1628)))))

(assert (=> d!142151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!745328)))

(declare-fun b!1306422 () Bool)

(declare-fun e!745327 () Bool)

(assert (=> b!1306422 (= e!745327 call!64613)))

(declare-fun b!1306423 () Bool)

(declare-fun e!745326 () Bool)

(assert (=> b!1306423 (= e!745326 call!64613)))

(declare-fun b!1306424 () Bool)

(assert (=> b!1306424 (= e!745326 e!745327)))

(declare-fun lt!584740 () (_ BitVec 64))

(assert (=> b!1306424 (= lt!584740 (select (arr!41938 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43111 0))(
  ( (Unit!43112) )
))
(declare-fun lt!584741 () Unit!43111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86913 (_ BitVec 64) (_ BitVec 32)) Unit!43111)

(assert (=> b!1306424 (= lt!584741 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!584740 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306424 (arrayContainsKey!0 _keys!1628 lt!584740 #b00000000000000000000000000000000)))

(declare-fun lt!584742 () Unit!43111)

(assert (=> b!1306424 (= lt!584742 lt!584741)))

(declare-fun res!867313 () Bool)

(declare-datatypes ((SeekEntryResult!10033 0))(
  ( (MissingZero!10033 (index!42503 (_ BitVec 32))) (Found!10033 (index!42504 (_ BitVec 32))) (Intermediate!10033 (undefined!10845 Bool) (index!42505 (_ BitVec 32)) (x!116026 (_ BitVec 32))) (Undefined!10033) (MissingVacant!10033 (index!42506 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86913 (_ BitVec 32)) SeekEntryResult!10033)

(assert (=> b!1306424 (= res!867313 (= (seekEntryOrOpen!0 (select (arr!41938 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10033 #b00000000000000000000000000000000)))))

(assert (=> b!1306424 (=> (not res!867313) (not e!745327))))

(declare-fun b!1306425 () Bool)

(assert (=> b!1306425 (= e!745328 e!745326)))

(declare-fun c!125529 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306425 (= c!125529 (validKeyInArray!0 (select (arr!41938 _keys!1628) #b00000000000000000000000000000000)))))

(assert (= (and d!142151 (not res!867312)) b!1306425))

(assert (= (and b!1306425 c!125529) b!1306424))

(assert (= (and b!1306425 (not c!125529)) b!1306423))

(assert (= (and b!1306424 res!867313) b!1306422))

(assert (= (or b!1306422 b!1306423) bm!64610))

(declare-fun m!1196995 () Bool)

(assert (=> bm!64610 m!1196995))

(declare-fun m!1196997 () Bool)

(assert (=> b!1306424 m!1196997))

(declare-fun m!1196999 () Bool)

(assert (=> b!1306424 m!1196999))

(declare-fun m!1197001 () Bool)

(assert (=> b!1306424 m!1197001))

(assert (=> b!1306424 m!1196997))

(declare-fun m!1197003 () Bool)

(assert (=> b!1306424 m!1197003))

(assert (=> b!1306425 m!1196997))

(assert (=> b!1306425 m!1196997))

(declare-fun m!1197005 () Bool)

(assert (=> b!1306425 m!1197005))

(assert (=> b!1306343 d!142151))

(declare-fun mapIsEmpty!54124 () Bool)

(declare-fun mapRes!54124 () Bool)

(assert (=> mapIsEmpty!54124 mapRes!54124))

(declare-fun mapNonEmpty!54124 () Bool)

(declare-fun tp!103205 () Bool)

(declare-fun e!745333 () Bool)

(assert (=> mapNonEmpty!54124 (= mapRes!54124 (and tp!103205 e!745333))))

(declare-fun mapKey!54124 () (_ BitVec 32))

(declare-fun mapValue!54124 () ValueCell!16598)

(declare-fun mapRest!54124 () (Array (_ BitVec 32) ValueCell!16598))

(assert (=> mapNonEmpty!54124 (= mapRest!54115 (store mapRest!54124 mapKey!54124 mapValue!54124))))

(declare-fun b!1306432 () Bool)

(assert (=> b!1306432 (= e!745333 tp_is_empty!34993)))

(declare-fun b!1306433 () Bool)

(declare-fun e!745334 () Bool)

(assert (=> b!1306433 (= e!745334 tp_is_empty!34993)))

(declare-fun condMapEmpty!54124 () Bool)

(declare-fun mapDefault!54124 () ValueCell!16598)

(assert (=> mapNonEmpty!54115 (= condMapEmpty!54124 (= mapRest!54115 ((as const (Array (_ BitVec 32) ValueCell!16598)) mapDefault!54124)))))

(assert (=> mapNonEmpty!54115 (= tp!103196 (and e!745334 mapRes!54124))))

(assert (= (and mapNonEmpty!54115 condMapEmpty!54124) mapIsEmpty!54124))

(assert (= (and mapNonEmpty!54115 (not condMapEmpty!54124)) mapNonEmpty!54124))

(assert (= (and mapNonEmpty!54124 ((_ is ValueCellFull!16598) mapValue!54124)) b!1306432))

(assert (= (and mapNonEmpty!54115 ((_ is ValueCellFull!16598) mapDefault!54124)) b!1306433))

(declare-fun m!1197007 () Bool)

(assert (=> mapNonEmpty!54124 m!1197007))

(check-sat (not b!1306413) (not b!1306405) (not mapNonEmpty!54124) (not b!1306412) (not b!1306407) (not d!142141) (not b!1306424) tp_is_empty!34993 (not d!142139) (not b!1306425) (not bm!64610))
(check-sat)
