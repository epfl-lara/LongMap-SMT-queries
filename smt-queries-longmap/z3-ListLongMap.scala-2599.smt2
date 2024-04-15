; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39398 () Bool)

(assert start!39398)

(declare-fun b_free!9679 () Bool)

(declare-fun b_next!9679 () Bool)

(assert (=> start!39398 (= b_free!9679 (not b_next!9679))))

(declare-fun tp!34565 () Bool)

(declare-fun b_and!17207 () Bool)

(assert (=> start!39398 (= tp!34565 b_and!17207)))

(declare-fun b!419047 () Bool)

(declare-fun res!244314 () Bool)

(declare-fun e!249743 () Bool)

(assert (=> b!419047 (=> (not res!244314) (not e!249743))))

(declare-datatypes ((array!25499 0))(
  ( (array!25500 (arr!12199 (Array (_ BitVec 32) (_ BitVec 64))) (size!12552 (_ BitVec 32))) )
))
(declare-fun lt!192044 () array!25499)

(declare-datatypes ((List!7127 0))(
  ( (Nil!7124) (Cons!7123 (h!7979 (_ BitVec 64)) (t!12462 List!7127)) )
))
(declare-fun arrayNoDuplicates!0 (array!25499 (_ BitVec 32) List!7127) Bool)

