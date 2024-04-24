; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39044 () Bool)

(assert start!39044)

(declare-fun b_free!9325 () Bool)

(declare-fun b_next!9325 () Bool)

(assert (=> start!39044 (= b_free!9325 (not b_next!9325))))

(declare-fun tp!33503 () Bool)

(declare-fun b_and!16725 () Bool)

(assert (=> start!39044 (= tp!33503 b_and!16725)))

(declare-fun b!409868 () Bool)

(declare-fun e!245765 () Bool)

(declare-fun tp_is_empty!10477 () Bool)

(assert (=> b!409868 (= e!245765 tp_is_empty!10477)))

(declare-fun mapNonEmpty!17337 () Bool)

(declare-fun mapRes!17337 () Bool)

(declare-fun tp!33504 () Bool)

(assert (=> mapNonEmpty!17337 (= mapRes!17337 (and tp!33504 e!245765))))

(declare-datatypes ((V!15075 0))(
  ( (V!15076 (val!5283 Int)) )
))
(declare-datatypes ((ValueCell!4895 0))(
  ( (ValueCellFull!4895 (v!7531 V!15075)) (EmptyCell!4895) )
))
(declare-fun mapRest!17337 () (Array (_ BitVec 32) ValueCell!4895))

(declare-fun mapValue!17337 () ValueCell!4895)

