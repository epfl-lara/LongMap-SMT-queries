; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110512 () Bool)

(assert start!110512)

(declare-fun b_free!29347 () Bool)

(declare-fun b_next!29347 () Bool)

(assert (=> start!110512 (= b_free!29347 (not b_next!29347))))

(declare-fun tp!103363 () Bool)

(declare-fun b_and!47537 () Bool)

(assert (=> start!110512 (= tp!103363 b_and!47537)))

(declare-fun b!1307233 () Bool)

(declare-fun e!745932 () Bool)

(assert (=> b!1307233 (= e!745932 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87071 0))(
  ( (array!87072 (arr!42016 (Array (_ BitVec 32) (_ BitVec 64))) (size!42568 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87071)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51873 0))(
  ( (V!51874 (val!17613 Int)) )
))
(declare-datatypes ((ValueCell!16640 0))(
  ( (ValueCellFull!16640 (v!20239 V!51873)) (EmptyCell!16640) )
))
(declare-datatypes ((array!87073 0))(
  ( (array!87074 (arr!42017 (Array (_ BitVec 32) ValueCell!16640)) (size!42569 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87073)

(declare-fun lt!584853 () Bool)

(declare-fun zeroValue!1296 () V!51873)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!51873)

(declare-datatypes ((tuple2!22752 0))(
  ( (tuple2!22753 (_1!11387 (_ BitVec 64)) (_2!11387 V!51873)) )
))
(declare-datatypes ((List!29877 0))(
  ( (Nil!29874) (Cons!29873 (h!31082 tuple2!22752) (t!43475 List!29877)) )
))
(declare-datatypes ((ListLongMap!20409 0))(
  ( (ListLongMap!20410 (toList!10220 List!29877)) )
))
(declare-fun contains!8297 (ListLongMap!20409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5115 (array!87071 array!87073 (_ BitVec 32) (_ BitVec 32) V!51873 V!51873 (_ BitVec 32) Int) ListLongMap!20409)

(assert (=> b!1307233 (= lt!584853 (contains!8297 (getCurrentListMap!5115 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54244 () Bool)

(declare-fun mapRes!54244 () Bool)

(declare-fun tp!103364 () Bool)

(declare-fun e!745934 () Bool)

(assert (=> mapNonEmpty!54244 (= mapRes!54244 (and tp!103364 e!745934))))

(declare-fun mapValue!54244 () ValueCell!16640)

(declare-fun mapKey!54244 () (_ BitVec 32))

(declare-fun mapRest!54244 () (Array (_ BitVec 32) ValueCell!16640))

(assert (=> mapNonEmpty!54244 (= (arr!42017 _values!1354) (store mapRest!54244 mapKey!54244 mapValue!54244))))

(declare-fun b!1307234 () Bool)

(declare-fun e!745931 () Bool)

(declare-fun tp_is_empty!35077 () Bool)

(assert (=> b!1307234 (= e!745931 tp_is_empty!35077)))

(declare-fun res!867756 () Bool)

(assert (=> start!110512 (=> (not res!867756) (not e!745932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110512 (= res!867756 (validMask!0 mask!2040))))

(assert (=> start!110512 e!745932))

(assert (=> start!110512 tp!103363))

(declare-fun array_inv!31955 (array!87071) Bool)

(assert (=> start!110512 (array_inv!31955 _keys!1628)))

(assert (=> start!110512 true))

(assert (=> start!110512 tp_is_empty!35077))

(declare-fun e!745930 () Bool)

(declare-fun array_inv!31956 (array!87073) Bool)

(assert (=> start!110512 (and (array_inv!31956 _values!1354) e!745930)))

(declare-fun b!1307235 () Bool)

(declare-fun res!867757 () Bool)

(assert (=> b!1307235 (=> (not res!867757) (not e!745932))))

(assert (=> b!1307235 (= res!867757 (and (= (size!42569 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42568 _keys!1628) (size!42569 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307236 () Bool)

(assert (=> b!1307236 (= e!745934 tp_is_empty!35077)))

(declare-fun b!1307237 () Bool)

(declare-fun res!867760 () Bool)

(assert (=> b!1307237 (=> (not res!867760) (not e!745932))))

(declare-datatypes ((List!29878 0))(
  ( (Nil!29875) (Cons!29874 (h!31083 (_ BitVec 64)) (t!43476 List!29878)) )
))
(declare-fun arrayNoDuplicates!0 (array!87071 (_ BitVec 32) List!29878) Bool)

(assert (=> b!1307237 (= res!867760 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29875))))

(declare-fun b!1307238 () Bool)

(assert (=> b!1307238 (= e!745930 (and e!745931 mapRes!54244))))

(declare-fun condMapEmpty!54244 () Bool)

(declare-fun mapDefault!54244 () ValueCell!16640)

(assert (=> b!1307238 (= condMapEmpty!54244 (= (arr!42017 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16640)) mapDefault!54244)))))

(declare-fun b!1307239 () Bool)

(declare-fun res!867759 () Bool)

(assert (=> b!1307239 (=> (not res!867759) (not e!745932))))

(assert (=> b!1307239 (= res!867759 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42568 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307240 () Bool)

(declare-fun res!867758 () Bool)

(assert (=> b!1307240 (=> (not res!867758) (not e!745932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87071 (_ BitVec 32)) Bool)

(assert (=> b!1307240 (= res!867758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54244 () Bool)

(assert (=> mapIsEmpty!54244 mapRes!54244))

(assert (= (and start!110512 res!867756) b!1307235))

(assert (= (and b!1307235 res!867757) b!1307240))

(assert (= (and b!1307240 res!867758) b!1307237))

(assert (= (and b!1307237 res!867760) b!1307239))

(assert (= (and b!1307239 res!867759) b!1307233))

(assert (= (and b!1307238 condMapEmpty!54244) mapIsEmpty!54244))

(assert (= (and b!1307238 (not condMapEmpty!54244)) mapNonEmpty!54244))

(get-info :version)

(assert (= (and mapNonEmpty!54244 ((_ is ValueCellFull!16640) mapValue!54244)) b!1307236))

(assert (= (and b!1307238 ((_ is ValueCellFull!16640) mapDefault!54244)) b!1307234))

(assert (= start!110512 b!1307238))

(declare-fun m!1197525 () Bool)

(assert (=> mapNonEmpty!54244 m!1197525))

(declare-fun m!1197527 () Bool)

(assert (=> start!110512 m!1197527))

(declare-fun m!1197529 () Bool)

(assert (=> start!110512 m!1197529))

(declare-fun m!1197531 () Bool)

(assert (=> start!110512 m!1197531))

(declare-fun m!1197533 () Bool)

(assert (=> b!1307240 m!1197533))

(declare-fun m!1197535 () Bool)

(assert (=> b!1307237 m!1197535))

(declare-fun m!1197537 () Bool)

(assert (=> b!1307233 m!1197537))

(assert (=> b!1307233 m!1197537))

(declare-fun m!1197539 () Bool)

(assert (=> b!1307233 m!1197539))

(check-sat (not b!1307240) b_and!47537 (not b!1307237) (not b_next!29347) (not b!1307233) (not mapNonEmpty!54244) (not start!110512) tp_is_empty!35077)
(check-sat b_and!47537 (not b_next!29347))
