; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37032 () Bool)

(assert start!37032)

(declare-fun b_free!8159 () Bool)

(declare-fun b_next!8159 () Bool)

(assert (=> start!37032 (= b_free!8159 (not b_next!8159))))

(declare-fun tp!29193 () Bool)

(declare-fun b_and!15401 () Bool)

(assert (=> start!37032 (= tp!29193 b_and!15401)))

(declare-fun b!372140 () Bool)

(declare-fun res!209333 () Bool)

(declare-fun e!227044 () Bool)

(assert (=> b!372140 (=> (not res!209333) (not e!227044))))

(declare-datatypes ((array!21555 0))(
  ( (array!21556 (arr!10246 (Array (_ BitVec 32) (_ BitVec 64))) (size!10598 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21555)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372140 (= res!209333 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!372141 () Bool)

(declare-fun e!227041 () Bool)

(assert (=> b!372141 (= e!227041 (not true))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12847 0))(
  ( (V!12848 (val!4448 Int)) )
))
(declare-datatypes ((ValueCell!4060 0))(
  ( (ValueCellFull!4060 (v!6645 V!12847)) (EmptyCell!4060) )
))
(declare-datatypes ((array!21557 0))(
  ( (array!21558 (arr!10247 (Array (_ BitVec 32) ValueCell!4060)) (size!10599 (_ BitVec 32))) )
))
(declare-fun lt!170592 () array!21557)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5902 0))(
  ( (tuple2!5903 (_1!2962 (_ BitVec 64)) (_2!2962 V!12847)) )
))
(declare-datatypes ((List!5745 0))(
  ( (Nil!5742) (Cons!5741 (h!6597 tuple2!5902) (t!10895 List!5745)) )
))
(declare-datatypes ((ListLongMap!4815 0))(
  ( (ListLongMap!4816 (toList!2423 List!5745)) )
))
(declare-fun lt!170591 () ListLongMap!4815)

(declare-fun zeroValue!472 () V!12847)

(declare-fun lt!170589 () array!21555)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12847)

(declare-fun getCurrentListMap!1866 (array!21555 array!21557 (_ BitVec 32) (_ BitVec 32) V!12847 V!12847 (_ BitVec 32) Int) ListLongMap!4815)

