; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40762 () Bool)

(assert start!40762)

(declare-fun b_free!10765 () Bool)

(declare-fun b_next!10765 () Bool)

(assert (=> start!40762 (= b_free!10765 (not b_next!10765))))

(declare-fun tp!38117 () Bool)

(declare-fun b_and!18827 () Bool)

(assert (=> start!40762 (= tp!38117 b_and!18827)))

(declare-fun b!451879 () Bool)

(declare-fun res!269129 () Bool)

(declare-fun e!264646 () Bool)

(assert (=> b!451879 (=> (not res!269129) (not e!264646))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451879 (= res!269129 (validKeyInArray!0 k0!794))))

(declare-fun b!451880 () Bool)

(declare-fun e!264642 () Bool)

(assert (=> b!451880 (= e!264646 e!264642)))

(declare-fun res!269132 () Bool)

(assert (=> b!451880 (=> (not res!269132) (not e!264642))))

(declare-datatypes ((array!28004 0))(
  ( (array!28005 (arr!13446 (Array (_ BitVec 32) (_ BitVec 64))) (size!13798 (_ BitVec 32))) )
))
(declare-fun lt!205070 () array!28004)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28004 (_ BitVec 32)) Bool)

(assert (=> b!451880 (= res!269132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205070 mask!1025))))

(declare-fun _keys!709 () array!28004)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451880 (= lt!205070 (array!28005 (store (arr!13446 _keys!709) i!563 k0!794) (size!13798 _keys!709)))))

(declare-fun mapNonEmpty!19791 () Bool)

(declare-fun mapRes!19791 () Bool)

(declare-fun tp!38118 () Bool)

(declare-fun e!264647 () Bool)

(assert (=> mapNonEmpty!19791 (= mapRes!19791 (and tp!38118 e!264647))))

(declare-datatypes ((V!17243 0))(
  ( (V!17244 (val!6096 Int)) )
))
(declare-datatypes ((ValueCell!5708 0))(
  ( (ValueCellFull!5708 (v!8356 V!17243)) (EmptyCell!5708) )
))
(declare-fun mapValue!19791 () ValueCell!5708)

(declare-fun mapKey!19791 () (_ BitVec 32))

