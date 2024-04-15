; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111112 () Bool)

(assert start!111112)

(declare-fun b_free!29947 () Bool)

(declare-fun b_next!29947 () Bool)

(assert (=> start!111112 (= b_free!29947 (not b_next!29947))))

(declare-fun tp!105164 () Bool)

(declare-fun b_and!48137 () Bool)

(assert (=> start!111112 (= tp!105164 b_and!48137)))

(declare-fun b!1315504 () Bool)

(declare-fun res!873327 () Bool)

(declare-fun e!750434 () Bool)

(assert (=> b!1315504 (=> (not res!873327) (not e!750434))))

(declare-datatypes ((array!88225 0))(
  ( (array!88226 (arr!42593 (Array (_ BitVec 32) (_ BitVec 64))) (size!43145 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88225)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315504 (= res!873327 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43145 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315505 () Bool)

(declare-fun res!873330 () Bool)

(assert (=> b!1315505 (=> (not res!873330) (not e!750434))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52673 0))(
  ( (V!52674 (val!17913 Int)) )
))
(declare-datatypes ((ValueCell!16940 0))(
  ( (ValueCellFull!16940 (v!20539 V!52673)) (EmptyCell!16940) )
))
(declare-datatypes ((array!88227 0))(
  ( (array!88228 (arr!42594 (Array (_ BitVec 32) ValueCell!16940)) (size!43146 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88227)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315505 (= res!873330 (and (= (size!43146 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43145 _keys!1628) (size!43146 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315506 () Bool)

(declare-fun e!750433 () Bool)

(declare-fun e!750432 () Bool)

(declare-fun mapRes!55144 () Bool)

(assert (=> b!1315506 (= e!750433 (and e!750432 mapRes!55144))))

(declare-fun condMapEmpty!55144 () Bool)

(declare-fun mapDefault!55144 () ValueCell!16940)

(assert (=> b!1315506 (= condMapEmpty!55144 (= (arr!42594 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16940)) mapDefault!55144)))))

(declare-fun b!1315507 () Bool)

(declare-fun res!873328 () Bool)

(assert (=> b!1315507 (=> (not res!873328) (not e!750434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88225 (_ BitVec 32)) Bool)

(assert (=> b!1315507 (= res!873328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!873329 () Bool)

(assert (=> start!111112 (=> (not res!873329) (not e!750434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111112 (= res!873329 (validMask!0 mask!2040))))

(assert (=> start!111112 e!750434))

(assert (=> start!111112 tp!105164))

(declare-fun array_inv!32357 (array!88225) Bool)

(assert (=> start!111112 (array_inv!32357 _keys!1628)))

(assert (=> start!111112 true))

(declare-fun tp_is_empty!35677 () Bool)

(assert (=> start!111112 tp_is_empty!35677))

(declare-fun array_inv!32358 (array!88227) Bool)

(assert (=> start!111112 (and (array_inv!32358 _values!1354) e!750433)))

(declare-fun b!1315508 () Bool)

(assert (=> b!1315508 (= e!750434 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585744 () Bool)

(declare-fun minValue!1296 () V!52673)

(declare-fun zeroValue!1296 () V!52673)

(declare-datatypes ((tuple2!23198 0))(
  ( (tuple2!23199 (_1!11610 (_ BitVec 64)) (_2!11610 V!52673)) )
))
(declare-datatypes ((List!30312 0))(
  ( (Nil!30309) (Cons!30308 (h!31517 tuple2!23198) (t!43910 List!30312)) )
))
(declare-datatypes ((ListLongMap!20855 0))(
  ( (ListLongMap!20856 (toList!10443 List!30312)) )
))
(declare-fun contains!8520 (ListLongMap!20855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5338 (array!88225 array!88227 (_ BitVec 32) (_ BitVec 32) V!52673 V!52673 (_ BitVec 32) Int) ListLongMap!20855)

(assert (=> b!1315508 (= lt!585744 (contains!8520 (getCurrentListMap!5338 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315509 () Bool)

(declare-fun e!750431 () Bool)

(assert (=> b!1315509 (= e!750431 tp_is_empty!35677)))

(declare-fun b!1315510 () Bool)

(assert (=> b!1315510 (= e!750432 tp_is_empty!35677)))

(declare-fun mapNonEmpty!55144 () Bool)

(declare-fun tp!105163 () Bool)

(assert (=> mapNonEmpty!55144 (= mapRes!55144 (and tp!105163 e!750431))))

(declare-fun mapKey!55144 () (_ BitVec 32))

(declare-fun mapRest!55144 () (Array (_ BitVec 32) ValueCell!16940))

(declare-fun mapValue!55144 () ValueCell!16940)

(assert (=> mapNonEmpty!55144 (= (arr!42594 _values!1354) (store mapRest!55144 mapKey!55144 mapValue!55144))))

(declare-fun mapIsEmpty!55144 () Bool)

(assert (=> mapIsEmpty!55144 mapRes!55144))

(declare-fun b!1315511 () Bool)

(declare-fun res!873331 () Bool)

(assert (=> b!1315511 (=> (not res!873331) (not e!750434))))

(declare-datatypes ((List!30313 0))(
  ( (Nil!30310) (Cons!30309 (h!31518 (_ BitVec 64)) (t!43911 List!30313)) )
))
(declare-fun arrayNoDuplicates!0 (array!88225 (_ BitVec 32) List!30313) Bool)

(assert (=> b!1315511 (= res!873331 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30310))))

(assert (= (and start!111112 res!873329) b!1315505))

(assert (= (and b!1315505 res!873330) b!1315507))

(assert (= (and b!1315507 res!873328) b!1315511))

(assert (= (and b!1315511 res!873331) b!1315504))

(assert (= (and b!1315504 res!873327) b!1315508))

(assert (= (and b!1315506 condMapEmpty!55144) mapIsEmpty!55144))

(assert (= (and b!1315506 (not condMapEmpty!55144)) mapNonEmpty!55144))

(get-info :version)

(assert (= (and mapNonEmpty!55144 ((_ is ValueCellFull!16940) mapValue!55144)) b!1315509))

(assert (= (and b!1315506 ((_ is ValueCellFull!16940) mapDefault!55144)) b!1315510))

(assert (= start!111112 b!1315506))

(declare-fun m!1203207 () Bool)

(assert (=> mapNonEmpty!55144 m!1203207))

(declare-fun m!1203209 () Bool)

(assert (=> start!111112 m!1203209))

(declare-fun m!1203211 () Bool)

(assert (=> start!111112 m!1203211))

(declare-fun m!1203213 () Bool)

(assert (=> start!111112 m!1203213))

(declare-fun m!1203215 () Bool)

(assert (=> b!1315511 m!1203215))

(declare-fun m!1203217 () Bool)

(assert (=> b!1315508 m!1203217))

(assert (=> b!1315508 m!1203217))

(declare-fun m!1203219 () Bool)

(assert (=> b!1315508 m!1203219))

(declare-fun m!1203221 () Bool)

(assert (=> b!1315507 m!1203221))

(check-sat (not b_next!29947) b_and!48137 (not b!1315507) (not mapNonEmpty!55144) (not b!1315508) (not b!1315511) tp_is_empty!35677 (not start!111112))
(check-sat b_and!48137 (not b_next!29947))
