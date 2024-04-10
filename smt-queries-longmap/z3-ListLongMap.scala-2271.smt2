; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37090 () Bool)

(assert start!37090)

(declare-fun b_free!8217 () Bool)

(declare-fun b_next!8217 () Bool)

(assert (=> start!37090 (= b_free!8217 (not b_next!8217))))

(declare-fun tp!29367 () Bool)

(declare-fun b_and!15459 () Bool)

(assert (=> start!37090 (= tp!29367 b_and!15459)))

(declare-fun b!373317 () Bool)

(declare-fun res!210257 () Bool)

(declare-fun e!227599 () Bool)

(assert (=> b!373317 (=> (not res!210257) (not e!227599))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12925 0))(
  ( (V!12926 (val!4477 Int)) )
))
(declare-datatypes ((ValueCell!4089 0))(
  ( (ValueCellFull!4089 (v!6674 V!12925)) (EmptyCell!4089) )
))
(declare-datatypes ((array!21671 0))(
  ( (array!21672 (arr!10304 (Array (_ BitVec 32) ValueCell!4089)) (size!10656 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21671)

(declare-datatypes ((array!21673 0))(
  ( (array!21674 (arr!10305 (Array (_ BitVec 32) (_ BitVec 64))) (size!10657 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21673)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!373317 (= res!210257 (and (= (size!10656 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10657 _keys!658) (size!10656 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373318 () Bool)

(declare-fun res!210249 () Bool)

(assert (=> b!373318 (=> (not res!210249) (not e!227599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21673 (_ BitVec 32)) Bool)

(assert (=> b!373318 (= res!210249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373319 () Bool)

(declare-fun res!210253 () Bool)

(assert (=> b!373319 (=> (not res!210253) (not e!227599))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373319 (= res!210253 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10657 _keys!658))))))

(declare-fun b!373320 () Bool)

(declare-fun res!210250 () Bool)

(assert (=> b!373320 (=> (not res!210250) (not e!227599))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373320 (= res!210250 (validKeyInArray!0 k0!778))))

(declare-fun b!373321 () Bool)

(declare-fun res!210252 () Bool)

(assert (=> b!373321 (=> (not res!210252) (not e!227599))))

(assert (=> b!373321 (= res!210252 (or (= (select (arr!10305 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10305 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373322 () Bool)

(declare-fun res!210246 () Bool)

(assert (=> b!373322 (=> (not res!210246) (not e!227599))))

(declare-datatypes ((List!5788 0))(
  ( (Nil!5785) (Cons!5784 (h!6640 (_ BitVec 64)) (t!10938 List!5788)) )
))
(declare-fun arrayNoDuplicates!0 (array!21673 (_ BitVec 32) List!5788) Bool)

(assert (=> b!373322 (= res!210246 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5785))))

(declare-fun b!373323 () Bool)

(declare-fun res!210248 () Bool)

(declare-fun e!227605 () Bool)

(assert (=> b!373323 (=> (not res!210248) (not e!227605))))

(declare-fun lt!171346 () array!21673)

(assert (=> b!373323 (= res!210248 (arrayNoDuplicates!0 lt!171346 #b00000000000000000000000000000000 Nil!5785))))

(declare-fun b!373324 () Bool)

(declare-fun e!227602 () Bool)

(declare-fun e!227600 () Bool)

(declare-fun mapRes!14862 () Bool)

(assert (=> b!373324 (= e!227602 (and e!227600 mapRes!14862))))

(declare-fun condMapEmpty!14862 () Bool)

(declare-fun mapDefault!14862 () ValueCell!4089)

(assert (=> b!373324 (= condMapEmpty!14862 (= (arr!10304 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4089)) mapDefault!14862)))))

(declare-fun b!373325 () Bool)

(declare-fun e!227601 () Bool)

(declare-fun e!227603 () Bool)

(assert (=> b!373325 (= e!227601 e!227603)))

(declare-fun res!210254 () Bool)

(assert (=> b!373325 (=> res!210254 e!227603)))

(assert (=> b!373325 (= res!210254 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5942 0))(
  ( (tuple2!5943 (_1!2982 (_ BitVec 64)) (_2!2982 V!12925)) )
))
(declare-datatypes ((List!5789 0))(
  ( (Nil!5786) (Cons!5785 (h!6641 tuple2!5942) (t!10939 List!5789)) )
))
(declare-datatypes ((ListLongMap!4855 0))(
  ( (ListLongMap!4856 (toList!2443 List!5789)) )
))
(declare-fun lt!171339 () ListLongMap!4855)

(declare-fun lt!171345 () ListLongMap!4855)

(assert (=> b!373325 (= lt!171339 lt!171345)))

(declare-fun lt!171341 () ListLongMap!4855)

(declare-fun lt!171351 () tuple2!5942)

(declare-fun +!789 (ListLongMap!4855 tuple2!5942) ListLongMap!4855)

(assert (=> b!373325 (= lt!171345 (+!789 lt!171341 lt!171351))))

(declare-fun v!373 () V!12925)

(declare-datatypes ((Unit!11484 0))(
  ( (Unit!11485) )
))
(declare-fun lt!171354 () Unit!11484)

(declare-fun zeroValue!472 () V!12925)

(declare-fun lt!171347 () ListLongMap!4855)

(declare-fun addCommutativeForDiffKeys!215 (ListLongMap!4855 (_ BitVec 64) V!12925 (_ BitVec 64) V!12925) Unit!11484)

(assert (=> b!373325 (= lt!171354 (addCommutativeForDiffKeys!215 lt!171347 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171344 () ListLongMap!4855)

(declare-fun lt!171348 () tuple2!5942)

(assert (=> b!373325 (= lt!171344 (+!789 lt!171339 lt!171348))))

(declare-fun lt!171349 () ListLongMap!4855)

(declare-fun lt!171352 () tuple2!5942)

(assert (=> b!373325 (= lt!171339 (+!789 lt!171349 lt!171352))))

(declare-fun lt!171353 () ListLongMap!4855)

(declare-fun lt!171338 () ListLongMap!4855)

(assert (=> b!373325 (= lt!171353 lt!171338)))

(assert (=> b!373325 (= lt!171338 (+!789 lt!171341 lt!171348))))

(assert (=> b!373325 (= lt!171341 (+!789 lt!171347 lt!171352))))

(declare-fun lt!171342 () ListLongMap!4855)

(assert (=> b!373325 (= lt!171344 (+!789 (+!789 lt!171342 lt!171352) lt!171348))))

(declare-fun minValue!472 () V!12925)

(assert (=> b!373325 (= lt!171348 (tuple2!5943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373325 (= lt!171352 (tuple2!5943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373326 () Bool)

(declare-fun res!210247 () Bool)

(assert (=> b!373326 (=> (not res!210247) (not e!227599))))

(declare-fun arrayContainsKey!0 (array!21673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373326 (= res!210247 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373327 () Bool)

(declare-fun e!227604 () Bool)

(declare-fun tp_is_empty!8865 () Bool)

(assert (=> b!373327 (= e!227604 tp_is_empty!8865)))

(declare-fun b!373328 () Bool)

(assert (=> b!373328 (= e!227600 tp_is_empty!8865)))

(declare-fun res!210256 () Bool)

(assert (=> start!37090 (=> (not res!210256) (not e!227599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37090 (= res!210256 (validMask!0 mask!970))))

(assert (=> start!37090 e!227599))

(declare-fun array_inv!7596 (array!21671) Bool)

(assert (=> start!37090 (and (array_inv!7596 _values!506) e!227602)))

(assert (=> start!37090 tp!29367))

(assert (=> start!37090 true))

(assert (=> start!37090 tp_is_empty!8865))

(declare-fun array_inv!7597 (array!21673) Bool)

(assert (=> start!37090 (array_inv!7597 _keys!658)))

(declare-fun mapNonEmpty!14862 () Bool)

(declare-fun tp!29366 () Bool)

(assert (=> mapNonEmpty!14862 (= mapRes!14862 (and tp!29366 e!227604))))

(declare-fun mapKey!14862 () (_ BitVec 32))

(declare-fun mapRest!14862 () (Array (_ BitVec 32) ValueCell!4089))

(declare-fun mapValue!14862 () ValueCell!4089)

(assert (=> mapNonEmpty!14862 (= (arr!10304 _values!506) (store mapRest!14862 mapKey!14862 mapValue!14862))))

(declare-fun b!373329 () Bool)

(assert (=> b!373329 (= e!227605 (not e!227601))))

(declare-fun res!210251 () Bool)

(assert (=> b!373329 (=> res!210251 e!227601)))

(assert (=> b!373329 (= res!210251 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1885 (array!21673 array!21671 (_ BitVec 32) (_ BitVec 32) V!12925 V!12925 (_ BitVec 32) Int) ListLongMap!4855)

(assert (=> b!373329 (= lt!171353 (getCurrentListMap!1885 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171343 () array!21671)

(assert (=> b!373329 (= lt!171344 (getCurrentListMap!1885 lt!171346 lt!171343 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373329 (and (= lt!171342 lt!171349) (= lt!171349 lt!171342))))

(assert (=> b!373329 (= lt!171349 (+!789 lt!171347 lt!171351))))

(assert (=> b!373329 (= lt!171351 (tuple2!5943 k0!778 v!373))))

(declare-fun lt!171350 () Unit!11484)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!43 (array!21673 array!21671 (_ BitVec 32) (_ BitVec 32) V!12925 V!12925 (_ BitVec 32) (_ BitVec 64) V!12925 (_ BitVec 32) Int) Unit!11484)

(assert (=> b!373329 (= lt!171350 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!43 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!719 (array!21673 array!21671 (_ BitVec 32) (_ BitVec 32) V!12925 V!12925 (_ BitVec 32) Int) ListLongMap!4855)

(assert (=> b!373329 (= lt!171342 (getCurrentListMapNoExtraKeys!719 lt!171346 lt!171343 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373329 (= lt!171343 (array!21672 (store (arr!10304 _values!506) i!548 (ValueCellFull!4089 v!373)) (size!10656 _values!506)))))

(assert (=> b!373329 (= lt!171347 (getCurrentListMapNoExtraKeys!719 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373330 () Bool)

(assert (=> b!373330 (= e!227599 e!227605)))

(declare-fun res!210255 () Bool)

(assert (=> b!373330 (=> (not res!210255) (not e!227605))))

(assert (=> b!373330 (= res!210255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171346 mask!970))))

(assert (=> b!373330 (= lt!171346 (array!21674 (store (arr!10305 _keys!658) i!548 k0!778) (size!10657 _keys!658)))))

(declare-fun b!373331 () Bool)

(assert (=> b!373331 (= e!227603 true)))

(assert (=> b!373331 (= (+!789 lt!171345 lt!171348) (+!789 lt!171338 lt!171351))))

(declare-fun lt!171340 () Unit!11484)

(assert (=> b!373331 (= lt!171340 (addCommutativeForDiffKeys!215 lt!171341 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!14862 () Bool)

(assert (=> mapIsEmpty!14862 mapRes!14862))

(assert (= (and start!37090 res!210256) b!373317))

(assert (= (and b!373317 res!210257) b!373318))

(assert (= (and b!373318 res!210249) b!373322))

(assert (= (and b!373322 res!210246) b!373319))

(assert (= (and b!373319 res!210253) b!373320))

(assert (= (and b!373320 res!210250) b!373321))

(assert (= (and b!373321 res!210252) b!373326))

(assert (= (and b!373326 res!210247) b!373330))

(assert (= (and b!373330 res!210255) b!373323))

(assert (= (and b!373323 res!210248) b!373329))

(assert (= (and b!373329 (not res!210251)) b!373325))

(assert (= (and b!373325 (not res!210254)) b!373331))

(assert (= (and b!373324 condMapEmpty!14862) mapIsEmpty!14862))

(assert (= (and b!373324 (not condMapEmpty!14862)) mapNonEmpty!14862))

(get-info :version)

(assert (= (and mapNonEmpty!14862 ((_ is ValueCellFull!4089) mapValue!14862)) b!373327))

(assert (= (and b!373324 ((_ is ValueCellFull!4089) mapDefault!14862)) b!373328))

(assert (= start!37090 b!373324))

(declare-fun m!369195 () Bool)

(assert (=> b!373330 m!369195))

(declare-fun m!369197 () Bool)

(assert (=> b!373330 m!369197))

(declare-fun m!369199 () Bool)

(assert (=> b!373321 m!369199))

(declare-fun m!369201 () Bool)

(assert (=> b!373318 m!369201))

(declare-fun m!369203 () Bool)

(assert (=> b!373325 m!369203))

(declare-fun m!369205 () Bool)

(assert (=> b!373325 m!369205))

(declare-fun m!369207 () Bool)

(assert (=> b!373325 m!369207))

(declare-fun m!369209 () Bool)

(assert (=> b!373325 m!369209))

(assert (=> b!373325 m!369203))

(declare-fun m!369211 () Bool)

(assert (=> b!373325 m!369211))

(declare-fun m!369213 () Bool)

(assert (=> b!373325 m!369213))

(declare-fun m!369215 () Bool)

(assert (=> b!373325 m!369215))

(declare-fun m!369217 () Bool)

(assert (=> b!373325 m!369217))

(declare-fun m!369219 () Bool)

(assert (=> b!373323 m!369219))

(declare-fun m!369221 () Bool)

(assert (=> b!373322 m!369221))

(declare-fun m!369223 () Bool)

(assert (=> b!373326 m!369223))

(declare-fun m!369225 () Bool)

(assert (=> b!373329 m!369225))

(declare-fun m!369227 () Bool)

(assert (=> b!373329 m!369227))

(declare-fun m!369229 () Bool)

(assert (=> b!373329 m!369229))

(declare-fun m!369231 () Bool)

(assert (=> b!373329 m!369231))

(declare-fun m!369233 () Bool)

(assert (=> b!373329 m!369233))

(declare-fun m!369235 () Bool)

(assert (=> b!373329 m!369235))

(declare-fun m!369237 () Bool)

(assert (=> b!373329 m!369237))

(declare-fun m!369239 () Bool)

(assert (=> mapNonEmpty!14862 m!369239))

(declare-fun m!369241 () Bool)

(assert (=> start!37090 m!369241))

(declare-fun m!369243 () Bool)

(assert (=> start!37090 m!369243))

(declare-fun m!369245 () Bool)

(assert (=> start!37090 m!369245))

(declare-fun m!369247 () Bool)

(assert (=> b!373320 m!369247))

(declare-fun m!369249 () Bool)

(assert (=> b!373331 m!369249))

(declare-fun m!369251 () Bool)

(assert (=> b!373331 m!369251))

(declare-fun m!369253 () Bool)

(assert (=> b!373331 m!369253))

(check-sat tp_is_empty!8865 (not b!373318) (not b!373326) (not mapNonEmpty!14862) (not b!373320) (not start!37090) (not b!373330) (not b!373322) (not b!373331) (not b!373323) (not b!373329) (not b_next!8217) b_and!15459 (not b!373325))
(check-sat b_and!15459 (not b_next!8217))
