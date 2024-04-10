; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36924 () Bool)

(assert start!36924)

(declare-fun b_free!8051 () Bool)

(declare-fun b_next!8051 () Bool)

(assert (=> start!36924 (= b_free!8051 (not b_next!8051))))

(declare-fun tp!28868 () Bool)

(declare-fun b_and!15293 () Bool)

(assert (=> start!36924 (= tp!28868 b_and!15293)))

(declare-fun b!370034 () Bool)

(declare-fun res!207712 () Bool)

(declare-fun e!226073 () Bool)

(assert (=> b!370034 (=> (not res!207712) (not e!226073))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370034 (= res!207712 (validKeyInArray!0 k!778))))

(declare-fun b!370035 () Bool)

(declare-fun e!226072 () Bool)

(declare-fun tp_is_empty!8699 () Bool)

(assert (=> b!370035 (= e!226072 tp_is_empty!8699)))

(declare-fun b!370037 () Bool)

(declare-fun res!207717 () Bool)

(assert (=> b!370037 (=> (not res!207717) (not e!226073))))

(declare-datatypes ((array!21341 0))(
  ( (array!21342 (arr!10139 (Array (_ BitVec 32) (_ BitVec 64))) (size!10491 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21341)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370037 (= res!207717 (or (= (select (arr!10139 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10139 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370038 () Bool)

(declare-fun res!207710 () Bool)

(assert (=> b!370038 (=> (not res!207710) (not e!226073))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12703 0))(
  ( (V!12704 (val!4394 Int)) )
))
(declare-datatypes ((ValueCell!4006 0))(
  ( (ValueCellFull!4006 (v!6591 V!12703)) (EmptyCell!4006) )
))
(declare-datatypes ((array!21343 0))(
  ( (array!21344 (arr!10140 (Array (_ BitVec 32) ValueCell!4006)) (size!10492 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21343)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370038 (= res!207710 (and (= (size!10492 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10491 _keys!658) (size!10492 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14613 () Bool)

(declare-fun mapRes!14613 () Bool)

(assert (=> mapIsEmpty!14613 mapRes!14613))

(declare-fun b!370039 () Bool)

(declare-fun res!207716 () Bool)

(assert (=> b!370039 (=> (not res!207716) (not e!226073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21341 (_ BitVec 32)) Bool)

(assert (=> b!370039 (= res!207716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370040 () Bool)

(declare-fun res!207713 () Bool)

(assert (=> b!370040 (=> (not res!207713) (not e!226073))))

(declare-datatypes ((List!5664 0))(
  ( (Nil!5661) (Cons!5660 (h!6516 (_ BitVec 64)) (t!10814 List!5664)) )
))
(declare-fun arrayNoDuplicates!0 (array!21341 (_ BitVec 32) List!5664) Bool)

(assert (=> b!370040 (= res!207713 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5661))))

(declare-fun b!370041 () Bool)

(declare-fun res!207715 () Bool)

(assert (=> b!370041 (=> (not res!207715) (not e!226073))))

(declare-fun arrayContainsKey!0 (array!21341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370041 (= res!207715 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14613 () Bool)

(declare-fun tp!28869 () Bool)

(declare-fun e!226069 () Bool)

(assert (=> mapNonEmpty!14613 (= mapRes!14613 (and tp!28869 e!226069))))

(declare-fun mapRest!14613 () (Array (_ BitVec 32) ValueCell!4006))

(declare-fun mapValue!14613 () ValueCell!4006)

(declare-fun mapKey!14613 () (_ BitVec 32))

(assert (=> mapNonEmpty!14613 (= (arr!10140 _values!506) (store mapRest!14613 mapKey!14613 mapValue!14613))))

(declare-fun b!370042 () Bool)

(declare-fun e!226068 () Bool)

(assert (=> b!370042 (= e!226068 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!169874 () array!21341)

(declare-fun zeroValue!472 () V!12703)

(declare-fun v!373 () V!12703)

(declare-datatypes ((tuple2!5828 0))(
  ( (tuple2!5829 (_1!2925 (_ BitVec 64)) (_2!2925 V!12703)) )
))
(declare-datatypes ((List!5665 0))(
  ( (Nil!5662) (Cons!5661 (h!6517 tuple2!5828) (t!10815 List!5665)) )
))
(declare-datatypes ((ListLongMap!4741 0))(
  ( (ListLongMap!4742 (toList!2386 List!5665)) )
))
(declare-fun lt!169873 () ListLongMap!4741)

(declare-fun minValue!472 () V!12703)

(declare-fun getCurrentListMapNoExtraKeys!663 (array!21341 array!21343 (_ BitVec 32) (_ BitVec 32) V!12703 V!12703 (_ BitVec 32) Int) ListLongMap!4741)

(assert (=> b!370042 (= lt!169873 (getCurrentListMapNoExtraKeys!663 lt!169874 (array!21344 (store (arr!10140 _values!506) i!548 (ValueCellFull!4006 v!373)) (size!10492 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169875 () ListLongMap!4741)

(assert (=> b!370042 (= lt!169875 (getCurrentListMapNoExtraKeys!663 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370043 () Bool)

(assert (=> b!370043 (= e!226069 tp_is_empty!8699)))

(declare-fun res!207714 () Bool)

(assert (=> start!36924 (=> (not res!207714) (not e!226073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36924 (= res!207714 (validMask!0 mask!970))))

(assert (=> start!36924 e!226073))

(declare-fun e!226070 () Bool)

(declare-fun array_inv!7492 (array!21343) Bool)

(assert (=> start!36924 (and (array_inv!7492 _values!506) e!226070)))

(assert (=> start!36924 tp!28868))

(assert (=> start!36924 true))

(assert (=> start!36924 tp_is_empty!8699))

(declare-fun array_inv!7493 (array!21341) Bool)

(assert (=> start!36924 (array_inv!7493 _keys!658)))

(declare-fun b!370036 () Bool)

(assert (=> b!370036 (= e!226073 e!226068)))

(declare-fun res!207719 () Bool)

(assert (=> b!370036 (=> (not res!207719) (not e!226068))))

(assert (=> b!370036 (= res!207719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169874 mask!970))))

(assert (=> b!370036 (= lt!169874 (array!21342 (store (arr!10139 _keys!658) i!548 k!778) (size!10491 _keys!658)))))

(declare-fun b!370044 () Bool)

(assert (=> b!370044 (= e!226070 (and e!226072 mapRes!14613))))

(declare-fun condMapEmpty!14613 () Bool)

(declare-fun mapDefault!14613 () ValueCell!4006)

