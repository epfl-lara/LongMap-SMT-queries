; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110704 () Bool)

(assert start!110704)

(declare-fun b_free!29539 () Bool)

(declare-fun b_next!29539 () Bool)

(assert (=> start!110704 (= b_free!29539 (not b_next!29539))))

(declare-fun tp!103939 () Bool)

(declare-fun b_and!47729 () Bool)

(assert (=> start!110704 (= tp!103939 b_and!47729)))

(declare-fun b!1309977 () Bool)

(declare-fun res!869639 () Bool)

(declare-fun e!747372 () Bool)

(assert (=> b!1309977 (=> (not res!869639) (not e!747372))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309977 (= res!869639 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!54532 () Bool)

(declare-fun mapRes!54532 () Bool)

(declare-fun tp!103940 () Bool)

(declare-fun e!747373 () Bool)

(assert (=> mapNonEmpty!54532 (= mapRes!54532 (and tp!103940 e!747373))))

(declare-datatypes ((V!52129 0))(
  ( (V!52130 (val!17709 Int)) )
))
(declare-datatypes ((ValueCell!16736 0))(
  ( (ValueCellFull!16736 (v!20335 V!52129)) (EmptyCell!16736) )
))
(declare-fun mapValue!54532 () ValueCell!16736)

(declare-fun mapKey!54532 () (_ BitVec 32))

(declare-datatypes ((array!87443 0))(
  ( (array!87444 (arr!42202 (Array (_ BitVec 32) ValueCell!16736)) (size!42754 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87443)

(declare-fun mapRest!54532 () (Array (_ BitVec 32) ValueCell!16736))

(assert (=> mapNonEmpty!54532 (= (arr!42202 _values!1354) (store mapRest!54532 mapKey!54532 mapValue!54532))))

(declare-fun b!1309978 () Bool)

(declare-fun res!869636 () Bool)

(assert (=> b!1309978 (=> (not res!869636) (not e!747372))))

(declare-datatypes ((array!87445 0))(
  ( (array!87446 (arr!42203 (Array (_ BitVec 32) (_ BitVec 64))) (size!42755 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87445)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309978 (= res!869636 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42755 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309979 () Bool)

(declare-fun e!747371 () Bool)

(declare-fun e!747370 () Bool)

(assert (=> b!1309979 (= e!747371 (and e!747370 mapRes!54532))))

(declare-fun condMapEmpty!54532 () Bool)

(declare-fun mapDefault!54532 () ValueCell!16736)

(assert (=> b!1309979 (= condMapEmpty!54532 (= (arr!42202 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16736)) mapDefault!54532)))))

(declare-fun b!1309980 () Bool)

(declare-fun res!869642 () Bool)

(assert (=> b!1309980 (=> (not res!869642) (not e!747372))))

(assert (=> b!1309980 (= res!869642 (not (= (select (arr!42203 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapIsEmpty!54532 () Bool)

(assert (=> mapIsEmpty!54532 mapRes!54532))

(declare-fun b!1309981 () Bool)

(declare-fun tp_is_empty!35269 () Bool)

(assert (=> b!1309981 (= e!747370 tp_is_empty!35269)))

(declare-fun b!1309982 () Bool)

(declare-fun res!869644 () Bool)

(assert (=> b!1309982 (=> (not res!869644) (not e!747372))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52129)

(declare-fun zeroValue!1296 () V!52129)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22900 0))(
  ( (tuple2!22901 (_1!11461 (_ BitVec 64)) (_2!11461 V!52129)) )
))
(declare-datatypes ((List!30025 0))(
  ( (Nil!30022) (Cons!30021 (h!31230 tuple2!22900) (t!43623 List!30025)) )
))
(declare-datatypes ((ListLongMap!20557 0))(
  ( (ListLongMap!20558 (toList!10294 List!30025)) )
))
(declare-fun contains!8371 (ListLongMap!20557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5189 (array!87445 array!87443 (_ BitVec 32) (_ BitVec 32) V!52129 V!52129 (_ BitVec 32) Int) ListLongMap!20557)

(assert (=> b!1309982 (= res!869644 (contains!8371 (getCurrentListMap!5189 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!869640 () Bool)

(assert (=> start!110704 (=> (not res!869640) (not e!747372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110704 (= res!869640 (validMask!0 mask!2040))))

(assert (=> start!110704 e!747372))

(assert (=> start!110704 tp!103939))

(declare-fun array_inv!32079 (array!87445) Bool)

(assert (=> start!110704 (array_inv!32079 _keys!1628)))

(assert (=> start!110704 true))

(assert (=> start!110704 tp_is_empty!35269))

(declare-fun array_inv!32080 (array!87443) Bool)

(assert (=> start!110704 (and (array_inv!32080 _values!1354) e!747371)))

(declare-fun b!1309983 () Bool)

(declare-fun res!869643 () Bool)

(assert (=> b!1309983 (=> (not res!869643) (not e!747372))))

(assert (=> b!1309983 (= res!869643 (and (= (size!42754 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42755 _keys!1628) (size!42754 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309984 () Bool)

(declare-fun res!869638 () Bool)

(assert (=> b!1309984 (=> (not res!869638) (not e!747372))))

(declare-datatypes ((List!30026 0))(
  ( (Nil!30023) (Cons!30022 (h!31231 (_ BitVec 64)) (t!43624 List!30026)) )
))
(declare-fun arrayNoDuplicates!0 (array!87445 (_ BitVec 32) List!30026) Bool)

(assert (=> b!1309984 (= res!869638 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30023))))

(declare-fun b!1309985 () Bool)

(declare-fun res!869637 () Bool)

(assert (=> b!1309985 (=> (not res!869637) (not e!747372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309985 (= res!869637 (validKeyInArray!0 (select (arr!42203 _keys!1628) from!2020)))))

(declare-fun b!1309986 () Bool)

(assert (=> b!1309986 (= e!747373 tp_is_empty!35269)))

(declare-fun b!1309987 () Bool)

(assert (=> b!1309987 (= e!747372 (not true))))

(assert (=> b!1309987 (contains!8371 (getCurrentListMap!5189 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43161 0))(
  ( (Unit!43162) )
))
(declare-fun lt!585141 () Unit!43161)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!7 (array!87445 array!87443 (_ BitVec 32) (_ BitVec 32) V!52129 V!52129 (_ BitVec 64) (_ BitVec 32) Int) Unit!43161)

(assert (=> b!1309987 (= lt!585141 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!7 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309988 () Bool)

(declare-fun res!869641 () Bool)

(assert (=> b!1309988 (=> (not res!869641) (not e!747372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87445 (_ BitVec 32)) Bool)

(assert (=> b!1309988 (= res!869641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110704 res!869640) b!1309983))

(assert (= (and b!1309983 res!869643) b!1309988))

(assert (= (and b!1309988 res!869641) b!1309984))

(assert (= (and b!1309984 res!869638) b!1309978))

(assert (= (and b!1309978 res!869636) b!1309982))

(assert (= (and b!1309982 res!869644) b!1309980))

(assert (= (and b!1309980 res!869642) b!1309985))

(assert (= (and b!1309985 res!869637) b!1309977))

(assert (= (and b!1309977 res!869639) b!1309987))

(assert (= (and b!1309979 condMapEmpty!54532) mapIsEmpty!54532))

(assert (= (and b!1309979 (not condMapEmpty!54532)) mapNonEmpty!54532))

(get-info :version)

(assert (= (and mapNonEmpty!54532 ((_ is ValueCellFull!16736) mapValue!54532)) b!1309986))

(assert (= (and b!1309979 ((_ is ValueCellFull!16736) mapDefault!54532)) b!1309981))

(assert (= start!110704 b!1309979))

(declare-fun m!1199421 () Bool)

(assert (=> b!1309982 m!1199421))

(assert (=> b!1309982 m!1199421))

(declare-fun m!1199423 () Bool)

(assert (=> b!1309982 m!1199423))

(declare-fun m!1199425 () Bool)

(assert (=> b!1309984 m!1199425))

(declare-fun m!1199427 () Bool)

(assert (=> b!1309987 m!1199427))

(assert (=> b!1309987 m!1199427))

(declare-fun m!1199429 () Bool)

(assert (=> b!1309987 m!1199429))

(declare-fun m!1199431 () Bool)

(assert (=> b!1309987 m!1199431))

(declare-fun m!1199433 () Bool)

(assert (=> start!110704 m!1199433))

(declare-fun m!1199435 () Bool)

(assert (=> start!110704 m!1199435))

(declare-fun m!1199437 () Bool)

(assert (=> start!110704 m!1199437))

(declare-fun m!1199439 () Bool)

(assert (=> mapNonEmpty!54532 m!1199439))

(declare-fun m!1199441 () Bool)

(assert (=> b!1309980 m!1199441))

(assert (=> b!1309985 m!1199441))

(assert (=> b!1309985 m!1199441))

(declare-fun m!1199443 () Bool)

(assert (=> b!1309985 m!1199443))

(declare-fun m!1199445 () Bool)

(assert (=> b!1309988 m!1199445))

(check-sat (not b!1309988) b_and!47729 (not b!1309985) tp_is_empty!35269 (not b_next!29539) (not b!1309984) (not start!110704) (not b!1309982) (not b!1309987) (not mapNonEmpty!54532))
(check-sat b_and!47729 (not b_next!29539))
