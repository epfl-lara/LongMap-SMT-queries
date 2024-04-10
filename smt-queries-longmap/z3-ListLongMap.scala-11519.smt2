; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134090 () Bool)

(assert start!134090)

(declare-fun b_free!32217 () Bool)

(declare-fun b_next!32217 () Bool)

(assert (=> start!134090 (= b_free!32217 (not b_next!32217))))

(declare-fun tp!113969 () Bool)

(declare-fun b_and!51861 () Bool)

(assert (=> start!134090 (= tp!113969 b_and!51861)))

(declare-fun mapNonEmpty!59895 () Bool)

(declare-fun mapRes!59895 () Bool)

(declare-fun tp!113970 () Bool)

(declare-fun e!873606 () Bool)

(assert (=> mapNonEmpty!59895 (= mapRes!59895 (and tp!113970 e!873606))))

(declare-datatypes ((V!60203 0))(
  ( (V!60204 (val!19582 Int)) )
))
(declare-datatypes ((ValueCell!18468 0))(
  ( (ValueCellFull!18468 (v!22341 V!60203)) (EmptyCell!18468) )
))
(declare-fun mapValue!59895 () ValueCell!18468)

(declare-fun mapRest!59895 () (Array (_ BitVec 32) ValueCell!18468))

(declare-fun mapKey!59895 () (_ BitVec 32))

