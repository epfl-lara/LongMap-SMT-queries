; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110614 () Bool)

(assert start!110614)

(declare-fun b_free!29449 () Bool)

(declare-fun b_next!29449 () Bool)

(assert (=> start!110614 (= b_free!29449 (not b_next!29449))))

(declare-fun tp!103670 () Bool)

(declare-fun b_and!47639 () Bool)

(assert (=> start!110614 (= tp!103670 b_and!47639)))

(declare-fun b!1308781 () Bool)

(declare-fun e!746695 () Bool)

(declare-fun e!746699 () Bool)

(declare-fun mapRes!54397 () Bool)

(assert (=> b!1308781 (= e!746695 (and e!746699 mapRes!54397))))

(declare-fun condMapEmpty!54397 () Bool)

(declare-datatypes ((V!52009 0))(
  ( (V!52010 (val!17664 Int)) )
))
(declare-datatypes ((ValueCell!16691 0))(
  ( (ValueCellFull!16691 (v!20290 V!52009)) (EmptyCell!16691) )
))
(declare-datatypes ((array!87273 0))(
  ( (array!87274 (arr!42117 (Array (_ BitVec 32) ValueCell!16691)) (size!42669 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87273)

(declare-fun mapDefault!54397 () ValueCell!16691)

(assert (=> b!1308781 (= condMapEmpty!54397 (= (arr!42117 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16691)) mapDefault!54397)))))

(declare-fun b!1308782 () Bool)

(declare-fun res!868846 () Bool)

(declare-fun e!746697 () Bool)

(assert (=> b!1308782 (=> (not res!868846) (not e!746697))))

(declare-datatypes ((array!87275 0))(
  ( (array!87276 (arr!42118 (Array (_ BitVec 32) (_ BitVec 64))) (size!42670 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87275)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308782 (= res!868846 (and (= (size!42669 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42670 _keys!1628) (size!42669 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54397 () Bool)

(declare-fun tp!103669 () Bool)

(declare-fun e!746696 () Bool)

(assert (=> mapNonEmpty!54397 (= mapRes!54397 (and tp!103669 e!746696))))

(declare-fun mapKey!54397 () (_ BitVec 32))

(declare-fun mapValue!54397 () ValueCell!16691)

(declare-fun mapRest!54397 () (Array (_ BitVec 32) ValueCell!16691))

(assert (=> mapNonEmpty!54397 (= (arr!42117 _values!1354) (store mapRest!54397 mapKey!54397 mapValue!54397))))

(declare-fun b!1308783 () Bool)

(declare-fun res!868848 () Bool)

(assert (=> b!1308783 (=> (not res!868848) (not e!746697))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308783 (= res!868848 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42670 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308784 () Bool)

(declare-fun res!868849 () Bool)

(assert (=> b!1308784 (=> (not res!868849) (not e!746697))))

(declare-datatypes ((List!29957 0))(
  ( (Nil!29954) (Cons!29953 (h!31162 (_ BitVec 64)) (t!43555 List!29957)) )
))
(declare-fun arrayNoDuplicates!0 (array!87275 (_ BitVec 32) List!29957) Bool)

(assert (=> b!1308784 (= res!868849 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29954))))

(declare-fun mapIsEmpty!54397 () Bool)

(assert (=> mapIsEmpty!54397 mapRes!54397))

(declare-fun res!868847 () Bool)

(assert (=> start!110614 (=> (not res!868847) (not e!746697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110614 (= res!868847 (validMask!0 mask!2040))))

(assert (=> start!110614 e!746697))

(assert (=> start!110614 tp!103670))

(declare-fun array_inv!32027 (array!87275) Bool)

(assert (=> start!110614 (array_inv!32027 _keys!1628)))

(assert (=> start!110614 true))

(declare-fun tp_is_empty!35179 () Bool)

(assert (=> start!110614 tp_is_empty!35179))

(declare-fun array_inv!32028 (array!87273) Bool)

(assert (=> start!110614 (and (array_inv!32028 _values!1354) e!746695)))

(declare-fun b!1308785 () Bool)

(assert (=> b!1308785 (= e!746696 tp_is_empty!35179)))

(declare-fun b!1308786 () Bool)

(declare-fun res!868845 () Bool)

(assert (=> b!1308786 (=> (not res!868845) (not e!746697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87275 (_ BitVec 32)) Bool)

(assert (=> b!1308786 (= res!868845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308787 () Bool)

(assert (=> b!1308787 (= e!746697 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52009)

(declare-fun zeroValue!1296 () V!52009)

(declare-fun lt!585006 () Bool)

(declare-datatypes ((tuple2!22830 0))(
  ( (tuple2!22831 (_1!11426 (_ BitVec 64)) (_2!11426 V!52009)) )
))
(declare-datatypes ((List!29958 0))(
  ( (Nil!29955) (Cons!29954 (h!31163 tuple2!22830) (t!43556 List!29958)) )
))
(declare-datatypes ((ListLongMap!20487 0))(
  ( (ListLongMap!20488 (toList!10259 List!29958)) )
))
(declare-fun contains!8336 (ListLongMap!20487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5154 (array!87275 array!87273 (_ BitVec 32) (_ BitVec 32) V!52009 V!52009 (_ BitVec 32) Int) ListLongMap!20487)

(assert (=> b!1308787 (= lt!585006 (contains!8336 (getCurrentListMap!5154 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308788 () Bool)

(assert (=> b!1308788 (= e!746699 tp_is_empty!35179)))

(assert (= (and start!110614 res!868847) b!1308782))

(assert (= (and b!1308782 res!868846) b!1308786))

(assert (= (and b!1308786 res!868845) b!1308784))

(assert (= (and b!1308784 res!868849) b!1308783))

(assert (= (and b!1308783 res!868848) b!1308787))

(assert (= (and b!1308781 condMapEmpty!54397) mapIsEmpty!54397))

(assert (= (and b!1308781 (not condMapEmpty!54397)) mapNonEmpty!54397))

(get-info :version)

(assert (= (and mapNonEmpty!54397 ((_ is ValueCellFull!16691) mapValue!54397)) b!1308785))

(assert (= (and b!1308781 ((_ is ValueCellFull!16691) mapDefault!54397)) b!1308788))

(assert (= start!110614 b!1308781))

(declare-fun m!1198611 () Bool)

(assert (=> b!1308784 m!1198611))

(declare-fun m!1198613 () Bool)

(assert (=> start!110614 m!1198613))

(declare-fun m!1198615 () Bool)

(assert (=> start!110614 m!1198615))

(declare-fun m!1198617 () Bool)

(assert (=> start!110614 m!1198617))

(declare-fun m!1198619 () Bool)

(assert (=> b!1308787 m!1198619))

(assert (=> b!1308787 m!1198619))

(declare-fun m!1198621 () Bool)

(assert (=> b!1308787 m!1198621))

(declare-fun m!1198623 () Bool)

(assert (=> b!1308786 m!1198623))

(declare-fun m!1198625 () Bool)

(assert (=> mapNonEmpty!54397 m!1198625))

(check-sat (not b!1308787) (not b!1308784) tp_is_empty!35179 b_and!47639 (not b!1308786) (not mapNonEmpty!54397) (not start!110614) (not b_next!29449))
(check-sat b_and!47639 (not b_next!29449))
