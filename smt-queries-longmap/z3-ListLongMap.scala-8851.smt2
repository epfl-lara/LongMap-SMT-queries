; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107332 () Bool)

(assert start!107332)

(declare-fun b_free!27651 () Bool)

(declare-fun b_next!27651 () Bool)

(assert (=> start!107332 (= b_free!27651 (not b_next!27651))))

(declare-fun tp!97459 () Bool)

(declare-fun b_and!45683 () Bool)

(assert (=> start!107332 (= tp!97459 b_and!45683)))

(declare-fun res!846226 () Bool)

(declare-fun e!725490 () Bool)

(assert (=> start!107332 (=> (not res!846226) (not e!725490))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107332 (= res!846226 (validMask!0 mask!1730))))

(assert (=> start!107332 e!725490))

(declare-datatypes ((V!49221 0))(
  ( (V!49222 (val!16585 Int)) )
))
(declare-datatypes ((ValueCell!15657 0))(
  ( (ValueCellFull!15657 (v!19222 V!49221)) (EmptyCell!15657) )
))
(declare-datatypes ((array!83290 0))(
  ( (array!83291 (arr!40182 (Array (_ BitVec 32) ValueCell!15657)) (size!40718 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83290)

(declare-fun e!725489 () Bool)

(declare-fun array_inv!30567 (array!83290) Bool)

(assert (=> start!107332 (and (array_inv!30567 _values!1134) e!725489)))

(assert (=> start!107332 true))

(declare-datatypes ((array!83292 0))(
  ( (array!83293 (arr!40183 (Array (_ BitVec 32) (_ BitVec 64))) (size!40719 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83292)

(declare-fun array_inv!30568 (array!83292) Bool)

(assert (=> start!107332 (array_inv!30568 _keys!1364)))

(declare-fun tp_is_empty!33021 () Bool)

(assert (=> start!107332 tp_is_empty!33021))

(assert (=> start!107332 tp!97459))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!49221)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!49221)

(declare-fun zeroValueBefore!52 () V!49221)

(declare-fun minValueAfter!52 () V!49221)

(declare-fun b!1272039 () Bool)

(declare-datatypes ((tuple2!21366 0))(
  ( (tuple2!21367 (_1!10694 (_ BitVec 64)) (_2!10694 V!49221)) )
))
(declare-datatypes ((List!28550 0))(
  ( (Nil!28547) (Cons!28546 (h!29755 tuple2!21366) (t!42079 List!28550)) )
))
(declare-datatypes ((ListLongMap!19095 0))(
  ( (ListLongMap!19096 (toList!9563 List!28550)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5895 (array!83292 array!83290 (_ BitVec 32) (_ BitVec 32) V!49221 V!49221 (_ BitVec 32) Int) ListLongMap!19095)

(assert (=> b!1272039 (= e!725490 (not (= (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142))))))

(assert (=> b!1272039 (= (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42312 0))(
  ( (Unit!42313) )
))
(declare-fun lt!574950 () Unit!42312)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1237 (array!83292 array!83290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!49221 V!49221 V!49221 V!49221 (_ BitVec 32) Int) Unit!42312)

(assert (=> b!1272039 (= lt!574950 (lemmaNoChangeToArrayThenSameMapNoExtras!1237 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!51112 () Bool)

(declare-fun mapRes!51112 () Bool)

(assert (=> mapIsEmpty!51112 mapRes!51112))

(declare-fun b!1272040 () Bool)

(declare-fun e!725493 () Bool)

(assert (=> b!1272040 (= e!725493 tp_is_empty!33021)))

(declare-fun b!1272041 () Bool)

(declare-fun res!846227 () Bool)

(assert (=> b!1272041 (=> (not res!846227) (not e!725490))))

(declare-datatypes ((List!28551 0))(
  ( (Nil!28548) (Cons!28547 (h!29756 (_ BitVec 64)) (t!42080 List!28551)) )
))
(declare-fun arrayNoDuplicates!0 (array!83292 (_ BitVec 32) List!28551) Bool)

(assert (=> b!1272041 (= res!846227 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28548))))

(declare-fun b!1272042 () Bool)

(declare-fun res!846230 () Bool)

(assert (=> b!1272042 (=> (not res!846230) (not e!725490))))

(assert (=> b!1272042 (= res!846230 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40719 _keys!1364)) (bvslt from!1698 (size!40719 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1272043 () Bool)

(declare-fun res!846228 () Bool)

(assert (=> b!1272043 (=> (not res!846228) (not e!725490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83292 (_ BitVec 32)) Bool)

(assert (=> b!1272043 (= res!846228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272044 () Bool)

(declare-fun res!846229 () Bool)

(assert (=> b!1272044 (=> (not res!846229) (not e!725490))))

(assert (=> b!1272044 (= res!846229 (and (= (size!40718 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40719 _keys!1364) (size!40718 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272045 () Bool)

(declare-fun e!725492 () Bool)

(assert (=> b!1272045 (= e!725492 tp_is_empty!33021)))

(declare-fun mapNonEmpty!51112 () Bool)

(declare-fun tp!97458 () Bool)

(assert (=> mapNonEmpty!51112 (= mapRes!51112 (and tp!97458 e!725493))))

(declare-fun mapRest!51112 () (Array (_ BitVec 32) ValueCell!15657))

(declare-fun mapValue!51112 () ValueCell!15657)

(declare-fun mapKey!51112 () (_ BitVec 32))

(assert (=> mapNonEmpty!51112 (= (arr!40182 _values!1134) (store mapRest!51112 mapKey!51112 mapValue!51112))))

(declare-fun b!1272046 () Bool)

(assert (=> b!1272046 (= e!725489 (and e!725492 mapRes!51112))))

(declare-fun condMapEmpty!51112 () Bool)

(declare-fun mapDefault!51112 () ValueCell!15657)

(assert (=> b!1272046 (= condMapEmpty!51112 (= (arr!40182 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15657)) mapDefault!51112)))))

(assert (= (and start!107332 res!846226) b!1272044))

(assert (= (and b!1272044 res!846229) b!1272043))

(assert (= (and b!1272043 res!846228) b!1272041))

(assert (= (and b!1272041 res!846227) b!1272042))

(assert (= (and b!1272042 res!846230) b!1272039))

(assert (= (and b!1272046 condMapEmpty!51112) mapIsEmpty!51112))

(assert (= (and b!1272046 (not condMapEmpty!51112)) mapNonEmpty!51112))

(get-info :version)

(assert (= (and mapNonEmpty!51112 ((_ is ValueCellFull!15657) mapValue!51112)) b!1272040))

(assert (= (and b!1272046 ((_ is ValueCellFull!15657) mapDefault!51112)) b!1272045))

(assert (= start!107332 b!1272046))

(declare-fun m!1169781 () Bool)

(assert (=> start!107332 m!1169781))

(declare-fun m!1169783 () Bool)

(assert (=> start!107332 m!1169783))

(declare-fun m!1169785 () Bool)

(assert (=> start!107332 m!1169785))

(declare-fun m!1169787 () Bool)

(assert (=> b!1272039 m!1169787))

(declare-fun m!1169789 () Bool)

(assert (=> b!1272039 m!1169789))

(declare-fun m!1169791 () Bool)

(assert (=> b!1272039 m!1169791))

(declare-fun m!1169793 () Bool)

(assert (=> b!1272039 m!1169793))

(declare-fun m!1169795 () Bool)

(assert (=> b!1272039 m!1169795))

(declare-fun m!1169797 () Bool)

(assert (=> b!1272041 m!1169797))

(declare-fun m!1169799 () Bool)

(assert (=> b!1272043 m!1169799))

(declare-fun m!1169801 () Bool)

(assert (=> mapNonEmpty!51112 m!1169801))

(check-sat b_and!45683 (not mapNonEmpty!51112) (not b_next!27651) (not b!1272043) (not start!107332) (not b!1272039) tp_is_empty!33021 (not b!1272041))
(check-sat b_and!45683 (not b_next!27651))
(get-model)

(declare-fun b!1272082 () Bool)

(declare-fun e!725520 () Bool)

(declare-fun e!725517 () Bool)

(assert (=> b!1272082 (= e!725520 e!725517)))

(declare-fun res!846252 () Bool)

(assert (=> b!1272082 (=> (not res!846252) (not e!725517))))

(declare-fun e!725518 () Bool)

(assert (=> b!1272082 (= res!846252 (not e!725518))))

(declare-fun res!846254 () Bool)

(assert (=> b!1272082 (=> (not res!846254) (not e!725518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272082 (= res!846254 (validKeyInArray!0 (select (arr!40183 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1272083 () Bool)

(declare-fun e!725519 () Bool)

(assert (=> b!1272083 (= e!725517 e!725519)))

(declare-fun c!123635 () Bool)

(assert (=> b!1272083 (= c!123635 (validKeyInArray!0 (select (arr!40183 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun bm!62515 () Bool)

(declare-fun call!62518 () Bool)

(assert (=> bm!62515 (= call!62518 (arrayNoDuplicates!0 _keys!1364 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123635 (Cons!28547 (select (arr!40183 _keys!1364) #b00000000000000000000000000000000) Nil!28548) Nil!28548)))))

(declare-fun b!1272084 () Bool)

(assert (=> b!1272084 (= e!725519 call!62518)))

(declare-fun b!1272085 () Bool)

(assert (=> b!1272085 (= e!725519 call!62518)))

(declare-fun b!1272081 () Bool)

(declare-fun contains!7664 (List!28551 (_ BitVec 64)) Bool)

(assert (=> b!1272081 (= e!725518 (contains!7664 Nil!28548 (select (arr!40183 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun d!139807 () Bool)

(declare-fun res!846253 () Bool)

(assert (=> d!139807 (=> res!846253 e!725520)))

(assert (=> d!139807 (= res!846253 (bvsge #b00000000000000000000000000000000 (size!40719 _keys!1364)))))

(assert (=> d!139807 (= (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28548) e!725520)))

(assert (= (and d!139807 (not res!846253)) b!1272082))

(assert (= (and b!1272082 res!846254) b!1272081))

(assert (= (and b!1272082 res!846252) b!1272083))

(assert (= (and b!1272083 c!123635) b!1272085))

(assert (= (and b!1272083 (not c!123635)) b!1272084))

(assert (= (or b!1272085 b!1272084) bm!62515))

(declare-fun m!1169825 () Bool)

(assert (=> b!1272082 m!1169825))

(assert (=> b!1272082 m!1169825))

(declare-fun m!1169827 () Bool)

(assert (=> b!1272082 m!1169827))

(assert (=> b!1272083 m!1169825))

(assert (=> b!1272083 m!1169825))

(assert (=> b!1272083 m!1169827))

(assert (=> bm!62515 m!1169825))

(declare-fun m!1169829 () Bool)

(assert (=> bm!62515 m!1169829))

(assert (=> b!1272081 m!1169825))

(assert (=> b!1272081 m!1169825))

(declare-fun m!1169831 () Bool)

(assert (=> b!1272081 m!1169831))

(assert (=> b!1272041 d!139807))

(declare-fun d!139809 () Bool)

(declare-fun res!846259 () Bool)

(declare-fun e!725527 () Bool)

(assert (=> d!139809 (=> res!846259 e!725527)))

(assert (=> d!139809 (= res!846259 (bvsge #b00000000000000000000000000000000 (size!40719 _keys!1364)))))

(assert (=> d!139809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!725527)))

(declare-fun bm!62518 () Bool)

(declare-fun call!62521 () Bool)

(assert (=> bm!62518 (= call!62521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1272094 () Bool)

(declare-fun e!725528 () Bool)

(declare-fun e!725529 () Bool)

(assert (=> b!1272094 (= e!725528 e!725529)))

(declare-fun lt!574960 () (_ BitVec 64))

(assert (=> b!1272094 (= lt!574960 (select (arr!40183 _keys!1364) #b00000000000000000000000000000000))))

(declare-fun lt!574962 () Unit!42312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83292 (_ BitVec 64) (_ BitVec 32)) Unit!42312)

(assert (=> b!1272094 (= lt!574962 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574960 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272094 (arrayContainsKey!0 _keys!1364 lt!574960 #b00000000000000000000000000000000)))

(declare-fun lt!574961 () Unit!42312)

(assert (=> b!1272094 (= lt!574961 lt!574962)))

(declare-fun res!846260 () Bool)

(declare-datatypes ((SeekEntryResult!9987 0))(
  ( (MissingZero!9987 (index!42319 (_ BitVec 32))) (Found!9987 (index!42320 (_ BitVec 32))) (Intermediate!9987 (undefined!10799 Bool) (index!42321 (_ BitVec 32)) (x!112367 (_ BitVec 32))) (Undefined!9987) (MissingVacant!9987 (index!42322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83292 (_ BitVec 32)) SeekEntryResult!9987)

(assert (=> b!1272094 (= res!846260 (= (seekEntryOrOpen!0 (select (arr!40183 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9987 #b00000000000000000000000000000000)))))

(assert (=> b!1272094 (=> (not res!846260) (not e!725529))))

(declare-fun b!1272095 () Bool)

(assert (=> b!1272095 (= e!725529 call!62521)))

(declare-fun b!1272096 () Bool)

(assert (=> b!1272096 (= e!725527 e!725528)))

(declare-fun c!123638 () Bool)

(assert (=> b!1272096 (= c!123638 (validKeyInArray!0 (select (arr!40183 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1272097 () Bool)

(assert (=> b!1272097 (= e!725528 call!62521)))

(assert (= (and d!139809 (not res!846259)) b!1272096))

(assert (= (and b!1272096 c!123638) b!1272094))

(assert (= (and b!1272096 (not c!123638)) b!1272097))

(assert (= (and b!1272094 res!846260) b!1272095))

(assert (= (or b!1272095 b!1272097) bm!62518))

(declare-fun m!1169833 () Bool)

(assert (=> bm!62518 m!1169833))

(assert (=> b!1272094 m!1169825))

(declare-fun m!1169835 () Bool)

(assert (=> b!1272094 m!1169835))

(declare-fun m!1169837 () Bool)

(assert (=> b!1272094 m!1169837))

(assert (=> b!1272094 m!1169825))

(declare-fun m!1169839 () Bool)

(assert (=> b!1272094 m!1169839))

(assert (=> b!1272096 m!1169825))

(assert (=> b!1272096 m!1169825))

(assert (=> b!1272096 m!1169827))

(assert (=> b!1272043 d!139809))

(declare-fun d!139811 () Bool)

(assert (=> d!139811 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107332 d!139811))

(declare-fun d!139813 () Bool)

(assert (=> d!139813 (= (array_inv!30567 _values!1134) (bvsge (size!40718 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107332 d!139813))

(declare-fun d!139815 () Bool)

(assert (=> d!139815 (= (array_inv!30568 _keys!1364) (bvsge (size!40719 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107332 d!139815))

(declare-fun b!1272122 () Bool)

(declare-fun e!725549 () Bool)

(declare-fun e!725545 () Bool)

(assert (=> b!1272122 (= e!725549 e!725545)))

(declare-fun c!123647 () Bool)

(assert (=> b!1272122 (= c!123647 (bvslt from!1698 (size!40719 _keys!1364)))))

(declare-fun b!1272123 () Bool)

(assert (=> b!1272123 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40719 _keys!1364)))))

(assert (=> b!1272123 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40718 _values!1134)))))

(declare-fun e!725547 () Bool)

(declare-fun lt!574977 () ListLongMap!19095)

(declare-fun apply!1005 (ListLongMap!19095 (_ BitVec 64)) V!49221)

(declare-fun get!20504 (ValueCell!15657 V!49221) V!49221)

(declare-fun dynLambda!3403 (Int (_ BitVec 64)) V!49221)

(assert (=> b!1272123 (= e!725547 (= (apply!1005 lt!574977 (select (arr!40183 _keys!1364) from!1698)) (get!20504 (select (arr!40182 _values!1134) from!1698) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1272124 () Bool)

(assert (=> b!1272124 (= e!725545 (= lt!574977 (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272125 () Bool)

(declare-fun e!725548 () Bool)

(assert (=> b!1272125 (= e!725548 e!725549)))

(declare-fun c!123650 () Bool)

(declare-fun e!725550 () Bool)

(assert (=> b!1272125 (= c!123650 e!725550)))

(declare-fun res!846271 () Bool)

(assert (=> b!1272125 (=> (not res!846271) (not e!725550))))

(assert (=> b!1272125 (= res!846271 (bvslt from!1698 (size!40719 _keys!1364)))))

(declare-fun d!139817 () Bool)

(assert (=> d!139817 e!725548))

(declare-fun res!846269 () Bool)

(assert (=> d!139817 (=> (not res!846269) (not e!725548))))

(declare-fun contains!7665 (ListLongMap!19095 (_ BitVec 64)) Bool)

(assert (=> d!139817 (= res!846269 (not (contains!7665 lt!574977 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!725544 () ListLongMap!19095)

(assert (=> d!139817 (= lt!574977 e!725544)))

(declare-fun c!123648 () Bool)

(assert (=> d!139817 (= c!123648 (bvsge from!1698 (size!40719 _keys!1364)))))

(assert (=> d!139817 (validMask!0 mask!1730)))

(assert (=> d!139817 (= (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) lt!574977)))

(declare-fun b!1272126 () Bool)

(declare-fun isEmpty!1047 (ListLongMap!19095) Bool)

(assert (=> b!1272126 (= e!725545 (isEmpty!1047 lt!574977))))

(declare-fun b!1272127 () Bool)

(assert (=> b!1272127 (= e!725550 (validKeyInArray!0 (select (arr!40183 _keys!1364) from!1698)))))

(assert (=> b!1272127 (bvsge from!1698 #b00000000000000000000000000000000)))

(declare-fun b!1272128 () Bool)

(assert (=> b!1272128 (= e!725544 (ListLongMap!19096 Nil!28547))))

(declare-fun b!1272129 () Bool)

(declare-fun e!725546 () ListLongMap!19095)

(assert (=> b!1272129 (= e!725544 e!725546)))

(declare-fun c!123649 () Bool)

(assert (=> b!1272129 (= c!123649 (validKeyInArray!0 (select (arr!40183 _keys!1364) from!1698)))))

(declare-fun call!62524 () ListLongMap!19095)

(declare-fun bm!62521 () Bool)

(assert (=> bm!62521 (= call!62524 (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1272130 () Bool)

(declare-fun res!846272 () Bool)

(assert (=> b!1272130 (=> (not res!846272) (not e!725548))))

(assert (=> b!1272130 (= res!846272 (not (contains!7665 lt!574977 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272131 () Bool)

(declare-fun lt!574978 () Unit!42312)

(declare-fun lt!574981 () Unit!42312)

(assert (=> b!1272131 (= lt!574978 lt!574981)))

(declare-fun lt!574983 () (_ BitVec 64))

(declare-fun lt!574979 () (_ BitVec 64))

(declare-fun lt!574980 () V!49221)

(declare-fun lt!574982 () ListLongMap!19095)

(declare-fun +!4268 (ListLongMap!19095 tuple2!21366) ListLongMap!19095)

(assert (=> b!1272131 (not (contains!7665 (+!4268 lt!574982 (tuple2!21367 lt!574979 lt!574980)) lt!574983))))

(declare-fun addStillNotContains!333 (ListLongMap!19095 (_ BitVec 64) V!49221 (_ BitVec 64)) Unit!42312)

(assert (=> b!1272131 (= lt!574981 (addStillNotContains!333 lt!574982 lt!574979 lt!574980 lt!574983))))

(assert (=> b!1272131 (= lt!574983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1272131 (= lt!574980 (get!20504 (select (arr!40182 _values!1134) from!1698) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272131 (= lt!574979 (select (arr!40183 _keys!1364) from!1698))))

(assert (=> b!1272131 (= lt!574982 call!62524)))

(assert (=> b!1272131 (= e!725546 (+!4268 call!62524 (tuple2!21367 (select (arr!40183 _keys!1364) from!1698) (get!20504 (select (arr!40182 _values!1134) from!1698) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1272132 () Bool)

(assert (=> b!1272132 (= e!725546 call!62524)))

(declare-fun b!1272133 () Bool)

(assert (=> b!1272133 (= e!725549 e!725547)))

(assert (=> b!1272133 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40719 _keys!1364)))))

(declare-fun res!846270 () Bool)

(assert (=> b!1272133 (= res!846270 (contains!7665 lt!574977 (select (arr!40183 _keys!1364) from!1698)))))

(assert (=> b!1272133 (=> (not res!846270) (not e!725547))))

(assert (= (and d!139817 c!123648) b!1272128))

(assert (= (and d!139817 (not c!123648)) b!1272129))

(assert (= (and b!1272129 c!123649) b!1272131))

(assert (= (and b!1272129 (not c!123649)) b!1272132))

(assert (= (or b!1272131 b!1272132) bm!62521))

(assert (= (and d!139817 res!846269) b!1272130))

(assert (= (and b!1272130 res!846272) b!1272125))

(assert (= (and b!1272125 res!846271) b!1272127))

(assert (= (and b!1272125 c!123650) b!1272133))

(assert (= (and b!1272125 (not c!123650)) b!1272122))

(assert (= (and b!1272133 res!846270) b!1272123))

(assert (= (and b!1272122 c!123647) b!1272124))

(assert (= (and b!1272122 (not c!123647)) b!1272126))

(declare-fun b_lambda!23039 () Bool)

(assert (=> (not b_lambda!23039) (not b!1272123)))

(declare-fun t!42083 () Bool)

(declare-fun tb!11337 () Bool)

(assert (=> (and start!107332 (= defaultEntry!1142 defaultEntry!1142) t!42083) tb!11337))

(declare-fun result!23549 () Bool)

(assert (=> tb!11337 (= result!23549 tp_is_empty!33021)))

(assert (=> b!1272123 t!42083))

(declare-fun b_and!45687 () Bool)

(assert (= b_and!45683 (and (=> t!42083 result!23549) b_and!45687)))

(declare-fun b_lambda!23041 () Bool)

(assert (=> (not b_lambda!23041) (not b!1272131)))

(assert (=> b!1272131 t!42083))

(declare-fun b_and!45689 () Bool)

(assert (= b_and!45687 (and (=> t!42083 result!23549) b_and!45689)))

(declare-fun m!1169841 () Bool)

(assert (=> b!1272124 m!1169841))

(assert (=> bm!62521 m!1169841))

(declare-fun m!1169843 () Bool)

(assert (=> b!1272129 m!1169843))

(assert (=> b!1272129 m!1169843))

(declare-fun m!1169845 () Bool)

(assert (=> b!1272129 m!1169845))

(declare-fun m!1169847 () Bool)

(assert (=> b!1272123 m!1169847))

(declare-fun m!1169849 () Bool)

(assert (=> b!1272123 m!1169849))

(declare-fun m!1169851 () Bool)

(assert (=> b!1272123 m!1169851))

(assert (=> b!1272123 m!1169847))

(assert (=> b!1272123 m!1169843))

(assert (=> b!1272123 m!1169843))

(declare-fun m!1169853 () Bool)

(assert (=> b!1272123 m!1169853))

(assert (=> b!1272123 m!1169849))

(declare-fun m!1169855 () Bool)

(assert (=> b!1272130 m!1169855))

(declare-fun m!1169857 () Bool)

(assert (=> b!1272126 m!1169857))

(assert (=> b!1272131 m!1169847))

(assert (=> b!1272131 m!1169849))

(assert (=> b!1272131 m!1169851))

(assert (=> b!1272131 m!1169847))

(declare-fun m!1169859 () Bool)

(assert (=> b!1272131 m!1169859))

(declare-fun m!1169861 () Bool)

(assert (=> b!1272131 m!1169861))

(assert (=> b!1272131 m!1169859))

(declare-fun m!1169863 () Bool)

(assert (=> b!1272131 m!1169863))

(assert (=> b!1272131 m!1169843))

(declare-fun m!1169865 () Bool)

(assert (=> b!1272131 m!1169865))

(assert (=> b!1272131 m!1169849))

(assert (=> b!1272127 m!1169843))

(assert (=> b!1272127 m!1169843))

(assert (=> b!1272127 m!1169845))

(declare-fun m!1169867 () Bool)

(assert (=> d!139817 m!1169867))

(assert (=> d!139817 m!1169781))

(assert (=> b!1272133 m!1169843))

(assert (=> b!1272133 m!1169843))

(declare-fun m!1169869 () Bool)

(assert (=> b!1272133 m!1169869))

(assert (=> b!1272039 d!139817))

(declare-fun d!139819 () Bool)

(assert (=> d!139819 (= (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun lt!574986 () Unit!42312)

(declare-fun choose!1895 (array!83292 array!83290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!49221 V!49221 V!49221 V!49221 (_ BitVec 32) Int) Unit!42312)

(assert (=> d!139819 (= lt!574986 (choose!1895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(assert (=> d!139819 (validMask!0 mask!1730)))

(assert (=> d!139819 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1237 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) lt!574986)))

(declare-fun bs!36112 () Bool)

(assert (= bs!36112 d!139819))

(assert (=> bs!36112 m!1169795))

(assert (=> bs!36112 m!1169791))

(declare-fun m!1169871 () Bool)

(assert (=> bs!36112 m!1169871))

(assert (=> bs!36112 m!1169781))

(assert (=> b!1272039 d!139819))

(declare-fun b!1272136 () Bool)

(declare-fun e!725556 () Bool)

(declare-fun e!725552 () Bool)

(assert (=> b!1272136 (= e!725556 e!725552)))

(declare-fun c!123651 () Bool)

(assert (=> b!1272136 (= c!123651 (bvslt from!1698 (size!40719 _keys!1364)))))

(declare-fun b!1272137 () Bool)

(assert (=> b!1272137 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40719 _keys!1364)))))

(assert (=> b!1272137 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40718 _values!1134)))))

(declare-fun lt!574987 () ListLongMap!19095)

(declare-fun e!725554 () Bool)

(assert (=> b!1272137 (= e!725554 (= (apply!1005 lt!574987 (select (arr!40183 _keys!1364) from!1698)) (get!20504 (select (arr!40182 _values!1134) from!1698) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1272138 () Bool)

(assert (=> b!1272138 (= e!725552 (= lt!574987 (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272139 () Bool)

(declare-fun e!725555 () Bool)

(assert (=> b!1272139 (= e!725555 e!725556)))

(declare-fun c!123654 () Bool)

(declare-fun e!725557 () Bool)

(assert (=> b!1272139 (= c!123654 e!725557)))

(declare-fun res!846275 () Bool)

(assert (=> b!1272139 (=> (not res!846275) (not e!725557))))

(assert (=> b!1272139 (= res!846275 (bvslt from!1698 (size!40719 _keys!1364)))))

(declare-fun d!139821 () Bool)

(assert (=> d!139821 e!725555))

(declare-fun res!846273 () Bool)

(assert (=> d!139821 (=> (not res!846273) (not e!725555))))

(assert (=> d!139821 (= res!846273 (not (contains!7665 lt!574987 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!725551 () ListLongMap!19095)

(assert (=> d!139821 (= lt!574987 e!725551)))

(declare-fun c!123652 () Bool)

(assert (=> d!139821 (= c!123652 (bvsge from!1698 (size!40719 _keys!1364)))))

(assert (=> d!139821 (validMask!0 mask!1730)))

(assert (=> d!139821 (= (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142) lt!574987)))

(declare-fun b!1272140 () Bool)

(assert (=> b!1272140 (= e!725552 (isEmpty!1047 lt!574987))))

(declare-fun b!1272141 () Bool)

(assert (=> b!1272141 (= e!725557 (validKeyInArray!0 (select (arr!40183 _keys!1364) from!1698)))))

(assert (=> b!1272141 (bvsge from!1698 #b00000000000000000000000000000000)))

(declare-fun b!1272142 () Bool)

(assert (=> b!1272142 (= e!725551 (ListLongMap!19096 Nil!28547))))

(declare-fun b!1272143 () Bool)

(declare-fun e!725553 () ListLongMap!19095)

(assert (=> b!1272143 (= e!725551 e!725553)))

(declare-fun c!123653 () Bool)

(assert (=> b!1272143 (= c!123653 (validKeyInArray!0 (select (arr!40183 _keys!1364) from!1698)))))

(declare-fun call!62525 () ListLongMap!19095)

(declare-fun bm!62522 () Bool)

(assert (=> bm!62522 (= call!62525 (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1272144 () Bool)

(declare-fun res!846276 () Bool)

(assert (=> b!1272144 (=> (not res!846276) (not e!725555))))

(assert (=> b!1272144 (= res!846276 (not (contains!7665 lt!574987 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272145 () Bool)

(declare-fun lt!574988 () Unit!42312)

(declare-fun lt!574991 () Unit!42312)

(assert (=> b!1272145 (= lt!574988 lt!574991)))

(declare-fun lt!574989 () (_ BitVec 64))

(declare-fun lt!574992 () ListLongMap!19095)

(declare-fun lt!574993 () (_ BitVec 64))

(declare-fun lt!574990 () V!49221)

(assert (=> b!1272145 (not (contains!7665 (+!4268 lt!574992 (tuple2!21367 lt!574989 lt!574990)) lt!574993))))

(assert (=> b!1272145 (= lt!574991 (addStillNotContains!333 lt!574992 lt!574989 lt!574990 lt!574993))))

(assert (=> b!1272145 (= lt!574993 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1272145 (= lt!574990 (get!20504 (select (arr!40182 _values!1134) from!1698) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272145 (= lt!574989 (select (arr!40183 _keys!1364) from!1698))))

(assert (=> b!1272145 (= lt!574992 call!62525)))

(assert (=> b!1272145 (= e!725553 (+!4268 call!62525 (tuple2!21367 (select (arr!40183 _keys!1364) from!1698) (get!20504 (select (arr!40182 _values!1134) from!1698) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1272146 () Bool)

(assert (=> b!1272146 (= e!725553 call!62525)))

(declare-fun b!1272147 () Bool)

(assert (=> b!1272147 (= e!725556 e!725554)))

(assert (=> b!1272147 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40719 _keys!1364)))))

(declare-fun res!846274 () Bool)

(assert (=> b!1272147 (= res!846274 (contains!7665 lt!574987 (select (arr!40183 _keys!1364) from!1698)))))

(assert (=> b!1272147 (=> (not res!846274) (not e!725554))))

(assert (= (and d!139821 c!123652) b!1272142))

(assert (= (and d!139821 (not c!123652)) b!1272143))

(assert (= (and b!1272143 c!123653) b!1272145))

(assert (= (and b!1272143 (not c!123653)) b!1272146))

(assert (= (or b!1272145 b!1272146) bm!62522))

(assert (= (and d!139821 res!846273) b!1272144))

(assert (= (and b!1272144 res!846276) b!1272139))

(assert (= (and b!1272139 res!846275) b!1272141))

(assert (= (and b!1272139 c!123654) b!1272147))

(assert (= (and b!1272139 (not c!123654)) b!1272136))

(assert (= (and b!1272147 res!846274) b!1272137))

(assert (= (and b!1272136 c!123651) b!1272138))

(assert (= (and b!1272136 (not c!123651)) b!1272140))

(declare-fun b_lambda!23043 () Bool)

(assert (=> (not b_lambda!23043) (not b!1272137)))

(assert (=> b!1272137 t!42083))

(declare-fun b_and!45691 () Bool)

(assert (= b_and!45689 (and (=> t!42083 result!23549) b_and!45691)))

(declare-fun b_lambda!23045 () Bool)

(assert (=> (not b_lambda!23045) (not b!1272145)))

(assert (=> b!1272145 t!42083))

(declare-fun b_and!45693 () Bool)

(assert (= b_and!45691 (and (=> t!42083 result!23549) b_and!45693)))

(declare-fun m!1169873 () Bool)

(assert (=> b!1272138 m!1169873))

(assert (=> bm!62522 m!1169873))

(assert (=> b!1272143 m!1169843))

(assert (=> b!1272143 m!1169843))

(assert (=> b!1272143 m!1169845))

(assert (=> b!1272137 m!1169847))

(assert (=> b!1272137 m!1169849))

(assert (=> b!1272137 m!1169851))

(assert (=> b!1272137 m!1169847))

(assert (=> b!1272137 m!1169843))

(assert (=> b!1272137 m!1169843))

(declare-fun m!1169875 () Bool)

(assert (=> b!1272137 m!1169875))

(assert (=> b!1272137 m!1169849))

(declare-fun m!1169877 () Bool)

(assert (=> b!1272144 m!1169877))

(declare-fun m!1169879 () Bool)

(assert (=> b!1272140 m!1169879))

(assert (=> b!1272145 m!1169847))

(assert (=> b!1272145 m!1169849))

(assert (=> b!1272145 m!1169851))

(assert (=> b!1272145 m!1169847))

(declare-fun m!1169881 () Bool)

(assert (=> b!1272145 m!1169881))

(declare-fun m!1169883 () Bool)

(assert (=> b!1272145 m!1169883))

(assert (=> b!1272145 m!1169881))

(declare-fun m!1169885 () Bool)

(assert (=> b!1272145 m!1169885))

(assert (=> b!1272145 m!1169843))

(declare-fun m!1169887 () Bool)

(assert (=> b!1272145 m!1169887))

(assert (=> b!1272145 m!1169849))

(assert (=> b!1272141 m!1169843))

(assert (=> b!1272141 m!1169843))

(assert (=> b!1272141 m!1169845))

(declare-fun m!1169889 () Bool)

(assert (=> d!139821 m!1169889))

(assert (=> d!139821 m!1169781))

(assert (=> b!1272147 m!1169843))

(assert (=> b!1272147 m!1169843))

(declare-fun m!1169891 () Bool)

(assert (=> b!1272147 m!1169891))

(assert (=> b!1272039 d!139821))

(declare-fun b!1272148 () Bool)

(declare-fun e!725563 () Bool)

(declare-fun e!725559 () Bool)

(assert (=> b!1272148 (= e!725563 e!725559)))

(declare-fun c!123655 () Bool)

(assert (=> b!1272148 (= c!123655 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(declare-fun b!1272149 () Bool)

(assert (=> b!1272149 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(assert (=> b!1272149 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40718 _values!1134)))))

(declare-fun e!725561 () Bool)

(declare-fun lt!574994 () ListLongMap!19095)

(assert (=> b!1272149 (= e!725561 (= (apply!1005 lt!574994 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))) (get!20504 (select (arr!40182 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1272150 () Bool)

(assert (=> b!1272150 (= e!725559 (= lt!574994 (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272151 () Bool)

(declare-fun e!725562 () Bool)

(assert (=> b!1272151 (= e!725562 e!725563)))

(declare-fun c!123658 () Bool)

(declare-fun e!725564 () Bool)

(assert (=> b!1272151 (= c!123658 e!725564)))

(declare-fun res!846279 () Bool)

(assert (=> b!1272151 (=> (not res!846279) (not e!725564))))

(assert (=> b!1272151 (= res!846279 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(declare-fun d!139823 () Bool)

(assert (=> d!139823 e!725562))

(declare-fun res!846277 () Bool)

(assert (=> d!139823 (=> (not res!846277) (not e!725562))))

(assert (=> d!139823 (= res!846277 (not (contains!7665 lt!574994 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!725558 () ListLongMap!19095)

(assert (=> d!139823 (= lt!574994 e!725558)))

(declare-fun c!123656 () Bool)

(assert (=> d!139823 (= c!123656 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(assert (=> d!139823 (validMask!0 mask!1730)))

(assert (=> d!139823 (= (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) lt!574994)))

(declare-fun b!1272152 () Bool)

(assert (=> b!1272152 (= e!725559 (isEmpty!1047 lt!574994))))

(declare-fun b!1272153 () Bool)

(assert (=> b!1272153 (= e!725564 (validKeyInArray!0 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1272153 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))

(declare-fun b!1272154 () Bool)

(assert (=> b!1272154 (= e!725558 (ListLongMap!19096 Nil!28547))))

(declare-fun b!1272155 () Bool)

(declare-fun e!725560 () ListLongMap!19095)

(assert (=> b!1272155 (= e!725558 e!725560)))

(declare-fun c!123657 () Bool)

(assert (=> b!1272155 (= c!123657 (validKeyInArray!0 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(declare-fun bm!62523 () Bool)

(declare-fun call!62526 () ListLongMap!19095)

(assert (=> bm!62523 (= call!62526 (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1272156 () Bool)

(declare-fun res!846280 () Bool)

(assert (=> b!1272156 (=> (not res!846280) (not e!725562))))

(assert (=> b!1272156 (= res!846280 (not (contains!7665 lt!574994 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272157 () Bool)

(declare-fun lt!574995 () Unit!42312)

(declare-fun lt!574998 () Unit!42312)

(assert (=> b!1272157 (= lt!574995 lt!574998)))

(declare-fun lt!574999 () ListLongMap!19095)

(declare-fun lt!574996 () (_ BitVec 64))

(declare-fun lt!574997 () V!49221)

(declare-fun lt!575000 () (_ BitVec 64))

(assert (=> b!1272157 (not (contains!7665 (+!4268 lt!574999 (tuple2!21367 lt!574996 lt!574997)) lt!575000))))

(assert (=> b!1272157 (= lt!574998 (addStillNotContains!333 lt!574999 lt!574996 lt!574997 lt!575000))))

(assert (=> b!1272157 (= lt!575000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1272157 (= lt!574997 (get!20504 (select (arr!40182 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272157 (= lt!574996 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)))))

(assert (=> b!1272157 (= lt!574999 call!62526)))

(assert (=> b!1272157 (= e!725560 (+!4268 call!62526 (tuple2!21367 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (get!20504 (select (arr!40182 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1272158 () Bool)

(assert (=> b!1272158 (= e!725560 call!62526)))

(declare-fun b!1272159 () Bool)

(assert (=> b!1272159 (= e!725563 e!725561)))

(assert (=> b!1272159 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(declare-fun res!846278 () Bool)

(assert (=> b!1272159 (= res!846278 (contains!7665 lt!574994 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1272159 (=> (not res!846278) (not e!725561))))

(assert (= (and d!139823 c!123656) b!1272154))

(assert (= (and d!139823 (not c!123656)) b!1272155))

(assert (= (and b!1272155 c!123657) b!1272157))

(assert (= (and b!1272155 (not c!123657)) b!1272158))

(assert (= (or b!1272157 b!1272158) bm!62523))

(assert (= (and d!139823 res!846277) b!1272156))

(assert (= (and b!1272156 res!846280) b!1272151))

(assert (= (and b!1272151 res!846279) b!1272153))

(assert (= (and b!1272151 c!123658) b!1272159))

(assert (= (and b!1272151 (not c!123658)) b!1272148))

(assert (= (and b!1272159 res!846278) b!1272149))

(assert (= (and b!1272148 c!123655) b!1272150))

(assert (= (and b!1272148 (not c!123655)) b!1272152))

(declare-fun b_lambda!23047 () Bool)

(assert (=> (not b_lambda!23047) (not b!1272149)))

(assert (=> b!1272149 t!42083))

(declare-fun b_and!45695 () Bool)

(assert (= b_and!45693 (and (=> t!42083 result!23549) b_and!45695)))

(declare-fun b_lambda!23049 () Bool)

(assert (=> (not b_lambda!23049) (not b!1272157)))

(assert (=> b!1272157 t!42083))

(declare-fun b_and!45697 () Bool)

(assert (= b_and!45695 (and (=> t!42083 result!23549) b_and!45697)))

(declare-fun m!1169893 () Bool)

(assert (=> b!1272150 m!1169893))

(assert (=> bm!62523 m!1169893))

(declare-fun m!1169895 () Bool)

(assert (=> b!1272155 m!1169895))

(assert (=> b!1272155 m!1169895))

(declare-fun m!1169897 () Bool)

(assert (=> b!1272155 m!1169897))

(declare-fun m!1169899 () Bool)

(assert (=> b!1272149 m!1169899))

(assert (=> b!1272149 m!1169849))

(declare-fun m!1169901 () Bool)

(assert (=> b!1272149 m!1169901))

(assert (=> b!1272149 m!1169899))

(assert (=> b!1272149 m!1169895))

(assert (=> b!1272149 m!1169895))

(declare-fun m!1169903 () Bool)

(assert (=> b!1272149 m!1169903))

(assert (=> b!1272149 m!1169849))

(declare-fun m!1169905 () Bool)

(assert (=> b!1272156 m!1169905))

(declare-fun m!1169907 () Bool)

(assert (=> b!1272152 m!1169907))

(assert (=> b!1272157 m!1169899))

(assert (=> b!1272157 m!1169849))

(assert (=> b!1272157 m!1169901))

(assert (=> b!1272157 m!1169899))

(declare-fun m!1169909 () Bool)

(assert (=> b!1272157 m!1169909))

(declare-fun m!1169911 () Bool)

(assert (=> b!1272157 m!1169911))

(assert (=> b!1272157 m!1169909))

(declare-fun m!1169913 () Bool)

(assert (=> b!1272157 m!1169913))

(assert (=> b!1272157 m!1169895))

(declare-fun m!1169915 () Bool)

(assert (=> b!1272157 m!1169915))

(assert (=> b!1272157 m!1169849))

(assert (=> b!1272153 m!1169895))

(assert (=> b!1272153 m!1169895))

(assert (=> b!1272153 m!1169897))

(declare-fun m!1169917 () Bool)

(assert (=> d!139823 m!1169917))

(assert (=> d!139823 m!1169781))

(assert (=> b!1272159 m!1169895))

(assert (=> b!1272159 m!1169895))

(declare-fun m!1169919 () Bool)

(assert (=> b!1272159 m!1169919))

(assert (=> b!1272039 d!139823))

(declare-fun b!1272160 () Bool)

(declare-fun e!725570 () Bool)

(declare-fun e!725566 () Bool)

(assert (=> b!1272160 (= e!725570 e!725566)))

(declare-fun c!123659 () Bool)

(assert (=> b!1272160 (= c!123659 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(declare-fun b!1272161 () Bool)

(assert (=> b!1272161 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(assert (=> b!1272161 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40718 _values!1134)))))

(declare-fun lt!575001 () ListLongMap!19095)

(declare-fun e!725568 () Bool)

(assert (=> b!1272161 (= e!725568 (= (apply!1005 lt!575001 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))) (get!20504 (select (arr!40182 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1272162 () Bool)

(assert (=> b!1272162 (= e!725566 (= lt!575001 (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272163 () Bool)

(declare-fun e!725569 () Bool)

(assert (=> b!1272163 (= e!725569 e!725570)))

(declare-fun c!123662 () Bool)

(declare-fun e!725571 () Bool)

(assert (=> b!1272163 (= c!123662 e!725571)))

(declare-fun res!846283 () Bool)

(assert (=> b!1272163 (=> (not res!846283) (not e!725571))))

(assert (=> b!1272163 (= res!846283 (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(declare-fun d!139825 () Bool)

(assert (=> d!139825 e!725569))

(declare-fun res!846281 () Bool)

(assert (=> d!139825 (=> (not res!846281) (not e!725569))))

(assert (=> d!139825 (= res!846281 (not (contains!7665 lt!575001 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!725565 () ListLongMap!19095)

(assert (=> d!139825 (= lt!575001 e!725565)))

(declare-fun c!123660 () Bool)

(assert (=> d!139825 (= c!123660 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(assert (=> d!139825 (validMask!0 mask!1730)))

(assert (=> d!139825 (= (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) lt!575001)))

(declare-fun b!1272164 () Bool)

(assert (=> b!1272164 (= e!725566 (isEmpty!1047 lt!575001))))

(declare-fun b!1272165 () Bool)

(assert (=> b!1272165 (= e!725571 (validKeyInArray!0 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1272165 (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))

(declare-fun b!1272166 () Bool)

(assert (=> b!1272166 (= e!725565 (ListLongMap!19096 Nil!28547))))

(declare-fun b!1272167 () Bool)

(declare-fun e!725567 () ListLongMap!19095)

(assert (=> b!1272167 (= e!725565 e!725567)))

(declare-fun c!123661 () Bool)

(assert (=> b!1272167 (= c!123661 (validKeyInArray!0 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(declare-fun bm!62524 () Bool)

(declare-fun call!62527 () ListLongMap!19095)

(assert (=> bm!62524 (= call!62527 (getCurrentListMapNoExtraKeys!5895 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1272168 () Bool)

(declare-fun res!846284 () Bool)

(assert (=> b!1272168 (=> (not res!846284) (not e!725569))))

(assert (=> b!1272168 (= res!846284 (not (contains!7665 lt!575001 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272169 () Bool)

(declare-fun lt!575002 () Unit!42312)

(declare-fun lt!575005 () Unit!42312)

(assert (=> b!1272169 (= lt!575002 lt!575005)))

(declare-fun lt!575004 () V!49221)

(declare-fun lt!575007 () (_ BitVec 64))

(declare-fun lt!575006 () ListLongMap!19095)

(declare-fun lt!575003 () (_ BitVec 64))

(assert (=> b!1272169 (not (contains!7665 (+!4268 lt!575006 (tuple2!21367 lt!575003 lt!575004)) lt!575007))))

(assert (=> b!1272169 (= lt!575005 (addStillNotContains!333 lt!575006 lt!575003 lt!575004 lt!575007))))

(assert (=> b!1272169 (= lt!575007 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1272169 (= lt!575004 (get!20504 (select (arr!40182 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272169 (= lt!575003 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)))))

(assert (=> b!1272169 (= lt!575006 call!62527)))

(assert (=> b!1272169 (= e!725567 (+!4268 call!62527 (tuple2!21367 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (get!20504 (select (arr!40182 _values!1134) (bvadd #b00000000000000000000000000000001 from!1698)) (dynLambda!3403 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1272170 () Bool)

(assert (=> b!1272170 (= e!725567 call!62527)))

(declare-fun b!1272171 () Bool)

(assert (=> b!1272171 (= e!725570 e!725568)))

(assert (=> b!1272171 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) (size!40719 _keys!1364)))))

(declare-fun res!846282 () Bool)

(assert (=> b!1272171 (= res!846282 (contains!7665 lt!575001 (select (arr!40183 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698))))))

(assert (=> b!1272171 (=> (not res!846282) (not e!725568))))

(assert (= (and d!139825 c!123660) b!1272166))

(assert (= (and d!139825 (not c!123660)) b!1272167))

(assert (= (and b!1272167 c!123661) b!1272169))

(assert (= (and b!1272167 (not c!123661)) b!1272170))

(assert (= (or b!1272169 b!1272170) bm!62524))

(assert (= (and d!139825 res!846281) b!1272168))

(assert (= (and b!1272168 res!846284) b!1272163))

(assert (= (and b!1272163 res!846283) b!1272165))

(assert (= (and b!1272163 c!123662) b!1272171))

(assert (= (and b!1272163 (not c!123662)) b!1272160))

(assert (= (and b!1272171 res!846282) b!1272161))

(assert (= (and b!1272160 c!123659) b!1272162))

(assert (= (and b!1272160 (not c!123659)) b!1272164))

(declare-fun b_lambda!23051 () Bool)

(assert (=> (not b_lambda!23051) (not b!1272161)))

(assert (=> b!1272161 t!42083))

(declare-fun b_and!45699 () Bool)

(assert (= b_and!45697 (and (=> t!42083 result!23549) b_and!45699)))

(declare-fun b_lambda!23053 () Bool)

(assert (=> (not b_lambda!23053) (not b!1272169)))

(assert (=> b!1272169 t!42083))

(declare-fun b_and!45701 () Bool)

(assert (= b_and!45699 (and (=> t!42083 result!23549) b_and!45701)))

(declare-fun m!1169921 () Bool)

(assert (=> b!1272162 m!1169921))

(assert (=> bm!62524 m!1169921))

(assert (=> b!1272167 m!1169895))

(assert (=> b!1272167 m!1169895))

(assert (=> b!1272167 m!1169897))

(assert (=> b!1272161 m!1169899))

(assert (=> b!1272161 m!1169849))

(assert (=> b!1272161 m!1169901))

(assert (=> b!1272161 m!1169899))

(assert (=> b!1272161 m!1169895))

(assert (=> b!1272161 m!1169895))

(declare-fun m!1169923 () Bool)

(assert (=> b!1272161 m!1169923))

(assert (=> b!1272161 m!1169849))

(declare-fun m!1169925 () Bool)

(assert (=> b!1272168 m!1169925))

(declare-fun m!1169927 () Bool)

(assert (=> b!1272164 m!1169927))

(assert (=> b!1272169 m!1169899))

(assert (=> b!1272169 m!1169849))

(assert (=> b!1272169 m!1169901))

(assert (=> b!1272169 m!1169899))

(declare-fun m!1169929 () Bool)

(assert (=> b!1272169 m!1169929))

(declare-fun m!1169931 () Bool)

(assert (=> b!1272169 m!1169931))

(assert (=> b!1272169 m!1169929))

(declare-fun m!1169933 () Bool)

(assert (=> b!1272169 m!1169933))

(assert (=> b!1272169 m!1169895))

(declare-fun m!1169935 () Bool)

(assert (=> b!1272169 m!1169935))

(assert (=> b!1272169 m!1169849))

(assert (=> b!1272165 m!1169895))

(assert (=> b!1272165 m!1169895))

(assert (=> b!1272165 m!1169897))

(declare-fun m!1169937 () Bool)

(assert (=> d!139825 m!1169937))

(assert (=> d!139825 m!1169781))

(assert (=> b!1272171 m!1169895))

(assert (=> b!1272171 m!1169895))

(declare-fun m!1169939 () Bool)

(assert (=> b!1272171 m!1169939))

(assert (=> b!1272039 d!139825))

(declare-fun b!1272179 () Bool)

(declare-fun e!725577 () Bool)

(assert (=> b!1272179 (= e!725577 tp_is_empty!33021)))

(declare-fun mapNonEmpty!51118 () Bool)

(declare-fun mapRes!51118 () Bool)

(declare-fun tp!97468 () Bool)

(declare-fun e!725576 () Bool)

(assert (=> mapNonEmpty!51118 (= mapRes!51118 (and tp!97468 e!725576))))

(declare-fun mapRest!51118 () (Array (_ BitVec 32) ValueCell!15657))

(declare-fun mapValue!51118 () ValueCell!15657)

(declare-fun mapKey!51118 () (_ BitVec 32))

(assert (=> mapNonEmpty!51118 (= mapRest!51112 (store mapRest!51118 mapKey!51118 mapValue!51118))))

(declare-fun b!1272178 () Bool)

(assert (=> b!1272178 (= e!725576 tp_is_empty!33021)))

(declare-fun mapIsEmpty!51118 () Bool)

(assert (=> mapIsEmpty!51118 mapRes!51118))

(declare-fun condMapEmpty!51118 () Bool)

(declare-fun mapDefault!51118 () ValueCell!15657)

(assert (=> mapNonEmpty!51112 (= condMapEmpty!51118 (= mapRest!51112 ((as const (Array (_ BitVec 32) ValueCell!15657)) mapDefault!51118)))))

(assert (=> mapNonEmpty!51112 (= tp!97458 (and e!725577 mapRes!51118))))

(assert (= (and mapNonEmpty!51112 condMapEmpty!51118) mapIsEmpty!51118))

(assert (= (and mapNonEmpty!51112 (not condMapEmpty!51118)) mapNonEmpty!51118))

(assert (= (and mapNonEmpty!51118 ((_ is ValueCellFull!15657) mapValue!51118)) b!1272178))

(assert (= (and mapNonEmpty!51112 ((_ is ValueCellFull!15657) mapDefault!51118)) b!1272179))

(declare-fun m!1169941 () Bool)

(assert (=> mapNonEmpty!51118 m!1169941))

(declare-fun b_lambda!23055 () Bool)

(assert (= b_lambda!23051 (or (and start!107332 b_free!27651) b_lambda!23055)))

(declare-fun b_lambda!23057 () Bool)

(assert (= b_lambda!23039 (or (and start!107332 b_free!27651) b_lambda!23057)))

(declare-fun b_lambda!23059 () Bool)

(assert (= b_lambda!23041 (or (and start!107332 b_free!27651) b_lambda!23059)))

(declare-fun b_lambda!23061 () Bool)

(assert (= b_lambda!23053 (or (and start!107332 b_free!27651) b_lambda!23061)))

(declare-fun b_lambda!23063 () Bool)

(assert (= b_lambda!23045 (or (and start!107332 b_free!27651) b_lambda!23063)))

(declare-fun b_lambda!23065 () Bool)

(assert (= b_lambda!23049 (or (and start!107332 b_free!27651) b_lambda!23065)))

(declare-fun b_lambda!23067 () Bool)

(assert (= b_lambda!23043 (or (and start!107332 b_free!27651) b_lambda!23067)))

(declare-fun b_lambda!23069 () Bool)

(assert (= b_lambda!23047 (or (and start!107332 b_free!27651) b_lambda!23069)))

(check-sat (not bm!62523) (not b!1272124) (not b!1272152) (not b!1272096) (not b_lambda!23055) (not bm!62521) (not b!1272143) (not b_lambda!23065) (not b!1272131) (not d!139823) (not b!1272138) (not b!1272123) (not bm!62524) (not b!1272162) (not mapNonEmpty!51118) (not b_lambda!23057) (not d!139817) (not b_lambda!23069) (not b!1272082) (not b!1272094) (not b!1272133) (not b_next!27651) (not b!1272155) (not b!1272145) (not b!1272165) (not b!1272159) (not b!1272156) (not b_lambda!23063) (not b!1272164) (not b!1272153) (not b_lambda!23067) (not b!1272167) (not b!1272081) (not b!1272157) (not bm!62522) (not b!1272126) (not b!1272144) (not b!1272168) (not b!1272140) (not b_lambda!23059) (not b_lambda!23061) (not bm!62518) (not b!1272141) (not b!1272169) (not b!1272161) (not b!1272171) (not bm!62515) (not b!1272149) b_and!45701 (not b!1272147) tp_is_empty!33021 (not d!139821) (not b!1272150) (not b!1272083) (not b!1272129) (not b!1272137) (not d!139819) (not d!139825) (not b!1272127) (not b!1272130))
(check-sat b_and!45701 (not b_next!27651))
