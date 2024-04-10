; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110886 () Bool)

(assert start!110886)

(declare-fun b_free!29721 () Bool)

(declare-fun b_next!29721 () Bool)

(assert (=> start!110886 (= b_free!29721 (not b_next!29721))))

(declare-fun tp!104485 () Bool)

(declare-fun b_and!47929 () Bool)

(assert (=> start!110886 (= tp!104485 b_and!47929)))

(declare-fun b!1312763 () Bool)

(declare-fun e!748771 () Bool)

(declare-fun tp_is_empty!35451 () Bool)

(assert (=> b!1312763 (= e!748771 tp_is_empty!35451)))

(declare-fun b!1312764 () Bool)

(declare-fun res!871562 () Bool)

(declare-fun e!748769 () Bool)

(assert (=> b!1312764 (=> (not res!871562) (not e!748769))))

(declare-datatypes ((array!87884 0))(
  ( (array!87885 (arr!42422 (Array (_ BitVec 32) (_ BitVec 64))) (size!42972 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87884)

(declare-datatypes ((List!30084 0))(
  ( (Nil!30081) (Cons!30080 (h!31289 (_ BitVec 64)) (t!43690 List!30084)) )
))
(declare-fun arrayNoDuplicates!0 (array!87884 (_ BitVec 32) List!30084) Bool)

(assert (=> b!1312764 (= res!871562 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30081))))

(declare-fun b!1312765 () Bool)

(declare-fun res!871566 () Bool)

(assert (=> b!1312765 (=> (not res!871566) (not e!748769))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87884 (_ BitVec 32)) Bool)

(assert (=> b!1312765 (= res!871566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54805 () Bool)

(declare-fun mapRes!54805 () Bool)

(assert (=> mapIsEmpty!54805 mapRes!54805))

(declare-fun b!1312766 () Bool)

(assert (=> b!1312766 (= e!748769 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52371 0))(
  ( (V!52372 (val!17800 Int)) )
))
(declare-fun minValue!1296 () V!52371)

(declare-fun zeroValue!1296 () V!52371)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585600 () Bool)

(declare-datatypes ((ValueCell!16827 0))(
  ( (ValueCellFull!16827 (v!20427 V!52371)) (EmptyCell!16827) )
))
(declare-datatypes ((array!87886 0))(
  ( (array!87887 (arr!42423 (Array (_ BitVec 32) ValueCell!16827)) (size!42973 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87886)

(declare-datatypes ((tuple2!22946 0))(
  ( (tuple2!22947 (_1!11484 (_ BitVec 64)) (_2!11484 V!52371)) )
))
(declare-datatypes ((List!30085 0))(
  ( (Nil!30082) (Cons!30081 (h!31290 tuple2!22946) (t!43691 List!30085)) )
))
(declare-datatypes ((ListLongMap!20603 0))(
  ( (ListLongMap!20604 (toList!10317 List!30085)) )
))
(declare-fun contains!8467 (ListLongMap!20603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5330 (array!87884 array!87886 (_ BitVec 32) (_ BitVec 32) V!52371 V!52371 (_ BitVec 32) Int) ListLongMap!20603)

(assert (=> b!1312766 (= lt!585600 (contains!8467 (getCurrentListMap!5330 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!871563 () Bool)

(assert (=> start!110886 (=> (not res!871563) (not e!748769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110886 (= res!871563 (validMask!0 mask!2040))))

(assert (=> start!110886 e!748769))

(assert (=> start!110886 tp!104485))

(declare-fun array_inv!32051 (array!87884) Bool)

(assert (=> start!110886 (array_inv!32051 _keys!1628)))

(assert (=> start!110886 true))

(assert (=> start!110886 tp_is_empty!35451))

(declare-fun e!748772 () Bool)

(declare-fun array_inv!32052 (array!87886) Bool)

(assert (=> start!110886 (and (array_inv!32052 _values!1354) e!748772)))

(declare-fun mapNonEmpty!54805 () Bool)

(declare-fun tp!104484 () Bool)

(declare-fun e!748768 () Bool)

(assert (=> mapNonEmpty!54805 (= mapRes!54805 (and tp!104484 e!748768))))

(declare-fun mapValue!54805 () ValueCell!16827)

(declare-fun mapKey!54805 () (_ BitVec 32))

(declare-fun mapRest!54805 () (Array (_ BitVec 32) ValueCell!16827))

(assert (=> mapNonEmpty!54805 (= (arr!42423 _values!1354) (store mapRest!54805 mapKey!54805 mapValue!54805))))

(declare-fun b!1312767 () Bool)

(assert (=> b!1312767 (= e!748768 tp_is_empty!35451)))

(declare-fun b!1312768 () Bool)

(assert (=> b!1312768 (= e!748772 (and e!748771 mapRes!54805))))

(declare-fun condMapEmpty!54805 () Bool)

(declare-fun mapDefault!54805 () ValueCell!16827)

(assert (=> b!1312768 (= condMapEmpty!54805 (= (arr!42423 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16827)) mapDefault!54805)))))

(declare-fun b!1312769 () Bool)

(declare-fun res!871564 () Bool)

(assert (=> b!1312769 (=> (not res!871564) (not e!748769))))

(assert (=> b!1312769 (= res!871564 (and (= (size!42973 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42972 _keys!1628) (size!42973 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312770 () Bool)

(declare-fun res!871565 () Bool)

(assert (=> b!1312770 (=> (not res!871565) (not e!748769))))

(assert (=> b!1312770 (= res!871565 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42972 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110886 res!871563) b!1312769))

(assert (= (and b!1312769 res!871564) b!1312765))

(assert (= (and b!1312765 res!871566) b!1312764))

(assert (= (and b!1312764 res!871562) b!1312770))

(assert (= (and b!1312770 res!871565) b!1312766))

(assert (= (and b!1312768 condMapEmpty!54805) mapIsEmpty!54805))

(assert (= (and b!1312768 (not condMapEmpty!54805)) mapNonEmpty!54805))

(get-info :version)

(assert (= (and mapNonEmpty!54805 ((_ is ValueCellFull!16827) mapValue!54805)) b!1312767))

(assert (= (and b!1312768 ((_ is ValueCellFull!16827) mapDefault!54805)) b!1312763))

(assert (= start!110886 b!1312768))

(declare-fun m!1201843 () Bool)

(assert (=> mapNonEmpty!54805 m!1201843))

(declare-fun m!1201845 () Bool)

(assert (=> b!1312764 m!1201845))

(declare-fun m!1201847 () Bool)

(assert (=> b!1312765 m!1201847))

(declare-fun m!1201849 () Bool)

(assert (=> start!110886 m!1201849))

(declare-fun m!1201851 () Bool)

(assert (=> start!110886 m!1201851))

(declare-fun m!1201853 () Bool)

(assert (=> start!110886 m!1201853))

(declare-fun m!1201855 () Bool)

(assert (=> b!1312766 m!1201855))

(assert (=> b!1312766 m!1201855))

(declare-fun m!1201857 () Bool)

(assert (=> b!1312766 m!1201857))

(check-sat b_and!47929 (not start!110886) (not b!1312765) (not b!1312766) tp_is_empty!35451 (not mapNonEmpty!54805) (not b_next!29721) (not b!1312764))
(check-sat b_and!47929 (not b_next!29721))
