; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39788 () Bool)

(assert start!39788)

(declare-fun b_free!10069 () Bool)

(declare-fun b_next!10069 () Bool)

(assert (=> start!39788 (= b_free!10069 (not b_next!10069))))

(declare-fun tp!35736 () Bool)

(declare-fun b_and!17771 () Bool)

(assert (=> start!39788 (= tp!35736 b_and!17771)))

(declare-fun res!252037 () Bool)

(declare-fun e!254157 () Bool)

(assert (=> start!39788 (=> (not res!252037) (not e!254157))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26271 0))(
  ( (array!26272 (arr!12585 (Array (_ BitVec 32) (_ BitVec 64))) (size!12938 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26271)

(assert (=> start!39788 (= res!252037 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12938 _keys!709))))))

(assert (=> start!39788 e!254157))

(declare-fun tp_is_empty!11221 () Bool)

(assert (=> start!39788 tp_is_empty!11221))

(assert (=> start!39788 tp!35736))

(assert (=> start!39788 true))

(declare-datatypes ((V!16067 0))(
  ( (V!16068 (val!5655 Int)) )
))
(declare-datatypes ((ValueCell!5267 0))(
  ( (ValueCellFull!5267 (v!7896 V!16067)) (EmptyCell!5267) )
))
(declare-datatypes ((array!26273 0))(
  ( (array!26274 (arr!12586 (Array (_ BitVec 32) ValueCell!5267)) (size!12939 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26273)

(declare-fun e!254159 () Bool)

(declare-fun array_inv!9198 (array!26273) Bool)

(assert (=> start!39788 (and (array_inv!9198 _values!549) e!254159)))

(declare-fun array_inv!9199 (array!26271) Bool)

(assert (=> start!39788 (array_inv!9199 _keys!709)))

(declare-fun b!429103 () Bool)

(declare-fun e!254160 () Bool)

(declare-fun e!254152 () Bool)

(assert (=> b!429103 (= e!254160 (not e!254152))))

(declare-fun res!252029 () Bool)

(assert (=> b!429103 (=> res!252029 e!254152)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429103 (= res!252029 (not (validKeyInArray!0 (select (arr!12585 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7450 0))(
  ( (tuple2!7451 (_1!3736 (_ BitVec 64)) (_2!3736 V!16067)) )
))
(declare-datatypes ((List!7449 0))(
  ( (Nil!7446) (Cons!7445 (h!8301 tuple2!7450) (t!12958 List!7449)) )
))
(declare-datatypes ((ListLongMap!6353 0))(
  ( (ListLongMap!6354 (toList!3192 List!7449)) )
))
(declare-fun lt!196001 () ListLongMap!6353)

(declare-fun lt!195993 () ListLongMap!6353)

(assert (=> b!429103 (= lt!196001 lt!195993)))

(declare-fun v!412 () V!16067)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!196000 () ListLongMap!6353)

(declare-fun +!1370 (ListLongMap!6353 tuple2!7450) ListLongMap!6353)

(assert (=> b!429103 (= lt!195993 (+!1370 lt!196000 (tuple2!7451 k0!794 v!412)))))

(declare-fun minValue!515 () V!16067)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!195992 () array!26273)

(declare-fun zeroValue!515 () V!16067)

(declare-fun lt!195999 () array!26271)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1399 (array!26271 array!26273 (_ BitVec 32) (_ BitVec 32) V!16067 V!16067 (_ BitVec 32) Int) ListLongMap!6353)

(assert (=> b!429103 (= lt!196001 (getCurrentListMapNoExtraKeys!1399 lt!195999 lt!195992 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429103 (= lt!196000 (getCurrentListMapNoExtraKeys!1399 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12604 0))(
  ( (Unit!12605) )
))
(declare-fun lt!195997 () Unit!12604)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!535 (array!26271 array!26273 (_ BitVec 32) (_ BitVec 32) V!16067 V!16067 (_ BitVec 32) (_ BitVec 64) V!16067 (_ BitVec 32) Int) Unit!12604)

(assert (=> b!429103 (= lt!195997 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!535 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429104 () Bool)

(declare-fun e!254158 () Bool)

(assert (=> b!429104 (= e!254158 e!254160)))

(declare-fun res!252027 () Bool)

(assert (=> b!429104 (=> (not res!252027) (not e!254160))))

(assert (=> b!429104 (= res!252027 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195994 () ListLongMap!6353)

(assert (=> b!429104 (= lt!195994 (getCurrentListMapNoExtraKeys!1399 lt!195999 lt!195992 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429104 (= lt!195992 (array!26274 (store (arr!12586 _values!549) i!563 (ValueCellFull!5267 v!412)) (size!12939 _values!549)))))

(declare-fun lt!195996 () ListLongMap!6353)

(assert (=> b!429104 (= lt!195996 (getCurrentListMapNoExtraKeys!1399 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429105 () Bool)

(declare-fun res!252028 () Bool)

(assert (=> b!429105 (=> (not res!252028) (not e!254157))))

(assert (=> b!429105 (= res!252028 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12938 _keys!709))))))

(declare-fun mapIsEmpty!18453 () Bool)

(declare-fun mapRes!18453 () Bool)

(assert (=> mapIsEmpty!18453 mapRes!18453))

(declare-fun mapNonEmpty!18453 () Bool)

(declare-fun tp!35735 () Bool)

(declare-fun e!254153 () Bool)

(assert (=> mapNonEmpty!18453 (= mapRes!18453 (and tp!35735 e!254153))))

(declare-fun mapRest!18453 () (Array (_ BitVec 32) ValueCell!5267))

(declare-fun mapValue!18453 () ValueCell!5267)

(declare-fun mapKey!18453 () (_ BitVec 32))

(assert (=> mapNonEmpty!18453 (= (arr!12586 _values!549) (store mapRest!18453 mapKey!18453 mapValue!18453))))

(declare-fun b!429106 () Bool)

(declare-fun e!254156 () Bool)

(assert (=> b!429106 (= e!254159 (and e!254156 mapRes!18453))))

(declare-fun condMapEmpty!18453 () Bool)

(declare-fun mapDefault!18453 () ValueCell!5267)

(assert (=> b!429106 (= condMapEmpty!18453 (= (arr!12586 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5267)) mapDefault!18453)))))

(declare-fun b!429107 () Bool)

(declare-fun res!252038 () Bool)

(assert (=> b!429107 (=> (not res!252038) (not e!254158))))

(assert (=> b!429107 (= res!252038 (bvsle from!863 i!563))))

(declare-fun b!429108 () Bool)

(declare-fun e!254154 () Unit!12604)

(declare-fun Unit!12606 () Unit!12604)

(assert (=> b!429108 (= e!254154 Unit!12606)))

(declare-fun lt!195998 () Unit!12604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12604)

(assert (=> b!429108 (= lt!195998 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429108 false))

(declare-fun b!429109 () Bool)

(assert (=> b!429109 (= e!254152 true)))

(assert (=> b!429109 (not (= (select (arr!12585 _keys!709) from!863) k0!794))))

(declare-fun lt!195995 () Unit!12604)

(assert (=> b!429109 (= lt!195995 e!254154)))

(declare-fun c!55368 () Bool)

(assert (=> b!429109 (= c!55368 (= (select (arr!12585 _keys!709) from!863) k0!794))))

(declare-fun get!6241 (ValueCell!5267 V!16067) V!16067)

(declare-fun dynLambda!767 (Int (_ BitVec 64)) V!16067)

(assert (=> b!429109 (= lt!195994 (+!1370 lt!195993 (tuple2!7451 (select (arr!12585 _keys!709) from!863) (get!6241 (select (arr!12586 _values!549) from!863) (dynLambda!767 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429110 () Bool)

(declare-fun res!252039 () Bool)

(assert (=> b!429110 (=> (not res!252039) (not e!254157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26271 (_ BitVec 32)) Bool)

(assert (=> b!429110 (= res!252039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429111 () Bool)

(assert (=> b!429111 (= e!254153 tp_is_empty!11221)))

(declare-fun b!429112 () Bool)

(declare-fun res!252034 () Bool)

(assert (=> b!429112 (=> (not res!252034) (not e!254157))))

(declare-fun arrayContainsKey!0 (array!26271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429112 (= res!252034 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429113 () Bool)

(assert (=> b!429113 (= e!254157 e!254158)))

(declare-fun res!252032 () Bool)

(assert (=> b!429113 (=> (not res!252032) (not e!254158))))

(assert (=> b!429113 (= res!252032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195999 mask!1025))))

(assert (=> b!429113 (= lt!195999 (array!26272 (store (arr!12585 _keys!709) i!563 k0!794) (size!12938 _keys!709)))))

(declare-fun b!429114 () Bool)

(declare-fun res!252035 () Bool)

(assert (=> b!429114 (=> (not res!252035) (not e!254157))))

(assert (=> b!429114 (= res!252035 (validKeyInArray!0 k0!794))))

(declare-fun b!429115 () Bool)

(declare-fun res!252030 () Bool)

(assert (=> b!429115 (=> (not res!252030) (not e!254157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429115 (= res!252030 (validMask!0 mask!1025))))

(declare-fun b!429116 () Bool)

(declare-fun res!252033 () Bool)

(assert (=> b!429116 (=> (not res!252033) (not e!254158))))

(declare-datatypes ((List!7450 0))(
  ( (Nil!7447) (Cons!7446 (h!8302 (_ BitVec 64)) (t!12959 List!7450)) )
))
(declare-fun arrayNoDuplicates!0 (array!26271 (_ BitVec 32) List!7450) Bool)

(assert (=> b!429116 (= res!252033 (arrayNoDuplicates!0 lt!195999 #b00000000000000000000000000000000 Nil!7447))))

(declare-fun b!429117 () Bool)

(declare-fun res!252031 () Bool)

(assert (=> b!429117 (=> (not res!252031) (not e!254157))))

(assert (=> b!429117 (= res!252031 (and (= (size!12939 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12938 _keys!709) (size!12939 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429118 () Bool)

(declare-fun res!252036 () Bool)

(assert (=> b!429118 (=> (not res!252036) (not e!254157))))

(assert (=> b!429118 (= res!252036 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7447))))

(declare-fun b!429119 () Bool)

(declare-fun res!252026 () Bool)

(assert (=> b!429119 (=> (not res!252026) (not e!254157))))

(assert (=> b!429119 (= res!252026 (or (= (select (arr!12585 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12585 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429120 () Bool)

(assert (=> b!429120 (= e!254156 tp_is_empty!11221)))

(declare-fun b!429121 () Bool)

(declare-fun Unit!12607 () Unit!12604)

(assert (=> b!429121 (= e!254154 Unit!12607)))

(assert (= (and start!39788 res!252037) b!429115))

(assert (= (and b!429115 res!252030) b!429117))

(assert (= (and b!429117 res!252031) b!429110))

(assert (= (and b!429110 res!252039) b!429118))

(assert (= (and b!429118 res!252036) b!429105))

(assert (= (and b!429105 res!252028) b!429114))

(assert (= (and b!429114 res!252035) b!429119))

(assert (= (and b!429119 res!252026) b!429112))

(assert (= (and b!429112 res!252034) b!429113))

(assert (= (and b!429113 res!252032) b!429116))

(assert (= (and b!429116 res!252033) b!429107))

(assert (= (and b!429107 res!252038) b!429104))

(assert (= (and b!429104 res!252027) b!429103))

(assert (= (and b!429103 (not res!252029)) b!429109))

(assert (= (and b!429109 c!55368) b!429108))

(assert (= (and b!429109 (not c!55368)) b!429121))

(assert (= (and b!429106 condMapEmpty!18453) mapIsEmpty!18453))

(assert (= (and b!429106 (not condMapEmpty!18453)) mapNonEmpty!18453))

(get-info :version)

(assert (= (and mapNonEmpty!18453 ((_ is ValueCellFull!5267) mapValue!18453)) b!429111))

(assert (= (and b!429106 ((_ is ValueCellFull!5267) mapDefault!18453)) b!429120))

(assert (= start!39788 b!429106))

(declare-fun b_lambda!9139 () Bool)

(assert (=> (not b_lambda!9139) (not b!429109)))

(declare-fun t!12957 () Bool)

(declare-fun tb!3467 () Bool)

(assert (=> (and start!39788 (= defaultEntry!557 defaultEntry!557) t!12957) tb!3467))

(declare-fun result!6469 () Bool)

(assert (=> tb!3467 (= result!6469 tp_is_empty!11221)))

(assert (=> b!429109 t!12957))

(declare-fun b_and!17773 () Bool)

(assert (= b_and!17771 (and (=> t!12957 result!6469) b_and!17773)))

(declare-fun m!416961 () Bool)

(assert (=> b!429110 m!416961))

(declare-fun m!416963 () Bool)

(assert (=> b!429108 m!416963))

(declare-fun m!416965 () Bool)

(assert (=> b!429103 m!416965))

(declare-fun m!416967 () Bool)

(assert (=> b!429103 m!416967))

(declare-fun m!416969 () Bool)

(assert (=> b!429103 m!416969))

(assert (=> b!429103 m!416965))

(declare-fun m!416971 () Bool)

(assert (=> b!429103 m!416971))

(declare-fun m!416973 () Bool)

(assert (=> b!429103 m!416973))

(declare-fun m!416975 () Bool)

(assert (=> b!429103 m!416975))

(declare-fun m!416977 () Bool)

(assert (=> b!429118 m!416977))

(declare-fun m!416979 () Bool)

(assert (=> b!429115 m!416979))

(assert (=> b!429109 m!416965))

(declare-fun m!416981 () Bool)

(assert (=> b!429109 m!416981))

(declare-fun m!416983 () Bool)

(assert (=> b!429109 m!416983))

(declare-fun m!416985 () Bool)

(assert (=> b!429109 m!416985))

(assert (=> b!429109 m!416983))

(assert (=> b!429109 m!416981))

(declare-fun m!416987 () Bool)

(assert (=> b!429109 m!416987))

(declare-fun m!416989 () Bool)

(assert (=> mapNonEmpty!18453 m!416989))

(declare-fun m!416991 () Bool)

(assert (=> b!429119 m!416991))

(declare-fun m!416993 () Bool)

(assert (=> b!429104 m!416993))

(declare-fun m!416995 () Bool)

(assert (=> b!429104 m!416995))

(declare-fun m!416997 () Bool)

(assert (=> b!429104 m!416997))

(declare-fun m!416999 () Bool)

(assert (=> b!429112 m!416999))

(declare-fun m!417001 () Bool)

(assert (=> b!429114 m!417001))

(declare-fun m!417003 () Bool)

(assert (=> b!429113 m!417003))

(declare-fun m!417005 () Bool)

(assert (=> b!429113 m!417005))

(declare-fun m!417007 () Bool)

(assert (=> b!429116 m!417007))

(declare-fun m!417009 () Bool)

(assert (=> start!39788 m!417009))

(declare-fun m!417011 () Bool)

(assert (=> start!39788 m!417011))

(check-sat b_and!17773 (not b!429116) (not b!429115) (not b!429118) (not b_lambda!9139) (not mapNonEmpty!18453) (not b!429104) (not b!429103) (not start!39788) tp_is_empty!11221 (not b_next!10069) (not b!429114) (not b!429109) (not b!429110) (not b!429113) (not b!429112) (not b!429108))
(check-sat b_and!17773 (not b_next!10069))
