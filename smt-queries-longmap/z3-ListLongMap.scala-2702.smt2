; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40016 () Bool)

(assert start!40016)

(declare-fun b_free!10297 () Bool)

(declare-fun b_next!10297 () Bool)

(assert (=> start!40016 (= b_free!10297 (not b_next!10297))))

(declare-fun tp!36420 () Bool)

(declare-fun b_and!18227 () Bool)

(assert (=> start!40016 (= tp!36420 b_and!18227)))

(declare-fun b!436137 () Bool)

(declare-fun res!257135 () Bool)

(declare-fun e!257538 () Bool)

(assert (=> b!436137 (=> (not res!257135) (not e!257538))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436137 (= res!257135 (validMask!0 mask!1025))))

(declare-fun b!436138 () Bool)

(declare-fun res!257128 () Bool)

(assert (=> b!436138 (=> (not res!257128) (not e!257538))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436138 (= res!257128 (validKeyInArray!0 k0!794))))

(declare-fun b!436139 () Bool)

(declare-fun e!257547 () Bool)

(assert (=> b!436139 (= e!257538 e!257547)))

(declare-fun res!257126 () Bool)

(assert (=> b!436139 (=> (not res!257126) (not e!257547))))

(declare-datatypes ((array!26721 0))(
  ( (array!26722 (arr!12810 (Array (_ BitVec 32) (_ BitVec 64))) (size!13163 (_ BitVec 32))) )
))
(declare-fun lt!200955 () array!26721)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26721 (_ BitVec 32)) Bool)

(assert (=> b!436139 (= res!257126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200955 mask!1025))))

(declare-fun _keys!709 () array!26721)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436139 (= lt!200955 (array!26722 (store (arr!12810 _keys!709) i!563 k0!794) (size!13163 _keys!709)))))

(declare-fun b!436140 () Bool)

(declare-fun e!257542 () Bool)

(declare-fun e!257543 () Bool)

(declare-fun mapRes!18795 () Bool)

(assert (=> b!436140 (= e!257542 (and e!257543 mapRes!18795))))

(declare-fun condMapEmpty!18795 () Bool)

