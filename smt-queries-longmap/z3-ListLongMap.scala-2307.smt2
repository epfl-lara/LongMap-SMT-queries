; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37290 () Bool)

(assert start!37290)

(declare-fun b_free!8431 () Bool)

(declare-fun b_next!8431 () Bool)

(assert (=> start!37290 (= b_free!8431 (not b_next!8431))))

(declare-fun tp!30009 () Bool)

(declare-fun b_and!15687 () Bool)

(assert (=> start!37290 (= tp!30009 b_and!15687)))

(declare-fun b!378092 () Bool)

(declare-fun res!214114 () Bool)

(declare-fun e!230142 () Bool)

(assert (=> b!378092 (=> (not res!214114) (not e!230142))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22072 0))(
  ( (array!22073 (arr!10504 (Array (_ BitVec 32) (_ BitVec 64))) (size!10856 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22072)

(assert (=> b!378092 (= res!214114 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10856 _keys!658))))))

(declare-fun b!378094 () Bool)

(declare-fun e!230136 () Bool)

(declare-fun tp_is_empty!9079 () Bool)

(assert (=> b!378094 (= e!230136 tp_is_empty!9079)))

(declare-fun b!378095 () Bool)

(declare-fun e!230141 () Bool)

(declare-fun mapRes!15183 () Bool)

(assert (=> b!378095 (= e!230141 (and e!230136 mapRes!15183))))

(declare-fun condMapEmpty!15183 () Bool)

