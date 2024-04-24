; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37062 () Bool)

(assert start!37062)

(declare-fun b_free!8203 () Bool)

(declare-fun b_next!8203 () Bool)

(assert (=> start!37062 (= b_free!8203 (not b_next!8203))))

(declare-fun tp!29325 () Bool)

(declare-fun b_and!15459 () Bool)

(assert (=> start!37062 (= tp!29325 b_and!15459)))

(declare-fun b!372955 () Bool)

(declare-fun e!227415 () Bool)

(assert (=> b!372955 (= e!227415 true)))

(declare-fun e!227408 () Bool)

(assert (=> b!372955 e!227408))

(declare-fun res!210003 () Bool)

(assert (=> b!372955 (=> (not res!210003) (not e!227408))))

(declare-datatypes ((V!12907 0))(
  ( (V!12908 (val!4470 Int)) )
))
(declare-datatypes ((tuple2!5832 0))(
  ( (tuple2!5833 (_1!2927 (_ BitVec 64)) (_2!2927 V!12907)) )
))
(declare-datatypes ((List!5677 0))(
  ( (Nil!5674) (Cons!5673 (h!6529 tuple2!5832) (t!10819 List!5677)) )
))
(declare-datatypes ((ListLongMap!4747 0))(
  ( (ListLongMap!4748 (toList!2389 List!5677)) )
))
(declare-fun lt!171078 () ListLongMap!4747)

(declare-fun lt!171083 () tuple2!5832)

(declare-fun lt!171081 () tuple2!5832)

(declare-fun lt!171079 () ListLongMap!4747)

(declare-fun +!785 (ListLongMap!4747 tuple2!5832) ListLongMap!4747)

(assert (=> b!372955 (= res!210003 (= lt!171079 (+!785 (+!785 lt!171078 lt!171083) lt!171081)))))

(declare-fun minValue!472 () V!12907)

