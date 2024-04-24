; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39758 () Bool)

(assert start!39758)

(declare-fun b_free!10039 () Bool)

(declare-fun b_next!10039 () Bool)

(assert (=> start!39758 (= b_free!10039 (not b_next!10039))))

(declare-fun tp!35645 () Bool)

(declare-fun b_and!17751 () Bool)

(assert (=> start!39758 (= tp!35645 b_and!17751)))

(declare-fun b!428440 () Bool)

(declare-fun res!251523 () Bool)

(declare-fun e!253897 () Bool)

(assert (=> b!428440 (=> (not res!251523) (not e!253897))))

(declare-datatypes ((array!26226 0))(
  ( (array!26227 (arr!12562 (Array (_ BitVec 32) (_ BitVec 64))) (size!12914 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26226)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26226 (_ BitVec 32)) Bool)

(assert (=> b!428440 (= res!251523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428441 () Bool)

(declare-fun res!251526 () Bool)

(assert (=> b!428441 (=> (not res!251526) (not e!253897))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428441 (= res!251526 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428442 () Bool)

(declare-fun res!251525 () Bool)

(assert (=> b!428442 (=> (not res!251525) (not e!253897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428442 (= res!251525 (validMask!0 mask!1025))))

(declare-fun b!428443 () Bool)

(declare-fun res!251527 () Bool)

(assert (=> b!428443 (=> (not res!251527) (not e!253897))))

(declare-datatypes ((List!7324 0))(
  ( (Nil!7321) (Cons!7320 (h!8176 (_ BitVec 64)) (t!12804 List!7324)) )
))
(declare-fun arrayNoDuplicates!0 (array!26226 (_ BitVec 32) List!7324) Bool)

(assert (=> b!428443 (= res!251527 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7321))))

(declare-fun mapIsEmpty!18408 () Bool)

(declare-fun mapRes!18408 () Bool)

(assert (=> mapIsEmpty!18408 mapRes!18408))

(declare-fun b!428444 () Bool)

(declare-fun e!253896 () Bool)

(declare-fun e!253893 () Bool)

(assert (=> b!428444 (= e!253896 (and e!253893 mapRes!18408))))

(declare-fun condMapEmpty!18408 () Bool)

(declare-datatypes ((V!16027 0))(
  ( (V!16028 (val!5640 Int)) )
))
(declare-datatypes ((ValueCell!5252 0))(
  ( (ValueCellFull!5252 (v!7888 V!16027)) (EmptyCell!5252) )
))
(declare-datatypes ((array!26228 0))(
  ( (array!26229 (arr!12563 (Array (_ BitVec 32) ValueCell!5252)) (size!12915 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26228)

(declare-fun mapDefault!18408 () ValueCell!5252)

(assert (=> b!428444 (= condMapEmpty!18408 (= (arr!12563 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5252)) mapDefault!18408)))))

(declare-fun b!428445 () Bool)

(declare-fun res!251522 () Bool)

(declare-fun e!253892 () Bool)

(assert (=> b!428445 (=> (not res!251522) (not e!253892))))

(declare-fun lt!195804 () array!26226)

(assert (=> b!428445 (= res!251522 (arrayNoDuplicates!0 lt!195804 #b00000000000000000000000000000000 Nil!7321))))

(declare-fun b!428446 () Bool)

(declare-fun res!251535 () Bool)

(assert (=> b!428446 (=> (not res!251535) (not e!253897))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428446 (= res!251535 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12914 _keys!709))))))

(declare-fun b!428447 () Bool)

(declare-datatypes ((Unit!12567 0))(
  ( (Unit!12568) )
))
(declare-fun e!253895 () Unit!12567)

(declare-fun Unit!12569 () Unit!12567)

(assert (=> b!428447 (= e!253895 Unit!12569)))

(declare-fun b!428448 () Bool)

(declare-fun res!251533 () Bool)

(assert (=> b!428448 (=> (not res!251533) (not e!253897))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!428448 (= res!251533 (and (= (size!12915 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12914 _keys!709) (size!12915 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18408 () Bool)

(declare-fun tp!35646 () Bool)

(declare-fun e!253891 () Bool)

(assert (=> mapNonEmpty!18408 (= mapRes!18408 (and tp!35646 e!253891))))

(declare-fun mapRest!18408 () (Array (_ BitVec 32) ValueCell!5252))

(declare-fun mapValue!18408 () ValueCell!5252)

(declare-fun mapKey!18408 () (_ BitVec 32))

(assert (=> mapNonEmpty!18408 (= (arr!12563 _values!549) (store mapRest!18408 mapKey!18408 mapValue!18408))))

(declare-fun b!428449 () Bool)

(declare-fun e!253894 () Bool)

(assert (=> b!428449 (= e!253894 true)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!428449 (not (= (select (arr!12562 _keys!709) from!863) k0!794))))

(declare-fun lt!195798 () Unit!12567)

(assert (=> b!428449 (= lt!195798 e!253895)))

(declare-fun c!55371 () Bool)

(assert (=> b!428449 (= c!55371 (= (select (arr!12562 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7322 0))(
  ( (tuple2!7323 (_1!3672 (_ BitVec 64)) (_2!3672 V!16027)) )
))
(declare-datatypes ((List!7325 0))(
  ( (Nil!7322) (Cons!7321 (h!8177 tuple2!7322) (t!12805 List!7325)) )
))
(declare-datatypes ((ListLongMap!6237 0))(
  ( (ListLongMap!6238 (toList!3134 List!7325)) )
))
(declare-fun lt!195801 () ListLongMap!6237)

(declare-fun lt!195797 () ListLongMap!6237)

(declare-fun +!1346 (ListLongMap!6237 tuple2!7322) ListLongMap!6237)

(declare-fun get!6228 (ValueCell!5252 V!16027) V!16027)

(declare-fun dynLambda!761 (Int (_ BitVec 64)) V!16027)

(assert (=> b!428449 (= lt!195801 (+!1346 lt!195797 (tuple2!7323 (select (arr!12562 _keys!709) from!863) (get!6228 (select (arr!12563 _values!549) from!863) (dynLambda!761 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428450 () Bool)

(declare-fun res!251534 () Bool)

(assert (=> b!428450 (=> (not res!251534) (not e!253897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428450 (= res!251534 (validKeyInArray!0 k0!794))))

(declare-fun b!428451 () Bool)

(assert (=> b!428451 (= e!253897 e!253892)))

(declare-fun res!251531 () Bool)

(assert (=> b!428451 (=> (not res!251531) (not e!253892))))

(assert (=> b!428451 (= res!251531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195804 mask!1025))))

(assert (=> b!428451 (= lt!195804 (array!26227 (store (arr!12562 _keys!709) i!563 k0!794) (size!12914 _keys!709)))))

(declare-fun b!428452 () Bool)

(declare-fun e!253890 () Bool)

(assert (=> b!428452 (= e!253892 e!253890)))

(declare-fun res!251530 () Bool)

(assert (=> b!428452 (=> (not res!251530) (not e!253890))))

(assert (=> b!428452 (= res!251530 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195796 () array!26228)

(declare-fun zeroValue!515 () V!16027)

(declare-fun minValue!515 () V!16027)

(declare-fun getCurrentListMapNoExtraKeys!1379 (array!26226 array!26228 (_ BitVec 32) (_ BitVec 32) V!16027 V!16027 (_ BitVec 32) Int) ListLongMap!6237)

(assert (=> b!428452 (= lt!195801 (getCurrentListMapNoExtraKeys!1379 lt!195804 lt!195796 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16027)

(assert (=> b!428452 (= lt!195796 (array!26229 (store (arr!12563 _values!549) i!563 (ValueCellFull!5252 v!412)) (size!12915 _values!549)))))

(declare-fun lt!195795 () ListLongMap!6237)

(assert (=> b!428452 (= lt!195795 (getCurrentListMapNoExtraKeys!1379 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428453 () Bool)

(declare-fun tp_is_empty!11191 () Bool)

(assert (=> b!428453 (= e!253891 tp_is_empty!11191)))

(declare-fun b!428454 () Bool)

(declare-fun res!251529 () Bool)

(assert (=> b!428454 (=> (not res!251529) (not e!253892))))

(assert (=> b!428454 (= res!251529 (bvsle from!863 i!563))))

(declare-fun b!428455 () Bool)

(assert (=> b!428455 (= e!253893 tp_is_empty!11191)))

(declare-fun b!428456 () Bool)

(declare-fun res!251532 () Bool)

(assert (=> b!428456 (=> (not res!251532) (not e!253897))))

(assert (=> b!428456 (= res!251532 (or (= (select (arr!12562 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12562 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!251528 () Bool)

(assert (=> start!39758 (=> (not res!251528) (not e!253897))))

(assert (=> start!39758 (= res!251528 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12914 _keys!709))))))

(assert (=> start!39758 e!253897))

(assert (=> start!39758 tp_is_empty!11191))

(assert (=> start!39758 tp!35645))

(assert (=> start!39758 true))

(declare-fun array_inv!9218 (array!26228) Bool)

(assert (=> start!39758 (and (array_inv!9218 _values!549) e!253896)))

(declare-fun array_inv!9219 (array!26226) Bool)

(assert (=> start!39758 (array_inv!9219 _keys!709)))

(declare-fun b!428457 () Bool)

(assert (=> b!428457 (= e!253890 (not e!253894))))

(declare-fun res!251524 () Bool)

(assert (=> b!428457 (=> res!251524 e!253894)))

(assert (=> b!428457 (= res!251524 (not (validKeyInArray!0 (select (arr!12562 _keys!709) from!863))))))

(declare-fun lt!195800 () ListLongMap!6237)

(assert (=> b!428457 (= lt!195800 lt!195797)))

(declare-fun lt!195803 () ListLongMap!6237)

(assert (=> b!428457 (= lt!195797 (+!1346 lt!195803 (tuple2!7323 k0!794 v!412)))))

(assert (=> b!428457 (= lt!195800 (getCurrentListMapNoExtraKeys!1379 lt!195804 lt!195796 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428457 (= lt!195803 (getCurrentListMapNoExtraKeys!1379 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195799 () Unit!12567)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!528 (array!26226 array!26228 (_ BitVec 32) (_ BitVec 32) V!16027 V!16027 (_ BitVec 32) (_ BitVec 64) V!16027 (_ BitVec 32) Int) Unit!12567)

(assert (=> b!428457 (= lt!195799 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!528 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428458 () Bool)

(declare-fun Unit!12570 () Unit!12567)

(assert (=> b!428458 (= e!253895 Unit!12570)))

(declare-fun lt!195802 () Unit!12567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26226 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12567)

(assert (=> b!428458 (= lt!195802 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428458 false))

(assert (= (and start!39758 res!251528) b!428442))

(assert (= (and b!428442 res!251525) b!428448))

(assert (= (and b!428448 res!251533) b!428440))

(assert (= (and b!428440 res!251523) b!428443))

(assert (= (and b!428443 res!251527) b!428446))

(assert (= (and b!428446 res!251535) b!428450))

(assert (= (and b!428450 res!251534) b!428456))

(assert (= (and b!428456 res!251532) b!428441))

(assert (= (and b!428441 res!251526) b!428451))

(assert (= (and b!428451 res!251531) b!428445))

(assert (= (and b!428445 res!251522) b!428454))

(assert (= (and b!428454 res!251529) b!428452))

(assert (= (and b!428452 res!251530) b!428457))

(assert (= (and b!428457 (not res!251524)) b!428449))

(assert (= (and b!428449 c!55371) b!428458))

(assert (= (and b!428449 (not c!55371)) b!428447))

(assert (= (and b!428444 condMapEmpty!18408) mapIsEmpty!18408))

(assert (= (and b!428444 (not condMapEmpty!18408)) mapNonEmpty!18408))

(get-info :version)

(assert (= (and mapNonEmpty!18408 ((_ is ValueCellFull!5252) mapValue!18408)) b!428453))

(assert (= (and b!428444 ((_ is ValueCellFull!5252) mapDefault!18408)) b!428455))

(assert (= start!39758 b!428444))

(declare-fun b_lambda!9149 () Bool)

(assert (=> (not b_lambda!9149) (not b!428449)))

(declare-fun t!12803 () Bool)

(declare-fun tb!3437 () Bool)

(assert (=> (and start!39758 (= defaultEntry!557 defaultEntry!557) t!12803) tb!3437))

(declare-fun result!6409 () Bool)

(assert (=> tb!3437 (= result!6409 tp_is_empty!11191)))

(assert (=> b!428449 t!12803))

(declare-fun b_and!17753 () Bool)

(assert (= b_and!17751 (and (=> t!12803 result!6409) b_and!17753)))

(declare-fun m!417131 () Bool)

(assert (=> b!428458 m!417131))

(declare-fun m!417133 () Bool)

(assert (=> b!428452 m!417133))

(declare-fun m!417135 () Bool)

(assert (=> b!428452 m!417135))

(declare-fun m!417137 () Bool)

(assert (=> b!428452 m!417137))

(declare-fun m!417139 () Bool)

(assert (=> b!428451 m!417139))

(declare-fun m!417141 () Bool)

(assert (=> b!428451 m!417141))

(declare-fun m!417143 () Bool)

(assert (=> b!428442 m!417143))

(declare-fun m!417145 () Bool)

(assert (=> b!428456 m!417145))

(declare-fun m!417147 () Bool)

(assert (=> b!428449 m!417147))

(declare-fun m!417149 () Bool)

(assert (=> b!428449 m!417149))

(declare-fun m!417151 () Bool)

(assert (=> b!428449 m!417151))

(declare-fun m!417153 () Bool)

(assert (=> b!428449 m!417153))

(assert (=> b!428449 m!417151))

(assert (=> b!428449 m!417149))

(declare-fun m!417155 () Bool)

(assert (=> b!428449 m!417155))

(assert (=> b!428457 m!417147))

(declare-fun m!417157 () Bool)

(assert (=> b!428457 m!417157))

(declare-fun m!417159 () Bool)

(assert (=> b!428457 m!417159))

(assert (=> b!428457 m!417147))

(declare-fun m!417161 () Bool)

(assert (=> b!428457 m!417161))

(declare-fun m!417163 () Bool)

(assert (=> b!428457 m!417163))

(declare-fun m!417165 () Bool)

(assert (=> b!428457 m!417165))

(declare-fun m!417167 () Bool)

(assert (=> b!428441 m!417167))

(declare-fun m!417169 () Bool)

(assert (=> b!428445 m!417169))

(declare-fun m!417171 () Bool)

(assert (=> b!428443 m!417171))

(declare-fun m!417173 () Bool)

(assert (=> mapNonEmpty!18408 m!417173))

(declare-fun m!417175 () Bool)

(assert (=> b!428450 m!417175))

(declare-fun m!417177 () Bool)

(assert (=> b!428440 m!417177))

(declare-fun m!417179 () Bool)

(assert (=> start!39758 m!417179))

(declare-fun m!417181 () Bool)

(assert (=> start!39758 m!417181))

(check-sat (not b!428458) (not b!428457) (not b!428445) (not b!428442) (not start!39758) (not b!428452) (not b!428451) (not b!428443) (not b_next!10039) (not b!428450) (not b!428441) (not b!428449) (not b_lambda!9149) (not mapNonEmpty!18408) (not b!428440) tp_is_empty!11191 b_and!17753)
(check-sat b_and!17753 (not b_next!10039))
