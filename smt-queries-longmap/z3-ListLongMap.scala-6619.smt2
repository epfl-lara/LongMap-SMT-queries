; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83842 () Bool)

(assert start!83842)

(declare-fun mapIsEmpty!35759 () Bool)

(declare-fun mapRes!35759 () Bool)

(assert (=> mapIsEmpty!35759 mapRes!35759))

(declare-fun b!978132 () Bool)

(declare-fun res!654410 () Bool)

(declare-fun e!551440 () Bool)

(assert (=> b!978132 (=> (not res!654410) (not e!551440))))

(declare-datatypes ((array!61048 0))(
  ( (array!61049 (arr!29378 (Array (_ BitVec 32) (_ BitVec 64))) (size!29858 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61048)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61048 (_ BitVec 32)) Bool)

(assert (=> b!978132 (= res!654410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978133 () Bool)

(declare-fun e!551439 () Bool)

(assert (=> b!978133 (= e!551440 e!551439)))

(declare-fun res!654408 () Bool)

(assert (=> b!978133 (=> res!654408 e!551439)))

(declare-datatypes ((List!20366 0))(
  ( (Nil!20363) (Cons!20362 (h!21530 (_ BitVec 64)) (t!28873 List!20366)) )
))
(declare-fun contains!5727 (List!20366 (_ BitVec 64)) Bool)

(assert (=> b!978133 (= res!654408 (contains!5727 Nil!20363 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!978134 () Bool)

(declare-fun res!654407 () Bool)

(assert (=> b!978134 (=> (not res!654407) (not e!551440))))

(declare-fun noDuplicate!1386 (List!20366) Bool)

(assert (=> b!978134 (= res!654407 (noDuplicate!1386 Nil!20363))))

(declare-fun b!978135 () Bool)

(declare-fun e!551438 () Bool)

(declare-fun e!551442 () Bool)

(assert (=> b!978135 (= e!551438 (and e!551442 mapRes!35759))))

(declare-fun condMapEmpty!35759 () Bool)

(declare-datatypes ((V!34969 0))(
  ( (V!34970 (val!11295 Int)) )
))
(declare-datatypes ((ValueCell!10763 0))(
  ( (ValueCellFull!10763 (v!13853 V!34969)) (EmptyCell!10763) )
))
(declare-datatypes ((array!61050 0))(
  ( (array!61051 (arr!29379 (Array (_ BitVec 32) ValueCell!10763)) (size!29859 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61050)

(declare-fun mapDefault!35759 () ValueCell!10763)

(assert (=> b!978135 (= condMapEmpty!35759 (= (arr!29379 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10763)) mapDefault!35759)))))

(declare-fun b!978136 () Bool)

(declare-fun e!551443 () Bool)

(declare-fun tp_is_empty!22489 () Bool)

(assert (=> b!978136 (= e!551443 tp_is_empty!22489)))

(declare-fun res!654409 () Bool)

(assert (=> start!83842 (=> (not res!654409) (not e!551440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83842 (= res!654409 (validMask!0 mask!1948))))

(assert (=> start!83842 e!551440))

(assert (=> start!83842 true))

(declare-fun array_inv!22765 (array!61050) Bool)

(assert (=> start!83842 (and (array_inv!22765 _values!1278) e!551438)))

(declare-fun array_inv!22766 (array!61048) Bool)

(assert (=> start!83842 (array_inv!22766 _keys!1544)))

(declare-fun mapNonEmpty!35759 () Bool)

(declare-fun tp!68012 () Bool)

(assert (=> mapNonEmpty!35759 (= mapRes!35759 (and tp!68012 e!551443))))

(declare-fun mapValue!35759 () ValueCell!10763)

(declare-fun mapKey!35759 () (_ BitVec 32))

(declare-fun mapRest!35759 () (Array (_ BitVec 32) ValueCell!10763))

(assert (=> mapNonEmpty!35759 (= (arr!29379 _values!1278) (store mapRest!35759 mapKey!35759 mapValue!35759))))

(declare-fun b!978137 () Bool)

(declare-fun res!654405 () Bool)

(assert (=> b!978137 (=> (not res!654405) (not e!551440))))

(assert (=> b!978137 (= res!654405 (and (bvsle #b00000000000000000000000000000000 (size!29858 _keys!1544)) (bvslt (size!29858 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!978138 () Bool)

(assert (=> b!978138 (= e!551439 (contains!5727 Nil!20363 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!978139 () Bool)

(declare-fun res!654406 () Bool)

(assert (=> b!978139 (=> (not res!654406) (not e!551440))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978139 (= res!654406 (and (= (size!29859 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29858 _keys!1544) (size!29859 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978140 () Bool)

(assert (=> b!978140 (= e!551442 tp_is_empty!22489)))

(assert (= (and start!83842 res!654409) b!978139))

(assert (= (and b!978139 res!654406) b!978132))

(assert (= (and b!978132 res!654410) b!978137))

(assert (= (and b!978137 res!654405) b!978134))

(assert (= (and b!978134 res!654407) b!978133))

(assert (= (and b!978133 (not res!654408)) b!978138))

(assert (= (and b!978135 condMapEmpty!35759) mapIsEmpty!35759))

(assert (= (and b!978135 (not condMapEmpty!35759)) mapNonEmpty!35759))

(get-info :version)

(assert (= (and mapNonEmpty!35759 ((_ is ValueCellFull!10763) mapValue!35759)) b!978136))

(assert (= (and b!978135 ((_ is ValueCellFull!10763) mapDefault!35759)) b!978140))

(assert (= start!83842 b!978135))

(declare-fun m!905857 () Bool)

(assert (=> b!978138 m!905857))

(declare-fun m!905859 () Bool)

(assert (=> start!83842 m!905859))

(declare-fun m!905861 () Bool)

(assert (=> start!83842 m!905861))

(declare-fun m!905863 () Bool)

(assert (=> start!83842 m!905863))

(declare-fun m!905865 () Bool)

(assert (=> b!978133 m!905865))

(declare-fun m!905867 () Bool)

(assert (=> b!978132 m!905867))

(declare-fun m!905869 () Bool)

(assert (=> b!978134 m!905869))

(declare-fun m!905871 () Bool)

(assert (=> mapNonEmpty!35759 m!905871))

(check-sat tp_is_empty!22489 (not mapNonEmpty!35759) (not b!978134) (not start!83842) (not b!978133) (not b!978138) (not b!978132))
(check-sat)
(get-model)

(declare-fun b!978203 () Bool)

(declare-fun e!551488 () Bool)

(declare-fun call!41838 () Bool)

(assert (=> b!978203 (= e!551488 call!41838)))

(declare-fun d!116979 () Bool)

(declare-fun res!654452 () Bool)

(declare-fun e!551486 () Bool)

(assert (=> d!116979 (=> res!654452 e!551486)))

(assert (=> d!116979 (= res!654452 (bvsge #b00000000000000000000000000000000 (size!29858 _keys!1544)))))

(assert (=> d!116979 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!551486)))

(declare-fun b!978204 () Bool)

(assert (=> b!978204 (= e!551486 e!551488)))

(declare-fun c!100304 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978204 (= c!100304 (validKeyInArray!0 (select (arr!29378 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!978205 () Bool)

(declare-fun e!551487 () Bool)

(assert (=> b!978205 (= e!551488 e!551487)))

(declare-fun lt!433804 () (_ BitVec 64))

(assert (=> b!978205 (= lt!433804 (select (arr!29378 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32464 0))(
  ( (Unit!32465) )
))
(declare-fun lt!433805 () Unit!32464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!61048 (_ BitVec 64) (_ BitVec 32)) Unit!32464)

(assert (=> b!978205 (= lt!433805 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433804 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!61048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!978205 (arrayContainsKey!0 _keys!1544 lt!433804 #b00000000000000000000000000000000)))

(declare-fun lt!433803 () Unit!32464)

(assert (=> b!978205 (= lt!433803 lt!433805)))

(declare-fun res!654451 () Bool)

(declare-datatypes ((SeekEntryResult!9160 0))(
  ( (MissingZero!9160 (index!39011 (_ BitVec 32))) (Found!9160 (index!39012 (_ BitVec 32))) (Intermediate!9160 (undefined!9972 Bool) (index!39013 (_ BitVec 32)) (x!84535 (_ BitVec 32))) (Undefined!9160) (MissingVacant!9160 (index!39014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!61048 (_ BitVec 32)) SeekEntryResult!9160)

(assert (=> b!978205 (= res!654451 (= (seekEntryOrOpen!0 (select (arr!29378 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9160 #b00000000000000000000000000000000)))))

(assert (=> b!978205 (=> (not res!654451) (not e!551487))))

(declare-fun b!978206 () Bool)

(assert (=> b!978206 (= e!551487 call!41838)))

(declare-fun bm!41835 () Bool)

(assert (=> bm!41835 (= call!41838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!116979 (not res!654452)) b!978204))

(assert (= (and b!978204 c!100304) b!978205))

(assert (= (and b!978204 (not c!100304)) b!978203))

(assert (= (and b!978205 res!654451) b!978206))

(assert (= (or b!978206 b!978203) bm!41835))

(declare-fun m!905905 () Bool)

(assert (=> b!978204 m!905905))

(assert (=> b!978204 m!905905))

(declare-fun m!905907 () Bool)

(assert (=> b!978204 m!905907))

(assert (=> b!978205 m!905905))

(declare-fun m!905909 () Bool)

(assert (=> b!978205 m!905909))

(declare-fun m!905911 () Bool)

(assert (=> b!978205 m!905911))

(assert (=> b!978205 m!905905))

(declare-fun m!905913 () Bool)

(assert (=> b!978205 m!905913))

(declare-fun m!905915 () Bool)

(assert (=> bm!41835 m!905915))

(assert (=> b!978132 d!116979))

(declare-fun d!116981 () Bool)

(declare-fun lt!433808 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!417 (List!20366) (InoxSet (_ BitVec 64)))

(assert (=> d!116981 (= lt!433808 (select (content!417 Nil!20363) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!551493 () Bool)

(assert (=> d!116981 (= lt!433808 e!551493)))

(declare-fun res!654457 () Bool)

(assert (=> d!116981 (=> (not res!654457) (not e!551493))))

(assert (=> d!116981 (= res!654457 ((_ is Cons!20362) Nil!20363))))

(assert (=> d!116981 (= (contains!5727 Nil!20363 #b0000000000000000000000000000000000000000000000000000000000000000) lt!433808)))

(declare-fun b!978211 () Bool)

(declare-fun e!551494 () Bool)

(assert (=> b!978211 (= e!551493 e!551494)))

(declare-fun res!654458 () Bool)

(assert (=> b!978211 (=> res!654458 e!551494)))

(assert (=> b!978211 (= res!654458 (= (h!21530 Nil!20363) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!978212 () Bool)

(assert (=> b!978212 (= e!551494 (contains!5727 (t!28873 Nil!20363) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116981 res!654457) b!978211))

(assert (= (and b!978211 (not res!654458)) b!978212))

(declare-fun m!905917 () Bool)

(assert (=> d!116981 m!905917))

(declare-fun m!905919 () Bool)

(assert (=> d!116981 m!905919))

(declare-fun m!905921 () Bool)

(assert (=> b!978212 m!905921))

(assert (=> b!978133 d!116981))

(declare-fun d!116983 () Bool)

(assert (=> d!116983 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83842 d!116983))

(declare-fun d!116985 () Bool)

(assert (=> d!116985 (= (array_inv!22765 _values!1278) (bvsge (size!29859 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83842 d!116985))

(declare-fun d!116987 () Bool)

(assert (=> d!116987 (= (array_inv!22766 _keys!1544) (bvsge (size!29858 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83842 d!116987))

(declare-fun d!116989 () Bool)

(declare-fun lt!433809 () Bool)

(assert (=> d!116989 (= lt!433809 (select (content!417 Nil!20363) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!551495 () Bool)

(assert (=> d!116989 (= lt!433809 e!551495)))

(declare-fun res!654459 () Bool)

(assert (=> d!116989 (=> (not res!654459) (not e!551495))))

(assert (=> d!116989 (= res!654459 ((_ is Cons!20362) Nil!20363))))

(assert (=> d!116989 (= (contains!5727 Nil!20363 #b1000000000000000000000000000000000000000000000000000000000000000) lt!433809)))

(declare-fun b!978213 () Bool)

(declare-fun e!551496 () Bool)

(assert (=> b!978213 (= e!551495 e!551496)))

(declare-fun res!654460 () Bool)

(assert (=> b!978213 (=> res!654460 e!551496)))

(assert (=> b!978213 (= res!654460 (= (h!21530 Nil!20363) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!978214 () Bool)

(assert (=> b!978214 (= e!551496 (contains!5727 (t!28873 Nil!20363) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116989 res!654459) b!978213))

(assert (= (and b!978213 (not res!654460)) b!978214))

(assert (=> d!116989 m!905917))

(declare-fun m!905923 () Bool)

(assert (=> d!116989 m!905923))

(declare-fun m!905925 () Bool)

(assert (=> b!978214 m!905925))

(assert (=> b!978138 d!116989))

(declare-fun d!116991 () Bool)

(declare-fun res!654465 () Bool)

(declare-fun e!551501 () Bool)

(assert (=> d!116991 (=> res!654465 e!551501)))

(assert (=> d!116991 (= res!654465 ((_ is Nil!20363) Nil!20363))))

(assert (=> d!116991 (= (noDuplicate!1386 Nil!20363) e!551501)))

(declare-fun b!978219 () Bool)

(declare-fun e!551502 () Bool)

(assert (=> b!978219 (= e!551501 e!551502)))

(declare-fun res!654466 () Bool)

(assert (=> b!978219 (=> (not res!654466) (not e!551502))))

(assert (=> b!978219 (= res!654466 (not (contains!5727 (t!28873 Nil!20363) (h!21530 Nil!20363))))))

(declare-fun b!978220 () Bool)

(assert (=> b!978220 (= e!551502 (noDuplicate!1386 (t!28873 Nil!20363)))))

(assert (= (and d!116991 (not res!654465)) b!978219))

(assert (= (and b!978219 res!654466) b!978220))

(declare-fun m!905927 () Bool)

(assert (=> b!978219 m!905927))

(declare-fun m!905929 () Bool)

(assert (=> b!978220 m!905929))

(assert (=> b!978134 d!116991))

(declare-fun mapIsEmpty!35768 () Bool)

(declare-fun mapRes!35768 () Bool)

(assert (=> mapIsEmpty!35768 mapRes!35768))

(declare-fun b!978228 () Bool)

(declare-fun e!551507 () Bool)

(assert (=> b!978228 (= e!551507 tp_is_empty!22489)))

(declare-fun mapNonEmpty!35768 () Bool)

(declare-fun tp!68021 () Bool)

(declare-fun e!551508 () Bool)

(assert (=> mapNonEmpty!35768 (= mapRes!35768 (and tp!68021 e!551508))))

(declare-fun mapValue!35768 () ValueCell!10763)

(declare-fun mapKey!35768 () (_ BitVec 32))

(declare-fun mapRest!35768 () (Array (_ BitVec 32) ValueCell!10763))

(assert (=> mapNonEmpty!35768 (= mapRest!35759 (store mapRest!35768 mapKey!35768 mapValue!35768))))

(declare-fun condMapEmpty!35768 () Bool)

(declare-fun mapDefault!35768 () ValueCell!10763)

(assert (=> mapNonEmpty!35759 (= condMapEmpty!35768 (= mapRest!35759 ((as const (Array (_ BitVec 32) ValueCell!10763)) mapDefault!35768)))))

(assert (=> mapNonEmpty!35759 (= tp!68012 (and e!551507 mapRes!35768))))

(declare-fun b!978227 () Bool)

(assert (=> b!978227 (= e!551508 tp_is_empty!22489)))

(assert (= (and mapNonEmpty!35759 condMapEmpty!35768) mapIsEmpty!35768))

(assert (= (and mapNonEmpty!35759 (not condMapEmpty!35768)) mapNonEmpty!35768))

(assert (= (and mapNonEmpty!35768 ((_ is ValueCellFull!10763) mapValue!35768)) b!978227))

(assert (= (and mapNonEmpty!35759 ((_ is ValueCellFull!10763) mapDefault!35768)) b!978228))

(declare-fun m!905931 () Bool)

(assert (=> mapNonEmpty!35768 m!905931))

(check-sat tp_is_empty!22489 (not bm!41835) (not mapNonEmpty!35768) (not d!116989) (not b!978220) (not b!978204) (not d!116981) (not b!978212) (not b!978219) (not b!978205) (not b!978214))
(check-sat)
