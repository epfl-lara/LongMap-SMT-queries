; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110788 () Bool)

(assert start!110788)

(declare-fun b_free!29623 () Bool)

(declare-fun b_next!29623 () Bool)

(assert (=> start!110788 (= b_free!29623 (not b_next!29623))))

(declare-fun tp!104191 () Bool)

(declare-fun b_and!47813 () Bool)

(assert (=> start!110788 (= tp!104191 b_and!47813)))

(declare-fun mapNonEmpty!54658 () Bool)

(declare-fun mapRes!54658 () Bool)

(declare-fun tp!104192 () Bool)

(declare-fun e!748003 () Bool)

(assert (=> mapNonEmpty!54658 (= mapRes!54658 (and tp!104192 e!748003))))

(declare-fun mapKey!54658 () (_ BitVec 32))

(declare-datatypes ((V!52241 0))(
  ( (V!52242 (val!17751 Int)) )
))
(declare-datatypes ((ValueCell!16778 0))(
  ( (ValueCellFull!16778 (v!20377 V!52241)) (EmptyCell!16778) )
))
(declare-fun mapValue!54658 () ValueCell!16778)

(declare-datatypes ((array!87603 0))(
  ( (array!87604 (arr!42282 (Array (_ BitVec 32) ValueCell!16778)) (size!42834 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87603)

(declare-fun mapRest!54658 () (Array (_ BitVec 32) ValueCell!16778))

(assert (=> mapNonEmpty!54658 (= (arr!42282 _values!1354) (store mapRest!54658 mapKey!54658 mapValue!54658))))

(declare-fun b!1311193 () Bool)

(declare-fun tp_is_empty!35353 () Bool)

(assert (=> b!1311193 (= e!748003 tp_is_empty!35353)))

(declare-fun res!870474 () Bool)

(declare-fun e!748002 () Bool)

(assert (=> start!110788 (=> (not res!870474) (not e!748002))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110788 (= res!870474 (validMask!0 mask!2040))))

(assert (=> start!110788 e!748002))

(assert (=> start!110788 tp!104191))

(declare-datatypes ((array!87605 0))(
  ( (array!87606 (arr!42283 (Array (_ BitVec 32) (_ BitVec 64))) (size!42835 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87605)

(declare-fun array_inv!32133 (array!87605) Bool)

(assert (=> start!110788 (array_inv!32133 _keys!1628)))

(assert (=> start!110788 true))

(assert (=> start!110788 tp_is_empty!35353))

(declare-fun e!748004 () Bool)

(declare-fun array_inv!32134 (array!87603) Bool)

(assert (=> start!110788 (and (array_inv!32134 _values!1354) e!748004)))

(declare-fun b!1311194 () Bool)

(declare-fun res!870475 () Bool)

(assert (=> b!1311194 (=> (not res!870475) (not e!748002))))

(declare-datatypes ((List!30080 0))(
  ( (Nil!30077) (Cons!30076 (h!31285 (_ BitVec 64)) (t!43678 List!30080)) )
))
(declare-fun arrayNoDuplicates!0 (array!87605 (_ BitVec 32) List!30080) Bool)

(assert (=> b!1311194 (= res!870475 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30077))))

(declare-fun b!1311195 () Bool)

(declare-fun res!870478 () Bool)

(assert (=> b!1311195 (=> (not res!870478) (not e!748002))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311195 (= res!870478 (and (= (size!42834 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42835 _keys!1628) (size!42834 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311196 () Bool)

(assert (=> b!1311196 (= e!748002 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun lt!585267 () Bool)

(declare-fun minValue!1296 () V!52241)

(declare-fun zeroValue!1296 () V!52241)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22958 0))(
  ( (tuple2!22959 (_1!11490 (_ BitVec 64)) (_2!11490 V!52241)) )
))
(declare-datatypes ((List!30081 0))(
  ( (Nil!30078) (Cons!30077 (h!31286 tuple2!22958) (t!43679 List!30081)) )
))
(declare-datatypes ((ListLongMap!20615 0))(
  ( (ListLongMap!20616 (toList!10323 List!30081)) )
))
(declare-fun contains!8400 (ListLongMap!20615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5218 (array!87605 array!87603 (_ BitVec 32) (_ BitVec 32) V!52241 V!52241 (_ BitVec 32) Int) ListLongMap!20615)

(assert (=> b!1311196 (= lt!585267 (contains!8400 (getCurrentListMap!5218 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311197 () Bool)

(declare-fun res!870476 () Bool)

(assert (=> b!1311197 (=> (not res!870476) (not e!748002))))

(assert (=> b!1311197 (= res!870476 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42835 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311198 () Bool)

(declare-fun e!748000 () Bool)

(assert (=> b!1311198 (= e!748004 (and e!748000 mapRes!54658))))

(declare-fun condMapEmpty!54658 () Bool)

(declare-fun mapDefault!54658 () ValueCell!16778)

(assert (=> b!1311198 (= condMapEmpty!54658 (= (arr!42282 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16778)) mapDefault!54658)))))

(declare-fun b!1311199 () Bool)

(assert (=> b!1311199 (= e!748000 tp_is_empty!35353)))

(declare-fun b!1311200 () Bool)

(declare-fun res!870477 () Bool)

(assert (=> b!1311200 (=> (not res!870477) (not e!748002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87605 (_ BitVec 32)) Bool)

(assert (=> b!1311200 (= res!870477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54658 () Bool)

(assert (=> mapIsEmpty!54658 mapRes!54658))

(assert (= (and start!110788 res!870474) b!1311195))

(assert (= (and b!1311195 res!870478) b!1311200))

(assert (= (and b!1311200 res!870477) b!1311194))

(assert (= (and b!1311194 res!870475) b!1311197))

(assert (= (and b!1311197 res!870476) b!1311196))

(assert (= (and b!1311198 condMapEmpty!54658) mapIsEmpty!54658))

(assert (= (and b!1311198 (not condMapEmpty!54658)) mapNonEmpty!54658))

(get-info :version)

(assert (= (and mapNonEmpty!54658 ((_ is ValueCellFull!16778) mapValue!54658)) b!1311193))

(assert (= (and b!1311198 ((_ is ValueCellFull!16778) mapDefault!54658)) b!1311199))

(assert (= start!110788 b!1311198))

(declare-fun m!1200273 () Bool)

(assert (=> b!1311196 m!1200273))

(assert (=> b!1311196 m!1200273))

(declare-fun m!1200275 () Bool)

(assert (=> b!1311196 m!1200275))

(declare-fun m!1200277 () Bool)

(assert (=> mapNonEmpty!54658 m!1200277))

(declare-fun m!1200279 () Bool)

(assert (=> b!1311200 m!1200279))

(declare-fun m!1200281 () Bool)

(assert (=> b!1311194 m!1200281))

(declare-fun m!1200283 () Bool)

(assert (=> start!110788 m!1200283))

(declare-fun m!1200285 () Bool)

(assert (=> start!110788 m!1200285))

(declare-fun m!1200287 () Bool)

(assert (=> start!110788 m!1200287))

(check-sat b_and!47813 (not b!1311194) (not b!1311200) (not b!1311196) (not b_next!29623) tp_is_empty!35353 (not start!110788) (not mapNonEmpty!54658))
(check-sat b_and!47813 (not b_next!29623))
