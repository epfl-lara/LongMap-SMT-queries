; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39338 () Bool)

(assert start!39338)

(declare-fun b_free!9619 () Bool)

(declare-fun b_next!9619 () Bool)

(assert (=> start!39338 (= b_free!9619 (not b_next!9619))))

(declare-fun tp!34385 () Bool)

(declare-fun b_and!17087 () Bool)

(assert (=> start!39338 (= tp!34385 b_and!17087)))

(declare-fun b!417277 () Bool)

(declare-fun e!248932 () Bool)

(assert (=> b!417277 (= e!248932 true)))

(declare-datatypes ((V!15467 0))(
  ( (V!15468 (val!5430 Int)) )
))
(declare-fun lt!191063 () V!15467)

(declare-datatypes ((tuple2!7076 0))(
  ( (tuple2!7077 (_1!3549 (_ BitVec 64)) (_2!3549 V!15467)) )
))
(declare-fun lt!191058 () tuple2!7076)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((List!7076 0))(
  ( (Nil!7073) (Cons!7072 (h!7928 tuple2!7076) (t!12351 List!7076)) )
))
(declare-datatypes ((ListLongMap!5979 0))(
  ( (ListLongMap!5980 (toList!3005 List!7076)) )
))
(declare-fun lt!191061 () ListLongMap!5979)

(declare-fun +!1234 (ListLongMap!5979 tuple2!7076) ListLongMap!5979)

(assert (=> b!417277 (= (+!1234 lt!191061 lt!191058) (+!1234 (+!1234 lt!191061 (tuple2!7077 k0!794 lt!191063)) lt!191058))))

(declare-fun lt!191053 () V!15467)

(assert (=> b!417277 (= lt!191058 (tuple2!7077 k0!794 lt!191053))))

(declare-datatypes ((Unit!12310 0))(
  ( (Unit!12311) )
))
(declare-fun lt!191055 () Unit!12310)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!22 (ListLongMap!5979 (_ BitVec 64) V!15467 V!15467) Unit!12310)

(assert (=> b!417277 (= lt!191055 (addSameAsAddTwiceSameKeyDiffValues!22 lt!191061 k0!794 lt!191063 lt!191053))))

