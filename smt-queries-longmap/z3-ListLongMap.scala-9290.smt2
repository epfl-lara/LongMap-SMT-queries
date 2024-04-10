; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111090 () Bool)

(assert start!111090)

(declare-fun b_free!29925 () Bool)

(declare-fun b_next!29925 () Bool)

(assert (=> start!111090 (= b_free!29925 (not b_next!29925))))

(declare-fun tp!105096 () Bool)

(declare-fun b_and!48133 () Bool)

(assert (=> start!111090 (= tp!105096 b_and!48133)))

(declare-fun b!1315310 () Bool)

(declare-fun res!873191 () Bool)

(declare-fun e!750302 () Bool)

(assert (=> b!1315310 (=> (not res!873191) (not e!750302))))

(declare-datatypes ((array!88274 0))(
  ( (array!88275 (arr!42617 (Array (_ BitVec 32) (_ BitVec 64))) (size!43167 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88274)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315310 (= res!873191 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43167 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315311 () Bool)

(declare-fun e!750298 () Bool)

(declare-fun tp_is_empty!35655 () Bool)

(assert (=> b!1315311 (= e!750298 tp_is_empty!35655)))

(declare-fun mapIsEmpty!55111 () Bool)

(declare-fun mapRes!55111 () Bool)

(assert (=> mapIsEmpty!55111 mapRes!55111))

(declare-fun b!1315312 () Bool)

(declare-fun e!750300 () Bool)

(assert (=> b!1315312 (= e!750300 tp_is_empty!35655)))

(declare-fun b!1315313 () Bool)

(assert (=> b!1315313 (= e!750302 false)))

(declare-fun lt!585897 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52643 0))(
  ( (V!52644 (val!17902 Int)) )
))
(declare-fun minValue!1296 () V!52643)

(declare-datatypes ((ValueCell!16929 0))(
  ( (ValueCellFull!16929 (v!20529 V!52643)) (EmptyCell!16929) )
))
(declare-datatypes ((array!88276 0))(
  ( (array!88277 (arr!42618 (Array (_ BitVec 32) ValueCell!16929)) (size!43168 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88276)

(declare-fun zeroValue!1296 () V!52643)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23094 0))(
  ( (tuple2!23095 (_1!11558 (_ BitVec 64)) (_2!11558 V!52643)) )
))
(declare-datatypes ((List!30229 0))(
  ( (Nil!30226) (Cons!30225 (h!31434 tuple2!23094) (t!43835 List!30229)) )
))
(declare-datatypes ((ListLongMap!20751 0))(
  ( (ListLongMap!20752 (toList!10391 List!30229)) )
))
(declare-fun contains!8541 (ListLongMap!20751 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5404 (array!88274 array!88276 (_ BitVec 32) (_ BitVec 32) V!52643 V!52643 (_ BitVec 32) Int) ListLongMap!20751)

(assert (=> b!1315313 (= lt!585897 (contains!8541 (getCurrentListMap!5404 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315314 () Bool)

(declare-fun e!750301 () Bool)

(assert (=> b!1315314 (= e!750301 (and e!750300 mapRes!55111))))

(declare-fun condMapEmpty!55111 () Bool)

(declare-fun mapDefault!55111 () ValueCell!16929)

(assert (=> b!1315314 (= condMapEmpty!55111 (= (arr!42618 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16929)) mapDefault!55111)))))

(declare-fun mapNonEmpty!55111 () Bool)

(declare-fun tp!105097 () Bool)

(assert (=> mapNonEmpty!55111 (= mapRes!55111 (and tp!105097 e!750298))))

(declare-fun mapRest!55111 () (Array (_ BitVec 32) ValueCell!16929))

(declare-fun mapKey!55111 () (_ BitVec 32))

(declare-fun mapValue!55111 () ValueCell!16929)

(assert (=> mapNonEmpty!55111 (= (arr!42618 _values!1354) (store mapRest!55111 mapKey!55111 mapValue!55111))))

(declare-fun b!1315315 () Bool)

(declare-fun res!873192 () Bool)

(assert (=> b!1315315 (=> (not res!873192) (not e!750302))))

(assert (=> b!1315315 (= res!873192 (and (= (size!43168 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43167 _keys!1628) (size!43168 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315316 () Bool)

(declare-fun res!873195 () Bool)

(assert (=> b!1315316 (=> (not res!873195) (not e!750302))))

(declare-datatypes ((List!30230 0))(
  ( (Nil!30227) (Cons!30226 (h!31435 (_ BitVec 64)) (t!43836 List!30230)) )
))
(declare-fun arrayNoDuplicates!0 (array!88274 (_ BitVec 32) List!30230) Bool)

(assert (=> b!1315316 (= res!873195 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30227))))

(declare-fun b!1315317 () Bool)

(declare-fun res!873194 () Bool)

(assert (=> b!1315317 (=> (not res!873194) (not e!750302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88274 (_ BitVec 32)) Bool)

(assert (=> b!1315317 (= res!873194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!873193 () Bool)

(assert (=> start!111090 (=> (not res!873193) (not e!750302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111090 (= res!873193 (validMask!0 mask!2040))))

(assert (=> start!111090 e!750302))

(assert (=> start!111090 tp!105096))

(declare-fun array_inv!32187 (array!88274) Bool)

(assert (=> start!111090 (array_inv!32187 _keys!1628)))

(assert (=> start!111090 true))

(assert (=> start!111090 tp_is_empty!35655))

(declare-fun array_inv!32188 (array!88276) Bool)

(assert (=> start!111090 (and (array_inv!32188 _values!1354) e!750301)))

(assert (= (and start!111090 res!873193) b!1315315))

(assert (= (and b!1315315 res!873192) b!1315317))

(assert (= (and b!1315317 res!873194) b!1315316))

(assert (= (and b!1315316 res!873195) b!1315310))

(assert (= (and b!1315310 res!873191) b!1315313))

(assert (= (and b!1315314 condMapEmpty!55111) mapIsEmpty!55111))

(assert (= (and b!1315314 (not condMapEmpty!55111)) mapNonEmpty!55111))

(get-info :version)

(assert (= (and mapNonEmpty!55111 ((_ is ValueCellFull!16929) mapValue!55111)) b!1315311))

(assert (= (and b!1315314 ((_ is ValueCellFull!16929) mapDefault!55111)) b!1315312))

(assert (= start!111090 b!1315314))

(declare-fun m!1203547 () Bool)

(assert (=> b!1315317 m!1203547))

(declare-fun m!1203549 () Bool)

(assert (=> b!1315316 m!1203549))

(declare-fun m!1203551 () Bool)

(assert (=> mapNonEmpty!55111 m!1203551))

(declare-fun m!1203553 () Bool)

(assert (=> b!1315313 m!1203553))

(assert (=> b!1315313 m!1203553))

(declare-fun m!1203555 () Bool)

(assert (=> b!1315313 m!1203555))

(declare-fun m!1203557 () Bool)

(assert (=> start!111090 m!1203557))

(declare-fun m!1203559 () Bool)

(assert (=> start!111090 m!1203559))

(declare-fun m!1203561 () Bool)

(assert (=> start!111090 m!1203561))

(check-sat b_and!48133 tp_is_empty!35655 (not b!1315316) (not b!1315317) (not b!1315313) (not b_next!29925) (not mapNonEmpty!55111) (not start!111090))
(check-sat b_and!48133 (not b_next!29925))