(declare-datatypes ((V!16371 0))(
  ( (V!16372 (val!5769 Int)) )
))
(declare-datatypes ((ValueCell!5381 0))(
  ( (ValueCellFull!5381 (v!8010 V!16371)) (EmptyCell!5381) )
))
(declare-datatypes ((array!26723 0))(
  ( (array!26724 (arr!12811 (Array (_ BitVec 32) ValueCell!5381)) (size!13164 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26723)

(declare-fun mapDefault!18795 () ValueCell!5381)

(assert (=> b!436140 (= condMapEmpty!18795 (= (arr!12811 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5381)) mapDefault!18795)))))

(declare-fun b!436141 () Bool)

(declare-fun res!257124 () Bool)

(assert (=> b!436141 (=> (not res!257124) (not e!257538))))

(declare-fun arrayContainsKey!0 (array!26721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436141 (= res!257124 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436142 () Bool)

(declare-fun e!257546 () Bool)

(assert (=> b!436142 (= e!257547 e!257546)))

(declare-fun res!257129 () Bool)

(assert (=> b!436142 (=> (not res!257129) (not e!257546))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!436142 (= res!257129 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16371)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7656 0))(
  ( (tuple2!7657 (_1!3839 (_ BitVec 64)) (_2!3839 V!16371)) )
))
(declare-datatypes ((List!7643 0))(
  ( (Nil!7640) (Cons!7639 (h!8495 tuple2!7656) (t!13380 List!7643)) )
))
(declare-datatypes ((ListLongMap!6559 0))(
  ( (ListLongMap!6560 (toList!3295 List!7643)) )
))
(declare-fun lt!200954 () ListLongMap!6559)

(declare-fun zeroValue!515 () V!16371)

(declare-fun lt!200956 () array!26723)

(declare-fun getCurrentListMapNoExtraKeys!1494 (array!26721 array!26723 (_ BitVec 32) (_ BitVec 32) V!16371 V!16371 (_ BitVec 32) Int) ListLongMap!6559)

(assert (=> b!436142 (= lt!200954 (getCurrentListMapNoExtraKeys!1494 lt!200955 lt!200956 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16371)

(assert (=> b!436142 (= lt!200956 (array!26724 (store (arr!12811 _values!549) i!563 (ValueCellFull!5381 v!412)) (size!13164 _values!549)))))

(declare-fun lt!200953 () ListLongMap!6559)

(assert (=> b!436142 (= lt!200953 (getCurrentListMapNoExtraKeys!1494 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436143 () Bool)

(declare-fun e!257541 () Bool)

(assert (=> b!436143 (= e!257541 true)))

(declare-fun lt!200952 () ListLongMap!6559)

(declare-fun lt!200962 () tuple2!7656)

(declare-fun lt!200960 () tuple2!7656)

(declare-fun lt!200957 () ListLongMap!6559)

(declare-fun +!1469 (ListLongMap!6559 tuple2!7656) ListLongMap!6559)

(assert (=> b!436143 (= lt!200952 (+!1469 (+!1469 lt!200957 lt!200960) lt!200962))))

(declare-fun lt!200963 () V!16371)

(declare-datatypes ((Unit!12948 0))(
  ( (Unit!12949) )
))
(declare-fun lt!200964 () Unit!12948)

(declare-fun addCommutativeForDiffKeys!419 (ListLongMap!6559 (_ BitVec 64) V!16371 (_ BitVec 64) V!16371) Unit!12948)

(assert (=> b!436143 (= lt!200964 (addCommutativeForDiffKeys!419 lt!200957 k0!794 v!412 (select (arr!12810 _keys!709) from!863) lt!200963))))

(declare-fun b!436144 () Bool)

(declare-fun res!257123 () Bool)

(assert (=> b!436144 (=> (not res!257123) (not e!257538))))

(assert (=> b!436144 (= res!257123 (or (= (select (arr!12810 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12810 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436146 () Bool)

(declare-fun tp_is_empty!11449 () Bool)

(assert (=> b!436146 (= e!257543 tp_is_empty!11449)))

(declare-fun b!436147 () Bool)

(declare-fun e!257545 () Bool)

(assert (=> b!436147 (= e!257546 (not e!257545))))

(declare-fun res!257133 () Bool)

(assert (=> b!436147 (=> res!257133 e!257545)))

(assert (=> b!436147 (= res!257133 (not (validKeyInArray!0 (select (arr!12810 _keys!709) from!863))))))

(declare-fun lt!200958 () ListLongMap!6559)

(declare-fun lt!200961 () ListLongMap!6559)

(assert (=> b!436147 (= lt!200958 lt!200961)))

(assert (=> b!436147 (= lt!200961 (+!1469 lt!200957 lt!200962))))

(assert (=> b!436147 (= lt!200958 (getCurrentListMapNoExtraKeys!1494 lt!200955 lt!200956 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436147 (= lt!200962 (tuple2!7657 k0!794 v!412))))

(assert (=> b!436147 (= lt!200957 (getCurrentListMapNoExtraKeys!1494 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200965 () Unit!12948)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!609 (array!26721 array!26723 (_ BitVec 32) (_ BitVec 32) V!16371 V!16371 (_ BitVec 32) (_ BitVec 64) V!16371 (_ BitVec 32) Int) Unit!12948)

(assert (=> b!436147 (= lt!200965 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!609 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436148 () Bool)

(declare-fun res!257122 () Bool)

(assert (=> b!436148 (=> (not res!257122) (not e!257538))))

(assert (=> b!436148 (= res!257122 (and (= (size!13164 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13163 _keys!709) (size!13164 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436149 () Bool)

(declare-fun res!257125 () Bool)

(assert (=> b!436149 (=> (not res!257125) (not e!257538))))

(assert (=> b!436149 (= res!257125 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13163 _keys!709))))))

(declare-fun b!436150 () Bool)

(declare-fun res!257131 () Bool)

(assert (=> b!436150 (=> (not res!257131) (not e!257538))))

(declare-datatypes ((List!7644 0))(
  ( (Nil!7641) (Cons!7640 (h!8496 (_ BitVec 64)) (t!13381 List!7644)) )
))
(declare-fun arrayNoDuplicates!0 (array!26721 (_ BitVec 32) List!7644) Bool)

(assert (=> b!436150 (= res!257131 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7641))))

(declare-fun b!436151 () Bool)

(declare-fun res!257130 () Bool)

(assert (=> b!436151 (=> (not res!257130) (not e!257538))))

(assert (=> b!436151 (= res!257130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436152 () Bool)

(declare-fun res!257134 () Bool)

(assert (=> b!436152 (=> (not res!257134) (not e!257547))))

(assert (=> b!436152 (= res!257134 (arrayNoDuplicates!0 lt!200955 #b00000000000000000000000000000000 Nil!7641))))

(declare-fun mapIsEmpty!18795 () Bool)

(assert (=> mapIsEmpty!18795 mapRes!18795))

(declare-fun b!436153 () Bool)

(declare-fun e!257544 () Unit!12948)

(declare-fun Unit!12950 () Unit!12948)

(assert (=> b!436153 (= e!257544 Unit!12950)))

(declare-fun lt!200966 () Unit!12948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26721 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12948)

(assert (=> b!436153 (= lt!200966 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436153 false))

(declare-fun res!257136 () Bool)

(assert (=> start!40016 (=> (not res!257136) (not e!257538))))

(assert (=> start!40016 (= res!257136 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13163 _keys!709))))))

(assert (=> start!40016 e!257538))

(assert (=> start!40016 tp_is_empty!11449))

(assert (=> start!40016 tp!36420))

(assert (=> start!40016 true))

(declare-fun array_inv!9358 (array!26723) Bool)

(assert (=> start!40016 (and (array_inv!9358 _values!549) e!257542)))

(declare-fun array_inv!9359 (array!26721) Bool)

(assert (=> start!40016 (array_inv!9359 _keys!709)))

(declare-fun b!436145 () Bool)

(declare-fun Unit!12951 () Unit!12948)

(assert (=> b!436145 (= e!257544 Unit!12951)))

(declare-fun mapNonEmpty!18795 () Bool)

(declare-fun tp!36419 () Bool)

(declare-fun e!257540 () Bool)

(assert (=> mapNonEmpty!18795 (= mapRes!18795 (and tp!36419 e!257540))))

(declare-fun mapValue!18795 () ValueCell!5381)

(declare-fun mapKey!18795 () (_ BitVec 32))

(declare-fun mapRest!18795 () (Array (_ BitVec 32) ValueCell!5381))

(assert (=> mapNonEmpty!18795 (= (arr!12811 _values!549) (store mapRest!18795 mapKey!18795 mapValue!18795))))

(declare-fun b!436154 () Bool)

(declare-fun res!257132 () Bool)

(assert (=> b!436154 (=> (not res!257132) (not e!257547))))

(assert (=> b!436154 (= res!257132 (bvsle from!863 i!563))))

(declare-fun b!436155 () Bool)

(assert (=> b!436155 (= e!257545 e!257541)))

(declare-fun res!257127 () Bool)

(assert (=> b!436155 (=> res!257127 e!257541)))

(assert (=> b!436155 (= res!257127 (= k0!794 (select (arr!12810 _keys!709) from!863)))))

(assert (=> b!436155 (not (= (select (arr!12810 _keys!709) from!863) k0!794))))

(declare-fun lt!200959 () Unit!12948)

(assert (=> b!436155 (= lt!200959 e!257544)))

(declare-fun c!55710 () Bool)

(assert (=> b!436155 (= c!55710 (= (select (arr!12810 _keys!709) from!863) k0!794))))

(assert (=> b!436155 (= lt!200954 lt!200952)))

(assert (=> b!436155 (= lt!200952 (+!1469 lt!200961 lt!200960))))

(assert (=> b!436155 (= lt!200960 (tuple2!7657 (select (arr!12810 _keys!709) from!863) lt!200963))))

(declare-fun get!6393 (ValueCell!5381 V!16371) V!16371)

(declare-fun dynLambda!843 (Int (_ BitVec 64)) V!16371)

(assert (=> b!436155 (= lt!200963 (get!6393 (select (arr!12811 _values!549) from!863) (dynLambda!843 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436156 () Bool)

(assert (=> b!436156 (= e!257540 tp_is_empty!11449)))

(assert (= (and start!40016 res!257136) b!436137))

(assert (= (and b!436137 res!257135) b!436148))

(assert (= (and b!436148 res!257122) b!436151))

(assert (= (and b!436151 res!257130) b!436150))

(assert (= (and b!436150 res!257131) b!436149))

(assert (= (and b!436149 res!257125) b!436138))

(assert (= (and b!436138 res!257128) b!436144))

(assert (= (and b!436144 res!257123) b!436141))

(assert (= (and b!436141 res!257124) b!436139))

(assert (= (and b!436139 res!257126) b!436152))

(assert (= (and b!436152 res!257134) b!436154))

(assert (= (and b!436154 res!257132) b!436142))

(assert (= (and b!436142 res!257129) b!436147))

(assert (= (and b!436147 (not res!257133)) b!436155))

(assert (= (and b!436155 c!55710) b!436153))

(assert (= (and b!436155 (not c!55710)) b!436145))

(assert (= (and b!436155 (not res!257127)) b!436143))

(assert (= (and b!436140 condMapEmpty!18795) mapIsEmpty!18795))

(assert (= (and b!436140 (not condMapEmpty!18795)) mapNonEmpty!18795))

(get-info :version)

(assert (= (and mapNonEmpty!18795 ((_ is ValueCellFull!5381) mapValue!18795)) b!436156))

(assert (= (and b!436140 ((_ is ValueCellFull!5381) mapDefault!18795)) b!436146))

(assert (= start!40016 b!436140))

(declare-fun b_lambda!9367 () Bool)

(assert (=> (not b_lambda!9367) (not b!436155)))

(declare-fun t!13379 () Bool)

(declare-fun tb!3695 () Bool)

(assert (=> (and start!40016 (= defaultEntry!557 defaultEntry!557) t!13379) tb!3695))

(declare-fun result!6925 () Bool)

(assert (=> tb!3695 (= result!6925 tp_is_empty!11449)))

(assert (=> b!436155 t!13379))

(declare-fun b_and!18229 () Bool)

(assert (= b_and!18227 (and (=> t!13379 result!6925) b_and!18229)))

(declare-fun m!423501 () Bool)

(assert (=> b!436153 m!423501))

(declare-fun m!423503 () Bool)

(assert (=> start!40016 m!423503))

(declare-fun m!423505 () Bool)

(assert (=> start!40016 m!423505))

(declare-fun m!423507 () Bool)

(assert (=> b!436150 m!423507))

(declare-fun m!423509 () Bool)

(assert (=> b!436144 m!423509))

(declare-fun m!423511 () Bool)

(assert (=> b!436137 m!423511))

(declare-fun m!423513 () Bool)

(assert (=> b!436138 m!423513))

(declare-fun m!423515 () Bool)

(assert (=> b!436143 m!423515))

(assert (=> b!436143 m!423515))

(declare-fun m!423517 () Bool)

(assert (=> b!436143 m!423517))

(declare-fun m!423519 () Bool)

(assert (=> b!436143 m!423519))

(assert (=> b!436143 m!423519))

(declare-fun m!423521 () Bool)

(assert (=> b!436143 m!423521))

(declare-fun m!423523 () Bool)

(assert (=> b!436152 m!423523))

(declare-fun m!423525 () Bool)

(assert (=> mapNonEmpty!18795 m!423525))

(declare-fun m!423527 () Bool)

(assert (=> b!436139 m!423527))

(declare-fun m!423529 () Bool)

(assert (=> b!436139 m!423529))

(declare-fun m!423531 () Bool)

(assert (=> b!436142 m!423531))

(declare-fun m!423533 () Bool)

(assert (=> b!436142 m!423533))

(declare-fun m!423535 () Bool)

(assert (=> b!436142 m!423535))

(declare-fun m!423537 () Bool)

(assert (=> b!436141 m!423537))

(assert (=> b!436155 m!423519))

(declare-fun m!423539 () Bool)

(assert (=> b!436155 m!423539))

(declare-fun m!423541 () Bool)

(assert (=> b!436155 m!423541))

(declare-fun m!423543 () Bool)

(assert (=> b!436155 m!423543))

(assert (=> b!436155 m!423543))

(assert (=> b!436155 m!423539))

(declare-fun m!423545 () Bool)

(assert (=> b!436155 m!423545))

(assert (=> b!436147 m!423519))

(declare-fun m!423547 () Bool)

(assert (=> b!436147 m!423547))

(declare-fun m!423549 () Bool)

(assert (=> b!436147 m!423549))

(declare-fun m!423551 () Bool)

(assert (=> b!436147 m!423551))

(assert (=> b!436147 m!423519))

(declare-fun m!423553 () Bool)

(assert (=> b!436147 m!423553))

(declare-fun m!423555 () Bool)

(assert (=> b!436147 m!423555))

(declare-fun m!423557 () Bool)

(assert (=> b!436151 m!423557))

(check-sat (not b!436151) (not b!436138) (not b_lambda!9367) (not b!436147) (not start!40016) (not b!436155) (not b!436141) (not b!436137) tp_is_empty!11449 (not b!436139) (not mapNonEmpty!18795) (not b!436153) (not b!436142) (not b!436152) b_and!18229 (not b_next!10297) (not b!436150) (not b!436143))
(check-sat b_and!18229 (not b_next!10297))
