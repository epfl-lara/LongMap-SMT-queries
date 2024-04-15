; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37476 () Bool)

(assert start!37476)

(declare-fun b_free!8617 () Bool)

(declare-fun b_next!8617 () Bool)

(assert (=> start!37476 (= b_free!8617 (not b_next!8617))))

(declare-fun tp!30566 () Bool)

(declare-fun b_and!15833 () Bool)

(assert (=> start!37476 (= tp!30566 b_and!15833)))

(declare-fun b!381963 () Bool)

(declare-fun res!217243 () Bool)

(declare-fun e!232128 () Bool)

(assert (=> b!381963 (=> (not res!217243) (not e!232128))))

(declare-datatypes ((array!22425 0))(
  ( (array!22426 (arr!10681 (Array (_ BitVec 32) (_ BitVec 64))) (size!11034 (_ BitVec 32))) )
))
(declare-fun lt!179062 () array!22425)

(declare-datatypes ((List!6086 0))(
  ( (Nil!6083) (Cons!6082 (h!6938 (_ BitVec 64)) (t!11227 List!6086)) )
))
(declare-fun arrayNoDuplicates!0 (array!22425 (_ BitVec 32) List!6086) Bool)

(assert (=> b!381963 (= res!217243 (arrayNoDuplicates!0 lt!179062 #b00000000000000000000000000000000 Nil!6083))))

(declare-fun b!381964 () Bool)

(declare-fun e!232129 () Bool)

(assert (=> b!381964 (= e!232129 true)))

(declare-datatypes ((V!13459 0))(
  ( (V!13460 (val!4677 Int)) )
))
(declare-datatypes ((tuple2!6260 0))(
  ( (tuple2!6261 (_1!3141 (_ BitVec 64)) (_2!3141 V!13459)) )
))
(declare-datatypes ((List!6087 0))(
  ( (Nil!6084) (Cons!6083 (h!6939 tuple2!6260) (t!11228 List!6087)) )
))
(declare-datatypes ((ListLongMap!5163 0))(
  ( (ListLongMap!5164 (toList!2597 List!6087)) )
))
(declare-fun lt!179058 () ListLongMap!5163)

(declare-fun lt!179064 () ListLongMap!5163)

(assert (=> b!381964 (= lt!179058 lt!179064)))

(declare-fun b!381965 () Bool)

(declare-fun res!217242 () Bool)

(declare-fun e!232125 () Bool)

(assert (=> b!381965 (=> (not res!217242) (not e!232125))))

(declare-fun _keys!658 () array!22425)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22425 (_ BitVec 32)) Bool)

(assert (=> b!381965 (= res!217242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381966 () Bool)

(declare-fun e!232130 () Bool)

(declare-fun tp_is_empty!9265 () Bool)

(assert (=> b!381966 (= e!232130 tp_is_empty!9265)))

(declare-fun b!381967 () Bool)

(assert (=> b!381967 (= e!232128 (not e!232129))))

(declare-fun res!217236 () Bool)

(assert (=> b!381967 (=> res!217236 e!232129)))

(declare-fun lt!179061 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381967 (= res!217236 (or (and (not lt!179061) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179061) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179061)))))

(assert (=> b!381967 (= lt!179061 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!179056 () ListLongMap!5163)

(declare-datatypes ((ValueCell!4289 0))(
  ( (ValueCellFull!4289 (v!6868 V!13459)) (EmptyCell!4289) )
))
(declare-datatypes ((array!22427 0))(
  ( (array!22428 (arr!10682 (Array (_ BitVec 32) ValueCell!4289)) (size!11035 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22427)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13459)

(declare-fun minValue!472 () V!13459)

(declare-fun getCurrentListMap!1984 (array!22425 array!22427 (_ BitVec 32) (_ BitVec 32) V!13459 V!13459 (_ BitVec 32) Int) ListLongMap!5163)

(assert (=> b!381967 (= lt!179056 (getCurrentListMap!1984 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179057 () array!22427)

(assert (=> b!381967 (= lt!179058 (getCurrentListMap!1984 lt!179062 lt!179057 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179063 () ListLongMap!5163)

(assert (=> b!381967 (and (= lt!179064 lt!179063) (= lt!179063 lt!179064))))

(declare-fun lt!179060 () ListLongMap!5163)

(declare-fun v!373 () V!13459)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!958 (ListLongMap!5163 tuple2!6260) ListLongMap!5163)

(assert (=> b!381967 (= lt!179063 (+!958 lt!179060 (tuple2!6261 k0!778 v!373)))))

(declare-datatypes ((Unit!11774 0))(
  ( (Unit!11775) )
))
(declare-fun lt!179059 () Unit!11774)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!177 (array!22425 array!22427 (_ BitVec 32) (_ BitVec 32) V!13459 V!13459 (_ BitVec 32) (_ BitVec 64) V!13459 (_ BitVec 32) Int) Unit!11774)

(assert (=> b!381967 (= lt!179059 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!177 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!849 (array!22425 array!22427 (_ BitVec 32) (_ BitVec 32) V!13459 V!13459 (_ BitVec 32) Int) ListLongMap!5163)

(assert (=> b!381967 (= lt!179064 (getCurrentListMapNoExtraKeys!849 lt!179062 lt!179057 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381967 (= lt!179057 (array!22428 (store (arr!10682 _values!506) i!548 (ValueCellFull!4289 v!373)) (size!11035 _values!506)))))

(assert (=> b!381967 (= lt!179060 (getCurrentListMapNoExtraKeys!849 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381968 () Bool)

(assert (=> b!381968 (= e!232125 e!232128)))

(declare-fun res!217234 () Bool)

(assert (=> b!381968 (=> (not res!217234) (not e!232128))))

(assert (=> b!381968 (= res!217234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179062 mask!970))))

(assert (=> b!381968 (= lt!179062 (array!22426 (store (arr!10681 _keys!658) i!548 k0!778) (size!11034 _keys!658)))))

(declare-fun b!381969 () Bool)

(declare-fun res!217241 () Bool)

(assert (=> b!381969 (=> (not res!217241) (not e!232125))))

(assert (=> b!381969 (= res!217241 (or (= (select (arr!10681 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10681 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!217239 () Bool)

(assert (=> start!37476 (=> (not res!217239) (not e!232125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37476 (= res!217239 (validMask!0 mask!970))))

(assert (=> start!37476 e!232125))

(declare-fun e!232124 () Bool)

(declare-fun array_inv!7866 (array!22427) Bool)

(assert (=> start!37476 (and (array_inv!7866 _values!506) e!232124)))

(assert (=> start!37476 tp!30566))

(assert (=> start!37476 true))

(assert (=> start!37476 tp_is_empty!9265))

(declare-fun array_inv!7867 (array!22425) Bool)

(assert (=> start!37476 (array_inv!7867 _keys!658)))

(declare-fun mapNonEmpty!15462 () Bool)

(declare-fun mapRes!15462 () Bool)

(declare-fun tp!30567 () Bool)

(declare-fun e!232127 () Bool)

(assert (=> mapNonEmpty!15462 (= mapRes!15462 (and tp!30567 e!232127))))

(declare-fun mapValue!15462 () ValueCell!4289)

(declare-fun mapKey!15462 () (_ BitVec 32))

(declare-fun mapRest!15462 () (Array (_ BitVec 32) ValueCell!4289))

(assert (=> mapNonEmpty!15462 (= (arr!10682 _values!506) (store mapRest!15462 mapKey!15462 mapValue!15462))))

(declare-fun b!381970 () Bool)

(declare-fun res!217238 () Bool)

(assert (=> b!381970 (=> (not res!217238) (not e!232125))))

(assert (=> b!381970 (= res!217238 (and (= (size!11035 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11034 _keys!658) (size!11035 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381971 () Bool)

(assert (=> b!381971 (= e!232127 tp_is_empty!9265)))

(declare-fun b!381972 () Bool)

(declare-fun res!217240 () Bool)

(assert (=> b!381972 (=> (not res!217240) (not e!232125))))

(declare-fun arrayContainsKey!0 (array!22425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381972 (= res!217240 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381973 () Bool)

(declare-fun res!217244 () Bool)

(assert (=> b!381973 (=> (not res!217244) (not e!232125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381973 (= res!217244 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15462 () Bool)

(assert (=> mapIsEmpty!15462 mapRes!15462))

(declare-fun b!381974 () Bool)

(declare-fun res!217235 () Bool)

(assert (=> b!381974 (=> (not res!217235) (not e!232125))))

(assert (=> b!381974 (= res!217235 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6083))))

(declare-fun b!381975 () Bool)

(assert (=> b!381975 (= e!232124 (and e!232130 mapRes!15462))))

(declare-fun condMapEmpty!15462 () Bool)

(declare-fun mapDefault!15462 () ValueCell!4289)

(assert (=> b!381975 (= condMapEmpty!15462 (= (arr!10682 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4289)) mapDefault!15462)))))

(declare-fun b!381976 () Bool)

(declare-fun res!217237 () Bool)

(assert (=> b!381976 (=> (not res!217237) (not e!232125))))

(assert (=> b!381976 (= res!217237 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11034 _keys!658))))))

(assert (= (and start!37476 res!217239) b!381970))

(assert (= (and b!381970 res!217238) b!381965))

(assert (= (and b!381965 res!217242) b!381974))

(assert (= (and b!381974 res!217235) b!381976))

(assert (= (and b!381976 res!217237) b!381973))

(assert (= (and b!381973 res!217244) b!381969))

(assert (= (and b!381969 res!217241) b!381972))

(assert (= (and b!381972 res!217240) b!381968))

(assert (= (and b!381968 res!217234) b!381963))

(assert (= (and b!381963 res!217243) b!381967))

(assert (= (and b!381967 (not res!217236)) b!381964))

(assert (= (and b!381975 condMapEmpty!15462) mapIsEmpty!15462))

(assert (= (and b!381975 (not condMapEmpty!15462)) mapNonEmpty!15462))

(get-info :version)

(assert (= (and mapNonEmpty!15462 ((_ is ValueCellFull!4289) mapValue!15462)) b!381971))

(assert (= (and b!381975 ((_ is ValueCellFull!4289) mapDefault!15462)) b!381966))

(assert (= start!37476 b!381975))

(declare-fun m!378353 () Bool)

(assert (=> b!381967 m!378353))

(declare-fun m!378355 () Bool)

(assert (=> b!381967 m!378355))

(declare-fun m!378357 () Bool)

(assert (=> b!381967 m!378357))

(declare-fun m!378359 () Bool)

(assert (=> b!381967 m!378359))

(declare-fun m!378361 () Bool)

(assert (=> b!381967 m!378361))

(declare-fun m!378363 () Bool)

(assert (=> b!381967 m!378363))

(declare-fun m!378365 () Bool)

(assert (=> b!381967 m!378365))

(declare-fun m!378367 () Bool)

(assert (=> b!381973 m!378367))

(declare-fun m!378369 () Bool)

(assert (=> b!381969 m!378369))

(declare-fun m!378371 () Bool)

(assert (=> b!381965 m!378371))

(declare-fun m!378373 () Bool)

(assert (=> b!381972 m!378373))

(declare-fun m!378375 () Bool)

(assert (=> b!381963 m!378375))

(declare-fun m!378377 () Bool)

(assert (=> b!381968 m!378377))

(declare-fun m!378379 () Bool)

(assert (=> b!381968 m!378379))

(declare-fun m!378381 () Bool)

(assert (=> start!37476 m!378381))

(declare-fun m!378383 () Bool)

(assert (=> start!37476 m!378383))

(declare-fun m!378385 () Bool)

(assert (=> start!37476 m!378385))

(declare-fun m!378387 () Bool)

(assert (=> mapNonEmpty!15462 m!378387))

(declare-fun m!378389 () Bool)

(assert (=> b!381974 m!378389))

(check-sat (not b!381973) tp_is_empty!9265 (not mapNonEmpty!15462) (not b!381968) (not start!37476) (not b!381967) (not b!381974) b_and!15833 (not b_next!8617) (not b!381972) (not b!381963) (not b!381965))
(check-sat b_and!15833 (not b_next!8617))
