; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110956 () Bool)

(assert start!110956)

(declare-fun b_free!29791 () Bool)

(declare-fun b_next!29791 () Bool)

(assert (=> start!110956 (= b_free!29791 (not b_next!29791))))

(declare-fun tp!104696 () Bool)

(declare-fun b_and!47981 () Bool)

(assert (=> start!110956 (= tp!104696 b_and!47981)))

(declare-fun b!1313560 () Bool)

(declare-fun e!749264 () Bool)

(declare-fun tp_is_empty!35521 () Bool)

(assert (=> b!1313560 (= e!749264 tp_is_empty!35521)))

(declare-fun b!1313561 () Bool)

(declare-fun res!872089 () Bool)

(declare-fun e!749260 () Bool)

(assert (=> b!1313561 (=> (not res!872089) (not e!749260))))

(declare-datatypes ((array!87923 0))(
  ( (array!87924 (arr!42442 (Array (_ BitVec 32) (_ BitVec 64))) (size!42994 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87923)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313561 (= res!872089 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42994 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313562 () Bool)

(declare-fun res!872085 () Bool)

(assert (=> b!1313562 (=> (not res!872085) (not e!749260))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((V!52465 0))(
  ( (V!52466 (val!17835 Int)) )
))
(declare-datatypes ((ValueCell!16862 0))(
  ( (ValueCellFull!16862 (v!20461 V!52465)) (EmptyCell!16862) )
))
(declare-datatypes ((array!87925 0))(
  ( (array!87926 (arr!42443 (Array (_ BitVec 32) ValueCell!16862)) (size!42995 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87925)

(assert (=> b!1313562 (= res!872085 (and (= (size!42995 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42994 _keys!1628) (size!42995 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54910 () Bool)

(declare-fun mapRes!54910 () Bool)

(assert (=> mapIsEmpty!54910 mapRes!54910))

(declare-fun b!1313563 () Bool)

(declare-fun e!749262 () Bool)

(assert (=> b!1313563 (= e!749262 tp_is_empty!35521)))

(declare-fun mapNonEmpty!54910 () Bool)

(declare-fun tp!104695 () Bool)

(assert (=> mapNonEmpty!54910 (= mapRes!54910 (and tp!104695 e!749262))))

(declare-fun mapValue!54910 () ValueCell!16862)

(declare-fun mapRest!54910 () (Array (_ BitVec 32) ValueCell!16862))

(declare-fun mapKey!54910 () (_ BitVec 32))

(assert (=> mapNonEmpty!54910 (= (arr!42443 _values!1354) (store mapRest!54910 mapKey!54910 mapValue!54910))))

(declare-fun b!1313564 () Bool)

(assert (=> b!1313564 (= e!749260 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52465)

(declare-fun zeroValue!1296 () V!52465)

(declare-fun lt!585510 () Bool)

(declare-datatypes ((tuple2!23084 0))(
  ( (tuple2!23085 (_1!11553 (_ BitVec 64)) (_2!11553 V!52465)) )
))
(declare-datatypes ((List!30200 0))(
  ( (Nil!30197) (Cons!30196 (h!31405 tuple2!23084) (t!43798 List!30200)) )
))
(declare-datatypes ((ListLongMap!20741 0))(
  ( (ListLongMap!20742 (toList!10386 List!30200)) )
))
(declare-fun contains!8463 (ListLongMap!20741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5281 (array!87923 array!87925 (_ BitVec 32) (_ BitVec 32) V!52465 V!52465 (_ BitVec 32) Int) ListLongMap!20741)

(assert (=> b!1313564 (= lt!585510 (contains!8463 (getCurrentListMap!5281 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313565 () Bool)

(declare-fun res!872087 () Bool)

(assert (=> b!1313565 (=> (not res!872087) (not e!749260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87923 (_ BitVec 32)) Bool)

(assert (=> b!1313565 (= res!872087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313566 () Bool)

(declare-fun e!749263 () Bool)

(assert (=> b!1313566 (= e!749263 (and e!749264 mapRes!54910))))

(declare-fun condMapEmpty!54910 () Bool)

(declare-fun mapDefault!54910 () ValueCell!16862)

(assert (=> b!1313566 (= condMapEmpty!54910 (= (arr!42443 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16862)) mapDefault!54910)))))

(declare-fun b!1313567 () Bool)

(declare-fun res!872086 () Bool)

(assert (=> b!1313567 (=> (not res!872086) (not e!749260))))

(declare-datatypes ((List!30201 0))(
  ( (Nil!30198) (Cons!30197 (h!31406 (_ BitVec 64)) (t!43799 List!30201)) )
))
(declare-fun arrayNoDuplicates!0 (array!87923 (_ BitVec 32) List!30201) Bool)

(assert (=> b!1313567 (= res!872086 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30198))))

(declare-fun res!872088 () Bool)

(assert (=> start!110956 (=> (not res!872088) (not e!749260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110956 (= res!872088 (validMask!0 mask!2040))))

(assert (=> start!110956 e!749260))

(assert (=> start!110956 tp!104696))

(declare-fun array_inv!32249 (array!87923) Bool)

(assert (=> start!110956 (array_inv!32249 _keys!1628)))

(assert (=> start!110956 true))

(assert (=> start!110956 tp_is_empty!35521))

(declare-fun array_inv!32250 (array!87925) Bool)

(assert (=> start!110956 (and (array_inv!32250 _values!1354) e!749263)))

(assert (= (and start!110956 res!872088) b!1313562))

(assert (= (and b!1313562 res!872085) b!1313565))

(assert (= (and b!1313565 res!872087) b!1313567))

(assert (= (and b!1313567 res!872086) b!1313561))

(assert (= (and b!1313561 res!872089) b!1313564))

(assert (= (and b!1313566 condMapEmpty!54910) mapIsEmpty!54910))

(assert (= (and b!1313566 (not condMapEmpty!54910)) mapNonEmpty!54910))

(get-info :version)

(assert (= (and mapNonEmpty!54910 ((_ is ValueCellFull!16862) mapValue!54910)) b!1313563))

(assert (= (and b!1313566 ((_ is ValueCellFull!16862) mapDefault!54910)) b!1313560))

(assert (= start!110956 b!1313566))

(declare-fun m!1201899 () Bool)

(assert (=> b!1313564 m!1201899))

(assert (=> b!1313564 m!1201899))

(declare-fun m!1201901 () Bool)

(assert (=> b!1313564 m!1201901))

(declare-fun m!1201903 () Bool)

(assert (=> mapNonEmpty!54910 m!1201903))

(declare-fun m!1201905 () Bool)

(assert (=> start!110956 m!1201905))

(declare-fun m!1201907 () Bool)

(assert (=> start!110956 m!1201907))

(declare-fun m!1201909 () Bool)

(assert (=> start!110956 m!1201909))

(declare-fun m!1201911 () Bool)

(assert (=> b!1313565 m!1201911))

(declare-fun m!1201913 () Bool)

(assert (=> b!1313567 m!1201913))

(check-sat (not b!1313565) tp_is_empty!35521 b_and!47981 (not start!110956) (not b!1313567) (not b_next!29791) (not b!1313564) (not mapNonEmpty!54910))
(check-sat b_and!47981 (not b_next!29791))
