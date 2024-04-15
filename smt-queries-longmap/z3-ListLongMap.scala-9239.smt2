; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110782 () Bool)

(assert start!110782)

(declare-fun b_free!29617 () Bool)

(declare-fun b_next!29617 () Bool)

(assert (=> start!110782 (= b_free!29617 (not b_next!29617))))

(declare-fun tp!104174 () Bool)

(declare-fun b_and!47807 () Bool)

(assert (=> start!110782 (= tp!104174 b_and!47807)))

(declare-fun mapIsEmpty!54649 () Bool)

(declare-fun mapRes!54649 () Bool)

(assert (=> mapIsEmpty!54649 mapRes!54649))

(declare-fun b!1311121 () Bool)

(declare-fun res!870431 () Bool)

(declare-fun e!747957 () Bool)

(assert (=> b!1311121 (=> (not res!870431) (not e!747957))))

(declare-datatypes ((array!87593 0))(
  ( (array!87594 (arr!42277 (Array (_ BitVec 32) (_ BitVec 64))) (size!42829 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87593)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311121 (= res!870431 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42829 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311122 () Bool)

(declare-fun res!870430 () Bool)

(assert (=> b!1311122 (=> (not res!870430) (not e!747957))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87593 (_ BitVec 32)) Bool)

(assert (=> b!1311122 (= res!870430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311123 () Bool)

(declare-fun e!747955 () Bool)

(declare-fun tp_is_empty!35347 () Bool)

(assert (=> b!1311123 (= e!747955 tp_is_empty!35347)))

(declare-fun b!1311124 () Bool)

(assert (=> b!1311124 (= e!747957 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!52233 0))(
  ( (V!52234 (val!17748 Int)) )
))
(declare-fun minValue!1296 () V!52233)

(declare-datatypes ((ValueCell!16775 0))(
  ( (ValueCellFull!16775 (v!20374 V!52233)) (EmptyCell!16775) )
))
(declare-datatypes ((array!87595 0))(
  ( (array!87596 (arr!42278 (Array (_ BitVec 32) ValueCell!16775)) (size!42830 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87595)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585258 () Bool)

(declare-fun zeroValue!1296 () V!52233)

(declare-datatypes ((tuple2!22954 0))(
  ( (tuple2!22955 (_1!11488 (_ BitVec 64)) (_2!11488 V!52233)) )
))
(declare-datatypes ((List!30077 0))(
  ( (Nil!30074) (Cons!30073 (h!31282 tuple2!22954) (t!43675 List!30077)) )
))
(declare-datatypes ((ListLongMap!20611 0))(
  ( (ListLongMap!20612 (toList!10321 List!30077)) )
))
(declare-fun contains!8398 (ListLongMap!20611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5216 (array!87593 array!87595 (_ BitVec 32) (_ BitVec 32) V!52233 V!52233 (_ BitVec 32) Int) ListLongMap!20611)

(assert (=> b!1311124 (= lt!585258 (contains!8398 (getCurrentListMap!5216 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54649 () Bool)

(declare-fun tp!104173 () Bool)

(assert (=> mapNonEmpty!54649 (= mapRes!54649 (and tp!104173 e!747955))))

(declare-fun mapRest!54649 () (Array (_ BitVec 32) ValueCell!16775))

(declare-fun mapValue!54649 () ValueCell!16775)

(declare-fun mapKey!54649 () (_ BitVec 32))

(assert (=> mapNonEmpty!54649 (= (arr!42278 _values!1354) (store mapRest!54649 mapKey!54649 mapValue!54649))))

(declare-fun b!1311125 () Bool)

(declare-fun res!870429 () Bool)

(assert (=> b!1311125 (=> (not res!870429) (not e!747957))))

(declare-datatypes ((List!30078 0))(
  ( (Nil!30075) (Cons!30074 (h!31283 (_ BitVec 64)) (t!43676 List!30078)) )
))
(declare-fun arrayNoDuplicates!0 (array!87593 (_ BitVec 32) List!30078) Bool)

(assert (=> b!1311125 (= res!870429 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30075))))

(declare-fun b!1311126 () Bool)

(declare-fun e!747958 () Bool)

(assert (=> b!1311126 (= e!747958 tp_is_empty!35347)))

(declare-fun b!1311128 () Bool)

(declare-fun res!870432 () Bool)

(assert (=> b!1311128 (=> (not res!870432) (not e!747957))))

(assert (=> b!1311128 (= res!870432 (and (= (size!42830 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42829 _keys!1628) (size!42830 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!870433 () Bool)

(assert (=> start!110782 (=> (not res!870433) (not e!747957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110782 (= res!870433 (validMask!0 mask!2040))))

(assert (=> start!110782 e!747957))

(assert (=> start!110782 tp!104174))

(declare-fun array_inv!32129 (array!87593) Bool)

(assert (=> start!110782 (array_inv!32129 _keys!1628)))

(assert (=> start!110782 true))

(assert (=> start!110782 tp_is_empty!35347))

(declare-fun e!747959 () Bool)

(declare-fun array_inv!32130 (array!87595) Bool)

(assert (=> start!110782 (and (array_inv!32130 _values!1354) e!747959)))

(declare-fun b!1311127 () Bool)

(assert (=> b!1311127 (= e!747959 (and e!747958 mapRes!54649))))

(declare-fun condMapEmpty!54649 () Bool)

(declare-fun mapDefault!54649 () ValueCell!16775)

(assert (=> b!1311127 (= condMapEmpty!54649 (= (arr!42278 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16775)) mapDefault!54649)))))

(assert (= (and start!110782 res!870433) b!1311128))

(assert (= (and b!1311128 res!870432) b!1311122))

(assert (= (and b!1311122 res!870430) b!1311125))

(assert (= (and b!1311125 res!870429) b!1311121))

(assert (= (and b!1311121 res!870431) b!1311124))

(assert (= (and b!1311127 condMapEmpty!54649) mapIsEmpty!54649))

(assert (= (and b!1311127 (not condMapEmpty!54649)) mapNonEmpty!54649))

(get-info :version)

(assert (= (and mapNonEmpty!54649 ((_ is ValueCellFull!16775) mapValue!54649)) b!1311123))

(assert (= (and b!1311127 ((_ is ValueCellFull!16775) mapDefault!54649)) b!1311126))

(assert (= start!110782 b!1311127))

(declare-fun m!1200225 () Bool)

(assert (=> b!1311125 m!1200225))

(declare-fun m!1200227 () Bool)

(assert (=> b!1311122 m!1200227))

(declare-fun m!1200229 () Bool)

(assert (=> start!110782 m!1200229))

(declare-fun m!1200231 () Bool)

(assert (=> start!110782 m!1200231))

(declare-fun m!1200233 () Bool)

(assert (=> start!110782 m!1200233))

(declare-fun m!1200235 () Bool)

(assert (=> mapNonEmpty!54649 m!1200235))

(declare-fun m!1200237 () Bool)

(assert (=> b!1311124 m!1200237))

(assert (=> b!1311124 m!1200237))

(declare-fun m!1200239 () Bool)

(assert (=> b!1311124 m!1200239))

(check-sat b_and!47807 (not start!110782) (not mapNonEmpty!54649) tp_is_empty!35347 (not b!1311125) (not b_next!29617) (not b!1311124) (not b!1311122))
(check-sat b_and!47807 (not b_next!29617))
