; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37368 () Bool)

(assert start!37368)

(declare-fun b_free!8495 () Bool)

(declare-fun b_next!8495 () Bool)

(assert (=> start!37368 (= b_free!8495 (not b_next!8495))))

(declare-fun tp!30200 () Bool)

(declare-fun b_and!15737 () Bool)

(assert (=> start!37368 (= tp!30200 b_and!15737)))

(declare-fun b!379590 () Bool)

(declare-fun e!230940 () Bool)

(declare-fun e!230937 () Bool)

(assert (=> b!379590 (= e!230940 (not e!230937))))

(declare-fun res!215274 () Bool)

(assert (=> b!379590 (=> res!215274 e!230937)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379590 (= res!215274 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13295 0))(
  ( (V!13296 (val!4616 Int)) )
))
(declare-datatypes ((ValueCell!4228 0))(
  ( (ValueCellFull!4228 (v!6813 V!13295)) (EmptyCell!4228) )
))
(declare-datatypes ((array!22207 0))(
  ( (array!22208 (arr!10572 (Array (_ BitVec 32) ValueCell!4228)) (size!10924 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22207)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6178 0))(
  ( (tuple2!6179 (_1!3100 (_ BitVec 64)) (_2!3100 V!13295)) )
))
(declare-datatypes ((List!6014 0))(
  ( (Nil!6011) (Cons!6010 (h!6866 tuple2!6178) (t!11164 List!6014)) )
))
(declare-datatypes ((ListLongMap!5091 0))(
  ( (ListLongMap!5092 (toList!2561 List!6014)) )
))
(declare-fun lt!177317 () ListLongMap!5091)

(declare-fun zeroValue!472 () V!13295)

(declare-datatypes ((array!22209 0))(
  ( (array!22210 (arr!10573 (Array (_ BitVec 32) (_ BitVec 64))) (size!10925 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22209)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13295)

(declare-fun getCurrentListMap!1982 (array!22209 array!22207 (_ BitVec 32) (_ BitVec 32) V!13295 V!13295 (_ BitVec 32) Int) ListLongMap!5091)

(assert (=> b!379590 (= lt!177317 (getCurrentListMap!1982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177322 () array!22209)

(declare-fun lt!177319 () array!22207)

(declare-fun lt!177316 () ListLongMap!5091)

(assert (=> b!379590 (= lt!177316 (getCurrentListMap!1982 lt!177322 lt!177319 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177324 () ListLongMap!5091)

(declare-fun lt!177323 () ListLongMap!5091)

(assert (=> b!379590 (and (= lt!177324 lt!177323) (= lt!177323 lt!177324))))

(declare-fun lt!177327 () ListLongMap!5091)

(declare-fun lt!177325 () tuple2!6178)

(declare-fun +!907 (ListLongMap!5091 tuple2!6178) ListLongMap!5091)

(assert (=> b!379590 (= lt!177323 (+!907 lt!177327 lt!177325))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13295)

(assert (=> b!379590 (= lt!177325 (tuple2!6179 k!778 v!373))))

(declare-datatypes ((Unit!11710 0))(
  ( (Unit!11711) )
))
(declare-fun lt!177321 () Unit!11710)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!140 (array!22209 array!22207 (_ BitVec 32) (_ BitVec 32) V!13295 V!13295 (_ BitVec 32) (_ BitVec 64) V!13295 (_ BitVec 32) Int) Unit!11710)

(assert (=> b!379590 (= lt!177321 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!140 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!816 (array!22209 array!22207 (_ BitVec 32) (_ BitVec 32) V!13295 V!13295 (_ BitVec 32) Int) ListLongMap!5091)

(assert (=> b!379590 (= lt!177324 (getCurrentListMapNoExtraKeys!816 lt!177322 lt!177319 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379590 (= lt!177319 (array!22208 (store (arr!10572 _values!506) i!548 (ValueCellFull!4228 v!373)) (size!10924 _values!506)))))

(assert (=> b!379590 (= lt!177327 (getCurrentListMapNoExtraKeys!816 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379591 () Bool)

(declare-fun res!215275 () Bool)

(declare-fun e!230941 () Bool)

(assert (=> b!379591 (=> (not res!215275) (not e!230941))))

(declare-fun arrayContainsKey!0 (array!22209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379591 (= res!215275 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379592 () Bool)

(declare-fun res!215272 () Bool)

(assert (=> b!379592 (=> (not res!215272) (not e!230941))))

(declare-datatypes ((List!6015 0))(
  ( (Nil!6012) (Cons!6011 (h!6867 (_ BitVec 64)) (t!11165 List!6015)) )
))
(declare-fun arrayNoDuplicates!0 (array!22209 (_ BitVec 32) List!6015) Bool)

(assert (=> b!379592 (= res!215272 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6012))))

(declare-fun b!379593 () Bool)

(declare-fun res!215278 () Bool)

(assert (=> b!379593 (=> (not res!215278) (not e!230941))))

(assert (=> b!379593 (= res!215278 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10925 _keys!658))))))

(declare-fun b!379594 () Bool)

(declare-fun e!230938 () Bool)

(declare-fun tp_is_empty!9143 () Bool)

(assert (=> b!379594 (= e!230938 tp_is_empty!9143)))

(declare-fun b!379595 () Bool)

(declare-fun e!230935 () Bool)

(assert (=> b!379595 (= e!230935 (bvsle #b00000000000000000000000000000000 (size!10925 _keys!658)))))

(declare-fun lt!177318 () ListLongMap!5091)

(declare-fun lt!177315 () ListLongMap!5091)

(assert (=> b!379595 (= lt!177318 (+!907 lt!177315 lt!177325))))

(declare-fun lt!177320 () Unit!11710)

(declare-fun addCommutativeForDiffKeys!305 (ListLongMap!5091 (_ BitVec 64) V!13295 (_ BitVec 64) V!13295) Unit!11710)

(assert (=> b!379595 (= lt!177320 (addCommutativeForDiffKeys!305 lt!177327 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379596 () Bool)

(declare-fun e!230936 () Bool)

(declare-fun mapRes!15279 () Bool)

(assert (=> b!379596 (= e!230936 (and e!230938 mapRes!15279))))

(declare-fun condMapEmpty!15279 () Bool)

(declare-fun mapDefault!15279 () ValueCell!4228)

