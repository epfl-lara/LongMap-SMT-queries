; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110596 () Bool)

(assert start!110596)

(declare-fun b_free!29431 () Bool)

(declare-fun b_next!29431 () Bool)

(assert (=> start!110596 (= b_free!29431 (not b_next!29431))))

(declare-fun tp!103615 () Bool)

(declare-fun b_and!47621 () Bool)

(assert (=> start!110596 (= tp!103615 b_and!47621)))

(declare-fun b!1308465 () Bool)

(declare-fun res!868616 () Bool)

(declare-fun e!746564 () Bool)

(assert (=> b!1308465 (=> (not res!868616) (not e!746564))))

(declare-datatypes ((array!87237 0))(
  ( (array!87238 (arr!42099 (Array (_ BitVec 32) (_ BitVec 64))) (size!42651 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87237)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308465 (= res!868616 (validKeyInArray!0 (select (arr!42099 _keys!1628) from!2020)))))

(declare-fun b!1308466 () Bool)

(assert (=> b!1308466 (= e!746564 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51985 0))(
  ( (V!51986 (val!17655 Int)) )
))
(declare-fun minValue!1296 () V!51985)

(declare-datatypes ((ValueCell!16682 0))(
  ( (ValueCellFull!16682 (v!20281 V!51985)) (EmptyCell!16682) )
))
(declare-datatypes ((array!87239 0))(
  ( (array!87240 (arr!42100 (Array (_ BitVec 32) ValueCell!16682)) (size!42652 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87239)

(declare-fun zeroValue!1296 () V!51985)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22816 0))(
  ( (tuple2!22817 (_1!11419 (_ BitVec 64)) (_2!11419 V!51985)) )
))
(declare-datatypes ((List!29943 0))(
  ( (Nil!29940) (Cons!29939 (h!31148 tuple2!22816) (t!43541 List!29943)) )
))
(declare-datatypes ((ListLongMap!20473 0))(
  ( (ListLongMap!20474 (toList!10252 List!29943)) )
))
(declare-fun contains!8329 (ListLongMap!20473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5147 (array!87237 array!87239 (_ BitVec 32) (_ BitVec 32) V!51985 V!51985 (_ BitVec 32) Int) ListLongMap!20473)

(assert (=> b!1308466 (contains!8329 (getCurrentListMap!5147 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43137 0))(
  ( (Unit!43138) )
))
(declare-fun lt!584979 () Unit!43137)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!13 (array!87237 array!87239 (_ BitVec 32) (_ BitVec 32) V!51985 V!51985 (_ BitVec 64) (_ BitVec 32) Int) Unit!43137)

(assert (=> b!1308466 (= lt!584979 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!13 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308467 () Bool)

(declare-fun res!868614 () Bool)

(assert (=> b!1308467 (=> (not res!868614) (not e!746564))))

(assert (=> b!1308467 (= res!868614 (contains!8329 (getCurrentListMap!5147 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308468 () Bool)

(declare-fun res!868612 () Bool)

(assert (=> b!1308468 (=> (not res!868612) (not e!746564))))

(assert (=> b!1308468 (= res!868612 (not (= (select (arr!42099 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308469 () Bool)

(declare-fun e!746561 () Bool)

(declare-fun tp_is_empty!35161 () Bool)

(assert (=> b!1308469 (= e!746561 tp_is_empty!35161)))

(declare-fun b!1308470 () Bool)

(declare-fun res!868610 () Bool)

(assert (=> b!1308470 (=> (not res!868610) (not e!746564))))

(assert (=> b!1308470 (= res!868610 (and (= (size!42652 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42651 _keys!1628) (size!42652 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54370 () Bool)

(declare-fun mapRes!54370 () Bool)

(declare-fun tp!103616 () Bool)

(declare-fun e!746562 () Bool)

(assert (=> mapNonEmpty!54370 (= mapRes!54370 (and tp!103616 e!746562))))

(declare-fun mapRest!54370 () (Array (_ BitVec 32) ValueCell!16682))

(declare-fun mapKey!54370 () (_ BitVec 32))

(declare-fun mapValue!54370 () ValueCell!16682)

(assert (=> mapNonEmpty!54370 (= (arr!42100 _values!1354) (store mapRest!54370 mapKey!54370 mapValue!54370))))

(declare-fun b!1308471 () Bool)

(assert (=> b!1308471 (= e!746562 tp_is_empty!35161)))

(declare-fun res!868613 () Bool)

(assert (=> start!110596 (=> (not res!868613) (not e!746564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110596 (= res!868613 (validMask!0 mask!2040))))

(assert (=> start!110596 e!746564))

(assert (=> start!110596 tp!103615))

(declare-fun array_inv!32011 (array!87237) Bool)

(assert (=> start!110596 (array_inv!32011 _keys!1628)))

(assert (=> start!110596 true))

(assert (=> start!110596 tp_is_empty!35161))

(declare-fun e!746563 () Bool)

(declare-fun array_inv!32012 (array!87239) Bool)

(assert (=> start!110596 (and (array_inv!32012 _values!1354) e!746563)))

(declare-fun b!1308472 () Bool)

(declare-fun res!868617 () Bool)

(assert (=> b!1308472 (=> (not res!868617) (not e!746564))))

(declare-datatypes ((List!29944 0))(
  ( (Nil!29941) (Cons!29940 (h!31149 (_ BitVec 64)) (t!43542 List!29944)) )
))
(declare-fun arrayNoDuplicates!0 (array!87237 (_ BitVec 32) List!29944) Bool)

(assert (=> b!1308472 (= res!868617 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29941))))

(declare-fun b!1308473 () Bool)

(assert (=> b!1308473 (= e!746563 (and e!746561 mapRes!54370))))

(declare-fun condMapEmpty!54370 () Bool)

(declare-fun mapDefault!54370 () ValueCell!16682)

(assert (=> b!1308473 (= condMapEmpty!54370 (= (arr!42100 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16682)) mapDefault!54370)))))

(declare-fun mapIsEmpty!54370 () Bool)

(assert (=> mapIsEmpty!54370 mapRes!54370))

(declare-fun b!1308474 () Bool)

(declare-fun res!868615 () Bool)

(assert (=> b!1308474 (=> (not res!868615) (not e!746564))))

(assert (=> b!1308474 (= res!868615 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42651 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308475 () Bool)

(declare-fun res!868618 () Bool)

(assert (=> b!1308475 (=> (not res!868618) (not e!746564))))

(assert (=> b!1308475 (= res!868618 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308476 () Bool)

(declare-fun res!868611 () Bool)

(assert (=> b!1308476 (=> (not res!868611) (not e!746564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87237 (_ BitVec 32)) Bool)

(assert (=> b!1308476 (= res!868611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110596 res!868613) b!1308470))

(assert (= (and b!1308470 res!868610) b!1308476))

(assert (= (and b!1308476 res!868611) b!1308472))

(assert (= (and b!1308472 res!868617) b!1308474))

(assert (= (and b!1308474 res!868615) b!1308467))

(assert (= (and b!1308467 res!868614) b!1308468))

(assert (= (and b!1308468 res!868612) b!1308465))

(assert (= (and b!1308465 res!868616) b!1308475))

(assert (= (and b!1308475 res!868618) b!1308466))

(assert (= (and b!1308473 condMapEmpty!54370) mapIsEmpty!54370))

(assert (= (and b!1308473 (not condMapEmpty!54370)) mapNonEmpty!54370))

(get-info :version)

(assert (= (and mapNonEmpty!54370 ((_ is ValueCellFull!16682) mapValue!54370)) b!1308471))

(assert (= (and b!1308473 ((_ is ValueCellFull!16682) mapDefault!54370)) b!1308469))

(assert (= start!110596 b!1308473))

(declare-fun m!1198377 () Bool)

(assert (=> mapNonEmpty!54370 m!1198377))

(declare-fun m!1198379 () Bool)

(assert (=> b!1308467 m!1198379))

(assert (=> b!1308467 m!1198379))

(declare-fun m!1198381 () Bool)

(assert (=> b!1308467 m!1198381))

(declare-fun m!1198383 () Bool)

(assert (=> b!1308465 m!1198383))

(assert (=> b!1308465 m!1198383))

(declare-fun m!1198385 () Bool)

(assert (=> b!1308465 m!1198385))

(assert (=> b!1308468 m!1198383))

(declare-fun m!1198387 () Bool)

(assert (=> start!110596 m!1198387))

(declare-fun m!1198389 () Bool)

(assert (=> start!110596 m!1198389))

(declare-fun m!1198391 () Bool)

(assert (=> start!110596 m!1198391))

(declare-fun m!1198393 () Bool)

(assert (=> b!1308466 m!1198393))

(assert (=> b!1308466 m!1198393))

(declare-fun m!1198395 () Bool)

(assert (=> b!1308466 m!1198395))

(declare-fun m!1198397 () Bool)

(assert (=> b!1308466 m!1198397))

(declare-fun m!1198399 () Bool)

(assert (=> b!1308472 m!1198399))

(declare-fun m!1198401 () Bool)

(assert (=> b!1308476 m!1198401))

(check-sat (not b_next!29431) b_and!47621 (not b!1308467) tp_is_empty!35161 (not start!110596) (not b!1308476) (not b!1308472) (not b!1308466) (not mapNonEmpty!54370) (not b!1308465))
(check-sat b_and!47621 (not b_next!29431))
