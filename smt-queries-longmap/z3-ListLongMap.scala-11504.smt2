; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134282 () Bool)

(assert start!134282)

(declare-fun b_free!32131 () Bool)

(declare-fun b_next!32131 () Bool)

(assert (=> start!134282 (= b_free!32131 (not b_next!32131))))

(declare-fun tp!113689 () Bool)

(declare-fun b_and!51703 () Bool)

(assert (=> start!134282 (= tp!113689 b_and!51703)))

(declare-fun b!1567517 () Bool)

(declare-fun res!1070778 () Bool)

(declare-fun e!873858 () Bool)

(assert (=> b!1567517 (=> (not res!1070778) (not e!873858))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104620 0))(
  ( (array!104621 (arr!50492 (Array (_ BitVec 32) (_ BitVec 64))) (size!51043 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104620)

(declare-datatypes ((V!60081 0))(
  ( (V!60082 (val!19536 Int)) )
))
(declare-datatypes ((ValueCell!18422 0))(
  ( (ValueCellFull!18422 (v!22282 V!60081)) (EmptyCell!18422) )
))
(declare-datatypes ((array!104622 0))(
  ( (array!104623 (arr!50493 (Array (_ BitVec 32) ValueCell!18422)) (size!51044 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104622)

(assert (=> b!1567517 (= res!1070778 (and (= (size!51044 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51043 _keys!637) (size!51044 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567518 () Bool)

(declare-fun res!1070776 () Bool)

(assert (=> b!1567518 (=> (not res!1070776) (not e!873858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104620 (_ BitVec 32)) Bool)

(assert (=> b!1567518 (= res!1070776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567519 () Bool)

(declare-fun e!873860 () Bool)

(declare-fun e!873857 () Bool)

(declare-fun mapRes!59743 () Bool)

(assert (=> b!1567519 (= e!873860 (and e!873857 mapRes!59743))))

(declare-fun condMapEmpty!59743 () Bool)

(declare-fun mapDefault!59743 () ValueCell!18422)

(assert (=> b!1567519 (= condMapEmpty!59743 (= (arr!50493 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18422)) mapDefault!59743)))))

(declare-fun b!1567520 () Bool)

(declare-fun res!1070774 () Bool)

(assert (=> b!1567520 (=> (not res!1070774) (not e!873858))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1567520 (= res!1070774 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51043 _keys!637)) (bvslt from!782 (size!51043 _keys!637))))))

(declare-fun res!1070775 () Bool)

(assert (=> start!134282 (=> (not res!1070775) (not e!873858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134282 (= res!1070775 (validMask!0 mask!947))))

(assert (=> start!134282 e!873858))

(assert (=> start!134282 tp!113689))

(declare-fun tp_is_empty!38905 () Bool)

(assert (=> start!134282 tp_is_empty!38905))

(assert (=> start!134282 true))

(declare-fun array_inv!39481 (array!104620) Bool)

(assert (=> start!134282 (array_inv!39481 _keys!637)))

(declare-fun array_inv!39482 (array!104622) Bool)

(assert (=> start!134282 (and (array_inv!39482 _values!487) e!873860)))

(declare-fun b!1567521 () Bool)

(declare-fun res!1070773 () Bool)

(assert (=> b!1567521 (=> (not res!1070773) (not e!873858))))

(declare-datatypes ((List!36623 0))(
  ( (Nil!36620) (Cons!36619 (h!38083 (_ BitVec 64)) (t!51462 List!36623)) )
))
(declare-fun arrayNoDuplicates!0 (array!104620 (_ BitVec 32) List!36623) Bool)

(assert (=> b!1567521 (= res!1070773 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36620))))

(declare-fun b!1567522 () Bool)

(assert (=> b!1567522 (= e!873857 tp_is_empty!38905)))

(declare-fun mapIsEmpty!59743 () Bool)

(assert (=> mapIsEmpty!59743 mapRes!59743))

(declare-fun b!1567523 () Bool)

(declare-fun res!1070772 () Bool)

(assert (=> b!1567523 (=> (not res!1070772) (not e!873858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567523 (= res!1070772 (validKeyInArray!0 (select (arr!50492 _keys!637) from!782)))))

(declare-fun b!1567524 () Bool)

(declare-fun e!873862 () Bool)

(assert (=> b!1567524 (= e!873858 e!873862)))

(declare-fun res!1070777 () Bool)

(assert (=> b!1567524 (=> res!1070777 e!873862)))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60081)

(declare-fun minValue!453 () V!60081)

(declare-datatypes ((tuple2!25258 0))(
  ( (tuple2!25259 (_1!12640 (_ BitVec 64)) (_2!12640 V!60081)) )
))
(declare-datatypes ((List!36624 0))(
  ( (Nil!36621) (Cons!36620 (h!38084 tuple2!25258) (t!51463 List!36624)) )
))
(declare-datatypes ((ListLongMap!22701 0))(
  ( (ListLongMap!22702 (toList!11366 List!36624)) )
))
(declare-fun contains!10366 (ListLongMap!22701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6749 (array!104620 array!104622 (_ BitVec 32) (_ BitVec 32) V!60081 V!60081 (_ BitVec 32) Int) ListLongMap!22701)

(assert (=> b!1567524 (= res!1070777 (contains!10366 (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567525 () Bool)

(assert (=> b!1567525 (= e!873862 (= (select (arr!50492 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59743 () Bool)

(declare-fun tp!113688 () Bool)

(declare-fun e!873859 () Bool)

(assert (=> mapNonEmpty!59743 (= mapRes!59743 (and tp!113688 e!873859))))

(declare-fun mapKey!59743 () (_ BitVec 32))

(declare-fun mapValue!59743 () ValueCell!18422)

(declare-fun mapRest!59743 () (Array (_ BitVec 32) ValueCell!18422))

(assert (=> mapNonEmpty!59743 (= (arr!50493 _values!487) (store mapRest!59743 mapKey!59743 mapValue!59743))))

(declare-fun b!1567526 () Bool)

(assert (=> b!1567526 (= e!873859 tp_is_empty!38905)))

(assert (= (and start!134282 res!1070775) b!1567517))

(assert (= (and b!1567517 res!1070778) b!1567518))

(assert (= (and b!1567518 res!1070776) b!1567521))

(assert (= (and b!1567521 res!1070773) b!1567520))

(assert (= (and b!1567520 res!1070774) b!1567523))

(assert (= (and b!1567523 res!1070772) b!1567524))

(assert (= (and b!1567524 (not res!1070777)) b!1567525))

(assert (= (and b!1567519 condMapEmpty!59743) mapIsEmpty!59743))

(assert (= (and b!1567519 (not condMapEmpty!59743)) mapNonEmpty!59743))

(get-info :version)

(assert (= (and mapNonEmpty!59743 ((_ is ValueCellFull!18422) mapValue!59743)) b!1567526))

(assert (= (and b!1567519 ((_ is ValueCellFull!18422) mapDefault!59743)) b!1567522))

(assert (= start!134282 b!1567519))

(declare-fun m!1442313 () Bool)

(assert (=> b!1567518 m!1442313))

(declare-fun m!1442315 () Bool)

(assert (=> b!1567521 m!1442315))

(declare-fun m!1442317 () Bool)

(assert (=> b!1567525 m!1442317))

(declare-fun m!1442319 () Bool)

(assert (=> b!1567524 m!1442319))

(assert (=> b!1567524 m!1442319))

(declare-fun m!1442321 () Bool)

(assert (=> b!1567524 m!1442321))

(assert (=> b!1567523 m!1442317))

(assert (=> b!1567523 m!1442317))

(declare-fun m!1442323 () Bool)

(assert (=> b!1567523 m!1442323))

(declare-fun m!1442325 () Bool)

(assert (=> mapNonEmpty!59743 m!1442325))

(declare-fun m!1442327 () Bool)

(assert (=> start!134282 m!1442327))

(declare-fun m!1442329 () Bool)

(assert (=> start!134282 m!1442329))

(declare-fun m!1442331 () Bool)

(assert (=> start!134282 m!1442331))

(check-sat (not b!1567518) (not b_next!32131) (not mapNonEmpty!59743) b_and!51703 (not b!1567521) (not start!134282) (not b!1567523) tp_is_empty!38905 (not b!1567524))
(check-sat b_and!51703 (not b_next!32131))
(get-model)

(declare-fun b!1567597 () Bool)

(declare-fun e!873907 () Bool)

(declare-fun contains!10367 (List!36623 (_ BitVec 64)) Bool)

(assert (=> b!1567597 (= e!873907 (contains!10367 Nil!36620 (select (arr!50492 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!72014 () Bool)

(declare-fun call!72017 () Bool)

(declare-fun c!145060 () Bool)

(assert (=> bm!72014 (= call!72017 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145060 (Cons!36619 (select (arr!50492 _keys!637) #b00000000000000000000000000000000) Nil!36620) Nil!36620)))))

(declare-fun d!163859 () Bool)

(declare-fun res!1070829 () Bool)

(declare-fun e!873910 () Bool)

(assert (=> d!163859 (=> res!1070829 e!873910)))

(assert (=> d!163859 (= res!1070829 (bvsge #b00000000000000000000000000000000 (size!51043 _keys!637)))))

(assert (=> d!163859 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36620) e!873910)))

(declare-fun b!1567598 () Bool)

(declare-fun e!873908 () Bool)

(assert (=> b!1567598 (= e!873910 e!873908)))

(declare-fun res!1070827 () Bool)

(assert (=> b!1567598 (=> (not res!1070827) (not e!873908))))

(assert (=> b!1567598 (= res!1070827 (not e!873907))))

(declare-fun res!1070828 () Bool)

(assert (=> b!1567598 (=> (not res!1070828) (not e!873907))))

(assert (=> b!1567598 (= res!1070828 (validKeyInArray!0 (select (arr!50492 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567599 () Bool)

(declare-fun e!873909 () Bool)

(assert (=> b!1567599 (= e!873909 call!72017)))

(declare-fun b!1567600 () Bool)

(assert (=> b!1567600 (= e!873909 call!72017)))

(declare-fun b!1567601 () Bool)

(assert (=> b!1567601 (= e!873908 e!873909)))

(assert (=> b!1567601 (= c!145060 (validKeyInArray!0 (select (arr!50492 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163859 (not res!1070829)) b!1567598))

(assert (= (and b!1567598 res!1070828) b!1567597))

(assert (= (and b!1567598 res!1070827) b!1567601))

(assert (= (and b!1567601 c!145060) b!1567599))

(assert (= (and b!1567601 (not c!145060)) b!1567600))

(assert (= (or b!1567599 b!1567600) bm!72014))

(declare-fun m!1442373 () Bool)

(assert (=> b!1567597 m!1442373))

(assert (=> b!1567597 m!1442373))

(declare-fun m!1442375 () Bool)

(assert (=> b!1567597 m!1442375))

(assert (=> bm!72014 m!1442373))

(declare-fun m!1442377 () Bool)

(assert (=> bm!72014 m!1442377))

(assert (=> b!1567598 m!1442373))

(assert (=> b!1567598 m!1442373))

(declare-fun m!1442379 () Bool)

(assert (=> b!1567598 m!1442379))

(assert (=> b!1567601 m!1442373))

(assert (=> b!1567601 m!1442373))

(assert (=> b!1567601 m!1442379))

(assert (=> b!1567521 d!163859))

(declare-fun d!163861 () Bool)

(assert (=> d!163861 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134282 d!163861))

(declare-fun d!163863 () Bool)

(assert (=> d!163863 (= (array_inv!39481 _keys!637) (bvsge (size!51043 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134282 d!163863))

(declare-fun d!163865 () Bool)

(assert (=> d!163865 (= (array_inv!39482 _values!487) (bvsge (size!51044 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134282 d!163865))

(declare-fun bm!72017 () Bool)

(declare-fun call!72020 () Bool)

(assert (=> bm!72017 (= call!72020 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1567610 () Bool)

(declare-fun e!873917 () Bool)

(assert (=> b!1567610 (= e!873917 call!72020)))

(declare-fun b!1567611 () Bool)

(declare-fun e!873919 () Bool)

(declare-fun e!873918 () Bool)

(assert (=> b!1567611 (= e!873919 e!873918)))

(declare-fun c!145063 () Bool)

(assert (=> b!1567611 (= c!145063 (validKeyInArray!0 (select (arr!50492 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163867 () Bool)

(declare-fun res!1070834 () Bool)

(assert (=> d!163867 (=> res!1070834 e!873919)))

(assert (=> d!163867 (= res!1070834 (bvsge #b00000000000000000000000000000000 (size!51043 _keys!637)))))

(assert (=> d!163867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873919)))

(declare-fun b!1567612 () Bool)

(assert (=> b!1567612 (= e!873918 call!72020)))

(declare-fun b!1567613 () Bool)

(assert (=> b!1567613 (= e!873918 e!873917)))

(declare-fun lt!673049 () (_ BitVec 64))

(assert (=> b!1567613 (= lt!673049 (select (arr!50492 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51901 0))(
  ( (Unit!51902) )
))
(declare-fun lt!673050 () Unit!51901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104620 (_ BitVec 64) (_ BitVec 32)) Unit!51901)

(assert (=> b!1567613 (= lt!673050 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673049 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1567613 (arrayContainsKey!0 _keys!637 lt!673049 #b00000000000000000000000000000000)))

(declare-fun lt!673051 () Unit!51901)

(assert (=> b!1567613 (= lt!673051 lt!673050)))

(declare-fun res!1070835 () Bool)

(declare-datatypes ((SeekEntryResult!13472 0))(
  ( (MissingZero!13472 (index!56286 (_ BitVec 32))) (Found!13472 (index!56287 (_ BitVec 32))) (Intermediate!13472 (undefined!14284 Bool) (index!56288 (_ BitVec 32)) (x!140596 (_ BitVec 32))) (Undefined!13472) (MissingVacant!13472 (index!56289 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104620 (_ BitVec 32)) SeekEntryResult!13472)

(assert (=> b!1567613 (= res!1070835 (= (seekEntryOrOpen!0 (select (arr!50492 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13472 #b00000000000000000000000000000000)))))

(assert (=> b!1567613 (=> (not res!1070835) (not e!873917))))

(assert (= (and d!163867 (not res!1070834)) b!1567611))

(assert (= (and b!1567611 c!145063) b!1567613))

(assert (= (and b!1567611 (not c!145063)) b!1567612))

(assert (= (and b!1567613 res!1070835) b!1567610))

(assert (= (or b!1567610 b!1567612) bm!72017))

(declare-fun m!1442381 () Bool)

(assert (=> bm!72017 m!1442381))

(assert (=> b!1567611 m!1442373))

(assert (=> b!1567611 m!1442373))

(assert (=> b!1567611 m!1442379))

(assert (=> b!1567613 m!1442373))

(declare-fun m!1442383 () Bool)

(assert (=> b!1567613 m!1442383))

(declare-fun m!1442385 () Bool)

(assert (=> b!1567613 m!1442385))

(assert (=> b!1567613 m!1442373))

(declare-fun m!1442387 () Bool)

(assert (=> b!1567613 m!1442387))

(assert (=> b!1567518 d!163867))

(declare-fun d!163869 () Bool)

(assert (=> d!163869 (= (validKeyInArray!0 (select (arr!50492 _keys!637) from!782)) (and (not (= (select (arr!50492 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50492 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567523 d!163869))

(declare-fun d!163871 () Bool)

(declare-fun e!873924 () Bool)

(assert (=> d!163871 e!873924))

(declare-fun res!1070838 () Bool)

(assert (=> d!163871 (=> res!1070838 e!873924)))

(declare-fun lt!673063 () Bool)

(assert (=> d!163871 (= res!1070838 (not lt!673063))))

(declare-fun lt!673062 () Bool)

(assert (=> d!163871 (= lt!673063 lt!673062)))

(declare-fun lt!673060 () Unit!51901)

(declare-fun e!873925 () Unit!51901)

(assert (=> d!163871 (= lt!673060 e!873925)))

(declare-fun c!145066 () Bool)

(assert (=> d!163871 (= c!145066 lt!673062)))

(declare-fun containsKey!849 (List!36624 (_ BitVec 64)) Bool)

(assert (=> d!163871 (= lt!673062 (containsKey!849 (toList!11366 (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163871 (= (contains!10366 (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) #b0000000000000000000000000000000000000000000000000000000000000000) lt!673063)))

(declare-fun b!1567620 () Bool)

(declare-fun lt!673061 () Unit!51901)

(assert (=> b!1567620 (= e!873925 lt!673061)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!532 (List!36624 (_ BitVec 64)) Unit!51901)

(assert (=> b!1567620 (= lt!673061 (lemmaContainsKeyImpliesGetValueByKeyDefined!532 (toList!11366 (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!862 0))(
  ( (Some!861 (v!22285 V!60081)) (None!860) )
))
(declare-fun isDefined!578 (Option!862) Bool)

(declare-fun getValueByKey!787 (List!36624 (_ BitVec 64)) Option!862)

(assert (=> b!1567620 (isDefined!578 (getValueByKey!787 (toList!11366 (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567621 () Bool)

(declare-fun Unit!51903 () Unit!51901)

(assert (=> b!1567621 (= e!873925 Unit!51903)))

(declare-fun b!1567622 () Bool)

(assert (=> b!1567622 (= e!873924 (isDefined!578 (getValueByKey!787 (toList!11366 (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163871 c!145066) b!1567620))

(assert (= (and d!163871 (not c!145066)) b!1567621))

(assert (= (and d!163871 (not res!1070838)) b!1567622))

(declare-fun m!1442389 () Bool)

(assert (=> d!163871 m!1442389))

(declare-fun m!1442391 () Bool)

(assert (=> b!1567620 m!1442391))

(declare-fun m!1442393 () Bool)

(assert (=> b!1567620 m!1442393))

(assert (=> b!1567620 m!1442393))

(declare-fun m!1442395 () Bool)

(assert (=> b!1567620 m!1442395))

(assert (=> b!1567622 m!1442393))

(assert (=> b!1567622 m!1442393))

(assert (=> b!1567622 m!1442395))

(assert (=> b!1567524 d!163871))

(declare-fun b!1567647 () Bool)

(declare-fun e!873942 () Bool)

(declare-fun e!873945 () Bool)

(assert (=> b!1567647 (= e!873942 e!873945)))

(declare-fun c!145076 () Bool)

(assert (=> b!1567647 (= c!145076 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51043 _keys!637)))))

(declare-fun b!1567648 () Bool)

(assert (=> b!1567648 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51043 _keys!637)))))

(assert (=> b!1567648 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51044 _values!487)))))

(declare-fun lt!673078 () ListLongMap!22701)

(declare-fun e!873941 () Bool)

(declare-fun apply!1118 (ListLongMap!22701 (_ BitVec 64)) V!60081)

(declare-fun get!26362 (ValueCell!18422 V!60081) V!60081)

(declare-fun dynLambda!3902 (Int (_ BitVec 64)) V!60081)

(assert (=> b!1567648 (= e!873941 (= (apply!1118 lt!673078 (select (arr!50492 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26362 (select (arr!50493 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3902 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1567649 () Bool)

(declare-fun lt!673079 () Unit!51901)

(declare-fun lt!673080 () Unit!51901)

(assert (=> b!1567649 (= lt!673079 lt!673080)))

(declare-fun lt!673083 () ListLongMap!22701)

(declare-fun lt!673082 () (_ BitVec 64))

(declare-fun lt!673081 () V!60081)

(declare-fun lt!673084 () (_ BitVec 64))

(declare-fun +!5104 (ListLongMap!22701 tuple2!25258) ListLongMap!22701)

(assert (=> b!1567649 (not (contains!10366 (+!5104 lt!673083 (tuple2!25259 lt!673082 lt!673081)) lt!673084))))

(declare-fun addStillNotContains!555 (ListLongMap!22701 (_ BitVec 64) V!60081 (_ BitVec 64)) Unit!51901)

(assert (=> b!1567649 (= lt!673080 (addStillNotContains!555 lt!673083 lt!673082 lt!673081 lt!673084))))

(assert (=> b!1567649 (= lt!673084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1567649 (= lt!673081 (get!26362 (select (arr!50493 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3902 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1567649 (= lt!673082 (select (arr!50492 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(declare-fun call!72023 () ListLongMap!22701)

(assert (=> b!1567649 (= lt!673083 call!72023)))

(declare-fun e!873944 () ListLongMap!22701)

(assert (=> b!1567649 (= e!873944 (+!5104 call!72023 (tuple2!25259 (select (arr!50492 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26362 (select (arr!50493 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3902 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1567650 () Bool)

(declare-fun e!873943 () Bool)

(assert (=> b!1567650 (= e!873943 e!873942)))

(declare-fun c!145078 () Bool)

(declare-fun e!873946 () Bool)

(assert (=> b!1567650 (= c!145078 e!873946)))

(declare-fun res!1070847 () Bool)

(assert (=> b!1567650 (=> (not res!1070847) (not e!873946))))

(assert (=> b!1567650 (= res!1070847 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51043 _keys!637)))))

(declare-fun b!1567651 () Bool)

(declare-fun isEmpty!1147 (ListLongMap!22701) Bool)

(assert (=> b!1567651 (= e!873945 (isEmpty!1147 lt!673078))))

(declare-fun b!1567652 () Bool)

(declare-fun e!873940 () ListLongMap!22701)

(assert (=> b!1567652 (= e!873940 (ListLongMap!22702 Nil!36621))))

(declare-fun b!1567653 () Bool)

(declare-fun res!1070850 () Bool)

(assert (=> b!1567653 (=> (not res!1070850) (not e!873943))))

(assert (=> b!1567653 (= res!1070850 (not (contains!10366 lt!673078 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567654 () Bool)

(assert (=> b!1567654 (= e!873945 (= lt!673078 (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1567655 () Bool)

(assert (=> b!1567655 (= e!873940 e!873944)))

(declare-fun c!145075 () Bool)

(assert (=> b!1567655 (= c!145075 (validKeyInArray!0 (select (arr!50492 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1567656 () Bool)

(assert (=> b!1567656 (= e!873946 (validKeyInArray!0 (select (arr!50492 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567656 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun b!1567657 () Bool)

(assert (=> b!1567657 (= e!873944 call!72023)))

(declare-fun d!163873 () Bool)

(assert (=> d!163873 e!873943))

(declare-fun res!1070848 () Bool)

(assert (=> d!163873 (=> (not res!1070848) (not e!873943))))

(assert (=> d!163873 (= res!1070848 (not (contains!10366 lt!673078 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163873 (= lt!673078 e!873940)))

(declare-fun c!145077 () Bool)

(assert (=> d!163873 (= c!145077 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51043 _keys!637)))))

(assert (=> d!163873 (validMask!0 mask!947)))

(assert (=> d!163873 (= (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!673078)))

(declare-fun bm!72020 () Bool)

(assert (=> bm!72020 (= call!72023 (getCurrentListMapNoExtraKeys!6749 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1567658 () Bool)

(assert (=> b!1567658 (= e!873942 e!873941)))

(assert (=> b!1567658 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51043 _keys!637)))))

(declare-fun res!1070849 () Bool)

(assert (=> b!1567658 (= res!1070849 (contains!10366 lt!673078 (select (arr!50492 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567658 (=> (not res!1070849) (not e!873941))))

(assert (= (and d!163873 c!145077) b!1567652))

(assert (= (and d!163873 (not c!145077)) b!1567655))

(assert (= (and b!1567655 c!145075) b!1567649))

(assert (= (and b!1567655 (not c!145075)) b!1567657))

(assert (= (or b!1567649 b!1567657) bm!72020))

(assert (= (and d!163873 res!1070848) b!1567653))

(assert (= (and b!1567653 res!1070850) b!1567650))

(assert (= (and b!1567650 res!1070847) b!1567656))

(assert (= (and b!1567650 c!145078) b!1567658))

(assert (= (and b!1567650 (not c!145078)) b!1567647))

(assert (= (and b!1567658 res!1070849) b!1567648))

(assert (= (and b!1567647 c!145076) b!1567654))

(assert (= (and b!1567647 (not c!145076)) b!1567651))

(declare-fun b_lambda!24927 () Bool)

(assert (=> (not b_lambda!24927) (not b!1567648)))

(declare-fun t!51465 () Bool)

(declare-fun tb!12595 () Bool)

(assert (=> (and start!134282 (= defaultEntry!495 defaultEntry!495) t!51465) tb!12595))

(declare-fun result!26485 () Bool)

(assert (=> tb!12595 (= result!26485 tp_is_empty!38905)))

(assert (=> b!1567648 t!51465))

(declare-fun b_and!51709 () Bool)

(assert (= b_and!51703 (and (=> t!51465 result!26485) b_and!51709)))

(declare-fun b_lambda!24929 () Bool)

(assert (=> (not b_lambda!24929) (not b!1567649)))

(assert (=> b!1567649 t!51465))

(declare-fun b_and!51711 () Bool)

(assert (= b_and!51709 (and (=> t!51465 result!26485) b_and!51711)))

(declare-fun m!1442397 () Bool)

(assert (=> bm!72020 m!1442397))

(declare-fun m!1442399 () Bool)

(assert (=> d!163873 m!1442399))

(assert (=> d!163873 m!1442327))

(assert (=> b!1567654 m!1442397))

(declare-fun m!1442401 () Bool)

(assert (=> b!1567655 m!1442401))

(assert (=> b!1567655 m!1442401))

(declare-fun m!1442403 () Bool)

(assert (=> b!1567655 m!1442403))

(declare-fun m!1442405 () Bool)

(assert (=> b!1567649 m!1442405))

(declare-fun m!1442407 () Bool)

(assert (=> b!1567649 m!1442407))

(declare-fun m!1442409 () Bool)

(assert (=> b!1567649 m!1442409))

(declare-fun m!1442411 () Bool)

(assert (=> b!1567649 m!1442411))

(assert (=> b!1567649 m!1442405))

(declare-fun m!1442413 () Bool)

(assert (=> b!1567649 m!1442413))

(assert (=> b!1567649 m!1442409))

(assert (=> b!1567649 m!1442401))

(declare-fun m!1442415 () Bool)

(assert (=> b!1567649 m!1442415))

(assert (=> b!1567649 m!1442407))

(declare-fun m!1442417 () Bool)

(assert (=> b!1567649 m!1442417))

(declare-fun m!1442419 () Bool)

(assert (=> b!1567651 m!1442419))

(declare-fun m!1442421 () Bool)

(assert (=> b!1567653 m!1442421))

(assert (=> b!1567648 m!1442401))

(assert (=> b!1567648 m!1442407))

(assert (=> b!1567648 m!1442409))

(assert (=> b!1567648 m!1442411))

(assert (=> b!1567648 m!1442401))

(declare-fun m!1442423 () Bool)

(assert (=> b!1567648 m!1442423))

(assert (=> b!1567648 m!1442407))

(assert (=> b!1567648 m!1442409))

(assert (=> b!1567656 m!1442401))

(assert (=> b!1567656 m!1442401))

(assert (=> b!1567656 m!1442403))

(assert (=> b!1567658 m!1442401))

(assert (=> b!1567658 m!1442401))

(declare-fun m!1442425 () Bool)

(assert (=> b!1567658 m!1442425))

(assert (=> b!1567524 d!163873))

(declare-fun b!1567667 () Bool)

(declare-fun e!873951 () Bool)

(assert (=> b!1567667 (= e!873951 tp_is_empty!38905)))

(declare-fun mapIsEmpty!59752 () Bool)

(declare-fun mapRes!59752 () Bool)

(assert (=> mapIsEmpty!59752 mapRes!59752))

(declare-fun b!1567668 () Bool)

(declare-fun e!873952 () Bool)

(assert (=> b!1567668 (= e!873952 tp_is_empty!38905)))

(declare-fun mapNonEmpty!59752 () Bool)

(declare-fun tp!113704 () Bool)

(assert (=> mapNonEmpty!59752 (= mapRes!59752 (and tp!113704 e!873951))))

(declare-fun mapValue!59752 () ValueCell!18422)

(declare-fun mapKey!59752 () (_ BitVec 32))

(declare-fun mapRest!59752 () (Array (_ BitVec 32) ValueCell!18422))

(assert (=> mapNonEmpty!59752 (= mapRest!59743 (store mapRest!59752 mapKey!59752 mapValue!59752))))

(declare-fun condMapEmpty!59752 () Bool)

(declare-fun mapDefault!59752 () ValueCell!18422)

(assert (=> mapNonEmpty!59743 (= condMapEmpty!59752 (= mapRest!59743 ((as const (Array (_ BitVec 32) ValueCell!18422)) mapDefault!59752)))))

(assert (=> mapNonEmpty!59743 (= tp!113688 (and e!873952 mapRes!59752))))

(assert (= (and mapNonEmpty!59743 condMapEmpty!59752) mapIsEmpty!59752))

(assert (= (and mapNonEmpty!59743 (not condMapEmpty!59752)) mapNonEmpty!59752))

(assert (= (and mapNonEmpty!59752 ((_ is ValueCellFull!18422) mapValue!59752)) b!1567667))

(assert (= (and mapNonEmpty!59743 ((_ is ValueCellFull!18422) mapDefault!59752)) b!1567668))

(declare-fun m!1442427 () Bool)

(assert (=> mapNonEmpty!59752 m!1442427))

(declare-fun b_lambda!24931 () Bool)

(assert (= b_lambda!24929 (or (and start!134282 b_free!32131) b_lambda!24931)))

(declare-fun b_lambda!24933 () Bool)

(assert (= b_lambda!24927 (or (and start!134282 b_free!32131) b_lambda!24933)))

(check-sat (not b!1567598) (not b!1567653) (not b!1567620) (not b!1567597) tp_is_empty!38905 (not b_next!32131) (not bm!72020) (not d!163873) (not b!1567655) (not b!1567648) (not b!1567611) (not b!1567651) (not b!1567613) (not b!1567601) (not b!1567656) (not bm!72017) (not b_lambda!24931) (not b!1567622) (not bm!72014) (not d!163871) b_and!51711 (not b!1567654) (not mapNonEmpty!59752) (not b!1567658) (not b!1567649) (not b_lambda!24933))
(check-sat b_and!51711 (not b_next!32131))
