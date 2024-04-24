; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134252 () Bool)

(assert start!134252)

(declare-fun b!1567237 () Bool)

(declare-fun res!1070598 () Bool)

(declare-fun e!873696 () Bool)

(assert (=> b!1567237 (=> (not res!1070598) (not e!873696))))

(declare-datatypes ((array!104586 0))(
  ( (array!104587 (arr!50476 (Array (_ BitVec 32) (_ BitVec 64))) (size!51027 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104586)

(declare-datatypes ((List!36614 0))(
  ( (Nil!36611) (Cons!36610 (h!38074 (_ BitVec 64)) (t!51453 List!36614)) )
))
(declare-fun arrayNoDuplicates!0 (array!104586 (_ BitVec 32) List!36614) Bool)

(assert (=> b!1567237 (= res!1070598 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36611))))

(declare-fun b!1567238 () Bool)

(declare-fun res!1070597 () Bool)

(assert (=> b!1567238 (=> (not res!1070597) (not e!873696))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60057 0))(
  ( (V!60058 (val!19527 Int)) )
))
(declare-datatypes ((ValueCell!18413 0))(
  ( (ValueCellFull!18413 (v!22273 V!60057)) (EmptyCell!18413) )
))
(declare-datatypes ((array!104588 0))(
  ( (array!104589 (arr!50477 (Array (_ BitVec 32) ValueCell!18413)) (size!51028 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104588)

(assert (=> b!1567238 (= res!1070597 (and (= (size!51028 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51027 _keys!637) (size!51028 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1070595 () Bool)

(assert (=> start!134252 (=> (not res!1070595) (not e!873696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134252 (= res!1070595 (validMask!0 mask!947))))

(assert (=> start!134252 e!873696))

(assert (=> start!134252 true))

(declare-fun array_inv!39471 (array!104586) Bool)

(assert (=> start!134252 (array_inv!39471 _keys!637)))

(declare-fun e!873697 () Bool)

(declare-fun array_inv!39472 (array!104588) Bool)

(assert (=> start!134252 (and (array_inv!39472 _values!487) e!873697)))

(declare-fun b!1567239 () Bool)

(declare-fun res!1070594 () Bool)

(assert (=> b!1567239 (=> (not res!1070594) (not e!873696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104586 (_ BitVec 32)) Bool)

(assert (=> b!1567239 (= res!1070594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567240 () Bool)

(declare-fun e!873694 () Bool)

(declare-fun tp_is_empty!38887 () Bool)

(assert (=> b!1567240 (= e!873694 tp_is_empty!38887)))

(declare-fun mapIsEmpty!59713 () Bool)

(declare-fun mapRes!59713 () Bool)

(assert (=> mapIsEmpty!59713 mapRes!59713))

(declare-fun b!1567241 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1567241 (= e!873696 (bvsge (bvsub (size!51027 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51027 _keys!637)) from!782)))))

(declare-fun b!1567242 () Bool)

(declare-fun res!1070593 () Bool)

(assert (=> b!1567242 (=> (not res!1070593) (not e!873696))))

(assert (=> b!1567242 (= res!1070593 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51027 _keys!637)) (bvslt from!782 (size!51027 _keys!637))))))

(declare-fun mapNonEmpty!59713 () Bool)

(declare-fun tp!113638 () Bool)

(declare-fun e!873693 () Bool)

(assert (=> mapNonEmpty!59713 (= mapRes!59713 (and tp!113638 e!873693))))

(declare-fun mapRest!59713 () (Array (_ BitVec 32) ValueCell!18413))

(declare-fun mapValue!59713 () ValueCell!18413)

(declare-fun mapKey!59713 () (_ BitVec 32))

(assert (=> mapNonEmpty!59713 (= (arr!50477 _values!487) (store mapRest!59713 mapKey!59713 mapValue!59713))))

(declare-fun b!1567243 () Bool)

(assert (=> b!1567243 (= e!873697 (and e!873694 mapRes!59713))))

(declare-fun condMapEmpty!59713 () Bool)

(declare-fun mapDefault!59713 () ValueCell!18413)

(assert (=> b!1567243 (= condMapEmpty!59713 (= (arr!50477 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18413)) mapDefault!59713)))))

(declare-fun b!1567244 () Bool)

(assert (=> b!1567244 (= e!873693 tp_is_empty!38887)))

(declare-fun b!1567245 () Bool)

(declare-fun res!1070596 () Bool)

(assert (=> b!1567245 (=> (not res!1070596) (not e!873696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567245 (= res!1070596 (validKeyInArray!0 (select (arr!50476 _keys!637) from!782)))))

(assert (= (and start!134252 res!1070595) b!1567238))

(assert (= (and b!1567238 res!1070597) b!1567239))

(assert (= (and b!1567239 res!1070594) b!1567237))

(assert (= (and b!1567237 res!1070598) b!1567242))

(assert (= (and b!1567242 res!1070593) b!1567245))

(assert (= (and b!1567245 res!1070596) b!1567241))

(assert (= (and b!1567243 condMapEmpty!59713) mapIsEmpty!59713))

(assert (= (and b!1567243 (not condMapEmpty!59713)) mapNonEmpty!59713))

(get-info :version)

(assert (= (and mapNonEmpty!59713 ((_ is ValueCellFull!18413) mapValue!59713)) b!1567244))

(assert (= (and b!1567243 ((_ is ValueCellFull!18413) mapDefault!59713)) b!1567240))

(assert (= start!134252 b!1567243))

(declare-fun m!1442139 () Bool)

(assert (=> mapNonEmpty!59713 m!1442139))

(declare-fun m!1442141 () Bool)

(assert (=> b!1567239 m!1442141))

(declare-fun m!1442143 () Bool)

(assert (=> start!134252 m!1442143))

(declare-fun m!1442145 () Bool)

(assert (=> start!134252 m!1442145))

(declare-fun m!1442147 () Bool)

(assert (=> start!134252 m!1442147))

(declare-fun m!1442149 () Bool)

(assert (=> b!1567245 m!1442149))

(assert (=> b!1567245 m!1442149))

(declare-fun m!1442151 () Bool)

(assert (=> b!1567245 m!1442151))

(declare-fun m!1442153 () Bool)

(assert (=> b!1567237 m!1442153))

(check-sat (not start!134252) (not b!1567245) (not b!1567237) (not mapNonEmpty!59713) (not b!1567239) tp_is_empty!38887)
(check-sat)
(get-model)

(declare-fun d!163841 () Bool)

(assert (=> d!163841 (= (validKeyInArray!0 (select (arr!50476 _keys!637) from!782)) (and (not (= (select (arr!50476 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50476 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567245 d!163841))

(declare-fun b!1567310 () Bool)

(declare-fun e!873739 () Bool)

(declare-fun e!873736 () Bool)

(assert (=> b!1567310 (= e!873739 e!873736)))

(declare-fun res!1070642 () Bool)

(assert (=> b!1567310 (=> (not res!1070642) (not e!873736))))

(declare-fun e!873738 () Bool)

(assert (=> b!1567310 (= res!1070642 (not e!873738))))

(declare-fun res!1070643 () Bool)

(assert (=> b!1567310 (=> (not res!1070643) (not e!873738))))

(assert (=> b!1567310 (= res!1070643 (validKeyInArray!0 (select (arr!50476 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163843 () Bool)

(declare-fun res!1070641 () Bool)

(assert (=> d!163843 (=> res!1070641 e!873739)))

(assert (=> d!163843 (= res!1070641 (bvsge #b00000000000000000000000000000000 (size!51027 _keys!637)))))

(assert (=> d!163843 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36611) e!873739)))

(declare-fun b!1567311 () Bool)

(declare-fun e!873737 () Bool)

(assert (=> b!1567311 (= e!873736 e!873737)))

(declare-fun c!145054 () Bool)

(assert (=> b!1567311 (= c!145054 (validKeyInArray!0 (select (arr!50476 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567312 () Bool)

(declare-fun call!72011 () Bool)

(assert (=> b!1567312 (= e!873737 call!72011)))

(declare-fun bm!72008 () Bool)

(assert (=> bm!72008 (= call!72011 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145054 (Cons!36610 (select (arr!50476 _keys!637) #b00000000000000000000000000000000) Nil!36611) Nil!36611)))))

(declare-fun b!1567313 () Bool)

(declare-fun contains!10365 (List!36614 (_ BitVec 64)) Bool)

(assert (=> b!1567313 (= e!873738 (contains!10365 Nil!36611 (select (arr!50476 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567314 () Bool)

(assert (=> b!1567314 (= e!873737 call!72011)))

(assert (= (and d!163843 (not res!1070641)) b!1567310))

(assert (= (and b!1567310 res!1070643) b!1567313))

(assert (= (and b!1567310 res!1070642) b!1567311))

(assert (= (and b!1567311 c!145054) b!1567312))

(assert (= (and b!1567311 (not c!145054)) b!1567314))

(assert (= (or b!1567312 b!1567314) bm!72008))

(declare-fun m!1442187 () Bool)

(assert (=> b!1567310 m!1442187))

(assert (=> b!1567310 m!1442187))

(declare-fun m!1442189 () Bool)

(assert (=> b!1567310 m!1442189))

(assert (=> b!1567311 m!1442187))

(assert (=> b!1567311 m!1442187))

(assert (=> b!1567311 m!1442189))

(assert (=> bm!72008 m!1442187))

(declare-fun m!1442191 () Bool)

(assert (=> bm!72008 m!1442191))

(assert (=> b!1567313 m!1442187))

(assert (=> b!1567313 m!1442187))

(declare-fun m!1442193 () Bool)

(assert (=> b!1567313 m!1442193))

(assert (=> b!1567237 d!163843))

(declare-fun d!163845 () Bool)

(assert (=> d!163845 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134252 d!163845))

(declare-fun d!163847 () Bool)

(assert (=> d!163847 (= (array_inv!39471 _keys!637) (bvsge (size!51027 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134252 d!163847))

(declare-fun d!163849 () Bool)

(assert (=> d!163849 (= (array_inv!39472 _values!487) (bvsge (size!51028 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134252 d!163849))

(declare-fun d!163851 () Bool)

(declare-fun res!1070648 () Bool)

(declare-fun e!873748 () Bool)

(assert (=> d!163851 (=> res!1070648 e!873748)))

(assert (=> d!163851 (= res!1070648 (bvsge #b00000000000000000000000000000000 (size!51027 _keys!637)))))

(assert (=> d!163851 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873748)))

(declare-fun b!1567323 () Bool)

(declare-fun e!873746 () Bool)

(declare-fun call!72014 () Bool)

(assert (=> b!1567323 (= e!873746 call!72014)))

(declare-fun b!1567324 () Bool)

(declare-fun e!873747 () Bool)

(assert (=> b!1567324 (= e!873747 call!72014)))

(declare-fun b!1567325 () Bool)

(assert (=> b!1567325 (= e!873748 e!873747)))

(declare-fun c!145057 () Bool)

(assert (=> b!1567325 (= c!145057 (validKeyInArray!0 (select (arr!50476 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!72011 () Bool)

(assert (=> bm!72011 (= call!72014 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1567326 () Bool)

(assert (=> b!1567326 (= e!873747 e!873746)))

(declare-fun lt!673024 () (_ BitVec 64))

(assert (=> b!1567326 (= lt!673024 (select (arr!50476 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51899 0))(
  ( (Unit!51900) )
))
(declare-fun lt!673023 () Unit!51899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104586 (_ BitVec 64) (_ BitVec 32)) Unit!51899)

(assert (=> b!1567326 (= lt!673023 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673024 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1567326 (arrayContainsKey!0 _keys!637 lt!673024 #b00000000000000000000000000000000)))

(declare-fun lt!673022 () Unit!51899)

(assert (=> b!1567326 (= lt!673022 lt!673023)))

(declare-fun res!1070649 () Bool)

(declare-datatypes ((SeekEntryResult!13471 0))(
  ( (MissingZero!13471 (index!56282 (_ BitVec 32))) (Found!13471 (index!56283 (_ BitVec 32))) (Intermediate!13471 (undefined!14283 Bool) (index!56284 (_ BitVec 32)) (x!140560 (_ BitVec 32))) (Undefined!13471) (MissingVacant!13471 (index!56285 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104586 (_ BitVec 32)) SeekEntryResult!13471)

(assert (=> b!1567326 (= res!1070649 (= (seekEntryOrOpen!0 (select (arr!50476 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13471 #b00000000000000000000000000000000)))))

(assert (=> b!1567326 (=> (not res!1070649) (not e!873746))))

(assert (= (and d!163851 (not res!1070648)) b!1567325))

(assert (= (and b!1567325 c!145057) b!1567326))

(assert (= (and b!1567325 (not c!145057)) b!1567324))

(assert (= (and b!1567326 res!1070649) b!1567323))

(assert (= (or b!1567323 b!1567324) bm!72011))

(assert (=> b!1567325 m!1442187))

(assert (=> b!1567325 m!1442187))

(assert (=> b!1567325 m!1442189))

(declare-fun m!1442195 () Bool)

(assert (=> bm!72011 m!1442195))

(assert (=> b!1567326 m!1442187))

(declare-fun m!1442197 () Bool)

(assert (=> b!1567326 m!1442197))

(declare-fun m!1442199 () Bool)

(assert (=> b!1567326 m!1442199))

(assert (=> b!1567326 m!1442187))

(declare-fun m!1442201 () Bool)

(assert (=> b!1567326 m!1442201))

(assert (=> b!1567239 d!163851))

(declare-fun b!1567333 () Bool)

(declare-fun e!873754 () Bool)

(assert (=> b!1567333 (= e!873754 tp_is_empty!38887)))

(declare-fun mapIsEmpty!59722 () Bool)

(declare-fun mapRes!59722 () Bool)

(assert (=> mapIsEmpty!59722 mapRes!59722))

(declare-fun b!1567334 () Bool)

(declare-fun e!873753 () Bool)

(assert (=> b!1567334 (= e!873753 tp_is_empty!38887)))

(declare-fun condMapEmpty!59722 () Bool)

(declare-fun mapDefault!59722 () ValueCell!18413)

(assert (=> mapNonEmpty!59713 (= condMapEmpty!59722 (= mapRest!59713 ((as const (Array (_ BitVec 32) ValueCell!18413)) mapDefault!59722)))))

(assert (=> mapNonEmpty!59713 (= tp!113638 (and e!873753 mapRes!59722))))

(declare-fun mapNonEmpty!59722 () Bool)

(declare-fun tp!113647 () Bool)

(assert (=> mapNonEmpty!59722 (= mapRes!59722 (and tp!113647 e!873754))))

(declare-fun mapKey!59722 () (_ BitVec 32))

(declare-fun mapValue!59722 () ValueCell!18413)

(declare-fun mapRest!59722 () (Array (_ BitVec 32) ValueCell!18413))

(assert (=> mapNonEmpty!59722 (= mapRest!59713 (store mapRest!59722 mapKey!59722 mapValue!59722))))

(assert (= (and mapNonEmpty!59713 condMapEmpty!59722) mapIsEmpty!59722))

(assert (= (and mapNonEmpty!59713 (not condMapEmpty!59722)) mapNonEmpty!59722))

(assert (= (and mapNonEmpty!59722 ((_ is ValueCellFull!18413) mapValue!59722)) b!1567333))

(assert (= (and mapNonEmpty!59713 ((_ is ValueCellFull!18413) mapDefault!59722)) b!1567334))

(declare-fun m!1442203 () Bool)

(assert (=> mapNonEmpty!59722 m!1442203))

(check-sat (not b!1567313) (not bm!72008) (not bm!72011) (not b!1567326) (not b!1567310) (not b!1567325) tp_is_empty!38887 (not b!1567311) (not mapNonEmpty!59722))
(check-sat)
