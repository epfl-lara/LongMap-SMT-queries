; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133422 () Bool)

(assert start!133422)

(declare-fun b!1559763 () Bool)

(declare-fun e!869119 () Bool)

(declare-fun e!869115 () Bool)

(declare-fun mapRes!59133 () Bool)

(assert (=> b!1559763 (= e!869119 (and e!869115 mapRes!59133))))

(declare-fun condMapEmpty!59133 () Bool)

(declare-datatypes ((V!59547 0))(
  ( (V!59548 (val!19336 Int)) )
))
(declare-datatypes ((ValueCell!18222 0))(
  ( (ValueCellFull!18222 (v!22088 V!59547)) (EmptyCell!18222) )
))
(declare-datatypes ((array!103736 0))(
  ( (array!103737 (arr!50060 (Array (_ BitVec 32) ValueCell!18222)) (size!50610 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103736)

(declare-fun mapDefault!59133 () ValueCell!18222)

(assert (=> b!1559763 (= condMapEmpty!59133 (= (arr!50060 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18222)) mapDefault!59133)))))

(declare-fun b!1559764 () Bool)

(declare-fun res!1066605 () Bool)

(declare-fun e!869118 () Bool)

(assert (=> b!1559764 (=> (not res!1066605) (not e!869118))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103738 0))(
  ( (array!103739 (arr!50061 (Array (_ BitVec 32) (_ BitVec 64))) (size!50611 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103738)

(assert (=> b!1559764 (= res!1066605 (and (= (size!50610 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50611 _keys!637) (size!50610 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559765 () Bool)

(declare-fun tp_is_empty!38505 () Bool)

(assert (=> b!1559765 (= e!869115 tp_is_empty!38505)))

(declare-fun mapIsEmpty!59133 () Bool)

(assert (=> mapIsEmpty!59133 mapRes!59133))

(declare-fun b!1559766 () Bool)

(declare-fun res!1066602 () Bool)

(assert (=> b!1559766 (=> (not res!1066602) (not e!869118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103738 (_ BitVec 32)) Bool)

(assert (=> b!1559766 (= res!1066602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559767 () Bool)

(declare-fun res!1066601 () Bool)

(assert (=> b!1559767 (=> (not res!1066601) (not e!869118))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559767 (= res!1066601 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50611 _keys!637)) (bvsge from!782 (size!50611 _keys!637))))))

(declare-fun b!1559768 () Bool)

(declare-fun res!1066600 () Bool)

(assert (=> b!1559768 (=> (not res!1066600) (not e!869118))))

(declare-datatypes ((List!36362 0))(
  ( (Nil!36359) (Cons!36358 (h!37804 (_ BitVec 64)) (t!51095 List!36362)) )
))
(declare-fun arrayNoDuplicates!0 (array!103738 (_ BitVec 32) List!36362) Bool)

(assert (=> b!1559768 (= res!1066600 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36359))))

(declare-fun b!1559769 () Bool)

(assert (=> b!1559769 (= e!869118 false)))

(declare-fun lt!670914 () Bool)

(declare-datatypes ((tuple2!25010 0))(
  ( (tuple2!25011 (_1!12516 (_ BitVec 64)) (_2!12516 V!59547)) )
))
(declare-datatypes ((List!36363 0))(
  ( (Nil!36360) (Cons!36359 (h!37805 tuple2!25010) (t!51096 List!36363)) )
))
(declare-datatypes ((ListLongMap!22445 0))(
  ( (ListLongMap!22446 (toList!11238 List!36363)) )
))
(declare-fun contains!10228 (ListLongMap!22445 (_ BitVec 64)) Bool)

(assert (=> b!1559769 (= lt!670914 (contains!10228 (ListLongMap!22446 Nil!36360) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1066604 () Bool)

(assert (=> start!133422 (=> (not res!1066604) (not e!869118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133422 (= res!1066604 (validMask!0 mask!947))))

(assert (=> start!133422 e!869118))

(assert (=> start!133422 true))

(declare-fun array_inv!38913 (array!103738) Bool)

(assert (=> start!133422 (array_inv!38913 _keys!637)))

(declare-fun array_inv!38914 (array!103736) Bool)

(assert (=> start!133422 (and (array_inv!38914 _values!487) e!869119)))

(declare-fun mapNonEmpty!59133 () Bool)

(declare-fun tp!112788 () Bool)

(declare-fun e!869117 () Bool)

(assert (=> mapNonEmpty!59133 (= mapRes!59133 (and tp!112788 e!869117))))

(declare-fun mapValue!59133 () ValueCell!18222)

(declare-fun mapKey!59133 () (_ BitVec 32))

(declare-fun mapRest!59133 () (Array (_ BitVec 32) ValueCell!18222))

(assert (=> mapNonEmpty!59133 (= (arr!50060 _values!487) (store mapRest!59133 mapKey!59133 mapValue!59133))))

(declare-fun b!1559770 () Bool)

(assert (=> b!1559770 (= e!869117 tp_is_empty!38505)))

(declare-fun b!1559771 () Bool)

(declare-fun res!1066603 () Bool)

(assert (=> b!1559771 (=> (not res!1066603) (not e!869118))))

(assert (=> b!1559771 (= res!1066603 (not (contains!10228 (ListLongMap!22446 Nil!36360) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!133422 res!1066604) b!1559764))

(assert (= (and b!1559764 res!1066605) b!1559766))

(assert (= (and b!1559766 res!1066602) b!1559768))

(assert (= (and b!1559768 res!1066600) b!1559767))

(assert (= (and b!1559767 res!1066601) b!1559771))

(assert (= (and b!1559771 res!1066603) b!1559769))

(assert (= (and b!1559763 condMapEmpty!59133) mapIsEmpty!59133))

(assert (= (and b!1559763 (not condMapEmpty!59133)) mapNonEmpty!59133))

(get-info :version)

(assert (= (and mapNonEmpty!59133 ((_ is ValueCellFull!18222) mapValue!59133)) b!1559770))

(assert (= (and b!1559763 ((_ is ValueCellFull!18222) mapDefault!59133)) b!1559765))

(assert (= start!133422 b!1559763))

(declare-fun m!1435877 () Bool)

(assert (=> b!1559766 m!1435877))

(declare-fun m!1435879 () Bool)

(assert (=> b!1559768 m!1435879))

(declare-fun m!1435881 () Bool)

(assert (=> b!1559769 m!1435881))

(declare-fun m!1435883 () Bool)

(assert (=> b!1559771 m!1435883))

(declare-fun m!1435885 () Bool)

(assert (=> mapNonEmpty!59133 m!1435885))

(declare-fun m!1435887 () Bool)

(assert (=> start!133422 m!1435887))

(declare-fun m!1435889 () Bool)

(assert (=> start!133422 m!1435889))

(declare-fun m!1435891 () Bool)

(assert (=> start!133422 m!1435891))

(check-sat (not b!1559766) (not b!1559768) (not b!1559771) tp_is_empty!38505 (not mapNonEmpty!59133) (not start!133422) (not b!1559769))
(check-sat)
