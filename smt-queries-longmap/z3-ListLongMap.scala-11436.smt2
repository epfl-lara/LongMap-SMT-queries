; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133826 () Bool)

(assert start!133826)

(declare-fun b!1562091 () Bool)

(declare-fun e!870567 () Bool)

(assert (=> b!1562091 (= e!870567 false)))

(declare-fun lt!671810 () Bool)

(declare-datatypes ((V!59537 0))(
  ( (V!59538 (val!19332 Int)) )
))
(declare-datatypes ((tuple2!25056 0))(
  ( (tuple2!25057 (_1!12539 (_ BitVec 64)) (_2!12539 V!59537)) )
))
(declare-datatypes ((List!36384 0))(
  ( (Nil!36381) (Cons!36380 (h!37844 tuple2!25056) (t!51109 List!36384)) )
))
(declare-datatypes ((ListLongMap!22499 0))(
  ( (ListLongMap!22500 (toList!11265 List!36384)) )
))
(declare-fun contains!10266 (ListLongMap!22499 (_ BitVec 64)) Bool)

(assert (=> b!1562091 (= lt!671810 (contains!10266 (ListLongMap!22500 Nil!36381) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1562092 () Bool)

(declare-fun res!1067392 () Bool)

(assert (=> b!1562092 (=> (not res!1067392) (not e!870567))))

(assert (=> b!1562092 (= res!1067392 (not (contains!10266 (ListLongMap!22500 Nil!36381) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1562093 () Bool)

(declare-fun e!870568 () Bool)

(declare-fun tp_is_empty!38497 () Bool)

(assert (=> b!1562093 (= e!870568 tp_is_empty!38497)))

(declare-fun mapIsEmpty!59121 () Bool)

(declare-fun mapRes!59121 () Bool)

(assert (=> mapIsEmpty!59121 mapRes!59121))

(declare-fun b!1562094 () Bool)

(declare-fun res!1067393 () Bool)

(assert (=> b!1562094 (=> (not res!1067393) (not e!870567))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103848 0))(
  ( (array!103849 (arr!50109 (Array (_ BitVec 32) (_ BitVec 64))) (size!50660 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103848)

(declare-datatypes ((ValueCell!18218 0))(
  ( (ValueCellFull!18218 (v!22076 V!59537)) (EmptyCell!18218) )
))
(declare-datatypes ((array!103850 0))(
  ( (array!103851 (arr!50110 (Array (_ BitVec 32) ValueCell!18218)) (size!50661 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103850)

(assert (=> b!1562094 (= res!1067393 (and (= (size!50661 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50660 _keys!637) (size!50661 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562095 () Bool)

(declare-fun res!1067390 () Bool)

(assert (=> b!1562095 (=> (not res!1067390) (not e!870567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103848 (_ BitVec 32)) Bool)

(assert (=> b!1562095 (= res!1067390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562096 () Bool)

(declare-fun e!870565 () Bool)

(declare-fun e!870566 () Bool)

(assert (=> b!1562096 (= e!870565 (and e!870566 mapRes!59121))))

(declare-fun condMapEmpty!59121 () Bool)

(declare-fun mapDefault!59121 () ValueCell!18218)

(assert (=> b!1562096 (= condMapEmpty!59121 (= (arr!50110 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18218)) mapDefault!59121)))))

(declare-fun mapNonEmpty!59121 () Bool)

(declare-fun tp!112776 () Bool)

(assert (=> mapNonEmpty!59121 (= mapRes!59121 (and tp!112776 e!870568))))

(declare-fun mapRest!59121 () (Array (_ BitVec 32) ValueCell!18218))

(declare-fun mapKey!59121 () (_ BitVec 32))

(declare-fun mapValue!59121 () ValueCell!18218)

(assert (=> mapNonEmpty!59121 (= (arr!50110 _values!487) (store mapRest!59121 mapKey!59121 mapValue!59121))))

(declare-fun res!1067388 () Bool)

(assert (=> start!133826 (=> (not res!1067388) (not e!870567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133826 (= res!1067388 (validMask!0 mask!947))))

(assert (=> start!133826 e!870567))

(assert (=> start!133826 true))

(declare-fun array_inv!39211 (array!103848) Bool)

(assert (=> start!133826 (array_inv!39211 _keys!637)))

(declare-fun array_inv!39212 (array!103850) Bool)

(assert (=> start!133826 (and (array_inv!39212 _values!487) e!870565)))

(declare-fun b!1562097 () Bool)

(assert (=> b!1562097 (= e!870566 tp_is_empty!38497)))

(declare-fun b!1562098 () Bool)

(declare-fun res!1067389 () Bool)

(assert (=> b!1562098 (=> (not res!1067389) (not e!870567))))

(declare-datatypes ((List!36385 0))(
  ( (Nil!36382) (Cons!36381 (h!37845 (_ BitVec 64)) (t!51110 List!36385)) )
))
(declare-fun arrayNoDuplicates!0 (array!103848 (_ BitVec 32) List!36385) Bool)

(assert (=> b!1562098 (= res!1067389 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36382))))

(declare-fun b!1562099 () Bool)

(declare-fun res!1067391 () Bool)

(assert (=> b!1562099 (=> (not res!1067391) (not e!870567))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562099 (= res!1067391 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50660 _keys!637)) (bvsge from!782 (size!50660 _keys!637))))))

(assert (= (and start!133826 res!1067388) b!1562094))

(assert (= (and b!1562094 res!1067393) b!1562095))

(assert (= (and b!1562095 res!1067390) b!1562098))

(assert (= (and b!1562098 res!1067389) b!1562099))

(assert (= (and b!1562099 res!1067391) b!1562092))

(assert (= (and b!1562092 res!1067392) b!1562091))

(assert (= (and b!1562096 condMapEmpty!59121) mapIsEmpty!59121))

(assert (= (and b!1562096 (not condMapEmpty!59121)) mapNonEmpty!59121))

(get-info :version)

(assert (= (and mapNonEmpty!59121 ((_ is ValueCellFull!18218) mapValue!59121)) b!1562093))

(assert (= (and b!1562096 ((_ is ValueCellFull!18218) mapDefault!59121)) b!1562097))

(assert (= start!133826 b!1562096))

(declare-fun m!1438071 () Bool)

(assert (=> b!1562095 m!1438071))

(declare-fun m!1438073 () Bool)

(assert (=> b!1562091 m!1438073))

(declare-fun m!1438075 () Bool)

(assert (=> b!1562098 m!1438075))

(declare-fun m!1438077 () Bool)

(assert (=> b!1562092 m!1438077))

(declare-fun m!1438079 () Bool)

(assert (=> mapNonEmpty!59121 m!1438079))

(declare-fun m!1438081 () Bool)

(assert (=> start!133826 m!1438081))

(declare-fun m!1438083 () Bool)

(assert (=> start!133826 m!1438083))

(declare-fun m!1438085 () Bool)

(assert (=> start!133826 m!1438085))

(check-sat (not b!1562098) (not b!1562095) tp_is_empty!38497 (not b!1562092) (not start!133826) (not mapNonEmpty!59121) (not b!1562091))
(check-sat)