(declare-datatypes ((array!24820 0))(
  ( (array!24821 (arr!11859 (Array (_ BitVec 32) ValueCell!4895)) (size!12211 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24820)

(declare-fun mapKey!17337 () (_ BitVec 32))

(assert (=> mapNonEmpty!17337 (= (arr!11859 _values!549) (store mapRest!17337 mapKey!17337 mapValue!17337))))

(declare-fun b!409870 () Bool)

(declare-fun e!245769 () Bool)

(assert (=> b!409870 (= e!245769 false)))

(declare-fun minValue!515 () V!15075)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24822 0))(
  ( (array!24823 (arr!11860 (Array (_ BitVec 32) (_ BitVec 64))) (size!12212 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24822)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15075)

(declare-datatypes ((tuple2!6726 0))(
  ( (tuple2!6727 (_1!3374 (_ BitVec 64)) (_2!3374 V!15075)) )
))
(declare-datatypes ((List!6743 0))(
  ( (Nil!6740) (Cons!6739 (h!7595 tuple2!6726) (t!11909 List!6743)) )
))
(declare-datatypes ((ListLongMap!5641 0))(
  ( (ListLongMap!5642 (toList!2836 List!6743)) )
))
(declare-fun lt!189029 () ListLongMap!5641)

(declare-fun getCurrentListMapNoExtraKeys!1088 (array!24822 array!24820 (_ BitVec 32) (_ BitVec 32) V!15075 V!15075 (_ BitVec 32) Int) ListLongMap!5641)

(assert (=> b!409870 (= lt!189029 (getCurrentListMapNoExtraKeys!1088 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409871 () Bool)

(declare-fun res!237471 () Bool)

(declare-fun e!245767 () Bool)

(assert (=> b!409871 (=> (not res!237471) (not e!245767))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409871 (= res!237471 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12212 _keys!709))))))

(declare-fun b!409872 () Bool)

(declare-fun res!237474 () Bool)

(assert (=> b!409872 (=> (not res!237474) (not e!245767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409872 (= res!237474 (validMask!0 mask!1025))))

(declare-fun b!409873 () Bool)

(declare-fun res!237473 () Bool)

(assert (=> b!409873 (=> (not res!237473) (not e!245767))))

(assert (=> b!409873 (= res!237473 (or (= (select (arr!11860 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11860 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409874 () Bool)

(declare-fun res!237480 () Bool)

(assert (=> b!409874 (=> (not res!237480) (not e!245767))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409874 (= res!237480 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409875 () Bool)

(declare-fun res!237479 () Bool)

(assert (=> b!409875 (=> (not res!237479) (not e!245767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409875 (= res!237479 (validKeyInArray!0 k0!794))))

(declare-fun b!409876 () Bool)

(declare-fun res!237472 () Bool)

(assert (=> b!409876 (=> (not res!237472) (not e!245767))))

(assert (=> b!409876 (= res!237472 (and (= (size!12211 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12212 _keys!709) (size!12211 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17337 () Bool)

(assert (=> mapIsEmpty!17337 mapRes!17337))

(declare-fun b!409877 () Bool)

(declare-fun res!237475 () Bool)

(assert (=> b!409877 (=> (not res!237475) (not e!245769))))

(assert (=> b!409877 (= res!237475 (bvsle from!863 i!563))))

(declare-fun b!409869 () Bool)

(assert (=> b!409869 (= e!245767 e!245769)))

(declare-fun res!237469 () Bool)

(assert (=> b!409869 (=> (not res!237469) (not e!245769))))

(declare-fun lt!189030 () array!24822)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24822 (_ BitVec 32)) Bool)

(assert (=> b!409869 (= res!237469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189030 mask!1025))))

(assert (=> b!409869 (= lt!189030 (array!24823 (store (arr!11860 _keys!709) i!563 k0!794) (size!12212 _keys!709)))))

(declare-fun res!237478 () Bool)

(assert (=> start!39044 (=> (not res!237478) (not e!245767))))

(assert (=> start!39044 (= res!237478 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12212 _keys!709))))))

(assert (=> start!39044 e!245767))

(assert (=> start!39044 tp_is_empty!10477))

(assert (=> start!39044 tp!33503))

(assert (=> start!39044 true))

(declare-fun e!245770 () Bool)

(declare-fun array_inv!8738 (array!24820) Bool)

(assert (=> start!39044 (and (array_inv!8738 _values!549) e!245770)))

(declare-fun array_inv!8739 (array!24822) Bool)

(assert (=> start!39044 (array_inv!8739 _keys!709)))

(declare-fun b!409878 () Bool)

(declare-fun e!245766 () Bool)

(assert (=> b!409878 (= e!245770 (and e!245766 mapRes!17337))))

(declare-fun condMapEmpty!17337 () Bool)

(declare-fun mapDefault!17337 () ValueCell!4895)

(assert (=> b!409878 (= condMapEmpty!17337 (= (arr!11859 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4895)) mapDefault!17337)))))

(declare-fun b!409879 () Bool)

(assert (=> b!409879 (= e!245766 tp_is_empty!10477)))

(declare-fun b!409880 () Bool)

(declare-fun res!237477 () Bool)

(assert (=> b!409880 (=> (not res!237477) (not e!245767))))

(declare-datatypes ((List!6744 0))(
  ( (Nil!6741) (Cons!6740 (h!7596 (_ BitVec 64)) (t!11910 List!6744)) )
))
(declare-fun arrayNoDuplicates!0 (array!24822 (_ BitVec 32) List!6744) Bool)

(assert (=> b!409880 (= res!237477 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6741))))

(declare-fun b!409881 () Bool)

(declare-fun res!237476 () Bool)

(assert (=> b!409881 (=> (not res!237476) (not e!245769))))

(assert (=> b!409881 (= res!237476 (arrayNoDuplicates!0 lt!189030 #b00000000000000000000000000000000 Nil!6741))))

(declare-fun b!409882 () Bool)

(declare-fun res!237470 () Bool)

(assert (=> b!409882 (=> (not res!237470) (not e!245767))))

(assert (=> b!409882 (= res!237470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39044 res!237478) b!409872))

(assert (= (and b!409872 res!237474) b!409876))

(assert (= (and b!409876 res!237472) b!409882))

(assert (= (and b!409882 res!237470) b!409880))

(assert (= (and b!409880 res!237477) b!409871))

(assert (= (and b!409871 res!237471) b!409875))

(assert (= (and b!409875 res!237479) b!409873))

(assert (= (and b!409873 res!237473) b!409874))

(assert (= (and b!409874 res!237480) b!409869))

(assert (= (and b!409869 res!237469) b!409881))

(assert (= (and b!409881 res!237476) b!409877))

(assert (= (and b!409877 res!237475) b!409870))

(assert (= (and b!409878 condMapEmpty!17337) mapIsEmpty!17337))

(assert (= (and b!409878 (not condMapEmpty!17337)) mapNonEmpty!17337))

(get-info :version)

(assert (= (and mapNonEmpty!17337 ((_ is ValueCellFull!4895) mapValue!17337)) b!409868))

(assert (= (and b!409878 ((_ is ValueCellFull!4895) mapDefault!17337)) b!409879))

(assert (= start!39044 b!409878))

(declare-fun m!400851 () Bool)

(assert (=> b!409875 m!400851))

(declare-fun m!400853 () Bool)

(assert (=> b!409873 m!400853))

(declare-fun m!400855 () Bool)

(assert (=> mapNonEmpty!17337 m!400855))

(declare-fun m!400857 () Bool)

(assert (=> start!39044 m!400857))

(declare-fun m!400859 () Bool)

(assert (=> start!39044 m!400859))

(declare-fun m!400861 () Bool)

(assert (=> b!409882 m!400861))

(declare-fun m!400863 () Bool)

(assert (=> b!409880 m!400863))

(declare-fun m!400865 () Bool)

(assert (=> b!409869 m!400865))

(declare-fun m!400867 () Bool)

(assert (=> b!409869 m!400867))

(declare-fun m!400869 () Bool)

(assert (=> b!409872 m!400869))

(declare-fun m!400871 () Bool)

(assert (=> b!409870 m!400871))

(declare-fun m!400873 () Bool)

(assert (=> b!409881 m!400873))

(declare-fun m!400875 () Bool)

(assert (=> b!409874 m!400875))

(check-sat (not b!409872) (not b!409874) (not mapNonEmpty!17337) (not b!409882) (not b!409870) b_and!16725 (not b!409881) (not b_next!9325) (not b!409875) (not b!409869) (not start!39044) tp_is_empty!10477 (not b!409880))
(check-sat b_and!16725 (not b_next!9325))
