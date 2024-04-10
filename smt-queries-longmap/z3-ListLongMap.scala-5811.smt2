; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74940 () Bool)

(assert start!74940)

(declare-fun b_free!15459 () Bool)

(declare-fun b_next!15459 () Bool)

(assert (=> start!74940 (= b_free!15459 (not b_next!15459))))

(declare-fun tp!54080 () Bool)

(declare-fun b_and!25617 () Bool)

(assert (=> start!74940 (= tp!54080 b_and!25617)))

(declare-fun b!883983 () Bool)

(declare-fun res!600542 () Bool)

(declare-fun e!491945 () Bool)

(assert (=> b!883983 (=> (not res!600542) (not e!491945))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51532 0))(
  ( (array!51533 (arr!24785 (Array (_ BitVec 32) (_ BitVec 64))) (size!25225 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51532)

(assert (=> b!883983 (= res!600542 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25225 _keys!868))))))

(declare-fun b!883984 () Bool)

(declare-fun res!600539 () Bool)

(assert (=> b!883984 (=> (not res!600539) (not e!491945))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51532 (_ BitVec 32)) Bool)

(assert (=> b!883984 (= res!600539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883985 () Bool)

(declare-fun e!491947 () Bool)

(declare-fun e!491952 () Bool)

(assert (=> b!883985 (= e!491947 e!491952)))

(declare-fun res!600544 () Bool)

(assert (=> b!883985 (=> res!600544 e!491952)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!883985 (= res!600544 (= k0!854 (select (arr!24785 _keys!868) from!1053)))))

(assert (=> b!883985 (not (= (select (arr!24785 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!30177 0))(
  ( (Unit!30178) )
))
(declare-fun lt!400248 () Unit!30177)

(declare-fun e!491950 () Unit!30177)

(assert (=> b!883985 (= lt!400248 e!491950)))

(declare-fun c!93094 () Bool)

(assert (=> b!883985 (= c!93094 (= (select (arr!24785 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!28651 0))(
  ( (V!28652 (val!8899 Int)) )
))
(declare-datatypes ((tuple2!11798 0))(
  ( (tuple2!11799 (_1!5910 (_ BitVec 64)) (_2!5910 V!28651)) )
))
(declare-datatypes ((List!17604 0))(
  ( (Nil!17601) (Cons!17600 (h!18731 tuple2!11798) (t!24865 List!17604)) )
))
(declare-datatypes ((ListLongMap!10567 0))(
  ( (ListLongMap!10568 (toList!5299 List!17604)) )
))
(declare-fun lt!400262 () ListLongMap!10567)

(declare-fun lt!400249 () ListLongMap!10567)

(assert (=> b!883985 (= lt!400262 lt!400249)))

(declare-fun lt!400254 () ListLongMap!10567)

(declare-fun lt!400251 () tuple2!11798)

(declare-fun +!2568 (ListLongMap!10567 tuple2!11798) ListLongMap!10567)

(assert (=> b!883985 (= lt!400249 (+!2568 lt!400254 lt!400251))))

(declare-fun lt!400261 () V!28651)

(assert (=> b!883985 (= lt!400251 (tuple2!11799 (select (arr!24785 _keys!868) from!1053) lt!400261))))

(declare-datatypes ((ValueCell!8412 0))(
  ( (ValueCellFull!8412 (v!11368 V!28651)) (EmptyCell!8412) )
))
(declare-datatypes ((array!51534 0))(
  ( (array!51535 (arr!24786 (Array (_ BitVec 32) ValueCell!8412)) (size!25226 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51534)

(declare-fun defaultEntry!696 () Int)

(declare-fun get!13064 (ValueCell!8412 V!28651) V!28651)

(declare-fun dynLambda!1279 (Int (_ BitVec 64)) V!28651)

(assert (=> b!883985 (= lt!400261 (get!13064 (select (arr!24786 _values!688) from!1053) (dynLambda!1279 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883986 () Bool)

(declare-fun res!600547 () Bool)

(assert (=> b!883986 (=> (not res!600547) (not e!491945))))

(assert (=> b!883986 (= res!600547 (and (= (select (arr!24785 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883987 () Bool)

(declare-fun e!491948 () Bool)

(assert (=> b!883987 (= e!491948 (not e!491947))))

(declare-fun res!600546 () Bool)

(assert (=> b!883987 (=> res!600546 e!491947)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883987 (= res!600546 (not (validKeyInArray!0 (select (arr!24785 _keys!868) from!1053))))))

(declare-fun lt!400260 () ListLongMap!10567)

(assert (=> b!883987 (= lt!400260 lt!400254)))

(declare-fun lt!400253 () ListLongMap!10567)

(declare-fun lt!400255 () tuple2!11798)

(assert (=> b!883987 (= lt!400254 (+!2568 lt!400253 lt!400255))))

(declare-fun lt!400259 () array!51534)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28651)

(declare-fun zeroValue!654 () V!28651)

(declare-fun getCurrentListMapNoExtraKeys!3258 (array!51532 array!51534 (_ BitVec 32) (_ BitVec 32) V!28651 V!28651 (_ BitVec 32) Int) ListLongMap!10567)

(assert (=> b!883987 (= lt!400260 (getCurrentListMapNoExtraKeys!3258 _keys!868 lt!400259 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!28651)

(assert (=> b!883987 (= lt!400255 (tuple2!11799 k0!854 v!557))))

(assert (=> b!883987 (= lt!400253 (getCurrentListMapNoExtraKeys!3258 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400250 () Unit!30177)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!751 (array!51532 array!51534 (_ BitVec 32) (_ BitVec 32) V!28651 V!28651 (_ BitVec 32) (_ BitVec 64) V!28651 (_ BitVec 32) Int) Unit!30177)

(assert (=> b!883987 (= lt!400250 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!751 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883988 () Bool)

(declare-fun res!600543 () Bool)

(assert (=> b!883988 (=> (not res!600543) (not e!491945))))

(assert (=> b!883988 (= res!600543 (validKeyInArray!0 k0!854))))

(declare-fun b!883989 () Bool)

(assert (=> b!883989 (= e!491945 e!491948)))

(declare-fun res!600540 () Bool)

(assert (=> b!883989 (=> (not res!600540) (not e!491948))))

(assert (=> b!883989 (= res!600540 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!883989 (= lt!400262 (getCurrentListMapNoExtraKeys!3258 _keys!868 lt!400259 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883989 (= lt!400259 (array!51535 (store (arr!24786 _values!688) i!612 (ValueCellFull!8412 v!557)) (size!25226 _values!688)))))

(declare-fun lt!400256 () ListLongMap!10567)

(assert (=> b!883989 (= lt!400256 (getCurrentListMapNoExtraKeys!3258 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883990 () Bool)

(declare-fun e!491946 () Bool)

(declare-fun tp_is_empty!17703 () Bool)

(assert (=> b!883990 (= e!491946 tp_is_empty!17703)))

(declare-fun mapNonEmpty!28191 () Bool)

(declare-fun mapRes!28191 () Bool)

(declare-fun tp!54079 () Bool)

(declare-fun e!491944 () Bool)

(assert (=> mapNonEmpty!28191 (= mapRes!28191 (and tp!54079 e!491944))))

(declare-fun mapRest!28191 () (Array (_ BitVec 32) ValueCell!8412))

(declare-fun mapKey!28191 () (_ BitVec 32))

(declare-fun mapValue!28191 () ValueCell!8412)

(assert (=> mapNonEmpty!28191 (= (arr!24786 _values!688) (store mapRest!28191 mapKey!28191 mapValue!28191))))

(declare-fun b!883991 () Bool)

(declare-fun res!600541 () Bool)

(assert (=> b!883991 (=> (not res!600541) (not e!491945))))

(assert (=> b!883991 (= res!600541 (and (= (size!25226 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25225 _keys!868) (size!25226 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883992 () Bool)

(declare-fun res!600549 () Bool)

(assert (=> b!883992 (=> (not res!600549) (not e!491945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883992 (= res!600549 (validMask!0 mask!1196))))

(declare-fun b!883993 () Bool)

(assert (=> b!883993 (= e!491952 (bvslt i!612 (size!25226 _values!688)))))

(assert (=> b!883993 (= lt!400249 (+!2568 (+!2568 lt!400253 lt!400251) lt!400255))))

(declare-fun lt!400252 () Unit!30177)

(declare-fun addCommutativeForDiffKeys!551 (ListLongMap!10567 (_ BitVec 64) V!28651 (_ BitVec 64) V!28651) Unit!30177)

(assert (=> b!883993 (= lt!400252 (addCommutativeForDiffKeys!551 lt!400253 k0!854 v!557 (select (arr!24785 _keys!868) from!1053) lt!400261))))

(declare-fun b!883994 () Bool)

(declare-fun e!491949 () Bool)

(assert (=> b!883994 (= e!491949 (and e!491946 mapRes!28191))))

(declare-fun condMapEmpty!28191 () Bool)

(declare-fun mapDefault!28191 () ValueCell!8412)

(assert (=> b!883994 (= condMapEmpty!28191 (= (arr!24786 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8412)) mapDefault!28191)))))

(declare-fun b!883995 () Bool)

(declare-fun res!600545 () Bool)

(assert (=> b!883995 (=> (not res!600545) (not e!491945))))

(declare-datatypes ((List!17605 0))(
  ( (Nil!17602) (Cons!17601 (h!18732 (_ BitVec 64)) (t!24866 List!17605)) )
))
(declare-fun arrayNoDuplicates!0 (array!51532 (_ BitVec 32) List!17605) Bool)

(assert (=> b!883995 (= res!600545 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17602))))

(declare-fun b!883996 () Bool)

(assert (=> b!883996 (= e!491944 tp_is_empty!17703)))

(declare-fun res!600548 () Bool)

(assert (=> start!74940 (=> (not res!600548) (not e!491945))))

(assert (=> start!74940 (= res!600548 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25225 _keys!868))))))

(assert (=> start!74940 e!491945))

(assert (=> start!74940 tp_is_empty!17703))

(assert (=> start!74940 true))

(assert (=> start!74940 tp!54080))

(declare-fun array_inv!19514 (array!51532) Bool)

(assert (=> start!74940 (array_inv!19514 _keys!868)))

(declare-fun array_inv!19515 (array!51534) Bool)

(assert (=> start!74940 (and (array_inv!19515 _values!688) e!491949)))

(declare-fun b!883997 () Bool)

(declare-fun Unit!30179 () Unit!30177)

(assert (=> b!883997 (= e!491950 Unit!30179)))

(declare-fun b!883998 () Bool)

(declare-fun Unit!30180 () Unit!30177)

(assert (=> b!883998 (= e!491950 Unit!30180)))

(declare-fun lt!400257 () Unit!30177)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51532 (_ BitVec 32) (_ BitVec 32)) Unit!30177)

(assert (=> b!883998 (= lt!400257 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!883998 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17602)))

(declare-fun lt!400247 () Unit!30177)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30177)

(assert (=> b!883998 (= lt!400247 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883998 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400258 () Unit!30177)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51532 (_ BitVec 64) (_ BitVec 32) List!17605) Unit!30177)

(assert (=> b!883998 (= lt!400258 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17602))))

(assert (=> b!883998 false))

(declare-fun mapIsEmpty!28191 () Bool)

(assert (=> mapIsEmpty!28191 mapRes!28191))

(assert (= (and start!74940 res!600548) b!883992))

(assert (= (and b!883992 res!600549) b!883991))

(assert (= (and b!883991 res!600541) b!883984))

(assert (= (and b!883984 res!600539) b!883995))

(assert (= (and b!883995 res!600545) b!883983))

(assert (= (and b!883983 res!600542) b!883988))

(assert (= (and b!883988 res!600543) b!883986))

(assert (= (and b!883986 res!600547) b!883989))

(assert (= (and b!883989 res!600540) b!883987))

(assert (= (and b!883987 (not res!600546)) b!883985))

(assert (= (and b!883985 c!93094) b!883998))

(assert (= (and b!883985 (not c!93094)) b!883997))

(assert (= (and b!883985 (not res!600544)) b!883993))

(assert (= (and b!883994 condMapEmpty!28191) mapIsEmpty!28191))

(assert (= (and b!883994 (not condMapEmpty!28191)) mapNonEmpty!28191))

(get-info :version)

(assert (= (and mapNonEmpty!28191 ((_ is ValueCellFull!8412) mapValue!28191)) b!883996))

(assert (= (and b!883994 ((_ is ValueCellFull!8412) mapDefault!28191)) b!883990))

(assert (= start!74940 b!883994))

(declare-fun b_lambda!12737 () Bool)

(assert (=> (not b_lambda!12737) (not b!883985)))

(declare-fun t!24864 () Bool)

(declare-fun tb!5117 () Bool)

(assert (=> (and start!74940 (= defaultEntry!696 defaultEntry!696) t!24864) tb!5117))

(declare-fun result!9869 () Bool)

(assert (=> tb!5117 (= result!9869 tp_is_empty!17703)))

(assert (=> b!883985 t!24864))

(declare-fun b_and!25619 () Bool)

(assert (= b_and!25617 (and (=> t!24864 result!9869) b_and!25619)))

(declare-fun m!824103 () Bool)

(assert (=> b!883995 m!824103))

(declare-fun m!824105 () Bool)

(assert (=> b!883992 m!824105))

(declare-fun m!824107 () Bool)

(assert (=> mapNonEmpty!28191 m!824107))

(declare-fun m!824109 () Bool)

(assert (=> b!883993 m!824109))

(assert (=> b!883993 m!824109))

(declare-fun m!824111 () Bool)

(assert (=> b!883993 m!824111))

(declare-fun m!824113 () Bool)

(assert (=> b!883993 m!824113))

(assert (=> b!883993 m!824113))

(declare-fun m!824115 () Bool)

(assert (=> b!883993 m!824115))

(declare-fun m!824117 () Bool)

(assert (=> b!883984 m!824117))

(declare-fun m!824119 () Bool)

(assert (=> b!883986 m!824119))

(declare-fun m!824121 () Bool)

(assert (=> b!883998 m!824121))

(declare-fun m!824123 () Bool)

(assert (=> b!883998 m!824123))

(declare-fun m!824125 () Bool)

(assert (=> b!883998 m!824125))

(declare-fun m!824127 () Bool)

(assert (=> b!883998 m!824127))

(declare-fun m!824129 () Bool)

(assert (=> b!883998 m!824129))

(declare-fun m!824131 () Bool)

(assert (=> b!883987 m!824131))

(declare-fun m!824133 () Bool)

(assert (=> b!883987 m!824133))

(assert (=> b!883987 m!824113))

(declare-fun m!824135 () Bool)

(assert (=> b!883987 m!824135))

(assert (=> b!883987 m!824113))

(declare-fun m!824137 () Bool)

(assert (=> b!883987 m!824137))

(declare-fun m!824139 () Bool)

(assert (=> b!883987 m!824139))

(declare-fun m!824141 () Bool)

(assert (=> start!74940 m!824141))

(declare-fun m!824143 () Bool)

(assert (=> start!74940 m!824143))

(declare-fun m!824145 () Bool)

(assert (=> b!883989 m!824145))

(declare-fun m!824147 () Bool)

(assert (=> b!883989 m!824147))

(declare-fun m!824149 () Bool)

(assert (=> b!883989 m!824149))

(declare-fun m!824151 () Bool)

(assert (=> b!883988 m!824151))

(declare-fun m!824153 () Bool)

(assert (=> b!883985 m!824153))

(declare-fun m!824155 () Bool)

(assert (=> b!883985 m!824155))

(declare-fun m!824157 () Bool)

(assert (=> b!883985 m!824157))

(declare-fun m!824159 () Bool)

(assert (=> b!883985 m!824159))

(assert (=> b!883985 m!824155))

(assert (=> b!883985 m!824113))

(assert (=> b!883985 m!824157))

(check-sat (not b!883987) (not b!883984) (not b!883989) (not mapNonEmpty!28191) (not b!883993) tp_is_empty!17703 (not start!74940) (not b!883985) (not b_lambda!12737) (not b!883988) b_and!25619 (not b!883992) (not b_next!15459) (not b!883998) (not b!883995))
(check-sat b_and!25619 (not b_next!15459))
