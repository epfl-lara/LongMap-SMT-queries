; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83946 () Bool)

(assert start!83946)

(declare-fun mapNonEmpty!36152 () Bool)

(declare-fun mapRes!36152 () Bool)

(declare-fun tp!68665 () Bool)

(declare-fun e!553008 () Bool)

(assert (=> mapNonEmpty!36152 (= mapRes!36152 (and tp!68665 e!553008))))

(declare-datatypes ((V!35315 0))(
  ( (V!35316 (val!11425 Int)) )
))
(declare-datatypes ((ValueCell!10893 0))(
  ( (ValueCellFull!10893 (v!13987 V!35315)) (EmptyCell!10893) )
))
(declare-datatypes ((array!61499 0))(
  ( (array!61500 (arr!29607 (Array (_ BitVec 32) ValueCell!10893)) (size!30086 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61499)

(declare-fun mapValue!36152 () ValueCell!10893)

(declare-fun mapKey!36152 () (_ BitVec 32))

(declare-fun mapRest!36152 () (Array (_ BitVec 32) ValueCell!10893))

(assert (=> mapNonEmpty!36152 (= (arr!29607 _values!1278) (store mapRest!36152 mapKey!36152 mapValue!36152))))

(declare-fun b!981025 () Bool)

(declare-fun res!656505 () Bool)

(declare-fun e!553004 () Bool)

(assert (=> b!981025 (=> (not res!656505) (not e!553004))))

(declare-datatypes ((array!61501 0))(
  ( (array!61502 (arr!29608 (Array (_ BitVec 32) (_ BitVec 64))) (size!30087 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61501)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61501 (_ BitVec 32)) Bool)

(assert (=> b!981025 (= res!656505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981026 () Bool)

(declare-fun tp_is_empty!22749 () Bool)

(assert (=> b!981026 (= e!553008 tp_is_empty!22749)))

(declare-fun res!656507 () Bool)

(assert (=> start!83946 (=> (not res!656507) (not e!553004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83946 (= res!656507 (validMask!0 mask!1948))))

(assert (=> start!83946 e!553004))

(assert (=> start!83946 true))

(declare-fun e!553007 () Bool)

(declare-fun array_inv!22889 (array!61499) Bool)

(assert (=> start!83946 (and (array_inv!22889 _values!1278) e!553007)))

(declare-fun array_inv!22890 (array!61501) Bool)

(assert (=> start!83946 (array_inv!22890 _keys!1544)))

(declare-fun b!981027 () Bool)

(declare-fun e!553005 () Bool)

(assert (=> b!981027 (= e!553005 tp_is_empty!22749)))

(declare-fun b!981028 () Bool)

(declare-fun res!656506 () Bool)

(assert (=> b!981028 (=> (not res!656506) (not e!553004))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981028 (= res!656506 (and (= (size!30086 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30087 _keys!1544) (size!30086 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981029 () Bool)

(assert (=> b!981029 (= e!553004 false)))

(declare-fun lt!435641 () Bool)

(declare-datatypes ((List!20513 0))(
  ( (Nil!20510) (Cons!20509 (h!21671 (_ BitVec 64)) (t!29196 List!20513)) )
))
(declare-fun arrayNoDuplicates!0 (array!61501 (_ BitVec 32) List!20513) Bool)

(assert (=> b!981029 (= lt!435641 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20510))))

(declare-fun mapIsEmpty!36152 () Bool)

(assert (=> mapIsEmpty!36152 mapRes!36152))

(declare-fun b!981030 () Bool)

(assert (=> b!981030 (= e!553007 (and e!553005 mapRes!36152))))

(declare-fun condMapEmpty!36152 () Bool)

(declare-fun mapDefault!36152 () ValueCell!10893)

(assert (=> b!981030 (= condMapEmpty!36152 (= (arr!29607 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10893)) mapDefault!36152)))))

(assert (= (and start!83946 res!656507) b!981028))

(assert (= (and b!981028 res!656506) b!981025))

(assert (= (and b!981025 res!656505) b!981029))

(assert (= (and b!981030 condMapEmpty!36152) mapIsEmpty!36152))

(assert (= (and b!981030 (not condMapEmpty!36152)) mapNonEmpty!36152))

(get-info :version)

(assert (= (and mapNonEmpty!36152 ((_ is ValueCellFull!10893) mapValue!36152)) b!981026))

(assert (= (and b!981030 ((_ is ValueCellFull!10893) mapDefault!36152)) b!981027))

(assert (= start!83946 b!981030))

(declare-fun m!908539 () Bool)

(assert (=> mapNonEmpty!36152 m!908539))

(declare-fun m!908541 () Bool)

(assert (=> b!981025 m!908541))

(declare-fun m!908543 () Bool)

(assert (=> start!83946 m!908543))

(declare-fun m!908545 () Bool)

(assert (=> start!83946 m!908545))

(declare-fun m!908547 () Bool)

(assert (=> start!83946 m!908547))

(declare-fun m!908549 () Bool)

(assert (=> b!981029 m!908549))

(check-sat (not b!981029) tp_is_empty!22749 (not start!83946) (not b!981025) (not mapNonEmpty!36152))
(check-sat)
