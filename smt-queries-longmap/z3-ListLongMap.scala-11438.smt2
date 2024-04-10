; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133428 () Bool)

(assert start!133428)

(declare-fun b!1559844 () Bool)

(declare-fun e!869162 () Bool)

(assert (=> b!1559844 (= e!869162 false)))

(declare-fun lt!670923 () Bool)

(declare-datatypes ((V!59555 0))(
  ( (V!59556 (val!19339 Int)) )
))
(declare-datatypes ((tuple2!25012 0))(
  ( (tuple2!25013 (_1!12517 (_ BitVec 64)) (_2!12517 V!59555)) )
))
(declare-datatypes ((List!36365 0))(
  ( (Nil!36362) (Cons!36361 (h!37807 tuple2!25012) (t!51098 List!36365)) )
))
(declare-datatypes ((ListLongMap!22447 0))(
  ( (ListLongMap!22448 (toList!11239 List!36365)) )
))
(declare-fun contains!10229 (ListLongMap!22447 (_ BitVec 64)) Bool)

(assert (=> b!1559844 (= lt!670923 (contains!10229 (ListLongMap!22448 Nil!36362) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559845 () Bool)

(declare-fun e!869163 () Bool)

(declare-fun tp_is_empty!38511 () Bool)

(assert (=> b!1559845 (= e!869163 tp_is_empty!38511)))

(declare-fun res!1066656 () Bool)

(assert (=> start!133428 (=> (not res!1066656) (not e!869162))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133428 (= res!1066656 (validMask!0 mask!947))))

(assert (=> start!133428 e!869162))

(assert (=> start!133428 true))

(declare-datatypes ((array!103748 0))(
  ( (array!103749 (arr!50066 (Array (_ BitVec 32) (_ BitVec 64))) (size!50616 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103748)

(declare-fun array_inv!38917 (array!103748) Bool)

(assert (=> start!133428 (array_inv!38917 _keys!637)))

(declare-datatypes ((ValueCell!18225 0))(
  ( (ValueCellFull!18225 (v!22091 V!59555)) (EmptyCell!18225) )
))
(declare-datatypes ((array!103750 0))(
  ( (array!103751 (arr!50067 (Array (_ BitVec 32) ValueCell!18225)) (size!50617 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103750)

(declare-fun e!869164 () Bool)

(declare-fun array_inv!38918 (array!103750) Bool)

(assert (=> start!133428 (and (array_inv!38918 _values!487) e!869164)))

(declare-fun mapNonEmpty!59142 () Bool)

(declare-fun mapRes!59142 () Bool)

(declare-fun tp!112797 () Bool)

(assert (=> mapNonEmpty!59142 (= mapRes!59142 (and tp!112797 e!869163))))

(declare-fun mapKey!59142 () (_ BitVec 32))

(declare-fun mapRest!59142 () (Array (_ BitVec 32) ValueCell!18225))

(declare-fun mapValue!59142 () ValueCell!18225)

(assert (=> mapNonEmpty!59142 (= (arr!50067 _values!487) (store mapRest!59142 mapKey!59142 mapValue!59142))))

(declare-fun b!1559846 () Bool)

(declare-fun res!1066654 () Bool)

(assert (=> b!1559846 (=> (not res!1066654) (not e!869162))))

(assert (=> b!1559846 (= res!1066654 (not (contains!10229 (ListLongMap!22448 Nil!36362) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559847 () Bool)

(declare-fun e!869161 () Bool)

(assert (=> b!1559847 (= e!869164 (and e!869161 mapRes!59142))))

(declare-fun condMapEmpty!59142 () Bool)

(declare-fun mapDefault!59142 () ValueCell!18225)

(assert (=> b!1559847 (= condMapEmpty!59142 (= (arr!50067 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18225)) mapDefault!59142)))))

(declare-fun b!1559848 () Bool)

(declare-fun res!1066659 () Bool)

(assert (=> b!1559848 (=> (not res!1066659) (not e!869162))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559848 (= res!1066659 (and (= (size!50617 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50616 _keys!637) (size!50617 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59142 () Bool)

(assert (=> mapIsEmpty!59142 mapRes!59142))

(declare-fun b!1559849 () Bool)

(declare-fun res!1066655 () Bool)

(assert (=> b!1559849 (=> (not res!1066655) (not e!869162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103748 (_ BitVec 32)) Bool)

(assert (=> b!1559849 (= res!1066655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559850 () Bool)

(declare-fun res!1066657 () Bool)

(assert (=> b!1559850 (=> (not res!1066657) (not e!869162))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559850 (= res!1066657 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50616 _keys!637)) (bvsge from!782 (size!50616 _keys!637))))))

(declare-fun b!1559851 () Bool)

(assert (=> b!1559851 (= e!869161 tp_is_empty!38511)))

(declare-fun b!1559852 () Bool)

(declare-fun res!1066658 () Bool)

(assert (=> b!1559852 (=> (not res!1066658) (not e!869162))))

(declare-datatypes ((List!36366 0))(
  ( (Nil!36363) (Cons!36362 (h!37808 (_ BitVec 64)) (t!51099 List!36366)) )
))
(declare-fun arrayNoDuplicates!0 (array!103748 (_ BitVec 32) List!36366) Bool)

(assert (=> b!1559852 (= res!1066658 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36363))))

(assert (= (and start!133428 res!1066656) b!1559848))

(assert (= (and b!1559848 res!1066659) b!1559849))

(assert (= (and b!1559849 res!1066655) b!1559852))

(assert (= (and b!1559852 res!1066658) b!1559850))

(assert (= (and b!1559850 res!1066657) b!1559846))

(assert (= (and b!1559846 res!1066654) b!1559844))

(assert (= (and b!1559847 condMapEmpty!59142) mapIsEmpty!59142))

(assert (= (and b!1559847 (not condMapEmpty!59142)) mapNonEmpty!59142))

(get-info :version)

(assert (= (and mapNonEmpty!59142 ((_ is ValueCellFull!18225) mapValue!59142)) b!1559845))

(assert (= (and b!1559847 ((_ is ValueCellFull!18225) mapDefault!59142)) b!1559851))

(assert (= start!133428 b!1559847))

(declare-fun m!1435925 () Bool)

(assert (=> mapNonEmpty!59142 m!1435925))

(declare-fun m!1435927 () Bool)

(assert (=> b!1559846 m!1435927))

(declare-fun m!1435929 () Bool)

(assert (=> start!133428 m!1435929))

(declare-fun m!1435931 () Bool)

(assert (=> start!133428 m!1435931))

(declare-fun m!1435933 () Bool)

(assert (=> start!133428 m!1435933))

(declare-fun m!1435935 () Bool)

(assert (=> b!1559849 m!1435935))

(declare-fun m!1435937 () Bool)

(assert (=> b!1559852 m!1435937))

(declare-fun m!1435939 () Bool)

(assert (=> b!1559844 m!1435939))

(check-sat (not b!1559852) (not b!1559844) (not b!1559849) tp_is_empty!38511 (not b!1559846) (not mapNonEmpty!59142) (not start!133428))
(check-sat)
