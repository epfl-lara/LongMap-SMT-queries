; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39428 () Bool)

(assert start!39428)

(declare-fun b_free!9709 () Bool)

(declare-fun b_next!9709 () Bool)

(assert (=> start!39428 (= b_free!9709 (not b_next!9709))))

(declare-fun tp!34655 () Bool)

(declare-fun b_and!17307 () Bool)

(assert (=> start!39428 (= tp!34655 b_and!17307)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15587 0))(
  ( (V!15588 (val!5475 Int)) )
))
(declare-datatypes ((ValueCell!5087 0))(
  ( (ValueCellFull!5087 (v!7723 V!15587)) (EmptyCell!5087) )
))
(declare-datatypes ((array!25578 0))(
  ( (array!25579 (arr!12238 (Array (_ BitVec 32) ValueCell!5087)) (size!12590 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25578)

(declare-fun zeroValue!515 () V!15587)

(declare-fun lt!192791 () array!25578)

(declare-fun bm!29289 () Bool)

(declare-datatypes ((tuple2!7052 0))(
  ( (tuple2!7053 (_1!3537 (_ BitVec 64)) (_2!3537 V!15587)) )
))
(declare-datatypes ((List!7061 0))(
  ( (Nil!7058) (Cons!7057 (h!7913 tuple2!7052) (t!12427 List!7061)) )
))
(declare-datatypes ((ListLongMap!5967 0))(
  ( (ListLongMap!5968 (toList!2999 List!7061)) )
))
(declare-fun call!29293 () ListLongMap!5967)

(declare-datatypes ((array!25580 0))(
  ( (array!25581 (arr!12239 (Array (_ BitVec 32) (_ BitVec 64))) (size!12591 (_ BitVec 32))) )
))
(declare-fun lt!192794 () array!25580)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25580)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15587)

(declare-fun c!55254 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1245 (array!25580 array!25578 (_ BitVec 32) (_ BitVec 32) V!15587 V!15587 (_ BitVec 32) Int) ListLongMap!5967)

(assert (=> bm!29289 (= call!29293 (getCurrentListMapNoExtraKeys!1245 (ite c!55254 _keys!709 lt!192794) (ite c!55254 _values!549 lt!192791) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420154 () Bool)

(declare-fun e!250295 () Bool)

(declare-fun tp_is_empty!10861 () Bool)

(assert (=> b!420154 (= e!250295 tp_is_empty!10861)))

(declare-fun b!420155 () Bool)

(declare-fun e!250296 () Bool)

(declare-fun e!250289 () Bool)

(assert (=> b!420155 (= e!250296 (not e!250289))))

(declare-fun res!245080 () Bool)

(assert (=> b!420155 (=> res!245080 e!250289)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420155 (= res!245080 (validKeyInArray!0 (select (arr!12239 _keys!709) from!863)))))

(declare-fun e!250297 () Bool)

(assert (=> b!420155 e!250297))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420155 (= c!55254 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15587)

(declare-datatypes ((Unit!12399 0))(
  ( (Unit!12400) )
))
(declare-fun lt!192799 () Unit!12399)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!454 (array!25580 array!25578 (_ BitVec 32) (_ BitVec 32) V!15587 V!15587 (_ BitVec 32) (_ BitVec 64) V!15587 (_ BitVec 32) Int) Unit!12399)

(assert (=> b!420155 (= lt!192799 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!454 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420156 () Bool)

(declare-fun res!245072 () Bool)

(declare-fun e!250290 () Bool)

(assert (=> b!420156 (=> (not res!245072) (not e!250290))))

(assert (=> b!420156 (= res!245072 (bvsle from!863 i!563))))

(declare-fun b!420157 () Bool)

(declare-fun call!29292 () ListLongMap!5967)

(assert (=> b!420157 (= e!250297 (= call!29293 call!29292))))

(declare-fun b!420158 () Bool)

(declare-fun res!245075 () Bool)

(declare-fun e!250294 () Bool)

(assert (=> b!420158 (=> (not res!245075) (not e!250294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420158 (= res!245075 (validMask!0 mask!1025))))

(declare-fun b!420159 () Bool)

(declare-fun res!245082 () Bool)

(assert (=> b!420159 (=> (not res!245082) (not e!250294))))

(assert (=> b!420159 (= res!245082 (validKeyInArray!0 k0!794))))

(declare-fun res!245069 () Bool)

(assert (=> start!39428 (=> (not res!245069) (not e!250294))))

(assert (=> start!39428 (= res!245069 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12591 _keys!709))))))

(assert (=> start!39428 e!250294))

(assert (=> start!39428 tp_is_empty!10861))

(assert (=> start!39428 tp!34655))

(assert (=> start!39428 true))

(declare-fun e!250293 () Bool)

(declare-fun array_inv!8996 (array!25578) Bool)

(assert (=> start!39428 (and (array_inv!8996 _values!549) e!250293)))

(declare-fun array_inv!8997 (array!25580) Bool)

(assert (=> start!39428 (array_inv!8997 _keys!709)))

(declare-fun bm!29290 () Bool)

(assert (=> bm!29290 (= call!29292 (getCurrentListMapNoExtraKeys!1245 (ite c!55254 lt!192794 _keys!709) (ite c!55254 lt!192791 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420160 () Bool)

(declare-fun e!250292 () Bool)

(assert (=> b!420160 (= e!250292 tp_is_empty!10861)))

(declare-fun b!420161 () Bool)

(declare-fun res!245074 () Bool)

(assert (=> b!420161 (=> (not res!245074) (not e!250294))))

(assert (=> b!420161 (= res!245074 (and (= (size!12590 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12591 _keys!709) (size!12590 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420162 () Bool)

(declare-fun res!245076 () Bool)

(assert (=> b!420162 (=> (not res!245076) (not e!250290))))

(declare-datatypes ((List!7062 0))(
  ( (Nil!7059) (Cons!7058 (h!7914 (_ BitVec 64)) (t!12428 List!7062)) )
))
(declare-fun arrayNoDuplicates!0 (array!25580 (_ BitVec 32) List!7062) Bool)

(assert (=> b!420162 (= res!245076 (arrayNoDuplicates!0 lt!192794 #b00000000000000000000000000000000 Nil!7059))))

(declare-fun b!420163 () Bool)

(declare-fun res!245073 () Bool)

(assert (=> b!420163 (=> (not res!245073) (not e!250294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25580 (_ BitVec 32)) Bool)

(assert (=> b!420163 (= res!245073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420164 () Bool)

(declare-fun mapRes!17913 () Bool)

(assert (=> b!420164 (= e!250293 (and e!250295 mapRes!17913))))

(declare-fun condMapEmpty!17913 () Bool)

(declare-fun mapDefault!17913 () ValueCell!5087)

(assert (=> b!420164 (= condMapEmpty!17913 (= (arr!12238 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5087)) mapDefault!17913)))))

(declare-fun mapNonEmpty!17913 () Bool)

(declare-fun tp!34656 () Bool)

(assert (=> mapNonEmpty!17913 (= mapRes!17913 (and tp!34656 e!250292))))

(declare-fun mapRest!17913 () (Array (_ BitVec 32) ValueCell!5087))

(declare-fun mapKey!17913 () (_ BitVec 32))

(declare-fun mapValue!17913 () ValueCell!5087)

(assert (=> mapNonEmpty!17913 (= (arr!12238 _values!549) (store mapRest!17913 mapKey!17913 mapValue!17913))))

(declare-fun b!420165 () Bool)

(declare-fun +!1263 (ListLongMap!5967 tuple2!7052) ListLongMap!5967)

(assert (=> b!420165 (= e!250297 (= call!29292 (+!1263 call!29293 (tuple2!7053 k0!794 v!412))))))

(declare-fun b!420166 () Bool)

(assert (=> b!420166 (= e!250294 e!250290)))

(declare-fun res!245081 () Bool)

(assert (=> b!420166 (=> (not res!245081) (not e!250290))))

(assert (=> b!420166 (= res!245081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192794 mask!1025))))

(assert (=> b!420166 (= lt!192794 (array!25581 (store (arr!12239 _keys!709) i!563 k0!794) (size!12591 _keys!709)))))

(declare-fun b!420167 () Bool)

(declare-fun res!245077 () Bool)

(assert (=> b!420167 (=> (not res!245077) (not e!250294))))

(assert (=> b!420167 (= res!245077 (or (= (select (arr!12239 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12239 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420168 () Bool)

(declare-fun res!245078 () Bool)

(assert (=> b!420168 (=> (not res!245078) (not e!250294))))

(declare-fun arrayContainsKey!0 (array!25580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420168 (= res!245078 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420169 () Bool)

(assert (=> b!420169 (= e!250289 true)))

(declare-fun lt!192797 () V!15587)

(declare-fun lt!192801 () ListLongMap!5967)

(declare-fun lt!192795 () tuple2!7052)

(assert (=> b!420169 (= (+!1263 lt!192801 lt!192795) (+!1263 (+!1263 lt!192801 (tuple2!7053 k0!794 lt!192797)) lt!192795))))

(declare-fun lt!192798 () V!15587)

(assert (=> b!420169 (= lt!192795 (tuple2!7053 k0!794 lt!192798))))

(declare-fun lt!192792 () Unit!12399)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!53 (ListLongMap!5967 (_ BitVec 64) V!15587 V!15587) Unit!12399)

(assert (=> b!420169 (= lt!192792 (addSameAsAddTwiceSameKeyDiffValues!53 lt!192801 k0!794 lt!192797 lt!192798))))

(declare-fun lt!192793 () V!15587)

(declare-fun get!6077 (ValueCell!5087 V!15587) V!15587)

(assert (=> b!420169 (= lt!192797 (get!6077 (select (arr!12238 _values!549) from!863) lt!192793))))

(declare-fun lt!192800 () ListLongMap!5967)

(assert (=> b!420169 (= lt!192800 (+!1263 lt!192801 (tuple2!7053 (select (arr!12239 lt!192794) from!863) lt!192798)))))

(assert (=> b!420169 (= lt!192798 (get!6077 (select (store (arr!12238 _values!549) i!563 (ValueCellFull!5087 v!412)) from!863) lt!192793))))

(declare-fun dynLambda!720 (Int (_ BitVec 64)) V!15587)

(assert (=> b!420169 (= lt!192793 (dynLambda!720 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420169 (= lt!192801 (getCurrentListMapNoExtraKeys!1245 lt!192794 lt!192791 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420170 () Bool)

(assert (=> b!420170 (= e!250290 e!250296)))

(declare-fun res!245071 () Bool)

(assert (=> b!420170 (=> (not res!245071) (not e!250296))))

(assert (=> b!420170 (= res!245071 (= from!863 i!563))))

(assert (=> b!420170 (= lt!192800 (getCurrentListMapNoExtraKeys!1245 lt!192794 lt!192791 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420170 (= lt!192791 (array!25579 (store (arr!12238 _values!549) i!563 (ValueCellFull!5087 v!412)) (size!12590 _values!549)))))

(declare-fun lt!192796 () ListLongMap!5967)

(assert (=> b!420170 (= lt!192796 (getCurrentListMapNoExtraKeys!1245 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420171 () Bool)

(declare-fun res!245070 () Bool)

(assert (=> b!420171 (=> (not res!245070) (not e!250294))))

(assert (=> b!420171 (= res!245070 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12591 _keys!709))))))

(declare-fun mapIsEmpty!17913 () Bool)

(assert (=> mapIsEmpty!17913 mapRes!17913))

(declare-fun b!420172 () Bool)

(declare-fun res!245079 () Bool)

(assert (=> b!420172 (=> (not res!245079) (not e!250294))))

(assert (=> b!420172 (= res!245079 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7059))))

(assert (= (and start!39428 res!245069) b!420158))

(assert (= (and b!420158 res!245075) b!420161))

(assert (= (and b!420161 res!245074) b!420163))

(assert (= (and b!420163 res!245073) b!420172))

(assert (= (and b!420172 res!245079) b!420171))

(assert (= (and b!420171 res!245070) b!420159))

(assert (= (and b!420159 res!245082) b!420167))

(assert (= (and b!420167 res!245077) b!420168))

(assert (= (and b!420168 res!245078) b!420166))

(assert (= (and b!420166 res!245081) b!420162))

(assert (= (and b!420162 res!245076) b!420156))

(assert (= (and b!420156 res!245072) b!420170))

(assert (= (and b!420170 res!245071) b!420155))

(assert (= (and b!420155 c!55254) b!420165))

(assert (= (and b!420155 (not c!55254)) b!420157))

(assert (= (or b!420165 b!420157) bm!29290))

(assert (= (or b!420165 b!420157) bm!29289))

(assert (= (and b!420155 (not res!245080)) b!420169))

(assert (= (and b!420164 condMapEmpty!17913) mapIsEmpty!17913))

(assert (= (and b!420164 (not condMapEmpty!17913)) mapNonEmpty!17913))

(get-info :version)

(assert (= (and mapNonEmpty!17913 ((_ is ValueCellFull!5087) mapValue!17913)) b!420160))

(assert (= (and b!420164 ((_ is ValueCellFull!5087) mapDefault!17913)) b!420154))

(assert (= start!39428 b!420164))

(declare-fun b_lambda!9035 () Bool)

(assert (=> (not b_lambda!9035) (not b!420169)))

(declare-fun t!12426 () Bool)

(declare-fun tb!3323 () Bool)

(assert (=> (and start!39428 (= defaultEntry!557 defaultEntry!557) t!12426) tb!3323))

(declare-fun result!6181 () Bool)

(assert (=> tb!3323 (= result!6181 tp_is_empty!10861)))

(assert (=> b!420169 t!12426))

(declare-fun b_and!17309 () Bool)

(assert (= b_and!17307 (and (=> t!12426 result!6181) b_and!17309)))

(declare-fun m!410017 () Bool)

(assert (=> b!420165 m!410017))

(declare-fun m!410019 () Bool)

(assert (=> b!420162 m!410019))

(declare-fun m!410021 () Bool)

(assert (=> bm!29289 m!410021))

(declare-fun m!410023 () Bool)

(assert (=> b!420168 m!410023))

(declare-fun m!410025 () Bool)

(assert (=> b!420169 m!410025))

(declare-fun m!410027 () Bool)

(assert (=> b!420169 m!410027))

(declare-fun m!410029 () Bool)

(assert (=> b!420169 m!410029))

(declare-fun m!410031 () Bool)

(assert (=> b!420169 m!410031))

(declare-fun m!410033 () Bool)

(assert (=> b!420169 m!410033))

(declare-fun m!410035 () Bool)

(assert (=> b!420169 m!410035))

(declare-fun m!410037 () Bool)

(assert (=> b!420169 m!410037))

(declare-fun m!410039 () Bool)

(assert (=> b!420169 m!410039))

(declare-fun m!410041 () Bool)

(assert (=> b!420169 m!410041))

(declare-fun m!410043 () Bool)

(assert (=> b!420169 m!410043))

(declare-fun m!410045 () Bool)

(assert (=> b!420169 m!410045))

(assert (=> b!420169 m!410041))

(declare-fun m!410047 () Bool)

(assert (=> b!420169 m!410047))

(assert (=> b!420169 m!410025))

(assert (=> b!420169 m!410037))

(declare-fun m!410049 () Bool)

(assert (=> b!420169 m!410049))

(declare-fun m!410051 () Bool)

(assert (=> b!420167 m!410051))

(declare-fun m!410053 () Bool)

(assert (=> b!420170 m!410053))

(assert (=> b!420170 m!410033))

(declare-fun m!410055 () Bool)

(assert (=> b!420170 m!410055))

(declare-fun m!410057 () Bool)

(assert (=> b!420159 m!410057))

(declare-fun m!410059 () Bool)

(assert (=> bm!29290 m!410059))

(declare-fun m!410061 () Bool)

(assert (=> b!420163 m!410061))

(declare-fun m!410063 () Bool)

(assert (=> start!39428 m!410063))

(declare-fun m!410065 () Bool)

(assert (=> start!39428 m!410065))

(declare-fun m!410067 () Bool)

(assert (=> b!420158 m!410067))

(declare-fun m!410069 () Bool)

(assert (=> b!420155 m!410069))

(assert (=> b!420155 m!410069))

(declare-fun m!410071 () Bool)

(assert (=> b!420155 m!410071))

(declare-fun m!410073 () Bool)

(assert (=> b!420155 m!410073))

(declare-fun m!410075 () Bool)

(assert (=> b!420166 m!410075))

(declare-fun m!410077 () Bool)

(assert (=> b!420166 m!410077))

(declare-fun m!410079 () Bool)

(assert (=> mapNonEmpty!17913 m!410079))

(declare-fun m!410081 () Bool)

(assert (=> b!420172 m!410081))

(check-sat (not b!420155) (not b!420163) (not b!420170) (not bm!29289) (not b!420165) (not bm!29290) (not start!39428) (not b!420166) (not mapNonEmpty!17913) (not b!420162) (not b!420158) (not b_lambda!9035) (not b!420169) (not b!420159) (not b!420172) tp_is_empty!10861 (not b_next!9709) b_and!17309 (not b!420168))
(check-sat b_and!17309 (not b_next!9709))
