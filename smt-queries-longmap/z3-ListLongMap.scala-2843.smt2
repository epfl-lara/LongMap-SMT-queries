; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41030 () Bool)

(assert start!41030)

(declare-fun b_free!10957 () Bool)

(declare-fun b_next!10957 () Bool)

(assert (=> start!41030 (= b_free!10957 (not b_next!10957))))

(declare-fun tp!38701 () Bool)

(declare-fun b_and!19131 () Bool)

(assert (=> start!41030 (= tp!38701 b_and!19131)))

(declare-fun b!457341 () Bool)

(declare-fun res!273099 () Bool)

(declare-fun e!267118 () Bool)

(assert (=> b!457341 (=> (not res!273099) (not e!267118))))

(declare-datatypes ((array!28384 0))(
  ( (array!28385 (arr!13634 (Array (_ BitVec 32) (_ BitVec 64))) (size!13986 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28384)

(declare-datatypes ((List!8146 0))(
  ( (Nil!8143) (Cons!8142 (h!8998 (_ BitVec 64)) (t!13974 List!8146)) )
))
(declare-fun arrayNoDuplicates!0 (array!28384 (_ BitVec 32) List!8146) Bool)

(assert (=> b!457341 (= res!273099 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8143))))

(declare-fun b!457342 () Bool)

(declare-fun res!273096 () Bool)

(assert (=> b!457342 (=> (not res!273096) (not e!267118))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28384 (_ BitVec 32)) Bool)

(assert (=> b!457342 (= res!273096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457343 () Bool)

(declare-fun res!273091 () Bool)

(declare-fun e!267121 () Bool)

(assert (=> b!457343 (=> (not res!273091) (not e!267121))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457343 (= res!273091 (bvsle from!863 i!563))))

(declare-fun res!273093 () Bool)

(assert (=> start!41030 (=> (not res!273093) (not e!267118))))

(assert (=> start!41030 (= res!273093 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13986 _keys!709))))))

(assert (=> start!41030 e!267118))

(declare-fun tp_is_empty!12295 () Bool)

(assert (=> start!41030 tp_is_empty!12295))

(assert (=> start!41030 tp!38701))

(assert (=> start!41030 true))

(declare-datatypes ((V!17499 0))(
  ( (V!17500 (val!6192 Int)) )
))
(declare-datatypes ((ValueCell!5804 0))(
  ( (ValueCellFull!5804 (v!8463 V!17499)) (EmptyCell!5804) )
))
(declare-datatypes ((array!28386 0))(
  ( (array!28387 (arr!13635 (Array (_ BitVec 32) ValueCell!5804)) (size!13987 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28386)

(declare-fun e!267117 () Bool)

(declare-fun array_inv!9944 (array!28386) Bool)

(assert (=> start!41030 (and (array_inv!9944 _values!549) e!267117)))

(declare-fun array_inv!9945 (array!28384) Bool)

(assert (=> start!41030 (array_inv!9945 _keys!709)))

(declare-fun b!457344 () Bool)

(declare-fun e!267120 () Bool)

(declare-fun mapRes!20086 () Bool)

(assert (=> b!457344 (= e!267117 (and e!267120 mapRes!20086))))

(declare-fun condMapEmpty!20086 () Bool)

(declare-fun mapDefault!20086 () ValueCell!5804)

(assert (=> b!457344 (= condMapEmpty!20086 (= (arr!13635 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5804)) mapDefault!20086)))))

(declare-fun b!457345 () Bool)

(assert (=> b!457345 (= e!267118 e!267121)))

(declare-fun res!273101 () Bool)

(assert (=> b!457345 (=> (not res!273101) (not e!267121))))

(declare-fun lt!206913 () array!28384)

(assert (=> b!457345 (= res!273101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206913 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!457345 (= lt!206913 (array!28385 (store (arr!13634 _keys!709) i!563 k0!794) (size!13986 _keys!709)))))

(declare-fun b!457346 () Bool)

(declare-fun e!267122 () Bool)

(assert (=> b!457346 (= e!267122 (bvslt from!863 (size!13986 _keys!709)))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8072 0))(
  ( (tuple2!8073 (_1!4047 (_ BitVec 64)) (_2!4047 V!17499)) )
))
(declare-datatypes ((List!8147 0))(
  ( (Nil!8144) (Cons!8143 (h!8999 tuple2!8072) (t!13975 List!8147)) )
))
(declare-datatypes ((ListLongMap!6987 0))(
  ( (ListLongMap!6988 (toList!3509 List!8147)) )
))
(declare-fun lt!206910 () ListLongMap!6987)

(declare-fun lt!206909 () ListLongMap!6987)

(declare-fun +!1592 (ListLongMap!6987 tuple2!8072) ListLongMap!6987)

(declare-fun get!6718 (ValueCell!5804 V!17499) V!17499)

(declare-fun dynLambda!876 (Int (_ BitVec 64)) V!17499)

(assert (=> b!457346 (= lt!206909 (+!1592 lt!206910 (tuple2!8073 (select (arr!13634 _keys!709) from!863) (get!6718 (select (arr!13635 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457347 () Bool)

(declare-fun res!273100 () Bool)

(assert (=> b!457347 (=> (not res!273100) (not e!267118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457347 (= res!273100 (validMask!0 mask!1025))))

(declare-fun b!457348 () Bool)

(declare-fun res!273097 () Bool)

(assert (=> b!457348 (=> (not res!273097) (not e!267118))))

(declare-fun arrayContainsKey!0 (array!28384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457348 (= res!273097 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20086 () Bool)

(declare-fun tp!38700 () Bool)

(declare-fun e!267116 () Bool)

(assert (=> mapNonEmpty!20086 (= mapRes!20086 (and tp!38700 e!267116))))

(declare-fun mapValue!20086 () ValueCell!5804)

(declare-fun mapRest!20086 () (Array (_ BitVec 32) ValueCell!5804))

(declare-fun mapKey!20086 () (_ BitVec 32))

(assert (=> mapNonEmpty!20086 (= (arr!13635 _values!549) (store mapRest!20086 mapKey!20086 mapValue!20086))))

(declare-fun b!457349 () Bool)

(declare-fun res!273090 () Bool)

(assert (=> b!457349 (=> (not res!273090) (not e!267118))))

(assert (=> b!457349 (= res!273090 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13986 _keys!709))))))

(declare-fun b!457350 () Bool)

(declare-fun res!273088 () Bool)

(assert (=> b!457350 (=> (not res!273088) (not e!267118))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!457350 (= res!273088 (and (= (size!13987 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13986 _keys!709) (size!13987 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457351 () Bool)

(assert (=> b!457351 (= e!267116 tp_is_empty!12295)))

(declare-fun b!457352 () Bool)

(declare-fun res!273094 () Bool)

(assert (=> b!457352 (=> (not res!273094) (not e!267118))))

(assert (=> b!457352 (= res!273094 (or (= (select (arr!13634 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13634 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457353 () Bool)

(declare-fun e!267123 () Bool)

(assert (=> b!457353 (= e!267123 (not e!267122))))

(declare-fun res!273092 () Bool)

(assert (=> b!457353 (=> res!273092 e!267122)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457353 (= res!273092 (not (validKeyInArray!0 (select (arr!13634 _keys!709) from!863))))))

(declare-fun lt!206914 () ListLongMap!6987)

(assert (=> b!457353 (= lt!206914 lt!206910)))

(declare-fun lt!206916 () ListLongMap!6987)

(declare-fun v!412 () V!17499)

(assert (=> b!457353 (= lt!206910 (+!1592 lt!206916 (tuple2!8073 k0!794 v!412)))))

(declare-fun minValue!515 () V!17499)

(declare-fun zeroValue!515 () V!17499)

(declare-fun lt!206912 () array!28386)

(declare-fun getCurrentListMapNoExtraKeys!1738 (array!28384 array!28386 (_ BitVec 32) (_ BitVec 32) V!17499 V!17499 (_ BitVec 32) Int) ListLongMap!6987)

(assert (=> b!457353 (= lt!206914 (getCurrentListMapNoExtraKeys!1738 lt!206913 lt!206912 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457353 (= lt!206916 (getCurrentListMapNoExtraKeys!1738 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13287 0))(
  ( (Unit!13288) )
))
(declare-fun lt!206911 () Unit!13287)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!751 (array!28384 array!28386 (_ BitVec 32) (_ BitVec 32) V!17499 V!17499 (_ BitVec 32) (_ BitVec 64) V!17499 (_ BitVec 32) Int) Unit!13287)

(assert (=> b!457353 (= lt!206911 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!751 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457354 () Bool)

(declare-fun res!273098 () Bool)

(assert (=> b!457354 (=> (not res!273098) (not e!267118))))

(assert (=> b!457354 (= res!273098 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!20086 () Bool)

(assert (=> mapIsEmpty!20086 mapRes!20086))

(declare-fun b!457355 () Bool)

(declare-fun res!273095 () Bool)

(assert (=> b!457355 (=> (not res!273095) (not e!267121))))

(assert (=> b!457355 (= res!273095 (arrayNoDuplicates!0 lt!206913 #b00000000000000000000000000000000 Nil!8143))))

(declare-fun b!457356 () Bool)

(assert (=> b!457356 (= e!267120 tp_is_empty!12295)))

(declare-fun b!457357 () Bool)

(assert (=> b!457357 (= e!267121 e!267123)))

(declare-fun res!273089 () Bool)

(assert (=> b!457357 (=> (not res!273089) (not e!267123))))

(assert (=> b!457357 (= res!273089 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!457357 (= lt!206909 (getCurrentListMapNoExtraKeys!1738 lt!206913 lt!206912 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457357 (= lt!206912 (array!28387 (store (arr!13635 _values!549) i!563 (ValueCellFull!5804 v!412)) (size!13987 _values!549)))))

(declare-fun lt!206915 () ListLongMap!6987)

(assert (=> b!457357 (= lt!206915 (getCurrentListMapNoExtraKeys!1738 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!41030 res!273093) b!457347))

(assert (= (and b!457347 res!273100) b!457350))

(assert (= (and b!457350 res!273088) b!457342))

(assert (= (and b!457342 res!273096) b!457341))

(assert (= (and b!457341 res!273099) b!457349))

(assert (= (and b!457349 res!273090) b!457354))

(assert (= (and b!457354 res!273098) b!457352))

(assert (= (and b!457352 res!273094) b!457348))

(assert (= (and b!457348 res!273097) b!457345))

(assert (= (and b!457345 res!273101) b!457355))

(assert (= (and b!457355 res!273095) b!457343))

(assert (= (and b!457343 res!273091) b!457357))

(assert (= (and b!457357 res!273089) b!457353))

(assert (= (and b!457353 (not res!273092)) b!457346))

(assert (= (and b!457344 condMapEmpty!20086) mapIsEmpty!20086))

(assert (= (and b!457344 (not condMapEmpty!20086)) mapNonEmpty!20086))

(get-info :version)

(assert (= (and mapNonEmpty!20086 ((_ is ValueCellFull!5804) mapValue!20086)) b!457351))

(assert (= (and b!457344 ((_ is ValueCellFull!5804) mapDefault!20086)) b!457356))

(assert (= start!41030 b!457344))

(declare-fun b_lambda!9737 () Bool)

(assert (=> (not b_lambda!9737) (not b!457346)))

(declare-fun t!13973 () Bool)

(declare-fun tb!3785 () Bool)

(assert (=> (and start!41030 (= defaultEntry!557 defaultEntry!557) t!13973) tb!3785))

(declare-fun result!7119 () Bool)

(assert (=> tb!3785 (= result!7119 tp_is_empty!12295)))

(assert (=> b!457346 t!13973))

(declare-fun b_and!19133 () Bool)

(assert (= b_and!19131 (and (=> t!13973 result!7119) b_and!19133)))

(declare-fun m!440943 () Bool)

(assert (=> b!457352 m!440943))

(declare-fun m!440945 () Bool)

(assert (=> b!457357 m!440945))

(declare-fun m!440947 () Bool)

(assert (=> b!457357 m!440947))

(declare-fun m!440949 () Bool)

(assert (=> b!457357 m!440949))

(declare-fun m!440951 () Bool)

(assert (=> b!457347 m!440951))

(declare-fun m!440953 () Bool)

(assert (=> b!457341 m!440953))

(declare-fun m!440955 () Bool)

(assert (=> b!457342 m!440955))

(declare-fun m!440957 () Bool)

(assert (=> b!457346 m!440957))

(declare-fun m!440959 () Bool)

(assert (=> b!457346 m!440959))

(declare-fun m!440961 () Bool)

(assert (=> b!457346 m!440961))

(declare-fun m!440963 () Bool)

(assert (=> b!457346 m!440963))

(assert (=> b!457346 m!440963))

(assert (=> b!457346 m!440961))

(declare-fun m!440965 () Bool)

(assert (=> b!457346 m!440965))

(declare-fun m!440967 () Bool)

(assert (=> b!457348 m!440967))

(declare-fun m!440969 () Bool)

(assert (=> b!457354 m!440969))

(declare-fun m!440971 () Bool)

(assert (=> b!457355 m!440971))

(assert (=> b!457353 m!440957))

(declare-fun m!440973 () Bool)

(assert (=> b!457353 m!440973))

(declare-fun m!440975 () Bool)

(assert (=> b!457353 m!440975))

(declare-fun m!440977 () Bool)

(assert (=> b!457353 m!440977))

(assert (=> b!457353 m!440957))

(declare-fun m!440979 () Bool)

(assert (=> b!457353 m!440979))

(declare-fun m!440981 () Bool)

(assert (=> b!457353 m!440981))

(declare-fun m!440983 () Bool)

(assert (=> mapNonEmpty!20086 m!440983))

(declare-fun m!440985 () Bool)

(assert (=> start!41030 m!440985))

(declare-fun m!440987 () Bool)

(assert (=> start!41030 m!440987))

(declare-fun m!440989 () Bool)

(assert (=> b!457345 m!440989))

(declare-fun m!440991 () Bool)

(assert (=> b!457345 m!440991))

(check-sat (not start!41030) (not b_next!10957) tp_is_empty!12295 (not b!457345) (not mapNonEmpty!20086) (not b!457357) (not b!457355) (not b!457341) (not b!457353) (not b!457348) (not b!457346) (not b_lambda!9737) (not b!457354) (not b!457347) b_and!19133 (not b!457342))
(check-sat b_and!19133 (not b_next!10957))