(declare-datatypes ((array!104682 0))(
  ( (array!104683 (arr!50526 (Array (_ BitVec 32) ValueCell!18468)) (size!51076 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104682)

(assert (=> mapNonEmpty!59895 (= (arr!50526 _values!487) (store mapRest!59895 mapKey!59895 mapValue!59895))))

(declare-fun b!1567218 () Bool)

(declare-fun e!873603 () Bool)

(declare-fun tp_is_empty!38997 () Bool)

(assert (=> b!1567218 (= e!873603 tp_is_empty!38997)))

(declare-fun b!1567219 () Bool)

(declare-fun e!873605 () Bool)

(declare-datatypes ((array!104684 0))(
  ( (array!104685 (arr!50527 (Array (_ BitVec 32) (_ BitVec 64))) (size!51077 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104684)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1567219 (= e!873605 (bvsge (bvsub (size!51077 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51077 _keys!637)) from!782)))))

(declare-fun b!1567220 () Bool)

(declare-fun res!1071136 () Bool)

(declare-fun e!873607 () Bool)

(assert (=> b!1567220 (=> (not res!1071136) (not e!873607))))

(declare-datatypes ((List!36652 0))(
  ( (Nil!36649) (Cons!36648 (h!38095 (_ BitVec 64)) (t!51556 List!36652)) )
))
(declare-fun arrayNoDuplicates!0 (array!104684 (_ BitVec 32) List!36652) Bool)

(assert (=> b!1567220 (= res!1071136 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36649))))

(declare-fun b!1567221 () Bool)

(declare-fun res!1071129 () Bool)

(assert (=> b!1567221 (=> (not res!1071129) (not e!873607))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104684 (_ BitVec 32)) Bool)

(assert (=> b!1567221 (= res!1071129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567222 () Bool)

(assert (=> b!1567222 (= e!873607 e!873605)))

(declare-fun res!1071135 () Bool)

(assert (=> b!1567222 (=> (not res!1071135) (not e!873605))))

(declare-datatypes ((tuple2!25266 0))(
  ( (tuple2!25267 (_1!12644 (_ BitVec 64)) (_2!12644 V!60203)) )
))
(declare-datatypes ((List!36653 0))(
  ( (Nil!36650) (Cons!36649 (h!38096 tuple2!25266) (t!51557 List!36653)) )
))
(declare-datatypes ((ListLongMap!22701 0))(
  ( (ListLongMap!22702 (toList!11366 List!36653)) )
))
(declare-fun lt!672881 () ListLongMap!22701)

(declare-fun contains!10360 (ListLongMap!22701 (_ BitVec 64)) Bool)

(assert (=> b!1567222 (= res!1071135 (not (contains!10360 lt!672881 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60203)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60203)

(declare-fun getCurrentListMapNoExtraKeys!6731 (array!104684 array!104682 (_ BitVec 32) (_ BitVec 32) V!60203 V!60203 (_ BitVec 32) Int) ListLongMap!22701)

(assert (=> b!1567222 (= lt!672881 (getCurrentListMapNoExtraKeys!6731 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567223 () Bool)

(declare-fun res!1071130 () Bool)

(assert (=> b!1567223 (=> (not res!1071130) (not e!873605))))

(assert (=> b!1567223 (= res!1071130 (not (contains!10360 lt!672881 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567224 () Bool)

(declare-fun res!1071133 () Bool)

(assert (=> b!1567224 (=> (not res!1071133) (not e!873607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567224 (= res!1071133 (not (validKeyInArray!0 (select (arr!50527 _keys!637) from!782))))))

(declare-fun res!1071131 () Bool)

(assert (=> start!134090 (=> (not res!1071131) (not e!873607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134090 (= res!1071131 (validMask!0 mask!947))))

(assert (=> start!134090 e!873607))

(assert (=> start!134090 tp!113969))

(assert (=> start!134090 tp_is_empty!38997))

(assert (=> start!134090 true))

(declare-fun array_inv!39257 (array!104684) Bool)

(assert (=> start!134090 (array_inv!39257 _keys!637)))

(declare-fun e!873604 () Bool)

(declare-fun array_inv!39258 (array!104682) Bool)

(assert (=> start!134090 (and (array_inv!39258 _values!487) e!873604)))

(declare-fun b!1567225 () Bool)

(declare-fun res!1071134 () Bool)

(assert (=> b!1567225 (=> (not res!1071134) (not e!873607))))

(assert (=> b!1567225 (= res!1071134 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51077 _keys!637)) (bvslt from!782 (size!51077 _keys!637))))))

(declare-fun b!1567226 () Bool)

(declare-fun res!1071132 () Bool)

(assert (=> b!1567226 (=> (not res!1071132) (not e!873607))))

(assert (=> b!1567226 (= res!1071132 (and (= (size!51076 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51077 _keys!637) (size!51076 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567227 () Bool)

(assert (=> b!1567227 (= e!873606 tp_is_empty!38997)))

(declare-fun b!1567228 () Bool)

(assert (=> b!1567228 (= e!873604 (and e!873603 mapRes!59895))))

(declare-fun condMapEmpty!59895 () Bool)

(declare-fun mapDefault!59895 () ValueCell!18468)

(assert (=> b!1567228 (= condMapEmpty!59895 (= (arr!50526 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18468)) mapDefault!59895)))))

(declare-fun mapIsEmpty!59895 () Bool)

(assert (=> mapIsEmpty!59895 mapRes!59895))

(assert (= (and start!134090 res!1071131) b!1567226))

(assert (= (and b!1567226 res!1071132) b!1567221))

(assert (= (and b!1567221 res!1071129) b!1567220))

(assert (= (and b!1567220 res!1071136) b!1567225))

(assert (= (and b!1567225 res!1071134) b!1567224))

(assert (= (and b!1567224 res!1071133) b!1567222))

(assert (= (and b!1567222 res!1071135) b!1567223))

(assert (= (and b!1567223 res!1071130) b!1567219))

(assert (= (and b!1567228 condMapEmpty!59895) mapIsEmpty!59895))

(assert (= (and b!1567228 (not condMapEmpty!59895)) mapNonEmpty!59895))

(get-info :version)

(assert (= (and mapNonEmpty!59895 ((_ is ValueCellFull!18468) mapValue!59895)) b!1567227))

(assert (= (and b!1567228 ((_ is ValueCellFull!18468) mapDefault!59895)) b!1567218))

(assert (= start!134090 b!1567228))

(declare-fun m!1442133 () Bool)

(assert (=> mapNonEmpty!59895 m!1442133))

(declare-fun m!1442135 () Bool)

(assert (=> b!1567220 m!1442135))

(declare-fun m!1442137 () Bool)

(assert (=> b!1567223 m!1442137))

(declare-fun m!1442139 () Bool)

(assert (=> b!1567221 m!1442139))

(declare-fun m!1442141 () Bool)

(assert (=> b!1567224 m!1442141))

(assert (=> b!1567224 m!1442141))

(declare-fun m!1442143 () Bool)

(assert (=> b!1567224 m!1442143))

(declare-fun m!1442145 () Bool)

(assert (=> b!1567222 m!1442145))

(declare-fun m!1442147 () Bool)

(assert (=> b!1567222 m!1442147))

(declare-fun m!1442149 () Bool)

(assert (=> start!134090 m!1442149))

(declare-fun m!1442151 () Bool)

(assert (=> start!134090 m!1442151))

(declare-fun m!1442153 () Bool)

(assert (=> start!134090 m!1442153))

(check-sat (not b!1567221) tp_is_empty!38997 (not b!1567223) (not b!1567224) (not b!1567220) (not mapNonEmpty!59895) (not b_next!32217) (not b!1567222) b_and!51861 (not start!134090))
(check-sat b_and!51861 (not b_next!32217))
(get-model)

(declare-fun d!163549 () Bool)

(assert (=> d!163549 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134090 d!163549))

(declare-fun d!163551 () Bool)

(assert (=> d!163551 (= (array_inv!39257 _keys!637) (bvsge (size!51077 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134090 d!163551))

(declare-fun d!163553 () Bool)

(assert (=> d!163553 (= (array_inv!39258 _values!487) (bvsge (size!51076 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134090 d!163553))

(declare-fun d!163555 () Bool)

(declare-fun res!1071169 () Bool)

(declare-fun e!873634 () Bool)

(assert (=> d!163555 (=> res!1071169 e!873634)))

(assert (=> d!163555 (= res!1071169 (bvsge #b00000000000000000000000000000000 (size!51077 _keys!637)))))

(assert (=> d!163555 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36649) e!873634)))

(declare-fun bm!71921 () Bool)

(declare-fun call!71924 () Bool)

(declare-fun c!144466 () Bool)

(assert (=> bm!71921 (= call!71924 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144466 (Cons!36648 (select (arr!50527 _keys!637) #b00000000000000000000000000000000) Nil!36649) Nil!36649)))))

(declare-fun b!1567272 () Bool)

(declare-fun e!873635 () Bool)

(assert (=> b!1567272 (= e!873635 call!71924)))

(declare-fun b!1567273 () Bool)

(declare-fun e!873636 () Bool)

(assert (=> b!1567273 (= e!873634 e!873636)))

(declare-fun res!1071168 () Bool)

(assert (=> b!1567273 (=> (not res!1071168) (not e!873636))))

(declare-fun e!873637 () Bool)

(assert (=> b!1567273 (= res!1071168 (not e!873637))))

(declare-fun res!1071167 () Bool)

(assert (=> b!1567273 (=> (not res!1071167) (not e!873637))))

(assert (=> b!1567273 (= res!1071167 (validKeyInArray!0 (select (arr!50527 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567274 () Bool)

(assert (=> b!1567274 (= e!873635 call!71924)))

(declare-fun b!1567275 () Bool)

(declare-fun contains!10362 (List!36652 (_ BitVec 64)) Bool)

(assert (=> b!1567275 (= e!873637 (contains!10362 Nil!36649 (select (arr!50527 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567276 () Bool)

(assert (=> b!1567276 (= e!873636 e!873635)))

(assert (=> b!1567276 (= c!144466 (validKeyInArray!0 (select (arr!50527 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163555 (not res!1071169)) b!1567273))

(assert (= (and b!1567273 res!1071167) b!1567275))

(assert (= (and b!1567273 res!1071168) b!1567276))

(assert (= (and b!1567276 c!144466) b!1567272))

(assert (= (and b!1567276 (not c!144466)) b!1567274))

(assert (= (or b!1567272 b!1567274) bm!71921))

(declare-fun m!1442177 () Bool)

(assert (=> bm!71921 m!1442177))

(declare-fun m!1442179 () Bool)

(assert (=> bm!71921 m!1442179))

(assert (=> b!1567273 m!1442177))

(assert (=> b!1567273 m!1442177))

(declare-fun m!1442181 () Bool)

(assert (=> b!1567273 m!1442181))

(assert (=> b!1567275 m!1442177))

(assert (=> b!1567275 m!1442177))

(declare-fun m!1442183 () Bool)

(assert (=> b!1567275 m!1442183))

(assert (=> b!1567276 m!1442177))

(assert (=> b!1567276 m!1442177))

(assert (=> b!1567276 m!1442181))

(assert (=> b!1567220 d!163555))

(declare-fun d!163557 () Bool)

(assert (=> d!163557 (= (validKeyInArray!0 (select (arr!50527 _keys!637) from!782)) (and (not (= (select (arr!50527 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50527 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567224 d!163557))

(declare-fun d!163559 () Bool)

(declare-fun e!873643 () Bool)

(assert (=> d!163559 e!873643))

(declare-fun res!1071172 () Bool)

(assert (=> d!163559 (=> res!1071172 e!873643)))

(declare-fun lt!672896 () Bool)

(assert (=> d!163559 (= res!1071172 (not lt!672896))))

(declare-fun lt!672895 () Bool)

(assert (=> d!163559 (= lt!672896 lt!672895)))

(declare-datatypes ((Unit!52055 0))(
  ( (Unit!52056) )
))
(declare-fun lt!672893 () Unit!52055)

(declare-fun e!873642 () Unit!52055)

(assert (=> d!163559 (= lt!672893 e!873642)))

(declare-fun c!144469 () Bool)

(assert (=> d!163559 (= c!144469 lt!672895)))

(declare-fun containsKey!852 (List!36653 (_ BitVec 64)) Bool)

(assert (=> d!163559 (= lt!672895 (containsKey!852 (toList!11366 lt!672881) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163559 (= (contains!10360 lt!672881 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672896)))

(declare-fun b!1567283 () Bool)

(declare-fun lt!672894 () Unit!52055)

(assert (=> b!1567283 (= e!873642 lt!672894)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!535 (List!36653 (_ BitVec 64)) Unit!52055)

(assert (=> b!1567283 (= lt!672894 (lemmaContainsKeyImpliesGetValueByKeyDefined!535 (toList!11366 lt!672881) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!870 0))(
  ( (Some!869 (v!22343 V!60203)) (None!868) )
))
(declare-fun isDefined!583 (Option!870) Bool)

(declare-fun getValueByKey!794 (List!36653 (_ BitVec 64)) Option!870)

(assert (=> b!1567283 (isDefined!583 (getValueByKey!794 (toList!11366 lt!672881) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567284 () Bool)

(declare-fun Unit!52057 () Unit!52055)

(assert (=> b!1567284 (= e!873642 Unit!52057)))

(declare-fun b!1567285 () Bool)

(assert (=> b!1567285 (= e!873643 (isDefined!583 (getValueByKey!794 (toList!11366 lt!672881) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163559 c!144469) b!1567283))

(assert (= (and d!163559 (not c!144469)) b!1567284))

(assert (= (and d!163559 (not res!1071172)) b!1567285))

(declare-fun m!1442185 () Bool)

(assert (=> d!163559 m!1442185))

(declare-fun m!1442187 () Bool)

(assert (=> b!1567283 m!1442187))

(declare-fun m!1442189 () Bool)

(assert (=> b!1567283 m!1442189))

(assert (=> b!1567283 m!1442189))

(declare-fun m!1442191 () Bool)

(assert (=> b!1567283 m!1442191))

(assert (=> b!1567285 m!1442189))

(assert (=> b!1567285 m!1442189))

(assert (=> b!1567285 m!1442191))

(assert (=> b!1567222 d!163559))

(declare-fun b!1567310 () Bool)

(declare-fun e!873664 () Bool)

(declare-fun lt!672917 () ListLongMap!22701)

(declare-fun isEmpty!1149 (ListLongMap!22701) Bool)

(assert (=> b!1567310 (= e!873664 (isEmpty!1149 lt!672917))))

(declare-fun b!1567311 () Bool)

(declare-fun lt!672916 () Unit!52055)

(declare-fun lt!672914 () Unit!52055)

(assert (=> b!1567311 (= lt!672916 lt!672914)))

(declare-fun lt!672912 () (_ BitVec 64))

(declare-fun lt!672911 () ListLongMap!22701)

(declare-fun lt!672915 () V!60203)

(declare-fun lt!672913 () (_ BitVec 64))

(declare-fun +!5086 (ListLongMap!22701 tuple2!25266) ListLongMap!22701)

(assert (=> b!1567311 (not (contains!10360 (+!5086 lt!672911 (tuple2!25267 lt!672912 lt!672915)) lt!672913))))

(declare-fun addStillNotContains!576 (ListLongMap!22701 (_ BitVec 64) V!60203 (_ BitVec 64)) Unit!52055)

(assert (=> b!1567311 (= lt!672914 (addStillNotContains!576 lt!672911 lt!672912 lt!672915 lt!672913))))

(assert (=> b!1567311 (= lt!672913 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!26378 (ValueCell!18468 V!60203) V!60203)

(declare-fun dynLambda!3870 (Int (_ BitVec 64)) V!60203)

(assert (=> b!1567311 (= lt!672915 (get!26378 (select (arr!50526 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3870 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1567311 (= lt!672912 (select (arr!50527 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(declare-fun call!71927 () ListLongMap!22701)

(assert (=> b!1567311 (= lt!672911 call!71927)))

(declare-fun e!873658 () ListLongMap!22701)

(assert (=> b!1567311 (= e!873658 (+!5086 call!71927 (tuple2!25267 (select (arr!50527 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26378 (select (arr!50526 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3870 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1567312 () Bool)

(declare-fun e!873662 () Bool)

(assert (=> b!1567312 (= e!873662 (validKeyInArray!0 (select (arr!50527 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567312 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun b!1567313 () Bool)

(assert (=> b!1567313 (= e!873658 call!71927)))

(declare-fun b!1567314 () Bool)

(declare-fun e!873663 () Bool)

(declare-fun e!873659 () Bool)

(assert (=> b!1567314 (= e!873663 e!873659)))

(declare-fun c!144479 () Bool)

(assert (=> b!1567314 (= c!144479 e!873662)))

(declare-fun res!1071182 () Bool)

(assert (=> b!1567314 (=> (not res!1071182) (not e!873662))))

(assert (=> b!1567314 (= res!1071182 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51077 _keys!637)))))

(declare-fun b!1567315 () Bool)

(declare-fun e!873661 () ListLongMap!22701)

(assert (=> b!1567315 (= e!873661 e!873658)))

(declare-fun c!144480 () Bool)

(assert (=> b!1567315 (= c!144480 (validKeyInArray!0 (select (arr!50527 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun d!163561 () Bool)

(assert (=> d!163561 e!873663))

(declare-fun res!1071184 () Bool)

(assert (=> d!163561 (=> (not res!1071184) (not e!873663))))

(assert (=> d!163561 (= res!1071184 (not (contains!10360 lt!672917 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163561 (= lt!672917 e!873661)))

(declare-fun c!144481 () Bool)

(assert (=> d!163561 (= c!144481 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51077 _keys!637)))))

(assert (=> d!163561 (validMask!0 mask!947)))

(assert (=> d!163561 (= (getCurrentListMapNoExtraKeys!6731 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!672917)))

(declare-fun b!1567316 () Bool)

(assert (=> b!1567316 (= e!873661 (ListLongMap!22702 Nil!36650))))

(declare-fun b!1567317 () Bool)

(assert (=> b!1567317 (= e!873659 e!873664)))

(declare-fun c!144478 () Bool)

(assert (=> b!1567317 (= c!144478 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51077 _keys!637)))))

(declare-fun b!1567318 () Bool)

(assert (=> b!1567318 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51077 _keys!637)))))

(assert (=> b!1567318 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51076 _values!487)))))

(declare-fun e!873660 () Bool)

(declare-fun apply!1120 (ListLongMap!22701 (_ BitVec 64)) V!60203)

(assert (=> b!1567318 (= e!873660 (= (apply!1120 lt!672917 (select (arr!50527 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26378 (select (arr!50526 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3870 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!71924 () Bool)

(assert (=> bm!71924 (= call!71927 (getCurrentListMapNoExtraKeys!6731 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1567319 () Bool)

(assert (=> b!1567319 (= e!873659 e!873660)))

(assert (=> b!1567319 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51077 _keys!637)))))

(declare-fun res!1071181 () Bool)

(assert (=> b!1567319 (= res!1071181 (contains!10360 lt!672917 (select (arr!50527 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567319 (=> (not res!1071181) (not e!873660))))

(declare-fun b!1567320 () Bool)

(declare-fun res!1071183 () Bool)

(assert (=> b!1567320 (=> (not res!1071183) (not e!873663))))

(assert (=> b!1567320 (= res!1071183 (not (contains!10360 lt!672917 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567321 () Bool)

(assert (=> b!1567321 (= e!873664 (= lt!672917 (getCurrentListMapNoExtraKeys!6731 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(assert (= (and d!163561 c!144481) b!1567316))

(assert (= (and d!163561 (not c!144481)) b!1567315))

(assert (= (and b!1567315 c!144480) b!1567311))

(assert (= (and b!1567315 (not c!144480)) b!1567313))

(assert (= (or b!1567311 b!1567313) bm!71924))

(assert (= (and d!163561 res!1071184) b!1567320))

(assert (= (and b!1567320 res!1071183) b!1567314))

(assert (= (and b!1567314 res!1071182) b!1567312))

(assert (= (and b!1567314 c!144479) b!1567319))

(assert (= (and b!1567314 (not c!144479)) b!1567317))

(assert (= (and b!1567319 res!1071181) b!1567318))

(assert (= (and b!1567317 c!144478) b!1567321))

(assert (= (and b!1567317 (not c!144478)) b!1567310))

(declare-fun b_lambda!25031 () Bool)

(assert (=> (not b_lambda!25031) (not b!1567311)))

(declare-fun t!51561 () Bool)

(declare-fun tb!12659 () Bool)

(assert (=> (and start!134090 (= defaultEntry!495 defaultEntry!495) t!51561) tb!12659))

(declare-fun result!26613 () Bool)

(assert (=> tb!12659 (= result!26613 tp_is_empty!38997)))

(assert (=> b!1567311 t!51561))

(declare-fun b_and!51865 () Bool)

(assert (= b_and!51861 (and (=> t!51561 result!26613) b_and!51865)))

(declare-fun b_lambda!25033 () Bool)

(assert (=> (not b_lambda!25033) (not b!1567318)))

(assert (=> b!1567318 t!51561))

(declare-fun b_and!51867 () Bool)

(assert (= b_and!51865 (and (=> t!51561 result!26613) b_and!51867)))

(declare-fun m!1442193 () Bool)

(assert (=> b!1567315 m!1442193))

(assert (=> b!1567315 m!1442193))

(declare-fun m!1442195 () Bool)

(assert (=> b!1567315 m!1442195))

(declare-fun m!1442197 () Bool)

(assert (=> b!1567310 m!1442197))

(declare-fun m!1442199 () Bool)

(assert (=> b!1567311 m!1442199))

(declare-fun m!1442201 () Bool)

(assert (=> b!1567311 m!1442201))

(declare-fun m!1442203 () Bool)

(assert (=> b!1567311 m!1442203))

(assert (=> b!1567311 m!1442199))

(declare-fun m!1442205 () Bool)

(assert (=> b!1567311 m!1442205))

(declare-fun m!1442207 () Bool)

(assert (=> b!1567311 m!1442207))

(assert (=> b!1567311 m!1442193))

(declare-fun m!1442209 () Bool)

(assert (=> b!1567311 m!1442209))

(assert (=> b!1567311 m!1442201))

(declare-fun m!1442211 () Bool)

(assert (=> b!1567311 m!1442211))

(assert (=> b!1567311 m!1442203))

(declare-fun m!1442213 () Bool)

(assert (=> d!163561 m!1442213))

(assert (=> d!163561 m!1442149))

(assert (=> b!1567318 m!1442199))

(assert (=> b!1567318 m!1442203))

(assert (=> b!1567318 m!1442199))

(assert (=> b!1567318 m!1442205))

(assert (=> b!1567318 m!1442193))

(declare-fun m!1442215 () Bool)

(assert (=> b!1567318 m!1442215))

(assert (=> b!1567318 m!1442193))

(assert (=> b!1567318 m!1442203))

(assert (=> b!1567312 m!1442193))

(assert (=> b!1567312 m!1442193))

(assert (=> b!1567312 m!1442195))

(declare-fun m!1442217 () Bool)

(assert (=> bm!71924 m!1442217))

(assert (=> b!1567319 m!1442193))

(assert (=> b!1567319 m!1442193))

(declare-fun m!1442219 () Bool)

(assert (=> b!1567319 m!1442219))

(assert (=> b!1567321 m!1442217))

(declare-fun m!1442221 () Bool)

(assert (=> b!1567320 m!1442221))

(assert (=> b!1567222 d!163561))

(declare-fun d!163563 () Bool)

(declare-fun e!873666 () Bool)

(assert (=> d!163563 e!873666))

(declare-fun res!1071185 () Bool)

(assert (=> d!163563 (=> res!1071185 e!873666)))

(declare-fun lt!672921 () Bool)

(assert (=> d!163563 (= res!1071185 (not lt!672921))))

(declare-fun lt!672920 () Bool)

(assert (=> d!163563 (= lt!672921 lt!672920)))

(declare-fun lt!672918 () Unit!52055)

(declare-fun e!873665 () Unit!52055)

(assert (=> d!163563 (= lt!672918 e!873665)))

(declare-fun c!144482 () Bool)

(assert (=> d!163563 (= c!144482 lt!672920)))

(assert (=> d!163563 (= lt!672920 (containsKey!852 (toList!11366 lt!672881) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163563 (= (contains!10360 lt!672881 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672921)))

(declare-fun b!1567324 () Bool)

(declare-fun lt!672919 () Unit!52055)

(assert (=> b!1567324 (= e!873665 lt!672919)))

(assert (=> b!1567324 (= lt!672919 (lemmaContainsKeyImpliesGetValueByKeyDefined!535 (toList!11366 lt!672881) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1567324 (isDefined!583 (getValueByKey!794 (toList!11366 lt!672881) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567325 () Bool)

(declare-fun Unit!52058 () Unit!52055)

(assert (=> b!1567325 (= e!873665 Unit!52058)))

(declare-fun b!1567326 () Bool)

(assert (=> b!1567326 (= e!873666 (isDefined!583 (getValueByKey!794 (toList!11366 lt!672881) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163563 c!144482) b!1567324))

(assert (= (and d!163563 (not c!144482)) b!1567325))

(assert (= (and d!163563 (not res!1071185)) b!1567326))

(declare-fun m!1442223 () Bool)

(assert (=> d!163563 m!1442223))

(declare-fun m!1442225 () Bool)

(assert (=> b!1567324 m!1442225))

(declare-fun m!1442227 () Bool)

(assert (=> b!1567324 m!1442227))

(assert (=> b!1567324 m!1442227))

(declare-fun m!1442229 () Bool)

(assert (=> b!1567324 m!1442229))

(assert (=> b!1567326 m!1442227))

(assert (=> b!1567326 m!1442227))

(assert (=> b!1567326 m!1442229))

(assert (=> b!1567223 d!163563))

(declare-fun bm!71927 () Bool)

(declare-fun call!71930 () Bool)

(assert (=> bm!71927 (= call!71930 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun d!163565 () Bool)

(declare-fun res!1071190 () Bool)

(declare-fun e!873674 () Bool)

(assert (=> d!163565 (=> res!1071190 e!873674)))

(assert (=> d!163565 (= res!1071190 (bvsge #b00000000000000000000000000000000 (size!51077 _keys!637)))))

(assert (=> d!163565 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873674)))

(declare-fun b!1567335 () Bool)

(declare-fun e!873673 () Bool)

(assert (=> b!1567335 (= e!873673 call!71930)))

(declare-fun b!1567336 () Bool)

(assert (=> b!1567336 (= e!873674 e!873673)))

(declare-fun c!144485 () Bool)

(assert (=> b!1567336 (= c!144485 (validKeyInArray!0 (select (arr!50527 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567337 () Bool)

(declare-fun e!873675 () Bool)

(assert (=> b!1567337 (= e!873675 call!71930)))

(declare-fun b!1567338 () Bool)

(assert (=> b!1567338 (= e!873673 e!873675)))

(declare-fun lt!672929 () (_ BitVec 64))

(assert (=> b!1567338 (= lt!672929 (select (arr!50527 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!672930 () Unit!52055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104684 (_ BitVec 64) (_ BitVec 32)) Unit!52055)

(assert (=> b!1567338 (= lt!672930 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672929 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1567338 (arrayContainsKey!0 _keys!637 lt!672929 #b00000000000000000000000000000000)))

(declare-fun lt!672928 () Unit!52055)

(assert (=> b!1567338 (= lt!672928 lt!672930)))

(declare-fun res!1071191 () Bool)

(declare-datatypes ((SeekEntryResult!13528 0))(
  ( (MissingZero!13528 (index!56510 (_ BitVec 32))) (Found!13528 (index!56511 (_ BitVec 32))) (Intermediate!13528 (undefined!14340 Bool) (index!56512 (_ BitVec 32)) (x!140823 (_ BitVec 32))) (Undefined!13528) (MissingVacant!13528 (index!56513 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104684 (_ BitVec 32)) SeekEntryResult!13528)

(assert (=> b!1567338 (= res!1071191 (= (seekEntryOrOpen!0 (select (arr!50527 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13528 #b00000000000000000000000000000000)))))

(assert (=> b!1567338 (=> (not res!1071191) (not e!873675))))

(assert (= (and d!163565 (not res!1071190)) b!1567336))

(assert (= (and b!1567336 c!144485) b!1567338))

(assert (= (and b!1567336 (not c!144485)) b!1567335))

(assert (= (and b!1567338 res!1071191) b!1567337))

(assert (= (or b!1567337 b!1567335) bm!71927))

(declare-fun m!1442231 () Bool)

(assert (=> bm!71927 m!1442231))

(assert (=> b!1567336 m!1442177))

(assert (=> b!1567336 m!1442177))

(assert (=> b!1567336 m!1442181))

(assert (=> b!1567338 m!1442177))

(declare-fun m!1442233 () Bool)

(assert (=> b!1567338 m!1442233))

(declare-fun m!1442235 () Bool)

(assert (=> b!1567338 m!1442235))

(assert (=> b!1567338 m!1442177))

(declare-fun m!1442237 () Bool)

(assert (=> b!1567338 m!1442237))

(assert (=> b!1567221 d!163565))

(declare-fun condMapEmpty!59901 () Bool)

(declare-fun mapDefault!59901 () ValueCell!18468)

(assert (=> mapNonEmpty!59895 (= condMapEmpty!59901 (= mapRest!59895 ((as const (Array (_ BitVec 32) ValueCell!18468)) mapDefault!59901)))))

(declare-fun e!873681 () Bool)

(declare-fun mapRes!59901 () Bool)

(assert (=> mapNonEmpty!59895 (= tp!113970 (and e!873681 mapRes!59901))))

(declare-fun mapNonEmpty!59901 () Bool)

(declare-fun tp!113979 () Bool)

(declare-fun e!873680 () Bool)

(assert (=> mapNonEmpty!59901 (= mapRes!59901 (and tp!113979 e!873680))))

(declare-fun mapRest!59901 () (Array (_ BitVec 32) ValueCell!18468))

(declare-fun mapKey!59901 () (_ BitVec 32))

(declare-fun mapValue!59901 () ValueCell!18468)

(assert (=> mapNonEmpty!59901 (= mapRest!59895 (store mapRest!59901 mapKey!59901 mapValue!59901))))

(declare-fun b!1567346 () Bool)

(assert (=> b!1567346 (= e!873681 tp_is_empty!38997)))

(declare-fun b!1567345 () Bool)

(assert (=> b!1567345 (= e!873680 tp_is_empty!38997)))

(declare-fun mapIsEmpty!59901 () Bool)

(assert (=> mapIsEmpty!59901 mapRes!59901))

(assert (= (and mapNonEmpty!59895 condMapEmpty!59901) mapIsEmpty!59901))

(assert (= (and mapNonEmpty!59895 (not condMapEmpty!59901)) mapNonEmpty!59901))

(assert (= (and mapNonEmpty!59901 ((_ is ValueCellFull!18468) mapValue!59901)) b!1567345))

(assert (= (and mapNonEmpty!59895 ((_ is ValueCellFull!18468) mapDefault!59901)) b!1567346))

(declare-fun m!1442239 () Bool)

(assert (=> mapNonEmpty!59901 m!1442239))

(declare-fun b_lambda!25035 () Bool)

(assert (= b_lambda!25031 (or (and start!134090 b_free!32217) b_lambda!25035)))

(declare-fun b_lambda!25037 () Bool)

(assert (= b_lambda!25033 (or (and start!134090 b_free!32217) b_lambda!25037)))

(check-sat (not b!1567326) (not bm!71921) (not b!1567273) (not d!163561) (not b!1567324) (not b!1567311) (not b!1567283) (not b!1567336) (not b!1567338) (not b!1567319) (not bm!71924) tp_is_empty!38997 (not b!1567276) b_and!51867 (not b!1567310) (not bm!71927) (not mapNonEmpty!59901) (not b_next!32217) (not b!1567285) (not b_lambda!25037) (not d!163563) (not b!1567275) (not b!1567320) (not b!1567312) (not b!1567318) (not b_lambda!25035) (not b!1567321) (not b!1567315) (not d!163559))
(check-sat b_and!51867 (not b_next!32217))
