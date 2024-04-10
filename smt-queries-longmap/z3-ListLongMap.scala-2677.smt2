; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39882 () Bool)

(assert start!39882)

(declare-fun b_free!10149 () Bool)

(declare-fun b_next!10149 () Bool)

(assert (=> start!39882 (= b_free!10149 (not b_next!10149))))

(declare-fun tp!35975 () Bool)

(declare-fun b_and!17957 () Bool)

(assert (=> start!39882 (= tp!35975 b_and!17957)))

(declare-fun res!253924 () Bool)

(declare-fun e!255496 () Bool)

(assert (=> start!39882 (=> (not res!253924) (not e!255496))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26437 0))(
  ( (array!26438 (arr!12668 (Array (_ BitVec 32) (_ BitVec 64))) (size!13020 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26437)

(assert (=> start!39882 (= res!253924 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13020 _keys!709))))))

(assert (=> start!39882 e!255496))

(declare-fun tp_is_empty!11301 () Bool)

(assert (=> start!39882 tp_is_empty!11301))

(assert (=> start!39882 tp!35975))

(assert (=> start!39882 true))

(declare-datatypes ((V!16173 0))(
  ( (V!16174 (val!5695 Int)) )
))
(declare-datatypes ((ValueCell!5307 0))(
  ( (ValueCellFull!5307 (v!7942 V!16173)) (EmptyCell!5307) )
))
(declare-datatypes ((array!26439 0))(
  ( (array!26440 (arr!12669 (Array (_ BitVec 32) ValueCell!5307)) (size!13021 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26439)

(declare-fun e!255500 () Bool)

(declare-fun array_inv!9218 (array!26439) Bool)

(assert (=> start!39882 (and (array_inv!9218 _values!549) e!255500)))

(declare-fun array_inv!9219 (array!26437) Bool)

(assert (=> start!39882 (array_inv!9219 _keys!709)))

(declare-fun b!431820 () Bool)

(declare-fun res!253933 () Bool)

(assert (=> b!431820 (=> (not res!253933) (not e!255496))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!431820 (= res!253933 (and (= (size!13021 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13020 _keys!709) (size!13021 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431821 () Bool)

(declare-fun res!253927 () Bool)

(assert (=> b!431821 (=> (not res!253927) (not e!255496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26437 (_ BitVec 32)) Bool)

(assert (=> b!431821 (= res!253927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431822 () Bool)

(declare-fun e!255493 () Bool)

(declare-fun mapRes!18573 () Bool)

(assert (=> b!431822 (= e!255500 (and e!255493 mapRes!18573))))

(declare-fun condMapEmpty!18573 () Bool)

(declare-fun mapDefault!18573 () ValueCell!5307)

(assert (=> b!431822 (= condMapEmpty!18573 (= (arr!12669 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5307)) mapDefault!18573)))))

(declare-fun b!431823 () Bool)

(declare-fun res!253935 () Bool)

(assert (=> b!431823 (=> (not res!253935) (not e!255496))))

(declare-datatypes ((List!7528 0))(
  ( (Nil!7525) (Cons!7524 (h!8380 (_ BitVec 64)) (t!13126 List!7528)) )
))
(declare-fun arrayNoDuplicates!0 (array!26437 (_ BitVec 32) List!7528) Bool)

(assert (=> b!431823 (= res!253935 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7525))))

(declare-fun b!431824 () Bool)

(assert (=> b!431824 (= e!255493 tp_is_empty!11301)))

(declare-fun b!431825 () Bool)

(declare-fun e!255494 () Bool)

(assert (=> b!431825 (= e!255494 tp_is_empty!11301)))

(declare-fun b!431826 () Bool)

(declare-fun res!253931 () Bool)

(assert (=> b!431826 (=> (not res!253931) (not e!255496))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431826 (= res!253931 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431827 () Bool)

(declare-fun e!255497 () Bool)

(declare-fun e!255499 () Bool)

(assert (=> b!431827 (= e!255497 e!255499)))

(declare-fun res!253926 () Bool)

(assert (=> b!431827 (=> (not res!253926) (not e!255499))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431827 (= res!253926 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16173)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!197856 () array!26439)

(declare-fun zeroValue!515 () V!16173)

(declare-fun lt!197861 () array!26437)

(declare-datatypes ((tuple2!7514 0))(
  ( (tuple2!7515 (_1!3768 (_ BitVec 64)) (_2!3768 V!16173)) )
))
(declare-datatypes ((List!7529 0))(
  ( (Nil!7526) (Cons!7525 (h!8381 tuple2!7514) (t!13127 List!7529)) )
))
(declare-datatypes ((ListLongMap!6427 0))(
  ( (ListLongMap!6428 (toList!3229 List!7529)) )
))
(declare-fun lt!197863 () ListLongMap!6427)

(declare-fun getCurrentListMapNoExtraKeys!1427 (array!26437 array!26439 (_ BitVec 32) (_ BitVec 32) V!16173 V!16173 (_ BitVec 32) Int) ListLongMap!6427)

(assert (=> b!431827 (= lt!197863 (getCurrentListMapNoExtraKeys!1427 lt!197861 lt!197856 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16173)

(assert (=> b!431827 (= lt!197856 (array!26440 (store (arr!12669 _values!549) i!563 (ValueCellFull!5307 v!412)) (size!13021 _values!549)))))

(declare-fun lt!197867 () ListLongMap!6427)

(assert (=> b!431827 (= lt!197867 (getCurrentListMapNoExtraKeys!1427 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18573 () Bool)

(assert (=> mapIsEmpty!18573 mapRes!18573))

(declare-fun b!431828 () Bool)

(declare-fun res!253922 () Bool)

(assert (=> b!431828 (=> (not res!253922) (not e!255497))))

(assert (=> b!431828 (= res!253922 (bvsle from!863 i!563))))

(declare-fun b!431829 () Bool)

(declare-fun e!255495 () Bool)

(declare-fun e!255501 () Bool)

(assert (=> b!431829 (= e!255495 e!255501)))

(declare-fun res!253934 () Bool)

(assert (=> b!431829 (=> res!253934 e!255501)))

(assert (=> b!431829 (= res!253934 (= k0!794 (select (arr!12668 _keys!709) from!863)))))

(assert (=> b!431829 (not (= (select (arr!12668 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12739 0))(
  ( (Unit!12740) )
))
(declare-fun lt!197858 () Unit!12739)

(declare-fun e!255498 () Unit!12739)

(assert (=> b!431829 (= lt!197858 e!255498)))

(declare-fun c!55559 () Bool)

(assert (=> b!431829 (= c!55559 (= (select (arr!12668 _keys!709) from!863) k0!794))))

(declare-fun lt!197859 () ListLongMap!6427)

(assert (=> b!431829 (= lt!197863 lt!197859)))

(declare-fun lt!197862 () ListLongMap!6427)

(declare-fun lt!197864 () tuple2!7514)

(declare-fun +!1377 (ListLongMap!6427 tuple2!7514) ListLongMap!6427)

(assert (=> b!431829 (= lt!197859 (+!1377 lt!197862 lt!197864))))

(declare-fun lt!197860 () V!16173)

(assert (=> b!431829 (= lt!197864 (tuple2!7515 (select (arr!12668 _keys!709) from!863) lt!197860))))

(declare-fun get!6295 (ValueCell!5307 V!16173) V!16173)

(declare-fun dynLambda!798 (Int (_ BitVec 64)) V!16173)

(assert (=> b!431829 (= lt!197860 (get!6295 (select (arr!12669 _values!549) from!863) (dynLambda!798 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431830 () Bool)

(declare-fun res!253923 () Bool)

(assert (=> b!431830 (=> (not res!253923) (not e!255496))))

(assert (=> b!431830 (= res!253923 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13020 _keys!709))))))

(declare-fun b!431831 () Bool)

(declare-fun Unit!12741 () Unit!12739)

(assert (=> b!431831 (= e!255498 Unit!12741)))

(declare-fun lt!197868 () Unit!12739)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26437 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12739)

(assert (=> b!431831 (= lt!197868 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431831 false))

(declare-fun b!431832 () Bool)

(declare-fun res!253921 () Bool)

(assert (=> b!431832 (=> (not res!253921) (not e!255496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431832 (= res!253921 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18573 () Bool)

(declare-fun tp!35976 () Bool)

(assert (=> mapNonEmpty!18573 (= mapRes!18573 (and tp!35976 e!255494))))

(declare-fun mapKey!18573 () (_ BitVec 32))

(declare-fun mapRest!18573 () (Array (_ BitVec 32) ValueCell!5307))

(declare-fun mapValue!18573 () ValueCell!5307)

(assert (=> mapNonEmpty!18573 (= (arr!12669 _values!549) (store mapRest!18573 mapKey!18573 mapValue!18573))))

(declare-fun b!431833 () Bool)

(declare-fun Unit!12742 () Unit!12739)

(assert (=> b!431833 (= e!255498 Unit!12742)))

(declare-fun b!431834 () Bool)

(declare-fun res!253925 () Bool)

(assert (=> b!431834 (=> (not res!253925) (not e!255496))))

(assert (=> b!431834 (= res!253925 (or (= (select (arr!12668 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12668 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431835 () Bool)

(declare-fun res!253932 () Bool)

(assert (=> b!431835 (=> (not res!253932) (not e!255496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431835 (= res!253932 (validKeyInArray!0 k0!794))))

(declare-fun b!431836 () Bool)

(assert (=> b!431836 (= e!255501 true)))

(declare-fun lt!197865 () tuple2!7514)

(declare-fun lt!197869 () ListLongMap!6427)

(assert (=> b!431836 (= lt!197859 (+!1377 (+!1377 lt!197869 lt!197864) lt!197865))))

(declare-fun lt!197870 () Unit!12739)

(declare-fun addCommutativeForDiffKeys!368 (ListLongMap!6427 (_ BitVec 64) V!16173 (_ BitVec 64) V!16173) Unit!12739)

(assert (=> b!431836 (= lt!197870 (addCommutativeForDiffKeys!368 lt!197869 k0!794 v!412 (select (arr!12668 _keys!709) from!863) lt!197860))))

(declare-fun b!431837 () Bool)

(assert (=> b!431837 (= e!255499 (not e!255495))))

(declare-fun res!253928 () Bool)

(assert (=> b!431837 (=> res!253928 e!255495)))

(assert (=> b!431837 (= res!253928 (not (validKeyInArray!0 (select (arr!12668 _keys!709) from!863))))))

(declare-fun lt!197857 () ListLongMap!6427)

(assert (=> b!431837 (= lt!197857 lt!197862)))

(assert (=> b!431837 (= lt!197862 (+!1377 lt!197869 lt!197865))))

(assert (=> b!431837 (= lt!197857 (getCurrentListMapNoExtraKeys!1427 lt!197861 lt!197856 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431837 (= lt!197865 (tuple2!7515 k0!794 v!412))))

(assert (=> b!431837 (= lt!197869 (getCurrentListMapNoExtraKeys!1427 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197866 () Unit!12739)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!562 (array!26437 array!26439 (_ BitVec 32) (_ BitVec 32) V!16173 V!16173 (_ BitVec 32) (_ BitVec 64) V!16173 (_ BitVec 32) Int) Unit!12739)

(assert (=> b!431837 (= lt!197866 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!562 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431838 () Bool)

(assert (=> b!431838 (= e!255496 e!255497)))

(declare-fun res!253929 () Bool)

(assert (=> b!431838 (=> (not res!253929) (not e!255497))))

(assert (=> b!431838 (= res!253929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197861 mask!1025))))

(assert (=> b!431838 (= lt!197861 (array!26438 (store (arr!12668 _keys!709) i!563 k0!794) (size!13020 _keys!709)))))

(declare-fun b!431839 () Bool)

(declare-fun res!253930 () Bool)

(assert (=> b!431839 (=> (not res!253930) (not e!255497))))

(assert (=> b!431839 (= res!253930 (arrayNoDuplicates!0 lt!197861 #b00000000000000000000000000000000 Nil!7525))))

(assert (= (and start!39882 res!253924) b!431832))

(assert (= (and b!431832 res!253921) b!431820))

(assert (= (and b!431820 res!253933) b!431821))

(assert (= (and b!431821 res!253927) b!431823))

(assert (= (and b!431823 res!253935) b!431830))

(assert (= (and b!431830 res!253923) b!431835))

(assert (= (and b!431835 res!253932) b!431834))

(assert (= (and b!431834 res!253925) b!431826))

(assert (= (and b!431826 res!253931) b!431838))

(assert (= (and b!431838 res!253929) b!431839))

(assert (= (and b!431839 res!253930) b!431828))

(assert (= (and b!431828 res!253922) b!431827))

(assert (= (and b!431827 res!253926) b!431837))

(assert (= (and b!431837 (not res!253928)) b!431829))

(assert (= (and b!431829 c!55559) b!431831))

(assert (= (and b!431829 (not c!55559)) b!431833))

(assert (= (and b!431829 (not res!253934)) b!431836))

(assert (= (and b!431822 condMapEmpty!18573) mapIsEmpty!18573))

(assert (= (and b!431822 (not condMapEmpty!18573)) mapNonEmpty!18573))

(get-info :version)

(assert (= (and mapNonEmpty!18573 ((_ is ValueCellFull!5307) mapValue!18573)) b!431825))

(assert (= (and b!431822 ((_ is ValueCellFull!5307) mapDefault!18573)) b!431824))

(assert (= start!39882 b!431822))

(declare-fun b_lambda!9237 () Bool)

(assert (=> (not b_lambda!9237) (not b!431829)))

(declare-fun t!13125 () Bool)

(declare-fun tb!3555 () Bool)

(assert (=> (and start!39882 (= defaultEntry!557 defaultEntry!557) t!13125) tb!3555))

(declare-fun result!6637 () Bool)

(assert (=> tb!3555 (= result!6637 tp_is_empty!11301)))

(assert (=> b!431829 t!13125))

(declare-fun b_and!17959 () Bool)

(assert (= b_and!17957 (and (=> t!13125 result!6637) b_and!17959)))

(declare-fun m!419941 () Bool)

(assert (=> b!431835 m!419941))

(declare-fun m!419943 () Bool)

(assert (=> start!39882 m!419943))

(declare-fun m!419945 () Bool)

(assert (=> start!39882 m!419945))

(declare-fun m!419947 () Bool)

(assert (=> b!431831 m!419947))

(declare-fun m!419949 () Bool)

(assert (=> b!431826 m!419949))

(declare-fun m!419951 () Bool)

(assert (=> b!431836 m!419951))

(assert (=> b!431836 m!419951))

(declare-fun m!419953 () Bool)

(assert (=> b!431836 m!419953))

(declare-fun m!419955 () Bool)

(assert (=> b!431836 m!419955))

(assert (=> b!431836 m!419955))

(declare-fun m!419957 () Bool)

(assert (=> b!431836 m!419957))

(declare-fun m!419959 () Bool)

(assert (=> mapNonEmpty!18573 m!419959))

(declare-fun m!419961 () Bool)

(assert (=> b!431827 m!419961))

(declare-fun m!419963 () Bool)

(assert (=> b!431827 m!419963))

(declare-fun m!419965 () Bool)

(assert (=> b!431827 m!419965))

(declare-fun m!419967 () Bool)

(assert (=> b!431823 m!419967))

(assert (=> b!431829 m!419955))

(declare-fun m!419969 () Bool)

(assert (=> b!431829 m!419969))

(declare-fun m!419971 () Bool)

(assert (=> b!431829 m!419971))

(declare-fun m!419973 () Bool)

(assert (=> b!431829 m!419973))

(assert (=> b!431829 m!419971))

(assert (=> b!431829 m!419969))

(declare-fun m!419975 () Bool)

(assert (=> b!431829 m!419975))

(assert (=> b!431837 m!419955))

(declare-fun m!419977 () Bool)

(assert (=> b!431837 m!419977))

(declare-fun m!419979 () Bool)

(assert (=> b!431837 m!419979))

(declare-fun m!419981 () Bool)

(assert (=> b!431837 m!419981))

(assert (=> b!431837 m!419955))

(declare-fun m!419983 () Bool)

(assert (=> b!431837 m!419983))

(declare-fun m!419985 () Bool)

(assert (=> b!431837 m!419985))

(declare-fun m!419987 () Bool)

(assert (=> b!431832 m!419987))

(declare-fun m!419989 () Bool)

(assert (=> b!431838 m!419989))

(declare-fun m!419991 () Bool)

(assert (=> b!431838 m!419991))

(declare-fun m!419993 () Bool)

(assert (=> b!431821 m!419993))

(declare-fun m!419995 () Bool)

(assert (=> b!431839 m!419995))

(declare-fun m!419997 () Bool)

(assert (=> b!431834 m!419997))

(check-sat (not b!431838) (not mapNonEmpty!18573) (not b!431826) (not b!431839) (not start!39882) (not b!431831) (not b!431836) (not b!431832) (not b!431823) (not b!431835) b_and!17959 (not b_lambda!9237) (not b!431837) (not b!431829) (not b_next!10149) tp_is_empty!11301 (not b!431821) (not b!431827))
(check-sat b_and!17959 (not b_next!10149))
