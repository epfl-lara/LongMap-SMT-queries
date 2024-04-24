; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41060 () Bool)

(assert start!41060)

(declare-fun b_free!10987 () Bool)

(declare-fun b_next!10987 () Bool)

(assert (=> start!41060 (= b_free!10987 (not b_next!10987))))

(declare-fun tp!38790 () Bool)

(declare-fun b_and!19191 () Bool)

(assert (=> start!41060 (= tp!38790 b_and!19191)))

(declare-fun b!458136 () Bool)

(declare-fun res!273727 () Bool)

(declare-fun e!267480 () Bool)

(assert (=> b!458136 (=> (not res!273727) (not e!267480))))

(declare-datatypes ((array!28440 0))(
  ( (array!28441 (arr!13662 (Array (_ BitVec 32) (_ BitVec 64))) (size!14014 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28440)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28440 (_ BitVec 32)) Bool)

(assert (=> b!458136 (= res!273727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!273729 () Bool)

(assert (=> start!41060 (=> (not res!273729) (not e!267480))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!41060 (= res!273729 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14014 _keys!709))))))

(assert (=> start!41060 e!267480))

(declare-fun tp_is_empty!12325 () Bool)

(assert (=> start!41060 tp_is_empty!12325))

(assert (=> start!41060 tp!38790))

(assert (=> start!41060 true))

(declare-datatypes ((V!17539 0))(
  ( (V!17540 (val!6207 Int)) )
))
(declare-datatypes ((ValueCell!5819 0))(
  ( (ValueCellFull!5819 (v!8478 V!17539)) (EmptyCell!5819) )
))
(declare-datatypes ((array!28442 0))(
  ( (array!28443 (arr!13663 (Array (_ BitVec 32) ValueCell!5819)) (size!14015 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28442)

(declare-fun e!267476 () Bool)

(declare-fun array_inv!9968 (array!28442) Bool)

(assert (=> start!41060 (and (array_inv!9968 _values!549) e!267476)))

(declare-fun array_inv!9969 (array!28440) Bool)

(assert (=> start!41060 (array_inv!9969 _keys!709)))

(declare-fun b!458137 () Bool)

(declare-fun e!267479 () Bool)

(assert (=> b!458137 (= e!267479 tp_is_empty!12325)))

(declare-fun mapNonEmpty!20131 () Bool)

(declare-fun mapRes!20131 () Bool)

(declare-fun tp!38791 () Bool)

(declare-fun e!267478 () Bool)

(assert (=> mapNonEmpty!20131 (= mapRes!20131 (and tp!38791 e!267478))))

(declare-fun mapRest!20131 () (Array (_ BitVec 32) ValueCell!5819))

(declare-fun mapValue!20131 () ValueCell!5819)

(declare-fun mapKey!20131 () (_ BitVec 32))

(assert (=> mapNonEmpty!20131 (= (arr!13663 _values!549) (store mapRest!20131 mapKey!20131 mapValue!20131))))

(declare-fun b!458138 () Bool)

(declare-fun res!273723 () Bool)

(assert (=> b!458138 (=> (not res!273723) (not e!267480))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!458138 (= res!273723 (and (= (size!14015 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14014 _keys!709) (size!14015 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458139 () Bool)

(declare-fun e!267477 () Bool)

(declare-fun e!267482 () Bool)

(assert (=> b!458139 (= e!267477 (not e!267482))))

(declare-fun res!273726 () Bool)

(assert (=> b!458139 (=> res!273726 e!267482)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458139 (= res!273726 (not (validKeyInArray!0 (select (arr!13662 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8096 0))(
  ( (tuple2!8097 (_1!4059 (_ BitVec 64)) (_2!4059 V!17539)) )
))
(declare-datatypes ((List!8168 0))(
  ( (Nil!8165) (Cons!8164 (h!9020 tuple2!8096) (t!14026 List!8168)) )
))
(declare-datatypes ((ListLongMap!7011 0))(
  ( (ListLongMap!7012 (toList!3521 List!8168)) )
))
(declare-fun lt!207272 () ListLongMap!7011)

(declare-fun lt!207270 () ListLongMap!7011)

(assert (=> b!458139 (= lt!207272 lt!207270)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!207276 () ListLongMap!7011)

(declare-fun v!412 () V!17539)

(declare-fun +!1603 (ListLongMap!7011 tuple2!8096) ListLongMap!7011)

(assert (=> b!458139 (= lt!207270 (+!1603 lt!207276 (tuple2!8097 k0!794 v!412)))))

(declare-fun minValue!515 () V!17539)

(declare-fun lt!207273 () array!28440)

(declare-fun zeroValue!515 () V!17539)

(declare-fun lt!207274 () array!28442)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1750 (array!28440 array!28442 (_ BitVec 32) (_ BitVec 32) V!17539 V!17539 (_ BitVec 32) Int) ListLongMap!7011)

(assert (=> b!458139 (= lt!207272 (getCurrentListMapNoExtraKeys!1750 lt!207273 lt!207274 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458139 (= lt!207276 (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13309 0))(
  ( (Unit!13310) )
))
(declare-fun lt!207269 () Unit!13309)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!762 (array!28440 array!28442 (_ BitVec 32) (_ BitVec 32) V!17539 V!17539 (_ BitVec 32) (_ BitVec 64) V!17539 (_ BitVec 32) Int) Unit!13309)

(assert (=> b!458139 (= lt!207269 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!762 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458140 () Bool)

(declare-fun res!273719 () Bool)

(assert (=> b!458140 (=> (not res!273719) (not e!267480))))

(assert (=> b!458140 (= res!273719 (or (= (select (arr!13662 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13662 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458141 () Bool)

(declare-fun res!273722 () Bool)

(declare-fun e!267481 () Bool)

(assert (=> b!458141 (=> (not res!273722) (not e!267481))))

(assert (=> b!458141 (= res!273722 (bvsle from!863 i!563))))

(declare-fun b!458142 () Bool)

(declare-fun res!273725 () Bool)

(assert (=> b!458142 (=> (not res!273725) (not e!267480))))

(declare-datatypes ((List!8169 0))(
  ( (Nil!8166) (Cons!8165 (h!9021 (_ BitVec 64)) (t!14027 List!8169)) )
))
(declare-fun arrayNoDuplicates!0 (array!28440 (_ BitVec 32) List!8169) Bool)

(assert (=> b!458142 (= res!273725 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8166))))

(declare-fun mapIsEmpty!20131 () Bool)

(assert (=> mapIsEmpty!20131 mapRes!20131))

(declare-fun b!458143 () Bool)

(assert (=> b!458143 (= e!267482 (or (not (= (select (arr!13662 _keys!709) from!863) k0!794)) (bvsge from!863 (size!14014 _keys!709)) (bvslt (size!14014 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun lt!207271 () ListLongMap!7011)

(declare-fun get!6737 (ValueCell!5819 V!17539) V!17539)

(declare-fun dynLambda!885 (Int (_ BitVec 64)) V!17539)

(assert (=> b!458143 (= lt!207271 (+!1603 lt!207270 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458144 () Bool)

(declare-fun res!273718 () Bool)

(assert (=> b!458144 (=> (not res!273718) (not e!267480))))

(assert (=> b!458144 (= res!273718 (validKeyInArray!0 k0!794))))

(declare-fun b!458145 () Bool)

(declare-fun res!273730 () Bool)

(assert (=> b!458145 (=> (not res!273730) (not e!267480))))

(assert (=> b!458145 (= res!273730 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14014 _keys!709))))))

(declare-fun b!458146 () Bool)

(assert (=> b!458146 (= e!267481 e!267477)))

(declare-fun res!273731 () Bool)

(assert (=> b!458146 (=> (not res!273731) (not e!267477))))

(assert (=> b!458146 (= res!273731 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!458146 (= lt!207271 (getCurrentListMapNoExtraKeys!1750 lt!207273 lt!207274 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458146 (= lt!207274 (array!28443 (store (arr!13663 _values!549) i!563 (ValueCellFull!5819 v!412)) (size!14015 _values!549)))))

(declare-fun lt!207275 () ListLongMap!7011)

(assert (=> b!458146 (= lt!207275 (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458147 () Bool)

(assert (=> b!458147 (= e!267480 e!267481)))

(declare-fun res!273720 () Bool)

(assert (=> b!458147 (=> (not res!273720) (not e!267481))))

(assert (=> b!458147 (= res!273720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207273 mask!1025))))

(assert (=> b!458147 (= lt!207273 (array!28441 (store (arr!13662 _keys!709) i!563 k0!794) (size!14014 _keys!709)))))

(declare-fun b!458148 () Bool)

(assert (=> b!458148 (= e!267478 tp_is_empty!12325)))

(declare-fun b!458149 () Bool)

(declare-fun res!273721 () Bool)

(assert (=> b!458149 (=> (not res!273721) (not e!267481))))

(assert (=> b!458149 (= res!273721 (arrayNoDuplicates!0 lt!207273 #b00000000000000000000000000000000 Nil!8166))))

(declare-fun b!458150 () Bool)

(assert (=> b!458150 (= e!267476 (and e!267479 mapRes!20131))))

(declare-fun condMapEmpty!20131 () Bool)

(declare-fun mapDefault!20131 () ValueCell!5819)

(assert (=> b!458150 (= condMapEmpty!20131 (= (arr!13663 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5819)) mapDefault!20131)))))

(declare-fun b!458151 () Bool)

(declare-fun res!273728 () Bool)

(assert (=> b!458151 (=> (not res!273728) (not e!267480))))

(declare-fun arrayContainsKey!0 (array!28440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458151 (= res!273728 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458152 () Bool)

(declare-fun res!273724 () Bool)

(assert (=> b!458152 (=> (not res!273724) (not e!267480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458152 (= res!273724 (validMask!0 mask!1025))))

(assert (= (and start!41060 res!273729) b!458152))

(assert (= (and b!458152 res!273724) b!458138))

(assert (= (and b!458138 res!273723) b!458136))

(assert (= (and b!458136 res!273727) b!458142))

(assert (= (and b!458142 res!273725) b!458145))

(assert (= (and b!458145 res!273730) b!458144))

(assert (= (and b!458144 res!273718) b!458140))

(assert (= (and b!458140 res!273719) b!458151))

(assert (= (and b!458151 res!273728) b!458147))

(assert (= (and b!458147 res!273720) b!458149))

(assert (= (and b!458149 res!273721) b!458141))

(assert (= (and b!458141 res!273722) b!458146))

(assert (= (and b!458146 res!273731) b!458139))

(assert (= (and b!458139 (not res!273726)) b!458143))

(assert (= (and b!458150 condMapEmpty!20131) mapIsEmpty!20131))

(assert (= (and b!458150 (not condMapEmpty!20131)) mapNonEmpty!20131))

(get-info :version)

(assert (= (and mapNonEmpty!20131 ((_ is ValueCellFull!5819) mapValue!20131)) b!458148))

(assert (= (and b!458150 ((_ is ValueCellFull!5819) mapDefault!20131)) b!458137))

(assert (= start!41060 b!458150))

(declare-fun b_lambda!9767 () Bool)

(assert (=> (not b_lambda!9767) (not b!458143)))

(declare-fun t!14025 () Bool)

(declare-fun tb!3815 () Bool)

(assert (=> (and start!41060 (= defaultEntry!557 defaultEntry!557) t!14025) tb!3815))

(declare-fun result!7179 () Bool)

(assert (=> tb!3815 (= result!7179 tp_is_empty!12325)))

(assert (=> b!458143 t!14025))

(declare-fun b_and!19193 () Bool)

(assert (= b_and!19191 (and (=> t!14025 result!7179) b_and!19193)))

(declare-fun m!441693 () Bool)

(assert (=> b!458147 m!441693))

(declare-fun m!441695 () Bool)

(assert (=> b!458147 m!441695))

(declare-fun m!441697 () Bool)

(assert (=> b!458151 m!441697))

(declare-fun m!441699 () Bool)

(assert (=> b!458140 m!441699))

(declare-fun m!441701 () Bool)

(assert (=> b!458143 m!441701))

(declare-fun m!441703 () Bool)

(assert (=> b!458143 m!441703))

(declare-fun m!441705 () Bool)

(assert (=> b!458143 m!441705))

(declare-fun m!441707 () Bool)

(assert (=> b!458143 m!441707))

(assert (=> b!458143 m!441705))

(assert (=> b!458143 m!441703))

(declare-fun m!441709 () Bool)

(assert (=> b!458143 m!441709))

(declare-fun m!441711 () Bool)

(assert (=> b!458136 m!441711))

(declare-fun m!441713 () Bool)

(assert (=> b!458146 m!441713))

(declare-fun m!441715 () Bool)

(assert (=> b!458146 m!441715))

(declare-fun m!441717 () Bool)

(assert (=> b!458146 m!441717))

(declare-fun m!441719 () Bool)

(assert (=> b!458152 m!441719))

(declare-fun m!441721 () Bool)

(assert (=> b!458142 m!441721))

(declare-fun m!441723 () Bool)

(assert (=> mapNonEmpty!20131 m!441723))

(declare-fun m!441725 () Bool)

(assert (=> b!458144 m!441725))

(declare-fun m!441727 () Bool)

(assert (=> b!458149 m!441727))

(declare-fun m!441729 () Bool)

(assert (=> start!41060 m!441729))

(declare-fun m!441731 () Bool)

(assert (=> start!41060 m!441731))

(assert (=> b!458139 m!441701))

(declare-fun m!441733 () Bool)

(assert (=> b!458139 m!441733))

(declare-fun m!441735 () Bool)

(assert (=> b!458139 m!441735))

(declare-fun m!441737 () Bool)

(assert (=> b!458139 m!441737))

(assert (=> b!458139 m!441701))

(declare-fun m!441739 () Bool)

(assert (=> b!458139 m!441739))

(declare-fun m!441741 () Bool)

(assert (=> b!458139 m!441741))

(check-sat (not b!458152) (not mapNonEmpty!20131) (not b!458147) (not b!458139) (not b!458146) (not b_lambda!9767) (not b!458142) (not b!458149) (not b!458136) tp_is_empty!12325 b_and!19193 (not b!458144) (not b!458143) (not b!458151) (not b_next!10987) (not start!41060))
(check-sat b_and!19193 (not b_next!10987))
(get-model)

(declare-fun b_lambda!9773 () Bool)

(assert (= b_lambda!9767 (or (and start!41060 b_free!10987) b_lambda!9773)))

(check-sat (not b!458152) (not mapNonEmpty!20131) (not b!458147) (not b!458139) (not b!458146) (not b!458142) (not b!458149) (not b!458136) tp_is_empty!12325 b_and!19193 (not b!458144) (not b!458143) (not b!458151) (not b_next!10987) (not b_lambda!9773) (not start!41060))
(check-sat b_and!19193 (not b_next!10987))
(get-model)

(declare-fun d!74739 () Bool)

(declare-fun e!267534 () Bool)

(assert (=> d!74739 e!267534))

(declare-fun res!273820 () Bool)

(assert (=> d!74739 (=> (not res!273820) (not e!267534))))

(declare-fun lt!207336 () ListLongMap!7011)

(declare-fun contains!2483 (ListLongMap!7011 (_ BitVec 64)) Bool)

(assert (=> d!74739 (= res!273820 (contains!2483 lt!207336 (_1!4059 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!207334 () List!8168)

(assert (=> d!74739 (= lt!207336 (ListLongMap!7012 lt!207334))))

(declare-fun lt!207333 () Unit!13309)

(declare-fun lt!207335 () Unit!13309)

(assert (=> d!74739 (= lt!207333 lt!207335)))

(declare-datatypes ((Option!379 0))(
  ( (Some!378 (v!8484 V!17539)) (None!377) )
))
(declare-fun getValueByKey!373 (List!8168 (_ BitVec 64)) Option!379)

(assert (=> d!74739 (= (getValueByKey!373 lt!207334 (_1!4059 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!378 (_2!4059 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!195 (List!8168 (_ BitVec 64) V!17539) Unit!13309)

(assert (=> d!74739 (= lt!207335 (lemmaContainsTupThenGetReturnValue!195 lt!207334 (_1!4059 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4059 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!198 (List!8168 (_ BitVec 64) V!17539) List!8168)

(assert (=> d!74739 (= lt!207334 (insertStrictlySorted!198 (toList!3521 lt!207270) (_1!4059 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4059 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74739 (= (+!1603 lt!207270 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!207336)))

(declare-fun b!458265 () Bool)

(declare-fun res!273821 () Bool)

(assert (=> b!458265 (=> (not res!273821) (not e!267534))))

(assert (=> b!458265 (= res!273821 (= (getValueByKey!373 (toList!3521 lt!207336) (_1!4059 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!378 (_2!4059 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!458266 () Bool)

(declare-fun contains!2484 (List!8168 tuple2!8096) Bool)

(assert (=> b!458266 (= e!267534 (contains!2484 (toList!3521 lt!207336) (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74739 res!273820) b!458265))

(assert (= (and b!458265 res!273821) b!458266))

(declare-fun m!441843 () Bool)

(assert (=> d!74739 m!441843))

(declare-fun m!441845 () Bool)

(assert (=> d!74739 m!441845))

(declare-fun m!441847 () Bool)

(assert (=> d!74739 m!441847))

(declare-fun m!441849 () Bool)

(assert (=> d!74739 m!441849))

(declare-fun m!441851 () Bool)

(assert (=> b!458265 m!441851))

(declare-fun m!441853 () Bool)

(assert (=> b!458266 m!441853))

(assert (=> b!458143 d!74739))

(declare-fun d!74741 () Bool)

(declare-fun c!56353 () Bool)

(assert (=> d!74741 (= c!56353 ((_ is ValueCellFull!5819) (select (arr!13663 _values!549) from!863)))))

(declare-fun e!267537 () V!17539)

(assert (=> d!74741 (= (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!267537)))

(declare-fun b!458271 () Bool)

(declare-fun get!6740 (ValueCell!5819 V!17539) V!17539)

(assert (=> b!458271 (= e!267537 (get!6740 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458272 () Bool)

(declare-fun get!6741 (ValueCell!5819 V!17539) V!17539)

(assert (=> b!458272 (= e!267537 (get!6741 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74741 c!56353) b!458271))

(assert (= (and d!74741 (not c!56353)) b!458272))

(assert (=> b!458271 m!441705))

(assert (=> b!458271 m!441703))

(declare-fun m!441855 () Bool)

(assert (=> b!458271 m!441855))

(assert (=> b!458272 m!441705))

(assert (=> b!458272 m!441703))

(declare-fun m!441857 () Bool)

(assert (=> b!458272 m!441857))

(assert (=> b!458143 d!74741))

(declare-fun d!74743 () Bool)

(declare-fun e!267553 () Bool)

(assert (=> d!74743 e!267553))

(declare-fun res!273833 () Bool)

(assert (=> d!74743 (=> (not res!273833) (not e!267553))))

(declare-fun lt!207357 () ListLongMap!7011)

(assert (=> d!74743 (= res!273833 (not (contains!2483 lt!207357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!267556 () ListLongMap!7011)

(assert (=> d!74743 (= lt!207357 e!267556)))

(declare-fun c!56365 () Bool)

(assert (=> d!74743 (= c!56365 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14014 _keys!709)))))

(assert (=> d!74743 (validMask!0 mask!1025)))

(assert (=> d!74743 (= (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207357)))

(declare-fun b!458297 () Bool)

(declare-fun e!267557 () Bool)

(declare-fun isEmpty!568 (ListLongMap!7011) Bool)

(assert (=> b!458297 (= e!267557 (isEmpty!568 lt!207357))))

(declare-fun b!458298 () Bool)

(declare-fun e!267554 () ListLongMap!7011)

(assert (=> b!458298 (= e!267556 e!267554)))

(declare-fun c!56364 () Bool)

(assert (=> b!458298 (= c!56364 (validKeyInArray!0 (select (arr!13662 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458299 () Bool)

(declare-fun lt!207353 () Unit!13309)

(declare-fun lt!207356 () Unit!13309)

(assert (=> b!458299 (= lt!207353 lt!207356)))

(declare-fun lt!207352 () ListLongMap!7011)

(declare-fun lt!207355 () (_ BitVec 64))

(declare-fun lt!207351 () (_ BitVec 64))

(declare-fun lt!207354 () V!17539)

(assert (=> b!458299 (not (contains!2483 (+!1603 lt!207352 (tuple2!8097 lt!207355 lt!207354)) lt!207351))))

(declare-fun addStillNotContains!150 (ListLongMap!7011 (_ BitVec 64) V!17539 (_ BitVec 64)) Unit!13309)

(assert (=> b!458299 (= lt!207356 (addStillNotContains!150 lt!207352 lt!207355 lt!207354 lt!207351))))

(assert (=> b!458299 (= lt!207351 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458299 (= lt!207354 (get!6737 (select (arr!13663 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458299 (= lt!207355 (select (arr!13662 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30100 () ListLongMap!7011)

(assert (=> b!458299 (= lt!207352 call!30100)))

(assert (=> b!458299 (= e!267554 (+!1603 call!30100 (tuple2!8097 (select (arr!13662 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6737 (select (arr!13663 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458300 () Bool)

(declare-fun res!273832 () Bool)

(assert (=> b!458300 (=> (not res!273832) (not e!267553))))

(assert (=> b!458300 (= res!273832 (not (contains!2483 lt!207357 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458301 () Bool)

(declare-fun e!267558 () Bool)

(declare-fun e!267552 () Bool)

(assert (=> b!458301 (= e!267558 e!267552)))

(assert (=> b!458301 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14014 _keys!709)))))

(declare-fun res!273830 () Bool)

(assert (=> b!458301 (= res!273830 (contains!2483 lt!207357 (select (arr!13662 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458301 (=> (not res!273830) (not e!267552))))

(declare-fun b!458302 () Bool)

(assert (=> b!458302 (= e!267554 call!30100)))

(declare-fun b!458303 () Bool)

(declare-fun e!267555 () Bool)

(assert (=> b!458303 (= e!267555 (validKeyInArray!0 (select (arr!13662 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458303 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun bm!30097 () Bool)

(assert (=> bm!30097 (= call!30100 (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458304 () Bool)

(assert (=> b!458304 (= e!267557 (= lt!207357 (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458305 () Bool)

(assert (=> b!458305 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14014 _keys!709)))))

(assert (=> b!458305 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14015 _values!549)))))

(declare-fun apply!315 (ListLongMap!7011 (_ BitVec 64)) V!17539)

(assert (=> b!458305 (= e!267552 (= (apply!315 lt!207357 (select (arr!13662 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6737 (select (arr!13663 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458306 () Bool)

(assert (=> b!458306 (= e!267556 (ListLongMap!7012 Nil!8165))))

(declare-fun b!458307 () Bool)

(assert (=> b!458307 (= e!267553 e!267558)))

(declare-fun c!56362 () Bool)

(assert (=> b!458307 (= c!56362 e!267555)))

(declare-fun res!273831 () Bool)

(assert (=> b!458307 (=> (not res!273831) (not e!267555))))

(assert (=> b!458307 (= res!273831 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14014 _keys!709)))))

(declare-fun b!458308 () Bool)

(assert (=> b!458308 (= e!267558 e!267557)))

(declare-fun c!56363 () Bool)

(assert (=> b!458308 (= c!56363 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14014 _keys!709)))))

(assert (= (and d!74743 c!56365) b!458306))

(assert (= (and d!74743 (not c!56365)) b!458298))

(assert (= (and b!458298 c!56364) b!458299))

(assert (= (and b!458298 (not c!56364)) b!458302))

(assert (= (or b!458299 b!458302) bm!30097))

(assert (= (and d!74743 res!273833) b!458300))

(assert (= (and b!458300 res!273832) b!458307))

(assert (= (and b!458307 res!273831) b!458303))

(assert (= (and b!458307 c!56362) b!458301))

(assert (= (and b!458307 (not c!56362)) b!458308))

(assert (= (and b!458301 res!273830) b!458305))

(assert (= (and b!458308 c!56363) b!458304))

(assert (= (and b!458308 (not c!56363)) b!458297))

(declare-fun b_lambda!9775 () Bool)

(assert (=> (not b_lambda!9775) (not b!458299)))

(assert (=> b!458299 t!14025))

(declare-fun b_and!19203 () Bool)

(assert (= b_and!19193 (and (=> t!14025 result!7179) b_and!19203)))

(declare-fun b_lambda!9777 () Bool)

(assert (=> (not b_lambda!9777) (not b!458305)))

(assert (=> b!458305 t!14025))

(declare-fun b_and!19205 () Bool)

(assert (= b_and!19203 (and (=> t!14025 result!7179) b_and!19205)))

(declare-fun m!441859 () Bool)

(assert (=> b!458300 m!441859))

(declare-fun m!441861 () Bool)

(assert (=> bm!30097 m!441861))

(declare-fun m!441863 () Bool)

(assert (=> b!458299 m!441863))

(declare-fun m!441865 () Bool)

(assert (=> b!458299 m!441865))

(declare-fun m!441867 () Bool)

(assert (=> b!458299 m!441867))

(assert (=> b!458299 m!441863))

(assert (=> b!458299 m!441703))

(declare-fun m!441869 () Bool)

(assert (=> b!458299 m!441869))

(assert (=> b!458299 m!441867))

(declare-fun m!441871 () Bool)

(assert (=> b!458299 m!441871))

(declare-fun m!441873 () Bool)

(assert (=> b!458299 m!441873))

(declare-fun m!441875 () Bool)

(assert (=> b!458299 m!441875))

(assert (=> b!458299 m!441703))

(declare-fun m!441877 () Bool)

(assert (=> d!74743 m!441877))

(assert (=> d!74743 m!441719))

(declare-fun m!441879 () Bool)

(assert (=> b!458297 m!441879))

(assert (=> b!458301 m!441873))

(assert (=> b!458301 m!441873))

(declare-fun m!441881 () Bool)

(assert (=> b!458301 m!441881))

(assert (=> b!458305 m!441863))

(assert (=> b!458305 m!441873))

(declare-fun m!441883 () Bool)

(assert (=> b!458305 m!441883))

(assert (=> b!458305 m!441873))

(assert (=> b!458305 m!441703))

(assert (=> b!458305 m!441863))

(assert (=> b!458305 m!441703))

(assert (=> b!458305 m!441869))

(assert (=> b!458298 m!441873))

(assert (=> b!458298 m!441873))

(declare-fun m!441885 () Bool)

(assert (=> b!458298 m!441885))

(assert (=> b!458303 m!441873))

(assert (=> b!458303 m!441873))

(assert (=> b!458303 m!441885))

(assert (=> b!458304 m!441861))

(assert (=> b!458139 d!74743))

(declare-fun d!74745 () Bool)

(declare-fun e!267560 () Bool)

(assert (=> d!74745 e!267560))

(declare-fun res!273837 () Bool)

(assert (=> d!74745 (=> (not res!273837) (not e!267560))))

(declare-fun lt!207364 () ListLongMap!7011)

(assert (=> d!74745 (= res!273837 (not (contains!2483 lt!207364 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!267563 () ListLongMap!7011)

(assert (=> d!74745 (= lt!207364 e!267563)))

(declare-fun c!56369 () Bool)

(assert (=> d!74745 (= c!56369 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14014 lt!207273)))))

(assert (=> d!74745 (validMask!0 mask!1025)))

(assert (=> d!74745 (= (getCurrentListMapNoExtraKeys!1750 lt!207273 lt!207274 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207364)))

(declare-fun b!458309 () Bool)

(declare-fun e!267564 () Bool)

(assert (=> b!458309 (= e!267564 (isEmpty!568 lt!207364))))

(declare-fun b!458310 () Bool)

(declare-fun e!267561 () ListLongMap!7011)

(assert (=> b!458310 (= e!267563 e!267561)))

(declare-fun c!56368 () Bool)

(assert (=> b!458310 (= c!56368 (validKeyInArray!0 (select (arr!13662 lt!207273) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458311 () Bool)

(declare-fun lt!207360 () Unit!13309)

(declare-fun lt!207363 () Unit!13309)

(assert (=> b!458311 (= lt!207360 lt!207363)))

(declare-fun lt!207359 () ListLongMap!7011)

(declare-fun lt!207362 () (_ BitVec 64))

(declare-fun lt!207361 () V!17539)

(declare-fun lt!207358 () (_ BitVec 64))

(assert (=> b!458311 (not (contains!2483 (+!1603 lt!207359 (tuple2!8097 lt!207362 lt!207361)) lt!207358))))

(assert (=> b!458311 (= lt!207363 (addStillNotContains!150 lt!207359 lt!207362 lt!207361 lt!207358))))

(assert (=> b!458311 (= lt!207358 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458311 (= lt!207361 (get!6737 (select (arr!13663 lt!207274) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458311 (= lt!207362 (select (arr!13662 lt!207273) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30101 () ListLongMap!7011)

(assert (=> b!458311 (= lt!207359 call!30101)))

(assert (=> b!458311 (= e!267561 (+!1603 call!30101 (tuple2!8097 (select (arr!13662 lt!207273) (bvadd #b00000000000000000000000000000001 from!863)) (get!6737 (select (arr!13663 lt!207274) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458312 () Bool)

(declare-fun res!273836 () Bool)

(assert (=> b!458312 (=> (not res!273836) (not e!267560))))

(assert (=> b!458312 (= res!273836 (not (contains!2483 lt!207364 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458313 () Bool)

(declare-fun e!267565 () Bool)

(declare-fun e!267559 () Bool)

(assert (=> b!458313 (= e!267565 e!267559)))

(assert (=> b!458313 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14014 lt!207273)))))

(declare-fun res!273834 () Bool)

(assert (=> b!458313 (= res!273834 (contains!2483 lt!207364 (select (arr!13662 lt!207273) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458313 (=> (not res!273834) (not e!267559))))

(declare-fun b!458314 () Bool)

(assert (=> b!458314 (= e!267561 call!30101)))

(declare-fun b!458315 () Bool)

(declare-fun e!267562 () Bool)

(assert (=> b!458315 (= e!267562 (validKeyInArray!0 (select (arr!13662 lt!207273) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458315 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun bm!30098 () Bool)

(assert (=> bm!30098 (= call!30101 (getCurrentListMapNoExtraKeys!1750 lt!207273 lt!207274 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458316 () Bool)

(assert (=> b!458316 (= e!267564 (= lt!207364 (getCurrentListMapNoExtraKeys!1750 lt!207273 lt!207274 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458317 () Bool)

(assert (=> b!458317 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14014 lt!207273)))))

(assert (=> b!458317 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14015 lt!207274)))))

(assert (=> b!458317 (= e!267559 (= (apply!315 lt!207364 (select (arr!13662 lt!207273) (bvadd #b00000000000000000000000000000001 from!863))) (get!6737 (select (arr!13663 lt!207274) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458318 () Bool)

(assert (=> b!458318 (= e!267563 (ListLongMap!7012 Nil!8165))))

(declare-fun b!458319 () Bool)

(assert (=> b!458319 (= e!267560 e!267565)))

(declare-fun c!56366 () Bool)

(assert (=> b!458319 (= c!56366 e!267562)))

(declare-fun res!273835 () Bool)

(assert (=> b!458319 (=> (not res!273835) (not e!267562))))

(assert (=> b!458319 (= res!273835 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14014 lt!207273)))))

(declare-fun b!458320 () Bool)

(assert (=> b!458320 (= e!267565 e!267564)))

(declare-fun c!56367 () Bool)

(assert (=> b!458320 (= c!56367 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14014 lt!207273)))))

(assert (= (and d!74745 c!56369) b!458318))

(assert (= (and d!74745 (not c!56369)) b!458310))

(assert (= (and b!458310 c!56368) b!458311))

(assert (= (and b!458310 (not c!56368)) b!458314))

(assert (= (or b!458311 b!458314) bm!30098))

(assert (= (and d!74745 res!273837) b!458312))

(assert (= (and b!458312 res!273836) b!458319))

(assert (= (and b!458319 res!273835) b!458315))

(assert (= (and b!458319 c!56366) b!458313))

(assert (= (and b!458319 (not c!56366)) b!458320))

(assert (= (and b!458313 res!273834) b!458317))

(assert (= (and b!458320 c!56367) b!458316))

(assert (= (and b!458320 (not c!56367)) b!458309))

(declare-fun b_lambda!9779 () Bool)

(assert (=> (not b_lambda!9779) (not b!458311)))

(assert (=> b!458311 t!14025))

(declare-fun b_and!19207 () Bool)

(assert (= b_and!19205 (and (=> t!14025 result!7179) b_and!19207)))

(declare-fun b_lambda!9781 () Bool)

(assert (=> (not b_lambda!9781) (not b!458317)))

(assert (=> b!458317 t!14025))

(declare-fun b_and!19209 () Bool)

(assert (= b_and!19207 (and (=> t!14025 result!7179) b_and!19209)))

(declare-fun m!441887 () Bool)

(assert (=> b!458312 m!441887))

(declare-fun m!441889 () Bool)

(assert (=> bm!30098 m!441889))

(declare-fun m!441891 () Bool)

(assert (=> b!458311 m!441891))

(declare-fun m!441893 () Bool)

(assert (=> b!458311 m!441893))

(declare-fun m!441895 () Bool)

(assert (=> b!458311 m!441895))

(assert (=> b!458311 m!441891))

(assert (=> b!458311 m!441703))

(declare-fun m!441897 () Bool)

(assert (=> b!458311 m!441897))

(assert (=> b!458311 m!441895))

(declare-fun m!441899 () Bool)

(assert (=> b!458311 m!441899))

(declare-fun m!441901 () Bool)

(assert (=> b!458311 m!441901))

(declare-fun m!441903 () Bool)

(assert (=> b!458311 m!441903))

(assert (=> b!458311 m!441703))

(declare-fun m!441905 () Bool)

(assert (=> d!74745 m!441905))

(assert (=> d!74745 m!441719))

(declare-fun m!441907 () Bool)

(assert (=> b!458309 m!441907))

(assert (=> b!458313 m!441901))

(assert (=> b!458313 m!441901))

(declare-fun m!441909 () Bool)

(assert (=> b!458313 m!441909))

(assert (=> b!458317 m!441891))

(assert (=> b!458317 m!441901))

(declare-fun m!441911 () Bool)

(assert (=> b!458317 m!441911))

(assert (=> b!458317 m!441901))

(assert (=> b!458317 m!441703))

(assert (=> b!458317 m!441891))

(assert (=> b!458317 m!441703))

(assert (=> b!458317 m!441897))

(assert (=> b!458310 m!441901))

(assert (=> b!458310 m!441901))

(declare-fun m!441913 () Bool)

(assert (=> b!458310 m!441913))

(assert (=> b!458315 m!441901))

(assert (=> b!458315 m!441901))

(assert (=> b!458315 m!441913))

(assert (=> b!458316 m!441889))

(assert (=> b!458139 d!74745))

(declare-fun d!74747 () Bool)

(declare-fun e!267566 () Bool)

(assert (=> d!74747 e!267566))

(declare-fun res!273838 () Bool)

(assert (=> d!74747 (=> (not res!273838) (not e!267566))))

(declare-fun lt!207368 () ListLongMap!7011)

(assert (=> d!74747 (= res!273838 (contains!2483 lt!207368 (_1!4059 (tuple2!8097 k0!794 v!412))))))

(declare-fun lt!207366 () List!8168)

(assert (=> d!74747 (= lt!207368 (ListLongMap!7012 lt!207366))))

(declare-fun lt!207365 () Unit!13309)

(declare-fun lt!207367 () Unit!13309)

(assert (=> d!74747 (= lt!207365 lt!207367)))

(assert (=> d!74747 (= (getValueByKey!373 lt!207366 (_1!4059 (tuple2!8097 k0!794 v!412))) (Some!378 (_2!4059 (tuple2!8097 k0!794 v!412))))))

(assert (=> d!74747 (= lt!207367 (lemmaContainsTupThenGetReturnValue!195 lt!207366 (_1!4059 (tuple2!8097 k0!794 v!412)) (_2!4059 (tuple2!8097 k0!794 v!412))))))

(assert (=> d!74747 (= lt!207366 (insertStrictlySorted!198 (toList!3521 lt!207276) (_1!4059 (tuple2!8097 k0!794 v!412)) (_2!4059 (tuple2!8097 k0!794 v!412))))))

(assert (=> d!74747 (= (+!1603 lt!207276 (tuple2!8097 k0!794 v!412)) lt!207368)))

(declare-fun b!458321 () Bool)

(declare-fun res!273839 () Bool)

(assert (=> b!458321 (=> (not res!273839) (not e!267566))))

(assert (=> b!458321 (= res!273839 (= (getValueByKey!373 (toList!3521 lt!207368) (_1!4059 (tuple2!8097 k0!794 v!412))) (Some!378 (_2!4059 (tuple2!8097 k0!794 v!412)))))))

(declare-fun b!458322 () Bool)

(assert (=> b!458322 (= e!267566 (contains!2484 (toList!3521 lt!207368) (tuple2!8097 k0!794 v!412)))))

(assert (= (and d!74747 res!273838) b!458321))

(assert (= (and b!458321 res!273839) b!458322))

(declare-fun m!441915 () Bool)

(assert (=> d!74747 m!441915))

(declare-fun m!441917 () Bool)

(assert (=> d!74747 m!441917))

(declare-fun m!441919 () Bool)

(assert (=> d!74747 m!441919))

(declare-fun m!441921 () Bool)

(assert (=> d!74747 m!441921))

(declare-fun m!441923 () Bool)

(assert (=> b!458321 m!441923))

(declare-fun m!441925 () Bool)

(assert (=> b!458322 m!441925))

(assert (=> b!458139 d!74747))

(declare-fun d!74749 () Bool)

(assert (=> d!74749 (= (validKeyInArray!0 (select (arr!13662 _keys!709) from!863)) (and (not (= (select (arr!13662 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13662 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458139 d!74749))

(declare-fun call!30106 () ListLongMap!7011)

(declare-fun bm!30103 () Bool)

(assert (=> bm!30103 (= call!30106 (getCurrentListMapNoExtraKeys!1750 (array!28441 (store (arr!13662 _keys!709) i!563 k0!794) (size!14014 _keys!709)) (array!28443 (store (arr!13663 _values!549) i!563 (ValueCellFull!5819 v!412)) (size!14015 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458329 () Bool)

(declare-fun e!267571 () Bool)

(declare-fun call!30107 () ListLongMap!7011)

(assert (=> b!458329 (= e!267571 (= call!30106 call!30107))))

(declare-fun b!458330 () Bool)

(assert (=> b!458330 (= e!267571 (= call!30106 (+!1603 call!30107 (tuple2!8097 k0!794 v!412))))))

(declare-fun d!74751 () Bool)

(declare-fun e!267572 () Bool)

(assert (=> d!74751 e!267572))

(declare-fun res!273842 () Bool)

(assert (=> d!74751 (=> (not res!273842) (not e!267572))))

(assert (=> d!74751 (= res!273842 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14014 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14015 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14014 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14015 _values!549))))))))

(declare-fun lt!207371 () Unit!13309)

(declare-fun choose!1339 (array!28440 array!28442 (_ BitVec 32) (_ BitVec 32) V!17539 V!17539 (_ BitVec 32) (_ BitVec 64) V!17539 (_ BitVec 32) Int) Unit!13309)

(assert (=> d!74751 (= lt!207371 (choose!1339 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74751 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14014 _keys!709)))))

(assert (=> d!74751 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!762 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207371)))

(declare-fun bm!30104 () Bool)

(assert (=> bm!30104 (= call!30107 (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458331 () Bool)

(assert (=> b!458331 (= e!267572 e!267571)))

(declare-fun c!56372 () Bool)

(assert (=> b!458331 (= c!56372 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (= (and d!74751 res!273842) b!458331))

(assert (= (and b!458331 c!56372) b!458330))

(assert (= (and b!458331 (not c!56372)) b!458329))

(assert (= (or b!458330 b!458329) bm!30104))

(assert (= (or b!458330 b!458329) bm!30103))

(assert (=> bm!30103 m!441695))

(assert (=> bm!30103 m!441715))

(declare-fun m!441927 () Bool)

(assert (=> bm!30103 m!441927))

(declare-fun m!441929 () Bool)

(assert (=> b!458330 m!441929))

(declare-fun m!441931 () Bool)

(assert (=> d!74751 m!441931))

(assert (=> bm!30104 m!441735))

(assert (=> b!458139 d!74751))

(declare-fun bm!30107 () Bool)

(declare-fun call!30110 () Bool)

(declare-fun c!56375 () Bool)

(assert (=> bm!30107 (= call!30110 (arrayNoDuplicates!0 lt!207273 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56375 (Cons!8165 (select (arr!13662 lt!207273) #b00000000000000000000000000000000) Nil!8166) Nil!8166)))))

(declare-fun b!458342 () Bool)

(declare-fun e!267582 () Bool)

(assert (=> b!458342 (= e!267582 call!30110)))

(declare-fun b!458343 () Bool)

(declare-fun e!267584 () Bool)

(assert (=> b!458343 (= e!267584 e!267582)))

(assert (=> b!458343 (= c!56375 (validKeyInArray!0 (select (arr!13662 lt!207273) #b00000000000000000000000000000000)))))

(declare-fun b!458344 () Bool)

(declare-fun e!267581 () Bool)

(declare-fun contains!2485 (List!8169 (_ BitVec 64)) Bool)

(assert (=> b!458344 (= e!267581 (contains!2485 Nil!8166 (select (arr!13662 lt!207273) #b00000000000000000000000000000000)))))

(declare-fun b!458346 () Bool)

(assert (=> b!458346 (= e!267582 call!30110)))

(declare-fun b!458345 () Bool)

(declare-fun e!267583 () Bool)

(assert (=> b!458345 (= e!267583 e!267584)))

(declare-fun res!273851 () Bool)

(assert (=> b!458345 (=> (not res!273851) (not e!267584))))

(assert (=> b!458345 (= res!273851 (not e!267581))))

(declare-fun res!273850 () Bool)

(assert (=> b!458345 (=> (not res!273850) (not e!267581))))

(assert (=> b!458345 (= res!273850 (validKeyInArray!0 (select (arr!13662 lt!207273) #b00000000000000000000000000000000)))))

(declare-fun d!74753 () Bool)

(declare-fun res!273849 () Bool)

(assert (=> d!74753 (=> res!273849 e!267583)))

(assert (=> d!74753 (= res!273849 (bvsge #b00000000000000000000000000000000 (size!14014 lt!207273)))))

(assert (=> d!74753 (= (arrayNoDuplicates!0 lt!207273 #b00000000000000000000000000000000 Nil!8166) e!267583)))

(assert (= (and d!74753 (not res!273849)) b!458345))

(assert (= (and b!458345 res!273850) b!458344))

(assert (= (and b!458345 res!273851) b!458343))

(assert (= (and b!458343 c!56375) b!458342))

(assert (= (and b!458343 (not c!56375)) b!458346))

(assert (= (or b!458342 b!458346) bm!30107))

(declare-fun m!441933 () Bool)

(assert (=> bm!30107 m!441933))

(declare-fun m!441935 () Bool)

(assert (=> bm!30107 m!441935))

(assert (=> b!458343 m!441933))

(assert (=> b!458343 m!441933))

(declare-fun m!441937 () Bool)

(assert (=> b!458343 m!441937))

(assert (=> b!458344 m!441933))

(assert (=> b!458344 m!441933))

(declare-fun m!441939 () Bool)

(assert (=> b!458344 m!441939))

(assert (=> b!458345 m!441933))

(assert (=> b!458345 m!441933))

(assert (=> b!458345 m!441937))

(assert (=> b!458149 d!74753))

(declare-fun d!74755 () Bool)

(assert (=> d!74755 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458144 d!74755))

(declare-fun d!74757 () Bool)

(assert (=> d!74757 (= (array_inv!9968 _values!549) (bvsge (size!14015 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41060 d!74757))

(declare-fun d!74759 () Bool)

(assert (=> d!74759 (= (array_inv!9969 _keys!709) (bvsge (size!14014 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41060 d!74759))

(declare-fun b!458355 () Bool)

(declare-fun e!267592 () Bool)

(declare-fun call!30113 () Bool)

(assert (=> b!458355 (= e!267592 call!30113)))

(declare-fun b!458356 () Bool)

(declare-fun e!267593 () Bool)

(assert (=> b!458356 (= e!267592 e!267593)))

(declare-fun lt!207380 () (_ BitVec 64))

(assert (=> b!458356 (= lt!207380 (select (arr!13662 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!207378 () Unit!13309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28440 (_ BitVec 64) (_ BitVec 32)) Unit!13309)

(assert (=> b!458356 (= lt!207378 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!207380 #b00000000000000000000000000000000))))

(assert (=> b!458356 (arrayContainsKey!0 _keys!709 lt!207380 #b00000000000000000000000000000000)))

(declare-fun lt!207379 () Unit!13309)

(assert (=> b!458356 (= lt!207379 lt!207378)))

(declare-fun res!273857 () Bool)

(declare-datatypes ((SeekEntryResult!3483 0))(
  ( (MissingZero!3483 (index!16111 (_ BitVec 32))) (Found!3483 (index!16112 (_ BitVec 32))) (Intermediate!3483 (undefined!4295 Bool) (index!16113 (_ BitVec 32)) (x!42725 (_ BitVec 32))) (Undefined!3483) (MissingVacant!3483 (index!16114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28440 (_ BitVec 32)) SeekEntryResult!3483)

(assert (=> b!458356 (= res!273857 (= (seekEntryOrOpen!0 (select (arr!13662 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3483 #b00000000000000000000000000000000)))))

(assert (=> b!458356 (=> (not res!273857) (not e!267593))))

(declare-fun bm!30110 () Bool)

(assert (=> bm!30110 (= call!30113 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!458357 () Bool)

(declare-fun e!267591 () Bool)

(assert (=> b!458357 (= e!267591 e!267592)))

(declare-fun c!56378 () Bool)

(assert (=> b!458357 (= c!56378 (validKeyInArray!0 (select (arr!13662 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458358 () Bool)

(assert (=> b!458358 (= e!267593 call!30113)))

(declare-fun d!74761 () Bool)

(declare-fun res!273856 () Bool)

(assert (=> d!74761 (=> res!273856 e!267591)))

(assert (=> d!74761 (= res!273856 (bvsge #b00000000000000000000000000000000 (size!14014 _keys!709)))))

(assert (=> d!74761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!267591)))

(assert (= (and d!74761 (not res!273856)) b!458357))

(assert (= (and b!458357 c!56378) b!458356))

(assert (= (and b!458357 (not c!56378)) b!458355))

(assert (= (and b!458356 res!273857) b!458358))

(assert (= (or b!458358 b!458355) bm!30110))

(declare-fun m!441941 () Bool)

(assert (=> b!458356 m!441941))

(declare-fun m!441943 () Bool)

(assert (=> b!458356 m!441943))

(declare-fun m!441945 () Bool)

(assert (=> b!458356 m!441945))

(assert (=> b!458356 m!441941))

(declare-fun m!441947 () Bool)

(assert (=> b!458356 m!441947))

(declare-fun m!441949 () Bool)

(assert (=> bm!30110 m!441949))

(assert (=> b!458357 m!441941))

(assert (=> b!458357 m!441941))

(declare-fun m!441951 () Bool)

(assert (=> b!458357 m!441951))

(assert (=> b!458136 d!74761))

(declare-fun d!74763 () Bool)

(declare-fun res!273862 () Bool)

(declare-fun e!267598 () Bool)

(assert (=> d!74763 (=> res!273862 e!267598)))

(assert (=> d!74763 (= res!273862 (= (select (arr!13662 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74763 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!267598)))

(declare-fun b!458363 () Bool)

(declare-fun e!267599 () Bool)

(assert (=> b!458363 (= e!267598 e!267599)))

(declare-fun res!273863 () Bool)

(assert (=> b!458363 (=> (not res!273863) (not e!267599))))

(assert (=> b!458363 (= res!273863 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14014 _keys!709)))))

(declare-fun b!458364 () Bool)

(assert (=> b!458364 (= e!267599 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74763 (not res!273862)) b!458363))

(assert (= (and b!458363 res!273863) b!458364))

(assert (=> d!74763 m!441941))

(declare-fun m!441953 () Bool)

(assert (=> b!458364 m!441953))

(assert (=> b!458151 d!74763))

(declare-fun d!74765 () Bool)

(declare-fun e!267601 () Bool)

(assert (=> d!74765 e!267601))

(declare-fun res!273867 () Bool)

(assert (=> d!74765 (=> (not res!273867) (not e!267601))))

(declare-fun lt!207387 () ListLongMap!7011)

(assert (=> d!74765 (= res!273867 (not (contains!2483 lt!207387 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!267604 () ListLongMap!7011)

(assert (=> d!74765 (= lt!207387 e!267604)))

(declare-fun c!56382 () Bool)

(assert (=> d!74765 (= c!56382 (bvsge from!863 (size!14014 lt!207273)))))

(assert (=> d!74765 (validMask!0 mask!1025)))

(assert (=> d!74765 (= (getCurrentListMapNoExtraKeys!1750 lt!207273 lt!207274 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207387)))

(declare-fun b!458365 () Bool)

(declare-fun e!267605 () Bool)

(assert (=> b!458365 (= e!267605 (isEmpty!568 lt!207387))))

(declare-fun b!458366 () Bool)

(declare-fun e!267602 () ListLongMap!7011)

(assert (=> b!458366 (= e!267604 e!267602)))

(declare-fun c!56381 () Bool)

(assert (=> b!458366 (= c!56381 (validKeyInArray!0 (select (arr!13662 lt!207273) from!863)))))

(declare-fun b!458367 () Bool)

(declare-fun lt!207383 () Unit!13309)

(declare-fun lt!207386 () Unit!13309)

(assert (=> b!458367 (= lt!207383 lt!207386)))

(declare-fun lt!207384 () V!17539)

(declare-fun lt!207382 () ListLongMap!7011)

(declare-fun lt!207385 () (_ BitVec 64))

(declare-fun lt!207381 () (_ BitVec 64))

(assert (=> b!458367 (not (contains!2483 (+!1603 lt!207382 (tuple2!8097 lt!207385 lt!207384)) lt!207381))))

(assert (=> b!458367 (= lt!207386 (addStillNotContains!150 lt!207382 lt!207385 lt!207384 lt!207381))))

(assert (=> b!458367 (= lt!207381 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458367 (= lt!207384 (get!6737 (select (arr!13663 lt!207274) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458367 (= lt!207385 (select (arr!13662 lt!207273) from!863))))

(declare-fun call!30114 () ListLongMap!7011)

(assert (=> b!458367 (= lt!207382 call!30114)))

(assert (=> b!458367 (= e!267602 (+!1603 call!30114 (tuple2!8097 (select (arr!13662 lt!207273) from!863) (get!6737 (select (arr!13663 lt!207274) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458368 () Bool)

(declare-fun res!273866 () Bool)

(assert (=> b!458368 (=> (not res!273866) (not e!267601))))

(assert (=> b!458368 (= res!273866 (not (contains!2483 lt!207387 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458369 () Bool)

(declare-fun e!267606 () Bool)

(declare-fun e!267600 () Bool)

(assert (=> b!458369 (= e!267606 e!267600)))

(assert (=> b!458369 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14014 lt!207273)))))

(declare-fun res!273864 () Bool)

(assert (=> b!458369 (= res!273864 (contains!2483 lt!207387 (select (arr!13662 lt!207273) from!863)))))

(assert (=> b!458369 (=> (not res!273864) (not e!267600))))

(declare-fun b!458370 () Bool)

(assert (=> b!458370 (= e!267602 call!30114)))

(declare-fun b!458371 () Bool)

(declare-fun e!267603 () Bool)

(assert (=> b!458371 (= e!267603 (validKeyInArray!0 (select (arr!13662 lt!207273) from!863)))))

(assert (=> b!458371 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun bm!30111 () Bool)

(assert (=> bm!30111 (= call!30114 (getCurrentListMapNoExtraKeys!1750 lt!207273 lt!207274 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458372 () Bool)

(assert (=> b!458372 (= e!267605 (= lt!207387 (getCurrentListMapNoExtraKeys!1750 lt!207273 lt!207274 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458373 () Bool)

(assert (=> b!458373 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14014 lt!207273)))))

(assert (=> b!458373 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14015 lt!207274)))))

(assert (=> b!458373 (= e!267600 (= (apply!315 lt!207387 (select (arr!13662 lt!207273) from!863)) (get!6737 (select (arr!13663 lt!207274) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458374 () Bool)

(assert (=> b!458374 (= e!267604 (ListLongMap!7012 Nil!8165))))

(declare-fun b!458375 () Bool)

(assert (=> b!458375 (= e!267601 e!267606)))

(declare-fun c!56379 () Bool)

(assert (=> b!458375 (= c!56379 e!267603)))

(declare-fun res!273865 () Bool)

(assert (=> b!458375 (=> (not res!273865) (not e!267603))))

(assert (=> b!458375 (= res!273865 (bvslt from!863 (size!14014 lt!207273)))))

(declare-fun b!458376 () Bool)

(assert (=> b!458376 (= e!267606 e!267605)))

(declare-fun c!56380 () Bool)

(assert (=> b!458376 (= c!56380 (bvslt from!863 (size!14014 lt!207273)))))

(assert (= (and d!74765 c!56382) b!458374))

(assert (= (and d!74765 (not c!56382)) b!458366))

(assert (= (and b!458366 c!56381) b!458367))

(assert (= (and b!458366 (not c!56381)) b!458370))

(assert (= (or b!458367 b!458370) bm!30111))

(assert (= (and d!74765 res!273867) b!458368))

(assert (= (and b!458368 res!273866) b!458375))

(assert (= (and b!458375 res!273865) b!458371))

(assert (= (and b!458375 c!56379) b!458369))

(assert (= (and b!458375 (not c!56379)) b!458376))

(assert (= (and b!458369 res!273864) b!458373))

(assert (= (and b!458376 c!56380) b!458372))

(assert (= (and b!458376 (not c!56380)) b!458365))

(declare-fun b_lambda!9783 () Bool)

(assert (=> (not b_lambda!9783) (not b!458367)))

(assert (=> b!458367 t!14025))

(declare-fun b_and!19211 () Bool)

(assert (= b_and!19209 (and (=> t!14025 result!7179) b_and!19211)))

(declare-fun b_lambda!9785 () Bool)

(assert (=> (not b_lambda!9785) (not b!458373)))

(assert (=> b!458373 t!14025))

(declare-fun b_and!19213 () Bool)

(assert (= b_and!19211 (and (=> t!14025 result!7179) b_and!19213)))

(declare-fun m!441955 () Bool)

(assert (=> b!458368 m!441955))

(declare-fun m!441957 () Bool)

(assert (=> bm!30111 m!441957))

(declare-fun m!441959 () Bool)

(assert (=> b!458367 m!441959))

(declare-fun m!441961 () Bool)

(assert (=> b!458367 m!441961))

(declare-fun m!441963 () Bool)

(assert (=> b!458367 m!441963))

(assert (=> b!458367 m!441959))

(assert (=> b!458367 m!441703))

(declare-fun m!441965 () Bool)

(assert (=> b!458367 m!441965))

(assert (=> b!458367 m!441963))

(declare-fun m!441967 () Bool)

(assert (=> b!458367 m!441967))

(declare-fun m!441969 () Bool)

(assert (=> b!458367 m!441969))

(declare-fun m!441971 () Bool)

(assert (=> b!458367 m!441971))

(assert (=> b!458367 m!441703))

(declare-fun m!441973 () Bool)

(assert (=> d!74765 m!441973))

(assert (=> d!74765 m!441719))

(declare-fun m!441975 () Bool)

(assert (=> b!458365 m!441975))

(assert (=> b!458369 m!441969))

(assert (=> b!458369 m!441969))

(declare-fun m!441977 () Bool)

(assert (=> b!458369 m!441977))

(assert (=> b!458373 m!441959))

(assert (=> b!458373 m!441969))

(declare-fun m!441979 () Bool)

(assert (=> b!458373 m!441979))

(assert (=> b!458373 m!441969))

(assert (=> b!458373 m!441703))

(assert (=> b!458373 m!441959))

(assert (=> b!458373 m!441703))

(assert (=> b!458373 m!441965))

(assert (=> b!458366 m!441969))

(assert (=> b!458366 m!441969))

(declare-fun m!441981 () Bool)

(assert (=> b!458366 m!441981))

(assert (=> b!458371 m!441969))

(assert (=> b!458371 m!441969))

(assert (=> b!458371 m!441981))

(assert (=> b!458372 m!441957))

(assert (=> b!458146 d!74765))

(declare-fun d!74767 () Bool)

(declare-fun e!267608 () Bool)

(assert (=> d!74767 e!267608))

(declare-fun res!273871 () Bool)

(assert (=> d!74767 (=> (not res!273871) (not e!267608))))

(declare-fun lt!207394 () ListLongMap!7011)

(assert (=> d!74767 (= res!273871 (not (contains!2483 lt!207394 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!267611 () ListLongMap!7011)

(assert (=> d!74767 (= lt!207394 e!267611)))

(declare-fun c!56386 () Bool)

(assert (=> d!74767 (= c!56386 (bvsge from!863 (size!14014 _keys!709)))))

(assert (=> d!74767 (validMask!0 mask!1025)))

(assert (=> d!74767 (= (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207394)))

(declare-fun b!458377 () Bool)

(declare-fun e!267612 () Bool)

(assert (=> b!458377 (= e!267612 (isEmpty!568 lt!207394))))

(declare-fun b!458378 () Bool)

(declare-fun e!267609 () ListLongMap!7011)

(assert (=> b!458378 (= e!267611 e!267609)))

(declare-fun c!56385 () Bool)

(assert (=> b!458378 (= c!56385 (validKeyInArray!0 (select (arr!13662 _keys!709) from!863)))))

(declare-fun b!458379 () Bool)

(declare-fun lt!207390 () Unit!13309)

(declare-fun lt!207393 () Unit!13309)

(assert (=> b!458379 (= lt!207390 lt!207393)))

(declare-fun lt!207392 () (_ BitVec 64))

(declare-fun lt!207388 () (_ BitVec 64))

(declare-fun lt!207391 () V!17539)

(declare-fun lt!207389 () ListLongMap!7011)

(assert (=> b!458379 (not (contains!2483 (+!1603 lt!207389 (tuple2!8097 lt!207392 lt!207391)) lt!207388))))

(assert (=> b!458379 (= lt!207393 (addStillNotContains!150 lt!207389 lt!207392 lt!207391 lt!207388))))

(assert (=> b!458379 (= lt!207388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458379 (= lt!207391 (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458379 (= lt!207392 (select (arr!13662 _keys!709) from!863))))

(declare-fun call!30115 () ListLongMap!7011)

(assert (=> b!458379 (= lt!207389 call!30115)))

(assert (=> b!458379 (= e!267609 (+!1603 call!30115 (tuple2!8097 (select (arr!13662 _keys!709) from!863) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458380 () Bool)

(declare-fun res!273870 () Bool)

(assert (=> b!458380 (=> (not res!273870) (not e!267608))))

(assert (=> b!458380 (= res!273870 (not (contains!2483 lt!207394 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458381 () Bool)

(declare-fun e!267613 () Bool)

(declare-fun e!267607 () Bool)

(assert (=> b!458381 (= e!267613 e!267607)))

(assert (=> b!458381 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14014 _keys!709)))))

(declare-fun res!273868 () Bool)

(assert (=> b!458381 (= res!273868 (contains!2483 lt!207394 (select (arr!13662 _keys!709) from!863)))))

(assert (=> b!458381 (=> (not res!273868) (not e!267607))))

(declare-fun b!458382 () Bool)

(assert (=> b!458382 (= e!267609 call!30115)))

(declare-fun b!458383 () Bool)

(declare-fun e!267610 () Bool)

(assert (=> b!458383 (= e!267610 (validKeyInArray!0 (select (arr!13662 _keys!709) from!863)))))

(assert (=> b!458383 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun bm!30112 () Bool)

(assert (=> bm!30112 (= call!30115 (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458384 () Bool)

(assert (=> b!458384 (= e!267612 (= lt!207394 (getCurrentListMapNoExtraKeys!1750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458385 () Bool)

(assert (=> b!458385 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14014 _keys!709)))))

(assert (=> b!458385 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14015 _values!549)))))

(assert (=> b!458385 (= e!267607 (= (apply!315 lt!207394 (select (arr!13662 _keys!709) from!863)) (get!6737 (select (arr!13663 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458386 () Bool)

(assert (=> b!458386 (= e!267611 (ListLongMap!7012 Nil!8165))))

(declare-fun b!458387 () Bool)

(assert (=> b!458387 (= e!267608 e!267613)))

(declare-fun c!56383 () Bool)

(assert (=> b!458387 (= c!56383 e!267610)))

(declare-fun res!273869 () Bool)

(assert (=> b!458387 (=> (not res!273869) (not e!267610))))

(assert (=> b!458387 (= res!273869 (bvslt from!863 (size!14014 _keys!709)))))

(declare-fun b!458388 () Bool)

(assert (=> b!458388 (= e!267613 e!267612)))

(declare-fun c!56384 () Bool)

(assert (=> b!458388 (= c!56384 (bvslt from!863 (size!14014 _keys!709)))))

(assert (= (and d!74767 c!56386) b!458386))

(assert (= (and d!74767 (not c!56386)) b!458378))

(assert (= (and b!458378 c!56385) b!458379))

(assert (= (and b!458378 (not c!56385)) b!458382))

(assert (= (or b!458379 b!458382) bm!30112))

(assert (= (and d!74767 res!273871) b!458380))

(assert (= (and b!458380 res!273870) b!458387))

(assert (= (and b!458387 res!273869) b!458383))

(assert (= (and b!458387 c!56383) b!458381))

(assert (= (and b!458387 (not c!56383)) b!458388))

(assert (= (and b!458381 res!273868) b!458385))

(assert (= (and b!458388 c!56384) b!458384))

(assert (= (and b!458388 (not c!56384)) b!458377))

(declare-fun b_lambda!9787 () Bool)

(assert (=> (not b_lambda!9787) (not b!458379)))

(assert (=> b!458379 t!14025))

(declare-fun b_and!19215 () Bool)

(assert (= b_and!19213 (and (=> t!14025 result!7179) b_and!19215)))

(declare-fun b_lambda!9789 () Bool)

(assert (=> (not b_lambda!9789) (not b!458385)))

(assert (=> b!458385 t!14025))

(declare-fun b_and!19217 () Bool)

(assert (= b_and!19215 (and (=> t!14025 result!7179) b_and!19217)))

(declare-fun m!441983 () Bool)

(assert (=> b!458380 m!441983))

(declare-fun m!441985 () Bool)

(assert (=> bm!30112 m!441985))

(assert (=> b!458379 m!441705))

(declare-fun m!441987 () Bool)

(assert (=> b!458379 m!441987))

(declare-fun m!441989 () Bool)

(assert (=> b!458379 m!441989))

(assert (=> b!458379 m!441705))

(assert (=> b!458379 m!441703))

(assert (=> b!458379 m!441709))

(assert (=> b!458379 m!441989))

(declare-fun m!441991 () Bool)

(assert (=> b!458379 m!441991))

(assert (=> b!458379 m!441701))

(declare-fun m!441993 () Bool)

(assert (=> b!458379 m!441993))

(assert (=> b!458379 m!441703))

(declare-fun m!441995 () Bool)

(assert (=> d!74767 m!441995))

(assert (=> d!74767 m!441719))

(declare-fun m!441997 () Bool)

(assert (=> b!458377 m!441997))

(assert (=> b!458381 m!441701))

(assert (=> b!458381 m!441701))

(declare-fun m!441999 () Bool)

(assert (=> b!458381 m!441999))

(assert (=> b!458385 m!441705))

(assert (=> b!458385 m!441701))

(declare-fun m!442001 () Bool)

(assert (=> b!458385 m!442001))

(assert (=> b!458385 m!441701))

(assert (=> b!458385 m!441703))

(assert (=> b!458385 m!441705))

(assert (=> b!458385 m!441703))

(assert (=> b!458385 m!441709))

(assert (=> b!458378 m!441701))

(assert (=> b!458378 m!441701))

(assert (=> b!458378 m!441739))

(assert (=> b!458383 m!441701))

(assert (=> b!458383 m!441701))

(assert (=> b!458383 m!441739))

(assert (=> b!458384 m!441985))

(assert (=> b!458146 d!74767))

(declare-fun bm!30113 () Bool)

(declare-fun call!30116 () Bool)

(declare-fun c!56387 () Bool)

(assert (=> bm!30113 (= call!30116 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56387 (Cons!8165 (select (arr!13662 _keys!709) #b00000000000000000000000000000000) Nil!8166) Nil!8166)))))

(declare-fun b!458389 () Bool)

(declare-fun e!267615 () Bool)

(assert (=> b!458389 (= e!267615 call!30116)))

(declare-fun b!458390 () Bool)

(declare-fun e!267617 () Bool)

(assert (=> b!458390 (= e!267617 e!267615)))

(assert (=> b!458390 (= c!56387 (validKeyInArray!0 (select (arr!13662 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458391 () Bool)

(declare-fun e!267614 () Bool)

(assert (=> b!458391 (= e!267614 (contains!2485 Nil!8166 (select (arr!13662 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458393 () Bool)

(assert (=> b!458393 (= e!267615 call!30116)))

(declare-fun b!458392 () Bool)

(declare-fun e!267616 () Bool)

(assert (=> b!458392 (= e!267616 e!267617)))

(declare-fun res!273874 () Bool)

(assert (=> b!458392 (=> (not res!273874) (not e!267617))))

(assert (=> b!458392 (= res!273874 (not e!267614))))

(declare-fun res!273873 () Bool)

(assert (=> b!458392 (=> (not res!273873) (not e!267614))))

(assert (=> b!458392 (= res!273873 (validKeyInArray!0 (select (arr!13662 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74769 () Bool)

(declare-fun res!273872 () Bool)

(assert (=> d!74769 (=> res!273872 e!267616)))

(assert (=> d!74769 (= res!273872 (bvsge #b00000000000000000000000000000000 (size!14014 _keys!709)))))

(assert (=> d!74769 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8166) e!267616)))

(assert (= (and d!74769 (not res!273872)) b!458392))

(assert (= (and b!458392 res!273873) b!458391))

(assert (= (and b!458392 res!273874) b!458390))

(assert (= (and b!458390 c!56387) b!458389))

(assert (= (and b!458390 (not c!56387)) b!458393))

(assert (= (or b!458389 b!458393) bm!30113))

(assert (=> bm!30113 m!441941))

(declare-fun m!442003 () Bool)

(assert (=> bm!30113 m!442003))

(assert (=> b!458390 m!441941))

(assert (=> b!458390 m!441941))

(assert (=> b!458390 m!441951))

(assert (=> b!458391 m!441941))

(assert (=> b!458391 m!441941))

(declare-fun m!442005 () Bool)

(assert (=> b!458391 m!442005))

(assert (=> b!458392 m!441941))

(assert (=> b!458392 m!441941))

(assert (=> b!458392 m!441951))

(assert (=> b!458142 d!74769))

(declare-fun d!74771 () Bool)

(assert (=> d!74771 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!458152 d!74771))

(declare-fun b!458394 () Bool)

(declare-fun e!267619 () Bool)

(declare-fun call!30117 () Bool)

(assert (=> b!458394 (= e!267619 call!30117)))

(declare-fun b!458395 () Bool)

(declare-fun e!267620 () Bool)

(assert (=> b!458395 (= e!267619 e!267620)))

(declare-fun lt!207397 () (_ BitVec 64))

(assert (=> b!458395 (= lt!207397 (select (arr!13662 lt!207273) #b00000000000000000000000000000000))))

(declare-fun lt!207395 () Unit!13309)

(assert (=> b!458395 (= lt!207395 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!207273 lt!207397 #b00000000000000000000000000000000))))

(assert (=> b!458395 (arrayContainsKey!0 lt!207273 lt!207397 #b00000000000000000000000000000000)))

(declare-fun lt!207396 () Unit!13309)

(assert (=> b!458395 (= lt!207396 lt!207395)))

(declare-fun res!273876 () Bool)

(assert (=> b!458395 (= res!273876 (= (seekEntryOrOpen!0 (select (arr!13662 lt!207273) #b00000000000000000000000000000000) lt!207273 mask!1025) (Found!3483 #b00000000000000000000000000000000)))))

(assert (=> b!458395 (=> (not res!273876) (not e!267620))))

(declare-fun bm!30114 () Bool)

(assert (=> bm!30114 (= call!30117 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!207273 mask!1025))))

(declare-fun b!458396 () Bool)

(declare-fun e!267618 () Bool)

(assert (=> b!458396 (= e!267618 e!267619)))

(declare-fun c!56388 () Bool)

(assert (=> b!458396 (= c!56388 (validKeyInArray!0 (select (arr!13662 lt!207273) #b00000000000000000000000000000000)))))

(declare-fun b!458397 () Bool)

(assert (=> b!458397 (= e!267620 call!30117)))

(declare-fun d!74773 () Bool)

(declare-fun res!273875 () Bool)

(assert (=> d!74773 (=> res!273875 e!267618)))

(assert (=> d!74773 (= res!273875 (bvsge #b00000000000000000000000000000000 (size!14014 lt!207273)))))

(assert (=> d!74773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207273 mask!1025) e!267618)))

(assert (= (and d!74773 (not res!273875)) b!458396))

(assert (= (and b!458396 c!56388) b!458395))

(assert (= (and b!458396 (not c!56388)) b!458394))

(assert (= (and b!458395 res!273876) b!458397))

(assert (= (or b!458397 b!458394) bm!30114))

(assert (=> b!458395 m!441933))

(declare-fun m!442007 () Bool)

(assert (=> b!458395 m!442007))

(declare-fun m!442009 () Bool)

(assert (=> b!458395 m!442009))

(assert (=> b!458395 m!441933))

(declare-fun m!442011 () Bool)

(assert (=> b!458395 m!442011))

(declare-fun m!442013 () Bool)

(assert (=> bm!30114 m!442013))

(assert (=> b!458396 m!441933))

(assert (=> b!458396 m!441933))

(assert (=> b!458396 m!441937))

(assert (=> b!458147 d!74773))

(declare-fun b!458405 () Bool)

(declare-fun e!267626 () Bool)

(assert (=> b!458405 (= e!267626 tp_is_empty!12325)))

(declare-fun mapNonEmpty!20140 () Bool)

(declare-fun mapRes!20140 () Bool)

(declare-fun tp!38806 () Bool)

(declare-fun e!267625 () Bool)

(assert (=> mapNonEmpty!20140 (= mapRes!20140 (and tp!38806 e!267625))))

(declare-fun mapRest!20140 () (Array (_ BitVec 32) ValueCell!5819))

(declare-fun mapKey!20140 () (_ BitVec 32))

(declare-fun mapValue!20140 () ValueCell!5819)

(assert (=> mapNonEmpty!20140 (= mapRest!20131 (store mapRest!20140 mapKey!20140 mapValue!20140))))

(declare-fun condMapEmpty!20140 () Bool)

(declare-fun mapDefault!20140 () ValueCell!5819)

(assert (=> mapNonEmpty!20131 (= condMapEmpty!20140 (= mapRest!20131 ((as const (Array (_ BitVec 32) ValueCell!5819)) mapDefault!20140)))))

(assert (=> mapNonEmpty!20131 (= tp!38791 (and e!267626 mapRes!20140))))

(declare-fun mapIsEmpty!20140 () Bool)

(assert (=> mapIsEmpty!20140 mapRes!20140))

(declare-fun b!458404 () Bool)

(assert (=> b!458404 (= e!267625 tp_is_empty!12325)))

(assert (= (and mapNonEmpty!20131 condMapEmpty!20140) mapIsEmpty!20140))

(assert (= (and mapNonEmpty!20131 (not condMapEmpty!20140)) mapNonEmpty!20140))

(assert (= (and mapNonEmpty!20140 ((_ is ValueCellFull!5819) mapValue!20140)) b!458404))

(assert (= (and mapNonEmpty!20131 ((_ is ValueCellFull!5819) mapDefault!20140)) b!458405))

(declare-fun m!442015 () Bool)

(assert (=> mapNonEmpty!20140 m!442015))

(declare-fun b_lambda!9791 () Bool)

(assert (= b_lambda!9779 (or (and start!41060 b_free!10987) b_lambda!9791)))

(declare-fun b_lambda!9793 () Bool)

(assert (= b_lambda!9775 (or (and start!41060 b_free!10987) b_lambda!9793)))

(declare-fun b_lambda!9795 () Bool)

(assert (= b_lambda!9777 (or (and start!41060 b_free!10987) b_lambda!9795)))

(declare-fun b_lambda!9797 () Bool)

(assert (= b_lambda!9781 (or (and start!41060 b_free!10987) b_lambda!9797)))

(declare-fun b_lambda!9799 () Bool)

(assert (= b_lambda!9785 (or (and start!41060 b_free!10987) b_lambda!9799)))

(declare-fun b_lambda!9801 () Bool)

(assert (= b_lambda!9783 (or (and start!41060 b_free!10987) b_lambda!9801)))

(declare-fun b_lambda!9803 () Bool)

(assert (= b_lambda!9789 (or (and start!41060 b_free!10987) b_lambda!9803)))

(declare-fun b_lambda!9805 () Bool)

(assert (= b_lambda!9787 (or (and start!41060 b_free!10987) b_lambda!9805)))

(check-sat (not b!458369) (not b!458381) (not bm!30112) (not b_lambda!9803) (not b!458343) (not bm!30107) (not d!74739) (not b!458364) (not b_lambda!9799) (not b_lambda!9797) (not b!458298) tp_is_empty!12325 (not d!74743) (not b!458372) (not bm!30104) (not b!458330) b_and!19217 (not b!458265) (not b!458301) (not b!458310) (not b_lambda!9793) (not b!458312) (not b!458271) (not b!458380) (not b!458368) (not bm!30098) (not b!458344) (not b!458345) (not d!74747) (not b_lambda!9801) (not mapNonEmpty!20140) (not bm!30113) (not b!458317) (not b!458385) (not d!74765) (not b!458300) (not b!458321) (not b!458391) (not b!458299) (not b!458266) (not bm!30103) (not b!458315) (not b!458379) (not b!458322) (not b_lambda!9805) (not b_lambda!9795) (not b!458297) (not b!458313) (not b!458305) (not bm!30111) (not bm!30114) (not b!458365) (not bm!30110) (not b!458367) (not b!458304) (not b!458357) (not b!458395) (not b!458383) (not b!458377) (not b!458392) (not b!458373) (not b!458390) (not d!74767) (not d!74751) (not b!458303) (not b_next!10987) (not b_lambda!9773) (not b!458316) (not b!458371) (not b!458378) (not d!74745) (not b!458366) (not b!458384) (not bm!30097) (not b!458396) (not b_lambda!9791) (not b!458356) (not b!458311) (not b!458309) (not b!458272))
(check-sat b_and!19217 (not b_next!10987))
