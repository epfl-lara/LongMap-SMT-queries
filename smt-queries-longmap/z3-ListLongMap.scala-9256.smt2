; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110884 () Bool)

(assert start!110884)

(declare-fun b_free!29719 () Bool)

(declare-fun b_next!29719 () Bool)

(assert (=> start!110884 (= b_free!29719 (not b_next!29719))))

(declare-fun tp!104479 () Bool)

(declare-fun b_and!47909 () Bool)

(assert (=> start!110884 (= tp!104479 b_and!47909)))

(declare-fun mapNonEmpty!54802 () Bool)

(declare-fun mapRes!54802 () Bool)

(declare-fun tp!104480 () Bool)

(declare-fun e!748720 () Bool)

(assert (=> mapNonEmpty!54802 (= mapRes!54802 (and tp!104480 e!748720))))

(declare-datatypes ((V!52369 0))(
  ( (V!52370 (val!17799 Int)) )
))
(declare-datatypes ((ValueCell!16826 0))(
  ( (ValueCellFull!16826 (v!20425 V!52369)) (EmptyCell!16826) )
))
(declare-fun mapValue!54802 () ValueCell!16826)

(declare-fun mapRest!54802 () (Array (_ BitVec 32) ValueCell!16826))

(declare-datatypes ((array!87785 0))(
  ( (array!87786 (arr!42373 (Array (_ BitVec 32) ValueCell!16826)) (size!42925 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87785)

(declare-fun mapKey!54802 () (_ BitVec 32))

(assert (=> mapNonEmpty!54802 (= (arr!42373 _values!1354) (store mapRest!54802 mapKey!54802 mapValue!54802))))

(declare-fun b!1312669 () Bool)

(declare-fun e!748723 () Bool)

(declare-fun tp_is_empty!35449 () Bool)

(assert (=> b!1312669 (= e!748723 tp_is_empty!35449)))

(declare-fun b!1312670 () Bool)

(declare-fun e!748722 () Bool)

(assert (=> b!1312670 (= e!748722 (and e!748723 mapRes!54802))))

(declare-fun condMapEmpty!54802 () Bool)

(declare-fun mapDefault!54802 () ValueCell!16826)

(assert (=> b!1312670 (= condMapEmpty!54802 (= (arr!42373 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16826)) mapDefault!54802)))))

(declare-fun b!1312671 () Bool)

(declare-fun res!871521 () Bool)

(declare-fun e!748721 () Bool)

(assert (=> b!1312671 (=> (not res!871521) (not e!748721))))

(declare-datatypes ((array!87787 0))(
  ( (array!87788 (arr!42374 (Array (_ BitVec 32) (_ BitVec 64))) (size!42926 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87787)

(declare-datatypes ((List!30151 0))(
  ( (Nil!30148) (Cons!30147 (h!31356 (_ BitVec 64)) (t!43749 List!30151)) )
))
(declare-fun arrayNoDuplicates!0 (array!87787 (_ BitVec 32) List!30151) Bool)

(assert (=> b!1312671 (= res!871521 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30148))))

(declare-fun mapIsEmpty!54802 () Bool)

(assert (=> mapIsEmpty!54802 mapRes!54802))

(declare-fun b!1312672 () Bool)

(declare-fun res!871522 () Bool)

(assert (=> b!1312672 (=> (not res!871522) (not e!748721))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312672 (= res!871522 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42926 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312673 () Bool)

(assert (=> b!1312673 (= e!748721 false)))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52369)

(declare-fun zeroValue!1296 () V!52369)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585411 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!23034 0))(
  ( (tuple2!23035 (_1!11528 (_ BitVec 64)) (_2!11528 V!52369)) )
))
(declare-datatypes ((List!30152 0))(
  ( (Nil!30149) (Cons!30148 (h!31357 tuple2!23034) (t!43750 List!30152)) )
))
(declare-datatypes ((ListLongMap!20691 0))(
  ( (ListLongMap!20692 (toList!10361 List!30152)) )
))
(declare-fun contains!8438 (ListLongMap!20691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5256 (array!87787 array!87785 (_ BitVec 32) (_ BitVec 32) V!52369 V!52369 (_ BitVec 32) Int) ListLongMap!20691)

(assert (=> b!1312673 (= lt!585411 (contains!8438 (getCurrentListMap!5256 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!871520 () Bool)

(assert (=> start!110884 (=> (not res!871520) (not e!748721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110884 (= res!871520 (validMask!0 mask!2040))))

(assert (=> start!110884 e!748721))

(assert (=> start!110884 tp!104479))

(declare-fun array_inv!32203 (array!87787) Bool)

(assert (=> start!110884 (array_inv!32203 _keys!1628)))

(assert (=> start!110884 true))

(assert (=> start!110884 tp_is_empty!35449))

(declare-fun array_inv!32204 (array!87785) Bool)

(assert (=> start!110884 (and (array_inv!32204 _values!1354) e!748722)))

(declare-fun b!1312674 () Bool)

(assert (=> b!1312674 (= e!748720 tp_is_empty!35449)))

(declare-fun b!1312675 () Bool)

(declare-fun res!871518 () Bool)

(assert (=> b!1312675 (=> (not res!871518) (not e!748721))))

(assert (=> b!1312675 (= res!871518 (and (= (size!42925 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42926 _keys!1628) (size!42925 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312676 () Bool)

(declare-fun res!871519 () Bool)

(assert (=> b!1312676 (=> (not res!871519) (not e!748721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87787 (_ BitVec 32)) Bool)

(assert (=> b!1312676 (= res!871519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110884 res!871520) b!1312675))

(assert (= (and b!1312675 res!871518) b!1312676))

(assert (= (and b!1312676 res!871519) b!1312671))

(assert (= (and b!1312671 res!871521) b!1312672))

(assert (= (and b!1312672 res!871522) b!1312673))

(assert (= (and b!1312670 condMapEmpty!54802) mapIsEmpty!54802))

(assert (= (and b!1312670 (not condMapEmpty!54802)) mapNonEmpty!54802))

(get-info :version)

(assert (= (and mapNonEmpty!54802 ((_ is ValueCellFull!16826) mapValue!54802)) b!1312674))

(assert (= (and b!1312670 ((_ is ValueCellFull!16826) mapDefault!54802)) b!1312669))

(assert (= start!110884 b!1312670))

(declare-fun m!1201311 () Bool)

(assert (=> b!1312671 m!1201311))

(declare-fun m!1201313 () Bool)

(assert (=> mapNonEmpty!54802 m!1201313))

(declare-fun m!1201315 () Bool)

(assert (=> start!110884 m!1201315))

(declare-fun m!1201317 () Bool)

(assert (=> start!110884 m!1201317))

(declare-fun m!1201319 () Bool)

(assert (=> start!110884 m!1201319))

(declare-fun m!1201321 () Bool)

(assert (=> b!1312673 m!1201321))

(assert (=> b!1312673 m!1201321))

(declare-fun m!1201323 () Bool)

(assert (=> b!1312673 m!1201323))

(declare-fun m!1201325 () Bool)

(assert (=> b!1312676 m!1201325))

(check-sat (not b!1312671) (not mapNonEmpty!54802) (not start!110884) tp_is_empty!35449 b_and!47909 (not b!1312673) (not b_next!29719) (not b!1312676))
(check-sat b_and!47909 (not b_next!29719))
