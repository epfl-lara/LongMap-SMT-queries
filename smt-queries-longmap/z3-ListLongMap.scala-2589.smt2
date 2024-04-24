; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39338 () Bool)

(assert start!39338)

(declare-fun b_free!9619 () Bool)

(declare-fun b_next!9619 () Bool)

(assert (=> start!39338 (= b_free!9619 (not b_next!9619))))

(declare-fun tp!34385 () Bool)

(declare-fun b_and!17127 () Bool)

(assert (=> start!39338 (= tp!34385 b_and!17127)))

(declare-fun res!243189 () Bool)

(declare-fun e!249079 () Bool)

(assert (=> start!39338 (=> (not res!243189) (not e!249079))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25400 0))(
  ( (array!25401 (arr!12149 (Array (_ BitVec 32) (_ BitVec 64))) (size!12501 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25400)

(assert (=> start!39338 (= res!243189 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12501 _keys!709))))))

(assert (=> start!39338 e!249079))

(declare-fun tp_is_empty!10771 () Bool)

(assert (=> start!39338 tp_is_empty!10771))

(assert (=> start!39338 tp!34385))

(assert (=> start!39338 true))

(declare-datatypes ((V!15467 0))(
  ( (V!15468 (val!5430 Int)) )
))
(declare-datatypes ((ValueCell!5042 0))(
  ( (ValueCellFull!5042 (v!7678 V!15467)) (EmptyCell!5042) )
))
(declare-datatypes ((array!25402 0))(
  ( (array!25403 (arr!12150 (Array (_ BitVec 32) ValueCell!5042)) (size!12502 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25402)

(declare-fun e!249077 () Bool)

(declare-fun array_inv!8934 (array!25402) Bool)

(assert (=> start!39338 (and (array_inv!8934 _values!549) e!249077)))

(declare-fun array_inv!8935 (array!25400) Bool)

(assert (=> start!39338 (array_inv!8935 _keys!709)))

(declare-fun b!417499 () Bool)

(declare-fun e!249074 () Bool)

(declare-fun e!249078 () Bool)

(assert (=> b!417499 (= e!249074 (not e!249078))))

(declare-fun res!243180 () Bool)

(assert (=> b!417499 (=> res!243180 e!249078)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417499 (= res!243180 (validKeyInArray!0 (select (arr!12149 _keys!709) from!863)))))

(declare-fun e!249076 () Bool)

(assert (=> b!417499 e!249076))

(declare-fun c!55119 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417499 (= c!55119 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15467)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15467)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15467)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12323 0))(
  ( (Unit!12324) )
))
(declare-fun lt!191314 () Unit!12323)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!426 (array!25400 array!25402 (_ BitVec 32) (_ BitVec 32) V!15467 V!15467 (_ BitVec 32) (_ BitVec 64) V!15467 (_ BitVec 32) Int) Unit!12323)

