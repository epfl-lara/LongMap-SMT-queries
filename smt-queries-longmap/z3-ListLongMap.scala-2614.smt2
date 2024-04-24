; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39488 () Bool)

(assert start!39488)

(declare-fun b_free!9769 () Bool)

(declare-fun b_next!9769 () Bool)

(assert (=> start!39488 (= b_free!9769 (not b_next!9769))))

(declare-fun tp!34835 () Bool)

(declare-fun b_and!17427 () Bool)

(assert (=> start!39488 (= tp!34835 b_and!17427)))

(declare-fun b!421924 () Bool)

(declare-fun res!246342 () Bool)

(declare-fun e!251104 () Bool)

(assert (=> b!421924 (=> (not res!246342) (not e!251104))))

(declare-datatypes ((array!25696 0))(
  ( (array!25697 (arr!12297 (Array (_ BitVec 32) (_ BitVec 64))) (size!12649 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25696)

(declare-datatypes ((List!7109 0))(
  ( (Nil!7106) (Cons!7105 (h!7961 (_ BitVec 64)) (t!12535 List!7109)) )
))
(declare-fun arrayNoDuplicates!0 (array!25696 (_ BitVec 32) List!7109) Bool)

(assert (=> b!421924 (= res!246342 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7106))))

(declare-fun b!421925 () Bool)

(declare-fun e!251107 () Bool)

(declare-fun e!251101 () Bool)

(assert (=> b!421925 (= e!251107 e!251101)))

(declare-fun res!246329 () Bool)

(assert (=> b!421925 (=> (not res!246329) (not e!251101))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421925 (= res!246329 (= from!863 i!563))))

(declare-datatypes ((V!15667 0))(
  ( (V!15668 (val!5505 Int)) )
))
(declare-fun minValue!515 () V!15667)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5117 0))(
  ( (ValueCellFull!5117 (v!7753 V!15667)) (EmptyCell!5117) )
))
(declare-datatypes ((array!25698 0))(
  ( (array!25699 (arr!12298 (Array (_ BitVec 32) ValueCell!5117)) (size!12650 (_ BitVec 32))) )
))
(declare-fun lt!193785 () array!25698)

(declare-fun lt!193781 () array!25696)

(declare-fun zeroValue!515 () V!15667)

(declare-datatypes ((tuple2!7108 0))(
  ( (tuple2!7109 (_1!3565 (_ BitVec 64)) (_2!3565 V!15667)) )
))
(declare-datatypes ((List!7110 0))(
  ( (Nil!7107) (Cons!7106 (h!7962 tuple2!7108) (t!12536 List!7110)) )
))
(declare-datatypes ((ListLongMap!6023 0))(
  ( (ListLongMap!6024 (toList!3027 List!7110)) )
))
(declare-fun lt!193789 () ListLongMap!6023)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1273 (array!25696 array!25698 (_ BitVec 32) (_ BitVec 32) V!15667 V!15667 (_ BitVec 32) Int) ListLongMap!6023)

