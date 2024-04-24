; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110814 () Bool)

(assert start!110814)

(declare-fun b_free!29425 () Bool)

(declare-fun b_next!29425 () Bool)

(assert (=> start!110814 (= b_free!29425 (not b_next!29425))))

(declare-fun tp!103596 () Bool)

(declare-fun b_and!47635 () Bool)

(assert (=> start!110814 (= tp!103596 b_and!47635)))

(declare-fun b!1309726 () Bool)

(declare-fun res!869081 () Bool)

(declare-fun e!747391 () Bool)

(assert (=> b!1309726 (=> (not res!869081) (not e!747391))))

(declare-datatypes ((array!87367 0))(
  ( (array!87368 (arr!42159 (Array (_ BitVec 32) (_ BitVec 64))) (size!42710 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87367)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309726 (= res!869081 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42710 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309727 () Bool)

(declare-fun res!869079 () Bool)

(assert (=> b!1309727 (=> (not res!869079) (not e!747391))))

(assert (=> b!1309727 (= res!869079 (not (= (select (arr!42159 _keys!1628) from!2020) k0!1175)))))

(declare-fun res!869084 () Bool)

(assert (=> start!110814 (=> (not res!869084) (not e!747391))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110814 (= res!869084 (validMask!0 mask!2040))))

(assert (=> start!110814 e!747391))

(assert (=> start!110814 tp!103596))

(declare-fun array_inv!32123 (array!87367) Bool)

(assert (=> start!110814 (array_inv!32123 _keys!1628)))

(assert (=> start!110814 true))

(declare-fun tp_is_empty!35155 () Bool)

(assert (=> start!110814 tp_is_empty!35155))

(declare-datatypes ((V!51977 0))(
  ( (V!51978 (val!17652 Int)) )
))
(declare-datatypes ((ValueCell!16679 0))(
  ( (ValueCellFull!16679 (v!20274 V!51977)) (EmptyCell!16679) )
))
(declare-datatypes ((array!87369 0))(
  ( (array!87370 (arr!42160 (Array (_ BitVec 32) ValueCell!16679)) (size!42711 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87369)

(declare-fun e!747393 () Bool)

(declare-fun array_inv!32124 (array!87369) Bool)

(assert (=> start!110814 (and (array_inv!32124 _values!1354) e!747393)))

(declare-fun mapIsEmpty!54361 () Bool)

(declare-fun mapRes!54361 () Bool)

(assert (=> mapIsEmpty!54361 mapRes!54361))

(declare-fun b!1309728 () Bool)

(declare-fun e!747394 () Bool)

(assert (=> b!1309728 (= e!747394 tp_is_empty!35155)))

(declare-fun b!1309729 () Bool)

(declare-fun res!869076 () Bool)

(assert (=> b!1309729 (=> (not res!869076) (not e!747391))))

(declare-datatypes ((List!29929 0))(
  ( (Nil!29926) (Cons!29925 (h!31143 (_ BitVec 64)) (t!43527 List!29929)) )
))
(declare-fun arrayNoDuplicates!0 (array!87367 (_ BitVec 32) List!29929) Bool)

(assert (=> b!1309729 (= res!869076 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29926))))

(declare-fun b!1309730 () Bool)

(declare-fun res!869082 () Bool)

(assert (=> b!1309730 (=> (not res!869082) (not e!747391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309730 (= res!869082 (validKeyInArray!0 (select (arr!42159 _keys!1628) from!2020)))))

(declare-fun b!1309731 () Bool)

(declare-fun e!747392 () Bool)

(assert (=> b!1309731 (= e!747392 tp_is_empty!35155)))

(declare-fun b!1309732 () Bool)

(assert (=> b!1309732 (= e!747393 (and e!747392 mapRes!54361))))

(declare-fun condMapEmpty!54361 () Bool)

(declare-fun mapDefault!54361 () ValueCell!16679)

(assert (=> b!1309732 (= condMapEmpty!54361 (= (arr!42160 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16679)) mapDefault!54361)))))

(declare-fun b!1309733 () Bool)

(declare-fun res!869078 () Bool)

(assert (=> b!1309733 (=> (not res!869078) (not e!747391))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309733 (= res!869078 (and (= (size!42711 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42710 _keys!1628) (size!42711 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309734 () Bool)

(assert (=> b!1309734 (= e!747391 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51977)

(declare-fun zeroValue!1296 () V!51977)

(declare-datatypes ((tuple2!22768 0))(
  ( (tuple2!22769 (_1!11395 (_ BitVec 64)) (_2!11395 V!51977)) )
))
(declare-datatypes ((List!29930 0))(
  ( (Nil!29927) (Cons!29926 (h!31144 tuple2!22768) (t!43528 List!29930)) )
))
(declare-datatypes ((ListLongMap!20433 0))(
  ( (ListLongMap!20434 (toList!10232 List!29930)) )
))
(declare-fun contains!8394 (ListLongMap!20433 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5236 (array!87367 array!87369 (_ BitVec 32) (_ BitVec 32) V!51977 V!51977 (_ BitVec 32) Int) ListLongMap!20433)

(assert (=> b!1309734 (contains!8394 (getCurrentListMap!5236 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43261 0))(
  ( (Unit!43262) )
))
(declare-fun lt!585632 () Unit!43261)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!11 (array!87367 array!87369 (_ BitVec 32) (_ BitVec 32) V!51977 V!51977 (_ BitVec 64) (_ BitVec 32) Int) Unit!43261)

(assert (=> b!1309734 (= lt!585632 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!11 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309735 () Bool)

(declare-fun res!869077 () Bool)

(assert (=> b!1309735 (=> (not res!869077) (not e!747391))))

(assert (=> b!1309735 (= res!869077 (contains!8394 (getCurrentListMap!5236 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54361 () Bool)

(declare-fun tp!103597 () Bool)

(assert (=> mapNonEmpty!54361 (= mapRes!54361 (and tp!103597 e!747394))))

(declare-fun mapKey!54361 () (_ BitVec 32))

(declare-fun mapValue!54361 () ValueCell!16679)

(declare-fun mapRest!54361 () (Array (_ BitVec 32) ValueCell!16679))

(assert (=> mapNonEmpty!54361 (= (arr!42160 _values!1354) (store mapRest!54361 mapKey!54361 mapValue!54361))))

(declare-fun b!1309736 () Bool)

(declare-fun res!869080 () Bool)

(assert (=> b!1309736 (=> (not res!869080) (not e!747391))))

(assert (=> b!1309736 (= res!869080 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1309737 () Bool)

(declare-fun res!869083 () Bool)

(assert (=> b!1309737 (=> (not res!869083) (not e!747391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87367 (_ BitVec 32)) Bool)

(assert (=> b!1309737 (= res!869083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110814 res!869084) b!1309733))

(assert (= (and b!1309733 res!869078) b!1309737))

(assert (= (and b!1309737 res!869083) b!1309729))

(assert (= (and b!1309729 res!869076) b!1309726))

(assert (= (and b!1309726 res!869081) b!1309735))

(assert (= (and b!1309735 res!869077) b!1309727))

(assert (= (and b!1309727 res!869079) b!1309730))

(assert (= (and b!1309730 res!869082) b!1309736))

(assert (= (and b!1309736 res!869080) b!1309734))

(assert (= (and b!1309732 condMapEmpty!54361) mapIsEmpty!54361))

(assert (= (and b!1309732 (not condMapEmpty!54361)) mapNonEmpty!54361))

(get-info :version)

(assert (= (and mapNonEmpty!54361 ((_ is ValueCellFull!16679) mapValue!54361)) b!1309728))

(assert (= (and b!1309732 ((_ is ValueCellFull!16679) mapDefault!54361)) b!1309731))

(assert (= start!110814 b!1309732))

(declare-fun m!1200413 () Bool)

(assert (=> b!1309734 m!1200413))

(assert (=> b!1309734 m!1200413))

(declare-fun m!1200415 () Bool)

(assert (=> b!1309734 m!1200415))

(declare-fun m!1200417 () Bool)

(assert (=> b!1309734 m!1200417))

(declare-fun m!1200419 () Bool)

(assert (=> start!110814 m!1200419))

(declare-fun m!1200421 () Bool)

(assert (=> start!110814 m!1200421))

(declare-fun m!1200423 () Bool)

(assert (=> start!110814 m!1200423))

(declare-fun m!1200425 () Bool)

(assert (=> b!1309729 m!1200425))

(declare-fun m!1200427 () Bool)

(assert (=> b!1309735 m!1200427))

(assert (=> b!1309735 m!1200427))

(declare-fun m!1200429 () Bool)

(assert (=> b!1309735 m!1200429))

(declare-fun m!1200431 () Bool)

(assert (=> b!1309727 m!1200431))

(declare-fun m!1200433 () Bool)

(assert (=> b!1309737 m!1200433))

(declare-fun m!1200435 () Bool)

(assert (=> mapNonEmpty!54361 m!1200435))

(assert (=> b!1309730 m!1200431))

(assert (=> b!1309730 m!1200431))

(declare-fun m!1200437 () Bool)

(assert (=> b!1309730 m!1200437))

(check-sat (not mapNonEmpty!54361) (not b!1309730) (not b!1309737) tp_is_empty!35155 b_and!47635 (not b!1309734) (not b!1309729) (not b_next!29425) (not b!1309735) (not start!110814))
(check-sat b_and!47635 (not b_next!29425))
