; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110962 () Bool)

(assert start!110962)

(declare-fun b_free!29797 () Bool)

(declare-fun b_next!29797 () Bool)

(assert (=> start!110962 (= b_free!29797 (not b_next!29797))))

(declare-fun tp!104713 () Bool)

(declare-fun b_and!47987 () Bool)

(assert (=> start!110962 (= tp!104713 b_and!47987)))

(declare-fun b!1313632 () Bool)

(declare-fun e!749309 () Bool)

(declare-fun tp_is_empty!35527 () Bool)

(assert (=> b!1313632 (= e!749309 tp_is_empty!35527)))

(declare-fun mapIsEmpty!54919 () Bool)

(declare-fun mapRes!54919 () Bool)

(assert (=> mapIsEmpty!54919 mapRes!54919))

(declare-fun b!1313633 () Bool)

(declare-fun res!872131 () Bool)

(declare-fun e!749306 () Bool)

(assert (=> b!1313633 (=> (not res!872131) (not e!749306))))

(declare-datatypes ((array!87935 0))(
  ( (array!87936 (arr!42448 (Array (_ BitVec 32) (_ BitVec 64))) (size!43000 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87935)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87935 (_ BitVec 32)) Bool)

(assert (=> b!1313633 (= res!872131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313634 () Bool)

(declare-fun e!749308 () Bool)

(assert (=> b!1313634 (= e!749308 tp_is_empty!35527)))

(declare-fun b!1313636 () Bool)

(declare-fun res!872133 () Bool)

(assert (=> b!1313636 (=> (not res!872133) (not e!749306))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313636 (= res!872133 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43000 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313635 () Bool)

(declare-fun e!749305 () Bool)

(assert (=> b!1313635 (= e!749305 (and e!749309 mapRes!54919))))

(declare-fun condMapEmpty!54919 () Bool)

(declare-datatypes ((V!52473 0))(
  ( (V!52474 (val!17838 Int)) )
))
(declare-datatypes ((ValueCell!16865 0))(
  ( (ValueCellFull!16865 (v!20464 V!52473)) (EmptyCell!16865) )
))
(declare-datatypes ((array!87937 0))(
  ( (array!87938 (arr!42449 (Array (_ BitVec 32) ValueCell!16865)) (size!43001 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87937)

(declare-fun mapDefault!54919 () ValueCell!16865)

(assert (=> b!1313635 (= condMapEmpty!54919 (= (arr!42449 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16865)) mapDefault!54919)))))

(declare-fun res!872130 () Bool)

(assert (=> start!110962 (=> (not res!872130) (not e!749306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110962 (= res!872130 (validMask!0 mask!2040))))

(assert (=> start!110962 e!749306))

(assert (=> start!110962 tp!104713))

(declare-fun array_inv!32255 (array!87935) Bool)

(assert (=> start!110962 (array_inv!32255 _keys!1628)))

(assert (=> start!110962 true))

(assert (=> start!110962 tp_is_empty!35527))

(declare-fun array_inv!32256 (array!87937) Bool)

(assert (=> start!110962 (and (array_inv!32256 _values!1354) e!749305)))

(declare-fun b!1313637 () Bool)

(assert (=> b!1313637 (= e!749306 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585519 () Bool)

(declare-fun minValue!1296 () V!52473)

(declare-fun zeroValue!1296 () V!52473)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23088 0))(
  ( (tuple2!23089 (_1!11555 (_ BitVec 64)) (_2!11555 V!52473)) )
))
(declare-datatypes ((List!30205 0))(
  ( (Nil!30202) (Cons!30201 (h!31410 tuple2!23088) (t!43803 List!30205)) )
))
(declare-datatypes ((ListLongMap!20745 0))(
  ( (ListLongMap!20746 (toList!10388 List!30205)) )
))
(declare-fun contains!8465 (ListLongMap!20745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5283 (array!87935 array!87937 (_ BitVec 32) (_ BitVec 32) V!52473 V!52473 (_ BitVec 32) Int) ListLongMap!20745)

(assert (=> b!1313637 (= lt!585519 (contains!8465 (getCurrentListMap!5283 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313638 () Bool)

(declare-fun res!872132 () Bool)

(assert (=> b!1313638 (=> (not res!872132) (not e!749306))))

(assert (=> b!1313638 (= res!872132 (and (= (size!43001 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43000 _keys!1628) (size!43001 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313639 () Bool)

(declare-fun res!872134 () Bool)

(assert (=> b!1313639 (=> (not res!872134) (not e!749306))))

(declare-datatypes ((List!30206 0))(
  ( (Nil!30203) (Cons!30202 (h!31411 (_ BitVec 64)) (t!43804 List!30206)) )
))
(declare-fun arrayNoDuplicates!0 (array!87935 (_ BitVec 32) List!30206) Bool)

(assert (=> b!1313639 (= res!872134 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30203))))

(declare-fun mapNonEmpty!54919 () Bool)

(declare-fun tp!104714 () Bool)

(assert (=> mapNonEmpty!54919 (= mapRes!54919 (and tp!104714 e!749308))))

(declare-fun mapValue!54919 () ValueCell!16865)

(declare-fun mapKey!54919 () (_ BitVec 32))

(declare-fun mapRest!54919 () (Array (_ BitVec 32) ValueCell!16865))

(assert (=> mapNonEmpty!54919 (= (arr!42449 _values!1354) (store mapRest!54919 mapKey!54919 mapValue!54919))))

(assert (= (and start!110962 res!872130) b!1313638))

(assert (= (and b!1313638 res!872132) b!1313633))

(assert (= (and b!1313633 res!872131) b!1313639))

(assert (= (and b!1313639 res!872134) b!1313636))

(assert (= (and b!1313636 res!872133) b!1313637))

(assert (= (and b!1313635 condMapEmpty!54919) mapIsEmpty!54919))

(assert (= (and b!1313635 (not condMapEmpty!54919)) mapNonEmpty!54919))

(get-info :version)

(assert (= (and mapNonEmpty!54919 ((_ is ValueCellFull!16865) mapValue!54919)) b!1313634))

(assert (= (and b!1313635 ((_ is ValueCellFull!16865) mapDefault!54919)) b!1313632))

(assert (= start!110962 b!1313635))

(declare-fun m!1201947 () Bool)

(assert (=> b!1313637 m!1201947))

(assert (=> b!1313637 m!1201947))

(declare-fun m!1201949 () Bool)

(assert (=> b!1313637 m!1201949))

(declare-fun m!1201951 () Bool)

(assert (=> mapNonEmpty!54919 m!1201951))

(declare-fun m!1201953 () Bool)

(assert (=> b!1313639 m!1201953))

(declare-fun m!1201955 () Bool)

(assert (=> start!110962 m!1201955))

(declare-fun m!1201957 () Bool)

(assert (=> start!110962 m!1201957))

(declare-fun m!1201959 () Bool)

(assert (=> start!110962 m!1201959))

(declare-fun m!1201961 () Bool)

(assert (=> b!1313633 m!1201961))

(check-sat b_and!47987 tp_is_empty!35527 (not b!1313633) (not b!1313637) (not b!1313639) (not start!110962) (not b_next!29797) (not mapNonEmpty!54919))
(check-sat b_and!47987 (not b_next!29797))
