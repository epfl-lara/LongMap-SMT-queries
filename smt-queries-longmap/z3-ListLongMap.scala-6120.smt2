; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78830 () Bool)

(assert start!78830)

(declare-fun b_free!17043 () Bool)

(declare-fun b_next!17043 () Bool)

(assert (=> start!78830 (= b_free!17043 (not b_next!17043))))

(declare-fun tp!59570 () Bool)

(declare-fun b_and!27823 () Bool)

(assert (=> start!78830 (= tp!59570 b_and!27823)))

(declare-fun b!920531 () Bool)

(declare-fun e!516643 () Bool)

(declare-fun e!516644 () Bool)

(assert (=> b!920531 (= e!516643 e!516644)))

(declare-fun res!620754 () Bool)

(assert (=> b!920531 (=> (not res!620754) (not e!516644))))

(declare-datatypes ((V!31033 0))(
  ( (V!31034 (val!9826 Int)) )
))
(declare-datatypes ((tuple2!12776 0))(
  ( (tuple2!12777 (_1!6399 (_ BitVec 64)) (_2!6399 V!31033)) )
))
(declare-datatypes ((List!18579 0))(
  ( (Nil!18576) (Cons!18575 (h!19721 tuple2!12776) (t!26352 List!18579)) )
))
(declare-datatypes ((ListLongMap!11473 0))(
  ( (ListLongMap!11474 (toList!5752 List!18579)) )
))
(declare-fun lt!413255 () ListLongMap!11473)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4800 (ListLongMap!11473 (_ BitVec 64)) Bool)

(assert (=> b!920531 (= res!620754 (contains!4800 lt!413255 k0!1099))))

