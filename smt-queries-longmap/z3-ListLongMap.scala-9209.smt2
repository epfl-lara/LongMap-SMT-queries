; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110826 () Bool)

(assert start!110826)

(declare-fun b_free!29437 () Bool)

(declare-fun b_next!29437 () Bool)

(assert (=> start!110826 (= b_free!29437 (not b_next!29437))))

(declare-fun tp!103633 () Bool)

(declare-fun b_and!47647 () Bool)

(assert (=> start!110826 (= tp!103633 b_and!47647)))

(declare-fun mapNonEmpty!54379 () Bool)

(declare-fun mapRes!54379 () Bool)

(declare-fun tp!103632 () Bool)

(declare-fun e!747484 () Bool)

(assert (=> mapNonEmpty!54379 (= mapRes!54379 (and tp!103632 e!747484))))

(declare-datatypes ((V!51993 0))(
  ( (V!51994 (val!17658 Int)) )
))
(declare-datatypes ((ValueCell!16685 0))(
  ( (ValueCellFull!16685 (v!20280 V!51993)) (EmptyCell!16685) )
))
(declare-fun mapRest!54379 () (Array (_ BitVec 32) ValueCell!16685))

(declare-fun mapKey!54379 () (_ BitVec 32))

(declare-fun mapValue!54379 () ValueCell!16685)