(assert (=> b!421925 (= lt!193789 (getCurrentListMapNoExtraKeys!1273 lt!193781 lt!193785 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25698)

(declare-fun v!412 () V!15667)

(assert (=> b!421925 (= lt!193785 (array!25699 (store (arr!12298 _values!549) i!563 (ValueCellFull!5117 v!412)) (size!12650 _values!549)))))

(declare-fun lt!193787 () ListLongMap!6023)

(assert (=> b!421925 (= lt!193787 (getCurrentListMapNoExtraKeys!1273 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421926 () Bool)

(declare-fun res!246333 () Bool)

(assert (=> b!421926 (=> (not res!246333) (not e!251104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421926 (= res!246333 (validMask!0 mask!1025))))

(declare-fun b!421927 () Bool)

(declare-fun res!246335 () Bool)

(assert (=> b!421927 (=> (not res!246335) (not e!251104))))

(assert (=> b!421927 (= res!246335 (and (= (size!12650 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12649 _keys!709) (size!12650 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421928 () Bool)

(declare-fun res!246331 () Bool)

(assert (=> b!421928 (=> (not res!246331) (not e!251104))))

(assert (=> b!421928 (= res!246331 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12649 _keys!709))))))

(declare-fun b!421929 () Bool)

(assert (=> b!421929 (= e!251104 e!251107)))

(declare-fun res!246339 () Bool)

(assert (=> b!421929 (=> (not res!246339) (not e!251107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25696 (_ BitVec 32)) Bool)

(assert (=> b!421929 (= res!246339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193781 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!421929 (= lt!193781 (array!25697 (store (arr!12297 _keys!709) i!563 k0!794) (size!12649 _keys!709)))))

(declare-fun b!421930 () Bool)

(declare-fun e!251105 () Bool)

(assert (=> b!421930 (= e!251105 true)))

(declare-fun lt!193783 () tuple2!7108)

(declare-fun lt!193786 () V!15667)

(declare-fun lt!193788 () ListLongMap!6023)

(declare-fun +!1287 (ListLongMap!6023 tuple2!7108) ListLongMap!6023)

(assert (=> b!421930 (= (+!1287 lt!193788 lt!193783) (+!1287 (+!1287 lt!193788 (tuple2!7109 k0!794 lt!193786)) lt!193783))))

(declare-fun lt!193782 () V!15667)

(assert (=> b!421930 (= lt!193783 (tuple2!7109 k0!794 lt!193782))))

(declare-datatypes ((Unit!12449 0))(
  ( (Unit!12450) )
))
(declare-fun lt!193790 () Unit!12449)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!76 (ListLongMap!6023 (_ BitVec 64) V!15667 V!15667) Unit!12449)

(assert (=> b!421930 (= lt!193790 (addSameAsAddTwiceSameKeyDiffValues!76 lt!193788 k0!794 lt!193786 lt!193782))))

(declare-fun lt!193791 () V!15667)

(declare-fun get!6120 (ValueCell!5117 V!15667) V!15667)

(assert (=> b!421930 (= lt!193786 (get!6120 (select (arr!12298 _values!549) from!863) lt!193791))))

(assert (=> b!421930 (= lt!193789 (+!1287 lt!193788 (tuple2!7109 (select (arr!12297 lt!193781) from!863) lt!193782)))))

(assert (=> b!421930 (= lt!193782 (get!6120 (select (store (arr!12298 _values!549) i!563 (ValueCellFull!5117 v!412)) from!863) lt!193791))))

(declare-fun dynLambda!743 (Int (_ BitVec 64)) V!15667)

(assert (=> b!421930 (= lt!193791 (dynLambda!743 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421930 (= lt!193788 (getCurrentListMapNoExtraKeys!1273 lt!193781 lt!193785 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421931 () Bool)

(declare-fun e!251099 () Bool)

(declare-fun tp_is_empty!10921 () Bool)

(assert (=> b!421931 (= e!251099 tp_is_empty!10921)))

(declare-fun mapNonEmpty!18003 () Bool)

(declare-fun mapRes!18003 () Bool)

(declare-fun tp!34836 () Bool)

(assert (=> mapNonEmpty!18003 (= mapRes!18003 (and tp!34836 e!251099))))

(declare-fun mapValue!18003 () ValueCell!5117)

(declare-fun mapKey!18003 () (_ BitVec 32))

(declare-fun mapRest!18003 () (Array (_ BitVec 32) ValueCell!5117))

(assert (=> mapNonEmpty!18003 (= (arr!12298 _values!549) (store mapRest!18003 mapKey!18003 mapValue!18003))))

(declare-fun bm!29469 () Bool)

(declare-fun call!29473 () ListLongMap!6023)

(declare-fun c!55344 () Bool)

(assert (=> bm!29469 (= call!29473 (getCurrentListMapNoExtraKeys!1273 (ite c!55344 _keys!709 lt!193781) (ite c!55344 _values!549 lt!193785) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421932 () Bool)

(declare-fun e!251100 () Bool)

(declare-fun e!251103 () Bool)

(assert (=> b!421932 (= e!251100 (and e!251103 mapRes!18003))))

(declare-fun condMapEmpty!18003 () Bool)

(declare-fun mapDefault!18003 () ValueCell!5117)

(assert (=> b!421932 (= condMapEmpty!18003 (= (arr!12298 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5117)) mapDefault!18003)))))

(declare-fun e!251106 () Bool)

(declare-fun call!29472 () ListLongMap!6023)

(declare-fun b!421933 () Bool)

(assert (=> b!421933 (= e!251106 (= call!29472 (+!1287 call!29473 (tuple2!7109 k0!794 v!412))))))

(declare-fun b!421934 () Bool)

(declare-fun res!246341 () Bool)

(assert (=> b!421934 (=> (not res!246341) (not e!251104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421934 (= res!246341 (validKeyInArray!0 k0!794))))

(declare-fun b!421935 () Bool)

(declare-fun res!246337 () Bool)

(assert (=> b!421935 (=> (not res!246337) (not e!251104))))

(declare-fun arrayContainsKey!0 (array!25696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421935 (= res!246337 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421937 () Bool)

(assert (=> b!421937 (= e!251106 (= call!29473 call!29472))))

(declare-fun b!421938 () Bool)

(declare-fun res!246330 () Bool)

(assert (=> b!421938 (=> (not res!246330) (not e!251107))))

(assert (=> b!421938 (= res!246330 (bvsle from!863 i!563))))

(declare-fun bm!29470 () Bool)

(assert (=> bm!29470 (= call!29472 (getCurrentListMapNoExtraKeys!1273 (ite c!55344 lt!193781 _keys!709) (ite c!55344 lt!193785 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421936 () Bool)

(declare-fun res!246334 () Bool)

(assert (=> b!421936 (=> (not res!246334) (not e!251107))))

(assert (=> b!421936 (= res!246334 (arrayNoDuplicates!0 lt!193781 #b00000000000000000000000000000000 Nil!7106))))

(declare-fun res!246338 () Bool)

(assert (=> start!39488 (=> (not res!246338) (not e!251104))))

(assert (=> start!39488 (= res!246338 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12649 _keys!709))))))

(assert (=> start!39488 e!251104))

(assert (=> start!39488 tp_is_empty!10921))

(assert (=> start!39488 tp!34835))

(assert (=> start!39488 true))

(declare-fun array_inv!9038 (array!25698) Bool)

(assert (=> start!39488 (and (array_inv!9038 _values!549) e!251100)))

(declare-fun array_inv!9039 (array!25696) Bool)

(assert (=> start!39488 (array_inv!9039 _keys!709)))

(declare-fun b!421939 () Bool)

(declare-fun res!246336 () Bool)

(assert (=> b!421939 (=> (not res!246336) (not e!251104))))

(assert (=> b!421939 (= res!246336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421940 () Bool)

(assert (=> b!421940 (= e!251103 tp_is_empty!10921)))

(declare-fun b!421941 () Bool)

(assert (=> b!421941 (= e!251101 (not e!251105))))

(declare-fun res!246332 () Bool)

(assert (=> b!421941 (=> res!246332 e!251105)))

(assert (=> b!421941 (= res!246332 (validKeyInArray!0 (select (arr!12297 _keys!709) from!863)))))

(assert (=> b!421941 e!251106))

(assert (=> b!421941 (= c!55344 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193784 () Unit!12449)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!472 (array!25696 array!25698 (_ BitVec 32) (_ BitVec 32) V!15667 V!15667 (_ BitVec 32) (_ BitVec 64) V!15667 (_ BitVec 32) Int) Unit!12449)

(assert (=> b!421941 (= lt!193784 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!472 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18003 () Bool)

(assert (=> mapIsEmpty!18003 mapRes!18003))

(declare-fun b!421942 () Bool)

(declare-fun res!246340 () Bool)

(assert (=> b!421942 (=> (not res!246340) (not e!251104))))

(assert (=> b!421942 (= res!246340 (or (= (select (arr!12297 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12297 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39488 res!246338) b!421926))

(assert (= (and b!421926 res!246333) b!421927))

(assert (= (and b!421927 res!246335) b!421939))

(assert (= (and b!421939 res!246336) b!421924))

(assert (= (and b!421924 res!246342) b!421928))

(assert (= (and b!421928 res!246331) b!421934))

(assert (= (and b!421934 res!246341) b!421942))

(assert (= (and b!421942 res!246340) b!421935))

(assert (= (and b!421935 res!246337) b!421929))

(assert (= (and b!421929 res!246339) b!421936))

(assert (= (and b!421936 res!246334) b!421938))

(assert (= (and b!421938 res!246330) b!421925))

(assert (= (and b!421925 res!246329) b!421941))

(assert (= (and b!421941 c!55344) b!421933))

(assert (= (and b!421941 (not c!55344)) b!421937))

(assert (= (or b!421933 b!421937) bm!29470))

(assert (= (or b!421933 b!421937) bm!29469))

(assert (= (and b!421941 (not res!246332)) b!421930))

(assert (= (and b!421932 condMapEmpty!18003) mapIsEmpty!18003))

(assert (= (and b!421932 (not condMapEmpty!18003)) mapNonEmpty!18003))

(get-info :version)

(assert (= (and mapNonEmpty!18003 ((_ is ValueCellFull!5117) mapValue!18003)) b!421931))

(assert (= (and b!421932 ((_ is ValueCellFull!5117) mapDefault!18003)) b!421940))

(assert (= start!39488 b!421932))

(declare-fun b_lambda!9095 () Bool)

(assert (=> (not b_lambda!9095) (not b!421930)))

(declare-fun t!12534 () Bool)

(declare-fun tb!3383 () Bool)

(assert (=> (and start!39488 (= defaultEntry!557 defaultEntry!557) t!12534) tb!3383))

(declare-fun result!6301 () Bool)

(assert (=> tb!3383 (= result!6301 tp_is_empty!10921)))

(assert (=> b!421930 t!12534))

(declare-fun b_and!17429 () Bool)

(assert (= b_and!17427 (and (=> t!12534 result!6301) b_and!17429)))

(declare-fun m!411995 () Bool)

(assert (=> b!421935 m!411995))

(declare-fun m!411997 () Bool)

(assert (=> bm!29469 m!411997))

(declare-fun m!411999 () Bool)

(assert (=> b!421924 m!411999))

(declare-fun m!412001 () Bool)

(assert (=> b!421933 m!412001))

(declare-fun m!412003 () Bool)

(assert (=> b!421941 m!412003))

(assert (=> b!421941 m!412003))

(declare-fun m!412005 () Bool)

(assert (=> b!421941 m!412005))

(declare-fun m!412007 () Bool)

(assert (=> b!421941 m!412007))

(declare-fun m!412009 () Bool)

(assert (=> b!421942 m!412009))

(declare-fun m!412011 () Bool)

(assert (=> start!39488 m!412011))

(declare-fun m!412013 () Bool)

(assert (=> start!39488 m!412013))

(declare-fun m!412015 () Bool)

(assert (=> b!421934 m!412015))

(declare-fun m!412017 () Bool)

(assert (=> b!421926 m!412017))

(declare-fun m!412019 () Bool)

(assert (=> b!421925 m!412019))

(declare-fun m!412021 () Bool)

(assert (=> b!421925 m!412021))

(declare-fun m!412023 () Bool)

(assert (=> b!421925 m!412023))

(declare-fun m!412025 () Bool)

(assert (=> mapNonEmpty!18003 m!412025))

(declare-fun m!412027 () Bool)

(assert (=> b!421939 m!412027))

(declare-fun m!412029 () Bool)

(assert (=> b!421936 m!412029))

(declare-fun m!412031 () Bool)

(assert (=> b!421930 m!412031))

(assert (=> b!421930 m!412021))

(declare-fun m!412033 () Bool)

(assert (=> b!421930 m!412033))

(declare-fun m!412035 () Bool)

(assert (=> b!421930 m!412035))

(declare-fun m!412037 () Bool)

(assert (=> b!421930 m!412037))

(declare-fun m!412039 () Bool)

(assert (=> b!421930 m!412039))

(declare-fun m!412041 () Bool)

(assert (=> b!421930 m!412041))

(assert (=> b!421930 m!412035))

(declare-fun m!412043 () Bool)

(assert (=> b!421930 m!412043))

(declare-fun m!412045 () Bool)

(assert (=> b!421930 m!412045))

(declare-fun m!412047 () Bool)

(assert (=> b!421930 m!412047))

(declare-fun m!412049 () Bool)

(assert (=> b!421930 m!412049))

(assert (=> b!421930 m!412039))

(declare-fun m!412051 () Bool)

(assert (=> b!421930 m!412051))

(declare-fun m!412053 () Bool)

(assert (=> b!421930 m!412053))

(assert (=> b!421930 m!412047))

(declare-fun m!412055 () Bool)

(assert (=> bm!29470 m!412055))

(declare-fun m!412057 () Bool)

(assert (=> b!421929 m!412057))

(declare-fun m!412059 () Bool)

(assert (=> b!421929 m!412059))

(check-sat (not b!421929) (not b!421935) (not b_next!9769) (not b!421924) tp_is_empty!10921 (not b!421926) (not b!421936) (not start!39488) (not bm!29470) b_and!17429 (not bm!29469) (not b!421925) (not b!421939) (not b!421934) (not b_lambda!9095) (not b!421941) (not mapNonEmpty!18003) (not b!421930) (not b!421933))
(check-sat b_and!17429 (not b_next!9769))
