; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133394 () Bool)

(assert start!133394)

(declare-fun b!1559747 () Bool)

(declare-fun res!1066670 () Bool)

(declare-fun e!869085 () Bool)

(assert (=> b!1559747 (=> (not res!1066670) (not e!869085))))

(declare-datatypes ((V!59577 0))(
  ( (V!59578 (val!19347 Int)) )
))
(declare-datatypes ((tuple2!25096 0))(
  ( (tuple2!25097 (_1!12559 (_ BitVec 64)) (_2!12559 V!59577)) )
))
(declare-datatypes ((List!36416 0))(
  ( (Nil!36413) (Cons!36412 (h!37859 tuple2!25096) (t!51141 List!36416)) )
))
(declare-datatypes ((ListLongMap!22531 0))(
  ( (ListLongMap!22532 (toList!11281 List!36416)) )
))
(declare-fun contains!10191 (ListLongMap!22531 (_ BitVec 64)) Bool)

(assert (=> b!1559747 (= res!1066670 (not (contains!10191 (ListLongMap!22532 Nil!36413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559748 () Bool)

(declare-fun e!869084 () Bool)

(declare-fun tp_is_empty!38527 () Bool)

(assert (=> b!1559748 (= e!869084 tp_is_empty!38527)))

(declare-fun b!1559749 () Bool)

(assert (=> b!1559749 (= e!869085 false)))

(declare-fun lt!670661 () Bool)

(assert (=> b!1559749 (= lt!670661 (contains!10191 (ListLongMap!22532 Nil!36413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559750 () Bool)

(declare-fun res!1066674 () Bool)

(assert (=> b!1559750 (=> (not res!1066674) (not e!869085))))

(declare-datatypes ((array!103698 0))(
  ( (array!103699 (arr!50042 (Array (_ BitVec 32) (_ BitVec 64))) (size!50594 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103698)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103698 (_ BitVec 32)) Bool)

(assert (=> b!1559750 (= res!1066674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559751 () Bool)

(declare-fun e!869083 () Bool)

(assert (=> b!1559751 (= e!869083 tp_is_empty!38527)))

(declare-fun b!1559752 () Bool)

(declare-fun e!869086 () Bool)

(declare-fun mapRes!59166 () Bool)

(assert (=> b!1559752 (= e!869086 (and e!869084 mapRes!59166))))

(declare-fun condMapEmpty!59166 () Bool)

(declare-datatypes ((ValueCell!18233 0))(
  ( (ValueCellFull!18233 (v!22095 V!59577)) (EmptyCell!18233) )
))
(declare-datatypes ((array!103700 0))(
  ( (array!103701 (arr!50043 (Array (_ BitVec 32) ValueCell!18233)) (size!50595 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103700)

(declare-fun mapDefault!59166 () ValueCell!18233)

(assert (=> b!1559752 (= condMapEmpty!59166 (= (arr!50043 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18233)) mapDefault!59166)))))

(declare-fun mapNonEmpty!59166 () Bool)

(declare-fun tp!112822 () Bool)

(assert (=> mapNonEmpty!59166 (= mapRes!59166 (and tp!112822 e!869083))))

(declare-fun mapRest!59166 () (Array (_ BitVec 32) ValueCell!18233))

(declare-fun mapValue!59166 () ValueCell!18233)

(declare-fun mapKey!59166 () (_ BitVec 32))

(assert (=> mapNonEmpty!59166 (= (arr!50043 _values!487) (store mapRest!59166 mapKey!59166 mapValue!59166))))

(declare-fun res!1066669 () Bool)

(assert (=> start!133394 (=> (not res!1066669) (not e!869085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133394 (= res!1066669 (validMask!0 mask!947))))

(assert (=> start!133394 e!869085))

(assert (=> start!133394 true))

(declare-fun array_inv!39103 (array!103698) Bool)

(assert (=> start!133394 (array_inv!39103 _keys!637)))

(declare-fun array_inv!39104 (array!103700) Bool)

(assert (=> start!133394 (and (array_inv!39104 _values!487) e!869086)))

(declare-fun b!1559753 () Bool)

(declare-fun res!1066673 () Bool)

(assert (=> b!1559753 (=> (not res!1066673) (not e!869085))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559753 (= res!1066673 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50594 _keys!637)) (bvsge from!782 (size!50594 _keys!637))))))

(declare-fun b!1559754 () Bool)

(declare-fun res!1066671 () Bool)

(assert (=> b!1559754 (=> (not res!1066671) (not e!869085))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559754 (= res!1066671 (and (= (size!50595 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50594 _keys!637) (size!50595 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559755 () Bool)

(declare-fun res!1066672 () Bool)

(assert (=> b!1559755 (=> (not res!1066672) (not e!869085))))

(declare-datatypes ((List!36417 0))(
  ( (Nil!36414) (Cons!36413 (h!37860 (_ BitVec 64)) (t!51142 List!36417)) )
))
(declare-fun arrayNoDuplicates!0 (array!103698 (_ BitVec 32) List!36417) Bool)

(assert (=> b!1559755 (= res!1066672 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36414))))

(declare-fun mapIsEmpty!59166 () Bool)

(assert (=> mapIsEmpty!59166 mapRes!59166))

(assert (= (and start!133394 res!1066669) b!1559754))

(assert (= (and b!1559754 res!1066671) b!1559750))

(assert (= (and b!1559750 res!1066674) b!1559755))

(assert (= (and b!1559755 res!1066672) b!1559753))

(assert (= (and b!1559753 res!1066673) b!1559747))

(assert (= (and b!1559747 res!1066670) b!1559749))

(assert (= (and b!1559752 condMapEmpty!59166) mapIsEmpty!59166))

(assert (= (and b!1559752 (not condMapEmpty!59166)) mapNonEmpty!59166))

(get-info :version)

(assert (= (and mapNonEmpty!59166 ((_ is ValueCellFull!18233) mapValue!59166)) b!1559751))

(assert (= (and b!1559752 ((_ is ValueCellFull!18233) mapDefault!59166)) b!1559748))

(assert (= start!133394 b!1559752))

(declare-fun m!1435161 () Bool)

(assert (=> mapNonEmpty!59166 m!1435161))

(declare-fun m!1435163 () Bool)

(assert (=> start!133394 m!1435163))

(declare-fun m!1435165 () Bool)

(assert (=> start!133394 m!1435165))

(declare-fun m!1435167 () Bool)

(assert (=> start!133394 m!1435167))

(declare-fun m!1435169 () Bool)

(assert (=> b!1559755 m!1435169))

(declare-fun m!1435171 () Bool)

(assert (=> b!1559749 m!1435171))

(declare-fun m!1435173 () Bool)

(assert (=> b!1559750 m!1435173))

(declare-fun m!1435175 () Bool)

(assert (=> b!1559747 m!1435175))

(check-sat (not b!1559755) (not b!1559749) (not b!1559747) (not mapNonEmpty!59166) (not start!133394) tp_is_empty!38527 (not b!1559750))
(check-sat)
