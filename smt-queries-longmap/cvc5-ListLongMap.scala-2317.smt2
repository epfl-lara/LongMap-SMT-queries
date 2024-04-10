; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37364 () Bool)

(assert start!37364)

(declare-fun b_free!8491 () Bool)

(declare-fun b_next!8491 () Bool)

(assert (=> start!37364 (= b_free!8491 (not b_next!8491))))

(declare-fun tp!30188 () Bool)

(declare-fun b_and!15733 () Bool)

(assert (=> start!37364 (= tp!30188 b_and!15733)))

(declare-fun b!379500 () Bool)

(declare-fun res!215198 () Bool)

(declare-fun e!230892 () Bool)

(assert (=> b!379500 (=> (not res!215198) (not e!230892))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22199 0))(
  ( (array!22200 (arr!10568 (Array (_ BitVec 32) (_ BitVec 64))) (size!10920 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22199)

(assert (=> b!379500 (= res!215198 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10920 _keys!658))))))

(declare-fun b!379501 () Bool)

(declare-fun res!215199 () Bool)

(assert (=> b!379501 (=> (not res!215199) (not e!230892))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22199 (_ BitVec 32)) Bool)

(assert (=> b!379501 (= res!215199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379502 () Bool)

(declare-fun res!215203 () Bool)

(declare-fun e!230887 () Bool)

(assert (=> b!379502 (=> (not res!215203) (not e!230887))))

(declare-fun lt!177248 () array!22199)

(declare-datatypes ((List!6010 0))(
  ( (Nil!6007) (Cons!6006 (h!6862 (_ BitVec 64)) (t!11160 List!6010)) )
))
(declare-fun arrayNoDuplicates!0 (array!22199 (_ BitVec 32) List!6010) Bool)

(assert (=> b!379502 (= res!215203 (arrayNoDuplicates!0 lt!177248 #b00000000000000000000000000000000 Nil!6007))))

(declare-fun b!379503 () Bool)

(declare-fun res!215196 () Bool)

(assert (=> b!379503 (=> (not res!215196) (not e!230892))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13291 0))(
  ( (V!13292 (val!4614 Int)) )
))
(declare-datatypes ((ValueCell!4226 0))(
  ( (ValueCellFull!4226 (v!6811 V!13291)) (EmptyCell!4226) )
))
(declare-datatypes ((array!22201 0))(
  ( (array!22202 (arr!10569 (Array (_ BitVec 32) ValueCell!4226)) (size!10921 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22201)

(assert (=> b!379503 (= res!215196 (and (= (size!10921 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10920 _keys!658) (size!10921 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379504 () Bool)

(declare-fun e!230894 () Bool)

(declare-fun e!230893 () Bool)

(assert (=> b!379504 (= e!230894 e!230893)))

(declare-fun res!215197 () Bool)

(assert (=> b!379504 (=> res!215197 e!230893)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!379504 (= res!215197 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6174 0))(
  ( (tuple2!6175 (_1!3098 (_ BitVec 64)) (_2!3098 V!13291)) )
))
(declare-datatypes ((List!6011 0))(
  ( (Nil!6008) (Cons!6007 (h!6863 tuple2!6174) (t!11161 List!6011)) )
))
(declare-datatypes ((ListLongMap!5087 0))(
  ( (ListLongMap!5088 (toList!2559 List!6011)) )
))
(declare-fun lt!177240 () ListLongMap!5087)

(declare-fun lt!177245 () ListLongMap!5087)

(assert (=> b!379504 (= lt!177240 lt!177245)))

(declare-fun lt!177247 () ListLongMap!5087)

(declare-fun lt!177244 () tuple2!6174)

(declare-fun +!905 (ListLongMap!5087 tuple2!6174) ListLongMap!5087)

(assert (=> b!379504 (= lt!177245 (+!905 lt!177247 lt!177244))))

(declare-fun lt!177246 () ListLongMap!5087)

(declare-fun lt!177239 () ListLongMap!5087)

(assert (=> b!379504 (= lt!177246 lt!177239)))

(declare-fun lt!177243 () ListLongMap!5087)

(assert (=> b!379504 (= lt!177239 (+!905 lt!177243 lt!177244))))

(declare-fun lt!177237 () ListLongMap!5087)

(assert (=> b!379504 (= lt!177246 (+!905 lt!177237 lt!177244))))

(declare-fun minValue!472 () V!13291)

(assert (=> b!379504 (= lt!177244 (tuple2!6175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379505 () Bool)

(declare-fun e!230888 () Bool)

(declare-fun e!230890 () Bool)

(declare-fun mapRes!15273 () Bool)

(assert (=> b!379505 (= e!230888 (and e!230890 mapRes!15273))))

(declare-fun condMapEmpty!15273 () Bool)

(declare-fun mapDefault!15273 () ValueCell!4226)

