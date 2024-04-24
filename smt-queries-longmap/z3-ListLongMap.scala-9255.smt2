; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111102 () Bool)

(assert start!111102)

(declare-fun b_free!29713 () Bool)

(declare-fun b_next!29713 () Bool)

(assert (=> start!111102 (= b_free!29713 (not b_next!29713))))

(declare-fun tp!104460 () Bool)

(declare-fun b_and!47923 () Bool)

(assert (=> start!111102 (= tp!104460 b_and!47923)))

(declare-fun mapNonEmpty!54793 () Bool)

(declare-fun mapRes!54793 () Bool)

(declare-fun tp!104461 () Bool)

(declare-fun e!749554 () Bool)

(assert (=> mapNonEmpty!54793 (= mapRes!54793 (and tp!104461 e!749554))))

(declare-datatypes ((V!52361 0))(
  ( (V!52362 (val!17796 Int)) )
))
(declare-datatypes ((ValueCell!16823 0))(
  ( (ValueCellFull!16823 (v!20418 V!52361)) (EmptyCell!16823) )
))
(declare-fun mapValue!54793 () ValueCell!16823)

(declare-datatypes ((array!87923 0))(
  ( (array!87924 (arr!42437 (Array (_ BitVec 32) ValueCell!16823)) (size!42988 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87923)

(declare-fun mapRest!54793 () (Array (_ BitVec 32) ValueCell!16823))

(declare-fun mapKey!54793 () (_ BitVec 32))

(assert (=> mapNonEmpty!54793 (= (arr!42437 _values!1354) (store mapRest!54793 mapKey!54793 mapValue!54793))))

(declare-fun b!1313966 () Bool)

(declare-fun tp_is_empty!35443 () Bool)

(assert (=> b!1313966 (= e!749554 tp_is_empty!35443)))

(declare-fun b!1313967 () Bool)

(declare-fun res!872024 () Bool)

(declare-fun e!749553 () Bool)

(assert (=> b!1313967 (=> (not res!872024) (not e!749553))))

(declare-datatypes ((array!87925 0))(
  ( (array!87926 (arr!42438 (Array (_ BitVec 32) (_ BitVec 64))) (size!42989 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87925)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87925 (_ BitVec 32)) Bool)

(assert (=> b!1313967 (= res!872024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313969 () Bool)

(declare-fun e!749555 () Bool)

(declare-fun e!749551 () Bool)

(assert (=> b!1313969 (= e!749555 (and e!749551 mapRes!54793))))

(declare-fun condMapEmpty!54793 () Bool)

(declare-fun mapDefault!54793 () ValueCell!16823)

(assert (=> b!1313969 (= condMapEmpty!54793 (= (arr!42437 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16823)) mapDefault!54793)))))

(declare-fun b!1313970 () Bool)

(assert (=> b!1313970 (= e!749551 tp_is_empty!35443)))

(declare-fun b!1313971 () Bool)

(declare-fun res!872020 () Bool)

(assert (=> b!1313971 (=> (not res!872020) (not e!749553))))

(declare-datatypes ((List!30122 0))(
  ( (Nil!30119) (Cons!30118 (h!31336 (_ BitVec 64)) (t!43720 List!30122)) )
))
(declare-fun arrayNoDuplicates!0 (array!87925 (_ BitVec 32) List!30122) Bool)

(assert (=> b!1313971 (= res!872020 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30119))))

(declare-fun mapIsEmpty!54793 () Bool)

(assert (=> mapIsEmpty!54793 mapRes!54793))

(declare-fun res!872021 () Bool)

(assert (=> start!111102 (=> (not res!872021) (not e!749553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111102 (= res!872021 (validMask!0 mask!2040))))

(assert (=> start!111102 e!749553))

(assert (=> start!111102 tp!104460))

(declare-fun array_inv!32319 (array!87925) Bool)

(assert (=> start!111102 (array_inv!32319 _keys!1628)))

(assert (=> start!111102 true))

(assert (=> start!111102 tp_is_empty!35443))

(declare-fun array_inv!32320 (array!87923) Bool)

(assert (=> start!111102 (and (array_inv!32320 _values!1354) e!749555)))

(declare-fun b!1313968 () Bool)

(assert (=> b!1313968 (= e!749553 false)))

(declare-fun lt!586064 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52361)

(declare-fun zeroValue!1296 () V!52361)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22970 0))(
  ( (tuple2!22971 (_1!11496 (_ BitVec 64)) (_2!11496 V!52361)) )
))
(declare-datatypes ((List!30123 0))(
  ( (Nil!30120) (Cons!30119 (h!31337 tuple2!22970) (t!43721 List!30123)) )
))
(declare-datatypes ((ListLongMap!20635 0))(
  ( (ListLongMap!20636 (toList!10333 List!30123)) )
))
(declare-fun contains!8495 (ListLongMap!20635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5337 (array!87925 array!87923 (_ BitVec 32) (_ BitVec 32) V!52361 V!52361 (_ BitVec 32) Int) ListLongMap!20635)

(assert (=> b!1313968 (= lt!586064 (contains!8495 (getCurrentListMap!5337 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313972 () Bool)

(declare-fun res!872023 () Bool)

(assert (=> b!1313972 (=> (not res!872023) (not e!749553))))

(assert (=> b!1313972 (= res!872023 (and (= (size!42988 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42989 _keys!1628) (size!42988 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313973 () Bool)

(declare-fun res!872022 () Bool)

(assert (=> b!1313973 (=> (not res!872022) (not e!749553))))

(assert (=> b!1313973 (= res!872022 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42989 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111102 res!872021) b!1313972))

(assert (= (and b!1313972 res!872023) b!1313967))

(assert (= (and b!1313967 res!872024) b!1313971))

(assert (= (and b!1313971 res!872020) b!1313973))

(assert (= (and b!1313973 res!872022) b!1313968))

(assert (= (and b!1313969 condMapEmpty!54793) mapIsEmpty!54793))

(assert (= (and b!1313969 (not condMapEmpty!54793)) mapNonEmpty!54793))

(get-info :version)

(assert (= (and mapNonEmpty!54793 ((_ is ValueCellFull!16823) mapValue!54793)) b!1313966))

(assert (= (and b!1313969 ((_ is ValueCellFull!16823) mapDefault!54793)) b!1313970))

(assert (= start!111102 b!1313969))

(declare-fun m!1203377 () Bool)

(assert (=> mapNonEmpty!54793 m!1203377))

(declare-fun m!1203379 () Bool)

(assert (=> b!1313968 m!1203379))

(assert (=> b!1313968 m!1203379))

(declare-fun m!1203381 () Bool)

(assert (=> b!1313968 m!1203381))

(declare-fun m!1203383 () Bool)

(assert (=> start!111102 m!1203383))

(declare-fun m!1203385 () Bool)

(assert (=> start!111102 m!1203385))

(declare-fun m!1203387 () Bool)

(assert (=> start!111102 m!1203387))

(declare-fun m!1203389 () Bool)

(assert (=> b!1313967 m!1203389))

(declare-fun m!1203391 () Bool)

(assert (=> b!1313971 m!1203391))

(check-sat (not b!1313968) (not b!1313971) (not mapNonEmpty!54793) (not start!111102) b_and!47923 (not b_next!29713) tp_is_empty!35443 (not b!1313967))
(check-sat b_and!47923 (not b_next!29713))
