; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39300 () Bool)

(assert start!39300)

(declare-fun b_free!9567 () Bool)

(declare-fun b_next!9567 () Bool)

(assert (=> start!39300 (= b_free!9567 (not b_next!9567))))

(declare-fun tp!34230 () Bool)

(declare-fun b_and!17009 () Bool)

(assert (=> start!39300 (= tp!34230 b_and!17009)))

(declare-fun b!416014 () Bool)

(declare-fun e!248410 () Bool)

(declare-fun tp_is_empty!10719 () Bool)

(assert (=> b!416014 (= e!248410 tp_is_empty!10719)))

(declare-fun b!416015 () Bool)

(declare-fun res!242097 () Bool)

(declare-fun e!248408 () Bool)

(assert (=> b!416015 (=> (not res!242097) (not e!248408))))

(declare-datatypes ((array!25293 0))(
  ( (array!25294 (arr!12096 (Array (_ BitVec 32) (_ BitVec 64))) (size!12448 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25293)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416015 (= res!242097 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416016 () Bool)

(declare-fun res!242090 () Bool)

(assert (=> b!416016 (=> (not res!242090) (not e!248408))))

(declare-datatypes ((List!7062 0))(
  ( (Nil!7059) (Cons!7058 (h!7914 (_ BitVec 64)) (t!12294 List!7062)) )
))
(declare-fun arrayNoDuplicates!0 (array!25293 (_ BitVec 32) List!7062) Bool)

(assert (=> b!416016 (= res!242090 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7059))))

(declare-datatypes ((V!15397 0))(
  ( (V!15398 (val!5404 Int)) )
))
(declare-fun minValue!515 () V!15397)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7042 0))(
  ( (tuple2!7043 (_1!3532 (_ BitVec 64)) (_2!3532 V!15397)) )
))
(declare-datatypes ((List!7063 0))(
  ( (Nil!7060) (Cons!7059 (h!7915 tuple2!7042) (t!12295 List!7063)) )
))
(declare-datatypes ((ListLongMap!5955 0))(
  ( (ListLongMap!5956 (toList!2993 List!7063)) )
))
(declare-fun call!28879 () ListLongMap!5955)

(declare-fun bm!28876 () Bool)

