; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110662 () Bool)

(assert start!110662)

(declare-fun b_free!29497 () Bool)

(declare-fun b_next!29497 () Bool)

(assert (=> start!110662 (= b_free!29497 (not b_next!29497))))

(declare-fun tp!103813 () Bool)

(declare-fun b_and!47687 () Bool)

(assert (=> start!110662 (= tp!103813 b_and!47687)))

(declare-fun mapIsEmpty!54469 () Bool)

(declare-fun mapRes!54469 () Bool)

(assert (=> mapIsEmpty!54469 mapRes!54469))

(declare-fun b!1309357 () Bool)

(declare-fun res!869208 () Bool)

(declare-fun e!747058 () Bool)

(assert (=> b!1309357 (=> (not res!869208) (not e!747058))))

(declare-datatypes ((array!87361 0))(
  ( (array!87362 (arr!42161 (Array (_ BitVec 32) (_ BitVec 64))) (size!42713 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87361)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52073 0))(
  ( (V!52074 (val!17688 Int)) )
))
(declare-datatypes ((ValueCell!16715 0))(
  ( (ValueCellFull!16715 (v!20314 V!52073)) (EmptyCell!16715) )
))
(declare-datatypes ((array!87363 0))(
  ( (array!87364 (arr!42162 (Array (_ BitVec 32) ValueCell!16715)) (size!42714 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87363)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309357 (= res!869208 (and (= (size!42714 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42713 _keys!1628) (size!42714 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309358 () Bool)

(declare-fun res!869206 () Bool)

(assert (=> b!1309358 (=> (not res!869206) (not e!747058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87361 (_ BitVec 32)) Bool)

(assert (=> b!1309358 (= res!869206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309359 () Bool)

(assert (=> b!1309359 (= e!747058 false)))

(declare-fun lt!585078 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52073)

(declare-fun zeroValue!1296 () V!52073)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22864 0))(
  ( (tuple2!22865 (_1!11443 (_ BitVec 64)) (_2!11443 V!52073)) )
))
(declare-datatypes ((List!29991 0))(
  ( (Nil!29988) (Cons!29987 (h!31196 tuple2!22864) (t!43589 List!29991)) )
))
(declare-datatypes ((ListLongMap!20521 0))(
  ( (ListLongMap!20522 (toList!10276 List!29991)) )
))
(declare-fun contains!8353 (ListLongMap!20521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5171 (array!87361 array!87363 (_ BitVec 32) (_ BitVec 32) V!52073 V!52073 (_ BitVec 32) Int) ListLongMap!20521)

(assert (=> b!1309359 (= lt!585078 (contains!8353 (getCurrentListMap!5171 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309360 () Bool)

(declare-fun e!747057 () Bool)

(declare-fun tp_is_empty!35227 () Bool)

(assert (=> b!1309360 (= e!747057 tp_is_empty!35227)))

(declare-fun res!869205 () Bool)

(assert (=> start!110662 (=> (not res!869205) (not e!747058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110662 (= res!869205 (validMask!0 mask!2040))))

(assert (=> start!110662 e!747058))

(assert (=> start!110662 tp!103813))

(declare-fun array_inv!32053 (array!87361) Bool)

(assert (=> start!110662 (array_inv!32053 _keys!1628)))

(assert (=> start!110662 true))

(assert (=> start!110662 tp_is_empty!35227))

(declare-fun e!747056 () Bool)

(declare-fun array_inv!32054 (array!87363) Bool)

(assert (=> start!110662 (and (array_inv!32054 _values!1354) e!747056)))

(declare-fun b!1309361 () Bool)

(declare-fun e!747055 () Bool)

(assert (=> b!1309361 (= e!747055 tp_is_empty!35227)))

(declare-fun b!1309362 () Bool)

(declare-fun res!869209 () Bool)

(assert (=> b!1309362 (=> (not res!869209) (not e!747058))))

(assert (=> b!1309362 (= res!869209 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42713 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54469 () Bool)

(declare-fun tp!103814 () Bool)

(assert (=> mapNonEmpty!54469 (= mapRes!54469 (and tp!103814 e!747057))))

(declare-fun mapKey!54469 () (_ BitVec 32))

(declare-fun mapRest!54469 () (Array (_ BitVec 32) ValueCell!16715))

(declare-fun mapValue!54469 () ValueCell!16715)

(assert (=> mapNonEmpty!54469 (= (arr!42162 _values!1354) (store mapRest!54469 mapKey!54469 mapValue!54469))))

(declare-fun b!1309363 () Bool)

(assert (=> b!1309363 (= e!747056 (and e!747055 mapRes!54469))))

(declare-fun condMapEmpty!54469 () Bool)

(declare-fun mapDefault!54469 () ValueCell!16715)

(assert (=> b!1309363 (= condMapEmpty!54469 (= (arr!42162 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16715)) mapDefault!54469)))))

(declare-fun b!1309364 () Bool)

(declare-fun res!869207 () Bool)

(assert (=> b!1309364 (=> (not res!869207) (not e!747058))))

(declare-datatypes ((List!29992 0))(
  ( (Nil!29989) (Cons!29988 (h!31197 (_ BitVec 64)) (t!43590 List!29992)) )
))
(declare-fun arrayNoDuplicates!0 (array!87361 (_ BitVec 32) List!29992) Bool)

(assert (=> b!1309364 (= res!869207 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29989))))

(assert (= (and start!110662 res!869205) b!1309357))

(assert (= (and b!1309357 res!869208) b!1309358))

(assert (= (and b!1309358 res!869206) b!1309364))

(assert (= (and b!1309364 res!869207) b!1309362))

(assert (= (and b!1309362 res!869209) b!1309359))

(assert (= (and b!1309363 condMapEmpty!54469) mapIsEmpty!54469))

(assert (= (and b!1309363 (not condMapEmpty!54469)) mapNonEmpty!54469))

(get-info :version)

(assert (= (and mapNonEmpty!54469 ((_ is ValueCellFull!16715) mapValue!54469)) b!1309360))

(assert (= (and b!1309363 ((_ is ValueCellFull!16715) mapDefault!54469)) b!1309361))

(assert (= start!110662 b!1309363))

(declare-fun m!1198995 () Bool)

(assert (=> start!110662 m!1198995))

(declare-fun m!1198997 () Bool)

(assert (=> start!110662 m!1198997))

(declare-fun m!1198999 () Bool)

(assert (=> start!110662 m!1198999))

(declare-fun m!1199001 () Bool)

(assert (=> b!1309358 m!1199001))

(declare-fun m!1199003 () Bool)

(assert (=> mapNonEmpty!54469 m!1199003))

(declare-fun m!1199005 () Bool)

(assert (=> b!1309364 m!1199005))

(declare-fun m!1199007 () Bool)

(assert (=> b!1309359 m!1199007))

(assert (=> b!1309359 m!1199007))

(declare-fun m!1199009 () Bool)

(assert (=> b!1309359 m!1199009))

(check-sat (not b_next!29497) b_and!47687 (not start!110662) (not mapNonEmpty!54469) (not b!1309359) (not b!1309364) tp_is_empty!35227 (not b!1309358))
(check-sat b_and!47687 (not b_next!29497))
