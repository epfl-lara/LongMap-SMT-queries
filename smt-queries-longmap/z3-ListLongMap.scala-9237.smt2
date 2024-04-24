; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110994 () Bool)

(assert start!110994)

(declare-fun b_free!29605 () Bool)

(declare-fun b_next!29605 () Bool)

(assert (=> start!110994 (= b_free!29605 (not b_next!29605))))

(declare-fun tp!104137 () Bool)

(declare-fun b_and!47815 () Bool)

(assert (=> start!110994 (= tp!104137 b_and!47815)))

(declare-fun b!1312346 () Bool)

(declare-fun e!748741 () Bool)

(declare-fun tp_is_empty!35335 () Bool)

(assert (=> b!1312346 (= e!748741 tp_is_empty!35335)))

(declare-fun b!1312347 () Bool)

(declare-fun e!748744 () Bool)

(declare-fun e!748742 () Bool)

(declare-fun mapRes!54631 () Bool)

(assert (=> b!1312347 (= e!748744 (and e!748742 mapRes!54631))))

(declare-fun condMapEmpty!54631 () Bool)

(declare-datatypes ((V!52217 0))(
  ( (V!52218 (val!17742 Int)) )
))
(declare-datatypes ((ValueCell!16769 0))(
  ( (ValueCellFull!16769 (v!20364 V!52217)) (EmptyCell!16769) )
))
(declare-datatypes ((array!87711 0))(
  ( (array!87712 (arr!42331 (Array (_ BitVec 32) ValueCell!16769)) (size!42882 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87711)

(declare-fun mapDefault!54631 () ValueCell!16769)

(assert (=> b!1312347 (= condMapEmpty!54631 (= (arr!42331 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16769)) mapDefault!54631)))))

(declare-fun mapNonEmpty!54631 () Bool)

(declare-fun tp!104136 () Bool)

(assert (=> mapNonEmpty!54631 (= mapRes!54631 (and tp!104136 e!748741))))

(declare-fun mapValue!54631 () ValueCell!16769)

(declare-fun mapRest!54631 () (Array (_ BitVec 32) ValueCell!16769))

(declare-fun mapKey!54631 () (_ BitVec 32))

(assert (=> mapNonEmpty!54631 (= (arr!42331 _values!1354) (store mapRest!54631 mapKey!54631 mapValue!54631))))

(declare-fun b!1312348 () Bool)

(declare-fun res!870888 () Bool)

(declare-fun e!748745 () Bool)

(assert (=> b!1312348 (=> (not res!870888) (not e!748745))))

(declare-datatypes ((array!87713 0))(
  ( (array!87714 (arr!42332 (Array (_ BitVec 32) (_ BitVec 64))) (size!42883 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87713)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312348 (= res!870888 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42883 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312349 () Bool)

(declare-fun res!870886 () Bool)

(assert (=> b!1312349 (=> (not res!870886) (not e!748745))))

(declare-datatypes ((List!30051 0))(
  ( (Nil!30048) (Cons!30047 (h!31265 (_ BitVec 64)) (t!43649 List!30051)) )
))
(declare-fun arrayNoDuplicates!0 (array!87713 (_ BitVec 32) List!30051) Bool)

(assert (=> b!1312349 (= res!870886 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30048))))

(declare-fun b!1312350 () Bool)

(declare-fun res!870887 () Bool)

(assert (=> b!1312350 (=> (not res!870887) (not e!748745))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87713 (_ BitVec 32)) Bool)

(assert (=> b!1312350 (= res!870887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312351 () Bool)

(assert (=> b!1312351 (= e!748745 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52217)

(declare-fun zeroValue!1296 () V!52217)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585902 () Bool)

(declare-datatypes ((tuple2!22898 0))(
  ( (tuple2!22899 (_1!11460 (_ BitVec 64)) (_2!11460 V!52217)) )
))
(declare-datatypes ((List!30052 0))(
  ( (Nil!30049) (Cons!30048 (h!31266 tuple2!22898) (t!43650 List!30052)) )
))
(declare-datatypes ((ListLongMap!20563 0))(
  ( (ListLongMap!20564 (toList!10297 List!30052)) )
))
(declare-fun contains!8459 (ListLongMap!20563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5301 (array!87713 array!87711 (_ BitVec 32) (_ BitVec 32) V!52217 V!52217 (_ BitVec 32) Int) ListLongMap!20563)

(assert (=> b!1312351 (= lt!585902 (contains!8459 (getCurrentListMap!5301 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!870890 () Bool)

(assert (=> start!110994 (=> (not res!870890) (not e!748745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110994 (= res!870890 (validMask!0 mask!2040))))

(assert (=> start!110994 e!748745))

(assert (=> start!110994 tp!104137))

(declare-fun array_inv!32255 (array!87713) Bool)

(assert (=> start!110994 (array_inv!32255 _keys!1628)))

(assert (=> start!110994 true))

(assert (=> start!110994 tp_is_empty!35335))

(declare-fun array_inv!32256 (array!87711) Bool)

(assert (=> start!110994 (and (array_inv!32256 _values!1354) e!748744)))

(declare-fun mapIsEmpty!54631 () Bool)

(assert (=> mapIsEmpty!54631 mapRes!54631))

(declare-fun b!1312352 () Bool)

(assert (=> b!1312352 (= e!748742 tp_is_empty!35335)))

(declare-fun b!1312353 () Bool)

(declare-fun res!870889 () Bool)

(assert (=> b!1312353 (=> (not res!870889) (not e!748745))))

(assert (=> b!1312353 (= res!870889 (and (= (size!42882 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42883 _keys!1628) (size!42882 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110994 res!870890) b!1312353))

(assert (= (and b!1312353 res!870889) b!1312350))

(assert (= (and b!1312350 res!870887) b!1312349))

(assert (= (and b!1312349 res!870886) b!1312348))

(assert (= (and b!1312348 res!870888) b!1312351))

(assert (= (and b!1312347 condMapEmpty!54631) mapIsEmpty!54631))

(assert (= (and b!1312347 (not condMapEmpty!54631)) mapNonEmpty!54631))

(get-info :version)

(assert (= (and mapNonEmpty!54631 ((_ is ValueCellFull!16769) mapValue!54631)) b!1312346))

(assert (= (and b!1312347 ((_ is ValueCellFull!16769) mapDefault!54631)) b!1312352))

(assert (= start!110994 b!1312347))

(declare-fun m!1202243 () Bool)

(assert (=> mapNonEmpty!54631 m!1202243))

(declare-fun m!1202245 () Bool)

(assert (=> start!110994 m!1202245))

(declare-fun m!1202247 () Bool)

(assert (=> start!110994 m!1202247))

(declare-fun m!1202249 () Bool)

(assert (=> start!110994 m!1202249))

(declare-fun m!1202251 () Bool)

(assert (=> b!1312351 m!1202251))

(assert (=> b!1312351 m!1202251))

(declare-fun m!1202253 () Bool)

(assert (=> b!1312351 m!1202253))

(declare-fun m!1202255 () Bool)

(assert (=> b!1312349 m!1202255))

(declare-fun m!1202257 () Bool)

(assert (=> b!1312350 m!1202257))

(check-sat (not start!110994) (not b!1312350) (not b!1312349) b_and!47815 (not b_next!29605) (not b!1312351) (not mapNonEmpty!54631) tp_is_empty!35335)
(check-sat b_and!47815 (not b_next!29605))
