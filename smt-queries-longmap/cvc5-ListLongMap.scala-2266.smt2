; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37058 () Bool)

(assert start!37058)

(declare-fun b_free!8185 () Bool)

(declare-fun b_next!8185 () Bool)

(assert (=> start!37058 (= b_free!8185 (not b_next!8185))))

(declare-fun tp!29270 () Bool)

(declare-fun b_and!15427 () Bool)

(assert (=> start!37058 (= tp!29270 b_and!15427)))

(declare-fun b!372647 () Bool)

(declare-fun e!227278 () Bool)

(assert (=> b!372647 (= e!227278 (not true))))

(declare-datatypes ((array!21607 0))(
  ( (array!21608 (arr!10272 (Array (_ BitVec 32) (_ BitVec 64))) (size!10624 (_ BitVec 32))) )
))
(declare-fun lt!170867 () array!21607)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12883 0))(
  ( (V!12884 (val!4461 Int)) )
))
(declare-datatypes ((ValueCell!4073 0))(
  ( (ValueCellFull!4073 (v!6658 V!12883)) (EmptyCell!4073) )
))
(declare-datatypes ((array!21609 0))(
  ( (array!21610 (arr!10273 (Array (_ BitVec 32) ValueCell!4073)) (size!10625 (_ BitVec 32))) )
))
(declare-fun lt!170862 () array!21609)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5912 0))(
  ( (tuple2!5913 (_1!2967 (_ BitVec 64)) (_2!2967 V!12883)) )
))
(declare-datatypes ((List!5758 0))(
  ( (Nil!5755) (Cons!5754 (h!6610 tuple2!5912) (t!10908 List!5758)) )
))
(declare-datatypes ((ListLongMap!4825 0))(
  ( (ListLongMap!4826 (toList!2428 List!5758)) )
))
(declare-fun lt!170863 () ListLongMap!4825)

(declare-fun zeroValue!472 () V!12883)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12883)

(declare-fun getCurrentListMap!1871 (array!21607 array!21609 (_ BitVec 32) (_ BitVec 32) V!12883 V!12883 (_ BitVec 32) Int) ListLongMap!4825)

