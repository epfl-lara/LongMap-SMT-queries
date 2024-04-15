; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110986 () Bool)

(assert start!110986)

(declare-fun b_free!29821 () Bool)

(declare-fun b_next!29821 () Bool)

(assert (=> start!110986 (= b_free!29821 (not b_next!29821))))

(declare-fun tp!104785 () Bool)

(declare-fun b_and!48011 () Bool)

(assert (=> start!110986 (= tp!104785 b_and!48011)))

(declare-fun b!1313920 () Bool)

(declare-fun e!749485 () Bool)

(declare-fun e!749488 () Bool)

(declare-fun mapRes!54955 () Bool)

(assert (=> b!1313920 (= e!749485 (and e!749488 mapRes!54955))))

(declare-fun condMapEmpty!54955 () Bool)

(declare-datatypes ((V!52505 0))(
  ( (V!52506 (val!17850 Int)) )
))
(declare-datatypes ((ValueCell!16877 0))(
  ( (ValueCellFull!16877 (v!20476 V!52505)) (EmptyCell!16877) )
))
(declare-datatypes ((array!87981 0))(
  ( (array!87982 (arr!42471 (Array (_ BitVec 32) ValueCell!16877)) (size!43023 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87981)

(declare-fun mapDefault!54955 () ValueCell!16877)

(assert (=> b!1313920 (= condMapEmpty!54955 (= (arr!42471 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16877)) mapDefault!54955)))))

(declare-fun mapNonEmpty!54955 () Bool)

(declare-fun tp!104786 () Bool)

(declare-fun e!749487 () Bool)

(assert (=> mapNonEmpty!54955 (= mapRes!54955 (and tp!104786 e!749487))))

(declare-fun mapRest!54955 () (Array (_ BitVec 32) ValueCell!16877))

(declare-fun mapValue!54955 () ValueCell!16877)

(declare-fun mapKey!54955 () (_ BitVec 32))

(assert (=> mapNonEmpty!54955 (= (arr!42471 _values!1354) (store mapRest!54955 mapKey!54955 mapValue!54955))))

(declare-fun mapIsEmpty!54955 () Bool)

(assert (=> mapIsEmpty!54955 mapRes!54955))

(declare-fun b!1313921 () Bool)

(declare-fun tp_is_empty!35551 () Bool)

(assert (=> b!1313921 (= e!749488 tp_is_empty!35551)))

(declare-fun b!1313922 () Bool)

(declare-fun res!872311 () Bool)

(declare-fun e!749486 () Bool)

(assert (=> b!1313922 (=> (not res!872311) (not e!749486))))

(declare-datatypes ((array!87983 0))(
  ( (array!87984 (arr!42472 (Array (_ BitVec 32) (_ BitVec 64))) (size!43024 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87983)

(declare-datatypes ((List!30221 0))(
  ( (Nil!30218) (Cons!30217 (h!31426 (_ BitVec 64)) (t!43819 List!30221)) )
))
(declare-fun arrayNoDuplicates!0 (array!87983 (_ BitVec 32) List!30221) Bool)

(assert (=> b!1313922 (= res!872311 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30218))))

(declare-fun b!1313923 () Bool)

(declare-fun res!872314 () Bool)

(assert (=> b!1313923 (=> (not res!872314) (not e!749486))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313923 (= res!872314 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43024 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313924 () Bool)

(assert (=> b!1313924 (= e!749487 tp_is_empty!35551)))

(declare-fun res!872313 () Bool)

(assert (=> start!110986 (=> (not res!872313) (not e!749486))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110986 (= res!872313 (validMask!0 mask!2040))))

(assert (=> start!110986 e!749486))

(assert (=> start!110986 tp!104785))

(declare-fun array_inv!32267 (array!87983) Bool)

(assert (=> start!110986 (array_inv!32267 _keys!1628)))

(assert (=> start!110986 true))

(assert (=> start!110986 tp_is_empty!35551))

(declare-fun array_inv!32268 (array!87981) Bool)

(assert (=> start!110986 (and (array_inv!32268 _values!1354) e!749485)))

(declare-fun b!1313925 () Bool)

(declare-fun res!872310 () Bool)

(assert (=> b!1313925 (=> (not res!872310) (not e!749486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87983 (_ BitVec 32)) Bool)

(assert (=> b!1313925 (= res!872310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313926 () Bool)

(assert (=> b!1313926 (= e!749486 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52505)

(declare-fun zeroValue!1296 () V!52505)

(declare-fun lt!585555 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23100 0))(
  ( (tuple2!23101 (_1!11561 (_ BitVec 64)) (_2!11561 V!52505)) )
))
(declare-datatypes ((List!30222 0))(
  ( (Nil!30219) (Cons!30218 (h!31427 tuple2!23100) (t!43820 List!30222)) )
))
(declare-datatypes ((ListLongMap!20757 0))(
  ( (ListLongMap!20758 (toList!10394 List!30222)) )
))
(declare-fun contains!8471 (ListLongMap!20757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5289 (array!87983 array!87981 (_ BitVec 32) (_ BitVec 32) V!52505 V!52505 (_ BitVec 32) Int) ListLongMap!20757)

(assert (=> b!1313926 (= lt!585555 (contains!8471 (getCurrentListMap!5289 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313927 () Bool)

(declare-fun res!872312 () Bool)

(assert (=> b!1313927 (=> (not res!872312) (not e!749486))))

(assert (=> b!1313927 (= res!872312 (and (= (size!43023 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43024 _keys!1628) (size!43023 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110986 res!872313) b!1313927))

(assert (= (and b!1313927 res!872312) b!1313925))

(assert (= (and b!1313925 res!872310) b!1313922))

(assert (= (and b!1313922 res!872311) b!1313923))

(assert (= (and b!1313923 res!872314) b!1313926))

(assert (= (and b!1313920 condMapEmpty!54955) mapIsEmpty!54955))

(assert (= (and b!1313920 (not condMapEmpty!54955)) mapNonEmpty!54955))

(get-info :version)

(assert (= (and mapNonEmpty!54955 ((_ is ValueCellFull!16877) mapValue!54955)) b!1313924))

(assert (= (and b!1313920 ((_ is ValueCellFull!16877) mapDefault!54955)) b!1313921))

(assert (= start!110986 b!1313920))

(declare-fun m!1202139 () Bool)

(assert (=> start!110986 m!1202139))

(declare-fun m!1202141 () Bool)

(assert (=> start!110986 m!1202141))

(declare-fun m!1202143 () Bool)

(assert (=> start!110986 m!1202143))

(declare-fun m!1202145 () Bool)

(assert (=> mapNonEmpty!54955 m!1202145))

(declare-fun m!1202147 () Bool)

(assert (=> b!1313926 m!1202147))

(assert (=> b!1313926 m!1202147))

(declare-fun m!1202149 () Bool)

(assert (=> b!1313926 m!1202149))

(declare-fun m!1202151 () Bool)

(assert (=> b!1313925 m!1202151))

(declare-fun m!1202153 () Bool)

(assert (=> b!1313922 m!1202153))

(check-sat (not mapNonEmpty!54955) (not b_next!29821) b_and!48011 (not start!110986) (not b!1313922) tp_is_empty!35551 (not b!1313926) (not b!1313925))
(check-sat b_and!48011 (not b_next!29821))
