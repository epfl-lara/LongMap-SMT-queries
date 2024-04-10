; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35470 () Bool)

(assert start!35470)

(declare-fun b_free!7857 () Bool)

(declare-fun b_next!7857 () Bool)

(assert (=> start!35470 (= b_free!7857 (not b_next!7857))))

(declare-fun tp!27357 () Bool)

(declare-fun b_and!15099 () Bool)

(assert (=> start!35470 (= tp!27357 b_and!15099)))

(declare-fun b!355424 () Bool)

(declare-fun res!197176 () Bool)

(declare-fun e!217717 () Bool)

(assert (=> b!355424 (=> (not res!197176) (not e!217717))))

(declare-datatypes ((array!19425 0))(
  ( (array!19426 (arr!9206 (Array (_ BitVec 32) (_ BitVec 64))) (size!9558 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19425)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19425 (_ BitVec 32)) Bool)

(assert (=> b!355424 (= res!197176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355425 () Bool)

(assert (=> b!355425 (= e!217717 (not true))))

(declare-datatypes ((V!11541 0))(
  ( (V!11542 (val!4006 Int)) )
))
(declare-fun minValue!1150 () V!11541)

(declare-fun defaultEntry!1216 () Int)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3618 0))(
  ( (ValueCellFull!3618 (v!6200 V!11541)) (EmptyCell!3618) )
))
(declare-datatypes ((array!19427 0))(
  ( (array!19428 (arr!9207 (Array (_ BitVec 32) ValueCell!3618)) (size!9559 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19427)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11541)

(declare-datatypes ((tuple2!5692 0))(
  ( (tuple2!5693 (_1!2857 (_ BitVec 64)) (_2!2857 V!11541)) )
))
(declare-datatypes ((List!5335 0))(
  ( (Nil!5332) (Cons!5331 (h!6187 tuple2!5692) (t!10485 List!5335)) )
))
(declare-datatypes ((ListLongMap!4605 0))(
  ( (ListLongMap!4606 (toList!2318 List!5335)) )
))
(declare-fun contains!2398 (ListLongMap!4605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1839 (array!19425 array!19427 (_ BitVec 32) (_ BitVec 32) V!11541 V!11541 (_ BitVec 32) Int) ListLongMap!4605)

(assert (=> b!355425 (contains!2398 (getCurrentListMap!1839 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9206 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10958 0))(
  ( (Unit!10959) )
))
(declare-fun lt!165800 () Unit!10958)

(declare-fun lemmaValidKeyInArrayIsInListMap!196 (array!19425 array!19427 (_ BitVec 32) (_ BitVec 32) V!11541 V!11541 (_ BitVec 32) Int) Unit!10958)

(assert (=> b!355425 (= lt!165800 (lemmaValidKeyInArrayIsInListMap!196 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355426 () Bool)

(declare-fun e!217718 () Bool)

(declare-fun tp_is_empty!7923 () Bool)

(assert (=> b!355426 (= e!217718 tp_is_empty!7923)))

(declare-fun b!355427 () Bool)

(declare-fun e!217720 () Bool)

(declare-fun e!217719 () Bool)

(declare-fun mapRes!13392 () Bool)

(assert (=> b!355427 (= e!217720 (and e!217719 mapRes!13392))))

(declare-fun condMapEmpty!13392 () Bool)

(declare-fun mapDefault!13392 () ValueCell!3618)

(assert (=> b!355427 (= condMapEmpty!13392 (= (arr!9207 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3618)) mapDefault!13392)))))

(declare-fun b!355428 () Bool)

(declare-fun res!197177 () Bool)

(assert (=> b!355428 (=> (not res!197177) (not e!217717))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!355428 (= res!197177 (= (select (arr!9206 _keys!1456) from!1805) k0!1077))))

(declare-fun res!197180 () Bool)

(assert (=> start!35470 (=> (not res!197180) (not e!217717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35470 (= res!197180 (validMask!0 mask!1842))))

(assert (=> start!35470 e!217717))

(assert (=> start!35470 tp_is_empty!7923))

(assert (=> start!35470 true))

(assert (=> start!35470 tp!27357))

(declare-fun array_inv!6764 (array!19425) Bool)

(assert (=> start!35470 (array_inv!6764 _keys!1456)))

(declare-fun array_inv!6765 (array!19427) Bool)

(assert (=> start!35470 (and (array_inv!6765 _values!1208) e!217720)))

(declare-fun b!355429 () Bool)

(declare-fun res!197178 () Bool)

(assert (=> b!355429 (=> (not res!197178) (not e!217717))))

(assert (=> b!355429 (= res!197178 (and (= (size!9559 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9558 _keys!1456) (size!9559 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355430 () Bool)

(declare-fun res!197179 () Bool)

(assert (=> b!355430 (=> (not res!197179) (not e!217717))))

(declare-datatypes ((List!5336 0))(
  ( (Nil!5333) (Cons!5332 (h!6188 (_ BitVec 64)) (t!10486 List!5336)) )
))
(declare-fun arrayNoDuplicates!0 (array!19425 (_ BitVec 32) List!5336) Bool)

(assert (=> b!355430 (= res!197179 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5333))))

(declare-fun mapNonEmpty!13392 () Bool)

(declare-fun tp!27356 () Bool)

(assert (=> mapNonEmpty!13392 (= mapRes!13392 (and tp!27356 e!217718))))

(declare-fun mapKey!13392 () (_ BitVec 32))

(declare-fun mapValue!13392 () ValueCell!3618)

(declare-fun mapRest!13392 () (Array (_ BitVec 32) ValueCell!3618))

(assert (=> mapNonEmpty!13392 (= (arr!9207 _values!1208) (store mapRest!13392 mapKey!13392 mapValue!13392))))

(declare-fun b!355431 () Bool)

(declare-fun res!197175 () Bool)

(assert (=> b!355431 (=> (not res!197175) (not e!217717))))

(assert (=> b!355431 (= res!197175 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9558 _keys!1456))))))

(declare-fun mapIsEmpty!13392 () Bool)

(assert (=> mapIsEmpty!13392 mapRes!13392))

(declare-fun b!355432 () Bool)

(declare-fun res!197174 () Bool)

(assert (=> b!355432 (=> (not res!197174) (not e!217717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355432 (= res!197174 (validKeyInArray!0 k0!1077))))

(declare-fun b!355433 () Bool)

(assert (=> b!355433 (= e!217719 tp_is_empty!7923)))

(declare-fun b!355434 () Bool)

(declare-fun res!197182 () Bool)

(assert (=> b!355434 (=> (not res!197182) (not e!217717))))

(assert (=> b!355434 (= res!197182 (validKeyInArray!0 (select (arr!9206 _keys!1456) from!1805)))))

(declare-fun b!355435 () Bool)

(declare-fun res!197181 () Bool)

(assert (=> b!355435 (=> (not res!197181) (not e!217717))))

(declare-fun arrayContainsKey!0 (array!19425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355435 (= res!197181 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(assert (= (and start!35470 res!197180) b!355429))

(assert (= (and b!355429 res!197178) b!355424))

(assert (= (and b!355424 res!197176) b!355430))

(assert (= (and b!355430 res!197179) b!355432))

(assert (= (and b!355432 res!197174) b!355431))

(assert (= (and b!355431 res!197175) b!355435))

(assert (= (and b!355435 res!197181) b!355428))

(assert (= (and b!355428 res!197177) b!355434))

(assert (= (and b!355434 res!197182) b!355425))

(assert (= (and b!355427 condMapEmpty!13392) mapIsEmpty!13392))

(assert (= (and b!355427 (not condMapEmpty!13392)) mapNonEmpty!13392))

(get-info :version)

(assert (= (and mapNonEmpty!13392 ((_ is ValueCellFull!3618) mapValue!13392)) b!355426))

(assert (= (and b!355427 ((_ is ValueCellFull!3618) mapDefault!13392)) b!355433))

(assert (= start!35470 b!355427))

(declare-fun m!354147 () Bool)

(assert (=> mapNonEmpty!13392 m!354147))

(declare-fun m!354149 () Bool)

(assert (=> b!355428 m!354149))

(declare-fun m!354151 () Bool)

(assert (=> b!355430 m!354151))

(declare-fun m!354153 () Bool)

(assert (=> b!355432 m!354153))

(declare-fun m!354155 () Bool)

(assert (=> start!35470 m!354155))

(declare-fun m!354157 () Bool)

(assert (=> start!35470 m!354157))

(declare-fun m!354159 () Bool)

(assert (=> start!35470 m!354159))

(declare-fun m!354161 () Bool)

(assert (=> b!355424 m!354161))

(assert (=> b!355434 m!354149))

(assert (=> b!355434 m!354149))

(declare-fun m!354163 () Bool)

(assert (=> b!355434 m!354163))

(declare-fun m!354165 () Bool)

(assert (=> b!355425 m!354165))

(assert (=> b!355425 m!354149))

(assert (=> b!355425 m!354165))

(assert (=> b!355425 m!354149))

(declare-fun m!354167 () Bool)

(assert (=> b!355425 m!354167))

(declare-fun m!354169 () Bool)

(assert (=> b!355425 m!354169))

(declare-fun m!354171 () Bool)

(assert (=> b!355435 m!354171))

(check-sat (not b!355430) (not b!355425) b_and!15099 (not b!355432) (not b!355434) tp_is_empty!7923 (not b!355435) (not b_next!7857) (not b!355424) (not start!35470) (not mapNonEmpty!13392))
(check-sat b_and!15099 (not b_next!7857))
