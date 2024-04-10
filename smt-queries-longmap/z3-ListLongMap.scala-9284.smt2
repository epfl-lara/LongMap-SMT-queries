; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111054 () Bool)

(assert start!111054)

(declare-fun b_free!29889 () Bool)

(declare-fun b_next!29889 () Bool)

(assert (=> start!111054 (= b_free!29889 (not b_next!29889))))

(declare-fun tp!104989 () Bool)

(declare-fun b_and!48097 () Bool)

(assert (=> start!111054 (= tp!104989 b_and!48097)))

(declare-fun b!1314842 () Bool)

(declare-fun e!750031 () Bool)

(declare-fun e!750029 () Bool)

(declare-fun mapRes!55057 () Bool)

(assert (=> b!1314842 (= e!750031 (and e!750029 mapRes!55057))))

(declare-fun condMapEmpty!55057 () Bool)

(declare-datatypes ((V!52595 0))(
  ( (V!52596 (val!17884 Int)) )
))
(declare-datatypes ((ValueCell!16911 0))(
  ( (ValueCellFull!16911 (v!20511 V!52595)) (EmptyCell!16911) )
))
(declare-datatypes ((array!88204 0))(
  ( (array!88205 (arr!42582 (Array (_ BitVec 32) ValueCell!16911)) (size!43132 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88204)

(declare-fun mapDefault!55057 () ValueCell!16911)

(assert (=> b!1314842 (= condMapEmpty!55057 (= (arr!42582 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16911)) mapDefault!55057)))))

(declare-fun b!1314843 () Bool)

(declare-fun tp_is_empty!35619 () Bool)

(assert (=> b!1314843 (= e!750029 tp_is_empty!35619)))

(declare-fun b!1314844 () Bool)

(declare-fun res!872888 () Bool)

(declare-fun e!750028 () Bool)

(assert (=> b!1314844 (=> (not res!872888) (not e!750028))))

(declare-datatypes ((array!88206 0))(
  ( (array!88207 (arr!42583 (Array (_ BitVec 32) (_ BitVec 64))) (size!43133 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88206)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314844 (= res!872888 (and (= (size!43132 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43133 _keys!1628) (size!43132 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314845 () Bool)

(declare-fun res!872889 () Bool)

(assert (=> b!1314845 (=> (not res!872889) (not e!750028))))

(declare-datatypes ((List!30202 0))(
  ( (Nil!30199) (Cons!30198 (h!31407 (_ BitVec 64)) (t!43808 List!30202)) )
))
(declare-fun arrayNoDuplicates!0 (array!88206 (_ BitVec 32) List!30202) Bool)

(assert (=> b!1314845 (= res!872889 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30199))))

(declare-fun b!1314846 () Bool)

(declare-fun res!872887 () Bool)

(assert (=> b!1314846 (=> (not res!872887) (not e!750028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88206 (_ BitVec 32)) Bool)

(assert (=> b!1314846 (= res!872887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314847 () Bool)

(declare-fun res!872886 () Bool)

(assert (=> b!1314847 (=> (not res!872886) (not e!750028))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314847 (= res!872886 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43133 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314848 () Bool)

(declare-fun e!750030 () Bool)

(assert (=> b!1314848 (= e!750030 tp_is_empty!35619)))

(declare-fun mapNonEmpty!55057 () Bool)

(declare-fun tp!104988 () Bool)

(assert (=> mapNonEmpty!55057 (= mapRes!55057 (and tp!104988 e!750030))))

(declare-fun mapValue!55057 () ValueCell!16911)

(declare-fun mapRest!55057 () (Array (_ BitVec 32) ValueCell!16911))

(declare-fun mapKey!55057 () (_ BitVec 32))

(assert (=> mapNonEmpty!55057 (= (arr!42582 _values!1354) (store mapRest!55057 mapKey!55057 mapValue!55057))))

(declare-fun mapIsEmpty!55057 () Bool)

(assert (=> mapIsEmpty!55057 mapRes!55057))

(declare-fun res!872885 () Bool)

(assert (=> start!111054 (=> (not res!872885) (not e!750028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111054 (= res!872885 (validMask!0 mask!2040))))

(assert (=> start!111054 e!750028))

(assert (=> start!111054 tp!104989))

(declare-fun array_inv!32157 (array!88206) Bool)

(assert (=> start!111054 (array_inv!32157 _keys!1628)))

(assert (=> start!111054 true))

(assert (=> start!111054 tp_is_empty!35619))

(declare-fun array_inv!32158 (array!88204) Bool)

(assert (=> start!111054 (and (array_inv!32158 _values!1354) e!750031)))

(declare-fun b!1314849 () Bool)

(assert (=> b!1314849 (= e!750028 false)))

(declare-fun lt!585843 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52595)

(declare-fun zeroValue!1296 () V!52595)

(declare-datatypes ((tuple2!23066 0))(
  ( (tuple2!23067 (_1!11544 (_ BitVec 64)) (_2!11544 V!52595)) )
))
(declare-datatypes ((List!30203 0))(
  ( (Nil!30200) (Cons!30199 (h!31408 tuple2!23066) (t!43809 List!30203)) )
))
(declare-datatypes ((ListLongMap!20723 0))(
  ( (ListLongMap!20724 (toList!10377 List!30203)) )
))
(declare-fun contains!8527 (ListLongMap!20723 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5390 (array!88206 array!88204 (_ BitVec 32) (_ BitVec 32) V!52595 V!52595 (_ BitVec 32) Int) ListLongMap!20723)

(assert (=> b!1314849 (= lt!585843 (contains!8527 (getCurrentListMap!5390 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!111054 res!872885) b!1314844))

(assert (= (and b!1314844 res!872888) b!1314846))

(assert (= (and b!1314846 res!872887) b!1314845))

(assert (= (and b!1314845 res!872889) b!1314847))

(assert (= (and b!1314847 res!872886) b!1314849))

(assert (= (and b!1314842 condMapEmpty!55057) mapIsEmpty!55057))

(assert (= (and b!1314842 (not condMapEmpty!55057)) mapNonEmpty!55057))

(get-info :version)

(assert (= (and mapNonEmpty!55057 ((_ is ValueCellFull!16911) mapValue!55057)) b!1314848))

(assert (= (and b!1314842 ((_ is ValueCellFull!16911) mapDefault!55057)) b!1314843))

(assert (= start!111054 b!1314842))

(declare-fun m!1203229 () Bool)

(assert (=> start!111054 m!1203229))

(declare-fun m!1203231 () Bool)

(assert (=> start!111054 m!1203231))

(declare-fun m!1203233 () Bool)

(assert (=> start!111054 m!1203233))

(declare-fun m!1203235 () Bool)

(assert (=> b!1314846 m!1203235))

(declare-fun m!1203237 () Bool)

(assert (=> b!1314845 m!1203237))

(declare-fun m!1203239 () Bool)

(assert (=> mapNonEmpty!55057 m!1203239))

(declare-fun m!1203241 () Bool)

(assert (=> b!1314849 m!1203241))

(assert (=> b!1314849 m!1203241))

(declare-fun m!1203243 () Bool)

(assert (=> b!1314849 m!1203243))

(check-sat (not mapNonEmpty!55057) (not b!1314849) b_and!48097 tp_is_empty!35619 (not b!1314845) (not b_next!29889) (not b!1314846) (not start!111054))
(check-sat b_and!48097 (not b_next!29889))