(assert (=> b!372955 (= lt!171081 (tuple2!5833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun zeroValue!472 () V!12907)

(assert (=> b!372955 (= lt!171083 (tuple2!5833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!372956 () Bool)

(declare-fun res!210002 () Bool)

(declare-fun e!227411 () Bool)

(assert (=> b!372956 (=> (not res!210002) (not e!227411))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!21624 0))(
  ( (array!21625 (arr!10280 (Array (_ BitVec 32) (_ BitVec 64))) (size!10632 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21624)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4082 0))(
  ( (ValueCellFull!4082 (v!6668 V!12907)) (EmptyCell!4082) )
))
(declare-datatypes ((array!21626 0))(
  ( (array!21627 (arr!10281 (Array (_ BitVec 32) ValueCell!4082)) (size!10633 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21626)

(assert (=> b!372956 (= res!210002 (and (= (size!10633 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10632 _keys!658) (size!10633 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372957 () Bool)

(declare-fun e!227412 () Bool)

(assert (=> b!372957 (= e!227412 (not e!227415))))

(declare-fun res!209998 () Bool)

(assert (=> b!372957 (=> res!209998 e!227415)))

(assert (=> b!372957 (= res!209998 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!171077 () ListLongMap!4747)

(declare-fun getCurrentListMap!1851 (array!21624 array!21626 (_ BitVec 32) (_ BitVec 32) V!12907 V!12907 (_ BitVec 32) Int) ListLongMap!4747)

(assert (=> b!372957 (= lt!171077 (getCurrentListMap!1851 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171082 () array!21624)

(declare-fun lt!171080 () array!21626)

(assert (=> b!372957 (= lt!171079 (getCurrentListMap!1851 lt!171082 lt!171080 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171085 () ListLongMap!4747)

(assert (=> b!372957 (and (= lt!171078 lt!171085) (= lt!171085 lt!171078))))

(declare-fun v!373 () V!12907)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!171076 () ListLongMap!4747)

(assert (=> b!372957 (= lt!171085 (+!785 lt!171076 (tuple2!5833 k0!778 v!373)))))

(declare-datatypes ((Unit!11461 0))(
  ( (Unit!11462) )
))
(declare-fun lt!171084 () Unit!11461)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!38 (array!21624 array!21626 (_ BitVec 32) (_ BitVec 32) V!12907 V!12907 (_ BitVec 32) (_ BitVec 64) V!12907 (_ BitVec 32) Int) Unit!11461)

(assert (=> b!372957 (= lt!171084 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!38 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!698 (array!21624 array!21626 (_ BitVec 32) (_ BitVec 32) V!12907 V!12907 (_ BitVec 32) Int) ListLongMap!4747)

(assert (=> b!372957 (= lt!171078 (getCurrentListMapNoExtraKeys!698 lt!171082 lt!171080 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372957 (= lt!171080 (array!21627 (store (arr!10281 _values!506) i!548 (ValueCellFull!4082 v!373)) (size!10633 _values!506)))))

(assert (=> b!372957 (= lt!171076 (getCurrentListMapNoExtraKeys!698 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372958 () Bool)

(declare-fun res!209999 () Bool)

(assert (=> b!372958 (=> (not res!209999) (not e!227408))))

(assert (=> b!372958 (= res!209999 (= lt!171077 (+!785 (+!785 lt!171076 lt!171083) lt!171081)))))

(declare-fun b!372959 () Bool)

(assert (=> b!372959 (= e!227411 e!227412)))

(declare-fun res!209993 () Bool)

(assert (=> b!372959 (=> (not res!209993) (not e!227412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21624 (_ BitVec 32)) Bool)

(assert (=> b!372959 (= res!209993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171082 mask!970))))

(assert (=> b!372959 (= lt!171082 (array!21625 (store (arr!10280 _keys!658) i!548 k0!778) (size!10632 _keys!658)))))

(declare-fun res!209997 () Bool)

(assert (=> start!37062 (=> (not res!209997) (not e!227411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37062 (= res!209997 (validMask!0 mask!970))))

(assert (=> start!37062 e!227411))

(declare-fun e!227414 () Bool)

(declare-fun array_inv!7628 (array!21626) Bool)

(assert (=> start!37062 (and (array_inv!7628 _values!506) e!227414)))

(assert (=> start!37062 tp!29325))

(assert (=> start!37062 true))

(declare-fun tp_is_empty!8851 () Bool)

(assert (=> start!37062 tp_is_empty!8851))

(declare-fun array_inv!7629 (array!21624) Bool)

(assert (=> start!37062 (array_inv!7629 _keys!658)))

(declare-fun mapIsEmpty!14841 () Bool)

(declare-fun mapRes!14841 () Bool)

(assert (=> mapIsEmpty!14841 mapRes!14841))

(declare-fun b!372960 () Bool)

(declare-fun res!210000 () Bool)

(assert (=> b!372960 (=> (not res!210000) (not e!227411))))

(declare-datatypes ((List!5678 0))(
  ( (Nil!5675) (Cons!5674 (h!6530 (_ BitVec 64)) (t!10820 List!5678)) )
))
(declare-fun arrayNoDuplicates!0 (array!21624 (_ BitVec 32) List!5678) Bool)

(assert (=> b!372960 (= res!210000 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5675))))

(declare-fun b!372961 () Bool)

(declare-fun res!210004 () Bool)

(assert (=> b!372961 (=> (not res!210004) (not e!227411))))

(assert (=> b!372961 (= res!210004 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10632 _keys!658))))))

(declare-fun b!372962 () Bool)

(declare-fun res!209995 () Bool)

(assert (=> b!372962 (=> (not res!209995) (not e!227412))))

(assert (=> b!372962 (= res!209995 (arrayNoDuplicates!0 lt!171082 #b00000000000000000000000000000000 Nil!5675))))

(declare-fun b!372963 () Bool)

(declare-fun res!210005 () Bool)

(assert (=> b!372963 (=> (not res!210005) (not e!227411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372963 (= res!210005 (validKeyInArray!0 k0!778))))

(declare-fun b!372964 () Bool)

(declare-fun res!210001 () Bool)

(assert (=> b!372964 (=> (not res!210001) (not e!227411))))

(assert (=> b!372964 (= res!210001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372965 () Bool)

(assert (=> b!372965 (= e!227408 (= lt!171079 (+!785 (+!785 lt!171085 lt!171083) lt!171081)))))

(declare-fun b!372966 () Bool)

(declare-fun e!227410 () Bool)

(assert (=> b!372966 (= e!227410 tp_is_empty!8851)))

(declare-fun b!372967 () Bool)

(declare-fun e!227413 () Bool)

(assert (=> b!372967 (= e!227413 tp_is_empty!8851)))

(declare-fun mapNonEmpty!14841 () Bool)

(declare-fun tp!29324 () Bool)

(assert (=> mapNonEmpty!14841 (= mapRes!14841 (and tp!29324 e!227413))))

(declare-fun mapKey!14841 () (_ BitVec 32))

(declare-fun mapValue!14841 () ValueCell!4082)

(declare-fun mapRest!14841 () (Array (_ BitVec 32) ValueCell!4082))

(assert (=> mapNonEmpty!14841 (= (arr!10281 _values!506) (store mapRest!14841 mapKey!14841 mapValue!14841))))

(declare-fun b!372968 () Bool)

(declare-fun res!209996 () Bool)

(assert (=> b!372968 (=> (not res!209996) (not e!227411))))

(declare-fun arrayContainsKey!0 (array!21624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372968 (= res!209996 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372969 () Bool)

(assert (=> b!372969 (= e!227414 (and e!227410 mapRes!14841))))

(declare-fun condMapEmpty!14841 () Bool)

(declare-fun mapDefault!14841 () ValueCell!4082)

(assert (=> b!372969 (= condMapEmpty!14841 (= (arr!10281 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4082)) mapDefault!14841)))))

(declare-fun b!372970 () Bool)

(declare-fun res!209994 () Bool)

(assert (=> b!372970 (=> (not res!209994) (not e!227411))))

(assert (=> b!372970 (= res!209994 (or (= (select (arr!10280 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10280 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37062 res!209997) b!372956))

(assert (= (and b!372956 res!210002) b!372964))

(assert (= (and b!372964 res!210001) b!372960))

(assert (= (and b!372960 res!210000) b!372961))

(assert (= (and b!372961 res!210004) b!372963))

(assert (= (and b!372963 res!210005) b!372970))

(assert (= (and b!372970 res!209994) b!372968))

(assert (= (and b!372968 res!209996) b!372959))

(assert (= (and b!372959 res!209993) b!372962))

(assert (= (and b!372962 res!209995) b!372957))

(assert (= (and b!372957 (not res!209998)) b!372955))

(assert (= (and b!372955 res!210003) b!372958))

(assert (= (and b!372958 res!209999) b!372965))

(assert (= (and b!372969 condMapEmpty!14841) mapIsEmpty!14841))

(assert (= (and b!372969 (not condMapEmpty!14841)) mapNonEmpty!14841))

(get-info :version)

(assert (= (and mapNonEmpty!14841 ((_ is ValueCellFull!4082) mapValue!14841)) b!372967))

(assert (= (and b!372969 ((_ is ValueCellFull!4082) mapDefault!14841)) b!372966))

(assert (= start!37062 b!372969))

(declare-fun m!369053 () Bool)

(assert (=> b!372970 m!369053))

(declare-fun m!369055 () Bool)

(assert (=> b!372965 m!369055))

(assert (=> b!372965 m!369055))

(declare-fun m!369057 () Bool)

(assert (=> b!372965 m!369057))

(declare-fun m!369059 () Bool)

(assert (=> b!372962 m!369059))

(declare-fun m!369061 () Bool)

(assert (=> b!372957 m!369061))

(declare-fun m!369063 () Bool)

(assert (=> b!372957 m!369063))

(declare-fun m!369065 () Bool)

(assert (=> b!372957 m!369065))

(declare-fun m!369067 () Bool)

(assert (=> b!372957 m!369067))

(declare-fun m!369069 () Bool)

(assert (=> b!372957 m!369069))

(declare-fun m!369071 () Bool)

(assert (=> b!372957 m!369071))

(declare-fun m!369073 () Bool)

(assert (=> b!372957 m!369073))

(declare-fun m!369075 () Bool)

(assert (=> b!372964 m!369075))

(declare-fun m!369077 () Bool)

(assert (=> mapNonEmpty!14841 m!369077))

(declare-fun m!369079 () Bool)

(assert (=> b!372963 m!369079))

(declare-fun m!369081 () Bool)

(assert (=> b!372959 m!369081))

(declare-fun m!369083 () Bool)

(assert (=> b!372959 m!369083))

(declare-fun m!369085 () Bool)

(assert (=> b!372960 m!369085))

(declare-fun m!369087 () Bool)

(assert (=> start!37062 m!369087))

(declare-fun m!369089 () Bool)

(assert (=> start!37062 m!369089))

(declare-fun m!369091 () Bool)

(assert (=> start!37062 m!369091))

(declare-fun m!369093 () Bool)

(assert (=> b!372958 m!369093))

(assert (=> b!372958 m!369093))

(declare-fun m!369095 () Bool)

(assert (=> b!372958 m!369095))

(declare-fun m!369097 () Bool)

(assert (=> b!372968 m!369097))

(declare-fun m!369099 () Bool)

(assert (=> b!372955 m!369099))

(assert (=> b!372955 m!369099))

(declare-fun m!369101 () Bool)

(assert (=> b!372955 m!369101))

(check-sat (not b!372962) (not b!372955) (not start!37062) tp_is_empty!8851 (not b!372957) (not b!372968) (not mapNonEmpty!14841) (not b!372965) (not b!372958) b_and!15459 (not b!372959) (not b!372963) (not b!372960) (not b!372964) (not b_next!8203))
(check-sat b_and!15459 (not b_next!8203))
