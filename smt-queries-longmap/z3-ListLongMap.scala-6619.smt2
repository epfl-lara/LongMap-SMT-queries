; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83656 () Bool)

(assert start!83656)

(declare-fun b!976990 () Bool)

(declare-fun e!550710 () Bool)

(declare-fun e!550711 () Bool)

(assert (=> b!976990 (= e!550710 e!550711)))

(declare-fun res!653954 () Bool)

(assert (=> b!976990 (=> res!653954 e!550711)))

(declare-datatypes ((List!20380 0))(
  ( (Nil!20377) (Cons!20376 (h!21538 (_ BitVec 64)) (t!28886 List!20380)) )
))
(declare-fun contains!5676 (List!20380 (_ BitVec 64)) Bool)

(assert (=> b!976990 (= res!653954 (contains!5676 Nil!20377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976991 () Bool)

(declare-fun e!550708 () Bool)

(declare-fun tp_is_empty!22489 () Bool)

(assert (=> b!976991 (= e!550708 tp_is_empty!22489)))

(declare-fun res!653955 () Bool)

(assert (=> start!83656 (=> (not res!653955) (not e!550710))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83656 (= res!653955 (validMask!0 mask!1948))))

(assert (=> start!83656 e!550710))

(assert (=> start!83656 true))

(declare-datatypes ((V!34969 0))(
  ( (V!34970 (val!11295 Int)) )
))
(declare-datatypes ((ValueCell!10763 0))(
  ( (ValueCellFull!10763 (v!13855 V!34969)) (EmptyCell!10763) )
))
(declare-datatypes ((array!60942 0))(
  ( (array!60943 (arr!29330 (Array (_ BitVec 32) ValueCell!10763)) (size!29811 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60942)

(declare-fun e!550713 () Bool)

(declare-fun array_inv!22715 (array!60942) Bool)

(assert (=> start!83656 (and (array_inv!22715 _values!1278) e!550713)))

(declare-datatypes ((array!60944 0))(
  ( (array!60945 (arr!29331 (Array (_ BitVec 32) (_ BitVec 64))) (size!29812 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60944)

(declare-fun array_inv!22716 (array!60944) Bool)

(assert (=> start!83656 (array_inv!22716 _keys!1544)))

(declare-fun b!976992 () Bool)

(declare-fun res!653952 () Bool)

(assert (=> b!976992 (=> (not res!653952) (not e!550710))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!976992 (= res!653952 (and (= (size!29811 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29812 _keys!1544) (size!29811 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!976993 () Bool)

(declare-fun e!550712 () Bool)

(assert (=> b!976993 (= e!550712 tp_is_empty!22489)))

(declare-fun b!976994 () Bool)

(declare-fun res!653953 () Bool)

(assert (=> b!976994 (=> (not res!653953) (not e!550710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60944 (_ BitVec 32)) Bool)

(assert (=> b!976994 (= res!653953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!976995 () Bool)

(declare-fun res!653951 () Bool)

(assert (=> b!976995 (=> (not res!653951) (not e!550710))))

(assert (=> b!976995 (= res!653951 (and (bvsle #b00000000000000000000000000000000 (size!29812 _keys!1544)) (bvslt (size!29812 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!976996 () Bool)

(declare-fun mapRes!35759 () Bool)

(assert (=> b!976996 (= e!550713 (and e!550712 mapRes!35759))))

(declare-fun condMapEmpty!35759 () Bool)

(declare-fun mapDefault!35759 () ValueCell!10763)

(assert (=> b!976996 (= condMapEmpty!35759 (= (arr!29330 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10763)) mapDefault!35759)))))

(declare-fun mapNonEmpty!35759 () Bool)

(declare-fun tp!68012 () Bool)

(assert (=> mapNonEmpty!35759 (= mapRes!35759 (and tp!68012 e!550708))))

(declare-fun mapKey!35759 () (_ BitVec 32))

(declare-fun mapRest!35759 () (Array (_ BitVec 32) ValueCell!10763))

(declare-fun mapValue!35759 () ValueCell!10763)

(assert (=> mapNonEmpty!35759 (= (arr!29330 _values!1278) (store mapRest!35759 mapKey!35759 mapValue!35759))))

(declare-fun b!976997 () Bool)

(declare-fun res!653956 () Bool)

(assert (=> b!976997 (=> (not res!653956) (not e!550710))))

(declare-fun noDuplicate!1384 (List!20380) Bool)

(assert (=> b!976997 (= res!653956 (noDuplicate!1384 Nil!20377))))

(declare-fun b!976998 () Bool)

(assert (=> b!976998 (= e!550711 (contains!5676 Nil!20377 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!35759 () Bool)

(assert (=> mapIsEmpty!35759 mapRes!35759))

(assert (= (and start!83656 res!653955) b!976992))

(assert (= (and b!976992 res!653952) b!976994))

(assert (= (and b!976994 res!653953) b!976995))

(assert (= (and b!976995 res!653951) b!976997))

(assert (= (and b!976997 res!653956) b!976990))

(assert (= (and b!976990 (not res!653954)) b!976998))

(assert (= (and b!976996 condMapEmpty!35759) mapIsEmpty!35759))

(assert (= (and b!976996 (not condMapEmpty!35759)) mapNonEmpty!35759))

(get-info :version)

(assert (= (and mapNonEmpty!35759 ((_ is ValueCellFull!10763) mapValue!35759)) b!976991))

(assert (= (and b!976996 ((_ is ValueCellFull!10763) mapDefault!35759)) b!976993))

(assert (= start!83656 b!976996))

(declare-fun m!903805 () Bool)

(assert (=> b!976998 m!903805))

(declare-fun m!903807 () Bool)

(assert (=> start!83656 m!903807))

(declare-fun m!903809 () Bool)

(assert (=> start!83656 m!903809))

(declare-fun m!903811 () Bool)

(assert (=> start!83656 m!903811))

(declare-fun m!903813 () Bool)

(assert (=> mapNonEmpty!35759 m!903813))

(declare-fun m!903815 () Bool)

(assert (=> b!976990 m!903815))

(declare-fun m!903817 () Bool)

(assert (=> b!976994 m!903817))

(declare-fun m!903819 () Bool)

(assert (=> b!976997 m!903819))

(check-sat (not b!976990) tp_is_empty!22489 (not start!83656) (not mapNonEmpty!35759) (not b!976998) (not b!976997) (not b!976994))
(check-sat)
(get-model)

(declare-fun d!116459 () Bool)

(declare-fun res!653997 () Bool)

(declare-fun e!550754 () Bool)

(assert (=> d!116459 (=> res!653997 e!550754)))

(assert (=> d!116459 (= res!653997 ((_ is Nil!20377) Nil!20377))))

(assert (=> d!116459 (= (noDuplicate!1384 Nil!20377) e!550754)))

(declare-fun b!977057 () Bool)

(declare-fun e!550755 () Bool)

(assert (=> b!977057 (= e!550754 e!550755)))

(declare-fun res!653998 () Bool)

(assert (=> b!977057 (=> (not res!653998) (not e!550755))))

(assert (=> b!977057 (= res!653998 (not (contains!5676 (t!28886 Nil!20377) (h!21538 Nil!20377))))))

(declare-fun b!977058 () Bool)

(assert (=> b!977058 (= e!550755 (noDuplicate!1384 (t!28886 Nil!20377)))))

(assert (= (and d!116459 (not res!653997)) b!977057))

(assert (= (and b!977057 res!653998) b!977058))

(declare-fun m!903853 () Bool)

(assert (=> b!977057 m!903853))

(declare-fun m!903855 () Bool)

(assert (=> b!977058 m!903855))

(assert (=> b!976997 d!116459))

(declare-fun d!116461 () Bool)

(assert (=> d!116461 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83656 d!116461))

(declare-fun d!116463 () Bool)

(assert (=> d!116463 (= (array_inv!22715 _values!1278) (bvsge (size!29811 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83656 d!116463))

(declare-fun d!116465 () Bool)

(assert (=> d!116465 (= (array_inv!22716 _keys!1544) (bvsge (size!29812 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83656 d!116465))

(declare-fun d!116467 () Bool)

(declare-fun lt!433202 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!415 (List!20380) (InoxSet (_ BitVec 64)))

(assert (=> d!116467 (= lt!433202 (select (content!415 Nil!20377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!550761 () Bool)

(assert (=> d!116467 (= lt!433202 e!550761)))

(declare-fun res!654003 () Bool)

(assert (=> d!116467 (=> (not res!654003) (not e!550761))))

(assert (=> d!116467 (= res!654003 ((_ is Cons!20376) Nil!20377))))

(assert (=> d!116467 (= (contains!5676 Nil!20377 #b1000000000000000000000000000000000000000000000000000000000000000) lt!433202)))

(declare-fun b!977063 () Bool)

(declare-fun e!550760 () Bool)

(assert (=> b!977063 (= e!550761 e!550760)))

(declare-fun res!654004 () Bool)

(assert (=> b!977063 (=> res!654004 e!550760)))

(assert (=> b!977063 (= res!654004 (= (h!21538 Nil!20377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977064 () Bool)

(assert (=> b!977064 (= e!550760 (contains!5676 (t!28886 Nil!20377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116467 res!654003) b!977063))

(assert (= (and b!977063 (not res!654004)) b!977064))

(declare-fun m!903857 () Bool)

(assert (=> d!116467 m!903857))

(declare-fun m!903859 () Bool)

(assert (=> d!116467 m!903859))

(declare-fun m!903861 () Bool)

(assert (=> b!977064 m!903861))

(assert (=> b!976998 d!116467))

(declare-fun bm!41764 () Bool)

(declare-fun call!41767 () Bool)

(assert (=> bm!41764 (= call!41767 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!977073 () Bool)

(declare-fun e!550769 () Bool)

(assert (=> b!977073 (= e!550769 call!41767)))

(declare-fun b!977074 () Bool)

(declare-fun e!550768 () Bool)

(declare-fun e!550770 () Bool)

(assert (=> b!977074 (= e!550768 e!550770)))

(declare-fun c!99957 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977074 (= c!99957 (validKeyInArray!0 (select (arr!29331 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!116469 () Bool)

(declare-fun res!654009 () Bool)

(assert (=> d!116469 (=> res!654009 e!550768)))

(assert (=> d!116469 (= res!654009 (bvsge #b00000000000000000000000000000000 (size!29812 _keys!1544)))))

(assert (=> d!116469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!550768)))

(declare-fun b!977075 () Bool)

(assert (=> b!977075 (= e!550770 call!41767)))

(declare-fun b!977076 () Bool)

(assert (=> b!977076 (= e!550770 e!550769)))

(declare-fun lt!433211 () (_ BitVec 64))

(assert (=> b!977076 (= lt!433211 (select (arr!29331 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32362 0))(
  ( (Unit!32363) )
))
(declare-fun lt!433209 () Unit!32362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!60944 (_ BitVec 64) (_ BitVec 32)) Unit!32362)

(assert (=> b!977076 (= lt!433209 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433211 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!60944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!977076 (arrayContainsKey!0 _keys!1544 lt!433211 #b00000000000000000000000000000000)))

(declare-fun lt!433210 () Unit!32362)

(assert (=> b!977076 (= lt!433210 lt!433209)))

(declare-fun res!654010 () Bool)

(declare-datatypes ((SeekEntryResult!9200 0))(
  ( (MissingZero!9200 (index!39171 (_ BitVec 32))) (Found!9200 (index!39172 (_ BitVec 32))) (Intermediate!9200 (undefined!10012 Bool) (index!39173 (_ BitVec 32)) (x!84556 (_ BitVec 32))) (Undefined!9200) (MissingVacant!9200 (index!39174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!60944 (_ BitVec 32)) SeekEntryResult!9200)

(assert (=> b!977076 (= res!654010 (= (seekEntryOrOpen!0 (select (arr!29331 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9200 #b00000000000000000000000000000000)))))

(assert (=> b!977076 (=> (not res!654010) (not e!550769))))

(assert (= (and d!116469 (not res!654009)) b!977074))

(assert (= (and b!977074 c!99957) b!977076))

(assert (= (and b!977074 (not c!99957)) b!977075))

(assert (= (and b!977076 res!654010) b!977073))

(assert (= (or b!977073 b!977075) bm!41764))

(declare-fun m!903863 () Bool)

(assert (=> bm!41764 m!903863))

(declare-fun m!903865 () Bool)

(assert (=> b!977074 m!903865))

(assert (=> b!977074 m!903865))

(declare-fun m!903867 () Bool)

(assert (=> b!977074 m!903867))

(assert (=> b!977076 m!903865))

(declare-fun m!903869 () Bool)

(assert (=> b!977076 m!903869))

(declare-fun m!903871 () Bool)

(assert (=> b!977076 m!903871))

(assert (=> b!977076 m!903865))

(declare-fun m!903873 () Bool)

(assert (=> b!977076 m!903873))

(assert (=> b!976994 d!116469))

(declare-fun d!116471 () Bool)

(declare-fun lt!433212 () Bool)

(assert (=> d!116471 (= lt!433212 (select (content!415 Nil!20377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!550772 () Bool)

(assert (=> d!116471 (= lt!433212 e!550772)))

(declare-fun res!654011 () Bool)

(assert (=> d!116471 (=> (not res!654011) (not e!550772))))

(assert (=> d!116471 (= res!654011 ((_ is Cons!20376) Nil!20377))))

(assert (=> d!116471 (= (contains!5676 Nil!20377 #b0000000000000000000000000000000000000000000000000000000000000000) lt!433212)))

(declare-fun b!977077 () Bool)

(declare-fun e!550771 () Bool)

(assert (=> b!977077 (= e!550772 e!550771)))

(declare-fun res!654012 () Bool)

(assert (=> b!977077 (=> res!654012 e!550771)))

(assert (=> b!977077 (= res!654012 (= (h!21538 Nil!20377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977078 () Bool)

(assert (=> b!977078 (= e!550771 (contains!5676 (t!28886 Nil!20377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116471 res!654011) b!977077))

(assert (= (and b!977077 (not res!654012)) b!977078))

(assert (=> d!116471 m!903857))

(declare-fun m!903875 () Bool)

(assert (=> d!116471 m!903875))

(declare-fun m!903877 () Bool)

(assert (=> b!977078 m!903877))

(assert (=> b!976990 d!116471))

(declare-fun condMapEmpty!35768 () Bool)

(declare-fun mapDefault!35768 () ValueCell!10763)

(assert (=> mapNonEmpty!35759 (= condMapEmpty!35768 (= mapRest!35759 ((as const (Array (_ BitVec 32) ValueCell!10763)) mapDefault!35768)))))

(declare-fun e!550778 () Bool)

(declare-fun mapRes!35768 () Bool)

(assert (=> mapNonEmpty!35759 (= tp!68012 (and e!550778 mapRes!35768))))

(declare-fun mapIsEmpty!35768 () Bool)

(assert (=> mapIsEmpty!35768 mapRes!35768))

(declare-fun mapNonEmpty!35768 () Bool)

(declare-fun tp!68021 () Bool)

(declare-fun e!550777 () Bool)

(assert (=> mapNonEmpty!35768 (= mapRes!35768 (and tp!68021 e!550777))))

(declare-fun mapKey!35768 () (_ BitVec 32))

(declare-fun mapRest!35768 () (Array (_ BitVec 32) ValueCell!10763))

(declare-fun mapValue!35768 () ValueCell!10763)

(assert (=> mapNonEmpty!35768 (= mapRest!35759 (store mapRest!35768 mapKey!35768 mapValue!35768))))

(declare-fun b!977086 () Bool)

(assert (=> b!977086 (= e!550778 tp_is_empty!22489)))

(declare-fun b!977085 () Bool)

(assert (=> b!977085 (= e!550777 tp_is_empty!22489)))

(assert (= (and mapNonEmpty!35759 condMapEmpty!35768) mapIsEmpty!35768))

(assert (= (and mapNonEmpty!35759 (not condMapEmpty!35768)) mapNonEmpty!35768))

(assert (= (and mapNonEmpty!35768 ((_ is ValueCellFull!10763) mapValue!35768)) b!977085))

(assert (= (and mapNonEmpty!35759 ((_ is ValueCellFull!10763) mapDefault!35768)) b!977086))

(declare-fun m!903879 () Bool)

(assert (=> mapNonEmpty!35768 m!903879))

(check-sat (not bm!41764) (not d!116467) (not d!116471) (not b!977058) (not b!977057) (not b!977064) (not b!977076) (not mapNonEmpty!35768) tp_is_empty!22489 (not b!977074) (not b!977078))
(check-sat)
