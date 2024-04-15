; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39782 () Bool)

(assert start!39782)

(declare-fun b_free!10063 () Bool)

(declare-fun b_next!10063 () Bool)

(assert (=> start!39782 (= b_free!10063 (not b_next!10063))))

(declare-fun tp!35718 () Bool)

(declare-fun b_and!17759 () Bool)

(assert (=> start!39782 (= tp!35718 b_and!17759)))

(declare-fun b!428926 () Bool)

(declare-fun res!251900 () Bool)

(declare-fun e!254079 () Bool)

(assert (=> b!428926 (=> (not res!251900) (not e!254079))))

(declare-datatypes ((array!26259 0))(
  ( (array!26260 (arr!12579 (Array (_ BitVec 32) (_ BitVec 64))) (size!12932 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26259)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428926 (= res!251900 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428927 () Bool)

(declare-fun e!254071 () Bool)

(declare-fun tp_is_empty!11215 () Bool)

(assert (=> b!428927 (= e!254071 tp_is_empty!11215)))

(declare-fun b!428928 () Bool)

(declare-datatypes ((Unit!12594 0))(
  ( (Unit!12595) )
))
(declare-fun e!254075 () Unit!12594)

(declare-fun Unit!12596 () Unit!12594)

(assert (=> b!428928 (= e!254075 Unit!12596)))

(declare-fun b!428929 () Bool)

(declare-fun e!254076 () Bool)

(assert (=> b!428929 (= e!254076 tp_is_empty!11215)))

(declare-fun mapNonEmpty!18444 () Bool)

(declare-fun mapRes!18444 () Bool)

(declare-fun tp!35717 () Bool)

(assert (=> mapNonEmpty!18444 (= mapRes!18444 (and tp!35717 e!254071))))

(declare-fun mapKey!18444 () (_ BitVec 32))

(declare-datatypes ((V!16059 0))(
  ( (V!16060 (val!5652 Int)) )
))
(declare-datatypes ((ValueCell!5264 0))(
  ( (ValueCellFull!5264 (v!7893 V!16059)) (EmptyCell!5264) )
))
(declare-fun mapRest!18444 () (Array (_ BitVec 32) ValueCell!5264))

(declare-datatypes ((array!26261 0))(
  ( (array!26262 (arr!12580 (Array (_ BitVec 32) ValueCell!5264)) (size!12933 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26261)

(declare-fun mapValue!18444 () ValueCell!5264)

(assert (=> mapNonEmpty!18444 (= (arr!12580 _values!549) (store mapRest!18444 mapKey!18444 mapValue!18444))))

(declare-fun b!428930 () Bool)

(declare-fun res!251907 () Bool)

(declare-fun e!254072 () Bool)

(assert (=> b!428930 (=> (not res!251907) (not e!254072))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428930 (= res!251907 (bvsle from!863 i!563))))

(declare-fun b!428931 () Bool)

(declare-fun res!251910 () Bool)

(assert (=> b!428931 (=> (not res!251910) (not e!254079))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428931 (= res!251910 (validMask!0 mask!1025))))

(declare-fun b!428932 () Bool)

(declare-fun res!251908 () Bool)

(assert (=> b!428932 (=> (not res!251908) (not e!254079))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!428932 (= res!251908 (and (= (size!12933 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12932 _keys!709) (size!12933 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428933 () Bool)

(declare-fun res!251913 () Bool)

(assert (=> b!428933 (=> (not res!251913) (not e!254072))))

(declare-fun lt!195909 () array!26259)

(declare-datatypes ((List!7444 0))(
  ( (Nil!7441) (Cons!7440 (h!8296 (_ BitVec 64)) (t!12947 List!7444)) )
))
(declare-fun arrayNoDuplicates!0 (array!26259 (_ BitVec 32) List!7444) Bool)

(assert (=> b!428933 (= res!251913 (arrayNoDuplicates!0 lt!195909 #b00000000000000000000000000000000 Nil!7441))))

(declare-fun b!428935 () Bool)

(assert (=> b!428935 (= e!254079 e!254072)))

(declare-fun res!251909 () Bool)

(assert (=> b!428935 (=> (not res!251909) (not e!254072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26259 (_ BitVec 32)) Bool)

(assert (=> b!428935 (= res!251909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195909 mask!1025))))

(assert (=> b!428935 (= lt!195909 (array!26260 (store (arr!12579 _keys!709) i!563 k0!794) (size!12932 _keys!709)))))

(declare-fun b!428936 () Bool)

(declare-fun e!254078 () Bool)

(assert (=> b!428936 (= e!254078 (and e!254076 mapRes!18444))))

(declare-fun condMapEmpty!18444 () Bool)

(declare-fun mapDefault!18444 () ValueCell!5264)

(assert (=> b!428936 (= condMapEmpty!18444 (= (arr!12580 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5264)) mapDefault!18444)))))

(declare-fun b!428937 () Bool)

(declare-fun res!251906 () Bool)

(assert (=> b!428937 (=> (not res!251906) (not e!254079))))

(assert (=> b!428937 (= res!251906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428938 () Bool)

(declare-fun res!251903 () Bool)

(assert (=> b!428938 (=> (not res!251903) (not e!254079))))

(assert (=> b!428938 (= res!251903 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12932 _keys!709))))))

(declare-fun b!428939 () Bool)

(declare-fun e!254073 () Bool)

(assert (=> b!428939 (= e!254073 true)))

(assert (=> b!428939 (not (= (select (arr!12579 _keys!709) from!863) k0!794))))

(declare-fun lt!195906 () Unit!12594)

(assert (=> b!428939 (= lt!195906 e!254075)))

(declare-fun c!55359 () Bool)

(assert (=> b!428939 (= c!55359 (= (select (arr!12579 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7444 0))(
  ( (tuple2!7445 (_1!3733 (_ BitVec 64)) (_2!3733 V!16059)) )
))
(declare-datatypes ((List!7445 0))(
  ( (Nil!7442) (Cons!7441 (h!8297 tuple2!7444) (t!12948 List!7445)) )
))
(declare-datatypes ((ListLongMap!6347 0))(
  ( (ListLongMap!6348 (toList!3189 List!7445)) )
))
(declare-fun lt!195902 () ListLongMap!6347)

(declare-fun lt!195907 () ListLongMap!6347)

(declare-fun +!1367 (ListLongMap!6347 tuple2!7444) ListLongMap!6347)

(declare-fun get!6236 (ValueCell!5264 V!16059) V!16059)

(declare-fun dynLambda!764 (Int (_ BitVec 64)) V!16059)

(assert (=> b!428939 (= lt!195907 (+!1367 lt!195902 (tuple2!7445 (select (arr!12579 _keys!709) from!863) (get!6236 (select (arr!12580 _values!549) from!863) (dynLambda!764 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428940 () Bool)

(declare-fun Unit!12597 () Unit!12594)

(assert (=> b!428940 (= e!254075 Unit!12597)))

(declare-fun lt!195908 () Unit!12594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26259 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12594)

(assert (=> b!428940 (= lt!195908 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428940 false))

(declare-fun b!428941 () Bool)

(declare-fun e!254077 () Bool)

(assert (=> b!428941 (= e!254077 (not e!254073))))

(declare-fun res!251912 () Bool)

(assert (=> b!428941 (=> res!251912 e!254073)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428941 (= res!251912 (not (validKeyInArray!0 (select (arr!12579 _keys!709) from!863))))))

(declare-fun lt!195910 () ListLongMap!6347)

(assert (=> b!428941 (= lt!195910 lt!195902)))

(declare-fun lt!195904 () ListLongMap!6347)

(declare-fun v!412 () V!16059)

(assert (=> b!428941 (= lt!195902 (+!1367 lt!195904 (tuple2!7445 k0!794 v!412)))))

(declare-fun minValue!515 () V!16059)

(declare-fun lt!195905 () array!26261)

(declare-fun zeroValue!515 () V!16059)

(declare-fun getCurrentListMapNoExtraKeys!1396 (array!26259 array!26261 (_ BitVec 32) (_ BitVec 32) V!16059 V!16059 (_ BitVec 32) Int) ListLongMap!6347)

(assert (=> b!428941 (= lt!195910 (getCurrentListMapNoExtraKeys!1396 lt!195909 lt!195905 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428941 (= lt!195904 (getCurrentListMapNoExtraKeys!1396 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195903 () Unit!12594)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!532 (array!26259 array!26261 (_ BitVec 32) (_ BitVec 32) V!16059 V!16059 (_ BitVec 32) (_ BitVec 64) V!16059 (_ BitVec 32) Int) Unit!12594)

(assert (=> b!428941 (= lt!195903 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!532 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!251904 () Bool)

(assert (=> start!39782 (=> (not res!251904) (not e!254079))))

(assert (=> start!39782 (= res!251904 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12932 _keys!709))))))

(assert (=> start!39782 e!254079))

(assert (=> start!39782 tp_is_empty!11215))

(assert (=> start!39782 tp!35718))

(assert (=> start!39782 true))

(declare-fun array_inv!9194 (array!26261) Bool)

(assert (=> start!39782 (and (array_inv!9194 _values!549) e!254078)))

(declare-fun array_inv!9195 (array!26259) Bool)

(assert (=> start!39782 (array_inv!9195 _keys!709)))

(declare-fun b!428934 () Bool)

(declare-fun res!251902 () Bool)

(assert (=> b!428934 (=> (not res!251902) (not e!254079))))

(assert (=> b!428934 (= res!251902 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7441))))

(declare-fun b!428942 () Bool)

(declare-fun res!251901 () Bool)

(assert (=> b!428942 (=> (not res!251901) (not e!254079))))

(assert (=> b!428942 (= res!251901 (or (= (select (arr!12579 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12579 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18444 () Bool)

(assert (=> mapIsEmpty!18444 mapRes!18444))

(declare-fun b!428943 () Bool)

(declare-fun res!251905 () Bool)

(assert (=> b!428943 (=> (not res!251905) (not e!254079))))

(assert (=> b!428943 (= res!251905 (validKeyInArray!0 k0!794))))

(declare-fun b!428944 () Bool)

(assert (=> b!428944 (= e!254072 e!254077)))

(declare-fun res!251911 () Bool)

(assert (=> b!428944 (=> (not res!251911) (not e!254077))))

(assert (=> b!428944 (= res!251911 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!428944 (= lt!195907 (getCurrentListMapNoExtraKeys!1396 lt!195909 lt!195905 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428944 (= lt!195905 (array!26262 (store (arr!12580 _values!549) i!563 (ValueCellFull!5264 v!412)) (size!12933 _values!549)))))

(declare-fun lt!195911 () ListLongMap!6347)

(assert (=> b!428944 (= lt!195911 (getCurrentListMapNoExtraKeys!1396 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39782 res!251904) b!428931))

(assert (= (and b!428931 res!251910) b!428932))

(assert (= (and b!428932 res!251908) b!428937))

(assert (= (and b!428937 res!251906) b!428934))

(assert (= (and b!428934 res!251902) b!428938))

(assert (= (and b!428938 res!251903) b!428943))

(assert (= (and b!428943 res!251905) b!428942))

(assert (= (and b!428942 res!251901) b!428926))

(assert (= (and b!428926 res!251900) b!428935))

(assert (= (and b!428935 res!251909) b!428933))

(assert (= (and b!428933 res!251913) b!428930))

(assert (= (and b!428930 res!251907) b!428944))

(assert (= (and b!428944 res!251911) b!428941))

(assert (= (and b!428941 (not res!251912)) b!428939))

(assert (= (and b!428939 c!55359) b!428940))

(assert (= (and b!428939 (not c!55359)) b!428928))

(assert (= (and b!428936 condMapEmpty!18444) mapIsEmpty!18444))

(assert (= (and b!428936 (not condMapEmpty!18444)) mapNonEmpty!18444))

(get-info :version)

(assert (= (and mapNonEmpty!18444 ((_ is ValueCellFull!5264) mapValue!18444)) b!428927))

(assert (= (and b!428936 ((_ is ValueCellFull!5264) mapDefault!18444)) b!428929))

(assert (= start!39782 b!428936))

(declare-fun b_lambda!9133 () Bool)

(assert (=> (not b_lambda!9133) (not b!428939)))

(declare-fun t!12946 () Bool)

(declare-fun tb!3461 () Bool)

(assert (=> (and start!39782 (= defaultEntry!557 defaultEntry!557) t!12946) tb!3461))

(declare-fun result!6457 () Bool)

(assert (=> tb!3461 (= result!6457 tp_is_empty!11215)))

(assert (=> b!428939 t!12946))

(declare-fun b_and!17761 () Bool)

(assert (= b_and!17759 (and (=> t!12946 result!6457) b_and!17761)))

(declare-fun m!416805 () Bool)

(assert (=> b!428941 m!416805))

(declare-fun m!416807 () Bool)

(assert (=> b!428941 m!416807))

(declare-fun m!416809 () Bool)

(assert (=> b!428941 m!416809))

(assert (=> b!428941 m!416805))

(declare-fun m!416811 () Bool)

(assert (=> b!428941 m!416811))

(declare-fun m!416813 () Bool)

(assert (=> b!428941 m!416813))

(declare-fun m!416815 () Bool)

(assert (=> b!428941 m!416815))

(declare-fun m!416817 () Bool)

(assert (=> b!428926 m!416817))

(declare-fun m!416819 () Bool)

(assert (=> b!428943 m!416819))

(declare-fun m!416821 () Bool)

(assert (=> b!428944 m!416821))

(declare-fun m!416823 () Bool)

(assert (=> b!428944 m!416823))

(declare-fun m!416825 () Bool)

(assert (=> b!428944 m!416825))

(declare-fun m!416827 () Bool)

(assert (=> b!428931 m!416827))

(declare-fun m!416829 () Bool)

(assert (=> mapNonEmpty!18444 m!416829))

(declare-fun m!416831 () Bool)

(assert (=> b!428934 m!416831))

(declare-fun m!416833 () Bool)

(assert (=> b!428937 m!416833))

(declare-fun m!416835 () Bool)

(assert (=> b!428935 m!416835))

(declare-fun m!416837 () Bool)

(assert (=> b!428935 m!416837))

(declare-fun m!416839 () Bool)

(assert (=> b!428940 m!416839))

(declare-fun m!416841 () Bool)

(assert (=> start!39782 m!416841))

(declare-fun m!416843 () Bool)

(assert (=> start!39782 m!416843))

(assert (=> b!428939 m!416805))

(declare-fun m!416845 () Bool)

(assert (=> b!428939 m!416845))

(declare-fun m!416847 () Bool)

(assert (=> b!428939 m!416847))

(declare-fun m!416849 () Bool)

(assert (=> b!428939 m!416849))

(assert (=> b!428939 m!416849))

(assert (=> b!428939 m!416845))

(declare-fun m!416851 () Bool)

(assert (=> b!428939 m!416851))

(declare-fun m!416853 () Bool)

(assert (=> b!428942 m!416853))

(declare-fun m!416855 () Bool)

(assert (=> b!428933 m!416855))

(check-sat (not b!428926) tp_is_empty!11215 (not b!428934) (not b_next!10063) (not b!428937) (not b!428931) (not b!428940) b_and!17761 (not b!428941) (not b_lambda!9133) (not b!428939) (not b!428935) (not mapNonEmpty!18444) (not b!428943) (not b!428944) (not b!428933) (not start!39782))
(check-sat b_and!17761 (not b_next!10063))
