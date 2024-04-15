; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110500 () Bool)

(assert start!110500)

(declare-fun b_free!29335 () Bool)

(declare-fun b_next!29335 () Bool)

(assert (=> start!110500 (= b_free!29335 (not b_next!29335))))

(declare-fun tp!103328 () Bool)

(declare-fun b_and!47525 () Bool)

(assert (=> start!110500 (= tp!103328 b_and!47525)))

(declare-fun b!1307089 () Bool)

(declare-fun e!745841 () Bool)

(assert (=> b!1307089 (= e!745841 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87047 0))(
  ( (array!87048 (arr!42004 (Array (_ BitVec 32) (_ BitVec 64))) (size!42556 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87047)

(declare-fun lt!584835 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51857 0))(
  ( (V!51858 (val!17607 Int)) )
))
(declare-fun minValue!1296 () V!51857)

(declare-datatypes ((ValueCell!16634 0))(
  ( (ValueCellFull!16634 (v!20233 V!51857)) (EmptyCell!16634) )
))
(declare-datatypes ((array!87049 0))(
  ( (array!87050 (arr!42005 (Array (_ BitVec 32) ValueCell!16634)) (size!42557 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87049)

(declare-fun zeroValue!1296 () V!51857)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22744 0))(
  ( (tuple2!22745 (_1!11383 (_ BitVec 64)) (_2!11383 V!51857)) )
))
(declare-datatypes ((List!29868 0))(
  ( (Nil!29865) (Cons!29864 (h!31073 tuple2!22744) (t!43466 List!29868)) )
))
(declare-datatypes ((ListLongMap!20401 0))(
  ( (ListLongMap!20402 (toList!10216 List!29868)) )
))
(declare-fun contains!8293 (ListLongMap!20401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5111 (array!87047 array!87049 (_ BitVec 32) (_ BitVec 32) V!51857 V!51857 (_ BitVec 32) Int) ListLongMap!20401)

(assert (=> b!1307089 (= lt!584835 (contains!8293 (getCurrentListMap!5111 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54226 () Bool)

(declare-fun mapRes!54226 () Bool)

(declare-fun tp!103327 () Bool)

(declare-fun e!745843 () Bool)

(assert (=> mapNonEmpty!54226 (= mapRes!54226 (and tp!103327 e!745843))))

(declare-fun mapValue!54226 () ValueCell!16634)

(declare-fun mapKey!54226 () (_ BitVec 32))

(declare-fun mapRest!54226 () (Array (_ BitVec 32) ValueCell!16634))

(assert (=> mapNonEmpty!54226 (= (arr!42005 _values!1354) (store mapRest!54226 mapKey!54226 mapValue!54226))))

(declare-fun b!1307090 () Bool)

(declare-fun res!867669 () Bool)

(assert (=> b!1307090 (=> (not res!867669) (not e!745841))))

(assert (=> b!1307090 (= res!867669 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42556 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307091 () Bool)

(declare-fun res!867666 () Bool)

(assert (=> b!1307091 (=> (not res!867666) (not e!745841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87047 (_ BitVec 32)) Bool)

(assert (=> b!1307091 (= res!867666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307092 () Bool)

(declare-fun res!867667 () Bool)

(assert (=> b!1307092 (=> (not res!867667) (not e!745841))))

(declare-datatypes ((List!29869 0))(
  ( (Nil!29866) (Cons!29865 (h!31074 (_ BitVec 64)) (t!43467 List!29869)) )
))
(declare-fun arrayNoDuplicates!0 (array!87047 (_ BitVec 32) List!29869) Bool)

(assert (=> b!1307092 (= res!867667 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29866))))

(declare-fun mapIsEmpty!54226 () Bool)

(assert (=> mapIsEmpty!54226 mapRes!54226))

(declare-fun b!1307093 () Bool)

(declare-fun tp_is_empty!35065 () Bool)

(assert (=> b!1307093 (= e!745843 tp_is_empty!35065)))

(declare-fun b!1307094 () Bool)

(declare-fun e!745842 () Bool)

(assert (=> b!1307094 (= e!745842 tp_is_empty!35065)))

(declare-fun b!1307095 () Bool)

(declare-fun res!867668 () Bool)

(assert (=> b!1307095 (=> (not res!867668) (not e!745841))))

(assert (=> b!1307095 (= res!867668 (and (= (size!42557 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42556 _keys!1628) (size!42557 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307096 () Bool)

(declare-fun e!745840 () Bool)

(assert (=> b!1307096 (= e!745840 (and e!745842 mapRes!54226))))

(declare-fun condMapEmpty!54226 () Bool)

(declare-fun mapDefault!54226 () ValueCell!16634)

(assert (=> b!1307096 (= condMapEmpty!54226 (= (arr!42005 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16634)) mapDefault!54226)))))

(declare-fun res!867670 () Bool)

(assert (=> start!110500 (=> (not res!867670) (not e!745841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110500 (= res!867670 (validMask!0 mask!2040))))

(assert (=> start!110500 e!745841))

(assert (=> start!110500 tp!103328))

(declare-fun array_inv!31945 (array!87047) Bool)

(assert (=> start!110500 (array_inv!31945 _keys!1628)))

(assert (=> start!110500 true))

(assert (=> start!110500 tp_is_empty!35065))

(declare-fun array_inv!31946 (array!87049) Bool)

(assert (=> start!110500 (and (array_inv!31946 _values!1354) e!745840)))

(assert (= (and start!110500 res!867670) b!1307095))

(assert (= (and b!1307095 res!867668) b!1307091))

(assert (= (and b!1307091 res!867666) b!1307092))

(assert (= (and b!1307092 res!867667) b!1307090))

(assert (= (and b!1307090 res!867669) b!1307089))

(assert (= (and b!1307096 condMapEmpty!54226) mapIsEmpty!54226))

(assert (= (and b!1307096 (not condMapEmpty!54226)) mapNonEmpty!54226))

(get-info :version)

(assert (= (and mapNonEmpty!54226 ((_ is ValueCellFull!16634) mapValue!54226)) b!1307093))

(assert (= (and b!1307096 ((_ is ValueCellFull!16634) mapDefault!54226)) b!1307094))

(assert (= start!110500 b!1307096))

(declare-fun m!1197429 () Bool)

(assert (=> start!110500 m!1197429))

(declare-fun m!1197431 () Bool)

(assert (=> start!110500 m!1197431))

(declare-fun m!1197433 () Bool)

(assert (=> start!110500 m!1197433))

(declare-fun m!1197435 () Bool)

(assert (=> b!1307091 m!1197435))

(declare-fun m!1197437 () Bool)

(assert (=> b!1307092 m!1197437))

(declare-fun m!1197439 () Bool)

(assert (=> b!1307089 m!1197439))

(assert (=> b!1307089 m!1197439))

(declare-fun m!1197441 () Bool)

(assert (=> b!1307089 m!1197441))

(declare-fun m!1197443 () Bool)

(assert (=> mapNonEmpty!54226 m!1197443))

(check-sat (not mapNonEmpty!54226) (not b!1307089) (not b!1307092) b_and!47525 (not start!110500) (not b_next!29335) tp_is_empty!35065 (not b!1307091))
(check-sat b_and!47525 (not b_next!29335))
