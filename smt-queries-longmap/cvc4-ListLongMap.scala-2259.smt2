; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37020 () Bool)

(assert start!37020)

(declare-fun b_free!8147 () Bool)

(declare-fun b_next!8147 () Bool)

(assert (=> start!37020 (= b_free!8147 (not b_next!8147))))

(declare-fun tp!29156 () Bool)

(declare-fun b_and!15389 () Bool)

(assert (=> start!37020 (= tp!29156 b_and!15389)))

(declare-fun mapNonEmpty!14757 () Bool)

(declare-fun mapRes!14757 () Bool)

(declare-fun tp!29157 () Bool)

(declare-fun e!226936 () Bool)

(assert (=> mapNonEmpty!14757 (= mapRes!14757 (and tp!29157 e!226936))))

(declare-datatypes ((V!12831 0))(
  ( (V!12832 (val!4442 Int)) )
))
(declare-datatypes ((ValueCell!4054 0))(
  ( (ValueCellFull!4054 (v!6639 V!12831)) (EmptyCell!4054) )
))
(declare-fun mapValue!14757 () ValueCell!4054)

(declare-fun mapRest!14757 () (Array (_ BitVec 32) ValueCell!4054))

(declare-datatypes ((array!21531 0))(
  ( (array!21532 (arr!10234 (Array (_ BitVec 32) ValueCell!4054)) (size!10586 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21531)

(declare-fun mapKey!14757 () (_ BitVec 32))

(assert (=> mapNonEmpty!14757 (= (arr!10234 _values!506) (store mapRest!14757 mapKey!14757 mapValue!14757))))

(declare-fun res!209150 () Bool)

(declare-fun e!226933 () Bool)

(assert (=> start!37020 (=> (not res!209150) (not e!226933))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37020 (= res!209150 (validMask!0 mask!970))))

(assert (=> start!37020 e!226933))

(declare-fun e!226932 () Bool)

(declare-fun array_inv!7552 (array!21531) Bool)

(assert (=> start!37020 (and (array_inv!7552 _values!506) e!226932)))

(assert (=> start!37020 tp!29156))

(assert (=> start!37020 true))

(declare-fun tp_is_empty!8795 () Bool)

(assert (=> start!37020 tp_is_empty!8795))

(declare-datatypes ((array!21533 0))(
  ( (array!21534 (arr!10235 (Array (_ BitVec 32) (_ BitVec 64))) (size!10587 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21533)

(declare-fun array_inv!7553 (array!21533) Bool)

(assert (=> start!37020 (array_inv!7553 _keys!658)))

(declare-fun b!371906 () Bool)

(declare-fun res!209159 () Bool)

(assert (=> b!371906 (=> (not res!209159) (not e!226933))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371906 (= res!209159 (and (= (size!10586 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10587 _keys!658) (size!10586 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371907 () Bool)

(assert (=> b!371907 (= e!226936 tp_is_empty!8795)))

(declare-fun mapIsEmpty!14757 () Bool)

(assert (=> mapIsEmpty!14757 mapRes!14757))

(declare-fun b!371908 () Bool)

(declare-fun res!209153 () Bool)

(assert (=> b!371908 (=> (not res!209153) (not e!226933))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371908 (= res!209153 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10587 _keys!658))))))

(declare-fun b!371909 () Bool)

(declare-fun res!209151 () Bool)

(assert (=> b!371909 (=> (not res!209151) (not e!226933))))

(assert (=> b!371909 (= res!209151 (or (= (select (arr!10235 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10235 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371910 () Bool)

(declare-fun res!209154 () Bool)

(assert (=> b!371910 (=> (not res!209154) (not e!226933))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371910 (= res!209154 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!371911 () Bool)

(declare-fun res!209156 () Bool)

(declare-fun e!226935 () Bool)

(assert (=> b!371911 (=> (not res!209156) (not e!226935))))

(declare-fun lt!170467 () array!21533)

(declare-datatypes ((List!5735 0))(
  ( (Nil!5732) (Cons!5731 (h!6587 (_ BitVec 64)) (t!10885 List!5735)) )
))
(declare-fun arrayNoDuplicates!0 (array!21533 (_ BitVec 32) List!5735) Bool)

(assert (=> b!371911 (= res!209156 (arrayNoDuplicates!0 lt!170467 #b00000000000000000000000000000000 Nil!5732))))

(declare-fun b!371912 () Bool)

(assert (=> b!371912 (= e!226935 (not (bvsle #b00000000000000000000000000000000 (size!10587 _keys!658))))))

(declare-datatypes ((tuple2!5894 0))(
  ( (tuple2!5895 (_1!2958 (_ BitVec 64)) (_2!2958 V!12831)) )
))
(declare-datatypes ((List!5736 0))(
  ( (Nil!5733) (Cons!5732 (h!6588 tuple2!5894) (t!10886 List!5736)) )
))
(declare-datatypes ((ListLongMap!4807 0))(
  ( (ListLongMap!4808 (toList!2419 List!5736)) )
))
(declare-fun lt!170469 () ListLongMap!4807)

(declare-fun lt!170468 () ListLongMap!4807)

(assert (=> b!371912 (and (= lt!170469 lt!170468) (= lt!170468 lt!170469))))

(declare-fun v!373 () V!12831)

(declare-fun lt!170466 () ListLongMap!4807)

(declare-fun +!765 (ListLongMap!4807 tuple2!5894) ListLongMap!4807)

(assert (=> b!371912 (= lt!170468 (+!765 lt!170466 (tuple2!5895 k!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12831)

(declare-datatypes ((Unit!11436 0))(
  ( (Unit!11437) )
))
(declare-fun lt!170465 () Unit!11436)

(declare-fun minValue!472 () V!12831)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!20 (array!21533 array!21531 (_ BitVec 32) (_ BitVec 32) V!12831 V!12831 (_ BitVec 32) (_ BitVec 64) V!12831 (_ BitVec 32) Int) Unit!11436)

(assert (=> b!371912 (= lt!170465 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!20 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!696 (array!21533 array!21531 (_ BitVec 32) (_ BitVec 32) V!12831 V!12831 (_ BitVec 32) Int) ListLongMap!4807)

(assert (=> b!371912 (= lt!170469 (getCurrentListMapNoExtraKeys!696 lt!170467 (array!21532 (store (arr!10234 _values!506) i!548 (ValueCellFull!4054 v!373)) (size!10586 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371912 (= lt!170466 (getCurrentListMapNoExtraKeys!696 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371913 () Bool)

(declare-fun res!209157 () Bool)

(assert (=> b!371913 (=> (not res!209157) (not e!226933))))

(assert (=> b!371913 (= res!209157 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5732))))

(declare-fun b!371914 () Bool)

(declare-fun e!226937 () Bool)

(assert (=> b!371914 (= e!226932 (and e!226937 mapRes!14757))))

(declare-fun condMapEmpty!14757 () Bool)

(declare-fun mapDefault!14757 () ValueCell!4054)

