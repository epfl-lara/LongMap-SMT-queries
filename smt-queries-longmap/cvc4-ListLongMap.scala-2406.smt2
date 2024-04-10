; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38080 () Bool)

(assert start!38080)

(declare-fun b_free!9005 () Bool)

(declare-fun b_next!9005 () Bool)

(assert (=> start!38080 (= b_free!9005 (not b_next!9005))))

(declare-fun tp!31791 () Bool)

(declare-fun b_and!16343 () Bool)

(assert (=> start!38080 (= tp!31791 b_and!16343)))

(declare-fun b!392206 () Bool)

(declare-fun res!224589 () Bool)

(declare-fun e!237512 () Bool)

(assert (=> b!392206 (=> (not res!224589) (not e!237512))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23259 0))(
  ( (array!23260 (arr!11090 (Array (_ BitVec 32) (_ BitVec 64))) (size!11442 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23259)

(assert (=> b!392206 (= res!224589 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11442 _keys!658))))))

(declare-fun b!392207 () Bool)

(declare-fun res!224590 () Bool)

(declare-fun e!237513 () Bool)

(assert (=> b!392207 (=> (not res!224590) (not e!237513))))

(declare-fun lt!185291 () array!23259)

(declare-datatypes ((List!6437 0))(
  ( (Nil!6434) (Cons!6433 (h!7289 (_ BitVec 64)) (t!11603 List!6437)) )
))
(declare-fun arrayNoDuplicates!0 (array!23259 (_ BitVec 32) List!6437) Bool)

(assert (=> b!392207 (= res!224590 (arrayNoDuplicates!0 lt!185291 #b00000000000000000000000000000000 Nil!6434))))

(declare-fun b!392208 () Bool)

(declare-fun e!237516 () Bool)

(assert (=> b!392208 (= e!237513 (not e!237516))))

(declare-fun res!224586 () Bool)

(assert (=> b!392208 (=> res!224586 e!237516)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392208 (= res!224586 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!14007 0))(
  ( (V!14008 (val!4883 Int)) )
))
(declare-datatypes ((ValueCell!4495 0))(
  ( (ValueCellFull!4495 (v!7112 V!14007)) (EmptyCell!4495) )
))
(declare-datatypes ((array!23261 0))(
  ( (array!23262 (arr!11091 (Array (_ BitVec 32) ValueCell!4495)) (size!11443 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23261)

(declare-fun zeroValue!472 () V!14007)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6584 0))(
  ( (tuple2!6585 (_1!3303 (_ BitVec 64)) (_2!3303 V!14007)) )
))
(declare-datatypes ((List!6438 0))(
  ( (Nil!6435) (Cons!6434 (h!7290 tuple2!6584) (t!11604 List!6438)) )
))
(declare-datatypes ((ListLongMap!5497 0))(
  ( (ListLongMap!5498 (toList!2764 List!6438)) )
))
(declare-fun lt!185287 () ListLongMap!5497)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14007)

(declare-fun getCurrentListMap!2106 (array!23259 array!23261 (_ BitVec 32) (_ BitVec 32) V!14007 V!14007 (_ BitVec 32) Int) ListLongMap!5497)

(assert (=> b!392208 (= lt!185287 (getCurrentListMap!2106 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185292 () ListLongMap!5497)

(declare-fun lt!185289 () array!23261)

(assert (=> b!392208 (= lt!185292 (getCurrentListMap!2106 lt!185291 lt!185289 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185286 () ListLongMap!5497)

(declare-fun lt!185288 () ListLongMap!5497)

(assert (=> b!392208 (and (= lt!185286 lt!185288) (= lt!185288 lt!185286))))

(declare-fun v!373 () V!14007)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun lt!185290 () ListLongMap!5497)

(declare-fun +!1059 (ListLongMap!5497 tuple2!6584) ListLongMap!5497)

(assert (=> b!392208 (= lt!185288 (+!1059 lt!185290 (tuple2!6585 k!778 v!373)))))

(declare-datatypes ((Unit!12002 0))(
  ( (Unit!12003) )
))
(declare-fun lt!185285 () Unit!12002)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!270 (array!23259 array!23261 (_ BitVec 32) (_ BitVec 32) V!14007 V!14007 (_ BitVec 32) (_ BitVec 64) V!14007 (_ BitVec 32) Int) Unit!12002)

(assert (=> b!392208 (= lt!185285 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!270 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!986 (array!23259 array!23261 (_ BitVec 32) (_ BitVec 32) V!14007 V!14007 (_ BitVec 32) Int) ListLongMap!5497)

(assert (=> b!392208 (= lt!185286 (getCurrentListMapNoExtraKeys!986 lt!185291 lt!185289 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392208 (= lt!185289 (array!23262 (store (arr!11091 _values!506) i!548 (ValueCellFull!4495 v!373)) (size!11443 _values!506)))))

(assert (=> b!392208 (= lt!185290 (getCurrentListMapNoExtraKeys!986 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!16104 () Bool)

(declare-fun mapRes!16104 () Bool)

(assert (=> mapIsEmpty!16104 mapRes!16104))

(declare-fun b!392209 () Bool)

(declare-fun res!224587 () Bool)

(assert (=> b!392209 (=> (not res!224587) (not e!237512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392209 (= res!224587 (validKeyInArray!0 k!778))))

(declare-fun b!392210 () Bool)

(declare-fun res!224595 () Bool)

(assert (=> b!392210 (=> (not res!224595) (not e!237512))))

(assert (=> b!392210 (= res!224595 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6434))))

(declare-fun b!392211 () Bool)

(assert (=> b!392211 (= e!237512 e!237513)))

(declare-fun res!224594 () Bool)

(assert (=> b!392211 (=> (not res!224594) (not e!237513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23259 (_ BitVec 32)) Bool)

(assert (=> b!392211 (= res!224594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185291 mask!970))))

(assert (=> b!392211 (= lt!185291 (array!23260 (store (arr!11090 _keys!658) i!548 k!778) (size!11442 _keys!658)))))

(declare-fun b!392212 () Bool)

(declare-fun e!237514 () Bool)

(declare-fun e!237515 () Bool)

(assert (=> b!392212 (= e!237514 (and e!237515 mapRes!16104))))

(declare-fun condMapEmpty!16104 () Bool)

(declare-fun mapDefault!16104 () ValueCell!4495)

