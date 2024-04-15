; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111148 () Bool)

(assert start!111148)

(declare-fun b_free!29983 () Bool)

(declare-fun b_next!29983 () Bool)

(assert (=> start!111148 (= b_free!29983 (not b_next!29983))))

(declare-fun tp!105272 () Bool)

(declare-fun b_and!48173 () Bool)

(assert (=> start!111148 (= tp!105272 b_and!48173)))

(declare-fun res!873601 () Bool)

(declare-fun e!750704 () Bool)

(assert (=> start!111148 (=> (not res!873601) (not e!750704))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111148 (= res!873601 (validMask!0 mask!2040))))

(assert (=> start!111148 e!750704))

(assert (=> start!111148 tp!105272))

(declare-datatypes ((array!88293 0))(
  ( (array!88294 (arr!42627 (Array (_ BitVec 32) (_ BitVec 64))) (size!43179 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88293)

(declare-fun array_inv!32373 (array!88293) Bool)

(assert (=> start!111148 (array_inv!32373 _keys!1628)))

(assert (=> start!111148 true))

(declare-fun tp_is_empty!35713 () Bool)

(assert (=> start!111148 tp_is_empty!35713))

(declare-datatypes ((V!52721 0))(
  ( (V!52722 (val!17931 Int)) )
))
(declare-datatypes ((ValueCell!16958 0))(
  ( (ValueCellFull!16958 (v!20557 V!52721)) (EmptyCell!16958) )
))
(declare-datatypes ((array!88295 0))(
  ( (array!88296 (arr!42628 (Array (_ BitVec 32) ValueCell!16958)) (size!43180 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88295)

(declare-fun e!750700 () Bool)

(declare-fun array_inv!32374 (array!88295) Bool)

(assert (=> start!111148 (and (array_inv!32374 _values!1354) e!750700)))

(declare-fun mapIsEmpty!55198 () Bool)

(declare-fun mapRes!55198 () Bool)

(assert (=> mapIsEmpty!55198 mapRes!55198))

(declare-fun b!1315936 () Bool)

(declare-fun res!873598 () Bool)

(assert (=> b!1315936 (=> (not res!873598) (not e!750704))))

(declare-datatypes ((List!30331 0))(
  ( (Nil!30328) (Cons!30327 (h!31536 (_ BitVec 64)) (t!43929 List!30331)) )
))
(declare-fun arrayNoDuplicates!0 (array!88293 (_ BitVec 32) List!30331) Bool)

(assert (=> b!1315936 (= res!873598 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30328))))

(declare-fun b!1315937 () Bool)

(declare-fun res!873600 () Bool)

(assert (=> b!1315937 (=> (not res!873600) (not e!750704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88293 (_ BitVec 32)) Bool)

(assert (=> b!1315937 (= res!873600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315938 () Bool)

(declare-fun res!873599 () Bool)

(assert (=> b!1315938 (=> (not res!873599) (not e!750704))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315938 (= res!873599 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43179 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315939 () Bool)

(declare-fun res!873597 () Bool)

(assert (=> b!1315939 (=> (not res!873597) (not e!750704))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315939 (= res!873597 (and (= (size!43180 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43179 _keys!1628) (size!43180 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315940 () Bool)

(declare-fun e!750702 () Bool)

(assert (=> b!1315940 (= e!750700 (and e!750702 mapRes!55198))))

(declare-fun condMapEmpty!55198 () Bool)

(declare-fun mapDefault!55198 () ValueCell!16958)

(assert (=> b!1315940 (= condMapEmpty!55198 (= (arr!42628 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16958)) mapDefault!55198)))))

(declare-fun b!1315941 () Bool)

(assert (=> b!1315941 (= e!750702 tp_is_empty!35713)))

(declare-fun b!1315942 () Bool)

(declare-fun e!750703 () Bool)

(assert (=> b!1315942 (= e!750703 tp_is_empty!35713)))

(declare-fun b!1315943 () Bool)

(assert (=> b!1315943 (= e!750704 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52721)

(declare-fun zeroValue!1296 () V!52721)

(declare-fun lt!585798 () Bool)

(declare-datatypes ((tuple2!23216 0))(
  ( (tuple2!23217 (_1!11619 (_ BitVec 64)) (_2!11619 V!52721)) )
))
(declare-datatypes ((List!30332 0))(
  ( (Nil!30329) (Cons!30328 (h!31537 tuple2!23216) (t!43930 List!30332)) )
))
(declare-datatypes ((ListLongMap!20873 0))(
  ( (ListLongMap!20874 (toList!10452 List!30332)) )
))
(declare-fun contains!8529 (ListLongMap!20873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5347 (array!88293 array!88295 (_ BitVec 32) (_ BitVec 32) V!52721 V!52721 (_ BitVec 32) Int) ListLongMap!20873)

(assert (=> b!1315943 (= lt!585798 (contains!8529 (getCurrentListMap!5347 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!55198 () Bool)

(declare-fun tp!105271 () Bool)

(assert (=> mapNonEmpty!55198 (= mapRes!55198 (and tp!105271 e!750703))))

(declare-fun mapKey!55198 () (_ BitVec 32))

(declare-fun mapRest!55198 () (Array (_ BitVec 32) ValueCell!16958))

(declare-fun mapValue!55198 () ValueCell!16958)

(assert (=> mapNonEmpty!55198 (= (arr!42628 _values!1354) (store mapRest!55198 mapKey!55198 mapValue!55198))))

(assert (= (and start!111148 res!873601) b!1315939))

(assert (= (and b!1315939 res!873597) b!1315937))

(assert (= (and b!1315937 res!873600) b!1315936))

(assert (= (and b!1315936 res!873598) b!1315938))

(assert (= (and b!1315938 res!873599) b!1315943))

(assert (= (and b!1315940 condMapEmpty!55198) mapIsEmpty!55198))

(assert (= (and b!1315940 (not condMapEmpty!55198)) mapNonEmpty!55198))

(get-info :version)

(assert (= (and mapNonEmpty!55198 ((_ is ValueCellFull!16958) mapValue!55198)) b!1315942))

(assert (= (and b!1315940 ((_ is ValueCellFull!16958) mapDefault!55198)) b!1315941))

(assert (= start!111148 b!1315940))

(declare-fun m!1203495 () Bool)

(assert (=> b!1315943 m!1203495))

(assert (=> b!1315943 m!1203495))

(declare-fun m!1203497 () Bool)

(assert (=> b!1315943 m!1203497))

(declare-fun m!1203499 () Bool)

(assert (=> b!1315937 m!1203499))

(declare-fun m!1203501 () Bool)

(assert (=> mapNonEmpty!55198 m!1203501))

(declare-fun m!1203503 () Bool)

(assert (=> b!1315936 m!1203503))

(declare-fun m!1203505 () Bool)

(assert (=> start!111148 m!1203505))

(declare-fun m!1203507 () Bool)

(assert (=> start!111148 m!1203507))

(declare-fun m!1203509 () Bool)

(assert (=> start!111148 m!1203509))

(check-sat (not start!111148) b_and!48173 (not b!1315937) (not b!1315943) (not b!1315936) (not b_next!29983) tp_is_empty!35713 (not mapNonEmpty!55198))
(check-sat b_and!48173 (not b_next!29983))
