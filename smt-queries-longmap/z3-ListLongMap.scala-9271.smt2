; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110974 () Bool)

(assert start!110974)

(declare-fun b_free!29809 () Bool)

(declare-fun b_next!29809 () Bool)

(assert (=> start!110974 (= b_free!29809 (not b_next!29809))))

(declare-fun tp!104749 () Bool)

(declare-fun b_and!47999 () Bool)

(assert (=> start!110974 (= tp!104749 b_and!47999)))

(declare-fun b!1313776 () Bool)

(declare-fun e!749397 () Bool)

(declare-fun e!749398 () Bool)

(declare-fun mapRes!54937 () Bool)

(assert (=> b!1313776 (= e!749397 (and e!749398 mapRes!54937))))

(declare-fun condMapEmpty!54937 () Bool)

(declare-datatypes ((V!52489 0))(
  ( (V!52490 (val!17844 Int)) )
))
(declare-datatypes ((ValueCell!16871 0))(
  ( (ValueCellFull!16871 (v!20470 V!52489)) (EmptyCell!16871) )
))
(declare-datatypes ((array!87959 0))(
  ( (array!87960 (arr!42460 (Array (_ BitVec 32) ValueCell!16871)) (size!43012 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87959)

(declare-fun mapDefault!54937 () ValueCell!16871)

(assert (=> b!1313776 (= condMapEmpty!54937 (= (arr!42460 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16871)) mapDefault!54937)))))

(declare-fun b!1313777 () Bool)

(declare-fun res!872220 () Bool)

(declare-fun e!749396 () Bool)

(assert (=> b!1313777 (=> (not res!872220) (not e!749396))))

(declare-datatypes ((array!87961 0))(
  ( (array!87962 (arr!42461 (Array (_ BitVec 32) (_ BitVec 64))) (size!43013 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87961)

(declare-datatypes ((List!30214 0))(
  ( (Nil!30211) (Cons!30210 (h!31419 (_ BitVec 64)) (t!43812 List!30214)) )
))
(declare-fun arrayNoDuplicates!0 (array!87961 (_ BitVec 32) List!30214) Bool)

(assert (=> b!1313777 (= res!872220 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30211))))

(declare-fun b!1313778 () Bool)

(declare-fun e!749399 () Bool)

(declare-fun tp_is_empty!35539 () Bool)

(assert (=> b!1313778 (= e!749399 tp_is_empty!35539)))

(declare-fun res!872221 () Bool)

(assert (=> start!110974 (=> (not res!872221) (not e!749396))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110974 (= res!872221 (validMask!0 mask!2040))))

(assert (=> start!110974 e!749396))

(assert (=> start!110974 tp!104749))

(declare-fun array_inv!32263 (array!87961) Bool)

(assert (=> start!110974 (array_inv!32263 _keys!1628)))

(assert (=> start!110974 true))

(assert (=> start!110974 tp_is_empty!35539))

(declare-fun array_inv!32264 (array!87959) Bool)

(assert (=> start!110974 (and (array_inv!32264 _values!1354) e!749397)))

(declare-fun b!1313779 () Bool)

(declare-fun res!872224 () Bool)

(assert (=> b!1313779 (=> (not res!872224) (not e!749396))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313779 (= res!872224 (and (= (size!43012 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43013 _keys!1628) (size!43012 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313780 () Bool)

(declare-fun res!872223 () Bool)

(assert (=> b!1313780 (=> (not res!872223) (not e!749396))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313780 (= res!872223 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43013 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54937 () Bool)

(declare-fun tp!104750 () Bool)

(assert (=> mapNonEmpty!54937 (= mapRes!54937 (and tp!104750 e!749399))))

(declare-fun mapKey!54937 () (_ BitVec 32))

(declare-fun mapRest!54937 () (Array (_ BitVec 32) ValueCell!16871))

(declare-fun mapValue!54937 () ValueCell!16871)

(assert (=> mapNonEmpty!54937 (= (arr!42460 _values!1354) (store mapRest!54937 mapKey!54937 mapValue!54937))))

(declare-fun mapIsEmpty!54937 () Bool)

(assert (=> mapIsEmpty!54937 mapRes!54937))

(declare-fun b!1313781 () Bool)

(declare-fun res!872222 () Bool)

(assert (=> b!1313781 (=> (not res!872222) (not e!749396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87961 (_ BitVec 32)) Bool)

(assert (=> b!1313781 (= res!872222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313782 () Bool)

(assert (=> b!1313782 (= e!749396 false)))

(declare-fun lt!585537 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52489)

(declare-fun zeroValue!1296 () V!52489)

(declare-datatypes ((tuple2!23094 0))(
  ( (tuple2!23095 (_1!11558 (_ BitVec 64)) (_2!11558 V!52489)) )
))
(declare-datatypes ((List!30215 0))(
  ( (Nil!30212) (Cons!30211 (h!31420 tuple2!23094) (t!43813 List!30215)) )
))
(declare-datatypes ((ListLongMap!20751 0))(
  ( (ListLongMap!20752 (toList!10391 List!30215)) )
))
(declare-fun contains!8468 (ListLongMap!20751 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5286 (array!87961 array!87959 (_ BitVec 32) (_ BitVec 32) V!52489 V!52489 (_ BitVec 32) Int) ListLongMap!20751)

(assert (=> b!1313782 (= lt!585537 (contains!8468 (getCurrentListMap!5286 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313783 () Bool)

(assert (=> b!1313783 (= e!749398 tp_is_empty!35539)))

(assert (= (and start!110974 res!872221) b!1313779))

(assert (= (and b!1313779 res!872224) b!1313781))

(assert (= (and b!1313781 res!872222) b!1313777))

(assert (= (and b!1313777 res!872220) b!1313780))

(assert (= (and b!1313780 res!872223) b!1313782))

(assert (= (and b!1313776 condMapEmpty!54937) mapIsEmpty!54937))

(assert (= (and b!1313776 (not condMapEmpty!54937)) mapNonEmpty!54937))

(get-info :version)

(assert (= (and mapNonEmpty!54937 ((_ is ValueCellFull!16871) mapValue!54937)) b!1313778))

(assert (= (and b!1313776 ((_ is ValueCellFull!16871) mapDefault!54937)) b!1313783))

(assert (= start!110974 b!1313776))

(declare-fun m!1202043 () Bool)

(assert (=> b!1313781 m!1202043))

(declare-fun m!1202045 () Bool)

(assert (=> b!1313777 m!1202045))

(declare-fun m!1202047 () Bool)

(assert (=> mapNonEmpty!54937 m!1202047))

(declare-fun m!1202049 () Bool)

(assert (=> start!110974 m!1202049))

(declare-fun m!1202051 () Bool)

(assert (=> start!110974 m!1202051))

(declare-fun m!1202053 () Bool)

(assert (=> start!110974 m!1202053))

(declare-fun m!1202055 () Bool)

(assert (=> b!1313782 m!1202055))

(assert (=> b!1313782 m!1202055))

(declare-fun m!1202057 () Bool)

(assert (=> b!1313782 m!1202057))

(check-sat (not mapNonEmpty!54937) tp_is_empty!35539 (not b!1313777) (not b_next!29809) (not b!1313782) b_and!47999 (not b!1313781) (not start!110974))
(check-sat b_and!47999 (not b_next!29809))
