; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37614 () Bool)

(assert start!37614)

(declare-fun b_free!8755 () Bool)

(declare-fun b_next!8755 () Bool)

(assert (=> start!37614 (= b_free!8755 (not b_next!8755))))

(declare-fun tp!30980 () Bool)

(declare-fun b_and!16011 () Bool)

(assert (=> start!37614 (= tp!30980 b_and!16011)))

(declare-fun mapIsEmpty!15669 () Bool)

(declare-fun mapRes!15669 () Bool)

(assert (=> mapIsEmpty!15669 mapRes!15669))

(declare-fun b!385092 () Bool)

(declare-fun res!219647 () Bool)

(declare-fun e!233730 () Bool)

(assert (=> b!385092 (=> (not res!219647) (not e!233730))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385092 (= res!219647 (validKeyInArray!0 k0!778))))

(declare-fun b!385093 () Bool)

(declare-fun res!219648 () Bool)

(assert (=> b!385093 (=> (not res!219648) (not e!233730))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22698 0))(
  ( (array!22699 (arr!10817 (Array (_ BitVec 32) (_ BitVec 64))) (size!11169 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22698)

(assert (=> b!385093 (= res!219648 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11169 _keys!658))))))

(declare-fun b!385094 () Bool)

(declare-fun e!233728 () Bool)

(declare-fun e!233727 () Bool)

(assert (=> b!385094 (= e!233728 (not e!233727))))

(declare-fun res!219654 () Bool)

(assert (=> b!385094 (=> res!219654 e!233727)))

(declare-fun lt!181463 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385094 (= res!219654 (or (and (not lt!181463) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181463) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181463)))))

(assert (=> b!385094 (= lt!181463 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13643 0))(
  ( (V!13644 (val!4746 Int)) )
))
(declare-datatypes ((ValueCell!4358 0))(
  ( (ValueCellFull!4358 (v!6944 V!13643)) (EmptyCell!4358) )
))
(declare-datatypes ((array!22700 0))(
  ( (array!22701 (arr!10818 (Array (_ BitVec 32) ValueCell!4358)) (size!11170 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22700)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6264 0))(
  ( (tuple2!6265 (_1!3143 (_ BitVec 64)) (_2!3143 V!13643)) )
))
(declare-datatypes ((List!6101 0))(
  ( (Nil!6098) (Cons!6097 (h!6953 tuple2!6264) (t!11243 List!6101)) )
))
(declare-datatypes ((ListLongMap!5179 0))(
  ( (ListLongMap!5180 (toList!2605 List!6101)) )
))
(declare-fun lt!181456 () ListLongMap!5179)

(declare-fun zeroValue!472 () V!13643)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13643)

(declare-fun getCurrentListMap!2035 (array!22698 array!22700 (_ BitVec 32) (_ BitVec 32) V!13643 V!13643 (_ BitVec 32) Int) ListLongMap!5179)

