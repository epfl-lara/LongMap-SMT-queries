; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133832 () Bool)

(assert start!133832)

(declare-fun b!1562172 () Bool)

(declare-fun res!1067445 () Bool)

(declare-fun e!870611 () Bool)

(assert (=> b!1562172 (=> (not res!1067445) (not e!870611))))

(declare-datatypes ((array!103860 0))(
  ( (array!103861 (arr!50115 (Array (_ BitVec 32) (_ BitVec 64))) (size!50666 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103860)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103860 (_ BitVec 32)) Bool)

(assert (=> b!1562172 (= res!1067445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562173 () Bool)

(declare-fun e!870612 () Bool)

(declare-fun tp_is_empty!38503 () Bool)

(assert (=> b!1562173 (= e!870612 tp_is_empty!38503)))

(declare-fun b!1562174 () Bool)

(declare-fun e!870610 () Bool)

(assert (=> b!1562174 (= e!870610 tp_is_empty!38503)))

(declare-fun b!1562175 () Bool)

(declare-fun res!1067447 () Bool)

(assert (=> b!1562175 (=> (not res!1067447) (not e!870611))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59545 0))(
  ( (V!59546 (val!19335 Int)) )
))
(declare-datatypes ((ValueCell!18221 0))(
  ( (ValueCellFull!18221 (v!22079 V!59545)) (EmptyCell!18221) )
))
(declare-datatypes ((array!103862 0))(
  ( (array!103863 (arr!50116 (Array (_ BitVec 32) ValueCell!18221)) (size!50667 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103862)

(assert (=> b!1562175 (= res!1067447 (and (= (size!50667 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50666 _keys!637) (size!50667 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1067443 () Bool)

(assert (=> start!133832 (=> (not res!1067443) (not e!870611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133832 (= res!1067443 (validMask!0 mask!947))))

(assert (=> start!133832 e!870611))

(assert (=> start!133832 true))

(declare-fun array_inv!39213 (array!103860) Bool)

(assert (=> start!133832 (array_inv!39213 _keys!637)))

(declare-fun e!870613 () Bool)

(declare-fun array_inv!39214 (array!103862) Bool)

(assert (=> start!133832 (and (array_inv!39214 _values!487) e!870613)))

(declare-fun mapNonEmpty!59130 () Bool)

(declare-fun mapRes!59130 () Bool)

(declare-fun tp!112785 () Bool)

(assert (=> mapNonEmpty!59130 (= mapRes!59130 (and tp!112785 e!870612))))

(declare-fun mapKey!59130 () (_ BitVec 32))

(declare-fun mapValue!59130 () ValueCell!18221)

(declare-fun mapRest!59130 () (Array (_ BitVec 32) ValueCell!18221))

(assert (=> mapNonEmpty!59130 (= (arr!50116 _values!487) (store mapRest!59130 mapKey!59130 mapValue!59130))))

(declare-fun b!1562176 () Bool)

(declare-fun res!1067444 () Bool)

(assert (=> b!1562176 (=> (not res!1067444) (not e!870611))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562176 (= res!1067444 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50666 _keys!637)) (bvsge from!782 (size!50666 _keys!637))))))

(declare-fun b!1562177 () Bool)

(declare-fun res!1067442 () Bool)

(assert (=> b!1562177 (=> (not res!1067442) (not e!870611))))

(declare-datatypes ((tuple2!25058 0))(
  ( (tuple2!25059 (_1!12540 (_ BitVec 64)) (_2!12540 V!59545)) )
))
(declare-datatypes ((List!36386 0))(
  ( (Nil!36383) (Cons!36382 (h!37846 tuple2!25058) (t!51111 List!36386)) )
))
(declare-datatypes ((ListLongMap!22501 0))(
  ( (ListLongMap!22502 (toList!11266 List!36386)) )
))
(declare-fun contains!10267 (ListLongMap!22501 (_ BitVec 64)) Bool)

(assert (=> b!1562177 (= res!1067442 (not (contains!10267 (ListLongMap!22502 Nil!36383) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1562178 () Bool)

(assert (=> b!1562178 (= e!870611 false)))

(declare-fun lt!671819 () Bool)

(assert (=> b!1562178 (= lt!671819 (contains!10267 (ListLongMap!22502 Nil!36383) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1562179 () Bool)

(declare-fun res!1067446 () Bool)

(assert (=> b!1562179 (=> (not res!1067446) (not e!870611))))

(declare-datatypes ((List!36387 0))(
  ( (Nil!36384) (Cons!36383 (h!37847 (_ BitVec 64)) (t!51112 List!36387)) )
))
(declare-fun arrayNoDuplicates!0 (array!103860 (_ BitVec 32) List!36387) Bool)

(assert (=> b!1562179 (= res!1067446 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36384))))

(declare-fun b!1562180 () Bool)

(assert (=> b!1562180 (= e!870613 (and e!870610 mapRes!59130))))

(declare-fun condMapEmpty!59130 () Bool)

(declare-fun mapDefault!59130 () ValueCell!18221)

(assert (=> b!1562180 (= condMapEmpty!59130 (= (arr!50116 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18221)) mapDefault!59130)))))

(declare-fun mapIsEmpty!59130 () Bool)

(assert (=> mapIsEmpty!59130 mapRes!59130))

(assert (= (and start!133832 res!1067443) b!1562175))

(assert (= (and b!1562175 res!1067447) b!1562172))

(assert (= (and b!1562172 res!1067445) b!1562179))

(assert (= (and b!1562179 res!1067446) b!1562176))

(assert (= (and b!1562176 res!1067444) b!1562177))

(assert (= (and b!1562177 res!1067442) b!1562178))

(assert (= (and b!1562180 condMapEmpty!59130) mapIsEmpty!59130))

(assert (= (and b!1562180 (not condMapEmpty!59130)) mapNonEmpty!59130))

(get-info :version)

(assert (= (and mapNonEmpty!59130 ((_ is ValueCellFull!18221) mapValue!59130)) b!1562173))

(assert (= (and b!1562180 ((_ is ValueCellFull!18221) mapDefault!59130)) b!1562174))

(assert (= start!133832 b!1562180))

(declare-fun m!1438119 () Bool)

(assert (=> b!1562177 m!1438119))

(declare-fun m!1438121 () Bool)

(assert (=> mapNonEmpty!59130 m!1438121))

(declare-fun m!1438123 () Bool)

(assert (=> b!1562179 m!1438123))

(declare-fun m!1438125 () Bool)

(assert (=> start!133832 m!1438125))

(declare-fun m!1438127 () Bool)

(assert (=> start!133832 m!1438127))

(declare-fun m!1438129 () Bool)

(assert (=> start!133832 m!1438129))

(declare-fun m!1438131 () Bool)

(assert (=> b!1562172 m!1438131))

(declare-fun m!1438133 () Bool)

(assert (=> b!1562178 m!1438133))

(check-sat (not b!1562179) (not b!1562177) (not mapNonEmpty!59130) tp_is_empty!38503 (not b!1562178) (not start!133832) (not b!1562172))
(check-sat)
