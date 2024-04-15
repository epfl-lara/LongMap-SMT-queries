; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39632 () Bool)

(assert start!39632)

(declare-fun b_free!9913 () Bool)

(declare-fun b_next!9913 () Bool)

(assert (=> start!39632 (= b_free!9913 (not b_next!9913))))

(declare-fun tp!35267 () Bool)

(declare-fun b_and!17543 () Bool)

(assert (=> start!39632 (= tp!35267 b_and!17543)))

(declare-fun b!425056 () Bool)

(declare-fun res!248865 () Bool)

(declare-fun e!252341 () Bool)

(assert (=> b!425056 (=> (not res!248865) (not e!252341))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25959 0))(
  ( (array!25960 (arr!12429 (Array (_ BitVec 32) (_ BitVec 64))) (size!12782 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25959)

(assert (=> b!425056 (= res!248865 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12782 _keys!709))))))

(declare-fun b!425057 () Bool)

(declare-fun e!252343 () Bool)

(declare-fun e!252340 () Bool)

(assert (=> b!425057 (= e!252343 e!252340)))

(declare-fun res!248868 () Bool)

(assert (=> b!425057 (=> (not res!248868) (not e!252340))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425057 (= res!248868 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15859 0))(
  ( (V!15860 (val!5577 Int)) )
))
(declare-fun minValue!515 () V!15859)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15859)

(declare-datatypes ((tuple2!7316 0))(
  ( (tuple2!7317 (_1!3669 (_ BitVec 64)) (_2!3669 V!15859)) )
))
(declare-datatypes ((List!7315 0))(
  ( (Nil!7312) (Cons!7311 (h!8167 tuple2!7316) (t!12750 List!7315)) )
))
(declare-datatypes ((ListLongMap!6219 0))(
  ( (ListLongMap!6220 (toList!3125 List!7315)) )
))
(declare-fun lt!194381 () ListLongMap!6219)

(declare-datatypes ((ValueCell!5189 0))(
  ( (ValueCellFull!5189 (v!7818 V!15859)) (EmptyCell!5189) )
))
(declare-datatypes ((array!25961 0))(
  ( (array!25962 (arr!12430 (Array (_ BitVec 32) ValueCell!5189)) (size!12783 (_ BitVec 32))) )
))
(declare-fun lt!194380 () array!25961)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!194382 () array!25959)

(declare-fun getCurrentListMapNoExtraKeys!1333 (array!25959 array!25961 (_ BitVec 32) (_ BitVec 32) V!15859 V!15859 (_ BitVec 32) Int) ListLongMap!6219)

