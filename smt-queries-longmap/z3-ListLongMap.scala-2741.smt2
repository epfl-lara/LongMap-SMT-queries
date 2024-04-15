; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40250 () Bool)

(assert start!40250)

(declare-fun b_free!10525 () Bool)

(declare-fun b_next!10525 () Bool)

(assert (=> start!40250 (= b_free!10525 (not b_next!10525))))

(declare-fun tp!37113 () Bool)

(declare-fun b_and!18467 () Bool)

(assert (=> start!40250 (= tp!37113 b_and!18467)))

(declare-fun b!441806 () Bool)

(declare-fun res!261702 () Bool)

(declare-fun e!260040 () Bool)

(assert (=> b!441806 (=> (not res!261702) (not e!260040))))

(declare-datatypes ((array!27179 0))(
  ( (array!27180 (arr!13039 (Array (_ BitVec 32) (_ BitVec 64))) (size!13392 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27179)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16683 0))(
  ( (V!16684 (val!5886 Int)) )
))
(declare-datatypes ((ValueCell!5498 0))(
  ( (ValueCellFull!5498 (v!8127 V!16683)) (EmptyCell!5498) )
))
(declare-datatypes ((array!27181 0))(
  ( (array!27182 (arr!13040 (Array (_ BitVec 32) ValueCell!5498)) (size!13393 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27181)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!441806 (= res!261702 (and (= (size!13393 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13392 _keys!709) (size!13393 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441807 () Bool)

(declare-fun res!261696 () Bool)

(assert (=> b!441807 (=> (not res!261696) (not e!260040))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441807 (= res!261696 (validKeyInArray!0 k0!794))))

(declare-fun b!441808 () Bool)

(declare-fun e!260042 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!441808 (= e!260042 (not (not (validKeyInArray!0 (select (arr!13039 _keys!709) from!863)))))))

(declare-fun e!260039 () Bool)

(assert (=> b!441808 e!260039))

(declare-fun c!55728 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441808 (= c!55728 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!16683)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16683)

(declare-datatypes ((Unit!13111 0))(
  ( (Unit!13112) )
))
(declare-fun lt!202842 () Unit!13111)

(declare-fun v!412 () V!16683)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!685 (array!27179 array!27181 (_ BitVec 32) (_ BitVec 32) V!16683 V!16683 (_ BitVec 32) (_ BitVec 64) V!16683 (_ BitVec 32) Int) Unit!13111)

(assert (=> b!441808 (= lt!202842 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!685 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441809 () Bool)

(declare-fun e!260041 () Bool)

(declare-fun e!260038 () Bool)

(declare-fun mapRes!19146 () Bool)

(assert (=> b!441809 (= e!260041 (and e!260038 mapRes!19146))))

(declare-fun condMapEmpty!19146 () Bool)

(declare-fun mapDefault!19146 () ValueCell!5498)

(assert (=> b!441809 (= condMapEmpty!19146 (= (arr!13040 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5498)) mapDefault!19146)))))

(declare-fun b!441810 () Bool)

(declare-fun res!261691 () Bool)

(declare-fun e!260036 () Bool)

(assert (=> b!441810 (=> (not res!261691) (not e!260036))))

(assert (=> b!441810 (= res!261691 (bvsle from!863 i!563))))

(declare-fun b!441811 () Bool)

(declare-fun res!261692 () Bool)

(assert (=> b!441811 (=> (not res!261692) (not e!260040))))

(declare-fun arrayContainsKey!0 (array!27179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441811 (= res!261692 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441812 () Bool)

(declare-fun res!261697 () Bool)

(assert (=> b!441812 (=> (not res!261697) (not e!260040))))

(declare-datatypes ((List!7828 0))(
  ( (Nil!7825) (Cons!7824 (h!8680 (_ BitVec 64)) (t!13575 List!7828)) )
))
(declare-fun arrayNoDuplicates!0 (array!27179 (_ BitVec 32) List!7828) Bool)

(assert (=> b!441812 (= res!261697 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7825))))

(declare-fun b!441813 () Bool)

(assert (=> b!441813 (= e!260036 e!260042)))

(declare-fun res!261699 () Bool)

(assert (=> b!441813 (=> (not res!261699) (not e!260042))))

(assert (=> b!441813 (= res!261699 (= from!863 i!563))))

(declare-fun lt!202844 () array!27179)

(declare-fun lt!202843 () array!27181)

(declare-datatypes ((tuple2!7840 0))(
  ( (tuple2!7841 (_1!3931 (_ BitVec 64)) (_2!3931 V!16683)) )
))
(declare-datatypes ((List!7829 0))(
  ( (Nil!7826) (Cons!7825 (h!8681 tuple2!7840) (t!13576 List!7829)) )
))
(declare-datatypes ((ListLongMap!6743 0))(
  ( (ListLongMap!6744 (toList!3387 List!7829)) )
))
(declare-fun lt!202841 () ListLongMap!6743)

(declare-fun getCurrentListMapNoExtraKeys!1586 (array!27179 array!27181 (_ BitVec 32) (_ BitVec 32) V!16683 V!16683 (_ BitVec 32) Int) ListLongMap!6743)

(assert (=> b!441813 (= lt!202841 (getCurrentListMapNoExtraKeys!1586 lt!202844 lt!202843 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441813 (= lt!202843 (array!27182 (store (arr!13040 _values!549) i!563 (ValueCellFull!5498 v!412)) (size!13393 _values!549)))))

(declare-fun lt!202840 () ListLongMap!6743)

(assert (=> b!441813 (= lt!202840 (getCurrentListMapNoExtraKeys!1586 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441814 () Bool)

(declare-fun res!261693 () Bool)

(assert (=> b!441814 (=> (not res!261693) (not e!260040))))

(assert (=> b!441814 (= res!261693 (or (= (select (arr!13039 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13039 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441815 () Bool)

(declare-fun res!261698 () Bool)

(assert (=> b!441815 (=> (not res!261698) (not e!260040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441815 (= res!261698 (validMask!0 mask!1025))))

(declare-fun b!441816 () Bool)

(declare-fun res!261701 () Bool)

(assert (=> b!441816 (=> (not res!261701) (not e!260040))))

(assert (=> b!441816 (= res!261701 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13392 _keys!709))))))

(declare-fun bm!29493 () Bool)

(declare-fun call!29497 () ListLongMap!6743)

(assert (=> bm!29493 (= call!29497 (getCurrentListMapNoExtraKeys!1586 (ite c!55728 lt!202844 _keys!709) (ite c!55728 lt!202843 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!261694 () Bool)

(assert (=> start!40250 (=> (not res!261694) (not e!260040))))

(assert (=> start!40250 (= res!261694 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13392 _keys!709))))))

(assert (=> start!40250 e!260040))

(declare-fun tp_is_empty!11683 () Bool)

(assert (=> start!40250 tp_is_empty!11683))

(assert (=> start!40250 tp!37113))

(assert (=> start!40250 true))

(declare-fun array_inv!9508 (array!27181) Bool)

(assert (=> start!40250 (and (array_inv!9508 _values!549) e!260041)))

(declare-fun array_inv!9509 (array!27179) Bool)

(assert (=> start!40250 (array_inv!9509 _keys!709)))

(declare-fun call!29496 () ListLongMap!6743)

(declare-fun b!441817 () Bool)

(declare-fun +!1547 (ListLongMap!6743 tuple2!7840) ListLongMap!6743)

(assert (=> b!441817 (= e!260039 (= call!29497 (+!1547 call!29496 (tuple2!7841 k0!794 v!412))))))

(declare-fun b!441818 () Bool)

(declare-fun res!261700 () Bool)

(assert (=> b!441818 (=> (not res!261700) (not e!260036))))

(assert (=> b!441818 (= res!261700 (arrayNoDuplicates!0 lt!202844 #b00000000000000000000000000000000 Nil!7825))))

(declare-fun b!441819 () Bool)

(assert (=> b!441819 (= e!260039 (= call!29496 call!29497))))

(declare-fun mapNonEmpty!19146 () Bool)

(declare-fun tp!37112 () Bool)

(declare-fun e!260043 () Bool)

(assert (=> mapNonEmpty!19146 (= mapRes!19146 (and tp!37112 e!260043))))

(declare-fun mapRest!19146 () (Array (_ BitVec 32) ValueCell!5498))

(declare-fun mapValue!19146 () ValueCell!5498)

(declare-fun mapKey!19146 () (_ BitVec 32))

(assert (=> mapNonEmpty!19146 (= (arr!13040 _values!549) (store mapRest!19146 mapKey!19146 mapValue!19146))))

(declare-fun b!441820 () Bool)

(assert (=> b!441820 (= e!260040 e!260036)))

(declare-fun res!261695 () Bool)

(assert (=> b!441820 (=> (not res!261695) (not e!260036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27179 (_ BitVec 32)) Bool)

(assert (=> b!441820 (= res!261695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202844 mask!1025))))

(assert (=> b!441820 (= lt!202844 (array!27180 (store (arr!13039 _keys!709) i!563 k0!794) (size!13392 _keys!709)))))

(declare-fun bm!29494 () Bool)

(assert (=> bm!29494 (= call!29496 (getCurrentListMapNoExtraKeys!1586 (ite c!55728 _keys!709 lt!202844) (ite c!55728 _values!549 lt!202843) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441821 () Bool)

(declare-fun res!261690 () Bool)

(assert (=> b!441821 (=> (not res!261690) (not e!260040))))

(assert (=> b!441821 (= res!261690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441822 () Bool)

(assert (=> b!441822 (= e!260038 tp_is_empty!11683)))

(declare-fun b!441823 () Bool)

(assert (=> b!441823 (= e!260043 tp_is_empty!11683)))

(declare-fun mapIsEmpty!19146 () Bool)

(assert (=> mapIsEmpty!19146 mapRes!19146))

(assert (= (and start!40250 res!261694) b!441815))

(assert (= (and b!441815 res!261698) b!441806))

(assert (= (and b!441806 res!261702) b!441821))

(assert (= (and b!441821 res!261690) b!441812))

(assert (= (and b!441812 res!261697) b!441816))

(assert (= (and b!441816 res!261701) b!441807))

(assert (= (and b!441807 res!261696) b!441814))

(assert (= (and b!441814 res!261693) b!441811))

(assert (= (and b!441811 res!261692) b!441820))

(assert (= (and b!441820 res!261695) b!441818))

(assert (= (and b!441818 res!261700) b!441810))

(assert (= (and b!441810 res!261691) b!441813))

(assert (= (and b!441813 res!261699) b!441808))

(assert (= (and b!441808 c!55728) b!441817))

(assert (= (and b!441808 (not c!55728)) b!441819))

(assert (= (or b!441817 b!441819) bm!29493))

(assert (= (or b!441817 b!441819) bm!29494))

(assert (= (and b!441809 condMapEmpty!19146) mapIsEmpty!19146))

(assert (= (and b!441809 (not condMapEmpty!19146)) mapNonEmpty!19146))

(get-info :version)

(assert (= (and mapNonEmpty!19146 ((_ is ValueCellFull!5498) mapValue!19146)) b!441823))

(assert (= (and b!441809 ((_ is ValueCellFull!5498) mapDefault!19146)) b!441822))

(assert (= start!40250 b!441809))

(declare-fun m!428025 () Bool)

(assert (=> b!441815 m!428025))

(declare-fun m!428027 () Bool)

(assert (=> start!40250 m!428027))

(declare-fun m!428029 () Bool)

(assert (=> start!40250 m!428029))

(declare-fun m!428031 () Bool)

(assert (=> b!441820 m!428031))

(declare-fun m!428033 () Bool)

(assert (=> b!441820 m!428033))

(declare-fun m!428035 () Bool)

(assert (=> b!441813 m!428035))

(declare-fun m!428037 () Bool)

(assert (=> b!441813 m!428037))

(declare-fun m!428039 () Bool)

(assert (=> b!441813 m!428039))

(declare-fun m!428041 () Bool)

(assert (=> b!441818 m!428041))

(declare-fun m!428043 () Bool)

(assert (=> mapNonEmpty!19146 m!428043))

(declare-fun m!428045 () Bool)

(assert (=> bm!29493 m!428045))

(declare-fun m!428047 () Bool)

(assert (=> b!441821 m!428047))

(declare-fun m!428049 () Bool)

(assert (=> b!441807 m!428049))

(declare-fun m!428051 () Bool)

(assert (=> b!441812 m!428051))

(declare-fun m!428053 () Bool)

(assert (=> bm!29494 m!428053))

(declare-fun m!428055 () Bool)

(assert (=> b!441811 m!428055))

(declare-fun m!428057 () Bool)

(assert (=> b!441817 m!428057))

(declare-fun m!428059 () Bool)

(assert (=> b!441808 m!428059))

(assert (=> b!441808 m!428059))

(declare-fun m!428061 () Bool)

(assert (=> b!441808 m!428061))

(declare-fun m!428063 () Bool)

(assert (=> b!441808 m!428063))

(declare-fun m!428065 () Bool)

(assert (=> b!441814 m!428065))

(check-sat (not b_next!10525) (not bm!29494) (not b!441820) (not start!40250) (not bm!29493) (not b!441813) (not b!441821) tp_is_empty!11683 (not b!441817) (not b!441807) b_and!18467 (not b!441812) (not mapNonEmpty!19146) (not b!441818) (not b!441815) (not b!441808) (not b!441811))
(check-sat b_and!18467 (not b_next!10525))
(get-model)

(declare-fun d!73825 () Bool)

(assert (=> d!73825 (= (validKeyInArray!0 (select (arr!13039 _keys!709) from!863)) (and (not (= (select (arr!13039 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13039 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!441808 d!73825))

(declare-fun bm!29511 () Bool)

(declare-fun call!29514 () ListLongMap!6743)

(assert (=> bm!29511 (= call!29514 (getCurrentListMapNoExtraKeys!1586 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441938 () Bool)

(declare-fun e!260097 () Bool)

(declare-fun e!260096 () Bool)

(assert (=> b!441938 (= e!260097 e!260096)))

(declare-fun c!55737 () Bool)

(assert (=> b!441938 (= c!55737 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun call!29515 () ListLongMap!6743)

(declare-fun b!441939 () Bool)

(assert (=> b!441939 (= e!260096 (= call!29515 (+!1547 call!29514 (tuple2!7841 k0!794 v!412))))))

(declare-fun bm!29512 () Bool)

(assert (=> bm!29512 (= call!29515 (getCurrentListMapNoExtraKeys!1586 (array!27180 (store (arr!13039 _keys!709) i!563 k0!794) (size!13392 _keys!709)) (array!27182 (store (arr!13040 _values!549) i!563 (ValueCellFull!5498 v!412)) (size!13393 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun d!73827 () Bool)

(assert (=> d!73827 e!260097))

(declare-fun res!261783 () Bool)

(assert (=> d!73827 (=> (not res!261783) (not e!260097))))

(assert (=> d!73827 (= res!261783 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13392 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13393 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13392 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13393 _values!549))))))))

(declare-fun lt!202877 () Unit!13111)

(declare-fun choose!1331 (array!27179 array!27181 (_ BitVec 32) (_ BitVec 32) V!16683 V!16683 (_ BitVec 32) (_ BitVec 64) V!16683 (_ BitVec 32) Int) Unit!13111)

(assert (=> d!73827 (= lt!202877 (choose!1331 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!73827 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13392 _keys!709)))))

(assert (=> d!73827 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!685 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!202877)))

(declare-fun b!441940 () Bool)

(assert (=> b!441940 (= e!260096 (= call!29515 call!29514))))

(assert (= (and d!73827 res!261783) b!441938))

(assert (= (and b!441938 c!55737) b!441939))

(assert (= (and b!441938 (not c!55737)) b!441940))

(assert (= (or b!441939 b!441940) bm!29511))

(assert (= (or b!441939 b!441940) bm!29512))

(declare-fun m!428151 () Bool)

(assert (=> bm!29511 m!428151))

(declare-fun m!428153 () Bool)

(assert (=> b!441939 m!428153))

(assert (=> bm!29512 m!428033))

(assert (=> bm!29512 m!428037))

(declare-fun m!428155 () Bool)

(assert (=> bm!29512 m!428155))

(declare-fun m!428157 () Bool)

(assert (=> d!73827 m!428157))

(assert (=> b!441808 d!73827))

(declare-fun b!441951 () Bool)

(declare-fun e!260109 () Bool)

(declare-fun call!29518 () Bool)

(assert (=> b!441951 (= e!260109 call!29518)))

(declare-fun b!441952 () Bool)

(declare-fun e!260108 () Bool)

(assert (=> b!441952 (= e!260108 e!260109)))

(declare-fun c!55740 () Bool)

(assert (=> b!441952 (= c!55740 (validKeyInArray!0 (select (arr!13039 lt!202844) #b00000000000000000000000000000000)))))

(declare-fun bm!29515 () Bool)

(assert (=> bm!29515 (= call!29518 (arrayNoDuplicates!0 lt!202844 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55740 (Cons!7824 (select (arr!13039 lt!202844) #b00000000000000000000000000000000) Nil!7825) Nil!7825)))))

(declare-fun b!441953 () Bool)

(declare-fun e!260107 () Bool)

(declare-fun contains!2474 (List!7828 (_ BitVec 64)) Bool)

(assert (=> b!441953 (= e!260107 (contains!2474 Nil!7825 (select (arr!13039 lt!202844) #b00000000000000000000000000000000)))))

(declare-fun d!73829 () Bool)

(declare-fun res!261790 () Bool)

(declare-fun e!260106 () Bool)

(assert (=> d!73829 (=> res!261790 e!260106)))

(assert (=> d!73829 (= res!261790 (bvsge #b00000000000000000000000000000000 (size!13392 lt!202844)))))

(assert (=> d!73829 (= (arrayNoDuplicates!0 lt!202844 #b00000000000000000000000000000000 Nil!7825) e!260106)))

(declare-fun b!441954 () Bool)

(assert (=> b!441954 (= e!260109 call!29518)))

(declare-fun b!441955 () Bool)

(assert (=> b!441955 (= e!260106 e!260108)))

(declare-fun res!261792 () Bool)

(assert (=> b!441955 (=> (not res!261792) (not e!260108))))

(assert (=> b!441955 (= res!261792 (not e!260107))))

(declare-fun res!261791 () Bool)

(assert (=> b!441955 (=> (not res!261791) (not e!260107))))

(assert (=> b!441955 (= res!261791 (validKeyInArray!0 (select (arr!13039 lt!202844) #b00000000000000000000000000000000)))))

(assert (= (and d!73829 (not res!261790)) b!441955))

(assert (= (and b!441955 res!261791) b!441953))

(assert (= (and b!441955 res!261792) b!441952))

(assert (= (and b!441952 c!55740) b!441954))

(assert (= (and b!441952 (not c!55740)) b!441951))

(assert (= (or b!441954 b!441951) bm!29515))

(declare-fun m!428159 () Bool)

(assert (=> b!441952 m!428159))

(assert (=> b!441952 m!428159))

(declare-fun m!428161 () Bool)

(assert (=> b!441952 m!428161))

(assert (=> bm!29515 m!428159))

(declare-fun m!428163 () Bool)

(assert (=> bm!29515 m!428163))

(assert (=> b!441953 m!428159))

(assert (=> b!441953 m!428159))

(declare-fun m!428165 () Bool)

(assert (=> b!441953 m!428165))

(assert (=> b!441955 m!428159))

(assert (=> b!441955 m!428159))

(assert (=> b!441955 m!428161))

(assert (=> b!441818 d!73829))

(declare-fun d!73831 () Bool)

(assert (=> d!73831 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!441807 d!73831))

(declare-fun d!73833 () Bool)

(assert (=> d!73833 (= (array_inv!9508 _values!549) (bvsge (size!13393 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40250 d!73833))

(declare-fun d!73835 () Bool)

(assert (=> d!73835 (= (array_inv!9509 _keys!709) (bvsge (size!13392 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40250 d!73835))

(declare-fun d!73837 () Bool)

(declare-fun e!260112 () Bool)

(assert (=> d!73837 e!260112))

(declare-fun res!261798 () Bool)

(assert (=> d!73837 (=> (not res!261798) (not e!260112))))

(declare-fun lt!202886 () ListLongMap!6743)

(declare-fun contains!2475 (ListLongMap!6743 (_ BitVec 64)) Bool)

(assert (=> d!73837 (= res!261798 (contains!2475 lt!202886 (_1!3931 (tuple2!7841 k0!794 v!412))))))

(declare-fun lt!202888 () List!7829)

(assert (=> d!73837 (= lt!202886 (ListLongMap!6744 lt!202888))))

(declare-fun lt!202887 () Unit!13111)

(declare-fun lt!202889 () Unit!13111)

(assert (=> d!73837 (= lt!202887 lt!202889)))

(declare-datatypes ((Option!371 0))(
  ( (Some!370 (v!8133 V!16683)) (None!369) )
))
(declare-fun getValueByKey!365 (List!7829 (_ BitVec 64)) Option!371)

(assert (=> d!73837 (= (getValueByKey!365 lt!202888 (_1!3931 (tuple2!7841 k0!794 v!412))) (Some!370 (_2!3931 (tuple2!7841 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!190 (List!7829 (_ BitVec 64) V!16683) Unit!13111)

(assert (=> d!73837 (= lt!202889 (lemmaContainsTupThenGetReturnValue!190 lt!202888 (_1!3931 (tuple2!7841 k0!794 v!412)) (_2!3931 (tuple2!7841 k0!794 v!412))))))

(declare-fun insertStrictlySorted!193 (List!7829 (_ BitVec 64) V!16683) List!7829)

(assert (=> d!73837 (= lt!202888 (insertStrictlySorted!193 (toList!3387 call!29496) (_1!3931 (tuple2!7841 k0!794 v!412)) (_2!3931 (tuple2!7841 k0!794 v!412))))))

(assert (=> d!73837 (= (+!1547 call!29496 (tuple2!7841 k0!794 v!412)) lt!202886)))

(declare-fun b!441960 () Bool)

(declare-fun res!261797 () Bool)

(assert (=> b!441960 (=> (not res!261797) (not e!260112))))

(assert (=> b!441960 (= res!261797 (= (getValueByKey!365 (toList!3387 lt!202886) (_1!3931 (tuple2!7841 k0!794 v!412))) (Some!370 (_2!3931 (tuple2!7841 k0!794 v!412)))))))

(declare-fun b!441961 () Bool)

(declare-fun contains!2476 (List!7829 tuple2!7840) Bool)

(assert (=> b!441961 (= e!260112 (contains!2476 (toList!3387 lt!202886) (tuple2!7841 k0!794 v!412)))))

(assert (= (and d!73837 res!261798) b!441960))

(assert (= (and b!441960 res!261797) b!441961))

(declare-fun m!428167 () Bool)

(assert (=> d!73837 m!428167))

(declare-fun m!428169 () Bool)

(assert (=> d!73837 m!428169))

(declare-fun m!428171 () Bool)

(assert (=> d!73837 m!428171))

(declare-fun m!428173 () Bool)

(assert (=> d!73837 m!428173))

(declare-fun m!428175 () Bool)

(assert (=> b!441960 m!428175))

(declare-fun m!428177 () Bool)

(assert (=> b!441961 m!428177))

(assert (=> b!441817 d!73837))

(declare-fun b!441986 () Bool)

(declare-fun e!260127 () Bool)

(declare-fun e!260130 () Bool)

(assert (=> b!441986 (= e!260127 e!260130)))

(declare-fun c!55752 () Bool)

(assert (=> b!441986 (= c!55752 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 _keys!709 lt!202844))))))

(declare-fun b!441987 () Bool)

(declare-fun e!260128 () Bool)

(assert (=> b!441987 (= e!260128 e!260127)))

(declare-fun c!55750 () Bool)

(declare-fun e!260133 () Bool)

(assert (=> b!441987 (= c!55750 e!260133)))

(declare-fun res!261808 () Bool)

(assert (=> b!441987 (=> (not res!261808) (not e!260133))))

(assert (=> b!441987 (= res!261808 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 _keys!709 lt!202844))))))

(declare-fun b!441988 () Bool)

(declare-fun lt!202905 () Unit!13111)

(declare-fun lt!202910 () Unit!13111)

(assert (=> b!441988 (= lt!202905 lt!202910)))

(declare-fun lt!202909 () ListLongMap!6743)

(declare-fun lt!202904 () V!16683)

(declare-fun lt!202906 () (_ BitVec 64))

(declare-fun lt!202907 () (_ BitVec 64))

(assert (=> b!441988 (not (contains!2475 (+!1547 lt!202909 (tuple2!7841 lt!202907 lt!202904)) lt!202906))))

(declare-fun addStillNotContains!143 (ListLongMap!6743 (_ BitVec 64) V!16683 (_ BitVec 64)) Unit!13111)

(assert (=> b!441988 (= lt!202910 (addStillNotContains!143 lt!202909 lt!202907 lt!202904 lt!202906))))

(assert (=> b!441988 (= lt!202906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6475 (ValueCell!5498 V!16683) V!16683)

(declare-fun dynLambda!847 (Int (_ BitVec 64)) V!16683)

(assert (=> b!441988 (= lt!202904 (get!6475 (select (arr!13040 (ite c!55728 _values!549 lt!202843)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!441988 (= lt!202907 (select (arr!13039 (ite c!55728 _keys!709 lt!202844)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!29521 () ListLongMap!6743)

(assert (=> b!441988 (= lt!202909 call!29521)))

(declare-fun e!260131 () ListLongMap!6743)

(assert (=> b!441988 (= e!260131 (+!1547 call!29521 (tuple2!7841 (select (arr!13039 (ite c!55728 _keys!709 lt!202844)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6475 (select (arr!13040 (ite c!55728 _values!549 lt!202843)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!441989 () Bool)

(assert (=> b!441989 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 _keys!709 lt!202844))))))

(assert (=> b!441989 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55728 _values!549 lt!202843))))))

(declare-fun e!260132 () Bool)

(declare-fun lt!202908 () ListLongMap!6743)

(declare-fun apply!309 (ListLongMap!6743 (_ BitVec 64)) V!16683)

(assert (=> b!441989 (= e!260132 (= (apply!309 lt!202908 (select (arr!13039 (ite c!55728 _keys!709 lt!202844)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6475 (select (arr!13040 (ite c!55728 _values!549 lt!202843)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!441990 () Bool)

(declare-fun res!261809 () Bool)

(assert (=> b!441990 (=> (not res!261809) (not e!260128))))

(assert (=> b!441990 (= res!261809 (not (contains!2475 lt!202908 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441991 () Bool)

(assert (=> b!441991 (= e!260133 (validKeyInArray!0 (select (arr!13039 (ite c!55728 _keys!709 lt!202844)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!441991 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!441992 () Bool)

(declare-fun e!260129 () ListLongMap!6743)

(assert (=> b!441992 (= e!260129 (ListLongMap!6744 Nil!7826))))

(declare-fun b!441993 () Bool)

(assert (=> b!441993 (= e!260129 e!260131)))

(declare-fun c!55751 () Bool)

(assert (=> b!441993 (= c!55751 (validKeyInArray!0 (select (arr!13039 (ite c!55728 _keys!709 lt!202844)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!441995 () Bool)

(assert (=> b!441995 (= e!260127 e!260132)))

(assert (=> b!441995 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 _keys!709 lt!202844))))))

(declare-fun res!261810 () Bool)

(assert (=> b!441995 (= res!261810 (contains!2475 lt!202908 (select (arr!13039 (ite c!55728 _keys!709 lt!202844)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!441995 (=> (not res!261810) (not e!260132))))

(declare-fun b!441996 () Bool)

(assert (=> b!441996 (= e!260130 (= lt!202908 (getCurrentListMapNoExtraKeys!1586 (ite c!55728 _keys!709 lt!202844) (ite c!55728 _values!549 lt!202843) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!441994 () Bool)

(assert (=> b!441994 (= e!260131 call!29521)))

(declare-fun d!73839 () Bool)

(assert (=> d!73839 e!260128))

(declare-fun res!261807 () Bool)

(assert (=> d!73839 (=> (not res!261807) (not e!260128))))

(assert (=> d!73839 (= res!261807 (not (contains!2475 lt!202908 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73839 (= lt!202908 e!260129)))

(declare-fun c!55749 () Bool)

(assert (=> d!73839 (= c!55749 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 _keys!709 lt!202844))))))

(assert (=> d!73839 (validMask!0 mask!1025)))

(assert (=> d!73839 (= (getCurrentListMapNoExtraKeys!1586 (ite c!55728 _keys!709 lt!202844) (ite c!55728 _values!549 lt!202843) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!202908)))

(declare-fun bm!29518 () Bool)

(assert (=> bm!29518 (= call!29521 (getCurrentListMapNoExtraKeys!1586 (ite c!55728 _keys!709 lt!202844) (ite c!55728 _values!549 lt!202843) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!441997 () Bool)

(declare-fun isEmpty!559 (ListLongMap!6743) Bool)

(assert (=> b!441997 (= e!260130 (isEmpty!559 lt!202908))))

(assert (= (and d!73839 c!55749) b!441992))

(assert (= (and d!73839 (not c!55749)) b!441993))

(assert (= (and b!441993 c!55751) b!441988))

(assert (= (and b!441993 (not c!55751)) b!441994))

(assert (= (or b!441988 b!441994) bm!29518))

(assert (= (and d!73839 res!261807) b!441990))

(assert (= (and b!441990 res!261809) b!441987))

(assert (= (and b!441987 res!261808) b!441991))

(assert (= (and b!441987 c!55750) b!441995))

(assert (= (and b!441987 (not c!55750)) b!441986))

(assert (= (and b!441995 res!261810) b!441989))

(assert (= (and b!441986 c!55752) b!441996))

(assert (= (and b!441986 (not c!55752)) b!441997))

(declare-fun b_lambda!9379 () Bool)

(assert (=> (not b_lambda!9379) (not b!441988)))

(declare-fun t!13580 () Bool)

(declare-fun tb!3707 () Bool)

(assert (=> (and start!40250 (= defaultEntry!557 defaultEntry!557) t!13580) tb!3707))

(declare-fun result!6949 () Bool)

(assert (=> tb!3707 (= result!6949 tp_is_empty!11683)))

(assert (=> b!441988 t!13580))

(declare-fun b_and!18473 () Bool)

(assert (= b_and!18467 (and (=> t!13580 result!6949) b_and!18473)))

(declare-fun b_lambda!9381 () Bool)

(assert (=> (not b_lambda!9381) (not b!441989)))

(assert (=> b!441989 t!13580))

(declare-fun b_and!18475 () Bool)

(assert (= b_and!18473 (and (=> t!13580 result!6949) b_and!18475)))

(declare-fun m!428179 () Bool)

(assert (=> b!441993 m!428179))

(assert (=> b!441993 m!428179))

(declare-fun m!428181 () Bool)

(assert (=> b!441993 m!428181))

(assert (=> b!441995 m!428179))

(assert (=> b!441995 m!428179))

(declare-fun m!428183 () Bool)

(assert (=> b!441995 m!428183))

(declare-fun m!428185 () Bool)

(assert (=> b!441989 m!428185))

(declare-fun m!428187 () Bool)

(assert (=> b!441989 m!428187))

(assert (=> b!441989 m!428179))

(declare-fun m!428189 () Bool)

(assert (=> b!441989 m!428189))

(assert (=> b!441989 m!428179))

(assert (=> b!441989 m!428185))

(assert (=> b!441989 m!428187))

(declare-fun m!428191 () Bool)

(assert (=> b!441989 m!428191))

(declare-fun m!428193 () Bool)

(assert (=> b!441990 m!428193))

(assert (=> b!441988 m!428185))

(declare-fun m!428195 () Bool)

(assert (=> b!441988 m!428195))

(assert (=> b!441988 m!428187))

(assert (=> b!441988 m!428195))

(declare-fun m!428197 () Bool)

(assert (=> b!441988 m!428197))

(assert (=> b!441988 m!428179))

(declare-fun m!428199 () Bool)

(assert (=> b!441988 m!428199))

(assert (=> b!441988 m!428185))

(assert (=> b!441988 m!428187))

(assert (=> b!441988 m!428191))

(declare-fun m!428201 () Bool)

(assert (=> b!441988 m!428201))

(assert (=> b!441991 m!428179))

(assert (=> b!441991 m!428179))

(assert (=> b!441991 m!428181))

(declare-fun m!428203 () Bool)

(assert (=> d!73839 m!428203))

(assert (=> d!73839 m!428025))

(declare-fun m!428205 () Bool)

(assert (=> b!441997 m!428205))

(declare-fun m!428207 () Bool)

(assert (=> b!441996 m!428207))

(assert (=> bm!29518 m!428207))

(assert (=> bm!29494 d!73839))

(declare-fun d!73841 () Bool)

(declare-fun res!261815 () Bool)

(declare-fun e!260138 () Bool)

(assert (=> d!73841 (=> res!261815 e!260138)))

(assert (=> d!73841 (= res!261815 (= (select (arr!13039 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73841 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!260138)))

(declare-fun b!442004 () Bool)

(declare-fun e!260139 () Bool)

(assert (=> b!442004 (= e!260138 e!260139)))

(declare-fun res!261816 () Bool)

(assert (=> b!442004 (=> (not res!261816) (not e!260139))))

(assert (=> b!442004 (= res!261816 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13392 _keys!709)))))

(declare-fun b!442005 () Bool)

(assert (=> b!442005 (= e!260139 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73841 (not res!261815)) b!442004))

(assert (= (and b!442004 res!261816) b!442005))

(declare-fun m!428209 () Bool)

(assert (=> d!73841 m!428209))

(declare-fun m!428211 () Bool)

(assert (=> b!442005 m!428211))

(assert (=> b!441811 d!73841))

(declare-fun b!442014 () Bool)

(declare-fun e!260147 () Bool)

(declare-fun call!29524 () Bool)

(assert (=> b!442014 (= e!260147 call!29524)))

(declare-fun bm!29521 () Bool)

(assert (=> bm!29521 (= call!29524 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!202844 mask!1025))))

(declare-fun b!442015 () Bool)

(declare-fun e!260148 () Bool)

(declare-fun e!260146 () Bool)

(assert (=> b!442015 (= e!260148 e!260146)))

(declare-fun c!55755 () Bool)

(assert (=> b!442015 (= c!55755 (validKeyInArray!0 (select (arr!13039 lt!202844) #b00000000000000000000000000000000)))))

(declare-fun b!442016 () Bool)

(assert (=> b!442016 (= e!260146 call!29524)))

(declare-fun b!442017 () Bool)

(assert (=> b!442017 (= e!260146 e!260147)))

(declare-fun lt!202919 () (_ BitVec 64))

(assert (=> b!442017 (= lt!202919 (select (arr!13039 lt!202844) #b00000000000000000000000000000000))))

(declare-fun lt!202917 () Unit!13111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27179 (_ BitVec 64) (_ BitVec 32)) Unit!13111)

(assert (=> b!442017 (= lt!202917 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!202844 lt!202919 #b00000000000000000000000000000000))))

(assert (=> b!442017 (arrayContainsKey!0 lt!202844 lt!202919 #b00000000000000000000000000000000)))

(declare-fun lt!202918 () Unit!13111)

(assert (=> b!442017 (= lt!202918 lt!202917)))

(declare-fun res!261822 () Bool)

(declare-datatypes ((SeekEntryResult!3522 0))(
  ( (MissingZero!3522 (index!16267 (_ BitVec 32))) (Found!3522 (index!16268 (_ BitVec 32))) (Intermediate!3522 (undefined!4334 Bool) (index!16269 (_ BitVec 32)) (x!41726 (_ BitVec 32))) (Undefined!3522) (MissingVacant!3522 (index!16270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27179 (_ BitVec 32)) SeekEntryResult!3522)

(assert (=> b!442017 (= res!261822 (= (seekEntryOrOpen!0 (select (arr!13039 lt!202844) #b00000000000000000000000000000000) lt!202844 mask!1025) (Found!3522 #b00000000000000000000000000000000)))))

(assert (=> b!442017 (=> (not res!261822) (not e!260147))))

(declare-fun d!73843 () Bool)

(declare-fun res!261821 () Bool)

(assert (=> d!73843 (=> res!261821 e!260148)))

(assert (=> d!73843 (= res!261821 (bvsge #b00000000000000000000000000000000 (size!13392 lt!202844)))))

(assert (=> d!73843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202844 mask!1025) e!260148)))

(assert (= (and d!73843 (not res!261821)) b!442015))

(assert (= (and b!442015 c!55755) b!442017))

(assert (= (and b!442015 (not c!55755)) b!442016))

(assert (= (and b!442017 res!261822) b!442014))

(assert (= (or b!442014 b!442016) bm!29521))

(declare-fun m!428213 () Bool)

(assert (=> bm!29521 m!428213))

(assert (=> b!442015 m!428159))

(assert (=> b!442015 m!428159))

(assert (=> b!442015 m!428161))

(assert (=> b!442017 m!428159))

(declare-fun m!428215 () Bool)

(assert (=> b!442017 m!428215))

(declare-fun m!428217 () Bool)

(assert (=> b!442017 m!428217))

(assert (=> b!442017 m!428159))

(declare-fun m!428219 () Bool)

(assert (=> b!442017 m!428219))

(assert (=> b!441820 d!73843))

(declare-fun b!442018 () Bool)

(declare-fun e!260149 () Bool)

(declare-fun e!260152 () Bool)

(assert (=> b!442018 (= e!260149 e!260152)))

(declare-fun c!55759 () Bool)

(assert (=> b!442018 (= c!55759 (bvslt from!863 (size!13392 lt!202844)))))

(declare-fun b!442019 () Bool)

(declare-fun e!260150 () Bool)

(assert (=> b!442019 (= e!260150 e!260149)))

(declare-fun c!55757 () Bool)

(declare-fun e!260155 () Bool)

(assert (=> b!442019 (= c!55757 e!260155)))

(declare-fun res!261824 () Bool)

(assert (=> b!442019 (=> (not res!261824) (not e!260155))))

(assert (=> b!442019 (= res!261824 (bvslt from!863 (size!13392 lt!202844)))))

(declare-fun b!442020 () Bool)

(declare-fun lt!202921 () Unit!13111)

(declare-fun lt!202926 () Unit!13111)

(assert (=> b!442020 (= lt!202921 lt!202926)))

(declare-fun lt!202920 () V!16683)

(declare-fun lt!202923 () (_ BitVec 64))

(declare-fun lt!202925 () ListLongMap!6743)

(declare-fun lt!202922 () (_ BitVec 64))

(assert (=> b!442020 (not (contains!2475 (+!1547 lt!202925 (tuple2!7841 lt!202923 lt!202920)) lt!202922))))

(assert (=> b!442020 (= lt!202926 (addStillNotContains!143 lt!202925 lt!202923 lt!202920 lt!202922))))

(assert (=> b!442020 (= lt!202922 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442020 (= lt!202920 (get!6475 (select (arr!13040 lt!202843) from!863) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442020 (= lt!202923 (select (arr!13039 lt!202844) from!863))))

(declare-fun call!29525 () ListLongMap!6743)

(assert (=> b!442020 (= lt!202925 call!29525)))

(declare-fun e!260153 () ListLongMap!6743)

(assert (=> b!442020 (= e!260153 (+!1547 call!29525 (tuple2!7841 (select (arr!13039 lt!202844) from!863) (get!6475 (select (arr!13040 lt!202843) from!863) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442021 () Bool)

(assert (=> b!442021 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 lt!202844)))))

(assert (=> b!442021 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13393 lt!202843)))))

(declare-fun lt!202924 () ListLongMap!6743)

(declare-fun e!260154 () Bool)

(assert (=> b!442021 (= e!260154 (= (apply!309 lt!202924 (select (arr!13039 lt!202844) from!863)) (get!6475 (select (arr!13040 lt!202843) from!863) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442022 () Bool)

(declare-fun res!261825 () Bool)

(assert (=> b!442022 (=> (not res!261825) (not e!260150))))

(assert (=> b!442022 (= res!261825 (not (contains!2475 lt!202924 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442023 () Bool)

(assert (=> b!442023 (= e!260155 (validKeyInArray!0 (select (arr!13039 lt!202844) from!863)))))

(assert (=> b!442023 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!442024 () Bool)

(declare-fun e!260151 () ListLongMap!6743)

(assert (=> b!442024 (= e!260151 (ListLongMap!6744 Nil!7826))))

(declare-fun b!442025 () Bool)

(assert (=> b!442025 (= e!260151 e!260153)))

(declare-fun c!55758 () Bool)

(assert (=> b!442025 (= c!55758 (validKeyInArray!0 (select (arr!13039 lt!202844) from!863)))))

(declare-fun b!442027 () Bool)

(assert (=> b!442027 (= e!260149 e!260154)))

(assert (=> b!442027 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 lt!202844)))))

(declare-fun res!261826 () Bool)

(assert (=> b!442027 (= res!261826 (contains!2475 lt!202924 (select (arr!13039 lt!202844) from!863)))))

(assert (=> b!442027 (=> (not res!261826) (not e!260154))))

(declare-fun b!442028 () Bool)

(assert (=> b!442028 (= e!260152 (= lt!202924 (getCurrentListMapNoExtraKeys!1586 lt!202844 lt!202843 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442026 () Bool)

(assert (=> b!442026 (= e!260153 call!29525)))

(declare-fun d!73845 () Bool)

(assert (=> d!73845 e!260150))

(declare-fun res!261823 () Bool)

(assert (=> d!73845 (=> (not res!261823) (not e!260150))))

(assert (=> d!73845 (= res!261823 (not (contains!2475 lt!202924 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73845 (= lt!202924 e!260151)))

(declare-fun c!55756 () Bool)

(assert (=> d!73845 (= c!55756 (bvsge from!863 (size!13392 lt!202844)))))

(assert (=> d!73845 (validMask!0 mask!1025)))

(assert (=> d!73845 (= (getCurrentListMapNoExtraKeys!1586 lt!202844 lt!202843 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!202924)))

(declare-fun bm!29522 () Bool)

(assert (=> bm!29522 (= call!29525 (getCurrentListMapNoExtraKeys!1586 lt!202844 lt!202843 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!442029 () Bool)

(assert (=> b!442029 (= e!260152 (isEmpty!559 lt!202924))))

(assert (= (and d!73845 c!55756) b!442024))

(assert (= (and d!73845 (not c!55756)) b!442025))

(assert (= (and b!442025 c!55758) b!442020))

(assert (= (and b!442025 (not c!55758)) b!442026))

(assert (= (or b!442020 b!442026) bm!29522))

(assert (= (and d!73845 res!261823) b!442022))

(assert (= (and b!442022 res!261825) b!442019))

(assert (= (and b!442019 res!261824) b!442023))

(assert (= (and b!442019 c!55757) b!442027))

(assert (= (and b!442019 (not c!55757)) b!442018))

(assert (= (and b!442027 res!261826) b!442021))

(assert (= (and b!442018 c!55759) b!442028))

(assert (= (and b!442018 (not c!55759)) b!442029))

(declare-fun b_lambda!9383 () Bool)

(assert (=> (not b_lambda!9383) (not b!442020)))

(assert (=> b!442020 t!13580))

(declare-fun b_and!18477 () Bool)

(assert (= b_and!18475 (and (=> t!13580 result!6949) b_and!18477)))

(declare-fun b_lambda!9385 () Bool)

(assert (=> (not b_lambda!9385) (not b!442021)))

(assert (=> b!442021 t!13580))

(declare-fun b_and!18479 () Bool)

(assert (= b_and!18477 (and (=> t!13580 result!6949) b_and!18479)))

(declare-fun m!428221 () Bool)

(assert (=> b!442025 m!428221))

(assert (=> b!442025 m!428221))

(declare-fun m!428223 () Bool)

(assert (=> b!442025 m!428223))

(assert (=> b!442027 m!428221))

(assert (=> b!442027 m!428221))

(declare-fun m!428225 () Bool)

(assert (=> b!442027 m!428225))

(declare-fun m!428227 () Bool)

(assert (=> b!442021 m!428227))

(assert (=> b!442021 m!428187))

(assert (=> b!442021 m!428221))

(declare-fun m!428229 () Bool)

(assert (=> b!442021 m!428229))

(assert (=> b!442021 m!428221))

(assert (=> b!442021 m!428227))

(assert (=> b!442021 m!428187))

(declare-fun m!428231 () Bool)

(assert (=> b!442021 m!428231))

(declare-fun m!428233 () Bool)

(assert (=> b!442022 m!428233))

(assert (=> b!442020 m!428227))

(declare-fun m!428235 () Bool)

(assert (=> b!442020 m!428235))

(assert (=> b!442020 m!428187))

(assert (=> b!442020 m!428235))

(declare-fun m!428237 () Bool)

(assert (=> b!442020 m!428237))

(assert (=> b!442020 m!428221))

(declare-fun m!428239 () Bool)

(assert (=> b!442020 m!428239))

(assert (=> b!442020 m!428227))

(assert (=> b!442020 m!428187))

(assert (=> b!442020 m!428231))

(declare-fun m!428241 () Bool)

(assert (=> b!442020 m!428241))

(assert (=> b!442023 m!428221))

(assert (=> b!442023 m!428221))

(assert (=> b!442023 m!428223))

(declare-fun m!428243 () Bool)

(assert (=> d!73845 m!428243))

(assert (=> d!73845 m!428025))

(declare-fun m!428245 () Bool)

(assert (=> b!442029 m!428245))

(declare-fun m!428247 () Bool)

(assert (=> b!442028 m!428247))

(assert (=> bm!29522 m!428247))

(assert (=> b!441813 d!73845))

(declare-fun b!442030 () Bool)

(declare-fun e!260156 () Bool)

(declare-fun e!260159 () Bool)

(assert (=> b!442030 (= e!260156 e!260159)))

(declare-fun c!55763 () Bool)

(assert (=> b!442030 (= c!55763 (bvslt from!863 (size!13392 _keys!709)))))

(declare-fun b!442031 () Bool)

(declare-fun e!260157 () Bool)

(assert (=> b!442031 (= e!260157 e!260156)))

(declare-fun c!55761 () Bool)

(declare-fun e!260162 () Bool)

(assert (=> b!442031 (= c!55761 e!260162)))

(declare-fun res!261828 () Bool)

(assert (=> b!442031 (=> (not res!261828) (not e!260162))))

(assert (=> b!442031 (= res!261828 (bvslt from!863 (size!13392 _keys!709)))))

(declare-fun b!442032 () Bool)

(declare-fun lt!202928 () Unit!13111)

(declare-fun lt!202933 () Unit!13111)

(assert (=> b!442032 (= lt!202928 lt!202933)))

(declare-fun lt!202930 () (_ BitVec 64))

(declare-fun lt!202929 () (_ BitVec 64))

(declare-fun lt!202932 () ListLongMap!6743)

(declare-fun lt!202927 () V!16683)

(assert (=> b!442032 (not (contains!2475 (+!1547 lt!202932 (tuple2!7841 lt!202930 lt!202927)) lt!202929))))

(assert (=> b!442032 (= lt!202933 (addStillNotContains!143 lt!202932 lt!202930 lt!202927 lt!202929))))

(assert (=> b!442032 (= lt!202929 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442032 (= lt!202927 (get!6475 (select (arr!13040 _values!549) from!863) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442032 (= lt!202930 (select (arr!13039 _keys!709) from!863))))

(declare-fun call!29526 () ListLongMap!6743)

(assert (=> b!442032 (= lt!202932 call!29526)))

(declare-fun e!260160 () ListLongMap!6743)

(assert (=> b!442032 (= e!260160 (+!1547 call!29526 (tuple2!7841 (select (arr!13039 _keys!709) from!863) (get!6475 (select (arr!13040 _values!549) from!863) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442033 () Bool)

(assert (=> b!442033 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 _keys!709)))))

(assert (=> b!442033 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13393 _values!549)))))

(declare-fun lt!202931 () ListLongMap!6743)

(declare-fun e!260161 () Bool)

(assert (=> b!442033 (= e!260161 (= (apply!309 lt!202931 (select (arr!13039 _keys!709) from!863)) (get!6475 (select (arr!13040 _values!549) from!863) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442034 () Bool)

(declare-fun res!261829 () Bool)

(assert (=> b!442034 (=> (not res!261829) (not e!260157))))

(assert (=> b!442034 (= res!261829 (not (contains!2475 lt!202931 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442035 () Bool)

(assert (=> b!442035 (= e!260162 (validKeyInArray!0 (select (arr!13039 _keys!709) from!863)))))

(assert (=> b!442035 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!442036 () Bool)

(declare-fun e!260158 () ListLongMap!6743)

(assert (=> b!442036 (= e!260158 (ListLongMap!6744 Nil!7826))))

(declare-fun b!442037 () Bool)

(assert (=> b!442037 (= e!260158 e!260160)))

(declare-fun c!55762 () Bool)

(assert (=> b!442037 (= c!55762 (validKeyInArray!0 (select (arr!13039 _keys!709) from!863)))))

(declare-fun b!442039 () Bool)

(assert (=> b!442039 (= e!260156 e!260161)))

(assert (=> b!442039 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13392 _keys!709)))))

(declare-fun res!261830 () Bool)

(assert (=> b!442039 (= res!261830 (contains!2475 lt!202931 (select (arr!13039 _keys!709) from!863)))))

(assert (=> b!442039 (=> (not res!261830) (not e!260161))))

(declare-fun b!442040 () Bool)

(assert (=> b!442040 (= e!260159 (= lt!202931 (getCurrentListMapNoExtraKeys!1586 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442038 () Bool)

(assert (=> b!442038 (= e!260160 call!29526)))

(declare-fun d!73847 () Bool)

(assert (=> d!73847 e!260157))

(declare-fun res!261827 () Bool)

(assert (=> d!73847 (=> (not res!261827) (not e!260157))))

(assert (=> d!73847 (= res!261827 (not (contains!2475 lt!202931 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73847 (= lt!202931 e!260158)))

(declare-fun c!55760 () Bool)

(assert (=> d!73847 (= c!55760 (bvsge from!863 (size!13392 _keys!709)))))

(assert (=> d!73847 (validMask!0 mask!1025)))

(assert (=> d!73847 (= (getCurrentListMapNoExtraKeys!1586 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!202931)))

(declare-fun bm!29523 () Bool)

(assert (=> bm!29523 (= call!29526 (getCurrentListMapNoExtraKeys!1586 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!442041 () Bool)

(assert (=> b!442041 (= e!260159 (isEmpty!559 lt!202931))))

(assert (= (and d!73847 c!55760) b!442036))

(assert (= (and d!73847 (not c!55760)) b!442037))

(assert (= (and b!442037 c!55762) b!442032))

(assert (= (and b!442037 (not c!55762)) b!442038))

(assert (= (or b!442032 b!442038) bm!29523))

(assert (= (and d!73847 res!261827) b!442034))

(assert (= (and b!442034 res!261829) b!442031))

(assert (= (and b!442031 res!261828) b!442035))

(assert (= (and b!442031 c!55761) b!442039))

(assert (= (and b!442031 (not c!55761)) b!442030))

(assert (= (and b!442039 res!261830) b!442033))

(assert (= (and b!442030 c!55763) b!442040))

(assert (= (and b!442030 (not c!55763)) b!442041))

(declare-fun b_lambda!9387 () Bool)

(assert (=> (not b_lambda!9387) (not b!442032)))

(assert (=> b!442032 t!13580))

(declare-fun b_and!18481 () Bool)

(assert (= b_and!18479 (and (=> t!13580 result!6949) b_and!18481)))

(declare-fun b_lambda!9389 () Bool)

(assert (=> (not b_lambda!9389) (not b!442033)))

(assert (=> b!442033 t!13580))

(declare-fun b_and!18483 () Bool)

(assert (= b_and!18481 (and (=> t!13580 result!6949) b_and!18483)))

(assert (=> b!442037 m!428059))

(assert (=> b!442037 m!428059))

(assert (=> b!442037 m!428061))

(assert (=> b!442039 m!428059))

(assert (=> b!442039 m!428059))

(declare-fun m!428249 () Bool)

(assert (=> b!442039 m!428249))

(declare-fun m!428251 () Bool)

(assert (=> b!442033 m!428251))

(assert (=> b!442033 m!428187))

(assert (=> b!442033 m!428059))

(declare-fun m!428253 () Bool)

(assert (=> b!442033 m!428253))

(assert (=> b!442033 m!428059))

(assert (=> b!442033 m!428251))

(assert (=> b!442033 m!428187))

(declare-fun m!428255 () Bool)

(assert (=> b!442033 m!428255))

(declare-fun m!428257 () Bool)

(assert (=> b!442034 m!428257))

(assert (=> b!442032 m!428251))

(declare-fun m!428259 () Bool)

(assert (=> b!442032 m!428259))

(assert (=> b!442032 m!428187))

(assert (=> b!442032 m!428259))

(declare-fun m!428261 () Bool)

(assert (=> b!442032 m!428261))

(assert (=> b!442032 m!428059))

(declare-fun m!428263 () Bool)

(assert (=> b!442032 m!428263))

(assert (=> b!442032 m!428251))

(assert (=> b!442032 m!428187))

(assert (=> b!442032 m!428255))

(declare-fun m!428265 () Bool)

(assert (=> b!442032 m!428265))

(assert (=> b!442035 m!428059))

(assert (=> b!442035 m!428059))

(assert (=> b!442035 m!428061))

(declare-fun m!428267 () Bool)

(assert (=> d!73847 m!428267))

(assert (=> d!73847 m!428025))

(declare-fun m!428269 () Bool)

(assert (=> b!442041 m!428269))

(declare-fun m!428271 () Bool)

(assert (=> b!442040 m!428271))

(assert (=> bm!29523 m!428271))

(assert (=> b!441813 d!73847))

(declare-fun b!442042 () Bool)

(declare-fun e!260164 () Bool)

(declare-fun call!29527 () Bool)

(assert (=> b!442042 (= e!260164 call!29527)))

(declare-fun bm!29524 () Bool)

(assert (=> bm!29524 (= call!29527 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!442043 () Bool)

(declare-fun e!260165 () Bool)

(declare-fun e!260163 () Bool)

(assert (=> b!442043 (= e!260165 e!260163)))

(declare-fun c!55764 () Bool)

(assert (=> b!442043 (= c!55764 (validKeyInArray!0 (select (arr!13039 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!442044 () Bool)

(assert (=> b!442044 (= e!260163 call!29527)))

(declare-fun b!442045 () Bool)

(assert (=> b!442045 (= e!260163 e!260164)))

(declare-fun lt!202936 () (_ BitVec 64))

(assert (=> b!442045 (= lt!202936 (select (arr!13039 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!202934 () Unit!13111)

(assert (=> b!442045 (= lt!202934 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!202936 #b00000000000000000000000000000000))))

(assert (=> b!442045 (arrayContainsKey!0 _keys!709 lt!202936 #b00000000000000000000000000000000)))

(declare-fun lt!202935 () Unit!13111)

(assert (=> b!442045 (= lt!202935 lt!202934)))

(declare-fun res!261832 () Bool)

(assert (=> b!442045 (= res!261832 (= (seekEntryOrOpen!0 (select (arr!13039 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3522 #b00000000000000000000000000000000)))))

(assert (=> b!442045 (=> (not res!261832) (not e!260164))))

(declare-fun d!73849 () Bool)

(declare-fun res!261831 () Bool)

(assert (=> d!73849 (=> res!261831 e!260165)))

(assert (=> d!73849 (= res!261831 (bvsge #b00000000000000000000000000000000 (size!13392 _keys!709)))))

(assert (=> d!73849 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!260165)))

(assert (= (and d!73849 (not res!261831)) b!442043))

(assert (= (and b!442043 c!55764) b!442045))

(assert (= (and b!442043 (not c!55764)) b!442044))

(assert (= (and b!442045 res!261832) b!442042))

(assert (= (or b!442042 b!442044) bm!29524))

(declare-fun m!428273 () Bool)

(assert (=> bm!29524 m!428273))

(assert (=> b!442043 m!428209))

(assert (=> b!442043 m!428209))

(declare-fun m!428275 () Bool)

(assert (=> b!442043 m!428275))

(assert (=> b!442045 m!428209))

(declare-fun m!428277 () Bool)

(assert (=> b!442045 m!428277))

(declare-fun m!428279 () Bool)

(assert (=> b!442045 m!428279))

(assert (=> b!442045 m!428209))

(declare-fun m!428281 () Bool)

(assert (=> b!442045 m!428281))

(assert (=> b!441821 d!73849))

(declare-fun b!442046 () Bool)

(declare-fun e!260169 () Bool)

(declare-fun call!29528 () Bool)

(assert (=> b!442046 (= e!260169 call!29528)))

(declare-fun b!442047 () Bool)

(declare-fun e!260168 () Bool)

(assert (=> b!442047 (= e!260168 e!260169)))

(declare-fun c!55765 () Bool)

(assert (=> b!442047 (= c!55765 (validKeyInArray!0 (select (arr!13039 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!29525 () Bool)

(assert (=> bm!29525 (= call!29528 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55765 (Cons!7824 (select (arr!13039 _keys!709) #b00000000000000000000000000000000) Nil!7825) Nil!7825)))))

(declare-fun b!442048 () Bool)

(declare-fun e!260167 () Bool)

(assert (=> b!442048 (= e!260167 (contains!2474 Nil!7825 (select (arr!13039 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73851 () Bool)

(declare-fun res!261833 () Bool)

(declare-fun e!260166 () Bool)

(assert (=> d!73851 (=> res!261833 e!260166)))

(assert (=> d!73851 (= res!261833 (bvsge #b00000000000000000000000000000000 (size!13392 _keys!709)))))

(assert (=> d!73851 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7825) e!260166)))

(declare-fun b!442049 () Bool)

(assert (=> b!442049 (= e!260169 call!29528)))

(declare-fun b!442050 () Bool)

(assert (=> b!442050 (= e!260166 e!260168)))

(declare-fun res!261835 () Bool)

(assert (=> b!442050 (=> (not res!261835) (not e!260168))))

(assert (=> b!442050 (= res!261835 (not e!260167))))

(declare-fun res!261834 () Bool)

(assert (=> b!442050 (=> (not res!261834) (not e!260167))))

(assert (=> b!442050 (= res!261834 (validKeyInArray!0 (select (arr!13039 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73851 (not res!261833)) b!442050))

(assert (= (and b!442050 res!261834) b!442048))

(assert (= (and b!442050 res!261835) b!442047))

(assert (= (and b!442047 c!55765) b!442049))

(assert (= (and b!442047 (not c!55765)) b!442046))

(assert (= (or b!442049 b!442046) bm!29525))

(assert (=> b!442047 m!428209))

(assert (=> b!442047 m!428209))

(assert (=> b!442047 m!428275))

(assert (=> bm!29525 m!428209))

(declare-fun m!428283 () Bool)

(assert (=> bm!29525 m!428283))

(assert (=> b!442048 m!428209))

(assert (=> b!442048 m!428209))

(declare-fun m!428285 () Bool)

(assert (=> b!442048 m!428285))

(assert (=> b!442050 m!428209))

(assert (=> b!442050 m!428209))

(assert (=> b!442050 m!428275))

(assert (=> b!441812 d!73851))

(declare-fun b!442051 () Bool)

(declare-fun e!260170 () Bool)

(declare-fun e!260173 () Bool)

(assert (=> b!442051 (= e!260170 e!260173)))

(declare-fun c!55769 () Bool)

(assert (=> b!442051 (= c!55769 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 lt!202844 _keys!709))))))

(declare-fun b!442052 () Bool)

(declare-fun e!260171 () Bool)

(assert (=> b!442052 (= e!260171 e!260170)))

(declare-fun c!55767 () Bool)

(declare-fun e!260176 () Bool)

(assert (=> b!442052 (= c!55767 e!260176)))

(declare-fun res!261837 () Bool)

(assert (=> b!442052 (=> (not res!261837) (not e!260176))))

(assert (=> b!442052 (= res!261837 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 lt!202844 _keys!709))))))

(declare-fun b!442053 () Bool)

(declare-fun lt!202938 () Unit!13111)

(declare-fun lt!202943 () Unit!13111)

(assert (=> b!442053 (= lt!202938 lt!202943)))

(declare-fun lt!202942 () ListLongMap!6743)

(declare-fun lt!202940 () (_ BitVec 64))

(declare-fun lt!202939 () (_ BitVec 64))

(declare-fun lt!202937 () V!16683)

(assert (=> b!442053 (not (contains!2475 (+!1547 lt!202942 (tuple2!7841 lt!202940 lt!202937)) lt!202939))))

(assert (=> b!442053 (= lt!202943 (addStillNotContains!143 lt!202942 lt!202940 lt!202937 lt!202939))))

(assert (=> b!442053 (= lt!202939 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!442053 (= lt!202937 (get!6475 (select (arr!13040 (ite c!55728 lt!202843 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!442053 (= lt!202940 (select (arr!13039 (ite c!55728 lt!202844 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!29529 () ListLongMap!6743)

(assert (=> b!442053 (= lt!202942 call!29529)))

(declare-fun e!260174 () ListLongMap!6743)

(assert (=> b!442053 (= e!260174 (+!1547 call!29529 (tuple2!7841 (select (arr!13039 (ite c!55728 lt!202844 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6475 (select (arr!13040 (ite c!55728 lt!202843 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!442054 () Bool)

(assert (=> b!442054 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 lt!202844 _keys!709))))))

(assert (=> b!442054 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13393 (ite c!55728 lt!202843 _values!549))))))

(declare-fun e!260175 () Bool)

(declare-fun lt!202941 () ListLongMap!6743)

(assert (=> b!442054 (= e!260175 (= (apply!309 lt!202941 (select (arr!13039 (ite c!55728 lt!202844 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6475 (select (arr!13040 (ite c!55728 lt!202843 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!442055 () Bool)

(declare-fun res!261838 () Bool)

(assert (=> b!442055 (=> (not res!261838) (not e!260171))))

(assert (=> b!442055 (= res!261838 (not (contains!2475 lt!202941 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442056 () Bool)

(assert (=> b!442056 (= e!260176 (validKeyInArray!0 (select (arr!13039 (ite c!55728 lt!202844 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442056 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!442057 () Bool)

(declare-fun e!260172 () ListLongMap!6743)

(assert (=> b!442057 (= e!260172 (ListLongMap!6744 Nil!7826))))

(declare-fun b!442058 () Bool)

(assert (=> b!442058 (= e!260172 e!260174)))

(declare-fun c!55768 () Bool)

(assert (=> b!442058 (= c!55768 (validKeyInArray!0 (select (arr!13039 (ite c!55728 lt!202844 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!442060 () Bool)

(assert (=> b!442060 (= e!260170 e!260175)))

(assert (=> b!442060 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 lt!202844 _keys!709))))))

(declare-fun res!261839 () Bool)

(assert (=> b!442060 (= res!261839 (contains!2475 lt!202941 (select (arr!13039 (ite c!55728 lt!202844 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!442060 (=> (not res!261839) (not e!260175))))

(declare-fun b!442061 () Bool)

(assert (=> b!442061 (= e!260173 (= lt!202941 (getCurrentListMapNoExtraKeys!1586 (ite c!55728 lt!202844 _keys!709) (ite c!55728 lt!202843 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!442059 () Bool)

(assert (=> b!442059 (= e!260174 call!29529)))

(declare-fun d!73853 () Bool)

(assert (=> d!73853 e!260171))

(declare-fun res!261836 () Bool)

(assert (=> d!73853 (=> (not res!261836) (not e!260171))))

(assert (=> d!73853 (= res!261836 (not (contains!2475 lt!202941 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73853 (= lt!202941 e!260172)))

(declare-fun c!55766 () Bool)

(assert (=> d!73853 (= c!55766 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13392 (ite c!55728 lt!202844 _keys!709))))))

(assert (=> d!73853 (validMask!0 mask!1025)))

(assert (=> d!73853 (= (getCurrentListMapNoExtraKeys!1586 (ite c!55728 lt!202844 _keys!709) (ite c!55728 lt!202843 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!202941)))

(declare-fun bm!29526 () Bool)

(assert (=> bm!29526 (= call!29529 (getCurrentListMapNoExtraKeys!1586 (ite c!55728 lt!202844 _keys!709) (ite c!55728 lt!202843 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!442062 () Bool)

(assert (=> b!442062 (= e!260173 (isEmpty!559 lt!202941))))

(assert (= (and d!73853 c!55766) b!442057))

(assert (= (and d!73853 (not c!55766)) b!442058))

(assert (= (and b!442058 c!55768) b!442053))

(assert (= (and b!442058 (not c!55768)) b!442059))

(assert (= (or b!442053 b!442059) bm!29526))

(assert (= (and d!73853 res!261836) b!442055))

(assert (= (and b!442055 res!261838) b!442052))

(assert (= (and b!442052 res!261837) b!442056))

(assert (= (and b!442052 c!55767) b!442060))

(assert (= (and b!442052 (not c!55767)) b!442051))

(assert (= (and b!442060 res!261839) b!442054))

(assert (= (and b!442051 c!55769) b!442061))

(assert (= (and b!442051 (not c!55769)) b!442062))

(declare-fun b_lambda!9391 () Bool)

(assert (=> (not b_lambda!9391) (not b!442053)))

(assert (=> b!442053 t!13580))

(declare-fun b_and!18485 () Bool)

(assert (= b_and!18483 (and (=> t!13580 result!6949) b_and!18485)))

(declare-fun b_lambda!9393 () Bool)

(assert (=> (not b_lambda!9393) (not b!442054)))

(assert (=> b!442054 t!13580))

(declare-fun b_and!18487 () Bool)

(assert (= b_and!18485 (and (=> t!13580 result!6949) b_and!18487)))

(declare-fun m!428287 () Bool)

(assert (=> b!442058 m!428287))

(assert (=> b!442058 m!428287))

(declare-fun m!428289 () Bool)

(assert (=> b!442058 m!428289))

(assert (=> b!442060 m!428287))

(assert (=> b!442060 m!428287))

(declare-fun m!428291 () Bool)

(assert (=> b!442060 m!428291))

(declare-fun m!428293 () Bool)

(assert (=> b!442054 m!428293))

(assert (=> b!442054 m!428187))

(assert (=> b!442054 m!428287))

(declare-fun m!428295 () Bool)

(assert (=> b!442054 m!428295))

(assert (=> b!442054 m!428287))

(assert (=> b!442054 m!428293))

(assert (=> b!442054 m!428187))

(declare-fun m!428297 () Bool)

(assert (=> b!442054 m!428297))

(declare-fun m!428299 () Bool)

(assert (=> b!442055 m!428299))

(assert (=> b!442053 m!428293))

(declare-fun m!428301 () Bool)

(assert (=> b!442053 m!428301))

(assert (=> b!442053 m!428187))

(assert (=> b!442053 m!428301))

(declare-fun m!428303 () Bool)

(assert (=> b!442053 m!428303))

(assert (=> b!442053 m!428287))

(declare-fun m!428305 () Bool)

(assert (=> b!442053 m!428305))

(assert (=> b!442053 m!428293))

(assert (=> b!442053 m!428187))

(assert (=> b!442053 m!428297))

(declare-fun m!428307 () Bool)

(assert (=> b!442053 m!428307))

(assert (=> b!442056 m!428287))

(assert (=> b!442056 m!428287))

(assert (=> b!442056 m!428289))

(declare-fun m!428309 () Bool)

(assert (=> d!73853 m!428309))

(assert (=> d!73853 m!428025))

(declare-fun m!428311 () Bool)

(assert (=> b!442062 m!428311))

(declare-fun m!428313 () Bool)

(assert (=> b!442061 m!428313))

(assert (=> bm!29526 m!428313))

(assert (=> bm!29493 d!73853))

(declare-fun d!73855 () Bool)

(assert (=> d!73855 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!441815 d!73855))

(declare-fun mapIsEmpty!19155 () Bool)

(declare-fun mapRes!19155 () Bool)

(assert (=> mapIsEmpty!19155 mapRes!19155))

(declare-fun condMapEmpty!19155 () Bool)

(declare-fun mapDefault!19155 () ValueCell!5498)

(assert (=> mapNonEmpty!19146 (= condMapEmpty!19155 (= mapRest!19146 ((as const (Array (_ BitVec 32) ValueCell!5498)) mapDefault!19155)))))

(declare-fun e!260182 () Bool)

(assert (=> mapNonEmpty!19146 (= tp!37112 (and e!260182 mapRes!19155))))

(declare-fun b!442069 () Bool)

(declare-fun e!260181 () Bool)

(assert (=> b!442069 (= e!260181 tp_is_empty!11683)))

(declare-fun b!442070 () Bool)

(assert (=> b!442070 (= e!260182 tp_is_empty!11683)))

(declare-fun mapNonEmpty!19155 () Bool)

(declare-fun tp!37128 () Bool)

(assert (=> mapNonEmpty!19155 (= mapRes!19155 (and tp!37128 e!260181))))

(declare-fun mapRest!19155 () (Array (_ BitVec 32) ValueCell!5498))

(declare-fun mapKey!19155 () (_ BitVec 32))

(declare-fun mapValue!19155 () ValueCell!5498)

(assert (=> mapNonEmpty!19155 (= mapRest!19146 (store mapRest!19155 mapKey!19155 mapValue!19155))))

(assert (= (and mapNonEmpty!19146 condMapEmpty!19155) mapIsEmpty!19155))

(assert (= (and mapNonEmpty!19146 (not condMapEmpty!19155)) mapNonEmpty!19155))

(assert (= (and mapNonEmpty!19155 ((_ is ValueCellFull!5498) mapValue!19155)) b!442069))

(assert (= (and mapNonEmpty!19146 ((_ is ValueCellFull!5498) mapDefault!19155)) b!442070))

(declare-fun m!428315 () Bool)

(assert (=> mapNonEmpty!19155 m!428315))

(declare-fun b_lambda!9395 () Bool)

(assert (= b_lambda!9381 (or (and start!40250 b_free!10525) b_lambda!9395)))

(declare-fun b_lambda!9397 () Bool)

(assert (= b_lambda!9387 (or (and start!40250 b_free!10525) b_lambda!9397)))

(declare-fun b_lambda!9399 () Bool)

(assert (= b_lambda!9383 (or (and start!40250 b_free!10525) b_lambda!9399)))

(declare-fun b_lambda!9401 () Bool)

(assert (= b_lambda!9391 (or (and start!40250 b_free!10525) b_lambda!9401)))

(declare-fun b_lambda!9403 () Bool)

(assert (= b_lambda!9379 (or (and start!40250 b_free!10525) b_lambda!9403)))

(declare-fun b_lambda!9405 () Bool)

(assert (= b_lambda!9393 (or (and start!40250 b_free!10525) b_lambda!9405)))

(declare-fun b_lambda!9407 () Bool)

(assert (= b_lambda!9389 (or (and start!40250 b_free!10525) b_lambda!9407)))

(declare-fun b_lambda!9409 () Bool)

(assert (= b_lambda!9385 (or (and start!40250 b_free!10525) b_lambda!9409)))

(check-sat (not b!441961) (not b!442017) (not b!442034) (not b_lambda!9399) (not mapNonEmpty!19155) (not bm!29526) (not b!442028) (not bm!29523) (not b_next!10525) (not b!442027) (not b!442053) (not b!442021) (not d!73853) (not d!73839) (not bm!29521) (not bm!29515) (not b!441989) (not b_lambda!9405) (not b!442025) (not b!442041) (not b!442022) (not b!441952) (not b!442023) (not b!441996) (not b!442037) (not b!441988) (not b_lambda!9395) (not b!442043) (not b!442033) (not b!442050) (not b!442056) (not b!441990) (not b!441997) (not b!442032) (not b_lambda!9401) (not b!442029) (not b!442045) (not b!442060) (not b!442061) (not bm!29512) (not b!441953) (not b!441995) (not b!442054) (not d!73847) tp_is_empty!11683 (not d!73827) (not bm!29511) (not b!441993) (not b_lambda!9403) (not bm!29524) (not d!73837) (not b!441991) (not b!442035) (not b_lambda!9409) b_and!18487 (not b_lambda!9407) (not b!442055) (not bm!29522) (not b!442039) (not b!441960) (not b!442058) (not b!442015) (not b!441955) (not b!442005) (not b!442047) (not bm!29525) (not bm!29518) (not b_lambda!9397) (not b!441939) (not d!73845) (not b!442062) (not b!442020) (not b!442040) (not b!442048))
(check-sat b_and!18487 (not b_next!10525))
