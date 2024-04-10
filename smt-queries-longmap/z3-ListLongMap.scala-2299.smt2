; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37258 () Bool)

(assert start!37258)

(declare-fun b_free!8385 () Bool)

(declare-fun b_next!8385 () Bool)

(assert (=> start!37258 (= b_free!8385 (not b_next!8385))))

(declare-fun tp!29871 () Bool)

(declare-fun b_and!15627 () Bool)

(assert (=> start!37258 (= tp!29871 b_and!15627)))

(declare-fun b!377106 () Bool)

(declare-fun e!229620 () Bool)

(declare-fun tp_is_empty!9033 () Bool)

(assert (=> b!377106 (= e!229620 tp_is_empty!9033)))

(declare-fun b!377107 () Bool)

(declare-fun e!229619 () Bool)

(declare-fun mapRes!15114 () Bool)

(assert (=> b!377107 (= e!229619 (and e!229620 mapRes!15114))))

(declare-fun condMapEmpty!15114 () Bool)

(declare-datatypes ((V!13149 0))(
  ( (V!13150 (val!4561 Int)) )
))
(declare-datatypes ((ValueCell!4173 0))(
  ( (ValueCellFull!4173 (v!6758 V!13149)) (EmptyCell!4173) )
))
(declare-datatypes ((array!21995 0))(
  ( (array!21996 (arr!10466 (Array (_ BitVec 32) ValueCell!4173)) (size!10818 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21995)

(declare-fun mapDefault!15114 () ValueCell!4173)

(assert (=> b!377107 (= condMapEmpty!15114 (= (arr!10466 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4173)) mapDefault!15114)))))

(declare-fun b!377108 () Bool)

(declare-fun e!229621 () Bool)

(assert (=> b!377108 (= e!229621 true)))

(declare-datatypes ((tuple2!6076 0))(
  ( (tuple2!6077 (_1!3049 (_ BitVec 64)) (_2!3049 V!13149)) )
))
(declare-datatypes ((List!5918 0))(
  ( (Nil!5915) (Cons!5914 (h!6770 tuple2!6076) (t!11068 List!5918)) )
))
(declare-datatypes ((ListLongMap!4989 0))(
  ( (ListLongMap!4990 (toList!2510 List!5918)) )
))
(declare-fun lt!175209 () ListLongMap!4989)

(declare-fun lt!175215 () ListLongMap!4989)

(declare-fun lt!175213 () tuple2!6076)

(declare-fun +!856 (ListLongMap!4989 tuple2!6076) ListLongMap!4989)

(assert (=> b!377108 (= lt!175209 (+!856 lt!175215 lt!175213))))

(declare-datatypes ((Unit!11616 0))(
  ( (Unit!11617) )
))
(declare-fun lt!175216 () Unit!11616)

(declare-fun v!373 () V!13149)

(declare-fun lt!175210 () ListLongMap!4989)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13149)

(declare-fun addCommutativeForDiffKeys!266 (ListLongMap!4989 (_ BitVec 64) V!13149 (_ BitVec 64) V!13149) Unit!11616)

(assert (=> b!377108 (= lt!175216 (addCommutativeForDiffKeys!266 lt!175210 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!15114 () Bool)

(assert (=> mapIsEmpty!15114 mapRes!15114))

(declare-fun b!377109 () Bool)

(declare-fun res!213283 () Bool)

(declare-fun e!229622 () Bool)

(assert (=> b!377109 (=> (not res!213283) (not e!229622))))

(declare-datatypes ((array!21997 0))(
  ( (array!21998 (arr!10467 (Array (_ BitVec 32) (_ BitVec 64))) (size!10819 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21997)

(declare-fun arrayContainsKey!0 (array!21997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377109 (= res!213283 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377110 () Bool)

(declare-fun e!229616 () Bool)

(assert (=> b!377110 (= e!229616 e!229621)))

(declare-fun res!213284 () Bool)

(assert (=> b!377110 (=> res!213284 e!229621)))

(assert (=> b!377110 (= res!213284 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175212 () ListLongMap!4989)

(assert (=> b!377110 (= lt!175212 lt!175209)))

(declare-fun lt!175217 () ListLongMap!4989)

(declare-fun lt!175214 () tuple2!6076)

(assert (=> b!377110 (= lt!175209 (+!856 lt!175217 lt!175214))))

(declare-fun lt!175218 () ListLongMap!4989)

(assert (=> b!377110 (= lt!175218 lt!175215)))

(assert (=> b!377110 (= lt!175215 (+!856 lt!175210 lt!175214))))

(declare-fun lt!175208 () ListLongMap!4989)

(assert (=> b!377110 (= lt!175212 (+!856 lt!175208 lt!175214))))

(assert (=> b!377110 (= lt!175214 (tuple2!6077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15114 () Bool)

(declare-fun tp!29870 () Bool)

(declare-fun e!229617 () Bool)

(assert (=> mapNonEmpty!15114 (= mapRes!15114 (and tp!29870 e!229617))))

(declare-fun mapKey!15114 () (_ BitVec 32))

(declare-fun mapRest!15114 () (Array (_ BitVec 32) ValueCell!4173))

(declare-fun mapValue!15114 () ValueCell!4173)

(assert (=> mapNonEmpty!15114 (= (arr!10466 _values!506) (store mapRest!15114 mapKey!15114 mapValue!15114))))

(declare-fun b!377112 () Bool)

(declare-fun res!213280 () Bool)

(assert (=> b!377112 (=> (not res!213280) (not e!229622))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377112 (= res!213280 (or (= (select (arr!10467 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10467 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377113 () Bool)

(declare-fun res!213287 () Bool)

(assert (=> b!377113 (=> (not res!213287) (not e!229622))))

(declare-datatypes ((List!5919 0))(
  ( (Nil!5916) (Cons!5915 (h!6771 (_ BitVec 64)) (t!11069 List!5919)) )
))
(declare-fun arrayNoDuplicates!0 (array!21997 (_ BitVec 32) List!5919) Bool)

(assert (=> b!377113 (= res!213287 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5916))))

(declare-fun b!377114 () Bool)

(declare-fun res!213282 () Bool)

(assert (=> b!377114 (=> (not res!213282) (not e!229622))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!377114 (= res!213282 (and (= (size!10818 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10819 _keys!658) (size!10818 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377115 () Bool)

(assert (=> b!377115 (= e!229617 tp_is_empty!9033)))

(declare-fun b!377116 () Bool)

(declare-fun res!213285 () Bool)

(assert (=> b!377116 (=> (not res!213285) (not e!229622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21997 (_ BitVec 32)) Bool)

(assert (=> b!377116 (= res!213285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377117 () Bool)

(declare-fun e!229618 () Bool)

(assert (=> b!377117 (= e!229618 (not e!229616))))

(declare-fun res!213281 () Bool)

(assert (=> b!377117 (=> res!213281 e!229616)))

(assert (=> b!377117 (= res!213281 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13149)

(declare-fun getCurrentListMap!1942 (array!21997 array!21995 (_ BitVec 32) (_ BitVec 32) V!13149 V!13149 (_ BitVec 32) Int) ListLongMap!4989)

(assert (=> b!377117 (= lt!175218 (getCurrentListMap!1942 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175211 () array!21995)

(declare-fun lt!175207 () array!21997)

(assert (=> b!377117 (= lt!175212 (getCurrentListMap!1942 lt!175207 lt!175211 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377117 (and (= lt!175208 lt!175217) (= lt!175217 lt!175208))))

(assert (=> b!377117 (= lt!175217 (+!856 lt!175210 lt!175213))))

(assert (=> b!377117 (= lt!175213 (tuple2!6077 k0!778 v!373))))

(declare-fun lt!175206 () Unit!11616)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!100 (array!21997 array!21995 (_ BitVec 32) (_ BitVec 32) V!13149 V!13149 (_ BitVec 32) (_ BitVec 64) V!13149 (_ BitVec 32) Int) Unit!11616)

(assert (=> b!377117 (= lt!175206 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!100 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!776 (array!21997 array!21995 (_ BitVec 32) (_ BitVec 32) V!13149 V!13149 (_ BitVec 32) Int) ListLongMap!4989)

(assert (=> b!377117 (= lt!175208 (getCurrentListMapNoExtraKeys!776 lt!175207 lt!175211 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377117 (= lt!175211 (array!21996 (store (arr!10466 _values!506) i!548 (ValueCellFull!4173 v!373)) (size!10818 _values!506)))))

(assert (=> b!377117 (= lt!175210 (getCurrentListMapNoExtraKeys!776 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377118 () Bool)

(assert (=> b!377118 (= e!229622 e!229618)))

(declare-fun res!213279 () Bool)

(assert (=> b!377118 (=> (not res!213279) (not e!229618))))

(assert (=> b!377118 (= res!213279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175207 mask!970))))

(assert (=> b!377118 (= lt!175207 (array!21998 (store (arr!10467 _keys!658) i!548 k0!778) (size!10819 _keys!658)))))

(declare-fun res!213290 () Bool)

(assert (=> start!37258 (=> (not res!213290) (not e!229622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37258 (= res!213290 (validMask!0 mask!970))))

(assert (=> start!37258 e!229622))

(declare-fun array_inv!7712 (array!21995) Bool)

(assert (=> start!37258 (and (array_inv!7712 _values!506) e!229619)))

(assert (=> start!37258 tp!29871))

(assert (=> start!37258 true))

(assert (=> start!37258 tp_is_empty!9033))

(declare-fun array_inv!7713 (array!21997) Bool)

(assert (=> start!37258 (array_inv!7713 _keys!658)))

(declare-fun b!377111 () Bool)

(declare-fun res!213286 () Bool)

(assert (=> b!377111 (=> (not res!213286) (not e!229622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377111 (= res!213286 (validKeyInArray!0 k0!778))))

(declare-fun b!377119 () Bool)

(declare-fun res!213289 () Bool)

(assert (=> b!377119 (=> (not res!213289) (not e!229618))))

(assert (=> b!377119 (= res!213289 (arrayNoDuplicates!0 lt!175207 #b00000000000000000000000000000000 Nil!5916))))

(declare-fun b!377120 () Bool)

(declare-fun res!213288 () Bool)

(assert (=> b!377120 (=> (not res!213288) (not e!229622))))

(assert (=> b!377120 (= res!213288 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10819 _keys!658))))))

(assert (= (and start!37258 res!213290) b!377114))

(assert (= (and b!377114 res!213282) b!377116))

(assert (= (and b!377116 res!213285) b!377113))

(assert (= (and b!377113 res!213287) b!377120))

(assert (= (and b!377120 res!213288) b!377111))

(assert (= (and b!377111 res!213286) b!377112))

(assert (= (and b!377112 res!213280) b!377109))

(assert (= (and b!377109 res!213283) b!377118))

(assert (= (and b!377118 res!213279) b!377119))

(assert (= (and b!377119 res!213289) b!377117))

(assert (= (and b!377117 (not res!213281)) b!377110))

(assert (= (and b!377110 (not res!213284)) b!377108))

(assert (= (and b!377107 condMapEmpty!15114) mapIsEmpty!15114))

(assert (= (and b!377107 (not condMapEmpty!15114)) mapNonEmpty!15114))

(get-info :version)

(assert (= (and mapNonEmpty!15114 ((_ is ValueCellFull!4173) mapValue!15114)) b!377115))

(assert (= (and b!377107 ((_ is ValueCellFull!4173) mapDefault!15114)) b!377106))

(assert (= start!37258 b!377107))

(declare-fun m!373851 () Bool)

(assert (=> b!377117 m!373851))

(declare-fun m!373853 () Bool)

(assert (=> b!377117 m!373853))

(declare-fun m!373855 () Bool)

(assert (=> b!377117 m!373855))

(declare-fun m!373857 () Bool)

(assert (=> b!377117 m!373857))

(declare-fun m!373859 () Bool)

(assert (=> b!377117 m!373859))

(declare-fun m!373861 () Bool)

(assert (=> b!377117 m!373861))

(declare-fun m!373863 () Bool)

(assert (=> b!377117 m!373863))

(declare-fun m!373865 () Bool)

(assert (=> start!37258 m!373865))

(declare-fun m!373867 () Bool)

(assert (=> start!37258 m!373867))

(declare-fun m!373869 () Bool)

(assert (=> start!37258 m!373869))

(declare-fun m!373871 () Bool)

(assert (=> b!377112 m!373871))

(declare-fun m!373873 () Bool)

(assert (=> b!377111 m!373873))

(declare-fun m!373875 () Bool)

(assert (=> b!377113 m!373875))

(declare-fun m!373877 () Bool)

(assert (=> b!377119 m!373877))

(declare-fun m!373879 () Bool)

(assert (=> b!377110 m!373879))

(declare-fun m!373881 () Bool)

(assert (=> b!377110 m!373881))

(declare-fun m!373883 () Bool)

(assert (=> b!377110 m!373883))

(declare-fun m!373885 () Bool)

(assert (=> b!377118 m!373885))

(declare-fun m!373887 () Bool)

(assert (=> b!377118 m!373887))

(declare-fun m!373889 () Bool)

(assert (=> b!377116 m!373889))

(declare-fun m!373891 () Bool)

(assert (=> mapNonEmpty!15114 m!373891))

(declare-fun m!373893 () Bool)

(assert (=> b!377108 m!373893))

(declare-fun m!373895 () Bool)

(assert (=> b!377108 m!373895))

(declare-fun m!373897 () Bool)

(assert (=> b!377109 m!373897))

(check-sat tp_is_empty!9033 (not b!377113) b_and!15627 (not b!377116) (not b!377108) (not b!377119) (not b!377109) (not b!377110) (not b!377111) (not start!37258) (not b!377118) (not mapNonEmpty!15114) (not b_next!8385) (not b!377117))
(check-sat b_and!15627 (not b_next!8385))
