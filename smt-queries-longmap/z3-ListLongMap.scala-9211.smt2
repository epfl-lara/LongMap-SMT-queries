; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110838 () Bool)

(assert start!110838)

(declare-fun b_free!29449 () Bool)

(declare-fun b_next!29449 () Bool)

(assert (=> start!110838 (= b_free!29449 (not b_next!29449))))

(declare-fun tp!103669 () Bool)

(declare-fun b_and!47659 () Bool)

(assert (=> start!110838 (= tp!103669 b_and!47659)))

(declare-fun b!1310150 () Bool)

(declare-fun e!747575 () Bool)

(declare-fun tp_is_empty!35179 () Bool)

(assert (=> b!1310150 (= e!747575 tp_is_empty!35179)))

(declare-fun b!1310151 () Bool)

(declare-fun res!869394 () Bool)

(declare-fun e!747572 () Bool)

(assert (=> b!1310151 (=> (not res!869394) (not e!747572))))

(declare-datatypes ((array!87415 0))(
  ( (array!87416 (arr!42183 (Array (_ BitVec 32) (_ BitVec 64))) (size!42734 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87415)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52009 0))(
  ( (V!52010 (val!17664 Int)) )
))
(declare-datatypes ((ValueCell!16691 0))(
  ( (ValueCellFull!16691 (v!20286 V!52009)) (EmptyCell!16691) )
))
(declare-datatypes ((array!87417 0))(
  ( (array!87418 (arr!42184 (Array (_ BitVec 32) ValueCell!16691)) (size!42735 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87417)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310151 (= res!869394 (and (= (size!42735 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42734 _keys!1628) (size!42735 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310152 () Bool)

(assert (=> b!1310152 (= e!747572 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52009)

(declare-fun lt!585668 () Bool)

(declare-fun zeroValue!1296 () V!52009)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22792 0))(
  ( (tuple2!22793 (_1!11407 (_ BitVec 64)) (_2!11407 V!52009)) )
))
(declare-datatypes ((List!29948 0))(
  ( (Nil!29945) (Cons!29944 (h!31162 tuple2!22792) (t!43546 List!29948)) )
))
(declare-datatypes ((ListLongMap!20457 0))(
  ( (ListLongMap!20458 (toList!10244 List!29948)) )
))
(declare-fun contains!8406 (ListLongMap!20457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5248 (array!87415 array!87417 (_ BitVec 32) (_ BitVec 32) V!52009 V!52009 (_ BitVec 32) Int) ListLongMap!20457)

(assert (=> b!1310152 (= lt!585668 (contains!8406 (getCurrentListMap!5248 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310153 () Bool)

(declare-fun res!869393 () Bool)

(assert (=> b!1310153 (=> (not res!869393) (not e!747572))))

(assert (=> b!1310153 (= res!869393 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42734 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!869396 () Bool)

(assert (=> start!110838 (=> (not res!869396) (not e!747572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110838 (= res!869396 (validMask!0 mask!2040))))

(assert (=> start!110838 e!747572))

(assert (=> start!110838 tp!103669))

(declare-fun array_inv!32143 (array!87415) Bool)

(assert (=> start!110838 (array_inv!32143 _keys!1628)))

(assert (=> start!110838 true))

(assert (=> start!110838 tp_is_empty!35179))

(declare-fun e!747573 () Bool)

(declare-fun array_inv!32144 (array!87417) Bool)

(assert (=> start!110838 (and (array_inv!32144 _values!1354) e!747573)))

(declare-fun b!1310154 () Bool)

(declare-fun e!747574 () Bool)

(assert (=> b!1310154 (= e!747574 tp_is_empty!35179)))

(declare-fun b!1310155 () Bool)

(declare-fun res!869392 () Bool)

(assert (=> b!1310155 (=> (not res!869392) (not e!747572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87415 (_ BitVec 32)) Bool)

(assert (=> b!1310155 (= res!869392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54397 () Bool)

(declare-fun mapRes!54397 () Bool)

(assert (=> mapIsEmpty!54397 mapRes!54397))

(declare-fun b!1310156 () Bool)

(assert (=> b!1310156 (= e!747573 (and e!747575 mapRes!54397))))

(declare-fun condMapEmpty!54397 () Bool)

(declare-fun mapDefault!54397 () ValueCell!16691)

(assert (=> b!1310156 (= condMapEmpty!54397 (= (arr!42184 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16691)) mapDefault!54397)))))

(declare-fun mapNonEmpty!54397 () Bool)

(declare-fun tp!103668 () Bool)

(assert (=> mapNonEmpty!54397 (= mapRes!54397 (and tp!103668 e!747574))))

(declare-fun mapKey!54397 () (_ BitVec 32))

(declare-fun mapValue!54397 () ValueCell!16691)

(declare-fun mapRest!54397 () (Array (_ BitVec 32) ValueCell!16691))

(assert (=> mapNonEmpty!54397 (= (arr!42184 _values!1354) (store mapRest!54397 mapKey!54397 mapValue!54397))))

(declare-fun b!1310157 () Bool)

(declare-fun res!869395 () Bool)

(assert (=> b!1310157 (=> (not res!869395) (not e!747572))))

(declare-datatypes ((List!29949 0))(
  ( (Nil!29946) (Cons!29945 (h!31163 (_ BitVec 64)) (t!43547 List!29949)) )
))
(declare-fun arrayNoDuplicates!0 (array!87415 (_ BitVec 32) List!29949) Bool)

(assert (=> b!1310157 (= res!869395 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29946))))

(assert (= (and start!110838 res!869396) b!1310151))

(assert (= (and b!1310151 res!869394) b!1310155))

(assert (= (and b!1310155 res!869392) b!1310157))

(assert (= (and b!1310157 res!869395) b!1310153))

(assert (= (and b!1310153 res!869393) b!1310152))

(assert (= (and b!1310156 condMapEmpty!54397) mapIsEmpty!54397))

(assert (= (and b!1310156 (not condMapEmpty!54397)) mapNonEmpty!54397))

(get-info :version)

(assert (= (and mapNonEmpty!54397 ((_ is ValueCellFull!16691) mapValue!54397)) b!1310154))

(assert (= (and b!1310156 ((_ is ValueCellFull!16691) mapDefault!54397)) b!1310150))

(assert (= start!110838 b!1310156))

(declare-fun m!1200725 () Bool)

(assert (=> start!110838 m!1200725))

(declare-fun m!1200727 () Bool)

(assert (=> start!110838 m!1200727))

(declare-fun m!1200729 () Bool)

(assert (=> start!110838 m!1200729))

(declare-fun m!1200731 () Bool)

(assert (=> mapNonEmpty!54397 m!1200731))

(declare-fun m!1200733 () Bool)

(assert (=> b!1310157 m!1200733))

(declare-fun m!1200735 () Bool)

(assert (=> b!1310152 m!1200735))

(assert (=> b!1310152 m!1200735))

(declare-fun m!1200737 () Bool)

(assert (=> b!1310152 m!1200737))

(declare-fun m!1200739 () Bool)

(assert (=> b!1310155 m!1200739))

(check-sat (not start!110838) tp_is_empty!35179 (not mapNonEmpty!54397) (not b_next!29449) (not b!1310157) (not b!1310155) b_and!47659 (not b!1310152))
(check-sat b_and!47659 (not b_next!29449))
