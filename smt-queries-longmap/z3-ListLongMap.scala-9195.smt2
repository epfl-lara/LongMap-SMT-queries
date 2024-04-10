; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110520 () Bool)

(assert start!110520)

(declare-fun b_free!29355 () Bool)

(declare-fun b_next!29355 () Bool)

(assert (=> start!110520 (= b_free!29355 (not b_next!29355))))

(declare-fun tp!103386 () Bool)

(declare-fun b_and!47563 () Bool)

(assert (=> start!110520 (= tp!103386 b_and!47563)))

(declare-fun b!1307399 () Bool)

(declare-fun res!867847 () Bool)

(declare-fun e!746026 () Bool)

(assert (=> b!1307399 (=> (not res!867847) (not e!746026))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((array!87172 0))(
  ( (array!87173 (arr!42066 (Array (_ BitVec 32) (_ BitVec 64))) (size!42616 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87172)

(assert (=> b!1307399 (= res!867847 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42616 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307400 () Bool)

(declare-fun e!746027 () Bool)

(declare-fun tp_is_empty!35085 () Bool)

(assert (=> b!1307400 (= e!746027 tp_is_empty!35085)))

(declare-fun b!1307401 () Bool)

(declare-fun e!746023 () Bool)

(declare-fun e!746024 () Bool)

(declare-fun mapRes!54256 () Bool)

(assert (=> b!1307401 (= e!746023 (and e!746024 mapRes!54256))))

(declare-fun condMapEmpty!54256 () Bool)

(declare-datatypes ((V!51883 0))(
  ( (V!51884 (val!17617 Int)) )
))
(declare-datatypes ((ValueCell!16644 0))(
  ( (ValueCellFull!16644 (v!20244 V!51883)) (EmptyCell!16644) )
))
(declare-datatypes ((array!87174 0))(
  ( (array!87175 (arr!42067 (Array (_ BitVec 32) ValueCell!16644)) (size!42617 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87174)

(declare-fun mapDefault!54256 () ValueCell!16644)

(assert (=> b!1307401 (= condMapEmpty!54256 (= (arr!42067 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16644)) mapDefault!54256)))))

(declare-fun b!1307402 () Bool)

(assert (=> b!1307402 (= e!746024 tp_is_empty!35085)))

(declare-fun b!1307403 () Bool)

(declare-fun res!867846 () Bool)

(assert (=> b!1307403 (=> (not res!867846) (not e!746026))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87172 (_ BitVec 32)) Bool)

(assert (=> b!1307403 (= res!867846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!867845 () Bool)

(assert (=> start!110520 (=> (not res!867845) (not e!746026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110520 (= res!867845 (validMask!0 mask!2040))))

(assert (=> start!110520 e!746026))

(assert (=> start!110520 tp!103386))

(declare-fun array_inv!31799 (array!87172) Bool)

(assert (=> start!110520 (array_inv!31799 _keys!1628)))

(assert (=> start!110520 true))

(assert (=> start!110520 tp_is_empty!35085))

(declare-fun array_inv!31800 (array!87174) Bool)

(assert (=> start!110520 (and (array_inv!31800 _values!1354) e!746023)))

(declare-fun mapNonEmpty!54256 () Bool)

(declare-fun tp!103387 () Bool)

(assert (=> mapNonEmpty!54256 (= mapRes!54256 (and tp!103387 e!746027))))

(declare-fun mapValue!54256 () ValueCell!16644)

(declare-fun mapRest!54256 () (Array (_ BitVec 32) ValueCell!16644))

(declare-fun mapKey!54256 () (_ BitVec 32))

(assert (=> mapNonEmpty!54256 (= (arr!42067 _values!1354) (store mapRest!54256 mapKey!54256 mapValue!54256))))

(declare-fun b!1307404 () Bool)

(declare-fun res!867848 () Bool)

(assert (=> b!1307404 (=> (not res!867848) (not e!746026))))

(declare-datatypes ((List!29823 0))(
  ( (Nil!29820) (Cons!29819 (h!31028 (_ BitVec 64)) (t!43429 List!29823)) )
))
(declare-fun arrayNoDuplicates!0 (array!87172 (_ BitVec 32) List!29823) Bool)

(assert (=> b!1307404 (= res!867848 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29820))))

(declare-fun b!1307405 () Bool)

(assert (=> b!1307405 (= e!746026 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585051 () Bool)

(declare-fun minValue!1296 () V!51883)

(declare-fun zeroValue!1296 () V!51883)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22682 0))(
  ( (tuple2!22683 (_1!11352 (_ BitVec 64)) (_2!11352 V!51883)) )
))
(declare-datatypes ((List!29824 0))(
  ( (Nil!29821) (Cons!29820 (h!31029 tuple2!22682) (t!43430 List!29824)) )
))
(declare-datatypes ((ListLongMap!20339 0))(
  ( (ListLongMap!20340 (toList!10185 List!29824)) )
))
(declare-fun contains!8335 (ListLongMap!20339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5198 (array!87172 array!87174 (_ BitVec 32) (_ BitVec 32) V!51883 V!51883 (_ BitVec 32) Int) ListLongMap!20339)

(assert (=> b!1307405 (= lt!585051 (contains!8335 (getCurrentListMap!5198 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307406 () Bool)

(declare-fun res!867849 () Bool)

(assert (=> b!1307406 (=> (not res!867849) (not e!746026))))

(assert (=> b!1307406 (= res!867849 (and (= (size!42617 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42616 _keys!1628) (size!42617 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54256 () Bool)

(assert (=> mapIsEmpty!54256 mapRes!54256))

(assert (= (and start!110520 res!867845) b!1307406))

(assert (= (and b!1307406 res!867849) b!1307403))

(assert (= (and b!1307403 res!867846) b!1307404))

(assert (= (and b!1307404 res!867848) b!1307399))

(assert (= (and b!1307399 res!867847) b!1307405))

(assert (= (and b!1307401 condMapEmpty!54256) mapIsEmpty!54256))

(assert (= (and b!1307401 (not condMapEmpty!54256)) mapNonEmpty!54256))

(get-info :version)

(assert (= (and mapNonEmpty!54256 ((_ is ValueCellFull!16644) mapValue!54256)) b!1307400))

(assert (= (and b!1307401 ((_ is ValueCellFull!16644) mapDefault!54256)) b!1307402))

(assert (= start!110520 b!1307401))

(declare-fun m!1198105 () Bool)

(assert (=> b!1307405 m!1198105))

(assert (=> b!1307405 m!1198105))

(declare-fun m!1198107 () Bool)

(assert (=> b!1307405 m!1198107))

(declare-fun m!1198109 () Bool)

(assert (=> start!110520 m!1198109))

(declare-fun m!1198111 () Bool)

(assert (=> start!110520 m!1198111))

(declare-fun m!1198113 () Bool)

(assert (=> start!110520 m!1198113))

(declare-fun m!1198115 () Bool)

(assert (=> b!1307403 m!1198115))

(declare-fun m!1198117 () Bool)

(assert (=> mapNonEmpty!54256 m!1198117))

(declare-fun m!1198119 () Bool)

(assert (=> b!1307404 m!1198119))

(check-sat (not b!1307405) (not b!1307403) (not start!110520) (not b!1307404) b_and!47563 tp_is_empty!35085 (not mapNonEmpty!54256) (not b_next!29355))
(check-sat b_and!47563 (not b_next!29355))
