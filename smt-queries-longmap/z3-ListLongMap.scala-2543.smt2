; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39062 () Bool)

(assert start!39062)

(declare-fun b_free!9343 () Bool)

(declare-fun b_next!9343 () Bool)

(assert (=> start!39062 (= b_free!9343 (not b_next!9343))))

(declare-fun tp!33558 () Bool)

(declare-fun b_and!16743 () Bool)

(assert (=> start!39062 (= tp!33558 b_and!16743)))

(declare-fun b!410273 () Bool)

(declare-fun e!245927 () Bool)

(assert (=> b!410273 (= e!245927 false)))

(declare-datatypes ((V!15099 0))(
  ( (V!15100 (val!5292 Int)) )
))
(declare-fun minValue!515 () V!15099)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15099)

(declare-datatypes ((tuple2!6738 0))(
  ( (tuple2!6739 (_1!3380 (_ BitVec 64)) (_2!3380 V!15099)) )
))
(declare-datatypes ((List!6756 0))(
  ( (Nil!6753) (Cons!6752 (h!7608 tuple2!6738) (t!11922 List!6756)) )
))
(declare-datatypes ((ListLongMap!5653 0))(
  ( (ListLongMap!5654 (toList!2842 List!6756)) )
))
(declare-fun lt!189084 () ListLongMap!5653)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24856 0))(
  ( (array!24857 (arr!11877 (Array (_ BitVec 32) (_ BitVec 64))) (size!12229 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24856)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4904 0))(
  ( (ValueCellFull!4904 (v!7540 V!15099)) (EmptyCell!4904) )
))
(declare-datatypes ((array!24858 0))(
  ( (array!24859 (arr!11878 (Array (_ BitVec 32) ValueCell!4904)) (size!12230 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24858)

(declare-fun getCurrentListMapNoExtraKeys!1094 (array!24856 array!24858 (_ BitVec 32) (_ BitVec 32) V!15099 V!15099 (_ BitVec 32) Int) ListLongMap!5653)

(assert (=> b!410273 (= lt!189084 (getCurrentListMapNoExtraKeys!1094 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410274 () Bool)

(declare-fun e!245930 () Bool)

(declare-fun tp_is_empty!10495 () Bool)

(assert (=> b!410274 (= e!245930 tp_is_empty!10495)))

(declare-fun b!410275 () Bool)

(declare-fun res!237795 () Bool)

(declare-fun e!245931 () Bool)

(assert (=> b!410275 (=> (not res!237795) (not e!245931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410275 (= res!237795 (validMask!0 mask!1025))))

(declare-fun b!410276 () Bool)

(declare-fun res!237797 () Bool)

(assert (=> b!410276 (=> (not res!237797) (not e!245931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24856 (_ BitVec 32)) Bool)

(assert (=> b!410276 (= res!237797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410277 () Bool)

(declare-fun res!237803 () Bool)

(assert (=> b!410277 (=> (not res!237803) (not e!245927))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410277 (= res!237803 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17364 () Bool)

(declare-fun mapRes!17364 () Bool)

(declare-fun tp!33557 () Bool)

(assert (=> mapNonEmpty!17364 (= mapRes!17364 (and tp!33557 e!245930))))

(declare-fun mapValue!17364 () ValueCell!4904)

(declare-fun mapRest!17364 () (Array (_ BitVec 32) ValueCell!4904))

(declare-fun mapKey!17364 () (_ BitVec 32))

(assert (=> mapNonEmpty!17364 (= (arr!11878 _values!549) (store mapRest!17364 mapKey!17364 mapValue!17364))))

(declare-fun b!410278 () Bool)

(declare-fun res!237800 () Bool)

(assert (=> b!410278 (=> (not res!237800) (not e!245931))))

(assert (=> b!410278 (= res!237800 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12229 _keys!709))))))

(declare-fun b!410279 () Bool)

(declare-fun res!237796 () Bool)

(assert (=> b!410279 (=> (not res!237796) (not e!245931))))

(declare-datatypes ((List!6757 0))(
  ( (Nil!6754) (Cons!6753 (h!7609 (_ BitVec 64)) (t!11923 List!6757)) )
))
(declare-fun arrayNoDuplicates!0 (array!24856 (_ BitVec 32) List!6757) Bool)

(assert (=> b!410279 (= res!237796 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6754))))

(declare-fun b!410280 () Bool)

(declare-fun res!237801 () Bool)

(assert (=> b!410280 (=> (not res!237801) (not e!245931))))

(assert (=> b!410280 (= res!237801 (or (= (select (arr!11877 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11877 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17364 () Bool)

(assert (=> mapIsEmpty!17364 mapRes!17364))

(declare-fun b!410281 () Bool)

(declare-fun e!245929 () Bool)

(assert (=> b!410281 (= e!245929 tp_is_empty!10495)))

(declare-fun b!410283 () Bool)

(assert (=> b!410283 (= e!245931 e!245927)))

(declare-fun res!237799 () Bool)

(assert (=> b!410283 (=> (not res!237799) (not e!245927))))

(declare-fun lt!189083 () array!24856)

(assert (=> b!410283 (= res!237799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189083 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!410283 (= lt!189083 (array!24857 (store (arr!11877 _keys!709) i!563 k0!794) (size!12229 _keys!709)))))

(declare-fun b!410284 () Bool)

(declare-fun e!245928 () Bool)

(assert (=> b!410284 (= e!245928 (and e!245929 mapRes!17364))))

(declare-fun condMapEmpty!17364 () Bool)

(declare-fun mapDefault!17364 () ValueCell!4904)

(assert (=> b!410284 (= condMapEmpty!17364 (= (arr!11878 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4904)) mapDefault!17364)))))

(declare-fun b!410285 () Bool)

(declare-fun res!237794 () Bool)

(assert (=> b!410285 (=> (not res!237794) (not e!245931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410285 (= res!237794 (validKeyInArray!0 k0!794))))

(declare-fun b!410282 () Bool)

(declare-fun res!237804 () Bool)

(assert (=> b!410282 (=> (not res!237804) (not e!245931))))

(declare-fun arrayContainsKey!0 (array!24856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410282 (= res!237804 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!237798 () Bool)

(assert (=> start!39062 (=> (not res!237798) (not e!245931))))

(assert (=> start!39062 (= res!237798 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12229 _keys!709))))))

(assert (=> start!39062 e!245931))

(assert (=> start!39062 tp_is_empty!10495))

(assert (=> start!39062 tp!33558))

(assert (=> start!39062 true))

(declare-fun array_inv!8748 (array!24858) Bool)

(assert (=> start!39062 (and (array_inv!8748 _values!549) e!245928)))

(declare-fun array_inv!8749 (array!24856) Bool)

(assert (=> start!39062 (array_inv!8749 _keys!709)))

(declare-fun b!410286 () Bool)

(declare-fun res!237802 () Bool)

(assert (=> b!410286 (=> (not res!237802) (not e!245931))))

(assert (=> b!410286 (= res!237802 (and (= (size!12230 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12229 _keys!709) (size!12230 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410287 () Bool)

(declare-fun res!237793 () Bool)

(assert (=> b!410287 (=> (not res!237793) (not e!245927))))

(assert (=> b!410287 (= res!237793 (arrayNoDuplicates!0 lt!189083 #b00000000000000000000000000000000 Nil!6754))))

(assert (= (and start!39062 res!237798) b!410275))

(assert (= (and b!410275 res!237795) b!410286))

(assert (= (and b!410286 res!237802) b!410276))

(assert (= (and b!410276 res!237797) b!410279))

(assert (= (and b!410279 res!237796) b!410278))

(assert (= (and b!410278 res!237800) b!410285))

(assert (= (and b!410285 res!237794) b!410280))

(assert (= (and b!410280 res!237801) b!410282))

(assert (= (and b!410282 res!237804) b!410283))

(assert (= (and b!410283 res!237799) b!410287))

(assert (= (and b!410287 res!237793) b!410277))

(assert (= (and b!410277 res!237803) b!410273))

(assert (= (and b!410284 condMapEmpty!17364) mapIsEmpty!17364))

(assert (= (and b!410284 (not condMapEmpty!17364)) mapNonEmpty!17364))

(get-info :version)

(assert (= (and mapNonEmpty!17364 ((_ is ValueCellFull!4904) mapValue!17364)) b!410274))

(assert (= (and b!410284 ((_ is ValueCellFull!4904) mapDefault!17364)) b!410281))

(assert (= start!39062 b!410284))

(declare-fun m!401085 () Bool)

(assert (=> start!39062 m!401085))

(declare-fun m!401087 () Bool)

(assert (=> start!39062 m!401087))

(declare-fun m!401089 () Bool)

(assert (=> b!410283 m!401089))

(declare-fun m!401091 () Bool)

(assert (=> b!410283 m!401091))

(declare-fun m!401093 () Bool)

(assert (=> b!410282 m!401093))

(declare-fun m!401095 () Bool)

(assert (=> b!410275 m!401095))

(declare-fun m!401097 () Bool)

(assert (=> b!410279 m!401097))

(declare-fun m!401099 () Bool)

(assert (=> b!410287 m!401099))

(declare-fun m!401101 () Bool)

(assert (=> mapNonEmpty!17364 m!401101))

(declare-fun m!401103 () Bool)

(assert (=> b!410273 m!401103))

(declare-fun m!401105 () Bool)

(assert (=> b!410285 m!401105))

(declare-fun m!401107 () Bool)

(assert (=> b!410280 m!401107))

(declare-fun m!401109 () Bool)

(assert (=> b!410276 m!401109))

(check-sat (not b!410276) (not b!410285) (not start!39062) (not b!410279) (not b!410287) (not b!410283) (not b!410275) (not mapNonEmpty!17364) (not b_next!9343) b_and!16743 (not b!410273) (not b!410282) tp_is_empty!10495)
(check-sat b_and!16743 (not b_next!9343))