(assert (=> b!372141 (= lt!170591 (getCurrentListMap!1866 lt!170589 lt!170592 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170595 () ListLongMap!4815)

(declare-fun lt!170590 () ListLongMap!4815)

(assert (=> b!372141 (and (= lt!170595 lt!170590) (= lt!170590 lt!170595))))

(declare-fun v!373 () V!12847)

(declare-fun lt!170593 () ListLongMap!4815)

(declare-fun +!769 (ListLongMap!4815 tuple2!5902) ListLongMap!4815)

(assert (=> b!372141 (= lt!170590 (+!769 lt!170593 (tuple2!5903 k!778 v!373)))))

(declare-fun _values!506 () array!21557)

(declare-datatypes ((Unit!11444 0))(
  ( (Unit!11445) )
))
(declare-fun lt!170594 () Unit!11444)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!24 (array!21555 array!21557 (_ BitVec 32) (_ BitVec 32) V!12847 V!12847 (_ BitVec 32) (_ BitVec 64) V!12847 (_ BitVec 32) Int) Unit!11444)

(assert (=> b!372141 (= lt!170594 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!24 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!700 (array!21555 array!21557 (_ BitVec 32) (_ BitVec 32) V!12847 V!12847 (_ BitVec 32) Int) ListLongMap!4815)

(assert (=> b!372141 (= lt!170595 (getCurrentListMapNoExtraKeys!700 lt!170589 lt!170592 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372141 (= lt!170592 (array!21558 (store (arr!10247 _values!506) i!548 (ValueCellFull!4060 v!373)) (size!10599 _values!506)))))

(assert (=> b!372141 (= lt!170593 (getCurrentListMapNoExtraKeys!700 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372143 () Bool)

(declare-fun res!209330 () Bool)

(assert (=> b!372143 (=> (not res!209330) (not e!227044))))

(assert (=> b!372143 (= res!209330 (and (= (size!10599 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10598 _keys!658) (size!10599 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372144 () Bool)

(declare-fun res!209337 () Bool)

(assert (=> b!372144 (=> (not res!209337) (not e!227044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372144 (= res!209337 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!14775 () Bool)

(declare-fun mapRes!14775 () Bool)

(declare-fun tp!29192 () Bool)

(declare-fun e!227045 () Bool)

(assert (=> mapNonEmpty!14775 (= mapRes!14775 (and tp!29192 e!227045))))

(declare-fun mapValue!14775 () ValueCell!4060)

(declare-fun mapRest!14775 () (Array (_ BitVec 32) ValueCell!4060))

(declare-fun mapKey!14775 () (_ BitVec 32))

(assert (=> mapNonEmpty!14775 (= (arr!10247 _values!506) (store mapRest!14775 mapKey!14775 mapValue!14775))))

(declare-fun b!372145 () Bool)

(declare-fun res!209334 () Bool)

(assert (=> b!372145 (=> (not res!209334) (not e!227041))))

(declare-datatypes ((List!5746 0))(
  ( (Nil!5743) (Cons!5742 (h!6598 (_ BitVec 64)) (t!10896 List!5746)) )
))
(declare-fun arrayNoDuplicates!0 (array!21555 (_ BitVec 32) List!5746) Bool)

(assert (=> b!372145 (= res!209334 (arrayNoDuplicates!0 lt!170589 #b00000000000000000000000000000000 Nil!5743))))

(declare-fun b!372146 () Bool)

(declare-fun tp_is_empty!8807 () Bool)

(assert (=> b!372146 (= e!227045 tp_is_empty!8807)))

(declare-fun mapIsEmpty!14775 () Bool)

(assert (=> mapIsEmpty!14775 mapRes!14775))

(declare-fun b!372147 () Bool)

(assert (=> b!372147 (= e!227044 e!227041)))

(declare-fun res!209339 () Bool)

(assert (=> b!372147 (=> (not res!209339) (not e!227041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21555 (_ BitVec 32)) Bool)

(assert (=> b!372147 (= res!209339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170589 mask!970))))

(assert (=> b!372147 (= lt!170589 (array!21556 (store (arr!10246 _keys!658) i!548 k!778) (size!10598 _keys!658)))))

(declare-fun b!372148 () Bool)

(declare-fun res!209331 () Bool)

(assert (=> b!372148 (=> (not res!209331) (not e!227044))))

(assert (=> b!372148 (= res!209331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372149 () Bool)

(declare-fun e!227043 () Bool)

(assert (=> b!372149 (= e!227043 tp_is_empty!8807)))

(declare-fun b!372150 () Bool)

(declare-fun res!209332 () Bool)

(assert (=> b!372150 (=> (not res!209332) (not e!227044))))

(assert (=> b!372150 (= res!209332 (or (= (select (arr!10246 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10246 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!209338 () Bool)

(assert (=> start!37032 (=> (not res!209338) (not e!227044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37032 (= res!209338 (validMask!0 mask!970))))

(assert (=> start!37032 e!227044))

(declare-fun e!227040 () Bool)

(declare-fun array_inv!7560 (array!21557) Bool)

(assert (=> start!37032 (and (array_inv!7560 _values!506) e!227040)))

(assert (=> start!37032 tp!29193))

(assert (=> start!37032 true))

(assert (=> start!37032 tp_is_empty!8807))

(declare-fun array_inv!7561 (array!21555) Bool)

(assert (=> start!37032 (array_inv!7561 _keys!658)))

(declare-fun b!372142 () Bool)

(assert (=> b!372142 (= e!227040 (and e!227043 mapRes!14775))))

(declare-fun condMapEmpty!14775 () Bool)

(declare-fun mapDefault!14775 () ValueCell!4060)

