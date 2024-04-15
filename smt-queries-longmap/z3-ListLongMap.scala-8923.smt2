; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108206 () Bool)

(assert start!108206)

(declare-fun b_free!27901 () Bool)

(declare-fun b_next!27901 () Bool)

(assert (=> start!108206 (= b_free!27901 (not b_next!27901))))

(declare-fun tp!98660 () Bool)

(declare-fun b_and!45941 () Bool)

(assert (=> start!108206 (= tp!98660 b_and!45941)))

(declare-fun b!1277698 () Bool)

(declare-fun res!848990 () Bool)

(declare-fun e!729745 () Bool)

(assert (=> b!1277698 (=> (not res!848990) (not e!729745))))

(declare-datatypes ((array!83889 0))(
  ( (array!83890 (arr!40455 (Array (_ BitVec 32) (_ BitVec 64))) (size!41007 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83889)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83889 (_ BitVec 32)) Bool)

(assert (=> b!1277698 (= res!848990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun res!848989 () Bool)

(assert (=> start!108206 (=> (not res!848989) (not e!729745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108206 (= res!848989 (validMask!0 mask!1805))))

(assert (=> start!108206 e!729745))

(assert (=> start!108206 true))

(assert (=> start!108206 tp!98660))

(declare-fun tp_is_empty!33451 () Bool)

(assert (=> start!108206 tp_is_empty!33451))

(declare-datatypes ((V!49705 0))(
  ( (V!49706 (val!16800 Int)) )
))
(declare-datatypes ((ValueCell!15827 0))(
  ( (ValueCellFull!15827 (v!19397 V!49705)) (EmptyCell!15827) )
))
(declare-datatypes ((array!83891 0))(
  ( (array!83892 (arr!40456 (Array (_ BitVec 32) ValueCell!15827)) (size!41008 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83891)

(declare-fun e!729744 () Bool)

(declare-fun array_inv!30895 (array!83891) Bool)

(assert (=> start!108206 (and (array_inv!30895 _values!1187) e!729744)))

(declare-fun array_inv!30896 (array!83889) Bool)

(assert (=> start!108206 (array_inv!30896 _keys!1427)))

(declare-fun b!1277699 () Bool)

(declare-fun res!848991 () Bool)

(assert (=> b!1277699 (=> (not res!848991) (not e!729745))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277699 (= res!848991 (and (= (size!41008 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41007 _keys!1427) (size!41008 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51710 () Bool)

(declare-fun mapRes!51710 () Bool)

(assert (=> mapIsEmpty!51710 mapRes!51710))

(declare-fun b!1277700 () Bool)

(declare-fun res!848987 () Bool)

(assert (=> b!1277700 (=> (not res!848987) (not e!729745))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49705)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49705)

(declare-datatypes ((tuple2!21628 0))(
  ( (tuple2!21629 (_1!10825 (_ BitVec 64)) (_2!10825 V!49705)) )
))
(declare-datatypes ((List!28800 0))(
  ( (Nil!28797) (Cons!28796 (h!30005 tuple2!21628) (t!42330 List!28800)) )
))
(declare-datatypes ((ListLongMap!19285 0))(
  ( (ListLongMap!19286 (toList!9658 List!28800)) )
))
(declare-fun contains!7699 (ListLongMap!19285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4632 (array!83889 array!83891 (_ BitVec 32) (_ BitVec 32) V!49705 V!49705 (_ BitVec 32) Int) ListLongMap!19285)

(assert (=> b!1277700 (= res!848987 (contains!7699 (getCurrentListMap!4632 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapNonEmpty!51710 () Bool)

(declare-fun tp!98661 () Bool)

(declare-fun e!729741 () Bool)

(assert (=> mapNonEmpty!51710 (= mapRes!51710 (and tp!98661 e!729741))))

(declare-fun mapValue!51710 () ValueCell!15827)

(declare-fun mapRest!51710 () (Array (_ BitVec 32) ValueCell!15827))

(declare-fun mapKey!51710 () (_ BitVec 32))

(assert (=> mapNonEmpty!51710 (= (arr!40456 _values!1187) (store mapRest!51710 mapKey!51710 mapValue!51710))))

(declare-fun b!1277701 () Bool)

(declare-fun e!729743 () Bool)

(assert (=> b!1277701 (= e!729744 (and e!729743 mapRes!51710))))

(declare-fun condMapEmpty!51710 () Bool)

(declare-fun mapDefault!51710 () ValueCell!15827)

(assert (=> b!1277701 (= condMapEmpty!51710 (= (arr!40456 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15827)) mapDefault!51710)))))

(declare-fun b!1277702 () Bool)

(assert (=> b!1277702 (= e!729743 tp_is_empty!33451)))

(declare-fun b!1277703 () Bool)

(assert (=> b!1277703 (= e!729745 (bvsge #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(declare-fun b!1277704 () Bool)

(declare-fun res!848988 () Bool)

(assert (=> b!1277704 (=> (not res!848988) (not e!729745))))

(declare-datatypes ((List!28801 0))(
  ( (Nil!28798) (Cons!28797 (h!30006 (_ BitVec 64)) (t!42331 List!28801)) )
))
(declare-fun arrayNoDuplicates!0 (array!83889 (_ BitVec 32) List!28801) Bool)

(assert (=> b!1277704 (= res!848988 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28798))))

(declare-fun b!1277705 () Bool)

(assert (=> b!1277705 (= e!729741 tp_is_empty!33451)))

(assert (= (and start!108206 res!848989) b!1277699))

(assert (= (and b!1277699 res!848991) b!1277698))

(assert (= (and b!1277698 res!848990) b!1277704))

(assert (= (and b!1277704 res!848988) b!1277700))

(assert (= (and b!1277700 res!848987) b!1277703))

(assert (= (and b!1277701 condMapEmpty!51710) mapIsEmpty!51710))

(assert (= (and b!1277701 (not condMapEmpty!51710)) mapNonEmpty!51710))

(get-info :version)

(assert (= (and mapNonEmpty!51710 ((_ is ValueCellFull!15827) mapValue!51710)) b!1277705))

(assert (= (and b!1277701 ((_ is ValueCellFull!15827) mapDefault!51710)) b!1277702))

(assert (= start!108206 b!1277701))

(declare-fun m!1172805 () Bool)

(assert (=> b!1277704 m!1172805))

(declare-fun m!1172807 () Bool)

(assert (=> start!108206 m!1172807))

(declare-fun m!1172809 () Bool)

(assert (=> start!108206 m!1172809))

(declare-fun m!1172811 () Bool)

(assert (=> start!108206 m!1172811))

(declare-fun m!1172813 () Bool)

(assert (=> b!1277698 m!1172813))

(declare-fun m!1172815 () Bool)

(assert (=> mapNonEmpty!51710 m!1172815))

(declare-fun m!1172817 () Bool)

(assert (=> b!1277700 m!1172817))

(assert (=> b!1277700 m!1172817))

(declare-fun m!1172819 () Bool)

(assert (=> b!1277700 m!1172819))

(check-sat (not b_next!27901) tp_is_empty!33451 (not b!1277698) b_and!45941 (not b!1277704) (not start!108206) (not mapNonEmpty!51710) (not b!1277700))
(check-sat b_and!45941 (not b_next!27901))
(get-model)

(declare-fun d!140371 () Bool)

(assert (=> d!140371 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108206 d!140371))

(declare-fun d!140373 () Bool)

(assert (=> d!140373 (= (array_inv!30895 _values!1187) (bvsge (size!41008 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108206 d!140373))

(declare-fun d!140375 () Bool)

(assert (=> d!140375 (= (array_inv!30896 _keys!1427) (bvsge (size!41007 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108206 d!140375))

(declare-fun d!140377 () Bool)

(declare-fun e!729780 () Bool)

(assert (=> d!140377 e!729780))

(declare-fun res!849024 () Bool)

(assert (=> d!140377 (=> res!849024 e!729780)))

(declare-fun lt!575573 () Bool)

(assert (=> d!140377 (= res!849024 (not lt!575573))))

(declare-fun lt!575571 () Bool)

(assert (=> d!140377 (= lt!575573 lt!575571)))

(declare-datatypes ((Unit!42223 0))(
  ( (Unit!42224) )
))
(declare-fun lt!575574 () Unit!42223)

(declare-fun e!729781 () Unit!42223)

(assert (=> d!140377 (= lt!575574 e!729781)))

(declare-fun c!123977 () Bool)

(assert (=> d!140377 (= c!123977 lt!575571)))

(declare-fun containsKey!711 (List!28800 (_ BitVec 64)) Bool)

(assert (=> d!140377 (= lt!575571 (containsKey!711 (toList!9658 (getCurrentListMap!4632 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(assert (=> d!140377 (= (contains!7699 (getCurrentListMap!4632 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053) lt!575573)))

(declare-fun b!1277760 () Bool)

(declare-fun lt!575572 () Unit!42223)

(assert (=> b!1277760 (= e!729781 lt!575572)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!458 (List!28800 (_ BitVec 64)) Unit!42223)

(assert (=> b!1277760 (= lt!575572 (lemmaContainsKeyImpliesGetValueByKeyDefined!458 (toList!9658 (getCurrentListMap!4632 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-datatypes ((Option!745 0))(
  ( (Some!744 (v!19400 V!49705)) (None!743) )
))
(declare-fun isDefined!501 (Option!745) Bool)

(declare-fun getValueByKey!694 (List!28800 (_ BitVec 64)) Option!745)

(assert (=> b!1277760 (isDefined!501 (getValueByKey!694 (toList!9658 (getCurrentListMap!4632 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-fun b!1277761 () Bool)

(declare-fun Unit!42225 () Unit!42223)

(assert (=> b!1277761 (= e!729781 Unit!42225)))

(declare-fun b!1277762 () Bool)

(assert (=> b!1277762 (= e!729780 (isDefined!501 (getValueByKey!694 (toList!9658 (getCurrentListMap!4632 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053)))))

(assert (= (and d!140377 c!123977) b!1277760))

(assert (= (and d!140377 (not c!123977)) b!1277761))

(assert (= (and d!140377 (not res!849024)) b!1277762))

(declare-fun m!1172853 () Bool)

(assert (=> d!140377 m!1172853))

(declare-fun m!1172855 () Bool)

(assert (=> b!1277760 m!1172855))

(declare-fun m!1172857 () Bool)

(assert (=> b!1277760 m!1172857))

(assert (=> b!1277760 m!1172857))

(declare-fun m!1172859 () Bool)

(assert (=> b!1277760 m!1172859))

(assert (=> b!1277762 m!1172857))

(assert (=> b!1277762 m!1172857))

(assert (=> b!1277762 m!1172859))

(assert (=> b!1277700 d!140377))

(declare-fun b!1277805 () Bool)

(declare-fun e!729820 () ListLongMap!19285)

(declare-fun call!62674 () ListLongMap!19285)

(declare-fun +!4309 (ListLongMap!19285 tuple2!21628) ListLongMap!19285)

(assert (=> b!1277805 (= e!729820 (+!4309 call!62674 (tuple2!21629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129)))))

(declare-fun b!1277806 () Bool)

(declare-fun e!729819 () Bool)

(declare-fun call!62677 () Bool)

(assert (=> b!1277806 (= e!729819 (not call!62677))))

(declare-fun b!1277807 () Bool)

(declare-fun e!729813 () ListLongMap!19285)

(declare-fun call!62678 () ListLongMap!19285)

(assert (=> b!1277807 (= e!729813 call!62678)))

(declare-fun bm!62670 () Bool)

(assert (=> bm!62670 (= call!62678 call!62674)))

(declare-fun b!1277808 () Bool)

(declare-fun e!729818 () ListLongMap!19285)

(assert (=> b!1277808 (= e!729818 call!62678)))

(declare-fun b!1277809 () Bool)

(declare-fun e!729817 () Bool)

(declare-fun call!62675 () Bool)

(assert (=> b!1277809 (= e!729817 (not call!62675))))

(declare-fun bm!62671 () Bool)

(declare-fun lt!575636 () ListLongMap!19285)

(assert (=> bm!62671 (= call!62677 (contains!7699 lt!575636 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1277810 () Bool)

(assert (=> b!1277810 (= e!729820 e!729818)))

(declare-fun c!123990 () Bool)

(assert (=> b!1277810 (= c!123990 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!140379 () Bool)

(declare-fun e!729814 () Bool)

(assert (=> d!140379 e!729814))

(declare-fun res!849044 () Bool)

(assert (=> d!140379 (=> (not res!849044) (not e!729814))))

(assert (=> d!140379 (= res!849044 (or (bvsge #b00000000000000000000000000000000 (size!41007 _keys!1427)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))))

(declare-fun lt!575637 () ListLongMap!19285)

(assert (=> d!140379 (= lt!575636 lt!575637)))

(declare-fun lt!575629 () Unit!42223)

(declare-fun e!729816 () Unit!42223)

(assert (=> d!140379 (= lt!575629 e!729816)))

(declare-fun c!123992 () Bool)

(declare-fun e!729809 () Bool)

(assert (=> d!140379 (= c!123992 e!729809)))

(declare-fun res!849049 () Bool)

(assert (=> d!140379 (=> (not res!849049) (not e!729809))))

(assert (=> d!140379 (= res!849049 (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(assert (=> d!140379 (= lt!575637 e!729820)))

(declare-fun c!123993 () Bool)

(assert (=> d!140379 (= c!123993 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140379 (validMask!0 mask!1805)))

(assert (=> d!140379 (= (getCurrentListMap!4632 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) lt!575636)))

(declare-fun b!1277811 () Bool)

(declare-fun e!729808 () Bool)

(declare-fun apply!1001 (ListLongMap!19285 (_ BitVec 64)) V!49705)

(assert (=> b!1277811 (= e!729808 (= (apply!1001 lt!575636 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1129))))

(declare-fun b!1277812 () Bool)

(declare-fun c!123991 () Bool)

(assert (=> b!1277812 (= c!123991 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1277812 (= e!729818 e!729813)))

(declare-fun b!1277813 () Bool)

(declare-fun e!729811 () Bool)

(declare-fun get!20652 (ValueCell!15827 V!49705) V!49705)

(declare-fun dynLambda!3431 (Int (_ BitVec 64)) V!49705)

(assert (=> b!1277813 (= e!729811 (= (apply!1001 lt!575636 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000)) (get!20652 (select (arr!40456 _values!1187) #b00000000000000000000000000000000) (dynLambda!3431 defaultEntry!1195 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1277813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41008 _values!1187)))))

(assert (=> b!1277813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(declare-fun bm!62672 () Bool)

(declare-fun call!62673 () ListLongMap!19285)

(declare-fun call!62679 () ListLongMap!19285)

(assert (=> bm!62672 (= call!62673 call!62679)))

(declare-fun b!1277814 () Bool)

(declare-fun res!849051 () Bool)

(assert (=> b!1277814 (=> (not res!849051) (not e!729814))))

(assert (=> b!1277814 (= res!849051 e!729817)))

(declare-fun c!123994 () Bool)

(assert (=> b!1277814 (= c!123994 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1277815 () Bool)

(declare-fun e!729810 () Bool)

(assert (=> b!1277815 (= e!729817 e!729810)))

(declare-fun res!849048 () Bool)

(assert (=> b!1277815 (= res!849048 call!62675)))

(assert (=> b!1277815 (=> (not res!849048) (not e!729810))))

(declare-fun bm!62673 () Bool)

(declare-fun call!62676 () ListLongMap!19285)

(assert (=> bm!62673 (= call!62674 (+!4309 (ite c!123993 call!62679 (ite c!123990 call!62673 call!62676)) (ite (or c!123993 c!123990) (tuple2!21629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1129) (tuple2!21629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129))))))

(declare-fun b!1277816 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1277816 (= e!729809 (validKeyInArray!0 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277817 () Bool)

(assert (=> b!1277817 (= e!729819 e!729808)))

(declare-fun res!849045 () Bool)

(assert (=> b!1277817 (= res!849045 call!62677)))

(assert (=> b!1277817 (=> (not res!849045) (not e!729808))))

(declare-fun b!1277818 () Bool)

(declare-fun e!729815 () Bool)

(assert (=> b!1277818 (= e!729815 e!729811)))

(declare-fun res!849046 () Bool)

(assert (=> b!1277818 (=> (not res!849046) (not e!729811))))

(assert (=> b!1277818 (= res!849046 (contains!7699 lt!575636 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000)))))

(assert (=> b!1277818 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(declare-fun b!1277819 () Bool)

(declare-fun e!729812 () Bool)

(assert (=> b!1277819 (= e!729812 (validKeyInArray!0 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277820 () Bool)

(assert (=> b!1277820 (= e!729813 call!62676)))

(declare-fun b!1277821 () Bool)

(assert (=> b!1277821 (= e!729810 (= (apply!1001 lt!575636 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1129))))

(declare-fun bm!62674 () Bool)

(assert (=> bm!62674 (= call!62676 call!62673)))

(declare-fun b!1277822 () Bool)

(declare-fun lt!575628 () Unit!42223)

(assert (=> b!1277822 (= e!729816 lt!575628)))

(declare-fun lt!575633 () ListLongMap!19285)

(declare-fun getCurrentListMapNoExtraKeys!5940 (array!83889 array!83891 (_ BitVec 32) (_ BitVec 32) V!49705 V!49705 (_ BitVec 32) Int) ListLongMap!19285)

(assert (=> b!1277822 (= lt!575633 (getCurrentListMapNoExtraKeys!5940 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575627 () (_ BitVec 64))

(assert (=> b!1277822 (= lt!575627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575635 () (_ BitVec 64))

(assert (=> b!1277822 (= lt!575635 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575621 () Unit!42223)

(declare-fun addStillContains!1096 (ListLongMap!19285 (_ BitVec 64) V!49705 (_ BitVec 64)) Unit!42223)

(assert (=> b!1277822 (= lt!575621 (addStillContains!1096 lt!575633 lt!575627 zeroValue!1129 lt!575635))))

(assert (=> b!1277822 (contains!7699 (+!4309 lt!575633 (tuple2!21629 lt!575627 zeroValue!1129)) lt!575635)))

(declare-fun lt!575622 () Unit!42223)

(assert (=> b!1277822 (= lt!575622 lt!575621)))

(declare-fun lt!575631 () ListLongMap!19285)

(assert (=> b!1277822 (= lt!575631 (getCurrentListMapNoExtraKeys!5940 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575619 () (_ BitVec 64))

(assert (=> b!1277822 (= lt!575619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575626 () (_ BitVec 64))

(assert (=> b!1277822 (= lt!575626 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575640 () Unit!42223)

(declare-fun addApplyDifferent!539 (ListLongMap!19285 (_ BitVec 64) V!49705 (_ BitVec 64)) Unit!42223)

(assert (=> b!1277822 (= lt!575640 (addApplyDifferent!539 lt!575631 lt!575619 minValue!1129 lt!575626))))

(assert (=> b!1277822 (= (apply!1001 (+!4309 lt!575631 (tuple2!21629 lt!575619 minValue!1129)) lt!575626) (apply!1001 lt!575631 lt!575626))))

(declare-fun lt!575634 () Unit!42223)

(assert (=> b!1277822 (= lt!575634 lt!575640)))

(declare-fun lt!575620 () ListLongMap!19285)

(assert (=> b!1277822 (= lt!575620 (getCurrentListMapNoExtraKeys!5940 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575624 () (_ BitVec 64))

(assert (=> b!1277822 (= lt!575624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575638 () (_ BitVec 64))

(assert (=> b!1277822 (= lt!575638 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575625 () Unit!42223)

(assert (=> b!1277822 (= lt!575625 (addApplyDifferent!539 lt!575620 lt!575624 zeroValue!1129 lt!575638))))

(assert (=> b!1277822 (= (apply!1001 (+!4309 lt!575620 (tuple2!21629 lt!575624 zeroValue!1129)) lt!575638) (apply!1001 lt!575620 lt!575638))))

(declare-fun lt!575623 () Unit!42223)

(assert (=> b!1277822 (= lt!575623 lt!575625)))

(declare-fun lt!575639 () ListLongMap!19285)

(assert (=> b!1277822 (= lt!575639 (getCurrentListMapNoExtraKeys!5940 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575630 () (_ BitVec 64))

(assert (=> b!1277822 (= lt!575630 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575632 () (_ BitVec 64))

(assert (=> b!1277822 (= lt!575632 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> b!1277822 (= lt!575628 (addApplyDifferent!539 lt!575639 lt!575630 minValue!1129 lt!575632))))

(assert (=> b!1277822 (= (apply!1001 (+!4309 lt!575639 (tuple2!21629 lt!575630 minValue!1129)) lt!575632) (apply!1001 lt!575639 lt!575632))))

(declare-fun bm!62675 () Bool)

(assert (=> bm!62675 (= call!62675 (contains!7699 lt!575636 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1277823 () Bool)

(declare-fun res!849050 () Bool)

(assert (=> b!1277823 (=> (not res!849050) (not e!729814))))

(assert (=> b!1277823 (= res!849050 e!729815)))

(declare-fun res!849047 () Bool)

(assert (=> b!1277823 (=> res!849047 e!729815)))

(assert (=> b!1277823 (= res!849047 (not e!729812))))

(declare-fun res!849043 () Bool)

(assert (=> b!1277823 (=> (not res!849043) (not e!729812))))

(assert (=> b!1277823 (= res!849043 (bvslt #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(declare-fun b!1277824 () Bool)

(declare-fun Unit!42226 () Unit!42223)

(assert (=> b!1277824 (= e!729816 Unit!42226)))

(declare-fun bm!62676 () Bool)

(assert (=> bm!62676 (= call!62679 (getCurrentListMapNoExtraKeys!5940 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1277825 () Bool)

(assert (=> b!1277825 (= e!729814 e!729819)))

(declare-fun c!123995 () Bool)

(assert (=> b!1277825 (= c!123995 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!140379 c!123993) b!1277805))

(assert (= (and d!140379 (not c!123993)) b!1277810))

(assert (= (and b!1277810 c!123990) b!1277808))

(assert (= (and b!1277810 (not c!123990)) b!1277812))

(assert (= (and b!1277812 c!123991) b!1277807))

(assert (= (and b!1277812 (not c!123991)) b!1277820))

(assert (= (or b!1277807 b!1277820) bm!62674))

(assert (= (or b!1277808 bm!62674) bm!62672))

(assert (= (or b!1277808 b!1277807) bm!62670))

(assert (= (or b!1277805 bm!62672) bm!62676))

(assert (= (or b!1277805 bm!62670) bm!62673))

(assert (= (and d!140379 res!849049) b!1277816))

(assert (= (and d!140379 c!123992) b!1277822))

(assert (= (and d!140379 (not c!123992)) b!1277824))

(assert (= (and d!140379 res!849044) b!1277823))

(assert (= (and b!1277823 res!849043) b!1277819))

(assert (= (and b!1277823 (not res!849047)) b!1277818))

(assert (= (and b!1277818 res!849046) b!1277813))

(assert (= (and b!1277823 res!849050) b!1277814))

(assert (= (and b!1277814 c!123994) b!1277815))

(assert (= (and b!1277814 (not c!123994)) b!1277809))

(assert (= (and b!1277815 res!849048) b!1277821))

(assert (= (or b!1277815 b!1277809) bm!62675))

(assert (= (and b!1277814 res!849051) b!1277825))

(assert (= (and b!1277825 c!123995) b!1277817))

(assert (= (and b!1277825 (not c!123995)) b!1277806))

(assert (= (and b!1277817 res!849045) b!1277811))

(assert (= (or b!1277817 b!1277806) bm!62671))

(declare-fun b_lambda!23081 () Bool)

(assert (=> (not b_lambda!23081) (not b!1277813)))

(declare-fun t!42334 () Bool)

(declare-fun tb!11335 () Bool)

(assert (=> (and start!108206 (= defaultEntry!1195 defaultEntry!1195) t!42334) tb!11335))

(declare-fun result!23661 () Bool)

(assert (=> tb!11335 (= result!23661 tp_is_empty!33451)))

(assert (=> b!1277813 t!42334))

(declare-fun b_and!45947 () Bool)

(assert (= b_and!45941 (and (=> t!42334 result!23661) b_and!45947)))

(declare-fun m!1172861 () Bool)

(assert (=> b!1277813 m!1172861))

(declare-fun m!1172863 () Bool)

(assert (=> b!1277813 m!1172863))

(assert (=> b!1277813 m!1172863))

(declare-fun m!1172865 () Bool)

(assert (=> b!1277813 m!1172865))

(declare-fun m!1172867 () Bool)

(assert (=> b!1277813 m!1172867))

(assert (=> b!1277813 m!1172861))

(declare-fun m!1172869 () Bool)

(assert (=> b!1277813 m!1172869))

(assert (=> b!1277813 m!1172867))

(declare-fun m!1172871 () Bool)

(assert (=> bm!62675 m!1172871))

(declare-fun m!1172873 () Bool)

(assert (=> bm!62676 m!1172873))

(declare-fun m!1172875 () Bool)

(assert (=> b!1277811 m!1172875))

(assert (=> d!140379 m!1172807))

(assert (=> b!1277819 m!1172863))

(assert (=> b!1277819 m!1172863))

(declare-fun m!1172877 () Bool)

(assert (=> b!1277819 m!1172877))

(declare-fun m!1172879 () Bool)

(assert (=> bm!62671 m!1172879))

(declare-fun m!1172881 () Bool)

(assert (=> b!1277821 m!1172881))

(declare-fun m!1172883 () Bool)

(assert (=> b!1277805 m!1172883))

(assert (=> b!1277822 m!1172863))

(assert (=> b!1277822 m!1172873))

(declare-fun m!1172885 () Bool)

(assert (=> b!1277822 m!1172885))

(declare-fun m!1172887 () Bool)

(assert (=> b!1277822 m!1172887))

(declare-fun m!1172889 () Bool)

(assert (=> b!1277822 m!1172889))

(declare-fun m!1172891 () Bool)

(assert (=> b!1277822 m!1172891))

(declare-fun m!1172893 () Bool)

(assert (=> b!1277822 m!1172893))

(declare-fun m!1172895 () Bool)

(assert (=> b!1277822 m!1172895))

(declare-fun m!1172897 () Bool)

(assert (=> b!1277822 m!1172897))

(declare-fun m!1172899 () Bool)

(assert (=> b!1277822 m!1172899))

(assert (=> b!1277822 m!1172885))

(declare-fun m!1172901 () Bool)

(assert (=> b!1277822 m!1172901))

(declare-fun m!1172903 () Bool)

(assert (=> b!1277822 m!1172903))

(assert (=> b!1277822 m!1172887))

(declare-fun m!1172905 () Bool)

(assert (=> b!1277822 m!1172905))

(declare-fun m!1172907 () Bool)

(assert (=> b!1277822 m!1172907))

(assert (=> b!1277822 m!1172905))

(declare-fun m!1172909 () Bool)

(assert (=> b!1277822 m!1172909))

(assert (=> b!1277822 m!1172897))

(declare-fun m!1172911 () Bool)

(assert (=> b!1277822 m!1172911))

(declare-fun m!1172913 () Bool)

(assert (=> b!1277822 m!1172913))

(assert (=> b!1277818 m!1172863))

(assert (=> b!1277818 m!1172863))

(declare-fun m!1172915 () Bool)

(assert (=> b!1277818 m!1172915))

(assert (=> b!1277816 m!1172863))

(assert (=> b!1277816 m!1172863))

(assert (=> b!1277816 m!1172877))

(declare-fun m!1172917 () Bool)

(assert (=> bm!62673 m!1172917))

(assert (=> b!1277700 d!140379))

(declare-fun b!1277838 () Bool)

(declare-fun e!729830 () Bool)

(declare-fun call!62682 () Bool)

(assert (=> b!1277838 (= e!729830 call!62682)))

(declare-fun bm!62679 () Bool)

(declare-fun c!123998 () Bool)

(assert (=> bm!62679 (= call!62682 (arrayNoDuplicates!0 _keys!1427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123998 (Cons!28797 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000) Nil!28798) Nil!28798)))))

(declare-fun d!140381 () Bool)

(declare-fun res!849060 () Bool)

(declare-fun e!729831 () Bool)

(assert (=> d!140381 (=> res!849060 e!729831)))

(assert (=> d!140381 (= res!849060 (bvsge #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(assert (=> d!140381 (= (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28798) e!729831)))

(declare-fun b!1277839 () Bool)

(declare-fun e!729832 () Bool)

(assert (=> b!1277839 (= e!729831 e!729832)))

(declare-fun res!849058 () Bool)

(assert (=> b!1277839 (=> (not res!849058) (not e!729832))))

(declare-fun e!729829 () Bool)

(assert (=> b!1277839 (= res!849058 (not e!729829))))

(declare-fun res!849059 () Bool)

(assert (=> b!1277839 (=> (not res!849059) (not e!729829))))

(assert (=> b!1277839 (= res!849059 (validKeyInArray!0 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277840 () Bool)

(declare-fun contains!7701 (List!28801 (_ BitVec 64)) Bool)

(assert (=> b!1277840 (= e!729829 (contains!7701 Nil!28798 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277841 () Bool)

(assert (=> b!1277841 (= e!729832 e!729830)))

(assert (=> b!1277841 (= c!123998 (validKeyInArray!0 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277842 () Bool)

(assert (=> b!1277842 (= e!729830 call!62682)))

(assert (= (and d!140381 (not res!849060)) b!1277839))

(assert (= (and b!1277839 res!849059) b!1277840))

(assert (= (and b!1277839 res!849058) b!1277841))

(assert (= (and b!1277841 c!123998) b!1277838))

(assert (= (and b!1277841 (not c!123998)) b!1277842))

(assert (= (or b!1277838 b!1277842) bm!62679))

(assert (=> bm!62679 m!1172863))

(declare-fun m!1172919 () Bool)

(assert (=> bm!62679 m!1172919))

(assert (=> b!1277839 m!1172863))

(assert (=> b!1277839 m!1172863))

(assert (=> b!1277839 m!1172877))

(assert (=> b!1277840 m!1172863))

(assert (=> b!1277840 m!1172863))

(declare-fun m!1172921 () Bool)

(assert (=> b!1277840 m!1172921))

(assert (=> b!1277841 m!1172863))

(assert (=> b!1277841 m!1172863))

(assert (=> b!1277841 m!1172877))

(assert (=> b!1277704 d!140381))

(declare-fun b!1277851 () Bool)

(declare-fun e!729841 () Bool)

(declare-fun e!729840 () Bool)

(assert (=> b!1277851 (= e!729841 e!729840)))

(declare-fun c!124001 () Bool)

(assert (=> b!1277851 (= c!124001 (validKeyInArray!0 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140383 () Bool)

(declare-fun res!849066 () Bool)

(assert (=> d!140383 (=> res!849066 e!729841)))

(assert (=> d!140383 (= res!849066 (bvsge #b00000000000000000000000000000000 (size!41007 _keys!1427)))))

(assert (=> d!140383 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!729841)))

(declare-fun bm!62682 () Bool)

(declare-fun call!62685 () Bool)

(assert (=> bm!62682 (= call!62685 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1277852 () Bool)

(declare-fun e!729839 () Bool)

(assert (=> b!1277852 (= e!729839 call!62685)))

(declare-fun b!1277853 () Bool)

(assert (=> b!1277853 (= e!729840 e!729839)))

(declare-fun lt!575647 () (_ BitVec 64))

(assert (=> b!1277853 (= lt!575647 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575649 () Unit!42223)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83889 (_ BitVec 64) (_ BitVec 32)) Unit!42223)

(assert (=> b!1277853 (= lt!575649 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575647 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1277853 (arrayContainsKey!0 _keys!1427 lt!575647 #b00000000000000000000000000000000)))

(declare-fun lt!575648 () Unit!42223)

(assert (=> b!1277853 (= lt!575648 lt!575649)))

(declare-fun res!849065 () Bool)

(declare-datatypes ((SeekEntryResult!10006 0))(
  ( (MissingZero!10006 (index!42395 (_ BitVec 32))) (Found!10006 (index!42396 (_ BitVec 32))) (Intermediate!10006 (undefined!10818 Bool) (index!42397 (_ BitVec 32)) (x!113248 (_ BitVec 32))) (Undefined!10006) (MissingVacant!10006 (index!42398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83889 (_ BitVec 32)) SeekEntryResult!10006)

(assert (=> b!1277853 (= res!849065 (= (seekEntryOrOpen!0 (select (arr!40455 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10006 #b00000000000000000000000000000000)))))

(assert (=> b!1277853 (=> (not res!849065) (not e!729839))))

(declare-fun b!1277854 () Bool)

(assert (=> b!1277854 (= e!729840 call!62685)))

(assert (= (and d!140383 (not res!849066)) b!1277851))

(assert (= (and b!1277851 c!124001) b!1277853))

(assert (= (and b!1277851 (not c!124001)) b!1277854))

(assert (= (and b!1277853 res!849065) b!1277852))

(assert (= (or b!1277852 b!1277854) bm!62682))

(assert (=> b!1277851 m!1172863))

(assert (=> b!1277851 m!1172863))

(assert (=> b!1277851 m!1172877))

(declare-fun m!1172923 () Bool)

(assert (=> bm!62682 m!1172923))

(assert (=> b!1277853 m!1172863))

(declare-fun m!1172925 () Bool)

(assert (=> b!1277853 m!1172925))

(declare-fun m!1172927 () Bool)

(assert (=> b!1277853 m!1172927))

(assert (=> b!1277853 m!1172863))

(declare-fun m!1172929 () Bool)

(assert (=> b!1277853 m!1172929))

(assert (=> b!1277698 d!140383))

(declare-fun b!1277862 () Bool)

(declare-fun e!729846 () Bool)

(assert (=> b!1277862 (= e!729846 tp_is_empty!33451)))

(declare-fun mapNonEmpty!51719 () Bool)

(declare-fun mapRes!51719 () Bool)

(declare-fun tp!98676 () Bool)

(declare-fun e!729847 () Bool)

(assert (=> mapNonEmpty!51719 (= mapRes!51719 (and tp!98676 e!729847))))

(declare-fun mapRest!51719 () (Array (_ BitVec 32) ValueCell!15827))

(declare-fun mapValue!51719 () ValueCell!15827)

(declare-fun mapKey!51719 () (_ BitVec 32))

(assert (=> mapNonEmpty!51719 (= mapRest!51710 (store mapRest!51719 mapKey!51719 mapValue!51719))))

(declare-fun b!1277861 () Bool)

(assert (=> b!1277861 (= e!729847 tp_is_empty!33451)))

(declare-fun condMapEmpty!51719 () Bool)

(declare-fun mapDefault!51719 () ValueCell!15827)

(assert (=> mapNonEmpty!51710 (= condMapEmpty!51719 (= mapRest!51710 ((as const (Array (_ BitVec 32) ValueCell!15827)) mapDefault!51719)))))

(assert (=> mapNonEmpty!51710 (= tp!98661 (and e!729846 mapRes!51719))))

(declare-fun mapIsEmpty!51719 () Bool)

(assert (=> mapIsEmpty!51719 mapRes!51719))

(assert (= (and mapNonEmpty!51710 condMapEmpty!51719) mapIsEmpty!51719))

(assert (= (and mapNonEmpty!51710 (not condMapEmpty!51719)) mapNonEmpty!51719))

(assert (= (and mapNonEmpty!51719 ((_ is ValueCellFull!15827) mapValue!51719)) b!1277861))

(assert (= (and mapNonEmpty!51710 ((_ is ValueCellFull!15827) mapDefault!51719)) b!1277862))

(declare-fun m!1172931 () Bool)

(assert (=> mapNonEmpty!51719 m!1172931))

(declare-fun b_lambda!23083 () Bool)

(assert (= b_lambda!23081 (or (and start!108206 b_free!27901) b_lambda!23083)))

(check-sat (not b_next!27901) tp_is_empty!33451 (not b!1277762) (not b!1277851) (not b!1277819) (not b!1277821) (not b!1277822) (not d!140379) (not mapNonEmpty!51719) (not bm!62675) (not bm!62676) (not b!1277816) (not b!1277805) b_and!45947 (not bm!62673) (not b!1277760) (not b!1277811) (not d!140377) (not b_lambda!23083) (not bm!62679) (not bm!62671) (not bm!62682) (not b!1277853) (not b!1277813) (not b!1277839) (not b!1277818) (not b!1277840) (not b!1277841))
(check-sat b_and!45947 (not b_next!27901))
