; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111060 () Bool)

(assert start!111060)

(declare-fun b_free!29895 () Bool)

(declare-fun b_next!29895 () Bool)

(assert (=> start!111060 (= b_free!29895 (not b_next!29895))))

(declare-fun tp!105007 () Bool)

(declare-fun b_and!48103 () Bool)

(assert (=> start!111060 (= tp!105007 b_and!48103)))

(declare-fun b!1314914 () Bool)

(declare-fun e!750074 () Bool)

(assert (=> b!1314914 (= e!750074 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88214 0))(
  ( (array!88215 (arr!42587 (Array (_ BitVec 32) (_ BitVec 64))) (size!43137 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88214)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52603 0))(
  ( (V!52604 (val!17887 Int)) )
))
(declare-fun minValue!1296 () V!52603)

(declare-fun zeroValue!1296 () V!52603)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16914 0))(
  ( (ValueCellFull!16914 (v!20514 V!52603)) (EmptyCell!16914) )
))
(declare-datatypes ((array!88216 0))(
  ( (array!88217 (arr!42588 (Array (_ BitVec 32) ValueCell!16914)) (size!43138 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88216)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585852 () Bool)

(declare-datatypes ((tuple2!23068 0))(
  ( (tuple2!23069 (_1!11545 (_ BitVec 64)) (_2!11545 V!52603)) )
))
(declare-datatypes ((List!30205 0))(
  ( (Nil!30202) (Cons!30201 (h!31410 tuple2!23068) (t!43811 List!30205)) )
))
(declare-datatypes ((ListLongMap!20725 0))(
  ( (ListLongMap!20726 (toList!10378 List!30205)) )
))
(declare-fun contains!8528 (ListLongMap!20725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5391 (array!88214 array!88216 (_ BitVec 32) (_ BitVec 32) V!52603 V!52603 (_ BitVec 32) Int) ListLongMap!20725)

(assert (=> b!1314914 (= lt!585852 (contains!8528 (getCurrentListMap!5391 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314915 () Bool)

(declare-fun e!750076 () Bool)

(declare-fun e!750073 () Bool)

(declare-fun mapRes!55066 () Bool)

(assert (=> b!1314915 (= e!750076 (and e!750073 mapRes!55066))))

(declare-fun condMapEmpty!55066 () Bool)

(declare-fun mapDefault!55066 () ValueCell!16914)

(assert (=> b!1314915 (= condMapEmpty!55066 (= (arr!42588 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16914)) mapDefault!55066)))))

(declare-fun mapIsEmpty!55066 () Bool)

(assert (=> mapIsEmpty!55066 mapRes!55066))

(declare-fun b!1314916 () Bool)

(declare-fun res!872931 () Bool)

(assert (=> b!1314916 (=> (not res!872931) (not e!750074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88214 (_ BitVec 32)) Bool)

(assert (=> b!1314916 (= res!872931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314917 () Bool)

(declare-fun res!872932 () Bool)

(assert (=> b!1314917 (=> (not res!872932) (not e!750074))))

(assert (=> b!1314917 (= res!872932 (and (= (size!43138 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43137 _keys!1628) (size!43138 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314918 () Bool)

(declare-fun tp_is_empty!35625 () Bool)

(assert (=> b!1314918 (= e!750073 tp_is_empty!35625)))

(declare-fun b!1314919 () Bool)

(declare-fun e!750077 () Bool)

(assert (=> b!1314919 (= e!750077 tp_is_empty!35625)))

(declare-fun b!1314920 () Bool)

(declare-fun res!872930 () Bool)

(assert (=> b!1314920 (=> (not res!872930) (not e!750074))))

(assert (=> b!1314920 (= res!872930 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43137 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!872934 () Bool)

(assert (=> start!111060 (=> (not res!872934) (not e!750074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111060 (= res!872934 (validMask!0 mask!2040))))

(assert (=> start!111060 e!750074))

(assert (=> start!111060 tp!105007))

(declare-fun array_inv!32161 (array!88214) Bool)

(assert (=> start!111060 (array_inv!32161 _keys!1628)))

(assert (=> start!111060 true))

(assert (=> start!111060 tp_is_empty!35625))

(declare-fun array_inv!32162 (array!88216) Bool)

(assert (=> start!111060 (and (array_inv!32162 _values!1354) e!750076)))

(declare-fun mapNonEmpty!55066 () Bool)

(declare-fun tp!105006 () Bool)

(assert (=> mapNonEmpty!55066 (= mapRes!55066 (and tp!105006 e!750077))))

(declare-fun mapKey!55066 () (_ BitVec 32))

(declare-fun mapRest!55066 () (Array (_ BitVec 32) ValueCell!16914))

(declare-fun mapValue!55066 () ValueCell!16914)

(assert (=> mapNonEmpty!55066 (= (arr!42588 _values!1354) (store mapRest!55066 mapKey!55066 mapValue!55066))))

(declare-fun b!1314921 () Bool)

(declare-fun res!872933 () Bool)

(assert (=> b!1314921 (=> (not res!872933) (not e!750074))))

(declare-datatypes ((List!30206 0))(
  ( (Nil!30203) (Cons!30202 (h!31411 (_ BitVec 64)) (t!43812 List!30206)) )
))
(declare-fun arrayNoDuplicates!0 (array!88214 (_ BitVec 32) List!30206) Bool)

(assert (=> b!1314921 (= res!872933 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30203))))

(assert (= (and start!111060 res!872934) b!1314917))

(assert (= (and b!1314917 res!872932) b!1314916))

(assert (= (and b!1314916 res!872931) b!1314921))

(assert (= (and b!1314921 res!872933) b!1314920))

(assert (= (and b!1314920 res!872930) b!1314914))

(assert (= (and b!1314915 condMapEmpty!55066) mapIsEmpty!55066))

(assert (= (and b!1314915 (not condMapEmpty!55066)) mapNonEmpty!55066))

(get-info :version)

(assert (= (and mapNonEmpty!55066 ((_ is ValueCellFull!16914) mapValue!55066)) b!1314919))

(assert (= (and b!1314915 ((_ is ValueCellFull!16914) mapDefault!55066)) b!1314918))

(assert (= start!111060 b!1314915))

(declare-fun m!1203277 () Bool)

(assert (=> b!1314921 m!1203277))

(declare-fun m!1203279 () Bool)

(assert (=> b!1314916 m!1203279))

(declare-fun m!1203281 () Bool)

(assert (=> b!1314914 m!1203281))

(assert (=> b!1314914 m!1203281))

(declare-fun m!1203283 () Bool)

(assert (=> b!1314914 m!1203283))

(declare-fun m!1203285 () Bool)

(assert (=> start!111060 m!1203285))

(declare-fun m!1203287 () Bool)

(assert (=> start!111060 m!1203287))

(declare-fun m!1203289 () Bool)

(assert (=> start!111060 m!1203289))

(declare-fun m!1203291 () Bool)

(assert (=> mapNonEmpty!55066 m!1203291))

(check-sat b_and!48103 (not b!1314914) (not mapNonEmpty!55066) (not b_next!29895) (not start!111060) (not b!1314916) (not b!1314921) tp_is_empty!35625)
(check-sat b_and!48103 (not b_next!29895))
