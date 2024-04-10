; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112886 () Bool)

(assert start!112886)

(declare-fun res!888154 () Bool)

(declare-fun e!762239 () Bool)

(assert (=> start!112886 (=> (not res!888154) (not e!762239))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112886 (= res!888154 (validMask!0 mask!1977))))

(assert (=> start!112886 e!762239))

(assert (=> start!112886 true))

(declare-datatypes ((V!54411 0))(
  ( (V!54412 (val!18565 Int)) )
))
(declare-datatypes ((ValueCell!17592 0))(
  ( (ValueCellFull!17592 (v!21212 V!54411)) (EmptyCell!17592) )
))
(declare-datatypes ((array!90822 0))(
  ( (array!90823 (arr!43872 (Array (_ BitVec 32) ValueCell!17592)) (size!44422 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90822)

(declare-fun e!762243 () Bool)

(declare-fun array_inv!33085 (array!90822) Bool)

(assert (=> start!112886 (and (array_inv!33085 _values!1303) e!762243)))

(declare-datatypes ((array!90824 0))(
  ( (array!90825 (arr!43873 (Array (_ BitVec 32) (_ BitVec 64))) (size!44423 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90824)

(declare-fun array_inv!33086 (array!90824) Bool)

(assert (=> start!112886 (array_inv!33086 _keys!1571)))

(declare-fun b!1338625 () Bool)

(declare-fun e!762240 () Bool)

(declare-fun tp_is_empty!36981 () Bool)

(assert (=> b!1338625 (= e!762240 tp_is_empty!36981)))

(declare-fun b!1338626 () Bool)

(declare-fun e!762241 () Bool)

(assert (=> b!1338626 (= e!762241 tp_is_empty!36981)))

(declare-fun mapNonEmpty!57163 () Bool)

(declare-fun mapRes!57163 () Bool)

(declare-fun tp!108862 () Bool)

(assert (=> mapNonEmpty!57163 (= mapRes!57163 (and tp!108862 e!762241))))

(declare-fun mapRest!57163 () (Array (_ BitVec 32) ValueCell!17592))

(declare-fun mapValue!57163 () ValueCell!17592)

(declare-fun mapKey!57163 () (_ BitVec 32))

(assert (=> mapNonEmpty!57163 (= (arr!43872 _values!1303) (store mapRest!57163 mapKey!57163 mapValue!57163))))

(declare-fun b!1338627 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338627 (= e!762239 (and (= (size!44422 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44423 _keys!1571) (size!44422 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011) (not (= (size!44423 _keys!1571) (bvadd #b00000000000000000000000000000001 mask!1977)))))))

(declare-fun mapIsEmpty!57163 () Bool)

(assert (=> mapIsEmpty!57163 mapRes!57163))

(declare-fun b!1338628 () Bool)

(assert (=> b!1338628 (= e!762243 (and e!762240 mapRes!57163))))

(declare-fun condMapEmpty!57163 () Bool)

(declare-fun mapDefault!57163 () ValueCell!17592)

(assert (=> b!1338628 (= condMapEmpty!57163 (= (arr!43872 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17592)) mapDefault!57163)))))

(assert (= (and start!112886 res!888154) b!1338627))

(assert (= (and b!1338628 condMapEmpty!57163) mapIsEmpty!57163))

(assert (= (and b!1338628 (not condMapEmpty!57163)) mapNonEmpty!57163))

(get-info :version)

(assert (= (and mapNonEmpty!57163 ((_ is ValueCellFull!17592) mapValue!57163)) b!1338626))

(assert (= (and b!1338628 ((_ is ValueCellFull!17592) mapDefault!57163)) b!1338625))

(assert (= start!112886 b!1338628))

(declare-fun m!1226981 () Bool)

(assert (=> start!112886 m!1226981))

(declare-fun m!1226983 () Bool)

(assert (=> start!112886 m!1226983))

(declare-fun m!1226985 () Bool)

(assert (=> start!112886 m!1226985))

(declare-fun m!1226987 () Bool)

(assert (=> mapNonEmpty!57163 m!1226987))

(check-sat (not start!112886) (not mapNonEmpty!57163) tp_is_empty!36981)
(check-sat)
