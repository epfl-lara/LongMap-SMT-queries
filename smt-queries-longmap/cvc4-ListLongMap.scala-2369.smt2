; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37680 () Bool)

(assert start!37680)

(declare-fun b_free!8783 () Bool)

(declare-fun b_next!8783 () Bool)

(assert (=> start!37680 (= b_free!8783 (not b_next!8783))))

(declare-fun tp!31100 () Bool)

(declare-fun b_and!16025 () Bool)

(assert (=> start!37680 (= tp!31100 b_and!16025)))

(declare-fun b!385973 () Bool)

(declare-fun e!234214 () Bool)

(declare-fun tp_is_empty!9455 () Bool)

(assert (=> b!385973 (= e!234214 tp_is_empty!9455)))

(declare-fun res!220247 () Bool)

(declare-fun e!234215 () Bool)

(assert (=> start!37680 (=> (not res!220247) (not e!234215))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37680 (= res!220247 (validMask!0 mask!970))))

(assert (=> start!37680 e!234215))

(declare-datatypes ((V!13711 0))(
  ( (V!13712 (val!4772 Int)) )
))
(declare-datatypes ((ValueCell!4384 0))(
  ( (ValueCellFull!4384 (v!6969 V!13711)) (EmptyCell!4384) )
))
(declare-datatypes ((array!22809 0))(
  ( (array!22810 (arr!10873 (Array (_ BitVec 32) ValueCell!4384)) (size!11225 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22809)

(declare-fun e!234216 () Bool)

(declare-fun array_inv!8002 (array!22809) Bool)

(assert (=> start!37680 (and (array_inv!8002 _values!506) e!234216)))

(assert (=> start!37680 tp!31100))

(assert (=> start!37680 true))

(assert (=> start!37680 tp_is_empty!9455))

(declare-datatypes ((array!22811 0))(
  ( (array!22812 (arr!10874 (Array (_ BitVec 32) (_ BitVec 64))) (size!11226 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22811)

(declare-fun array_inv!8003 (array!22811) Bool)

(assert (=> start!37680 (array_inv!8003 _keys!658)))

(declare-fun b!385974 () Bool)

(declare-fun e!234217 () Bool)

(assert (=> b!385974 (= e!234217 tp_is_empty!9455)))

(declare-fun mapNonEmpty!15747 () Bool)

(declare-fun mapRes!15747 () Bool)

(declare-fun tp!31101 () Bool)

(assert (=> mapNonEmpty!15747 (= mapRes!15747 (and tp!31101 e!234214))))

(declare-fun mapRest!15747 () (Array (_ BitVec 32) ValueCell!4384))

(declare-fun mapKey!15747 () (_ BitVec 32))

(declare-fun mapValue!15747 () ValueCell!4384)

(assert (=> mapNonEmpty!15747 (= (arr!10873 _values!506) (store mapRest!15747 mapKey!15747 mapValue!15747))))

(declare-fun b!385975 () Bool)

(declare-fun e!234213 () Bool)

(assert (=> b!385975 (= e!234213 (bvsgt #b00000000000000000000000000000000 (size!11226 _keys!658)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13711)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13711)

(declare-fun lt!181699 () array!22811)

(declare-datatypes ((tuple2!6414 0))(
  ( (tuple2!6415 (_1!3218 (_ BitVec 64)) (_2!3218 V!13711)) )
))
(declare-datatypes ((List!6260 0))(
  ( (Nil!6257) (Cons!6256 (h!7112 tuple2!6414) (t!11410 List!6260)) )
))
(declare-datatypes ((ListLongMap!5327 0))(
  ( (ListLongMap!5328 (toList!2679 List!6260)) )
))
(declare-fun lt!181700 () ListLongMap!5327)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13711)

(declare-fun getCurrentListMapNoExtraKeys!908 (array!22811 array!22809 (_ BitVec 32) (_ BitVec 32) V!13711 V!13711 (_ BitVec 32) Int) ListLongMap!5327)

(assert (=> b!385975 (= lt!181700 (getCurrentListMapNoExtraKeys!908 lt!181699 (array!22810 (store (arr!10873 _values!506) i!548 (ValueCellFull!4384 v!373)) (size!11225 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181701 () ListLongMap!5327)

(assert (=> b!385975 (= lt!181701 (getCurrentListMapNoExtraKeys!908 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385976 () Bool)

(declare-fun res!220256 () Bool)

(assert (=> b!385976 (=> (not res!220256) (not e!234215))))

(assert (=> b!385976 (= res!220256 (and (= (size!11225 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11226 _keys!658) (size!11225 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385977 () Bool)

(declare-fun res!220248 () Bool)

(assert (=> b!385977 (=> (not res!220248) (not e!234215))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385977 (= res!220248 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15747 () Bool)

(assert (=> mapIsEmpty!15747 mapRes!15747))

(declare-fun b!385978 () Bool)

(declare-fun res!220254 () Bool)

(assert (=> b!385978 (=> (not res!220254) (not e!234213))))

(declare-datatypes ((List!6261 0))(
  ( (Nil!6258) (Cons!6257 (h!7113 (_ BitVec 64)) (t!11411 List!6261)) )
))
(declare-fun arrayNoDuplicates!0 (array!22811 (_ BitVec 32) List!6261) Bool)

(assert (=> b!385978 (= res!220254 (arrayNoDuplicates!0 lt!181699 #b00000000000000000000000000000000 Nil!6258))))

(declare-fun b!385979 () Bool)

(declare-fun res!220250 () Bool)

(assert (=> b!385979 (=> (not res!220250) (not e!234215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22811 (_ BitVec 32)) Bool)

(assert (=> b!385979 (= res!220250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385980 () Bool)

(assert (=> b!385980 (= e!234215 e!234213)))

(declare-fun res!220251 () Bool)

(assert (=> b!385980 (=> (not res!220251) (not e!234213))))

(assert (=> b!385980 (= res!220251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181699 mask!970))))

(assert (=> b!385980 (= lt!181699 (array!22812 (store (arr!10874 _keys!658) i!548 k!778) (size!11226 _keys!658)))))

(declare-fun b!385981 () Bool)

(declare-fun res!220252 () Bool)

(assert (=> b!385981 (=> (not res!220252) (not e!234215))))

(assert (=> b!385981 (= res!220252 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11226 _keys!658))))))

(declare-fun b!385982 () Bool)

(declare-fun res!220253 () Bool)

(assert (=> b!385982 (=> (not res!220253) (not e!234215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385982 (= res!220253 (validKeyInArray!0 k!778))))

(declare-fun b!385983 () Bool)

(declare-fun res!220255 () Bool)

(assert (=> b!385983 (=> (not res!220255) (not e!234215))))

(assert (=> b!385983 (= res!220255 (or (= (select (arr!10874 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10874 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385984 () Bool)

(declare-fun res!220249 () Bool)

(assert (=> b!385984 (=> (not res!220249) (not e!234215))))

(assert (=> b!385984 (= res!220249 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6258))))

(declare-fun b!385985 () Bool)

(assert (=> b!385985 (= e!234216 (and e!234217 mapRes!15747))))

(declare-fun condMapEmpty!15747 () Bool)

(declare-fun mapDefault!15747 () ValueCell!4384)

