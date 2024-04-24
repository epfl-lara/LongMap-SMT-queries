; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110742 () Bool)

(assert start!110742)

(declare-fun b_free!29353 () Bool)

(declare-fun b_next!29353 () Bool)

(assert (=> start!110742 (= b_free!29353 (not b_next!29353))))

(declare-fun tp!103381 () Bool)

(declare-fun b_and!47563 () Bool)

(assert (=> start!110742 (= tp!103381 b_and!47563)))

(declare-fun b!1308674 () Bool)

(declare-fun res!868351 () Bool)

(declare-fun e!746854 () Bool)

(assert (=> b!1308674 (=> (not res!868351) (not e!746854))))

(declare-datatypes ((array!87229 0))(
  ( (array!87230 (arr!42090 (Array (_ BitVec 32) (_ BitVec 64))) (size!42641 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87229)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51881 0))(
  ( (V!51882 (val!17616 Int)) )
))
(declare-datatypes ((ValueCell!16643 0))(
  ( (ValueCellFull!16643 (v!20238 V!51881)) (EmptyCell!16643) )
))
(declare-datatypes ((array!87231 0))(
  ( (array!87232 (arr!42091 (Array (_ BitVec 32) ValueCell!16643)) (size!42642 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87231)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308674 (= res!868351 (and (= (size!42642 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42641 _keys!1628) (size!42642 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308675 () Bool)

(declare-fun res!868349 () Bool)

(assert (=> b!1308675 (=> (not res!868349) (not e!746854))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308675 (= res!868349 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42641 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308676 () Bool)

(declare-fun res!868350 () Bool)

(assert (=> b!1308676 (=> (not res!868350) (not e!746854))))

(declare-datatypes ((List!29874 0))(
  ( (Nil!29871) (Cons!29870 (h!31088 (_ BitVec 64)) (t!43472 List!29874)) )
))
(declare-fun arrayNoDuplicates!0 (array!87229 (_ BitVec 32) List!29874) Bool)

(assert (=> b!1308676 (= res!868350 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29871))))

(declare-fun b!1308677 () Bool)

(assert (=> b!1308677 (= e!746854 false)))

(declare-fun lt!585524 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51881)

(declare-fun zeroValue!1296 () V!51881)

(declare-datatypes ((tuple2!22708 0))(
  ( (tuple2!22709 (_1!11365 (_ BitVec 64)) (_2!11365 V!51881)) )
))
(declare-datatypes ((List!29875 0))(
  ( (Nil!29872) (Cons!29871 (h!31089 tuple2!22708) (t!43473 List!29875)) )
))
(declare-datatypes ((ListLongMap!20373 0))(
  ( (ListLongMap!20374 (toList!10202 List!29875)) )
))
(declare-fun contains!8364 (ListLongMap!20373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5206 (array!87229 array!87231 (_ BitVec 32) (_ BitVec 32) V!51881 V!51881 (_ BitVec 32) Int) ListLongMap!20373)

(assert (=> b!1308677 (= lt!585524 (contains!8364 (getCurrentListMap!5206 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308678 () Bool)

(declare-fun e!746851 () Bool)

(declare-fun tp_is_empty!35083 () Bool)

(assert (=> b!1308678 (= e!746851 tp_is_empty!35083)))

(declare-fun b!1308679 () Bool)

(declare-fun e!746852 () Bool)

(assert (=> b!1308679 (= e!746852 tp_is_empty!35083)))

(declare-fun b!1308680 () Bool)

(declare-fun res!868352 () Bool)

(assert (=> b!1308680 (=> (not res!868352) (not e!746854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87229 (_ BitVec 32)) Bool)

(assert (=> b!1308680 (= res!868352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54253 () Bool)

(declare-fun mapRes!54253 () Bool)

(assert (=> mapIsEmpty!54253 mapRes!54253))

(declare-fun b!1308681 () Bool)

(declare-fun e!746855 () Bool)

(assert (=> b!1308681 (= e!746855 (and e!746852 mapRes!54253))))

(declare-fun condMapEmpty!54253 () Bool)

(declare-fun mapDefault!54253 () ValueCell!16643)

(assert (=> b!1308681 (= condMapEmpty!54253 (= (arr!42091 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16643)) mapDefault!54253)))))

(declare-fun mapNonEmpty!54253 () Bool)

(declare-fun tp!103380 () Bool)

(assert (=> mapNonEmpty!54253 (= mapRes!54253 (and tp!103380 e!746851))))

(declare-fun mapValue!54253 () ValueCell!16643)

(declare-fun mapRest!54253 () (Array (_ BitVec 32) ValueCell!16643))

(declare-fun mapKey!54253 () (_ BitVec 32))

(assert (=> mapNonEmpty!54253 (= (arr!42091 _values!1354) (store mapRest!54253 mapKey!54253 mapValue!54253))))

(declare-fun res!868348 () Bool)

(assert (=> start!110742 (=> (not res!868348) (not e!746854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110742 (= res!868348 (validMask!0 mask!2040))))

(assert (=> start!110742 e!746854))

(assert (=> start!110742 tp!103381))

(declare-fun array_inv!32069 (array!87229) Bool)

(assert (=> start!110742 (array_inv!32069 _keys!1628)))

(assert (=> start!110742 true))

(assert (=> start!110742 tp_is_empty!35083))

(declare-fun array_inv!32070 (array!87231) Bool)

(assert (=> start!110742 (and (array_inv!32070 _values!1354) e!746855)))

(assert (= (and start!110742 res!868348) b!1308674))

(assert (= (and b!1308674 res!868351) b!1308680))

(assert (= (and b!1308680 res!868352) b!1308676))

(assert (= (and b!1308676 res!868350) b!1308675))

(assert (= (and b!1308675 res!868349) b!1308677))

(assert (= (and b!1308681 condMapEmpty!54253) mapIsEmpty!54253))

(assert (= (and b!1308681 (not condMapEmpty!54253)) mapNonEmpty!54253))

(get-info :version)

(assert (= (and mapNonEmpty!54253 ((_ is ValueCellFull!16643) mapValue!54253)) b!1308678))

(assert (= (and b!1308681 ((_ is ValueCellFull!16643) mapDefault!54253)) b!1308679))

(assert (= start!110742 b!1308681))

(declare-fun m!1199687 () Bool)

(assert (=> mapNonEmpty!54253 m!1199687))

(declare-fun m!1199689 () Bool)

(assert (=> start!110742 m!1199689))

(declare-fun m!1199691 () Bool)

(assert (=> start!110742 m!1199691))

(declare-fun m!1199693 () Bool)

(assert (=> start!110742 m!1199693))

(declare-fun m!1199695 () Bool)

(assert (=> b!1308676 m!1199695))

(declare-fun m!1199697 () Bool)

(assert (=> b!1308677 m!1199697))

(assert (=> b!1308677 m!1199697))

(declare-fun m!1199699 () Bool)

(assert (=> b!1308677 m!1199699))

(declare-fun m!1199701 () Bool)

(assert (=> b!1308680 m!1199701))

(check-sat (not start!110742) b_and!47563 (not b!1308676) (not mapNonEmpty!54253) (not b_next!29353) (not b!1308677) (not b!1308680) tp_is_empty!35083)
(check-sat b_and!47563 (not b_next!29353))
