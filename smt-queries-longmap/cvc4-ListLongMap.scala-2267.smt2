; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37068 () Bool)

(assert start!37068)

(declare-fun b_free!8195 () Bool)

(declare-fun b_next!8195 () Bool)

(assert (=> start!37068 (= b_free!8195 (not b_next!8195))))

(declare-fun tp!29301 () Bool)

(declare-fun b_and!15437 () Bool)

(assert (=> start!37068 (= tp!29301 b_and!15437)))

(declare-fun b!372842 () Bool)

(declare-fun res!209874 () Bool)

(declare-fun e!227367 () Bool)

(assert (=> b!372842 (=> (not res!209874) (not e!227367))))

(declare-datatypes ((array!21627 0))(
  ( (array!21628 (arr!10282 (Array (_ BitVec 32) (_ BitVec 64))) (size!10634 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21627)

(declare-datatypes ((List!5766 0))(
  ( (Nil!5763) (Cons!5762 (h!6618 (_ BitVec 64)) (t!10916 List!5766)) )
))
(declare-fun arrayNoDuplicates!0 (array!21627 (_ BitVec 32) List!5766) Bool)

(assert (=> b!372842 (= res!209874 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5763))))

(declare-fun res!209875 () Bool)

(assert (=> start!37068 (=> (not res!209875) (not e!227367))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37068 (= res!209875 (validMask!0 mask!970))))

(assert (=> start!37068 e!227367))

(declare-datatypes ((V!12895 0))(
  ( (V!12896 (val!4466 Int)) )
))
(declare-datatypes ((ValueCell!4078 0))(
  ( (ValueCellFull!4078 (v!6663 V!12895)) (EmptyCell!4078) )
))
(declare-datatypes ((array!21629 0))(
  ( (array!21630 (arr!10283 (Array (_ BitVec 32) ValueCell!4078)) (size!10635 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21629)

(declare-fun e!227368 () Bool)

(declare-fun array_inv!7580 (array!21629) Bool)

(assert (=> start!37068 (and (array_inv!7580 _values!506) e!227368)))

(assert (=> start!37068 tp!29301))

(assert (=> start!37068 true))

(declare-fun tp_is_empty!8843 () Bool)

(assert (=> start!37068 tp_is_empty!8843))

(declare-fun array_inv!7581 (array!21627) Bool)

(assert (=> start!37068 (array_inv!7581 _keys!658)))

(declare-fun b!372843 () Bool)

(declare-fun res!209878 () Bool)

(assert (=> b!372843 (=> (not res!209878) (not e!227367))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372843 (= res!209878 (and (= (size!10635 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10634 _keys!658) (size!10635 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372844 () Bool)

(declare-fun e!227364 () Bool)

(assert (=> b!372844 (= e!227364 (not true))))

(declare-fun lt!170969 () array!21627)

(declare-fun zeroValue!472 () V!12895)

(declare-datatypes ((tuple2!5920 0))(
  ( (tuple2!5921 (_1!2971 (_ BitVec 64)) (_2!2971 V!12895)) )
))
(declare-datatypes ((List!5767 0))(
  ( (Nil!5764) (Cons!5763 (h!6619 tuple2!5920) (t!10917 List!5767)) )
))
(declare-datatypes ((ListLongMap!4833 0))(
  ( (ListLongMap!4834 (toList!2432 List!5767)) )
))
(declare-fun lt!170968 () ListLongMap!4833)

(declare-fun lt!170967 () array!21629)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!12895)

(declare-fun getCurrentListMap!1875 (array!21627 array!21629 (_ BitVec 32) (_ BitVec 32) V!12895 V!12895 (_ BitVec 32) Int) ListLongMap!4833)

(assert (=> b!372844 (= lt!170968 (getCurrentListMap!1875 lt!170969 lt!170967 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170972 () ListLongMap!4833)

(declare-fun lt!170971 () ListLongMap!4833)

(assert (=> b!372844 (and (= lt!170972 lt!170971) (= lt!170971 lt!170972))))

(declare-fun v!373 () V!12895)

(declare-fun lt!170970 () ListLongMap!4833)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!778 (ListLongMap!4833 tuple2!5920) ListLongMap!4833)

(assert (=> b!372844 (= lt!170971 (+!778 lt!170970 (tuple2!5921 k!778 v!373)))))

(declare-datatypes ((Unit!11462 0))(
  ( (Unit!11463) )
))
(declare-fun lt!170973 () Unit!11462)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!33 (array!21627 array!21629 (_ BitVec 32) (_ BitVec 32) V!12895 V!12895 (_ BitVec 32) (_ BitVec 64) V!12895 (_ BitVec 32) Int) Unit!11462)

(assert (=> b!372844 (= lt!170973 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!33 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!709 (array!21627 array!21629 (_ BitVec 32) (_ BitVec 32) V!12895 V!12895 (_ BitVec 32) Int) ListLongMap!4833)

(assert (=> b!372844 (= lt!170972 (getCurrentListMapNoExtraKeys!709 lt!170969 lt!170967 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372844 (= lt!170967 (array!21630 (store (arr!10283 _values!506) i!548 (ValueCellFull!4078 v!373)) (size!10635 _values!506)))))

(assert (=> b!372844 (= lt!170970 (getCurrentListMapNoExtraKeys!709 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372845 () Bool)

(declare-fun e!227369 () Bool)

(assert (=> b!372845 (= e!227369 tp_is_empty!8843)))

(declare-fun b!372846 () Bool)

(declare-fun res!209877 () Bool)

(assert (=> b!372846 (=> (not res!209877) (not e!227367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372846 (= res!209877 (validKeyInArray!0 k!778))))

(declare-fun b!372847 () Bool)

(assert (=> b!372847 (= e!227367 e!227364)))

(declare-fun res!209873 () Bool)

(assert (=> b!372847 (=> (not res!209873) (not e!227364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21627 (_ BitVec 32)) Bool)

(assert (=> b!372847 (= res!209873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170969 mask!970))))

(assert (=> b!372847 (= lt!170969 (array!21628 (store (arr!10282 _keys!658) i!548 k!778) (size!10634 _keys!658)))))

(declare-fun b!372848 () Bool)

(declare-fun mapRes!14829 () Bool)

(assert (=> b!372848 (= e!227368 (and e!227369 mapRes!14829))))

(declare-fun condMapEmpty!14829 () Bool)

(declare-fun mapDefault!14829 () ValueCell!4078)