(assert (=> b!419047 (= res!244314 (arrayNoDuplicates!0 lt!192044 #b00000000000000000000000000000000 Nil!7124))))

(declare-fun b!419048 () Bool)

(declare-fun res!244321 () Bool)

(declare-fun e!249747 () Bool)

(assert (=> b!419048 (=> (not res!244321) (not e!249747))))

(declare-fun _keys!709 () array!25499)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25499 (_ BitVec 32)) Bool)

(assert (=> b!419048 (= res!244321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419049 () Bool)

(declare-fun res!244325 () Bool)

(assert (=> b!419049 (=> (not res!244325) (not e!249747))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419049 (= res!244325 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12552 _keys!709))))))

(declare-datatypes ((V!15547 0))(
  ( (V!15548 (val!5460 Int)) )
))
(declare-fun minValue!515 () V!15547)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5072 0))(
  ( (ValueCellFull!5072 (v!7701 V!15547)) (EmptyCell!5072) )
))
(declare-datatypes ((array!25501 0))(
  ( (array!25502 (arr!12200 (Array (_ BitVec 32) ValueCell!5072)) (size!12553 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25501)

(declare-fun zeroValue!515 () V!15547)

(declare-datatypes ((tuple2!7128 0))(
  ( (tuple2!7129 (_1!3575 (_ BitVec 64)) (_2!3575 V!15547)) )
))
(declare-datatypes ((List!7128 0))(
  ( (Nil!7125) (Cons!7124 (h!7980 tuple2!7128) (t!12463 List!7128)) )
))
(declare-datatypes ((ListLongMap!6031 0))(
  ( (ListLongMap!6032 (toList!3031 List!7128)) )
))
(declare-fun call!29190 () ListLongMap!6031)

(declare-fun bm!29187 () Bool)

(declare-fun c!55161 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!192049 () array!25501)

(declare-fun getCurrentListMapNoExtraKeys!1242 (array!25499 array!25501 (_ BitVec 32) (_ BitVec 32) V!15547 V!15547 (_ BitVec 32) Int) ListLongMap!6031)

(assert (=> bm!29187 (= call!29190 (getCurrentListMapNoExtraKeys!1242 (ite c!55161 _keys!709 lt!192044) (ite c!55161 _values!549 lt!192049) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419050 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!29191 () ListLongMap!6031)

(declare-fun e!249750 () Bool)

(declare-fun v!412 () V!15547)

(declare-fun +!1258 (ListLongMap!6031 tuple2!7128) ListLongMap!6031)

(assert (=> b!419050 (= e!249750 (= call!29191 (+!1258 call!29190 (tuple2!7129 k0!794 v!412))))))

(declare-fun b!419051 () Bool)

(declare-fun e!249748 () Bool)

(declare-fun e!249746 () Bool)

(assert (=> b!419051 (= e!249748 (not e!249746))))

(declare-fun res!244317 () Bool)

(assert (=> b!419051 (=> res!244317 e!249746)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419051 (= res!244317 (validKeyInArray!0 (select (arr!12199 _keys!709) from!863)))))

(assert (=> b!419051 e!249750))

(assert (=> b!419051 (= c!55161 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12360 0))(
  ( (Unit!12361) )
))
(declare-fun lt!192046 () Unit!12360)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!435 (array!25499 array!25501 (_ BitVec 32) (_ BitVec 32) V!15547 V!15547 (_ BitVec 32) (_ BitVec 64) V!15547 (_ BitVec 32) Int) Unit!12360)

(assert (=> b!419051 (= lt!192046 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!435 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17868 () Bool)

(declare-fun mapRes!17868 () Bool)

(declare-fun tp!34566 () Bool)

(declare-fun e!249749 () Bool)

(assert (=> mapNonEmpty!17868 (= mapRes!17868 (and tp!34566 e!249749))))

(declare-fun mapValue!17868 () ValueCell!5072)

(declare-fun mapKey!17868 () (_ BitVec 32))

(declare-fun mapRest!17868 () (Array (_ BitVec 32) ValueCell!5072))

(assert (=> mapNonEmpty!17868 (= (arr!12200 _values!549) (store mapRest!17868 mapKey!17868 mapValue!17868))))

(declare-fun b!419052 () Bool)

(declare-fun tp_is_empty!10831 () Bool)

(assert (=> b!419052 (= e!249749 tp_is_empty!10831)))

(declare-fun b!419053 () Bool)

(declare-fun res!244313 () Bool)

(assert (=> b!419053 (=> (not res!244313) (not e!249747))))

(assert (=> b!419053 (= res!244313 (and (= (size!12553 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12552 _keys!709) (size!12553 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419054 () Bool)

(declare-fun res!244318 () Bool)

(assert (=> b!419054 (=> (not res!244318) (not e!249747))))

(declare-fun arrayContainsKey!0 (array!25499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419054 (= res!244318 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!244323 () Bool)

(assert (=> start!39398 (=> (not res!244323) (not e!249747))))

(assert (=> start!39398 (= res!244323 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12552 _keys!709))))))

(assert (=> start!39398 e!249747))

(assert (=> start!39398 tp_is_empty!10831))

(assert (=> start!39398 tp!34565))

(assert (=> start!39398 true))

(declare-fun e!249745 () Bool)

(declare-fun array_inv!8940 (array!25501) Bool)

(assert (=> start!39398 (and (array_inv!8940 _values!549) e!249745)))

(declare-fun array_inv!8941 (array!25499) Bool)

(assert (=> start!39398 (array_inv!8941 _keys!709)))

(declare-fun b!419055 () Bool)

(assert (=> b!419055 (= e!249747 e!249743)))

(declare-fun res!244315 () Bool)

(assert (=> b!419055 (=> (not res!244315) (not e!249743))))

(assert (=> b!419055 (= res!244315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192044 mask!1025))))

(assert (=> b!419055 (= lt!192044 (array!25500 (store (arr!12199 _keys!709) i!563 k0!794) (size!12552 _keys!709)))))

(declare-fun bm!29188 () Bool)

(assert (=> bm!29188 (= call!29191 (getCurrentListMapNoExtraKeys!1242 (ite c!55161 lt!192044 _keys!709) (ite c!55161 lt!192049 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419056 () Bool)

(assert (=> b!419056 (= e!249750 (= call!29190 call!29191))))

(declare-fun b!419057 () Bool)

(assert (=> b!419057 (= e!249743 e!249748)))

(declare-fun res!244320 () Bool)

(assert (=> b!419057 (=> (not res!244320) (not e!249748))))

(assert (=> b!419057 (= res!244320 (= from!863 i!563))))

(declare-fun lt!192052 () ListLongMap!6031)

(assert (=> b!419057 (= lt!192052 (getCurrentListMapNoExtraKeys!1242 lt!192044 lt!192049 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419057 (= lt!192049 (array!25502 (store (arr!12200 _values!549) i!563 (ValueCellFull!5072 v!412)) (size!12553 _values!549)))))

(declare-fun lt!192045 () ListLongMap!6031)

(assert (=> b!419057 (= lt!192045 (getCurrentListMapNoExtraKeys!1242 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419058 () Bool)

(declare-fun res!244319 () Bool)

(assert (=> b!419058 (=> (not res!244319) (not e!249747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419058 (= res!244319 (validMask!0 mask!1025))))

(declare-fun b!419059 () Bool)

(declare-fun res!244326 () Bool)

(assert (=> b!419059 (=> (not res!244326) (not e!249747))))

(assert (=> b!419059 (= res!244326 (validKeyInArray!0 k0!794))))

(declare-fun b!419060 () Bool)

(declare-fun res!244324 () Bool)

(assert (=> b!419060 (=> (not res!244324) (not e!249747))))

(assert (=> b!419060 (= res!244324 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7124))))

(declare-fun b!419061 () Bool)

(declare-fun e!249744 () Bool)

(assert (=> b!419061 (= e!249745 (and e!249744 mapRes!17868))))

(declare-fun condMapEmpty!17868 () Bool)

(declare-fun mapDefault!17868 () ValueCell!5072)

(assert (=> b!419061 (= condMapEmpty!17868 (= (arr!12200 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5072)) mapDefault!17868)))))

(declare-fun b!419062 () Bool)

(assert (=> b!419062 (= e!249746 true)))

(declare-fun lt!192051 () V!15547)

(declare-fun lt!192043 () ListLongMap!6031)

(declare-fun lt!192053 () tuple2!7128)

(assert (=> b!419062 (= (+!1258 lt!192043 lt!192053) (+!1258 (+!1258 lt!192043 (tuple2!7129 k0!794 lt!192051)) lt!192053))))

(declare-fun lt!192047 () V!15547)

(assert (=> b!419062 (= lt!192053 (tuple2!7129 k0!794 lt!192047))))

(declare-fun lt!192050 () Unit!12360)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!43 (ListLongMap!6031 (_ BitVec 64) V!15547 V!15547) Unit!12360)

(assert (=> b!419062 (= lt!192050 (addSameAsAddTwiceSameKeyDiffValues!43 lt!192043 k0!794 lt!192051 lt!192047))))

(declare-fun lt!192048 () V!15547)

(declare-fun get!6044 (ValueCell!5072 V!15547) V!15547)

(assert (=> b!419062 (= lt!192051 (get!6044 (select (arr!12200 _values!549) from!863) lt!192048))))

(assert (=> b!419062 (= lt!192052 (+!1258 lt!192043 (tuple2!7129 (select (arr!12199 lt!192044) from!863) lt!192047)))))

(assert (=> b!419062 (= lt!192047 (get!6044 (select (store (arr!12200 _values!549) i!563 (ValueCellFull!5072 v!412)) from!863) lt!192048))))

(declare-fun dynLambda!700 (Int (_ BitVec 64)) V!15547)

(assert (=> b!419062 (= lt!192048 (dynLambda!700 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419062 (= lt!192043 (getCurrentListMapNoExtraKeys!1242 lt!192044 lt!192049 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17868 () Bool)

(assert (=> mapIsEmpty!17868 mapRes!17868))

(declare-fun b!419063 () Bool)

(declare-fun res!244316 () Bool)

(assert (=> b!419063 (=> (not res!244316) (not e!249747))))

(assert (=> b!419063 (= res!244316 (or (= (select (arr!12199 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12199 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419064 () Bool)

(assert (=> b!419064 (= e!249744 tp_is_empty!10831)))

(declare-fun b!419065 () Bool)

(declare-fun res!244322 () Bool)

(assert (=> b!419065 (=> (not res!244322) (not e!249743))))

(assert (=> b!419065 (= res!244322 (bvsle from!863 i!563))))

(assert (= (and start!39398 res!244323) b!419058))

(assert (= (and b!419058 res!244319) b!419053))

(assert (= (and b!419053 res!244313) b!419048))

(assert (= (and b!419048 res!244321) b!419060))

(assert (= (and b!419060 res!244324) b!419049))

(assert (= (and b!419049 res!244325) b!419059))

(assert (= (and b!419059 res!244326) b!419063))

(assert (= (and b!419063 res!244316) b!419054))

(assert (= (and b!419054 res!244318) b!419055))

(assert (= (and b!419055 res!244315) b!419047))

(assert (= (and b!419047 res!244314) b!419065))

(assert (= (and b!419065 res!244322) b!419057))

(assert (= (and b!419057 res!244320) b!419051))

(assert (= (and b!419051 c!55161) b!419050))

(assert (= (and b!419051 (not c!55161)) b!419056))

(assert (= (or b!419050 b!419056) bm!29188))

(assert (= (or b!419050 b!419056) bm!29187))

(assert (= (and b!419051 (not res!244317)) b!419062))

(assert (= (and b!419061 condMapEmpty!17868) mapIsEmpty!17868))

(assert (= (and b!419061 (not condMapEmpty!17868)) mapNonEmpty!17868))

(get-info :version)

(assert (= (and mapNonEmpty!17868 ((_ is ValueCellFull!5072) mapValue!17868)) b!419052))

(assert (= (and b!419061 ((_ is ValueCellFull!5072) mapDefault!17868)) b!419064))

(assert (= start!39398 b!419061))

(declare-fun b_lambda!8965 () Bool)

(assert (=> (not b_lambda!8965) (not b!419062)))

(declare-fun t!12461 () Bool)

(declare-fun tb!3293 () Bool)

(assert (=> (and start!39398 (= defaultEntry!557 defaultEntry!557) t!12461) tb!3293))

(declare-fun result!6121 () Bool)

(assert (=> tb!3293 (= result!6121 tp_is_empty!10831)))

(assert (=> b!419062 t!12461))

(declare-fun b_and!17209 () Bool)

(assert (= b_and!17207 (and (=> t!12461 result!6121) b_and!17209)))

(declare-fun m!408079 () Bool)

(assert (=> b!419050 m!408079))

(declare-fun m!408081 () Bool)

(assert (=> start!39398 m!408081))

(declare-fun m!408083 () Bool)

(assert (=> start!39398 m!408083))

(declare-fun m!408085 () Bool)

(assert (=> b!419060 m!408085))

(declare-fun m!408087 () Bool)

(assert (=> b!419055 m!408087))

(declare-fun m!408089 () Bool)

(assert (=> b!419055 m!408089))

(declare-fun m!408091 () Bool)

(assert (=> b!419047 m!408091))

(declare-fun m!408093 () Bool)

(assert (=> b!419051 m!408093))

(assert (=> b!419051 m!408093))

(declare-fun m!408095 () Bool)

(assert (=> b!419051 m!408095))

(declare-fun m!408097 () Bool)

(assert (=> b!419051 m!408097))

(declare-fun m!408099 () Bool)

(assert (=> b!419048 m!408099))

(declare-fun m!408101 () Bool)

(assert (=> b!419054 m!408101))

(declare-fun m!408103 () Bool)

(assert (=> b!419058 m!408103))

(declare-fun m!408105 () Bool)

(assert (=> b!419059 m!408105))

(declare-fun m!408107 () Bool)

(assert (=> b!419063 m!408107))

(declare-fun m!408109 () Bool)

(assert (=> bm!29187 m!408109))

(declare-fun m!408111 () Bool)

(assert (=> mapNonEmpty!17868 m!408111))

(declare-fun m!408113 () Bool)

(assert (=> bm!29188 m!408113))

(declare-fun m!408115 () Bool)

(assert (=> b!419057 m!408115))

(declare-fun m!408117 () Bool)

(assert (=> b!419057 m!408117))

(declare-fun m!408119 () Bool)

(assert (=> b!419057 m!408119))

(declare-fun m!408121 () Bool)

(assert (=> b!419062 m!408121))

(declare-fun m!408123 () Bool)

(assert (=> b!419062 m!408123))

(declare-fun m!408125 () Bool)

(assert (=> b!419062 m!408125))

(assert (=> b!419062 m!408117))

(declare-fun m!408127 () Bool)

(assert (=> b!419062 m!408127))

(assert (=> b!419062 m!408121))

(declare-fun m!408129 () Bool)

(assert (=> b!419062 m!408129))

(declare-fun m!408131 () Bool)

(assert (=> b!419062 m!408131))

(declare-fun m!408133 () Bool)

(assert (=> b!419062 m!408133))

(declare-fun m!408135 () Bool)

(assert (=> b!419062 m!408135))

(assert (=> b!419062 m!408131))

(declare-fun m!408137 () Bool)

(assert (=> b!419062 m!408137))

(assert (=> b!419062 m!408127))

(declare-fun m!408139 () Bool)

(assert (=> b!419062 m!408139))

(declare-fun m!408141 () Bool)

(assert (=> b!419062 m!408141))

(declare-fun m!408143 () Bool)

(assert (=> b!419062 m!408143))

(check-sat (not b!419054) (not b!419051) (not b!419060) (not b!419055) (not b!419048) (not mapNonEmpty!17868) (not start!39398) (not b!419050) (not b_next!9679) tp_is_empty!10831 (not b_lambda!8965) (not b!419058) (not b!419059) b_and!17209 (not b!419047) (not bm!29187) (not b!419062) (not b!419057) (not bm!29188))
(check-sat b_and!17209 (not b_next!9679))
