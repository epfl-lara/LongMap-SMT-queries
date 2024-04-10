; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82114 () Bool)

(assert start!82114)

(declare-fun b!957247 () Bool)

(declare-fun e!539533 () Bool)

(declare-fun e!539530 () Bool)

(assert (=> b!957247 (= e!539533 e!539530)))

(declare-fun res!640830 () Bool)

(assert (=> b!957247 (=> res!640830 e!539530)))

(declare-datatypes ((List!19504 0))(
  ( (Nil!19501) (Cons!19500 (h!20662 (_ BitVec 64)) (t!27867 List!19504)) )
))
(declare-fun contains!5316 (List!19504 (_ BitVec 64)) Bool)

(assert (=> b!957247 (= res!640830 (contains!5316 Nil!19501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!957248 () Bool)

(declare-fun res!640825 () Bool)

(assert (=> b!957248 (=> (not res!640825) (not e!539533))))

(declare-fun noDuplicate!1364 (List!19504) Bool)

(assert (=> b!957248 (= res!640825 (noDuplicate!1364 Nil!19501))))

(declare-fun mapIsEmpty!33634 () Bool)

(declare-fun mapRes!33634 () Bool)

(assert (=> mapIsEmpty!33634 mapRes!33634))

(declare-fun b!957250 () Bool)

(declare-fun res!640829 () Bool)

(assert (=> b!957250 (=> (not res!640829) (not e!539533))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58315 0))(
  ( (array!58316 (arr!28032 (Array (_ BitVec 32) (_ BitVec 64))) (size!28511 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58315)

(declare-datatypes ((V!33123 0))(
  ( (V!33124 (val!10603 Int)) )
))
(declare-datatypes ((ValueCell!10071 0))(
  ( (ValueCellFull!10071 (v!13159 V!33123)) (EmptyCell!10071) )
))
(declare-datatypes ((array!58317 0))(
  ( (array!58318 (arr!28033 (Array (_ BitVec 32) ValueCell!10071)) (size!28512 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58317)

(assert (=> b!957250 (= res!640829 (and (= (size!28512 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28511 _keys!1668) (size!28512 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957251 () Bool)

(assert (=> b!957251 (= e!539530 (contains!5316 Nil!19501 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!957252 () Bool)

(declare-fun e!539529 () Bool)

(declare-fun tp_is_empty!21105 () Bool)

(assert (=> b!957252 (= e!539529 tp_is_empty!21105)))

(declare-fun b!957253 () Bool)

(declare-fun res!640828 () Bool)

(assert (=> b!957253 (=> (not res!640828) (not e!539533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58315 (_ BitVec 32)) Bool)

(assert (=> b!957253 (= res!640828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33634 () Bool)

(declare-fun tp!64239 () Bool)

(declare-fun e!539532 () Bool)

(assert (=> mapNonEmpty!33634 (= mapRes!33634 (and tp!64239 e!539532))))

(declare-fun mapValue!33634 () ValueCell!10071)

(declare-fun mapRest!33634 () (Array (_ BitVec 32) ValueCell!10071))

(declare-fun mapKey!33634 () (_ BitVec 32))

(assert (=> mapNonEmpty!33634 (= (arr!28033 _values!1386) (store mapRest!33634 mapKey!33634 mapValue!33634))))

(declare-fun b!957254 () Bool)

(declare-fun e!539528 () Bool)

(assert (=> b!957254 (= e!539528 (and e!539529 mapRes!33634))))

(declare-fun condMapEmpty!33634 () Bool)

(declare-fun mapDefault!33634 () ValueCell!10071)

(assert (=> b!957254 (= condMapEmpty!33634 (= (arr!28033 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10071)) mapDefault!33634)))))

(declare-fun b!957255 () Bool)

(declare-fun res!640826 () Bool)

(assert (=> b!957255 (=> (not res!640826) (not e!539533))))

(assert (=> b!957255 (= res!640826 (and (bvsle #b00000000000000000000000000000000 (size!28511 _keys!1668)) (bvslt (size!28511 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun res!640827 () Bool)

(assert (=> start!82114 (=> (not res!640827) (not e!539533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82114 (= res!640827 (validMask!0 mask!2088))))

(assert (=> start!82114 e!539533))

(assert (=> start!82114 true))

(declare-fun array_inv!21749 (array!58317) Bool)

(assert (=> start!82114 (and (array_inv!21749 _values!1386) e!539528)))

(declare-fun array_inv!21750 (array!58315) Bool)

(assert (=> start!82114 (array_inv!21750 _keys!1668)))

(declare-fun b!957249 () Bool)

(assert (=> b!957249 (= e!539532 tp_is_empty!21105)))

(assert (= (and start!82114 res!640827) b!957250))

(assert (= (and b!957250 res!640829) b!957253))

(assert (= (and b!957253 res!640828) b!957255))

(assert (= (and b!957255 res!640826) b!957248))

(assert (= (and b!957248 res!640825) b!957247))

(assert (= (and b!957247 (not res!640830)) b!957251))

(assert (= (and b!957254 condMapEmpty!33634) mapIsEmpty!33634))

(assert (= (and b!957254 (not condMapEmpty!33634)) mapNonEmpty!33634))

(get-info :version)

(assert (= (and mapNonEmpty!33634 ((_ is ValueCellFull!10071) mapValue!33634)) b!957249))

(assert (= (and b!957254 ((_ is ValueCellFull!10071) mapDefault!33634)) b!957252))

(assert (= start!82114 b!957254))

(declare-fun m!888281 () Bool)

(assert (=> b!957253 m!888281))

(declare-fun m!888283 () Bool)

(assert (=> mapNonEmpty!33634 m!888283))

(declare-fun m!888285 () Bool)

(assert (=> b!957247 m!888285))

(declare-fun m!888287 () Bool)

(assert (=> b!957251 m!888287))

(declare-fun m!888289 () Bool)

(assert (=> b!957248 m!888289))

(declare-fun m!888291 () Bool)

(assert (=> start!82114 m!888291))

(declare-fun m!888293 () Bool)

(assert (=> start!82114 m!888293))

(declare-fun m!888295 () Bool)

(assert (=> start!82114 m!888295))

(check-sat (not b!957253) (not b!957247) tp_is_empty!21105 (not mapNonEmpty!33634) (not b!957251) (not b!957248) (not start!82114))
(check-sat)
(get-model)

(declare-fun d!115903 () Bool)

(declare-fun res!640853 () Bool)

(declare-fun e!539556 () Bool)

(assert (=> d!115903 (=> res!640853 e!539556)))

(assert (=> d!115903 (= res!640853 ((_ is Nil!19501) Nil!19501))))

(assert (=> d!115903 (= (noDuplicate!1364 Nil!19501) e!539556)))

(declare-fun b!957287 () Bool)

(declare-fun e!539557 () Bool)

(assert (=> b!957287 (= e!539556 e!539557)))

(declare-fun res!640854 () Bool)

(assert (=> b!957287 (=> (not res!640854) (not e!539557))))

(assert (=> b!957287 (= res!640854 (not (contains!5316 (t!27867 Nil!19501) (h!20662 Nil!19501))))))

(declare-fun b!957288 () Bool)

(assert (=> b!957288 (= e!539557 (noDuplicate!1364 (t!27867 Nil!19501)))))

(assert (= (and d!115903 (not res!640853)) b!957287))

(assert (= (and b!957287 res!640854) b!957288))

(declare-fun m!888313 () Bool)

(assert (=> b!957287 m!888313))

(declare-fun m!888315 () Bool)

(assert (=> b!957288 m!888315))

(assert (=> b!957248 d!115903))

(declare-fun bm!41714 () Bool)

(declare-fun call!41717 () Bool)

(assert (=> bm!41714 (= call!41717 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(declare-fun b!957297 () Bool)

(declare-fun e!539566 () Bool)

(declare-fun e!539565 () Bool)

(assert (=> b!957297 (= e!539566 e!539565)))

(declare-fun lt!430298 () (_ BitVec 64))

(assert (=> b!957297 (= lt!430298 (select (arr!28032 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32157 0))(
  ( (Unit!32158) )
))
(declare-fun lt!430296 () Unit!32157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58315 (_ BitVec 64) (_ BitVec 32)) Unit!32157)

(assert (=> b!957297 (= lt!430296 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430298 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!957297 (arrayContainsKey!0 _keys!1668 lt!430298 #b00000000000000000000000000000000)))

(declare-fun lt!430297 () Unit!32157)

(assert (=> b!957297 (= lt!430297 lt!430296)))

(declare-fun res!640860 () Bool)

(declare-datatypes ((SeekEntryResult!9192 0))(
  ( (MissingZero!9192 (index!39139 (_ BitVec 32))) (Found!9192 (index!39140 (_ BitVec 32))) (Intermediate!9192 (undefined!10004 Bool) (index!39141 (_ BitVec 32)) (x!82510 (_ BitVec 32))) (Undefined!9192) (MissingVacant!9192 (index!39142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58315 (_ BitVec 32)) SeekEntryResult!9192)

(assert (=> b!957297 (= res!640860 (= (seekEntryOrOpen!0 (select (arr!28032 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9192 #b00000000000000000000000000000000)))))

(assert (=> b!957297 (=> (not res!640860) (not e!539565))))

(declare-fun b!957298 () Bool)

(declare-fun e!539564 () Bool)

(assert (=> b!957298 (= e!539564 e!539566)))

(declare-fun c!99905 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957298 (= c!99905 (validKeyInArray!0 (select (arr!28032 _keys!1668) #b00000000000000000000000000000000)))))

(declare-fun d!115905 () Bool)

(declare-fun res!640859 () Bool)

(assert (=> d!115905 (=> res!640859 e!539564)))

(assert (=> d!115905 (= res!640859 (bvsge #b00000000000000000000000000000000 (size!28511 _keys!1668)))))

(assert (=> d!115905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!539564)))

(declare-fun b!957299 () Bool)

(assert (=> b!957299 (= e!539565 call!41717)))

(declare-fun b!957300 () Bool)

(assert (=> b!957300 (= e!539566 call!41717)))

(assert (= (and d!115905 (not res!640859)) b!957298))

(assert (= (and b!957298 c!99905) b!957297))

(assert (= (and b!957298 (not c!99905)) b!957300))

(assert (= (and b!957297 res!640860) b!957299))

(assert (= (or b!957299 b!957300) bm!41714))

(declare-fun m!888317 () Bool)

(assert (=> bm!41714 m!888317))

(declare-fun m!888319 () Bool)

(assert (=> b!957297 m!888319))

(declare-fun m!888321 () Bool)

(assert (=> b!957297 m!888321))

(declare-fun m!888323 () Bool)

(assert (=> b!957297 m!888323))

(assert (=> b!957297 m!888319))

(declare-fun m!888325 () Bool)

(assert (=> b!957297 m!888325))

(assert (=> b!957298 m!888319))

(assert (=> b!957298 m!888319))

(declare-fun m!888327 () Bool)

(assert (=> b!957298 m!888327))

(assert (=> b!957253 d!115905))

(declare-fun d!115907 () Bool)

(declare-fun lt!430301 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!413 (List!19504) (InoxSet (_ BitVec 64)))

(assert (=> d!115907 (= lt!430301 (select (content!413 Nil!19501) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!539572 () Bool)

(assert (=> d!115907 (= lt!430301 e!539572)))

(declare-fun res!640866 () Bool)

(assert (=> d!115907 (=> (not res!640866) (not e!539572))))

(assert (=> d!115907 (= res!640866 ((_ is Cons!19500) Nil!19501))))

(assert (=> d!115907 (= (contains!5316 Nil!19501 #b1000000000000000000000000000000000000000000000000000000000000000) lt!430301)))

(declare-fun b!957305 () Bool)

(declare-fun e!539571 () Bool)

(assert (=> b!957305 (= e!539572 e!539571)))

(declare-fun res!640865 () Bool)

(assert (=> b!957305 (=> res!640865 e!539571)))

(assert (=> b!957305 (= res!640865 (= (h!20662 Nil!19501) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!957306 () Bool)

(assert (=> b!957306 (= e!539571 (contains!5316 (t!27867 Nil!19501) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115907 res!640866) b!957305))

(assert (= (and b!957305 (not res!640865)) b!957306))

(declare-fun m!888329 () Bool)

(assert (=> d!115907 m!888329))

(declare-fun m!888331 () Bool)

(assert (=> d!115907 m!888331))

(declare-fun m!888333 () Bool)

(assert (=> b!957306 m!888333))

(assert (=> b!957251 d!115907))

(declare-fun d!115909 () Bool)

(declare-fun lt!430302 () Bool)

(assert (=> d!115909 (= lt!430302 (select (content!413 Nil!19501) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!539574 () Bool)

(assert (=> d!115909 (= lt!430302 e!539574)))

(declare-fun res!640868 () Bool)

(assert (=> d!115909 (=> (not res!640868) (not e!539574))))

(assert (=> d!115909 (= res!640868 ((_ is Cons!19500) Nil!19501))))

(assert (=> d!115909 (= (contains!5316 Nil!19501 #b0000000000000000000000000000000000000000000000000000000000000000) lt!430302)))

(declare-fun b!957307 () Bool)

(declare-fun e!539573 () Bool)

(assert (=> b!957307 (= e!539574 e!539573)))

(declare-fun res!640867 () Bool)

(assert (=> b!957307 (=> res!640867 e!539573)))

(assert (=> b!957307 (= res!640867 (= (h!20662 Nil!19501) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!957308 () Bool)

(assert (=> b!957308 (= e!539573 (contains!5316 (t!27867 Nil!19501) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115909 res!640868) b!957307))

(assert (= (and b!957307 (not res!640867)) b!957308))

(assert (=> d!115909 m!888329))

(declare-fun m!888335 () Bool)

(assert (=> d!115909 m!888335))

(declare-fun m!888337 () Bool)

(assert (=> b!957308 m!888337))

(assert (=> b!957247 d!115909))

(declare-fun d!115911 () Bool)

(assert (=> d!115911 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82114 d!115911))

(declare-fun d!115913 () Bool)

(assert (=> d!115913 (= (array_inv!21749 _values!1386) (bvsge (size!28512 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82114 d!115913))

(declare-fun d!115915 () Bool)

(assert (=> d!115915 (= (array_inv!21750 _keys!1668) (bvsge (size!28511 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82114 d!115915))

(declare-fun mapIsEmpty!33640 () Bool)

(declare-fun mapRes!33640 () Bool)

(assert (=> mapIsEmpty!33640 mapRes!33640))

(declare-fun b!957316 () Bool)

(declare-fun e!539580 () Bool)

(assert (=> b!957316 (= e!539580 tp_is_empty!21105)))

(declare-fun b!957315 () Bool)

(declare-fun e!539579 () Bool)

(assert (=> b!957315 (= e!539579 tp_is_empty!21105)))

(declare-fun mapNonEmpty!33640 () Bool)

(declare-fun tp!64245 () Bool)

(assert (=> mapNonEmpty!33640 (= mapRes!33640 (and tp!64245 e!539579))))

(declare-fun mapValue!33640 () ValueCell!10071)

(declare-fun mapKey!33640 () (_ BitVec 32))

(declare-fun mapRest!33640 () (Array (_ BitVec 32) ValueCell!10071))

(assert (=> mapNonEmpty!33640 (= mapRest!33634 (store mapRest!33640 mapKey!33640 mapValue!33640))))

(declare-fun condMapEmpty!33640 () Bool)

(declare-fun mapDefault!33640 () ValueCell!10071)

(assert (=> mapNonEmpty!33634 (= condMapEmpty!33640 (= mapRest!33634 ((as const (Array (_ BitVec 32) ValueCell!10071)) mapDefault!33640)))))

(assert (=> mapNonEmpty!33634 (= tp!64239 (and e!539580 mapRes!33640))))

(assert (= (and mapNonEmpty!33634 condMapEmpty!33640) mapIsEmpty!33640))

(assert (= (and mapNonEmpty!33634 (not condMapEmpty!33640)) mapNonEmpty!33640))

(assert (= (and mapNonEmpty!33640 ((_ is ValueCellFull!10071) mapValue!33640)) b!957315))

(assert (= (and mapNonEmpty!33634 ((_ is ValueCellFull!10071) mapDefault!33640)) b!957316))

(declare-fun m!888339 () Bool)

(assert (=> mapNonEmpty!33640 m!888339))

(check-sat (not b!957306) (not b!957298) tp_is_empty!21105 (not d!115909) (not d!115907) (not mapNonEmpty!33640) (not b!957288) (not b!957308) (not b!957297) (not b!957287) (not bm!41714))
(check-sat)
