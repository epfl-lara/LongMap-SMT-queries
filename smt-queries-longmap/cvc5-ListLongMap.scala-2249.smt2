; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36956 () Bool)

(assert start!36956)

(declare-fun b_free!8083 () Bool)

(declare-fun b_next!8083 () Bool)

(assert (=> start!36956 (= b_free!8083 (not b_next!8083))))

(declare-fun tp!28964 () Bool)

(declare-fun b_and!15325 () Bool)

(assert (=> start!36956 (= tp!28964 b_and!15325)))

(declare-fun mapIsEmpty!14661 () Bool)

(declare-fun mapRes!14661 () Bool)

(assert (=> mapIsEmpty!14661 mapRes!14661))

(declare-fun b!370658 () Bool)

(declare-fun res!208190 () Bool)

(declare-fun e!226356 () Bool)

(assert (=> b!370658 (=> (not res!208190) (not e!226356))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21405 0))(
  ( (array!21406 (arr!10171 (Array (_ BitVec 32) (_ BitVec 64))) (size!10523 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21405)

(assert (=> b!370658 (= res!208190 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10523 _keys!658))))))

(declare-fun b!370659 () Bool)

(declare-fun res!208193 () Bool)

(assert (=> b!370659 (=> (not res!208193) (not e!226356))))

(assert (=> b!370659 (= res!208193 (or (= (select (arr!10171 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10171 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370660 () Bool)

(declare-fun e!226361 () Bool)

(declare-fun tp_is_empty!8731 () Bool)

(assert (=> b!370660 (= e!226361 tp_is_empty!8731)))

(declare-fun b!370661 () Bool)

(declare-fun res!208195 () Bool)

(assert (=> b!370661 (=> (not res!208195) (not e!226356))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370661 (= res!208195 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14661 () Bool)

(declare-fun tp!28965 () Bool)

(assert (=> mapNonEmpty!14661 (= mapRes!14661 (and tp!28965 e!226361))))

(declare-datatypes ((V!12747 0))(
  ( (V!12748 (val!4410 Int)) )
))
(declare-datatypes ((ValueCell!4022 0))(
  ( (ValueCellFull!4022 (v!6607 V!12747)) (EmptyCell!4022) )
))
(declare-datatypes ((array!21407 0))(
  ( (array!21408 (arr!10172 (Array (_ BitVec 32) ValueCell!4022)) (size!10524 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21407)

(declare-fun mapRest!14661 () (Array (_ BitVec 32) ValueCell!4022))

(declare-fun mapKey!14661 () (_ BitVec 32))

(declare-fun mapValue!14661 () ValueCell!4022)

(assert (=> mapNonEmpty!14661 (= (arr!10172 _values!506) (store mapRest!14661 mapKey!14661 mapValue!14661))))

(declare-fun b!370662 () Bool)

(declare-fun res!208191 () Bool)

(assert (=> b!370662 (=> (not res!208191) (not e!226356))))

(declare-datatypes ((List!5686 0))(
  ( (Nil!5683) (Cons!5682 (h!6538 (_ BitVec 64)) (t!10836 List!5686)) )
))
(declare-fun arrayNoDuplicates!0 (array!21405 (_ BitVec 32) List!5686) Bool)

(assert (=> b!370662 (= res!208191 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5683))))

(declare-fun b!370663 () Bool)

(declare-fun e!226358 () Bool)

(assert (=> b!370663 (= e!226358 false)))

(declare-datatypes ((tuple2!5848 0))(
  ( (tuple2!5849 (_1!2935 (_ BitVec 64)) (_2!2935 V!12747)) )
))
(declare-datatypes ((List!5687 0))(
  ( (Nil!5684) (Cons!5683 (h!6539 tuple2!5848) (t!10837 List!5687)) )
))
(declare-datatypes ((ListLongMap!4761 0))(
  ( (ListLongMap!4762 (toList!2396 List!5687)) )
))
(declare-fun lt!170017 () ListLongMap!4761)

(declare-fun defaultEntry!514 () Int)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12747)

(declare-fun lt!170018 () array!21405)

(declare-fun zeroValue!472 () V!12747)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12747)

(declare-fun getCurrentListMapNoExtraKeys!673 (array!21405 array!21407 (_ BitVec 32) (_ BitVec 32) V!12747 V!12747 (_ BitVec 32) Int) ListLongMap!4761)

(assert (=> b!370663 (= lt!170017 (getCurrentListMapNoExtraKeys!673 lt!170018 (array!21408 (store (arr!10172 _values!506) i!548 (ValueCellFull!4022 v!373)) (size!10524 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170019 () ListLongMap!4761)

(assert (=> b!370663 (= lt!170019 (getCurrentListMapNoExtraKeys!673 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370664 () Bool)

(declare-fun res!208192 () Bool)

(assert (=> b!370664 (=> (not res!208192) (not e!226356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21405 (_ BitVec 32)) Bool)

(assert (=> b!370664 (= res!208192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370665 () Bool)

(declare-fun e!226360 () Bool)

(declare-fun e!226359 () Bool)

(assert (=> b!370665 (= e!226360 (and e!226359 mapRes!14661))))

(declare-fun condMapEmpty!14661 () Bool)

(declare-fun mapDefault!14661 () ValueCell!4022)

