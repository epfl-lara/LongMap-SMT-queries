; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39110 () Bool)

(assert start!39110)

(declare-fun b_free!9391 () Bool)

(declare-fun b_next!9391 () Bool)

(assert (=> start!39110 (= b_free!9391 (not b_next!9391))))

(declare-fun tp!33701 () Bool)

(declare-fun b_and!16751 () Bool)

(assert (=> start!39110 (= tp!33701 b_and!16751)))

(declare-fun b!411131 () Bool)

(declare-fun res!238535 () Bool)

(declare-fun e!246219 () Bool)

(assert (=> b!411131 (=> (not res!238535) (not e!246219))))

(declare-datatypes ((array!24941 0))(
  ( (array!24942 (arr!11920 (Array (_ BitVec 32) (_ BitVec 64))) (size!12273 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24941)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24941 (_ BitVec 32)) Bool)

(assert (=> b!411131 (= res!238535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411132 () Bool)

(declare-fun res!238542 () Bool)

(assert (=> b!411132 (=> (not res!238542) (not e!246219))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15163 0))(
  ( (V!15164 (val!5316 Int)) )
))
(declare-datatypes ((ValueCell!4928 0))(
  ( (ValueCellFull!4928 (v!7557 V!15163)) (EmptyCell!4928) )
))
(declare-datatypes ((array!24943 0))(
  ( (array!24944 (arr!11921 (Array (_ BitVec 32) ValueCell!4928)) (size!12274 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24943)

(assert (=> b!411132 (= res!238542 (and (= (size!12274 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12273 _keys!709) (size!12274 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411133 () Bool)

(declare-fun e!246222 () Bool)

(declare-fun tp_is_empty!10543 () Bool)

(assert (=> b!411133 (= e!246222 tp_is_empty!10543)))

(declare-fun b!411134 () Bool)

(declare-fun res!238537 () Bool)

(assert (=> b!411134 (=> (not res!238537) (not e!246219))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411134 (= res!238537 (or (= (select (arr!11920 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11920 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411135 () Bool)

(declare-fun e!246220 () Bool)

(declare-fun mapRes!17436 () Bool)

(assert (=> b!411135 (= e!246220 (and e!246222 mapRes!17436))))

(declare-fun condMapEmpty!17436 () Bool)

(declare-fun mapDefault!17436 () ValueCell!4928)

(assert (=> b!411135 (= condMapEmpty!17436 (= (arr!11921 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4928)) mapDefault!17436)))))

(declare-fun b!411136 () Bool)

(declare-fun e!246221 () Bool)

(assert (=> b!411136 (= e!246221 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!189040 () array!24941)

(declare-fun minValue!515 () V!15163)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6884 0))(
  ( (tuple2!6885 (_1!3453 (_ BitVec 64)) (_2!3453 V!15163)) )
))
(declare-datatypes ((List!6896 0))(
  ( (Nil!6893) (Cons!6892 (h!7748 tuple2!6884) (t!12061 List!6896)) )
))
(declare-datatypes ((ListLongMap!5787 0))(
  ( (ListLongMap!5788 (toList!2909 List!6896)) )
))
(declare-fun lt!189041 () ListLongMap!5787)

(declare-fun zeroValue!515 () V!15163)

(declare-fun v!412 () V!15163)

(declare-fun getCurrentListMapNoExtraKeys!1123 (array!24941 array!24943 (_ BitVec 32) (_ BitVec 32) V!15163 V!15163 (_ BitVec 32) Int) ListLongMap!5787)

(assert (=> b!411136 (= lt!189041 (getCurrentListMapNoExtraKeys!1123 lt!189040 (array!24944 (store (arr!11921 _values!549) i!563 (ValueCellFull!4928 v!412)) (size!12274 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189039 () ListLongMap!5787)

(assert (=> b!411136 (= lt!189039 (getCurrentListMapNoExtraKeys!1123 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411137 () Bool)

(declare-fun res!238534 () Bool)

(assert (=> b!411137 (=> (not res!238534) (not e!246219))))

(declare-datatypes ((List!6897 0))(
  ( (Nil!6894) (Cons!6893 (h!7749 (_ BitVec 64)) (t!12062 List!6897)) )
))
(declare-fun arrayNoDuplicates!0 (array!24941 (_ BitVec 32) List!6897) Bool)

(assert (=> b!411137 (= res!238534 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6894))))

(declare-fun b!411138 () Bool)

(declare-fun res!238531 () Bool)

(assert (=> b!411138 (=> (not res!238531) (not e!246219))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411138 (= res!238531 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17436 () Bool)

(declare-fun tp!33702 () Bool)

(declare-fun e!246218 () Bool)

(assert (=> mapNonEmpty!17436 (= mapRes!17436 (and tp!33702 e!246218))))

(declare-fun mapKey!17436 () (_ BitVec 32))

(declare-fun mapRest!17436 () (Array (_ BitVec 32) ValueCell!4928))

(declare-fun mapValue!17436 () ValueCell!4928)

(assert (=> mapNonEmpty!17436 (= (arr!11921 _values!549) (store mapRest!17436 mapKey!17436 mapValue!17436))))

(declare-fun res!238539 () Bool)

(assert (=> start!39110 (=> (not res!238539) (not e!246219))))

(assert (=> start!39110 (= res!238539 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12273 _keys!709))))))

(assert (=> start!39110 e!246219))

(assert (=> start!39110 tp_is_empty!10543))

(assert (=> start!39110 tp!33701))

(assert (=> start!39110 true))

(declare-fun array_inv!8748 (array!24943) Bool)

(assert (=> start!39110 (and (array_inv!8748 _values!549) e!246220)))

(declare-fun array_inv!8749 (array!24941) Bool)

(assert (=> start!39110 (array_inv!8749 _keys!709)))

(declare-fun b!411139 () Bool)

(declare-fun res!238536 () Bool)

(assert (=> b!411139 (=> (not res!238536) (not e!246219))))

(declare-fun arrayContainsKey!0 (array!24941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411139 (= res!238536 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411140 () Bool)

(declare-fun res!238533 () Bool)

(assert (=> b!411140 (=> (not res!238533) (not e!246219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411140 (= res!238533 (validMask!0 mask!1025))))

(declare-fun b!411141 () Bool)

(declare-fun res!238540 () Bool)

(assert (=> b!411141 (=> (not res!238540) (not e!246221))))

(assert (=> b!411141 (= res!238540 (arrayNoDuplicates!0 lt!189040 #b00000000000000000000000000000000 Nil!6894))))

(declare-fun b!411142 () Bool)

(assert (=> b!411142 (= e!246218 tp_is_empty!10543)))

(declare-fun mapIsEmpty!17436 () Bool)

(assert (=> mapIsEmpty!17436 mapRes!17436))

(declare-fun b!411143 () Bool)

(declare-fun res!238541 () Bool)

(assert (=> b!411143 (=> (not res!238541) (not e!246219))))

(assert (=> b!411143 (= res!238541 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12273 _keys!709))))))

(declare-fun b!411144 () Bool)

(declare-fun res!238532 () Bool)

(assert (=> b!411144 (=> (not res!238532) (not e!246221))))

(assert (=> b!411144 (= res!238532 (bvsle from!863 i!563))))

(declare-fun b!411145 () Bool)

(assert (=> b!411145 (= e!246219 e!246221)))

(declare-fun res!238538 () Bool)

(assert (=> b!411145 (=> (not res!238538) (not e!246221))))

(assert (=> b!411145 (= res!238538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189040 mask!1025))))

(assert (=> b!411145 (= lt!189040 (array!24942 (store (arr!11920 _keys!709) i!563 k0!794) (size!12273 _keys!709)))))

(assert (= (and start!39110 res!238539) b!411140))

(assert (= (and b!411140 res!238533) b!411132))

(assert (= (and b!411132 res!238542) b!411131))

(assert (= (and b!411131 res!238535) b!411137))

(assert (= (and b!411137 res!238534) b!411143))

(assert (= (and b!411143 res!238541) b!411138))

(assert (= (and b!411138 res!238531) b!411134))

(assert (= (and b!411134 res!238537) b!411139))

(assert (= (and b!411139 res!238536) b!411145))

(assert (= (and b!411145 res!238538) b!411141))

(assert (= (and b!411141 res!238540) b!411144))

(assert (= (and b!411144 res!238532) b!411136))

(assert (= (and b!411135 condMapEmpty!17436) mapIsEmpty!17436))

(assert (= (and b!411135 (not condMapEmpty!17436)) mapNonEmpty!17436))

(get-info :version)

(assert (= (and mapNonEmpty!17436 ((_ is ValueCellFull!4928) mapValue!17436)) b!411142))

(assert (= (and b!411135 ((_ is ValueCellFull!4928) mapDefault!17436)) b!411133))

(assert (= start!39110 b!411135))

(declare-fun m!400839 () Bool)

(assert (=> b!411145 m!400839))

(declare-fun m!400841 () Bool)

(assert (=> b!411145 m!400841))

(declare-fun m!400843 () Bool)

(assert (=> b!411141 m!400843))

(declare-fun m!400845 () Bool)

(assert (=> b!411139 m!400845))

(declare-fun m!400847 () Bool)

(assert (=> b!411138 m!400847))

(declare-fun m!400849 () Bool)

(assert (=> start!39110 m!400849))

(declare-fun m!400851 () Bool)

(assert (=> start!39110 m!400851))

(declare-fun m!400853 () Bool)

(assert (=> b!411136 m!400853))

(declare-fun m!400855 () Bool)

(assert (=> b!411136 m!400855))

(declare-fun m!400857 () Bool)

(assert (=> b!411136 m!400857))

(declare-fun m!400859 () Bool)

(assert (=> b!411131 m!400859))

(declare-fun m!400861 () Bool)

(assert (=> mapNonEmpty!17436 m!400861))

(declare-fun m!400863 () Bool)

(assert (=> b!411134 m!400863))

(declare-fun m!400865 () Bool)

(assert (=> b!411137 m!400865))

(declare-fun m!400867 () Bool)

(assert (=> b!411140 m!400867))

(check-sat (not b_next!9391) (not b!411138) (not b!411139) (not b!411136) (not start!39110) (not b!411137) (not b!411140) (not mapNonEmpty!17436) tp_is_empty!10543 (not b!411141) b_and!16751 (not b!411145) (not b!411131))
(check-sat b_and!16751 (not b_next!9391))