(declare-datatypes ((array!87391 0))(
  ( (array!87392 (arr!42171 (Array (_ BitVec 32) ValueCell!16685)) (size!42722 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87391)

(assert (=> mapNonEmpty!54379 (= (arr!42171 _values!1354) (store mapRest!54379 mapKey!54379 mapValue!54379))))

(declare-fun mapIsEmpty!54379 () Bool)

(assert (=> mapIsEmpty!54379 mapRes!54379))

(declare-fun b!1309942 () Bool)

(declare-fun res!869244 () Bool)

(declare-fun e!747482 () Bool)

(assert (=> b!1309942 (=> (not res!869244) (not e!747482))))

(declare-datatypes ((array!87393 0))(
  ( (array!87394 (arr!42172 (Array (_ BitVec 32) (_ BitVec 64))) (size!42723 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87393)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309942 (= res!869244 (and (= (size!42722 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42723 _keys!1628) (size!42722 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309943 () Bool)

(declare-fun res!869243 () Bool)

(assert (=> b!1309943 (=> (not res!869243) (not e!747482))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51993)

(declare-fun zeroValue!1296 () V!51993)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22780 0))(
  ( (tuple2!22781 (_1!11401 (_ BitVec 64)) (_2!11401 V!51993)) )
))
(declare-datatypes ((List!29938 0))(
  ( (Nil!29935) (Cons!29934 (h!31152 tuple2!22780) (t!43536 List!29938)) )
))
(declare-datatypes ((ListLongMap!20445 0))(
  ( (ListLongMap!20446 (toList!10238 List!29938)) )
))
(declare-fun contains!8400 (ListLongMap!20445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5242 (array!87393 array!87391 (_ BitVec 32) (_ BitVec 32) V!51993 V!51993 (_ BitVec 32) Int) ListLongMap!20445)

(assert (=> b!1309943 (= res!869243 (contains!8400 (getCurrentListMap!5242 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309944 () Bool)

(declare-fun res!869246 () Bool)

(assert (=> b!1309944 (=> (not res!869246) (not e!747482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87393 (_ BitVec 32)) Bool)

(assert (=> b!1309944 (= res!869246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309945 () Bool)

(declare-fun res!869241 () Bool)

(assert (=> b!1309945 (=> (not res!869241) (not e!747482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309945 (= res!869241 (validKeyInArray!0 (select (arr!42172 _keys!1628) from!2020)))))

(declare-fun res!869240 () Bool)

(assert (=> start!110826 (=> (not res!869240) (not e!747482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110826 (= res!869240 (validMask!0 mask!2040))))

(assert (=> start!110826 e!747482))

(assert (=> start!110826 tp!103633))

(declare-fun array_inv!32133 (array!87393) Bool)

(assert (=> start!110826 (array_inv!32133 _keys!1628)))

(assert (=> start!110826 true))

(declare-fun tp_is_empty!35167 () Bool)

(assert (=> start!110826 tp_is_empty!35167))

(declare-fun e!747485 () Bool)

(declare-fun array_inv!32134 (array!87391) Bool)

(assert (=> start!110826 (and (array_inv!32134 _values!1354) e!747485)))

(declare-fun b!1309946 () Bool)

(declare-fun res!869239 () Bool)

(assert (=> b!1309946 (=> (not res!869239) (not e!747482))))

(declare-datatypes ((List!29939 0))(
  ( (Nil!29936) (Cons!29935 (h!31153 (_ BitVec 64)) (t!43537 List!29939)) )
))
(declare-fun arrayNoDuplicates!0 (array!87393 (_ BitVec 32) List!29939) Bool)

(assert (=> b!1309946 (= res!869239 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29936))))

(declare-fun b!1309947 () Bool)

(declare-fun res!869242 () Bool)

(assert (=> b!1309947 (=> (not res!869242) (not e!747482))))

(assert (=> b!1309947 (= res!869242 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42723 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309948 () Bool)

(declare-fun res!869245 () Bool)

(assert (=> b!1309948 (=> (not res!869245) (not e!747482))))

(assert (=> b!1309948 (= res!869245 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1309949 () Bool)

(declare-fun res!869238 () Bool)

(assert (=> b!1309949 (=> (not res!869238) (not e!747482))))

(assert (=> b!1309949 (= res!869238 (not (= (select (arr!42172 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309950 () Bool)

(assert (=> b!1309950 (= e!747482 (not true))))

(assert (=> b!1309950 (contains!8400 (getCurrentListMap!5242 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43273 0))(
  ( (Unit!43274) )
))
(declare-fun lt!585650 () Unit!43273)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!17 (array!87393 array!87391 (_ BitVec 32) (_ BitVec 32) V!51993 V!51993 (_ BitVec 64) (_ BitVec 32) Int) Unit!43273)

(assert (=> b!1309950 (= lt!585650 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!17 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309951 () Bool)

(assert (=> b!1309951 (= e!747484 tp_is_empty!35167)))

(declare-fun b!1309952 () Bool)

(declare-fun e!747481 () Bool)

(assert (=> b!1309952 (= e!747485 (and e!747481 mapRes!54379))))

(declare-fun condMapEmpty!54379 () Bool)

(declare-fun mapDefault!54379 () ValueCell!16685)

(assert (=> b!1309952 (= condMapEmpty!54379 (= (arr!42171 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16685)) mapDefault!54379)))))

(declare-fun b!1309953 () Bool)

(assert (=> b!1309953 (= e!747481 tp_is_empty!35167)))

(assert (= (and start!110826 res!869240) b!1309942))

(assert (= (and b!1309942 res!869244) b!1309944))

(assert (= (and b!1309944 res!869246) b!1309946))

(assert (= (and b!1309946 res!869239) b!1309947))

(assert (= (and b!1309947 res!869242) b!1309943))

(assert (= (and b!1309943 res!869243) b!1309949))

(assert (= (and b!1309949 res!869238) b!1309945))

(assert (= (and b!1309945 res!869241) b!1309948))

(assert (= (and b!1309948 res!869245) b!1309950))

(assert (= (and b!1309952 condMapEmpty!54379) mapIsEmpty!54379))

(assert (= (and b!1309952 (not condMapEmpty!54379)) mapNonEmpty!54379))

(get-info :version)

(assert (= (and mapNonEmpty!54379 ((_ is ValueCellFull!16685) mapValue!54379)) b!1309951))

(assert (= (and b!1309952 ((_ is ValueCellFull!16685) mapDefault!54379)) b!1309953))

(assert (= start!110826 b!1309952))

(declare-fun m!1200569 () Bool)

(assert (=> b!1309946 m!1200569))

(declare-fun m!1200571 () Bool)

(assert (=> b!1309950 m!1200571))

(assert (=> b!1309950 m!1200571))

(declare-fun m!1200573 () Bool)

(assert (=> b!1309950 m!1200573))

(declare-fun m!1200575 () Bool)

(assert (=> b!1309950 m!1200575))

(declare-fun m!1200577 () Bool)

(assert (=> b!1309943 m!1200577))

(assert (=> b!1309943 m!1200577))

(declare-fun m!1200579 () Bool)

(assert (=> b!1309943 m!1200579))

(declare-fun m!1200581 () Bool)

(assert (=> b!1309944 m!1200581))

(declare-fun m!1200583 () Bool)

(assert (=> mapNonEmpty!54379 m!1200583))

(declare-fun m!1200585 () Bool)

(assert (=> b!1309949 m!1200585))

(declare-fun m!1200587 () Bool)

(assert (=> start!110826 m!1200587))

(declare-fun m!1200589 () Bool)

(assert (=> start!110826 m!1200589))

(declare-fun m!1200591 () Bool)

(assert (=> start!110826 m!1200591))

(assert (=> b!1309945 m!1200585))

(assert (=> b!1309945 m!1200585))

(declare-fun m!1200593 () Bool)

(assert (=> b!1309945 m!1200593))

(check-sat tp_is_empty!35167 b_and!47647 (not b!1309944) (not start!110826) (not b_next!29437) (not b!1309943) (not b!1309946) (not b!1309950) (not b!1309945) (not mapNonEmpty!54379))
(check-sat b_and!47647 (not b_next!29437))
