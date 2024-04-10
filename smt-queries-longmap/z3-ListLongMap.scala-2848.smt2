; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41076 () Bool)

(assert start!41076)

(declare-fun b_free!10989 () Bool)

(declare-fun b_next!10989 () Bool)

(assert (=> start!41076 (= b_free!10989 (not b_next!10989))))

(declare-fun tp!38797 () Bool)

(declare-fun b_and!19185 () Bool)

(assert (=> start!41076 (= tp!38797 b_and!19185)))

(declare-fun b!458250 () Bool)

(declare-fun e!267545 () Bool)

(declare-fun e!267541 () Bool)

(assert (=> b!458250 (= e!267545 e!267541)))

(declare-fun res!273777 () Bool)

(assert (=> b!458250 (=> (not res!273777) (not e!267541))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458250 (= res!273777 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17541 0))(
  ( (V!17542 (val!6208 Int)) )
))
(declare-fun minValue!515 () V!17541)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17541)

(declare-datatypes ((tuple2!8180 0))(
  ( (tuple2!8181 (_1!4101 (_ BitVec 64)) (_2!4101 V!17541)) )
))
(declare-datatypes ((List!8252 0))(
  ( (Nil!8249) (Cons!8248 (h!9104 tuple2!8180) (t!14120 List!8252)) )
))
(declare-datatypes ((ListLongMap!7093 0))(
  ( (ListLongMap!7094 (toList!3562 List!8252)) )
))
(declare-fun lt!207285 () ListLongMap!7093)

(declare-datatypes ((ValueCell!5820 0))(
  ( (ValueCellFull!5820 (v!8478 V!17541)) (EmptyCell!5820) )
))
(declare-datatypes ((array!28453 0))(
  ( (array!28454 (arr!13669 (Array (_ BitVec 32) ValueCell!5820)) (size!14021 (_ BitVec 32))) )
))
(declare-fun lt!207287 () array!28453)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!28455 0))(
  ( (array!28456 (arr!13670 (Array (_ BitVec 32) (_ BitVec 64))) (size!14022 (_ BitVec 32))) )
))
(declare-fun lt!207284 () array!28455)

(declare-fun getCurrentListMapNoExtraKeys!1744 (array!28455 array!28453 (_ BitVec 32) (_ BitVec 32) V!17541 V!17541 (_ BitVec 32) Int) ListLongMap!7093)

