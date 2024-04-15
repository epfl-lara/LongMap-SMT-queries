; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133388 () Bool)

(assert start!133388)

(declare-fun b!1559666 () Bool)

(declare-fun res!1066620 () Bool)

(declare-fun e!869039 () Bool)

(assert (=> b!1559666 (=> (not res!1066620) (not e!869039))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103686 0))(
  ( (array!103687 (arr!50036 (Array (_ BitVec 32) (_ BitVec 64))) (size!50588 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103686)

(declare-datatypes ((V!59569 0))(
  ( (V!59570 (val!19344 Int)) )
))
(declare-datatypes ((ValueCell!18230 0))(
  ( (ValueCellFull!18230 (v!22092 V!59569)) (EmptyCell!18230) )
))
(declare-datatypes ((array!103688 0))(
  ( (array!103689 (arr!50037 (Array (_ BitVec 32) ValueCell!18230)) (size!50589 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103688)

(assert (=> b!1559666 (= res!1066620 (and (= (size!50589 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50588 _keys!637) (size!50589 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1066615 () Bool)

(assert (=> start!133388 (=> (not res!1066615) (not e!869039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133388 (= res!1066615 (validMask!0 mask!947))))

(assert (=> start!133388 e!869039))

(assert (=> start!133388 true))

(declare-fun array_inv!39099 (array!103686) Bool)

(assert (=> start!133388 (array_inv!39099 _keys!637)))

(declare-fun e!869040 () Bool)

(declare-fun array_inv!39100 (array!103688) Bool)

(assert (=> start!133388 (and (array_inv!39100 _values!487) e!869040)))

(declare-fun b!1559667 () Bool)

(declare-fun e!869038 () Bool)

(declare-fun tp_is_empty!38521 () Bool)

(assert (=> b!1559667 (= e!869038 tp_is_empty!38521)))

(declare-fun b!1559668 () Bool)

(declare-fun e!869041 () Bool)

(declare-fun mapRes!59157 () Bool)

(assert (=> b!1559668 (= e!869040 (and e!869041 mapRes!59157))))

(declare-fun condMapEmpty!59157 () Bool)

(declare-fun mapDefault!59157 () ValueCell!18230)

(assert (=> b!1559668 (= condMapEmpty!59157 (= (arr!50037 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18230)) mapDefault!59157)))))

(declare-fun b!1559669 () Bool)

(declare-fun res!1066619 () Bool)

(assert (=> b!1559669 (=> (not res!1066619) (not e!869039))))

(declare-datatypes ((List!36414 0))(
  ( (Nil!36411) (Cons!36410 (h!37857 (_ BitVec 64)) (t!51139 List!36414)) )
))
(declare-fun arrayNoDuplicates!0 (array!103686 (_ BitVec 32) List!36414) Bool)

(assert (=> b!1559669 (= res!1066619 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36411))))

(declare-fun mapIsEmpty!59157 () Bool)

(assert (=> mapIsEmpty!59157 mapRes!59157))

(declare-fun b!1559670 () Bool)

(declare-fun res!1066617 () Bool)

(assert (=> b!1559670 (=> (not res!1066617) (not e!869039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103686 (_ BitVec 32)) Bool)

(assert (=> b!1559670 (= res!1066617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559671 () Bool)

(assert (=> b!1559671 (= e!869039 false)))

(declare-fun lt!670652 () Bool)

(declare-datatypes ((tuple2!25094 0))(
  ( (tuple2!25095 (_1!12558 (_ BitVec 64)) (_2!12558 V!59569)) )
))
(declare-datatypes ((List!36415 0))(
  ( (Nil!36412) (Cons!36411 (h!37858 tuple2!25094) (t!51140 List!36415)) )
))
(declare-datatypes ((ListLongMap!22529 0))(
  ( (ListLongMap!22530 (toList!11280 List!36415)) )
))
(declare-fun contains!10190 (ListLongMap!22529 (_ BitVec 64)) Bool)

(assert (=> b!1559671 (= lt!670652 (contains!10190 (ListLongMap!22530 Nil!36412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559672 () Bool)

(declare-fun res!1066616 () Bool)

(assert (=> b!1559672 (=> (not res!1066616) (not e!869039))))

(assert (=> b!1559672 (= res!1066616 (not (contains!10190 (ListLongMap!22530 Nil!36412) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559673 () Bool)

(declare-fun res!1066618 () Bool)

(assert (=> b!1559673 (=> (not res!1066618) (not e!869039))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559673 (= res!1066618 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50588 _keys!637)) (bvsge from!782 (size!50588 _keys!637))))))

(declare-fun b!1559674 () Bool)

(assert (=> b!1559674 (= e!869041 tp_is_empty!38521)))

(declare-fun mapNonEmpty!59157 () Bool)

(declare-fun tp!112813 () Bool)

(assert (=> mapNonEmpty!59157 (= mapRes!59157 (and tp!112813 e!869038))))

(declare-fun mapValue!59157 () ValueCell!18230)

(declare-fun mapKey!59157 () (_ BitVec 32))

(declare-fun mapRest!59157 () (Array (_ BitVec 32) ValueCell!18230))

(assert (=> mapNonEmpty!59157 (= (arr!50037 _values!487) (store mapRest!59157 mapKey!59157 mapValue!59157))))

(assert (= (and start!133388 res!1066615) b!1559666))

(assert (= (and b!1559666 res!1066620) b!1559670))

(assert (= (and b!1559670 res!1066617) b!1559669))

(assert (= (and b!1559669 res!1066619) b!1559673))

(assert (= (and b!1559673 res!1066618) b!1559672))

(assert (= (and b!1559672 res!1066616) b!1559671))

(assert (= (and b!1559668 condMapEmpty!59157) mapIsEmpty!59157))

(assert (= (and b!1559668 (not condMapEmpty!59157)) mapNonEmpty!59157))

(get-info :version)

(assert (= (and mapNonEmpty!59157 ((_ is ValueCellFull!18230) mapValue!59157)) b!1559667))

(assert (= (and b!1559668 ((_ is ValueCellFull!18230) mapDefault!59157)) b!1559674))

(assert (= start!133388 b!1559668))

(declare-fun m!1435113 () Bool)

(assert (=> b!1559672 m!1435113))

(declare-fun m!1435115 () Bool)

(assert (=> start!133388 m!1435115))

(declare-fun m!1435117 () Bool)

(assert (=> start!133388 m!1435117))

(declare-fun m!1435119 () Bool)

(assert (=> start!133388 m!1435119))

(declare-fun m!1435121 () Bool)

(assert (=> b!1559669 m!1435121))

(declare-fun m!1435123 () Bool)

(assert (=> b!1559671 m!1435123))

(declare-fun m!1435125 () Bool)

(assert (=> b!1559670 m!1435125))

(declare-fun m!1435127 () Bool)

(assert (=> mapNonEmpty!59157 m!1435127))

(check-sat (not mapNonEmpty!59157) (not b!1559669) (not start!133388) tp_is_empty!38521 (not b!1559672) (not b!1559671) (not b!1559670))
(check-sat)
