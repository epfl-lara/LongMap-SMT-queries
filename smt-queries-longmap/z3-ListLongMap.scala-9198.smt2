; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110538 () Bool)

(assert start!110538)

(declare-fun b_free!29373 () Bool)

(declare-fun b_next!29373 () Bool)

(assert (=> start!110538 (= b_free!29373 (not b_next!29373))))

(declare-fun tp!103440 () Bool)

(declare-fun b_and!47581 () Bool)

(assert (=> start!110538 (= tp!103440 b_and!47581)))

(declare-fun res!867980 () Bool)

(declare-fun e!746162 () Bool)

(assert (=> start!110538 (=> (not res!867980) (not e!746162))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110538 (= res!867980 (validMask!0 mask!2040))))

(assert (=> start!110538 e!746162))

(assert (=> start!110538 tp!103440))

(declare-datatypes ((array!87206 0))(
  ( (array!87207 (arr!42083 (Array (_ BitVec 32) (_ BitVec 64))) (size!42633 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87206)

(declare-fun array_inv!31807 (array!87206) Bool)

(assert (=> start!110538 (array_inv!31807 _keys!1628)))

(assert (=> start!110538 true))

(declare-fun tp_is_empty!35103 () Bool)

(assert (=> start!110538 tp_is_empty!35103))

(declare-datatypes ((V!51907 0))(
  ( (V!51908 (val!17626 Int)) )
))
(declare-datatypes ((ValueCell!16653 0))(
  ( (ValueCellFull!16653 (v!20253 V!51907)) (EmptyCell!16653) )
))
(declare-datatypes ((array!87208 0))(
  ( (array!87209 (arr!42084 (Array (_ BitVec 32) ValueCell!16653)) (size!42634 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87208)

(declare-fun e!746159 () Bool)

(declare-fun array_inv!31808 (array!87208) Bool)

(assert (=> start!110538 (and (array_inv!31808 _values!1354) e!746159)))

(declare-fun b!1307615 () Bool)

(declare-fun res!867981 () Bool)

(assert (=> b!1307615 (=> (not res!867981) (not e!746162))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307615 (= res!867981 (and (= (size!42634 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42633 _keys!1628) (size!42634 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307616 () Bool)

(declare-fun res!867983 () Bool)

(assert (=> b!1307616 (=> (not res!867983) (not e!746162))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307616 (= res!867983 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42633 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307617 () Bool)

(declare-fun e!746158 () Bool)

(assert (=> b!1307617 (= e!746158 tp_is_empty!35103)))

(declare-fun b!1307618 () Bool)

(declare-fun res!867982 () Bool)

(assert (=> b!1307618 (=> (not res!867982) (not e!746162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87206 (_ BitVec 32)) Bool)

(assert (=> b!1307618 (= res!867982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307619 () Bool)

(declare-fun e!746160 () Bool)

(assert (=> b!1307619 (= e!746160 tp_is_empty!35103)))

(declare-fun b!1307620 () Bool)

(declare-fun mapRes!54283 () Bool)

(assert (=> b!1307620 (= e!746159 (and e!746158 mapRes!54283))))

(declare-fun condMapEmpty!54283 () Bool)

(declare-fun mapDefault!54283 () ValueCell!16653)

(assert (=> b!1307620 (= condMapEmpty!54283 (= (arr!42084 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16653)) mapDefault!54283)))))

(declare-fun b!1307621 () Bool)

(declare-fun res!867984 () Bool)

(assert (=> b!1307621 (=> (not res!867984) (not e!746162))))

(declare-datatypes ((List!29831 0))(
  ( (Nil!29828) (Cons!29827 (h!31036 (_ BitVec 64)) (t!43437 List!29831)) )
))
(declare-fun arrayNoDuplicates!0 (array!87206 (_ BitVec 32) List!29831) Bool)

(assert (=> b!1307621 (= res!867984 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29828))))

(declare-fun mapNonEmpty!54283 () Bool)

(declare-fun tp!103441 () Bool)

(assert (=> mapNonEmpty!54283 (= mapRes!54283 (and tp!103441 e!746160))))

(declare-fun mapValue!54283 () ValueCell!16653)

(declare-fun mapKey!54283 () (_ BitVec 32))

(declare-fun mapRest!54283 () (Array (_ BitVec 32) ValueCell!16653))

(assert (=> mapNonEmpty!54283 (= (arr!42084 _values!1354) (store mapRest!54283 mapKey!54283 mapValue!54283))))

(declare-fun b!1307622 () Bool)

(assert (=> b!1307622 (= e!746162 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585078 () Bool)

(declare-fun minValue!1296 () V!51907)

(declare-fun zeroValue!1296 () V!51907)

(declare-datatypes ((tuple2!22690 0))(
  ( (tuple2!22691 (_1!11356 (_ BitVec 64)) (_2!11356 V!51907)) )
))
(declare-datatypes ((List!29832 0))(
  ( (Nil!29829) (Cons!29828 (h!31037 tuple2!22690) (t!43438 List!29832)) )
))
(declare-datatypes ((ListLongMap!20347 0))(
  ( (ListLongMap!20348 (toList!10189 List!29832)) )
))
(declare-fun contains!8339 (ListLongMap!20347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5202 (array!87206 array!87208 (_ BitVec 32) (_ BitVec 32) V!51907 V!51907 (_ BitVec 32) Int) ListLongMap!20347)

(assert (=> b!1307622 (= lt!585078 (contains!8339 (getCurrentListMap!5202 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54283 () Bool)

(assert (=> mapIsEmpty!54283 mapRes!54283))

(assert (= (and start!110538 res!867980) b!1307615))

(assert (= (and b!1307615 res!867981) b!1307618))

(assert (= (and b!1307618 res!867982) b!1307621))

(assert (= (and b!1307621 res!867984) b!1307616))

(assert (= (and b!1307616 res!867983) b!1307622))

(assert (= (and b!1307620 condMapEmpty!54283) mapIsEmpty!54283))

(assert (= (and b!1307620 (not condMapEmpty!54283)) mapNonEmpty!54283))

(get-info :version)

(assert (= (and mapNonEmpty!54283 ((_ is ValueCellFull!16653) mapValue!54283)) b!1307619))

(assert (= (and b!1307620 ((_ is ValueCellFull!16653) mapDefault!54283)) b!1307617))

(assert (= start!110538 b!1307620))

(declare-fun m!1198249 () Bool)

(assert (=> b!1307618 m!1198249))

(declare-fun m!1198251 () Bool)

(assert (=> mapNonEmpty!54283 m!1198251))

(declare-fun m!1198253 () Bool)

(assert (=> b!1307622 m!1198253))

(assert (=> b!1307622 m!1198253))

(declare-fun m!1198255 () Bool)

(assert (=> b!1307622 m!1198255))

(declare-fun m!1198257 () Bool)

(assert (=> start!110538 m!1198257))

(declare-fun m!1198259 () Bool)

(assert (=> start!110538 m!1198259))

(declare-fun m!1198261 () Bool)

(assert (=> start!110538 m!1198261))

(declare-fun m!1198263 () Bool)

(assert (=> b!1307621 m!1198263))

(check-sat (not b_next!29373) b_and!47581 (not b!1307621) (not mapNonEmpty!54283) tp_is_empty!35103 (not b!1307618) (not start!110538) (not b!1307622))
(check-sat b_and!47581 (not b_next!29373))
