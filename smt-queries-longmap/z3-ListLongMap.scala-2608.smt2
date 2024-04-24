; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39452 () Bool)

(assert start!39452)

(declare-fun b_free!9733 () Bool)

(declare-fun b_next!9733 () Bool)

(assert (=> start!39452 (= b_free!9733 (not b_next!9733))))

(declare-fun tp!34728 () Bool)

(declare-fun b_and!17355 () Bool)

(assert (=> start!39452 (= tp!34728 b_and!17355)))

(declare-fun b!420862 () Bool)

(declare-fun res!245574 () Bool)

(declare-fun e!250615 () Bool)

(assert (=> b!420862 (=> (not res!245574) (not e!250615))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420862 (= res!245574 (bvsle from!863 i!563))))

(declare-fun b!420863 () Bool)

(declare-fun res!245582 () Bool)

(declare-fun e!250620 () Bool)

(assert (=> b!420863 (=> (not res!245582) (not e!250620))))

(declare-datatypes ((array!25626 0))(
  ( (array!25627 (arr!12262 (Array (_ BitVec 32) (_ BitVec 64))) (size!12614 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25626)

(assert (=> b!420863 (= res!245582 (or (= (select (arr!12262 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12262 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420864 () Bool)

(declare-fun e!250614 () Bool)

(assert (=> b!420864 (= e!250615 e!250614)))

(declare-fun res!245586 () Bool)

(assert (=> b!420864 (=> (not res!245586) (not e!250614))))

(assert (=> b!420864 (= res!245586 (= from!863 i!563))))

(declare-datatypes ((V!15619 0))(
  ( (V!15620 (val!5487 Int)) )
))
(declare-fun minValue!515 () V!15619)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15619)

(declare-datatypes ((tuple2!7076 0))(
  ( (tuple2!7077 (_1!3549 (_ BitVec 64)) (_2!3549 V!15619)) )
))
(declare-datatypes ((List!7081 0))(
  ( (Nil!7078) (Cons!7077 (h!7933 tuple2!7076) (t!12471 List!7081)) )
))
(declare-datatypes ((ListLongMap!5991 0))(
  ( (ListLongMap!5992 (toList!3011 List!7081)) )
))
(declare-fun lt!193196 () ListLongMap!5991)

(declare-fun lt!193189 () array!25626)

(declare-datatypes ((ValueCell!5099 0))(
  ( (ValueCellFull!5099 (v!7735 V!15619)) (EmptyCell!5099) )
))
(declare-datatypes ((array!25628 0))(
  ( (array!25629 (arr!12263 (Array (_ BitVec 32) ValueCell!5099)) (size!12615 (_ BitVec 32))) )
))
(declare-fun lt!193195 () array!25628)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1257 (array!25626 array!25628 (_ BitVec 32) (_ BitVec 32) V!15619 V!15619 (_ BitVec 32) Int) ListLongMap!5991)

(assert (=> b!420864 (= lt!193196 (getCurrentListMapNoExtraKeys!1257 lt!193189 lt!193195 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25628)

(declare-fun v!412 () V!15619)

(assert (=> b!420864 (= lt!193195 (array!25629 (store (arr!12263 _values!549) i!563 (ValueCellFull!5099 v!412)) (size!12615 _values!549)))))

(declare-fun lt!193193 () ListLongMap!5991)

(assert (=> b!420864 (= lt!193193 (getCurrentListMapNoExtraKeys!1257 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420865 () Bool)

(declare-fun e!250618 () Bool)

(declare-fun tp_is_empty!10885 () Bool)

(assert (=> b!420865 (= e!250618 tp_is_empty!10885)))

(declare-fun b!420866 () Bool)

(declare-fun res!245579 () Bool)

(assert (=> b!420866 (=> (not res!245579) (not e!250620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25626 (_ BitVec 32)) Bool)

(assert (=> b!420866 (= res!245579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420868 () Bool)

(declare-fun res!245584 () Bool)

(assert (=> b!420868 (=> (not res!245584) (not e!250620))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420868 (= res!245584 (validKeyInArray!0 k0!794))))

(declare-fun b!420869 () Bool)

(declare-fun res!245576 () Bool)

(assert (=> b!420869 (=> (not res!245576) (not e!250615))))

(declare-datatypes ((List!7082 0))(
  ( (Nil!7079) (Cons!7078 (h!7934 (_ BitVec 64)) (t!12472 List!7082)) )
))
(declare-fun arrayNoDuplicates!0 (array!25626 (_ BitVec 32) List!7082) Bool)

(assert (=> b!420869 (= res!245576 (arrayNoDuplicates!0 lt!193189 #b00000000000000000000000000000000 Nil!7079))))

(declare-fun b!420870 () Bool)

(declare-fun res!245573 () Bool)

(assert (=> b!420870 (=> (not res!245573) (not e!250620))))

(declare-fun arrayContainsKey!0 (array!25626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420870 (= res!245573 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17949 () Bool)

(declare-fun mapRes!17949 () Bool)

(assert (=> mapIsEmpty!17949 mapRes!17949))

(declare-fun b!420871 () Bool)

(declare-fun e!250621 () Bool)

(declare-fun call!29365 () ListLongMap!5991)

(declare-fun call!29364 () ListLongMap!5991)

(assert (=> b!420871 (= e!250621 (= call!29365 call!29364))))

(declare-fun b!420872 () Bool)

(declare-fun e!250617 () Bool)

(assert (=> b!420872 (= e!250614 (not e!250617))))

(declare-fun res!245583 () Bool)

(assert (=> b!420872 (=> res!245583 e!250617)))

(assert (=> b!420872 (= res!245583 (validKeyInArray!0 (select (arr!12262 _keys!709) from!863)))))

(assert (=> b!420872 e!250621))

(declare-fun c!55290 () Bool)

(assert (=> b!420872 (= c!55290 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12421 0))(
  ( (Unit!12422) )
))
(declare-fun lt!193191 () Unit!12421)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!460 (array!25626 array!25628 (_ BitVec 32) (_ BitVec 32) V!15619 V!15619 (_ BitVec 32) (_ BitVec 64) V!15619 (_ BitVec 32) Int) Unit!12421)

(assert (=> b!420872 (= lt!193191 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!460 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420873 () Bool)

(declare-fun e!250619 () Bool)

(assert (=> b!420873 (= e!250619 tp_is_empty!10885)))

(declare-fun b!420874 () Bool)

(declare-fun res!245581 () Bool)

(assert (=> b!420874 (=> (not res!245581) (not e!250620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420874 (= res!245581 (validMask!0 mask!1025))))

(declare-fun bm!29361 () Bool)

(assert (=> bm!29361 (= call!29365 (getCurrentListMapNoExtraKeys!1257 (ite c!55290 _keys!709 lt!193189) (ite c!55290 _values!549 lt!193195) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420875 () Bool)

(declare-fun res!245580 () Bool)

(assert (=> b!420875 (=> (not res!245580) (not e!250620))))

(assert (=> b!420875 (= res!245580 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12614 _keys!709))))))

(declare-fun bm!29362 () Bool)

(assert (=> bm!29362 (= call!29364 (getCurrentListMapNoExtraKeys!1257 (ite c!55290 lt!193189 _keys!709) (ite c!55290 lt!193195 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420876 () Bool)

(declare-fun res!245585 () Bool)

(assert (=> b!420876 (=> (not res!245585) (not e!250620))))

(assert (=> b!420876 (= res!245585 (and (= (size!12615 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12614 _keys!709) (size!12615 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420877 () Bool)

(assert (=> b!420877 (= e!250620 e!250615)))

(declare-fun res!245578 () Bool)

(assert (=> b!420877 (=> (not res!245578) (not e!250615))))

(assert (=> b!420877 (= res!245578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193189 mask!1025))))

(assert (=> b!420877 (= lt!193189 (array!25627 (store (arr!12262 _keys!709) i!563 k0!794) (size!12614 _keys!709)))))

(declare-fun b!420867 () Bool)

(declare-fun +!1274 (ListLongMap!5991 tuple2!7076) ListLongMap!5991)

(assert (=> b!420867 (= e!250621 (= call!29364 (+!1274 call!29365 (tuple2!7077 k0!794 v!412))))))

(declare-fun res!245577 () Bool)

(assert (=> start!39452 (=> (not res!245577) (not e!250620))))

(assert (=> start!39452 (= res!245577 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12614 _keys!709))))))

(assert (=> start!39452 e!250620))

(assert (=> start!39452 tp_is_empty!10885))

(assert (=> start!39452 tp!34728))

(assert (=> start!39452 true))

(declare-fun e!250616 () Bool)

(declare-fun array_inv!9014 (array!25628) Bool)

(assert (=> start!39452 (and (array_inv!9014 _values!549) e!250616)))

(declare-fun array_inv!9015 (array!25626) Bool)

(assert (=> start!39452 (array_inv!9015 _keys!709)))

(declare-fun b!420878 () Bool)

(assert (=> b!420878 (= e!250616 (and e!250618 mapRes!17949))))

(declare-fun condMapEmpty!17949 () Bool)

(declare-fun mapDefault!17949 () ValueCell!5099)

(assert (=> b!420878 (= condMapEmpty!17949 (= (arr!12263 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5099)) mapDefault!17949)))))

(declare-fun b!420879 () Bool)

(assert (=> b!420879 (= e!250617 true)))

(declare-fun lt!193192 () tuple2!7076)

(declare-fun lt!193190 () ListLongMap!5991)

(declare-fun lt!193187 () V!15619)

(assert (=> b!420879 (= (+!1274 lt!193190 lt!193192) (+!1274 (+!1274 lt!193190 (tuple2!7077 k0!794 lt!193187)) lt!193192))))

(declare-fun lt!193197 () V!15619)

(assert (=> b!420879 (= lt!193192 (tuple2!7077 k0!794 lt!193197))))

(declare-fun lt!193194 () Unit!12421)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!64 (ListLongMap!5991 (_ BitVec 64) V!15619 V!15619) Unit!12421)

(assert (=> b!420879 (= lt!193194 (addSameAsAddTwiceSameKeyDiffValues!64 lt!193190 k0!794 lt!193187 lt!193197))))

(declare-fun lt!193188 () V!15619)

(declare-fun get!6096 (ValueCell!5099 V!15619) V!15619)

(assert (=> b!420879 (= lt!193187 (get!6096 (select (arr!12263 _values!549) from!863) lt!193188))))

(assert (=> b!420879 (= lt!193196 (+!1274 lt!193190 (tuple2!7077 (select (arr!12262 lt!193189) from!863) lt!193197)))))

(assert (=> b!420879 (= lt!193197 (get!6096 (select (store (arr!12263 _values!549) i!563 (ValueCellFull!5099 v!412)) from!863) lt!193188))))

(declare-fun dynLambda!731 (Int (_ BitVec 64)) V!15619)

(assert (=> b!420879 (= lt!193188 (dynLambda!731 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420879 (= lt!193190 (getCurrentListMapNoExtraKeys!1257 lt!193189 lt!193195 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420880 () Bool)

(declare-fun res!245575 () Bool)

(assert (=> b!420880 (=> (not res!245575) (not e!250620))))

(assert (=> b!420880 (= res!245575 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7079))))

(declare-fun mapNonEmpty!17949 () Bool)

(declare-fun tp!34727 () Bool)

(assert (=> mapNonEmpty!17949 (= mapRes!17949 (and tp!34727 e!250619))))

(declare-fun mapKey!17949 () (_ BitVec 32))

(declare-fun mapRest!17949 () (Array (_ BitVec 32) ValueCell!5099))

(declare-fun mapValue!17949 () ValueCell!5099)

(assert (=> mapNonEmpty!17949 (= (arr!12263 _values!549) (store mapRest!17949 mapKey!17949 mapValue!17949))))

(assert (= (and start!39452 res!245577) b!420874))

(assert (= (and b!420874 res!245581) b!420876))

(assert (= (and b!420876 res!245585) b!420866))

(assert (= (and b!420866 res!245579) b!420880))

(assert (= (and b!420880 res!245575) b!420875))

(assert (= (and b!420875 res!245580) b!420868))

(assert (= (and b!420868 res!245584) b!420863))

(assert (= (and b!420863 res!245582) b!420870))

(assert (= (and b!420870 res!245573) b!420877))

(assert (= (and b!420877 res!245578) b!420869))

(assert (= (and b!420869 res!245576) b!420862))

(assert (= (and b!420862 res!245574) b!420864))

(assert (= (and b!420864 res!245586) b!420872))

(assert (= (and b!420872 c!55290) b!420867))

(assert (= (and b!420872 (not c!55290)) b!420871))

(assert (= (or b!420867 b!420871) bm!29362))

(assert (= (or b!420867 b!420871) bm!29361))

(assert (= (and b!420872 (not res!245583)) b!420879))

(assert (= (and b!420878 condMapEmpty!17949) mapIsEmpty!17949))

(assert (= (and b!420878 (not condMapEmpty!17949)) mapNonEmpty!17949))

(get-info :version)

(assert (= (and mapNonEmpty!17949 ((_ is ValueCellFull!5099) mapValue!17949)) b!420873))

(assert (= (and b!420878 ((_ is ValueCellFull!5099) mapDefault!17949)) b!420865))

(assert (= start!39452 b!420878))

(declare-fun b_lambda!9059 () Bool)

(assert (=> (not b_lambda!9059) (not b!420879)))

(declare-fun t!12470 () Bool)

(declare-fun tb!3347 () Bool)

(assert (=> (and start!39452 (= defaultEntry!557 defaultEntry!557) t!12470) tb!3347))

(declare-fun result!6229 () Bool)

(assert (=> tb!3347 (= result!6229 tp_is_empty!10885)))

(assert (=> b!420879 t!12470))

(declare-fun b_and!17357 () Bool)

(assert (= b_and!17355 (and (=> t!12470 result!6229) b_and!17357)))

(declare-fun m!410809 () Bool)

(assert (=> b!420868 m!410809))

(declare-fun m!410811 () Bool)

(assert (=> b!420867 m!410811))

(declare-fun m!410813 () Bool)

(assert (=> start!39452 m!410813))

(declare-fun m!410815 () Bool)

(assert (=> start!39452 m!410815))

(declare-fun m!410817 () Bool)

(assert (=> bm!29361 m!410817))

(declare-fun m!410819 () Bool)

(assert (=> b!420864 m!410819))

(declare-fun m!410821 () Bool)

(assert (=> b!420864 m!410821))

(declare-fun m!410823 () Bool)

(assert (=> b!420864 m!410823))

(declare-fun m!410825 () Bool)

(assert (=> mapNonEmpty!17949 m!410825))

(declare-fun m!410827 () Bool)

(assert (=> b!420872 m!410827))

(assert (=> b!420872 m!410827))

(declare-fun m!410829 () Bool)

(assert (=> b!420872 m!410829))

(declare-fun m!410831 () Bool)

(assert (=> b!420872 m!410831))

(declare-fun m!410833 () Bool)

(assert (=> b!420866 m!410833))

(declare-fun m!410835 () Bool)

(assert (=> b!420877 m!410835))

(declare-fun m!410837 () Bool)

(assert (=> b!420877 m!410837))

(declare-fun m!410839 () Bool)

(assert (=> b!420863 m!410839))

(declare-fun m!410841 () Bool)

(assert (=> b!420880 m!410841))

(declare-fun m!410843 () Bool)

(assert (=> b!420870 m!410843))

(declare-fun m!410845 () Bool)

(assert (=> b!420874 m!410845))

(declare-fun m!410847 () Bool)

(assert (=> b!420869 m!410847))

(declare-fun m!410849 () Bool)

(assert (=> bm!29362 m!410849))

(declare-fun m!410851 () Bool)

(assert (=> b!420879 m!410851))

(declare-fun m!410853 () Bool)

(assert (=> b!420879 m!410853))

(declare-fun m!410855 () Bool)

(assert (=> b!420879 m!410855))

(assert (=> b!420879 m!410821))

(declare-fun m!410857 () Bool)

(assert (=> b!420879 m!410857))

(assert (=> b!420879 m!410851))

(declare-fun m!410859 () Bool)

(assert (=> b!420879 m!410859))

(declare-fun m!410861 () Bool)

(assert (=> b!420879 m!410861))

(declare-fun m!410863 () Bool)

(assert (=> b!420879 m!410863))

(declare-fun m!410865 () Bool)

(assert (=> b!420879 m!410865))

(declare-fun m!410867 () Bool)

(assert (=> b!420879 m!410867))

(assert (=> b!420879 m!410867))

(declare-fun m!410869 () Bool)

(assert (=> b!420879 m!410869))

(assert (=> b!420879 m!410859))

(declare-fun m!410871 () Bool)

(assert (=> b!420879 m!410871))

(declare-fun m!410873 () Bool)

(assert (=> b!420879 m!410873))

(check-sat (not b!420869) (not b!420879) (not b!420866) (not b!420872) (not b!420877) b_and!17357 (not b!420874) (not b_next!9733) (not bm!29361) (not b!420868) (not b!420867) tp_is_empty!10885 (not mapNonEmpty!17949) (not b!420880) (not b!420864) (not start!39452) (not bm!29362) (not b_lambda!9059) (not b!420870))
(check-sat b_and!17357 (not b_next!9733))
