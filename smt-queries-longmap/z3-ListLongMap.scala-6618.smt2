; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83640 () Bool)

(assert start!83640)

(declare-fun b!976897 () Bool)

(declare-fun res!653901 () Bool)

(declare-fun e!550641 () Bool)

(assert (=> b!976897 (=> (not res!653901) (not e!550641))))

(declare-datatypes ((array!60930 0))(
  ( (array!60931 (arr!29325 (Array (_ BitVec 32) (_ BitVec 64))) (size!29806 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60930)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60930 (_ BitVec 32)) Bool)

(assert (=> b!976897 (= res!653901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!976898 () Bool)

(declare-fun e!550643 () Bool)

(declare-fun e!550642 () Bool)

(declare-fun mapRes!35747 () Bool)

(assert (=> b!976898 (= e!550643 (and e!550642 mapRes!35747))))

(declare-fun condMapEmpty!35747 () Bool)

(declare-datatypes ((V!34961 0))(
  ( (V!34962 (val!11292 Int)) )
))
(declare-datatypes ((ValueCell!10760 0))(
  ( (ValueCellFull!10760 (v!13852 V!34961)) (EmptyCell!10760) )
))
(declare-datatypes ((array!60932 0))(
  ( (array!60933 (arr!29326 (Array (_ BitVec 32) ValueCell!10760)) (size!29807 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60932)

(declare-fun mapDefault!35747 () ValueCell!10760)

(assert (=> b!976898 (= condMapEmpty!35747 (= (arr!29326 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10760)) mapDefault!35747)))))

(declare-fun res!653902 () Bool)

(assert (=> start!83640 (=> (not res!653902) (not e!550641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83640 (= res!653902 (validMask!0 mask!1948))))

(assert (=> start!83640 e!550641))

(assert (=> start!83640 true))

(declare-fun array_inv!22711 (array!60932) Bool)

(assert (=> start!83640 (and (array_inv!22711 _values!1278) e!550643)))

(declare-fun array_inv!22712 (array!60930) Bool)

(assert (=> start!83640 (array_inv!22712 _keys!1544)))

(declare-fun b!976899 () Bool)

(declare-fun tp_is_empty!22483 () Bool)

(assert (=> b!976899 (= e!550642 tp_is_empty!22483)))

(declare-fun b!976900 () Bool)

(declare-fun res!653899 () Bool)

(assert (=> b!976900 (=> (not res!653899) (not e!550641))))

(assert (=> b!976900 (= res!653899 (and (bvsle #b00000000000000000000000000000000 (size!29806 _keys!1544)) (bvslt (size!29806 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!976901 () Bool)

(declare-datatypes ((List!20379 0))(
  ( (Nil!20376) (Cons!20375 (h!21537 (_ BitVec 64)) (t!28885 List!20379)) )
))
(declare-fun noDuplicate!1383 (List!20379) Bool)

(assert (=> b!976901 (= e!550641 (not (noDuplicate!1383 Nil!20376)))))

(declare-fun b!976902 () Bool)

(declare-fun e!550640 () Bool)

(assert (=> b!976902 (= e!550640 tp_is_empty!22483)))

(declare-fun mapIsEmpty!35747 () Bool)

(assert (=> mapIsEmpty!35747 mapRes!35747))

(declare-fun b!976903 () Bool)

(declare-fun res!653900 () Bool)

(assert (=> b!976903 (=> (not res!653900) (not e!550641))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!976903 (= res!653900 (and (= (size!29807 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29806 _keys!1544) (size!29807 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35747 () Bool)

(declare-fun tp!68000 () Bool)

(assert (=> mapNonEmpty!35747 (= mapRes!35747 (and tp!68000 e!550640))))

(declare-fun mapValue!35747 () ValueCell!10760)

(declare-fun mapRest!35747 () (Array (_ BitVec 32) ValueCell!10760))

(declare-fun mapKey!35747 () (_ BitVec 32))

(assert (=> mapNonEmpty!35747 (= (arr!29326 _values!1278) (store mapRest!35747 mapKey!35747 mapValue!35747))))

(assert (= (and start!83640 res!653902) b!976903))

(assert (= (and b!976903 res!653900) b!976897))

(assert (= (and b!976897 res!653901) b!976900))

(assert (= (and b!976900 res!653899) b!976901))

(assert (= (and b!976898 condMapEmpty!35747) mapIsEmpty!35747))

(assert (= (and b!976898 (not condMapEmpty!35747)) mapNonEmpty!35747))

(get-info :version)

(assert (= (and mapNonEmpty!35747 ((_ is ValueCellFull!10760) mapValue!35747)) b!976902))

(assert (= (and b!976898 ((_ is ValueCellFull!10760) mapDefault!35747)) b!976899))

(assert (= start!83640 b!976898))

(declare-fun m!903751 () Bool)

(assert (=> b!976897 m!903751))

(declare-fun m!903753 () Bool)

(assert (=> start!83640 m!903753))

(declare-fun m!903755 () Bool)

(assert (=> start!83640 m!903755))

(declare-fun m!903757 () Bool)

(assert (=> start!83640 m!903757))

(declare-fun m!903759 () Bool)

(assert (=> b!976901 m!903759))

(declare-fun m!903761 () Bool)

(assert (=> mapNonEmpty!35747 m!903761))

(check-sat tp_is_empty!22483 (not start!83640) (not mapNonEmpty!35747) (not b!976901) (not b!976897))
(check-sat)
(get-model)

(declare-fun d!116447 () Bool)

(assert (=> d!116447 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83640 d!116447))

(declare-fun d!116449 () Bool)

(assert (=> d!116449 (= (array_inv!22711 _values!1278) (bvsge (size!29807 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83640 d!116449))

(declare-fun d!116451 () Bool)

(assert (=> d!116451 (= (array_inv!22712 _keys!1544) (bvsge (size!29806 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83640 d!116451))

(declare-fun b!976954 () Bool)

(declare-fun e!550682 () Bool)

(declare-fun call!41764 () Bool)

(assert (=> b!976954 (= e!550682 call!41764)))

(declare-fun b!976956 () Bool)

(declare-fun e!550681 () Bool)

(assert (=> b!976956 (= e!550681 e!550682)))

(declare-fun c!99954 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976956 (= c!99954 (validKeyInArray!0 (select (arr!29325 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!976957 () Bool)

(declare-fun e!550683 () Bool)

(assert (=> b!976957 (= e!550682 e!550683)))

(declare-fun lt!433199 () (_ BitVec 64))

(assert (=> b!976957 (= lt!433199 (select (arr!29325 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32360 0))(
  ( (Unit!32361) )
))
(declare-fun lt!433198 () Unit!32360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!60930 (_ BitVec 64) (_ BitVec 32)) Unit!32360)

(assert (=> b!976957 (= lt!433198 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433199 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!60930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!976957 (arrayContainsKey!0 _keys!1544 lt!433199 #b00000000000000000000000000000000)))

(declare-fun lt!433197 () Unit!32360)

(assert (=> b!976957 (= lt!433197 lt!433198)))

(declare-fun res!653932 () Bool)

(declare-datatypes ((SeekEntryResult!9199 0))(
  ( (MissingZero!9199 (index!39167 (_ BitVec 32))) (Found!9199 (index!39168 (_ BitVec 32))) (Intermediate!9199 (undefined!10011 Bool) (index!39169 (_ BitVec 32)) (x!84545 (_ BitVec 32))) (Undefined!9199) (MissingVacant!9199 (index!39170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!60930 (_ BitVec 32)) SeekEntryResult!9199)

(assert (=> b!976957 (= res!653932 (= (seekEntryOrOpen!0 (select (arr!29325 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9199 #b00000000000000000000000000000000)))))

(assert (=> b!976957 (=> (not res!653932) (not e!550683))))

(declare-fun bm!41761 () Bool)

(assert (=> bm!41761 (= call!41764 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun d!116453 () Bool)

(declare-fun res!653931 () Bool)

(assert (=> d!116453 (=> res!653931 e!550681)))

(assert (=> d!116453 (= res!653931 (bvsge #b00000000000000000000000000000000 (size!29806 _keys!1544)))))

(assert (=> d!116453 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!550681)))

(declare-fun b!976955 () Bool)

(assert (=> b!976955 (= e!550683 call!41764)))

(assert (= (and d!116453 (not res!653931)) b!976956))

(assert (= (and b!976956 c!99954) b!976957))

(assert (= (and b!976956 (not c!99954)) b!976954))

(assert (= (and b!976957 res!653932) b!976955))

(assert (= (or b!976955 b!976954) bm!41761))

(declare-fun m!903787 () Bool)

(assert (=> b!976956 m!903787))

(assert (=> b!976956 m!903787))

(declare-fun m!903789 () Bool)

(assert (=> b!976956 m!903789))

(assert (=> b!976957 m!903787))

(declare-fun m!903791 () Bool)

(assert (=> b!976957 m!903791))

(declare-fun m!903793 () Bool)

(assert (=> b!976957 m!903793))

(assert (=> b!976957 m!903787))

(declare-fun m!903795 () Bool)

(assert (=> b!976957 m!903795))

(declare-fun m!903797 () Bool)

(assert (=> bm!41761 m!903797))

(assert (=> b!976897 d!116453))

(declare-fun d!116455 () Bool)

(declare-fun res!653937 () Bool)

(declare-fun e!550688 () Bool)

(assert (=> d!116455 (=> res!653937 e!550688)))

(assert (=> d!116455 (= res!653937 ((_ is Nil!20376) Nil!20376))))

(assert (=> d!116455 (= (noDuplicate!1383 Nil!20376) e!550688)))

(declare-fun b!976962 () Bool)

(declare-fun e!550689 () Bool)

(assert (=> b!976962 (= e!550688 e!550689)))

(declare-fun res!653938 () Bool)

(assert (=> b!976962 (=> (not res!653938) (not e!550689))))

(declare-fun contains!5675 (List!20379 (_ BitVec 64)) Bool)

(assert (=> b!976962 (= res!653938 (not (contains!5675 (t!28885 Nil!20376) (h!21537 Nil!20376))))))

(declare-fun b!976963 () Bool)

(assert (=> b!976963 (= e!550689 (noDuplicate!1383 (t!28885 Nil!20376)))))

(assert (= (and d!116455 (not res!653937)) b!976962))

(assert (= (and b!976962 res!653938) b!976963))

(declare-fun m!903799 () Bool)

(assert (=> b!976962 m!903799))

(declare-fun m!903801 () Bool)

(assert (=> b!976963 m!903801))

(assert (=> b!976901 d!116455))

(declare-fun b!976971 () Bool)

(declare-fun e!550695 () Bool)

(assert (=> b!976971 (= e!550695 tp_is_empty!22483)))

(declare-fun mapIsEmpty!35756 () Bool)

(declare-fun mapRes!35756 () Bool)

(assert (=> mapIsEmpty!35756 mapRes!35756))

(declare-fun mapNonEmpty!35756 () Bool)

(declare-fun tp!68009 () Bool)

(declare-fun e!550694 () Bool)

(assert (=> mapNonEmpty!35756 (= mapRes!35756 (and tp!68009 e!550694))))

(declare-fun mapRest!35756 () (Array (_ BitVec 32) ValueCell!10760))

(declare-fun mapValue!35756 () ValueCell!10760)

(declare-fun mapKey!35756 () (_ BitVec 32))

(assert (=> mapNonEmpty!35756 (= mapRest!35747 (store mapRest!35756 mapKey!35756 mapValue!35756))))

(declare-fun b!976970 () Bool)

(assert (=> b!976970 (= e!550694 tp_is_empty!22483)))

(declare-fun condMapEmpty!35756 () Bool)

(declare-fun mapDefault!35756 () ValueCell!10760)

(assert (=> mapNonEmpty!35747 (= condMapEmpty!35756 (= mapRest!35747 ((as const (Array (_ BitVec 32) ValueCell!10760)) mapDefault!35756)))))

(assert (=> mapNonEmpty!35747 (= tp!68000 (and e!550695 mapRes!35756))))

(assert (= (and mapNonEmpty!35747 condMapEmpty!35756) mapIsEmpty!35756))

(assert (= (and mapNonEmpty!35747 (not condMapEmpty!35756)) mapNonEmpty!35756))

(assert (= (and mapNonEmpty!35756 ((_ is ValueCellFull!10760) mapValue!35756)) b!976970))

(assert (= (and mapNonEmpty!35747 ((_ is ValueCellFull!10760) mapDefault!35756)) b!976971))

(declare-fun m!903803 () Bool)

(assert (=> mapNonEmpty!35756 m!903803))

(check-sat (not b!976956) tp_is_empty!22483 (not mapNonEmpty!35756) (not b!976962) (not b!976963) (not bm!41761) (not b!976957))
(check-sat)
