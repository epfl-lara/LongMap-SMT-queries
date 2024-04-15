; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110932 () Bool)

(assert start!110932)

(declare-fun b_free!29767 () Bool)

(declare-fun b_next!29767 () Bool)

(assert (=> start!110932 (= b_free!29767 (not b_next!29767))))

(declare-fun tp!104623 () Bool)

(declare-fun b_and!47957 () Bool)

(assert (=> start!110932 (= tp!104623 b_and!47957)))

(declare-fun b!1313272 () Bool)

(declare-fun e!749084 () Bool)

(declare-fun e!749083 () Bool)

(declare-fun mapRes!54874 () Bool)

(assert (=> b!1313272 (= e!749084 (and e!749083 mapRes!54874))))

(declare-fun condMapEmpty!54874 () Bool)

(declare-datatypes ((V!52433 0))(
  ( (V!52434 (val!17823 Int)) )
))
(declare-datatypes ((ValueCell!16850 0))(
  ( (ValueCellFull!16850 (v!20449 V!52433)) (EmptyCell!16850) )
))
(declare-datatypes ((array!87877 0))(
  ( (array!87878 (arr!42419 (Array (_ BitVec 32) ValueCell!16850)) (size!42971 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87877)

(declare-fun mapDefault!54874 () ValueCell!16850)

(assert (=> b!1313272 (= condMapEmpty!54874 (= (arr!42419 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16850)) mapDefault!54874)))))

(declare-fun b!1313273 () Bool)

(declare-fun e!749081 () Bool)

(assert (=> b!1313273 (= e!749081 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87879 0))(
  ( (array!87880 (arr!42420 (Array (_ BitVec 32) (_ BitVec 64))) (size!42972 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87879)

(declare-fun lt!585474 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52433)

(declare-fun zeroValue!1296 () V!52433)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23064 0))(
  ( (tuple2!23065 (_1!11543 (_ BitVec 64)) (_2!11543 V!52433)) )
))
(declare-datatypes ((List!30183 0))(
  ( (Nil!30180) (Cons!30179 (h!31388 tuple2!23064) (t!43781 List!30183)) )
))
(declare-datatypes ((ListLongMap!20721 0))(
  ( (ListLongMap!20722 (toList!10376 List!30183)) )
))
(declare-fun contains!8453 (ListLongMap!20721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5271 (array!87879 array!87877 (_ BitVec 32) (_ BitVec 32) V!52433 V!52433 (_ BitVec 32) Int) ListLongMap!20721)

(assert (=> b!1313273 (= lt!585474 (contains!8453 (getCurrentListMap!5271 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54874 () Bool)

(declare-fun tp!104624 () Bool)

(declare-fun e!749080 () Bool)

(assert (=> mapNonEmpty!54874 (= mapRes!54874 (and tp!104624 e!749080))))

(declare-fun mapRest!54874 () (Array (_ BitVec 32) ValueCell!16850))

(declare-fun mapKey!54874 () (_ BitVec 32))

(declare-fun mapValue!54874 () ValueCell!16850)

(assert (=> mapNonEmpty!54874 (= (arr!42419 _values!1354) (store mapRest!54874 mapKey!54874 mapValue!54874))))

(declare-fun b!1313274 () Bool)

(declare-fun res!871907 () Bool)

(assert (=> b!1313274 (=> (not res!871907) (not e!749081))))

(declare-datatypes ((List!30184 0))(
  ( (Nil!30181) (Cons!30180 (h!31389 (_ BitVec 64)) (t!43782 List!30184)) )
))
(declare-fun arrayNoDuplicates!0 (array!87879 (_ BitVec 32) List!30184) Bool)

(assert (=> b!1313274 (= res!871907 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30181))))

(declare-fun mapIsEmpty!54874 () Bool)

(assert (=> mapIsEmpty!54874 mapRes!54874))

(declare-fun b!1313275 () Bool)

(declare-fun res!871909 () Bool)

(assert (=> b!1313275 (=> (not res!871909) (not e!749081))))

(assert (=> b!1313275 (= res!871909 (and (= (size!42971 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42972 _keys!1628) (size!42971 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313277 () Bool)

(declare-fun tp_is_empty!35497 () Bool)

(assert (=> b!1313277 (= e!749083 tp_is_empty!35497)))

(declare-fun b!1313278 () Bool)

(declare-fun res!871905 () Bool)

(assert (=> b!1313278 (=> (not res!871905) (not e!749081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87879 (_ BitVec 32)) Bool)

(assert (=> b!1313278 (= res!871905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313279 () Bool)

(assert (=> b!1313279 (= e!749080 tp_is_empty!35497)))

(declare-fun b!1313276 () Bool)

(declare-fun res!871906 () Bool)

(assert (=> b!1313276 (=> (not res!871906) (not e!749081))))

(assert (=> b!1313276 (= res!871906 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42972 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!871908 () Bool)

(assert (=> start!110932 (=> (not res!871908) (not e!749081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110932 (= res!871908 (validMask!0 mask!2040))))

(assert (=> start!110932 e!749081))

(assert (=> start!110932 tp!104623))

(declare-fun array_inv!32233 (array!87879) Bool)

(assert (=> start!110932 (array_inv!32233 _keys!1628)))

(assert (=> start!110932 true))

(assert (=> start!110932 tp_is_empty!35497))

(declare-fun array_inv!32234 (array!87877) Bool)

(assert (=> start!110932 (and (array_inv!32234 _values!1354) e!749084)))

(assert (= (and start!110932 res!871908) b!1313275))

(assert (= (and b!1313275 res!871909) b!1313278))

(assert (= (and b!1313278 res!871905) b!1313274))

(assert (= (and b!1313274 res!871907) b!1313276))

(assert (= (and b!1313276 res!871906) b!1313273))

(assert (= (and b!1313272 condMapEmpty!54874) mapIsEmpty!54874))

(assert (= (and b!1313272 (not condMapEmpty!54874)) mapNonEmpty!54874))

(get-info :version)

(assert (= (and mapNonEmpty!54874 ((_ is ValueCellFull!16850) mapValue!54874)) b!1313279))

(assert (= (and b!1313272 ((_ is ValueCellFull!16850) mapDefault!54874)) b!1313277))

(assert (= start!110932 b!1313272))

(declare-fun m!1201707 () Bool)

(assert (=> start!110932 m!1201707))

(declare-fun m!1201709 () Bool)

(assert (=> start!110932 m!1201709))

(declare-fun m!1201711 () Bool)

(assert (=> start!110932 m!1201711))

(declare-fun m!1201713 () Bool)

(assert (=> b!1313274 m!1201713))

(declare-fun m!1201715 () Bool)

(assert (=> b!1313278 m!1201715))

(declare-fun m!1201717 () Bool)

(assert (=> b!1313273 m!1201717))

(assert (=> b!1313273 m!1201717))

(declare-fun m!1201719 () Bool)

(assert (=> b!1313273 m!1201719))

(declare-fun m!1201721 () Bool)

(assert (=> mapNonEmpty!54874 m!1201721))

(check-sat (not b_next!29767) (not b!1313278) (not mapNonEmpty!54874) (not b!1313273) (not b!1313274) b_and!47957 (not start!110932) tp_is_empty!35497)
(check-sat b_and!47957 (not b_next!29767))