(declare-datatypes ((ValueCell!5042 0))(
  ( (ValueCellFull!5042 (v!7671 V!15467)) (EmptyCell!5042) )
))
(declare-datatypes ((array!25385 0))(
  ( (array!25386 (arr!12142 (Array (_ BitVec 32) ValueCell!5042)) (size!12495 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25385)

(declare-fun lt!191059 () V!15467)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun get!6003 (ValueCell!5042 V!15467) V!15467)

(assert (=> b!417277 (= lt!191063 (get!6003 (select (arr!12142 _values!549) from!863) lt!191059))))

(declare-datatypes ((array!25387 0))(
  ( (array!25388 (arr!12143 (Array (_ BitVec 32) (_ BitVec 64))) (size!12496 (_ BitVec 32))) )
))
(declare-fun lt!191062 () array!25387)

(declare-fun lt!191057 () ListLongMap!5979)

(assert (=> b!417277 (= lt!191057 (+!1234 lt!191061 (tuple2!7077 (select (arr!12143 lt!191062) from!863) lt!191053)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15467)

(assert (=> b!417277 (= lt!191053 (get!6003 (select (store (arr!12142 _values!549) i!563 (ValueCellFull!5042 v!412)) from!863) lt!191059))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!679 (Int (_ BitVec 64)) V!15467)

(assert (=> b!417277 (= lt!191059 (dynLambda!679 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15467)

(declare-fun zeroValue!515 () V!15467)

(declare-fun lt!191054 () array!25385)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1216 (array!25387 array!25385 (_ BitVec 32) (_ BitVec 32) V!15467 V!15467 (_ BitVec 32) Int) ListLongMap!5979)

(assert (=> b!417277 (= lt!191061 (getCurrentListMapNoExtraKeys!1216 lt!191062 lt!191054 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417278 () Bool)

(declare-fun res!243066 () Bool)

(declare-fun e!248940 () Bool)

(assert (=> b!417278 (=> (not res!243066) (not e!248940))))

(declare-fun _keys!709 () array!25387)

(assert (=> b!417278 (= res!243066 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12496 _keys!709))))))

(declare-fun b!417279 () Bool)

(declare-fun res!243060 () Bool)

(assert (=> b!417279 (=> (not res!243060) (not e!248940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417279 (= res!243060 (validKeyInArray!0 k0!794))))

(declare-fun b!417280 () Bool)

(declare-fun res!243062 () Bool)

(assert (=> b!417280 (=> (not res!243062) (not e!248940))))

(assert (=> b!417280 (= res!243062 (and (= (size!12495 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12496 _keys!709) (size!12495 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417281 () Bool)

(declare-fun res!243055 () Bool)

(assert (=> b!417281 (=> (not res!243055) (not e!248940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417281 (= res!243055 (validMask!0 mask!1025))))

(declare-fun b!417282 () Bool)

(declare-fun e!248934 () Bool)

(declare-fun tp_is_empty!10771 () Bool)

(assert (=> b!417282 (= e!248934 tp_is_empty!10771)))

(declare-fun b!417283 () Bool)

(declare-fun e!248935 () Bool)

(assert (=> b!417283 (= e!248935 tp_is_empty!10771)))

(declare-fun res!243065 () Bool)

(assert (=> start!39338 (=> (not res!243065) (not e!248940))))

(assert (=> start!39338 (= res!243065 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12496 _keys!709))))))

(assert (=> start!39338 e!248940))

(assert (=> start!39338 tp_is_empty!10771))

(assert (=> start!39338 tp!34385))

(assert (=> start!39338 true))

(declare-fun e!248933 () Bool)

(declare-fun array_inv!8900 (array!25385) Bool)

(assert (=> start!39338 (and (array_inv!8900 _values!549) e!248933)))

(declare-fun array_inv!8901 (array!25387) Bool)

(assert (=> start!39338 (array_inv!8901 _keys!709)))

(declare-fun b!417284 () Bool)

(declare-fun res!243059 () Bool)

(assert (=> b!417284 (=> (not res!243059) (not e!248940))))

(assert (=> b!417284 (= res!243059 (or (= (select (arr!12143 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12143 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17778 () Bool)

(declare-fun mapRes!17778 () Bool)

(assert (=> mapIsEmpty!17778 mapRes!17778))

(declare-fun b!417285 () Bool)

(declare-fun e!248937 () Bool)

(declare-fun call!29010 () ListLongMap!5979)

(declare-fun call!29011 () ListLongMap!5979)

(assert (=> b!417285 (= e!248937 (= call!29010 call!29011))))

(declare-fun b!417286 () Bool)

(declare-fun e!248939 () Bool)

(assert (=> b!417286 (= e!248939 (not e!248932))))

(declare-fun res!243064 () Bool)

(assert (=> b!417286 (=> res!243064 e!248932)))

(assert (=> b!417286 (= res!243064 (validKeyInArray!0 (select (arr!12143 _keys!709) from!863)))))

(assert (=> b!417286 e!248937))

(declare-fun c!55071 () Bool)

(assert (=> b!417286 (= c!55071 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191060 () Unit!12310)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!413 (array!25387 array!25385 (_ BitVec 32) (_ BitVec 32) V!15467 V!15467 (_ BitVec 32) (_ BitVec 64) V!15467 (_ BitVec 32) Int) Unit!12310)

(assert (=> b!417286 (= lt!191060 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!413 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417287 () Bool)

(declare-fun e!248938 () Bool)

(assert (=> b!417287 (= e!248940 e!248938)))

(declare-fun res!243063 () Bool)

(assert (=> b!417287 (=> (not res!243063) (not e!248938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25387 (_ BitVec 32)) Bool)

(assert (=> b!417287 (= res!243063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191062 mask!1025))))

(assert (=> b!417287 (= lt!191062 (array!25388 (store (arr!12143 _keys!709) i!563 k0!794) (size!12496 _keys!709)))))

(declare-fun b!417288 () Bool)

(declare-fun res!243054 () Bool)

(assert (=> b!417288 (=> (not res!243054) (not e!248940))))

(declare-fun arrayContainsKey!0 (array!25387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417288 (= res!243054 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17778 () Bool)

(declare-fun tp!34386 () Bool)

(assert (=> mapNonEmpty!17778 (= mapRes!17778 (and tp!34386 e!248934))))

(declare-fun mapValue!17778 () ValueCell!5042)

(declare-fun mapRest!17778 () (Array (_ BitVec 32) ValueCell!5042))

(declare-fun mapKey!17778 () (_ BitVec 32))

(assert (=> mapNonEmpty!17778 (= (arr!12142 _values!549) (store mapRest!17778 mapKey!17778 mapValue!17778))))

(declare-fun b!417289 () Bool)

(declare-fun res!243056 () Bool)

(assert (=> b!417289 (=> (not res!243056) (not e!248938))))

(assert (=> b!417289 (= res!243056 (bvsle from!863 i!563))))

(declare-fun b!417290 () Bool)

(declare-fun res!243061 () Bool)

(assert (=> b!417290 (=> (not res!243061) (not e!248940))))

(declare-datatypes ((List!7077 0))(
  ( (Nil!7074) (Cons!7073 (h!7929 (_ BitVec 64)) (t!12352 List!7077)) )
))
(declare-fun arrayNoDuplicates!0 (array!25387 (_ BitVec 32) List!7077) Bool)

(assert (=> b!417290 (= res!243061 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7074))))

(declare-fun bm!29007 () Bool)

(assert (=> bm!29007 (= call!29010 (getCurrentListMapNoExtraKeys!1216 (ite c!55071 _keys!709 lt!191062) (ite c!55071 _values!549 lt!191054) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417291 () Bool)

(assert (=> b!417291 (= e!248937 (= call!29011 (+!1234 call!29010 (tuple2!7077 k0!794 v!412))))))

(declare-fun b!417292 () Bool)

(assert (=> b!417292 (= e!248938 e!248939)))

(declare-fun res!243057 () Bool)

(assert (=> b!417292 (=> (not res!243057) (not e!248939))))

(assert (=> b!417292 (= res!243057 (= from!863 i!563))))

(assert (=> b!417292 (= lt!191057 (getCurrentListMapNoExtraKeys!1216 lt!191062 lt!191054 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417292 (= lt!191054 (array!25386 (store (arr!12142 _values!549) i!563 (ValueCellFull!5042 v!412)) (size!12495 _values!549)))))

(declare-fun lt!191056 () ListLongMap!5979)

(assert (=> b!417292 (= lt!191056 (getCurrentListMapNoExtraKeys!1216 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417293 () Bool)

(assert (=> b!417293 (= e!248933 (and e!248935 mapRes!17778))))

(declare-fun condMapEmpty!17778 () Bool)

(declare-fun mapDefault!17778 () ValueCell!5042)

(assert (=> b!417293 (= condMapEmpty!17778 (= (arr!12142 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5042)) mapDefault!17778)))))

(declare-fun b!417294 () Bool)

(declare-fun res!243058 () Bool)

(assert (=> b!417294 (=> (not res!243058) (not e!248938))))

(assert (=> b!417294 (= res!243058 (arrayNoDuplicates!0 lt!191062 #b00000000000000000000000000000000 Nil!7074))))

(declare-fun bm!29008 () Bool)

(assert (=> bm!29008 (= call!29011 (getCurrentListMapNoExtraKeys!1216 (ite c!55071 lt!191062 _keys!709) (ite c!55071 lt!191054 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417295 () Bool)

(declare-fun res!243053 () Bool)

(assert (=> b!417295 (=> (not res!243053) (not e!248940))))

(assert (=> b!417295 (= res!243053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39338 res!243065) b!417281))

(assert (= (and b!417281 res!243055) b!417280))

(assert (= (and b!417280 res!243062) b!417295))

(assert (= (and b!417295 res!243053) b!417290))

(assert (= (and b!417290 res!243061) b!417278))

(assert (= (and b!417278 res!243066) b!417279))

(assert (= (and b!417279 res!243060) b!417284))

(assert (= (and b!417284 res!243059) b!417288))

(assert (= (and b!417288 res!243054) b!417287))

(assert (= (and b!417287 res!243063) b!417294))

(assert (= (and b!417294 res!243058) b!417289))

(assert (= (and b!417289 res!243056) b!417292))

(assert (= (and b!417292 res!243057) b!417286))

(assert (= (and b!417286 c!55071) b!417291))

(assert (= (and b!417286 (not c!55071)) b!417285))

(assert (= (or b!417291 b!417285) bm!29008))

(assert (= (or b!417291 b!417285) bm!29007))

(assert (= (and b!417286 (not res!243064)) b!417277))

(assert (= (and b!417293 condMapEmpty!17778) mapIsEmpty!17778))

(assert (= (and b!417293 (not condMapEmpty!17778)) mapNonEmpty!17778))

(get-info :version)

(assert (= (and mapNonEmpty!17778 ((_ is ValueCellFull!5042) mapValue!17778)) b!417282))

(assert (= (and b!417293 ((_ is ValueCellFull!5042) mapDefault!17778)) b!417283))

(assert (= start!39338 b!417293))

(declare-fun b_lambda!8905 () Bool)

(assert (=> (not b_lambda!8905) (not b!417277)))

(declare-fun t!12350 () Bool)

(declare-fun tb!3233 () Bool)

(assert (=> (and start!39338 (= defaultEntry!557 defaultEntry!557) t!12350) tb!3233))

(declare-fun result!6001 () Bool)

(assert (=> tb!3233 (= result!6001 tp_is_empty!10771)))

(assert (=> b!417277 t!12350))

(declare-fun b_and!17089 () Bool)

(assert (= b_and!17087 (and (=> t!12350 result!6001) b_and!17089)))

(declare-fun m!406101 () Bool)

(assert (=> b!417292 m!406101))

(declare-fun m!406103 () Bool)

(assert (=> b!417292 m!406103))

(declare-fun m!406105 () Bool)

(assert (=> b!417292 m!406105))

(declare-fun m!406107 () Bool)

(assert (=> mapNonEmpty!17778 m!406107))

(declare-fun m!406109 () Bool)

(assert (=> b!417286 m!406109))

(assert (=> b!417286 m!406109))

(declare-fun m!406111 () Bool)

(assert (=> b!417286 m!406111))

(declare-fun m!406113 () Bool)

(assert (=> b!417286 m!406113))

(declare-fun m!406115 () Bool)

(assert (=> b!417284 m!406115))

(declare-fun m!406117 () Bool)

(assert (=> b!417288 m!406117))

(declare-fun m!406119 () Bool)

(assert (=> start!39338 m!406119))

(declare-fun m!406121 () Bool)

(assert (=> start!39338 m!406121))

(declare-fun m!406123 () Bool)

(assert (=> bm!29007 m!406123))

(declare-fun m!406125 () Bool)

(assert (=> b!417295 m!406125))

(declare-fun m!406127 () Bool)

(assert (=> b!417290 m!406127))

(declare-fun m!406129 () Bool)

(assert (=> bm!29008 m!406129))

(declare-fun m!406131 () Bool)

(assert (=> b!417287 m!406131))

(declare-fun m!406133 () Bool)

(assert (=> b!417287 m!406133))

(declare-fun m!406135 () Bool)

(assert (=> b!417279 m!406135))

(declare-fun m!406137 () Bool)

(assert (=> b!417291 m!406137))

(declare-fun m!406139 () Bool)

(assert (=> b!417277 m!406139))

(declare-fun m!406141 () Bool)

(assert (=> b!417277 m!406141))

(declare-fun m!406143 () Bool)

(assert (=> b!417277 m!406143))

(declare-fun m!406145 () Bool)

(assert (=> b!417277 m!406145))

(declare-fun m!406147 () Bool)

(assert (=> b!417277 m!406147))

(assert (=> b!417277 m!406103))

(assert (=> b!417277 m!406139))

(declare-fun m!406149 () Bool)

(assert (=> b!417277 m!406149))

(declare-fun m!406151 () Bool)

(assert (=> b!417277 m!406151))

(declare-fun m!406153 () Bool)

(assert (=> b!417277 m!406153))

(declare-fun m!406155 () Bool)

(assert (=> b!417277 m!406155))

(assert (=> b!417277 m!406141))

(declare-fun m!406157 () Bool)

(assert (=> b!417277 m!406157))

(assert (=> b!417277 m!406151))

(declare-fun m!406159 () Bool)

(assert (=> b!417277 m!406159))

(declare-fun m!406161 () Bool)

(assert (=> b!417277 m!406161))

(declare-fun m!406163 () Bool)

(assert (=> b!417294 m!406163))

(declare-fun m!406165 () Bool)

(assert (=> b!417281 m!406165))

(check-sat (not b!417292) tp_is_empty!10771 (not b!417295) (not b_next!9619) (not b!417288) (not b!417294) (not b!417277) (not b!417290) (not start!39338) (not b!417291) (not bm!29008) (not bm!29007) (not b!417281) (not b!417287) (not b!417286) b_and!17089 (not b!417279) (not mapNonEmpty!17778) (not b_lambda!8905))
(check-sat b_and!17089 (not b_next!9619))