(assert (=> b!458250 (= lt!207285 (getCurrentListMapNoExtraKeys!1744 lt!207284 lt!207287 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28453)

(declare-fun v!412 () V!17541)

(assert (=> b!458250 (= lt!207287 (array!28454 (store (arr!13669 _values!549) i!563 (ValueCellFull!5820 v!412)) (size!14021 _values!549)))))

(declare-fun lt!207281 () ListLongMap!7093)

(declare-fun _keys!709 () array!28455)

(assert (=> b!458250 (= lt!207281 (getCurrentListMapNoExtraKeys!1744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458251 () Bool)

(declare-fun res!273769 () Bool)

(assert (=> b!458251 (=> (not res!273769) (not e!267545))))

(declare-datatypes ((List!8253 0))(
  ( (Nil!8250) (Cons!8249 (h!9105 (_ BitVec 64)) (t!14121 List!8253)) )
))
(declare-fun arrayNoDuplicates!0 (array!28455 (_ BitVec 32) List!8253) Bool)

(assert (=> b!458251 (= res!273769 (arrayNoDuplicates!0 lt!207284 #b00000000000000000000000000000000 Nil!8250))))

(declare-fun b!458252 () Bool)

(declare-fun res!273779 () Bool)

(assert (=> b!458252 (=> (not res!273779) (not e!267545))))

(assert (=> b!458252 (= res!273779 (bvsle from!863 i!563))))

(declare-fun b!458253 () Bool)

(declare-fun res!273776 () Bool)

(declare-fun e!267542 () Bool)

(assert (=> b!458253 (=> (not res!273776) (not e!267542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458253 (= res!273776 (validMask!0 mask!1025))))

(declare-fun b!458254 () Bool)

(declare-fun res!273767 () Bool)

(assert (=> b!458254 (=> (not res!273767) (not e!267542))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458254 (= res!273767 (validKeyInArray!0 k0!794))))

(declare-fun b!458255 () Bool)

(declare-fun res!273780 () Bool)

(assert (=> b!458255 (=> (not res!273780) (not e!267542))))

(assert (=> b!458255 (= res!273780 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8250))))

(declare-fun b!458256 () Bool)

(declare-fun e!267543 () Bool)

(declare-fun tp_is_empty!12327 () Bool)

(assert (=> b!458256 (= e!267543 tp_is_empty!12327)))

(declare-fun b!458257 () Bool)

(declare-fun e!267544 () Bool)

(declare-fun mapRes!20134 () Bool)

(assert (=> b!458257 (= e!267544 (and e!267543 mapRes!20134))))

(declare-fun condMapEmpty!20134 () Bool)

(declare-fun mapDefault!20134 () ValueCell!5820)

(assert (=> b!458257 (= condMapEmpty!20134 (= (arr!13669 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5820)) mapDefault!20134)))))

(declare-fun b!458258 () Bool)

(declare-fun res!273770 () Bool)

(assert (=> b!458258 (=> (not res!273770) (not e!267542))))

(assert (=> b!458258 (= res!273770 (and (= (size!14021 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14022 _keys!709) (size!14021 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458259 () Bool)

(declare-fun e!267540 () Bool)

(assert (=> b!458259 (= e!267541 (not e!267540))))

(declare-fun res!273778 () Bool)

(assert (=> b!458259 (=> res!273778 e!267540)))

(assert (=> b!458259 (= res!273778 (not (validKeyInArray!0 (select (arr!13670 _keys!709) from!863))))))

(declare-fun lt!207283 () ListLongMap!7093)

(declare-fun lt!207286 () ListLongMap!7093)

(assert (=> b!458259 (= lt!207283 lt!207286)))

(declare-fun lt!207288 () ListLongMap!7093)

(declare-fun +!1598 (ListLongMap!7093 tuple2!8180) ListLongMap!7093)

(assert (=> b!458259 (= lt!207286 (+!1598 lt!207288 (tuple2!8181 k0!794 v!412)))))

(assert (=> b!458259 (= lt!207283 (getCurrentListMapNoExtraKeys!1744 lt!207284 lt!207287 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458259 (= lt!207288 (getCurrentListMapNoExtraKeys!1744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13316 0))(
  ( (Unit!13317) )
))
(declare-fun lt!207282 () Unit!13316)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!757 (array!28455 array!28453 (_ BitVec 32) (_ BitVec 32) V!17541 V!17541 (_ BitVec 32) (_ BitVec 64) V!17541 (_ BitVec 32) Int) Unit!13316)

(assert (=> b!458259 (= lt!207282 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!757 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!273772 () Bool)

(assert (=> start!41076 (=> (not res!273772) (not e!267542))))

(assert (=> start!41076 (= res!273772 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14022 _keys!709))))))

(assert (=> start!41076 e!267542))

(assert (=> start!41076 tp_is_empty!12327))

(assert (=> start!41076 tp!38797))

(assert (=> start!41076 true))

(declare-fun array_inv!9896 (array!28453) Bool)

(assert (=> start!41076 (and (array_inv!9896 _values!549) e!267544)))

(declare-fun array_inv!9897 (array!28455) Bool)

(assert (=> start!41076 (array_inv!9897 _keys!709)))

(declare-fun b!458260 () Bool)

(assert (=> b!458260 (= e!267542 e!267545)))

(declare-fun res!273773 () Bool)

(assert (=> b!458260 (=> (not res!273773) (not e!267545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28455 (_ BitVec 32)) Bool)

(assert (=> b!458260 (= res!273773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207284 mask!1025))))

(assert (=> b!458260 (= lt!207284 (array!28456 (store (arr!13670 _keys!709) i!563 k0!794) (size!14022 _keys!709)))))

(declare-fun mapIsEmpty!20134 () Bool)

(assert (=> mapIsEmpty!20134 mapRes!20134))

(declare-fun mapNonEmpty!20134 () Bool)

(declare-fun tp!38796 () Bool)

(declare-fun e!267539 () Bool)

(assert (=> mapNonEmpty!20134 (= mapRes!20134 (and tp!38796 e!267539))))

(declare-fun mapKey!20134 () (_ BitVec 32))

(declare-fun mapRest!20134 () (Array (_ BitVec 32) ValueCell!5820))

(declare-fun mapValue!20134 () ValueCell!5820)

(assert (=> mapNonEmpty!20134 (= (arr!13669 _values!549) (store mapRest!20134 mapKey!20134 mapValue!20134))))

(declare-fun b!458261 () Bool)

(declare-fun res!273768 () Bool)

(assert (=> b!458261 (=> (not res!273768) (not e!267542))))

(assert (=> b!458261 (= res!273768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458262 () Bool)

(declare-fun res!273775 () Bool)

(assert (=> b!458262 (=> (not res!273775) (not e!267542))))

(assert (=> b!458262 (= res!273775 (or (= (select (arr!13670 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13670 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458263 () Bool)

(declare-fun res!273771 () Bool)

(assert (=> b!458263 (=> (not res!273771) (not e!267542))))

(declare-fun arrayContainsKey!0 (array!28455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458263 (= res!273771 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458264 () Bool)

(declare-fun res!273774 () Bool)

(assert (=> b!458264 (=> (not res!273774) (not e!267542))))

(assert (=> b!458264 (= res!273774 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14022 _keys!709))))))

(declare-fun b!458265 () Bool)

(assert (=> b!458265 (= e!267540 (or (not (= (select (arr!13670 _keys!709) from!863) k0!794)) (bvsge from!863 (size!14022 _keys!709)) (bvslt (size!14022 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun get!6733 (ValueCell!5820 V!17541) V!17541)

(declare-fun dynLambda!887 (Int (_ BitVec 64)) V!17541)

(assert (=> b!458265 (= lt!207285 (+!1598 lt!207286 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458266 () Bool)

(assert (=> b!458266 (= e!267539 tp_is_empty!12327)))

(assert (= (and start!41076 res!273772) b!458253))

(assert (= (and b!458253 res!273776) b!458258))

(assert (= (and b!458258 res!273770) b!458261))

(assert (= (and b!458261 res!273768) b!458255))

(assert (= (and b!458255 res!273780) b!458264))

(assert (= (and b!458264 res!273774) b!458254))

(assert (= (and b!458254 res!273767) b!458262))

(assert (= (and b!458262 res!273775) b!458263))

(assert (= (and b!458263 res!273771) b!458260))

(assert (= (and b!458260 res!273773) b!458251))

(assert (= (and b!458251 res!273769) b!458252))

(assert (= (and b!458252 res!273779) b!458250))

(assert (= (and b!458250 res!273777) b!458259))

(assert (= (and b!458259 (not res!273778)) b!458265))

(assert (= (and b!458257 condMapEmpty!20134) mapIsEmpty!20134))

(assert (= (and b!458257 (not condMapEmpty!20134)) mapNonEmpty!20134))

(get-info :version)

(assert (= (and mapNonEmpty!20134 ((_ is ValueCellFull!5820) mapValue!20134)) b!458266))

(assert (= (and b!458257 ((_ is ValueCellFull!5820) mapDefault!20134)) b!458256))

(assert (= start!41076 b!458257))

(declare-fun b_lambda!9755 () Bool)

(assert (=> (not b_lambda!9755) (not b!458265)))

(declare-fun t!14119 () Bool)

(declare-fun tb!3825 () Bool)

(assert (=> (and start!41076 (= defaultEntry!557 defaultEntry!557) t!14119) tb!3825))

(declare-fun result!7191 () Bool)

(assert (=> tb!3825 (= result!7191 tp_is_empty!12327)))

(assert (=> b!458265 t!14119))

(declare-fun b_and!19187 () Bool)

(assert (= b_and!19185 (and (=> t!14119 result!7191) b_and!19187)))

(declare-fun m!441561 () Bool)

(assert (=> b!458263 m!441561))

(declare-fun m!441563 () Bool)

(assert (=> b!458262 m!441563))

(declare-fun m!441565 () Bool)

(assert (=> b!458265 m!441565))

(declare-fun m!441567 () Bool)

(assert (=> b!458265 m!441567))

(declare-fun m!441569 () Bool)

(assert (=> b!458265 m!441569))

(declare-fun m!441571 () Bool)

(assert (=> b!458265 m!441571))

(assert (=> b!458265 m!441569))

(assert (=> b!458265 m!441567))

(declare-fun m!441573 () Bool)

(assert (=> b!458265 m!441573))

(declare-fun m!441575 () Bool)

(assert (=> b!458254 m!441575))

(declare-fun m!441577 () Bool)

(assert (=> b!458251 m!441577))

(declare-fun m!441579 () Bool)

(assert (=> b!458255 m!441579))

(declare-fun m!441581 () Bool)

(assert (=> b!458250 m!441581))

(declare-fun m!441583 () Bool)

(assert (=> b!458250 m!441583))

(declare-fun m!441585 () Bool)

(assert (=> b!458250 m!441585))

(declare-fun m!441587 () Bool)

(assert (=> start!41076 m!441587))

(declare-fun m!441589 () Bool)

(assert (=> start!41076 m!441589))

(assert (=> b!458259 m!441565))

(declare-fun m!441591 () Bool)

(assert (=> b!458259 m!441591))

(declare-fun m!441593 () Bool)

(assert (=> b!458259 m!441593))

(declare-fun m!441595 () Bool)

(assert (=> b!458259 m!441595))

(declare-fun m!441597 () Bool)

(assert (=> b!458259 m!441597))

(assert (=> b!458259 m!441565))

(declare-fun m!441599 () Bool)

(assert (=> b!458259 m!441599))

(declare-fun m!441601 () Bool)

(assert (=> b!458253 m!441601))

(declare-fun m!441603 () Bool)

(assert (=> mapNonEmpty!20134 m!441603))

(declare-fun m!441605 () Bool)

(assert (=> b!458260 m!441605))

(declare-fun m!441607 () Bool)

(assert (=> b!458260 m!441607))

(declare-fun m!441609 () Bool)

(assert (=> b!458261 m!441609))

(check-sat (not b!458263) (not b!458250) (not b!458259) (not b!458255) tp_is_empty!12327 b_and!19187 (not b!458261) (not b!458253) (not b!458265) (not b!458251) (not b!458260) (not b_next!10989) (not start!41076) (not b!458254) (not mapNonEmpty!20134) (not b_lambda!9755))
(check-sat b_and!19187 (not b_next!10989))
(get-model)

(declare-fun b_lambda!9759 () Bool)

(assert (= b_lambda!9755 (or (and start!41076 b_free!10989) b_lambda!9759)))

(check-sat (not b!458263) (not b_lambda!9759) (not b!458250) (not b!458259) (not b!458255) tp_is_empty!12327 b_and!19187 (not b!458261) (not b!458253) (not b!458265) (not mapNonEmpty!20134) (not b!458251) (not b!458260) (not b_next!10989) (not start!41076) (not b!458254))
(check-sat b_and!19187 (not b_next!10989))
(get-model)

(declare-fun d!74711 () Bool)

(declare-fun e!267573 () Bool)

(assert (=> d!74711 e!267573))

(declare-fun res!273828 () Bool)

(assert (=> d!74711 (=> (not res!273828) (not e!267573))))

(declare-fun lt!207321 () ListLongMap!7093)

(declare-fun contains!2503 (ListLongMap!7093 (_ BitVec 64)) Bool)

(assert (=> d!74711 (= res!273828 (contains!2503 lt!207321 (_1!4101 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!207324 () List!8252)

(assert (=> d!74711 (= lt!207321 (ListLongMap!7094 lt!207324))))

(declare-fun lt!207322 () Unit!13316)

(declare-fun lt!207323 () Unit!13316)

(assert (=> d!74711 (= lt!207322 lt!207323)))

(declare-datatypes ((Option!378 0))(
  ( (Some!377 (v!8483 V!17541)) (None!376) )
))
(declare-fun getValueByKey!372 (List!8252 (_ BitVec 64)) Option!378)

(assert (=> d!74711 (= (getValueByKey!372 lt!207324 (_1!4101 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!377 (_2!4101 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!194 (List!8252 (_ BitVec 64) V!17541) Unit!13316)

(assert (=> d!74711 (= lt!207323 (lemmaContainsTupThenGetReturnValue!194 lt!207324 (_1!4101 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4101 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!197 (List!8252 (_ BitVec 64) V!17541) List!8252)

(assert (=> d!74711 (= lt!207324 (insertStrictlySorted!197 (toList!3562 lt!207286) (_1!4101 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4101 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74711 (= (+!1598 lt!207286 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!207321)))

(declare-fun b!458326 () Bool)

(declare-fun res!273827 () Bool)

(assert (=> b!458326 (=> (not res!273827) (not e!267573))))

(assert (=> b!458326 (= res!273827 (= (getValueByKey!372 (toList!3562 lt!207321) (_1!4101 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!377 (_2!4101 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!458327 () Bool)

(declare-fun contains!2504 (List!8252 tuple2!8180) Bool)

(assert (=> b!458327 (= e!267573 (contains!2504 (toList!3562 lt!207321) (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74711 res!273828) b!458326))

(assert (= (and b!458326 res!273827) b!458327))

(declare-fun m!441661 () Bool)

(assert (=> d!74711 m!441661))

(declare-fun m!441663 () Bool)

(assert (=> d!74711 m!441663))

(declare-fun m!441665 () Bool)

(assert (=> d!74711 m!441665))

(declare-fun m!441667 () Bool)

(assert (=> d!74711 m!441667))

(declare-fun m!441669 () Bool)

(assert (=> b!458326 m!441669))

(declare-fun m!441671 () Bool)

(assert (=> b!458327 m!441671))

(assert (=> b!458265 d!74711))

(declare-fun d!74713 () Bool)

(declare-fun c!56380 () Bool)

(assert (=> d!74713 (= c!56380 ((_ is ValueCellFull!5820) (select (arr!13669 _values!549) from!863)))))

(declare-fun e!267576 () V!17541)

(assert (=> d!74713 (= (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!267576)))

(declare-fun b!458332 () Bool)

(declare-fun get!6735 (ValueCell!5820 V!17541) V!17541)

(assert (=> b!458332 (= e!267576 (get!6735 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458333 () Bool)

(declare-fun get!6736 (ValueCell!5820 V!17541) V!17541)

(assert (=> b!458333 (= e!267576 (get!6736 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74713 c!56380) b!458332))

(assert (= (and d!74713 (not c!56380)) b!458333))

(assert (=> b!458332 m!441569))

(assert (=> b!458332 m!441567))

(declare-fun m!441673 () Bool)

(assert (=> b!458332 m!441673))

(assert (=> b!458333 m!441569))

(assert (=> b!458333 m!441567))

(declare-fun m!441675 () Bool)

(assert (=> b!458333 m!441675))

(assert (=> b!458265 d!74713))

(declare-fun bm!30111 () Bool)

(declare-fun call!30114 () Bool)

(declare-fun c!56383 () Bool)

(assert (=> bm!30111 (= call!30114 (arrayNoDuplicates!0 lt!207284 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56383 (Cons!8249 (select (arr!13670 lt!207284) #b00000000000000000000000000000000) Nil!8250) Nil!8250)))))

(declare-fun b!458344 () Bool)

(declare-fun e!267585 () Bool)

(assert (=> b!458344 (= e!267585 call!30114)))

(declare-fun b!458345 () Bool)

(declare-fun e!267586 () Bool)

(assert (=> b!458345 (= e!267586 e!267585)))

(assert (=> b!458345 (= c!56383 (validKeyInArray!0 (select (arr!13670 lt!207284) #b00000000000000000000000000000000)))))

(declare-fun b!458346 () Bool)

(assert (=> b!458346 (= e!267585 call!30114)))

(declare-fun b!458347 () Bool)

(declare-fun e!267587 () Bool)

(assert (=> b!458347 (= e!267587 e!267586)))

(declare-fun res!273836 () Bool)

(assert (=> b!458347 (=> (not res!273836) (not e!267586))))

(declare-fun e!267588 () Bool)

(assert (=> b!458347 (= res!273836 (not e!267588))))

(declare-fun res!273835 () Bool)

(assert (=> b!458347 (=> (not res!273835) (not e!267588))))

(assert (=> b!458347 (= res!273835 (validKeyInArray!0 (select (arr!13670 lt!207284) #b00000000000000000000000000000000)))))

(declare-fun b!458348 () Bool)

(declare-fun contains!2505 (List!8253 (_ BitVec 64)) Bool)

(assert (=> b!458348 (= e!267588 (contains!2505 Nil!8250 (select (arr!13670 lt!207284) #b00000000000000000000000000000000)))))

(declare-fun d!74715 () Bool)

(declare-fun res!273837 () Bool)

(assert (=> d!74715 (=> res!273837 e!267587)))

(assert (=> d!74715 (= res!273837 (bvsge #b00000000000000000000000000000000 (size!14022 lt!207284)))))

(assert (=> d!74715 (= (arrayNoDuplicates!0 lt!207284 #b00000000000000000000000000000000 Nil!8250) e!267587)))

(assert (= (and d!74715 (not res!273837)) b!458347))

(assert (= (and b!458347 res!273835) b!458348))

(assert (= (and b!458347 res!273836) b!458345))

(assert (= (and b!458345 c!56383) b!458344))

(assert (= (and b!458345 (not c!56383)) b!458346))

(assert (= (or b!458344 b!458346) bm!30111))

(declare-fun m!441677 () Bool)

(assert (=> bm!30111 m!441677))

(declare-fun m!441679 () Bool)

(assert (=> bm!30111 m!441679))

(assert (=> b!458345 m!441677))

(assert (=> b!458345 m!441677))

(declare-fun m!441681 () Bool)

(assert (=> b!458345 m!441681))

(assert (=> b!458347 m!441677))

(assert (=> b!458347 m!441677))

(assert (=> b!458347 m!441681))

(assert (=> b!458348 m!441677))

(assert (=> b!458348 m!441677))

(declare-fun m!441683 () Bool)

(assert (=> b!458348 m!441683))

(assert (=> b!458251 d!74715))

(declare-fun b!458374 () Bool)

(declare-fun e!267609 () Bool)

(declare-fun e!267603 () Bool)

(assert (=> b!458374 (= e!267609 e!267603)))

(assert (=> b!458374 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14022 lt!207284)))))

(declare-fun lt!207342 () ListLongMap!7093)

(declare-fun res!273847 () Bool)

(assert (=> b!458374 (= res!273847 (contains!2503 lt!207342 (select (arr!13670 lt!207284) from!863)))))

(assert (=> b!458374 (=> (not res!273847) (not e!267603))))

(declare-fun b!458375 () Bool)

(declare-fun e!267607 () Bool)

(assert (=> b!458375 (= e!267607 (validKeyInArray!0 (select (arr!13670 lt!207284) from!863)))))

(assert (=> b!458375 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458376 () Bool)

(declare-fun e!267605 () ListLongMap!7093)

(assert (=> b!458376 (= e!267605 (ListLongMap!7094 Nil!8249))))

(declare-fun b!458377 () Bool)

(assert (=> b!458377 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14022 lt!207284)))))

(assert (=> b!458377 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14021 lt!207287)))))

(declare-fun apply!315 (ListLongMap!7093 (_ BitVec 64)) V!17541)

(assert (=> b!458377 (= e!267603 (= (apply!315 lt!207342 (select (arr!13670 lt!207284) from!863)) (get!6733 (select (arr!13669 lt!207287) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458378 () Bool)

(declare-fun e!267608 () Bool)

(declare-fun isEmpty!562 (ListLongMap!7093) Bool)

(assert (=> b!458378 (= e!267608 (isEmpty!562 lt!207342))))

(declare-fun bm!30114 () Bool)

(declare-fun call!30117 () ListLongMap!7093)

(assert (=> bm!30114 (= call!30117 (getCurrentListMapNoExtraKeys!1744 lt!207284 lt!207287 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458379 () Bool)

(declare-fun e!267606 () ListLongMap!7093)

(assert (=> b!458379 (= e!267605 e!267606)))

(declare-fun c!56394 () Bool)

(assert (=> b!458379 (= c!56394 (validKeyInArray!0 (select (arr!13670 lt!207284) from!863)))))

(declare-fun b!458380 () Bool)

(assert (=> b!458380 (= e!267608 (= lt!207342 (getCurrentListMapNoExtraKeys!1744 lt!207284 lt!207287 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458373 () Bool)

(declare-fun lt!207340 () Unit!13316)

(declare-fun lt!207343 () Unit!13316)

(assert (=> b!458373 (= lt!207340 lt!207343)))

(declare-fun lt!207345 () (_ BitVec 64))

(declare-fun lt!207339 () (_ BitVec 64))

(declare-fun lt!207344 () V!17541)

(declare-fun lt!207341 () ListLongMap!7093)

(assert (=> b!458373 (not (contains!2503 (+!1598 lt!207341 (tuple2!8181 lt!207345 lt!207344)) lt!207339))))

(declare-fun addStillNotContains!148 (ListLongMap!7093 (_ BitVec 64) V!17541 (_ BitVec 64)) Unit!13316)

(assert (=> b!458373 (= lt!207343 (addStillNotContains!148 lt!207341 lt!207345 lt!207344 lt!207339))))

(assert (=> b!458373 (= lt!207339 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458373 (= lt!207344 (get!6733 (select (arr!13669 lt!207287) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458373 (= lt!207345 (select (arr!13670 lt!207284) from!863))))

(assert (=> b!458373 (= lt!207341 call!30117)))

(assert (=> b!458373 (= e!267606 (+!1598 call!30117 (tuple2!8181 (select (arr!13670 lt!207284) from!863) (get!6733 (select (arr!13669 lt!207287) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!74717 () Bool)

(declare-fun e!267604 () Bool)

(assert (=> d!74717 e!267604))

(declare-fun res!273846 () Bool)

(assert (=> d!74717 (=> (not res!273846) (not e!267604))))

(assert (=> d!74717 (= res!273846 (not (contains!2503 lt!207342 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74717 (= lt!207342 e!267605)))

(declare-fun c!56395 () Bool)

(assert (=> d!74717 (= c!56395 (bvsge from!863 (size!14022 lt!207284)))))

(assert (=> d!74717 (validMask!0 mask!1025)))

(assert (=> d!74717 (= (getCurrentListMapNoExtraKeys!1744 lt!207284 lt!207287 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207342)))

(declare-fun b!458381 () Bool)

(assert (=> b!458381 (= e!267609 e!267608)))

(declare-fun c!56392 () Bool)

(assert (=> b!458381 (= c!56392 (bvslt from!863 (size!14022 lt!207284)))))

(declare-fun b!458382 () Bool)

(assert (=> b!458382 (= e!267606 call!30117)))

(declare-fun b!458383 () Bool)

(declare-fun res!273849 () Bool)

(assert (=> b!458383 (=> (not res!273849) (not e!267604))))

(assert (=> b!458383 (= res!273849 (not (contains!2503 lt!207342 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458384 () Bool)

(assert (=> b!458384 (= e!267604 e!267609)))

(declare-fun c!56393 () Bool)

(assert (=> b!458384 (= c!56393 e!267607)))

(declare-fun res!273848 () Bool)

(assert (=> b!458384 (=> (not res!273848) (not e!267607))))

(assert (=> b!458384 (= res!273848 (bvslt from!863 (size!14022 lt!207284)))))

(assert (= (and d!74717 c!56395) b!458376))

(assert (= (and d!74717 (not c!56395)) b!458379))

(assert (= (and b!458379 c!56394) b!458373))

(assert (= (and b!458379 (not c!56394)) b!458382))

(assert (= (or b!458373 b!458382) bm!30114))

(assert (= (and d!74717 res!273846) b!458383))

(assert (= (and b!458383 res!273849) b!458384))

(assert (= (and b!458384 res!273848) b!458375))

(assert (= (and b!458384 c!56393) b!458374))

(assert (= (and b!458384 (not c!56393)) b!458381))

(assert (= (and b!458374 res!273847) b!458377))

(assert (= (and b!458381 c!56392) b!458380))

(assert (= (and b!458381 (not c!56392)) b!458378))

(declare-fun b_lambda!9761 () Bool)

(assert (=> (not b_lambda!9761) (not b!458377)))

(assert (=> b!458377 t!14119))

(declare-fun b_and!19193 () Bool)

(assert (= b_and!19187 (and (=> t!14119 result!7191) b_and!19193)))

(declare-fun b_lambda!9763 () Bool)

(assert (=> (not b_lambda!9763) (not b!458373)))

(assert (=> b!458373 t!14119))

(declare-fun b_and!19195 () Bool)

(assert (= b_and!19193 (and (=> t!14119 result!7191) b_and!19195)))

(declare-fun m!441685 () Bool)

(assert (=> b!458373 m!441685))

(declare-fun m!441687 () Bool)

(assert (=> b!458373 m!441687))

(declare-fun m!441689 () Bool)

(assert (=> b!458373 m!441689))

(assert (=> b!458373 m!441685))

(declare-fun m!441691 () Bool)

(assert (=> b!458373 m!441691))

(declare-fun m!441693 () Bool)

(assert (=> b!458373 m!441693))

(assert (=> b!458373 m!441567))

(declare-fun m!441695 () Bool)

(assert (=> b!458373 m!441695))

(assert (=> b!458373 m!441695))

(assert (=> b!458373 m!441567))

(declare-fun m!441697 () Bool)

(assert (=> b!458373 m!441697))

(assert (=> b!458375 m!441691))

(assert (=> b!458375 m!441691))

(declare-fun m!441699 () Bool)

(assert (=> b!458375 m!441699))

(assert (=> b!458377 m!441691))

(assert (=> b!458377 m!441567))

(assert (=> b!458377 m!441695))

(assert (=> b!458377 m!441691))

(declare-fun m!441701 () Bool)

(assert (=> b!458377 m!441701))

(assert (=> b!458377 m!441695))

(assert (=> b!458377 m!441567))

(assert (=> b!458377 m!441697))

(declare-fun m!441703 () Bool)

(assert (=> b!458378 m!441703))

(assert (=> b!458374 m!441691))

(assert (=> b!458374 m!441691))

(declare-fun m!441705 () Bool)

(assert (=> b!458374 m!441705))

(declare-fun m!441707 () Bool)

(assert (=> d!74717 m!441707))

(assert (=> d!74717 m!441601))

(assert (=> b!458379 m!441691))

(assert (=> b!458379 m!441691))

(assert (=> b!458379 m!441699))

(declare-fun m!441709 () Bool)

(assert (=> bm!30114 m!441709))

(assert (=> b!458380 m!441709))

(declare-fun m!441711 () Bool)

(assert (=> b!458383 m!441711))

(assert (=> b!458250 d!74717))

(declare-fun b!458386 () Bool)

(declare-fun e!267616 () Bool)

(declare-fun e!267610 () Bool)

(assert (=> b!458386 (= e!267616 e!267610)))

(assert (=> b!458386 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14022 _keys!709)))))

(declare-fun res!273851 () Bool)

(declare-fun lt!207349 () ListLongMap!7093)

(assert (=> b!458386 (= res!273851 (contains!2503 lt!207349 (select (arr!13670 _keys!709) from!863)))))

(assert (=> b!458386 (=> (not res!273851) (not e!267610))))

(declare-fun b!458387 () Bool)

(declare-fun e!267614 () Bool)

(assert (=> b!458387 (= e!267614 (validKeyInArray!0 (select (arr!13670 _keys!709) from!863)))))

(assert (=> b!458387 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458388 () Bool)

(declare-fun e!267612 () ListLongMap!7093)

(assert (=> b!458388 (= e!267612 (ListLongMap!7094 Nil!8249))))

(declare-fun b!458389 () Bool)

(assert (=> b!458389 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14022 _keys!709)))))

(assert (=> b!458389 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14021 _values!549)))))

(assert (=> b!458389 (= e!267610 (= (apply!315 lt!207349 (select (arr!13670 _keys!709) from!863)) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458390 () Bool)

(declare-fun e!267615 () Bool)

(assert (=> b!458390 (= e!267615 (isEmpty!562 lt!207349))))

(declare-fun bm!30115 () Bool)

(declare-fun call!30118 () ListLongMap!7093)

(assert (=> bm!30115 (= call!30118 (getCurrentListMapNoExtraKeys!1744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458391 () Bool)

(declare-fun e!267613 () ListLongMap!7093)

(assert (=> b!458391 (= e!267612 e!267613)))

(declare-fun c!56398 () Bool)

(assert (=> b!458391 (= c!56398 (validKeyInArray!0 (select (arr!13670 _keys!709) from!863)))))

(declare-fun b!458392 () Bool)

(assert (=> b!458392 (= e!267615 (= lt!207349 (getCurrentListMapNoExtraKeys!1744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458385 () Bool)

(declare-fun lt!207347 () Unit!13316)

(declare-fun lt!207350 () Unit!13316)

(assert (=> b!458385 (= lt!207347 lt!207350)))

(declare-fun lt!207348 () ListLongMap!7093)

(declare-fun lt!207346 () (_ BitVec 64))

(declare-fun lt!207351 () V!17541)

(declare-fun lt!207352 () (_ BitVec 64))

(assert (=> b!458385 (not (contains!2503 (+!1598 lt!207348 (tuple2!8181 lt!207352 lt!207351)) lt!207346))))

(assert (=> b!458385 (= lt!207350 (addStillNotContains!148 lt!207348 lt!207352 lt!207351 lt!207346))))

(assert (=> b!458385 (= lt!207346 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458385 (= lt!207351 (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458385 (= lt!207352 (select (arr!13670 _keys!709) from!863))))

(assert (=> b!458385 (= lt!207348 call!30118)))

(assert (=> b!458385 (= e!267613 (+!1598 call!30118 (tuple2!8181 (select (arr!13670 _keys!709) from!863) (get!6733 (select (arr!13669 _values!549) from!863) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!74719 () Bool)

(declare-fun e!267611 () Bool)

(assert (=> d!74719 e!267611))

(declare-fun res!273850 () Bool)

(assert (=> d!74719 (=> (not res!273850) (not e!267611))))

(assert (=> d!74719 (= res!273850 (not (contains!2503 lt!207349 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74719 (= lt!207349 e!267612)))

(declare-fun c!56399 () Bool)

(assert (=> d!74719 (= c!56399 (bvsge from!863 (size!14022 _keys!709)))))

(assert (=> d!74719 (validMask!0 mask!1025)))

(assert (=> d!74719 (= (getCurrentListMapNoExtraKeys!1744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207349)))

(declare-fun b!458393 () Bool)

(assert (=> b!458393 (= e!267616 e!267615)))

(declare-fun c!56396 () Bool)

(assert (=> b!458393 (= c!56396 (bvslt from!863 (size!14022 _keys!709)))))

(declare-fun b!458394 () Bool)

(assert (=> b!458394 (= e!267613 call!30118)))

(declare-fun b!458395 () Bool)

(declare-fun res!273853 () Bool)

(assert (=> b!458395 (=> (not res!273853) (not e!267611))))

(assert (=> b!458395 (= res!273853 (not (contains!2503 lt!207349 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458396 () Bool)

(assert (=> b!458396 (= e!267611 e!267616)))

(declare-fun c!56397 () Bool)

(assert (=> b!458396 (= c!56397 e!267614)))

(declare-fun res!273852 () Bool)

(assert (=> b!458396 (=> (not res!273852) (not e!267614))))

(assert (=> b!458396 (= res!273852 (bvslt from!863 (size!14022 _keys!709)))))

(assert (= (and d!74719 c!56399) b!458388))

(assert (= (and d!74719 (not c!56399)) b!458391))

(assert (= (and b!458391 c!56398) b!458385))

(assert (= (and b!458391 (not c!56398)) b!458394))

(assert (= (or b!458385 b!458394) bm!30115))

(assert (= (and d!74719 res!273850) b!458395))

(assert (= (and b!458395 res!273853) b!458396))

(assert (= (and b!458396 res!273852) b!458387))

(assert (= (and b!458396 c!56397) b!458386))

(assert (= (and b!458396 (not c!56397)) b!458393))

(assert (= (and b!458386 res!273851) b!458389))

(assert (= (and b!458393 c!56396) b!458392))

(assert (= (and b!458393 (not c!56396)) b!458390))

(declare-fun b_lambda!9765 () Bool)

(assert (=> (not b_lambda!9765) (not b!458389)))

(assert (=> b!458389 t!14119))

(declare-fun b_and!19197 () Bool)

(assert (= b_and!19195 (and (=> t!14119 result!7191) b_and!19197)))

(declare-fun b_lambda!9767 () Bool)

(assert (=> (not b_lambda!9767) (not b!458385)))

(assert (=> b!458385 t!14119))

(declare-fun b_and!19199 () Bool)

(assert (= b_and!19197 (and (=> t!14119 result!7191) b_and!19199)))

(declare-fun m!441713 () Bool)

(assert (=> b!458385 m!441713))

(declare-fun m!441715 () Bool)

(assert (=> b!458385 m!441715))

(declare-fun m!441717 () Bool)

(assert (=> b!458385 m!441717))

(assert (=> b!458385 m!441713))

(assert (=> b!458385 m!441565))

(declare-fun m!441719 () Bool)

(assert (=> b!458385 m!441719))

(assert (=> b!458385 m!441567))

(assert (=> b!458385 m!441569))

(assert (=> b!458385 m!441569))

(assert (=> b!458385 m!441567))

(assert (=> b!458385 m!441573))

(assert (=> b!458387 m!441565))

(assert (=> b!458387 m!441565))

(assert (=> b!458387 m!441599))

(assert (=> b!458389 m!441565))

(assert (=> b!458389 m!441567))

(assert (=> b!458389 m!441569))

(assert (=> b!458389 m!441565))

(declare-fun m!441721 () Bool)

(assert (=> b!458389 m!441721))

(assert (=> b!458389 m!441569))

(assert (=> b!458389 m!441567))

(assert (=> b!458389 m!441573))

(declare-fun m!441723 () Bool)

(assert (=> b!458390 m!441723))

(assert (=> b!458386 m!441565))

(assert (=> b!458386 m!441565))

(declare-fun m!441725 () Bool)

(assert (=> b!458386 m!441725))

(declare-fun m!441727 () Bool)

(assert (=> d!74719 m!441727))

(assert (=> d!74719 m!441601))

(assert (=> b!458391 m!441565))

(assert (=> b!458391 m!441565))

(assert (=> b!458391 m!441599))

(declare-fun m!441729 () Bool)

(assert (=> bm!30115 m!441729))

(assert (=> b!458392 m!441729))

(declare-fun m!441731 () Bool)

(assert (=> b!458395 m!441731))

(assert (=> b!458250 d!74719))

(declare-fun b!458405 () Bool)

(declare-fun e!267625 () Bool)

(declare-fun e!267624 () Bool)

(assert (=> b!458405 (= e!267625 e!267624)))

(declare-fun lt!207361 () (_ BitVec 64))

(assert (=> b!458405 (= lt!207361 (select (arr!13670 lt!207284) #b00000000000000000000000000000000))))

(declare-fun lt!207360 () Unit!13316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28455 (_ BitVec 64) (_ BitVec 32)) Unit!13316)

(assert (=> b!458405 (= lt!207360 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!207284 lt!207361 #b00000000000000000000000000000000))))

(assert (=> b!458405 (arrayContainsKey!0 lt!207284 lt!207361 #b00000000000000000000000000000000)))

(declare-fun lt!207359 () Unit!13316)

(assert (=> b!458405 (= lt!207359 lt!207360)))

(declare-fun res!273858 () Bool)

(declare-datatypes ((SeekEntryResult!3534 0))(
  ( (MissingZero!3534 (index!16315 (_ BitVec 32))) (Found!3534 (index!16316 (_ BitVec 32))) (Intermediate!3534 (undefined!4346 Bool) (index!16317 (_ BitVec 32)) (x!42779 (_ BitVec 32))) (Undefined!3534) (MissingVacant!3534 (index!16318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28455 (_ BitVec 32)) SeekEntryResult!3534)

(assert (=> b!458405 (= res!273858 (= (seekEntryOrOpen!0 (select (arr!13670 lt!207284) #b00000000000000000000000000000000) lt!207284 mask!1025) (Found!3534 #b00000000000000000000000000000000)))))

(assert (=> b!458405 (=> (not res!273858) (not e!267624))))

(declare-fun bm!30118 () Bool)

(declare-fun call!30121 () Bool)

(assert (=> bm!30118 (= call!30121 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!207284 mask!1025))))

(declare-fun b!458406 () Bool)

(assert (=> b!458406 (= e!267624 call!30121)))

(declare-fun b!458407 () Bool)

(assert (=> b!458407 (= e!267625 call!30121)))

(declare-fun d!74721 () Bool)

(declare-fun res!273859 () Bool)

(declare-fun e!267623 () Bool)

(assert (=> d!74721 (=> res!273859 e!267623)))

(assert (=> d!74721 (= res!273859 (bvsge #b00000000000000000000000000000000 (size!14022 lt!207284)))))

(assert (=> d!74721 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207284 mask!1025) e!267623)))

(declare-fun b!458408 () Bool)

(assert (=> b!458408 (= e!267623 e!267625)))

(declare-fun c!56402 () Bool)

(assert (=> b!458408 (= c!56402 (validKeyInArray!0 (select (arr!13670 lt!207284) #b00000000000000000000000000000000)))))

(assert (= (and d!74721 (not res!273859)) b!458408))

(assert (= (and b!458408 c!56402) b!458405))

(assert (= (and b!458408 (not c!56402)) b!458407))

(assert (= (and b!458405 res!273858) b!458406))

(assert (= (or b!458406 b!458407) bm!30118))

(assert (=> b!458405 m!441677))

(declare-fun m!441733 () Bool)

(assert (=> b!458405 m!441733))

(declare-fun m!441735 () Bool)

(assert (=> b!458405 m!441735))

(assert (=> b!458405 m!441677))

(declare-fun m!441737 () Bool)

(assert (=> b!458405 m!441737))

(declare-fun m!441739 () Bool)

(assert (=> bm!30118 m!441739))

(assert (=> b!458408 m!441677))

(assert (=> b!458408 m!441677))

(assert (=> b!458408 m!441681))

(assert (=> b!458260 d!74721))

(declare-fun bm!30119 () Bool)

(declare-fun call!30122 () Bool)

(declare-fun c!56403 () Bool)

(assert (=> bm!30119 (= call!30122 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56403 (Cons!8249 (select (arr!13670 _keys!709) #b00000000000000000000000000000000) Nil!8250) Nil!8250)))))

(declare-fun b!458409 () Bool)

(declare-fun e!267626 () Bool)

(assert (=> b!458409 (= e!267626 call!30122)))

(declare-fun b!458410 () Bool)

(declare-fun e!267627 () Bool)

(assert (=> b!458410 (= e!267627 e!267626)))

(assert (=> b!458410 (= c!56403 (validKeyInArray!0 (select (arr!13670 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458411 () Bool)

(assert (=> b!458411 (= e!267626 call!30122)))

(declare-fun b!458412 () Bool)

(declare-fun e!267628 () Bool)

(assert (=> b!458412 (= e!267628 e!267627)))

(declare-fun res!273861 () Bool)

(assert (=> b!458412 (=> (not res!273861) (not e!267627))))

(declare-fun e!267629 () Bool)

(assert (=> b!458412 (= res!273861 (not e!267629))))

(declare-fun res!273860 () Bool)

(assert (=> b!458412 (=> (not res!273860) (not e!267629))))

(assert (=> b!458412 (= res!273860 (validKeyInArray!0 (select (arr!13670 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458413 () Bool)

(assert (=> b!458413 (= e!267629 (contains!2505 Nil!8250 (select (arr!13670 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74723 () Bool)

(declare-fun res!273862 () Bool)

(assert (=> d!74723 (=> res!273862 e!267628)))

(assert (=> d!74723 (= res!273862 (bvsge #b00000000000000000000000000000000 (size!14022 _keys!709)))))

(assert (=> d!74723 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8250) e!267628)))

(assert (= (and d!74723 (not res!273862)) b!458412))

(assert (= (and b!458412 res!273860) b!458413))

(assert (= (and b!458412 res!273861) b!458410))

(assert (= (and b!458410 c!56403) b!458409))

(assert (= (and b!458410 (not c!56403)) b!458411))

(assert (= (or b!458409 b!458411) bm!30119))

(declare-fun m!441741 () Bool)

(assert (=> bm!30119 m!441741))

(declare-fun m!441743 () Bool)

(assert (=> bm!30119 m!441743))

(assert (=> b!458410 m!441741))

(assert (=> b!458410 m!441741))

(declare-fun m!441745 () Bool)

(assert (=> b!458410 m!441745))

(assert (=> b!458412 m!441741))

(assert (=> b!458412 m!441741))

(assert (=> b!458412 m!441745))

(assert (=> b!458413 m!441741))

(assert (=> b!458413 m!441741))

(declare-fun m!441747 () Bool)

(assert (=> b!458413 m!441747))

(assert (=> b!458255 d!74723))

(declare-fun d!74725 () Bool)

(assert (=> d!74725 (= (array_inv!9896 _values!549) (bvsge (size!14021 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41076 d!74725))

(declare-fun d!74727 () Bool)

(assert (=> d!74727 (= (array_inv!9897 _keys!709) (bvsge (size!14022 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41076 d!74727))

(declare-fun d!74729 () Bool)

(assert (=> d!74729 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458254 d!74729))

(declare-fun d!74731 () Bool)

(declare-fun res!273867 () Bool)

(declare-fun e!267634 () Bool)

(assert (=> d!74731 (=> res!273867 e!267634)))

(assert (=> d!74731 (= res!273867 (= (select (arr!13670 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74731 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!267634)))

(declare-fun b!458418 () Bool)

(declare-fun e!267635 () Bool)

(assert (=> b!458418 (= e!267634 e!267635)))

(declare-fun res!273868 () Bool)

(assert (=> b!458418 (=> (not res!273868) (not e!267635))))

(assert (=> b!458418 (= res!273868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14022 _keys!709)))))

(declare-fun b!458419 () Bool)

(assert (=> b!458419 (= e!267635 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74731 (not res!273867)) b!458418))

(assert (= (and b!458418 res!273868) b!458419))

(assert (=> d!74731 m!441741))

(declare-fun m!441749 () Bool)

(assert (=> b!458419 m!441749))

(assert (=> b!458263 d!74731))

(declare-fun b!458421 () Bool)

(declare-fun e!267642 () Bool)

(declare-fun e!267636 () Bool)

(assert (=> b!458421 (= e!267642 e!267636)))

(assert (=> b!458421 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14022 lt!207284)))))

(declare-fun lt!207365 () ListLongMap!7093)

(declare-fun res!273870 () Bool)

(assert (=> b!458421 (= res!273870 (contains!2503 lt!207365 (select (arr!13670 lt!207284) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458421 (=> (not res!273870) (not e!267636))))

(declare-fun b!458422 () Bool)

(declare-fun e!267640 () Bool)

(assert (=> b!458422 (= e!267640 (validKeyInArray!0 (select (arr!13670 lt!207284) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458422 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458423 () Bool)

(declare-fun e!267638 () ListLongMap!7093)

(assert (=> b!458423 (= e!267638 (ListLongMap!7094 Nil!8249))))

(declare-fun b!458424 () Bool)

(assert (=> b!458424 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14022 lt!207284)))))

(assert (=> b!458424 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14021 lt!207287)))))

(assert (=> b!458424 (= e!267636 (= (apply!315 lt!207365 (select (arr!13670 lt!207284) (bvadd #b00000000000000000000000000000001 from!863))) (get!6733 (select (arr!13669 lt!207287) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458425 () Bool)

(declare-fun e!267641 () Bool)

(assert (=> b!458425 (= e!267641 (isEmpty!562 lt!207365))))

(declare-fun call!30123 () ListLongMap!7093)

(declare-fun bm!30120 () Bool)

(assert (=> bm!30120 (= call!30123 (getCurrentListMapNoExtraKeys!1744 lt!207284 lt!207287 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458426 () Bool)

(declare-fun e!267639 () ListLongMap!7093)

(assert (=> b!458426 (= e!267638 e!267639)))

(declare-fun c!56406 () Bool)

(assert (=> b!458426 (= c!56406 (validKeyInArray!0 (select (arr!13670 lt!207284) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458427 () Bool)

(assert (=> b!458427 (= e!267641 (= lt!207365 (getCurrentListMapNoExtraKeys!1744 lt!207284 lt!207287 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458420 () Bool)

(declare-fun lt!207363 () Unit!13316)

(declare-fun lt!207366 () Unit!13316)

(assert (=> b!458420 (= lt!207363 lt!207366)))

(declare-fun lt!207368 () (_ BitVec 64))

(declare-fun lt!207367 () V!17541)

(declare-fun lt!207362 () (_ BitVec 64))

(declare-fun lt!207364 () ListLongMap!7093)

(assert (=> b!458420 (not (contains!2503 (+!1598 lt!207364 (tuple2!8181 lt!207368 lt!207367)) lt!207362))))

(assert (=> b!458420 (= lt!207366 (addStillNotContains!148 lt!207364 lt!207368 lt!207367 lt!207362))))

(assert (=> b!458420 (= lt!207362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458420 (= lt!207367 (get!6733 (select (arr!13669 lt!207287) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458420 (= lt!207368 (select (arr!13670 lt!207284) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458420 (= lt!207364 call!30123)))

(assert (=> b!458420 (= e!267639 (+!1598 call!30123 (tuple2!8181 (select (arr!13670 lt!207284) (bvadd #b00000000000000000000000000000001 from!863)) (get!6733 (select (arr!13669 lt!207287) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!74733 () Bool)

(declare-fun e!267637 () Bool)

(assert (=> d!74733 e!267637))

(declare-fun res!273869 () Bool)

(assert (=> d!74733 (=> (not res!273869) (not e!267637))))

(assert (=> d!74733 (= res!273869 (not (contains!2503 lt!207365 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74733 (= lt!207365 e!267638)))

(declare-fun c!56407 () Bool)

(assert (=> d!74733 (= c!56407 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14022 lt!207284)))))

(assert (=> d!74733 (validMask!0 mask!1025)))

(assert (=> d!74733 (= (getCurrentListMapNoExtraKeys!1744 lt!207284 lt!207287 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207365)))

(declare-fun b!458428 () Bool)

(assert (=> b!458428 (= e!267642 e!267641)))

(declare-fun c!56404 () Bool)

(assert (=> b!458428 (= c!56404 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14022 lt!207284)))))

(declare-fun b!458429 () Bool)

(assert (=> b!458429 (= e!267639 call!30123)))

(declare-fun b!458430 () Bool)

(declare-fun res!273872 () Bool)

(assert (=> b!458430 (=> (not res!273872) (not e!267637))))

(assert (=> b!458430 (= res!273872 (not (contains!2503 lt!207365 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458431 () Bool)

(assert (=> b!458431 (= e!267637 e!267642)))

(declare-fun c!56405 () Bool)

(assert (=> b!458431 (= c!56405 e!267640)))

(declare-fun res!273871 () Bool)

(assert (=> b!458431 (=> (not res!273871) (not e!267640))))

(assert (=> b!458431 (= res!273871 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14022 lt!207284)))))

(assert (= (and d!74733 c!56407) b!458423))

(assert (= (and d!74733 (not c!56407)) b!458426))

(assert (= (and b!458426 c!56406) b!458420))

(assert (= (and b!458426 (not c!56406)) b!458429))

(assert (= (or b!458420 b!458429) bm!30120))

(assert (= (and d!74733 res!273869) b!458430))

(assert (= (and b!458430 res!273872) b!458431))

(assert (= (and b!458431 res!273871) b!458422))

(assert (= (and b!458431 c!56405) b!458421))

(assert (= (and b!458431 (not c!56405)) b!458428))

(assert (= (and b!458421 res!273870) b!458424))

(assert (= (and b!458428 c!56404) b!458427))

(assert (= (and b!458428 (not c!56404)) b!458425))

(declare-fun b_lambda!9769 () Bool)

(assert (=> (not b_lambda!9769) (not b!458424)))

(assert (=> b!458424 t!14119))

(declare-fun b_and!19201 () Bool)

(assert (= b_and!19199 (and (=> t!14119 result!7191) b_and!19201)))

(declare-fun b_lambda!9771 () Bool)

(assert (=> (not b_lambda!9771) (not b!458420)))

(assert (=> b!458420 t!14119))

(declare-fun b_and!19203 () Bool)

(assert (= b_and!19201 (and (=> t!14119 result!7191) b_and!19203)))

(declare-fun m!441751 () Bool)

(assert (=> b!458420 m!441751))

(declare-fun m!441753 () Bool)

(assert (=> b!458420 m!441753))

(declare-fun m!441755 () Bool)

(assert (=> b!458420 m!441755))

(assert (=> b!458420 m!441751))

(declare-fun m!441757 () Bool)

(assert (=> b!458420 m!441757))

(declare-fun m!441759 () Bool)

(assert (=> b!458420 m!441759))

(assert (=> b!458420 m!441567))

(declare-fun m!441761 () Bool)

(assert (=> b!458420 m!441761))

(assert (=> b!458420 m!441761))

(assert (=> b!458420 m!441567))

(declare-fun m!441763 () Bool)

(assert (=> b!458420 m!441763))

(assert (=> b!458422 m!441757))

(assert (=> b!458422 m!441757))

(declare-fun m!441765 () Bool)

(assert (=> b!458422 m!441765))

(assert (=> b!458424 m!441757))

(assert (=> b!458424 m!441567))

(assert (=> b!458424 m!441761))

(assert (=> b!458424 m!441757))

(declare-fun m!441767 () Bool)

(assert (=> b!458424 m!441767))

(assert (=> b!458424 m!441761))

(assert (=> b!458424 m!441567))

(assert (=> b!458424 m!441763))

(declare-fun m!441769 () Bool)

(assert (=> b!458425 m!441769))

(assert (=> b!458421 m!441757))

(assert (=> b!458421 m!441757))

(declare-fun m!441771 () Bool)

(assert (=> b!458421 m!441771))

(declare-fun m!441773 () Bool)

(assert (=> d!74733 m!441773))

(assert (=> d!74733 m!441601))

(assert (=> b!458426 m!441757))

(assert (=> b!458426 m!441757))

(assert (=> b!458426 m!441765))

(declare-fun m!441775 () Bool)

(assert (=> bm!30120 m!441775))

(assert (=> b!458427 m!441775))

(declare-fun m!441777 () Bool)

(assert (=> b!458430 m!441777))

(assert (=> b!458259 d!74733))

(declare-fun b!458433 () Bool)

(declare-fun e!267649 () Bool)

(declare-fun e!267643 () Bool)

(assert (=> b!458433 (= e!267649 e!267643)))

(assert (=> b!458433 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14022 _keys!709)))))

(declare-fun lt!207372 () ListLongMap!7093)

(declare-fun res!273874 () Bool)

(assert (=> b!458433 (= res!273874 (contains!2503 lt!207372 (select (arr!13670 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458433 (=> (not res!273874) (not e!267643))))

(declare-fun b!458434 () Bool)

(declare-fun e!267647 () Bool)

(assert (=> b!458434 (= e!267647 (validKeyInArray!0 (select (arr!13670 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458434 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458435 () Bool)

(declare-fun e!267645 () ListLongMap!7093)

(assert (=> b!458435 (= e!267645 (ListLongMap!7094 Nil!8249))))

(declare-fun b!458436 () Bool)

(assert (=> b!458436 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14022 _keys!709)))))

(assert (=> b!458436 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14021 _values!549)))))

(assert (=> b!458436 (= e!267643 (= (apply!315 lt!207372 (select (arr!13670 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6733 (select (arr!13669 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458437 () Bool)

(declare-fun e!267648 () Bool)

(assert (=> b!458437 (= e!267648 (isEmpty!562 lt!207372))))

(declare-fun call!30124 () ListLongMap!7093)

(declare-fun bm!30121 () Bool)

(assert (=> bm!30121 (= call!30124 (getCurrentListMapNoExtraKeys!1744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458438 () Bool)

(declare-fun e!267646 () ListLongMap!7093)

(assert (=> b!458438 (= e!267645 e!267646)))

(declare-fun c!56410 () Bool)

(assert (=> b!458438 (= c!56410 (validKeyInArray!0 (select (arr!13670 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458439 () Bool)

(assert (=> b!458439 (= e!267648 (= lt!207372 (getCurrentListMapNoExtraKeys!1744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458432 () Bool)

(declare-fun lt!207370 () Unit!13316)

(declare-fun lt!207373 () Unit!13316)

(assert (=> b!458432 (= lt!207370 lt!207373)))

(declare-fun lt!207375 () (_ BitVec 64))

(declare-fun lt!207369 () (_ BitVec 64))

(declare-fun lt!207371 () ListLongMap!7093)

(declare-fun lt!207374 () V!17541)

(assert (=> b!458432 (not (contains!2503 (+!1598 lt!207371 (tuple2!8181 lt!207375 lt!207374)) lt!207369))))

(assert (=> b!458432 (= lt!207373 (addStillNotContains!148 lt!207371 lt!207375 lt!207374 lt!207369))))

(assert (=> b!458432 (= lt!207369 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458432 (= lt!207374 (get!6733 (select (arr!13669 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458432 (= lt!207375 (select (arr!13670 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458432 (= lt!207371 call!30124)))

(assert (=> b!458432 (= e!267646 (+!1598 call!30124 (tuple2!8181 (select (arr!13670 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6733 (select (arr!13669 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!887 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!74735 () Bool)

(declare-fun e!267644 () Bool)

(assert (=> d!74735 e!267644))

(declare-fun res!273873 () Bool)

(assert (=> d!74735 (=> (not res!273873) (not e!267644))))

(assert (=> d!74735 (= res!273873 (not (contains!2503 lt!207372 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74735 (= lt!207372 e!267645)))

(declare-fun c!56411 () Bool)

(assert (=> d!74735 (= c!56411 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14022 _keys!709)))))

(assert (=> d!74735 (validMask!0 mask!1025)))

(assert (=> d!74735 (= (getCurrentListMapNoExtraKeys!1744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207372)))

(declare-fun b!458440 () Bool)

(assert (=> b!458440 (= e!267649 e!267648)))

(declare-fun c!56408 () Bool)

(assert (=> b!458440 (= c!56408 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14022 _keys!709)))))

(declare-fun b!458441 () Bool)

(assert (=> b!458441 (= e!267646 call!30124)))

(declare-fun b!458442 () Bool)

(declare-fun res!273876 () Bool)

(assert (=> b!458442 (=> (not res!273876) (not e!267644))))

(assert (=> b!458442 (= res!273876 (not (contains!2503 lt!207372 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458443 () Bool)

(assert (=> b!458443 (= e!267644 e!267649)))

(declare-fun c!56409 () Bool)

(assert (=> b!458443 (= c!56409 e!267647)))

(declare-fun res!273875 () Bool)

(assert (=> b!458443 (=> (not res!273875) (not e!267647))))

(assert (=> b!458443 (= res!273875 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14022 _keys!709)))))

(assert (= (and d!74735 c!56411) b!458435))

(assert (= (and d!74735 (not c!56411)) b!458438))

(assert (= (and b!458438 c!56410) b!458432))

(assert (= (and b!458438 (not c!56410)) b!458441))

(assert (= (or b!458432 b!458441) bm!30121))

(assert (= (and d!74735 res!273873) b!458442))

(assert (= (and b!458442 res!273876) b!458443))

(assert (= (and b!458443 res!273875) b!458434))

(assert (= (and b!458443 c!56409) b!458433))

(assert (= (and b!458443 (not c!56409)) b!458440))

(assert (= (and b!458433 res!273874) b!458436))

(assert (= (and b!458440 c!56408) b!458439))

(assert (= (and b!458440 (not c!56408)) b!458437))

(declare-fun b_lambda!9773 () Bool)

(assert (=> (not b_lambda!9773) (not b!458436)))

(assert (=> b!458436 t!14119))

(declare-fun b_and!19205 () Bool)

(assert (= b_and!19203 (and (=> t!14119 result!7191) b_and!19205)))

(declare-fun b_lambda!9775 () Bool)

(assert (=> (not b_lambda!9775) (not b!458432)))

(assert (=> b!458432 t!14119))

(declare-fun b_and!19207 () Bool)

(assert (= b_and!19205 (and (=> t!14119 result!7191) b_and!19207)))

(declare-fun m!441779 () Bool)

(assert (=> b!458432 m!441779))

(declare-fun m!441781 () Bool)

(assert (=> b!458432 m!441781))

(declare-fun m!441783 () Bool)

(assert (=> b!458432 m!441783))

(assert (=> b!458432 m!441779))

(declare-fun m!441785 () Bool)

(assert (=> b!458432 m!441785))

(declare-fun m!441787 () Bool)

(assert (=> b!458432 m!441787))

(assert (=> b!458432 m!441567))

(declare-fun m!441789 () Bool)

(assert (=> b!458432 m!441789))

(assert (=> b!458432 m!441789))

(assert (=> b!458432 m!441567))

(declare-fun m!441791 () Bool)

(assert (=> b!458432 m!441791))

(assert (=> b!458434 m!441785))

(assert (=> b!458434 m!441785))

(declare-fun m!441793 () Bool)

(assert (=> b!458434 m!441793))

(assert (=> b!458436 m!441785))

(assert (=> b!458436 m!441567))

(assert (=> b!458436 m!441789))

(assert (=> b!458436 m!441785))

(declare-fun m!441795 () Bool)

(assert (=> b!458436 m!441795))

(assert (=> b!458436 m!441789))

(assert (=> b!458436 m!441567))

(assert (=> b!458436 m!441791))

(declare-fun m!441797 () Bool)

(assert (=> b!458437 m!441797))

(assert (=> b!458433 m!441785))

(assert (=> b!458433 m!441785))

(declare-fun m!441799 () Bool)

(assert (=> b!458433 m!441799))

(declare-fun m!441801 () Bool)

(assert (=> d!74735 m!441801))

(assert (=> d!74735 m!441601))

(assert (=> b!458438 m!441785))

(assert (=> b!458438 m!441785))

(assert (=> b!458438 m!441793))

(declare-fun m!441803 () Bool)

(assert (=> bm!30121 m!441803))

(assert (=> b!458439 m!441803))

(declare-fun m!441805 () Bool)

(assert (=> b!458442 m!441805))

(assert (=> b!458259 d!74735))

(declare-fun d!74737 () Bool)

(declare-fun e!267650 () Bool)

(assert (=> d!74737 e!267650))

(declare-fun res!273878 () Bool)

(assert (=> d!74737 (=> (not res!273878) (not e!267650))))

(declare-fun lt!207376 () ListLongMap!7093)

(assert (=> d!74737 (= res!273878 (contains!2503 lt!207376 (_1!4101 (tuple2!8181 k0!794 v!412))))))

(declare-fun lt!207379 () List!8252)

(assert (=> d!74737 (= lt!207376 (ListLongMap!7094 lt!207379))))

(declare-fun lt!207377 () Unit!13316)

(declare-fun lt!207378 () Unit!13316)

(assert (=> d!74737 (= lt!207377 lt!207378)))

(assert (=> d!74737 (= (getValueByKey!372 lt!207379 (_1!4101 (tuple2!8181 k0!794 v!412))) (Some!377 (_2!4101 (tuple2!8181 k0!794 v!412))))))

(assert (=> d!74737 (= lt!207378 (lemmaContainsTupThenGetReturnValue!194 lt!207379 (_1!4101 (tuple2!8181 k0!794 v!412)) (_2!4101 (tuple2!8181 k0!794 v!412))))))

(assert (=> d!74737 (= lt!207379 (insertStrictlySorted!197 (toList!3562 lt!207288) (_1!4101 (tuple2!8181 k0!794 v!412)) (_2!4101 (tuple2!8181 k0!794 v!412))))))

(assert (=> d!74737 (= (+!1598 lt!207288 (tuple2!8181 k0!794 v!412)) lt!207376)))

(declare-fun b!458444 () Bool)

(declare-fun res!273877 () Bool)

(assert (=> b!458444 (=> (not res!273877) (not e!267650))))

(assert (=> b!458444 (= res!273877 (= (getValueByKey!372 (toList!3562 lt!207376) (_1!4101 (tuple2!8181 k0!794 v!412))) (Some!377 (_2!4101 (tuple2!8181 k0!794 v!412)))))))

(declare-fun b!458445 () Bool)

(assert (=> b!458445 (= e!267650 (contains!2504 (toList!3562 lt!207376) (tuple2!8181 k0!794 v!412)))))

(assert (= (and d!74737 res!273878) b!458444))

(assert (= (and b!458444 res!273877) b!458445))

(declare-fun m!441807 () Bool)

(assert (=> d!74737 m!441807))

(declare-fun m!441809 () Bool)

(assert (=> d!74737 m!441809))

(declare-fun m!441811 () Bool)

(assert (=> d!74737 m!441811))

(declare-fun m!441813 () Bool)

(assert (=> d!74737 m!441813))

(declare-fun m!441815 () Bool)

(assert (=> b!458444 m!441815))

(declare-fun m!441817 () Bool)

(assert (=> b!458445 m!441817))

(assert (=> b!458259 d!74737))

(declare-fun d!74739 () Bool)

(assert (=> d!74739 (= (validKeyInArray!0 (select (arr!13670 _keys!709) from!863)) (and (not (= (select (arr!13670 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13670 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458259 d!74739))

(declare-fun call!30130 () ListLongMap!7093)

(declare-fun b!458452 () Bool)

(declare-fun call!30129 () ListLongMap!7093)

(declare-fun e!267655 () Bool)

(assert (=> b!458452 (= e!267655 (= call!30130 (+!1598 call!30129 (tuple2!8181 k0!794 v!412))))))

(declare-fun bm!30126 () Bool)

(assert (=> bm!30126 (= call!30130 (getCurrentListMapNoExtraKeys!1744 (array!28456 (store (arr!13670 _keys!709) i!563 k0!794) (size!14022 _keys!709)) (array!28454 (store (arr!13669 _values!549) i!563 (ValueCellFull!5820 v!412)) (size!14021 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458453 () Bool)

(declare-fun e!267656 () Bool)

(assert (=> b!458453 (= e!267656 e!267655)))

(declare-fun c!56414 () Bool)

(assert (=> b!458453 (= c!56414 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun b!458454 () Bool)

(assert (=> b!458454 (= e!267655 (= call!30130 call!30129))))

(declare-fun d!74741 () Bool)

(assert (=> d!74741 e!267656))

(declare-fun res!273881 () Bool)

(assert (=> d!74741 (=> (not res!273881) (not e!267656))))

(assert (=> d!74741 (= res!273881 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14022 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14021 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14022 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14021 _values!549))))))))

(declare-fun lt!207382 () Unit!13316)

(declare-fun choose!1332 (array!28455 array!28453 (_ BitVec 32) (_ BitVec 32) V!17541 V!17541 (_ BitVec 32) (_ BitVec 64) V!17541 (_ BitVec 32) Int) Unit!13316)

(assert (=> d!74741 (= lt!207382 (choose!1332 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74741 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14022 _keys!709)))))

(assert (=> d!74741 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!757 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207382)))

(declare-fun bm!30127 () Bool)

(assert (=> bm!30127 (= call!30129 (getCurrentListMapNoExtraKeys!1744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74741 res!273881) b!458453))

(assert (= (and b!458453 c!56414) b!458452))

(assert (= (and b!458453 (not c!56414)) b!458454))

(assert (= (or b!458452 b!458454) bm!30127))

(assert (= (or b!458452 b!458454) bm!30126))

(declare-fun m!441819 () Bool)

(assert (=> b!458452 m!441819))

(assert (=> bm!30126 m!441607))

(assert (=> bm!30126 m!441583))

(declare-fun m!441821 () Bool)

(assert (=> bm!30126 m!441821))

(declare-fun m!441823 () Bool)

(assert (=> d!74741 m!441823))

(assert (=> bm!30127 m!441593))

(assert (=> b!458259 d!74741))

(declare-fun d!74743 () Bool)

(assert (=> d!74743 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!458253 d!74743))

(declare-fun b!458455 () Bool)

(declare-fun e!267659 () Bool)

(declare-fun e!267658 () Bool)

(assert (=> b!458455 (= e!267659 e!267658)))

(declare-fun lt!207385 () (_ BitVec 64))

(assert (=> b!458455 (= lt!207385 (select (arr!13670 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!207384 () Unit!13316)

(assert (=> b!458455 (= lt!207384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!207385 #b00000000000000000000000000000000))))

(assert (=> b!458455 (arrayContainsKey!0 _keys!709 lt!207385 #b00000000000000000000000000000000)))

(declare-fun lt!207383 () Unit!13316)

(assert (=> b!458455 (= lt!207383 lt!207384)))

(declare-fun res!273882 () Bool)

(assert (=> b!458455 (= res!273882 (= (seekEntryOrOpen!0 (select (arr!13670 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3534 #b00000000000000000000000000000000)))))

(assert (=> b!458455 (=> (not res!273882) (not e!267658))))

(declare-fun bm!30128 () Bool)

(declare-fun call!30131 () Bool)

(assert (=> bm!30128 (= call!30131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!458456 () Bool)

(assert (=> b!458456 (= e!267658 call!30131)))

(declare-fun b!458457 () Bool)

(assert (=> b!458457 (= e!267659 call!30131)))

(declare-fun d!74745 () Bool)

(declare-fun res!273883 () Bool)

(declare-fun e!267657 () Bool)

(assert (=> d!74745 (=> res!273883 e!267657)))

(assert (=> d!74745 (= res!273883 (bvsge #b00000000000000000000000000000000 (size!14022 _keys!709)))))

(assert (=> d!74745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!267657)))

(declare-fun b!458458 () Bool)

(assert (=> b!458458 (= e!267657 e!267659)))

(declare-fun c!56415 () Bool)

(assert (=> b!458458 (= c!56415 (validKeyInArray!0 (select (arr!13670 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74745 (not res!273883)) b!458458))

(assert (= (and b!458458 c!56415) b!458455))

(assert (= (and b!458458 (not c!56415)) b!458457))

(assert (= (and b!458455 res!273882) b!458456))

(assert (= (or b!458456 b!458457) bm!30128))

(assert (=> b!458455 m!441741))

(declare-fun m!441825 () Bool)

(assert (=> b!458455 m!441825))

(declare-fun m!441827 () Bool)

(assert (=> b!458455 m!441827))

(assert (=> b!458455 m!441741))

(declare-fun m!441829 () Bool)

(assert (=> b!458455 m!441829))

(declare-fun m!441831 () Bool)

(assert (=> bm!30128 m!441831))

(assert (=> b!458458 m!441741))

(assert (=> b!458458 m!441741))

(assert (=> b!458458 m!441745))

(assert (=> b!458261 d!74745))

(declare-fun mapIsEmpty!20140 () Bool)

(declare-fun mapRes!20140 () Bool)

(assert (=> mapIsEmpty!20140 mapRes!20140))

(declare-fun mapNonEmpty!20140 () Bool)

(declare-fun tp!38806 () Bool)

(declare-fun e!267664 () Bool)

(assert (=> mapNonEmpty!20140 (= mapRes!20140 (and tp!38806 e!267664))))

(declare-fun mapValue!20140 () ValueCell!5820)

(declare-fun mapKey!20140 () (_ BitVec 32))

(declare-fun mapRest!20140 () (Array (_ BitVec 32) ValueCell!5820))

(assert (=> mapNonEmpty!20140 (= mapRest!20134 (store mapRest!20140 mapKey!20140 mapValue!20140))))

(declare-fun condMapEmpty!20140 () Bool)

(declare-fun mapDefault!20140 () ValueCell!5820)

(assert (=> mapNonEmpty!20134 (= condMapEmpty!20140 (= mapRest!20134 ((as const (Array (_ BitVec 32) ValueCell!5820)) mapDefault!20140)))))

(declare-fun e!267665 () Bool)

(assert (=> mapNonEmpty!20134 (= tp!38796 (and e!267665 mapRes!20140))))

(declare-fun b!458466 () Bool)

(assert (=> b!458466 (= e!267665 tp_is_empty!12327)))

(declare-fun b!458465 () Bool)

(assert (=> b!458465 (= e!267664 tp_is_empty!12327)))

(assert (= (and mapNonEmpty!20134 condMapEmpty!20140) mapIsEmpty!20140))

(assert (= (and mapNonEmpty!20134 (not condMapEmpty!20140)) mapNonEmpty!20140))

(assert (= (and mapNonEmpty!20140 ((_ is ValueCellFull!5820) mapValue!20140)) b!458465))

(assert (= (and mapNonEmpty!20134 ((_ is ValueCellFull!5820) mapDefault!20140)) b!458466))

(declare-fun m!441833 () Bool)

(assert (=> mapNonEmpty!20140 m!441833))

(declare-fun b_lambda!9777 () Bool)

(assert (= b_lambda!9769 (or (and start!41076 b_free!10989) b_lambda!9777)))

(declare-fun b_lambda!9779 () Bool)

(assert (= b_lambda!9771 (or (and start!41076 b_free!10989) b_lambda!9779)))

(declare-fun b_lambda!9781 () Bool)

(assert (= b_lambda!9767 (or (and start!41076 b_free!10989) b_lambda!9781)))

(declare-fun b_lambda!9783 () Bool)

(assert (= b_lambda!9773 (or (and start!41076 b_free!10989) b_lambda!9783)))

(declare-fun b_lambda!9785 () Bool)

(assert (= b_lambda!9765 (or (and start!41076 b_free!10989) b_lambda!9785)))

(declare-fun b_lambda!9787 () Bool)

(assert (= b_lambda!9775 (or (and start!41076 b_free!10989) b_lambda!9787)))

(declare-fun b_lambda!9789 () Bool)

(assert (= b_lambda!9761 (or (and start!41076 b_free!10989) b_lambda!9789)))

(declare-fun b_lambda!9791 () Bool)

(assert (= b_lambda!9763 (or (and start!41076 b_free!10989) b_lambda!9791)))

(check-sat (not b_lambda!9759) (not b!458444) (not b!458385) (not b!458421) (not bm!30126) (not b!458390) (not b!458425) (not b!458345) (not d!74735) (not b!458430) (not b!458348) (not b!458347) (not b!458378) (not b_lambda!9777) (not b!458379) (not b!458395) (not d!74717) (not b!458332) (not b!458383) (not b!458392) (not b!458405) (not b!458452) (not bm!30115) (not b_next!10989) (not bm!30120) (not bm!30121) (not d!74711) (not d!74741) (not b_lambda!9789) (not b!458387) (not b_lambda!9783) (not bm!30111) (not b!458419) (not b_lambda!9779) (not b!458432) (not bm!30127) (not b!458374) (not d!74719) b_and!19207 tp_is_empty!12327 (not b!458434) (not b!458445) (not b!458373) (not b!458408) (not b!458391) (not bm!30114) (not b!458333) (not b!458437) (not b!458442) (not bm!30118) (not bm!30128) (not b!458455) (not b!458426) (not b!458377) (not b!458412) (not b!458413) (not b_lambda!9791) (not b!458389) (not bm!30119) (not b!458410) (not b!458327) (not b_lambda!9781) (not b!458386) (not d!74733) (not b!458420) (not b!458439) (not b!458422) (not mapNonEmpty!20140) (not b_lambda!9787) (not b!458424) (not b!458438) (not b_lambda!9785) (not b!458326) (not b!458427) (not d!74737) (not b!458458) (not b!458380) (not b!458436) (not b!458433) (not b!458375))
(check-sat b_and!19207 (not b_next!10989))
