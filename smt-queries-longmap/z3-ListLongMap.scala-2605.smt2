; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39450 () Bool)

(assert start!39450)

(declare-fun b_free!9717 () Bool)

(declare-fun b_next!9717 () Bool)

(assert (=> start!39450 (= b_free!9717 (not b_next!9717))))

(declare-fun tp!34680 () Bool)

(declare-fun b_and!17309 () Bool)

(assert (=> start!39450 (= tp!34680 b_and!17309)))

(declare-datatypes ((V!15597 0))(
  ( (V!15598 (val!5479 Int)) )
))
(declare-fun minValue!515 () V!15597)

(declare-datatypes ((tuple2!7180 0))(
  ( (tuple2!7181 (_1!3601 (_ BitVec 64)) (_2!3601 V!15597)) )
))
(declare-datatypes ((List!7187 0))(
  ( (Nil!7184) (Cons!7183 (h!8039 tuple2!7180) (t!12569 List!7187)) )
))
(declare-datatypes ((ListLongMap!6093 0))(
  ( (ListLongMap!6094 (toList!3062 List!7187)) )
))
(declare-fun call!29330 () ListLongMap!6093)

(declare-fun bm!29326 () Bool)

(declare-fun zeroValue!515 () V!15597)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25587 0))(
  ( (array!25588 (arr!12243 (Array (_ BitVec 32) (_ BitVec 64))) (size!12595 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25587)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5091 0))(
  ( (ValueCellFull!5091 (v!7726 V!15597)) (EmptyCell!5091) )
))
(declare-datatypes ((array!25589 0))(
  ( (array!25590 (arr!12244 (Array (_ BitVec 32) ValueCell!5091)) (size!12596 (_ BitVec 32))) )
))
(declare-fun lt!192909 () array!25589)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55289 () Bool)

(declare-fun _values!549 () array!25589)

(declare-fun lt!192912 () array!25587)

(declare-fun getCurrentListMapNoExtraKeys!1267 (array!25587 array!25589 (_ BitVec 32) (_ BitVec 32) V!15597 V!15597 (_ BitVec 32) Int) ListLongMap!6093)

