; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36930 () Bool)

(assert start!36930)

(declare-fun b_free!8057 () Bool)

(declare-fun b_next!8057 () Bool)

(assert (=> start!36930 (= b_free!8057 (not b_next!8057))))

(declare-fun tp!28887 () Bool)

(declare-fun b_and!15299 () Bool)

(assert (=> start!36930 (= tp!28887 b_and!15299)))

(declare-fun b!370151 () Bool)

(declare-fun e!226123 () Bool)

(declare-fun tp_is_empty!8705 () Bool)

(assert (=> b!370151 (= e!226123 tp_is_empty!8705)))

(declare-fun b!370152 () Bool)

(declare-fun res!207802 () Bool)

(declare-fun e!226126 () Bool)

(assert (=> b!370152 (=> (not res!207802) (not e!226126))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21353 0))(
  ( (array!21354 (arr!10145 (Array (_ BitVec 32) (_ BitVec 64))) (size!10497 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21353)

(assert (=> b!370152 (= res!207802 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10497 _keys!658))))))

(declare-fun mapIsEmpty!14622 () Bool)

(declare-fun mapRes!14622 () Bool)

(assert (=> mapIsEmpty!14622 mapRes!14622))

(declare-fun b!370153 () Bool)

(declare-fun e!226125 () Bool)

(assert (=> b!370153 (= e!226126 e!226125)))

(declare-fun res!207801 () Bool)

(assert (=> b!370153 (=> (not res!207801) (not e!226125))))

(declare-fun lt!169902 () array!21353)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21353 (_ BitVec 32)) Bool)

(assert (=> b!370153 (= res!207801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169902 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!370153 (= lt!169902 (array!21354 (store (arr!10145 _keys!658) i!548 k!778) (size!10497 _keys!658)))))

(declare-fun mapNonEmpty!14622 () Bool)

(declare-fun tp!28886 () Bool)

(declare-fun e!226122 () Bool)

(assert (=> mapNonEmpty!14622 (= mapRes!14622 (and tp!28886 e!226122))))

(declare-datatypes ((V!12711 0))(
  ( (V!12712 (val!4397 Int)) )
))
(declare-datatypes ((ValueCell!4009 0))(
  ( (ValueCellFull!4009 (v!6594 V!12711)) (EmptyCell!4009) )
))
(declare-datatypes ((array!21355 0))(
  ( (array!21356 (arr!10146 (Array (_ BitVec 32) ValueCell!4009)) (size!10498 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21355)

(declare-fun mapRest!14622 () (Array (_ BitVec 32) ValueCell!4009))

(declare-fun mapValue!14622 () ValueCell!4009)

(declare-fun mapKey!14622 () (_ BitVec 32))

(assert (=> mapNonEmpty!14622 (= (arr!10146 _values!506) (store mapRest!14622 mapKey!14622 mapValue!14622))))

(declare-fun b!370155 () Bool)

(declare-fun res!207804 () Bool)

(assert (=> b!370155 (=> (not res!207804) (not e!226125))))

(declare-datatypes ((List!5669 0))(
  ( (Nil!5666) (Cons!5665 (h!6521 (_ BitVec 64)) (t!10819 List!5669)) )
))
(declare-fun arrayNoDuplicates!0 (array!21353 (_ BitVec 32) List!5669) Bool)

(assert (=> b!370155 (= res!207804 (arrayNoDuplicates!0 lt!169902 #b00000000000000000000000000000000 Nil!5666))))

(declare-fun b!370156 () Bool)

(assert (=> b!370156 (= e!226122 tp_is_empty!8705)))

(declare-fun b!370157 () Bool)

(declare-fun res!207800 () Bool)

(assert (=> b!370157 (=> (not res!207800) (not e!226126))))

(declare-fun arrayContainsKey!0 (array!21353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370157 (= res!207800 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!370158 () Bool)

(assert (=> b!370158 (= e!226125 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12711)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5832 0))(
  ( (tuple2!5833 (_1!2927 (_ BitVec 64)) (_2!2927 V!12711)) )
))
(declare-datatypes ((List!5670 0))(
  ( (Nil!5667) (Cons!5666 (h!6522 tuple2!5832) (t!10820 List!5670)) )
))
(declare-datatypes ((ListLongMap!4745 0))(
  ( (ListLongMap!4746 (toList!2388 List!5670)) )
))
(declare-fun lt!169901 () ListLongMap!4745)

(declare-fun zeroValue!472 () V!12711)

(declare-fun minValue!472 () V!12711)

(declare-fun getCurrentListMapNoExtraKeys!665 (array!21353 array!21355 (_ BitVec 32) (_ BitVec 32) V!12711 V!12711 (_ BitVec 32) Int) ListLongMap!4745)

(assert (=> b!370158 (= lt!169901 (getCurrentListMapNoExtraKeys!665 lt!169902 (array!21356 (store (arr!10146 _values!506) i!548 (ValueCellFull!4009 v!373)) (size!10498 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169900 () ListLongMap!4745)

(assert (=> b!370158 (= lt!169900 (getCurrentListMapNoExtraKeys!665 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370159 () Bool)

(declare-fun res!207805 () Bool)

(assert (=> b!370159 (=> (not res!207805) (not e!226126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370159 (= res!207805 (validKeyInArray!0 k!778))))

(declare-fun b!370160 () Bool)

(declare-fun res!207807 () Bool)

(assert (=> b!370160 (=> (not res!207807) (not e!226126))))

(assert (=> b!370160 (= res!207807 (and (= (size!10498 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10497 _keys!658) (size!10498 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370161 () Bool)

(declare-fun e!226127 () Bool)

(assert (=> b!370161 (= e!226127 (and e!226123 mapRes!14622))))

(declare-fun condMapEmpty!14622 () Bool)

(declare-fun mapDefault!14622 () ValueCell!4009)

