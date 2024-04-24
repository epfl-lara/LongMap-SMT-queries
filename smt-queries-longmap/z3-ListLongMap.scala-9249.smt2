; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111066 () Bool)

(assert start!111066)

(declare-fun b_free!29677 () Bool)

(declare-fun b_next!29677 () Bool)

(assert (=> start!111066 (= b_free!29677 (not b_next!29677))))

(declare-fun tp!104353 () Bool)

(declare-fun b_and!47887 () Bool)

(assert (=> start!111066 (= tp!104353 b_and!47887)))

(declare-fun b!1313398 () Bool)

(declare-fun res!871617 () Bool)

(declare-fun e!749281 () Bool)

(assert (=> b!1313398 (=> (not res!871617) (not e!749281))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313398 (= res!871617 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1313399 () Bool)

(declare-fun e!749283 () Bool)

(declare-fun tp_is_empty!35407 () Bool)

(assert (=> b!1313399 (= e!749283 tp_is_empty!35407)))

(declare-fun b!1313400 () Bool)

(declare-fun res!871618 () Bool)

(assert (=> b!1313400 (=> (not res!871618) (not e!749281))))

(declare-datatypes ((array!87851 0))(
  ( (array!87852 (arr!42401 (Array (_ BitVec 32) (_ BitVec 64))) (size!42952 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87851)

(declare-datatypes ((List!30099 0))(
  ( (Nil!30096) (Cons!30095 (h!31313 (_ BitVec 64)) (t!43697 List!30099)) )
))
(declare-fun arrayNoDuplicates!0 (array!87851 (_ BitVec 32) List!30099) Bool)

(assert (=> b!1313400 (= res!871618 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30096))))

(declare-fun b!1313401 () Bool)

(declare-fun res!871614 () Bool)

(assert (=> b!1313401 (=> (not res!871614) (not e!749281))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52313 0))(
  ( (V!52314 (val!17778 Int)) )
))
(declare-datatypes ((ValueCell!16805 0))(
  ( (ValueCellFull!16805 (v!20400 V!52313)) (EmptyCell!16805) )
))
(declare-datatypes ((array!87853 0))(
  ( (array!87854 (arr!42402 (Array (_ BitVec 32) ValueCell!16805)) (size!42953 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87853)

(assert (=> b!1313401 (= res!871614 (and (= (size!42953 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42952 _keys!1628) (size!42953 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313402 () Bool)

(declare-fun res!871621 () Bool)

(assert (=> b!1313402 (=> (not res!871621) (not e!749281))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313402 (= res!871621 (validKeyInArray!0 (select (arr!42401 _keys!1628) from!2020)))))

(declare-fun b!1313403 () Bool)

(declare-fun res!871622 () Bool)

(assert (=> b!1313403 (=> (not res!871622) (not e!749281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87851 (_ BitVec 32)) Bool)

(assert (=> b!1313403 (= res!871622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313404 () Bool)

(declare-fun res!871620 () Bool)

(assert (=> b!1313404 (=> (not res!871620) (not e!749281))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1313404 (= res!871620 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42952 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54739 () Bool)

(declare-fun mapRes!54739 () Bool)

(assert (=> mapIsEmpty!54739 mapRes!54739))

(declare-fun b!1313405 () Bool)

(declare-fun res!871619 () Bool)

(assert (=> b!1313405 (=> (not res!871619) (not e!749281))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52313)

(declare-fun zeroValue!1296 () V!52313)

(declare-datatypes ((tuple2!22946 0))(
  ( (tuple2!22947 (_1!11484 (_ BitVec 64)) (_2!11484 V!52313)) )
))
(declare-datatypes ((List!30100 0))(
  ( (Nil!30097) (Cons!30096 (h!31314 tuple2!22946) (t!43698 List!30100)) )
))
(declare-datatypes ((ListLongMap!20611 0))(
  ( (ListLongMap!20612 (toList!10321 List!30100)) )
))
(declare-fun contains!8483 (ListLongMap!20611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5325 (array!87851 array!87853 (_ BitVec 32) (_ BitVec 32) V!52313 V!52313 (_ BitVec 32) Int) ListLongMap!20611)

(assert (=> b!1313405 (= res!871619 (contains!8483 (getCurrentListMap!5325 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313406 () Bool)

(declare-fun e!749285 () Bool)

(assert (=> b!1313406 (= e!749285 tp_is_empty!35407)))

(declare-fun mapNonEmpty!54739 () Bool)

(declare-fun tp!104352 () Bool)

(assert (=> mapNonEmpty!54739 (= mapRes!54739 (and tp!104352 e!749285))))

(declare-fun mapRest!54739 () (Array (_ BitVec 32) ValueCell!16805))

(declare-fun mapValue!54739 () ValueCell!16805)

(declare-fun mapKey!54739 () (_ BitVec 32))

(assert (=> mapNonEmpty!54739 (= (arr!42402 _values!1354) (store mapRest!54739 mapKey!54739 mapValue!54739))))

(declare-fun b!1313407 () Bool)

(declare-fun res!871616 () Bool)

(assert (=> b!1313407 (=> (not res!871616) (not e!749281))))

(assert (=> b!1313407 (= res!871616 (not (= (select (arr!42401 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1313408 () Bool)

(assert (=> b!1313408 (= e!749281 (not true))))

(assert (=> b!1313408 (contains!8483 (getCurrentListMap!5325 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43335 0))(
  ( (Unit!43336) )
))
(declare-fun lt!586010 () Unit!43335)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!8 (array!87851 array!87853 (_ BitVec 32) (_ BitVec 32) V!52313 V!52313 (_ BitVec 64) (_ BitVec 32) Int) Unit!43335)

(assert (=> b!1313408 (= lt!586010 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!8 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1313409 () Bool)

(declare-fun e!749284 () Bool)

(assert (=> b!1313409 (= e!749284 (and e!749283 mapRes!54739))))

(declare-fun condMapEmpty!54739 () Bool)

(declare-fun mapDefault!54739 () ValueCell!16805)

(assert (=> b!1313409 (= condMapEmpty!54739 (= (arr!42402 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16805)) mapDefault!54739)))))

(declare-fun res!871615 () Bool)

(assert (=> start!111066 (=> (not res!871615) (not e!749281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111066 (= res!871615 (validMask!0 mask!2040))))

(assert (=> start!111066 e!749281))

(assert (=> start!111066 tp!104353))

(declare-fun array_inv!32295 (array!87851) Bool)

(assert (=> start!111066 (array_inv!32295 _keys!1628)))

(assert (=> start!111066 true))

(assert (=> start!111066 tp_is_empty!35407))

(declare-fun array_inv!32296 (array!87853) Bool)

(assert (=> start!111066 (and (array_inv!32296 _values!1354) e!749284)))

(assert (= (and start!111066 res!871615) b!1313401))

(assert (= (and b!1313401 res!871614) b!1313403))

(assert (= (and b!1313403 res!871622) b!1313400))

(assert (= (and b!1313400 res!871618) b!1313404))

(assert (= (and b!1313404 res!871620) b!1313405))

(assert (= (and b!1313405 res!871619) b!1313407))

(assert (= (and b!1313407 res!871616) b!1313402))

(assert (= (and b!1313402 res!871621) b!1313398))

(assert (= (and b!1313398 res!871617) b!1313408))

(assert (= (and b!1313409 condMapEmpty!54739) mapIsEmpty!54739))

(assert (= (and b!1313409 (not condMapEmpty!54739)) mapNonEmpty!54739))

(get-info :version)

(assert (= (and mapNonEmpty!54739 ((_ is ValueCellFull!16805) mapValue!54739)) b!1313406))

(assert (= (and b!1313409 ((_ is ValueCellFull!16805) mapDefault!54739)) b!1313399))

(assert (= start!111066 b!1313409))

(declare-fun m!1202969 () Bool)

(assert (=> b!1313408 m!1202969))

(assert (=> b!1313408 m!1202969))

(declare-fun m!1202971 () Bool)

(assert (=> b!1313408 m!1202971))

(declare-fun m!1202973 () Bool)

(assert (=> b!1313408 m!1202973))

(declare-fun m!1202975 () Bool)

(assert (=> b!1313403 m!1202975))

(declare-fun m!1202977 () Bool)

(assert (=> start!111066 m!1202977))

(declare-fun m!1202979 () Bool)

(assert (=> start!111066 m!1202979))

(declare-fun m!1202981 () Bool)

(assert (=> start!111066 m!1202981))

(declare-fun m!1202983 () Bool)

(assert (=> b!1313407 m!1202983))

(assert (=> b!1313402 m!1202983))

(assert (=> b!1313402 m!1202983))

(declare-fun m!1202985 () Bool)

(assert (=> b!1313402 m!1202985))

(declare-fun m!1202987 () Bool)

(assert (=> b!1313405 m!1202987))

(assert (=> b!1313405 m!1202987))

(declare-fun m!1202989 () Bool)

(assert (=> b!1313405 m!1202989))

(declare-fun m!1202991 () Bool)

(assert (=> b!1313400 m!1202991))

(declare-fun m!1202993 () Bool)

(assert (=> mapNonEmpty!54739 m!1202993))

(check-sat (not b!1313408) (not start!111066) tp_is_empty!35407 (not b!1313405) (not mapNonEmpty!54739) (not b!1313402) (not b_next!29677) (not b!1313403) (not b!1313400) b_and!47887)
(check-sat b_and!47887 (not b_next!29677))
