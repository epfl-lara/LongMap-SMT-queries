; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110640 () Bool)

(assert start!110640)

(declare-fun b_free!29475 () Bool)

(declare-fun b_next!29475 () Bool)

(assert (=> start!110640 (= b_free!29475 (not b_next!29475))))

(declare-fun tp!103747 () Bool)

(declare-fun b_and!47683 () Bool)

(assert (=> start!110640 (= tp!103747 b_and!47683)))

(declare-fun b!1309163 () Bool)

(declare-fun res!869070 () Bool)

(declare-fun e!746927 () Bool)

(assert (=> b!1309163 (=> (not res!869070) (not e!746927))))

(declare-datatypes ((array!87404 0))(
  ( (array!87405 (arr!42182 (Array (_ BitVec 32) (_ BitVec 64))) (size!42732 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87404)

(declare-datatypes ((List!29903 0))(
  ( (Nil!29900) (Cons!29899 (h!31108 (_ BitVec 64)) (t!43509 List!29903)) )
))
(declare-fun arrayNoDuplicates!0 (array!87404 (_ BitVec 32) List!29903) Bool)

(assert (=> b!1309163 (= res!869070 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29900))))

(declare-fun res!869073 () Bool)

(assert (=> start!110640 (=> (not res!869073) (not e!746927))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110640 (= res!869073 (validMask!0 mask!2040))))

(assert (=> start!110640 e!746927))

(assert (=> start!110640 tp!103747))

(declare-fun array_inv!31881 (array!87404) Bool)

(assert (=> start!110640 (array_inv!31881 _keys!1628)))

(assert (=> start!110640 true))

(declare-fun tp_is_empty!35205 () Bool)

(assert (=> start!110640 tp_is_empty!35205))

(declare-datatypes ((V!52043 0))(
  ( (V!52044 (val!17677 Int)) )
))
(declare-datatypes ((ValueCell!16704 0))(
  ( (ValueCellFull!16704 (v!20304 V!52043)) (EmptyCell!16704) )
))
(declare-datatypes ((array!87406 0))(
  ( (array!87407 (arr!42183 (Array (_ BitVec 32) ValueCell!16704)) (size!42733 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87406)

(declare-fun e!746924 () Bool)

(declare-fun array_inv!31882 (array!87406) Bool)

(assert (=> start!110640 (and (array_inv!31882 _values!1354) e!746924)))

(declare-fun b!1309164 () Bool)

(declare-fun e!746923 () Bool)

(assert (=> b!1309164 (= e!746923 tp_is_empty!35205)))

(declare-fun b!1309165 () Bool)

(declare-fun mapRes!54436 () Bool)

(assert (=> b!1309165 (= e!746924 (and e!746923 mapRes!54436))))

(declare-fun condMapEmpty!54436 () Bool)

(declare-fun mapDefault!54436 () ValueCell!16704)

(assert (=> b!1309165 (= condMapEmpty!54436 (= (arr!42183 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16704)) mapDefault!54436)))))

(declare-fun b!1309166 () Bool)

(declare-fun res!869072 () Bool)

(assert (=> b!1309166 (=> (not res!869072) (not e!746927))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309166 (= res!869072 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42732 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54436 () Bool)

(declare-fun tp!103746 () Bool)

(declare-fun e!746926 () Bool)

(assert (=> mapNonEmpty!54436 (= mapRes!54436 (and tp!103746 e!746926))))

(declare-fun mapRest!54436 () (Array (_ BitVec 32) ValueCell!16704))

(declare-fun mapKey!54436 () (_ BitVec 32))

(declare-fun mapValue!54436 () ValueCell!16704)

(assert (=> mapNonEmpty!54436 (= (arr!42183 _values!1354) (store mapRest!54436 mapKey!54436 mapValue!54436))))

(declare-fun b!1309167 () Bool)

(declare-fun res!869071 () Bool)

(assert (=> b!1309167 (=> (not res!869071) (not e!746927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87404 (_ BitVec 32)) Bool)

(assert (=> b!1309167 (= res!869071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309168 () Bool)

(assert (=> b!1309168 (= e!746926 tp_is_empty!35205)))

(declare-fun b!1309169 () Bool)

(declare-fun res!869069 () Bool)

(assert (=> b!1309169 (=> (not res!869069) (not e!746927))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309169 (= res!869069 (and (= (size!42733 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42732 _keys!1628) (size!42733 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309170 () Bool)

(assert (=> b!1309170 (= e!746927 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52043)

(declare-fun zeroValue!1296 () V!52043)

(declare-fun lt!585231 () Bool)

(declare-datatypes ((tuple2!22760 0))(
  ( (tuple2!22761 (_1!11391 (_ BitVec 64)) (_2!11391 V!52043)) )
))
(declare-datatypes ((List!29904 0))(
  ( (Nil!29901) (Cons!29900 (h!31109 tuple2!22760) (t!43510 List!29904)) )
))
(declare-datatypes ((ListLongMap!20417 0))(
  ( (ListLongMap!20418 (toList!10224 List!29904)) )
))
(declare-fun contains!8374 (ListLongMap!20417 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5237 (array!87404 array!87406 (_ BitVec 32) (_ BitVec 32) V!52043 V!52043 (_ BitVec 32) Int) ListLongMap!20417)

(assert (=> b!1309170 (= lt!585231 (contains!8374 (getCurrentListMap!5237 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54436 () Bool)

(assert (=> mapIsEmpty!54436 mapRes!54436))

(assert (= (and start!110640 res!869073) b!1309169))

(assert (= (and b!1309169 res!869069) b!1309167))

(assert (= (and b!1309167 res!869071) b!1309163))

(assert (= (and b!1309163 res!869070) b!1309166))

(assert (= (and b!1309166 res!869072) b!1309170))

(assert (= (and b!1309165 condMapEmpty!54436) mapIsEmpty!54436))

(assert (= (and b!1309165 (not condMapEmpty!54436)) mapNonEmpty!54436))

(get-info :version)

(assert (= (and mapNonEmpty!54436 ((_ is ValueCellFull!16704) mapValue!54436)) b!1309168))

(assert (= (and b!1309165 ((_ is ValueCellFull!16704) mapDefault!54436)) b!1309164))

(assert (= start!110640 b!1309165))

(declare-fun m!1199335 () Bool)

(assert (=> b!1309170 m!1199335))

(assert (=> b!1309170 m!1199335))

(declare-fun m!1199337 () Bool)

(assert (=> b!1309170 m!1199337))

(declare-fun m!1199339 () Bool)

(assert (=> b!1309167 m!1199339))

(declare-fun m!1199341 () Bool)

(assert (=> start!110640 m!1199341))

(declare-fun m!1199343 () Bool)

(assert (=> start!110640 m!1199343))

(declare-fun m!1199345 () Bool)

(assert (=> start!110640 m!1199345))

(declare-fun m!1199347 () Bool)

(assert (=> mapNonEmpty!54436 m!1199347))

(declare-fun m!1199349 () Bool)

(assert (=> b!1309163 m!1199349))

(check-sat (not b!1309167) (not b!1309170) (not start!110640) b_and!47683 tp_is_empty!35205 (not mapNonEmpty!54436) (not b!1309163) (not b_next!29475))
(check-sat b_and!47683 (not b_next!29475))
