; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37664 () Bool)

(assert start!37664)

(declare-fun b_free!8767 () Bool)

(declare-fun b_next!8767 () Bool)

(assert (=> start!37664 (= b_free!8767 (not b_next!8767))))

(declare-fun tp!31052 () Bool)

(declare-fun b_and!16009 () Bool)

(assert (=> start!37664 (= tp!31052 b_and!16009)))

(declare-fun b!385661 () Bool)

(declare-fun res!220008 () Bool)

(declare-fun e!234073 () Bool)

(assert (=> b!385661 (=> (not res!220008) (not e!234073))))

(declare-datatypes ((array!22777 0))(
  ( (array!22778 (arr!10857 (Array (_ BitVec 32) (_ BitVec 64))) (size!11209 (_ BitVec 32))) )
))
(declare-fun lt!181644 () array!22777)

(declare-datatypes ((List!6250 0))(
  ( (Nil!6247) (Cons!6246 (h!7102 (_ BitVec 64)) (t!11400 List!6250)) )
))
(declare-fun arrayNoDuplicates!0 (array!22777 (_ BitVec 32) List!6250) Bool)

(assert (=> b!385661 (= res!220008 (arrayNoDuplicates!0 lt!181644 #b00000000000000000000000000000000 Nil!6247))))

(declare-fun b!385662 () Bool)

(declare-fun e!234069 () Bool)

(declare-fun tp_is_empty!9439 () Bool)

(assert (=> b!385662 (= e!234069 tp_is_empty!9439)))

(declare-fun b!385663 () Bool)

(declare-fun res!220007 () Bool)

(declare-fun e!234071 () Bool)

(assert (=> b!385663 (=> (not res!220007) (not e!234071))))

(declare-fun _keys!658 () array!22777)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22777 (_ BitVec 32)) Bool)

(assert (=> b!385663 (= res!220007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385664 () Bool)

(declare-fun res!220015 () Bool)

(assert (=> b!385664 (=> (not res!220015) (not e!234071))))

(assert (=> b!385664 (= res!220015 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6247))))

(declare-fun b!385665 () Bool)

(assert (=> b!385665 (= e!234073 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13691 0))(
  ( (V!13692 (val!4764 Int)) )
))
(declare-datatypes ((ValueCell!4376 0))(
  ( (ValueCellFull!4376 (v!6961 V!13691)) (EmptyCell!4376) )
))
(declare-datatypes ((array!22779 0))(
  ( (array!22780 (arr!10858 (Array (_ BitVec 32) ValueCell!4376)) (size!11210 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22779)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6404 0))(
  ( (tuple2!6405 (_1!3213 (_ BitVec 64)) (_2!3213 V!13691)) )
))
(declare-datatypes ((List!6251 0))(
  ( (Nil!6248) (Cons!6247 (h!7103 tuple2!6404) (t!11401 List!6251)) )
))
(declare-datatypes ((ListLongMap!5317 0))(
  ( (ListLongMap!5318 (toList!2674 List!6251)) )
))
(declare-fun lt!181643 () ListLongMap!5317)

(declare-fun zeroValue!472 () V!13691)

(declare-fun minValue!472 () V!13691)

(declare-fun getCurrentListMapNoExtraKeys!903 (array!22777 array!22779 (_ BitVec 32) (_ BitVec 32) V!13691 V!13691 (_ BitVec 32) Int) ListLongMap!5317)

(assert (=> b!385665 (= lt!181643 (getCurrentListMapNoExtraKeys!903 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385666 () Bool)

(declare-fun res!220009 () Bool)

(assert (=> b!385666 (=> (not res!220009) (not e!234071))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385666 (= res!220009 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!385667 () Bool)

(declare-fun e!234074 () Bool)

(assert (=> b!385667 (= e!234074 tp_is_empty!9439)))

(declare-fun mapIsEmpty!15723 () Bool)

(declare-fun mapRes!15723 () Bool)

(assert (=> mapIsEmpty!15723 mapRes!15723))

(declare-fun b!385668 () Bool)

(declare-fun e!234070 () Bool)

(assert (=> b!385668 (= e!234070 (and e!234069 mapRes!15723))))

(declare-fun condMapEmpty!15723 () Bool)

(declare-fun mapDefault!15723 () ValueCell!4376)