(assert (=> bm!29326 (= call!29330 (getCurrentListMapNoExtraKeys!1267 (ite c!55289 _keys!709 lt!192912) (ite c!55289 _values!549 lt!192909) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420439 () Bool)

(declare-fun e!250430 () Bool)

(assert (=> b!420439 (= e!250430 true)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!192913 () ListLongMap!6093)

(declare-fun lt!192905 () V!15597)

(declare-fun lt!192908 () tuple2!7180)

(declare-fun +!1259 (ListLongMap!6093 tuple2!7180) ListLongMap!6093)

(assert (=> b!420439 (= (+!1259 lt!192913 lt!192908) (+!1259 (+!1259 lt!192913 (tuple2!7181 k0!794 lt!192905)) lt!192908))))

(declare-fun lt!192914 () V!15597)

(assert (=> b!420439 (= lt!192908 (tuple2!7181 k0!794 lt!192914))))

(declare-datatypes ((Unit!12422 0))(
  ( (Unit!12423) )
))
(declare-fun lt!192907 () Unit!12422)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!56 (ListLongMap!6093 (_ BitVec 64) V!15597 V!15597) Unit!12422)

(assert (=> b!420439 (= lt!192907 (addSameAsAddTwiceSameKeyDiffValues!56 lt!192913 k0!794 lt!192905 lt!192914))))

(declare-fun lt!192911 () V!15597)

(declare-fun get!6080 (ValueCell!5091 V!15597) V!15597)

(assert (=> b!420439 (= lt!192905 (get!6080 (select (arr!12244 _values!549) from!863) lt!192911))))

(declare-fun lt!192910 () ListLongMap!6093)

(assert (=> b!420439 (= lt!192910 (+!1259 lt!192913 (tuple2!7181 (select (arr!12243 lt!192912) from!863) lt!192914)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15597)

(assert (=> b!420439 (= lt!192914 (get!6080 (select (store (arr!12244 _values!549) i!563 (ValueCellFull!5091 v!412)) from!863) lt!192911))))

(declare-fun dynLambda!727 (Int (_ BitVec 64)) V!15597)

(assert (=> b!420439 (= lt!192911 (dynLambda!727 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420439 (= lt!192913 (getCurrentListMapNoExtraKeys!1267 lt!192912 lt!192909 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420440 () Bool)

(declare-fun res!245240 () Bool)

(declare-fun e!250431 () Bool)

(assert (=> b!420440 (=> (not res!245240) (not e!250431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25587 (_ BitVec 32)) Bool)

(assert (=> b!420440 (= res!245240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420441 () Bool)

(declare-fun res!245242 () Bool)

(declare-fun e!250436 () Bool)

(assert (=> b!420441 (=> (not res!245242) (not e!250436))))

(declare-datatypes ((List!7188 0))(
  ( (Nil!7185) (Cons!7184 (h!8040 (_ BitVec 64)) (t!12570 List!7188)) )
))
(declare-fun arrayNoDuplicates!0 (array!25587 (_ BitVec 32) List!7188) Bool)

(assert (=> b!420441 (= res!245242 (arrayNoDuplicates!0 lt!192912 #b00000000000000000000000000000000 Nil!7185))))

(declare-fun b!420442 () Bool)

(declare-fun res!245252 () Bool)

(assert (=> b!420442 (=> (not res!245252) (not e!250431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420442 (= res!245252 (validKeyInArray!0 k0!794))))

(declare-fun b!420444 () Bool)

(declare-fun e!250437 () Bool)

(assert (=> b!420444 (= e!250436 e!250437)))

(declare-fun res!245249 () Bool)

(assert (=> b!420444 (=> (not res!245249) (not e!250437))))

(assert (=> b!420444 (= res!245249 (= from!863 i!563))))

(assert (=> b!420444 (= lt!192910 (getCurrentListMapNoExtraKeys!1267 lt!192912 lt!192909 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420444 (= lt!192909 (array!25590 (store (arr!12244 _values!549) i!563 (ValueCellFull!5091 v!412)) (size!12596 _values!549)))))

(declare-fun lt!192904 () ListLongMap!6093)

(assert (=> b!420444 (= lt!192904 (getCurrentListMapNoExtraKeys!1267 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420445 () Bool)

(assert (=> b!420445 (= e!250431 e!250436)))

(declare-fun res!245251 () Bool)

(assert (=> b!420445 (=> (not res!245251) (not e!250436))))

(assert (=> b!420445 (= res!245251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192912 mask!1025))))

(assert (=> b!420445 (= lt!192912 (array!25588 (store (arr!12243 _keys!709) i!563 k0!794) (size!12595 _keys!709)))))

(declare-fun b!420446 () Bool)

(declare-fun e!250435 () Bool)

(declare-fun tp_is_empty!10869 () Bool)

(assert (=> b!420446 (= e!250435 tp_is_empty!10869)))

(declare-fun b!420447 () Bool)

(declare-fun res!245243 () Bool)

(assert (=> b!420447 (=> (not res!245243) (not e!250431))))

(declare-fun arrayContainsKey!0 (array!25587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420447 (= res!245243 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420448 () Bool)

(declare-fun e!250433 () Bool)

(declare-fun call!29329 () ListLongMap!6093)

(assert (=> b!420448 (= e!250433 (= call!29329 (+!1259 call!29330 (tuple2!7181 k0!794 v!412))))))

(declare-fun b!420449 () Bool)

(declare-fun e!250434 () Bool)

(declare-fun e!250432 () Bool)

(declare-fun mapRes!17925 () Bool)

(assert (=> b!420449 (= e!250434 (and e!250432 mapRes!17925))))

(declare-fun condMapEmpty!17925 () Bool)

(declare-fun mapDefault!17925 () ValueCell!5091)

(assert (=> b!420449 (= condMapEmpty!17925 (= (arr!12244 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5091)) mapDefault!17925)))))

(declare-fun b!420450 () Bool)

(declare-fun res!245241 () Bool)

(assert (=> b!420450 (=> (not res!245241) (not e!250436))))

(assert (=> b!420450 (= res!245241 (bvsle from!863 i!563))))

(declare-fun b!420451 () Bool)

(declare-fun res!245244 () Bool)

(assert (=> b!420451 (=> (not res!245244) (not e!250431))))

(assert (=> b!420451 (= res!245244 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12595 _keys!709))))))

(declare-fun b!420452 () Bool)

(assert (=> b!420452 (= e!250433 (= call!29330 call!29329))))

(declare-fun b!420453 () Bool)

(declare-fun res!245248 () Bool)

(assert (=> b!420453 (=> (not res!245248) (not e!250431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420453 (= res!245248 (validMask!0 mask!1025))))

(declare-fun b!420454 () Bool)

(declare-fun res!245246 () Bool)

(assert (=> b!420454 (=> (not res!245246) (not e!250431))))

(assert (=> b!420454 (= res!245246 (or (= (select (arr!12243 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12243 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420455 () Bool)

(declare-fun res!245245 () Bool)

(assert (=> b!420455 (=> (not res!245245) (not e!250431))))

(assert (=> b!420455 (= res!245245 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7185))))

(declare-fun mapNonEmpty!17925 () Bool)

(declare-fun tp!34679 () Bool)

(assert (=> mapNonEmpty!17925 (= mapRes!17925 (and tp!34679 e!250435))))

(declare-fun mapRest!17925 () (Array (_ BitVec 32) ValueCell!5091))

(declare-fun mapKey!17925 () (_ BitVec 32))

(declare-fun mapValue!17925 () ValueCell!5091)

(assert (=> mapNonEmpty!17925 (= (arr!12244 _values!549) (store mapRest!17925 mapKey!17925 mapValue!17925))))

(declare-fun b!420456 () Bool)

(assert (=> b!420456 (= e!250432 tp_is_empty!10869)))

(declare-fun b!420443 () Bool)

(assert (=> b!420443 (= e!250437 (not e!250430))))

(declare-fun res!245250 () Bool)

(assert (=> b!420443 (=> res!245250 e!250430)))

(assert (=> b!420443 (= res!245250 (validKeyInArray!0 (select (arr!12243 _keys!709) from!863)))))

(assert (=> b!420443 e!250433))

(assert (=> b!420443 (= c!55289 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192906 () Unit!12422)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!458 (array!25587 array!25589 (_ BitVec 32) (_ BitVec 32) V!15597 V!15597 (_ BitVec 32) (_ BitVec 64) V!15597 (_ BitVec 32) Int) Unit!12422)

(assert (=> b!420443 (= lt!192906 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!458 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!245247 () Bool)

(assert (=> start!39450 (=> (not res!245247) (not e!250431))))

(assert (=> start!39450 (= res!245247 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12595 _keys!709))))))

(assert (=> start!39450 e!250431))

(assert (=> start!39450 tp_is_empty!10869))

(assert (=> start!39450 tp!34680))

(assert (=> start!39450 true))

(declare-fun array_inv!8926 (array!25589) Bool)

(assert (=> start!39450 (and (array_inv!8926 _values!549) e!250434)))

(declare-fun array_inv!8927 (array!25587) Bool)

(assert (=> start!39450 (array_inv!8927 _keys!709)))

(declare-fun bm!29327 () Bool)

(assert (=> bm!29327 (= call!29329 (getCurrentListMapNoExtraKeys!1267 (ite c!55289 lt!192912 _keys!709) (ite c!55289 lt!192909 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17925 () Bool)

(assert (=> mapIsEmpty!17925 mapRes!17925))

(declare-fun b!420457 () Bool)

(declare-fun res!245253 () Bool)

(assert (=> b!420457 (=> (not res!245253) (not e!250431))))

(assert (=> b!420457 (= res!245253 (and (= (size!12596 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12595 _keys!709) (size!12596 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39450 res!245247) b!420453))

(assert (= (and b!420453 res!245248) b!420457))

(assert (= (and b!420457 res!245253) b!420440))

(assert (= (and b!420440 res!245240) b!420455))

(assert (= (and b!420455 res!245245) b!420451))

(assert (= (and b!420451 res!245244) b!420442))

(assert (= (and b!420442 res!245252) b!420454))

(assert (= (and b!420454 res!245246) b!420447))

(assert (= (and b!420447 res!245243) b!420445))

(assert (= (and b!420445 res!245251) b!420441))

(assert (= (and b!420441 res!245242) b!420450))

(assert (= (and b!420450 res!245241) b!420444))

(assert (= (and b!420444 res!245249) b!420443))

(assert (= (and b!420443 c!55289) b!420448))

(assert (= (and b!420443 (not c!55289)) b!420452))

(assert (= (or b!420448 b!420452) bm!29327))

(assert (= (or b!420448 b!420452) bm!29326))

(assert (= (and b!420443 (not res!245250)) b!420439))

(assert (= (and b!420449 condMapEmpty!17925) mapIsEmpty!17925))

(assert (= (and b!420449 (not condMapEmpty!17925)) mapNonEmpty!17925))

(get-info :version)

(assert (= (and mapNonEmpty!17925 ((_ is ValueCellFull!5091) mapValue!17925)) b!420446))

(assert (= (and b!420449 ((_ is ValueCellFull!5091) mapDefault!17925)) b!420456))

(assert (= start!39450 b!420449))

(declare-fun b_lambda!9021 () Bool)

(assert (=> (not b_lambda!9021) (not b!420439)))

(declare-fun t!12568 () Bool)

(declare-fun tb!3339 () Bool)

(assert (=> (and start!39450 (= defaultEntry!557 defaultEntry!557) t!12568) tb!3339))

(declare-fun result!6205 () Bool)

(assert (=> tb!3339 (= result!6205 tp_is_empty!10869)))

(assert (=> b!420439 t!12568))

(declare-fun b_and!17311 () Bool)

(assert (= b_and!17309 (and (=> t!12568 result!6205) b_and!17311)))

(declare-fun m!410063 () Bool)

(assert (=> b!420454 m!410063))

(declare-fun m!410065 () Bool)

(assert (=> b!420441 m!410065))

(declare-fun m!410067 () Bool)

(assert (=> b!420442 m!410067))

(declare-fun m!410069 () Bool)

(assert (=> b!420447 m!410069))

(declare-fun m!410071 () Bool)

(assert (=> b!420445 m!410071))

(declare-fun m!410073 () Bool)

(assert (=> b!420445 m!410073))

(declare-fun m!410075 () Bool)

(assert (=> b!420444 m!410075))

(declare-fun m!410077 () Bool)

(assert (=> b!420444 m!410077))

(declare-fun m!410079 () Bool)

(assert (=> b!420444 m!410079))

(declare-fun m!410081 () Bool)

(assert (=> b!420443 m!410081))

(assert (=> b!420443 m!410081))

(declare-fun m!410083 () Bool)

(assert (=> b!420443 m!410083))

(declare-fun m!410085 () Bool)

(assert (=> b!420443 m!410085))

(declare-fun m!410087 () Bool)

(assert (=> b!420440 m!410087))

(assert (=> b!420439 m!410077))

(declare-fun m!410089 () Bool)

(assert (=> b!420439 m!410089))

(declare-fun m!410091 () Bool)

(assert (=> b!420439 m!410091))

(declare-fun m!410093 () Bool)

(assert (=> b!420439 m!410093))

(declare-fun m!410095 () Bool)

(assert (=> b!420439 m!410095))

(declare-fun m!410097 () Bool)

(assert (=> b!420439 m!410097))

(assert (=> b!420439 m!410089))

(declare-fun m!410099 () Bool)

(assert (=> b!420439 m!410099))

(declare-fun m!410101 () Bool)

(assert (=> b!420439 m!410101))

(assert (=> b!420439 m!410099))

(declare-fun m!410103 () Bool)

(assert (=> b!420439 m!410103))

(assert (=> b!420439 m!410095))

(declare-fun m!410105 () Bool)

(assert (=> b!420439 m!410105))

(declare-fun m!410107 () Bool)

(assert (=> b!420439 m!410107))

(declare-fun m!410109 () Bool)

(assert (=> b!420439 m!410109))

(declare-fun m!410111 () Bool)

(assert (=> b!420439 m!410111))

(declare-fun m!410113 () Bool)

(assert (=> mapNonEmpty!17925 m!410113))

(declare-fun m!410115 () Bool)

(assert (=> start!39450 m!410115))

(declare-fun m!410117 () Bool)

(assert (=> start!39450 m!410117))

(declare-fun m!410119 () Bool)

(assert (=> bm!29326 m!410119))

(declare-fun m!410121 () Bool)

(assert (=> b!420455 m!410121))

(declare-fun m!410123 () Bool)

(assert (=> bm!29327 m!410123))

(declare-fun m!410125 () Bool)

(assert (=> b!420453 m!410125))

(declare-fun m!410127 () Bool)

(assert (=> b!420448 m!410127))

(check-sat (not b!420453) (not b!420442) b_and!17311 (not b!420440) (not b!420443) tp_is_empty!10869 (not b!420444) (not bm!29326) (not mapNonEmpty!17925) (not start!39450) (not b!420441) (not bm!29327) (not b!420447) (not b_next!9717) (not b!420455) (not b!420445) (not b!420439) (not b_lambda!9021) (not b!420448))
(check-sat b_and!17311 (not b_next!9717))
