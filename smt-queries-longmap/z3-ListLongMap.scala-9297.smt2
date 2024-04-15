; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111130 () Bool)

(assert start!111130)

(declare-fun b_free!29965 () Bool)

(declare-fun b_next!29965 () Bool)

(assert (=> start!111130 (= b_free!29965 (not b_next!29965))))

(declare-fun tp!105218 () Bool)

(declare-fun b_and!48155 () Bool)

(assert (=> start!111130 (= tp!105218 b_and!48155)))

(declare-fun res!873465 () Bool)

(declare-fun e!750567 () Bool)

(assert (=> start!111130 (=> (not res!873465) (not e!750567))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111130 (= res!873465 (validMask!0 mask!2040))))

(assert (=> start!111130 e!750567))

(assert (=> start!111130 tp!105218))

(declare-datatypes ((array!88261 0))(
  ( (array!88262 (arr!42611 (Array (_ BitVec 32) (_ BitVec 64))) (size!43163 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88261)

(declare-fun array_inv!32365 (array!88261) Bool)

(assert (=> start!111130 (array_inv!32365 _keys!1628)))

(assert (=> start!111130 true))

(declare-fun tp_is_empty!35695 () Bool)

(assert (=> start!111130 tp_is_empty!35695))

(declare-datatypes ((V!52697 0))(
  ( (V!52698 (val!17922 Int)) )
))
(declare-datatypes ((ValueCell!16949 0))(
  ( (ValueCellFull!16949 (v!20548 V!52697)) (EmptyCell!16949) )
))
(declare-datatypes ((array!88263 0))(
  ( (array!88264 (arr!42612 (Array (_ BitVec 32) ValueCell!16949)) (size!43164 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88263)

(declare-fun e!750568 () Bool)

(declare-fun array_inv!32366 (array!88263) Bool)

(assert (=> start!111130 (and (array_inv!32366 _values!1354) e!750568)))

(declare-fun mapIsEmpty!55171 () Bool)

(declare-fun mapRes!55171 () Bool)

(assert (=> mapIsEmpty!55171 mapRes!55171))

(declare-fun b!1315720 () Bool)

(declare-fun e!750569 () Bool)

(assert (=> b!1315720 (= e!750569 tp_is_empty!35695)))

(declare-fun b!1315721 () Bool)

(declare-fun e!750565 () Bool)

(assert (=> b!1315721 (= e!750565 tp_is_empty!35695)))

(declare-fun b!1315722 () Bool)

(declare-fun res!873466 () Bool)

(assert (=> b!1315722 (=> (not res!873466) (not e!750567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88261 (_ BitVec 32)) Bool)

(assert (=> b!1315722 (= res!873466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315723 () Bool)

(declare-fun res!873462 () Bool)

(assert (=> b!1315723 (=> (not res!873462) (not e!750567))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1315723 (= res!873462 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43163 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55171 () Bool)

(declare-fun tp!105217 () Bool)

(assert (=> mapNonEmpty!55171 (= mapRes!55171 (and tp!105217 e!750569))))

(declare-fun mapValue!55171 () ValueCell!16949)

(declare-fun mapRest!55171 () (Array (_ BitVec 32) ValueCell!16949))

(declare-fun mapKey!55171 () (_ BitVec 32))

(assert (=> mapNonEmpty!55171 (= (arr!42612 _values!1354) (store mapRest!55171 mapKey!55171 mapValue!55171))))

(declare-fun b!1315724 () Bool)

(assert (=> b!1315724 (= e!750567 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52697)

(declare-fun zeroValue!1296 () V!52697)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585771 () Bool)

(declare-datatypes ((tuple2!23208 0))(
  ( (tuple2!23209 (_1!11615 (_ BitVec 64)) (_2!11615 V!52697)) )
))
(declare-datatypes ((List!30323 0))(
  ( (Nil!30320) (Cons!30319 (h!31528 tuple2!23208) (t!43921 List!30323)) )
))
(declare-datatypes ((ListLongMap!20865 0))(
  ( (ListLongMap!20866 (toList!10448 List!30323)) )
))
(declare-fun contains!8525 (ListLongMap!20865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5343 (array!88261 array!88263 (_ BitVec 32) (_ BitVec 32) V!52697 V!52697 (_ BitVec 32) Int) ListLongMap!20865)

(assert (=> b!1315724 (= lt!585771 (contains!8525 (getCurrentListMap!5343 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315725 () Bool)

(declare-fun res!873464 () Bool)

(assert (=> b!1315725 (=> (not res!873464) (not e!750567))))

(declare-datatypes ((List!30324 0))(
  ( (Nil!30321) (Cons!30320 (h!31529 (_ BitVec 64)) (t!43922 List!30324)) )
))
(declare-fun arrayNoDuplicates!0 (array!88261 (_ BitVec 32) List!30324) Bool)

(assert (=> b!1315725 (= res!873464 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30321))))

(declare-fun b!1315726 () Bool)

(assert (=> b!1315726 (= e!750568 (and e!750565 mapRes!55171))))

(declare-fun condMapEmpty!55171 () Bool)

(declare-fun mapDefault!55171 () ValueCell!16949)

(assert (=> b!1315726 (= condMapEmpty!55171 (= (arr!42612 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16949)) mapDefault!55171)))))

(declare-fun b!1315727 () Bool)

(declare-fun res!873463 () Bool)

(assert (=> b!1315727 (=> (not res!873463) (not e!750567))))

(assert (=> b!1315727 (= res!873463 (and (= (size!43164 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43163 _keys!1628) (size!43164 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111130 res!873465) b!1315727))

(assert (= (and b!1315727 res!873463) b!1315722))

(assert (= (and b!1315722 res!873466) b!1315725))

(assert (= (and b!1315725 res!873464) b!1315723))

(assert (= (and b!1315723 res!873462) b!1315724))

(assert (= (and b!1315726 condMapEmpty!55171) mapIsEmpty!55171))

(assert (= (and b!1315726 (not condMapEmpty!55171)) mapNonEmpty!55171))

(get-info :version)

(assert (= (and mapNonEmpty!55171 ((_ is ValueCellFull!16949) mapValue!55171)) b!1315720))

(assert (= (and b!1315726 ((_ is ValueCellFull!16949) mapDefault!55171)) b!1315721))

(assert (= start!111130 b!1315726))

(declare-fun m!1203351 () Bool)

(assert (=> b!1315725 m!1203351))

(declare-fun m!1203353 () Bool)

(assert (=> mapNonEmpty!55171 m!1203353))

(declare-fun m!1203355 () Bool)

(assert (=> b!1315724 m!1203355))

(assert (=> b!1315724 m!1203355))

(declare-fun m!1203357 () Bool)

(assert (=> b!1315724 m!1203357))

(declare-fun m!1203359 () Bool)

(assert (=> start!111130 m!1203359))

(declare-fun m!1203361 () Bool)

(assert (=> start!111130 m!1203361))

(declare-fun m!1203363 () Bool)

(assert (=> start!111130 m!1203363))

(declare-fun m!1203365 () Bool)

(assert (=> b!1315722 m!1203365))

(check-sat (not b_next!29965) tp_is_empty!35695 (not mapNonEmpty!55171) b_and!48155 (not b!1315725) (not start!111130) (not b!1315722) (not b!1315724))
(check-sat b_and!48155 (not b_next!29965))
