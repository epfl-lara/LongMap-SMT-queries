; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133518 () Bool)

(assert start!133518)

(declare-fun b!1560843 () Bool)

(declare-fun e!869839 () Bool)

(declare-fun e!869835 () Bool)

(declare-fun mapRes!59277 () Bool)

(assert (=> b!1560843 (= e!869839 (and e!869835 mapRes!59277))))

(declare-fun condMapEmpty!59277 () Bool)

(declare-datatypes ((V!59675 0))(
  ( (V!59676 (val!19384 Int)) )
))
(declare-datatypes ((ValueCell!18270 0))(
  ( (ValueCellFull!18270 (v!22136 V!59675)) (EmptyCell!18270) )
))
(declare-datatypes ((array!103920 0))(
  ( (array!103921 (arr!50152 (Array (_ BitVec 32) ValueCell!18270)) (size!50702 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103920)

(declare-fun mapDefault!59277 () ValueCell!18270)

(assert (=> b!1560843 (= condMapEmpty!59277 (= (arr!50152 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18270)) mapDefault!59277)))))

(declare-fun b!1560845 () Bool)

(declare-fun res!1067250 () Bool)

(declare-fun e!869838 () Bool)

(assert (=> b!1560845 (=> (not res!1067250) (not e!869838))))

(declare-datatypes ((array!103922 0))(
  ( (array!103923 (arr!50153 (Array (_ BitVec 32) (_ BitVec 64))) (size!50703 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103922)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103922 (_ BitVec 32)) Bool)

(assert (=> b!1560845 (= res!1067250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59277 () Bool)

(assert (=> mapIsEmpty!59277 mapRes!59277))

(declare-fun b!1560846 () Bool)

(declare-fun res!1067251 () Bool)

(assert (=> b!1560846 (=> (not res!1067251) (not e!869838))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560846 (= res!1067251 (and (= (size!50702 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50703 _keys!637) (size!50702 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560847 () Bool)

(declare-fun res!1067252 () Bool)

(assert (=> b!1560847 (=> (not res!1067252) (not e!869838))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560847 (= res!1067252 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50703 _keys!637)) (bvslt from!782 (size!50703 _keys!637))))))

(declare-fun b!1560848 () Bool)

(declare-fun e!869837 () Bool)

(declare-fun tp_is_empty!38601 () Bool)

(assert (=> b!1560848 (= e!869837 tp_is_empty!38601)))

(declare-fun mapNonEmpty!59277 () Bool)

(declare-fun tp!112932 () Bool)

(assert (=> mapNonEmpty!59277 (= mapRes!59277 (and tp!112932 e!869837))))

(declare-fun mapValue!59277 () ValueCell!18270)

(declare-fun mapRest!59277 () (Array (_ BitVec 32) ValueCell!18270))

(declare-fun mapKey!59277 () (_ BitVec 32))

(assert (=> mapNonEmpty!59277 (= (arr!50152 _values!487) (store mapRest!59277 mapKey!59277 mapValue!59277))))

(declare-fun b!1560844 () Bool)

(assert (=> b!1560844 (= e!869838 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun res!1067253 () Bool)

(assert (=> start!133518 (=> (not res!1067253) (not e!869838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133518 (= res!1067253 (validMask!0 mask!947))))

(assert (=> start!133518 e!869838))

(assert (=> start!133518 true))

(declare-fun array_inv!38987 (array!103922) Bool)

(assert (=> start!133518 (array_inv!38987 _keys!637)))

(declare-fun array_inv!38988 (array!103920) Bool)

(assert (=> start!133518 (and (array_inv!38988 _values!487) e!869839)))

(declare-fun b!1560849 () Bool)

(declare-fun res!1067248 () Bool)

(assert (=> b!1560849 (=> (not res!1067248) (not e!869838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560849 (= res!1067248 (validKeyInArray!0 (select (arr!50153 _keys!637) from!782)))))

(declare-fun b!1560850 () Bool)

(declare-fun res!1067249 () Bool)

(assert (=> b!1560850 (=> (not res!1067249) (not e!869838))))

(declare-datatypes ((List!36410 0))(
  ( (Nil!36407) (Cons!36406 (h!37852 (_ BitVec 64)) (t!51143 List!36410)) )
))
(declare-fun arrayNoDuplicates!0 (array!103922 (_ BitVec 32) List!36410) Bool)

(assert (=> b!1560850 (= res!1067249 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36407))))

(declare-fun b!1560851 () Bool)

(assert (=> b!1560851 (= e!869835 tp_is_empty!38601)))

(assert (= (and start!133518 res!1067253) b!1560846))

(assert (= (and b!1560846 res!1067251) b!1560845))

(assert (= (and b!1560845 res!1067250) b!1560850))

(assert (= (and b!1560850 res!1067249) b!1560847))

(assert (= (and b!1560847 res!1067252) b!1560849))

(assert (= (and b!1560849 res!1067248) b!1560844))

(assert (= (and b!1560843 condMapEmpty!59277) mapIsEmpty!59277))

(assert (= (and b!1560843 (not condMapEmpty!59277)) mapNonEmpty!59277))

(get-info :version)

(assert (= (and mapNonEmpty!59277 ((_ is ValueCellFull!18270) mapValue!59277)) b!1560848))

(assert (= (and b!1560843 ((_ is ValueCellFull!18270) mapDefault!59277)) b!1560851))

(assert (= start!133518 b!1560843))

(declare-fun m!1436549 () Bool)

(assert (=> mapNonEmpty!59277 m!1436549))

(declare-fun m!1436551 () Bool)

(assert (=> b!1560850 m!1436551))

(declare-fun m!1436553 () Bool)

(assert (=> b!1560845 m!1436553))

(declare-fun m!1436555 () Bool)

(assert (=> start!133518 m!1436555))

(declare-fun m!1436557 () Bool)

(assert (=> start!133518 m!1436557))

(declare-fun m!1436559 () Bool)

(assert (=> start!133518 m!1436559))

(declare-fun m!1436561 () Bool)

(assert (=> b!1560849 m!1436561))

(assert (=> b!1560849 m!1436561))

(declare-fun m!1436563 () Bool)

(assert (=> b!1560849 m!1436563))

(check-sat (not b!1560850) (not b!1560849) (not b!1560845) tp_is_empty!38601 (not mapNonEmpty!59277) (not start!133518))
(check-sat)
