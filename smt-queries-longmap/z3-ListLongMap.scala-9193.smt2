; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110508 () Bool)

(assert start!110508)

(declare-fun b_free!29343 () Bool)

(declare-fun b_next!29343 () Bool)

(assert (=> start!110508 (= b_free!29343 (not b_next!29343))))

(declare-fun tp!103351 () Bool)

(declare-fun b_and!47551 () Bool)

(assert (=> start!110508 (= tp!103351 b_and!47551)))

(declare-fun res!867758 () Bool)

(declare-fun e!745934 () Bool)

(assert (=> start!110508 (=> (not res!867758) (not e!745934))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110508 (= res!867758 (validMask!0 mask!2040))))

(assert (=> start!110508 e!745934))

(assert (=> start!110508 tp!103351))

(declare-datatypes ((array!87150 0))(
  ( (array!87151 (arr!42055 (Array (_ BitVec 32) (_ BitVec 64))) (size!42605 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87150)

(declare-fun array_inv!31791 (array!87150) Bool)

(assert (=> start!110508 (array_inv!31791 _keys!1628)))

(assert (=> start!110508 true))

(declare-fun tp_is_empty!35073 () Bool)

(assert (=> start!110508 tp_is_empty!35073))

(declare-datatypes ((V!51867 0))(
  ( (V!51868 (val!17611 Int)) )
))
(declare-datatypes ((ValueCell!16638 0))(
  ( (ValueCellFull!16638 (v!20238 V!51867)) (EmptyCell!16638) )
))
(declare-datatypes ((array!87152 0))(
  ( (array!87153 (arr!42056 (Array (_ BitVec 32) ValueCell!16638)) (size!42606 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87152)

(declare-fun e!745933 () Bool)

(declare-fun array_inv!31792 (array!87152) Bool)

(assert (=> start!110508 (and (array_inv!31792 _values!1354) e!745933)))

(declare-fun b!1307255 () Bool)

(declare-fun res!867757 () Bool)

(assert (=> b!1307255 (=> (not res!867757) (not e!745934))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307255 (= res!867757 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42605 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54238 () Bool)

(declare-fun mapRes!54238 () Bool)

(declare-fun tp!103350 () Bool)

(declare-fun e!745936 () Bool)

(assert (=> mapNonEmpty!54238 (= mapRes!54238 (and tp!103350 e!745936))))

(declare-fun mapRest!54238 () (Array (_ BitVec 32) ValueCell!16638))

(declare-fun mapKey!54238 () (_ BitVec 32))

(declare-fun mapValue!54238 () ValueCell!16638)

(assert (=> mapNonEmpty!54238 (= (arr!42056 _values!1354) (store mapRest!54238 mapKey!54238 mapValue!54238))))

(declare-fun b!1307256 () Bool)

(declare-fun res!867755 () Bool)

(assert (=> b!1307256 (=> (not res!867755) (not e!745934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87150 (_ BitVec 32)) Bool)

(assert (=> b!1307256 (= res!867755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307257 () Bool)

(declare-fun e!745935 () Bool)

(assert (=> b!1307257 (= e!745933 (and e!745935 mapRes!54238))))

(declare-fun condMapEmpty!54238 () Bool)

(declare-fun mapDefault!54238 () ValueCell!16638)

(assert (=> b!1307257 (= condMapEmpty!54238 (= (arr!42056 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16638)) mapDefault!54238)))))

(declare-fun b!1307258 () Bool)

(assert (=> b!1307258 (= e!745935 tp_is_empty!35073)))

(declare-fun b!1307259 () Bool)

(assert (=> b!1307259 (= e!745934 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51867)

(declare-fun lt!585033 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!51867)

(declare-datatypes ((tuple2!22676 0))(
  ( (tuple2!22677 (_1!11349 (_ BitVec 64)) (_2!11349 V!51867)) )
))
(declare-datatypes ((List!29816 0))(
  ( (Nil!29813) (Cons!29812 (h!31021 tuple2!22676) (t!43422 List!29816)) )
))
(declare-datatypes ((ListLongMap!20333 0))(
  ( (ListLongMap!20334 (toList!10182 List!29816)) )
))
(declare-fun contains!8332 (ListLongMap!20333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5195 (array!87150 array!87152 (_ BitVec 32) (_ BitVec 32) V!51867 V!51867 (_ BitVec 32) Int) ListLongMap!20333)

(assert (=> b!1307259 (= lt!585033 (contains!8332 (getCurrentListMap!5195 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307260 () Bool)

(declare-fun res!867756 () Bool)

(assert (=> b!1307260 (=> (not res!867756) (not e!745934))))

(assert (=> b!1307260 (= res!867756 (and (= (size!42606 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42605 _keys!1628) (size!42606 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307261 () Bool)

(assert (=> b!1307261 (= e!745936 tp_is_empty!35073)))

(declare-fun b!1307262 () Bool)

(declare-fun res!867759 () Bool)

(assert (=> b!1307262 (=> (not res!867759) (not e!745934))))

(declare-datatypes ((List!29817 0))(
  ( (Nil!29814) (Cons!29813 (h!31022 (_ BitVec 64)) (t!43423 List!29817)) )
))
(declare-fun arrayNoDuplicates!0 (array!87150 (_ BitVec 32) List!29817) Bool)

(assert (=> b!1307262 (= res!867759 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29814))))

(declare-fun mapIsEmpty!54238 () Bool)

(assert (=> mapIsEmpty!54238 mapRes!54238))

(assert (= (and start!110508 res!867758) b!1307260))

(assert (= (and b!1307260 res!867756) b!1307256))

(assert (= (and b!1307256 res!867755) b!1307262))

(assert (= (and b!1307262 res!867759) b!1307255))

(assert (= (and b!1307255 res!867757) b!1307259))

(assert (= (and b!1307257 condMapEmpty!54238) mapIsEmpty!54238))

(assert (= (and b!1307257 (not condMapEmpty!54238)) mapNonEmpty!54238))

(get-info :version)

(assert (= (and mapNonEmpty!54238 ((_ is ValueCellFull!16638) mapValue!54238)) b!1307261))

(assert (= (and b!1307257 ((_ is ValueCellFull!16638) mapDefault!54238)) b!1307258))

(assert (= start!110508 b!1307257))

(declare-fun m!1198009 () Bool)

(assert (=> b!1307262 m!1198009))

(declare-fun m!1198011 () Bool)

(assert (=> b!1307259 m!1198011))

(assert (=> b!1307259 m!1198011))

(declare-fun m!1198013 () Bool)

(assert (=> b!1307259 m!1198013))

(declare-fun m!1198015 () Bool)

(assert (=> mapNonEmpty!54238 m!1198015))

(declare-fun m!1198017 () Bool)

(assert (=> b!1307256 m!1198017))

(declare-fun m!1198019 () Bool)

(assert (=> start!110508 m!1198019))

(declare-fun m!1198021 () Bool)

(assert (=> start!110508 m!1198021))

(declare-fun m!1198023 () Bool)

(assert (=> start!110508 m!1198023))

(check-sat (not mapNonEmpty!54238) (not start!110508) tp_is_empty!35073 (not b!1307262) (not b!1307259) (not b!1307256) (not b_next!29343) b_and!47551)
(check-sat b_and!47551 (not b_next!29343))
