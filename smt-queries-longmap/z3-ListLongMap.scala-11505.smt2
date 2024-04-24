; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134304 () Bool)

(assert start!134304)

(declare-fun b_free!32137 () Bool)

(declare-fun b_next!32137 () Bool)

(assert (=> start!134304 (= b_free!32137 (not b_next!32137))))

(declare-fun tp!113709 () Bool)

(declare-fun b_and!51713 () Bool)

(assert (=> start!134304 (= tp!113709 b_and!51713)))

(declare-fun mapNonEmpty!59755 () Bool)

(declare-fun mapRes!59755 () Bool)

(declare-fun tp!113710 () Bool)

(declare-fun e!873967 () Bool)

(assert (=> mapNonEmpty!59755 (= mapRes!59755 (and tp!113710 e!873967))))

(declare-datatypes ((V!60089 0))(
  ( (V!60090 (val!19539 Int)) )
))
(declare-datatypes ((ValueCell!18425 0))(
  ( (ValueCellFull!18425 (v!22286 V!60089)) (EmptyCell!18425) )
))
(declare-fun mapRest!59755 () (Array (_ BitVec 32) ValueCell!18425))

(declare-fun mapKey!59755 () (_ BitVec 32))

(declare-datatypes ((array!104632 0))(
  ( (array!104633 (arr!50497 (Array (_ BitVec 32) ValueCell!18425)) (size!51048 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104632)

(declare-fun mapValue!59755 () ValueCell!18425)

(assert (=> mapNonEmpty!59755 (= (arr!50497 _values!487) (store mapRest!59755 mapKey!59755 mapValue!59755))))

(declare-fun b!1567687 () Bool)

(declare-fun res!1070863 () Bool)

(declare-fun e!873964 () Bool)

(assert (=> b!1567687 (=> (not res!1070863) (not e!873964))))

(declare-datatypes ((array!104634 0))(
  ( (array!104635 (arr!50498 (Array (_ BitVec 32) (_ BitVec 64))) (size!51049 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104634)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567687 (= res!1070863 (validKeyInArray!0 (select (arr!50498 _keys!637) from!782)))))

(declare-fun b!1567688 () Bool)

(assert (=> b!1567688 (= e!873964 (not (bvslt (bvsub (size!51049 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51049 _keys!637)) from!782))))))

(declare-datatypes ((tuple2!25260 0))(
  ( (tuple2!25261 (_1!12641 (_ BitVec 64)) (_2!12641 V!60089)) )
))
(declare-datatypes ((List!36625 0))(
  ( (Nil!36622) (Cons!36621 (h!38085 tuple2!25260) (t!51468 List!36625)) )
))
(declare-datatypes ((ListLongMap!22703 0))(
  ( (ListLongMap!22704 (toList!11367 List!36625)) )
))
(declare-fun lt!673091 () ListLongMap!22703)

(declare-fun lt!673092 () V!60089)

(declare-fun contains!10368 (ListLongMap!22703 (_ BitVec 64)) Bool)

(declare-fun +!5105 (ListLongMap!22703 tuple2!25260) ListLongMap!22703)

(assert (=> b!1567688 (not (contains!10368 (+!5105 lt!673091 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51904 0))(
  ( (Unit!51905) )
))
(declare-fun lt!673093 () Unit!51904)

(declare-fun addStillNotContains!556 (ListLongMap!22703 (_ BitVec 64) V!60089 (_ BitVec 64)) Unit!51904)

(assert (=> b!1567688 (= lt!673093 (addStillNotContains!556 lt!673091 (select (arr!50498 _keys!637) from!782) lt!673092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26365 (ValueCell!18425 V!60089) V!60089)

(declare-fun dynLambda!3903 (Int (_ BitVec 64)) V!60089)

(assert (=> b!1567688 (= lt!673092 (get!26365 (select (arr!50497 _values!487) from!782) (dynLambda!3903 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60089)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60089)

(declare-fun getCurrentListMapNoExtraKeys!6750 (array!104634 array!104632 (_ BitVec 32) (_ BitVec 32) V!60089 V!60089 (_ BitVec 32) Int) ListLongMap!22703)

(assert (=> b!1567688 (= lt!673091 (getCurrentListMapNoExtraKeys!6750 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567689 () Bool)

(declare-fun tp_is_empty!38911 () Bool)

(assert (=> b!1567689 (= e!873967 tp_is_empty!38911)))

(declare-fun b!1567690 () Bool)

(declare-fun e!873963 () Bool)

(assert (=> b!1567690 (= e!873963 tp_is_empty!38911)))

(declare-fun res!1070866 () Bool)

(assert (=> start!134304 (=> (not res!1070866) (not e!873964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134304 (= res!1070866 (validMask!0 mask!947))))

(assert (=> start!134304 e!873964))

(assert (=> start!134304 tp!113709))

(assert (=> start!134304 tp_is_empty!38911))

(assert (=> start!134304 true))

(declare-fun array_inv!39483 (array!104634) Bool)

(assert (=> start!134304 (array_inv!39483 _keys!637)))

(declare-fun e!873965 () Bool)

(declare-fun array_inv!39484 (array!104632) Bool)

(assert (=> start!134304 (and (array_inv!39484 _values!487) e!873965)))

(declare-fun b!1567691 () Bool)

(declare-fun res!1070864 () Bool)

(assert (=> b!1567691 (=> (not res!1070864) (not e!873964))))

(assert (=> b!1567691 (= res!1070864 (and (= (size!51048 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51049 _keys!637) (size!51048 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567692 () Bool)

(declare-fun res!1070865 () Bool)

(assert (=> b!1567692 (=> (not res!1070865) (not e!873964))))

(declare-datatypes ((List!36626 0))(
  ( (Nil!36623) (Cons!36622 (h!38086 (_ BitVec 64)) (t!51469 List!36626)) )
))
(declare-fun arrayNoDuplicates!0 (array!104634 (_ BitVec 32) List!36626) Bool)

(assert (=> b!1567692 (= res!1070865 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36623))))

(declare-fun mapIsEmpty!59755 () Bool)

(assert (=> mapIsEmpty!59755 mapRes!59755))

(declare-fun b!1567693 () Bool)

(declare-fun res!1070868 () Bool)

(assert (=> b!1567693 (=> (not res!1070868) (not e!873964))))

(assert (=> b!1567693 (= res!1070868 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51049 _keys!637)) (bvslt from!782 (size!51049 _keys!637))))))

(declare-fun b!1567694 () Bool)

(assert (=> b!1567694 (= e!873965 (and e!873963 mapRes!59755))))

(declare-fun condMapEmpty!59755 () Bool)

(declare-fun mapDefault!59755 () ValueCell!18425)

(assert (=> b!1567694 (= condMapEmpty!59755 (= (arr!50497 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18425)) mapDefault!59755)))))

(declare-fun b!1567695 () Bool)

(declare-fun res!1070867 () Bool)

(assert (=> b!1567695 (=> (not res!1070867) (not e!873964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104634 (_ BitVec 32)) Bool)

(assert (=> b!1567695 (= res!1070867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!134304 res!1070866) b!1567691))

(assert (= (and b!1567691 res!1070864) b!1567695))

(assert (= (and b!1567695 res!1070867) b!1567692))

(assert (= (and b!1567692 res!1070865) b!1567693))

(assert (= (and b!1567693 res!1070868) b!1567687))

(assert (= (and b!1567687 res!1070863) b!1567688))

(assert (= (and b!1567694 condMapEmpty!59755) mapIsEmpty!59755))

(assert (= (and b!1567694 (not condMapEmpty!59755)) mapNonEmpty!59755))

(get-info :version)

(assert (= (and mapNonEmpty!59755 ((_ is ValueCellFull!18425) mapValue!59755)) b!1567689))

(assert (= (and b!1567694 ((_ is ValueCellFull!18425) mapDefault!59755)) b!1567690))

(assert (= start!134304 b!1567694))

(declare-fun b_lambda!24935 () Bool)

(assert (=> (not b_lambda!24935) (not b!1567688)))

(declare-fun t!51467 () Bool)

(declare-fun tb!12597 () Bool)

(assert (=> (and start!134304 (= defaultEntry!495 defaultEntry!495) t!51467) tb!12597))

(declare-fun result!26491 () Bool)

(assert (=> tb!12597 (= result!26491 tp_is_empty!38911)))

(assert (=> b!1567688 t!51467))

(declare-fun b_and!51715 () Bool)

(assert (= b_and!51713 (and (=> t!51467 result!26491) b_and!51715)))

(declare-fun m!1442429 () Bool)

(assert (=> b!1567688 m!1442429))

(declare-fun m!1442431 () Bool)

(assert (=> b!1567688 m!1442431))

(declare-fun m!1442433 () Bool)

(assert (=> b!1567688 m!1442433))

(assert (=> b!1567688 m!1442429))

(declare-fun m!1442435 () Bool)

(assert (=> b!1567688 m!1442435))

(assert (=> b!1567688 m!1442431))

(assert (=> b!1567688 m!1442435))

(declare-fun m!1442437 () Bool)

(assert (=> b!1567688 m!1442437))

(declare-fun m!1442439 () Bool)

(assert (=> b!1567688 m!1442439))

(declare-fun m!1442441 () Bool)

(assert (=> b!1567688 m!1442441))

(declare-fun m!1442443 () Bool)

(assert (=> b!1567688 m!1442443))

(assert (=> b!1567688 m!1442441))

(declare-fun m!1442445 () Bool)

(assert (=> start!134304 m!1442445))

(declare-fun m!1442447 () Bool)

(assert (=> start!134304 m!1442447))

(declare-fun m!1442449 () Bool)

(assert (=> start!134304 m!1442449))

(declare-fun m!1442451 () Bool)

(assert (=> b!1567695 m!1442451))

(declare-fun m!1442453 () Bool)

(assert (=> mapNonEmpty!59755 m!1442453))

(declare-fun m!1442455 () Bool)

(assert (=> b!1567692 m!1442455))

(assert (=> b!1567687 m!1442435))

(assert (=> b!1567687 m!1442435))

(declare-fun m!1442457 () Bool)

(assert (=> b!1567687 m!1442457))

(check-sat (not mapNonEmpty!59755) (not b!1567687) (not b_next!32137) (not b!1567688) tp_is_empty!38911 (not b!1567692) (not b_lambda!24935) (not b!1567695) b_and!51715 (not start!134304))
(check-sat b_and!51715 (not b_next!32137))
(get-model)

(declare-fun b_lambda!24941 () Bool)

(assert (= b_lambda!24935 (or (and start!134304 b_free!32137) b_lambda!24941)))

(check-sat (not mapNonEmpty!59755) (not b!1567687) (not b_next!32137) (not b_lambda!24941) (not b!1567688) (not b!1567695) tp_is_empty!38911 (not b!1567692) b_and!51715 (not start!134304))
(check-sat b_and!51715 (not b_next!32137))
(get-model)

(declare-fun d!163877 () Bool)

(assert (=> d!163877 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134304 d!163877))

(declare-fun d!163879 () Bool)

(assert (=> d!163879 (= (array_inv!39483 _keys!637) (bvsge (size!51049 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134304 d!163879))

(declare-fun d!163881 () Bool)

(assert (=> d!163881 (= (array_inv!39484 _values!487) (bvsge (size!51048 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134304 d!163881))

(declare-fun bm!72023 () Bool)

(declare-fun call!72026 () Bool)

(assert (=> bm!72023 (= call!72026 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1567764 () Bool)

(declare-fun e!874004 () Bool)

(declare-fun e!874005 () Bool)

(assert (=> b!1567764 (= e!874004 e!874005)))

(declare-fun c!145081 () Bool)

(assert (=> b!1567764 (= c!145081 (validKeyInArray!0 (select (arr!50498 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567765 () Bool)

(declare-fun e!874006 () Bool)

(assert (=> b!1567765 (= e!874006 call!72026)))

(declare-fun d!163883 () Bool)

(declare-fun res!1070910 () Bool)

(assert (=> d!163883 (=> res!1070910 e!874004)))

(assert (=> d!163883 (= res!1070910 (bvsge #b00000000000000000000000000000000 (size!51049 _keys!637)))))

(assert (=> d!163883 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!874004)))

(declare-fun b!1567766 () Bool)

(assert (=> b!1567766 (= e!874005 call!72026)))

(declare-fun b!1567767 () Bool)

(assert (=> b!1567767 (= e!874005 e!874006)))

(declare-fun lt!673120 () (_ BitVec 64))

(assert (=> b!1567767 (= lt!673120 (select (arr!50498 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!673119 () Unit!51904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104634 (_ BitVec 64) (_ BitVec 32)) Unit!51904)

(assert (=> b!1567767 (= lt!673119 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673120 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1567767 (arrayContainsKey!0 _keys!637 lt!673120 #b00000000000000000000000000000000)))

(declare-fun lt!673118 () Unit!51904)

(assert (=> b!1567767 (= lt!673118 lt!673119)))

(declare-fun res!1070909 () Bool)

(declare-datatypes ((SeekEntryResult!13473 0))(
  ( (MissingZero!13473 (index!56290 (_ BitVec 32))) (Found!13473 (index!56291 (_ BitVec 32))) (Intermediate!13473 (undefined!14285 Bool) (index!56292 (_ BitVec 32)) (x!140622 (_ BitVec 32))) (Undefined!13473) (MissingVacant!13473 (index!56293 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104634 (_ BitVec 32)) SeekEntryResult!13473)

(assert (=> b!1567767 (= res!1070909 (= (seekEntryOrOpen!0 (select (arr!50498 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13473 #b00000000000000000000000000000000)))))

(assert (=> b!1567767 (=> (not res!1070909) (not e!874006))))

(assert (= (and d!163883 (not res!1070910)) b!1567764))

(assert (= (and b!1567764 c!145081) b!1567767))

(assert (= (and b!1567764 (not c!145081)) b!1567766))

(assert (= (and b!1567767 res!1070909) b!1567765))

(assert (= (or b!1567765 b!1567766) bm!72023))

(declare-fun m!1442519 () Bool)

(assert (=> bm!72023 m!1442519))

(declare-fun m!1442521 () Bool)

(assert (=> b!1567764 m!1442521))

(assert (=> b!1567764 m!1442521))

(declare-fun m!1442523 () Bool)

(assert (=> b!1567764 m!1442523))

(assert (=> b!1567767 m!1442521))

(declare-fun m!1442525 () Bool)

(assert (=> b!1567767 m!1442525))

(declare-fun m!1442527 () Bool)

(assert (=> b!1567767 m!1442527))

(assert (=> b!1567767 m!1442521))

(declare-fun m!1442529 () Bool)

(assert (=> b!1567767 m!1442529))

(assert (=> b!1567695 d!163883))

(declare-fun d!163885 () Bool)

(declare-fun c!145084 () Bool)

(assert (=> d!163885 (= c!145084 ((_ is ValueCellFull!18425) (select (arr!50497 _values!487) from!782)))))

(declare-fun e!874009 () V!60089)

(assert (=> d!163885 (= (get!26365 (select (arr!50497 _values!487) from!782) (dynLambda!3903 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!874009)))

(declare-fun b!1567772 () Bool)

(declare-fun get!26367 (ValueCell!18425 V!60089) V!60089)

(assert (=> b!1567772 (= e!874009 (get!26367 (select (arr!50497 _values!487) from!782) (dynLambda!3903 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567773 () Bool)

(declare-fun get!26368 (ValueCell!18425 V!60089) V!60089)

(assert (=> b!1567773 (= e!874009 (get!26368 (select (arr!50497 _values!487) from!782) (dynLambda!3903 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163885 c!145084) b!1567772))

(assert (= (and d!163885 (not c!145084)) b!1567773))

(assert (=> b!1567772 m!1442429))

(assert (=> b!1567772 m!1442431))

(declare-fun m!1442531 () Bool)

(assert (=> b!1567772 m!1442531))

(assert (=> b!1567773 m!1442429))

(assert (=> b!1567773 m!1442431))

(declare-fun m!1442533 () Bool)

(assert (=> b!1567773 m!1442533))

(assert (=> b!1567688 d!163885))

(declare-fun b!1567798 () Bool)

(declare-fun lt!673135 () Unit!51904)

(declare-fun lt!673139 () Unit!51904)

(assert (=> b!1567798 (= lt!673135 lt!673139)))

(declare-fun lt!673141 () ListLongMap!22703)

(declare-fun lt!673138 () (_ BitVec 64))

(declare-fun lt!673137 () (_ BitVec 64))

(declare-fun lt!673136 () V!60089)

(assert (=> b!1567798 (not (contains!10368 (+!5105 lt!673141 (tuple2!25261 lt!673138 lt!673136)) lt!673137))))

(assert (=> b!1567798 (= lt!673139 (addStillNotContains!556 lt!673141 lt!673138 lt!673136 lt!673137))))

(assert (=> b!1567798 (= lt!673137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1567798 (= lt!673136 (get!26365 (select (arr!50497 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3903 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1567798 (= lt!673138 (select (arr!50498 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(declare-fun call!72029 () ListLongMap!22703)

(assert (=> b!1567798 (= lt!673141 call!72029)))

(declare-fun e!874026 () ListLongMap!22703)

(assert (=> b!1567798 (= e!874026 (+!5105 call!72029 (tuple2!25261 (select (arr!50498 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26365 (select (arr!50497 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3903 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1567799 () Bool)

(declare-fun e!874027 () Bool)

(declare-fun lt!673140 () ListLongMap!22703)

(declare-fun isEmpty!1148 (ListLongMap!22703) Bool)

(assert (=> b!1567799 (= e!874027 (isEmpty!1148 lt!673140))))

(declare-fun b!1567800 () Bool)

(declare-fun res!1070922 () Bool)

(declare-fun e!874029 () Bool)

(assert (=> b!1567800 (=> (not res!1070922) (not e!874029))))

(assert (=> b!1567800 (= res!1070922 (not (contains!10368 lt!673140 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567801 () Bool)

(declare-fun e!874030 () Bool)

(assert (=> b!1567801 (= e!874030 e!874027)))

(declare-fun c!145093 () Bool)

(assert (=> b!1567801 (= c!145093 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51049 _keys!637)))))

(declare-fun b!1567802 () Bool)

(assert (=> b!1567802 (= e!874029 e!874030)))

(declare-fun c!145094 () Bool)

(declare-fun e!874025 () Bool)

(assert (=> b!1567802 (= c!145094 e!874025)))

(declare-fun res!1070920 () Bool)

(assert (=> b!1567802 (=> (not res!1070920) (not e!874025))))

(assert (=> b!1567802 (= res!1070920 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51049 _keys!637)))))

(declare-fun b!1567803 () Bool)

(assert (=> b!1567803 (= e!874027 (= lt!673140 (getCurrentListMapNoExtraKeys!6750 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun bm!72026 () Bool)

(assert (=> bm!72026 (= call!72029 (getCurrentListMapNoExtraKeys!6750 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1567804 () Bool)

(assert (=> b!1567804 (= e!874025 (validKeyInArray!0 (select (arr!50498 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567804 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun b!1567805 () Bool)

(assert (=> b!1567805 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51049 _keys!637)))))

(assert (=> b!1567805 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51048 _values!487)))))

(declare-fun e!874024 () Bool)

(declare-fun apply!1119 (ListLongMap!22703 (_ BitVec 64)) V!60089)

(assert (=> b!1567805 (= e!874024 (= (apply!1119 lt!673140 (select (arr!50498 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26365 (select (arr!50497 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3903 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1567806 () Bool)

(declare-fun e!874028 () ListLongMap!22703)

(assert (=> b!1567806 (= e!874028 (ListLongMap!22704 Nil!36622))))

(declare-fun d!163887 () Bool)

(assert (=> d!163887 e!874029))

(declare-fun res!1070919 () Bool)

(assert (=> d!163887 (=> (not res!1070919) (not e!874029))))

(assert (=> d!163887 (= res!1070919 (not (contains!10368 lt!673140 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163887 (= lt!673140 e!874028)))

(declare-fun c!145096 () Bool)

(assert (=> d!163887 (= c!145096 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51049 _keys!637)))))

(assert (=> d!163887 (validMask!0 mask!947)))

(assert (=> d!163887 (= (getCurrentListMapNoExtraKeys!6750 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!673140)))

(declare-fun b!1567807 () Bool)

(assert (=> b!1567807 (= e!874026 call!72029)))

(declare-fun b!1567808 () Bool)

(assert (=> b!1567808 (= e!874030 e!874024)))

(assert (=> b!1567808 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51049 _keys!637)))))

(declare-fun res!1070921 () Bool)

(assert (=> b!1567808 (= res!1070921 (contains!10368 lt!673140 (select (arr!50498 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567808 (=> (not res!1070921) (not e!874024))))

(declare-fun b!1567809 () Bool)

(assert (=> b!1567809 (= e!874028 e!874026)))

(declare-fun c!145095 () Bool)

(assert (=> b!1567809 (= c!145095 (validKeyInArray!0 (select (arr!50498 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (= (and d!163887 c!145096) b!1567806))

(assert (= (and d!163887 (not c!145096)) b!1567809))

(assert (= (and b!1567809 c!145095) b!1567798))

(assert (= (and b!1567809 (not c!145095)) b!1567807))

(assert (= (or b!1567798 b!1567807) bm!72026))

(assert (= (and d!163887 res!1070919) b!1567800))

(assert (= (and b!1567800 res!1070922) b!1567802))

(assert (= (and b!1567802 res!1070920) b!1567804))

(assert (= (and b!1567802 c!145094) b!1567808))

(assert (= (and b!1567802 (not c!145094)) b!1567801))

(assert (= (and b!1567808 res!1070921) b!1567805))

(assert (= (and b!1567801 c!145093) b!1567803))

(assert (= (and b!1567801 (not c!145093)) b!1567799))

(declare-fun b_lambda!24943 () Bool)

(assert (=> (not b_lambda!24943) (not b!1567798)))

(assert (=> b!1567798 t!51467))

(declare-fun b_and!51725 () Bool)

(assert (= b_and!51715 (and (=> t!51467 result!26491) b_and!51725)))

(declare-fun b_lambda!24945 () Bool)

(assert (=> (not b_lambda!24945) (not b!1567805)))

(assert (=> b!1567805 t!51467))

(declare-fun b_and!51727 () Bool)

(assert (= b_and!51725 (and (=> t!51467 result!26491) b_and!51727)))

(declare-fun m!1442535 () Bool)

(assert (=> b!1567799 m!1442535))

(declare-fun m!1442537 () Bool)

(assert (=> b!1567800 m!1442537))

(declare-fun m!1442539 () Bool)

(assert (=> b!1567805 m!1442539))

(assert (=> b!1567805 m!1442431))

(declare-fun m!1442541 () Bool)

(assert (=> b!1567805 m!1442541))

(assert (=> b!1567805 m!1442541))

(assert (=> b!1567805 m!1442431))

(declare-fun m!1442543 () Bool)

(assert (=> b!1567805 m!1442543))

(assert (=> b!1567805 m!1442539))

(declare-fun m!1442545 () Bool)

(assert (=> b!1567805 m!1442545))

(declare-fun m!1442547 () Bool)

(assert (=> bm!72026 m!1442547))

(declare-fun m!1442549 () Bool)

(assert (=> d!163887 m!1442549))

(assert (=> d!163887 m!1442445))

(assert (=> b!1567808 m!1442539))

(assert (=> b!1567808 m!1442539))

(declare-fun m!1442551 () Bool)

(assert (=> b!1567808 m!1442551))

(assert (=> b!1567803 m!1442547))

(assert (=> b!1567798 m!1442539))

(declare-fun m!1442553 () Bool)

(assert (=> b!1567798 m!1442553))

(assert (=> b!1567798 m!1442431))

(declare-fun m!1442555 () Bool)

(assert (=> b!1567798 m!1442555))

(assert (=> b!1567798 m!1442541))

(assert (=> b!1567798 m!1442541))

(assert (=> b!1567798 m!1442431))

(assert (=> b!1567798 m!1442543))

(assert (=> b!1567798 m!1442555))

(declare-fun m!1442557 () Bool)

(assert (=> b!1567798 m!1442557))

(declare-fun m!1442559 () Bool)

(assert (=> b!1567798 m!1442559))

(assert (=> b!1567804 m!1442539))

(assert (=> b!1567804 m!1442539))

(declare-fun m!1442561 () Bool)

(assert (=> b!1567804 m!1442561))

(assert (=> b!1567809 m!1442539))

(assert (=> b!1567809 m!1442539))

(assert (=> b!1567809 m!1442561))

(assert (=> b!1567688 d!163887))

(declare-fun d!163889 () Bool)

(declare-fun e!874033 () Bool)

(assert (=> d!163889 e!874033))

(declare-fun res!1070927 () Bool)

(assert (=> d!163889 (=> (not res!1070927) (not e!874033))))

(declare-fun lt!673151 () ListLongMap!22703)

(assert (=> d!163889 (= res!1070927 (contains!10368 lt!673151 (_1!12641 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))))))

(declare-fun lt!673152 () List!36625)

(assert (=> d!163889 (= lt!673151 (ListLongMap!22704 lt!673152))))

(declare-fun lt!673153 () Unit!51904)

(declare-fun lt!673150 () Unit!51904)

(assert (=> d!163889 (= lt!673153 lt!673150)))

(declare-datatypes ((Option!863 0))(
  ( (Some!862 (v!22289 V!60089)) (None!861) )
))
(declare-fun getValueByKey!788 (List!36625 (_ BitVec 64)) Option!863)

(assert (=> d!163889 (= (getValueByKey!788 lt!673152 (_1!12641 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))) (Some!862 (_2!12641 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))))))

(declare-fun lemmaContainsTupThenGetReturnValue!385 (List!36625 (_ BitVec 64) V!60089) Unit!51904)

(assert (=> d!163889 (= lt!673150 (lemmaContainsTupThenGetReturnValue!385 lt!673152 (_1!12641 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092)) (_2!12641 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))))))

(declare-fun insertStrictlySorted!577 (List!36625 (_ BitVec 64) V!60089) List!36625)

(assert (=> d!163889 (= lt!673152 (insertStrictlySorted!577 (toList!11367 lt!673091) (_1!12641 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092)) (_2!12641 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))))))

(assert (=> d!163889 (= (+!5105 lt!673091 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092)) lt!673151)))

(declare-fun b!1567814 () Bool)

(declare-fun res!1070928 () Bool)

(assert (=> b!1567814 (=> (not res!1070928) (not e!874033))))

(assert (=> b!1567814 (= res!1070928 (= (getValueByKey!788 (toList!11367 lt!673151) (_1!12641 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))) (Some!862 (_2!12641 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092)))))))

(declare-fun b!1567815 () Bool)

(declare-fun contains!10370 (List!36625 tuple2!25260) Bool)

(assert (=> b!1567815 (= e!874033 (contains!10370 (toList!11367 lt!673151) (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092)))))

(assert (= (and d!163889 res!1070927) b!1567814))

(assert (= (and b!1567814 res!1070928) b!1567815))

(declare-fun m!1442563 () Bool)

(assert (=> d!163889 m!1442563))

(declare-fun m!1442565 () Bool)

(assert (=> d!163889 m!1442565))

(declare-fun m!1442567 () Bool)

(assert (=> d!163889 m!1442567))

(declare-fun m!1442569 () Bool)

(assert (=> d!163889 m!1442569))

(declare-fun m!1442571 () Bool)

(assert (=> b!1567814 m!1442571))

(declare-fun m!1442573 () Bool)

(assert (=> b!1567815 m!1442573))

(assert (=> b!1567688 d!163889))

(declare-fun d!163891 () Bool)

(assert (=> d!163891 (not (contains!10368 (+!5105 lt!673091 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673156 () Unit!51904)

(declare-fun choose!2067 (ListLongMap!22703 (_ BitVec 64) V!60089 (_ BitVec 64)) Unit!51904)

(assert (=> d!163891 (= lt!673156 (choose!2067 lt!673091 (select (arr!50498 _keys!637) from!782) lt!673092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874036 () Bool)

(assert (=> d!163891 e!874036))

(declare-fun res!1070931 () Bool)

(assert (=> d!163891 (=> (not res!1070931) (not e!874036))))

(assert (=> d!163891 (= res!1070931 (not (contains!10368 lt!673091 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163891 (= (addStillNotContains!556 lt!673091 (select (arr!50498 _keys!637) from!782) lt!673092 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673156)))

(declare-fun b!1567819 () Bool)

(assert (=> b!1567819 (= e!874036 (not (= (select (arr!50498 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163891 res!1070931) b!1567819))

(assert (=> d!163891 m!1442441))

(assert (=> d!163891 m!1442441))

(assert (=> d!163891 m!1442443))

(assert (=> d!163891 m!1442435))

(declare-fun m!1442575 () Bool)

(assert (=> d!163891 m!1442575))

(declare-fun m!1442577 () Bool)

(assert (=> d!163891 m!1442577))

(assert (=> b!1567688 d!163891))

(declare-fun d!163893 () Bool)

(declare-fun e!874042 () Bool)

(assert (=> d!163893 e!874042))

(declare-fun res!1070934 () Bool)

(assert (=> d!163893 (=> res!1070934 e!874042)))

(declare-fun lt!673166 () Bool)

(assert (=> d!163893 (= res!1070934 (not lt!673166))))

(declare-fun lt!673165 () Bool)

(assert (=> d!163893 (= lt!673166 lt!673165)))

(declare-fun lt!673167 () Unit!51904)

(declare-fun e!874041 () Unit!51904)

(assert (=> d!163893 (= lt!673167 e!874041)))

(declare-fun c!145099 () Bool)

(assert (=> d!163893 (= c!145099 lt!673165)))

(declare-fun containsKey!850 (List!36625 (_ BitVec 64)) Bool)

(assert (=> d!163893 (= lt!673165 (containsKey!850 (toList!11367 (+!5105 lt!673091 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163893 (= (contains!10368 (+!5105 lt!673091 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!673166)))

(declare-fun b!1567826 () Bool)

(declare-fun lt!673168 () Unit!51904)

(assert (=> b!1567826 (= e!874041 lt!673168)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!533 (List!36625 (_ BitVec 64)) Unit!51904)

(assert (=> b!1567826 (= lt!673168 (lemmaContainsKeyImpliesGetValueByKeyDefined!533 (toList!11367 (+!5105 lt!673091 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!579 (Option!863) Bool)

(assert (=> b!1567826 (isDefined!579 (getValueByKey!788 (toList!11367 (+!5105 lt!673091 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567827 () Bool)

(declare-fun Unit!51908 () Unit!51904)

(assert (=> b!1567827 (= e!874041 Unit!51908)))

(declare-fun b!1567828 () Bool)

(assert (=> b!1567828 (= e!874042 (isDefined!579 (getValueByKey!788 (toList!11367 (+!5105 lt!673091 (tuple2!25261 (select (arr!50498 _keys!637) from!782) lt!673092))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163893 c!145099) b!1567826))

(assert (= (and d!163893 (not c!145099)) b!1567827))

(assert (= (and d!163893 (not res!1070934)) b!1567828))

(declare-fun m!1442579 () Bool)

(assert (=> d!163893 m!1442579))

(declare-fun m!1442581 () Bool)

(assert (=> b!1567826 m!1442581))

(declare-fun m!1442583 () Bool)

(assert (=> b!1567826 m!1442583))

(assert (=> b!1567826 m!1442583))

(declare-fun m!1442585 () Bool)

(assert (=> b!1567826 m!1442585))

(assert (=> b!1567828 m!1442583))

(assert (=> b!1567828 m!1442583))

(assert (=> b!1567828 m!1442585))

(assert (=> b!1567688 d!163893))

(declare-fun d!163895 () Bool)

(assert (=> d!163895 (= (validKeyInArray!0 (select (arr!50498 _keys!637) from!782)) (and (not (= (select (arr!50498 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50498 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567687 d!163895))

(declare-fun d!163897 () Bool)

(declare-fun res!1070942 () Bool)

(declare-fun e!874053 () Bool)

(assert (=> d!163897 (=> res!1070942 e!874053)))

(assert (=> d!163897 (= res!1070942 (bvsge #b00000000000000000000000000000000 (size!51049 _keys!637)))))

(assert (=> d!163897 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36623) e!874053)))

(declare-fun b!1567839 () Bool)

(declare-fun e!874051 () Bool)

(declare-fun call!72032 () Bool)

(assert (=> b!1567839 (= e!874051 call!72032)))

(declare-fun b!1567840 () Bool)

(assert (=> b!1567840 (= e!874051 call!72032)))

(declare-fun b!1567841 () Bool)

(declare-fun e!874054 () Bool)

(assert (=> b!1567841 (= e!874054 e!874051)))

(declare-fun c!145102 () Bool)

(assert (=> b!1567841 (= c!145102 (validKeyInArray!0 (select (arr!50498 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567842 () Bool)

(assert (=> b!1567842 (= e!874053 e!874054)))

(declare-fun res!1070941 () Bool)

(assert (=> b!1567842 (=> (not res!1070941) (not e!874054))))

(declare-fun e!874052 () Bool)

(assert (=> b!1567842 (= res!1070941 (not e!874052))))

(declare-fun res!1070943 () Bool)

(assert (=> b!1567842 (=> (not res!1070943) (not e!874052))))

(assert (=> b!1567842 (= res!1070943 (validKeyInArray!0 (select (arr!50498 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567843 () Bool)

(declare-fun contains!10371 (List!36626 (_ BitVec 64)) Bool)

(assert (=> b!1567843 (= e!874052 (contains!10371 Nil!36623 (select (arr!50498 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!72029 () Bool)

(assert (=> bm!72029 (= call!72032 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145102 (Cons!36622 (select (arr!50498 _keys!637) #b00000000000000000000000000000000) Nil!36623) Nil!36623)))))

(assert (= (and d!163897 (not res!1070942)) b!1567842))

(assert (= (and b!1567842 res!1070943) b!1567843))

(assert (= (and b!1567842 res!1070941) b!1567841))

(assert (= (and b!1567841 c!145102) b!1567839))

(assert (= (and b!1567841 (not c!145102)) b!1567840))

(assert (= (or b!1567839 b!1567840) bm!72029))

(assert (=> b!1567841 m!1442521))

(assert (=> b!1567841 m!1442521))

(assert (=> b!1567841 m!1442523))

(assert (=> b!1567842 m!1442521))

(assert (=> b!1567842 m!1442521))

(assert (=> b!1567842 m!1442523))

(assert (=> b!1567843 m!1442521))

(assert (=> b!1567843 m!1442521))

(declare-fun m!1442587 () Bool)

(assert (=> b!1567843 m!1442587))

(assert (=> bm!72029 m!1442521))

(declare-fun m!1442589 () Bool)

(assert (=> bm!72029 m!1442589))

(assert (=> b!1567692 d!163897))

(declare-fun condMapEmpty!59764 () Bool)

(declare-fun mapDefault!59764 () ValueCell!18425)

(assert (=> mapNonEmpty!59755 (= condMapEmpty!59764 (= mapRest!59755 ((as const (Array (_ BitVec 32) ValueCell!18425)) mapDefault!59764)))))

(declare-fun e!874059 () Bool)

(declare-fun mapRes!59764 () Bool)

(assert (=> mapNonEmpty!59755 (= tp!113710 (and e!874059 mapRes!59764))))

(declare-fun mapIsEmpty!59764 () Bool)

(assert (=> mapIsEmpty!59764 mapRes!59764))

(declare-fun b!1567850 () Bool)

(declare-fun e!874060 () Bool)

(assert (=> b!1567850 (= e!874060 tp_is_empty!38911)))

(declare-fun mapNonEmpty!59764 () Bool)

(declare-fun tp!113725 () Bool)

(assert (=> mapNonEmpty!59764 (= mapRes!59764 (and tp!113725 e!874060))))

(declare-fun mapKey!59764 () (_ BitVec 32))

(declare-fun mapValue!59764 () ValueCell!18425)

(declare-fun mapRest!59764 () (Array (_ BitVec 32) ValueCell!18425))

(assert (=> mapNonEmpty!59764 (= mapRest!59755 (store mapRest!59764 mapKey!59764 mapValue!59764))))

(declare-fun b!1567851 () Bool)

(assert (=> b!1567851 (= e!874059 tp_is_empty!38911)))

(assert (= (and mapNonEmpty!59755 condMapEmpty!59764) mapIsEmpty!59764))

(assert (= (and mapNonEmpty!59755 (not condMapEmpty!59764)) mapNonEmpty!59764))

(assert (= (and mapNonEmpty!59764 ((_ is ValueCellFull!18425) mapValue!59764)) b!1567850))

(assert (= (and mapNonEmpty!59755 ((_ is ValueCellFull!18425) mapDefault!59764)) b!1567851))

(declare-fun m!1442591 () Bool)

(assert (=> mapNonEmpty!59764 m!1442591))

(declare-fun b_lambda!24947 () Bool)

(assert (= b_lambda!24943 (or (and start!134304 b_free!32137) b_lambda!24947)))

(declare-fun b_lambda!24949 () Bool)

(assert (= b_lambda!24945 (or (and start!134304 b_free!32137) b_lambda!24949)))

(check-sat (not b!1567798) (not b!1567803) (not mapNonEmpty!59764) (not b!1567809) (not bm!72026) (not b!1567808) b_and!51727 (not b_lambda!24947) (not b!1567805) (not b!1567800) (not b!1567799) (not d!163891) (not b_next!32137) (not d!163889) tp_is_empty!38911 (not b!1567815) (not b!1567841) (not bm!72023) (not b!1567814) (not b!1567826) (not b!1567828) (not b_lambda!24941) (not d!163887) (not b!1567767) (not d!163893) (not b!1567842) (not b!1567764) (not b_lambda!24949) (not b!1567804) (not b!1567772) (not b!1567843) (not bm!72029) (not b!1567773))
(check-sat b_and!51727 (not b_next!32137))
