; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39156 () Bool)

(assert start!39156)

(declare-fun b_free!9423 () Bool)

(declare-fun b_next!9423 () Bool)

(assert (=> start!39156 (= b_free!9423 (not b_next!9423))))

(declare-fun tp!33798 () Bool)

(declare-fun b_and!16809 () Bool)

(assert (=> start!39156 (= tp!33798 b_and!16809)))

(declare-fun b!412122 () Bool)

(declare-fun res!239242 () Bool)

(declare-fun e!246683 () Bool)

(assert (=> b!412122 (=> (not res!239242) (not e!246683))))

(declare-datatypes ((array!25011 0))(
  ( (array!25012 (arr!11955 (Array (_ BitVec 32) (_ BitVec 64))) (size!12307 (_ BitVec 32))) )
))
(declare-fun lt!189418 () array!25011)

(declare-datatypes ((List!6942 0))(
  ( (Nil!6939) (Cons!6938 (h!7794 (_ BitVec 64)) (t!12116 List!6942)) )
))
(declare-fun arrayNoDuplicates!0 (array!25011 (_ BitVec 32) List!6942) Bool)

(assert (=> b!412122 (= res!239242 (arrayNoDuplicates!0 lt!189418 #b00000000000000000000000000000000 Nil!6939))))

(declare-fun b!412123 () Bool)

(declare-fun res!239244 () Bool)

(declare-fun e!246682 () Bool)

(assert (=> b!412123 (=> (not res!239244) (not e!246682))))

(declare-fun _keys!709 () array!25011)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25011 (_ BitVec 32)) Bool)

(assert (=> b!412123 (= res!239244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17484 () Bool)

(declare-fun mapRes!17484 () Bool)

(declare-fun tp!33797 () Bool)

(declare-fun e!246679 () Bool)

(assert (=> mapNonEmpty!17484 (= mapRes!17484 (and tp!33797 e!246679))))

(declare-fun mapKey!17484 () (_ BitVec 32))

(declare-datatypes ((V!15205 0))(
  ( (V!15206 (val!5332 Int)) )
))
(declare-datatypes ((ValueCell!4944 0))(
  ( (ValueCellFull!4944 (v!7579 V!15205)) (EmptyCell!4944) )
))
(declare-datatypes ((array!25013 0))(
  ( (array!25014 (arr!11956 (Array (_ BitVec 32) ValueCell!4944)) (size!12308 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25013)

(declare-fun mapValue!17484 () ValueCell!4944)

(declare-fun mapRest!17484 () (Array (_ BitVec 32) ValueCell!4944))

(assert (=> mapNonEmpty!17484 (= (arr!11956 _values!549) (store mapRest!17484 mapKey!17484 mapValue!17484))))

(declare-fun b!412124 () Bool)

(declare-fun res!239243 () Bool)

(assert (=> b!412124 (=> (not res!239243) (not e!246682))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!412124 (= res!239243 (and (= (size!12308 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12307 _keys!709) (size!12308 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17484 () Bool)

(assert (=> mapIsEmpty!17484 mapRes!17484))

(declare-fun b!412125 () Bool)

(assert (=> b!412125 (= e!246682 e!246683)))

(declare-fun res!239247 () Bool)

(assert (=> b!412125 (=> (not res!239247) (not e!246683))))

(assert (=> b!412125 (= res!239247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189418 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412125 (= lt!189418 (array!25012 (store (arr!11955 _keys!709) i!563 k0!794) (size!12307 _keys!709)))))

(declare-fun b!412126 () Bool)

(assert (=> b!412126 (= e!246683 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15205)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6916 0))(
  ( (tuple2!6917 (_1!3469 (_ BitVec 64)) (_2!3469 V!15205)) )
))
(declare-datatypes ((List!6943 0))(
  ( (Nil!6940) (Cons!6939 (h!7795 tuple2!6916) (t!12117 List!6943)) )
))
(declare-datatypes ((ListLongMap!5829 0))(
  ( (ListLongMap!5830 (toList!2930 List!6943)) )
))
(declare-fun lt!189417 () ListLongMap!5829)

(declare-fun zeroValue!515 () V!15205)

(declare-fun v!412 () V!15205)

(declare-fun getCurrentListMapNoExtraKeys!1138 (array!25011 array!25013 (_ BitVec 32) (_ BitVec 32) V!15205 V!15205 (_ BitVec 32) Int) ListLongMap!5829)

(assert (=> b!412126 (= lt!189417 (getCurrentListMapNoExtraKeys!1138 lt!189418 (array!25014 (store (arr!11956 _values!549) i!563 (ValueCellFull!4944 v!412)) (size!12308 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189419 () ListLongMap!5829)

(assert (=> b!412126 (= lt!189419 (getCurrentListMapNoExtraKeys!1138 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!239246 () Bool)

(assert (=> start!39156 (=> (not res!239246) (not e!246682))))

(assert (=> start!39156 (= res!239246 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12307 _keys!709))))))

(assert (=> start!39156 e!246682))

(declare-fun tp_is_empty!10575 () Bool)

(assert (=> start!39156 tp_is_empty!10575))

(assert (=> start!39156 tp!33798))

(assert (=> start!39156 true))

(declare-fun e!246681 () Bool)

(declare-fun array_inv!8718 (array!25013) Bool)

(assert (=> start!39156 (and (array_inv!8718 _values!549) e!246681)))

(declare-fun array_inv!8719 (array!25011) Bool)

(assert (=> start!39156 (array_inv!8719 _keys!709)))

(declare-fun b!412127 () Bool)

(declare-fun res!239241 () Bool)

(assert (=> b!412127 (=> (not res!239241) (not e!246682))))

(assert (=> b!412127 (= res!239241 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12307 _keys!709))))))

(declare-fun b!412128 () Bool)

(declare-fun e!246684 () Bool)

(assert (=> b!412128 (= e!246684 tp_is_empty!10575)))

(declare-fun b!412129 () Bool)

(declare-fun res!239238 () Bool)

(assert (=> b!412129 (=> (not res!239238) (not e!246682))))

(assert (=> b!412129 (= res!239238 (or (= (select (arr!11955 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11955 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412130 () Bool)

(assert (=> b!412130 (= e!246679 tp_is_empty!10575)))

(declare-fun b!412131 () Bool)

(declare-fun res!239239 () Bool)

(assert (=> b!412131 (=> (not res!239239) (not e!246682))))

(assert (=> b!412131 (= res!239239 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6939))))

(declare-fun b!412132 () Bool)

(declare-fun res!239240 () Bool)

(assert (=> b!412132 (=> (not res!239240) (not e!246683))))

(assert (=> b!412132 (= res!239240 (bvsle from!863 i!563))))

(declare-fun b!412133 () Bool)

(assert (=> b!412133 (= e!246681 (and e!246684 mapRes!17484))))

(declare-fun condMapEmpty!17484 () Bool)

(declare-fun mapDefault!17484 () ValueCell!4944)

(assert (=> b!412133 (= condMapEmpty!17484 (= (arr!11956 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4944)) mapDefault!17484)))))

(declare-fun b!412134 () Bool)

(declare-fun res!239245 () Bool)

(assert (=> b!412134 (=> (not res!239245) (not e!246682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412134 (= res!239245 (validMask!0 mask!1025))))

(declare-fun b!412135 () Bool)

(declare-fun res!239236 () Bool)

(assert (=> b!412135 (=> (not res!239236) (not e!246682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412135 (= res!239236 (validKeyInArray!0 k0!794))))

(declare-fun b!412136 () Bool)

(declare-fun res!239237 () Bool)

(assert (=> b!412136 (=> (not res!239237) (not e!246682))))

(declare-fun arrayContainsKey!0 (array!25011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412136 (= res!239237 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39156 res!239246) b!412134))

(assert (= (and b!412134 res!239245) b!412124))

(assert (= (and b!412124 res!239243) b!412123))

(assert (= (and b!412123 res!239244) b!412131))

(assert (= (and b!412131 res!239239) b!412127))

(assert (= (and b!412127 res!239241) b!412135))

(assert (= (and b!412135 res!239236) b!412129))

(assert (= (and b!412129 res!239238) b!412136))

(assert (= (and b!412136 res!239237) b!412125))

(assert (= (and b!412125 res!239247) b!412122))

(assert (= (and b!412122 res!239242) b!412132))

(assert (= (and b!412132 res!239240) b!412126))

(assert (= (and b!412133 condMapEmpty!17484) mapIsEmpty!17484))

(assert (= (and b!412133 (not condMapEmpty!17484)) mapNonEmpty!17484))

(get-info :version)

(assert (= (and mapNonEmpty!17484 ((_ is ValueCellFull!4944) mapValue!17484)) b!412130))

(assert (= (and b!412133 ((_ is ValueCellFull!4944) mapDefault!17484)) b!412128))

(assert (= start!39156 b!412133))

(declare-fun m!402043 () Bool)

(assert (=> b!412126 m!402043))

(declare-fun m!402045 () Bool)

(assert (=> b!412126 m!402045))

(declare-fun m!402047 () Bool)

(assert (=> b!412126 m!402047))

(declare-fun m!402049 () Bool)

(assert (=> b!412134 m!402049))

(declare-fun m!402051 () Bool)

(assert (=> b!412131 m!402051))

(declare-fun m!402053 () Bool)

(assert (=> start!39156 m!402053))

(declare-fun m!402055 () Bool)

(assert (=> start!39156 m!402055))

(declare-fun m!402057 () Bool)

(assert (=> b!412136 m!402057))

(declare-fun m!402059 () Bool)

(assert (=> b!412129 m!402059))

(declare-fun m!402061 () Bool)

(assert (=> b!412125 m!402061))

(declare-fun m!402063 () Bool)

(assert (=> b!412125 m!402063))

(declare-fun m!402065 () Bool)

(assert (=> mapNonEmpty!17484 m!402065))

(declare-fun m!402067 () Bool)

(assert (=> b!412135 m!402067))

(declare-fun m!402069 () Bool)

(assert (=> b!412122 m!402069))

(declare-fun m!402071 () Bool)

(assert (=> b!412123 m!402071))

(check-sat (not b!412136) (not b!412135) b_and!16809 (not b_next!9423) (not mapNonEmpty!17484) (not b!412126) (not b!412125) (not b!412131) tp_is_empty!10575 (not b!412123) (not start!39156) (not b!412134) (not b!412122))
(check-sat b_and!16809 (not b_next!9423))