(declare-datatypes ((array!55082 0))(
  ( (array!55083 (arr!26486 (Array (_ BitVec 32) (_ BitVec 64))) (size!26945 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55082)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9294 0))(
  ( (ValueCellFull!9294 (v!12344 V!31033)) (EmptyCell!9294) )
))
(declare-datatypes ((array!55084 0))(
  ( (array!55085 (arr!26487 (Array (_ BitVec 32) ValueCell!9294)) (size!26946 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55084)

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31033)

(declare-fun minValue!1173 () V!31033)

(declare-fun getCurrentListMap!3007 (array!55082 array!55084 (_ BitVec 32) (_ BitVec 32) V!31033 V!31033 (_ BitVec 32) Int) ListLongMap!11473)

(assert (=> b!920531 (= lt!413255 (getCurrentListMap!3007 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920532 () Bool)

(declare-fun res!620752 () Bool)

(assert (=> b!920532 (=> (not res!620752) (not e!516643))))

(declare-datatypes ((List!18580 0))(
  ( (Nil!18577) (Cons!18576 (h!19722 (_ BitVec 64)) (t!26353 List!18580)) )
))
(declare-fun arrayNoDuplicates!0 (array!55082 (_ BitVec 32) List!18580) Bool)

(assert (=> b!920532 (= res!620752 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18577))))

(declare-fun b!920533 () Bool)

(declare-fun e!516642 () Bool)

(assert (=> b!920533 (= e!516644 e!516642)))

(declare-fun res!620755 () Bool)

(assert (=> b!920533 (=> (not res!620755) (not e!516642))))

(declare-fun lt!413262 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920533 (= res!620755 (validKeyInArray!0 lt!413262))))

(assert (=> b!920533 (= lt!413262 (select (arr!26486 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920534 () Bool)

(declare-fun res!620756 () Bool)

(assert (=> b!920534 (=> (not res!620756) (not e!516643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55082 (_ BitVec 32)) Bool)

(assert (=> b!920534 (= res!620756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!620762 () Bool)

(assert (=> start!78830 (=> (not res!620762) (not e!516643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78830 (= res!620762 (validMask!0 mask!1881))))

(assert (=> start!78830 e!516643))

(assert (=> start!78830 true))

(declare-fun tp_is_empty!19551 () Bool)

(assert (=> start!78830 tp_is_empty!19551))

(declare-fun e!516646 () Bool)

(declare-fun array_inv!20640 (array!55084) Bool)

(assert (=> start!78830 (and (array_inv!20640 _values!1231) e!516646)))

(assert (=> start!78830 tp!59570))

(declare-fun array_inv!20641 (array!55082) Bool)

(assert (=> start!78830 (array_inv!20641 _keys!1487)))

(declare-fun mapNonEmpty!31083 () Bool)

(declare-fun mapRes!31083 () Bool)

(declare-fun tp!59569 () Bool)

(declare-fun e!516638 () Bool)

(assert (=> mapNonEmpty!31083 (= mapRes!31083 (and tp!59569 e!516638))))

(declare-fun mapRest!31083 () (Array (_ BitVec 32) ValueCell!9294))

(declare-fun mapKey!31083 () (_ BitVec 32))

(declare-fun mapValue!31083 () ValueCell!9294)

(assert (=> mapNonEmpty!31083 (= (arr!26487 _values!1231) (store mapRest!31083 mapKey!31083 mapValue!31083))))

(declare-fun b!920535 () Bool)

(declare-fun e!516640 () Bool)

(assert (=> b!920535 (= e!516640 tp_is_empty!19551)))

(declare-fun b!920536 () Bool)

(declare-fun res!620759 () Bool)

(assert (=> b!920536 (=> (not res!620759) (not e!516643))))

(assert (=> b!920536 (= res!620759 (and (= (size!26946 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26945 _keys!1487) (size!26946 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920537 () Bool)

(assert (=> b!920537 (= e!516638 tp_is_empty!19551)))

(declare-fun b!920538 () Bool)

(declare-fun e!516639 () Bool)

(assert (=> b!920538 (= e!516639 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920539 () Bool)

(declare-fun e!516641 () Bool)

(assert (=> b!920539 (= e!516642 (not e!516641))))

(declare-fun res!620758 () Bool)

(assert (=> b!920539 (=> res!620758 e!516641)))

(assert (=> b!920539 (= res!620758 (or (bvsge (size!26945 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26945 _keys!1487))))))

(assert (=> b!920539 e!516639))

(declare-fun c!96066 () Bool)

(assert (=> b!920539 (= c!96066 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31068 0))(
  ( (Unit!31069) )
))
(declare-fun lt!413258 () Unit!31068)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!167 (array!55082 array!55084 (_ BitVec 32) (_ BitVec 32) V!31033 V!31033 (_ BitVec 64) (_ BitVec 32) Int) Unit!31068)

(assert (=> b!920539 (= lt!413258 (lemmaListMapContainsThenArrayContainsFrom!167 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!920539 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18577)))

(declare-fun lt!413260 () Unit!31068)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55082 (_ BitVec 32) (_ BitVec 32)) Unit!31068)

(assert (=> b!920539 (= lt!413260 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413256 () tuple2!12776)

(declare-fun +!2660 (ListLongMap!11473 tuple2!12776) ListLongMap!11473)

(assert (=> b!920539 (contains!4800 (+!2660 lt!413255 lt!413256) k0!1099)))

(declare-fun lt!413263 () Unit!31068)

(declare-fun lt!413259 () V!31033)

(declare-fun addStillContains!384 (ListLongMap!11473 (_ BitVec 64) V!31033 (_ BitVec 64)) Unit!31068)

(assert (=> b!920539 (= lt!413263 (addStillContains!384 lt!413255 lt!413262 lt!413259 k0!1099))))

(assert (=> b!920539 (= (getCurrentListMap!3007 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2660 (getCurrentListMap!3007 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413256))))

(assert (=> b!920539 (= lt!413256 (tuple2!12777 lt!413262 lt!413259))))

(declare-fun get!13897 (ValueCell!9294 V!31033) V!31033)

(declare-fun dynLambda!1449 (Int (_ BitVec 64)) V!31033)

(assert (=> b!920539 (= lt!413259 (get!13897 (select (arr!26487 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1449 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413257 () Unit!31068)

(declare-fun lemmaListMapRecursiveValidKeyArray!50 (array!55082 array!55084 (_ BitVec 32) (_ BitVec 32) V!31033 V!31033 (_ BitVec 32) Int) Unit!31068)

(assert (=> b!920539 (= lt!413257 (lemmaListMapRecursiveValidKeyArray!50 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920540 () Bool)

(declare-fun res!620760 () Bool)

(assert (=> b!920540 (=> res!620760 e!516641)))

(declare-fun noDuplicate!1334 (List!18580) Bool)

(assert (=> b!920540 (= res!620760 (not (noDuplicate!1334 Nil!18577)))))

(declare-fun b!920541 () Bool)

(declare-fun res!620753 () Bool)

(assert (=> b!920541 (=> res!620753 e!516641)))

(declare-fun contains!4801 (List!18580 (_ BitVec 64)) Bool)

(assert (=> b!920541 (= res!620753 (contains!4801 Nil!18577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920542 () Bool)

(declare-fun res!620764 () Bool)

(assert (=> b!920542 (=> (not res!620764) (not e!516643))))

(assert (=> b!920542 (= res!620764 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26945 _keys!1487))))))

(declare-fun b!920543 () Bool)

(declare-fun res!620761 () Bool)

(assert (=> b!920543 (=> (not res!620761) (not e!516644))))

(declare-fun v!791 () V!31033)

(declare-fun apply!593 (ListLongMap!11473 (_ BitVec 64)) V!31033)

(assert (=> b!920543 (= res!620761 (= (apply!593 lt!413255 k0!1099) v!791))))

(declare-fun b!920544 () Bool)

(assert (=> b!920544 (= e!516641 true)))

(declare-fun lt!413261 () Bool)

(assert (=> b!920544 (= lt!413261 (contains!4801 Nil!18577 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920545 () Bool)

(assert (=> b!920545 (= e!516646 (and e!516640 mapRes!31083))))

(declare-fun condMapEmpty!31083 () Bool)

(declare-fun mapDefault!31083 () ValueCell!9294)

(assert (=> b!920545 (= condMapEmpty!31083 (= (arr!26487 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9294)) mapDefault!31083)))))

(declare-fun b!920546 () Bool)

(declare-fun res!620757 () Bool)

(assert (=> b!920546 (=> (not res!620757) (not e!516644))))

(assert (=> b!920546 (= res!620757 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920547 () Bool)

(declare-fun arrayContainsKey!0 (array!55082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920547 (= e!516639 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!31083 () Bool)

(assert (=> mapIsEmpty!31083 mapRes!31083))

(declare-fun b!920548 () Bool)

(declare-fun res!620763 () Bool)

(assert (=> b!920548 (=> (not res!620763) (not e!516644))))

(assert (=> b!920548 (= res!620763 (validKeyInArray!0 k0!1099))))

(assert (= (and start!78830 res!620762) b!920536))

(assert (= (and b!920536 res!620759) b!920534))

(assert (= (and b!920534 res!620756) b!920532))

(assert (= (and b!920532 res!620752) b!920542))

(assert (= (and b!920542 res!620764) b!920531))

(assert (= (and b!920531 res!620754) b!920543))

(assert (= (and b!920543 res!620761) b!920546))

(assert (= (and b!920546 res!620757) b!920548))

(assert (= (and b!920548 res!620763) b!920533))

(assert (= (and b!920533 res!620755) b!920539))

(assert (= (and b!920539 c!96066) b!920547))

(assert (= (and b!920539 (not c!96066)) b!920538))

(assert (= (and b!920539 (not res!620758)) b!920540))

(assert (= (and b!920540 (not res!620760)) b!920541))

(assert (= (and b!920541 (not res!620753)) b!920544))

(assert (= (and b!920545 condMapEmpty!31083) mapIsEmpty!31083))

(assert (= (and b!920545 (not condMapEmpty!31083)) mapNonEmpty!31083))

(get-info :version)

(assert (= (and mapNonEmpty!31083 ((_ is ValueCellFull!9294) mapValue!31083)) b!920537))

(assert (= (and b!920545 ((_ is ValueCellFull!9294) mapDefault!31083)) b!920535))

(assert (= start!78830 b!920545))

(declare-fun b_lambda!13545 () Bool)

(assert (=> (not b_lambda!13545) (not b!920539)))

(declare-fun t!26351 () Bool)

(declare-fun tb!5623 () Bool)

(assert (=> (and start!78830 (= defaultEntry!1235 defaultEntry!1235) t!26351) tb!5623))

(declare-fun result!11069 () Bool)

(assert (=> tb!5623 (= result!11069 tp_is_empty!19551)))

(assert (=> b!920539 t!26351))

(declare-fun b_and!27825 () Bool)

(assert (= b_and!27823 (and (=> t!26351 result!11069) b_and!27825)))

(declare-fun m!854455 () Bool)

(assert (=> b!920534 m!854455))

(declare-fun m!854457 () Bool)

(assert (=> b!920532 m!854457))

(declare-fun m!854459 () Bool)

(assert (=> b!920548 m!854459))

(declare-fun m!854461 () Bool)

(assert (=> b!920543 m!854461))

(declare-fun m!854463 () Bool)

(assert (=> b!920541 m!854463))

(declare-fun m!854465 () Bool)

(assert (=> b!920539 m!854465))

(declare-fun m!854467 () Bool)

(assert (=> b!920539 m!854467))

(declare-fun m!854469 () Bool)

(assert (=> b!920539 m!854469))

(declare-fun m!854471 () Bool)

(assert (=> b!920539 m!854471))

(assert (=> b!920539 m!854467))

(declare-fun m!854473 () Bool)

(assert (=> b!920539 m!854473))

(declare-fun m!854475 () Bool)

(assert (=> b!920539 m!854475))

(declare-fun m!854477 () Bool)

(assert (=> b!920539 m!854477))

(declare-fun m!854479 () Bool)

(assert (=> b!920539 m!854479))

(declare-fun m!854481 () Bool)

(assert (=> b!920539 m!854481))

(declare-fun m!854483 () Bool)

(assert (=> b!920539 m!854483))

(declare-fun m!854485 () Bool)

(assert (=> b!920539 m!854485))

(assert (=> b!920539 m!854471))

(assert (=> b!920539 m!854475))

(declare-fun m!854487 () Bool)

(assert (=> b!920539 m!854487))

(assert (=> b!920539 m!854483))

(declare-fun m!854489 () Bool)

(assert (=> b!920539 m!854489))

(declare-fun m!854491 () Bool)

(assert (=> b!920540 m!854491))

(declare-fun m!854493 () Bool)

(assert (=> b!920544 m!854493))

(declare-fun m!854495 () Bool)

(assert (=> b!920547 m!854495))

(declare-fun m!854497 () Bool)

(assert (=> b!920531 m!854497))

(declare-fun m!854499 () Bool)

(assert (=> b!920531 m!854499))

(declare-fun m!854501 () Bool)

(assert (=> start!78830 m!854501))

(declare-fun m!854503 () Bool)

(assert (=> start!78830 m!854503))

(declare-fun m!854505 () Bool)

(assert (=> start!78830 m!854505))

(declare-fun m!854507 () Bool)

(assert (=> mapNonEmpty!31083 m!854507))

(declare-fun m!854509 () Bool)

(assert (=> b!920533 m!854509))

(declare-fun m!854511 () Bool)

(assert (=> b!920533 m!854511))

(check-sat (not b!920548) (not b!920533) (not b!920547) (not b!920543) (not b!920534) (not b!920540) (not mapNonEmpty!31083) (not b_lambda!13545) (not b!920541) tp_is_empty!19551 (not b_next!17043) b_and!27825 (not b!920539) (not b!920532) (not b!920544) (not start!78830) (not b!920531))
(check-sat b_and!27825 (not b_next!17043))
