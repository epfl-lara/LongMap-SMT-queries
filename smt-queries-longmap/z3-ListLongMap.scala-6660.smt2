; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84100 () Bool)

(assert start!84100)

(declare-fun b!981802 () Bool)

(declare-fun e!553483 () Bool)

(declare-fun tp_is_empty!22735 () Bool)

(assert (=> b!981802 (= e!553483 tp_is_empty!22735)))

(declare-fun b!981803 () Bool)

(declare-fun e!553485 () Bool)

(assert (=> b!981803 (= e!553485 false)))

(declare-fun lt!435981 () Bool)

(declare-datatypes ((array!61508 0))(
  ( (array!61509 (arr!29607 (Array (_ BitVec 32) (_ BitVec 64))) (size!30087 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61508)

(declare-datatypes ((List!20518 0))(
  ( (Nil!20515) (Cons!20514 (h!21682 (_ BitVec 64)) (t!29193 List!20518)) )
))
(declare-fun arrayNoDuplicates!0 (array!61508 (_ BitVec 32) List!20518) Bool)

(assert (=> b!981803 (= lt!435981 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20515))))

(declare-fun res!656787 () Bool)

(assert (=> start!84100 (=> (not res!656787) (not e!553485))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84100 (= res!656787 (validMask!0 mask!1948))))

(assert (=> start!84100 e!553485))

(assert (=> start!84100 true))

(declare-datatypes ((V!35297 0))(
  ( (V!35298 (val!11418 Int)) )
))
(declare-datatypes ((ValueCell!10886 0))(
  ( (ValueCellFull!10886 (v!13977 V!35297)) (EmptyCell!10886) )
))
(declare-datatypes ((array!61510 0))(
  ( (array!61511 (arr!29608 (Array (_ BitVec 32) ValueCell!10886)) (size!30088 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61510)

(declare-fun e!553484 () Bool)

(declare-fun array_inv!22919 (array!61510) Bool)

(assert (=> start!84100 (and (array_inv!22919 _values!1278) e!553484)))

(declare-fun array_inv!22920 (array!61508) Bool)

(assert (=> start!84100 (array_inv!22920 _keys!1544)))

(declare-fun b!981804 () Bool)

(declare-fun e!553482 () Bool)

(assert (=> b!981804 (= e!553482 tp_is_empty!22735)))

(declare-fun mapIsEmpty!36131 () Bool)

(declare-fun mapRes!36131 () Bool)

(assert (=> mapIsEmpty!36131 mapRes!36131))

(declare-fun b!981805 () Bool)

(assert (=> b!981805 (= e!553484 (and e!553483 mapRes!36131))))

(declare-fun condMapEmpty!36131 () Bool)

(declare-fun mapDefault!36131 () ValueCell!10886)

(assert (=> b!981805 (= condMapEmpty!36131 (= (arr!29608 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10886)) mapDefault!36131)))))

(declare-fun b!981806 () Bool)

(declare-fun res!656788 () Bool)

(assert (=> b!981806 (=> (not res!656788) (not e!553485))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981806 (= res!656788 (and (= (size!30088 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30087 _keys!1544) (size!30088 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981807 () Bool)

(declare-fun res!656786 () Bool)

(assert (=> b!981807 (=> (not res!656786) (not e!553485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61508 (_ BitVec 32)) Bool)

(assert (=> b!981807 (= res!656786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36131 () Bool)

(declare-fun tp!68645 () Bool)

(assert (=> mapNonEmpty!36131 (= mapRes!36131 (and tp!68645 e!553482))))

(declare-fun mapRest!36131 () (Array (_ BitVec 32) ValueCell!10886))

(declare-fun mapValue!36131 () ValueCell!10886)

(declare-fun mapKey!36131 () (_ BitVec 32))

(assert (=> mapNonEmpty!36131 (= (arr!29608 _values!1278) (store mapRest!36131 mapKey!36131 mapValue!36131))))

(assert (= (and start!84100 res!656787) b!981806))

(assert (= (and b!981806 res!656788) b!981807))

(assert (= (and b!981807 res!656786) b!981803))

(assert (= (and b!981805 condMapEmpty!36131) mapIsEmpty!36131))

(assert (= (and b!981805 (not condMapEmpty!36131)) mapNonEmpty!36131))

(get-info :version)

(assert (= (and mapNonEmpty!36131 ((_ is ValueCellFull!10886) mapValue!36131)) b!981804))

(assert (= (and b!981805 ((_ is ValueCellFull!10886) mapDefault!36131)) b!981802))

(assert (= start!84100 b!981805))

(declare-fun m!909749 () Bool)

(assert (=> b!981803 m!909749))

(declare-fun m!909751 () Bool)

(assert (=> start!84100 m!909751))

(declare-fun m!909753 () Bool)

(assert (=> start!84100 m!909753))

(declare-fun m!909755 () Bool)

(assert (=> start!84100 m!909755))

(declare-fun m!909757 () Bool)

(assert (=> b!981807 m!909757))

(declare-fun m!909759 () Bool)

(assert (=> mapNonEmpty!36131 m!909759))

(check-sat (not start!84100) tp_is_empty!22735 (not b!981803) (not b!981807) (not mapNonEmpty!36131))
(check-sat)