(declare-fun c!55064 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5016 0))(
  ( (ValueCellFull!5016 (v!7651 V!15397)) (EmptyCell!5016) )
))
(declare-datatypes ((array!25295 0))(
  ( (array!25296 (arr!12097 (Array (_ BitVec 32) ValueCell!5016)) (size!12449 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25295)

(declare-fun lt!190437 () array!25295)

(declare-fun lt!190432 () array!25293)

(declare-fun zeroValue!515 () V!15397)

(declare-fun getCurrentListMapNoExtraKeys!1198 (array!25293 array!25295 (_ BitVec 32) (_ BitVec 32) V!15397 V!15397 (_ BitVec 32) Int) ListLongMap!5955)

(assert (=> bm!28876 (= call!28879 (getCurrentListMapNoExtraKeys!1198 (ite c!55064 _keys!709 lt!190432) (ite c!55064 _values!549 lt!190437) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416017 () Bool)

(declare-fun res!242100 () Bool)

(assert (=> b!416017 (=> (not res!242100) (not e!248408))))

(assert (=> b!416017 (= res!242100 (and (= (size!12449 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12448 _keys!709) (size!12449 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416018 () Bool)

(declare-fun e!248404 () Bool)

(declare-fun mapRes!17700 () Bool)

(assert (=> b!416018 (= e!248404 (and e!248410 mapRes!17700))))

(declare-fun condMapEmpty!17700 () Bool)

(declare-fun mapDefault!17700 () ValueCell!5016)

(assert (=> b!416018 (= condMapEmpty!17700 (= (arr!12097 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5016)) mapDefault!17700)))))

(declare-fun e!248409 () Bool)

(declare-fun call!28880 () ListLongMap!5955)

(declare-fun b!416019 () Bool)

(declare-fun v!412 () V!15397)

(declare-fun +!1195 (ListLongMap!5955 tuple2!7042) ListLongMap!5955)

(assert (=> b!416019 (= e!248409 (= call!28880 (+!1195 call!28879 (tuple2!7043 k0!794 v!412))))))

(declare-fun res!242095 () Bool)

(assert (=> start!39300 (=> (not res!242095) (not e!248408))))

(assert (=> start!39300 (= res!242095 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12448 _keys!709))))))

(assert (=> start!39300 e!248408))

(assert (=> start!39300 tp_is_empty!10719))

(assert (=> start!39300 tp!34230))

(assert (=> start!39300 true))

(declare-fun array_inv!8824 (array!25295) Bool)

(assert (=> start!39300 (and (array_inv!8824 _values!549) e!248404)))

(declare-fun array_inv!8825 (array!25293) Bool)

(assert (=> start!39300 (array_inv!8825 _keys!709)))

(declare-fun b!416020 () Bool)

(declare-fun res!242091 () Bool)

(assert (=> b!416020 (=> (not res!242091) (not e!248408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416020 (= res!242091 (validKeyInArray!0 k0!794))))

(declare-fun b!416021 () Bool)

(declare-fun e!248411 () Bool)

(declare-fun e!248406 () Bool)

(assert (=> b!416021 (= e!248411 (not e!248406))))

(declare-fun res!242096 () Bool)

(assert (=> b!416021 (=> res!242096 e!248406)))

(assert (=> b!416021 (= res!242096 (validKeyInArray!0 (select (arr!12096 _keys!709) from!863)))))

(assert (=> b!416021 e!248409))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416021 (= c!55064 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12296 0))(
  ( (Unit!12297) )
))
(declare-fun lt!190438 () Unit!12296)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!406 (array!25293 array!25295 (_ BitVec 32) (_ BitVec 32) V!15397 V!15397 (_ BitVec 32) (_ BitVec 64) V!15397 (_ BitVec 32) Int) Unit!12296)

(assert (=> b!416021 (= lt!190438 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!406 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416022 () Bool)

(declare-fun res!242099 () Bool)

(declare-fun e!248407 () Bool)

(assert (=> b!416022 (=> (not res!242099) (not e!248407))))

(assert (=> b!416022 (= res!242099 (arrayNoDuplicates!0 lt!190432 #b00000000000000000000000000000000 Nil!7059))))

(declare-fun b!416023 () Bool)

(declare-fun e!248412 () Bool)

(assert (=> b!416023 (= e!248412 tp_is_empty!10719)))

(declare-fun b!416024 () Bool)

(declare-fun res!242094 () Bool)

(assert (=> b!416024 (=> (not res!242094) (not e!248408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416024 (= res!242094 (validMask!0 mask!1025))))

(declare-fun b!416025 () Bool)

(declare-fun res!242102 () Bool)

(assert (=> b!416025 (=> (not res!242102) (not e!248407))))

(assert (=> b!416025 (= res!242102 (bvsle from!863 i!563))))

(declare-fun b!416026 () Bool)

(declare-fun res!242092 () Bool)

(assert (=> b!416026 (=> (not res!242092) (not e!248408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25293 (_ BitVec 32)) Bool)

(assert (=> b!416026 (= res!242092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416027 () Bool)

(assert (=> b!416027 (= e!248406 true)))

(declare-fun lt!190439 () V!15397)

(declare-fun lt!190436 () ListLongMap!5955)

(declare-fun lt!190429 () tuple2!7042)

(assert (=> b!416027 (= (+!1195 lt!190436 lt!190429) (+!1195 (+!1195 lt!190436 (tuple2!7043 k0!794 lt!190439)) lt!190429))))

(declare-fun lt!190433 () V!15397)

(assert (=> b!416027 (= lt!190429 (tuple2!7043 k0!794 lt!190433))))

(declare-fun lt!190430 () Unit!12296)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!1 (ListLongMap!5955 (_ BitVec 64) V!15397 V!15397) Unit!12296)

(assert (=> b!416027 (= lt!190430 (addSameAsAddTwiceSameKeyDiffValues!1 lt!190436 k0!794 lt!190439 lt!190433))))

(declare-fun lt!190435 () V!15397)

(declare-fun get!5975 (ValueCell!5016 V!15397) V!15397)

(assert (=> b!416027 (= lt!190439 (get!5975 (select (arr!12097 _values!549) from!863) lt!190435))))

(declare-fun lt!190434 () ListLongMap!5955)

(assert (=> b!416027 (= lt!190434 (+!1195 lt!190436 (tuple2!7043 (select (arr!12096 lt!190432) from!863) lt!190433)))))

(assert (=> b!416027 (= lt!190433 (get!5975 (select (store (arr!12097 _values!549) i!563 (ValueCellFull!5016 v!412)) from!863) lt!190435))))

(declare-fun dynLambda!672 (Int (_ BitVec 64)) V!15397)

(assert (=> b!416027 (= lt!190435 (dynLambda!672 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416027 (= lt!190436 (getCurrentListMapNoExtraKeys!1198 lt!190432 lt!190437 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17700 () Bool)

(assert (=> mapIsEmpty!17700 mapRes!17700))

(declare-fun bm!28877 () Bool)

(assert (=> bm!28877 (= call!28880 (getCurrentListMapNoExtraKeys!1198 (ite c!55064 lt!190432 _keys!709) (ite c!55064 lt!190437 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17700 () Bool)

(declare-fun tp!34229 () Bool)

(assert (=> mapNonEmpty!17700 (= mapRes!17700 (and tp!34229 e!248412))))

(declare-fun mapValue!17700 () ValueCell!5016)

(declare-fun mapKey!17700 () (_ BitVec 32))

(declare-fun mapRest!17700 () (Array (_ BitVec 32) ValueCell!5016))

(assert (=> mapNonEmpty!17700 (= (arr!12097 _values!549) (store mapRest!17700 mapKey!17700 mapValue!17700))))

(declare-fun b!416028 () Bool)

(assert (=> b!416028 (= e!248409 (= call!28879 call!28880))))

(declare-fun b!416029 () Bool)

(assert (=> b!416029 (= e!248407 e!248411)))

(declare-fun res!242098 () Bool)

(assert (=> b!416029 (=> (not res!242098) (not e!248411))))

(assert (=> b!416029 (= res!242098 (= from!863 i!563))))

(assert (=> b!416029 (= lt!190434 (getCurrentListMapNoExtraKeys!1198 lt!190432 lt!190437 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416029 (= lt!190437 (array!25296 (store (arr!12097 _values!549) i!563 (ValueCellFull!5016 v!412)) (size!12449 _values!549)))))

(declare-fun lt!190431 () ListLongMap!5955)

(assert (=> b!416029 (= lt!190431 (getCurrentListMapNoExtraKeys!1198 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416030 () Bool)

(declare-fun res!242093 () Bool)

(assert (=> b!416030 (=> (not res!242093) (not e!248408))))

(assert (=> b!416030 (= res!242093 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12448 _keys!709))))))

(declare-fun b!416031 () Bool)

(assert (=> b!416031 (= e!248408 e!248407)))

(declare-fun res!242101 () Bool)

(assert (=> b!416031 (=> (not res!242101) (not e!248407))))

(assert (=> b!416031 (= res!242101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190432 mask!1025))))

(assert (=> b!416031 (= lt!190432 (array!25294 (store (arr!12096 _keys!709) i!563 k0!794) (size!12448 _keys!709)))))

(declare-fun b!416032 () Bool)

(declare-fun res!242103 () Bool)

(assert (=> b!416032 (=> (not res!242103) (not e!248408))))

(assert (=> b!416032 (= res!242103 (or (= (select (arr!12096 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12096 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39300 res!242095) b!416024))

(assert (= (and b!416024 res!242094) b!416017))

(assert (= (and b!416017 res!242100) b!416026))

(assert (= (and b!416026 res!242092) b!416016))

(assert (= (and b!416016 res!242090) b!416030))

(assert (= (and b!416030 res!242093) b!416020))

(assert (= (and b!416020 res!242091) b!416032))

(assert (= (and b!416032 res!242103) b!416015))

(assert (= (and b!416015 res!242097) b!416031))

(assert (= (and b!416031 res!242101) b!416022))

(assert (= (and b!416022 res!242099) b!416025))

(assert (= (and b!416025 res!242102) b!416029))

(assert (= (and b!416029 res!242098) b!416021))

(assert (= (and b!416021 c!55064) b!416019))

(assert (= (and b!416021 (not c!55064)) b!416028))

(assert (= (or b!416019 b!416028) bm!28877))

(assert (= (or b!416019 b!416028) bm!28876))

(assert (= (and b!416021 (not res!242096)) b!416027))

(assert (= (and b!416018 condMapEmpty!17700) mapIsEmpty!17700))

(assert (= (and b!416018 (not condMapEmpty!17700)) mapNonEmpty!17700))

(get-info :version)

(assert (= (and mapNonEmpty!17700 ((_ is ValueCellFull!5016) mapValue!17700)) b!416023))

(assert (= (and b!416018 ((_ is ValueCellFull!5016) mapDefault!17700)) b!416014))

(assert (= start!39300 b!416018))

(declare-fun b_lambda!8871 () Bool)

(assert (=> (not b_lambda!8871) (not b!416027)))

(declare-fun t!12293 () Bool)

(declare-fun tb!3189 () Bool)

(assert (=> (and start!39300 (= defaultEntry!557 defaultEntry!557) t!12293) tb!3189))

(declare-fun result!5905 () Bool)

(assert (=> tb!3189 (= result!5905 tp_is_empty!10719)))

(assert (=> b!416027 t!12293))

(declare-fun b_and!17011 () Bool)

(assert (= b_and!17009 (and (=> t!12293 result!5905) b_and!17011)))

(declare-fun m!405113 () Bool)

(assert (=> start!39300 m!405113))

(declare-fun m!405115 () Bool)

(assert (=> start!39300 m!405115))

(declare-fun m!405117 () Bool)

(assert (=> b!416026 m!405117))

(declare-fun m!405119 () Bool)

(assert (=> b!416020 m!405119))

(declare-fun m!405121 () Bool)

(assert (=> b!416027 m!405121))

(declare-fun m!405123 () Bool)

(assert (=> b!416027 m!405123))

(declare-fun m!405125 () Bool)

(assert (=> b!416027 m!405125))

(declare-fun m!405127 () Bool)

(assert (=> b!416027 m!405127))

(declare-fun m!405129 () Bool)

(assert (=> b!416027 m!405129))

(declare-fun m!405131 () Bool)

(assert (=> b!416027 m!405131))

(declare-fun m!405133 () Bool)

(assert (=> b!416027 m!405133))

(assert (=> b!416027 m!405131))

(declare-fun m!405135 () Bool)

(assert (=> b!416027 m!405135))

(declare-fun m!405137 () Bool)

(assert (=> b!416027 m!405137))

(declare-fun m!405139 () Bool)

(assert (=> b!416027 m!405139))

(declare-fun m!405141 () Bool)

(assert (=> b!416027 m!405141))

(assert (=> b!416027 m!405129))

(declare-fun m!405143 () Bool)

(assert (=> b!416027 m!405143))

(declare-fun m!405145 () Bool)

(assert (=> b!416027 m!405145))

(assert (=> b!416027 m!405137))

(declare-fun m!405147 () Bool)

(assert (=> bm!28877 m!405147))

(declare-fun m!405149 () Bool)

(assert (=> bm!28876 m!405149))

(declare-fun m!405151 () Bool)

(assert (=> b!416015 m!405151))

(declare-fun m!405153 () Bool)

(assert (=> b!416029 m!405153))

(assert (=> b!416029 m!405125))

(declare-fun m!405155 () Bool)

(assert (=> b!416029 m!405155))

(declare-fun m!405157 () Bool)

(assert (=> b!416022 m!405157))

(declare-fun m!405159 () Bool)

(assert (=> mapNonEmpty!17700 m!405159))

(declare-fun m!405161 () Bool)

(assert (=> b!416021 m!405161))

(assert (=> b!416021 m!405161))

(declare-fun m!405163 () Bool)

(assert (=> b!416021 m!405163))

(declare-fun m!405165 () Bool)

(assert (=> b!416021 m!405165))

(declare-fun m!405167 () Bool)

(assert (=> b!416031 m!405167))

(declare-fun m!405169 () Bool)

(assert (=> b!416031 m!405169))

(declare-fun m!405171 () Bool)

(assert (=> b!416016 m!405171))

(declare-fun m!405173 () Bool)

(assert (=> b!416032 m!405173))

(declare-fun m!405175 () Bool)

(assert (=> b!416024 m!405175))

(declare-fun m!405177 () Bool)

(assert (=> b!416019 m!405177))

(check-sat (not b!416024) (not b!416031) (not b!416029) (not bm!28877) tp_is_empty!10719 (not b!416022) (not b!416016) (not b!416015) (not b!416021) (not start!39300) b_and!17011 (not b_lambda!8871) (not bm!28876) (not b!416027) (not b!416026) (not mapNonEmpty!17700) (not b!416020) (not b!416019) (not b_next!9567))
(check-sat b_and!17011 (not b_next!9567))
