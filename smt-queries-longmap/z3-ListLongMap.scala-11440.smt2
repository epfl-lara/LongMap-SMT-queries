; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133440 () Bool)

(assert start!133440)

(declare-fun res!1066767 () Bool)

(declare-fun e!869251 () Bool)

(assert (=> start!133440 (=> (not res!1066767) (not e!869251))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133440 (= res!1066767 (validMask!0 mask!947))))

(assert (=> start!133440 e!869251))

(assert (=> start!133440 true))

(declare-datatypes ((array!103770 0))(
  ( (array!103771 (arr!50077 (Array (_ BitVec 32) (_ BitVec 64))) (size!50627 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103770)

(declare-fun array_inv!38925 (array!103770) Bool)

(assert (=> start!133440 (array_inv!38925 _keys!637)))

(declare-datatypes ((V!59571 0))(
  ( (V!59572 (val!19345 Int)) )
))
(declare-datatypes ((ValueCell!18231 0))(
  ( (ValueCellFull!18231 (v!22097 V!59571)) (EmptyCell!18231) )
))
(declare-datatypes ((array!103772 0))(
  ( (array!103773 (arr!50078 (Array (_ BitVec 32) ValueCell!18231)) (size!50628 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103772)

(declare-fun e!869254 () Bool)

(declare-fun array_inv!38926 (array!103772) Bool)

(assert (=> start!133440 (and (array_inv!38926 _values!487) e!869254)))

(declare-fun mapIsEmpty!59160 () Bool)

(declare-fun mapRes!59160 () Bool)

(assert (=> mapIsEmpty!59160 mapRes!59160))

(declare-fun b!1560006 () Bool)

(declare-fun e!869252 () Bool)

(assert (=> b!1560006 (= e!869254 (and e!869252 mapRes!59160))))

(declare-fun condMapEmpty!59160 () Bool)

(declare-fun mapDefault!59160 () ValueCell!18231)

(assert (=> b!1560006 (= condMapEmpty!59160 (= (arr!50078 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18231)) mapDefault!59160)))))

(declare-fun b!1560007 () Bool)

(declare-fun tp_is_empty!38523 () Bool)

(assert (=> b!1560007 (= e!869252 tp_is_empty!38523)))

(declare-fun mapNonEmpty!59160 () Bool)

(declare-fun tp!112815 () Bool)

(declare-fun e!869250 () Bool)

(assert (=> mapNonEmpty!59160 (= mapRes!59160 (and tp!112815 e!869250))))

(declare-fun mapValue!59160 () ValueCell!18231)

(declare-fun mapKey!59160 () (_ BitVec 32))

(declare-fun mapRest!59160 () (Array (_ BitVec 32) ValueCell!18231))

(assert (=> mapNonEmpty!59160 (= (arr!50078 _values!487) (store mapRest!59160 mapKey!59160 mapValue!59160))))

(declare-fun b!1560008 () Bool)

(assert (=> b!1560008 (= e!869250 tp_is_empty!38523)))

(declare-fun b!1560009 () Bool)

(declare-fun res!1066766 () Bool)

(assert (=> b!1560009 (=> (not res!1066766) (not e!869251))))

(declare-datatypes ((tuple2!25020 0))(
  ( (tuple2!25021 (_1!12521 (_ BitVec 64)) (_2!12521 V!59571)) )
))
(declare-datatypes ((List!36374 0))(
  ( (Nil!36371) (Cons!36370 (h!37816 tuple2!25020) (t!51107 List!36374)) )
))
(declare-datatypes ((ListLongMap!22455 0))(
  ( (ListLongMap!22456 (toList!11243 List!36374)) )
))
(declare-fun contains!10233 (ListLongMap!22455 (_ BitVec 64)) Bool)

(assert (=> b!1560009 (= res!1066766 (not (contains!10233 (ListLongMap!22456 Nil!36371) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1560010 () Bool)

(declare-fun res!1066763 () Bool)

(assert (=> b!1560010 (=> (not res!1066763) (not e!869251))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560010 (= res!1066763 (and (= (size!50628 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50627 _keys!637) (size!50628 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560011 () Bool)

(assert (=> b!1560011 (= e!869251 false)))

(declare-fun lt!670941 () Bool)

(assert (=> b!1560011 (= lt!670941 (contains!10233 (ListLongMap!22456 Nil!36371) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1560012 () Bool)

(declare-fun res!1066764 () Bool)

(assert (=> b!1560012 (=> (not res!1066764) (not e!869251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103770 (_ BitVec 32)) Bool)

(assert (=> b!1560012 (= res!1066764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560013 () Bool)

(declare-fun res!1066765 () Bool)

(assert (=> b!1560013 (=> (not res!1066765) (not e!869251))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560013 (= res!1066765 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50627 _keys!637)) (bvsge from!782 (size!50627 _keys!637))))))

(declare-fun b!1560014 () Bool)

(declare-fun res!1066762 () Bool)

(assert (=> b!1560014 (=> (not res!1066762) (not e!869251))))

(declare-datatypes ((List!36375 0))(
  ( (Nil!36372) (Cons!36371 (h!37817 (_ BitVec 64)) (t!51108 List!36375)) )
))
(declare-fun arrayNoDuplicates!0 (array!103770 (_ BitVec 32) List!36375) Bool)

(assert (=> b!1560014 (= res!1066762 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36372))))

(assert (= (and start!133440 res!1066767) b!1560010))

(assert (= (and b!1560010 res!1066763) b!1560012))

(assert (= (and b!1560012 res!1066764) b!1560014))

(assert (= (and b!1560014 res!1066762) b!1560013))

(assert (= (and b!1560013 res!1066765) b!1560009))

(assert (= (and b!1560009 res!1066766) b!1560011))

(assert (= (and b!1560006 condMapEmpty!59160) mapIsEmpty!59160))

(assert (= (and b!1560006 (not condMapEmpty!59160)) mapNonEmpty!59160))

(get-info :version)

(assert (= (and mapNonEmpty!59160 ((_ is ValueCellFull!18231) mapValue!59160)) b!1560008))

(assert (= (and b!1560006 ((_ is ValueCellFull!18231) mapDefault!59160)) b!1560007))

(assert (= start!133440 b!1560006))

(declare-fun m!1436021 () Bool)

(assert (=> b!1560011 m!1436021))

(declare-fun m!1436023 () Bool)

(assert (=> b!1560012 m!1436023))

(declare-fun m!1436025 () Bool)

(assert (=> b!1560014 m!1436025))

(declare-fun m!1436027 () Bool)

(assert (=> mapNonEmpty!59160 m!1436027))

(declare-fun m!1436029 () Bool)

(assert (=> b!1560009 m!1436029))

(declare-fun m!1436031 () Bool)

(assert (=> start!133440 m!1436031))

(declare-fun m!1436033 () Bool)

(assert (=> start!133440 m!1436033))

(declare-fun m!1436035 () Bool)

(assert (=> start!133440 m!1436035))

(check-sat (not b!1560012) (not b!1560009) (not mapNonEmpty!59160) (not b!1560014) tp_is_empty!38523 (not start!133440) (not b!1560011))
(check-sat)
