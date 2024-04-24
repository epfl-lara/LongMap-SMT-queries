; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40520 () Bool)

(assert start!40520)

(declare-fun mapNonEmpty!19479 () Bool)

(declare-fun mapRes!19479 () Bool)

(declare-fun tp!37506 () Bool)

(declare-fun e!262372 () Bool)

(assert (=> mapNonEmpty!19479 (= mapRes!19479 (and tp!37506 e!262372))))

(declare-datatypes ((V!16971 0))(
  ( (V!16972 (val!5994 Int)) )
))
(declare-datatypes ((ValueCell!5606 0))(
  ( (ValueCellFull!5606 (v!8250 V!16971)) (EmptyCell!5606) )
))
(declare-fun mapRest!19479 () (Array (_ BitVec 32) ValueCell!5606))

(declare-fun mapValue!19479 () ValueCell!5606)

(declare-fun mapKey!19479 () (_ BitVec 32))

(declare-datatypes ((array!27608 0))(
  ( (array!27609 (arr!13250 (Array (_ BitVec 32) ValueCell!5606)) (size!13602 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27608)

(assert (=> mapNonEmpty!19479 (= (arr!13250 _values!549) (store mapRest!19479 mapKey!19479 mapValue!19479))))

(declare-fun b!446650 () Bool)

(declare-fun e!262370 () Bool)

(declare-fun e!262367 () Bool)

(assert (=> b!446650 (= e!262370 e!262367)))

(declare-fun res!265184 () Bool)

(assert (=> b!446650 (=> (not res!265184) (not e!262367))))

(declare-datatypes ((array!27610 0))(
  ( (array!27611 (arr!13251 (Array (_ BitVec 32) (_ BitVec 64))) (size!13603 (_ BitVec 32))) )
))
(declare-fun lt!203865 () array!27610)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27610 (_ BitVec 32)) Bool)

(assert (=> b!446650 (= res!265184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203865 mask!1025))))

(declare-fun _keys!709 () array!27610)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!446650 (= lt!203865 (array!27611 (store (arr!13251 _keys!709) i!563 k0!794) (size!13603 _keys!709)))))

(declare-fun b!446651 () Bool)

(declare-fun tp_is_empty!11899 () Bool)

(assert (=> b!446651 (= e!262372 tp_is_empty!11899)))

(declare-fun b!446652 () Bool)

(declare-fun res!265178 () Bool)

(assert (=> b!446652 (=> (not res!265178) (not e!262370))))

