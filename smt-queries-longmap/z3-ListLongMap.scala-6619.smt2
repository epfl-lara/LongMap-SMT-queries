; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83676 () Bool)

(assert start!83676)

(declare-fun b!977256 () Bool)

(declare-fun e!550874 () Bool)

(declare-fun e!550879 () Bool)

(assert (=> b!977256 (= e!550874 e!550879)))

(declare-fun res!654080 () Bool)

(assert (=> b!977256 (=> res!654080 e!550879)))

(declare-datatypes ((List!20371 0))(
  ( (Nil!20368) (Cons!20367 (h!21529 (_ BitVec 64)) (t!28886 List!20371)) )
))
(declare-fun contains!5705 (List!20371 (_ BitVec 64)) Bool)

(assert (=> b!977256 (= res!654080 (contains!5705 Nil!20368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!35762 () Bool)

(declare-fun mapRes!35762 () Bool)

(assert (=> mapIsEmpty!35762 mapRes!35762))

(declare-fun b!977257 () Bool)

(declare-fun e!550875 () Bool)

(declare-fun tp_is_empty!22491 () Bool)

(assert (=> b!977257 (= e!550875 tp_is_empty!22491)))

(declare-fun b!977258 () Bool)

(declare-fun res!654084 () Bool)

(assert (=> b!977258 (=> (not res!654084) (not e!550874))))

(declare-fun noDuplicate!1377 (List!20371) Bool)

(assert (=> b!977258 (= res!654084 (noDuplicate!1377 Nil!20368))))

(declare-fun b!977259 () Bool)

(declare-fun res!654079 () Bool)

(assert (=> b!977259 (=> (not res!654079) (not e!550874))))

(declare-datatypes ((array!61015 0))(
  ( (array!61016 (arr!29366 (Array (_ BitVec 32) (_ BitVec 64))) (size!29845 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61015)

(assert (=> b!977259 (= res!654079 (and (bvsle #b00000000000000000000000000000000 (size!29845 _keys!1544)) (bvslt (size!29845 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!35762 () Bool)

(declare-fun tp!68014 () Bool)

(declare-fun e!550878 () Bool)

(assert (=> mapNonEmpty!35762 (= mapRes!35762 (and tp!68014 e!550878))))

(declare-datatypes ((V!34971 0))(
  ( (V!34972 (val!11296 Int)) )
))
(declare-datatypes ((ValueCell!10764 0))(
  ( (ValueCellFull!10764 (v!13857 V!34971)) (EmptyCell!10764) )
))
(declare-fun mapValue!35762 () ValueCell!10764)

(declare-datatypes ((array!61017 0))(
  ( (array!61018 (arr!29367 (Array (_ BitVec 32) ValueCell!10764)) (size!29846 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61017)

(declare-fun mapKey!35762 () (_ BitVec 32))

(declare-fun mapRest!35762 () (Array (_ BitVec 32) ValueCell!10764))

(assert (=> mapNonEmpty!35762 (= (arr!29367 _values!1278) (store mapRest!35762 mapKey!35762 mapValue!35762))))

(declare-fun b!977261 () Bool)

(declare-fun res!654083 () Bool)

(assert (=> b!977261 (=> (not res!654083) (not e!550874))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61015 (_ BitVec 32)) Bool)

(assert (=> b!977261 (= res!654083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977262 () Bool)

(declare-fun res!654082 () Bool)

(assert (=> b!977262 (=> (not res!654082) (not e!550874))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977262 (= res!654082 (and (= (size!29846 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29845 _keys!1544) (size!29846 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977263 () Bool)

(declare-fun e!550877 () Bool)

(assert (=> b!977263 (= e!550877 (and e!550875 mapRes!35762))))

(declare-fun condMapEmpty!35762 () Bool)

(declare-fun mapDefault!35762 () ValueCell!10764)

(assert (=> b!977263 (= condMapEmpty!35762 (= (arr!29367 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10764)) mapDefault!35762)))))

(declare-fun b!977264 () Bool)

(assert (=> b!977264 (= e!550879 (contains!5705 Nil!20368 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977260 () Bool)

(assert (=> b!977260 (= e!550878 tp_is_empty!22491)))

(declare-fun res!654081 () Bool)

(assert (=> start!83676 (=> (not res!654081) (not e!550874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83676 (= res!654081 (validMask!0 mask!1948))))

(assert (=> start!83676 e!550874))

(assert (=> start!83676 true))

(declare-fun array_inv!22701 (array!61017) Bool)

(assert (=> start!83676 (and (array_inv!22701 _values!1278) e!550877)))

(declare-fun array_inv!22702 (array!61015) Bool)

(assert (=> start!83676 (array_inv!22702 _keys!1544)))

(assert (= (and start!83676 res!654081) b!977262))

(assert (= (and b!977262 res!654082) b!977261))

(assert (= (and b!977261 res!654083) b!977259))

(assert (= (and b!977259 res!654079) b!977258))

(assert (= (and b!977258 res!654084) b!977256))

(assert (= (and b!977256 (not res!654080)) b!977264))

(assert (= (and b!977263 condMapEmpty!35762) mapIsEmpty!35762))

(assert (= (and b!977263 (not condMapEmpty!35762)) mapNonEmpty!35762))

(get-info :version)

(assert (= (and mapNonEmpty!35762 ((_ is ValueCellFull!10764) mapValue!35762)) b!977260))

(assert (= (and b!977263 ((_ is ValueCellFull!10764) mapDefault!35762)) b!977257))

(assert (= start!83676 b!977263))

(declare-fun m!904579 () Bool)

(assert (=> start!83676 m!904579))

(declare-fun m!904581 () Bool)

(assert (=> start!83676 m!904581))

(declare-fun m!904583 () Bool)

(assert (=> start!83676 m!904583))

(declare-fun m!904585 () Bool)

(assert (=> b!977256 m!904585))

(declare-fun m!904587 () Bool)

(assert (=> b!977264 m!904587))

(declare-fun m!904589 () Bool)

(assert (=> mapNonEmpty!35762 m!904589))

(declare-fun m!904591 () Bool)

(assert (=> b!977261 m!904591))

(declare-fun m!904593 () Bool)

(assert (=> b!977258 m!904593))

(check-sat tp_is_empty!22491 (not b!977261) (not b!977258) (not b!977256) (not start!83676) (not b!977264) (not mapNonEmpty!35762))
(check-sat)
(get-model)

(declare-fun d!116657 () Bool)

(declare-fun res!654107 () Bool)

(declare-fun e!550905 () Bool)

(assert (=> d!116657 (=> res!654107 e!550905)))

(assert (=> d!116657 (= res!654107 (bvsge #b00000000000000000000000000000000 (size!29845 _keys!1544)))))

(assert (=> d!116657 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!550905)))

(declare-fun b!977300 () Bool)

(declare-fun e!550906 () Bool)

(declare-fun e!550904 () Bool)

(assert (=> b!977300 (= e!550906 e!550904)))

(declare-fun lt!433443 () (_ BitVec 64))

(assert (=> b!977300 (= lt!433443 (select (arr!29366 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32495 0))(
  ( (Unit!32496) )
))
(declare-fun lt!433442 () Unit!32495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!61015 (_ BitVec 64) (_ BitVec 32)) Unit!32495)

(assert (=> b!977300 (= lt!433442 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433443 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!61015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!977300 (arrayContainsKey!0 _keys!1544 lt!433443 #b00000000000000000000000000000000)))

(declare-fun lt!433444 () Unit!32495)

(assert (=> b!977300 (= lt!433444 lt!433442)))

(declare-fun res!654108 () Bool)

(declare-datatypes ((SeekEntryResult!9205 0))(
  ( (MissingZero!9205 (index!39191 (_ BitVec 32))) (Found!9205 (index!39192 (_ BitVec 32))) (Intermediate!9205 (undefined!10017 Bool) (index!39193 (_ BitVec 32)) (x!84566 (_ BitVec 32))) (Undefined!9205) (MissingVacant!9205 (index!39194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!61015 (_ BitVec 32)) SeekEntryResult!9205)

(assert (=> b!977300 (= res!654108 (= (seekEntryOrOpen!0 (select (arr!29366 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9205 #b00000000000000000000000000000000)))))

(assert (=> b!977300 (=> (not res!654108) (not e!550904))))

(declare-fun b!977301 () Bool)

(assert (=> b!977301 (= e!550905 e!550906)))

(declare-fun c!100022 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977301 (= c!100022 (validKeyInArray!0 (select (arr!29366 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!977302 () Bool)

(declare-fun call!41793 () Bool)

(assert (=> b!977302 (= e!550904 call!41793)))

(declare-fun bm!41790 () Bool)

(assert (=> bm!41790 (= call!41793 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!977303 () Bool)

(assert (=> b!977303 (= e!550906 call!41793)))

(assert (= (and d!116657 (not res!654107)) b!977301))

(assert (= (and b!977301 c!100022) b!977300))

(assert (= (and b!977301 (not c!100022)) b!977303))

(assert (= (and b!977300 res!654108) b!977302))

(assert (= (or b!977302 b!977303) bm!41790))

(declare-fun m!904611 () Bool)

(assert (=> b!977300 m!904611))

(declare-fun m!904613 () Bool)

(assert (=> b!977300 m!904613))

(declare-fun m!904615 () Bool)

(assert (=> b!977300 m!904615))

(assert (=> b!977300 m!904611))

(declare-fun m!904617 () Bool)

(assert (=> b!977300 m!904617))

(assert (=> b!977301 m!904611))

(assert (=> b!977301 m!904611))

(declare-fun m!904619 () Bool)

(assert (=> b!977301 m!904619))

(declare-fun m!904621 () Bool)

(assert (=> bm!41790 m!904621))

(assert (=> b!977261 d!116657))

(declare-fun d!116659 () Bool)

(declare-fun lt!433447 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!417 (List!20371) (InoxSet (_ BitVec 64)))

(assert (=> d!116659 (= lt!433447 (select (content!417 Nil!20368) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!550911 () Bool)

(assert (=> d!116659 (= lt!433447 e!550911)))

(declare-fun res!654114 () Bool)

(assert (=> d!116659 (=> (not res!654114) (not e!550911))))

(assert (=> d!116659 (= res!654114 ((_ is Cons!20367) Nil!20368))))

(assert (=> d!116659 (= (contains!5705 Nil!20368 #b0000000000000000000000000000000000000000000000000000000000000000) lt!433447)))

(declare-fun b!977308 () Bool)

(declare-fun e!550912 () Bool)

(assert (=> b!977308 (= e!550911 e!550912)))

(declare-fun res!654113 () Bool)

(assert (=> b!977308 (=> res!654113 e!550912)))

(assert (=> b!977308 (= res!654113 (= (h!21529 Nil!20368) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977309 () Bool)

(assert (=> b!977309 (= e!550912 (contains!5705 (t!28886 Nil!20368) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116659 res!654114) b!977308))

(assert (= (and b!977308 (not res!654113)) b!977309))

(declare-fun m!904623 () Bool)

(assert (=> d!116659 m!904623))

(declare-fun m!904625 () Bool)

(assert (=> d!116659 m!904625))

(declare-fun m!904627 () Bool)

(assert (=> b!977309 m!904627))

(assert (=> b!977256 d!116659))

(declare-fun d!116661 () Bool)

(declare-fun lt!433448 () Bool)

(assert (=> d!116661 (= lt!433448 (select (content!417 Nil!20368) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!550913 () Bool)

(assert (=> d!116661 (= lt!433448 e!550913)))

(declare-fun res!654116 () Bool)

(assert (=> d!116661 (=> (not res!654116) (not e!550913))))

(assert (=> d!116661 (= res!654116 ((_ is Cons!20367) Nil!20368))))

(assert (=> d!116661 (= (contains!5705 Nil!20368 #b1000000000000000000000000000000000000000000000000000000000000000) lt!433448)))

(declare-fun b!977310 () Bool)

(declare-fun e!550914 () Bool)

(assert (=> b!977310 (= e!550913 e!550914)))

(declare-fun res!654115 () Bool)

(assert (=> b!977310 (=> res!654115 e!550914)))

(assert (=> b!977310 (= res!654115 (= (h!21529 Nil!20368) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977311 () Bool)

(assert (=> b!977311 (= e!550914 (contains!5705 (t!28886 Nil!20368) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116661 res!654116) b!977310))

(assert (= (and b!977310 (not res!654115)) b!977311))

(assert (=> d!116661 m!904623))

(declare-fun m!904629 () Bool)

(assert (=> d!116661 m!904629))

(declare-fun m!904631 () Bool)

(assert (=> b!977311 m!904631))

(assert (=> b!977264 d!116661))

(declare-fun d!116663 () Bool)

(assert (=> d!116663 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83676 d!116663))

(declare-fun d!116665 () Bool)

(assert (=> d!116665 (= (array_inv!22701 _values!1278) (bvsge (size!29846 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83676 d!116665))

(declare-fun d!116667 () Bool)

(assert (=> d!116667 (= (array_inv!22702 _keys!1544) (bvsge (size!29845 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83676 d!116667))

(declare-fun d!116669 () Bool)

(declare-fun res!654121 () Bool)

(declare-fun e!550919 () Bool)

(assert (=> d!116669 (=> res!654121 e!550919)))

(assert (=> d!116669 (= res!654121 ((_ is Nil!20368) Nil!20368))))

(assert (=> d!116669 (= (noDuplicate!1377 Nil!20368) e!550919)))

(declare-fun b!977316 () Bool)

(declare-fun e!550920 () Bool)

(assert (=> b!977316 (= e!550919 e!550920)))

(declare-fun res!654122 () Bool)

(assert (=> b!977316 (=> (not res!654122) (not e!550920))))

(assert (=> b!977316 (= res!654122 (not (contains!5705 (t!28886 Nil!20368) (h!21529 Nil!20368))))))

(declare-fun b!977317 () Bool)

(assert (=> b!977317 (= e!550920 (noDuplicate!1377 (t!28886 Nil!20368)))))

(assert (= (and d!116669 (not res!654121)) b!977316))

(assert (= (and b!977316 res!654122) b!977317))

(declare-fun m!904633 () Bool)

(assert (=> b!977316 m!904633))

(declare-fun m!904635 () Bool)

(assert (=> b!977317 m!904635))

(assert (=> b!977258 d!116669))

(declare-fun b!977324 () Bool)

(declare-fun e!550925 () Bool)

(assert (=> b!977324 (= e!550925 tp_is_empty!22491)))

(declare-fun condMapEmpty!35768 () Bool)

(declare-fun mapDefault!35768 () ValueCell!10764)

(assert (=> mapNonEmpty!35762 (= condMapEmpty!35768 (= mapRest!35762 ((as const (Array (_ BitVec 32) ValueCell!10764)) mapDefault!35768)))))

(declare-fun e!550926 () Bool)

(declare-fun mapRes!35768 () Bool)

(assert (=> mapNonEmpty!35762 (= tp!68014 (and e!550926 mapRes!35768))))

(declare-fun b!977325 () Bool)

(assert (=> b!977325 (= e!550926 tp_is_empty!22491)))

(declare-fun mapIsEmpty!35768 () Bool)

(assert (=> mapIsEmpty!35768 mapRes!35768))

(declare-fun mapNonEmpty!35768 () Bool)

(declare-fun tp!68020 () Bool)

(assert (=> mapNonEmpty!35768 (= mapRes!35768 (and tp!68020 e!550925))))

(declare-fun mapRest!35768 () (Array (_ BitVec 32) ValueCell!10764))

(declare-fun mapKey!35768 () (_ BitVec 32))

(declare-fun mapValue!35768 () ValueCell!10764)

(assert (=> mapNonEmpty!35768 (= mapRest!35762 (store mapRest!35768 mapKey!35768 mapValue!35768))))

(assert (= (and mapNonEmpty!35762 condMapEmpty!35768) mapIsEmpty!35768))

(assert (= (and mapNonEmpty!35762 (not condMapEmpty!35768)) mapNonEmpty!35768))

(assert (= (and mapNonEmpty!35768 ((_ is ValueCellFull!10764) mapValue!35768)) b!977324))

(assert (= (and mapNonEmpty!35762 ((_ is ValueCellFull!10764) mapDefault!35768)) b!977325))

(declare-fun m!904637 () Bool)

(assert (=> mapNonEmpty!35768 m!904637))

(check-sat tp_is_empty!22491 (not b!977301) (not d!116659) (not mapNonEmpty!35768) (not b!977309) (not b!977311) (not d!116661) (not b!977300) (not bm!41790) (not b!977316) (not b!977317))
(check-sat)