(assert (=> b!417499 (= lt!191314 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!426 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17778 () Bool)

(declare-fun mapRes!17778 () Bool)

(declare-fun tp!34386 () Bool)

(declare-fun e!249080 () Bool)

(assert (=> mapNonEmpty!17778 (= mapRes!17778 (and tp!34386 e!249080))))

(declare-fun mapKey!17778 () (_ BitVec 32))

(declare-fun mapValue!17778 () ValueCell!5042)

(declare-fun mapRest!17778 () (Array (_ BitVec 32) ValueCell!5042))

(assert (=> mapNonEmpty!17778 (= (arr!12150 _values!549) (store mapRest!17778 mapKey!17778 mapValue!17778))))

(declare-fun b!417500 () Bool)

(declare-fun res!243179 () Bool)

(assert (=> b!417500 (=> (not res!243179) (not e!249079))))

(assert (=> b!417500 (= res!243179 (and (= (size!12502 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12501 _keys!709) (size!12502 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417501 () Bool)

(declare-fun e!249081 () Bool)

(assert (=> b!417501 (= e!249077 (and e!249081 mapRes!17778))))

(declare-fun condMapEmpty!17778 () Bool)

(declare-fun mapDefault!17778 () ValueCell!5042)

(assert (=> b!417501 (= condMapEmpty!17778 (= (arr!12150 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5042)) mapDefault!17778)))))

(declare-fun b!417502 () Bool)

(declare-fun res!243184 () Bool)

(declare-fun e!249075 () Bool)

(assert (=> b!417502 (=> (not res!243184) (not e!249075))))

(declare-fun lt!191311 () array!25400)

(declare-datatypes ((List!6981 0))(
  ( (Nil!6978) (Cons!6977 (h!7833 (_ BitVec 64)) (t!12257 List!6981)) )
))
(declare-fun arrayNoDuplicates!0 (array!25400 (_ BitVec 32) List!6981) Bool)

(assert (=> b!417502 (= res!243184 (arrayNoDuplicates!0 lt!191311 #b00000000000000000000000000000000 Nil!6978))))

(declare-fun b!417503 () Bool)

(assert (=> b!417503 (= e!249080 tp_is_empty!10771)))

(declare-fun b!417504 () Bool)

(declare-fun res!243186 () Bool)

(assert (=> b!417504 (=> (not res!243186) (not e!249075))))

(assert (=> b!417504 (= res!243186 (bvsle from!863 i!563))))

(declare-fun b!417505 () Bool)

(assert (=> b!417505 (= e!249078 true)))

(declare-datatypes ((tuple2!6966 0))(
  ( (tuple2!6967 (_1!3494 (_ BitVec 64)) (_2!3494 V!15467)) )
))
(declare-fun lt!191312 () tuple2!6966)

(declare-fun lt!191310 () V!15467)

(declare-datatypes ((List!6982 0))(
  ( (Nil!6979) (Cons!6978 (h!7834 tuple2!6966) (t!12258 List!6982)) )
))
(declare-datatypes ((ListLongMap!5881 0))(
  ( (ListLongMap!5882 (toList!2956 List!6982)) )
))
(declare-fun lt!191307 () ListLongMap!5881)

(declare-fun +!1226 (ListLongMap!5881 tuple2!6966) ListLongMap!5881)

(assert (=> b!417505 (= (+!1226 lt!191307 lt!191312) (+!1226 (+!1226 lt!191307 (tuple2!6967 k0!794 lt!191310)) lt!191312))))

(declare-fun lt!191308 () V!15467)

(assert (=> b!417505 (= lt!191312 (tuple2!6967 k0!794 lt!191308))))

(declare-fun lt!191315 () Unit!12323)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!17 (ListLongMap!5881 (_ BitVec 64) V!15467 V!15467) Unit!12323)

(assert (=> b!417505 (= lt!191315 (addSameAsAddTwiceSameKeyDiffValues!17 lt!191307 k0!794 lt!191310 lt!191308))))

(declare-fun lt!191316 () V!15467)

(declare-fun get!6011 (ValueCell!5042 V!15467) V!15467)

(assert (=> b!417505 (= lt!191310 (get!6011 (select (arr!12150 _values!549) from!863) lt!191316))))

(declare-fun lt!191306 () ListLongMap!5881)

(assert (=> b!417505 (= lt!191306 (+!1226 lt!191307 (tuple2!6967 (select (arr!12149 lt!191311) from!863) lt!191308)))))

(assert (=> b!417505 (= lt!191308 (get!6011 (select (store (arr!12150 _values!549) i!563 (ValueCellFull!5042 v!412)) from!863) lt!191316))))

(declare-fun dynLambda!684 (Int (_ BitVec 64)) V!15467)

(assert (=> b!417505 (= lt!191316 (dynLambda!684 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!191313 () array!25402)

(declare-fun getCurrentListMapNoExtraKeys!1202 (array!25400 array!25402 (_ BitVec 32) (_ BitVec 32) V!15467 V!15467 (_ BitVec 32) Int) ListLongMap!5881)

(assert (=> b!417505 (= lt!191307 (getCurrentListMapNoExtraKeys!1202 lt!191311 lt!191313 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17778 () Bool)

(assert (=> mapIsEmpty!17778 mapRes!17778))

(declare-fun b!417506 () Bool)

(declare-fun res!243185 () Bool)

(assert (=> b!417506 (=> (not res!243185) (not e!249079))))

(assert (=> b!417506 (= res!243185 (or (= (select (arr!12149 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12149 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417507 () Bool)

(assert (=> b!417507 (= e!249079 e!249075)))

(declare-fun res!243181 () Bool)

(assert (=> b!417507 (=> (not res!243181) (not e!249075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25400 (_ BitVec 32)) Bool)

(assert (=> b!417507 (= res!243181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191311 mask!1025))))

(assert (=> b!417507 (= lt!191311 (array!25401 (store (arr!12149 _keys!709) i!563 k0!794) (size!12501 _keys!709)))))

(declare-fun bm!29019 () Bool)

(declare-fun call!29022 () ListLongMap!5881)

(assert (=> bm!29019 (= call!29022 (getCurrentListMapNoExtraKeys!1202 (ite c!55119 _keys!709 lt!191311) (ite c!55119 _values!549 lt!191313) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29023 () ListLongMap!5881)

(declare-fun b!417508 () Bool)

(assert (=> b!417508 (= e!249076 (= call!29023 (+!1226 call!29022 (tuple2!6967 k0!794 v!412))))))

(declare-fun b!417509 () Bool)

(declare-fun res!243191 () Bool)

(assert (=> b!417509 (=> (not res!243191) (not e!249079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417509 (= res!243191 (validMask!0 mask!1025))))

(declare-fun bm!29020 () Bool)

(assert (=> bm!29020 (= call!29023 (getCurrentListMapNoExtraKeys!1202 (ite c!55119 lt!191311 _keys!709) (ite c!55119 lt!191313 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417510 () Bool)

(declare-fun res!243187 () Bool)

(assert (=> b!417510 (=> (not res!243187) (not e!249079))))

(assert (=> b!417510 (= res!243187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417511 () Bool)

(assert (=> b!417511 (= e!249081 tp_is_empty!10771)))

(declare-fun b!417512 () Bool)

(declare-fun res!243183 () Bool)

(assert (=> b!417512 (=> (not res!243183) (not e!249079))))

(assert (=> b!417512 (= res!243183 (validKeyInArray!0 k0!794))))

(declare-fun b!417513 () Bool)

(assert (=> b!417513 (= e!249076 (= call!29022 call!29023))))

(declare-fun b!417514 () Bool)

(declare-fun res!243188 () Bool)

(assert (=> b!417514 (=> (not res!243188) (not e!249079))))

(declare-fun arrayContainsKey!0 (array!25400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417514 (= res!243188 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417515 () Bool)

(assert (=> b!417515 (= e!249075 e!249074)))

(declare-fun res!243182 () Bool)

(assert (=> b!417515 (=> (not res!243182) (not e!249074))))

(assert (=> b!417515 (= res!243182 (= from!863 i!563))))

(assert (=> b!417515 (= lt!191306 (getCurrentListMapNoExtraKeys!1202 lt!191311 lt!191313 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417515 (= lt!191313 (array!25403 (store (arr!12150 _values!549) i!563 (ValueCellFull!5042 v!412)) (size!12502 _values!549)))))

(declare-fun lt!191309 () ListLongMap!5881)

(assert (=> b!417515 (= lt!191309 (getCurrentListMapNoExtraKeys!1202 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417516 () Bool)

(declare-fun res!243190 () Bool)

(assert (=> b!417516 (=> (not res!243190) (not e!249079))))

(assert (=> b!417516 (= res!243190 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12501 _keys!709))))))

(declare-fun b!417517 () Bool)

(declare-fun res!243192 () Bool)

(assert (=> b!417517 (=> (not res!243192) (not e!249079))))

(assert (=> b!417517 (= res!243192 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6978))))

(assert (= (and start!39338 res!243189) b!417509))

(assert (= (and b!417509 res!243191) b!417500))

(assert (= (and b!417500 res!243179) b!417510))

(assert (= (and b!417510 res!243187) b!417517))

(assert (= (and b!417517 res!243192) b!417516))

(assert (= (and b!417516 res!243190) b!417512))

(assert (= (and b!417512 res!243183) b!417506))

(assert (= (and b!417506 res!243185) b!417514))

(assert (= (and b!417514 res!243188) b!417507))

(assert (= (and b!417507 res!243181) b!417502))

(assert (= (and b!417502 res!243184) b!417504))

(assert (= (and b!417504 res!243186) b!417515))

(assert (= (and b!417515 res!243182) b!417499))

(assert (= (and b!417499 c!55119) b!417508))

(assert (= (and b!417499 (not c!55119)) b!417513))

(assert (= (or b!417508 b!417513) bm!29020))

(assert (= (or b!417508 b!417513) bm!29019))

(assert (= (and b!417499 (not res!243180)) b!417505))

(assert (= (and b!417501 condMapEmpty!17778) mapIsEmpty!17778))

(assert (= (and b!417501 (not condMapEmpty!17778)) mapNonEmpty!17778))

(get-info :version)

(assert (= (and mapNonEmpty!17778 ((_ is ValueCellFull!5042) mapValue!17778)) b!417503))

(assert (= (and b!417501 ((_ is ValueCellFull!5042) mapDefault!17778)) b!417511))

(assert (= start!39338 b!417501))

(declare-fun b_lambda!8945 () Bool)

(assert (=> (not b_lambda!8945) (not b!417505)))

(declare-fun t!12256 () Bool)

(declare-fun tb!3233 () Bool)

(assert (=> (and start!39338 (= defaultEntry!557 defaultEntry!557) t!12256) tb!3233))

(declare-fun result!6001 () Bool)

(assert (=> tb!3233 (= result!6001 tp_is_empty!10771)))

(assert (=> b!417505 t!12256))

(declare-fun b_and!17129 () Bool)

(assert (= b_and!17127 (and (=> t!12256 result!6001) b_and!17129)))

(declare-fun m!407057 () Bool)

(assert (=> b!417502 m!407057))

(declare-fun m!407059 () Bool)

(assert (=> b!417510 m!407059))

(declare-fun m!407061 () Bool)

(assert (=> b!417512 m!407061))

(declare-fun m!407063 () Bool)

(assert (=> b!417514 m!407063))

(declare-fun m!407065 () Bool)

(assert (=> b!417505 m!407065))

(declare-fun m!407067 () Bool)

(assert (=> b!417505 m!407067))

(declare-fun m!407069 () Bool)

(assert (=> b!417505 m!407069))

(declare-fun m!407071 () Bool)

(assert (=> b!417505 m!407071))

(declare-fun m!407073 () Bool)

(assert (=> b!417505 m!407073))

(assert (=> b!417505 m!407065))

(declare-fun m!407075 () Bool)

(assert (=> b!417505 m!407075))

(declare-fun m!407077 () Bool)

(assert (=> b!417505 m!407077))

(declare-fun m!407079 () Bool)

(assert (=> b!417505 m!407079))

(declare-fun m!407081 () Bool)

(assert (=> b!417505 m!407081))

(declare-fun m!407083 () Bool)

(assert (=> b!417505 m!407083))

(declare-fun m!407085 () Bool)

(assert (=> b!417505 m!407085))

(declare-fun m!407087 () Bool)

(assert (=> b!417505 m!407087))

(declare-fun m!407089 () Bool)

(assert (=> b!417505 m!407089))

(assert (=> b!417505 m!407081))

(assert (=> b!417505 m!407075))

(declare-fun m!407091 () Bool)

(assert (=> start!39338 m!407091))

(declare-fun m!407093 () Bool)

(assert (=> start!39338 m!407093))

(declare-fun m!407095 () Bool)

(assert (=> bm!29019 m!407095))

(declare-fun m!407097 () Bool)

(assert (=> b!417517 m!407097))

(declare-fun m!407099 () Bool)

(assert (=> b!417509 m!407099))

(declare-fun m!407101 () Bool)

(assert (=> b!417508 m!407101))

(declare-fun m!407103 () Bool)

(assert (=> b!417507 m!407103))

(declare-fun m!407105 () Bool)

(assert (=> b!417507 m!407105))

(declare-fun m!407107 () Bool)

(assert (=> b!417499 m!407107))

(assert (=> b!417499 m!407107))

(declare-fun m!407109 () Bool)

(assert (=> b!417499 m!407109))

(declare-fun m!407111 () Bool)

(assert (=> b!417499 m!407111))

(declare-fun m!407113 () Bool)

(assert (=> b!417506 m!407113))

(declare-fun m!407115 () Bool)

(assert (=> bm!29020 m!407115))

(declare-fun m!407117 () Bool)

(assert (=> mapNonEmpty!17778 m!407117))

(declare-fun m!407119 () Bool)

(assert (=> b!417515 m!407119))

(assert (=> b!417515 m!407071))

(declare-fun m!407121 () Bool)

(assert (=> b!417515 m!407121))

(check-sat (not bm!29020) (not b_next!9619) (not b!417514) (not mapNonEmpty!17778) (not b!417502) (not b!417512) (not start!39338) (not b_lambda!8945) (not b!417509) (not b!417499) (not bm!29019) b_and!17129 (not b!417515) (not b!417507) tp_is_empty!10771 (not b!417505) (not b!417510) (not b!417508) (not b!417517))
(check-sat b_and!17129 (not b_next!9619))
