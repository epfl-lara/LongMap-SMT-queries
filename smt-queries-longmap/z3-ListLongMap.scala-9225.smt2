; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110698 () Bool)

(assert start!110698)

(declare-fun b_free!29533 () Bool)

(declare-fun b_next!29533 () Bool)

(assert (=> start!110698 (= b_free!29533 (not b_next!29533))))

(declare-fun tp!103922 () Bool)

(declare-fun b_and!47723 () Bool)

(assert (=> start!110698 (= tp!103922 b_and!47723)))

(declare-fun mapIsEmpty!54523 () Bool)

(declare-fun mapRes!54523 () Bool)

(assert (=> mapIsEmpty!54523 mapRes!54523))

(declare-fun b!1309869 () Bool)

(declare-fun res!869556 () Bool)

(declare-fun e!747325 () Bool)

(assert (=> b!1309869 (=> (not res!869556) (not e!747325))))

(declare-datatypes ((array!87431 0))(
  ( (array!87432 (arr!42196 (Array (_ BitVec 32) (_ BitVec 64))) (size!42748 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87431)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309869 (= res!869556 (validKeyInArray!0 (select (arr!42196 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!54523 () Bool)

(declare-fun tp!103921 () Bool)

(declare-fun e!747327 () Bool)

(assert (=> mapNonEmpty!54523 (= mapRes!54523 (and tp!103921 e!747327))))

(declare-fun mapKey!54523 () (_ BitVec 32))

(declare-datatypes ((V!52121 0))(
  ( (V!52122 (val!17706 Int)) )
))
(declare-datatypes ((ValueCell!16733 0))(
  ( (ValueCellFull!16733 (v!20332 V!52121)) (EmptyCell!16733) )
))
(declare-datatypes ((array!87433 0))(
  ( (array!87434 (arr!42197 (Array (_ BitVec 32) ValueCell!16733)) (size!42749 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87433)

(declare-fun mapValue!54523 () ValueCell!16733)

(declare-fun mapRest!54523 () (Array (_ BitVec 32) ValueCell!16733))

(assert (=> mapNonEmpty!54523 (= (arr!42197 _values!1354) (store mapRest!54523 mapKey!54523 mapValue!54523))))

(declare-fun b!1309870 () Bool)

(declare-fun e!747328 () Bool)

(declare-fun tp_is_empty!35263 () Bool)

(assert (=> b!1309870 (= e!747328 tp_is_empty!35263)))

(declare-fun b!1309871 () Bool)

(assert (=> b!1309871 (= e!747325 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52121)

(declare-fun zeroValue!1296 () V!52121)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22894 0))(
  ( (tuple2!22895 (_1!11458 (_ BitVec 64)) (_2!11458 V!52121)) )
))
(declare-datatypes ((List!30019 0))(
  ( (Nil!30016) (Cons!30015 (h!31224 tuple2!22894) (t!43617 List!30019)) )
))
(declare-datatypes ((ListLongMap!20551 0))(
  ( (ListLongMap!20552 (toList!10291 List!30019)) )
))
(declare-fun contains!8368 (ListLongMap!20551 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5186 (array!87431 array!87433 (_ BitVec 32) (_ BitVec 32) V!52121 V!52121 (_ BitVec 32) Int) ListLongMap!20551)

(assert (=> b!1309871 (contains!8368 (getCurrentListMap!5186 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43157 0))(
  ( (Unit!43158) )
))
(declare-fun lt!585132 () Unit!43157)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!5 (array!87431 array!87433 (_ BitVec 32) (_ BitVec 32) V!52121 V!52121 (_ BitVec 64) (_ BitVec 32) Int) Unit!43157)

(assert (=> b!1309871 (= lt!585132 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!5 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309872 () Bool)

(declare-fun res!869557 () Bool)

(assert (=> b!1309872 (=> (not res!869557) (not e!747325))))

(assert (=> b!1309872 (= res!869557 (not (= (select (arr!42196 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309873 () Bool)

(declare-fun res!869562 () Bool)

(assert (=> b!1309873 (=> (not res!869562) (not e!747325))))

(assert (=> b!1309873 (= res!869562 (contains!8368 (getCurrentListMap!5186 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309874 () Bool)

(declare-fun res!869560 () Bool)

(assert (=> b!1309874 (=> (not res!869560) (not e!747325))))

(assert (=> b!1309874 (= res!869560 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1309875 () Bool)

(declare-fun res!869555 () Bool)

(assert (=> b!1309875 (=> (not res!869555) (not e!747325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87431 (_ BitVec 32)) Bool)

(assert (=> b!1309875 (= res!869555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309876 () Bool)

(assert (=> b!1309876 (= e!747327 tp_is_empty!35263)))

(declare-fun b!1309877 () Bool)

(declare-fun res!869563 () Bool)

(assert (=> b!1309877 (=> (not res!869563) (not e!747325))))

(declare-datatypes ((List!30020 0))(
  ( (Nil!30017) (Cons!30016 (h!31225 (_ BitVec 64)) (t!43618 List!30020)) )
))
(declare-fun arrayNoDuplicates!0 (array!87431 (_ BitVec 32) List!30020) Bool)

(assert (=> b!1309877 (= res!869563 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30017))))

(declare-fun res!869558 () Bool)

(assert (=> start!110698 (=> (not res!869558) (not e!747325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110698 (= res!869558 (validMask!0 mask!2040))))

(assert (=> start!110698 e!747325))

(assert (=> start!110698 tp!103922))

(declare-fun array_inv!32075 (array!87431) Bool)

(assert (=> start!110698 (array_inv!32075 _keys!1628)))

(assert (=> start!110698 true))

(assert (=> start!110698 tp_is_empty!35263))

(declare-fun e!747329 () Bool)

(declare-fun array_inv!32076 (array!87433) Bool)

(assert (=> start!110698 (and (array_inv!32076 _values!1354) e!747329)))

(declare-fun b!1309878 () Bool)

(assert (=> b!1309878 (= e!747329 (and e!747328 mapRes!54523))))

(declare-fun condMapEmpty!54523 () Bool)

(declare-fun mapDefault!54523 () ValueCell!16733)

(assert (=> b!1309878 (= condMapEmpty!54523 (= (arr!42197 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16733)) mapDefault!54523)))))

(declare-fun b!1309879 () Bool)

(declare-fun res!869561 () Bool)

(assert (=> b!1309879 (=> (not res!869561) (not e!747325))))

(assert (=> b!1309879 (= res!869561 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42748 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309880 () Bool)

(declare-fun res!869559 () Bool)

(assert (=> b!1309880 (=> (not res!869559) (not e!747325))))

(assert (=> b!1309880 (= res!869559 (and (= (size!42749 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42748 _keys!1628) (size!42749 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110698 res!869558) b!1309880))

(assert (= (and b!1309880 res!869559) b!1309875))

(assert (= (and b!1309875 res!869555) b!1309877))

(assert (= (and b!1309877 res!869563) b!1309879))

(assert (= (and b!1309879 res!869561) b!1309873))

(assert (= (and b!1309873 res!869562) b!1309872))

(assert (= (and b!1309872 res!869557) b!1309869))

(assert (= (and b!1309869 res!869556) b!1309874))

(assert (= (and b!1309874 res!869560) b!1309871))

(assert (= (and b!1309878 condMapEmpty!54523) mapIsEmpty!54523))

(assert (= (and b!1309878 (not condMapEmpty!54523)) mapNonEmpty!54523))

(get-info :version)

(assert (= (and mapNonEmpty!54523 ((_ is ValueCellFull!16733) mapValue!54523)) b!1309876))

(assert (= (and b!1309878 ((_ is ValueCellFull!16733) mapDefault!54523)) b!1309870))

(assert (= start!110698 b!1309878))

(declare-fun m!1199343 () Bool)

(assert (=> b!1309872 m!1199343))

(declare-fun m!1199345 () Bool)

(assert (=> start!110698 m!1199345))

(declare-fun m!1199347 () Bool)

(assert (=> start!110698 m!1199347))

(declare-fun m!1199349 () Bool)

(assert (=> start!110698 m!1199349))

(declare-fun m!1199351 () Bool)

(assert (=> mapNonEmpty!54523 m!1199351))

(declare-fun m!1199353 () Bool)

(assert (=> b!1309875 m!1199353))

(declare-fun m!1199355 () Bool)

(assert (=> b!1309877 m!1199355))

(declare-fun m!1199357 () Bool)

(assert (=> b!1309871 m!1199357))

(assert (=> b!1309871 m!1199357))

(declare-fun m!1199359 () Bool)

(assert (=> b!1309871 m!1199359))

(declare-fun m!1199361 () Bool)

(assert (=> b!1309871 m!1199361))

(assert (=> b!1309869 m!1199343))

(assert (=> b!1309869 m!1199343))

(declare-fun m!1199363 () Bool)

(assert (=> b!1309869 m!1199363))

(declare-fun m!1199365 () Bool)

(assert (=> b!1309873 m!1199365))

(assert (=> b!1309873 m!1199365))

(declare-fun m!1199367 () Bool)

(assert (=> b!1309873 m!1199367))

(check-sat (not b_next!29533) tp_is_empty!35263 (not b!1309875) (not b!1309869) (not b!1309877) (not mapNonEmpty!54523) (not b!1309871) b_and!47723 (not b!1309873) (not start!110698))
(check-sat b_and!47723 (not b_next!29533))
