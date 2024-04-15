; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40244 () Bool)

(assert start!40244)

(declare-fun b!441679 () Bool)

(declare-fun res!261596 () Bool)

(declare-fun e!259982 () Bool)

(assert (=> b!441679 (=> (not res!261596) (not e!259982))))

(declare-datatypes ((array!27167 0))(
  ( (array!27168 (arr!13033 (Array (_ BitVec 32) (_ BitVec 64))) (size!13386 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27167)

(declare-datatypes ((List!7825 0))(
  ( (Nil!7822) (Cons!7821 (h!8677 (_ BitVec 64)) (t!13572 List!7825)) )
))
(declare-fun arrayNoDuplicates!0 (array!27167 (_ BitVec 32) List!7825) Bool)

(assert (=> b!441679 (= res!261596 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7822))))

(declare-fun b!441680 () Bool)

(declare-fun e!259979 () Bool)

(assert (=> b!441680 (= e!259982 e!259979)))

(declare-fun res!261597 () Bool)

(assert (=> b!441680 (=> (not res!261597) (not e!259979))))

(declare-fun lt!202816 () array!27167)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27167 (_ BitVec 32)) Bool)

(assert (=> b!441680 (= res!261597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202816 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441680 (= lt!202816 (array!27168 (store (arr!13033 _keys!709) i!563 k0!794) (size!13386 _keys!709)))))

(declare-fun b!441681 () Bool)

(declare-fun res!261601 () Bool)

(assert (=> b!441681 (=> (not res!261601) (not e!259982))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16675 0))(
  ( (V!16676 (val!5883 Int)) )
))
(declare-datatypes ((ValueCell!5495 0))(
  ( (ValueCellFull!5495 (v!8124 V!16675)) (EmptyCell!5495) )
))
(declare-datatypes ((array!27169 0))(
  ( (array!27170 (arr!13034 (Array (_ BitVec 32) ValueCell!5495)) (size!13387 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27169)

(assert (=> b!441681 (= res!261601 (and (= (size!13387 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13386 _keys!709) (size!13387 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19137 () Bool)

(declare-fun mapRes!19137 () Bool)

(assert (=> mapIsEmpty!19137 mapRes!19137))

(declare-fun b!441682 () Bool)

(declare-fun res!261600 () Bool)

(assert (=> b!441682 (=> (not res!261600) (not e!259982))))

(assert (=> b!441682 (= res!261600 (or (= (select (arr!13033 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13033 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441683 () Bool)

(declare-fun res!261598 () Bool)

(assert (=> b!441683 (=> (not res!261598) (not e!259982))))

(declare-fun arrayContainsKey!0 (array!27167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441683 (= res!261598 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441684 () Bool)

(declare-fun res!261599 () Bool)

(assert (=> b!441684 (=> (not res!261599) (not e!259982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441684 (= res!261599 (validMask!0 mask!1025))))

(declare-fun b!441685 () Bool)

(declare-fun e!259980 () Bool)

(declare-fun e!259983 () Bool)

(assert (=> b!441685 (= e!259980 (and e!259983 mapRes!19137))))

(declare-fun condMapEmpty!19137 () Bool)

(declare-fun mapDefault!19137 () ValueCell!5495)

(assert (=> b!441685 (= condMapEmpty!19137 (= (arr!13034 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5495)) mapDefault!19137)))))

(declare-fun b!441686 () Bool)

(declare-fun res!261595 () Bool)

(assert (=> b!441686 (=> (not res!261595) (not e!259982))))

(assert (=> b!441686 (= res!261595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441687 () Bool)

(declare-fun tp_is_empty!11677 () Bool)

(assert (=> b!441687 (= e!259983 tp_is_empty!11677)))

(declare-fun mapNonEmpty!19137 () Bool)

(declare-fun tp!37101 () Bool)

(declare-fun e!259981 () Bool)

(assert (=> mapNonEmpty!19137 (= mapRes!19137 (and tp!37101 e!259981))))

(declare-fun mapValue!19137 () ValueCell!5495)

(declare-fun mapRest!19137 () (Array (_ BitVec 32) ValueCell!5495))

(declare-fun mapKey!19137 () (_ BitVec 32))

(assert (=> mapNonEmpty!19137 (= (arr!13034 _values!549) (store mapRest!19137 mapKey!19137 mapValue!19137))))

(declare-fun res!261602 () Bool)

(assert (=> start!40244 (=> (not res!261602) (not e!259982))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40244 (= res!261602 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13386 _keys!709))))))

(assert (=> start!40244 e!259982))

(assert (=> start!40244 true))

(declare-fun array_inv!9504 (array!27169) Bool)

(assert (=> start!40244 (and (array_inv!9504 _values!549) e!259980)))

(declare-fun array_inv!9505 (array!27167) Bool)

(assert (=> start!40244 (array_inv!9505 _keys!709)))

(declare-fun b!441688 () Bool)

(declare-fun res!261594 () Bool)

(assert (=> b!441688 (=> (not res!261594) (not e!259982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441688 (= res!261594 (validKeyInArray!0 k0!794))))

(declare-fun b!441689 () Bool)

(assert (=> b!441689 (= e!259981 tp_is_empty!11677)))

(declare-fun b!441690 () Bool)

(assert (=> b!441690 (= e!259979 false)))

(declare-fun lt!202817 () Bool)

(assert (=> b!441690 (= lt!202817 (arrayNoDuplicates!0 lt!202816 #b00000000000000000000000000000000 Nil!7822))))

(declare-fun b!441691 () Bool)

(declare-fun res!261603 () Bool)

(assert (=> b!441691 (=> (not res!261603) (not e!259982))))

(assert (=> b!441691 (= res!261603 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13386 _keys!709))))))

(assert (= (and start!40244 res!261602) b!441684))

(assert (= (and b!441684 res!261599) b!441681))

(assert (= (and b!441681 res!261601) b!441686))

(assert (= (and b!441686 res!261595) b!441679))

(assert (= (and b!441679 res!261596) b!441691))

(assert (= (and b!441691 res!261603) b!441688))

(assert (= (and b!441688 res!261594) b!441682))

(assert (= (and b!441682 res!261600) b!441683))

(assert (= (and b!441683 res!261598) b!441680))

(assert (= (and b!441680 res!261597) b!441690))

(assert (= (and b!441685 condMapEmpty!19137) mapIsEmpty!19137))

(assert (= (and b!441685 (not condMapEmpty!19137)) mapNonEmpty!19137))

(get-info :version)

(assert (= (and mapNonEmpty!19137 ((_ is ValueCellFull!5495) mapValue!19137)) b!441689))

(assert (= (and b!441685 ((_ is ValueCellFull!5495) mapDefault!19137)) b!441687))

(assert (= start!40244 b!441685))

(declare-fun m!427953 () Bool)

(assert (=> start!40244 m!427953))

(declare-fun m!427955 () Bool)

(assert (=> start!40244 m!427955))

(declare-fun m!427957 () Bool)

(assert (=> b!441683 m!427957))

(declare-fun m!427959 () Bool)

(assert (=> b!441688 m!427959))

(declare-fun m!427961 () Bool)

(assert (=> b!441679 m!427961))

(declare-fun m!427963 () Bool)

(assert (=> b!441682 m!427963))

(declare-fun m!427965 () Bool)

(assert (=> mapNonEmpty!19137 m!427965))

(declare-fun m!427967 () Bool)

(assert (=> b!441680 m!427967))

(declare-fun m!427969 () Bool)

(assert (=> b!441680 m!427969))

(declare-fun m!427971 () Bool)

(assert (=> b!441684 m!427971))

(declare-fun m!427973 () Bool)

(assert (=> b!441686 m!427973))

(declare-fun m!427975 () Bool)

(assert (=> b!441690 m!427975))

(check-sat (not b!441680) (not b!441688) (not start!40244) (not b!441683) (not b!441690) tp_is_empty!11677 (not b!441679) (not b!441684) (not mapNonEmpty!19137) (not b!441686))
(check-sat)
