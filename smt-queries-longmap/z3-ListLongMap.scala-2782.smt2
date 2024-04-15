; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40566 () Bool)

(assert start!40566)

(declare-fun b_free!10591 () Bool)

(declare-fun b_next!10591 () Bool)

(assert (=> start!40566 (= b_free!10591 (not b_next!10591))))

(declare-fun tp!37592 () Bool)

(declare-fun b_and!18573 () Bool)

(assert (=> start!40566 (= tp!37592 b_and!18573)))

(declare-fun b!447196 () Bool)

(declare-fun e!262563 () Bool)

(assert (=> b!447196 (= e!262563 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17011 0))(
  ( (V!17012 (val!6009 Int)) )
))
(declare-datatypes ((ValueCell!5621 0))(
  ( (ValueCellFull!5621 (v!8258 V!17011)) (EmptyCell!5621) )
))
(declare-datatypes ((array!27667 0))(
  ( (array!27668 (arr!13279 (Array (_ BitVec 32) ValueCell!5621)) (size!13632 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27667)

(declare-fun zeroValue!515 () V!17011)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!7888 0))(
  ( (tuple2!7889 (_1!3955 (_ BitVec 64)) (_2!3955 V!17011)) )
))
(declare-datatypes ((List!7949 0))(
  ( (Nil!7946) (Cons!7945 (h!8801 tuple2!7888) (t!13702 List!7949)) )
))
(declare-datatypes ((ListLongMap!6791 0))(
  ( (ListLongMap!6792 (toList!3411 List!7949)) )
))
(declare-fun lt!203738 () ListLongMap!6791)

(declare-datatypes ((array!27669 0))(
  ( (array!27670 (arr!13280 (Array (_ BitVec 32) (_ BitVec 64))) (size!13633 (_ BitVec 32))) )
))
(declare-fun lt!203737 () array!27669)

(declare-fun v!412 () V!17011)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17011)

(declare-fun getCurrentListMapNoExtraKeys!1609 (array!27669 array!27667 (_ BitVec 32) (_ BitVec 32) V!17011 V!17011 (_ BitVec 32) Int) ListLongMap!6791)

