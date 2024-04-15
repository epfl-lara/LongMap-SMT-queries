; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110746 () Bool)

(assert start!110746)

(declare-fun b_free!29581 () Bool)

(declare-fun b_next!29581 () Bool)

(assert (=> start!110746 (= b_free!29581 (not b_next!29581))))

(declare-fun tp!104066 () Bool)

(declare-fun b_and!47771 () Bool)

(assert (=> start!110746 (= tp!104066 b_and!47771)))

(declare-fun b!1310689 () Bool)

(declare-fun e!747685 () Bool)

(declare-fun tp_is_empty!35311 () Bool)

(assert (=> b!1310689 (= e!747685 tp_is_empty!35311)))

(declare-fun b!1310690 () Bool)

(declare-fun res!870159 () Bool)

(declare-fun e!747689 () Bool)

(assert (=> b!1310690 (=> (not res!870159) (not e!747689))))

(declare-datatypes ((array!87525 0))(
  ( (array!87526 (arr!42243 (Array (_ BitVec 32) (_ BitVec 64))) (size!42795 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87525)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310690 (= res!870159 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42795 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310691 () Bool)

(declare-fun res!870162 () Bool)

(assert (=> b!1310691 (=> (not res!870162) (not e!747689))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87525 (_ BitVec 32)) Bool)

(assert (=> b!1310691 (= res!870162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310692 () Bool)

(assert (=> b!1310692 (= e!747689 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!52185 0))(
  ( (V!52186 (val!17730 Int)) )
))
(declare-fun minValue!1296 () V!52185)

(declare-datatypes ((ValueCell!16757 0))(
  ( (ValueCellFull!16757 (v!20356 V!52185)) (EmptyCell!16757) )
))
(declare-datatypes ((array!87527 0))(
  ( (array!87528 (arr!42244 (Array (_ BitVec 32) ValueCell!16757)) (size!42796 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87527)

(declare-fun zeroValue!1296 () V!52185)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585204 () Bool)

(declare-datatypes ((tuple2!22928 0))(
  ( (tuple2!22929 (_1!11475 (_ BitVec 64)) (_2!11475 V!52185)) )
))
(declare-datatypes ((List!30053 0))(
  ( (Nil!30050) (Cons!30049 (h!31258 tuple2!22928) (t!43651 List!30053)) )
))
(declare-datatypes ((ListLongMap!20585 0))(
  ( (ListLongMap!20586 (toList!10308 List!30053)) )
))
(declare-fun contains!8385 (ListLongMap!20585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5203 (array!87525 array!87527 (_ BitVec 32) (_ BitVec 32) V!52185 V!52185 (_ BitVec 32) Int) ListLongMap!20585)

(assert (=> b!1310692 (= lt!585204 (contains!8385 (getCurrentListMap!5203 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54595 () Bool)

(declare-fun mapRes!54595 () Bool)

(declare-fun tp!104065 () Bool)

(declare-fun e!747688 () Bool)

(assert (=> mapNonEmpty!54595 (= mapRes!54595 (and tp!104065 e!747688))))

(declare-fun mapRest!54595 () (Array (_ BitVec 32) ValueCell!16757))

(declare-fun mapValue!54595 () ValueCell!16757)

(declare-fun mapKey!54595 () (_ BitVec 32))

(assert (=> mapNonEmpty!54595 (= (arr!42244 _values!1354) (store mapRest!54595 mapKey!54595 mapValue!54595))))

(declare-fun res!870160 () Bool)

(assert (=> start!110746 (=> (not res!870160) (not e!747689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110746 (= res!870160 (validMask!0 mask!2040))))

(assert (=> start!110746 e!747689))

(assert (=> start!110746 tp!104066))

(declare-fun array_inv!32107 (array!87525) Bool)

(assert (=> start!110746 (array_inv!32107 _keys!1628)))

(assert (=> start!110746 true))

(assert (=> start!110746 tp_is_empty!35311))

(declare-fun e!747686 () Bool)

(declare-fun array_inv!32108 (array!87527) Bool)

(assert (=> start!110746 (and (array_inv!32108 _values!1354) e!747686)))

(declare-fun b!1310693 () Bool)

(assert (=> b!1310693 (= e!747688 tp_is_empty!35311)))

(declare-fun b!1310694 () Bool)

(declare-fun res!870163 () Bool)

(assert (=> b!1310694 (=> (not res!870163) (not e!747689))))

(assert (=> b!1310694 (= res!870163 (and (= (size!42796 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42795 _keys!1628) (size!42796 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310695 () Bool)

(assert (=> b!1310695 (= e!747686 (and e!747685 mapRes!54595))))

(declare-fun condMapEmpty!54595 () Bool)

(declare-fun mapDefault!54595 () ValueCell!16757)

(assert (=> b!1310695 (= condMapEmpty!54595 (= (arr!42244 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16757)) mapDefault!54595)))))

(declare-fun mapIsEmpty!54595 () Bool)

(assert (=> mapIsEmpty!54595 mapRes!54595))

(declare-fun b!1310696 () Bool)

(declare-fun res!870161 () Bool)

(assert (=> b!1310696 (=> (not res!870161) (not e!747689))))

(declare-datatypes ((List!30054 0))(
  ( (Nil!30051) (Cons!30050 (h!31259 (_ BitVec 64)) (t!43652 List!30054)) )
))
(declare-fun arrayNoDuplicates!0 (array!87525 (_ BitVec 32) List!30054) Bool)

(assert (=> b!1310696 (= res!870161 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30051))))

(assert (= (and start!110746 res!870160) b!1310694))

(assert (= (and b!1310694 res!870163) b!1310691))

(assert (= (and b!1310691 res!870162) b!1310696))

(assert (= (and b!1310696 res!870161) b!1310690))

(assert (= (and b!1310690 res!870159) b!1310692))

(assert (= (and b!1310695 condMapEmpty!54595) mapIsEmpty!54595))

(assert (= (and b!1310695 (not condMapEmpty!54595)) mapNonEmpty!54595))

(get-info :version)

(assert (= (and mapNonEmpty!54595 ((_ is ValueCellFull!16757) mapValue!54595)) b!1310693))

(assert (= (and b!1310695 ((_ is ValueCellFull!16757) mapDefault!54595)) b!1310689))

(assert (= start!110746 b!1310695))

(declare-fun m!1199937 () Bool)

(assert (=> b!1310692 m!1199937))

(assert (=> b!1310692 m!1199937))

(declare-fun m!1199939 () Bool)

(assert (=> b!1310692 m!1199939))

(declare-fun m!1199941 () Bool)

(assert (=> start!110746 m!1199941))

(declare-fun m!1199943 () Bool)

(assert (=> start!110746 m!1199943))

(declare-fun m!1199945 () Bool)

(assert (=> start!110746 m!1199945))

(declare-fun m!1199947 () Bool)

(assert (=> mapNonEmpty!54595 m!1199947))

(declare-fun m!1199949 () Bool)

(assert (=> b!1310691 m!1199949))

(declare-fun m!1199951 () Bool)

(assert (=> b!1310696 m!1199951))

(check-sat (not b_next!29581) (not mapNonEmpty!54595) (not b!1310692) b_and!47771 (not b!1310691) tp_is_empty!35311 (not b!1310696) (not start!110746))
(check-sat b_and!47771 (not b_next!29581))
