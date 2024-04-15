; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110998 () Bool)

(assert start!110998)

(declare-fun b_free!29833 () Bool)

(declare-fun b_next!29833 () Bool)

(assert (=> start!110998 (= b_free!29833 (not b_next!29833))))

(declare-fun tp!104821 () Bool)

(declare-fun b_and!48023 () Bool)

(assert (=> start!110998 (= tp!104821 b_and!48023)))

(declare-fun mapNonEmpty!54973 () Bool)

(declare-fun mapRes!54973 () Bool)

(declare-fun tp!104822 () Bool)

(declare-fun e!749575 () Bool)

(assert (=> mapNonEmpty!54973 (= mapRes!54973 (and tp!104822 e!749575))))

(declare-fun mapKey!54973 () (_ BitVec 32))

(declare-datatypes ((V!52521 0))(
  ( (V!52522 (val!17856 Int)) )
))
(declare-datatypes ((ValueCell!16883 0))(
  ( (ValueCellFull!16883 (v!20482 V!52521)) (EmptyCell!16883) )
))
(declare-datatypes ((array!88003 0))(
  ( (array!88004 (arr!42482 (Array (_ BitVec 32) ValueCell!16883)) (size!43034 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88003)

(declare-fun mapValue!54973 () ValueCell!16883)

(declare-fun mapRest!54973 () (Array (_ BitVec 32) ValueCell!16883))

(assert (=> mapNonEmpty!54973 (= (arr!42482 _values!1354) (store mapRest!54973 mapKey!54973 mapValue!54973))))

(declare-fun b!1314064 () Bool)

(declare-fun res!872402 () Bool)

(declare-fun e!749576 () Bool)

(assert (=> b!1314064 (=> (not res!872402) (not e!749576))))

(declare-datatypes ((array!88005 0))(
  ( (array!88006 (arr!42483 (Array (_ BitVec 32) (_ BitVec 64))) (size!43035 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88005)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88005 (_ BitVec 32)) Bool)

(assert (=> b!1314064 (= res!872402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314065 () Bool)

(declare-fun tp_is_empty!35563 () Bool)

(assert (=> b!1314065 (= e!749575 tp_is_empty!35563)))

(declare-fun b!1314066 () Bool)

(declare-fun e!749577 () Bool)

(declare-fun e!749579 () Bool)

(assert (=> b!1314066 (= e!749577 (and e!749579 mapRes!54973))))

(declare-fun condMapEmpty!54973 () Bool)

(declare-fun mapDefault!54973 () ValueCell!16883)

(assert (=> b!1314066 (= condMapEmpty!54973 (= (arr!42482 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16883)) mapDefault!54973)))))

(declare-fun b!1314067 () Bool)

(assert (=> b!1314067 (= e!749576 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52521)

(declare-fun zeroValue!1296 () V!52521)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585573 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23110 0))(
  ( (tuple2!23111 (_1!11566 (_ BitVec 64)) (_2!11566 V!52521)) )
))
(declare-datatypes ((List!30229 0))(
  ( (Nil!30226) (Cons!30225 (h!31434 tuple2!23110) (t!43827 List!30229)) )
))
(declare-datatypes ((ListLongMap!20767 0))(
  ( (ListLongMap!20768 (toList!10399 List!30229)) )
))
(declare-fun contains!8476 (ListLongMap!20767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5294 (array!88005 array!88003 (_ BitVec 32) (_ BitVec 32) V!52521 V!52521 (_ BitVec 32) Int) ListLongMap!20767)

(assert (=> b!1314067 (= lt!585573 (contains!8476 (getCurrentListMap!5294 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314068 () Bool)

(assert (=> b!1314068 (= e!749579 tp_is_empty!35563)))

(declare-fun b!1314069 () Bool)

(declare-fun res!872403 () Bool)

(assert (=> b!1314069 (=> (not res!872403) (not e!749576))))

(declare-datatypes ((List!30230 0))(
  ( (Nil!30227) (Cons!30226 (h!31435 (_ BitVec 64)) (t!43828 List!30230)) )
))
(declare-fun arrayNoDuplicates!0 (array!88005 (_ BitVec 32) List!30230) Bool)

(assert (=> b!1314069 (= res!872403 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30227))))

(declare-fun b!1314070 () Bool)

(declare-fun res!872401 () Bool)

(assert (=> b!1314070 (=> (not res!872401) (not e!749576))))

(assert (=> b!1314070 (= res!872401 (and (= (size!43034 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43035 _keys!1628) (size!43034 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314071 () Bool)

(declare-fun res!872404 () Bool)

(assert (=> b!1314071 (=> (not res!872404) (not e!749576))))

(assert (=> b!1314071 (= res!872404 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43035 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!872400 () Bool)

(assert (=> start!110998 (=> (not res!872400) (not e!749576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110998 (= res!872400 (validMask!0 mask!2040))))

(assert (=> start!110998 e!749576))

(assert (=> start!110998 tp!104821))

(declare-fun array_inv!32277 (array!88005) Bool)

(assert (=> start!110998 (array_inv!32277 _keys!1628)))

(assert (=> start!110998 true))

(assert (=> start!110998 tp_is_empty!35563))

(declare-fun array_inv!32278 (array!88003) Bool)

(assert (=> start!110998 (and (array_inv!32278 _values!1354) e!749577)))

(declare-fun mapIsEmpty!54973 () Bool)

(assert (=> mapIsEmpty!54973 mapRes!54973))

(assert (= (and start!110998 res!872400) b!1314070))

(assert (= (and b!1314070 res!872401) b!1314064))

(assert (= (and b!1314064 res!872402) b!1314069))

(assert (= (and b!1314069 res!872403) b!1314071))

(assert (= (and b!1314071 res!872404) b!1314067))

(assert (= (and b!1314066 condMapEmpty!54973) mapIsEmpty!54973))

(assert (= (and b!1314066 (not condMapEmpty!54973)) mapNonEmpty!54973))

(get-info :version)

(assert (= (and mapNonEmpty!54973 ((_ is ValueCellFull!16883) mapValue!54973)) b!1314065))

(assert (= (and b!1314066 ((_ is ValueCellFull!16883) mapDefault!54973)) b!1314068))

(assert (= start!110998 b!1314066))

(declare-fun m!1202235 () Bool)

(assert (=> start!110998 m!1202235))

(declare-fun m!1202237 () Bool)

(assert (=> start!110998 m!1202237))

(declare-fun m!1202239 () Bool)

(assert (=> start!110998 m!1202239))

(declare-fun m!1202241 () Bool)

(assert (=> b!1314069 m!1202241))

(declare-fun m!1202243 () Bool)

(assert (=> b!1314064 m!1202243))

(declare-fun m!1202245 () Bool)

(assert (=> mapNonEmpty!54973 m!1202245))

(declare-fun m!1202247 () Bool)

(assert (=> b!1314067 m!1202247))

(assert (=> b!1314067 m!1202247))

(declare-fun m!1202249 () Bool)

(assert (=> b!1314067 m!1202249))

(check-sat (not start!110998) (not b_next!29833) (not mapNonEmpty!54973) (not b!1314067) b_and!48023 (not b!1314064) (not b!1314069) tp_is_empty!35563)
(check-sat b_and!48023 (not b_next!29833))