(declare-datatypes ((array!28006 0))(
  ( (array!28007 (arr!13447 (Array (_ BitVec 32) ValueCell!5708)) (size!13799 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28006)

(declare-fun mapRest!19791 () (Array (_ BitVec 32) ValueCell!5708))

(assert (=> mapNonEmpty!19791 (= (arr!13447 _values!549) (store mapRest!19791 mapKey!19791 mapValue!19791))))

(declare-fun b!451881 () Bool)

(declare-fun e!264645 () Bool)

(declare-fun e!264643 () Bool)

(assert (=> b!451881 (= e!264645 (and e!264643 mapRes!19791))))

(declare-fun condMapEmpty!19791 () Bool)

(declare-fun mapDefault!19791 () ValueCell!5708)

(assert (=> b!451881 (= condMapEmpty!19791 (= (arr!13447 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5708)) mapDefault!19791)))))

(declare-fun b!451882 () Bool)

(declare-fun res!269130 () Bool)

(assert (=> b!451882 (=> (not res!269130) (not e!264646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451882 (= res!269130 (validMask!0 mask!1025))))

(declare-fun b!451883 () Bool)

(declare-fun tp_is_empty!12103 () Bool)

(assert (=> b!451883 (= e!264647 tp_is_empty!12103)))

(declare-fun b!451884 () Bool)

(declare-fun e!264650 () Bool)

(declare-datatypes ((tuple2!7922 0))(
  ( (tuple2!7923 (_1!3972 (_ BitVec 64)) (_2!3972 V!17243)) )
))
(declare-datatypes ((List!7991 0))(
  ( (Nil!7988) (Cons!7987 (h!8843 tuple2!7922) (t!13771 List!7991)) )
))
(declare-datatypes ((ListLongMap!6837 0))(
  ( (ListLongMap!6838 (toList!3434 List!7991)) )
))
(declare-fun call!29895 () ListLongMap!6837)

(declare-fun call!29894 () ListLongMap!6837)

(assert (=> b!451884 (= e!264650 (= call!29895 call!29894))))

(declare-fun minValue!515 () V!17243)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17243)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29891 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1663 (array!28004 array!28006 (_ BitVec 32) (_ BitVec 32) V!17243 V!17243 (_ BitVec 32) Int) ListLongMap!6837)

(assert (=> bm!29891 (= call!29894 (getCurrentListMapNoExtraKeys!1663 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451886 () Bool)

(declare-fun res!269124 () Bool)

(assert (=> b!451886 (=> (not res!269124) (not e!264646))))

(assert (=> b!451886 (= res!269124 (or (= (select (arr!13446 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13446 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451887 () Bool)

(declare-fun res!269127 () Bool)

(assert (=> b!451887 (=> (not res!269127) (not e!264642))))

(assert (=> b!451887 (= res!269127 (bvsle from!863 i!563))))

(declare-fun b!451888 () Bool)

(declare-fun res!269131 () Bool)

(assert (=> b!451888 (=> (not res!269131) (not e!264646))))

(assert (=> b!451888 (= res!269131 (and (= (size!13799 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13798 _keys!709) (size!13799 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451889 () Bool)

(declare-fun res!269134 () Bool)

(assert (=> b!451889 (=> (not res!269134) (not e!264646))))

(declare-fun arrayContainsKey!0 (array!28004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451889 (= res!269134 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451890 () Bool)

(declare-fun res!269121 () Bool)

(assert (=> b!451890 (=> (not res!269121) (not e!264646))))

(declare-datatypes ((List!7992 0))(
  ( (Nil!7989) (Cons!7988 (h!8844 (_ BitVec 64)) (t!13772 List!7992)) )
))
(declare-fun arrayNoDuplicates!0 (array!28004 (_ BitVec 32) List!7992) Bool)

(assert (=> b!451890 (= res!269121 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7989))))

(declare-fun b!451891 () Bool)

(declare-fun res!269133 () Bool)

(assert (=> b!451891 (=> (not res!269133) (not e!264646))))

(assert (=> b!451891 (= res!269133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451892 () Bool)

(declare-fun e!264648 () Bool)

(declare-fun e!264644 () Bool)

(assert (=> b!451892 (= e!264648 (not e!264644))))

(declare-fun res!269122 () Bool)

(assert (=> b!451892 (=> res!269122 e!264644)))

(assert (=> b!451892 (= res!269122 (validKeyInArray!0 (select (arr!13446 _keys!709) from!863)))))

(assert (=> b!451892 e!264650))

(declare-fun c!56069 () Bool)

(assert (=> b!451892 (= c!56069 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun v!412 () V!17243)

(declare-datatypes ((Unit!13197 0))(
  ( (Unit!13198) )
))
(declare-fun lt!205066 () Unit!13197)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!719 (array!28004 array!28006 (_ BitVec 32) (_ BitVec 32) V!17243 V!17243 (_ BitVec 32) (_ BitVec 64) V!17243 (_ BitVec 32) Int) Unit!13197)

(assert (=> b!451892 (= lt!205066 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!719 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451893 () Bool)

(assert (=> b!451893 (= e!264642 e!264648)))

(declare-fun res!269125 () Bool)

(assert (=> b!451893 (=> (not res!269125) (not e!264648))))

(assert (=> b!451893 (= res!269125 (= from!863 i!563))))

(declare-fun lt!205068 () array!28006)

(declare-fun lt!205069 () ListLongMap!6837)

(assert (=> b!451893 (= lt!205069 (getCurrentListMapNoExtraKeys!1663 lt!205070 lt!205068 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451893 (= lt!205068 (array!28007 (store (arr!13447 _values!549) i!563 (ValueCellFull!5708 v!412)) (size!13799 _values!549)))))

(declare-fun lt!205067 () ListLongMap!6837)

(assert (=> b!451893 (= lt!205067 (getCurrentListMapNoExtraKeys!1663 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451894 () Bool)

(assert (=> b!451894 (= e!264643 tp_is_empty!12103)))

(declare-fun res!269126 () Bool)

(assert (=> start!40762 (=> (not res!269126) (not e!264646))))

(assert (=> start!40762 (= res!269126 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13798 _keys!709))))))

(assert (=> start!40762 e!264646))

(assert (=> start!40762 tp_is_empty!12103))

(assert (=> start!40762 tp!38117))

(assert (=> start!40762 true))

(declare-fun array_inv!9816 (array!28006) Bool)

(assert (=> start!40762 (and (array_inv!9816 _values!549) e!264645)))

(declare-fun array_inv!9817 (array!28004) Bool)

(assert (=> start!40762 (array_inv!9817 _keys!709)))

(declare-fun b!451885 () Bool)

(assert (=> b!451885 (= e!264644 (bvslt from!863 (size!13799 _values!549)))))

(declare-fun +!1560 (ListLongMap!6837 tuple2!7922) ListLongMap!6837)

(declare-fun get!6633 (ValueCell!5708 V!17243) V!17243)

(declare-fun dynLambda!860 (Int (_ BitVec 64)) V!17243)

(assert (=> b!451885 (= lt!205069 (+!1560 (getCurrentListMapNoExtraKeys!1663 lt!205070 lt!205068 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7923 (select (arr!13446 lt!205070) from!863) (get!6633 (select (arr!13447 lt!205068) from!863) (dynLambda!860 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451895 () Bool)

(declare-fun res!269128 () Bool)

(assert (=> b!451895 (=> (not res!269128) (not e!264642))))

(assert (=> b!451895 (= res!269128 (arrayNoDuplicates!0 lt!205070 #b00000000000000000000000000000000 Nil!7989))))

(declare-fun b!451896 () Bool)

(assert (=> b!451896 (= e!264650 (= call!29895 (+!1560 call!29894 (tuple2!7923 k0!794 v!412))))))

(declare-fun bm!29892 () Bool)

(assert (=> bm!29892 (= call!29895 (getCurrentListMapNoExtraKeys!1663 lt!205070 lt!205068 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19791 () Bool)

(assert (=> mapIsEmpty!19791 mapRes!19791))

(declare-fun b!451897 () Bool)

(declare-fun res!269123 () Bool)

(assert (=> b!451897 (=> (not res!269123) (not e!264646))))

(assert (=> b!451897 (= res!269123 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13798 _keys!709))))))

(assert (= (and start!40762 res!269126) b!451882))

(assert (= (and b!451882 res!269130) b!451888))

(assert (= (and b!451888 res!269131) b!451891))

(assert (= (and b!451891 res!269133) b!451890))

(assert (= (and b!451890 res!269121) b!451897))

(assert (= (and b!451897 res!269123) b!451879))

(assert (= (and b!451879 res!269129) b!451886))

(assert (= (and b!451886 res!269124) b!451889))

(assert (= (and b!451889 res!269134) b!451880))

(assert (= (and b!451880 res!269132) b!451895))

(assert (= (and b!451895 res!269128) b!451887))

(assert (= (and b!451887 res!269127) b!451893))

(assert (= (and b!451893 res!269125) b!451892))

(assert (= (and b!451892 c!56069) b!451896))

(assert (= (and b!451892 (not c!56069)) b!451884))

(assert (= (or b!451896 b!451884) bm!29892))

(assert (= (or b!451896 b!451884) bm!29891))

(assert (= (and b!451892 (not res!269122)) b!451885))

(assert (= (and b!451881 condMapEmpty!19791) mapIsEmpty!19791))

(assert (= (and b!451881 (not condMapEmpty!19791)) mapNonEmpty!19791))

(get-info :version)

(assert (= (and mapNonEmpty!19791 ((_ is ValueCellFull!5708) mapValue!19791)) b!451883))

(assert (= (and b!451881 ((_ is ValueCellFull!5708) mapDefault!19791)) b!451894))

(assert (= start!40762 b!451881))

(declare-fun b_lambda!9557 () Bool)

(assert (=> (not b_lambda!9557) (not b!451885)))

(declare-fun t!13770 () Bool)

(declare-fun tb!3737 () Bool)

(assert (=> (and start!40762 (= defaultEntry!557 defaultEntry!557) t!13770) tb!3737))

(declare-fun result!7019 () Bool)

(assert (=> tb!3737 (= result!7019 tp_is_empty!12103)))

(assert (=> b!451885 t!13770))

(declare-fun b_and!18829 () Bool)

(assert (= b_and!18827 (and (=> t!13770 result!7019) b_and!18829)))

(declare-fun m!435857 () Bool)

(assert (=> b!451893 m!435857))

(declare-fun m!435859 () Bool)

(assert (=> b!451893 m!435859))

(declare-fun m!435861 () Bool)

(assert (=> b!451893 m!435861))

(declare-fun m!435863 () Bool)

(assert (=> b!451885 m!435863))

(declare-fun m!435865 () Bool)

(assert (=> b!451885 m!435865))

(declare-fun m!435867 () Bool)

(assert (=> b!451885 m!435867))

(declare-fun m!435869 () Bool)

(assert (=> b!451885 m!435869))

(declare-fun m!435871 () Bool)

(assert (=> b!451885 m!435871))

(assert (=> b!451885 m!435865))

(declare-fun m!435873 () Bool)

(assert (=> b!451885 m!435873))

(assert (=> b!451885 m!435869))

(assert (=> b!451885 m!435863))

(declare-fun m!435875 () Bool)

(assert (=> b!451890 m!435875))

(declare-fun m!435877 () Bool)

(assert (=> b!451889 m!435877))

(declare-fun m!435879 () Bool)

(assert (=> b!451895 m!435879))

(declare-fun m!435881 () Bool)

(assert (=> b!451886 m!435881))

(declare-fun m!435883 () Bool)

(assert (=> mapNonEmpty!19791 m!435883))

(declare-fun m!435885 () Bool)

(assert (=> b!451882 m!435885))

(declare-fun m!435887 () Bool)

(assert (=> start!40762 m!435887))

(declare-fun m!435889 () Bool)

(assert (=> start!40762 m!435889))

(declare-fun m!435891 () Bool)

(assert (=> b!451891 m!435891))

(declare-fun m!435893 () Bool)

(assert (=> b!451879 m!435893))

(assert (=> bm!29892 m!435869))

(declare-fun m!435895 () Bool)

(assert (=> b!451880 m!435895))

(declare-fun m!435897 () Bool)

(assert (=> b!451880 m!435897))

(declare-fun m!435899 () Bool)

(assert (=> bm!29891 m!435899))

(declare-fun m!435901 () Bool)

(assert (=> b!451892 m!435901))

(assert (=> b!451892 m!435901))

(declare-fun m!435903 () Bool)

(assert (=> b!451892 m!435903))

(declare-fun m!435905 () Bool)

(assert (=> b!451892 m!435905))

(declare-fun m!435907 () Bool)

(assert (=> b!451896 m!435907))

(check-sat (not b!451879) b_and!18829 (not b!451893) (not mapNonEmpty!19791) (not b!451890) (not bm!29891) (not start!40762) (not b!451889) (not b!451882) tp_is_empty!12103 (not b!451896) (not b_next!10765) (not b!451880) (not b!451895) (not b!451885) (not bm!29892) (not b!451891) (not b!451892) (not b_lambda!9557))
(check-sat b_and!18829 (not b_next!10765))
