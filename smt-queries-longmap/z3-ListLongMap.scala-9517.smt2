; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112966 () Bool)

(assert start!112966)

(declare-fun b!1339068 () Bool)

(declare-fun e!762606 () Bool)

(declare-fun e!762607 () Bool)

(declare-fun mapRes!57232 () Bool)

(assert (=> b!1339068 (= e!762606 (and e!762607 mapRes!57232))))

(declare-fun condMapEmpty!57232 () Bool)

(declare-datatypes ((V!54459 0))(
  ( (V!54460 (val!18583 Int)) )
))
(declare-datatypes ((ValueCell!17610 0))(
  ( (ValueCellFull!17610 (v!21231 V!54459)) (EmptyCell!17610) )
))
(declare-datatypes ((array!90900 0))(
  ( (array!90901 (arr!43906 (Array (_ BitVec 32) ValueCell!17610)) (size!44456 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90900)

(declare-fun mapDefault!57232 () ValueCell!17610)

(assert (=> b!1339068 (= condMapEmpty!57232 (= (arr!43906 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17610)) mapDefault!57232)))))

(declare-fun b!1339069 () Bool)

(declare-fun tp_is_empty!37017 () Bool)

(assert (=> b!1339069 (= e!762607 tp_is_empty!37017)))

(declare-fun mapIsEmpty!57232 () Bool)

(assert (=> mapIsEmpty!57232 mapRes!57232))

(declare-fun b!1339070 () Bool)

(declare-fun res!888372 () Bool)

(declare-fun e!762605 () Bool)

(assert (=> b!1339070 (=> (not res!888372) (not e!762605))))

(declare-datatypes ((array!90902 0))(
  ( (array!90903 (arr!43907 (Array (_ BitVec 32) (_ BitVec 64))) (size!44457 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90902)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90902 (_ BitVec 32)) Bool)

(assert (=> b!1339070 (= res!888372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339071 () Bool)

(assert (=> b!1339071 (= e!762605 false)))

(declare-fun lt!593829 () Bool)

(declare-datatypes ((List!31096 0))(
  ( (Nil!31093) (Cons!31092 (h!32301 (_ BitVec 64)) (t!45428 List!31096)) )
))
(declare-fun arrayNoDuplicates!0 (array!90902 (_ BitVec 32) List!31096) Bool)

(assert (=> b!1339071 (= lt!593829 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31093))))

(declare-fun mapNonEmpty!57232 () Bool)

(declare-fun tp!108931 () Bool)

(declare-fun e!762608 () Bool)

(assert (=> mapNonEmpty!57232 (= mapRes!57232 (and tp!108931 e!762608))))

(declare-fun mapRest!57232 () (Array (_ BitVec 32) ValueCell!17610))

(declare-fun mapValue!57232 () ValueCell!17610)

(declare-fun mapKey!57232 () (_ BitVec 32))

(assert (=> mapNonEmpty!57232 (= (arr!43906 _values!1303) (store mapRest!57232 mapKey!57232 mapValue!57232))))

(declare-fun b!1339072 () Bool)

(assert (=> b!1339072 (= e!762608 tp_is_empty!37017)))

(declare-fun b!1339067 () Bool)

(declare-fun res!888370 () Bool)

(assert (=> b!1339067 (=> (not res!888370) (not e!762605))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339067 (= res!888370 (and (= (size!44456 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44457 _keys!1571) (size!44456 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888371 () Bool)

(assert (=> start!112966 (=> (not res!888371) (not e!762605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112966 (= res!888371 (validMask!0 mask!1977))))

(assert (=> start!112966 e!762605))

(assert (=> start!112966 true))

(declare-fun array_inv!33107 (array!90900) Bool)

(assert (=> start!112966 (and (array_inv!33107 _values!1303) e!762606)))

(declare-fun array_inv!33108 (array!90902) Bool)

(assert (=> start!112966 (array_inv!33108 _keys!1571)))

(assert (= (and start!112966 res!888371) b!1339067))

(assert (= (and b!1339067 res!888370) b!1339070))

(assert (= (and b!1339070 res!888372) b!1339071))

(assert (= (and b!1339068 condMapEmpty!57232) mapIsEmpty!57232))

(assert (= (and b!1339068 (not condMapEmpty!57232)) mapNonEmpty!57232))

(get-info :version)

(assert (= (and mapNonEmpty!57232 ((_ is ValueCellFull!17610) mapValue!57232)) b!1339072))

(assert (= (and b!1339068 ((_ is ValueCellFull!17610) mapDefault!57232)) b!1339069))

(assert (= start!112966 b!1339068))

(declare-fun m!1227253 () Bool)

(assert (=> b!1339070 m!1227253))

(declare-fun m!1227255 () Bool)

(assert (=> b!1339071 m!1227255))

(declare-fun m!1227257 () Bool)

(assert (=> mapNonEmpty!57232 m!1227257))

(declare-fun m!1227259 () Bool)

(assert (=> start!112966 m!1227259))

(declare-fun m!1227261 () Bool)

(assert (=> start!112966 m!1227261))

(declare-fun m!1227263 () Bool)

(assert (=> start!112966 m!1227263))

(check-sat (not b!1339070) tp_is_empty!37017 (not start!112966) (not b!1339071) (not mapNonEmpty!57232))
(check-sat)
