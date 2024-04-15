; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37362 () Bool)

(assert start!37362)

(declare-fun b_free!8503 () Bool)

(declare-fun b_next!8503 () Bool)

(assert (=> start!37362 (= b_free!8503 (not b_next!8503))))

(declare-fun tp!30225 () Bool)

(declare-fun b_and!15719 () Bool)

(assert (=> start!37362 (= tp!30225 b_and!15719)))

(declare-fun mapIsEmpty!15291 () Bool)

(declare-fun mapRes!15291 () Bool)

(assert (=> mapIsEmpty!15291 mapRes!15291))

(declare-fun b!379499 () Bool)

(declare-fun e!230857 () Bool)

(declare-fun e!230860 () Bool)

(assert (=> b!379499 (= e!230857 e!230860)))

(declare-fun res!215287 () Bool)

(assert (=> b!379499 (=> res!215287 e!230860)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!379499 (= res!215287 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13307 0))(
  ( (V!13308 (val!4620 Int)) )
))
(declare-datatypes ((tuple2!6160 0))(
  ( (tuple2!6161 (_1!3091 (_ BitVec 64)) (_2!3091 V!13307)) )
))
(declare-datatypes ((List!5989 0))(
  ( (Nil!5986) (Cons!5985 (h!6841 tuple2!6160) (t!11130 List!5989)) )
))
(declare-datatypes ((ListLongMap!5063 0))(
  ( (ListLongMap!5064 (toList!2547 List!5989)) )
))
(declare-fun lt!177247 () ListLongMap!5063)

(declare-fun lt!177249 () ListLongMap!5063)

(assert (=> b!379499 (= lt!177247 lt!177249)))

(declare-fun lt!177246 () ListLongMap!5063)

(declare-fun lt!177238 () tuple2!6160)

(declare-fun +!915 (ListLongMap!5063 tuple2!6160) ListLongMap!5063)

(assert (=> b!379499 (= lt!177249 (+!915 lt!177246 lt!177238))))

(declare-fun lt!177248 () ListLongMap!5063)

(declare-fun lt!177245 () ListLongMap!5063)

(assert (=> b!379499 (= lt!177248 lt!177245)))

(declare-fun lt!177244 () ListLongMap!5063)

(assert (=> b!379499 (= lt!177245 (+!915 lt!177244 lt!177238))))

(declare-fun lt!177237 () ListLongMap!5063)

(assert (=> b!379499 (= lt!177248 (+!915 lt!177237 lt!177238))))

(declare-fun minValue!472 () V!13307)

(assert (=> b!379499 (= lt!177238 (tuple2!6161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379500 () Bool)

(declare-fun e!230862 () Bool)

(declare-fun e!230858 () Bool)

(assert (=> b!379500 (= e!230862 e!230858)))

(declare-fun res!215291 () Bool)

(assert (=> b!379500 (=> (not res!215291) (not e!230858))))

(declare-datatypes ((array!22205 0))(
  ( (array!22206 (arr!10571 (Array (_ BitVec 32) (_ BitVec 64))) (size!10924 (_ BitVec 32))) )
))
(declare-fun lt!177242 () array!22205)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22205 (_ BitVec 32)) Bool)

(assert (=> b!379500 (= res!215291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177242 mask!970))))

(declare-fun _keys!658 () array!22205)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379500 (= lt!177242 (array!22206 (store (arr!10571 _keys!658) i!548 k0!778) (size!10924 _keys!658)))))

(declare-fun b!379501 () Bool)

(declare-fun res!215285 () Bool)

(assert (=> b!379501 (=> (not res!215285) (not e!230862))))

(declare-datatypes ((List!5990 0))(
  ( (Nil!5987) (Cons!5986 (h!6842 (_ BitVec 64)) (t!11131 List!5990)) )
))
(declare-fun arrayNoDuplicates!0 (array!22205 (_ BitVec 32) List!5990) Bool)

(assert (=> b!379501 (= res!215285 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5987))))

(declare-fun b!379502 () Bool)

(assert (=> b!379502 (= e!230858 (not e!230857))))

(declare-fun res!215293 () Bool)

