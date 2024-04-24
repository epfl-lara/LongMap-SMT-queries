; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83826 () Bool)

(assert start!83826)

(declare-fun b!978039 () Bool)

(declare-fun res!654355 () Bool)

(declare-fun e!551371 () Bool)

(assert (=> b!978039 (=> (not res!654355) (not e!551371))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!34961 0))(
  ( (V!34962 (val!11292 Int)) )
))
(declare-datatypes ((ValueCell!10760 0))(
  ( (ValueCellFull!10760 (v!13850 V!34961)) (EmptyCell!10760) )
))
(declare-datatypes ((array!61034 0))(
  ( (array!61035 (arr!29372 (Array (_ BitVec 32) ValueCell!10760)) (size!29852 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61034)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61036 0))(
  ( (array!61037 (arr!29373 (Array (_ BitVec 32) (_ BitVec 64))) (size!29853 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61036)

(assert (=> b!978039 (= res!654355 (and (= (size!29852 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29853 _keys!1544) (size!29852 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978040 () Bool)

(declare-datatypes ((List!20364 0))(
  ( (Nil!20361) (Cons!20360 (h!21528 (_ BitVec 64)) (t!28871 List!20364)) )
))
(declare-fun noDuplicate!1384 (List!20364) Bool)

(assert (=> b!978040 (= e!551371 (not (noDuplicate!1384 Nil!20361)))))

(declare-fun b!978041 () Bool)

(declare-fun e!551372 () Bool)

(declare-fun tp_is_empty!22483 () Bool)

(assert (=> b!978041 (= e!551372 tp_is_empty!22483)))

(declare-fun mapIsEmpty!35747 () Bool)

(declare-fun mapRes!35747 () Bool)

(assert (=> mapIsEmpty!35747 mapRes!35747))

(declare-fun b!978042 () Bool)

(declare-fun e!551373 () Bool)

(assert (=> b!978042 (= e!551373 (and e!551372 mapRes!35747))))

(declare-fun condMapEmpty!35747 () Bool)

(declare-fun mapDefault!35747 () ValueCell!10760)

(assert (=> b!978042 (= condMapEmpty!35747 (= (arr!29372 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10760)) mapDefault!35747)))))

(declare-fun res!654353 () Bool)

(assert (=> start!83826 (=> (not res!654353) (not e!551371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83826 (= res!654353 (validMask!0 mask!1948))))

(assert (=> start!83826 e!551371))

(assert (=> start!83826 true))

(declare-fun array_inv!22763 (array!61034) Bool)

(assert (=> start!83826 (and (array_inv!22763 _values!1278) e!551373)))

(declare-fun array_inv!22764 (array!61036) Bool)

(assert (=> start!83826 (array_inv!22764 _keys!1544)))

(declare-fun b!978043 () Bool)

(declare-fun res!654354 () Bool)

(assert (=> b!978043 (=> (not res!654354) (not e!551371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61036 (_ BitVec 32)) Bool)

(assert (=> b!978043 (= res!654354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978044 () Bool)

(declare-fun res!654356 () Bool)

(assert (=> b!978044 (=> (not res!654356) (not e!551371))))

(assert (=> b!978044 (= res!654356 (and (bvsle #b00000000000000000000000000000000 (size!29853 _keys!1544)) (bvslt (size!29853 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!978045 () Bool)

(declare-fun e!551374 () Bool)

(assert (=> b!978045 (= e!551374 tp_is_empty!22483)))

(declare-fun mapNonEmpty!35747 () Bool)

(declare-fun tp!68000 () Bool)

(assert (=> mapNonEmpty!35747 (= mapRes!35747 (and tp!68000 e!551374))))

(declare-fun mapKey!35747 () (_ BitVec 32))

(declare-fun mapValue!35747 () ValueCell!10760)

(declare-fun mapRest!35747 () (Array (_ BitVec 32) ValueCell!10760))

(assert (=> mapNonEmpty!35747 (= (arr!29372 _values!1278) (store mapRest!35747 mapKey!35747 mapValue!35747))))

(assert (= (and start!83826 res!654353) b!978039))

(assert (= (and b!978039 res!654355) b!978043))

(assert (= (and b!978043 res!654354) b!978044))

(assert (= (and b!978044 res!654356) b!978040))

(assert (= (and b!978042 condMapEmpty!35747) mapIsEmpty!35747))

(assert (= (and b!978042 (not condMapEmpty!35747)) mapNonEmpty!35747))

(get-info :version)

(assert (= (and mapNonEmpty!35747 ((_ is ValueCellFull!10760) mapValue!35747)) b!978045))

(assert (= (and b!978042 ((_ is ValueCellFull!10760) mapDefault!35747)) b!978041))

(assert (= start!83826 b!978042))

(declare-fun m!905803 () Bool)

(assert (=> b!978040 m!905803))

(declare-fun m!905805 () Bool)

(assert (=> start!83826 m!905805))

(declare-fun m!905807 () Bool)

(assert (=> start!83826 m!905807))

(declare-fun m!905809 () Bool)

(assert (=> start!83826 m!905809))

(declare-fun m!905811 () Bool)

(assert (=> b!978043 m!905811))

(declare-fun m!905813 () Bool)

(assert (=> mapNonEmpty!35747 m!905813))

(check-sat (not mapNonEmpty!35747) (not b!978043) tp_is_empty!22483 (not start!83826) (not b!978040))
(check-sat)
(get-model)

(declare-fun b!978096 () Bool)

(declare-fun e!551412 () Bool)

(declare-fun e!551411 () Bool)

(assert (=> b!978096 (= e!551412 e!551411)))

(declare-fun lt!433794 () (_ BitVec 64))

(assert (=> b!978096 (= lt!433794 (select (arr!29373 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32462 0))(
  ( (Unit!32463) )
))
(declare-fun lt!433796 () Unit!32462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!61036 (_ BitVec 64) (_ BitVec 32)) Unit!32462)

(assert (=> b!978096 (= lt!433796 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433794 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!61036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!978096 (arrayContainsKey!0 _keys!1544 lt!433794 #b00000000000000000000000000000000)))

(declare-fun lt!433795 () Unit!32462)

(assert (=> b!978096 (= lt!433795 lt!433796)))

(declare-fun res!654386 () Bool)

(declare-datatypes ((SeekEntryResult!9159 0))(
  ( (MissingZero!9159 (index!39007 (_ BitVec 32))) (Found!9159 (index!39008 (_ BitVec 32))) (Intermediate!9159 (undefined!9971 Bool) (index!39009 (_ BitVec 32)) (x!84524 (_ BitVec 32))) (Undefined!9159) (MissingVacant!9159 (index!39010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!61036 (_ BitVec 32)) SeekEntryResult!9159)

(assert (=> b!978096 (= res!654386 (= (seekEntryOrOpen!0 (select (arr!29373 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9159 #b00000000000000000000000000000000)))))

(assert (=> b!978096 (=> (not res!654386) (not e!551411))))

(declare-fun b!978097 () Bool)

(declare-fun call!41835 () Bool)

(assert (=> b!978097 (= e!551411 call!41835)))

(declare-fun bm!41832 () Bool)

(assert (=> bm!41832 (= call!41835 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!978098 () Bool)

(declare-fun e!551413 () Bool)

(assert (=> b!978098 (= e!551413 e!551412)))

(declare-fun c!100301 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978098 (= c!100301 (validKeyInArray!0 (select (arr!29373 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!116967 () Bool)

(declare-fun res!654385 () Bool)

(assert (=> d!116967 (=> res!654385 e!551413)))

(assert (=> d!116967 (= res!654385 (bvsge #b00000000000000000000000000000000 (size!29853 _keys!1544)))))

(assert (=> d!116967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!551413)))

(declare-fun b!978099 () Bool)

(assert (=> b!978099 (= e!551412 call!41835)))

(assert (= (and d!116967 (not res!654385)) b!978098))

(assert (= (and b!978098 c!100301) b!978096))

(assert (= (and b!978098 (not c!100301)) b!978099))

(assert (= (and b!978096 res!654386) b!978097))

(assert (= (or b!978097 b!978099) bm!41832))

(declare-fun m!905839 () Bool)

(assert (=> b!978096 m!905839))

(declare-fun m!905841 () Bool)

(assert (=> b!978096 m!905841))

(declare-fun m!905843 () Bool)

(assert (=> b!978096 m!905843))

(assert (=> b!978096 m!905839))

(declare-fun m!905845 () Bool)

(assert (=> b!978096 m!905845))

(declare-fun m!905847 () Bool)

(assert (=> bm!41832 m!905847))

(assert (=> b!978098 m!905839))

(assert (=> b!978098 m!905839))

(declare-fun m!905849 () Bool)

(assert (=> b!978098 m!905849))

(assert (=> b!978043 d!116967))

(declare-fun d!116969 () Bool)

(declare-fun res!654391 () Bool)

(declare-fun e!551418 () Bool)

(assert (=> d!116969 (=> res!654391 e!551418)))

(assert (=> d!116969 (= res!654391 ((_ is Nil!20361) Nil!20361))))

(assert (=> d!116969 (= (noDuplicate!1384 Nil!20361) e!551418)))

(declare-fun b!978104 () Bool)

(declare-fun e!551419 () Bool)

(assert (=> b!978104 (= e!551418 e!551419)))

(declare-fun res!654392 () Bool)

(assert (=> b!978104 (=> (not res!654392) (not e!551419))))

(declare-fun contains!5726 (List!20364 (_ BitVec 64)) Bool)

(assert (=> b!978104 (= res!654392 (not (contains!5726 (t!28871 Nil!20361) (h!21528 Nil!20361))))))

(declare-fun b!978105 () Bool)

(assert (=> b!978105 (= e!551419 (noDuplicate!1384 (t!28871 Nil!20361)))))

(assert (= (and d!116969 (not res!654391)) b!978104))

(assert (= (and b!978104 res!654392) b!978105))

(declare-fun m!905851 () Bool)

(assert (=> b!978104 m!905851))

(declare-fun m!905853 () Bool)

(assert (=> b!978105 m!905853))

(assert (=> b!978040 d!116969))

(declare-fun d!116971 () Bool)

(assert (=> d!116971 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83826 d!116971))

(declare-fun d!116973 () Bool)

(assert (=> d!116973 (= (array_inv!22763 _values!1278) (bvsge (size!29852 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83826 d!116973))

(declare-fun d!116975 () Bool)

(assert (=> d!116975 (= (array_inv!22764 _keys!1544) (bvsge (size!29853 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83826 d!116975))

(declare-fun b!978112 () Bool)

(declare-fun e!551425 () Bool)

(assert (=> b!978112 (= e!551425 tp_is_empty!22483)))

(declare-fun b!978113 () Bool)

(declare-fun e!551424 () Bool)

(assert (=> b!978113 (= e!551424 tp_is_empty!22483)))

(declare-fun mapIsEmpty!35756 () Bool)

(declare-fun mapRes!35756 () Bool)

(assert (=> mapIsEmpty!35756 mapRes!35756))

(declare-fun condMapEmpty!35756 () Bool)

(declare-fun mapDefault!35756 () ValueCell!10760)

(assert (=> mapNonEmpty!35747 (= condMapEmpty!35756 (= mapRest!35747 ((as const (Array (_ BitVec 32) ValueCell!10760)) mapDefault!35756)))))

(assert (=> mapNonEmpty!35747 (= tp!68000 (and e!551424 mapRes!35756))))

(declare-fun mapNonEmpty!35756 () Bool)

(declare-fun tp!68009 () Bool)

(assert (=> mapNonEmpty!35756 (= mapRes!35756 (and tp!68009 e!551425))))

(declare-fun mapRest!35756 () (Array (_ BitVec 32) ValueCell!10760))

(declare-fun mapValue!35756 () ValueCell!10760)

(declare-fun mapKey!35756 () (_ BitVec 32))

(assert (=> mapNonEmpty!35756 (= mapRest!35747 (store mapRest!35756 mapKey!35756 mapValue!35756))))

(assert (= (and mapNonEmpty!35747 condMapEmpty!35756) mapIsEmpty!35756))

(assert (= (and mapNonEmpty!35747 (not condMapEmpty!35756)) mapNonEmpty!35756))

(assert (= (and mapNonEmpty!35756 ((_ is ValueCellFull!10760) mapValue!35756)) b!978112))

(assert (= (and mapNonEmpty!35747 ((_ is ValueCellFull!10760) mapDefault!35756)) b!978113))

(declare-fun m!905855 () Bool)

(assert (=> mapNonEmpty!35756 m!905855))

(check-sat (not b!978096) (not b!978104) (not b!978098) (not bm!41832) tp_is_empty!22483 (not mapNonEmpty!35756) (not b!978105))
(check-sat)