(declare-fun arrayContainsKey!0 (array!27610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446652 (= res!265178 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446653 () Bool)

(declare-fun res!265188 () Bool)

(assert (=> b!446653 (=> (not res!265188) (not e!262370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446653 (= res!265188 (validMask!0 mask!1025))))

(declare-fun b!446654 () Bool)

(declare-fun res!265182 () Bool)

(assert (=> b!446654 (=> (not res!265182) (not e!262370))))

(assert (=> b!446654 (= res!265182 (or (= (select (arr!13251 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13251 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446655 () Bool)

(declare-fun res!265183 () Bool)

(assert (=> b!446655 (=> (not res!265183) (not e!262370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446655 (= res!265183 (validKeyInArray!0 k0!794))))

(declare-fun b!446656 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!446656 (= e!262367 (and (bvsgt from!863 i!563) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13603 _keys!709)) (bvsge i!563 (size!13602 _values!549))))))

(declare-fun b!446657 () Bool)

(declare-fun e!262369 () Bool)

(assert (=> b!446657 (= e!262369 tp_is_empty!11899)))

(declare-fun b!446658 () Bool)

(declare-fun res!265180 () Bool)

(assert (=> b!446658 (=> (not res!265180) (not e!262367))))

(declare-datatypes ((List!7838 0))(
  ( (Nil!7835) (Cons!7834 (h!8690 (_ BitVec 64)) (t!13590 List!7838)) )
))
(declare-fun arrayNoDuplicates!0 (array!27610 (_ BitVec 32) List!7838) Bool)

(assert (=> b!446658 (= res!265180 (arrayNoDuplicates!0 lt!203865 #b00000000000000000000000000000000 Nil!7835))))

(declare-fun res!265186 () Bool)

(assert (=> start!40520 (=> (not res!265186) (not e!262370))))

(assert (=> start!40520 (= res!265186 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13603 _keys!709))))))

(assert (=> start!40520 e!262370))

(assert (=> start!40520 true))

(declare-fun e!262368 () Bool)

(declare-fun array_inv!9686 (array!27608) Bool)

(assert (=> start!40520 (and (array_inv!9686 _values!549) e!262368)))

(declare-fun array_inv!9687 (array!27610) Bool)

(assert (=> start!40520 (array_inv!9687 _keys!709)))

(declare-fun b!446659 () Bool)

(declare-fun res!265179 () Bool)

(assert (=> b!446659 (=> (not res!265179) (not e!262370))))

(assert (=> b!446659 (= res!265179 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13603 _keys!709))))))

(declare-fun mapIsEmpty!19479 () Bool)

(assert (=> mapIsEmpty!19479 mapRes!19479))

(declare-fun b!446660 () Bool)

(declare-fun res!265187 () Bool)

(assert (=> b!446660 (=> (not res!265187) (not e!262370))))

(assert (=> b!446660 (= res!265187 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7835))))

(declare-fun b!446661 () Bool)

(assert (=> b!446661 (= e!262368 (and e!262369 mapRes!19479))))

(declare-fun condMapEmpty!19479 () Bool)

(declare-fun mapDefault!19479 () ValueCell!5606)

(assert (=> b!446661 (= condMapEmpty!19479 (= (arr!13250 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5606)) mapDefault!19479)))))

(declare-fun b!446662 () Bool)

(declare-fun res!265181 () Bool)

(assert (=> b!446662 (=> (not res!265181) (not e!262370))))

(assert (=> b!446662 (= res!265181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446663 () Bool)

(declare-fun res!265185 () Bool)

(assert (=> b!446663 (=> (not res!265185) (not e!262370))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446663 (= res!265185 (and (= (size!13602 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13603 _keys!709) (size!13602 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40520 res!265186) b!446653))

(assert (= (and b!446653 res!265188) b!446663))

(assert (= (and b!446663 res!265185) b!446662))

(assert (= (and b!446662 res!265181) b!446660))

(assert (= (and b!446660 res!265187) b!446659))

(assert (= (and b!446659 res!265179) b!446655))

(assert (= (and b!446655 res!265183) b!446654))

(assert (= (and b!446654 res!265182) b!446652))

(assert (= (and b!446652 res!265178) b!446650))

(assert (= (and b!446650 res!265184) b!446658))

(assert (= (and b!446658 res!265180) b!446656))

(assert (= (and b!446661 condMapEmpty!19479) mapIsEmpty!19479))

(assert (= (and b!446661 (not condMapEmpty!19479)) mapNonEmpty!19479))

(get-info :version)

(assert (= (and mapNonEmpty!19479 ((_ is ValueCellFull!5606) mapValue!19479)) b!446651))

(assert (= (and b!446661 ((_ is ValueCellFull!5606) mapDefault!19479)) b!446657))

(assert (= start!40520 b!446661))

(declare-fun m!432059 () Bool)

(assert (=> b!446653 m!432059))

(declare-fun m!432061 () Bool)

(assert (=> b!446654 m!432061))

(declare-fun m!432063 () Bool)

(assert (=> mapNonEmpty!19479 m!432063))

(declare-fun m!432065 () Bool)

(assert (=> b!446650 m!432065))

(declare-fun m!432067 () Bool)

(assert (=> b!446650 m!432067))

(declare-fun m!432069 () Bool)

(assert (=> start!40520 m!432069))

(declare-fun m!432071 () Bool)

(assert (=> start!40520 m!432071))

(declare-fun m!432073 () Bool)

(assert (=> b!446662 m!432073))

(declare-fun m!432075 () Bool)

(assert (=> b!446655 m!432075))

(declare-fun m!432077 () Bool)

(assert (=> b!446660 m!432077))

(declare-fun m!432079 () Bool)

(assert (=> b!446652 m!432079))

(declare-fun m!432081 () Bool)

(assert (=> b!446658 m!432081))

(check-sat (not b!446662) (not b!446660) (not mapNonEmpty!19479) (not b!446650) (not b!446658) tp_is_empty!11899 (not b!446653) (not b!446655) (not b!446652) (not start!40520))
(check-sat)