(assert (=> b!385094 (= lt!181456 (getCurrentListMap!2035 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181458 () array!22700)

(declare-fun lt!181460 () ListLongMap!5179)

(declare-fun lt!181455 () array!22698)

(assert (=> b!385094 (= lt!181460 (getCurrentListMap!2035 lt!181455 lt!181458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181465 () ListLongMap!5179)

(declare-fun lt!181462 () ListLongMap!5179)

(assert (=> b!385094 (and (= lt!181465 lt!181462) (= lt!181462 lt!181465))))

(declare-fun lt!181459 () ListLongMap!5179)

(declare-fun lt!181464 () tuple2!6264)

(declare-fun +!997 (ListLongMap!5179 tuple2!6264) ListLongMap!5179)

(assert (=> b!385094 (= lt!181462 (+!997 lt!181459 lt!181464))))

(declare-fun v!373 () V!13643)

(assert (=> b!385094 (= lt!181464 (tuple2!6265 k0!778 v!373))))

(declare-datatypes ((Unit!11865 0))(
  ( (Unit!11866) )
))
(declare-fun lt!181457 () Unit!11865)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!222 (array!22698 array!22700 (_ BitVec 32) (_ BitVec 32) V!13643 V!13643 (_ BitVec 32) (_ BitVec 64) V!13643 (_ BitVec 32) Int) Unit!11865)

(assert (=> b!385094 (= lt!181457 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!222 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!882 (array!22698 array!22700 (_ BitVec 32) (_ BitVec 32) V!13643 V!13643 (_ BitVec 32) Int) ListLongMap!5179)

(assert (=> b!385094 (= lt!181465 (getCurrentListMapNoExtraKeys!882 lt!181455 lt!181458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!385094 (= lt!181458 (array!22701 (store (arr!10818 _values!506) i!548 (ValueCellFull!4358 v!373)) (size!11170 _values!506)))))

(assert (=> b!385094 (= lt!181459 (getCurrentListMapNoExtraKeys!882 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385095 () Bool)

(declare-fun res!219653 () Bool)

(assert (=> b!385095 (=> (not res!219653) (not e!233730))))

(declare-datatypes ((List!6102 0))(
  ( (Nil!6099) (Cons!6098 (h!6954 (_ BitVec 64)) (t!11244 List!6102)) )
))
(declare-fun arrayNoDuplicates!0 (array!22698 (_ BitVec 32) List!6102) Bool)

(assert (=> b!385095 (= res!219653 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6099))))

(declare-fun b!385096 () Bool)

(declare-fun res!219655 () Bool)

(assert (=> b!385096 (=> (not res!219655) (not e!233730))))

(declare-fun arrayContainsKey!0 (array!22698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385096 (= res!219655 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385097 () Bool)

(assert (=> b!385097 (= e!233727 true)))

(declare-fun lt!181461 () ListLongMap!5179)

(assert (=> b!385097 (= lt!181461 (+!997 lt!181456 lt!181464))))

(assert (=> b!385097 (= lt!181460 lt!181465)))

(declare-fun b!385098 () Bool)

(declare-fun res!219656 () Bool)

(assert (=> b!385098 (=> (not res!219656) (not e!233730))))

(assert (=> b!385098 (= res!219656 (or (= (select (arr!10817 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10817 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15669 () Bool)

(declare-fun tp!30981 () Bool)

(declare-fun e!233724 () Bool)

(assert (=> mapNonEmpty!15669 (= mapRes!15669 (and tp!30981 e!233724))))

(declare-fun mapKey!15669 () (_ BitVec 32))

(declare-fun mapValue!15669 () ValueCell!4358)

(declare-fun mapRest!15669 () (Array (_ BitVec 32) ValueCell!4358))

(assert (=> mapNonEmpty!15669 (= (arr!10818 _values!506) (store mapRest!15669 mapKey!15669 mapValue!15669))))

(declare-fun b!385099 () Bool)

(declare-fun res!219646 () Bool)

(assert (=> b!385099 (=> (not res!219646) (not e!233730))))

(assert (=> b!385099 (= res!219646 (and (= (size!11170 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11169 _keys!658) (size!11170 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385100 () Bool)

(declare-fun e!233726 () Bool)

(declare-fun e!233725 () Bool)

(assert (=> b!385100 (= e!233726 (and e!233725 mapRes!15669))))

(declare-fun condMapEmpty!15669 () Bool)

(declare-fun mapDefault!15669 () ValueCell!4358)

(assert (=> b!385100 (= condMapEmpty!15669 (= (arr!10818 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4358)) mapDefault!15669)))))

(declare-fun b!385101 () Bool)

(declare-fun res!219651 () Bool)

(assert (=> b!385101 (=> (not res!219651) (not e!233730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22698 (_ BitVec 32)) Bool)

(assert (=> b!385101 (= res!219651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385102 () Bool)

(declare-fun tp_is_empty!9403 () Bool)

(assert (=> b!385102 (= e!233724 tp_is_empty!9403)))

(declare-fun b!385103 () Bool)

(declare-fun res!219652 () Bool)

(assert (=> b!385103 (=> (not res!219652) (not e!233728))))

(assert (=> b!385103 (= res!219652 (arrayNoDuplicates!0 lt!181455 #b00000000000000000000000000000000 Nil!6099))))

(declare-fun b!385104 () Bool)

(assert (=> b!385104 (= e!233725 tp_is_empty!9403)))

(declare-fun b!385105 () Bool)

(assert (=> b!385105 (= e!233730 e!233728)))

(declare-fun res!219650 () Bool)

(assert (=> b!385105 (=> (not res!219650) (not e!233728))))

(assert (=> b!385105 (= res!219650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181455 mask!970))))

(assert (=> b!385105 (= lt!181455 (array!22699 (store (arr!10817 _keys!658) i!548 k0!778) (size!11169 _keys!658)))))

(declare-fun res!219649 () Bool)

(assert (=> start!37614 (=> (not res!219649) (not e!233730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37614 (= res!219649 (validMask!0 mask!970))))

(assert (=> start!37614 e!233730))

(declare-fun array_inv!8000 (array!22700) Bool)

(assert (=> start!37614 (and (array_inv!8000 _values!506) e!233726)))

(assert (=> start!37614 tp!30980))

(assert (=> start!37614 true))

(assert (=> start!37614 tp_is_empty!9403))

(declare-fun array_inv!8001 (array!22698) Bool)

(assert (=> start!37614 (array_inv!8001 _keys!658)))

(assert (= (and start!37614 res!219649) b!385099))

(assert (= (and b!385099 res!219646) b!385101))

(assert (= (and b!385101 res!219651) b!385095))

(assert (= (and b!385095 res!219653) b!385093))

(assert (= (and b!385093 res!219648) b!385092))

(assert (= (and b!385092 res!219647) b!385098))

(assert (= (and b!385098 res!219656) b!385096))

(assert (= (and b!385096 res!219655) b!385105))

(assert (= (and b!385105 res!219650) b!385103))

(assert (= (and b!385103 res!219652) b!385094))

(assert (= (and b!385094 (not res!219654)) b!385097))

(assert (= (and b!385100 condMapEmpty!15669) mapIsEmpty!15669))

(assert (= (and b!385100 (not condMapEmpty!15669)) mapNonEmpty!15669))

(get-info :version)

(assert (= (and mapNonEmpty!15669 ((_ is ValueCellFull!4358) mapValue!15669)) b!385102))

(assert (= (and b!385100 ((_ is ValueCellFull!4358) mapDefault!15669)) b!385104))

(assert (= start!37614 b!385100))

(declare-fun m!382025 () Bool)

(assert (=> b!385101 m!382025))

(declare-fun m!382027 () Bool)

(assert (=> b!385097 m!382027))

(declare-fun m!382029 () Bool)

(assert (=> mapNonEmpty!15669 m!382029))

(declare-fun m!382031 () Bool)

(assert (=> b!385105 m!382031))

(declare-fun m!382033 () Bool)

(assert (=> b!385105 m!382033))

(declare-fun m!382035 () Bool)

(assert (=> b!385096 m!382035))

(declare-fun m!382037 () Bool)

(assert (=> start!37614 m!382037))

(declare-fun m!382039 () Bool)

(assert (=> start!37614 m!382039))

(declare-fun m!382041 () Bool)

(assert (=> start!37614 m!382041))

(declare-fun m!382043 () Bool)

(assert (=> b!385103 m!382043))

(declare-fun m!382045 () Bool)

(assert (=> b!385098 m!382045))

(declare-fun m!382047 () Bool)

(assert (=> b!385094 m!382047))

(declare-fun m!382049 () Bool)

(assert (=> b!385094 m!382049))

(declare-fun m!382051 () Bool)

(assert (=> b!385094 m!382051))

(declare-fun m!382053 () Bool)

(assert (=> b!385094 m!382053))

(declare-fun m!382055 () Bool)

(assert (=> b!385094 m!382055))

(declare-fun m!382057 () Bool)

(assert (=> b!385094 m!382057))

(declare-fun m!382059 () Bool)

(assert (=> b!385094 m!382059))

(declare-fun m!382061 () Bool)

(assert (=> b!385092 m!382061))

(declare-fun m!382063 () Bool)

(assert (=> b!385095 m!382063))

(check-sat (not b!385101) (not b!385105) (not mapNonEmpty!15669) (not b!385095) (not start!37614) (not b!385097) (not b!385096) b_and!16011 (not b!385092) (not b!385094) (not b_next!8755) (not b!385103) tp_is_empty!9403)
(check-sat b_and!16011 (not b_next!8755))
