; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4576 () Bool)

(assert start!4576)

(declare-fun b_free!1279 () Bool)

(declare-fun b_next!1279 () Bool)

(assert (=> start!4576 (= b_free!1279 (not b_next!1279))))

(declare-fun tp!5283 () Bool)

(declare-fun b_and!2097 () Bool)

(assert (=> start!4576 (= tp!5283 b_and!2097)))

(declare-fun mapIsEmpty!2005 () Bool)

(declare-fun mapRes!2005 () Bool)

(assert (=> mapIsEmpty!2005 mapRes!2005))

(declare-fun b!35761 () Bool)

(declare-fun res!21711 () Bool)

(declare-fun e!22586 () Bool)

(assert (=> b!35761 (=> (not res!21711) (not e!22586))))

(declare-datatypes ((array!2467 0))(
  ( (array!2468 (arr!1178 (Array (_ BitVec 32) (_ BitVec 64))) (size!1279 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2467)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35761 (= res!21711 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!35762 () Bool)

(declare-fun res!21705 () Bool)

(assert (=> b!35762 (=> (not res!21705) (not e!22586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35762 (= res!21705 (validKeyInArray!0 k0!1304))))

(declare-fun b!35763 () Bool)

(declare-fun res!21708 () Bool)

(assert (=> b!35763 (=> (not res!21708) (not e!22586))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2467 (_ BitVec 32)) Bool)

(assert (=> b!35763 (= res!21708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!21706 () Bool)

(assert (=> start!4576 (=> (not res!21706) (not e!22586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4576 (= res!21706 (validMask!0 mask!2294))))

(assert (=> start!4576 e!22586))

(assert (=> start!4576 true))

(assert (=> start!4576 tp!5283))

(declare-datatypes ((V!2003 0))(
  ( (V!2004 (val!843 Int)) )
))
(declare-datatypes ((ValueCell!617 0))(
  ( (ValueCellFull!617 (v!1941 V!2003)) (EmptyCell!617) )
))
(declare-datatypes ((array!2469 0))(
  ( (array!2470 (arr!1179 (Array (_ BitVec 32) ValueCell!617)) (size!1280 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2469)

(declare-fun e!22589 () Bool)

(declare-fun array_inv!809 (array!2469) Bool)

(assert (=> start!4576 (and (array_inv!809 _values!1501) e!22589)))

(declare-fun array_inv!810 (array!2467) Bool)

(assert (=> start!4576 (array_inv!810 _keys!1833)))

(declare-fun tp_is_empty!1633 () Bool)

(assert (=> start!4576 tp_is_empty!1633))

(declare-fun b!35764 () Bool)

(declare-datatypes ((SeekEntryResult!157 0))(
  ( (MissingZero!157 (index!2750 (_ BitVec 32))) (Found!157 (index!2751 (_ BitVec 32))) (Intermediate!157 (undefined!969 Bool) (index!2752 (_ BitVec 32)) (x!7045 (_ BitVec 32))) (Undefined!157) (MissingVacant!157 (index!2753 (_ BitVec 32))) )
))
(declare-fun lt!13172 () SeekEntryResult!157)

(get-info :version)

(assert (=> b!35764 (= e!22586 (and (not ((_ is Found!157) lt!13172)) (not ((_ is MissingZero!157) lt!13172)) (not ((_ is Undefined!157) lt!13172))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2467 (_ BitVec 32)) SeekEntryResult!157)

(assert (=> b!35764 (= lt!13172 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35765 () Bool)

(declare-fun res!21709 () Bool)

(assert (=> b!35765 (=> (not res!21709) (not e!22586))))

(declare-datatypes ((List!932 0))(
  ( (Nil!929) (Cons!928 (h!1495 (_ BitVec 64)) (t!3637 List!932)) )
))
(declare-fun arrayNoDuplicates!0 (array!2467 (_ BitVec 32) List!932) Bool)

(assert (=> b!35765 (= res!21709 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!929))))

(declare-fun b!35766 () Bool)

(declare-fun e!22587 () Bool)

(assert (=> b!35766 (= e!22587 tp_is_empty!1633)))

(declare-fun mapNonEmpty!2005 () Bool)

(declare-fun tp!5284 () Bool)

(declare-fun e!22585 () Bool)

(assert (=> mapNonEmpty!2005 (= mapRes!2005 (and tp!5284 e!22585))))

(declare-fun mapKey!2005 () (_ BitVec 32))

(declare-fun mapValue!2005 () ValueCell!617)

(declare-fun mapRest!2005 () (Array (_ BitVec 32) ValueCell!617))

(assert (=> mapNonEmpty!2005 (= (arr!1179 _values!1501) (store mapRest!2005 mapKey!2005 mapValue!2005))))

(declare-fun b!35767 () Bool)

(declare-fun res!21707 () Bool)

(assert (=> b!35767 (=> (not res!21707) (not e!22586))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!2003)

(declare-fun minValue!1443 () V!2003)

(declare-datatypes ((tuple2!1336 0))(
  ( (tuple2!1337 (_1!679 (_ BitVec 64)) (_2!679 V!2003)) )
))
(declare-datatypes ((List!933 0))(
  ( (Nil!930) (Cons!929 (h!1496 tuple2!1336) (t!3638 List!933)) )
))
(declare-datatypes ((ListLongMap!907 0))(
  ( (ListLongMap!908 (toList!469 List!933)) )
))
(declare-fun contains!420 (ListLongMap!907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!289 (array!2467 array!2469 (_ BitVec 32) (_ BitVec 32) V!2003 V!2003 (_ BitVec 32) Int) ListLongMap!907)

(assert (=> b!35767 (= res!21707 (not (contains!420 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!35768 () Bool)

(assert (=> b!35768 (= e!22589 (and e!22587 mapRes!2005))))

(declare-fun condMapEmpty!2005 () Bool)

(declare-fun mapDefault!2005 () ValueCell!617)

(assert (=> b!35768 (= condMapEmpty!2005 (= (arr!1179 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!617)) mapDefault!2005)))))

(declare-fun b!35769 () Bool)

(declare-fun res!21710 () Bool)

(assert (=> b!35769 (=> (not res!21710) (not e!22586))))

(assert (=> b!35769 (= res!21710 (and (= (size!1280 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1279 _keys!1833) (size!1280 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!35770 () Bool)

(assert (=> b!35770 (= e!22585 tp_is_empty!1633)))

(assert (= (and start!4576 res!21706) b!35769))

(assert (= (and b!35769 res!21710) b!35763))

(assert (= (and b!35763 res!21708) b!35765))

(assert (= (and b!35765 res!21709) b!35762))

(assert (= (and b!35762 res!21705) b!35767))

(assert (= (and b!35767 res!21707) b!35761))

(assert (= (and b!35761 res!21711) b!35764))

(assert (= (and b!35768 condMapEmpty!2005) mapIsEmpty!2005))

(assert (= (and b!35768 (not condMapEmpty!2005)) mapNonEmpty!2005))

(assert (= (and mapNonEmpty!2005 ((_ is ValueCellFull!617) mapValue!2005)) b!35770))

(assert (= (and b!35768 ((_ is ValueCellFull!617) mapDefault!2005)) b!35766))

(assert (= start!4576 b!35768))

(declare-fun m!28657 () Bool)

(assert (=> b!35762 m!28657))

(declare-fun m!28659 () Bool)

(assert (=> b!35764 m!28659))

(declare-fun m!28661 () Bool)

(assert (=> b!35765 m!28661))

(declare-fun m!28663 () Bool)

(assert (=> b!35761 m!28663))

(declare-fun m!28665 () Bool)

(assert (=> mapNonEmpty!2005 m!28665))

(declare-fun m!28667 () Bool)

(assert (=> b!35763 m!28667))

(declare-fun m!28669 () Bool)

(assert (=> start!4576 m!28669))

(declare-fun m!28671 () Bool)

(assert (=> start!4576 m!28671))

(declare-fun m!28673 () Bool)

(assert (=> start!4576 m!28673))

(declare-fun m!28675 () Bool)

(assert (=> b!35767 m!28675))

(assert (=> b!35767 m!28675))

(declare-fun m!28677 () Bool)

(assert (=> b!35767 m!28677))

(check-sat (not b!35764) (not b_next!1279) tp_is_empty!1633 (not b!35761) (not b!35763) (not mapNonEmpty!2005) b_and!2097 (not b!35762) (not b!35765) (not b!35767) (not start!4576))
(check-sat b_and!2097 (not b_next!1279))
(get-model)

(declare-fun d!5313 () Bool)

(assert (=> d!5313 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35762 d!5313))

(declare-fun d!5315 () Bool)

(declare-fun e!22625 () Bool)

(assert (=> d!5315 e!22625))

(declare-fun res!21756 () Bool)

(assert (=> d!5315 (=> res!21756 e!22625)))

(declare-fun lt!13189 () Bool)

(assert (=> d!5315 (= res!21756 (not lt!13189))))

(declare-fun lt!13187 () Bool)

(assert (=> d!5315 (= lt!13189 lt!13187)))

(declare-datatypes ((Unit!798 0))(
  ( (Unit!799) )
))
(declare-fun lt!13188 () Unit!798)

(declare-fun e!22624 () Unit!798)

(assert (=> d!5315 (= lt!13188 e!22624)))

(declare-fun c!4054 () Bool)

(assert (=> d!5315 (= c!4054 lt!13187)))

(declare-fun containsKey!38 (List!933 (_ BitVec 64)) Bool)

(assert (=> d!5315 (= lt!13187 (containsKey!38 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5315 (= (contains!420 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!13189)))

(declare-fun b!35837 () Bool)

(declare-fun lt!13190 () Unit!798)

(assert (=> b!35837 (= e!22624 lt!13190)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!35 (List!933 (_ BitVec 64)) Unit!798)

(assert (=> b!35837 (= lt!13190 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!80 0))(
  ( (Some!79 (v!1944 V!2003)) (None!78) )
))
(declare-fun isDefined!36 (Option!80) Bool)

(declare-fun getValueByKey!74 (List!933 (_ BitVec 64)) Option!80)

(assert (=> b!35837 (isDefined!36 (getValueByKey!74 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!35838 () Bool)

(declare-fun Unit!800 () Unit!798)

(assert (=> b!35838 (= e!22624 Unit!800)))

(declare-fun b!35839 () Bool)

(assert (=> b!35839 (= e!22625 (isDefined!36 (getValueByKey!74 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5315 c!4054) b!35837))

(assert (= (and d!5315 (not c!4054)) b!35838))

(assert (= (and d!5315 (not res!21756)) b!35839))

(declare-fun m!28723 () Bool)

(assert (=> d!5315 m!28723))

(declare-fun m!28725 () Bool)

(assert (=> b!35837 m!28725))

(declare-fun m!28727 () Bool)

(assert (=> b!35837 m!28727))

(assert (=> b!35837 m!28727))

(declare-fun m!28729 () Bool)

(assert (=> b!35837 m!28729))

(assert (=> b!35839 m!28727))

(assert (=> b!35839 m!28727))

(assert (=> b!35839 m!28729))

(assert (=> b!35767 d!5315))

(declare-fun bm!2830 () Bool)

(declare-fun call!2834 () ListLongMap!907)

(declare-fun call!2839 () ListLongMap!907)

(assert (=> bm!2830 (= call!2834 call!2839)))

(declare-fun b!35882 () Bool)

(declare-fun e!22658 () Bool)

(declare-fun lt!13236 () ListLongMap!907)

(declare-fun apply!42 (ListLongMap!907 (_ BitVec 64)) V!2003)

(assert (=> b!35882 (= e!22658 (= (apply!42 lt!13236 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!35883 () Bool)

(declare-fun res!21783 () Bool)

(declare-fun e!22654 () Bool)

(assert (=> b!35883 (=> (not res!21783) (not e!22654))))

(declare-fun e!22653 () Bool)

(assert (=> b!35883 (= res!21783 e!22653)))

(declare-fun c!4071 () Bool)

(assert (=> b!35883 (= c!4071 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!2836 () ListLongMap!907)

(declare-fun c!4072 () Bool)

(declare-fun bm!2831 () Bool)

(declare-fun call!2837 () ListLongMap!907)

(declare-fun call!2833 () ListLongMap!907)

(declare-fun c!4069 () Bool)

(declare-fun +!59 (ListLongMap!907 tuple2!1336) ListLongMap!907)

(assert (=> bm!2831 (= call!2839 (+!59 (ite c!4072 call!2837 (ite c!4069 call!2833 call!2836)) (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun bm!2832 () Bool)

(assert (=> bm!2832 (= call!2833 call!2837)))

(declare-fun bm!2833 () Bool)

(declare-fun call!2835 () Bool)

(assert (=> bm!2833 (= call!2835 (contains!420 lt!13236 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2834 () Bool)

(declare-fun call!2838 () Bool)

(assert (=> bm!2834 (= call!2838 (contains!420 lt!13236 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!5317 () Bool)

(assert (=> d!5317 e!22654))

(declare-fun res!21781 () Bool)

(assert (=> d!5317 (=> (not res!21781) (not e!22654))))

(assert (=> d!5317 (= res!21781 (or (bvsge #b00000000000000000000000000000000 (size!1279 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))))

(declare-fun lt!13235 () ListLongMap!907)

(assert (=> d!5317 (= lt!13236 lt!13235)))

(declare-fun lt!13255 () Unit!798)

(declare-fun e!22663 () Unit!798)

(assert (=> d!5317 (= lt!13255 e!22663)))

(declare-fun c!4068 () Bool)

(declare-fun e!22660 () Bool)

(assert (=> d!5317 (= c!4068 e!22660)))

(declare-fun res!21775 () Bool)

(assert (=> d!5317 (=> (not res!21775) (not e!22660))))

(assert (=> d!5317 (= res!21775 (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun e!22664 () ListLongMap!907)

(assert (=> d!5317 (= lt!13235 e!22664)))

(assert (=> d!5317 (= c!4072 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5317 (validMask!0 mask!2294)))

(assert (=> d!5317 (= (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13236)))

(declare-fun b!35884 () Bool)

(declare-fun e!22662 () Bool)

(declare-fun e!22655 () Bool)

(assert (=> b!35884 (= e!22662 e!22655)))

(declare-fun res!21782 () Bool)

(assert (=> b!35884 (= res!21782 call!2838)))

(assert (=> b!35884 (=> (not res!21782) (not e!22655))))

(declare-fun b!35885 () Bool)

(declare-fun e!22659 () Bool)

(declare-fun e!22661 () Bool)

(assert (=> b!35885 (= e!22659 e!22661)))

(declare-fun res!21778 () Bool)

(assert (=> b!35885 (=> (not res!21778) (not e!22661))))

(assert (=> b!35885 (= res!21778 (contains!420 lt!13236 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35885 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun b!35886 () Bool)

(declare-fun res!21779 () Bool)

(assert (=> b!35886 (=> (not res!21779) (not e!22654))))

(assert (=> b!35886 (= res!21779 e!22659)))

(declare-fun res!21776 () Bool)

(assert (=> b!35886 (=> res!21776 e!22659)))

(declare-fun e!22656 () Bool)

(assert (=> b!35886 (= res!21776 (not e!22656))))

(declare-fun res!21777 () Bool)

(assert (=> b!35886 (=> (not res!21777) (not e!22656))))

(assert (=> b!35886 (= res!21777 (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun b!35887 () Bool)

(declare-fun Unit!801 () Unit!798)

(assert (=> b!35887 (= e!22663 Unit!801)))

(declare-fun b!35888 () Bool)

(assert (=> b!35888 (= e!22654 e!22662)))

(declare-fun c!4067 () Bool)

(assert (=> b!35888 (= c!4067 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35889 () Bool)

(declare-fun e!22657 () ListLongMap!907)

(assert (=> b!35889 (= e!22657 call!2836)))

(declare-fun b!35890 () Bool)

(declare-fun lt!13252 () Unit!798)

(assert (=> b!35890 (= e!22663 lt!13252)))

(declare-fun lt!13251 () ListLongMap!907)

(declare-fun getCurrentListMapNoExtraKeys!29 (array!2467 array!2469 (_ BitVec 32) (_ BitVec 32) V!2003 V!2003 (_ BitVec 32) Int) ListLongMap!907)

(assert (=> b!35890 (= lt!13251 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13250 () (_ BitVec 64))

(assert (=> b!35890 (= lt!13250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13240 () (_ BitVec 64))

(assert (=> b!35890 (= lt!13240 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13239 () Unit!798)

(declare-fun addStillContains!27 (ListLongMap!907 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!798)

(assert (=> b!35890 (= lt!13239 (addStillContains!27 lt!13251 lt!13250 zeroValue!1443 lt!13240))))

(assert (=> b!35890 (contains!420 (+!59 lt!13251 (tuple2!1337 lt!13250 zeroValue!1443)) lt!13240)))

(declare-fun lt!13242 () Unit!798)

(assert (=> b!35890 (= lt!13242 lt!13239)))

(declare-fun lt!13248 () ListLongMap!907)

(assert (=> b!35890 (= lt!13248 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13256 () (_ BitVec 64))

(assert (=> b!35890 (= lt!13256 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13254 () (_ BitVec 64))

(assert (=> b!35890 (= lt!13254 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13245 () Unit!798)

(declare-fun addApplyDifferent!27 (ListLongMap!907 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!798)

(assert (=> b!35890 (= lt!13245 (addApplyDifferent!27 lt!13248 lt!13256 minValue!1443 lt!13254))))

(assert (=> b!35890 (= (apply!42 (+!59 lt!13248 (tuple2!1337 lt!13256 minValue!1443)) lt!13254) (apply!42 lt!13248 lt!13254))))

(declare-fun lt!13253 () Unit!798)

(assert (=> b!35890 (= lt!13253 lt!13245)))

(declare-fun lt!13243 () ListLongMap!907)

(assert (=> b!35890 (= lt!13243 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13247 () (_ BitVec 64))

(assert (=> b!35890 (= lt!13247 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13246 () (_ BitVec 64))

(assert (=> b!35890 (= lt!13246 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13241 () Unit!798)

(assert (=> b!35890 (= lt!13241 (addApplyDifferent!27 lt!13243 lt!13247 zeroValue!1443 lt!13246))))

(assert (=> b!35890 (= (apply!42 (+!59 lt!13243 (tuple2!1337 lt!13247 zeroValue!1443)) lt!13246) (apply!42 lt!13243 lt!13246))))

(declare-fun lt!13249 () Unit!798)

(assert (=> b!35890 (= lt!13249 lt!13241)))

(declare-fun lt!13244 () ListLongMap!907)

(assert (=> b!35890 (= lt!13244 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13237 () (_ BitVec 64))

(assert (=> b!35890 (= lt!13237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13238 () (_ BitVec 64))

(assert (=> b!35890 (= lt!13238 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35890 (= lt!13252 (addApplyDifferent!27 lt!13244 lt!13237 minValue!1443 lt!13238))))

(assert (=> b!35890 (= (apply!42 (+!59 lt!13244 (tuple2!1337 lt!13237 minValue!1443)) lt!13238) (apply!42 lt!13244 lt!13238))))

(declare-fun b!35891 () Bool)

(assert (=> b!35891 (= e!22655 (= (apply!42 lt!13236 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!35892 () Bool)

(declare-fun e!22652 () ListLongMap!907)

(assert (=> b!35892 (= e!22664 e!22652)))

(assert (=> b!35892 (= c!4069 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35893 () Bool)

(assert (=> b!35893 (= e!22653 e!22658)))

(declare-fun res!21780 () Bool)

(assert (=> b!35893 (= res!21780 call!2835)))

(assert (=> b!35893 (=> (not res!21780) (not e!22658))))

(declare-fun b!35894 () Bool)

(assert (=> b!35894 (= e!22652 call!2834)))

(declare-fun b!35895 () Bool)

(declare-fun c!4070 () Bool)

(assert (=> b!35895 (= c!4070 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!35895 (= e!22652 e!22657)))

(declare-fun b!35896 () Bool)

(declare-fun get!611 (ValueCell!617 V!2003) V!2003)

(declare-fun dynLambda!155 (Int (_ BitVec 64)) V!2003)

(assert (=> b!35896 (= e!22661 (= (apply!42 lt!13236 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)) (get!611 (select (arr!1179 _values!1501) #b00000000000000000000000000000000) (dynLambda!155 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1280 _values!1501)))))

(assert (=> b!35896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun b!35897 () Bool)

(assert (=> b!35897 (= e!22653 (not call!2835))))

(declare-fun bm!2835 () Bool)

(assert (=> bm!2835 (= call!2837 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35898 () Bool)

(assert (=> b!35898 (= e!22657 call!2834)))

(declare-fun b!35899 () Bool)

(assert (=> b!35899 (= e!22664 (+!59 call!2839 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!35900 () Bool)

(assert (=> b!35900 (= e!22656 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2836 () Bool)

(assert (=> bm!2836 (= call!2836 call!2833)))

(declare-fun b!35901 () Bool)

(assert (=> b!35901 (= e!22662 (not call!2838))))

(declare-fun b!35902 () Bool)

(assert (=> b!35902 (= e!22660 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5317 c!4072) b!35899))

(assert (= (and d!5317 (not c!4072)) b!35892))

(assert (= (and b!35892 c!4069) b!35894))

(assert (= (and b!35892 (not c!4069)) b!35895))

(assert (= (and b!35895 c!4070) b!35898))

(assert (= (and b!35895 (not c!4070)) b!35889))

(assert (= (or b!35898 b!35889) bm!2836))

(assert (= (or b!35894 bm!2836) bm!2832))

(assert (= (or b!35894 b!35898) bm!2830))

(assert (= (or b!35899 bm!2832) bm!2835))

(assert (= (or b!35899 bm!2830) bm!2831))

(assert (= (and d!5317 res!21775) b!35902))

(assert (= (and d!5317 c!4068) b!35890))

(assert (= (and d!5317 (not c!4068)) b!35887))

(assert (= (and d!5317 res!21781) b!35886))

(assert (= (and b!35886 res!21777) b!35900))

(assert (= (and b!35886 (not res!21776)) b!35885))

(assert (= (and b!35885 res!21778) b!35896))

(assert (= (and b!35886 res!21779) b!35883))

(assert (= (and b!35883 c!4071) b!35893))

(assert (= (and b!35883 (not c!4071)) b!35897))

(assert (= (and b!35893 res!21780) b!35882))

(assert (= (or b!35893 b!35897) bm!2833))

(assert (= (and b!35883 res!21783) b!35888))

(assert (= (and b!35888 c!4067) b!35884))

(assert (= (and b!35888 (not c!4067)) b!35901))

(assert (= (and b!35884 res!21782) b!35891))

(assert (= (or b!35884 b!35901) bm!2834))

(declare-fun b_lambda!1715 () Bool)

(assert (=> (not b_lambda!1715) (not b!35896)))

(declare-fun t!3642 () Bool)

(declare-fun tb!693 () Bool)

(assert (=> (and start!4576 (= defaultEntry!1504 defaultEntry!1504) t!3642) tb!693))

(declare-fun result!1201 () Bool)

(assert (=> tb!693 (= result!1201 tp_is_empty!1633)))

(assert (=> b!35896 t!3642))

(declare-fun b_and!2103 () Bool)

(assert (= b_and!2097 (and (=> t!3642 result!1201) b_and!2103)))

(declare-fun m!28731 () Bool)

(assert (=> b!35902 m!28731))

(assert (=> b!35902 m!28731))

(declare-fun m!28733 () Bool)

(assert (=> b!35902 m!28733))

(assert (=> b!35900 m!28731))

(assert (=> b!35900 m!28731))

(assert (=> b!35900 m!28733))

(declare-fun m!28735 () Bool)

(assert (=> b!35891 m!28735))

(declare-fun m!28737 () Bool)

(assert (=> b!35882 m!28737))

(declare-fun m!28739 () Bool)

(assert (=> bm!2835 m!28739))

(assert (=> d!5317 m!28669))

(declare-fun m!28741 () Bool)

(assert (=> b!35890 m!28741))

(declare-fun m!28743 () Bool)

(assert (=> b!35890 m!28743))

(declare-fun m!28745 () Bool)

(assert (=> b!35890 m!28745))

(declare-fun m!28747 () Bool)

(assert (=> b!35890 m!28747))

(declare-fun m!28749 () Bool)

(assert (=> b!35890 m!28749))

(assert (=> b!35890 m!28739))

(declare-fun m!28751 () Bool)

(assert (=> b!35890 m!28751))

(assert (=> b!35890 m!28751))

(declare-fun m!28753 () Bool)

(assert (=> b!35890 m!28753))

(declare-fun m!28755 () Bool)

(assert (=> b!35890 m!28755))

(declare-fun m!28757 () Bool)

(assert (=> b!35890 m!28757))

(declare-fun m!28759 () Bool)

(assert (=> b!35890 m!28759))

(assert (=> b!35890 m!28757))

(declare-fun m!28761 () Bool)

(assert (=> b!35890 m!28761))

(assert (=> b!35890 m!28747))

(assert (=> b!35890 m!28745))

(declare-fun m!28763 () Bool)

(assert (=> b!35890 m!28763))

(declare-fun m!28765 () Bool)

(assert (=> b!35890 m!28765))

(declare-fun m!28767 () Bool)

(assert (=> b!35890 m!28767))

(assert (=> b!35890 m!28731))

(declare-fun m!28769 () Bool)

(assert (=> b!35890 m!28769))

(declare-fun m!28771 () Bool)

(assert (=> bm!2833 m!28771))

(declare-fun m!28773 () Bool)

(assert (=> b!35899 m!28773))

(declare-fun m!28775 () Bool)

(assert (=> b!35896 m!28775))

(assert (=> b!35896 m!28775))

(declare-fun m!28777 () Bool)

(assert (=> b!35896 m!28777))

(declare-fun m!28779 () Bool)

(assert (=> b!35896 m!28779))

(assert (=> b!35896 m!28731))

(declare-fun m!28781 () Bool)

(assert (=> b!35896 m!28781))

(assert (=> b!35896 m!28731))

(assert (=> b!35896 m!28777))

(declare-fun m!28783 () Bool)

(assert (=> bm!2834 m!28783))

(declare-fun m!28785 () Bool)

(assert (=> bm!2831 m!28785))

(assert (=> b!35885 m!28731))

(assert (=> b!35885 m!28731))

(declare-fun m!28787 () Bool)

(assert (=> b!35885 m!28787))

(assert (=> b!35767 d!5317))

(declare-fun bm!2839 () Bool)

(declare-fun call!2842 () Bool)

(assert (=> bm!2839 (= call!2842 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!35913 () Bool)

(declare-fun e!22672 () Bool)

(assert (=> b!35913 (= e!22672 call!2842)))

(declare-fun b!35914 () Bool)

(declare-fun e!22671 () Bool)

(assert (=> b!35914 (= e!22671 call!2842)))

(declare-fun d!5319 () Bool)

(declare-fun res!21788 () Bool)

(declare-fun e!22673 () Bool)

(assert (=> d!5319 (=> res!21788 e!22673)))

(assert (=> d!5319 (= res!21788 (bvsge #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(assert (=> d!5319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22673)))

(declare-fun b!35915 () Bool)

(assert (=> b!35915 (= e!22671 e!22672)))

(declare-fun lt!13263 () (_ BitVec 64))

(assert (=> b!35915 (= lt!13263 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13265 () Unit!798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2467 (_ BitVec 64) (_ BitVec 32)) Unit!798)

(assert (=> b!35915 (= lt!13265 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13263 #b00000000000000000000000000000000))))

(assert (=> b!35915 (arrayContainsKey!0 _keys!1833 lt!13263 #b00000000000000000000000000000000)))

(declare-fun lt!13264 () Unit!798)

(assert (=> b!35915 (= lt!13264 lt!13265)))

(declare-fun res!21789 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2467 (_ BitVec 32)) SeekEntryResult!157)

(assert (=> b!35915 (= res!21789 (= (seekEntryOrOpen!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!157 #b00000000000000000000000000000000)))))

(assert (=> b!35915 (=> (not res!21789) (not e!22672))))

(declare-fun b!35916 () Bool)

(assert (=> b!35916 (= e!22673 e!22671)))

(declare-fun c!4075 () Bool)

(assert (=> b!35916 (= c!4075 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5319 (not res!21788)) b!35916))

(assert (= (and b!35916 c!4075) b!35915))

(assert (= (and b!35916 (not c!4075)) b!35914))

(assert (= (and b!35915 res!21789) b!35913))

(assert (= (or b!35913 b!35914) bm!2839))

(declare-fun m!28789 () Bool)

(assert (=> bm!2839 m!28789))

(assert (=> b!35915 m!28731))

(declare-fun m!28791 () Bool)

(assert (=> b!35915 m!28791))

(declare-fun m!28793 () Bool)

(assert (=> b!35915 m!28793))

(assert (=> b!35915 m!28731))

(declare-fun m!28795 () Bool)

(assert (=> b!35915 m!28795))

(assert (=> b!35916 m!28731))

(assert (=> b!35916 m!28731))

(assert (=> b!35916 m!28733))

(assert (=> b!35763 d!5319))

(declare-fun b!35929 () Bool)

(declare-fun c!4084 () Bool)

(declare-fun lt!13274 () (_ BitVec 64))

(assert (=> b!35929 (= c!4084 (= lt!13274 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22682 () SeekEntryResult!157)

(declare-fun e!22681 () SeekEntryResult!157)

(assert (=> b!35929 (= e!22682 e!22681)))

(declare-fun b!35931 () Bool)

(declare-fun e!22680 () SeekEntryResult!157)

(assert (=> b!35931 (= e!22680 Undefined!157)))

(declare-fun b!35932 () Bool)

(declare-fun lt!13276 () SeekEntryResult!157)

(assert (=> b!35932 (= e!22682 (Found!157 (index!2752 lt!13276)))))

(declare-fun b!35930 () Bool)

(declare-fun lt!13275 () SeekEntryResult!157)

(assert (=> b!35930 (= e!22681 (ite ((_ is MissingVacant!157) lt!13275) (MissingZero!157 (index!2753 lt!13275)) lt!13275))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2467 (_ BitVec 32)) SeekEntryResult!157)

(assert (=> b!35930 (= lt!13275 (seekKeyOrZeroReturnVacant!0 (x!7045 lt!13276) (index!2752 lt!13276) (index!2752 lt!13276) k0!1304 _keys!1833 mask!2294))))

(declare-fun d!5321 () Bool)

(declare-fun lt!13277 () SeekEntryResult!157)

(assert (=> d!5321 (and (or ((_ is MissingVacant!157) lt!13277) (not ((_ is Found!157) lt!13277)) (and (bvsge (index!2751 lt!13277) #b00000000000000000000000000000000) (bvslt (index!2751 lt!13277) (size!1279 _keys!1833)))) (not ((_ is MissingVacant!157) lt!13277)) (or (not ((_ is Found!157) lt!13277)) (= (select (arr!1178 _keys!1833) (index!2751 lt!13277)) k0!1304)))))

(assert (=> d!5321 (= lt!13277 e!22680)))

(declare-fun c!4083 () Bool)

(assert (=> d!5321 (= c!4083 (and ((_ is Intermediate!157) lt!13276) (undefined!969 lt!13276)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2467 (_ BitVec 32)) SeekEntryResult!157)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5321 (= lt!13276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5321 (validMask!0 mask!2294)))

(assert (=> d!5321 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!13277)))

(declare-fun b!35933 () Bool)

(assert (=> b!35933 (= e!22681 (MissingZero!157 (index!2752 lt!13276)))))

(declare-fun b!35934 () Bool)

(assert (=> b!35934 (= e!22680 e!22682)))

(assert (=> b!35934 (= lt!13274 (select (arr!1178 _keys!1833) (index!2752 lt!13276)))))

(declare-fun c!4082 () Bool)

(assert (=> b!35934 (= c!4082 (= lt!13274 k0!1304))))

(assert (= (and d!5321 c!4083) b!35931))

(assert (= (and d!5321 (not c!4083)) b!35934))

(assert (= (and b!35934 c!4082) b!35932))

(assert (= (and b!35934 (not c!4082)) b!35929))

(assert (= (and b!35929 c!4084) b!35933))

(assert (= (and b!35929 (not c!4084)) b!35930))

(declare-fun m!28797 () Bool)

(assert (=> b!35930 m!28797))

(declare-fun m!28799 () Bool)

(assert (=> d!5321 m!28799))

(declare-fun m!28801 () Bool)

(assert (=> d!5321 m!28801))

(assert (=> d!5321 m!28801))

(declare-fun m!28803 () Bool)

(assert (=> d!5321 m!28803))

(assert (=> d!5321 m!28669))

(declare-fun m!28805 () Bool)

(assert (=> b!35934 m!28805))

(assert (=> b!35764 d!5321))

(declare-fun b!35945 () Bool)

(declare-fun e!22691 () Bool)

(declare-fun e!22692 () Bool)

(assert (=> b!35945 (= e!22691 e!22692)))

(declare-fun c!4087 () Bool)

(assert (=> b!35945 (= c!4087 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2842 () Bool)

(declare-fun call!2845 () Bool)

(assert (=> bm!2842 (= call!2845 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4087 (Cons!928 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) Nil!929) Nil!929)))))

(declare-fun d!5323 () Bool)

(declare-fun res!21796 () Bool)

(declare-fun e!22693 () Bool)

(assert (=> d!5323 (=> res!21796 e!22693)))

(assert (=> d!5323 (= res!21796 (bvsge #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(assert (=> d!5323 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!929) e!22693)))

(declare-fun b!35946 () Bool)

(declare-fun e!22694 () Bool)

(declare-fun contains!421 (List!932 (_ BitVec 64)) Bool)

(assert (=> b!35946 (= e!22694 (contains!421 Nil!929 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35947 () Bool)

(assert (=> b!35947 (= e!22692 call!2845)))

(declare-fun b!35948 () Bool)

(assert (=> b!35948 (= e!22692 call!2845)))

(declare-fun b!35949 () Bool)

(assert (=> b!35949 (= e!22693 e!22691)))

(declare-fun res!21797 () Bool)

(assert (=> b!35949 (=> (not res!21797) (not e!22691))))

(assert (=> b!35949 (= res!21797 (not e!22694))))

(declare-fun res!21798 () Bool)

(assert (=> b!35949 (=> (not res!21798) (not e!22694))))

(assert (=> b!35949 (= res!21798 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5323 (not res!21796)) b!35949))

(assert (= (and b!35949 res!21798) b!35946))

(assert (= (and b!35949 res!21797) b!35945))

(assert (= (and b!35945 c!4087) b!35948))

(assert (= (and b!35945 (not c!4087)) b!35947))

(assert (= (or b!35948 b!35947) bm!2842))

(assert (=> b!35945 m!28731))

(assert (=> b!35945 m!28731))

(assert (=> b!35945 m!28733))

(assert (=> bm!2842 m!28731))

(declare-fun m!28807 () Bool)

(assert (=> bm!2842 m!28807))

(assert (=> b!35946 m!28731))

(assert (=> b!35946 m!28731))

(declare-fun m!28809 () Bool)

(assert (=> b!35946 m!28809))

(assert (=> b!35949 m!28731))

(assert (=> b!35949 m!28731))

(assert (=> b!35949 m!28733))

(assert (=> b!35765 d!5323))

(declare-fun d!5325 () Bool)

(assert (=> d!5325 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4576 d!5325))

(declare-fun d!5327 () Bool)

(assert (=> d!5327 (= (array_inv!809 _values!1501) (bvsge (size!1280 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4576 d!5327))

(declare-fun d!5329 () Bool)

(assert (=> d!5329 (= (array_inv!810 _keys!1833) (bvsge (size!1279 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4576 d!5329))

(declare-fun d!5331 () Bool)

(declare-fun res!21803 () Bool)

(declare-fun e!22699 () Bool)

(assert (=> d!5331 (=> res!21803 e!22699)))

(assert (=> d!5331 (= res!21803 (= (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5331 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22699)))

(declare-fun b!35954 () Bool)

(declare-fun e!22700 () Bool)

(assert (=> b!35954 (= e!22699 e!22700)))

(declare-fun res!21804 () Bool)

(assert (=> b!35954 (=> (not res!21804) (not e!22700))))

(assert (=> b!35954 (= res!21804 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1279 _keys!1833)))))

(declare-fun b!35955 () Bool)

(assert (=> b!35955 (= e!22700 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5331 (not res!21803)) b!35954))

(assert (= (and b!35954 res!21804) b!35955))

(assert (=> d!5331 m!28731))

(declare-fun m!28811 () Bool)

(assert (=> b!35955 m!28811))

(assert (=> b!35761 d!5331))

(declare-fun condMapEmpty!2014 () Bool)

(declare-fun mapDefault!2014 () ValueCell!617)

(assert (=> mapNonEmpty!2005 (= condMapEmpty!2014 (= mapRest!2005 ((as const (Array (_ BitVec 32) ValueCell!617)) mapDefault!2014)))))

(declare-fun e!22706 () Bool)

(declare-fun mapRes!2014 () Bool)

(assert (=> mapNonEmpty!2005 (= tp!5284 (and e!22706 mapRes!2014))))

(declare-fun b!35962 () Bool)

(declare-fun e!22705 () Bool)

(assert (=> b!35962 (= e!22705 tp_is_empty!1633)))

(declare-fun mapIsEmpty!2014 () Bool)

(assert (=> mapIsEmpty!2014 mapRes!2014))

(declare-fun mapNonEmpty!2014 () Bool)

(declare-fun tp!5299 () Bool)

(assert (=> mapNonEmpty!2014 (= mapRes!2014 (and tp!5299 e!22705))))

(declare-fun mapValue!2014 () ValueCell!617)

(declare-fun mapRest!2014 () (Array (_ BitVec 32) ValueCell!617))

(declare-fun mapKey!2014 () (_ BitVec 32))

(assert (=> mapNonEmpty!2014 (= mapRest!2005 (store mapRest!2014 mapKey!2014 mapValue!2014))))

(declare-fun b!35963 () Bool)

(assert (=> b!35963 (= e!22706 tp_is_empty!1633)))

(assert (= (and mapNonEmpty!2005 condMapEmpty!2014) mapIsEmpty!2014))

(assert (= (and mapNonEmpty!2005 (not condMapEmpty!2014)) mapNonEmpty!2014))

(assert (= (and mapNonEmpty!2014 ((_ is ValueCellFull!617) mapValue!2014)) b!35962))

(assert (= (and mapNonEmpty!2005 ((_ is ValueCellFull!617) mapDefault!2014)) b!35963))

(declare-fun m!28813 () Bool)

(assert (=> mapNonEmpty!2014 m!28813))

(declare-fun b_lambda!1717 () Bool)

(assert (= b_lambda!1715 (or (and start!4576 b_free!1279) b_lambda!1717)))

(check-sat (not b!35896) (not b!35891) (not bm!2842) (not b!35916) (not b_next!1279) (not d!5321) (not b!35949) tp_is_empty!1633 (not bm!2839) (not b!35930) (not bm!2834) (not b!35839) (not b!35899) (not b_lambda!1717) (not b!35885) (not b!35882) (not b!35890) (not b!35946) (not b!35945) (not b!35837) (not bm!2835) (not bm!2833) (not bm!2831) (not b!35900) (not mapNonEmpty!2014) (not d!5317) (not b!35902) (not b!35955) (not b!35915) (not d!5315) b_and!2103)
(check-sat b_and!2103 (not b_next!1279))
(get-model)

(declare-fun d!5333 () Bool)

(assert (=> d!5333 (= (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)) (and (not (= (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35902 d!5333))

(declare-fun d!5335 () Bool)

(declare-fun e!22708 () Bool)

(assert (=> d!5335 e!22708))

(declare-fun res!21805 () Bool)

(assert (=> d!5335 (=> res!21805 e!22708)))

(declare-fun lt!13280 () Bool)

(assert (=> d!5335 (= res!21805 (not lt!13280))))

(declare-fun lt!13278 () Bool)

(assert (=> d!5335 (= lt!13280 lt!13278)))

(declare-fun lt!13279 () Unit!798)

(declare-fun e!22707 () Unit!798)

(assert (=> d!5335 (= lt!13279 e!22707)))

(declare-fun c!4088 () Bool)

(assert (=> d!5335 (= c!4088 lt!13278)))

(assert (=> d!5335 (= lt!13278 (containsKey!38 (toList!469 lt!13236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5335 (= (contains!420 lt!13236 #b1000000000000000000000000000000000000000000000000000000000000000) lt!13280)))

(declare-fun b!35964 () Bool)

(declare-fun lt!13281 () Unit!798)

(assert (=> b!35964 (= e!22707 lt!13281)))

(assert (=> b!35964 (= lt!13281 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!469 lt!13236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!35964 (isDefined!36 (getValueByKey!74 (toList!469 lt!13236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35965 () Bool)

(declare-fun Unit!802 () Unit!798)

(assert (=> b!35965 (= e!22707 Unit!802)))

(declare-fun b!35966 () Bool)

(assert (=> b!35966 (= e!22708 (isDefined!36 (getValueByKey!74 (toList!469 lt!13236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!5335 c!4088) b!35964))

(assert (= (and d!5335 (not c!4088)) b!35965))

(assert (= (and d!5335 (not res!21805)) b!35966))

(declare-fun m!28815 () Bool)

(assert (=> d!5335 m!28815))

(declare-fun m!28817 () Bool)

(assert (=> b!35964 m!28817))

(declare-fun m!28819 () Bool)

(assert (=> b!35964 m!28819))

(assert (=> b!35964 m!28819))

(declare-fun m!28821 () Bool)

(assert (=> b!35964 m!28821))

(assert (=> b!35966 m!28819))

(assert (=> b!35966 m!28819))

(assert (=> b!35966 m!28821))

(assert (=> bm!2834 d!5335))

(declare-fun d!5337 () Bool)

(assert (=> d!5337 (isDefined!36 (getValueByKey!74 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun lt!13284 () Unit!798)

(declare-fun choose!222 (List!933 (_ BitVec 64)) Unit!798)

(assert (=> d!5337 (= lt!13284 (choose!222 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun e!22711 () Bool)

(assert (=> d!5337 e!22711))

(declare-fun res!21808 () Bool)

(assert (=> d!5337 (=> (not res!21808) (not e!22711))))

(declare-fun isStrictlySorted!159 (List!933) Bool)

(assert (=> d!5337 (= res!21808 (isStrictlySorted!159 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))))

(assert (=> d!5337 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304) lt!13284)))

(declare-fun b!35969 () Bool)

(assert (=> b!35969 (= e!22711 (containsKey!38 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (= (and d!5337 res!21808) b!35969))

(assert (=> d!5337 m!28727))

(assert (=> d!5337 m!28727))

(assert (=> d!5337 m!28729))

(declare-fun m!28823 () Bool)

(assert (=> d!5337 m!28823))

(declare-fun m!28825 () Bool)

(assert (=> d!5337 m!28825))

(assert (=> b!35969 m!28723))

(assert (=> b!35837 d!5337))

(declare-fun d!5339 () Bool)

(declare-fun isEmpty!174 (Option!80) Bool)

(assert (=> d!5339 (= (isDefined!36 (getValueByKey!74 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)) (not (isEmpty!174 (getValueByKey!74 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))))

(declare-fun bs!1359 () Bool)

(assert (= bs!1359 d!5339))

(assert (=> bs!1359 m!28727))

(declare-fun m!28827 () Bool)

(assert (=> bs!1359 m!28827))

(assert (=> b!35837 d!5339))

(declare-fun b!35979 () Bool)

(declare-fun e!22716 () Option!80)

(declare-fun e!22717 () Option!80)

(assert (=> b!35979 (= e!22716 e!22717)))

(declare-fun c!4094 () Bool)

(assert (=> b!35979 (= c!4094 (and ((_ is Cons!929) (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (not (= (_1!679 (h!1496 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304))))))

(declare-fun d!5341 () Bool)

(declare-fun c!4093 () Bool)

(assert (=> d!5341 (= c!4093 (and ((_ is Cons!929) (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (= (_1!679 (h!1496 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)))))

(assert (=> d!5341 (= (getValueByKey!74 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304) e!22716)))

(declare-fun b!35981 () Bool)

(assert (=> b!35981 (= e!22717 None!78)))

(declare-fun b!35978 () Bool)

(assert (=> b!35978 (= e!22716 (Some!79 (_2!679 (h!1496 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))))))

(declare-fun b!35980 () Bool)

(assert (=> b!35980 (= e!22717 (getValueByKey!74 (t!3638 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) k0!1304))))

(assert (= (and d!5341 c!4093) b!35978))

(assert (= (and d!5341 (not c!4093)) b!35979))

(assert (= (and b!35979 c!4094) b!35980))

(assert (= (and b!35979 (not c!4094)) b!35981))

(declare-fun m!28829 () Bool)

(assert (=> b!35980 m!28829))

(assert (=> b!35837 d!5341))

(declare-fun d!5343 () Bool)

(declare-fun e!22719 () Bool)

(assert (=> d!5343 e!22719))

(declare-fun res!21809 () Bool)

(assert (=> d!5343 (=> res!21809 e!22719)))

(declare-fun lt!13287 () Bool)

(assert (=> d!5343 (= res!21809 (not lt!13287))))

(declare-fun lt!13285 () Bool)

(assert (=> d!5343 (= lt!13287 lt!13285)))

(declare-fun lt!13286 () Unit!798)

(declare-fun e!22718 () Unit!798)

(assert (=> d!5343 (= lt!13286 e!22718)))

(declare-fun c!4095 () Bool)

(assert (=> d!5343 (= c!4095 lt!13285)))

(assert (=> d!5343 (= lt!13285 (containsKey!38 (toList!469 lt!13236) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> d!5343 (= (contains!420 lt!13236 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)) lt!13287)))

(declare-fun b!35982 () Bool)

(declare-fun lt!13288 () Unit!798)

(assert (=> b!35982 (= e!22718 lt!13288)))

(assert (=> b!35982 (= lt!13288 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!469 lt!13236) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35982 (isDefined!36 (getValueByKey!74 (toList!469 lt!13236) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35983 () Bool)

(declare-fun Unit!803 () Unit!798)

(assert (=> b!35983 (= e!22718 Unit!803)))

(declare-fun b!35984 () Bool)

(assert (=> b!35984 (= e!22719 (isDefined!36 (getValueByKey!74 (toList!469 lt!13236) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))))

(assert (= (and d!5343 c!4095) b!35982))

(assert (= (and d!5343 (not c!4095)) b!35983))

(assert (= (and d!5343 (not res!21809)) b!35984))

(assert (=> d!5343 m!28731))

(declare-fun m!28831 () Bool)

(assert (=> d!5343 m!28831))

(assert (=> b!35982 m!28731))

(declare-fun m!28833 () Bool)

(assert (=> b!35982 m!28833))

(assert (=> b!35982 m!28731))

(declare-fun m!28835 () Bool)

(assert (=> b!35982 m!28835))

(assert (=> b!35982 m!28835))

(declare-fun m!28837 () Bool)

(assert (=> b!35982 m!28837))

(assert (=> b!35984 m!28731))

(assert (=> b!35984 m!28835))

(assert (=> b!35984 m!28835))

(assert (=> b!35984 m!28837))

(assert (=> b!35885 d!5343))

(assert (=> b!35839 d!5339))

(assert (=> b!35839 d!5341))

(declare-fun d!5345 () Bool)

(declare-fun e!22722 () Bool)

(assert (=> d!5345 e!22722))

(declare-fun res!21814 () Bool)

(assert (=> d!5345 (=> (not res!21814) (not e!22722))))

(declare-fun lt!13300 () ListLongMap!907)

(assert (=> d!5345 (= res!21814 (contains!420 lt!13300 (_1!679 (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun lt!13299 () List!933)

(assert (=> d!5345 (= lt!13300 (ListLongMap!908 lt!13299))))

(declare-fun lt!13297 () Unit!798)

(declare-fun lt!13298 () Unit!798)

(assert (=> d!5345 (= lt!13297 lt!13298)))

(assert (=> d!5345 (= (getValueByKey!74 lt!13299 (_1!679 (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))) (Some!79 (_2!679 (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!19 (List!933 (_ BitVec 64) V!2003) Unit!798)

(assert (=> d!5345 (= lt!13298 (lemmaContainsTupThenGetReturnValue!19 lt!13299 (_1!679 (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (_2!679 (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun insertStrictlySorted!19 (List!933 (_ BitVec 64) V!2003) List!933)

(assert (=> d!5345 (= lt!13299 (insertStrictlySorted!19 (toList!469 (ite c!4072 call!2837 (ite c!4069 call!2833 call!2836))) (_1!679 (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (_2!679 (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(assert (=> d!5345 (= (+!59 (ite c!4072 call!2837 (ite c!4069 call!2833 call!2836)) (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) lt!13300)))

(declare-fun b!35989 () Bool)

(declare-fun res!21815 () Bool)

(assert (=> b!35989 (=> (not res!21815) (not e!22722))))

(assert (=> b!35989 (= res!21815 (= (getValueByKey!74 (toList!469 lt!13300) (_1!679 (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))) (Some!79 (_2!679 (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))))

(declare-fun b!35990 () Bool)

(declare-fun contains!422 (List!933 tuple2!1336) Bool)

(assert (=> b!35990 (= e!22722 (contains!422 (toList!469 lt!13300) (ite (or c!4072 c!4069) (tuple2!1337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (= (and d!5345 res!21814) b!35989))

(assert (= (and b!35989 res!21815) b!35990))

(declare-fun m!28839 () Bool)

(assert (=> d!5345 m!28839))

(declare-fun m!28841 () Bool)

(assert (=> d!5345 m!28841))

(declare-fun m!28843 () Bool)

(assert (=> d!5345 m!28843))

(declare-fun m!28845 () Bool)

(assert (=> d!5345 m!28845))

(declare-fun m!28847 () Bool)

(assert (=> b!35989 m!28847))

(declare-fun m!28849 () Bool)

(assert (=> b!35990 m!28849))

(assert (=> bm!2831 d!5345))

(assert (=> b!35916 d!5333))

(declare-fun d!5347 () Bool)

(declare-fun e!22724 () Bool)

(assert (=> d!5347 e!22724))

(declare-fun res!21816 () Bool)

(assert (=> d!5347 (=> res!21816 e!22724)))

(declare-fun lt!13303 () Bool)

(assert (=> d!5347 (= res!21816 (not lt!13303))))

(declare-fun lt!13301 () Bool)

(assert (=> d!5347 (= lt!13303 lt!13301)))

(declare-fun lt!13302 () Unit!798)

(declare-fun e!22723 () Unit!798)

(assert (=> d!5347 (= lt!13302 e!22723)))

(declare-fun c!4096 () Bool)

(assert (=> d!5347 (= c!4096 lt!13301)))

(assert (=> d!5347 (= lt!13301 (containsKey!38 (toList!469 lt!13236) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5347 (= (contains!420 lt!13236 #b0000000000000000000000000000000000000000000000000000000000000000) lt!13303)))

(declare-fun b!35991 () Bool)

(declare-fun lt!13304 () Unit!798)

(assert (=> b!35991 (= e!22723 lt!13304)))

(assert (=> b!35991 (= lt!13304 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!469 lt!13236) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!35991 (isDefined!36 (getValueByKey!74 (toList!469 lt!13236) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35992 () Bool)

(declare-fun Unit!804 () Unit!798)

(assert (=> b!35992 (= e!22723 Unit!804)))

(declare-fun b!35993 () Bool)

(assert (=> b!35993 (= e!22724 (isDefined!36 (getValueByKey!74 (toList!469 lt!13236) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!5347 c!4096) b!35991))

(assert (= (and d!5347 (not c!4096)) b!35992))

(assert (= (and d!5347 (not res!21816)) b!35993))

(declare-fun m!28851 () Bool)

(assert (=> d!5347 m!28851))

(declare-fun m!28853 () Bool)

(assert (=> b!35991 m!28853))

(declare-fun m!28855 () Bool)

(assert (=> b!35991 m!28855))

(assert (=> b!35991 m!28855))

(declare-fun m!28857 () Bool)

(assert (=> b!35991 m!28857))

(assert (=> b!35993 m!28855))

(assert (=> b!35993 m!28855))

(assert (=> b!35993 m!28857))

(assert (=> bm!2833 d!5347))

(declare-fun d!5349 () Bool)

(declare-fun get!612 (Option!80) V!2003)

(assert (=> d!5349 (= (apply!42 lt!13236 #b0000000000000000000000000000000000000000000000000000000000000000) (get!612 (getValueByKey!74 (toList!469 lt!13236) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1360 () Bool)

(assert (= bs!1360 d!5349))

(assert (=> bs!1360 m!28855))

(assert (=> bs!1360 m!28855))

(declare-fun m!28859 () Bool)

(assert (=> bs!1360 m!28859))

(assert (=> b!35882 d!5349))

(assert (=> b!35949 d!5333))

(declare-fun d!5351 () Bool)

(declare-fun e!22725 () Bool)

(assert (=> d!5351 e!22725))

(declare-fun res!21817 () Bool)

(assert (=> d!5351 (=> (not res!21817) (not e!22725))))

(declare-fun lt!13308 () ListLongMap!907)

(assert (=> d!5351 (= res!21817 (contains!420 lt!13308 (_1!679 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun lt!13307 () List!933)

(assert (=> d!5351 (= lt!13308 (ListLongMap!908 lt!13307))))

(declare-fun lt!13305 () Unit!798)

(declare-fun lt!13306 () Unit!798)

(assert (=> d!5351 (= lt!13305 lt!13306)))

(assert (=> d!5351 (= (getValueByKey!74 lt!13307 (_1!679 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (Some!79 (_2!679 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (=> d!5351 (= lt!13306 (lemmaContainsTupThenGetReturnValue!19 lt!13307 (_1!679 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)) (_2!679 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (=> d!5351 (= lt!13307 (insertStrictlySorted!19 (toList!469 call!2839) (_1!679 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)) (_2!679 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (=> d!5351 (= (+!59 call!2839 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)) lt!13308)))

(declare-fun b!35994 () Bool)

(declare-fun res!21818 () Bool)

(assert (=> b!35994 (=> (not res!21818) (not e!22725))))

(assert (=> b!35994 (= res!21818 (= (getValueByKey!74 (toList!469 lt!13308) (_1!679 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (Some!79 (_2!679 (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun b!35995 () Bool)

(assert (=> b!35995 (= e!22725 (contains!422 (toList!469 lt!13308) (tuple2!1337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(assert (= (and d!5351 res!21817) b!35994))

(assert (= (and b!35994 res!21818) b!35995))

(declare-fun m!28861 () Bool)

(assert (=> d!5351 m!28861))

(declare-fun m!28863 () Bool)

(assert (=> d!5351 m!28863))

(declare-fun m!28865 () Bool)

(assert (=> d!5351 m!28865))

(declare-fun m!28867 () Bool)

(assert (=> d!5351 m!28867))

(declare-fun m!28869 () Bool)

(assert (=> b!35994 m!28869))

(declare-fun m!28871 () Bool)

(assert (=> b!35995 m!28871))

(assert (=> b!35899 d!5351))

(declare-fun d!5353 () Bool)

(assert (=> d!5353 (arrayContainsKey!0 _keys!1833 lt!13263 #b00000000000000000000000000000000)))

(declare-fun lt!13311 () Unit!798)

(declare-fun choose!13 (array!2467 (_ BitVec 64) (_ BitVec 32)) Unit!798)

(assert (=> d!5353 (= lt!13311 (choose!13 _keys!1833 lt!13263 #b00000000000000000000000000000000))))

(assert (=> d!5353 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!5353 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13263 #b00000000000000000000000000000000) lt!13311)))

(declare-fun bs!1361 () Bool)

(assert (= bs!1361 d!5353))

(assert (=> bs!1361 m!28793))

(declare-fun m!28873 () Bool)

(assert (=> bs!1361 m!28873))

(assert (=> b!35915 d!5353))

(declare-fun d!5355 () Bool)

(declare-fun res!21819 () Bool)

(declare-fun e!22726 () Bool)

(assert (=> d!5355 (=> res!21819 e!22726)))

(assert (=> d!5355 (= res!21819 (= (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) lt!13263))))

(assert (=> d!5355 (= (arrayContainsKey!0 _keys!1833 lt!13263 #b00000000000000000000000000000000) e!22726)))

(declare-fun b!35996 () Bool)

(declare-fun e!22727 () Bool)

(assert (=> b!35996 (= e!22726 e!22727)))

(declare-fun res!21820 () Bool)

(assert (=> b!35996 (=> (not res!21820) (not e!22727))))

(assert (=> b!35996 (= res!21820 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1279 _keys!1833)))))

(declare-fun b!35997 () Bool)

(assert (=> b!35997 (= e!22727 (arrayContainsKey!0 _keys!1833 lt!13263 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5355 (not res!21819)) b!35996))

(assert (= (and b!35996 res!21820) b!35997))

(assert (=> d!5355 m!28731))

(declare-fun m!28875 () Bool)

(assert (=> b!35997 m!28875))

(assert (=> b!35915 d!5355))

(declare-fun b!36011 () Bool)

(declare-fun e!22735 () SeekEntryResult!157)

(assert (=> b!36011 (= e!22735 Undefined!157)))

(declare-fun b!36012 () Bool)

(declare-fun c!4103 () Bool)

(declare-fun lt!13320 () (_ BitVec 64))

(assert (=> b!36012 (= c!4103 (= lt!13320 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22736 () SeekEntryResult!157)

(declare-fun e!22734 () SeekEntryResult!157)

(assert (=> b!36012 (= e!22736 e!22734)))

(declare-fun b!36013 () Bool)

(declare-fun lt!13319 () SeekEntryResult!157)

(assert (=> b!36013 (= e!22736 (Found!157 (index!2752 lt!13319)))))

(declare-fun d!5357 () Bool)

(declare-fun lt!13318 () SeekEntryResult!157)

(assert (=> d!5357 (and (or ((_ is Undefined!157) lt!13318) (not ((_ is Found!157) lt!13318)) (and (bvsge (index!2751 lt!13318) #b00000000000000000000000000000000) (bvslt (index!2751 lt!13318) (size!1279 _keys!1833)))) (or ((_ is Undefined!157) lt!13318) ((_ is Found!157) lt!13318) (not ((_ is MissingZero!157) lt!13318)) (and (bvsge (index!2750 lt!13318) #b00000000000000000000000000000000) (bvslt (index!2750 lt!13318) (size!1279 _keys!1833)))) (or ((_ is Undefined!157) lt!13318) ((_ is Found!157) lt!13318) ((_ is MissingZero!157) lt!13318) (not ((_ is MissingVacant!157) lt!13318)) (and (bvsge (index!2753 lt!13318) #b00000000000000000000000000000000) (bvslt (index!2753 lt!13318) (size!1279 _keys!1833)))) (or ((_ is Undefined!157) lt!13318) (ite ((_ is Found!157) lt!13318) (= (select (arr!1178 _keys!1833) (index!2751 lt!13318)) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!157) lt!13318) (= (select (arr!1178 _keys!1833) (index!2750 lt!13318)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!157) lt!13318) (= (select (arr!1178 _keys!1833) (index!2753 lt!13318)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!5357 (= lt!13318 e!22735)))

(declare-fun c!4104 () Bool)

(assert (=> d!5357 (= c!4104 (and ((_ is Intermediate!157) lt!13319) (undefined!969 lt!13319)))))

(assert (=> d!5357 (= lt!13319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) mask!2294) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294))))

(assert (=> d!5357 (validMask!0 mask!2294)))

(assert (=> d!5357 (= (seekEntryOrOpen!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) lt!13318)))

(declare-fun b!36010 () Bool)

(assert (=> b!36010 (= e!22735 e!22736)))

(assert (=> b!36010 (= lt!13320 (select (arr!1178 _keys!1833) (index!2752 lt!13319)))))

(declare-fun c!4105 () Bool)

(assert (=> b!36010 (= c!4105 (= lt!13320 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36014 () Bool)

(assert (=> b!36014 (= e!22734 (seekKeyOrZeroReturnVacant!0 (x!7045 lt!13319) (index!2752 lt!13319) (index!2752 lt!13319) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294))))

(declare-fun b!36015 () Bool)

(assert (=> b!36015 (= e!22734 (MissingZero!157 (index!2752 lt!13319)))))

(assert (= (and d!5357 c!4104) b!36011))

(assert (= (and d!5357 (not c!4104)) b!36010))

(assert (= (and b!36010 c!4105) b!36013))

(assert (= (and b!36010 (not c!4105)) b!36012))

(assert (= (and b!36012 c!4103) b!36015))

(assert (= (and b!36012 (not c!4103)) b!36014))

(declare-fun m!28877 () Bool)

(assert (=> d!5357 m!28877))

(assert (=> d!5357 m!28669))

(declare-fun m!28879 () Bool)

(assert (=> d!5357 m!28879))

(declare-fun m!28881 () Bool)

(assert (=> d!5357 m!28881))

(assert (=> d!5357 m!28731))

(declare-fun m!28883 () Bool)

(assert (=> d!5357 m!28883))

(assert (=> d!5357 m!28883))

(assert (=> d!5357 m!28731))

(declare-fun m!28885 () Bool)

(assert (=> d!5357 m!28885))

(declare-fun m!28887 () Bool)

(assert (=> b!36010 m!28887))

(assert (=> b!36014 m!28731))

(declare-fun m!28889 () Bool)

(assert (=> b!36014 m!28889))

(assert (=> b!35915 d!5357))

(assert (=> b!35900 d!5333))

(declare-fun d!5359 () Bool)

(declare-fun res!21821 () Bool)

(declare-fun e!22737 () Bool)

(assert (=> d!5359 (=> res!21821 e!22737)))

(assert (=> d!5359 (= res!21821 (= (select (arr!1178 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1304))))

(assert (=> d!5359 (= (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!22737)))

(declare-fun b!36016 () Bool)

(declare-fun e!22738 () Bool)

(assert (=> b!36016 (= e!22737 e!22738)))

(declare-fun res!21822 () Bool)

(assert (=> b!36016 (=> (not res!21822) (not e!22738))))

(assert (=> b!36016 (= res!21822 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1279 _keys!1833)))))

(declare-fun b!36017 () Bool)

(assert (=> b!36017 (= e!22738 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!5359 (not res!21821)) b!36016))

(assert (= (and b!36016 res!21822) b!36017))

(declare-fun m!28891 () Bool)

(assert (=> d!5359 m!28891))

(declare-fun m!28893 () Bool)

(assert (=> b!36017 m!28893))

(assert (=> b!35955 d!5359))

(declare-fun b!36018 () Bool)

(declare-fun e!22739 () Bool)

(declare-fun e!22740 () Bool)

(assert (=> b!36018 (= e!22739 e!22740)))

(declare-fun c!4106 () Bool)

(assert (=> b!36018 (= c!4106 (validKeyInArray!0 (select (arr!1178 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2843 () Bool)

(declare-fun call!2846 () Bool)

(assert (=> bm!2843 (= call!2846 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4106 (Cons!928 (select (arr!1178 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4087 (Cons!928 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) Nil!929) Nil!929)) (ite c!4087 (Cons!928 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) Nil!929) Nil!929))))))

(declare-fun d!5361 () Bool)

(declare-fun res!21823 () Bool)

(declare-fun e!22741 () Bool)

(assert (=> d!5361 (=> res!21823 e!22741)))

(assert (=> d!5361 (= res!21823 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1279 _keys!1833)))))

(assert (=> d!5361 (= (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4087 (Cons!928 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) Nil!929) Nil!929)) e!22741)))

(declare-fun b!36019 () Bool)

(declare-fun e!22742 () Bool)

(assert (=> b!36019 (= e!22742 (contains!421 (ite c!4087 (Cons!928 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) Nil!929) Nil!929) (select (arr!1178 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!36020 () Bool)

(assert (=> b!36020 (= e!22740 call!2846)))

(declare-fun b!36021 () Bool)

(assert (=> b!36021 (= e!22740 call!2846)))

(declare-fun b!36022 () Bool)

(assert (=> b!36022 (= e!22741 e!22739)))

(declare-fun res!21824 () Bool)

(assert (=> b!36022 (=> (not res!21824) (not e!22739))))

(assert (=> b!36022 (= res!21824 (not e!22742))))

(declare-fun res!21825 () Bool)

(assert (=> b!36022 (=> (not res!21825) (not e!22742))))

(assert (=> b!36022 (= res!21825 (validKeyInArray!0 (select (arr!1178 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!5361 (not res!21823)) b!36022))

(assert (= (and b!36022 res!21825) b!36019))

(assert (= (and b!36022 res!21824) b!36018))

(assert (= (and b!36018 c!4106) b!36021))

(assert (= (and b!36018 (not c!4106)) b!36020))

(assert (= (or b!36021 b!36020) bm!2843))

(assert (=> b!36018 m!28891))

(assert (=> b!36018 m!28891))

(declare-fun m!28895 () Bool)

(assert (=> b!36018 m!28895))

(assert (=> bm!2843 m!28891))

(declare-fun m!28897 () Bool)

(assert (=> bm!2843 m!28897))

(assert (=> b!36019 m!28891))

(assert (=> b!36019 m!28891))

(declare-fun m!28899 () Bool)

(assert (=> b!36019 m!28899))

(assert (=> b!36022 m!28891))

(assert (=> b!36022 m!28891))

(assert (=> b!36022 m!28895))

(assert (=> bm!2842 d!5361))

(declare-fun d!5363 () Bool)

(assert (=> d!5363 (= (apply!42 lt!13236 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)) (get!612 (getValueByKey!74 (toList!469 lt!13236) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))))

(declare-fun bs!1362 () Bool)

(assert (= bs!1362 d!5363))

(assert (=> bs!1362 m!28731))

(assert (=> bs!1362 m!28835))

(assert (=> bs!1362 m!28835))

(declare-fun m!28901 () Bool)

(assert (=> bs!1362 m!28901))

(assert (=> b!35896 d!5363))

(declare-fun d!5365 () Bool)

(declare-fun c!4109 () Bool)

(assert (=> d!5365 (= c!4109 ((_ is ValueCellFull!617) (select (arr!1179 _values!1501) #b00000000000000000000000000000000)))))

(declare-fun e!22745 () V!2003)

(assert (=> d!5365 (= (get!611 (select (arr!1179 _values!1501) #b00000000000000000000000000000000) (dynLambda!155 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)) e!22745)))

(declare-fun b!36027 () Bool)

(declare-fun get!613 (ValueCell!617 V!2003) V!2003)

(assert (=> b!36027 (= e!22745 (get!613 (select (arr!1179 _values!1501) #b00000000000000000000000000000000) (dynLambda!155 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!36028 () Bool)

(declare-fun get!614 (ValueCell!617 V!2003) V!2003)

(assert (=> b!36028 (= e!22745 (get!614 (select (arr!1179 _values!1501) #b00000000000000000000000000000000) (dynLambda!155 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!5365 c!4109) b!36027))

(assert (= (and d!5365 (not c!4109)) b!36028))

(assert (=> b!36027 m!28775))

(assert (=> b!36027 m!28777))

(declare-fun m!28903 () Bool)

(assert (=> b!36027 m!28903))

(assert (=> b!36028 m!28775))

(assert (=> b!36028 m!28777))

(declare-fun m!28905 () Bool)

(assert (=> b!36028 m!28905))

(assert (=> b!35896 d!5365))

(declare-fun d!5367 () Bool)

(declare-fun lt!13323 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!18 (List!932) (InoxSet (_ BitVec 64)))

(assert (=> d!5367 (= lt!13323 (select (content!18 Nil!929) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun e!22750 () Bool)

(assert (=> d!5367 (= lt!13323 e!22750)))

(declare-fun res!21830 () Bool)

(assert (=> d!5367 (=> (not res!21830) (not e!22750))))

(assert (=> d!5367 (= res!21830 ((_ is Cons!928) Nil!929))))

(assert (=> d!5367 (= (contains!421 Nil!929 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)) lt!13323)))

(declare-fun b!36033 () Bool)

(declare-fun e!22751 () Bool)

(assert (=> b!36033 (= e!22750 e!22751)))

(declare-fun res!21831 () Bool)

(assert (=> b!36033 (=> res!21831 e!22751)))

(assert (=> b!36033 (= res!21831 (= (h!1495 Nil!929) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36034 () Bool)

(assert (=> b!36034 (= e!22751 (contains!421 (t!3637 Nil!929) (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5367 res!21830) b!36033))

(assert (= (and b!36033 (not res!21831)) b!36034))

(declare-fun m!28907 () Bool)

(assert (=> d!5367 m!28907))

(assert (=> d!5367 m!28731))

(declare-fun m!28909 () Bool)

(assert (=> d!5367 m!28909))

(assert (=> b!36034 m!28731))

(declare-fun m!28911 () Bool)

(assert (=> b!36034 m!28911))

(assert (=> b!35946 d!5367))

(declare-fun b!36047 () Bool)

(declare-fun e!22760 () SeekEntryResult!157)

(assert (=> b!36047 (= e!22760 Undefined!157)))

(declare-fun lt!13329 () SeekEntryResult!157)

(declare-fun d!5369 () Bool)

(assert (=> d!5369 (and (or ((_ is Undefined!157) lt!13329) (not ((_ is Found!157) lt!13329)) (and (bvsge (index!2751 lt!13329) #b00000000000000000000000000000000) (bvslt (index!2751 lt!13329) (size!1279 _keys!1833)))) (or ((_ is Undefined!157) lt!13329) ((_ is Found!157) lt!13329) (not ((_ is MissingVacant!157) lt!13329)) (not (= (index!2753 lt!13329) (index!2752 lt!13276))) (and (bvsge (index!2753 lt!13329) #b00000000000000000000000000000000) (bvslt (index!2753 lt!13329) (size!1279 _keys!1833)))) (or ((_ is Undefined!157) lt!13329) (ite ((_ is Found!157) lt!13329) (= (select (arr!1178 _keys!1833) (index!2751 lt!13329)) k0!1304) (and ((_ is MissingVacant!157) lt!13329) (= (index!2753 lt!13329) (index!2752 lt!13276)) (= (select (arr!1178 _keys!1833) (index!2753 lt!13329)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!5369 (= lt!13329 e!22760)))

(declare-fun c!4118 () Bool)

(assert (=> d!5369 (= c!4118 (bvsge (x!7045 lt!13276) #b01111111111111111111111111111110))))

(declare-fun lt!13328 () (_ BitVec 64))

(assert (=> d!5369 (= lt!13328 (select (arr!1178 _keys!1833) (index!2752 lt!13276)))))

(assert (=> d!5369 (validMask!0 mask!2294)))

(assert (=> d!5369 (= (seekKeyOrZeroReturnVacant!0 (x!7045 lt!13276) (index!2752 lt!13276) (index!2752 lt!13276) k0!1304 _keys!1833 mask!2294) lt!13329)))

(declare-fun e!22758 () SeekEntryResult!157)

(declare-fun b!36048 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!36048 (= e!22758 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7045 lt!13276) #b00000000000000000000000000000001) (nextIndex!0 (index!2752 lt!13276) (bvadd (x!7045 lt!13276) #b00000000000000000000000000000001) mask!2294) (index!2752 lt!13276) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!36049 () Bool)

(declare-fun c!4116 () Bool)

(assert (=> b!36049 (= c!4116 (= lt!13328 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22759 () SeekEntryResult!157)

(assert (=> b!36049 (= e!22759 e!22758)))

(declare-fun b!36050 () Bool)

(assert (=> b!36050 (= e!22758 (MissingVacant!157 (index!2752 lt!13276)))))

(declare-fun b!36051 () Bool)

(assert (=> b!36051 (= e!22760 e!22759)))

(declare-fun c!4117 () Bool)

(assert (=> b!36051 (= c!4117 (= lt!13328 k0!1304))))

(declare-fun b!36052 () Bool)

(assert (=> b!36052 (= e!22759 (Found!157 (index!2752 lt!13276)))))

(assert (= (and d!5369 c!4118) b!36047))

(assert (= (and d!5369 (not c!4118)) b!36051))

(assert (= (and b!36051 c!4117) b!36052))

(assert (= (and b!36051 (not c!4117)) b!36049))

(assert (= (and b!36049 c!4116) b!36050))

(assert (= (and b!36049 (not c!4116)) b!36048))

(declare-fun m!28913 () Bool)

(assert (=> d!5369 m!28913))

(declare-fun m!28915 () Bool)

(assert (=> d!5369 m!28915))

(assert (=> d!5369 m!28805))

(assert (=> d!5369 m!28669))

(declare-fun m!28917 () Bool)

(assert (=> b!36048 m!28917))

(assert (=> b!36048 m!28917))

(declare-fun m!28919 () Bool)

(assert (=> b!36048 m!28919))

(assert (=> b!35930 d!5369))

(declare-fun bm!2844 () Bool)

(declare-fun call!2847 () Bool)

(assert (=> bm!2844 (= call!2847 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!36053 () Bool)

(declare-fun e!22762 () Bool)

(assert (=> b!36053 (= e!22762 call!2847)))

(declare-fun b!36054 () Bool)

(declare-fun e!22761 () Bool)

(assert (=> b!36054 (= e!22761 call!2847)))

(declare-fun d!5371 () Bool)

(declare-fun res!21832 () Bool)

(declare-fun e!22763 () Bool)

(assert (=> d!5371 (=> res!21832 e!22763)))

(assert (=> d!5371 (= res!21832 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1279 _keys!1833)))))

(assert (=> d!5371 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294) e!22763)))

(declare-fun b!36055 () Bool)

(assert (=> b!36055 (= e!22761 e!22762)))

(declare-fun lt!13330 () (_ BitVec 64))

(assert (=> b!36055 (= lt!13330 (select (arr!1178 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!13332 () Unit!798)

(assert (=> b!36055 (= lt!13332 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13330 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!36055 (arrayContainsKey!0 _keys!1833 lt!13330 #b00000000000000000000000000000000)))

(declare-fun lt!13331 () Unit!798)

(assert (=> b!36055 (= lt!13331 lt!13332)))

(declare-fun res!21833 () Bool)

(assert (=> b!36055 (= res!21833 (= (seekEntryOrOpen!0 (select (arr!1178 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1833 mask!2294) (Found!157 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!36055 (=> (not res!21833) (not e!22762))))

(declare-fun b!36056 () Bool)

(assert (=> b!36056 (= e!22763 e!22761)))

(declare-fun c!4119 () Bool)

(assert (=> b!36056 (= c!4119 (validKeyInArray!0 (select (arr!1178 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!5371 (not res!21832)) b!36056))

(assert (= (and b!36056 c!4119) b!36055))

(assert (= (and b!36056 (not c!4119)) b!36054))

(assert (= (and b!36055 res!21833) b!36053))

(assert (= (or b!36053 b!36054) bm!2844))

(declare-fun m!28921 () Bool)

(assert (=> bm!2844 m!28921))

(assert (=> b!36055 m!28891))

(declare-fun m!28923 () Bool)

(assert (=> b!36055 m!28923))

(declare-fun m!28925 () Bool)

(assert (=> b!36055 m!28925))

(assert (=> b!36055 m!28891))

(declare-fun m!28927 () Bool)

(assert (=> b!36055 m!28927))

(assert (=> b!36056 m!28891))

(assert (=> b!36056 m!28891))

(assert (=> b!36056 m!28895))

(assert (=> bm!2839 d!5371))

(declare-fun b!36081 () Bool)

(declare-fun e!22782 () ListLongMap!907)

(declare-fun call!2850 () ListLongMap!907)

(assert (=> b!36081 (= e!22782 call!2850)))

(declare-fun b!36082 () Bool)

(declare-fun e!22779 () Bool)

(declare-fun e!22780 () Bool)

(assert (=> b!36082 (= e!22779 e!22780)))

(declare-fun c!4131 () Bool)

(assert (=> b!36082 (= c!4131 (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun b!36083 () Bool)

(declare-fun e!22783 () Bool)

(assert (=> b!36083 (= e!22779 e!22783)))

(assert (=> b!36083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun res!21843 () Bool)

(declare-fun lt!13352 () ListLongMap!907)

(assert (=> b!36083 (= res!21843 (contains!420 lt!13352 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!36083 (=> (not res!21843) (not e!22783))))

(declare-fun d!5373 () Bool)

(declare-fun e!22781 () Bool)

(assert (=> d!5373 e!22781))

(declare-fun res!21844 () Bool)

(assert (=> d!5373 (=> (not res!21844) (not e!22781))))

(assert (=> d!5373 (= res!21844 (not (contains!420 lt!13352 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!22784 () ListLongMap!907)

(assert (=> d!5373 (= lt!13352 e!22784)))

(declare-fun c!4128 () Bool)

(assert (=> d!5373 (= c!4128 (bvsge #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(assert (=> d!5373 (validMask!0 mask!2294)))

(assert (=> d!5373 (= (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13352)))

(declare-fun b!36084 () Bool)

(assert (=> b!36084 (= e!22780 (= lt!13352 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1504)))))

(declare-fun b!36085 () Bool)

(assert (=> b!36085 (= e!22784 e!22782)))

(declare-fun c!4130 () Bool)

(assert (=> b!36085 (= c!4130 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36086 () Bool)

(assert (=> b!36086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(assert (=> b!36086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1280 _values!1501)))))

(assert (=> b!36086 (= e!22783 (= (apply!42 lt!13352 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)) (get!611 (select (arr!1179 _values!1501) #b00000000000000000000000000000000) (dynLambda!155 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!36087 () Bool)

(declare-fun res!21845 () Bool)

(assert (=> b!36087 (=> (not res!21845) (not e!22781))))

(assert (=> b!36087 (= res!21845 (not (contains!420 lt!13352 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!36088 () Bool)

(declare-fun lt!13351 () Unit!798)

(declare-fun lt!13347 () Unit!798)

(assert (=> b!36088 (= lt!13351 lt!13347)))

(declare-fun lt!13353 () (_ BitVec 64))

(declare-fun lt!13349 () ListLongMap!907)

(declare-fun lt!13350 () (_ BitVec 64))

(declare-fun lt!13348 () V!2003)

(assert (=> b!36088 (not (contains!420 (+!59 lt!13349 (tuple2!1337 lt!13353 lt!13348)) lt!13350))))

(declare-fun addStillNotContains!3 (ListLongMap!907 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!798)

(assert (=> b!36088 (= lt!13347 (addStillNotContains!3 lt!13349 lt!13353 lt!13348 lt!13350))))

(assert (=> b!36088 (= lt!13350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!36088 (= lt!13348 (get!611 (select (arr!1179 _values!1501) #b00000000000000000000000000000000) (dynLambda!155 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36088 (= lt!13353 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!36088 (= lt!13349 call!2850)))

(assert (=> b!36088 (= e!22782 (+!59 call!2850 (tuple2!1337 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) (get!611 (select (arr!1179 _values!1501) #b00000000000000000000000000000000) (dynLambda!155 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!36089 () Bool)

(declare-fun e!22778 () Bool)

(assert (=> b!36089 (= e!22778 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!36089 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!36090 () Bool)

(assert (=> b!36090 (= e!22781 e!22779)))

(declare-fun c!4129 () Bool)

(assert (=> b!36090 (= c!4129 e!22778)))

(declare-fun res!21842 () Bool)

(assert (=> b!36090 (=> (not res!21842) (not e!22778))))

(assert (=> b!36090 (= res!21842 (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun bm!2847 () Bool)

(assert (=> bm!2847 (= call!2850 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1504))))

(declare-fun b!36091 () Bool)

(assert (=> b!36091 (= e!22784 (ListLongMap!908 Nil!930))))

(declare-fun b!36092 () Bool)

(declare-fun isEmpty!175 (ListLongMap!907) Bool)

(assert (=> b!36092 (= e!22780 (isEmpty!175 lt!13352))))

(assert (= (and d!5373 c!4128) b!36091))

(assert (= (and d!5373 (not c!4128)) b!36085))

(assert (= (and b!36085 c!4130) b!36088))

(assert (= (and b!36085 (not c!4130)) b!36081))

(assert (= (or b!36088 b!36081) bm!2847))

(assert (= (and d!5373 res!21844) b!36087))

(assert (= (and b!36087 res!21845) b!36090))

(assert (= (and b!36090 res!21842) b!36089))

(assert (= (and b!36090 c!4129) b!36083))

(assert (= (and b!36090 (not c!4129)) b!36082))

(assert (= (and b!36083 res!21843) b!36086))

(assert (= (and b!36082 c!4131) b!36084))

(assert (= (and b!36082 (not c!4131)) b!36092))

(declare-fun b_lambda!1719 () Bool)

(assert (=> (not b_lambda!1719) (not b!36086)))

(assert (=> b!36086 t!3642))

(declare-fun b_and!2105 () Bool)

(assert (= b_and!2103 (and (=> t!3642 result!1201) b_and!2105)))

(declare-fun b_lambda!1721 () Bool)

(assert (=> (not b_lambda!1721) (not b!36088)))

(assert (=> b!36088 t!3642))

(declare-fun b_and!2107 () Bool)

(assert (= b_and!2105 (and (=> t!3642 result!1201) b_and!2107)))

(declare-fun m!28929 () Bool)

(assert (=> b!36088 m!28929))

(assert (=> b!36088 m!28731))

(assert (=> b!36088 m!28775))

(assert (=> b!36088 m!28777))

(assert (=> b!36088 m!28779))

(assert (=> b!36088 m!28777))

(declare-fun m!28931 () Bool)

(assert (=> b!36088 m!28931))

(assert (=> b!36088 m!28775))

(assert (=> b!36088 m!28931))

(declare-fun m!28933 () Bool)

(assert (=> b!36088 m!28933))

(declare-fun m!28935 () Bool)

(assert (=> b!36088 m!28935))

(declare-fun m!28937 () Bool)

(assert (=> bm!2847 m!28937))

(declare-fun m!28939 () Bool)

(assert (=> d!5373 m!28939))

(assert (=> d!5373 m!28669))

(assert (=> b!36084 m!28937))

(assert (=> b!36089 m!28731))

(assert (=> b!36089 m!28731))

(assert (=> b!36089 m!28733))

(assert (=> b!36086 m!28731))

(declare-fun m!28941 () Bool)

(assert (=> b!36086 m!28941))

(assert (=> b!36086 m!28731))

(assert (=> b!36086 m!28775))

(assert (=> b!36086 m!28777))

(assert (=> b!36086 m!28779))

(assert (=> b!36086 m!28777))

(assert (=> b!36086 m!28775))

(assert (=> b!36083 m!28731))

(assert (=> b!36083 m!28731))

(declare-fun m!28943 () Bool)

(assert (=> b!36083 m!28943))

(declare-fun m!28945 () Bool)

(assert (=> b!36087 m!28945))

(assert (=> b!36085 m!28731))

(assert (=> b!36085 m!28731))

(assert (=> b!36085 m!28733))

(declare-fun m!28947 () Bool)

(assert (=> b!36092 m!28947))

(assert (=> bm!2835 d!5373))

(assert (=> b!35945 d!5333))

(assert (=> d!5317 d!5325))

(declare-fun d!5375 () Bool)

(declare-fun e!22795 () Bool)

(assert (=> d!5375 e!22795))

(declare-fun c!4140 () Bool)

(declare-fun lt!13358 () SeekEntryResult!157)

(assert (=> d!5375 (= c!4140 (and ((_ is Intermediate!157) lt!13358) (undefined!969 lt!13358)))))

(declare-fun e!22799 () SeekEntryResult!157)

(assert (=> d!5375 (= lt!13358 e!22799)))

(declare-fun c!4138 () Bool)

(assert (=> d!5375 (= c!4138 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!13359 () (_ BitVec 64))

(assert (=> d!5375 (= lt!13359 (select (arr!1178 _keys!1833) (toIndex!0 k0!1304 mask!2294)))))

(assert (=> d!5375 (validMask!0 mask!2294)))

(assert (=> d!5375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294) lt!13358)))

(declare-fun b!36111 () Bool)

(assert (=> b!36111 (and (bvsge (index!2752 lt!13358) #b00000000000000000000000000000000) (bvslt (index!2752 lt!13358) (size!1279 _keys!1833)))))

(declare-fun res!21853 () Bool)

(assert (=> b!36111 (= res!21853 (= (select (arr!1178 _keys!1833) (index!2752 lt!13358)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22796 () Bool)

(assert (=> b!36111 (=> res!21853 e!22796)))

(declare-fun b!36112 () Bool)

(assert (=> b!36112 (and (bvsge (index!2752 lt!13358) #b00000000000000000000000000000000) (bvslt (index!2752 lt!13358) (size!1279 _keys!1833)))))

(assert (=> b!36112 (= e!22796 (= (select (arr!1178 _keys!1833) (index!2752 lt!13358)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!36113 () Bool)

(assert (=> b!36113 (= e!22795 (bvsge (x!7045 lt!13358) #b01111111111111111111111111111110))))

(declare-fun b!36114 () Bool)

(assert (=> b!36114 (= e!22799 (Intermediate!157 true (toIndex!0 k0!1304 mask!2294) #b00000000000000000000000000000000))))

(declare-fun e!22798 () SeekEntryResult!157)

(declare-fun b!36115 () Bool)

(assert (=> b!36115 (= e!22798 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!1304 mask!2294) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2294) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!36116 () Bool)

(assert (=> b!36116 (= e!22798 (Intermediate!157 false (toIndex!0 k0!1304 mask!2294) #b00000000000000000000000000000000))))

(declare-fun b!36117 () Bool)

(assert (=> b!36117 (and (bvsge (index!2752 lt!13358) #b00000000000000000000000000000000) (bvslt (index!2752 lt!13358) (size!1279 _keys!1833)))))

(declare-fun res!21852 () Bool)

(assert (=> b!36117 (= res!21852 (= (select (arr!1178 _keys!1833) (index!2752 lt!13358)) k0!1304))))

(assert (=> b!36117 (=> res!21852 e!22796)))

(declare-fun e!22797 () Bool)

(assert (=> b!36117 (= e!22797 e!22796)))

(declare-fun b!36118 () Bool)

(assert (=> b!36118 (= e!22799 e!22798)))

(declare-fun c!4139 () Bool)

(assert (=> b!36118 (= c!4139 (or (= lt!13359 k0!1304) (= (bvadd lt!13359 lt!13359) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!36119 () Bool)

(assert (=> b!36119 (= e!22795 e!22797)))

(declare-fun res!21854 () Bool)

(assert (=> b!36119 (= res!21854 (and ((_ is Intermediate!157) lt!13358) (not (undefined!969 lt!13358)) (bvslt (x!7045 lt!13358) #b01111111111111111111111111111110) (bvsge (x!7045 lt!13358) #b00000000000000000000000000000000) (bvsge (x!7045 lt!13358) #b00000000000000000000000000000000)))))

(assert (=> b!36119 (=> (not res!21854) (not e!22797))))

(assert (= (and d!5375 c!4138) b!36114))

(assert (= (and d!5375 (not c!4138)) b!36118))

(assert (= (and b!36118 c!4139) b!36116))

(assert (= (and b!36118 (not c!4139)) b!36115))

(assert (= (and d!5375 c!4140) b!36113))

(assert (= (and d!5375 (not c!4140)) b!36119))

(assert (= (and b!36119 res!21854) b!36117))

(assert (= (and b!36117 (not res!21852)) b!36111))

(assert (= (and b!36111 (not res!21853)) b!36112))

(declare-fun m!28949 () Bool)

(assert (=> b!36111 m!28949))

(assert (=> b!36117 m!28949))

(assert (=> b!36112 m!28949))

(assert (=> d!5375 m!28801))

(declare-fun m!28951 () Bool)

(assert (=> d!5375 m!28951))

(assert (=> d!5375 m!28669))

(assert (=> b!36115 m!28801))

(declare-fun m!28953 () Bool)

(assert (=> b!36115 m!28953))

(assert (=> b!36115 m!28953))

(declare-fun m!28955 () Bool)

(assert (=> b!36115 m!28955))

(assert (=> d!5321 d!5375))

(declare-fun d!5377 () Bool)

(declare-fun lt!13365 () (_ BitVec 32))

(declare-fun lt!13364 () (_ BitVec 32))

(assert (=> d!5377 (= lt!13365 (bvmul (bvxor lt!13364 (bvlshr lt!13364 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!5377 (= lt!13364 ((_ extract 31 0) (bvand (bvxor k0!1304 (bvlshr k0!1304 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!5377 (and (bvsge mask!2294 #b00000000000000000000000000000000) (let ((res!21855 (let ((h!1499 ((_ extract 31 0) (bvand (bvxor k0!1304 (bvlshr k0!1304 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7065 (bvmul (bvxor h!1499 (bvlshr h!1499 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7065 (bvlshr x!7065 #b00000000000000000000000000001101)) mask!2294))))) (and (bvslt res!21855 (bvadd mask!2294 #b00000000000000000000000000000001)) (bvsge res!21855 #b00000000000000000000000000000000))))))

(assert (=> d!5377 (= (toIndex!0 k0!1304 mask!2294) (bvand (bvxor lt!13365 (bvlshr lt!13365 #b00000000000000000000000000001101)) mask!2294))))

(assert (=> d!5321 d!5377))

(assert (=> d!5321 d!5325))

(declare-fun d!5379 () Bool)

(declare-fun res!21860 () Bool)

(declare-fun e!22804 () Bool)

(assert (=> d!5379 (=> res!21860 e!22804)))

(assert (=> d!5379 (= res!21860 (and ((_ is Cons!929) (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (= (_1!679 (h!1496 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)))))

(assert (=> d!5379 (= (containsKey!38 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304) e!22804)))

(declare-fun b!36124 () Bool)

(declare-fun e!22805 () Bool)

(assert (=> b!36124 (= e!22804 e!22805)))

(declare-fun res!21861 () Bool)

(assert (=> b!36124 (=> (not res!21861) (not e!22805))))

(assert (=> b!36124 (= res!21861 (and (or (not ((_ is Cons!929) (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) (bvsle (_1!679 (h!1496 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)) ((_ is Cons!929) (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (bvslt (_1!679 (h!1496 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)))))

(declare-fun b!36125 () Bool)

(assert (=> b!36125 (= e!22805 (containsKey!38 (t!3638 (toList!469 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) k0!1304))))

(assert (= (and d!5379 (not res!21860)) b!36124))

(assert (= (and b!36124 res!21861) b!36125))

(declare-fun m!28957 () Bool)

(assert (=> b!36125 m!28957))

(assert (=> d!5315 d!5379))

(declare-fun d!5381 () Bool)

(assert (=> d!5381 (= (apply!42 lt!13236 #b1000000000000000000000000000000000000000000000000000000000000000) (get!612 (getValueByKey!74 (toList!469 lt!13236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1363 () Bool)

(assert (= bs!1363 d!5381))

(assert (=> bs!1363 m!28819))

(assert (=> bs!1363 m!28819))

(declare-fun m!28959 () Bool)

(assert (=> bs!1363 m!28959))

(assert (=> b!35891 d!5381))

(declare-fun d!5383 () Bool)

(assert (=> d!5383 (= (apply!42 (+!59 lt!13243 (tuple2!1337 lt!13247 zeroValue!1443)) lt!13246) (get!612 (getValueByKey!74 (toList!469 (+!59 lt!13243 (tuple2!1337 lt!13247 zeroValue!1443))) lt!13246)))))

(declare-fun bs!1364 () Bool)

(assert (= bs!1364 d!5383))

(declare-fun m!28961 () Bool)

(assert (=> bs!1364 m!28961))

(assert (=> bs!1364 m!28961))

(declare-fun m!28963 () Bool)

(assert (=> bs!1364 m!28963))

(assert (=> b!35890 d!5383))

(declare-fun d!5385 () Bool)

(assert (=> d!5385 (contains!420 (+!59 lt!13251 (tuple2!1337 lt!13250 zeroValue!1443)) lt!13240)))

(declare-fun lt!13368 () Unit!798)

(declare-fun choose!223 (ListLongMap!907 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!798)

(assert (=> d!5385 (= lt!13368 (choose!223 lt!13251 lt!13250 zeroValue!1443 lt!13240))))

(assert (=> d!5385 (contains!420 lt!13251 lt!13240)))

(assert (=> d!5385 (= (addStillContains!27 lt!13251 lt!13250 zeroValue!1443 lt!13240) lt!13368)))

(declare-fun bs!1365 () Bool)

(assert (= bs!1365 d!5385))

(assert (=> bs!1365 m!28751))

(assert (=> bs!1365 m!28751))

(assert (=> bs!1365 m!28753))

(declare-fun m!28965 () Bool)

(assert (=> bs!1365 m!28965))

(declare-fun m!28967 () Bool)

(assert (=> bs!1365 m!28967))

(assert (=> b!35890 d!5385))

(declare-fun d!5387 () Bool)

(assert (=> d!5387 (= (apply!42 (+!59 lt!13244 (tuple2!1337 lt!13237 minValue!1443)) lt!13238) (get!612 (getValueByKey!74 (toList!469 (+!59 lt!13244 (tuple2!1337 lt!13237 minValue!1443))) lt!13238)))))

(declare-fun bs!1366 () Bool)

(assert (= bs!1366 d!5387))

(declare-fun m!28969 () Bool)

(assert (=> bs!1366 m!28969))

(assert (=> bs!1366 m!28969))

(declare-fun m!28971 () Bool)

(assert (=> bs!1366 m!28971))

(assert (=> b!35890 d!5387))

(declare-fun d!5389 () Bool)

(assert (=> d!5389 (= (apply!42 lt!13243 lt!13246) (get!612 (getValueByKey!74 (toList!469 lt!13243) lt!13246)))))

(declare-fun bs!1367 () Bool)

(assert (= bs!1367 d!5389))

(declare-fun m!28973 () Bool)

(assert (=> bs!1367 m!28973))

(assert (=> bs!1367 m!28973))

(declare-fun m!28975 () Bool)

(assert (=> bs!1367 m!28975))

(assert (=> b!35890 d!5389))

(assert (=> b!35890 d!5373))

(declare-fun d!5391 () Bool)

(declare-fun e!22806 () Bool)

(assert (=> d!5391 e!22806))

(declare-fun res!21862 () Bool)

(assert (=> d!5391 (=> (not res!21862) (not e!22806))))

(declare-fun lt!13372 () ListLongMap!907)

(assert (=> d!5391 (= res!21862 (contains!420 lt!13372 (_1!679 (tuple2!1337 lt!13247 zeroValue!1443))))))

(declare-fun lt!13371 () List!933)

(assert (=> d!5391 (= lt!13372 (ListLongMap!908 lt!13371))))

(declare-fun lt!13369 () Unit!798)

(declare-fun lt!13370 () Unit!798)

(assert (=> d!5391 (= lt!13369 lt!13370)))

(assert (=> d!5391 (= (getValueByKey!74 lt!13371 (_1!679 (tuple2!1337 lt!13247 zeroValue!1443))) (Some!79 (_2!679 (tuple2!1337 lt!13247 zeroValue!1443))))))

(assert (=> d!5391 (= lt!13370 (lemmaContainsTupThenGetReturnValue!19 lt!13371 (_1!679 (tuple2!1337 lt!13247 zeroValue!1443)) (_2!679 (tuple2!1337 lt!13247 zeroValue!1443))))))

(assert (=> d!5391 (= lt!13371 (insertStrictlySorted!19 (toList!469 lt!13243) (_1!679 (tuple2!1337 lt!13247 zeroValue!1443)) (_2!679 (tuple2!1337 lt!13247 zeroValue!1443))))))

(assert (=> d!5391 (= (+!59 lt!13243 (tuple2!1337 lt!13247 zeroValue!1443)) lt!13372)))

(declare-fun b!36127 () Bool)

(declare-fun res!21863 () Bool)

(assert (=> b!36127 (=> (not res!21863) (not e!22806))))

(assert (=> b!36127 (= res!21863 (= (getValueByKey!74 (toList!469 lt!13372) (_1!679 (tuple2!1337 lt!13247 zeroValue!1443))) (Some!79 (_2!679 (tuple2!1337 lt!13247 zeroValue!1443)))))))

(declare-fun b!36128 () Bool)

(assert (=> b!36128 (= e!22806 (contains!422 (toList!469 lt!13372) (tuple2!1337 lt!13247 zeroValue!1443)))))

(assert (= (and d!5391 res!21862) b!36127))

(assert (= (and b!36127 res!21863) b!36128))

(declare-fun m!28977 () Bool)

(assert (=> d!5391 m!28977))

(declare-fun m!28979 () Bool)

(assert (=> d!5391 m!28979))

(declare-fun m!28981 () Bool)

(assert (=> d!5391 m!28981))

(declare-fun m!28983 () Bool)

(assert (=> d!5391 m!28983))

(declare-fun m!28985 () Bool)

(assert (=> b!36127 m!28985))

(declare-fun m!28987 () Bool)

(assert (=> b!36128 m!28987))

(assert (=> b!35890 d!5391))

(declare-fun d!5393 () Bool)

(declare-fun e!22807 () Bool)

(assert (=> d!5393 e!22807))

(declare-fun res!21864 () Bool)

(assert (=> d!5393 (=> (not res!21864) (not e!22807))))

(declare-fun lt!13376 () ListLongMap!907)

(assert (=> d!5393 (= res!21864 (contains!420 lt!13376 (_1!679 (tuple2!1337 lt!13256 minValue!1443))))))

(declare-fun lt!13375 () List!933)

(assert (=> d!5393 (= lt!13376 (ListLongMap!908 lt!13375))))

(declare-fun lt!13373 () Unit!798)

(declare-fun lt!13374 () Unit!798)

(assert (=> d!5393 (= lt!13373 lt!13374)))

(assert (=> d!5393 (= (getValueByKey!74 lt!13375 (_1!679 (tuple2!1337 lt!13256 minValue!1443))) (Some!79 (_2!679 (tuple2!1337 lt!13256 minValue!1443))))))

(assert (=> d!5393 (= lt!13374 (lemmaContainsTupThenGetReturnValue!19 lt!13375 (_1!679 (tuple2!1337 lt!13256 minValue!1443)) (_2!679 (tuple2!1337 lt!13256 minValue!1443))))))

(assert (=> d!5393 (= lt!13375 (insertStrictlySorted!19 (toList!469 lt!13248) (_1!679 (tuple2!1337 lt!13256 minValue!1443)) (_2!679 (tuple2!1337 lt!13256 minValue!1443))))))

(assert (=> d!5393 (= (+!59 lt!13248 (tuple2!1337 lt!13256 minValue!1443)) lt!13376)))

(declare-fun b!36129 () Bool)

(declare-fun res!21865 () Bool)

(assert (=> b!36129 (=> (not res!21865) (not e!22807))))

(assert (=> b!36129 (= res!21865 (= (getValueByKey!74 (toList!469 lt!13376) (_1!679 (tuple2!1337 lt!13256 minValue!1443))) (Some!79 (_2!679 (tuple2!1337 lt!13256 minValue!1443)))))))

(declare-fun b!36130 () Bool)

(assert (=> b!36130 (= e!22807 (contains!422 (toList!469 lt!13376) (tuple2!1337 lt!13256 minValue!1443)))))

(assert (= (and d!5393 res!21864) b!36129))

(assert (= (and b!36129 res!21865) b!36130))

(declare-fun m!28989 () Bool)

(assert (=> d!5393 m!28989))

(declare-fun m!28991 () Bool)

(assert (=> d!5393 m!28991))

(declare-fun m!28993 () Bool)

(assert (=> d!5393 m!28993))

(declare-fun m!28995 () Bool)

(assert (=> d!5393 m!28995))

(declare-fun m!28997 () Bool)

(assert (=> b!36129 m!28997))

(declare-fun m!28999 () Bool)

(assert (=> b!36130 m!28999))

(assert (=> b!35890 d!5393))

(declare-fun d!5395 () Bool)

(assert (=> d!5395 (= (apply!42 (+!59 lt!13243 (tuple2!1337 lt!13247 zeroValue!1443)) lt!13246) (apply!42 lt!13243 lt!13246))))

(declare-fun lt!13379 () Unit!798)

(declare-fun choose!224 (ListLongMap!907 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!798)

(assert (=> d!5395 (= lt!13379 (choose!224 lt!13243 lt!13247 zeroValue!1443 lt!13246))))

(declare-fun e!22810 () Bool)

(assert (=> d!5395 e!22810))

(declare-fun res!21868 () Bool)

(assert (=> d!5395 (=> (not res!21868) (not e!22810))))

(assert (=> d!5395 (= res!21868 (contains!420 lt!13243 lt!13246))))

(assert (=> d!5395 (= (addApplyDifferent!27 lt!13243 lt!13247 zeroValue!1443 lt!13246) lt!13379)))

(declare-fun b!36134 () Bool)

(assert (=> b!36134 (= e!22810 (not (= lt!13246 lt!13247)))))

(assert (= (and d!5395 res!21868) b!36134))

(assert (=> d!5395 m!28757))

(declare-fun m!29001 () Bool)

(assert (=> d!5395 m!29001))

(assert (=> d!5395 m!28769))

(assert (=> d!5395 m!28757))

(assert (=> d!5395 m!28759))

(declare-fun m!29003 () Bool)

(assert (=> d!5395 m!29003))

(assert (=> b!35890 d!5395))

(declare-fun d!5397 () Bool)

(assert (=> d!5397 (= (apply!42 (+!59 lt!13248 (tuple2!1337 lt!13256 minValue!1443)) lt!13254) (apply!42 lt!13248 lt!13254))))

(declare-fun lt!13380 () Unit!798)

(assert (=> d!5397 (= lt!13380 (choose!224 lt!13248 lt!13256 minValue!1443 lt!13254))))

(declare-fun e!22811 () Bool)

(assert (=> d!5397 e!22811))

(declare-fun res!21869 () Bool)

(assert (=> d!5397 (=> (not res!21869) (not e!22811))))

(assert (=> d!5397 (= res!21869 (contains!420 lt!13248 lt!13254))))

(assert (=> d!5397 (= (addApplyDifferent!27 lt!13248 lt!13256 minValue!1443 lt!13254) lt!13380)))

(declare-fun b!36135 () Bool)

(assert (=> b!36135 (= e!22811 (not (= lt!13254 lt!13256)))))

(assert (= (and d!5397 res!21869) b!36135))

(assert (=> d!5397 m!28745))

(declare-fun m!29005 () Bool)

(assert (=> d!5397 m!29005))

(assert (=> d!5397 m!28755))

(assert (=> d!5397 m!28745))

(assert (=> d!5397 m!28763))

(declare-fun m!29007 () Bool)

(assert (=> d!5397 m!29007))

(assert (=> b!35890 d!5397))

(declare-fun d!5399 () Bool)

(declare-fun e!22812 () Bool)

(assert (=> d!5399 e!22812))

(declare-fun res!21870 () Bool)

(assert (=> d!5399 (=> (not res!21870) (not e!22812))))

(declare-fun lt!13384 () ListLongMap!907)

(assert (=> d!5399 (= res!21870 (contains!420 lt!13384 (_1!679 (tuple2!1337 lt!13250 zeroValue!1443))))))

(declare-fun lt!13383 () List!933)

(assert (=> d!5399 (= lt!13384 (ListLongMap!908 lt!13383))))

(declare-fun lt!13381 () Unit!798)

(declare-fun lt!13382 () Unit!798)

(assert (=> d!5399 (= lt!13381 lt!13382)))

(assert (=> d!5399 (= (getValueByKey!74 lt!13383 (_1!679 (tuple2!1337 lt!13250 zeroValue!1443))) (Some!79 (_2!679 (tuple2!1337 lt!13250 zeroValue!1443))))))

(assert (=> d!5399 (= lt!13382 (lemmaContainsTupThenGetReturnValue!19 lt!13383 (_1!679 (tuple2!1337 lt!13250 zeroValue!1443)) (_2!679 (tuple2!1337 lt!13250 zeroValue!1443))))))

(assert (=> d!5399 (= lt!13383 (insertStrictlySorted!19 (toList!469 lt!13251) (_1!679 (tuple2!1337 lt!13250 zeroValue!1443)) (_2!679 (tuple2!1337 lt!13250 zeroValue!1443))))))

(assert (=> d!5399 (= (+!59 lt!13251 (tuple2!1337 lt!13250 zeroValue!1443)) lt!13384)))

(declare-fun b!36136 () Bool)

(declare-fun res!21871 () Bool)

(assert (=> b!36136 (=> (not res!21871) (not e!22812))))

(assert (=> b!36136 (= res!21871 (= (getValueByKey!74 (toList!469 lt!13384) (_1!679 (tuple2!1337 lt!13250 zeroValue!1443))) (Some!79 (_2!679 (tuple2!1337 lt!13250 zeroValue!1443)))))))

(declare-fun b!36137 () Bool)

(assert (=> b!36137 (= e!22812 (contains!422 (toList!469 lt!13384) (tuple2!1337 lt!13250 zeroValue!1443)))))

(assert (= (and d!5399 res!21870) b!36136))

(assert (= (and b!36136 res!21871) b!36137))

(declare-fun m!29009 () Bool)

(assert (=> d!5399 m!29009))

(declare-fun m!29011 () Bool)

(assert (=> d!5399 m!29011))

(declare-fun m!29013 () Bool)

(assert (=> d!5399 m!29013))

(declare-fun m!29015 () Bool)

(assert (=> d!5399 m!29015))

(declare-fun m!29017 () Bool)

(assert (=> b!36136 m!29017))

(declare-fun m!29019 () Bool)

(assert (=> b!36137 m!29019))

(assert (=> b!35890 d!5399))

(declare-fun d!5401 () Bool)

(assert (=> d!5401 (= (apply!42 (+!59 lt!13248 (tuple2!1337 lt!13256 minValue!1443)) lt!13254) (get!612 (getValueByKey!74 (toList!469 (+!59 lt!13248 (tuple2!1337 lt!13256 minValue!1443))) lt!13254)))))

(declare-fun bs!1368 () Bool)

(assert (= bs!1368 d!5401))

(declare-fun m!29021 () Bool)

(assert (=> bs!1368 m!29021))

(assert (=> bs!1368 m!29021))

(declare-fun m!29023 () Bool)

(assert (=> bs!1368 m!29023))

(assert (=> b!35890 d!5401))

(declare-fun d!5403 () Bool)

(declare-fun e!22813 () Bool)

(assert (=> d!5403 e!22813))

(declare-fun res!21872 () Bool)

(assert (=> d!5403 (=> (not res!21872) (not e!22813))))

(declare-fun lt!13388 () ListLongMap!907)

(assert (=> d!5403 (= res!21872 (contains!420 lt!13388 (_1!679 (tuple2!1337 lt!13237 minValue!1443))))))

(declare-fun lt!13387 () List!933)

(assert (=> d!5403 (= lt!13388 (ListLongMap!908 lt!13387))))

(declare-fun lt!13385 () Unit!798)

(declare-fun lt!13386 () Unit!798)

(assert (=> d!5403 (= lt!13385 lt!13386)))

(assert (=> d!5403 (= (getValueByKey!74 lt!13387 (_1!679 (tuple2!1337 lt!13237 minValue!1443))) (Some!79 (_2!679 (tuple2!1337 lt!13237 minValue!1443))))))

(assert (=> d!5403 (= lt!13386 (lemmaContainsTupThenGetReturnValue!19 lt!13387 (_1!679 (tuple2!1337 lt!13237 minValue!1443)) (_2!679 (tuple2!1337 lt!13237 minValue!1443))))))

(assert (=> d!5403 (= lt!13387 (insertStrictlySorted!19 (toList!469 lt!13244) (_1!679 (tuple2!1337 lt!13237 minValue!1443)) (_2!679 (tuple2!1337 lt!13237 minValue!1443))))))

(assert (=> d!5403 (= (+!59 lt!13244 (tuple2!1337 lt!13237 minValue!1443)) lt!13388)))

(declare-fun b!36138 () Bool)

(declare-fun res!21873 () Bool)

(assert (=> b!36138 (=> (not res!21873) (not e!22813))))

(assert (=> b!36138 (= res!21873 (= (getValueByKey!74 (toList!469 lt!13388) (_1!679 (tuple2!1337 lt!13237 minValue!1443))) (Some!79 (_2!679 (tuple2!1337 lt!13237 minValue!1443)))))))

(declare-fun b!36139 () Bool)

(assert (=> b!36139 (= e!22813 (contains!422 (toList!469 lt!13388) (tuple2!1337 lt!13237 minValue!1443)))))

(assert (= (and d!5403 res!21872) b!36138))

(assert (= (and b!36138 res!21873) b!36139))

(declare-fun m!29025 () Bool)

(assert (=> d!5403 m!29025))

(declare-fun m!29027 () Bool)

(assert (=> d!5403 m!29027))

(declare-fun m!29029 () Bool)

(assert (=> d!5403 m!29029))

(declare-fun m!29031 () Bool)

(assert (=> d!5403 m!29031))

(declare-fun m!29033 () Bool)

(assert (=> b!36138 m!29033))

(declare-fun m!29035 () Bool)

(assert (=> b!36139 m!29035))

(assert (=> b!35890 d!5403))

(declare-fun d!5405 () Bool)

(declare-fun e!22815 () Bool)

(assert (=> d!5405 e!22815))

(declare-fun res!21874 () Bool)

(assert (=> d!5405 (=> res!21874 e!22815)))

(declare-fun lt!13391 () Bool)

(assert (=> d!5405 (= res!21874 (not lt!13391))))

(declare-fun lt!13389 () Bool)

(assert (=> d!5405 (= lt!13391 lt!13389)))

(declare-fun lt!13390 () Unit!798)

(declare-fun e!22814 () Unit!798)

(assert (=> d!5405 (= lt!13390 e!22814)))

(declare-fun c!4141 () Bool)

(assert (=> d!5405 (= c!4141 lt!13389)))

(assert (=> d!5405 (= lt!13389 (containsKey!38 (toList!469 (+!59 lt!13251 (tuple2!1337 lt!13250 zeroValue!1443))) lt!13240))))

(assert (=> d!5405 (= (contains!420 (+!59 lt!13251 (tuple2!1337 lt!13250 zeroValue!1443)) lt!13240) lt!13391)))

(declare-fun b!36140 () Bool)

(declare-fun lt!13392 () Unit!798)

(assert (=> b!36140 (= e!22814 lt!13392)))

(assert (=> b!36140 (= lt!13392 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!469 (+!59 lt!13251 (tuple2!1337 lt!13250 zeroValue!1443))) lt!13240))))

(assert (=> b!36140 (isDefined!36 (getValueByKey!74 (toList!469 (+!59 lt!13251 (tuple2!1337 lt!13250 zeroValue!1443))) lt!13240))))

(declare-fun b!36141 () Bool)

(declare-fun Unit!805 () Unit!798)

(assert (=> b!36141 (= e!22814 Unit!805)))

(declare-fun b!36142 () Bool)

(assert (=> b!36142 (= e!22815 (isDefined!36 (getValueByKey!74 (toList!469 (+!59 lt!13251 (tuple2!1337 lt!13250 zeroValue!1443))) lt!13240)))))

(assert (= (and d!5405 c!4141) b!36140))

(assert (= (and d!5405 (not c!4141)) b!36141))

(assert (= (and d!5405 (not res!21874)) b!36142))

(declare-fun m!29037 () Bool)

(assert (=> d!5405 m!29037))

(declare-fun m!29039 () Bool)

(assert (=> b!36140 m!29039))

(declare-fun m!29041 () Bool)

(assert (=> b!36140 m!29041))

(assert (=> b!36140 m!29041))

(declare-fun m!29043 () Bool)

(assert (=> b!36140 m!29043))

(assert (=> b!36142 m!29041))

(assert (=> b!36142 m!29041))

(assert (=> b!36142 m!29043))

(assert (=> b!35890 d!5405))

(declare-fun d!5407 () Bool)

(assert (=> d!5407 (= (apply!42 lt!13244 lt!13238) (get!612 (getValueByKey!74 (toList!469 lt!13244) lt!13238)))))

(declare-fun bs!1369 () Bool)

(assert (= bs!1369 d!5407))

(declare-fun m!29045 () Bool)

(assert (=> bs!1369 m!29045))

(assert (=> bs!1369 m!29045))

(declare-fun m!29047 () Bool)

(assert (=> bs!1369 m!29047))

(assert (=> b!35890 d!5407))

(declare-fun d!5409 () Bool)

(assert (=> d!5409 (= (apply!42 lt!13248 lt!13254) (get!612 (getValueByKey!74 (toList!469 lt!13248) lt!13254)))))

(declare-fun bs!1370 () Bool)

(assert (= bs!1370 d!5409))

(declare-fun m!29049 () Bool)

(assert (=> bs!1370 m!29049))

(assert (=> bs!1370 m!29049))

(declare-fun m!29051 () Bool)

(assert (=> bs!1370 m!29051))

(assert (=> b!35890 d!5409))

(declare-fun d!5411 () Bool)

(assert (=> d!5411 (= (apply!42 (+!59 lt!13244 (tuple2!1337 lt!13237 minValue!1443)) lt!13238) (apply!42 lt!13244 lt!13238))))

(declare-fun lt!13393 () Unit!798)

(assert (=> d!5411 (= lt!13393 (choose!224 lt!13244 lt!13237 minValue!1443 lt!13238))))

(declare-fun e!22816 () Bool)

(assert (=> d!5411 e!22816))

(declare-fun res!21875 () Bool)

(assert (=> d!5411 (=> (not res!21875) (not e!22816))))

(assert (=> d!5411 (= res!21875 (contains!420 lt!13244 lt!13238))))

(assert (=> d!5411 (= (addApplyDifferent!27 lt!13244 lt!13237 minValue!1443 lt!13238) lt!13393)))

(declare-fun b!36143 () Bool)

(assert (=> b!36143 (= e!22816 (not (= lt!13238 lt!13237)))))

(assert (= (and d!5411 res!21875) b!36143))

(assert (=> d!5411 m!28747))

(declare-fun m!29053 () Bool)

(assert (=> d!5411 m!29053))

(assert (=> d!5411 m!28743))

(assert (=> d!5411 m!28747))

(assert (=> d!5411 m!28749))

(declare-fun m!29055 () Bool)

(assert (=> d!5411 m!29055))

(assert (=> b!35890 d!5411))

(declare-fun condMapEmpty!2015 () Bool)

(declare-fun mapDefault!2015 () ValueCell!617)

(assert (=> mapNonEmpty!2014 (= condMapEmpty!2015 (= mapRest!2014 ((as const (Array (_ BitVec 32) ValueCell!617)) mapDefault!2015)))))

(declare-fun e!22818 () Bool)

(declare-fun mapRes!2015 () Bool)

(assert (=> mapNonEmpty!2014 (= tp!5299 (and e!22818 mapRes!2015))))

(declare-fun b!36144 () Bool)

(declare-fun e!22817 () Bool)

(assert (=> b!36144 (= e!22817 tp_is_empty!1633)))

(declare-fun mapIsEmpty!2015 () Bool)

(assert (=> mapIsEmpty!2015 mapRes!2015))

(declare-fun mapNonEmpty!2015 () Bool)

(declare-fun tp!5300 () Bool)

(assert (=> mapNonEmpty!2015 (= mapRes!2015 (and tp!5300 e!22817))))

(declare-fun mapKey!2015 () (_ BitVec 32))

(declare-fun mapRest!2015 () (Array (_ BitVec 32) ValueCell!617))

(declare-fun mapValue!2015 () ValueCell!617)

(assert (=> mapNonEmpty!2015 (= mapRest!2014 (store mapRest!2015 mapKey!2015 mapValue!2015))))

(declare-fun b!36145 () Bool)

(assert (=> b!36145 (= e!22818 tp_is_empty!1633)))

(assert (= (and mapNonEmpty!2014 condMapEmpty!2015) mapIsEmpty!2015))

(assert (= (and mapNonEmpty!2014 (not condMapEmpty!2015)) mapNonEmpty!2015))

(assert (= (and mapNonEmpty!2015 ((_ is ValueCellFull!617) mapValue!2015)) b!36144))

(assert (= (and mapNonEmpty!2014 ((_ is ValueCellFull!617) mapDefault!2015)) b!36145))

(declare-fun m!29057 () Bool)

(assert (=> mapNonEmpty!2015 m!29057))

(declare-fun b_lambda!1723 () Bool)

(assert (= b_lambda!1719 (or (and start!4576 b_free!1279) b_lambda!1723)))

(declare-fun b_lambda!1725 () Bool)

(assert (= b_lambda!1721 (or (and start!4576 b_free!1279) b_lambda!1725)))

(check-sat (not b!36087) (not d!5409) (not d!5405) (not d!5375) (not b!35982) (not b!36028) (not b!36048) (not d!5369) (not d!5351) (not b!36115) (not d!5389) (not b!36085) (not d!5387) (not b!35994) (not d!5345) (not b!36136) (not b!36019) (not d!5391) (not d!5411) (not d!5363) (not b!35990) (not b!36084) (not b!36018) (not b!35989) (not b!36055) (not b!35997) (not b!36089) (not mapNonEmpty!2015) (not b_next!1279) (not b!35991) (not b!35995) (not d!5381) (not d!5367) b_and!2107 (not d!5383) (not d!5357) (not b!36027) (not b!35969) (not d!5397) (not bm!2847) (not b!36022) (not b!36014) (not b!36138) (not d!5395) (not d!5403) (not b!36083) (not d!5373) tp_is_empty!1633 (not d!5353) (not b!36017) (not b!36125) (not b!36086) (not b!35980) (not b!36034) (not b!36142) (not b_lambda!1725) (not bm!2844) (not d!5349) (not d!5385) (not b!36128) (not d!5347) (not b!36140) (not d!5401) (not d!5337) (not d!5343) (not d!5335) (not b!36130) (not b!35964) (not b_lambda!1723) (not bm!2843) (not b!35984) (not b!36092) (not d!5393) (not d!5399) (not b!35993) (not b!36129) (not b!36139) (not b!36137) (not d!5407) (not b!36127) (not b!36056) (not b!35966) (not d!5339) (not b!36088) (not b_lambda!1717))
(check-sat b_and!2107 (not b_next!1279))
