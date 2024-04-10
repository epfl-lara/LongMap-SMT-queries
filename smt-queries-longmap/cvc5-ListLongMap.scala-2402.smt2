; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38030 () Bool)

(assert start!38030)

(declare-fun b_free!8977 () Bool)

(declare-fun b_next!8977 () Bool)

(assert (=> start!38030 (= b_free!8977 (not b_next!8977))))

(declare-fun tp!31704 () Bool)

(declare-fun b_and!16303 () Bool)

(assert (=> start!38030 (= tp!31704 b_and!16303)))

(declare-fun b!391392 () Bool)

(declare-fun e!237066 () Bool)

(declare-fun e!237067 () Bool)

(assert (=> b!391392 (= e!237066 (not e!237067))))

(declare-fun res!224009 () Bool)

(assert (=> b!391392 (=> res!224009 e!237067)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391392 (= res!224009 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!13971 0))(
  ( (V!13972 (val!4869 Int)) )
))
(declare-fun zeroValue!472 () V!13971)

(declare-datatypes ((array!23201 0))(
  ( (array!23202 (arr!11062 (Array (_ BitVec 32) (_ BitVec 64))) (size!11414 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23201)

(declare-datatypes ((ValueCell!4481 0))(
  ( (ValueCellFull!4481 (v!7094 V!13971)) (EmptyCell!4481) )
))
(declare-datatypes ((array!23203 0))(
  ( (array!23204 (arr!11063 (Array (_ BitVec 32) ValueCell!4481)) (size!11415 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23203)

(declare-datatypes ((tuple2!6558 0))(
  ( (tuple2!6559 (_1!3290 (_ BitVec 64)) (_2!3290 V!13971)) )
))
(declare-datatypes ((List!6413 0))(
  ( (Nil!6410) (Cons!6409 (h!7265 tuple2!6558) (t!11577 List!6413)) )
))
(declare-datatypes ((ListLongMap!5471 0))(
  ( (ListLongMap!5472 (toList!2751 List!6413)) )
))
(declare-fun lt!184670 () ListLongMap!5471)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13971)

(declare-fun getCurrentListMap!2095 (array!23201 array!23203 (_ BitVec 32) (_ BitVec 32) V!13971 V!13971 (_ BitVec 32) Int) ListLongMap!5471)

(assert (=> b!391392 (= lt!184670 (getCurrentListMap!2095 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184673 () ListLongMap!5471)

(declare-fun lt!184677 () array!23203)

(declare-fun lt!184672 () array!23201)

(assert (=> b!391392 (= lt!184673 (getCurrentListMap!2095 lt!184672 lt!184677 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184674 () ListLongMap!5471)

(declare-fun lt!184668 () ListLongMap!5471)

(assert (=> b!391392 (and (= lt!184674 lt!184668) (= lt!184668 lt!184674))))

(declare-fun lt!184669 () ListLongMap!5471)

(declare-fun lt!184671 () tuple2!6558)

(declare-fun +!1046 (ListLongMap!5471 tuple2!6558) ListLongMap!5471)

(assert (=> b!391392 (= lt!184668 (+!1046 lt!184669 lt!184671))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13971)

(assert (=> b!391392 (= lt!184671 (tuple2!6559 k!778 v!373))))

(declare-datatypes ((Unit!11974 0))(
  ( (Unit!11975) )
))
(declare-fun lt!184679 () Unit!11974)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!259 (array!23201 array!23203 (_ BitVec 32) (_ BitVec 32) V!13971 V!13971 (_ BitVec 32) (_ BitVec 64) V!13971 (_ BitVec 32) Int) Unit!11974)

(assert (=> b!391392 (= lt!184679 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!259 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!975 (array!23201 array!23203 (_ BitVec 32) (_ BitVec 32) V!13971 V!13971 (_ BitVec 32) Int) ListLongMap!5471)

(assert (=> b!391392 (= lt!184674 (getCurrentListMapNoExtraKeys!975 lt!184672 lt!184677 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391392 (= lt!184677 (array!23204 (store (arr!11063 _values!506) i!548 (ValueCellFull!4481 v!373)) (size!11415 _values!506)))))

(assert (=> b!391392 (= lt!184669 (getCurrentListMapNoExtraKeys!975 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391393 () Bool)

(declare-fun e!237069 () Bool)

(assert (=> b!391393 (= e!237069 e!237066)))

(declare-fun res!224017 () Bool)

(assert (=> b!391393 (=> (not res!224017) (not e!237066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23201 (_ BitVec 32)) Bool)

(assert (=> b!391393 (= res!224017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184672 mask!970))))

(assert (=> b!391393 (= lt!184672 (array!23202 (store (arr!11062 _keys!658) i!548 k!778) (size!11414 _keys!658)))))

(declare-fun b!391394 () Bool)

(declare-fun e!237065 () Bool)

(declare-fun e!237064 () Bool)

(declare-fun mapRes!16059 () Bool)

(assert (=> b!391394 (= e!237065 (and e!237064 mapRes!16059))))

(declare-fun condMapEmpty!16059 () Bool)

(declare-fun mapDefault!16059 () ValueCell!4481)

