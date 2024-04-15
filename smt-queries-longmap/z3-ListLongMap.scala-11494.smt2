; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133722 () Bool)

(assert start!133722)

(declare-fun b!1563847 () Bool)

(declare-fun e!871593 () Bool)

(assert (=> b!1563847 (= e!871593 false)))

(declare-fun lt!671723 () Bool)

(declare-datatypes ((V!60001 0))(
  ( (V!60002 (val!19506 Int)) )
))
(declare-datatypes ((tuple2!25244 0))(
  ( (tuple2!25245 (_1!12633 (_ BitVec 64)) (_2!12633 V!60001)) )
))
(declare-datatypes ((List!36601 0))(
  ( (Nil!36598) (Cons!36597 (h!38044 tuple2!25244) (t!51440 List!36601)) )
))
(declare-datatypes ((ListLongMap!22679 0))(
  ( (ListLongMap!22680 (toList!11355 List!36601)) )
))
(declare-fun contains!10266 (ListLongMap!22679 (_ BitVec 64)) Bool)

(assert (=> b!1563847 (= lt!671723 (contains!10266 (ListLongMap!22680 Nil!36598) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563848 () Bool)

(declare-fun e!871596 () Bool)

(declare-fun tp_is_empty!38845 () Bool)

(assert (=> b!1563848 (= e!871596 tp_is_empty!38845)))

(declare-fun res!1069204 () Bool)

(assert (=> start!133722 (=> (not res!1069204) (not e!871593))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133722 (= res!1069204 (validMask!0 mask!947))))

(assert (=> start!133722 e!871593))

(assert (=> start!133722 true))

(declare-datatypes ((array!104308 0))(
  ( (array!104309 (arr!50346 (Array (_ BitVec 32) (_ BitVec 64))) (size!50898 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104308)

(declare-fun array_inv!39323 (array!104308) Bool)

(assert (=> start!133722 (array_inv!39323 _keys!637)))

(declare-datatypes ((ValueCell!18392 0))(
  ( (ValueCellFull!18392 (v!22254 V!60001)) (EmptyCell!18392) )
))
(declare-datatypes ((array!104310 0))(
  ( (array!104311 (arr!50347 (Array (_ BitVec 32) ValueCell!18392)) (size!50899 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104310)

(declare-fun e!871597 () Bool)

(declare-fun array_inv!39324 (array!104310) Bool)

(assert (=> start!133722 (and (array_inv!39324 _values!487) e!871597)))

(declare-fun b!1563849 () Bool)

(declare-fun mapRes!59646 () Bool)

(assert (=> b!1563849 (= e!871597 (and e!871596 mapRes!59646))))

(declare-fun condMapEmpty!59646 () Bool)

(declare-fun mapDefault!59646 () ValueCell!18392)

(assert (=> b!1563849 (= condMapEmpty!59646 (= (arr!50347 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18392)) mapDefault!59646)))))

(declare-fun b!1563850 () Bool)

(declare-fun res!1069205 () Bool)

(assert (=> b!1563850 (=> (not res!1069205) (not e!871593))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1563850 (= res!1069205 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50898 _keys!637)) (bvsge from!782 (size!50898 _keys!637))))))

(declare-fun b!1563851 () Bool)

(declare-fun res!1069207 () Bool)

(assert (=> b!1563851 (=> (not res!1069207) (not e!871593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104308 (_ BitVec 32)) Bool)

(assert (=> b!1563851 (= res!1069207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563852 () Bool)

(declare-fun res!1069208 () Bool)

(assert (=> b!1563852 (=> (not res!1069208) (not e!871593))))

(assert (=> b!1563852 (= res!1069208 (not (contains!10266 (ListLongMap!22680 Nil!36598) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1563853 () Bool)

(declare-fun e!871595 () Bool)

(assert (=> b!1563853 (= e!871595 tp_is_empty!38845)))

(declare-fun b!1563854 () Bool)

(declare-fun res!1069209 () Bool)

(assert (=> b!1563854 (=> (not res!1069209) (not e!871593))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563854 (= res!1069209 (and (= (size!50899 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50898 _keys!637) (size!50899 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59646 () Bool)

(assert (=> mapIsEmpty!59646 mapRes!59646))

(declare-fun mapNonEmpty!59646 () Bool)

(declare-fun tp!113572 () Bool)

(assert (=> mapNonEmpty!59646 (= mapRes!59646 (and tp!113572 e!871595))))

(declare-fun mapRest!59646 () (Array (_ BitVec 32) ValueCell!18392))

(declare-fun mapKey!59646 () (_ BitVec 32))

(declare-fun mapValue!59646 () ValueCell!18392)

(assert (=> mapNonEmpty!59646 (= (arr!50347 _values!487) (store mapRest!59646 mapKey!59646 mapValue!59646))))

(declare-fun b!1563855 () Bool)

(declare-fun res!1069206 () Bool)

(assert (=> b!1563855 (=> (not res!1069206) (not e!871593))))

(declare-datatypes ((List!36602 0))(
  ( (Nil!36599) (Cons!36598 (h!38045 (_ BitVec 64)) (t!51441 List!36602)) )
))
(declare-fun arrayNoDuplicates!0 (array!104308 (_ BitVec 32) List!36602) Bool)

(assert (=> b!1563855 (= res!1069206 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36599))))

(assert (= (and start!133722 res!1069204) b!1563854))

(assert (= (and b!1563854 res!1069209) b!1563851))

(assert (= (and b!1563851 res!1069207) b!1563855))

(assert (= (and b!1563855 res!1069206) b!1563850))

(assert (= (and b!1563850 res!1069205) b!1563852))

(assert (= (and b!1563852 res!1069208) b!1563847))

(assert (= (and b!1563849 condMapEmpty!59646) mapIsEmpty!59646))

(assert (= (and b!1563849 (not condMapEmpty!59646)) mapNonEmpty!59646))

(get-info :version)

(assert (= (and mapNonEmpty!59646 ((_ is ValueCellFull!18392) mapValue!59646)) b!1563853))

(assert (= (and b!1563849 ((_ is ValueCellFull!18392) mapDefault!59646)) b!1563848))

(assert (= start!133722 b!1563849))

(declare-fun m!1438575 () Bool)

(assert (=> b!1563847 m!1438575))

(declare-fun m!1438577 () Bool)

(assert (=> b!1563852 m!1438577))

(declare-fun m!1438579 () Bool)

(assert (=> mapNonEmpty!59646 m!1438579))

(declare-fun m!1438581 () Bool)

(assert (=> start!133722 m!1438581))

(declare-fun m!1438583 () Bool)

(assert (=> start!133722 m!1438583))

(declare-fun m!1438585 () Bool)

(assert (=> start!133722 m!1438585))

(declare-fun m!1438587 () Bool)

(assert (=> b!1563855 m!1438587))

(declare-fun m!1438589 () Bool)

(assert (=> b!1563851 m!1438589))

(check-sat (not start!133722) (not b!1563847) (not b!1563852) (not b!1563855) (not b!1563851) tp_is_empty!38845 (not mapNonEmpty!59646))
(check-sat)