(assert (=> b!447196 (= lt!203738 (getCurrentListMapNoExtraKeys!1609 lt!203737 (array!27668 (store (arr!13279 _values!549) i!563 (ValueCellFull!5621 v!412)) (size!13632 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!27669)

(declare-fun lt!203739 () ListLongMap!6791)

(assert (=> b!447196 (= lt!203739 (getCurrentListMapNoExtraKeys!1609 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447197 () Bool)

(declare-fun e!262566 () Bool)

(declare-fun tp_is_empty!11929 () Bool)

(assert (=> b!447197 (= e!262566 tp_is_empty!11929)))

(declare-fun b!447198 () Bool)

(declare-fun e!262567 () Bool)

(assert (=> b!447198 (= e!262567 e!262563)))

(declare-fun res!265631 () Bool)

(assert (=> b!447198 (=> (not res!265631) (not e!262563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27669 (_ BitVec 32)) Bool)

(assert (=> b!447198 (= res!265631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203737 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!447198 (= lt!203737 (array!27670 (store (arr!13280 _keys!709) i!563 k0!794) (size!13633 _keys!709)))))

(declare-fun b!447199 () Bool)

(declare-fun res!265632 () Bool)

(assert (=> b!447199 (=> (not res!265632) (not e!262567))))

(assert (=> b!447199 (= res!265632 (and (= (size!13632 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13633 _keys!709) (size!13632 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447200 () Bool)

(declare-fun res!265636 () Bool)

(assert (=> b!447200 (=> (not res!265636) (not e!262567))))

(assert (=> b!447200 (= res!265636 (or (= (select (arr!13280 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13280 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19527 () Bool)

(declare-fun mapRes!19527 () Bool)

(assert (=> mapIsEmpty!19527 mapRes!19527))

(declare-fun b!447201 () Bool)

(declare-fun res!265634 () Bool)

(assert (=> b!447201 (=> (not res!265634) (not e!262567))))

(declare-fun arrayContainsKey!0 (array!27669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447201 (= res!265634 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!265638 () Bool)

(assert (=> start!40566 (=> (not res!265638) (not e!262567))))

(assert (=> start!40566 (= res!265638 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13633 _keys!709))))))

(assert (=> start!40566 e!262567))

(assert (=> start!40566 tp_is_empty!11929))

(assert (=> start!40566 tp!37592))

(assert (=> start!40566 true))

(declare-fun e!262568 () Bool)

(declare-fun array_inv!9678 (array!27667) Bool)

(assert (=> start!40566 (and (array_inv!9678 _values!549) e!262568)))

(declare-fun array_inv!9679 (array!27669) Bool)

(assert (=> start!40566 (array_inv!9679 _keys!709)))

(declare-fun b!447202 () Bool)

(declare-fun e!262564 () Bool)

(assert (=> b!447202 (= e!262568 (and e!262564 mapRes!19527))))

(declare-fun condMapEmpty!19527 () Bool)

(declare-fun mapDefault!19527 () ValueCell!5621)

(assert (=> b!447202 (= condMapEmpty!19527 (= (arr!13279 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5621)) mapDefault!19527)))))

(declare-fun b!447203 () Bool)

(declare-fun res!265637 () Bool)

(assert (=> b!447203 (=> (not res!265637) (not e!262567))))

(declare-datatypes ((List!7950 0))(
  ( (Nil!7947) (Cons!7946 (h!8802 (_ BitVec 64)) (t!13703 List!7950)) )
))
(declare-fun arrayNoDuplicates!0 (array!27669 (_ BitVec 32) List!7950) Bool)

(assert (=> b!447203 (= res!265637 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7947))))

(declare-fun b!447204 () Bool)

(declare-fun res!265627 () Bool)

(assert (=> b!447204 (=> (not res!265627) (not e!262563))))

(assert (=> b!447204 (= res!265627 (bvsle from!863 i!563))))

(declare-fun b!447205 () Bool)

(declare-fun res!265633 () Bool)

(assert (=> b!447205 (=> (not res!265633) (not e!262563))))

(assert (=> b!447205 (= res!265633 (arrayNoDuplicates!0 lt!203737 #b00000000000000000000000000000000 Nil!7947))))

(declare-fun b!447206 () Bool)

(declare-fun res!265635 () Bool)

(assert (=> b!447206 (=> (not res!265635) (not e!262567))))

(assert (=> b!447206 (= res!265635 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13633 _keys!709))))))

(declare-fun b!447207 () Bool)

(declare-fun res!265629 () Bool)

(assert (=> b!447207 (=> (not res!265629) (not e!262567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447207 (= res!265629 (validKeyInArray!0 k0!794))))

(declare-fun b!447208 () Bool)

(declare-fun res!265630 () Bool)

(assert (=> b!447208 (=> (not res!265630) (not e!262567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447208 (= res!265630 (validMask!0 mask!1025))))

(declare-fun b!447209 () Bool)

(declare-fun res!265628 () Bool)

(assert (=> b!447209 (=> (not res!265628) (not e!262567))))

(assert (=> b!447209 (= res!265628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19527 () Bool)

(declare-fun tp!37593 () Bool)

(assert (=> mapNonEmpty!19527 (= mapRes!19527 (and tp!37593 e!262566))))

(declare-fun mapValue!19527 () ValueCell!5621)

(declare-fun mapKey!19527 () (_ BitVec 32))

(declare-fun mapRest!19527 () (Array (_ BitVec 32) ValueCell!5621))

(assert (=> mapNonEmpty!19527 (= (arr!13279 _values!549) (store mapRest!19527 mapKey!19527 mapValue!19527))))

(declare-fun b!447210 () Bool)

(assert (=> b!447210 (= e!262564 tp_is_empty!11929)))

(assert (= (and start!40566 res!265638) b!447208))

(assert (= (and b!447208 res!265630) b!447199))

(assert (= (and b!447199 res!265632) b!447209))

(assert (= (and b!447209 res!265628) b!447203))

(assert (= (and b!447203 res!265637) b!447206))

(assert (= (and b!447206 res!265635) b!447207))

(assert (= (and b!447207 res!265629) b!447200))

(assert (= (and b!447200 res!265636) b!447201))

(assert (= (and b!447201 res!265634) b!447198))

(assert (= (and b!447198 res!265631) b!447205))

(assert (= (and b!447205 res!265633) b!447204))

(assert (= (and b!447204 res!265627) b!447196))

(assert (= (and b!447202 condMapEmpty!19527) mapIsEmpty!19527))

(assert (= (and b!447202 (not condMapEmpty!19527)) mapNonEmpty!19527))

(get-info :version)

(assert (= (and mapNonEmpty!19527 ((_ is ValueCellFull!5621) mapValue!19527)) b!447197))

(assert (= (and b!447202 ((_ is ValueCellFull!5621) mapDefault!19527)) b!447210))

(assert (= start!40566 b!447202))

(declare-fun m!431611 () Bool)

(assert (=> b!447198 m!431611))

(declare-fun m!431613 () Bool)

(assert (=> b!447198 m!431613))

(declare-fun m!431615 () Bool)

(assert (=> b!447203 m!431615))

(declare-fun m!431617 () Bool)

(assert (=> b!447201 m!431617))

(declare-fun m!431619 () Bool)

(assert (=> start!40566 m!431619))

(declare-fun m!431621 () Bool)

(assert (=> start!40566 m!431621))

(declare-fun m!431623 () Bool)

(assert (=> b!447200 m!431623))

(declare-fun m!431625 () Bool)

(assert (=> b!447205 m!431625))

(declare-fun m!431627 () Bool)

(assert (=> b!447207 m!431627))

(declare-fun m!431629 () Bool)

(assert (=> b!447209 m!431629))

(declare-fun m!431631 () Bool)

(assert (=> b!447196 m!431631))

(declare-fun m!431633 () Bool)

(assert (=> b!447196 m!431633))

(declare-fun m!431635 () Bool)

(assert (=> b!447196 m!431635))

(declare-fun m!431637 () Bool)

(assert (=> mapNonEmpty!19527 m!431637))

(declare-fun m!431639 () Bool)

(assert (=> b!447208 m!431639))

(check-sat (not b_next!10591) (not b!447208) (not b!447207) (not b!447196) (not b!447203) (not mapNonEmpty!19527) (not start!40566) (not b!447209) (not b!447205) (not b!447201) tp_is_empty!11929 (not b!447198) b_and!18573)
(check-sat b_and!18573 (not b_next!10591))
