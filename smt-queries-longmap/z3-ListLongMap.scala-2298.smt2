; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37252 () Bool)

(assert start!37252)

(declare-fun b_free!8379 () Bool)

(declare-fun b_next!8379 () Bool)

(assert (=> start!37252 (= b_free!8379 (not b_next!8379))))

(declare-fun tp!29852 () Bool)

(declare-fun b_and!15621 () Bool)

(assert (=> start!37252 (= tp!29852 b_and!15621)))

(declare-fun b!376971 () Bool)

(declare-fun res!213180 () Bool)

(declare-fun e!229543 () Bool)

(assert (=> b!376971 (=> (not res!213180) (not e!229543))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376971 (= res!213180 (validKeyInArray!0 k0!778))))

(declare-fun b!376973 () Bool)

(declare-fun e!229545 () Bool)

(declare-fun e!229548 () Bool)

(assert (=> b!376973 (= e!229545 (not e!229548))))

(declare-fun res!213172 () Bool)

(assert (=> b!376973 (=> res!213172 e!229548)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376973 (= res!213172 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13141 0))(
  ( (V!13142 (val!4558 Int)) )
))
(declare-datatypes ((ValueCell!4170 0))(
  ( (ValueCellFull!4170 (v!6755 V!13141)) (EmptyCell!4170) )
))
(declare-datatypes ((array!21983 0))(
  ( (array!21984 (arr!10460 (Array (_ BitVec 32) ValueCell!4170)) (size!10812 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21983)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!21985 0))(
  ( (array!21986 (arr!10461 (Array (_ BitVec 32) (_ BitVec 64))) (size!10813 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21985)

(declare-fun zeroValue!472 () V!13141)

(declare-datatypes ((tuple2!6072 0))(
  ( (tuple2!6073 (_1!3047 (_ BitVec 64)) (_2!3047 V!13141)) )
))
(declare-datatypes ((List!5914 0))(
  ( (Nil!5911) (Cons!5910 (h!6766 tuple2!6072) (t!11064 List!5914)) )
))
(declare-datatypes ((ListLongMap!4985 0))(
  ( (ListLongMap!4986 (toList!2508 List!5914)) )
))
(declare-fun lt!175090 () ListLongMap!4985)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13141)

(declare-fun getCurrentListMap!1941 (array!21985 array!21983 (_ BitVec 32) (_ BitVec 32) V!13141 V!13141 (_ BitVec 32) Int) ListLongMap!4985)

(assert (=> b!376973 (= lt!175090 (getCurrentListMap!1941 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175100 () ListLongMap!4985)

(declare-fun lt!175096 () array!21985)

(declare-fun lt!175094 () array!21983)

(assert (=> b!376973 (= lt!175100 (getCurrentListMap!1941 lt!175096 lt!175094 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175097 () ListLongMap!4985)

(declare-fun lt!175091 () ListLongMap!4985)

(assert (=> b!376973 (and (= lt!175097 lt!175091) (= lt!175091 lt!175097))))

(declare-fun lt!175092 () ListLongMap!4985)

(declare-fun lt!175089 () tuple2!6072)

(declare-fun +!854 (ListLongMap!4985 tuple2!6072) ListLongMap!4985)

(assert (=> b!376973 (= lt!175091 (+!854 lt!175092 lt!175089))))

(declare-fun v!373 () V!13141)

(assert (=> b!376973 (= lt!175089 (tuple2!6073 k0!778 v!373))))

(declare-datatypes ((Unit!11612 0))(
  ( (Unit!11613) )
))
(declare-fun lt!175093 () Unit!11612)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!99 (array!21985 array!21983 (_ BitVec 32) (_ BitVec 32) V!13141 V!13141 (_ BitVec 32) (_ BitVec 64) V!13141 (_ BitVec 32) Int) Unit!11612)

(assert (=> b!376973 (= lt!175093 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!99 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!775 (array!21985 array!21983 (_ BitVec 32) (_ BitVec 32) V!13141 V!13141 (_ BitVec 32) Int) ListLongMap!4985)

(assert (=> b!376973 (= lt!175097 (getCurrentListMapNoExtraKeys!775 lt!175096 lt!175094 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376973 (= lt!175094 (array!21984 (store (arr!10460 _values!506) i!548 (ValueCellFull!4170 v!373)) (size!10812 _values!506)))))

(assert (=> b!376973 (= lt!175092 (getCurrentListMapNoExtraKeys!775 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376974 () Bool)

(declare-fun res!213173 () Bool)

(assert (=> b!376974 (=> (not res!213173) (not e!229545))))

(declare-datatypes ((List!5915 0))(
  ( (Nil!5912) (Cons!5911 (h!6767 (_ BitVec 64)) (t!11065 List!5915)) )
))
(declare-fun arrayNoDuplicates!0 (array!21985 (_ BitVec 32) List!5915) Bool)

(assert (=> b!376974 (= res!213173 (arrayNoDuplicates!0 lt!175096 #b00000000000000000000000000000000 Nil!5912))))

(declare-fun b!376975 () Bool)

(declare-fun res!213178 () Bool)

(assert (=> b!376975 (=> (not res!213178) (not e!229543))))

(assert (=> b!376975 (= res!213178 (or (= (select (arr!10461 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10461 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376976 () Bool)

(declare-fun e!229544 () Bool)

(declare-fun tp_is_empty!9027 () Bool)

(assert (=> b!376976 (= e!229544 tp_is_empty!9027)))

(declare-fun b!376977 () Bool)

(assert (=> b!376977 (= e!229543 e!229545)))

(declare-fun res!213176 () Bool)

(assert (=> b!376977 (=> (not res!213176) (not e!229545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21985 (_ BitVec 32)) Bool)

(assert (=> b!376977 (= res!213176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175096 mask!970))))

(assert (=> b!376977 (= lt!175096 (array!21986 (store (arr!10461 _keys!658) i!548 k0!778) (size!10813 _keys!658)))))

(declare-fun b!376978 () Bool)

(declare-fun res!213171 () Bool)

(assert (=> b!376978 (=> (not res!213171) (not e!229543))))

(assert (=> b!376978 (= res!213171 (and (= (size!10812 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10813 _keys!658) (size!10812 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376979 () Bool)

(declare-fun e!229547 () Bool)

(assert (=> b!376979 (= e!229547 tp_is_empty!9027)))

(declare-fun res!213181 () Bool)

(assert (=> start!37252 (=> (not res!213181) (not e!229543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37252 (= res!213181 (validMask!0 mask!970))))

(assert (=> start!37252 e!229543))

(declare-fun e!229546 () Bool)

(declare-fun array_inv!7708 (array!21983) Bool)

(assert (=> start!37252 (and (array_inv!7708 _values!506) e!229546)))

(assert (=> start!37252 tp!29852))

(assert (=> start!37252 true))

(assert (=> start!37252 tp_is_empty!9027))

(declare-fun array_inv!7709 (array!21985) Bool)

(assert (=> start!37252 (array_inv!7709 _keys!658)))

(declare-fun b!376972 () Bool)

(declare-fun mapRes!15105 () Bool)

(assert (=> b!376972 (= e!229546 (and e!229544 mapRes!15105))))

(declare-fun condMapEmpty!15105 () Bool)

(declare-fun mapDefault!15105 () ValueCell!4170)

(assert (=> b!376972 (= condMapEmpty!15105 (= (arr!10460 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4170)) mapDefault!15105)))))

(declare-fun mapIsEmpty!15105 () Bool)

(assert (=> mapIsEmpty!15105 mapRes!15105))

(declare-fun b!376980 () Bool)

(declare-fun e!229549 () Bool)

(assert (=> b!376980 (= e!229549 (bvsle #b00000000000000000000000000000000 (size!10813 _keys!658)))))

(declare-fun lt!175099 () ListLongMap!4985)

(declare-fun lt!175098 () ListLongMap!4985)

(assert (=> b!376980 (= lt!175099 (+!854 lt!175098 lt!175089))))

(declare-fun lt!175101 () Unit!11612)

(declare-fun addCommutativeForDiffKeys!264 (ListLongMap!4985 (_ BitVec 64) V!13141 (_ BitVec 64) V!13141) Unit!11612)

(assert (=> b!376980 (= lt!175101 (addCommutativeForDiffKeys!264 lt!175092 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376981 () Bool)

(declare-fun res!213182 () Bool)

(assert (=> b!376981 (=> (not res!213182) (not e!229543))))

(assert (=> b!376981 (= res!213182 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5912))))

(declare-fun mapNonEmpty!15105 () Bool)

(declare-fun tp!29853 () Bool)

(assert (=> mapNonEmpty!15105 (= mapRes!15105 (and tp!29853 e!229547))))

(declare-fun mapValue!15105 () ValueCell!4170)

(declare-fun mapRest!15105 () (Array (_ BitVec 32) ValueCell!4170))

(declare-fun mapKey!15105 () (_ BitVec 32))

(assert (=> mapNonEmpty!15105 (= (arr!10460 _values!506) (store mapRest!15105 mapKey!15105 mapValue!15105))))

(declare-fun b!376982 () Bool)

(assert (=> b!376982 (= e!229548 e!229549)))

(declare-fun res!213174 () Bool)

(assert (=> b!376982 (=> res!213174 e!229549)))

(assert (=> b!376982 (= res!213174 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376982 (= lt!175100 lt!175099)))

(declare-fun lt!175095 () tuple2!6072)

(assert (=> b!376982 (= lt!175099 (+!854 lt!175091 lt!175095))))

(assert (=> b!376982 (= lt!175090 lt!175098)))

(assert (=> b!376982 (= lt!175098 (+!854 lt!175092 lt!175095))))

(assert (=> b!376982 (= lt!175100 (+!854 lt!175097 lt!175095))))

(assert (=> b!376982 (= lt!175095 (tuple2!6073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376983 () Bool)

(declare-fun res!213179 () Bool)

(assert (=> b!376983 (=> (not res!213179) (not e!229543))))

(assert (=> b!376983 (= res!213179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376984 () Bool)

(declare-fun res!213175 () Bool)

(assert (=> b!376984 (=> (not res!213175) (not e!229543))))

(assert (=> b!376984 (= res!213175 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10813 _keys!658))))))

(declare-fun b!376985 () Bool)

(declare-fun res!213177 () Bool)

(assert (=> b!376985 (=> (not res!213177) (not e!229543))))

(declare-fun arrayContainsKey!0 (array!21985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376985 (= res!213177 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37252 res!213181) b!376978))

(assert (= (and b!376978 res!213171) b!376983))

(assert (= (and b!376983 res!213179) b!376981))

(assert (= (and b!376981 res!213182) b!376984))

(assert (= (and b!376984 res!213175) b!376971))

(assert (= (and b!376971 res!213180) b!376975))

(assert (= (and b!376975 res!213178) b!376985))

(assert (= (and b!376985 res!213177) b!376977))

(assert (= (and b!376977 res!213176) b!376974))

(assert (= (and b!376974 res!213173) b!376973))

(assert (= (and b!376973 (not res!213172)) b!376982))

(assert (= (and b!376982 (not res!213174)) b!376980))

(assert (= (and b!376972 condMapEmpty!15105) mapIsEmpty!15105))

(assert (= (and b!376972 (not condMapEmpty!15105)) mapNonEmpty!15105))

(get-info :version)

(assert (= (and mapNonEmpty!15105 ((_ is ValueCellFull!4170) mapValue!15105)) b!376979))

(assert (= (and b!376972 ((_ is ValueCellFull!4170) mapDefault!15105)) b!376976))

(assert (= start!37252 b!376972))

(declare-fun m!373707 () Bool)

(assert (=> b!376982 m!373707))

(declare-fun m!373709 () Bool)

(assert (=> b!376982 m!373709))

(declare-fun m!373711 () Bool)

(assert (=> b!376982 m!373711))

(declare-fun m!373713 () Bool)

(assert (=> b!376973 m!373713))

(declare-fun m!373715 () Bool)

(assert (=> b!376973 m!373715))

(declare-fun m!373717 () Bool)

(assert (=> b!376973 m!373717))

(declare-fun m!373719 () Bool)

(assert (=> b!376973 m!373719))

(declare-fun m!373721 () Bool)

(assert (=> b!376973 m!373721))

(declare-fun m!373723 () Bool)

(assert (=> b!376973 m!373723))

(declare-fun m!373725 () Bool)

(assert (=> b!376973 m!373725))

(declare-fun m!373727 () Bool)

(assert (=> b!376983 m!373727))

(declare-fun m!373729 () Bool)

(assert (=> b!376971 m!373729))

(declare-fun m!373731 () Bool)

(assert (=> b!376980 m!373731))

(declare-fun m!373733 () Bool)

(assert (=> b!376980 m!373733))

(declare-fun m!373735 () Bool)

(assert (=> b!376975 m!373735))

(declare-fun m!373737 () Bool)

(assert (=> mapNonEmpty!15105 m!373737))

(declare-fun m!373739 () Bool)

(assert (=> b!376981 m!373739))

(declare-fun m!373741 () Bool)

(assert (=> b!376985 m!373741))

(declare-fun m!373743 () Bool)

(assert (=> start!37252 m!373743))

(declare-fun m!373745 () Bool)

(assert (=> start!37252 m!373745))

(declare-fun m!373747 () Bool)

(assert (=> start!37252 m!373747))

(declare-fun m!373749 () Bool)

(assert (=> b!376974 m!373749))

(declare-fun m!373751 () Bool)

(assert (=> b!376977 m!373751))

(declare-fun m!373753 () Bool)

(assert (=> b!376977 m!373753))

(check-sat (not mapNonEmpty!15105) (not start!37252) b_and!15621 (not b!376982) (not b!376977) tp_is_empty!9027 (not b!376981) (not b!376974) (not b!376985) (not b!376983) (not b_next!8379) (not b!376973) (not b!376980) (not b!376971))
(check-sat b_and!15621 (not b_next!8379))
