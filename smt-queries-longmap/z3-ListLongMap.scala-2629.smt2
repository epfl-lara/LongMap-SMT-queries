; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39594 () Bool)

(assert start!39594)

(declare-fun b_free!9861 () Bool)

(declare-fun b_next!9861 () Bool)

(assert (=> start!39594 (= b_free!9861 (not b_next!9861))))

(declare-fun tp!35111 () Bool)

(declare-fun b_and!17517 () Bool)

(assert (=> start!39594 (= tp!35111 b_and!17517)))

(declare-fun b!424119 () Bool)

(declare-fun res!248025 () Bool)

(declare-fun e!252008 () Bool)

(assert (=> b!424119 (=> (not res!248025) (not e!252008))))

(declare-datatypes ((array!25865 0))(
  ( (array!25866 (arr!12382 (Array (_ BitVec 32) (_ BitVec 64))) (size!12734 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25865)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15789 0))(
  ( (V!15790 (val!5551 Int)) )
))
(declare-datatypes ((ValueCell!5163 0))(
  ( (ValueCellFull!5163 (v!7798 V!15789)) (EmptyCell!5163) )
))
(declare-datatypes ((array!25867 0))(
  ( (array!25868 (arr!12383 (Array (_ BitVec 32) ValueCell!5163)) (size!12735 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25867)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!424119 (= res!248025 (and (= (size!12735 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12734 _keys!709) (size!12735 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424120 () Bool)

(declare-fun res!248022 () Bool)

(assert (=> b!424120 (=> (not res!248022) (not e!252008))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424120 (= res!248022 (or (= (select (arr!12382 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12382 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424121 () Bool)

(declare-fun e!252012 () Bool)

(declare-fun tp_is_empty!11013 () Bool)

(assert (=> b!424121 (= e!252012 tp_is_empty!11013)))

(declare-fun b!424122 () Bool)

(declare-fun res!248029 () Bool)

(declare-fun e!252009 () Bool)

(assert (=> b!424122 (=> (not res!248029) (not e!252009))))

(declare-fun lt!194306 () array!25865)

(declare-datatypes ((List!7299 0))(
  ( (Nil!7296) (Cons!7295 (h!8151 (_ BitVec 64)) (t!12743 List!7299)) )
))
(declare-fun arrayNoDuplicates!0 (array!25865 (_ BitVec 32) List!7299) Bool)

(assert (=> b!424122 (= res!248029 (arrayNoDuplicates!0 lt!194306 #b00000000000000000000000000000000 Nil!7296))))

(declare-fun b!424123 () Bool)

(declare-fun res!248026 () Bool)

(assert (=> b!424123 (=> (not res!248026) (not e!252009))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!424123 (= res!248026 (bvsle from!863 i!563))))

(declare-fun b!424124 () Bool)

(declare-fun res!248027 () Bool)

(assert (=> b!424124 (=> (not res!248027) (not e!252008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424124 (= res!248027 (validMask!0 mask!1025))))

(declare-fun res!248024 () Bool)

(assert (=> start!39594 (=> (not res!248024) (not e!252008))))

(assert (=> start!39594 (= res!248024 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12734 _keys!709))))))

(assert (=> start!39594 e!252008))

(assert (=> start!39594 tp_is_empty!11013))

(assert (=> start!39594 tp!35111))

(assert (=> start!39594 true))

(declare-fun e!252010 () Bool)

(declare-fun array_inv!9024 (array!25867) Bool)

(assert (=> start!39594 (and (array_inv!9024 _values!549) e!252010)))

(declare-fun array_inv!9025 (array!25865) Bool)

(assert (=> start!39594 (array_inv!9025 _keys!709)))

(declare-fun b!424125 () Bool)

(declare-fun res!248028 () Bool)

(assert (=> b!424125 (=> (not res!248028) (not e!252008))))

(assert (=> b!424125 (= res!248028 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12734 _keys!709))))))

(declare-fun mapIsEmpty!18141 () Bool)

(declare-fun mapRes!18141 () Bool)

(assert (=> mapIsEmpty!18141 mapRes!18141))

(declare-fun mapNonEmpty!18141 () Bool)

(declare-fun tp!35112 () Bool)

(declare-fun e!252011 () Bool)

(assert (=> mapNonEmpty!18141 (= mapRes!18141 (and tp!35112 e!252011))))

(declare-fun mapKey!18141 () (_ BitVec 32))

(declare-fun mapValue!18141 () ValueCell!5163)

(declare-fun mapRest!18141 () (Array (_ BitVec 32) ValueCell!5163))

(assert (=> mapNonEmpty!18141 (= (arr!12383 _values!549) (store mapRest!18141 mapKey!18141 mapValue!18141))))

(declare-fun b!424126 () Bool)

(assert (=> b!424126 (= e!252008 e!252009)))

(declare-fun res!248023 () Bool)

(assert (=> b!424126 (=> (not res!248023) (not e!252009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25865 (_ BitVec 32)) Bool)

(assert (=> b!424126 (= res!248023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194306 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!424126 (= lt!194306 (array!25866 (store (arr!12382 _keys!709) i!563 k0!794) (size!12734 _keys!709)))))

(declare-fun b!424127 () Bool)

(declare-fun res!248020 () Bool)

(assert (=> b!424127 (=> (not res!248020) (not e!252008))))

(assert (=> b!424127 (= res!248020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424128 () Bool)

(declare-fun res!248021 () Bool)

(assert (=> b!424128 (=> (not res!248021) (not e!252008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424128 (= res!248021 (validKeyInArray!0 k0!794))))

(declare-fun b!424129 () Bool)

(assert (=> b!424129 (= e!252009 false)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7290 0))(
  ( (tuple2!7291 (_1!3656 (_ BitVec 64)) (_2!3656 V!15789)) )
))
(declare-datatypes ((List!7300 0))(
  ( (Nil!7297) (Cons!7296 (h!8152 tuple2!7290) (t!12744 List!7300)) )
))
(declare-datatypes ((ListLongMap!6203 0))(
  ( (ListLongMap!6204 (toList!3117 List!7300)) )
))
(declare-fun lt!194304 () ListLongMap!6203)

(declare-fun zeroValue!515 () V!15789)

(declare-fun v!412 () V!15789)

(declare-fun minValue!515 () V!15789)

(declare-fun getCurrentListMapNoExtraKeys!1321 (array!25865 array!25867 (_ BitVec 32) (_ BitVec 32) V!15789 V!15789 (_ BitVec 32) Int) ListLongMap!6203)

(assert (=> b!424129 (= lt!194304 (getCurrentListMapNoExtraKeys!1321 lt!194306 (array!25868 (store (arr!12383 _values!549) i!563 (ValueCellFull!5163 v!412)) (size!12735 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194305 () ListLongMap!6203)

(assert (=> b!424129 (= lt!194305 (getCurrentListMapNoExtraKeys!1321 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424130 () Bool)

(assert (=> b!424130 (= e!252010 (and e!252012 mapRes!18141))))

(declare-fun condMapEmpty!18141 () Bool)

(declare-fun mapDefault!18141 () ValueCell!5163)

(assert (=> b!424130 (= condMapEmpty!18141 (= (arr!12383 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5163)) mapDefault!18141)))))

(declare-fun b!424131 () Bool)

(assert (=> b!424131 (= e!252011 tp_is_empty!11013)))

(declare-fun b!424132 () Bool)

(declare-fun res!248030 () Bool)

(assert (=> b!424132 (=> (not res!248030) (not e!252008))))

(declare-fun arrayContainsKey!0 (array!25865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424132 (= res!248030 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424133 () Bool)

(declare-fun res!248031 () Bool)

(assert (=> b!424133 (=> (not res!248031) (not e!252008))))

(assert (=> b!424133 (= res!248031 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7296))))

(assert (= (and start!39594 res!248024) b!424124))

(assert (= (and b!424124 res!248027) b!424119))

(assert (= (and b!424119 res!248025) b!424127))

(assert (= (and b!424127 res!248020) b!424133))

(assert (= (and b!424133 res!248031) b!424125))

(assert (= (and b!424125 res!248028) b!424128))

(assert (= (and b!424128 res!248021) b!424120))

(assert (= (and b!424120 res!248022) b!424132))

(assert (= (and b!424132 res!248030) b!424126))

(assert (= (and b!424126 res!248023) b!424122))

(assert (= (and b!424122 res!248029) b!424123))

(assert (= (and b!424123 res!248026) b!424129))

(assert (= (and b!424130 condMapEmpty!18141) mapIsEmpty!18141))

(assert (= (and b!424130 (not condMapEmpty!18141)) mapNonEmpty!18141))

(get-info :version)

(assert (= (and mapNonEmpty!18141 ((_ is ValueCellFull!5163) mapValue!18141)) b!424131))

(assert (= (and b!424130 ((_ is ValueCellFull!5163) mapDefault!18141)) b!424121))

(assert (= start!39594 b!424130))

(declare-fun m!413373 () Bool)

(assert (=> b!424132 m!413373))

(declare-fun m!413375 () Bool)

(assert (=> b!424126 m!413375))

(declare-fun m!413377 () Bool)

(assert (=> b!424126 m!413377))

(declare-fun m!413379 () Bool)

(assert (=> b!424122 m!413379))

(declare-fun m!413381 () Bool)

(assert (=> b!424133 m!413381))

(declare-fun m!413383 () Bool)

(assert (=> b!424120 m!413383))

(declare-fun m!413385 () Bool)

(assert (=> b!424124 m!413385))

(declare-fun m!413387 () Bool)

(assert (=> b!424128 m!413387))

(declare-fun m!413389 () Bool)

(assert (=> b!424129 m!413389))

(declare-fun m!413391 () Bool)

(assert (=> b!424129 m!413391))

(declare-fun m!413393 () Bool)

(assert (=> b!424129 m!413393))

(declare-fun m!413395 () Bool)

(assert (=> b!424127 m!413395))

(declare-fun m!413397 () Bool)

(assert (=> start!39594 m!413397))

(declare-fun m!413399 () Bool)

(assert (=> start!39594 m!413399))

(declare-fun m!413401 () Bool)

(assert (=> mapNonEmpty!18141 m!413401))

(check-sat (not mapNonEmpty!18141) b_and!17517 (not start!39594) (not b!424122) (not b!424132) (not b!424129) (not b!424128) (not b!424124) (not b!424127) (not b!424133) (not b!424126) (not b_next!9861) tp_is_empty!11013)
(check-sat b_and!17517 (not b_next!9861))
