; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134060 () Bool)

(assert start!134060)

(declare-fun b_free!32221 () Bool)

(declare-fun b_next!32221 () Bool)

(assert (=> start!134060 (= b_free!32221 (not b_next!32221))))

(declare-fun tp!113986 () Bool)

(declare-fun b_and!51851 () Bool)

(assert (=> start!134060 (= tp!113986 b_and!51851)))

(declare-fun b!1567054 () Bool)

(declare-fun e!873497 () Bool)

(declare-datatypes ((V!60209 0))(
  ( (V!60210 (val!19584 Int)) )
))
(declare-datatypes ((tuple2!25340 0))(
  ( (tuple2!25341 (_1!12681 (_ BitVec 64)) (_2!12681 V!60209)) )
))
(declare-datatypes ((List!36700 0))(
  ( (Nil!36697) (Cons!36696 (h!38144 tuple2!25340) (t!51598 List!36700)) )
))
(declare-datatypes ((ListLongMap!22775 0))(
  ( (ListLongMap!22776 (toList!11403 List!36700)) )
))
(declare-fun lt!672647 () ListLongMap!22775)

(declare-fun contains!10319 (ListLongMap!22775 (_ BitVec 64)) Bool)

(assert (=> b!1567054 (= e!873497 (contains!10319 lt!672647 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567055 () Bool)

(declare-fun res!1071080 () Bool)

(declare-fun e!873496 () Bool)

(assert (=> b!1567055 (=> (not res!1071080) (not e!873496))))

(declare-datatypes ((array!104620 0))(
  ( (array!104621 (arr!50495 (Array (_ BitVec 32) (_ BitVec 64))) (size!51047 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104620)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567055 (= res!1071080 (not (validKeyInArray!0 (select (arr!50495 _keys!637) from!782))))))

(declare-fun b!1567056 () Bool)

(declare-fun e!873500 () Bool)

(declare-fun tp_is_empty!39001 () Bool)

(assert (=> b!1567056 (= e!873500 tp_is_empty!39001)))

(declare-fun mapIsEmpty!59904 () Bool)

(declare-fun mapRes!59904 () Bool)

(assert (=> mapIsEmpty!59904 mapRes!59904))

(declare-fun b!1567058 () Bool)

(declare-fun res!1071083 () Bool)

(assert (=> b!1567058 (=> (not res!1071083) (not e!873496))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104620 (_ BitVec 32)) Bool)

(assert (=> b!1567058 (= res!1071083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567059 () Bool)

(declare-fun res!1071078 () Bool)

(assert (=> b!1567059 (=> (not res!1071078) (not e!873496))))

(assert (=> b!1567059 (= res!1071078 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51047 _keys!637)) (bvslt from!782 (size!51047 _keys!637))))))

(declare-fun mapNonEmpty!59904 () Bool)

(declare-fun tp!113985 () Bool)

(declare-fun e!873499 () Bool)

(assert (=> mapNonEmpty!59904 (= mapRes!59904 (and tp!113985 e!873499))))

(declare-fun mapKey!59904 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18470 0))(
  ( (ValueCellFull!18470 (v!22340 V!60209)) (EmptyCell!18470) )
))
(declare-fun mapValue!59904 () ValueCell!18470)

(declare-datatypes ((array!104622 0))(
  ( (array!104623 (arr!50496 (Array (_ BitVec 32) ValueCell!18470)) (size!51048 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104622)

(declare-fun mapRest!59904 () (Array (_ BitVec 32) ValueCell!18470))

(assert (=> mapNonEmpty!59904 (= (arr!50496 _values!487) (store mapRest!59904 mapKey!59904 mapValue!59904))))

(declare-fun b!1567060 () Bool)

(declare-fun e!873498 () Bool)

(assert (=> b!1567060 (= e!873498 (and e!873500 mapRes!59904))))

(declare-fun condMapEmpty!59904 () Bool)

(declare-fun mapDefault!59904 () ValueCell!18470)

(assert (=> b!1567060 (= condMapEmpty!59904 (= (arr!50496 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18470)) mapDefault!59904)))))

(declare-fun b!1567061 () Bool)

(declare-fun res!1071079 () Bool)

(assert (=> b!1567061 (=> (not res!1071079) (not e!873496))))

(declare-datatypes ((List!36701 0))(
  ( (Nil!36698) (Cons!36697 (h!38145 (_ BitVec 64)) (t!51599 List!36701)) )
))
(declare-fun arrayNoDuplicates!0 (array!104620 (_ BitVec 32) List!36701) Bool)

(assert (=> b!1567061 (= res!1071079 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36698))))

(declare-fun res!1071077 () Bool)

(assert (=> start!134060 (=> (not res!1071077) (not e!873496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134060 (= res!1071077 (validMask!0 mask!947))))

(assert (=> start!134060 e!873496))

(assert (=> start!134060 tp!113986))

(assert (=> start!134060 tp_is_empty!39001))

(assert (=> start!134060 true))

(declare-fun array_inv!39433 (array!104620) Bool)

(assert (=> start!134060 (array_inv!39433 _keys!637)))

(declare-fun array_inv!39434 (array!104622) Bool)

(assert (=> start!134060 (and (array_inv!39434 _values!487) e!873498)))

(declare-fun b!1567057 () Bool)

(assert (=> b!1567057 (= e!873496 e!873497)))

(declare-fun res!1071082 () Bool)

(assert (=> b!1567057 (=> res!1071082 e!873497)))

(assert (=> b!1567057 (= res!1071082 (contains!10319 lt!672647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60209)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60209)

(declare-fun getCurrentListMapNoExtraKeys!6753 (array!104620 array!104622 (_ BitVec 32) (_ BitVec 32) V!60209 V!60209 (_ BitVec 32) Int) ListLongMap!22775)

(assert (=> b!1567057 (= lt!672647 (getCurrentListMapNoExtraKeys!6753 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567062 () Bool)

(assert (=> b!1567062 (= e!873499 tp_is_empty!39001)))

(declare-fun b!1567063 () Bool)

(declare-fun res!1071081 () Bool)

(assert (=> b!1567063 (=> (not res!1071081) (not e!873496))))

(assert (=> b!1567063 (= res!1071081 (and (= (size!51048 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51047 _keys!637) (size!51048 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!134060 res!1071077) b!1567063))

(assert (= (and b!1567063 res!1071081) b!1567058))

(assert (= (and b!1567058 res!1071083) b!1567061))

(assert (= (and b!1567061 res!1071079) b!1567059))

(assert (= (and b!1567059 res!1071078) b!1567055))

(assert (= (and b!1567055 res!1071080) b!1567057))

(assert (= (and b!1567057 (not res!1071082)) b!1567054))

(assert (= (and b!1567060 condMapEmpty!59904) mapIsEmpty!59904))

(assert (= (and b!1567060 (not condMapEmpty!59904)) mapNonEmpty!59904))

(get-info :version)

(assert (= (and mapNonEmpty!59904 ((_ is ValueCellFull!18470) mapValue!59904)) b!1567062))

(assert (= (and b!1567060 ((_ is ValueCellFull!18470) mapDefault!59904)) b!1567056))

(assert (= start!134060 b!1567060))

(declare-fun m!1441349 () Bool)

(assert (=> b!1567057 m!1441349))

(declare-fun m!1441351 () Bool)

(assert (=> b!1567057 m!1441351))

(declare-fun m!1441353 () Bool)

(assert (=> b!1567054 m!1441353))

(declare-fun m!1441355 () Bool)

(assert (=> mapNonEmpty!59904 m!1441355))

(declare-fun m!1441357 () Bool)

(assert (=> b!1567055 m!1441357))

(assert (=> b!1567055 m!1441357))

(declare-fun m!1441359 () Bool)

(assert (=> b!1567055 m!1441359))

(declare-fun m!1441361 () Bool)

(assert (=> start!134060 m!1441361))

(declare-fun m!1441363 () Bool)

(assert (=> start!134060 m!1441363))

(declare-fun m!1441365 () Bool)

(assert (=> start!134060 m!1441365))

(declare-fun m!1441367 () Bool)

(assert (=> b!1567058 m!1441367))

(declare-fun m!1441369 () Bool)

(assert (=> b!1567061 m!1441369))

(check-sat (not b!1567057) b_and!51851 (not b!1567055) (not b!1567054) (not b_next!32221) (not b!1567058) (not mapNonEmpty!59904) tp_is_empty!39001 (not b!1567061) (not start!134060))
(check-sat b_and!51851 (not b_next!32221))
(get-model)

(declare-fun d!163315 () Bool)

(declare-fun e!873542 () Bool)

(assert (=> d!163315 e!873542))

(declare-fun res!1071128 () Bool)

(assert (=> d!163315 (=> res!1071128 e!873542)))

(declare-fun lt!672662 () Bool)

(assert (=> d!163315 (= res!1071128 (not lt!672662))))

(declare-fun lt!672664 () Bool)

(assert (=> d!163315 (= lt!672662 lt!672664)))

(declare-datatypes ((Unit!51871 0))(
  ( (Unit!51872) )
))
(declare-fun lt!672663 () Unit!51871)

(declare-fun e!873543 () Unit!51871)

(assert (=> d!163315 (= lt!672663 e!873543)))

(declare-fun c!144399 () Bool)

(assert (=> d!163315 (= c!144399 lt!672664)))

(declare-fun containsKey!851 (List!36700 (_ BitVec 64)) Bool)

(assert (=> d!163315 (= lt!672664 (containsKey!851 (toList!11403 lt!672647) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163315 (= (contains!10319 lt!672647 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672662)))

(declare-fun b!1567130 () Bool)

(declare-fun lt!672665 () Unit!51871)

(assert (=> b!1567130 (= e!873543 lt!672665)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!535 (List!36700 (_ BitVec 64)) Unit!51871)

(assert (=> b!1567130 (= lt!672665 (lemmaContainsKeyImpliesGetValueByKeyDefined!535 (toList!11403 lt!672647) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!873 0))(
  ( (Some!872 (v!22343 V!60209)) (None!871) )
))
(declare-fun isDefined!586 (Option!873) Bool)

(declare-fun getValueByKey!798 (List!36700 (_ BitVec 64)) Option!873)

(assert (=> b!1567130 (isDefined!586 (getValueByKey!798 (toList!11403 lt!672647) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567131 () Bool)

(declare-fun Unit!51873 () Unit!51871)

(assert (=> b!1567131 (= e!873543 Unit!51873)))

(declare-fun b!1567132 () Bool)

(assert (=> b!1567132 (= e!873542 (isDefined!586 (getValueByKey!798 (toList!11403 lt!672647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163315 c!144399) b!1567130))

(assert (= (and d!163315 (not c!144399)) b!1567131))

(assert (= (and d!163315 (not res!1071128)) b!1567132))

(declare-fun m!1441415 () Bool)

(assert (=> d!163315 m!1441415))

(declare-fun m!1441417 () Bool)

(assert (=> b!1567130 m!1441417))

(declare-fun m!1441419 () Bool)

(assert (=> b!1567130 m!1441419))

(assert (=> b!1567130 m!1441419))

(declare-fun m!1441421 () Bool)

(assert (=> b!1567130 m!1441421))

(assert (=> b!1567132 m!1441419))

(assert (=> b!1567132 m!1441419))

(assert (=> b!1567132 m!1441421))

(assert (=> b!1567054 d!163315))

(declare-fun b!1567141 () Bool)

(declare-fun e!873552 () Bool)

(declare-fun call!71898 () Bool)

(assert (=> b!1567141 (= e!873552 call!71898)))

(declare-fun d!163317 () Bool)

(declare-fun res!1071133 () Bool)

(declare-fun e!873551 () Bool)

(assert (=> d!163317 (=> res!1071133 e!873551)))

(assert (=> d!163317 (= res!1071133 (bvsge #b00000000000000000000000000000000 (size!51047 _keys!637)))))

(assert (=> d!163317 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873551)))

(declare-fun b!1567142 () Bool)

(assert (=> b!1567142 (= e!873551 e!873552)))

(declare-fun c!144402 () Bool)

(assert (=> b!1567142 (= c!144402 (validKeyInArray!0 (select (arr!50495 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71895 () Bool)

(assert (=> bm!71895 (= call!71898 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1567143 () Bool)

(declare-fun e!873550 () Bool)

(assert (=> b!1567143 (= e!873552 e!873550)))

(declare-fun lt!672673 () (_ BitVec 64))

(assert (=> b!1567143 (= lt!672673 (select (arr!50495 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!672674 () Unit!51871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104620 (_ BitVec 64) (_ BitVec 32)) Unit!51871)

(assert (=> b!1567143 (= lt!672674 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672673 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1567143 (arrayContainsKey!0 _keys!637 lt!672673 #b00000000000000000000000000000000)))

(declare-fun lt!672672 () Unit!51871)

(assert (=> b!1567143 (= lt!672672 lt!672674)))

(declare-fun res!1071134 () Bool)

(declare-datatypes ((SeekEntryResult!13529 0))(
  ( (MissingZero!13529 (index!56514 (_ BitVec 32))) (Found!13529 (index!56515 (_ BitVec 32))) (Intermediate!13529 (undefined!14341 Bool) (index!56516 (_ BitVec 32)) (x!140838 (_ BitVec 32))) (Undefined!13529) (MissingVacant!13529 (index!56517 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104620 (_ BitVec 32)) SeekEntryResult!13529)

(assert (=> b!1567143 (= res!1071134 (= (seekEntryOrOpen!0 (select (arr!50495 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13529 #b00000000000000000000000000000000)))))

(assert (=> b!1567143 (=> (not res!1071134) (not e!873550))))

(declare-fun b!1567144 () Bool)

(assert (=> b!1567144 (= e!873550 call!71898)))

(assert (= (and d!163317 (not res!1071133)) b!1567142))

(assert (= (and b!1567142 c!144402) b!1567143))

(assert (= (and b!1567142 (not c!144402)) b!1567141))

(assert (= (and b!1567143 res!1071134) b!1567144))

(assert (= (or b!1567144 b!1567141) bm!71895))

(declare-fun m!1441423 () Bool)

(assert (=> b!1567142 m!1441423))

(assert (=> b!1567142 m!1441423))

(declare-fun m!1441425 () Bool)

(assert (=> b!1567142 m!1441425))

(declare-fun m!1441427 () Bool)

(assert (=> bm!71895 m!1441427))

(assert (=> b!1567143 m!1441423))

(declare-fun m!1441429 () Bool)

(assert (=> b!1567143 m!1441429))

(declare-fun m!1441431 () Bool)

(assert (=> b!1567143 m!1441431))

(assert (=> b!1567143 m!1441423))

(declare-fun m!1441433 () Bool)

(assert (=> b!1567143 m!1441433))

(assert (=> b!1567058 d!163317))

(declare-fun d!163319 () Bool)

(declare-fun e!873553 () Bool)

(assert (=> d!163319 e!873553))

(declare-fun res!1071135 () Bool)

(assert (=> d!163319 (=> res!1071135 e!873553)))

(declare-fun lt!672675 () Bool)

(assert (=> d!163319 (= res!1071135 (not lt!672675))))

(declare-fun lt!672677 () Bool)

(assert (=> d!163319 (= lt!672675 lt!672677)))

(declare-fun lt!672676 () Unit!51871)

(declare-fun e!873554 () Unit!51871)

(assert (=> d!163319 (= lt!672676 e!873554)))

(declare-fun c!144403 () Bool)

(assert (=> d!163319 (= c!144403 lt!672677)))

(assert (=> d!163319 (= lt!672677 (containsKey!851 (toList!11403 lt!672647) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163319 (= (contains!10319 lt!672647 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672675)))

(declare-fun b!1567145 () Bool)

(declare-fun lt!672678 () Unit!51871)

(assert (=> b!1567145 (= e!873554 lt!672678)))

(assert (=> b!1567145 (= lt!672678 (lemmaContainsKeyImpliesGetValueByKeyDefined!535 (toList!11403 lt!672647) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1567145 (isDefined!586 (getValueByKey!798 (toList!11403 lt!672647) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567146 () Bool)

(declare-fun Unit!51874 () Unit!51871)

(assert (=> b!1567146 (= e!873554 Unit!51874)))

(declare-fun b!1567147 () Bool)

(assert (=> b!1567147 (= e!873553 (isDefined!586 (getValueByKey!798 (toList!11403 lt!672647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163319 c!144403) b!1567145))

(assert (= (and d!163319 (not c!144403)) b!1567146))

(assert (= (and d!163319 (not res!1071135)) b!1567147))

(declare-fun m!1441435 () Bool)

(assert (=> d!163319 m!1441435))

(declare-fun m!1441437 () Bool)

(assert (=> b!1567145 m!1441437))

(declare-fun m!1441439 () Bool)

(assert (=> b!1567145 m!1441439))

(assert (=> b!1567145 m!1441439))

(declare-fun m!1441441 () Bool)

(assert (=> b!1567145 m!1441441))

(assert (=> b!1567147 m!1441439))

(assert (=> b!1567147 m!1441439))

(assert (=> b!1567147 m!1441441))

(assert (=> b!1567057 d!163319))

(declare-fun b!1567172 () Bool)

(declare-fun e!873573 () Bool)

(declare-fun lt!672694 () ListLongMap!22775)

(declare-fun isEmpty!1155 (ListLongMap!22775) Bool)

(assert (=> b!1567172 (= e!873573 (isEmpty!1155 lt!672694))))

(declare-fun b!1567173 () Bool)

(declare-fun res!1071144 () Bool)

(declare-fun e!873572 () Bool)

(assert (=> b!1567173 (=> (not res!1071144) (not e!873572))))

(assert (=> b!1567173 (= res!1071144 (not (contains!10319 lt!672694 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567174 () Bool)

(assert (=> b!1567174 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51047 _keys!637)))))

(assert (=> b!1567174 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51048 _values!487)))))

(declare-fun e!873571 () Bool)

(declare-fun apply!1108 (ListLongMap!22775 (_ BitVec 64)) V!60209)

(declare-fun get!26378 (ValueCell!18470 V!60209) V!60209)

(declare-fun dynLambda!3892 (Int (_ BitVec 64)) V!60209)

(assert (=> b!1567174 (= e!873571 (= (apply!1108 lt!672694 (select (arr!50495 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26378 (select (arr!50496 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3892 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1567175 () Bool)

(declare-fun e!873574 () ListLongMap!22775)

(assert (=> b!1567175 (= e!873574 (ListLongMap!22776 Nil!36697))))

(declare-fun b!1567176 () Bool)

(assert (=> b!1567176 (= e!873573 (= lt!672694 (getCurrentListMapNoExtraKeys!6753 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun d!163321 () Bool)

(assert (=> d!163321 e!873572))

(declare-fun res!1071146 () Bool)

(assert (=> d!163321 (=> (not res!1071146) (not e!873572))))

(assert (=> d!163321 (= res!1071146 (not (contains!10319 lt!672694 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163321 (= lt!672694 e!873574)))

(declare-fun c!144415 () Bool)

(assert (=> d!163321 (= c!144415 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51047 _keys!637)))))

(assert (=> d!163321 (validMask!0 mask!947)))

(assert (=> d!163321 (= (getCurrentListMapNoExtraKeys!6753 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!672694)))

(declare-fun b!1567177 () Bool)

(declare-fun e!873569 () Bool)

(assert (=> b!1567177 (= e!873569 e!873573)))

(declare-fun c!144413 () Bool)

(assert (=> b!1567177 (= c!144413 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51047 _keys!637)))))

(declare-fun b!1567178 () Bool)

(declare-fun e!873575 () Bool)

(assert (=> b!1567178 (= e!873575 (validKeyInArray!0 (select (arr!50495 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567178 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun bm!71898 () Bool)

(declare-fun call!71901 () ListLongMap!22775)

(assert (=> bm!71898 (= call!71901 (getCurrentListMapNoExtraKeys!6753 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1567179 () Bool)

(assert (=> b!1567179 (= e!873572 e!873569)))

(declare-fun c!144414 () Bool)

(assert (=> b!1567179 (= c!144414 e!873575)))

(declare-fun res!1071147 () Bool)

(assert (=> b!1567179 (=> (not res!1071147) (not e!873575))))

(assert (=> b!1567179 (= res!1071147 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51047 _keys!637)))))

(declare-fun b!1567180 () Bool)

(declare-fun lt!672697 () Unit!51871)

(declare-fun lt!672698 () Unit!51871)

(assert (=> b!1567180 (= lt!672697 lt!672698)))

(declare-fun lt!672695 () ListLongMap!22775)

(declare-fun lt!672699 () V!60209)

(declare-fun lt!672696 () (_ BitVec 64))

(declare-fun lt!672693 () (_ BitVec 64))

(declare-fun +!5116 (ListLongMap!22775 tuple2!25340) ListLongMap!22775)

(assert (=> b!1567180 (not (contains!10319 (+!5116 lt!672695 (tuple2!25341 lt!672696 lt!672699)) lt!672693))))

(declare-fun addStillNotContains!563 (ListLongMap!22775 (_ BitVec 64) V!60209 (_ BitVec 64)) Unit!51871)

(assert (=> b!1567180 (= lt!672698 (addStillNotContains!563 lt!672695 lt!672696 lt!672699 lt!672693))))

(assert (=> b!1567180 (= lt!672693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1567180 (= lt!672699 (get!26378 (select (arr!50496 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3892 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1567180 (= lt!672696 (select (arr!50495 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1567180 (= lt!672695 call!71901)))

(declare-fun e!873570 () ListLongMap!22775)

(assert (=> b!1567180 (= e!873570 (+!5116 call!71901 (tuple2!25341 (select (arr!50495 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26378 (select (arr!50496 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3892 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1567181 () Bool)

(assert (=> b!1567181 (= e!873574 e!873570)))

(declare-fun c!144412 () Bool)

(assert (=> b!1567181 (= c!144412 (validKeyInArray!0 (select (arr!50495 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1567182 () Bool)

(assert (=> b!1567182 (= e!873570 call!71901)))

(declare-fun b!1567183 () Bool)

(assert (=> b!1567183 (= e!873569 e!873571)))

(assert (=> b!1567183 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51047 _keys!637)))))

(declare-fun res!1071145 () Bool)

(assert (=> b!1567183 (= res!1071145 (contains!10319 lt!672694 (select (arr!50495 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567183 (=> (not res!1071145) (not e!873571))))

(assert (= (and d!163321 c!144415) b!1567175))

(assert (= (and d!163321 (not c!144415)) b!1567181))

(assert (= (and b!1567181 c!144412) b!1567180))

(assert (= (and b!1567181 (not c!144412)) b!1567182))

(assert (= (or b!1567180 b!1567182) bm!71898))

(assert (= (and d!163321 res!1071146) b!1567173))

(assert (= (and b!1567173 res!1071144) b!1567179))

(assert (= (and b!1567179 res!1071147) b!1567178))

(assert (= (and b!1567179 c!144414) b!1567183))

(assert (= (and b!1567179 (not c!144414)) b!1567177))

(assert (= (and b!1567183 res!1071145) b!1567174))

(assert (= (and b!1567177 c!144413) b!1567176))

(assert (= (and b!1567177 (not c!144413)) b!1567172))

(declare-fun b_lambda!25029 () Bool)

(assert (=> (not b_lambda!25029) (not b!1567174)))

(declare-fun t!51602 () Bool)

(declare-fun tb!12653 () Bool)

(assert (=> (and start!134060 (= defaultEntry!495 defaultEntry!495) t!51602) tb!12653))

(declare-fun result!26611 () Bool)

(assert (=> tb!12653 (= result!26611 tp_is_empty!39001)))

(assert (=> b!1567174 t!51602))

(declare-fun b_and!51857 () Bool)

(assert (= b_and!51851 (and (=> t!51602 result!26611) b_and!51857)))

(declare-fun b_lambda!25031 () Bool)

(assert (=> (not b_lambda!25031) (not b!1567180)))

(assert (=> b!1567180 t!51602))

(declare-fun b_and!51859 () Bool)

(assert (= b_and!51857 (and (=> t!51602 result!26611) b_and!51859)))

(declare-fun m!1441443 () Bool)

(assert (=> b!1567181 m!1441443))

(assert (=> b!1567181 m!1441443))

(declare-fun m!1441445 () Bool)

(assert (=> b!1567181 m!1441445))

(declare-fun m!1441447 () Bool)

(assert (=> b!1567174 m!1441447))

(declare-fun m!1441449 () Bool)

(assert (=> b!1567174 m!1441449))

(assert (=> b!1567174 m!1441447))

(declare-fun m!1441451 () Bool)

(assert (=> b!1567174 m!1441451))

(assert (=> b!1567174 m!1441443))

(assert (=> b!1567174 m!1441449))

(assert (=> b!1567174 m!1441443))

(declare-fun m!1441453 () Bool)

(assert (=> b!1567174 m!1441453))

(declare-fun m!1441455 () Bool)

(assert (=> d!163321 m!1441455))

(assert (=> d!163321 m!1441361))

(declare-fun m!1441457 () Bool)

(assert (=> b!1567172 m!1441457))

(declare-fun m!1441459 () Bool)

(assert (=> b!1567176 m!1441459))

(assert (=> b!1567178 m!1441443))

(assert (=> b!1567178 m!1441443))

(assert (=> b!1567178 m!1441445))

(assert (=> bm!71898 m!1441459))

(assert (=> b!1567183 m!1441443))

(assert (=> b!1567183 m!1441443))

(declare-fun m!1441461 () Bool)

(assert (=> b!1567183 m!1441461))

(declare-fun m!1441463 () Bool)

(assert (=> b!1567173 m!1441463))

(declare-fun m!1441465 () Bool)

(assert (=> b!1567180 m!1441465))

(declare-fun m!1441467 () Bool)

(assert (=> b!1567180 m!1441467))

(declare-fun m!1441469 () Bool)

(assert (=> b!1567180 m!1441469))

(assert (=> b!1567180 m!1441447))

(assert (=> b!1567180 m!1441449))

(assert (=> b!1567180 m!1441447))

(assert (=> b!1567180 m!1441451))

(assert (=> b!1567180 m!1441443))

(declare-fun m!1441471 () Bool)

(assert (=> b!1567180 m!1441471))

(assert (=> b!1567180 m!1441449))

(assert (=> b!1567180 m!1441467))

(assert (=> b!1567057 d!163321))

(declare-fun b!1567196 () Bool)

(declare-fun e!873585 () Bool)

(declare-fun e!873584 () Bool)

(assert (=> b!1567196 (= e!873585 e!873584)))

(declare-fun c!144418 () Bool)

(assert (=> b!1567196 (= c!144418 (validKeyInArray!0 (select (arr!50495 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163323 () Bool)

(declare-fun res!1071156 () Bool)

(declare-fun e!873586 () Bool)

(assert (=> d!163323 (=> res!1071156 e!873586)))

(assert (=> d!163323 (= res!1071156 (bvsge #b00000000000000000000000000000000 (size!51047 _keys!637)))))

(assert (=> d!163323 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36698) e!873586)))

(declare-fun b!1567197 () Bool)

(declare-fun call!71904 () Bool)

(assert (=> b!1567197 (= e!873584 call!71904)))

(declare-fun b!1567198 () Bool)

(assert (=> b!1567198 (= e!873584 call!71904)))

(declare-fun b!1567199 () Bool)

(declare-fun e!873587 () Bool)

(declare-fun contains!10321 (List!36701 (_ BitVec 64)) Bool)

(assert (=> b!1567199 (= e!873587 (contains!10321 Nil!36698 (select (arr!50495 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567200 () Bool)

(assert (=> b!1567200 (= e!873586 e!873585)))

(declare-fun res!1071154 () Bool)

(assert (=> b!1567200 (=> (not res!1071154) (not e!873585))))

(assert (=> b!1567200 (= res!1071154 (not e!873587))))

(declare-fun res!1071155 () Bool)

(assert (=> b!1567200 (=> (not res!1071155) (not e!873587))))

(assert (=> b!1567200 (= res!1071155 (validKeyInArray!0 (select (arr!50495 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71901 () Bool)

(assert (=> bm!71901 (= call!71904 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144418 (Cons!36697 (select (arr!50495 _keys!637) #b00000000000000000000000000000000) Nil!36698) Nil!36698)))))

(assert (= (and d!163323 (not res!1071156)) b!1567200))

(assert (= (and b!1567200 res!1071155) b!1567199))

(assert (= (and b!1567200 res!1071154) b!1567196))

(assert (= (and b!1567196 c!144418) b!1567197))

(assert (= (and b!1567196 (not c!144418)) b!1567198))

(assert (= (or b!1567197 b!1567198) bm!71901))

(assert (=> b!1567196 m!1441423))

(assert (=> b!1567196 m!1441423))

(assert (=> b!1567196 m!1441425))

(assert (=> b!1567199 m!1441423))

(assert (=> b!1567199 m!1441423))

(declare-fun m!1441473 () Bool)

(assert (=> b!1567199 m!1441473))

(assert (=> b!1567200 m!1441423))

(assert (=> b!1567200 m!1441423))

(assert (=> b!1567200 m!1441425))

(assert (=> bm!71901 m!1441423))

(declare-fun m!1441475 () Bool)

(assert (=> bm!71901 m!1441475))

(assert (=> b!1567061 d!163323))

(declare-fun d!163325 () Bool)

(assert (=> d!163325 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134060 d!163325))

(declare-fun d!163327 () Bool)

(assert (=> d!163327 (= (array_inv!39433 _keys!637) (bvsge (size!51047 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134060 d!163327))

(declare-fun d!163329 () Bool)

(assert (=> d!163329 (= (array_inv!39434 _values!487) (bvsge (size!51048 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134060 d!163329))

(declare-fun d!163331 () Bool)

(assert (=> d!163331 (= (validKeyInArray!0 (select (arr!50495 _keys!637) from!782)) (and (not (= (select (arr!50495 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50495 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567055 d!163331))

(declare-fun condMapEmpty!59913 () Bool)

(declare-fun mapDefault!59913 () ValueCell!18470)

(assert (=> mapNonEmpty!59904 (= condMapEmpty!59913 (= mapRest!59904 ((as const (Array (_ BitVec 32) ValueCell!18470)) mapDefault!59913)))))

(declare-fun e!873592 () Bool)

(declare-fun mapRes!59913 () Bool)

(assert (=> mapNonEmpty!59904 (= tp!113985 (and e!873592 mapRes!59913))))

(declare-fun mapNonEmpty!59913 () Bool)

(declare-fun tp!114001 () Bool)

(declare-fun e!873593 () Bool)

(assert (=> mapNonEmpty!59913 (= mapRes!59913 (and tp!114001 e!873593))))

(declare-fun mapKey!59913 () (_ BitVec 32))

(declare-fun mapValue!59913 () ValueCell!18470)

(declare-fun mapRest!59913 () (Array (_ BitVec 32) ValueCell!18470))

(assert (=> mapNonEmpty!59913 (= mapRest!59904 (store mapRest!59913 mapKey!59913 mapValue!59913))))

(declare-fun mapIsEmpty!59913 () Bool)

(assert (=> mapIsEmpty!59913 mapRes!59913))

(declare-fun b!1567208 () Bool)

(assert (=> b!1567208 (= e!873592 tp_is_empty!39001)))

(declare-fun b!1567207 () Bool)

(assert (=> b!1567207 (= e!873593 tp_is_empty!39001)))

(assert (= (and mapNonEmpty!59904 condMapEmpty!59913) mapIsEmpty!59913))

(assert (= (and mapNonEmpty!59904 (not condMapEmpty!59913)) mapNonEmpty!59913))

(assert (= (and mapNonEmpty!59913 ((_ is ValueCellFull!18470) mapValue!59913)) b!1567207))

(assert (= (and mapNonEmpty!59904 ((_ is ValueCellFull!18470) mapDefault!59913)) b!1567208))

(declare-fun m!1441477 () Bool)

(assert (=> mapNonEmpty!59913 m!1441477))

(declare-fun b_lambda!25033 () Bool)

(assert (= b_lambda!25031 (or (and start!134060 b_free!32221) b_lambda!25033)))

(declare-fun b_lambda!25035 () Bool)

(assert (= b_lambda!25029 (or (and start!134060 b_free!32221) b_lambda!25035)))

(check-sat (not b!1567174) (not bm!71895) (not b!1567196) (not b!1567142) (not mapNonEmpty!59913) (not b!1567183) (not d!163315) (not bm!71901) (not d!163321) (not b!1567180) (not b!1567176) (not d!163319) (not b!1567200) (not b!1567132) b_and!51859 (not b!1567173) (not b!1567143) (not b!1567172) (not b_lambda!25033) (not b!1567181) (not b!1567147) (not b!1567145) (not b_next!32221) (not b!1567199) (not b_lambda!25035) tp_is_empty!39001 (not b!1567178) (not b!1567130) (not bm!71898))
(check-sat b_and!51859 (not b_next!32221))
