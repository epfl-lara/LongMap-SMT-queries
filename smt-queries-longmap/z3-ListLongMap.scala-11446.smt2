; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133424 () Bool)

(assert start!133424)

(declare-fun b!1560119 () Bool)

(declare-fun res!1066906 () Bool)

(declare-fun e!869307 () Bool)

(assert (=> b!1560119 (=> (not res!1066906) (not e!869307))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103756 0))(
  ( (array!103757 (arr!50071 (Array (_ BitVec 32) (_ BitVec 64))) (size!50623 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103756)

(declare-datatypes ((V!59617 0))(
  ( (V!59618 (val!19362 Int)) )
))
(declare-datatypes ((ValueCell!18248 0))(
  ( (ValueCellFull!18248 (v!22110 V!59617)) (EmptyCell!18248) )
))
(declare-datatypes ((array!103758 0))(
  ( (array!103759 (arr!50072 (Array (_ BitVec 32) ValueCell!18248)) (size!50624 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103758)

(assert (=> b!1560119 (= res!1066906 (and (= (size!50624 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50623 _keys!637) (size!50624 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59211 () Bool)

(declare-fun mapRes!59211 () Bool)

(declare-fun tp!112867 () Bool)

(declare-fun e!869311 () Bool)

(assert (=> mapNonEmpty!59211 (= mapRes!59211 (and tp!112867 e!869311))))

(declare-fun mapRest!59211 () (Array (_ BitVec 32) ValueCell!18248))

(declare-fun mapKey!59211 () (_ BitVec 32))

(declare-fun mapValue!59211 () ValueCell!18248)

(assert (=> mapNonEmpty!59211 (= (arr!50072 _values!487) (store mapRest!59211 mapKey!59211 mapValue!59211))))

(declare-fun res!1066908 () Bool)

(assert (=> start!133424 (=> (not res!1066908) (not e!869307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133424 (= res!1066908 (validMask!0 mask!947))))

(assert (=> start!133424 e!869307))

(assert (=> start!133424 true))

(declare-fun e!869309 () Bool)

(declare-fun array_inv!39121 (array!103758) Bool)

(assert (=> start!133424 (and (array_inv!39121 _values!487) e!869309)))

(declare-fun array_inv!39122 (array!103756) Bool)

(assert (=> start!133424 (array_inv!39122 _keys!637)))

(declare-fun b!1560120 () Bool)

(declare-fun e!869310 () Bool)

(assert (=> b!1560120 (= e!869309 (and e!869310 mapRes!59211))))

(declare-fun condMapEmpty!59211 () Bool)

(declare-fun mapDefault!59211 () ValueCell!18248)

(assert (=> b!1560120 (= condMapEmpty!59211 (= (arr!50072 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18248)) mapDefault!59211)))))

(declare-fun b!1560121 () Bool)

(declare-fun res!1066907 () Bool)

(assert (=> b!1560121 (=> (not res!1066907) (not e!869307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103756 (_ BitVec 32)) Bool)

(assert (=> b!1560121 (= res!1066907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560122 () Bool)

(declare-fun tp_is_empty!38557 () Bool)

(assert (=> b!1560122 (= e!869311 tp_is_empty!38557)))

(declare-fun b!1560123 () Bool)

(assert (=> b!1560123 (= e!869310 tp_is_empty!38557)))

(declare-fun mapIsEmpty!59211 () Bool)

(assert (=> mapIsEmpty!59211 mapRes!59211))

(declare-fun b!1560124 () Bool)

(assert (=> b!1560124 (= e!869307 false)))

(declare-fun lt!670706 () Bool)

(declare-datatypes ((List!36435 0))(
  ( (Nil!36432) (Cons!36431 (h!37878 (_ BitVec 64)) (t!51160 List!36435)) )
))
(declare-fun arrayNoDuplicates!0 (array!103756 (_ BitVec 32) List!36435) Bool)

(assert (=> b!1560124 (= lt!670706 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36432))))

(assert (= (and start!133424 res!1066908) b!1560119))

(assert (= (and b!1560119 res!1066906) b!1560121))

(assert (= (and b!1560121 res!1066907) b!1560124))

(assert (= (and b!1560120 condMapEmpty!59211) mapIsEmpty!59211))

(assert (= (and b!1560120 (not condMapEmpty!59211)) mapNonEmpty!59211))

(get-info :version)

(assert (= (and mapNonEmpty!59211 ((_ is ValueCellFull!18248) mapValue!59211)) b!1560122))

(assert (= (and b!1560120 ((_ is ValueCellFull!18248) mapDefault!59211)) b!1560123))

(assert (= start!133424 b!1560120))

(declare-fun m!1435389 () Bool)

(assert (=> mapNonEmpty!59211 m!1435389))

(declare-fun m!1435391 () Bool)

(assert (=> start!133424 m!1435391))

(declare-fun m!1435393 () Bool)

(assert (=> start!133424 m!1435393))

(declare-fun m!1435395 () Bool)

(assert (=> start!133424 m!1435395))

(declare-fun m!1435397 () Bool)

(assert (=> b!1560121 m!1435397))

(declare-fun m!1435399 () Bool)

(assert (=> b!1560124 m!1435399))

(check-sat (not b!1560121) (not mapNonEmpty!59211) (not b!1560124) tp_is_empty!38557 (not start!133424))
(check-sat)
