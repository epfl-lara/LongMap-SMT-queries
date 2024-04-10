; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36920 () Bool)

(assert start!36920)

(declare-fun b_free!8047 () Bool)

(declare-fun b_next!8047 () Bool)

(assert (=> start!36920 (= b_free!8047 (not b_next!8047))))

(declare-fun tp!28857 () Bool)

(declare-fun b_and!15289 () Bool)

(assert (=> start!36920 (= tp!28857 b_and!15289)))

(declare-fun b!369956 () Bool)

(declare-fun res!207656 () Bool)

(declare-fun e!226032 () Bool)

(assert (=> b!369956 (=> (not res!207656) (not e!226032))))

(declare-datatypes ((array!21333 0))(
  ( (array!21334 (arr!10135 (Array (_ BitVec 32) (_ BitVec 64))) (size!10487 (_ BitVec 32))) )
))
(declare-fun lt!169856 () array!21333)

(declare-datatypes ((List!5660 0))(
  ( (Nil!5657) (Cons!5656 (h!6512 (_ BitVec 64)) (t!10810 List!5660)) )
))
(declare-fun arrayNoDuplicates!0 (array!21333 (_ BitVec 32) List!5660) Bool)

(assert (=> b!369956 (= res!207656 (arrayNoDuplicates!0 lt!169856 #b00000000000000000000000000000000 Nil!5657))))

(declare-fun mapIsEmpty!14607 () Bool)

(declare-fun mapRes!14607 () Bool)

(assert (=> mapIsEmpty!14607 mapRes!14607))

(declare-fun res!207658 () Bool)

(declare-fun e!226036 () Bool)

(assert (=> start!36920 (=> (not res!207658) (not e!226036))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36920 (= res!207658 (validMask!0 mask!970))))

(assert (=> start!36920 e!226036))

(declare-datatypes ((V!12699 0))(
  ( (V!12700 (val!4392 Int)) )
))
(declare-datatypes ((ValueCell!4004 0))(
  ( (ValueCellFull!4004 (v!6589 V!12699)) (EmptyCell!4004) )
))
(declare-datatypes ((array!21335 0))(
  ( (array!21336 (arr!10136 (Array (_ BitVec 32) ValueCell!4004)) (size!10488 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21335)

(declare-fun e!226034 () Bool)

(declare-fun array_inv!7488 (array!21335) Bool)

(assert (=> start!36920 (and (array_inv!7488 _values!506) e!226034)))

(assert (=> start!36920 tp!28857))

(assert (=> start!36920 true))

(declare-fun tp_is_empty!8695 () Bool)

(assert (=> start!36920 tp_is_empty!8695))

(declare-fun _keys!658 () array!21333)

(declare-fun array_inv!7489 (array!21333) Bool)

(assert (=> start!36920 (array_inv!7489 _keys!658)))

(declare-fun b!369957 () Bool)

(declare-fun res!207654 () Bool)

(assert (=> b!369957 (=> (not res!207654) (not e!226036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21333 (_ BitVec 32)) Bool)

(assert (=> b!369957 (= res!207654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369958 () Bool)

(declare-fun res!207657 () Bool)

(assert (=> b!369958 (=> (not res!207657) (not e!226036))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369958 (= res!207657 (and (= (size!10488 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10487 _keys!658) (size!10488 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369959 () Bool)

(assert (=> b!369959 (= e!226036 e!226032)))

(declare-fun res!207651 () Bool)

(assert (=> b!369959 (=> (not res!207651) (not e!226032))))

(assert (=> b!369959 (= res!207651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169856 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369959 (= lt!169856 (array!21334 (store (arr!10135 _keys!658) i!548 k!778) (size!10487 _keys!658)))))

(declare-fun b!369960 () Bool)

(declare-fun res!207650 () Bool)

(assert (=> b!369960 (=> (not res!207650) (not e!226036))))

(assert (=> b!369960 (= res!207650 (or (= (select (arr!10135 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10135 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369961 () Bool)

(declare-fun res!207653 () Bool)

(assert (=> b!369961 (=> (not res!207653) (not e!226036))))

(assert (=> b!369961 (= res!207653 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5657))))

(declare-fun b!369962 () Bool)

(declare-fun res!207652 () Bool)

(assert (=> b!369962 (=> (not res!207652) (not e!226036))))

(assert (=> b!369962 (= res!207652 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10487 _keys!658))))))

(declare-fun b!369963 () Bool)

(declare-fun res!207659 () Bool)

(assert (=> b!369963 (=> (not res!207659) (not e!226036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369963 (= res!207659 (validKeyInArray!0 k!778))))

(declare-fun b!369964 () Bool)

(declare-fun res!207655 () Bool)

(assert (=> b!369964 (=> (not res!207655) (not e!226036))))

(declare-fun arrayContainsKey!0 (array!21333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369964 (= res!207655 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!369965 () Bool)

(assert (=> b!369965 (= e!226032 false)))

(declare-datatypes ((tuple2!5824 0))(
  ( (tuple2!5825 (_1!2923 (_ BitVec 64)) (_2!2923 V!12699)) )
))
(declare-datatypes ((List!5661 0))(
  ( (Nil!5658) (Cons!5657 (h!6513 tuple2!5824) (t!10811 List!5661)) )
))
(declare-datatypes ((ListLongMap!4737 0))(
  ( (ListLongMap!4738 (toList!2384 List!5661)) )
))
(declare-fun lt!169857 () ListLongMap!4737)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12699)

(declare-fun v!373 () V!12699)

(declare-fun minValue!472 () V!12699)

(declare-fun getCurrentListMapNoExtraKeys!661 (array!21333 array!21335 (_ BitVec 32) (_ BitVec 32) V!12699 V!12699 (_ BitVec 32) Int) ListLongMap!4737)

(assert (=> b!369965 (= lt!169857 (getCurrentListMapNoExtraKeys!661 lt!169856 (array!21336 (store (arr!10136 _values!506) i!548 (ValueCellFull!4004 v!373)) (size!10488 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169855 () ListLongMap!4737)

(assert (=> b!369965 (= lt!169855 (getCurrentListMapNoExtraKeys!661 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369966 () Bool)

(declare-fun e!226033 () Bool)

(assert (=> b!369966 (= e!226033 tp_is_empty!8695)))

(declare-fun mapNonEmpty!14607 () Bool)

(declare-fun tp!28856 () Bool)

(declare-fun e!226037 () Bool)

(assert (=> mapNonEmpty!14607 (= mapRes!14607 (and tp!28856 e!226037))))

(declare-fun mapKey!14607 () (_ BitVec 32))

(declare-fun mapValue!14607 () ValueCell!4004)

(declare-fun mapRest!14607 () (Array (_ BitVec 32) ValueCell!4004))

(assert (=> mapNonEmpty!14607 (= (arr!10136 _values!506) (store mapRest!14607 mapKey!14607 mapValue!14607))))

(declare-fun b!369967 () Bool)

(assert (=> b!369967 (= e!226034 (and e!226033 mapRes!14607))))

(declare-fun condMapEmpty!14607 () Bool)

(declare-fun mapDefault!14607 () ValueCell!4004)