(assert (=> b!372647 (= lt!170863 (getCurrentListMap!1871 lt!170867 lt!170862 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170866 () ListLongMap!4825)

(declare-fun lt!170868 () ListLongMap!4825)

(assert (=> b!372647 (and (= lt!170866 lt!170868) (= lt!170868 lt!170866))))

(declare-fun v!373 () V!12883)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun lt!170864 () ListLongMap!4825)

(declare-fun +!774 (ListLongMap!4825 tuple2!5912) ListLongMap!4825)

(assert (=> b!372647 (= lt!170868 (+!774 lt!170864 (tuple2!5913 k!778 v!373)))))

(declare-fun _values!506 () array!21609)

(declare-fun _keys!658 () array!21607)

(declare-datatypes ((Unit!11454 0))(
  ( (Unit!11455) )
))
(declare-fun lt!170865 () Unit!11454)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!29 (array!21607 array!21609 (_ BitVec 32) (_ BitVec 32) V!12883 V!12883 (_ BitVec 32) (_ BitVec 64) V!12883 (_ BitVec 32) Int) Unit!11454)

(assert (=> b!372647 (= lt!170865 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!29 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!705 (array!21607 array!21609 (_ BitVec 32) (_ BitVec 32) V!12883 V!12883 (_ BitVec 32) Int) ListLongMap!4825)

(assert (=> b!372647 (= lt!170866 (getCurrentListMapNoExtraKeys!705 lt!170867 lt!170862 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372647 (= lt!170862 (array!21610 (store (arr!10273 _values!506) i!548 (ValueCellFull!4073 v!373)) (size!10625 _values!506)))))

(assert (=> b!372647 (= lt!170864 (getCurrentListMapNoExtraKeys!705 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372648 () Bool)

(declare-fun res!209725 () Bool)

(declare-fun e!227274 () Bool)

(assert (=> b!372648 (=> (not res!209725) (not e!227274))))

(declare-fun arrayContainsKey!0 (array!21607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372648 (= res!209725 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!209728 () Bool)

(assert (=> start!37058 (=> (not res!209728) (not e!227274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37058 (= res!209728 (validMask!0 mask!970))))

(assert (=> start!37058 e!227274))

(declare-fun e!227275 () Bool)

(declare-fun array_inv!7572 (array!21609) Bool)

(assert (=> start!37058 (and (array_inv!7572 _values!506) e!227275)))

(assert (=> start!37058 tp!29270))

(assert (=> start!37058 true))

(declare-fun tp_is_empty!8833 () Bool)

(assert (=> start!37058 tp_is_empty!8833))

(declare-fun array_inv!7573 (array!21607) Bool)

(assert (=> start!37058 (array_inv!7573 _keys!658)))

(declare-fun b!372649 () Bool)

(assert (=> b!372649 (= e!227274 e!227278)))

(declare-fun res!209724 () Bool)

(assert (=> b!372649 (=> (not res!209724) (not e!227278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21607 (_ BitVec 32)) Bool)

(assert (=> b!372649 (= res!209724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170867 mask!970))))

(assert (=> b!372649 (= lt!170867 (array!21608 (store (arr!10272 _keys!658) i!548 k!778) (size!10624 _keys!658)))))

(declare-fun b!372650 () Bool)

(declare-fun res!209723 () Bool)

(assert (=> b!372650 (=> (not res!209723) (not e!227274))))

(declare-datatypes ((List!5759 0))(
  ( (Nil!5756) (Cons!5755 (h!6611 (_ BitVec 64)) (t!10909 List!5759)) )
))
(declare-fun arrayNoDuplicates!0 (array!21607 (_ BitVec 32) List!5759) Bool)

(assert (=> b!372650 (= res!209723 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5756))))

(declare-fun b!372651 () Bool)

(declare-fun e!227276 () Bool)

(assert (=> b!372651 (= e!227276 tp_is_empty!8833)))

(declare-fun b!372652 () Bool)

(declare-fun res!209722 () Bool)

(assert (=> b!372652 (=> (not res!209722) (not e!227274))))

(assert (=> b!372652 (= res!209722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14814 () Bool)

(declare-fun mapRes!14814 () Bool)

(assert (=> mapIsEmpty!14814 mapRes!14814))

(declare-fun b!372653 () Bool)

(declare-fun e!227279 () Bool)

(assert (=> b!372653 (= e!227279 tp_is_empty!8833)))

(declare-fun b!372654 () Bool)

(declare-fun res!209727 () Bool)

(assert (=> b!372654 (=> (not res!209727) (not e!227274))))

(assert (=> b!372654 (= res!209727 (and (= (size!10625 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10624 _keys!658) (size!10625 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372655 () Bool)

(declare-fun res!209729 () Bool)

(assert (=> b!372655 (=> (not res!209729) (not e!227274))))

(assert (=> b!372655 (= res!209729 (or (= (select (arr!10272 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10272 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372656 () Bool)

(declare-fun res!209721 () Bool)

(assert (=> b!372656 (=> (not res!209721) (not e!227274))))

(assert (=> b!372656 (= res!209721 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10624 _keys!658))))))

(declare-fun b!372657 () Bool)

(declare-fun res!209726 () Bool)

(assert (=> b!372657 (=> (not res!209726) (not e!227274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372657 (= res!209726 (validKeyInArray!0 k!778))))

(declare-fun b!372658 () Bool)

(declare-fun res!209720 () Bool)

(assert (=> b!372658 (=> (not res!209720) (not e!227278))))

(assert (=> b!372658 (= res!209720 (arrayNoDuplicates!0 lt!170867 #b00000000000000000000000000000000 Nil!5756))))

(declare-fun mapNonEmpty!14814 () Bool)

(declare-fun tp!29271 () Bool)

(assert (=> mapNonEmpty!14814 (= mapRes!14814 (and tp!29271 e!227279))))

(declare-fun mapValue!14814 () ValueCell!4073)

(declare-fun mapRest!14814 () (Array (_ BitVec 32) ValueCell!4073))

(declare-fun mapKey!14814 () (_ BitVec 32))

(assert (=> mapNonEmpty!14814 (= (arr!10273 _values!506) (store mapRest!14814 mapKey!14814 mapValue!14814))))

(declare-fun b!372659 () Bool)

(assert (=> b!372659 (= e!227275 (and e!227276 mapRes!14814))))

(declare-fun condMapEmpty!14814 () Bool)

(declare-fun mapDefault!14814 () ValueCell!4073)