(declare-datatypes ((V!13211 0))(
  ( (V!13212 (val!4584 Int)) )
))
(declare-datatypes ((ValueCell!4196 0))(
  ( (ValueCellFull!4196 (v!6782 V!13211)) (EmptyCell!4196) )
))
(declare-datatypes ((array!22074 0))(
  ( (array!22075 (arr!10505 (Array (_ BitVec 32) ValueCell!4196)) (size!10857 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22074)

(declare-fun mapDefault!15183 () ValueCell!4196)

(assert (=> b!378095 (= condMapEmpty!15183 (= (arr!10505 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4196)) mapDefault!15183)))))

(declare-fun b!378096 () Bool)

(declare-fun res!214111 () Bool)

(assert (=> b!378096 (=> (not res!214111) (not e!230142))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378096 (= res!214111 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15183 () Bool)

(declare-fun tp!30008 () Bool)

(declare-fun e!230135 () Bool)

(assert (=> mapNonEmpty!15183 (= mapRes!15183 (and tp!30008 e!230135))))

(declare-fun mapRest!15183 () (Array (_ BitVec 32) ValueCell!4196))

(declare-fun mapKey!15183 () (_ BitVec 32))

(declare-fun mapValue!15183 () ValueCell!4196)

(assert (=> mapNonEmpty!15183 (= (arr!10505 _values!506) (store mapRest!15183 mapKey!15183 mapValue!15183))))

(declare-fun b!378097 () Bool)

(assert (=> b!378097 (= e!230135 tp_is_empty!9079)))

(declare-fun b!378098 () Bool)

(declare-fun e!230138 () Bool)

(assert (=> b!378098 (= e!230142 e!230138)))

(declare-fun res!214112 () Bool)

(assert (=> b!378098 (=> (not res!214112) (not e!230138))))

(declare-fun lt!176134 () array!22072)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22072 (_ BitVec 32)) Bool)

(assert (=> b!378098 (= res!214112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176134 mask!970))))

(assert (=> b!378098 (= lt!176134 (array!22073 (store (arr!10504 _keys!658) i!548 k0!778) (size!10856 _keys!658)))))

(declare-fun b!378099 () Bool)

(declare-fun res!214108 () Bool)

(assert (=> b!378099 (=> (not res!214108) (not e!230138))))

(declare-datatypes ((List!5864 0))(
  ( (Nil!5861) (Cons!5860 (h!6716 (_ BitVec 64)) (t!11006 List!5864)) )
))
(declare-fun arrayNoDuplicates!0 (array!22072 (_ BitVec 32) List!5864) Bool)

(assert (=> b!378099 (= res!214108 (arrayNoDuplicates!0 lt!176134 #b00000000000000000000000000000000 Nil!5861))))

(declare-fun b!378100 () Bool)

(declare-fun res!214106 () Bool)

(assert (=> b!378100 (=> (not res!214106) (not e!230142))))

(assert (=> b!378100 (= res!214106 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5861))))

(declare-fun b!378093 () Bool)

(declare-fun res!214105 () Bool)

(assert (=> b!378093 (=> (not res!214105) (not e!230142))))

(assert (=> b!378093 (= res!214105 (or (= (select (arr!10504 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10504 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!214110 () Bool)

(assert (=> start!37290 (=> (not res!214110) (not e!230142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37290 (= res!214110 (validMask!0 mask!970))))

(assert (=> start!37290 e!230142))

(declare-fun array_inv!7790 (array!22074) Bool)

(assert (=> start!37290 (and (array_inv!7790 _values!506) e!230141)))

(assert (=> start!37290 tp!30009))

(assert (=> start!37290 true))

(assert (=> start!37290 tp_is_empty!9079))

(declare-fun array_inv!7791 (array!22072) Bool)

(assert (=> start!37290 (array_inv!7791 _keys!658)))

(declare-fun b!378101 () Bool)

(declare-fun e!230140 () Bool)

(declare-fun e!230139 () Bool)

(assert (=> b!378101 (= e!230140 e!230139)))

(declare-fun res!214109 () Bool)

(assert (=> b!378101 (=> res!214109 e!230139)))

(assert (=> b!378101 (= res!214109 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6024 0))(
  ( (tuple2!6025 (_1!3023 (_ BitVec 64)) (_2!3023 V!13211)) )
))
(declare-datatypes ((List!5865 0))(
  ( (Nil!5862) (Cons!5861 (h!6717 tuple2!6024) (t!11007 List!5865)) )
))
(declare-datatypes ((ListLongMap!4939 0))(
  ( (ListLongMap!4940 (toList!2485 List!5865)) )
))
(declare-fun lt!176128 () ListLongMap!4939)

(declare-fun lt!176126 () ListLongMap!4939)

(assert (=> b!378101 (= lt!176128 lt!176126)))

(declare-fun lt!176129 () ListLongMap!4939)

(declare-fun lt!176127 () tuple2!6024)

(declare-fun +!881 (ListLongMap!4939 tuple2!6024) ListLongMap!4939)

(assert (=> b!378101 (= lt!176126 (+!881 lt!176129 lt!176127))))

(declare-fun lt!176131 () ListLongMap!4939)

(declare-fun lt!176123 () ListLongMap!4939)

(assert (=> b!378101 (= lt!176131 lt!176123)))

(declare-fun lt!176125 () ListLongMap!4939)

(assert (=> b!378101 (= lt!176123 (+!881 lt!176125 lt!176127))))

(declare-fun lt!176132 () ListLongMap!4939)

(assert (=> b!378101 (= lt!176128 (+!881 lt!176132 lt!176127))))

(declare-fun zeroValue!472 () V!13211)

(assert (=> b!378101 (= lt!176127 (tuple2!6025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378102 () Bool)

(declare-fun res!214115 () Bool)

(assert (=> b!378102 (=> (not res!214115) (not e!230142))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378102 (= res!214115 (and (= (size!10857 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10856 _keys!658) (size!10857 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378103 () Bool)

(declare-fun res!214104 () Bool)

(assert (=> b!378103 (=> (not res!214104) (not e!230142))))

(assert (=> b!378103 (= res!214104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378104 () Bool)

(assert (=> b!378104 (= e!230139 (bvsle #b00000000000000000000000000000000 (size!10856 _keys!658)))))

(declare-fun lt!176133 () tuple2!6024)

(assert (=> b!378104 (= lt!176126 (+!881 lt!176123 lt!176133))))

(declare-fun v!373 () V!13211)

(declare-datatypes ((Unit!11645 0))(
  ( (Unit!11646) )
))
(declare-fun lt!176122 () Unit!11645)

(declare-fun addCommutativeForDiffKeys!297 (ListLongMap!4939 (_ BitVec 64) V!13211 (_ BitVec 64) V!13211) Unit!11645)

(assert (=> b!378104 (= lt!176122 (addCommutativeForDiffKeys!297 lt!176125 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378105 () Bool)

(assert (=> b!378105 (= e!230138 (not e!230140))))

(declare-fun res!214113 () Bool)

(assert (=> b!378105 (=> res!214113 e!230140)))

(assert (=> b!378105 (= res!214113 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13211)

(declare-fun getCurrentListMap!1929 (array!22072 array!22074 (_ BitVec 32) (_ BitVec 32) V!13211 V!13211 (_ BitVec 32) Int) ListLongMap!4939)

(assert (=> b!378105 (= lt!176131 (getCurrentListMap!1929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176124 () array!22074)

(assert (=> b!378105 (= lt!176128 (getCurrentListMap!1929 lt!176134 lt!176124 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378105 (and (= lt!176132 lt!176129) (= lt!176129 lt!176132))))

(assert (=> b!378105 (= lt!176129 (+!881 lt!176125 lt!176133))))

(assert (=> b!378105 (= lt!176133 (tuple2!6025 k0!778 v!373))))

(declare-fun lt!176130 () Unit!11645)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!116 (array!22072 array!22074 (_ BitVec 32) (_ BitVec 32) V!13211 V!13211 (_ BitVec 32) (_ BitVec 64) V!13211 (_ BitVec 32) Int) Unit!11645)

(assert (=> b!378105 (= lt!176130 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!116 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!776 (array!22072 array!22074 (_ BitVec 32) (_ BitVec 32) V!13211 V!13211 (_ BitVec 32) Int) ListLongMap!4939)

(assert (=> b!378105 (= lt!176132 (getCurrentListMapNoExtraKeys!776 lt!176134 lt!176124 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378105 (= lt!176124 (array!22075 (store (arr!10505 _values!506) i!548 (ValueCellFull!4196 v!373)) (size!10857 _values!506)))))

(assert (=> b!378105 (= lt!176125 (getCurrentListMapNoExtraKeys!776 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378106 () Bool)

(declare-fun res!214107 () Bool)

(assert (=> b!378106 (=> (not res!214107) (not e!230142))))

(declare-fun arrayContainsKey!0 (array!22072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378106 (= res!214107 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15183 () Bool)

(assert (=> mapIsEmpty!15183 mapRes!15183))

(assert (= (and start!37290 res!214110) b!378102))

(assert (= (and b!378102 res!214115) b!378103))

(assert (= (and b!378103 res!214104) b!378100))

(assert (= (and b!378100 res!214106) b!378092))

(assert (= (and b!378092 res!214114) b!378096))

(assert (= (and b!378096 res!214111) b!378093))

(assert (= (and b!378093 res!214105) b!378106))

(assert (= (and b!378106 res!214107) b!378098))

(assert (= (and b!378098 res!214112) b!378099))

(assert (= (and b!378099 res!214108) b!378105))

(assert (= (and b!378105 (not res!214113)) b!378101))

(assert (= (and b!378101 (not res!214109)) b!378104))

(assert (= (and b!378095 condMapEmpty!15183) mapIsEmpty!15183))

(assert (= (and b!378095 (not condMapEmpty!15183)) mapNonEmpty!15183))

(get-info :version)

(assert (= (and mapNonEmpty!15183 ((_ is ValueCellFull!4196) mapValue!15183)) b!378097))

(assert (= (and b!378095 ((_ is ValueCellFull!4196) mapDefault!15183)) b!378094))

(assert (= start!37290 b!378095))

(declare-fun m!375185 () Bool)

(assert (=> b!378103 m!375185))

(declare-fun m!375187 () Bool)

(assert (=> b!378106 m!375187))

(declare-fun m!375189 () Bool)

(assert (=> b!378100 m!375189))

(declare-fun m!375191 () Bool)

(assert (=> b!378096 m!375191))

(declare-fun m!375193 () Bool)

(assert (=> b!378099 m!375193))

(declare-fun m!375195 () Bool)

(assert (=> start!37290 m!375195))

(declare-fun m!375197 () Bool)

(assert (=> start!37290 m!375197))

(declare-fun m!375199 () Bool)

(assert (=> start!37290 m!375199))

(declare-fun m!375201 () Bool)

(assert (=> b!378105 m!375201))

(declare-fun m!375203 () Bool)

(assert (=> b!378105 m!375203))

(declare-fun m!375205 () Bool)

(assert (=> b!378105 m!375205))

(declare-fun m!375207 () Bool)

(assert (=> b!378105 m!375207))

(declare-fun m!375209 () Bool)

(assert (=> b!378105 m!375209))

(declare-fun m!375211 () Bool)

(assert (=> b!378105 m!375211))

(declare-fun m!375213 () Bool)

(assert (=> b!378105 m!375213))

(declare-fun m!375215 () Bool)

(assert (=> b!378104 m!375215))

(declare-fun m!375217 () Bool)

(assert (=> b!378104 m!375217))

(declare-fun m!375219 () Bool)

(assert (=> b!378098 m!375219))

(declare-fun m!375221 () Bool)

(assert (=> b!378098 m!375221))

(declare-fun m!375223 () Bool)

(assert (=> mapNonEmpty!15183 m!375223))

(declare-fun m!375225 () Bool)

(assert (=> b!378093 m!375225))

(declare-fun m!375227 () Bool)

(assert (=> b!378101 m!375227))

(declare-fun m!375229 () Bool)

(assert (=> b!378101 m!375229))

(declare-fun m!375231 () Bool)

(assert (=> b!378101 m!375231))

(check-sat tp_is_empty!9079 (not b!378101) (not b!378100) (not b!378098) (not b!378099) (not b!378106) (not b!378096) b_and!15687 (not b!378104) (not b!378103) (not start!37290) (not b_next!8431) (not b!378105) (not mapNonEmpty!15183))
(check-sat b_and!15687 (not b_next!8431))
