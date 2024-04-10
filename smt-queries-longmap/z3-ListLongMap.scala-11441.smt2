; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133446 () Bool)

(assert start!133446)

(declare-fun mapNonEmpty!59169 () Bool)

(declare-fun mapRes!59169 () Bool)

(declare-fun tp!112824 () Bool)

(declare-fun e!869295 () Bool)

(assert (=> mapNonEmpty!59169 (= mapRes!59169 (and tp!112824 e!869295))))

(declare-fun mapKey!59169 () (_ BitVec 32))

(declare-datatypes ((V!59579 0))(
  ( (V!59580 (val!19348 Int)) )
))
(declare-datatypes ((ValueCell!18234 0))(
  ( (ValueCellFull!18234 (v!22100 V!59579)) (EmptyCell!18234) )
))
(declare-datatypes ((array!103782 0))(
  ( (array!103783 (arr!50083 (Array (_ BitVec 32) ValueCell!18234)) (size!50633 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103782)

(declare-fun mapRest!59169 () (Array (_ BitVec 32) ValueCell!18234))

(declare-fun mapValue!59169 () ValueCell!18234)

(assert (=> mapNonEmpty!59169 (= (arr!50083 _values!487) (store mapRest!59169 mapKey!59169 mapValue!59169))))

(declare-fun res!1066817 () Bool)

(declare-fun e!869299 () Bool)

(assert (=> start!133446 (=> (not res!1066817) (not e!869299))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133446 (= res!1066817 (validMask!0 mask!947))))

(assert (=> start!133446 e!869299))

(assert (=> start!133446 true))

(declare-datatypes ((array!103784 0))(
  ( (array!103785 (arr!50084 (Array (_ BitVec 32) (_ BitVec 64))) (size!50634 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103784)

(declare-fun array_inv!38929 (array!103784) Bool)

(assert (=> start!133446 (array_inv!38929 _keys!637)))

(declare-fun e!869297 () Bool)

(declare-fun array_inv!38930 (array!103782) Bool)

(assert (=> start!133446 (and (array_inv!38930 _values!487) e!869297)))

(declare-fun mapIsEmpty!59169 () Bool)

(assert (=> mapIsEmpty!59169 mapRes!59169))

(declare-fun b!1560087 () Bool)

(declare-fun tp_is_empty!38529 () Bool)

(assert (=> b!1560087 (= e!869295 tp_is_empty!38529)))

(declare-fun b!1560088 () Bool)

(declare-fun res!1066816 () Bool)

(assert (=> b!1560088 (=> (not res!1066816) (not e!869299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103784 (_ BitVec 32)) Bool)

(assert (=> b!1560088 (= res!1066816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560089 () Bool)

(declare-fun res!1066818 () Bool)

(assert (=> b!1560089 (=> (not res!1066818) (not e!869299))))

(declare-datatypes ((tuple2!25026 0))(
  ( (tuple2!25027 (_1!12524 (_ BitVec 64)) (_2!12524 V!59579)) )
))
(declare-datatypes ((List!36379 0))(
  ( (Nil!36376) (Cons!36375 (h!37821 tuple2!25026) (t!51112 List!36379)) )
))
(declare-datatypes ((ListLongMap!22461 0))(
  ( (ListLongMap!22462 (toList!11246 List!36379)) )
))
(declare-fun contains!10236 (ListLongMap!22461 (_ BitVec 64)) Bool)

(assert (=> b!1560089 (= res!1066818 (not (contains!10236 (ListLongMap!22462 Nil!36376) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1560090 () Bool)

(declare-fun res!1066819 () Bool)

(assert (=> b!1560090 (=> (not res!1066819) (not e!869299))))

(declare-datatypes ((List!36380 0))(
  ( (Nil!36377) (Cons!36376 (h!37822 (_ BitVec 64)) (t!51113 List!36380)) )
))
(declare-fun arrayNoDuplicates!0 (array!103784 (_ BitVec 32) List!36380) Bool)

(assert (=> b!1560090 (= res!1066819 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36377))))

(declare-fun b!1560091 () Bool)

(declare-fun e!869296 () Bool)

(assert (=> b!1560091 (= e!869297 (and e!869296 mapRes!59169))))

(declare-fun condMapEmpty!59169 () Bool)

(declare-fun mapDefault!59169 () ValueCell!18234)

(assert (=> b!1560091 (= condMapEmpty!59169 (= (arr!50083 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18234)) mapDefault!59169)))))

(declare-fun b!1560092 () Bool)

(assert (=> b!1560092 (= e!869299 false)))

(declare-fun lt!670950 () Bool)

(assert (=> b!1560092 (= lt!670950 (contains!10236 (ListLongMap!22462 Nil!36376) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1560093 () Bool)

(declare-fun res!1066820 () Bool)

(assert (=> b!1560093 (=> (not res!1066820) (not e!869299))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560093 (= res!1066820 (and (= (size!50633 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50634 _keys!637) (size!50633 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560094 () Bool)

(assert (=> b!1560094 (= e!869296 tp_is_empty!38529)))

(declare-fun b!1560095 () Bool)

(declare-fun res!1066821 () Bool)

(assert (=> b!1560095 (=> (not res!1066821) (not e!869299))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560095 (= res!1066821 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50634 _keys!637)) (bvsge from!782 (size!50634 _keys!637))))))

(assert (= (and start!133446 res!1066817) b!1560093))

(assert (= (and b!1560093 res!1066820) b!1560088))

(assert (= (and b!1560088 res!1066816) b!1560090))

(assert (= (and b!1560090 res!1066819) b!1560095))

(assert (= (and b!1560095 res!1066821) b!1560089))

(assert (= (and b!1560089 res!1066818) b!1560092))

(assert (= (and b!1560091 condMapEmpty!59169) mapIsEmpty!59169))

(assert (= (and b!1560091 (not condMapEmpty!59169)) mapNonEmpty!59169))

(get-info :version)

(assert (= (and mapNonEmpty!59169 ((_ is ValueCellFull!18234) mapValue!59169)) b!1560087))

(assert (= (and b!1560091 ((_ is ValueCellFull!18234) mapDefault!59169)) b!1560094))

(assert (= start!133446 b!1560091))

(declare-fun m!1436069 () Bool)

(assert (=> b!1560092 m!1436069))

(declare-fun m!1436071 () Bool)

(assert (=> b!1560088 m!1436071))

(declare-fun m!1436073 () Bool)

(assert (=> mapNonEmpty!59169 m!1436073))

(declare-fun m!1436075 () Bool)

(assert (=> start!133446 m!1436075))

(declare-fun m!1436077 () Bool)

(assert (=> start!133446 m!1436077))

(declare-fun m!1436079 () Bool)

(assert (=> start!133446 m!1436079))

(declare-fun m!1436081 () Bool)

(assert (=> b!1560090 m!1436081))

(declare-fun m!1436083 () Bool)

(assert (=> b!1560089 m!1436083))

(check-sat tp_is_empty!38529 (not mapNonEmpty!59169) (not b!1560089) (not b!1560090) (not start!133446) (not b!1560092) (not b!1560088))
(check-sat)
