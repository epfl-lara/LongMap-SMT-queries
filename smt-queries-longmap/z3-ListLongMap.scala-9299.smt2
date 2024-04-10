; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111144 () Bool)

(assert start!111144)

(declare-fun b_free!29979 () Bool)

(declare-fun b_next!29979 () Bool)

(assert (=> start!111144 (= b_free!29979 (not b_next!29979))))

(declare-fun tp!105259 () Bool)

(declare-fun b_and!48187 () Bool)

(assert (=> start!111144 (= tp!105259 b_and!48187)))

(declare-fun mapNonEmpty!55192 () Bool)

(declare-fun mapRes!55192 () Bool)

(declare-fun tp!105258 () Bool)

(declare-fun e!750705 () Bool)

(assert (=> mapNonEmpty!55192 (= mapRes!55192 (and tp!105258 e!750705))))

(declare-fun mapKey!55192 () (_ BitVec 32))

(declare-datatypes ((V!52715 0))(
  ( (V!52716 (val!17929 Int)) )
))
(declare-datatypes ((ValueCell!16956 0))(
  ( (ValueCellFull!16956 (v!20556 V!52715)) (EmptyCell!16956) )
))
(declare-fun mapValue!55192 () ValueCell!16956)

(declare-fun mapRest!55192 () (Array (_ BitVec 32) ValueCell!16956))

(declare-datatypes ((array!88376 0))(
  ( (array!88377 (arr!42668 (Array (_ BitVec 32) ValueCell!16956)) (size!43218 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88376)

(assert (=> mapNonEmpty!55192 (= (arr!42668 _values!1354) (store mapRest!55192 mapKey!55192 mapValue!55192))))

(declare-fun b!1315958 () Bool)

(declare-fun res!873599 () Bool)

(declare-fun e!750706 () Bool)

(assert (=> b!1315958 (=> (not res!873599) (not e!750706))))

(declare-datatypes ((array!88378 0))(
  ( (array!88379 (arr!42669 (Array (_ BitVec 32) (_ BitVec 64))) (size!43219 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88378)

(declare-datatypes ((List!30270 0))(
  ( (Nil!30267) (Cons!30266 (h!31475 (_ BitVec 64)) (t!43876 List!30270)) )
))
(declare-fun arrayNoDuplicates!0 (array!88378 (_ BitVec 32) List!30270) Bool)

(assert (=> b!1315958 (= res!873599 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30267))))

(declare-fun mapIsEmpty!55192 () Bool)

(assert (=> mapIsEmpty!55192 mapRes!55192))

(declare-fun b!1315959 () Bool)

(declare-fun res!873597 () Bool)

(assert (=> b!1315959 (=> (not res!873597) (not e!750706))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315959 (= res!873597 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43219 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315960 () Bool)

(declare-fun e!750707 () Bool)

(declare-fun tp_is_empty!35709 () Bool)

(assert (=> b!1315960 (= e!750707 tp_is_empty!35709)))

(declare-fun b!1315961 () Bool)

(declare-fun e!750704 () Bool)

(assert (=> b!1315961 (= e!750704 (and e!750707 mapRes!55192))))

(declare-fun condMapEmpty!55192 () Bool)

(declare-fun mapDefault!55192 () ValueCell!16956)

(assert (=> b!1315961 (= condMapEmpty!55192 (= (arr!42668 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16956)) mapDefault!55192)))))

(declare-fun b!1315962 () Bool)

(declare-fun res!873598 () Bool)

(assert (=> b!1315962 (=> (not res!873598) (not e!750706))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88378 (_ BitVec 32)) Bool)

(assert (=> b!1315962 (= res!873598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315963 () Bool)

(assert (=> b!1315963 (= e!750705 tp_is_empty!35709)))

(declare-fun b!1315964 () Bool)

(declare-fun res!873596 () Bool)

(assert (=> b!1315964 (=> (not res!873596) (not e!750706))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315964 (= res!873596 (and (= (size!43218 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43219 _keys!1628) (size!43218 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315965 () Bool)

(assert (=> b!1315965 (= e!750706 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585978 () Bool)

(declare-fun minValue!1296 () V!52715)

(declare-fun zeroValue!1296 () V!52715)

(declare-datatypes ((tuple2!23132 0))(
  ( (tuple2!23133 (_1!11577 (_ BitVec 64)) (_2!11577 V!52715)) )
))
(declare-datatypes ((List!30271 0))(
  ( (Nil!30268) (Cons!30267 (h!31476 tuple2!23132) (t!43877 List!30271)) )
))
(declare-datatypes ((ListLongMap!20789 0))(
  ( (ListLongMap!20790 (toList!10410 List!30271)) )
))
(declare-fun contains!8560 (ListLongMap!20789 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5423 (array!88378 array!88376 (_ BitVec 32) (_ BitVec 32) V!52715 V!52715 (_ BitVec 32) Int) ListLongMap!20789)

(assert (=> b!1315965 (= lt!585978 (contains!8560 (getCurrentListMap!5423 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!873600 () Bool)

(assert (=> start!111144 (=> (not res!873600) (not e!750706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111144 (= res!873600 (validMask!0 mask!2040))))

(assert (=> start!111144 e!750706))

(assert (=> start!111144 tp!105259))

(declare-fun array_inv!32225 (array!88378) Bool)

(assert (=> start!111144 (array_inv!32225 _keys!1628)))

(assert (=> start!111144 true))

(assert (=> start!111144 tp_is_empty!35709))

(declare-fun array_inv!32226 (array!88376) Bool)

(assert (=> start!111144 (and (array_inv!32226 _values!1354) e!750704)))

(assert (= (and start!111144 res!873600) b!1315964))

(assert (= (and b!1315964 res!873596) b!1315962))

(assert (= (and b!1315962 res!873598) b!1315958))

(assert (= (and b!1315958 res!873599) b!1315959))

(assert (= (and b!1315959 res!873597) b!1315965))

(assert (= (and b!1315961 condMapEmpty!55192) mapIsEmpty!55192))

(assert (= (and b!1315961 (not condMapEmpty!55192)) mapNonEmpty!55192))

(get-info :version)

(assert (= (and mapNonEmpty!55192 ((_ is ValueCellFull!16956) mapValue!55192)) b!1315963))

(assert (= (and b!1315961 ((_ is ValueCellFull!16956) mapDefault!55192)) b!1315960))

(assert (= start!111144 b!1315961))

(declare-fun m!1203979 () Bool)

(assert (=> b!1315965 m!1203979))

(assert (=> b!1315965 m!1203979))

(declare-fun m!1203981 () Bool)

(assert (=> b!1315965 m!1203981))

(declare-fun m!1203983 () Bool)

(assert (=> start!111144 m!1203983))

(declare-fun m!1203985 () Bool)

(assert (=> start!111144 m!1203985))

(declare-fun m!1203987 () Bool)

(assert (=> start!111144 m!1203987))

(declare-fun m!1203989 () Bool)

(assert (=> mapNonEmpty!55192 m!1203989))

(declare-fun m!1203991 () Bool)

(assert (=> b!1315958 m!1203991))

(declare-fun m!1203993 () Bool)

(assert (=> b!1315962 m!1203993))

(check-sat (not b!1315958) (not b!1315965) tp_is_empty!35709 (not mapNonEmpty!55192) (not b_next!29979) b_and!48187 (not b!1315962) (not start!111144))
(check-sat b_and!48187 (not b_next!29979))
