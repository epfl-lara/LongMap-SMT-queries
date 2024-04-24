; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40882 () Bool)

(assert start!40882)

(declare-fun b_free!10831 () Bool)

(declare-fun b_next!10831 () Bool)

(assert (=> start!40882 (= b_free!10831 (not b_next!10831))))

(declare-fun tp!38319 () Bool)

(declare-fun b_and!18983 () Bool)

(assert (=> start!40882 (= tp!38319 b_and!18983)))

(declare-fun b!454261 () Bool)

(declare-fun res!270670 () Bool)

(declare-fun e!265794 () Bool)

(assert (=> b!454261 (=> (not res!270670) (not e!265794))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454261 (= res!270670 (bvsle from!863 i!563))))

(declare-fun b!454262 () Bool)

(declare-fun res!270668 () Bool)

(declare-fun e!265796 () Bool)

(assert (=> b!454262 (=> (not res!270668) (not e!265796))))

(declare-datatypes ((array!28134 0))(
  ( (array!28135 (arr!13510 (Array (_ BitVec 32) (_ BitVec 64))) (size!13862 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28134)

(assert (=> b!454262 (= res!270668 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13862 _keys!709))))))

(declare-fun b!454263 () Bool)

(declare-fun res!270669 () Bool)

(assert (=> b!454263 (=> (not res!270669) (not e!265796))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17331 0))(
  ( (V!17332 (val!6129 Int)) )
))
(declare-datatypes ((ValueCell!5741 0))(
  ( (ValueCellFull!5741 (v!8396 V!17331)) (EmptyCell!5741) )
))
(declare-datatypes ((array!28136 0))(
  ( (array!28137 (arr!13511 (Array (_ BitVec 32) ValueCell!5741)) (size!13863 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28136)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!454263 (= res!270669 (and (= (size!13863 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13862 _keys!709) (size!13863 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19894 () Bool)

(declare-fun mapRes!19894 () Bool)

(assert (=> mapIsEmpty!19894 mapRes!19894))

(declare-fun b!454264 () Bool)

(declare-fun res!270675 () Bool)

(assert (=> b!454264 (=> (not res!270675) (not e!265796))))

(declare-datatypes ((List!8047 0))(
  ( (Nil!8044) (Cons!8043 (h!8899 (_ BitVec 64)) (t!13867 List!8047)) )
))
(declare-fun arrayNoDuplicates!0 (array!28134 (_ BitVec 32) List!8047) Bool)

(assert (=> b!454264 (= res!270675 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8044))))

(declare-fun mapNonEmpty!19894 () Bool)

(declare-fun tp!38320 () Bool)

(declare-fun e!265797 () Bool)

(assert (=> mapNonEmpty!19894 (= mapRes!19894 (and tp!38320 e!265797))))

(declare-fun mapValue!19894 () ValueCell!5741)

(declare-fun mapKey!19894 () (_ BitVec 32))

(declare-fun mapRest!19894 () (Array (_ BitVec 32) ValueCell!5741))

(assert (=> mapNonEmpty!19894 (= (arr!13511 _values!549) (store mapRest!19894 mapKey!19894 mapValue!19894))))

(declare-fun b!454265 () Bool)

(declare-fun e!265795 () Bool)

(declare-fun tp_is_empty!12169 () Bool)

(assert (=> b!454265 (= e!265795 tp_is_empty!12169)))

(declare-fun b!454266 () Bool)

(declare-fun res!270674 () Bool)

(assert (=> b!454266 (=> (not res!270674) (not e!265796))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454266 (= res!270674 (validKeyInArray!0 k0!794))))

(declare-fun res!270667 () Bool)

(assert (=> start!40882 (=> (not res!270667) (not e!265796))))

(assert (=> start!40882 (= res!270667 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13862 _keys!709))))))

(assert (=> start!40882 e!265796))

(assert (=> start!40882 tp_is_empty!12169))

(assert (=> start!40882 tp!38319))

(assert (=> start!40882 true))

(declare-fun e!265793 () Bool)

(declare-fun array_inv!9866 (array!28136) Bool)

(assert (=> start!40882 (and (array_inv!9866 _values!549) e!265793)))

(declare-fun array_inv!9867 (array!28134) Bool)

(assert (=> start!40882 (array_inv!9867 _keys!709)))

(declare-fun b!454267 () Bool)

(declare-fun res!270673 () Bool)

(assert (=> b!454267 (=> (not res!270673) (not e!265794))))

(declare-fun lt!206124 () array!28134)

(assert (=> b!454267 (= res!270673 (arrayNoDuplicates!0 lt!206124 #b00000000000000000000000000000000 Nil!8044))))

(declare-fun b!454268 () Bool)

(assert (=> b!454268 (= e!265796 e!265794)))

(declare-fun res!270671 () Bool)

(assert (=> b!454268 (=> (not res!270671) (not e!265794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28134 (_ BitVec 32)) Bool)

(assert (=> b!454268 (= res!270671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206124 mask!1025))))

(assert (=> b!454268 (= lt!206124 (array!28135 (store (arr!13510 _keys!709) i!563 k0!794) (size!13862 _keys!709)))))

(declare-fun b!454269 () Bool)

(assert (=> b!454269 (= e!265797 tp_is_empty!12169)))

(declare-fun b!454270 () Bool)

(declare-fun res!270665 () Bool)

(assert (=> b!454270 (=> (not res!270665) (not e!265796))))

(assert (=> b!454270 (= res!270665 (or (= (select (arr!13510 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13510 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454271 () Bool)

(assert (=> b!454271 (= e!265794 false)))

(declare-fun minValue!515 () V!17331)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17331)

(declare-datatypes ((tuple2!7978 0))(
  ( (tuple2!7979 (_1!4000 (_ BitVec 64)) (_2!4000 V!17331)) )
))
(declare-datatypes ((List!8048 0))(
  ( (Nil!8045) (Cons!8044 (h!8900 tuple2!7978) (t!13868 List!8048)) )
))
(declare-datatypes ((ListLongMap!6893 0))(
  ( (ListLongMap!6894 (toList!3462 List!8048)) )
))
(declare-fun lt!206126 () ListLongMap!6893)

(declare-fun v!412 () V!17331)

(declare-fun getCurrentListMapNoExtraKeys!1691 (array!28134 array!28136 (_ BitVec 32) (_ BitVec 32) V!17331 V!17331 (_ BitVec 32) Int) ListLongMap!6893)

(assert (=> b!454271 (= lt!206126 (getCurrentListMapNoExtraKeys!1691 lt!206124 (array!28137 (store (arr!13511 _values!549) i!563 (ValueCellFull!5741 v!412)) (size!13863 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206125 () ListLongMap!6893)

(assert (=> b!454271 (= lt!206125 (getCurrentListMapNoExtraKeys!1691 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454272 () Bool)

(declare-fun res!270666 () Bool)

(assert (=> b!454272 (=> (not res!270666) (not e!265796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454272 (= res!270666 (validMask!0 mask!1025))))

(declare-fun b!454273 () Bool)

(declare-fun res!270672 () Bool)

(assert (=> b!454273 (=> (not res!270672) (not e!265796))))

(declare-fun arrayContainsKey!0 (array!28134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454273 (= res!270672 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454274 () Bool)

(assert (=> b!454274 (= e!265793 (and e!265795 mapRes!19894))))

(declare-fun condMapEmpty!19894 () Bool)

(declare-fun mapDefault!19894 () ValueCell!5741)

(assert (=> b!454274 (= condMapEmpty!19894 (= (arr!13511 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5741)) mapDefault!19894)))))

(declare-fun b!454275 () Bool)

(declare-fun res!270676 () Bool)

(assert (=> b!454275 (=> (not res!270676) (not e!265796))))

(assert (=> b!454275 (= res!270676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40882 res!270667) b!454272))

(assert (= (and b!454272 res!270666) b!454263))

(assert (= (and b!454263 res!270669) b!454275))

(assert (= (and b!454275 res!270676) b!454264))

(assert (= (and b!454264 res!270675) b!454262))

(assert (= (and b!454262 res!270668) b!454266))

(assert (= (and b!454266 res!270674) b!454270))

(assert (= (and b!454270 res!270665) b!454273))

(assert (= (and b!454273 res!270672) b!454268))

(assert (= (and b!454268 res!270671) b!454267))

(assert (= (and b!454267 res!270673) b!454261))

(assert (= (and b!454261 res!270670) b!454271))

(assert (= (and b!454274 condMapEmpty!19894) mapIsEmpty!19894))

(assert (= (and b!454274 (not condMapEmpty!19894)) mapNonEmpty!19894))

(get-info :version)

(assert (= (and mapNonEmpty!19894 ((_ is ValueCellFull!5741) mapValue!19894)) b!454269))

(assert (= (and b!454274 ((_ is ValueCellFull!5741) mapDefault!19894)) b!454265))

(assert (= start!40882 b!454274))

(declare-fun m!438663 () Bool)

(assert (=> b!454271 m!438663))

(declare-fun m!438665 () Bool)

(assert (=> b!454271 m!438665))

(declare-fun m!438667 () Bool)

(assert (=> b!454271 m!438667))

(declare-fun m!438669 () Bool)

(assert (=> b!454270 m!438669))

(declare-fun m!438671 () Bool)

(assert (=> b!454275 m!438671))

(declare-fun m!438673 () Bool)

(assert (=> b!454266 m!438673))

(declare-fun m!438675 () Bool)

(assert (=> b!454264 m!438675))

(declare-fun m!438677 () Bool)

(assert (=> b!454268 m!438677))

(declare-fun m!438679 () Bool)

(assert (=> b!454268 m!438679))

(declare-fun m!438681 () Bool)

(assert (=> start!40882 m!438681))

(declare-fun m!438683 () Bool)

(assert (=> start!40882 m!438683))

(declare-fun m!438685 () Bool)

(assert (=> b!454267 m!438685))

(declare-fun m!438687 () Bool)

(assert (=> mapNonEmpty!19894 m!438687))

(declare-fun m!438689 () Bool)

(assert (=> b!454273 m!438689))

(declare-fun m!438691 () Bool)

(assert (=> b!454272 m!438691))

(check-sat b_and!18983 (not b!454273) (not b!454272) (not b!454266) (not b!454264) (not start!40882) (not b!454271) (not b_next!10831) (not b!454268) (not mapNonEmpty!19894) tp_is_empty!12169 (not b!454267) (not b!454275))
(check-sat b_and!18983 (not b_next!10831))