(assert (=> b!379502 (=> res!215293 e!230857)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379502 (= res!215293 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4232 0))(
  ( (ValueCellFull!4232 (v!6811 V!13307)) (EmptyCell!4232) )
))
(declare-datatypes ((array!22207 0))(
  ( (array!22208 (arr!10572 (Array (_ BitVec 32) ValueCell!4232)) (size!10925 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22207)

(declare-fun zeroValue!472 () V!13307)

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1945 (array!22205 array!22207 (_ BitVec 32) (_ BitVec 32) V!13307 V!13307 (_ BitVec 32) Int) ListLongMap!5063)

(assert (=> b!379502 (= lt!177247 (getCurrentListMap!1945 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177240 () array!22207)

(assert (=> b!379502 (= lt!177248 (getCurrentListMap!1945 lt!177242 lt!177240 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379502 (and (= lt!177237 lt!177244) (= lt!177244 lt!177237))))

(declare-fun lt!177239 () tuple2!6160)

(assert (=> b!379502 (= lt!177244 (+!915 lt!177246 lt!177239))))

(declare-fun v!373 () V!13307)

(assert (=> b!379502 (= lt!177239 (tuple2!6161 k0!778 v!373))))

(declare-datatypes ((Unit!11690 0))(
  ( (Unit!11691) )
))
(declare-fun lt!177241 () Unit!11690)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!138 (array!22205 array!22207 (_ BitVec 32) (_ BitVec 32) V!13307 V!13307 (_ BitVec 32) (_ BitVec 64) V!13307 (_ BitVec 32) Int) Unit!11690)

(assert (=> b!379502 (= lt!177241 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!138 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!810 (array!22205 array!22207 (_ BitVec 32) (_ BitVec 32) V!13307 V!13307 (_ BitVec 32) Int) ListLongMap!5063)

(assert (=> b!379502 (= lt!177237 (getCurrentListMapNoExtraKeys!810 lt!177242 lt!177240 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379502 (= lt!177240 (array!22208 (store (arr!10572 _values!506) i!548 (ValueCellFull!4232 v!373)) (size!10925 _values!506)))))

(assert (=> b!379502 (= lt!177246 (getCurrentListMapNoExtraKeys!810 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379503 () Bool)

(declare-fun res!215288 () Bool)

(assert (=> b!379503 (=> (not res!215288) (not e!230862))))

(assert (=> b!379503 (= res!215288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379504 () Bool)

(declare-fun e!230861 () Bool)

(declare-fun tp_is_empty!9151 () Bool)

(assert (=> b!379504 (= e!230861 tp_is_empty!9151)))

(declare-fun b!379505 () Bool)

(declare-fun e!230863 () Bool)

(assert (=> b!379505 (= e!230863 tp_is_empty!9151)))

(declare-fun b!379506 () Bool)

(declare-fun res!215284 () Bool)

(assert (=> b!379506 (=> (not res!215284) (not e!230862))))

(declare-fun arrayContainsKey!0 (array!22205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379506 (= res!215284 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379507 () Bool)

(declare-fun e!230864 () Bool)

(assert (=> b!379507 (= e!230864 (and e!230861 mapRes!15291))))

(declare-fun condMapEmpty!15291 () Bool)

(declare-fun mapDefault!15291 () ValueCell!4232)

(assert (=> b!379507 (= condMapEmpty!15291 (= (arr!10572 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4232)) mapDefault!15291)))))

(declare-fun b!379508 () Bool)

(declare-fun res!215283 () Bool)

(assert (=> b!379508 (=> (not res!215283) (not e!230862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379508 (= res!215283 (validKeyInArray!0 k0!778))))

(declare-fun b!379509 () Bool)

(assert (=> b!379509 (= e!230860 true)))

(assert (=> b!379509 (= lt!177245 (+!915 lt!177249 lt!177239))))

(declare-fun lt!177243 () Unit!11690)

(declare-fun addCommutativeForDiffKeys!309 (ListLongMap!5063 (_ BitVec 64) V!13307 (_ BitVec 64) V!13307) Unit!11690)

(assert (=> b!379509 (= lt!177243 (addCommutativeForDiffKeys!309 lt!177246 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379510 () Bool)

(declare-fun res!215290 () Bool)

(assert (=> b!379510 (=> (not res!215290) (not e!230862))))

(assert (=> b!379510 (= res!215290 (or (= (select (arr!10571 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10571 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379511 () Bool)

(declare-fun res!215292 () Bool)

(assert (=> b!379511 (=> (not res!215292) (not e!230862))))

(assert (=> b!379511 (= res!215292 (and (= (size!10925 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10924 _keys!658) (size!10925 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379512 () Bool)

(declare-fun res!215286 () Bool)

(assert (=> b!379512 (=> (not res!215286) (not e!230862))))

(assert (=> b!379512 (= res!215286 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10924 _keys!658))))))

(declare-fun b!379513 () Bool)

(declare-fun res!215294 () Bool)

(assert (=> b!379513 (=> (not res!215294) (not e!230858))))

(assert (=> b!379513 (= res!215294 (arrayNoDuplicates!0 lt!177242 #b00000000000000000000000000000000 Nil!5987))))

(declare-fun mapNonEmpty!15291 () Bool)

(declare-fun tp!30224 () Bool)

(assert (=> mapNonEmpty!15291 (= mapRes!15291 (and tp!30224 e!230863))))

(declare-fun mapValue!15291 () ValueCell!4232)

(declare-fun mapRest!15291 () (Array (_ BitVec 32) ValueCell!4232))

(declare-fun mapKey!15291 () (_ BitVec 32))

(assert (=> mapNonEmpty!15291 (= (arr!10572 _values!506) (store mapRest!15291 mapKey!15291 mapValue!15291))))

(declare-fun res!215289 () Bool)

(assert (=> start!37362 (=> (not res!215289) (not e!230862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37362 (= res!215289 (validMask!0 mask!970))))

(assert (=> start!37362 e!230862))

(declare-fun array_inv!7786 (array!22207) Bool)

(assert (=> start!37362 (and (array_inv!7786 _values!506) e!230864)))

(assert (=> start!37362 tp!30225))

(assert (=> start!37362 true))

(assert (=> start!37362 tp_is_empty!9151))

(declare-fun array_inv!7787 (array!22205) Bool)

(assert (=> start!37362 (array_inv!7787 _keys!658)))

(assert (= (and start!37362 res!215289) b!379511))

(assert (= (and b!379511 res!215292) b!379503))

(assert (= (and b!379503 res!215288) b!379501))

(assert (= (and b!379501 res!215285) b!379512))

(assert (= (and b!379512 res!215286) b!379508))

(assert (= (and b!379508 res!215283) b!379510))

(assert (= (and b!379510 res!215290) b!379506))

(assert (= (and b!379506 res!215284) b!379500))

(assert (= (and b!379500 res!215291) b!379513))

(assert (= (and b!379513 res!215294) b!379502))

(assert (= (and b!379502 (not res!215293)) b!379499))

(assert (= (and b!379499 (not res!215287)) b!379509))

(assert (= (and b!379507 condMapEmpty!15291) mapIsEmpty!15291))

(assert (= (and b!379507 (not condMapEmpty!15291)) mapNonEmpty!15291))

(get-info :version)

(assert (= (and mapNonEmpty!15291 ((_ is ValueCellFull!4232) mapValue!15291)) b!379505))

(assert (= (and b!379507 ((_ is ValueCellFull!4232) mapDefault!15291)) b!379504))

(assert (= start!37362 b!379507))

(declare-fun m!375947 () Bool)

(assert (=> start!37362 m!375947))

(declare-fun m!375949 () Bool)

(assert (=> start!37362 m!375949))

(declare-fun m!375951 () Bool)

(assert (=> start!37362 m!375951))

(declare-fun m!375953 () Bool)

(assert (=> mapNonEmpty!15291 m!375953))

(declare-fun m!375955 () Bool)

(assert (=> b!379513 m!375955))

(declare-fun m!375957 () Bool)

(assert (=> b!379508 m!375957))

(declare-fun m!375959 () Bool)

(assert (=> b!379500 m!375959))

(declare-fun m!375961 () Bool)

(assert (=> b!379500 m!375961))

(declare-fun m!375963 () Bool)

(assert (=> b!379503 m!375963))

(declare-fun m!375965 () Bool)

(assert (=> b!379499 m!375965))

(declare-fun m!375967 () Bool)

(assert (=> b!379499 m!375967))

(declare-fun m!375969 () Bool)

(assert (=> b!379499 m!375969))

(declare-fun m!375971 () Bool)

(assert (=> b!379502 m!375971))

(declare-fun m!375973 () Bool)

(assert (=> b!379502 m!375973))

(declare-fun m!375975 () Bool)

(assert (=> b!379502 m!375975))

(declare-fun m!375977 () Bool)

(assert (=> b!379502 m!375977))

(declare-fun m!375979 () Bool)

(assert (=> b!379502 m!375979))

(declare-fun m!375981 () Bool)

(assert (=> b!379502 m!375981))

(declare-fun m!375983 () Bool)

(assert (=> b!379502 m!375983))

(declare-fun m!375985 () Bool)

(assert (=> b!379506 m!375985))

(declare-fun m!375987 () Bool)

(assert (=> b!379509 m!375987))

(declare-fun m!375989 () Bool)

(assert (=> b!379509 m!375989))

(declare-fun m!375991 () Bool)

(assert (=> b!379510 m!375991))

(declare-fun m!375993 () Bool)

(assert (=> b!379501 m!375993))

(check-sat tp_is_empty!9151 (not mapNonEmpty!15291) (not b_next!8503) (not b!379506) (not b!379509) (not b!379501) (not b!379503) (not b!379499) b_and!15719 (not b!379513) (not b!379502) (not b!379508) (not start!37362) (not b!379500))
(check-sat b_and!15719 (not b_next!8503))
