; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40368 () Bool)

(assert start!40368)

(declare-fun b!443746 () Bool)

(declare-fun e!261048 () Bool)

(declare-fun tp_is_empty!11767 () Bool)

(assert (=> b!443746 (= e!261048 tp_is_empty!11767)))

(declare-fun b!443747 () Bool)

(declare-fun res!263046 () Bool)

(declare-fun e!261043 () Bool)

(assert (=> b!443747 (=> (not res!263046) (not e!261043))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443747 (= res!263046 (validMask!0 mask!1025))))

(declare-fun res!263047 () Bool)

(assert (=> start!40368 (=> (not res!263047) (not e!261043))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27348 0))(
  ( (array!27349 (arr!13121 (Array (_ BitVec 32) (_ BitVec 64))) (size!13473 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27348)

(assert (=> start!40368 (= res!263047 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13473 _keys!709))))))

(assert (=> start!40368 e!261043))

(assert (=> start!40368 true))

(declare-datatypes ((V!16795 0))(
  ( (V!16796 (val!5928 Int)) )
))
(declare-datatypes ((ValueCell!5540 0))(
  ( (ValueCellFull!5540 (v!8180 V!16795)) (EmptyCell!5540) )
))
(declare-datatypes ((array!27350 0))(
  ( (array!27351 (arr!13122 (Array (_ BitVec 32) ValueCell!5540)) (size!13474 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27350)

(declare-fun e!261047 () Bool)

(declare-fun array_inv!9590 (array!27350) Bool)

(assert (=> start!40368 (and (array_inv!9590 _values!549) e!261047)))

(declare-fun array_inv!9591 (array!27348) Bool)

(assert (=> start!40368 (array_inv!9591 _keys!709)))

(declare-fun b!443748 () Bool)

(declare-fun e!261045 () Bool)

(declare-fun mapRes!19278 () Bool)

(assert (=> b!443748 (= e!261047 (and e!261045 mapRes!19278))))

(declare-fun condMapEmpty!19278 () Bool)

(declare-fun mapDefault!19278 () ValueCell!5540)

(assert (=> b!443748 (= condMapEmpty!19278 (= (arr!13122 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5540)) mapDefault!19278)))))

(declare-fun mapIsEmpty!19278 () Bool)

(assert (=> mapIsEmpty!19278 mapRes!19278))

(declare-fun b!443749 () Bool)

(declare-fun res!263040 () Bool)

(assert (=> b!443749 (=> (not res!263040) (not e!261043))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443749 (= res!263040 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443750 () Bool)

(assert (=> b!443750 (= e!261045 tp_is_empty!11767)))

(declare-fun b!443751 () Bool)

(declare-fun e!261046 () Bool)

(assert (=> b!443751 (= e!261046 false)))

(declare-fun lt!203412 () Bool)

(declare-fun lt!203411 () array!27348)

(declare-datatypes ((List!7769 0))(
  ( (Nil!7766) (Cons!7765 (h!8621 (_ BitVec 64)) (t!13519 List!7769)) )
))
(declare-fun arrayNoDuplicates!0 (array!27348 (_ BitVec 32) List!7769) Bool)

(assert (=> b!443751 (= lt!203412 (arrayNoDuplicates!0 lt!203411 #b00000000000000000000000000000000 Nil!7766))))

(declare-fun b!443752 () Bool)

(declare-fun res!263041 () Bool)

(assert (=> b!443752 (=> (not res!263041) (not e!261043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443752 (= res!263041 (validKeyInArray!0 k0!794))))

(declare-fun b!443753 () Bool)

(declare-fun res!263045 () Bool)

(assert (=> b!443753 (=> (not res!263045) (not e!261043))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443753 (= res!263045 (and (= (size!13474 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13473 _keys!709) (size!13474 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443754 () Bool)

(declare-fun res!263039 () Bool)

(assert (=> b!443754 (=> (not res!263039) (not e!261043))))

(assert (=> b!443754 (= res!263039 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7766))))

(declare-fun b!443755 () Bool)

(declare-fun res!263044 () Bool)

(assert (=> b!443755 (=> (not res!263044) (not e!261043))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443755 (= res!263044 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13473 _keys!709))))))

(declare-fun b!443756 () Bool)

(assert (=> b!443756 (= e!261043 e!261046)))

(declare-fun res!263043 () Bool)

(assert (=> b!443756 (=> (not res!263043) (not e!261046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27348 (_ BitVec 32)) Bool)

(assert (=> b!443756 (= res!263043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203411 mask!1025))))

(assert (=> b!443756 (= lt!203411 (array!27349 (store (arr!13121 _keys!709) i!563 k0!794) (size!13473 _keys!709)))))

(declare-fun b!443757 () Bool)

(declare-fun res!263042 () Bool)

(assert (=> b!443757 (=> (not res!263042) (not e!261043))))

(assert (=> b!443757 (= res!263042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443758 () Bool)

(declare-fun res!263038 () Bool)

(assert (=> b!443758 (=> (not res!263038) (not e!261043))))

(assert (=> b!443758 (= res!263038 (or (= (select (arr!13121 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13121 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19278 () Bool)

(declare-fun tp!37260 () Bool)

(assert (=> mapNonEmpty!19278 (= mapRes!19278 (and tp!37260 e!261048))))

(declare-fun mapValue!19278 () ValueCell!5540)

(declare-fun mapKey!19278 () (_ BitVec 32))

(declare-fun mapRest!19278 () (Array (_ BitVec 32) ValueCell!5540))

(assert (=> mapNonEmpty!19278 (= (arr!13122 _values!549) (store mapRest!19278 mapKey!19278 mapValue!19278))))

(assert (= (and start!40368 res!263047) b!443747))

(assert (= (and b!443747 res!263046) b!443753))

(assert (= (and b!443753 res!263045) b!443757))

(assert (= (and b!443757 res!263042) b!443754))

(assert (= (and b!443754 res!263039) b!443755))

(assert (= (and b!443755 res!263044) b!443752))

(assert (= (and b!443752 res!263041) b!443758))

(assert (= (and b!443758 res!263038) b!443749))

(assert (= (and b!443749 res!263040) b!443756))

(assert (= (and b!443756 res!263043) b!443751))

(assert (= (and b!443748 condMapEmpty!19278) mapIsEmpty!19278))

(assert (= (and b!443748 (not condMapEmpty!19278)) mapNonEmpty!19278))

(get-info :version)

(assert (= (and mapNonEmpty!19278 ((_ is ValueCellFull!5540) mapValue!19278)) b!443746))

(assert (= (and b!443748 ((_ is ValueCellFull!5540) mapDefault!19278)) b!443750))

(assert (= start!40368 b!443748))

(declare-fun m!430143 () Bool)

(assert (=> b!443747 m!430143))

(declare-fun m!430145 () Bool)

(assert (=> mapNonEmpty!19278 m!430145))

(declare-fun m!430147 () Bool)

(assert (=> b!443754 m!430147))

(declare-fun m!430149 () Bool)

(assert (=> b!443749 m!430149))

(declare-fun m!430151 () Bool)

(assert (=> b!443751 m!430151))

(declare-fun m!430153 () Bool)

(assert (=> b!443757 m!430153))

(declare-fun m!430155 () Bool)

(assert (=> b!443756 m!430155))

(declare-fun m!430157 () Bool)

(assert (=> b!443756 m!430157))

(declare-fun m!430159 () Bool)

(assert (=> start!40368 m!430159))

(declare-fun m!430161 () Bool)

(assert (=> start!40368 m!430161))

(declare-fun m!430163 () Bool)

(assert (=> b!443758 m!430163))

(declare-fun m!430165 () Bool)

(assert (=> b!443752 m!430165))

(check-sat (not b!443752) (not b!443751) (not mapNonEmpty!19278) tp_is_empty!11767 (not start!40368) (not b!443749) (not b!443747) (not b!443754) (not b!443757) (not b!443756))
(check-sat)