(assert (=> b!425057 (= lt!194381 (getCurrentListMapNoExtraKeys!1333 lt!194382 lt!194380 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25961)

(declare-fun v!412 () V!15859)

(assert (=> b!425057 (= lt!194380 (array!25962 (store (arr!12430 _values!549) i!563 (ValueCellFull!5189 v!412)) (size!12783 _values!549)))))

(declare-fun lt!194384 () ListLongMap!6219)

(assert (=> b!425057 (= lt!194384 (getCurrentListMapNoExtraKeys!1333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425058 () Bool)

(declare-fun res!248872 () Bool)

(assert (=> b!425058 (=> (not res!248872) (not e!252343))))

(declare-datatypes ((List!7316 0))(
  ( (Nil!7313) (Cons!7312 (h!8168 (_ BitVec 64)) (t!12751 List!7316)) )
))
(declare-fun arrayNoDuplicates!0 (array!25959 (_ BitVec 32) List!7316) Bool)

(assert (=> b!425058 (= res!248872 (arrayNoDuplicates!0 lt!194382 #b00000000000000000000000000000000 Nil!7313))))

(declare-fun b!425059 () Bool)

(declare-fun res!248869 () Bool)

(assert (=> b!425059 (=> (not res!248869) (not e!252341))))

(assert (=> b!425059 (= res!248869 (or (= (select (arr!12429 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12429 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425060 () Bool)

(declare-fun res!248866 () Bool)

(assert (=> b!425060 (=> (not res!248866) (not e!252343))))

(assert (=> b!425060 (= res!248866 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18219 () Bool)

(declare-fun mapRes!18219 () Bool)

(declare-fun tp!35268 () Bool)

(declare-fun e!252345 () Bool)

(assert (=> mapNonEmpty!18219 (= mapRes!18219 (and tp!35268 e!252345))))

(declare-fun mapRest!18219 () (Array (_ BitVec 32) ValueCell!5189))

(declare-fun mapKey!18219 () (_ BitVec 32))

(declare-fun mapValue!18219 () ValueCell!5189)

(assert (=> mapNonEmpty!18219 (= (arr!12430 _values!549) (store mapRest!18219 mapKey!18219 mapValue!18219))))

(declare-fun b!425061 () Bool)

(declare-fun res!248870 () Bool)

(assert (=> b!425061 (=> (not res!248870) (not e!252341))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425061 (= res!248870 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425062 () Bool)

(declare-fun res!248875 () Bool)

(assert (=> b!425062 (=> (not res!248875) (not e!252341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425062 (= res!248875 (validMask!0 mask!1025))))

(declare-fun b!425063 () Bool)

(assert (=> b!425063 (= e!252341 e!252343)))

(declare-fun res!248876 () Bool)

(assert (=> b!425063 (=> (not res!248876) (not e!252343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25959 (_ BitVec 32)) Bool)

(assert (=> b!425063 (= res!248876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194382 mask!1025))))

(assert (=> b!425063 (= lt!194382 (array!25960 (store (arr!12429 _keys!709) i!563 k0!794) (size!12782 _keys!709)))))

(declare-fun b!425064 () Bool)

(declare-fun res!248874 () Bool)

(assert (=> b!425064 (=> (not res!248874) (not e!252341))))

(assert (=> b!425064 (= res!248874 (and (= (size!12783 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12782 _keys!709) (size!12783 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425066 () Bool)

(declare-fun res!248877 () Bool)

(assert (=> b!425066 (=> (not res!248877) (not e!252341))))

(assert (=> b!425066 (= res!248877 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7313))))

(declare-fun b!425067 () Bool)

(declare-fun res!248873 () Bool)

(assert (=> b!425067 (=> (not res!248873) (not e!252341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425067 (= res!248873 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18219 () Bool)

(assert (=> mapIsEmpty!18219 mapRes!18219))

(declare-fun b!425068 () Bool)

(declare-fun e!252344 () Bool)

(declare-fun tp_is_empty!11065 () Bool)

(assert (=> b!425068 (= e!252344 tp_is_empty!11065)))

(declare-fun b!425069 () Bool)

(assert (=> b!425069 (= e!252345 tp_is_empty!11065)))

(declare-fun b!425070 () Bool)

(declare-fun e!252339 () Bool)

(assert (=> b!425070 (= e!252339 (and e!252344 mapRes!18219))))

(declare-fun condMapEmpty!18219 () Bool)

(declare-fun mapDefault!18219 () ValueCell!5189)

(assert (=> b!425070 (= condMapEmpty!18219 (= (arr!12430 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5189)) mapDefault!18219)))))

(declare-fun b!425071 () Bool)

(assert (=> b!425071 (= e!252340 (not true))))

(declare-fun +!1308 (ListLongMap!6219 tuple2!7316) ListLongMap!6219)

(assert (=> b!425071 (= (getCurrentListMapNoExtraKeys!1333 lt!194382 lt!194380 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1308 (getCurrentListMapNoExtraKeys!1333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7317 k0!794 v!412)))))

(declare-datatypes ((Unit!12462 0))(
  ( (Unit!12463) )
))
(declare-fun lt!194383 () Unit!12462)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!479 (array!25959 array!25961 (_ BitVec 32) (_ BitVec 32) V!15859 V!15859 (_ BitVec 32) (_ BitVec 64) V!15859 (_ BitVec 32) Int) Unit!12462)

(assert (=> b!425071 (= lt!194383 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!479 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!248867 () Bool)

(assert (=> start!39632 (=> (not res!248867) (not e!252341))))

(assert (=> start!39632 (= res!248867 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12782 _keys!709))))))

(assert (=> start!39632 e!252341))

(assert (=> start!39632 tp_is_empty!11065))

(assert (=> start!39632 tp!35267))

(assert (=> start!39632 true))

(declare-fun array_inv!9088 (array!25961) Bool)

(assert (=> start!39632 (and (array_inv!9088 _values!549) e!252339)))

(declare-fun array_inv!9089 (array!25959) Bool)

(assert (=> start!39632 (array_inv!9089 _keys!709)))

(declare-fun b!425065 () Bool)

(declare-fun res!248871 () Bool)

(assert (=> b!425065 (=> (not res!248871) (not e!252341))))

(assert (=> b!425065 (= res!248871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39632 res!248867) b!425062))

(assert (= (and b!425062 res!248875) b!425064))

(assert (= (and b!425064 res!248874) b!425065))

(assert (= (and b!425065 res!248871) b!425066))

(assert (= (and b!425066 res!248877) b!425056))

(assert (= (and b!425056 res!248865) b!425067))

(assert (= (and b!425067 res!248873) b!425059))

(assert (= (and b!425059 res!248869) b!425061))

(assert (= (and b!425061 res!248870) b!425063))

(assert (= (and b!425063 res!248876) b!425058))

(assert (= (and b!425058 res!248872) b!425060))

(assert (= (and b!425060 res!248866) b!425057))

(assert (= (and b!425057 res!248868) b!425071))

(assert (= (and b!425070 condMapEmpty!18219) mapIsEmpty!18219))

(assert (= (and b!425070 (not condMapEmpty!18219)) mapNonEmpty!18219))

(get-info :version)

(assert (= (and mapNonEmpty!18219 ((_ is ValueCellFull!5189) mapValue!18219)) b!425069))

(assert (= (and b!425070 ((_ is ValueCellFull!5189) mapDefault!18219)) b!425068))

(assert (= start!39632 b!425070))

(declare-fun m!413517 () Bool)

(assert (=> b!425071 m!413517))

(declare-fun m!413519 () Bool)

(assert (=> b!425071 m!413519))

(assert (=> b!425071 m!413519))

(declare-fun m!413521 () Bool)

(assert (=> b!425071 m!413521))

(declare-fun m!413523 () Bool)

(assert (=> b!425071 m!413523))

(declare-fun m!413525 () Bool)

(assert (=> b!425066 m!413525))

(declare-fun m!413527 () Bool)

(assert (=> b!425058 m!413527))

(declare-fun m!413529 () Bool)

(assert (=> b!425061 m!413529))

(declare-fun m!413531 () Bool)

(assert (=> b!425059 m!413531))

(declare-fun m!413533 () Bool)

(assert (=> mapNonEmpty!18219 m!413533))

(declare-fun m!413535 () Bool)

(assert (=> b!425065 m!413535))

(declare-fun m!413537 () Bool)

(assert (=> b!425057 m!413537))

(declare-fun m!413539 () Bool)

(assert (=> b!425057 m!413539))

(declare-fun m!413541 () Bool)

(assert (=> b!425057 m!413541))

(declare-fun m!413543 () Bool)

(assert (=> b!425063 m!413543))

(declare-fun m!413545 () Bool)

(assert (=> b!425063 m!413545))

(declare-fun m!413547 () Bool)

(assert (=> b!425062 m!413547))

(declare-fun m!413549 () Bool)

(assert (=> start!39632 m!413549))

(declare-fun m!413551 () Bool)

(assert (=> start!39632 m!413551))

(declare-fun m!413553 () Bool)

(assert (=> b!425067 m!413553))

(check-sat (not b!425067) (not start!39632) (not b_next!9913) (not b!425063) (not b!425057) (not b!425061) tp_is_empty!11065 (not b!425066) (not b!425062) (not mapNonEmpty!18219) (not b!425065) (not b!425058) (not b!425071) b_and!17543)
(check-sat b_and!17543 (not b_next!9913))
