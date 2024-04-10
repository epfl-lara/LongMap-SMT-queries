; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108136 () Bool)

(assert start!108136)

(declare-fun b_free!27849 () Bool)

(declare-fun b_next!27849 () Bool)

(assert (=> start!108136 (= b_free!27849 (not b_next!27849))))

(declare-fun tp!98500 () Bool)

(declare-fun b_and!45905 () Bool)

(assert (=> start!108136 (= tp!98500 b_and!45905)))

(declare-fun b!1277077 () Bool)

(declare-fun e!729299 () Bool)

(declare-fun tp_is_empty!33399 () Bool)

(assert (=> b!1277077 (= e!729299 tp_is_empty!33399)))

(declare-fun mapNonEmpty!51629 () Bool)

(declare-fun mapRes!51629 () Bool)

(declare-fun tp!98501 () Bool)

(assert (=> mapNonEmpty!51629 (= mapRes!51629 (and tp!98501 e!729299))))

(declare-fun mapKey!51629 () (_ BitVec 32))

(declare-datatypes ((V!49635 0))(
  ( (V!49636 (val!16774 Int)) )
))
(declare-datatypes ((ValueCell!15801 0))(
  ( (ValueCellFull!15801 (v!19371 V!49635)) (EmptyCell!15801) )
))
(declare-fun mapRest!51629 () (Array (_ BitVec 32) ValueCell!15801))

