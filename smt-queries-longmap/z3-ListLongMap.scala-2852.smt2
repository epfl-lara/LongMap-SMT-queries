; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41144 () Bool)

(assert start!41144)

(declare-fun b_free!11013 () Bool)

(declare-fun b_next!11013 () Bool)

(assert (=> start!41144 (= b_free!11013 (not b_next!11013))))

(declare-fun tp!38874 () Bool)

(declare-fun b_and!19265 () Bool)

(assert (=> start!41144 (= tp!38874 b_and!19265)))

(declare-fun mapNonEmpty!20176 () Bool)

(declare-fun mapRes!20176 () Bool)

(declare-fun tp!38875 () Bool)

(declare-fun e!268058 () Bool)

(assert (=> mapNonEmpty!20176 (= mapRes!20176 (and tp!38875 e!268058))))

(declare-datatypes ((V!17573 0))(
  ( (V!17574 (val!6220 Int)) )
))
(declare-datatypes ((ValueCell!5832 0))(
  ( (ValueCellFull!5832 (v!8498 V!17573)) (EmptyCell!5832) )
))
(declare-datatypes ((array!28503 0))(
  ( (array!28504 (arr!13692 (Array (_ BitVec 32) ValueCell!5832)) (size!14044 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28503)

(declare-fun mapKey!20176 () (_ BitVec 32))

(declare-fun mapRest!20176 () (Array (_ BitVec 32) ValueCell!5832))

(declare-fun mapValue!20176 () ValueCell!5832)

(assert (=> mapNonEmpty!20176 (= (arr!13692 _values!549) (store mapRest!20176 mapKey!20176 mapValue!20176))))

(declare-fun b!459224 () Bool)

(declare-fun e!268052 () Bool)

(declare-fun e!268059 () Bool)

(assert (=> b!459224 (= e!268052 e!268059)))

(declare-fun res!274422 () Bool)

(assert (=> b!459224 (=> (not res!274422) (not e!268059))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459224 (= res!274422 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17573)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17573)

(declare-datatypes ((array!28505 0))(
  ( (array!28506 (arr!13693 (Array (_ BitVec 32) (_ BitVec 64))) (size!14045 (_ BitVec 32))) )
))
(declare-fun lt!207752 () array!28505)

(declare-fun lt!207758 () array!28503)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8202 0))(
  ( (tuple2!8203 (_1!4112 (_ BitVec 64)) (_2!4112 V!17573)) )
))
(declare-datatypes ((List!8272 0))(
  ( (Nil!8269) (Cons!8268 (h!9124 tuple2!8202) (t!14164 List!8272)) )
))
(declare-datatypes ((ListLongMap!7115 0))(
  ( (ListLongMap!7116 (toList!3573 List!8272)) )
))
(declare-fun lt!207757 () ListLongMap!7115)

(declare-fun getCurrentListMapNoExtraKeys!1754 (array!28505 array!28503 (_ BitVec 32) (_ BitVec 32) V!17573 V!17573 (_ BitVec 32) Int) ListLongMap!7115)

(assert (=> b!459224 (= lt!207757 (getCurrentListMapNoExtraKeys!1754 lt!207752 lt!207758 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17573)

(assert (=> b!459224 (= lt!207758 (array!28504 (store (arr!13692 _values!549) i!563 (ValueCellFull!5832 v!412)) (size!14044 _values!549)))))

(declare-fun lt!207754 () ListLongMap!7115)

(declare-fun _keys!709 () array!28505)

(assert (=> b!459224 (= lt!207754 (getCurrentListMapNoExtraKeys!1754 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459225 () Bool)

(declare-fun res!274423 () Bool)

(declare-fun e!268056 () Bool)

(assert (=> b!459225 (=> (not res!274423) (not e!268056))))

(assert (=> b!459225 (= res!274423 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14045 _keys!709))))))

(declare-fun res!274417 () Bool)

(assert (=> start!41144 (=> (not res!274417) (not e!268056))))

(assert (=> start!41144 (= res!274417 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14045 _keys!709))))))

(assert (=> start!41144 e!268056))

(declare-fun tp_is_empty!12351 () Bool)

(assert (=> start!41144 tp_is_empty!12351))

(assert (=> start!41144 tp!38874))

(assert (=> start!41144 true))

(declare-fun e!268051 () Bool)

(declare-fun array_inv!9906 (array!28503) Bool)

(assert (=> start!41144 (and (array_inv!9906 _values!549) e!268051)))

(declare-fun array_inv!9907 (array!28505) Bool)

(assert (=> start!41144 (array_inv!9907 _keys!709)))

(declare-fun b!459226 () Bool)

(declare-fun res!274414 () Bool)

(assert (=> b!459226 (=> (not res!274414) (not e!268056))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459226 (= res!274414 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459227 () Bool)

(declare-fun e!268057 () Bool)

(assert (=> b!459227 (= e!268057 tp_is_empty!12351)))

(declare-fun b!459228 () Bool)

(declare-datatypes ((Unit!13341 0))(
  ( (Unit!13342) )
))
(declare-fun e!268054 () Unit!13341)

(declare-fun Unit!13343 () Unit!13341)

(assert (=> b!459228 (= e!268054 Unit!13343)))

(declare-fun lt!207753 () Unit!13341)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28505 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13341)

(assert (=> b!459228 (= lt!207753 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459228 false))

(declare-fun b!459229 () Bool)

(declare-fun res!274416 () Bool)

(assert (=> b!459229 (=> (not res!274416) (not e!268056))))

(assert (=> b!459229 (= res!274416 (and (= (size!14044 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14045 _keys!709) (size!14044 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459230 () Bool)

(declare-fun res!274421 () Bool)

(assert (=> b!459230 (=> (not res!274421) (not e!268056))))

(declare-datatypes ((List!8273 0))(
  ( (Nil!8270) (Cons!8269 (h!9125 (_ BitVec 64)) (t!14165 List!8273)) )
))
(declare-fun arrayNoDuplicates!0 (array!28505 (_ BitVec 32) List!8273) Bool)

(assert (=> b!459230 (= res!274421 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8270))))

(declare-fun b!459231 () Bool)

(declare-fun res!274413 () Bool)

(assert (=> b!459231 (=> (not res!274413) (not e!268052))))

(assert (=> b!459231 (= res!274413 (bvsle from!863 i!563))))

(declare-fun b!459232 () Bool)

(declare-fun e!268053 () Bool)

(assert (=> b!459232 (= e!268059 (not e!268053))))

(declare-fun res!274424 () Bool)

(assert (=> b!459232 (=> res!274424 e!268053)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459232 (= res!274424 (not (validKeyInArray!0 (select (arr!13693 _keys!709) from!863))))))

(declare-fun lt!207756 () ListLongMap!7115)

(declare-fun lt!207761 () ListLongMap!7115)

(assert (=> b!459232 (= lt!207756 lt!207761)))

(declare-fun lt!207759 () ListLongMap!7115)

(declare-fun +!1609 (ListLongMap!7115 tuple2!8202) ListLongMap!7115)

(assert (=> b!459232 (= lt!207761 (+!1609 lt!207759 (tuple2!8203 k0!794 v!412)))))

(assert (=> b!459232 (= lt!207756 (getCurrentListMapNoExtraKeys!1754 lt!207752 lt!207758 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459232 (= lt!207759 (getCurrentListMapNoExtraKeys!1754 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207760 () Unit!13341)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!766 (array!28505 array!28503 (_ BitVec 32) (_ BitVec 32) V!17573 V!17573 (_ BitVec 32) (_ BitVec 64) V!17573 (_ BitVec 32) Int) Unit!13341)

(assert (=> b!459232 (= lt!207760 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!766 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459233 () Bool)

(assert (=> b!459233 (= e!268051 (and e!268057 mapRes!20176))))

(declare-fun condMapEmpty!20176 () Bool)

(declare-fun mapDefault!20176 () ValueCell!5832)

(assert (=> b!459233 (= condMapEmpty!20176 (= (arr!13692 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5832)) mapDefault!20176)))))

(declare-fun b!459234 () Bool)

(declare-fun res!274425 () Bool)

(assert (=> b!459234 (=> (not res!274425) (not e!268056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28505 (_ BitVec 32)) Bool)

(assert (=> b!459234 (= res!274425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459235 () Bool)

(declare-fun res!274420 () Bool)

(assert (=> b!459235 (=> (not res!274420) (not e!268056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459235 (= res!274420 (validMask!0 mask!1025))))

(declare-fun b!459236 () Bool)

(declare-fun Unit!13344 () Unit!13341)

(assert (=> b!459236 (= e!268054 Unit!13344)))

(declare-fun b!459237 () Bool)

(assert (=> b!459237 (= e!268053 (not (= (select (arr!13693 _keys!709) from!863) k0!794)))))

(declare-fun lt!207755 () Unit!13341)

(assert (=> b!459237 (= lt!207755 e!268054)))

(declare-fun c!56468 () Bool)

(assert (=> b!459237 (= c!56468 (= (select (arr!13693 _keys!709) from!863) k0!794))))

(declare-fun get!6754 (ValueCell!5832 V!17573) V!17573)

(declare-fun dynLambda!896 (Int (_ BitVec 64)) V!17573)

(assert (=> b!459237 (= lt!207757 (+!1609 lt!207761 (tuple2!8203 (select (arr!13693 _keys!709) from!863) (get!6754 (select (arr!13692 _values!549) from!863) (dynLambda!896 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!20176 () Bool)

(assert (=> mapIsEmpty!20176 mapRes!20176))

(declare-fun b!459238 () Bool)

(assert (=> b!459238 (= e!268058 tp_is_empty!12351)))

(declare-fun b!459239 () Bool)

(declare-fun res!274426 () Bool)

(assert (=> b!459239 (=> (not res!274426) (not e!268056))))

(assert (=> b!459239 (= res!274426 (validKeyInArray!0 k0!794))))

(declare-fun b!459240 () Bool)

(declare-fun res!274419 () Bool)

(assert (=> b!459240 (=> (not res!274419) (not e!268052))))

(assert (=> b!459240 (= res!274419 (arrayNoDuplicates!0 lt!207752 #b00000000000000000000000000000000 Nil!8270))))

(declare-fun b!459241 () Bool)

(assert (=> b!459241 (= e!268056 e!268052)))

(declare-fun res!274415 () Bool)

(assert (=> b!459241 (=> (not res!274415) (not e!268052))))

(assert (=> b!459241 (= res!274415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207752 mask!1025))))

(assert (=> b!459241 (= lt!207752 (array!28506 (store (arr!13693 _keys!709) i!563 k0!794) (size!14045 _keys!709)))))

(declare-fun b!459242 () Bool)

(declare-fun res!274418 () Bool)

(assert (=> b!459242 (=> (not res!274418) (not e!268056))))

(assert (=> b!459242 (= res!274418 (or (= (select (arr!13693 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13693 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!41144 res!274417) b!459235))

(assert (= (and b!459235 res!274420) b!459229))

(assert (= (and b!459229 res!274416) b!459234))

(assert (= (and b!459234 res!274425) b!459230))

(assert (= (and b!459230 res!274421) b!459225))

(assert (= (and b!459225 res!274423) b!459239))

(assert (= (and b!459239 res!274426) b!459242))

(assert (= (and b!459242 res!274418) b!459226))

(assert (= (and b!459226 res!274414) b!459241))

(assert (= (and b!459241 res!274415) b!459240))

(assert (= (and b!459240 res!274419) b!459231))

(assert (= (and b!459231 res!274413) b!459224))

(assert (= (and b!459224 res!274422) b!459232))

(assert (= (and b!459232 (not res!274424)) b!459237))

(assert (= (and b!459237 c!56468) b!459228))

(assert (= (and b!459237 (not c!56468)) b!459236))

(assert (= (and b!459233 condMapEmpty!20176) mapIsEmpty!20176))

(assert (= (and b!459233 (not condMapEmpty!20176)) mapNonEmpty!20176))

(get-info :version)

(assert (= (and mapNonEmpty!20176 ((_ is ValueCellFull!5832) mapValue!20176)) b!459238))

(assert (= (and b!459233 ((_ is ValueCellFull!5832) mapDefault!20176)) b!459227))

(assert (= start!41144 b!459233))

(declare-fun b_lambda!9847 () Bool)

(assert (=> (not b_lambda!9847) (not b!459237)))

(declare-fun t!14163 () Bool)

(declare-fun tb!3849 () Bool)

(assert (=> (and start!41144 (= defaultEntry!557 defaultEntry!557) t!14163) tb!3849))

(declare-fun result!7243 () Bool)

(assert (=> tb!3849 (= result!7243 tp_is_empty!12351)))

(assert (=> b!459237 t!14163))

(declare-fun b_and!19267 () Bool)

(assert (= b_and!19265 (and (=> t!14163 result!7243) b_and!19267)))

(declare-fun m!442531 () Bool)

(assert (=> start!41144 m!442531))

(declare-fun m!442533 () Bool)

(assert (=> start!41144 m!442533))

(declare-fun m!442535 () Bool)

(assert (=> b!459242 m!442535))

(declare-fun m!442537 () Bool)

(assert (=> b!459226 m!442537))

(declare-fun m!442539 () Bool)

(assert (=> b!459232 m!442539))

(declare-fun m!442541 () Bool)

(assert (=> b!459232 m!442541))

(declare-fun m!442543 () Bool)

(assert (=> b!459232 m!442543))

(declare-fun m!442545 () Bool)

(assert (=> b!459232 m!442545))

(declare-fun m!442547 () Bool)

(assert (=> b!459232 m!442547))

(assert (=> b!459232 m!442543))

(declare-fun m!442549 () Bool)

(assert (=> b!459232 m!442549))

(declare-fun m!442551 () Bool)

(assert (=> b!459239 m!442551))

(declare-fun m!442553 () Bool)

(assert (=> b!459228 m!442553))

(declare-fun m!442555 () Bool)

(assert (=> b!459241 m!442555))

(declare-fun m!442557 () Bool)

(assert (=> b!459241 m!442557))

(declare-fun m!442559 () Bool)

(assert (=> b!459224 m!442559))

(declare-fun m!442561 () Bool)

(assert (=> b!459224 m!442561))

(declare-fun m!442563 () Bool)

(assert (=> b!459224 m!442563))

(declare-fun m!442565 () Bool)

(assert (=> b!459230 m!442565))

(assert (=> b!459237 m!442543))

(declare-fun m!442567 () Bool)

(assert (=> b!459237 m!442567))

(declare-fun m!442569 () Bool)

(assert (=> b!459237 m!442569))

(declare-fun m!442571 () Bool)

(assert (=> b!459237 m!442571))

(assert (=> b!459237 m!442571))

(assert (=> b!459237 m!442567))

(declare-fun m!442573 () Bool)

(assert (=> b!459237 m!442573))

(declare-fun m!442575 () Bool)

(assert (=> b!459235 m!442575))

(declare-fun m!442577 () Bool)

(assert (=> b!459240 m!442577))

(declare-fun m!442579 () Bool)

(assert (=> mapNonEmpty!20176 m!442579))

(declare-fun m!442581 () Bool)

(assert (=> b!459234 m!442581))

(check-sat (not b!459235) (not mapNonEmpty!20176) (not b!459232) (not start!41144) (not b_next!11013) (not b!459239) (not b!459230) (not b!459226) (not b!459224) (not b!459237) tp_is_empty!12351 (not b!459228) b_and!19267 (not b!459234) (not b_lambda!9847) (not b!459241) (not b!459240))
(check-sat b_and!19267 (not b_next!11013))
