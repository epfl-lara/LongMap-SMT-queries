; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37186 () Bool)

(assert start!37186)

(declare-fun b_free!8313 () Bool)

(declare-fun b_next!8313 () Bool)

(assert (=> start!37186 (= b_free!8313 (not b_next!8313))))

(declare-fun tp!29655 () Bool)

(declare-fun b_and!15555 () Bool)

(assert (=> start!37186 (= tp!29655 b_and!15555)))

(declare-fun b!375477 () Bool)

(declare-fun res!211979 () Bool)

(declare-fun e!228755 () Bool)

(assert (=> b!375477 (=> (not res!211979) (not e!228755))))

(declare-datatypes ((array!21857 0))(
  ( (array!21858 (arr!10397 (Array (_ BitVec 32) (_ BitVec 64))) (size!10749 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21857)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21857 (_ BitVec 32)) Bool)

(assert (=> b!375477 (= res!211979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375478 () Bool)

(declare-fun res!211976 () Bool)

(assert (=> b!375478 (=> (not res!211976) (not e!228755))))

(declare-datatypes ((List!5864 0))(
  ( (Nil!5861) (Cons!5860 (h!6716 (_ BitVec 64)) (t!11014 List!5864)) )
))
(declare-fun arrayNoDuplicates!0 (array!21857 (_ BitVec 32) List!5864) Bool)

(assert (=> b!375478 (= res!211976 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5861))))

(declare-fun b!375479 () Bool)

(declare-fun res!211985 () Bool)

(assert (=> b!375479 (=> (not res!211985) (not e!228755))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375479 (= res!211985 (validKeyInArray!0 k0!778))))

(declare-fun res!211977 () Bool)

(assert (=> start!37186 (=> (not res!211977) (not e!228755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37186 (= res!211977 (validMask!0 mask!970))))

(assert (=> start!37186 e!228755))

(declare-datatypes ((V!13053 0))(
  ( (V!13054 (val!4525 Int)) )
))
(declare-datatypes ((ValueCell!4137 0))(
  ( (ValueCellFull!4137 (v!6722 V!13053)) (EmptyCell!4137) )
))
(declare-datatypes ((array!21859 0))(
  ( (array!21860 (arr!10398 (Array (_ BitVec 32) ValueCell!4137)) (size!10750 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21859)

(declare-fun e!228753 () Bool)

(declare-fun array_inv!7666 (array!21859) Bool)

(assert (=> start!37186 (and (array_inv!7666 _values!506) e!228753)))

(assert (=> start!37186 tp!29655))

(assert (=> start!37186 true))

(declare-fun tp_is_empty!8961 () Bool)

(assert (=> start!37186 tp_is_empty!8961))

(declare-fun array_inv!7667 (array!21857) Bool)

(assert (=> start!37186 (array_inv!7667 _keys!658)))

(declare-fun b!375480 () Bool)

(declare-fun e!228754 () Bool)

(assert (=> b!375480 (= e!228755 e!228754)))

(declare-fun res!211980 () Bool)

(assert (=> b!375480 (=> (not res!211980) (not e!228754))))

(declare-fun lt!173800 () array!21857)

(assert (=> b!375480 (= res!211980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173800 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375480 (= lt!173800 (array!21858 (store (arr!10397 _keys!658) i!548 k0!778) (size!10749 _keys!658)))))

(declare-fun b!375481 () Bool)

(declare-fun res!211978 () Bool)

(assert (=> b!375481 (=> (not res!211978) (not e!228754))))

(assert (=> b!375481 (= res!211978 (arrayNoDuplicates!0 lt!173800 #b00000000000000000000000000000000 Nil!5861))))

(declare-fun b!375482 () Bool)

(declare-fun e!228757 () Bool)

(declare-fun e!228752 () Bool)

(assert (=> b!375482 (= e!228757 e!228752)))

(declare-fun res!211981 () Bool)

(assert (=> b!375482 (=> res!211981 e!228752)))

(assert (=> b!375482 (= res!211981 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6022 0))(
  ( (tuple2!6023 (_1!3022 (_ BitVec 64)) (_2!3022 V!13053)) )
))
(declare-datatypes ((List!5865 0))(
  ( (Nil!5862) (Cons!5861 (h!6717 tuple2!6022) (t!11015 List!5865)) )
))
(declare-datatypes ((ListLongMap!4935 0))(
  ( (ListLongMap!4936 (toList!2483 List!5865)) )
))
(declare-fun lt!173792 () ListLongMap!4935)

(declare-fun lt!173801 () ListLongMap!4935)

(assert (=> b!375482 (= lt!173792 lt!173801)))

(declare-fun lt!173793 () ListLongMap!4935)

(declare-fun lt!173798 () tuple2!6022)

(declare-fun +!829 (ListLongMap!4935 tuple2!6022) ListLongMap!4935)

(assert (=> b!375482 (= lt!173801 (+!829 lt!173793 lt!173798))))

(declare-fun v!373 () V!13053)

(declare-fun lt!173795 () ListLongMap!4935)

(declare-fun zeroValue!472 () V!13053)

(declare-datatypes ((Unit!11564 0))(
  ( (Unit!11565) )
))
(declare-fun lt!173794 () Unit!11564)

(declare-fun addCommutativeForDiffKeys!248 (ListLongMap!4935 (_ BitVec 64) V!13053 (_ BitVec 64) V!13053) Unit!11564)

(assert (=> b!375482 (= lt!173794 (addCommutativeForDiffKeys!248 lt!173795 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173789 () ListLongMap!4935)

(declare-fun lt!173802 () tuple2!6022)

(assert (=> b!375482 (= lt!173789 (+!829 lt!173792 lt!173802))))

(declare-fun lt!173799 () ListLongMap!4935)

(declare-fun lt!173790 () tuple2!6022)

(assert (=> b!375482 (= lt!173792 (+!829 lt!173799 lt!173790))))

(declare-fun lt!173786 () ListLongMap!4935)

(declare-fun lt!173796 () ListLongMap!4935)

(assert (=> b!375482 (= lt!173786 lt!173796)))

(assert (=> b!375482 (= lt!173796 (+!829 lt!173793 lt!173802))))

(assert (=> b!375482 (= lt!173793 (+!829 lt!173795 lt!173790))))

(declare-fun lt!173797 () ListLongMap!4935)

(assert (=> b!375482 (= lt!173789 (+!829 (+!829 lt!173797 lt!173790) lt!173802))))

(declare-fun minValue!472 () V!13053)

(assert (=> b!375482 (= lt!173802 (tuple2!6023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375482 (= lt!173790 (tuple2!6023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375483 () Bool)

(declare-fun res!211982 () Bool)

(assert (=> b!375483 (=> (not res!211982) (not e!228755))))

(assert (=> b!375483 (= res!211982 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10749 _keys!658))))))

(declare-fun b!375484 () Bool)

(declare-fun e!228758 () Bool)

(assert (=> b!375484 (= e!228758 tp_is_empty!8961)))

(declare-fun b!375485 () Bool)

(declare-fun res!211975 () Bool)

(assert (=> b!375485 (=> (not res!211975) (not e!228755))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375485 (= res!211975 (and (= (size!10750 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10749 _keys!658) (size!10750 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15006 () Bool)

(declare-fun mapRes!15006 () Bool)

(declare-fun tp!29654 () Bool)

(declare-fun e!228751 () Bool)

(assert (=> mapNonEmpty!15006 (= mapRes!15006 (and tp!29654 e!228751))))

(declare-fun mapValue!15006 () ValueCell!4137)

(declare-fun mapRest!15006 () (Array (_ BitVec 32) ValueCell!4137))

(declare-fun mapKey!15006 () (_ BitVec 32))

(assert (=> mapNonEmpty!15006 (= (arr!10398 _values!506) (store mapRest!15006 mapKey!15006 mapValue!15006))))

(declare-fun b!375486 () Bool)

(assert (=> b!375486 (= e!228753 (and e!228758 mapRes!15006))))

(declare-fun condMapEmpty!15006 () Bool)

(declare-fun mapDefault!15006 () ValueCell!4137)

(assert (=> b!375486 (= condMapEmpty!15006 (= (arr!10398 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4137)) mapDefault!15006)))))

(declare-fun b!375487 () Bool)

(assert (=> b!375487 (= e!228752 true)))

(assert (=> b!375487 (= (+!829 lt!173801 lt!173802) (+!829 lt!173796 lt!173798))))

(declare-fun lt!173787 () Unit!11564)

(assert (=> b!375487 (= lt!173787 (addCommutativeForDiffKeys!248 lt!173793 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375488 () Bool)

(assert (=> b!375488 (= e!228751 tp_is_empty!8961)))

(declare-fun b!375489 () Bool)

(declare-fun res!211974 () Bool)

(assert (=> b!375489 (=> (not res!211974) (not e!228755))))

(assert (=> b!375489 (= res!211974 (or (= (select (arr!10397 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10397 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375490 () Bool)

(assert (=> b!375490 (= e!228754 (not e!228757))))

(declare-fun res!211983 () Bool)

(assert (=> b!375490 (=> res!211983 e!228757)))

(assert (=> b!375490 (= res!211983 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1918 (array!21857 array!21859 (_ BitVec 32) (_ BitVec 32) V!13053 V!13053 (_ BitVec 32) Int) ListLongMap!4935)

(assert (=> b!375490 (= lt!173786 (getCurrentListMap!1918 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173791 () array!21859)

(assert (=> b!375490 (= lt!173789 (getCurrentListMap!1918 lt!173800 lt!173791 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375490 (and (= lt!173797 lt!173799) (= lt!173799 lt!173797))))

(assert (=> b!375490 (= lt!173799 (+!829 lt!173795 lt!173798))))

(assert (=> b!375490 (= lt!173798 (tuple2!6023 k0!778 v!373))))

(declare-fun lt!173788 () Unit!11564)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!76 (array!21857 array!21859 (_ BitVec 32) (_ BitVec 32) V!13053 V!13053 (_ BitVec 32) (_ BitVec 64) V!13053 (_ BitVec 32) Int) Unit!11564)

(assert (=> b!375490 (= lt!173788 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!76 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!752 (array!21857 array!21859 (_ BitVec 32) (_ BitVec 32) V!13053 V!13053 (_ BitVec 32) Int) ListLongMap!4935)

(assert (=> b!375490 (= lt!173797 (getCurrentListMapNoExtraKeys!752 lt!173800 lt!173791 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375490 (= lt!173791 (array!21860 (store (arr!10398 _values!506) i!548 (ValueCellFull!4137 v!373)) (size!10750 _values!506)))))

(assert (=> b!375490 (= lt!173795 (getCurrentListMapNoExtraKeys!752 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375491 () Bool)

(declare-fun res!211984 () Bool)

(assert (=> b!375491 (=> (not res!211984) (not e!228755))))

(declare-fun arrayContainsKey!0 (array!21857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375491 (= res!211984 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15006 () Bool)

(assert (=> mapIsEmpty!15006 mapRes!15006))

(assert (= (and start!37186 res!211977) b!375485))

(assert (= (and b!375485 res!211975) b!375477))

(assert (= (and b!375477 res!211979) b!375478))

(assert (= (and b!375478 res!211976) b!375483))

(assert (= (and b!375483 res!211982) b!375479))

(assert (= (and b!375479 res!211985) b!375489))

(assert (= (and b!375489 res!211974) b!375491))

(assert (= (and b!375491 res!211984) b!375480))

(assert (= (and b!375480 res!211980) b!375481))

(assert (= (and b!375481 res!211978) b!375490))

(assert (= (and b!375490 (not res!211983)) b!375482))

(assert (= (and b!375482 (not res!211981)) b!375487))

(assert (= (and b!375486 condMapEmpty!15006) mapIsEmpty!15006))

(assert (= (and b!375486 (not condMapEmpty!15006)) mapNonEmpty!15006))

(get-info :version)

(assert (= (and mapNonEmpty!15006 ((_ is ValueCellFull!4137) mapValue!15006)) b!375488))

(assert (= (and b!375486 ((_ is ValueCellFull!4137) mapDefault!15006)) b!375484))

(assert (= start!37186 b!375486))

(declare-fun m!372075 () Bool)

(assert (=> b!375487 m!372075))

(declare-fun m!372077 () Bool)

(assert (=> b!375487 m!372077))

(declare-fun m!372079 () Bool)

(assert (=> b!375487 m!372079))

(declare-fun m!372081 () Bool)

(assert (=> b!375491 m!372081))

(declare-fun m!372083 () Bool)

(assert (=> b!375479 m!372083))

(declare-fun m!372085 () Bool)

(assert (=> b!375489 m!372085))

(declare-fun m!372087 () Bool)

(assert (=> b!375482 m!372087))

(declare-fun m!372089 () Bool)

(assert (=> b!375482 m!372089))

(declare-fun m!372091 () Bool)

(assert (=> b!375482 m!372091))

(declare-fun m!372093 () Bool)

(assert (=> b!375482 m!372093))

(assert (=> b!375482 m!372091))

(declare-fun m!372095 () Bool)

(assert (=> b!375482 m!372095))

(declare-fun m!372097 () Bool)

(assert (=> b!375482 m!372097))

(declare-fun m!372099 () Bool)

(assert (=> b!375482 m!372099))

(declare-fun m!372101 () Bool)

(assert (=> b!375482 m!372101))

(declare-fun m!372103 () Bool)

(assert (=> b!375481 m!372103))

(declare-fun m!372105 () Bool)

(assert (=> mapNonEmpty!15006 m!372105))

(declare-fun m!372107 () Bool)

(assert (=> start!37186 m!372107))

(declare-fun m!372109 () Bool)

(assert (=> start!37186 m!372109))

(declare-fun m!372111 () Bool)

(assert (=> start!37186 m!372111))

(declare-fun m!372113 () Bool)

(assert (=> b!375478 m!372113))

(declare-fun m!372115 () Bool)

(assert (=> b!375477 m!372115))

(declare-fun m!372117 () Bool)

(assert (=> b!375480 m!372117))

(declare-fun m!372119 () Bool)

(assert (=> b!375480 m!372119))

(declare-fun m!372121 () Bool)

(assert (=> b!375490 m!372121))

(declare-fun m!372123 () Bool)

(assert (=> b!375490 m!372123))

(declare-fun m!372125 () Bool)

(assert (=> b!375490 m!372125))

(declare-fun m!372127 () Bool)

(assert (=> b!375490 m!372127))

(declare-fun m!372129 () Bool)

(assert (=> b!375490 m!372129))

(declare-fun m!372131 () Bool)

(assert (=> b!375490 m!372131))

(declare-fun m!372133 () Bool)

(assert (=> b!375490 m!372133))

(check-sat b_and!15555 (not b!375487) (not b!375479) (not b!375477) (not b_next!8313) (not start!37186) (not b!375481) (not mapNonEmpty!15006) tp_is_empty!8961 (not b!375478) (not b!375480) (not b!375491) (not b!375490) (not b!375482))
(check-sat b_and!15555 (not b_next!8313))