(declare-datatypes ((array!83890 0))(
  ( (array!83891 (arr!40456 (Array (_ BitVec 32) ValueCell!15801)) (size!41006 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83890)

(declare-fun mapValue!51629 () ValueCell!15801)

(assert (=> mapNonEmpty!51629 (= (arr!40456 _values!1187) (store mapRest!51629 mapKey!51629 mapValue!51629))))

(declare-fun res!848646 () Bool)

(declare-fun e!729300 () Bool)

(assert (=> start!108136 (=> (not res!848646) (not e!729300))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108136 (= res!848646 (validMask!0 mask!1805))))

(assert (=> start!108136 e!729300))

(assert (=> start!108136 true))

(assert (=> start!108136 tp!98500))

(assert (=> start!108136 tp_is_empty!33399))

(declare-fun e!729295 () Bool)

(declare-fun array_inv!30739 (array!83890) Bool)

(assert (=> start!108136 (and (array_inv!30739 _values!1187) e!729295)))

(declare-datatypes ((array!83892 0))(
  ( (array!83893 (arr!40457 (Array (_ BitVec 32) (_ BitVec 64))) (size!41007 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83892)

(declare-fun array_inv!30740 (array!83892) Bool)

(assert (=> start!108136 (array_inv!30740 _keys!1427)))

(declare-fun b!1277078 () Bool)

(declare-fun res!848642 () Bool)

(assert (=> b!1277078 (=> (not res!848642) (not e!729300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83892 (_ BitVec 32)) Bool)

(assert (=> b!1277078 (= res!848642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277079 () Bool)

(declare-fun res!848645 () Bool)

(assert (=> b!1277079 (=> (not res!848645) (not e!729300))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun minValue!1129 () V!49635)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49635)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((tuple2!21516 0))(
  ( (tuple2!21517 (_1!10769 (_ BitVec 64)) (_2!10769 V!49635)) )
))
(declare-datatypes ((List!28692 0))(
  ( (Nil!28689) (Cons!28688 (h!29897 tuple2!21516) (t!42228 List!28692)) )
))
(declare-datatypes ((ListLongMap!19173 0))(
  ( (ListLongMap!19174 (toList!9602 List!28692)) )
))
(declare-fun contains!7711 (ListLongMap!19173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4686 (array!83892 array!83890 (_ BitVec 32) (_ BitVec 32) V!49635 V!49635 (_ BitVec 32) Int) ListLongMap!19173)

(assert (=> b!1277079 (= res!848645 (contains!7711 (getCurrentListMap!4686 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277080 () Bool)

(declare-fun res!848643 () Bool)

(assert (=> b!1277080 (=> (not res!848643) (not e!729300))))

(assert (=> b!1277080 (= res!848643 (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(declare-fun b!1277081 () Bool)

(declare-fun e!729296 () Bool)

(assert (=> b!1277081 (= e!729296 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1277082 () Bool)

(declare-fun arrayContainsKey!0 (array!83892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1277082 (= e!729296 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!51629 () Bool)

(assert (=> mapIsEmpty!51629 mapRes!51629))

(declare-fun b!1277083 () Bool)

(declare-fun e!729298 () Bool)

(assert (=> b!1277083 (= e!729295 (and e!729298 mapRes!51629))))

(declare-fun condMapEmpty!51629 () Bool)

(declare-fun mapDefault!51629 () ValueCell!15801)

(assert (=> b!1277083 (= condMapEmpty!51629 (= (arr!40456 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15801)) mapDefault!51629)))))

(declare-fun b!1277084 () Bool)

(declare-fun res!848644 () Bool)

(assert (=> b!1277084 (=> (not res!848644) (not e!729300))))

(declare-datatypes ((List!28693 0))(
  ( (Nil!28690) (Cons!28689 (h!29898 (_ BitVec 64)) (t!42229 List!28693)) )
))
(declare-fun arrayNoDuplicates!0 (array!83892 (_ BitVec 32) List!28693) Bool)

(assert (=> b!1277084 (= res!848644 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28690))))

(declare-fun b!1277085 () Bool)

(declare-fun lt!575572 () Bool)

(assert (=> b!1277085 (= e!729300 (not (or lt!575572 (bvslt (size!41007 _keys!1427) #b01111111111111111111111111111111))))))

(assert (=> b!1277085 e!729296))

(declare-fun c!123957 () Bool)

(assert (=> b!1277085 (= c!123957 (not lt!575572))))

(assert (=> b!1277085 (= lt!575572 (or (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!42369 0))(
  ( (Unit!42370) )
))
(declare-fun lt!575571 () Unit!42369)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!627 (array!83892 array!83890 (_ BitVec 32) (_ BitVec 32) V!49635 V!49635 (_ BitVec 64) (_ BitVec 32) Int) Unit!42369)

(assert (=> b!1277085 (= lt!575571 (lemmaListMapContainsThenArrayContainsFrom!627 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1277086 () Bool)

(declare-fun res!848641 () Bool)

(assert (=> b!1277086 (=> (not res!848641) (not e!729300))))

(assert (=> b!1277086 (= res!848641 (and (= (size!41006 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41007 _keys!1427) (size!41006 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277087 () Bool)

(assert (=> b!1277087 (= e!729298 tp_is_empty!33399)))

(assert (= (and start!108136 res!848646) b!1277086))

(assert (= (and b!1277086 res!848641) b!1277078))

(assert (= (and b!1277078 res!848642) b!1277084))

(assert (= (and b!1277084 res!848644) b!1277079))

(assert (= (and b!1277079 res!848645) b!1277080))

(assert (= (and b!1277080 res!848643) b!1277085))

(assert (= (and b!1277085 c!123957) b!1277082))

(assert (= (and b!1277085 (not c!123957)) b!1277081))

(assert (= (and b!1277083 condMapEmpty!51629) mapIsEmpty!51629))

(assert (= (and b!1277083 (not condMapEmpty!51629)) mapNonEmpty!51629))

(get-info :version)

(assert (= (and mapNonEmpty!51629 ((_ is ValueCellFull!15801) mapValue!51629)) b!1277077))

(assert (= (and b!1277083 ((_ is ValueCellFull!15801) mapDefault!51629)) b!1277087))

(assert (= start!108136 b!1277083))

(declare-fun m!1172797 () Bool)

(assert (=> b!1277084 m!1172797))

(declare-fun m!1172799 () Bool)

(assert (=> b!1277085 m!1172799))

(declare-fun m!1172801 () Bool)

(assert (=> b!1277078 m!1172801))

(declare-fun m!1172803 () Bool)

(assert (=> mapNonEmpty!51629 m!1172803))

(declare-fun m!1172805 () Bool)

(assert (=> b!1277082 m!1172805))

(declare-fun m!1172807 () Bool)

(assert (=> b!1277079 m!1172807))

(assert (=> b!1277079 m!1172807))

(declare-fun m!1172809 () Bool)

(assert (=> b!1277079 m!1172809))

(declare-fun m!1172811 () Bool)

(assert (=> start!108136 m!1172811))

(declare-fun m!1172813 () Bool)

(assert (=> start!108136 m!1172813))

(declare-fun m!1172815 () Bool)

(assert (=> start!108136 m!1172815))

(check-sat (not mapNonEmpty!51629) b_and!45905 (not b!1277079) (not start!108136) (not b!1277078) (not b!1277085) (not b_next!27849) (not b!1277082) tp_is_empty!33399 (not b!1277084))
(check-sat b_and!45905 (not b_next!27849))
(get-model)

(declare-fun d!140447 () Bool)

(declare-fun res!848669 () Bool)

(declare-fun e!729323 () Bool)

(assert (=> d!140447 (=> res!848669 e!729323)))

(assert (=> d!140447 (= res!848669 (= (select (arr!40457 _keys!1427) #b00000000000000000000000000000000) k0!1053))))

(assert (=> d!140447 (= (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000) e!729323)))

(declare-fun b!1277125 () Bool)

(declare-fun e!729324 () Bool)

(assert (=> b!1277125 (= e!729323 e!729324)))

(declare-fun res!848670 () Bool)

(assert (=> b!1277125 (=> (not res!848670) (not e!729324))))

(assert (=> b!1277125 (= res!848670 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!41007 _keys!1427)))))

(declare-fun b!1277126 () Bool)

(assert (=> b!1277126 (= e!729324 (arrayContainsKey!0 _keys!1427 k0!1053 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!140447 (not res!848669)) b!1277125))

(assert (= (and b!1277125 res!848670) b!1277126))

(declare-fun m!1172837 () Bool)

(assert (=> d!140447 m!1172837))

(declare-fun m!1172839 () Bool)

(assert (=> b!1277126 m!1172839))

(assert (=> b!1277082 d!140447))

(declare-fun d!140449 () Bool)

(declare-fun e!729330 () Bool)

(assert (=> d!140449 e!729330))

(declare-fun res!848673 () Bool)

(assert (=> d!140449 (=> res!848673 e!729330)))

(declare-fun lt!575588 () Bool)

(assert (=> d!140449 (= res!848673 (not lt!575588))))

(declare-fun lt!575590 () Bool)

(assert (=> d!140449 (= lt!575588 lt!575590)))

(declare-fun lt!575587 () Unit!42369)

(declare-fun e!729329 () Unit!42369)

(assert (=> d!140449 (= lt!575587 e!729329)))

(declare-fun c!123963 () Bool)

(assert (=> d!140449 (= c!123963 lt!575590)))

(declare-fun containsKey!712 (List!28692 (_ BitVec 64)) Bool)

(assert (=> d!140449 (= lt!575590 (containsKey!712 (toList!9602 (getCurrentListMap!4686 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(assert (=> d!140449 (= (contains!7711 (getCurrentListMap!4686 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053) lt!575588)))

(declare-fun b!1277133 () Bool)

(declare-fun lt!575589 () Unit!42369)

(assert (=> b!1277133 (= e!729329 lt!575589)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!458 (List!28692 (_ BitVec 64)) Unit!42369)

(assert (=> b!1277133 (= lt!575589 (lemmaContainsKeyImpliesGetValueByKeyDefined!458 (toList!9602 (getCurrentListMap!4686 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-datatypes ((Option!742 0))(
  ( (Some!741 (v!19373 V!49635)) (None!740) )
))
(declare-fun isDefined!497 (Option!742) Bool)

(declare-fun getValueByKey!690 (List!28692 (_ BitVec 64)) Option!742)

(assert (=> b!1277133 (isDefined!497 (getValueByKey!690 (toList!9602 (getCurrentListMap!4686 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-fun b!1277134 () Bool)

(declare-fun Unit!42373 () Unit!42369)

(assert (=> b!1277134 (= e!729329 Unit!42373)))

(declare-fun b!1277135 () Bool)

(assert (=> b!1277135 (= e!729330 (isDefined!497 (getValueByKey!690 (toList!9602 (getCurrentListMap!4686 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053)))))

(assert (= (and d!140449 c!123963) b!1277133))

(assert (= (and d!140449 (not c!123963)) b!1277134))

(assert (= (and d!140449 (not res!848673)) b!1277135))

(declare-fun m!1172841 () Bool)

(assert (=> d!140449 m!1172841))

(declare-fun m!1172843 () Bool)

(assert (=> b!1277133 m!1172843))

(declare-fun m!1172845 () Bool)

(assert (=> b!1277133 m!1172845))

(assert (=> b!1277133 m!1172845))

(declare-fun m!1172847 () Bool)

(assert (=> b!1277133 m!1172847))

(assert (=> b!1277135 m!1172845))

(assert (=> b!1277135 m!1172845))

(assert (=> b!1277135 m!1172847))

(assert (=> b!1277079 d!140449))

(declare-fun b!1277178 () Bool)

(declare-fun e!729357 () ListLongMap!19173)

(declare-fun call!62668 () ListLongMap!19173)

(declare-fun +!4270 (ListLongMap!19173 tuple2!21516) ListLongMap!19173)

(assert (=> b!1277178 (= e!729357 (+!4270 call!62668 (tuple2!21517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129)))))

(declare-fun d!140451 () Bool)

(declare-fun e!729362 () Bool)

(assert (=> d!140451 e!729362))

(declare-fun res!848697 () Bool)

(assert (=> d!140451 (=> (not res!848697) (not e!729362))))

(assert (=> d!140451 (= res!848697 (or (bvsge #b00000000000000000000000000000000 (size!41007 _keys!1427)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))))

(declare-fun lt!575642 () ListLongMap!19173)

(declare-fun lt!575638 () ListLongMap!19173)

(assert (=> d!140451 (= lt!575642 lt!575638)))

(declare-fun lt!575643 () Unit!42369)

(declare-fun e!729368 () Unit!42369)

(assert (=> d!140451 (= lt!575643 e!729368)))

(declare-fun c!123980 () Bool)

(declare-fun e!729366 () Bool)

(assert (=> d!140451 (= c!123980 e!729366)))

(declare-fun res!848692 () Bool)

(assert (=> d!140451 (=> (not res!848692) (not e!729366))))

(assert (=> d!140451 (= res!848692 (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(assert (=> d!140451 (= lt!575638 e!729357)))

(declare-fun c!123976 () Bool)

(assert (=> d!140451 (= c!123976 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140451 (validMask!0 mask!1805)))

(assert (=> d!140451 (= (getCurrentListMap!4686 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) lt!575642)))

(declare-fun e!729361 () Bool)

(declare-fun b!1277179 () Bool)

(declare-fun apply!1007 (ListLongMap!19173 (_ BitVec 64)) V!49635)

(declare-fun get!20632 (ValueCell!15801 V!49635) V!49635)

(declare-fun dynLambda!3405 (Int (_ BitVec 64)) V!49635)

(assert (=> b!1277179 (= e!729361 (= (apply!1007 lt!575642 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000)) (get!20632 (select (arr!40456 _values!1187) #b00000000000000000000000000000000) (dynLambda!3405 defaultEntry!1195 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1277179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41006 _values!1187)))))

(assert (=> b!1277179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(declare-fun b!1277180 () Bool)

(declare-fun e!729364 () ListLongMap!19173)

(declare-fun call!62666 () ListLongMap!19173)

(assert (=> b!1277180 (= e!729364 call!62666)))

(declare-fun b!1277181 () Bool)

(declare-fun e!729358 () ListLongMap!19173)

(assert (=> b!1277181 (= e!729358 call!62666)))

(declare-fun b!1277182 () Bool)

(assert (=> b!1277182 (= e!729357 e!729358)))

(declare-fun c!123977 () Bool)

(assert (=> b!1277182 (= c!123977 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62662 () Bool)

(declare-fun call!62671 () Bool)

(assert (=> bm!62662 (= call!62671 (contains!7711 lt!575642 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1277183 () Bool)

(declare-fun call!62665 () ListLongMap!19173)

(assert (=> b!1277183 (= e!729364 call!62665)))

(declare-fun bm!62663 () Bool)

(declare-fun call!62670 () ListLongMap!19173)

(declare-fun call!62667 () ListLongMap!19173)

(assert (=> bm!62663 (= call!62670 call!62667)))

(declare-fun bm!62664 () Bool)

(assert (=> bm!62664 (= call!62665 call!62670)))

(declare-fun b!1277184 () Bool)

(declare-fun e!729359 () Bool)

(assert (=> b!1277184 (= e!729362 e!729359)))

(declare-fun c!123979 () Bool)

(assert (=> b!1277184 (= c!123979 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1277185 () Bool)

(declare-fun e!729363 () Bool)

(assert (=> b!1277185 (= e!729359 e!729363)))

(declare-fun res!848696 () Bool)

(assert (=> b!1277185 (= res!848696 call!62671)))

(assert (=> b!1277185 (=> (not res!848696) (not e!729363))))

(declare-fun b!1277186 () Bool)

(declare-fun c!123981 () Bool)

(assert (=> b!1277186 (= c!123981 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1277186 (= e!729358 e!729364)))

(declare-fun bm!62665 () Bool)

(assert (=> bm!62665 (= call!62668 (+!4270 (ite c!123976 call!62667 (ite c!123977 call!62670 call!62665)) (ite (or c!123976 c!123977) (tuple2!21517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1129) (tuple2!21517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129))))))

(declare-fun b!1277187 () Bool)

(declare-fun e!729365 () Bool)

(assert (=> b!1277187 (= e!729365 e!729361)))

(declare-fun res!848699 () Bool)

(assert (=> b!1277187 (=> (not res!848699) (not e!729361))))

(assert (=> b!1277187 (= res!848699 (contains!7711 lt!575642 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000)))))

(assert (=> b!1277187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(declare-fun b!1277188 () Bool)

(declare-fun e!729367 () Bool)

(assert (=> b!1277188 (= e!729367 (= (apply!1007 lt!575642 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1129))))

(declare-fun bm!62666 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5900 (array!83892 array!83890 (_ BitVec 32) (_ BitVec 32) V!49635 V!49635 (_ BitVec 32) Int) ListLongMap!19173)

(assert (=> bm!62666 (= call!62667 (getCurrentListMapNoExtraKeys!5900 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1277189 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1277189 (= e!729366 (validKeyInArray!0 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277190 () Bool)

(assert (=> b!1277190 (= e!729363 (= (apply!1007 lt!575642 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1129))))

(declare-fun bm!62667 () Bool)

(declare-fun call!62669 () Bool)

(assert (=> bm!62667 (= call!62669 (contains!7711 lt!575642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1277191 () Bool)

(declare-fun lt!575640 () Unit!42369)

(assert (=> b!1277191 (= e!729368 lt!575640)))

(declare-fun lt!575651 () ListLongMap!19173)

(assert (=> b!1277191 (= lt!575651 (getCurrentListMapNoExtraKeys!5900 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575650 () (_ BitVec 64))

(assert (=> b!1277191 (= lt!575650 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575649 () (_ BitVec 64))

(assert (=> b!1277191 (= lt!575649 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575654 () Unit!42369)

(declare-fun addStillContains!1095 (ListLongMap!19173 (_ BitVec 64) V!49635 (_ BitVec 64)) Unit!42369)

(assert (=> b!1277191 (= lt!575654 (addStillContains!1095 lt!575651 lt!575650 zeroValue!1129 lt!575649))))

(assert (=> b!1277191 (contains!7711 (+!4270 lt!575651 (tuple2!21517 lt!575650 zeroValue!1129)) lt!575649)))

(declare-fun lt!575636 () Unit!42369)

(assert (=> b!1277191 (= lt!575636 lt!575654)))

(declare-fun lt!575645 () ListLongMap!19173)

(assert (=> b!1277191 (= lt!575645 (getCurrentListMapNoExtraKeys!5900 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575644 () (_ BitVec 64))

(assert (=> b!1277191 (= lt!575644 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575646 () (_ BitVec 64))

(assert (=> b!1277191 (= lt!575646 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575653 () Unit!42369)

(declare-fun addApplyDifferent!549 (ListLongMap!19173 (_ BitVec 64) V!49635 (_ BitVec 64)) Unit!42369)

(assert (=> b!1277191 (= lt!575653 (addApplyDifferent!549 lt!575645 lt!575644 minValue!1129 lt!575646))))

(assert (=> b!1277191 (= (apply!1007 (+!4270 lt!575645 (tuple2!21517 lt!575644 minValue!1129)) lt!575646) (apply!1007 lt!575645 lt!575646))))

(declare-fun lt!575639 () Unit!42369)

(assert (=> b!1277191 (= lt!575639 lt!575653)))

(declare-fun lt!575656 () ListLongMap!19173)

(assert (=> b!1277191 (= lt!575656 (getCurrentListMapNoExtraKeys!5900 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575647 () (_ BitVec 64))

(assert (=> b!1277191 (= lt!575647 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575652 () (_ BitVec 64))

(assert (=> b!1277191 (= lt!575652 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575635 () Unit!42369)

(assert (=> b!1277191 (= lt!575635 (addApplyDifferent!549 lt!575656 lt!575647 zeroValue!1129 lt!575652))))

(assert (=> b!1277191 (= (apply!1007 (+!4270 lt!575656 (tuple2!21517 lt!575647 zeroValue!1129)) lt!575652) (apply!1007 lt!575656 lt!575652))))

(declare-fun lt!575655 () Unit!42369)

(assert (=> b!1277191 (= lt!575655 lt!575635)))

(declare-fun lt!575641 () ListLongMap!19173)

(assert (=> b!1277191 (= lt!575641 (getCurrentListMapNoExtraKeys!5900 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575637 () (_ BitVec 64))

(assert (=> b!1277191 (= lt!575637 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575648 () (_ BitVec 64))

(assert (=> b!1277191 (= lt!575648 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> b!1277191 (= lt!575640 (addApplyDifferent!549 lt!575641 lt!575637 minValue!1129 lt!575648))))

(assert (=> b!1277191 (= (apply!1007 (+!4270 lt!575641 (tuple2!21517 lt!575637 minValue!1129)) lt!575648) (apply!1007 lt!575641 lt!575648))))

(declare-fun b!1277192 () Bool)

(declare-fun e!729360 () Bool)

(assert (=> b!1277192 (= e!729360 (validKeyInArray!0 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277193 () Bool)

(declare-fun res!848695 () Bool)

(assert (=> b!1277193 (=> (not res!848695) (not e!729362))))

(declare-fun e!729369 () Bool)

(assert (=> b!1277193 (= res!848695 e!729369)))

(declare-fun c!123978 () Bool)

(assert (=> b!1277193 (= c!123978 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1277194 () Bool)

(assert (=> b!1277194 (= e!729369 (not call!62669))))

(declare-fun bm!62668 () Bool)

(assert (=> bm!62668 (= call!62666 call!62668)))

(declare-fun b!1277195 () Bool)

(declare-fun res!848698 () Bool)

(assert (=> b!1277195 (=> (not res!848698) (not e!729362))))

(assert (=> b!1277195 (= res!848698 e!729365)))

(declare-fun res!848700 () Bool)

(assert (=> b!1277195 (=> res!848700 e!729365)))

(assert (=> b!1277195 (= res!848700 (not e!729360))))

(declare-fun res!848694 () Bool)

(assert (=> b!1277195 (=> (not res!848694) (not e!729360))))

(assert (=> b!1277195 (= res!848694 (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(declare-fun b!1277196 () Bool)

(assert (=> b!1277196 (= e!729359 (not call!62671))))

(declare-fun b!1277197 () Bool)

(declare-fun Unit!42374 () Unit!42369)

(assert (=> b!1277197 (= e!729368 Unit!42374)))

(declare-fun b!1277198 () Bool)

(assert (=> b!1277198 (= e!729369 e!729367)))

(declare-fun res!848693 () Bool)

(assert (=> b!1277198 (= res!848693 call!62669)))

(assert (=> b!1277198 (=> (not res!848693) (not e!729367))))

(assert (= (and d!140451 c!123976) b!1277178))

(assert (= (and d!140451 (not c!123976)) b!1277182))

(assert (= (and b!1277182 c!123977) b!1277181))

(assert (= (and b!1277182 (not c!123977)) b!1277186))

(assert (= (and b!1277186 c!123981) b!1277180))

(assert (= (and b!1277186 (not c!123981)) b!1277183))

(assert (= (or b!1277180 b!1277183) bm!62664))

(assert (= (or b!1277181 bm!62664) bm!62663))

(assert (= (or b!1277181 b!1277180) bm!62668))

(assert (= (or b!1277178 bm!62663) bm!62666))

(assert (= (or b!1277178 bm!62668) bm!62665))

(assert (= (and d!140451 res!848692) b!1277189))

(assert (= (and d!140451 c!123980) b!1277191))

(assert (= (and d!140451 (not c!123980)) b!1277197))

(assert (= (and d!140451 res!848697) b!1277195))

(assert (= (and b!1277195 res!848694) b!1277192))

(assert (= (and b!1277195 (not res!848700)) b!1277187))

(assert (= (and b!1277187 res!848699) b!1277179))

(assert (= (and b!1277195 res!848698) b!1277193))

(assert (= (and b!1277193 c!123978) b!1277198))

(assert (= (and b!1277193 (not c!123978)) b!1277194))

(assert (= (and b!1277198 res!848693) b!1277188))

(assert (= (or b!1277198 b!1277194) bm!62667))

(assert (= (and b!1277193 res!848695) b!1277184))

(assert (= (and b!1277184 c!123979) b!1277185))

(assert (= (and b!1277184 (not c!123979)) b!1277196))

(assert (= (and b!1277185 res!848696) b!1277190))

(assert (= (or b!1277185 b!1277196) bm!62662))

(declare-fun b_lambda!23087 () Bool)

(assert (=> (not b_lambda!23087) (not b!1277179)))

(declare-fun t!42231 () Bool)

(declare-fun tb!11341 () Bool)

(assert (=> (and start!108136 (= defaultEntry!1195 defaultEntry!1195) t!42231) tb!11341))

(declare-fun result!23663 () Bool)

(assert (=> tb!11341 (= result!23663 tp_is_empty!33399)))

(assert (=> b!1277179 t!42231))

(declare-fun b_and!45909 () Bool)

(assert (= b_and!45905 (and (=> t!42231 result!23663) b_and!45909)))

(assert (=> b!1277192 m!1172837))

(assert (=> b!1277192 m!1172837))

(declare-fun m!1172849 () Bool)

(assert (=> b!1277192 m!1172849))

(assert (=> d!140451 m!1172811))

(declare-fun m!1172851 () Bool)

(assert (=> bm!62667 m!1172851))

(declare-fun m!1172853 () Bool)

(assert (=> b!1277188 m!1172853))

(declare-fun m!1172855 () Bool)

(assert (=> bm!62665 m!1172855))

(declare-fun m!1172857 () Bool)

(assert (=> b!1277178 m!1172857))

(declare-fun m!1172859 () Bool)

(assert (=> b!1277190 m!1172859))

(declare-fun m!1172861 () Bool)

(assert (=> bm!62666 m!1172861))

(assert (=> b!1277187 m!1172837))

(assert (=> b!1277187 m!1172837))

(declare-fun m!1172863 () Bool)

(assert (=> b!1277187 m!1172863))

(declare-fun m!1172865 () Bool)

(assert (=> b!1277191 m!1172865))

(declare-fun m!1172867 () Bool)

(assert (=> b!1277191 m!1172867))

(declare-fun m!1172869 () Bool)

(assert (=> b!1277191 m!1172869))

(declare-fun m!1172871 () Bool)

(assert (=> b!1277191 m!1172871))

(assert (=> b!1277191 m!1172861))

(assert (=> b!1277191 m!1172837))

(declare-fun m!1172873 () Bool)

(assert (=> b!1277191 m!1172873))

(declare-fun m!1172875 () Bool)

(assert (=> b!1277191 m!1172875))

(declare-fun m!1172877 () Bool)

(assert (=> b!1277191 m!1172877))

(assert (=> b!1277191 m!1172869))

(declare-fun m!1172879 () Bool)

(assert (=> b!1277191 m!1172879))

(declare-fun m!1172881 () Bool)

(assert (=> b!1277191 m!1172881))

(assert (=> b!1277191 m!1172875))

(declare-fun m!1172883 () Bool)

(assert (=> b!1277191 m!1172883))

(declare-fun m!1172885 () Bool)

(assert (=> b!1277191 m!1172885))

(declare-fun m!1172887 () Bool)

(assert (=> b!1277191 m!1172887))

(assert (=> b!1277191 m!1172885))

(declare-fun m!1172889 () Bool)

(assert (=> b!1277191 m!1172889))

(declare-fun m!1172891 () Bool)

(assert (=> b!1277191 m!1172891))

(assert (=> b!1277191 m!1172867))

(declare-fun m!1172893 () Bool)

(assert (=> b!1277191 m!1172893))

(assert (=> b!1277179 m!1172837))

(declare-fun m!1172895 () Bool)

(assert (=> b!1277179 m!1172895))

(declare-fun m!1172897 () Bool)

(assert (=> b!1277179 m!1172897))

(declare-fun m!1172899 () Bool)

(assert (=> b!1277179 m!1172899))

(declare-fun m!1172901 () Bool)

(assert (=> b!1277179 m!1172901))

(assert (=> b!1277179 m!1172897))

(assert (=> b!1277179 m!1172899))

(assert (=> b!1277179 m!1172837))

(declare-fun m!1172903 () Bool)

(assert (=> bm!62662 m!1172903))

(assert (=> b!1277189 m!1172837))

(assert (=> b!1277189 m!1172837))

(assert (=> b!1277189 m!1172849))

(assert (=> b!1277079 d!140451))

(declare-fun bm!62671 () Bool)

(declare-fun call!62674 () Bool)

(assert (=> bm!62671 (= call!62674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1277209 () Bool)

(declare-fun e!729377 () Bool)

(declare-fun e!729378 () Bool)

(assert (=> b!1277209 (= e!729377 e!729378)))

(declare-fun lt!575665 () (_ BitVec 64))

(assert (=> b!1277209 (= lt!575665 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575663 () Unit!42369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83892 (_ BitVec 64) (_ BitVec 32)) Unit!42369)

(assert (=> b!1277209 (= lt!575663 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575665 #b00000000000000000000000000000000))))

(assert (=> b!1277209 (arrayContainsKey!0 _keys!1427 lt!575665 #b00000000000000000000000000000000)))

(declare-fun lt!575664 () Unit!42369)

(assert (=> b!1277209 (= lt!575664 lt!575663)))

(declare-fun res!848705 () Bool)

(declare-datatypes ((SeekEntryResult!10006 0))(
  ( (MissingZero!10006 (index!42395 (_ BitVec 32))) (Found!10006 (index!42396 (_ BitVec 32))) (Intermediate!10006 (undefined!10818 Bool) (index!42397 (_ BitVec 32)) (x!113169 (_ BitVec 32))) (Undefined!10006) (MissingVacant!10006 (index!42398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83892 (_ BitVec 32)) SeekEntryResult!10006)

(assert (=> b!1277209 (= res!848705 (= (seekEntryOrOpen!0 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10006 #b00000000000000000000000000000000)))))

(assert (=> b!1277209 (=> (not res!848705) (not e!729378))))

(declare-fun b!1277210 () Bool)

(assert (=> b!1277210 (= e!729377 call!62674)))

(declare-fun d!140453 () Bool)

(declare-fun res!848706 () Bool)

(declare-fun e!729376 () Bool)

(assert (=> d!140453 (=> res!848706 e!729376)))

(assert (=> d!140453 (= res!848706 (bvsge #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(assert (=> d!140453 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!729376)))

(declare-fun b!1277211 () Bool)

(assert (=> b!1277211 (= e!729378 call!62674)))

(declare-fun b!1277212 () Bool)

(assert (=> b!1277212 (= e!729376 e!729377)))

(declare-fun c!123984 () Bool)

(assert (=> b!1277212 (= c!123984 (validKeyInArray!0 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140453 (not res!848706)) b!1277212))

(assert (= (and b!1277212 c!123984) b!1277209))

(assert (= (and b!1277212 (not c!123984)) b!1277210))

(assert (= (and b!1277209 res!848705) b!1277211))

(assert (= (or b!1277211 b!1277210) bm!62671))

(declare-fun m!1172905 () Bool)

(assert (=> bm!62671 m!1172905))

(assert (=> b!1277209 m!1172837))

(declare-fun m!1172907 () Bool)

(assert (=> b!1277209 m!1172907))

(declare-fun m!1172909 () Bool)

(assert (=> b!1277209 m!1172909))

(assert (=> b!1277209 m!1172837))

(declare-fun m!1172911 () Bool)

(assert (=> b!1277209 m!1172911))

(assert (=> b!1277212 m!1172837))

(assert (=> b!1277212 m!1172837))

(assert (=> b!1277212 m!1172849))

(assert (=> b!1277078 d!140453))

(declare-fun bm!62674 () Bool)

(declare-fun call!62677 () Bool)

(declare-fun c!123987 () Bool)

(assert (=> bm!62674 (= call!62677 (arrayNoDuplicates!0 _keys!1427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123987 (Cons!28689 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000) Nil!28690) Nil!28690)))))

(declare-fun b!1277223 () Bool)

(declare-fun e!729387 () Bool)

(declare-fun contains!7712 (List!28693 (_ BitVec 64)) Bool)

(assert (=> b!1277223 (= e!729387 (contains!7712 Nil!28690 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277224 () Bool)

(declare-fun e!729389 () Bool)

(assert (=> b!1277224 (= e!729389 call!62677)))

(declare-fun b!1277226 () Bool)

(declare-fun e!729390 () Bool)

(declare-fun e!729388 () Bool)

(assert (=> b!1277226 (= e!729390 e!729388)))

(declare-fun res!848715 () Bool)

(assert (=> b!1277226 (=> (not res!848715) (not e!729388))))

(assert (=> b!1277226 (= res!848715 (not e!729387))))

(declare-fun res!848713 () Bool)

(assert (=> b!1277226 (=> (not res!848713) (not e!729387))))

(assert (=> b!1277226 (= res!848713 (validKeyInArray!0 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277227 () Bool)

(assert (=> b!1277227 (= e!729388 e!729389)))

(assert (=> b!1277227 (= c!123987 (validKeyInArray!0 (select (arr!40457 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140455 () Bool)

(declare-fun res!848714 () Bool)

(assert (=> d!140455 (=> res!848714 e!729390)))

(assert (=> d!140455 (= res!848714 (bvsge #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(assert (=> d!140455 (= (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28690) e!729390)))

(declare-fun b!1277225 () Bool)

(assert (=> b!1277225 (= e!729389 call!62677)))

(assert (= (and d!140455 (not res!848714)) b!1277226))

(assert (= (and b!1277226 res!848713) b!1277223))

(assert (= (and b!1277226 res!848715) b!1277227))

(assert (= (and b!1277227 c!123987) b!1277225))

(assert (= (and b!1277227 (not c!123987)) b!1277224))

(assert (= (or b!1277225 b!1277224) bm!62674))

(assert (=> bm!62674 m!1172837))

(declare-fun m!1172913 () Bool)

(assert (=> bm!62674 m!1172913))

(assert (=> b!1277223 m!1172837))

(assert (=> b!1277223 m!1172837))

(declare-fun m!1172915 () Bool)

(assert (=> b!1277223 m!1172915))

(assert (=> b!1277226 m!1172837))

(assert (=> b!1277226 m!1172837))

(assert (=> b!1277226 m!1172849))

(assert (=> b!1277227 m!1172837))

(assert (=> b!1277227 m!1172837))

(assert (=> b!1277227 m!1172849))

(assert (=> b!1277084 d!140455))

(declare-fun d!140457 () Bool)

(assert (=> d!140457 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108136 d!140457))

(declare-fun d!140459 () Bool)

(assert (=> d!140459 (= (array_inv!30739 _values!1187) (bvsge (size!41006 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108136 d!140459))

(declare-fun d!140461 () Bool)

(assert (=> d!140461 (= (array_inv!30740 _keys!1427) (bvsge (size!41007 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108136 d!140461))

(declare-fun d!140463 () Bool)

(declare-fun e!729393 () Bool)

(assert (=> d!140463 e!729393))

(declare-fun c!123990 () Bool)

(assert (=> d!140463 (= c!123990 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!575668 () Unit!42369)

(declare-fun choose!1896 (array!83892 array!83890 (_ BitVec 32) (_ BitVec 32) V!49635 V!49635 (_ BitVec 64) (_ BitVec 32) Int) Unit!42369)

(assert (=> d!140463 (= lt!575668 (choose!1896 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(assert (=> d!140463 (validMask!0 mask!1805)))

(assert (=> d!140463 (= (lemmaListMapContainsThenArrayContainsFrom!627 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195) lt!575668)))

(declare-fun b!1277232 () Bool)

(assert (=> b!1277232 (= e!729393 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun b!1277233 () Bool)

(assert (=> b!1277233 (= e!729393 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!140463 c!123990) b!1277232))

(assert (= (and d!140463 (not c!123990)) b!1277233))

(declare-fun m!1172917 () Bool)

(assert (=> d!140463 m!1172917))

(assert (=> d!140463 m!1172811))

(assert (=> b!1277232 m!1172805))

(assert (=> b!1277085 d!140463))

(declare-fun b!1277240 () Bool)

(declare-fun e!729399 () Bool)

(assert (=> b!1277240 (= e!729399 tp_is_empty!33399)))

(declare-fun mapIsEmpty!51635 () Bool)

(declare-fun mapRes!51635 () Bool)

(assert (=> mapIsEmpty!51635 mapRes!51635))

(declare-fun b!1277241 () Bool)

(declare-fun e!729398 () Bool)

(assert (=> b!1277241 (= e!729398 tp_is_empty!33399)))

(declare-fun mapNonEmpty!51635 () Bool)

(declare-fun tp!98510 () Bool)

(assert (=> mapNonEmpty!51635 (= mapRes!51635 (and tp!98510 e!729399))))

(declare-fun mapRest!51635 () (Array (_ BitVec 32) ValueCell!15801))

(declare-fun mapKey!51635 () (_ BitVec 32))

(declare-fun mapValue!51635 () ValueCell!15801)

(assert (=> mapNonEmpty!51635 (= mapRest!51629 (store mapRest!51635 mapKey!51635 mapValue!51635))))

(declare-fun condMapEmpty!51635 () Bool)

(declare-fun mapDefault!51635 () ValueCell!15801)

(assert (=> mapNonEmpty!51629 (= condMapEmpty!51635 (= mapRest!51629 ((as const (Array (_ BitVec 32) ValueCell!15801)) mapDefault!51635)))))

(assert (=> mapNonEmpty!51629 (= tp!98501 (and e!729398 mapRes!51635))))

(assert (= (and mapNonEmpty!51629 condMapEmpty!51635) mapIsEmpty!51635))

(assert (= (and mapNonEmpty!51629 (not condMapEmpty!51635)) mapNonEmpty!51635))

(assert (= (and mapNonEmpty!51635 ((_ is ValueCellFull!15801) mapValue!51635)) b!1277240))

(assert (= (and mapNonEmpty!51629 ((_ is ValueCellFull!15801) mapDefault!51635)) b!1277241))

(declare-fun m!1172919 () Bool)

(assert (=> mapNonEmpty!51635 m!1172919))

(declare-fun b_lambda!23089 () Bool)

(assert (= b_lambda!23087 (or (and start!108136 b_free!27849) b_lambda!23089)))

(check-sat (not bm!62671) (not b!1277192) (not b!1277178) (not b!1277232) (not b!1277189) (not bm!62662) (not bm!62667) (not b!1277226) (not b!1277190) (not bm!62666) (not mapNonEmpty!51635) (not b!1277126) (not b!1277133) (not b!1277227) (not b!1277223) (not b_lambda!23089) (not d!140451) (not b_next!27849) (not b!1277187) (not b!1277191) (not bm!62674) (not b!1277209) (not b!1277135) (not b!1277188) b_and!45909 tp_is_empty!33399 (not d!140463) (not b!1277179) (not bm!62665) (not b!1277212) (not d!140449))
(check-sat b_and!45909 (not b_next!27849))
