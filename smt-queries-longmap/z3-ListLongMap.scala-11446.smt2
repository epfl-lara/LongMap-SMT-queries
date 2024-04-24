; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133886 () Bool)

(assert start!133886)

(declare-fun b!1562868 () Bool)

(declare-fun e!871015 () Bool)

(assert (=> b!1562868 (= e!871015 false)))

(declare-fun lt!671900 () Bool)

(declare-datatypes ((array!103958 0))(
  ( (array!103959 (arr!50164 (Array (_ BitVec 32) (_ BitVec 64))) (size!50715 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103958)

(declare-datatypes ((List!36420 0))(
  ( (Nil!36417) (Cons!36416 (h!37880 (_ BitVec 64)) (t!51145 List!36420)) )
))
(declare-fun arrayNoDuplicates!0 (array!103958 (_ BitVec 32) List!36420) Bool)

(assert (=> b!1562868 (= lt!671900 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36417))))

(declare-fun mapIsEmpty!59211 () Bool)

(declare-fun mapRes!59211 () Bool)

(assert (=> mapIsEmpty!59211 mapRes!59211))

(declare-fun b!1562869 () Bool)

(declare-fun e!871017 () Bool)

(declare-fun tp_is_empty!38557 () Bool)

(assert (=> b!1562869 (= e!871017 tp_is_empty!38557)))

(declare-fun res!1067895 () Bool)

(assert (=> start!133886 (=> (not res!1067895) (not e!871015))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133886 (= res!1067895 (validMask!0 mask!947))))

(assert (=> start!133886 e!871015))

(assert (=> start!133886 true))

(declare-datatypes ((V!59617 0))(
  ( (V!59618 (val!19362 Int)) )
))
(declare-datatypes ((ValueCell!18248 0))(
  ( (ValueCellFull!18248 (v!22106 V!59617)) (EmptyCell!18248) )
))
(declare-datatypes ((array!103960 0))(
  ( (array!103961 (arr!50165 (Array (_ BitVec 32) ValueCell!18248)) (size!50716 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103960)

(declare-fun e!871016 () Bool)

(declare-fun array_inv!39247 (array!103960) Bool)

(assert (=> start!133886 (and (array_inv!39247 _values!487) e!871016)))

(declare-fun array_inv!39248 (array!103958) Bool)

(assert (=> start!133886 (array_inv!39248 _keys!637)))

(declare-fun b!1562870 () Bool)

(declare-fun e!871018 () Bool)

(assert (=> b!1562870 (= e!871018 tp_is_empty!38557)))

(declare-fun b!1562871 () Bool)

(assert (=> b!1562871 (= e!871016 (and e!871018 mapRes!59211))))

(declare-fun condMapEmpty!59211 () Bool)

(declare-fun mapDefault!59211 () ValueCell!18248)

(assert (=> b!1562871 (= condMapEmpty!59211 (= (arr!50165 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18248)) mapDefault!59211)))))

(declare-fun b!1562872 () Bool)

(declare-fun res!1067896 () Bool)

(assert (=> b!1562872 (=> (not res!1067896) (not e!871015))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562872 (= res!1067896 (and (= (size!50716 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50715 _keys!637) (size!50716 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562873 () Bool)

(declare-fun res!1067897 () Bool)

(assert (=> b!1562873 (=> (not res!1067897) (not e!871015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103958 (_ BitVec 32)) Bool)

(assert (=> b!1562873 (= res!1067897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59211 () Bool)

(declare-fun tp!112866 () Bool)

(assert (=> mapNonEmpty!59211 (= mapRes!59211 (and tp!112866 e!871017))))

(declare-fun mapValue!59211 () ValueCell!18248)

(declare-fun mapKey!59211 () (_ BitVec 32))

(declare-fun mapRest!59211 () (Array (_ BitVec 32) ValueCell!18248))

(assert (=> mapNonEmpty!59211 (= (arr!50165 _values!487) (store mapRest!59211 mapKey!59211 mapValue!59211))))

(assert (= (and start!133886 res!1067895) b!1562872))

(assert (= (and b!1562872 res!1067896) b!1562873))

(assert (= (and b!1562873 res!1067897) b!1562868))

(assert (= (and b!1562871 condMapEmpty!59211) mapIsEmpty!59211))

(assert (= (and b!1562871 (not condMapEmpty!59211)) mapNonEmpty!59211))

(get-info :version)

(assert (= (and mapNonEmpty!59211 ((_ is ValueCellFull!18248) mapValue!59211)) b!1562869))

(assert (= (and b!1562871 ((_ is ValueCellFull!18248) mapDefault!59211)) b!1562870))

(assert (= start!133886 b!1562871))

(declare-fun m!1438539 () Bool)

(assert (=> b!1562868 m!1438539))

(declare-fun m!1438541 () Bool)

(assert (=> start!133886 m!1438541))

(declare-fun m!1438543 () Bool)

(assert (=> start!133886 m!1438543))

(declare-fun m!1438545 () Bool)

(assert (=> start!133886 m!1438545))

(declare-fun m!1438547 () Bool)

(assert (=> b!1562873 m!1438547))

(declare-fun m!1438549 () Bool)

(assert (=> mapNonEmpty!59211 m!1438549))

(check-sat (not b!1562873) (not start!133886) (not b!1562868) tp_is_empty!38557 (not mapNonEmpty!59211))
(check-sat)
