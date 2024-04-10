; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40224 () Bool)

(assert start!40224)

(declare-fun b_free!10491 () Bool)

(declare-fun b_next!10491 () Bool)

(assert (=> start!40224 (= b_free!10491 (not b_next!10491))))

(declare-fun tp!37001 () Bool)

(declare-fun b_and!18459 () Bool)

(assert (=> start!40224 (= tp!37001 b_and!18459)))

(declare-fun b!441140 () Bool)

(declare-fun res!261066 () Bool)

(declare-fun e!259800 () Bool)

(assert (=> b!441140 (=> (not res!261066) (not e!259800))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27099 0))(
  ( (array!27100 (arr!12999 (Array (_ BitVec 32) (_ BitVec 64))) (size!13351 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27099)

(assert (=> b!441140 (= res!261066 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13351 _keys!709))))))

(declare-fun b!441141 () Bool)

(declare-fun e!259802 () Bool)

(declare-fun tp_is_empty!11643 () Bool)

(assert (=> b!441141 (= e!259802 tp_is_empty!11643)))

(declare-fun b!441142 () Bool)

(declare-fun e!259797 () Bool)

(declare-fun e!259798 () Bool)

(assert (=> b!441142 (= e!259797 e!259798)))

(declare-fun res!261072 () Bool)

(assert (=> b!441142 (=> (not res!261072) (not e!259798))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!441142 (= res!261072 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16629 0))(
  ( (V!16630 (val!5866 Int)) )
))
(declare-fun minValue!515 () V!16629)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16629)

(declare-datatypes ((ValueCell!5478 0))(
  ( (ValueCellFull!5478 (v!8113 V!16629)) (EmptyCell!5478) )
))
(declare-datatypes ((array!27101 0))(
  ( (array!27102 (arr!13000 (Array (_ BitVec 32) ValueCell!5478)) (size!13352 (_ BitVec 32))) )
))
(declare-fun lt!202804 () array!27101)

(declare-fun lt!202803 () array!27099)

(declare-datatypes ((tuple2!7804 0))(
  ( (tuple2!7805 (_1!3913 (_ BitVec 64)) (_2!3913 V!16629)) )
))
(declare-datatypes ((List!7799 0))(
  ( (Nil!7796) (Cons!7795 (h!8651 tuple2!7804) (t!13555 List!7799)) )
))
(declare-datatypes ((ListLongMap!6717 0))(
  ( (ListLongMap!6718 (toList!3374 List!7799)) )
))
(declare-fun lt!202805 () ListLongMap!6717)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1563 (array!27099 array!27101 (_ BitVec 32) (_ BitVec 32) V!16629 V!16629 (_ BitVec 32) Int) ListLongMap!6717)

(assert (=> b!441142 (= lt!202805 (getCurrentListMapNoExtraKeys!1563 lt!202803 lt!202804 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27101)

(declare-fun v!412 () V!16629)

(assert (=> b!441142 (= lt!202804 (array!27102 (store (arr!13000 _values!549) i!563 (ValueCellFull!5478 v!412)) (size!13352 _values!549)))))

(declare-fun lt!202802 () ListLongMap!6717)

(assert (=> b!441142 (= lt!202802 (getCurrentListMapNoExtraKeys!1563 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441143 () Bool)

(declare-fun e!259799 () Bool)

(declare-fun mapRes!19086 () Bool)

(assert (=> b!441143 (= e!259799 (and e!259802 mapRes!19086))))

(declare-fun condMapEmpty!19086 () Bool)

(declare-fun mapDefault!19086 () ValueCell!5478)

(assert (=> b!441143 (= condMapEmpty!19086 (= (arr!13000 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5478)) mapDefault!19086)))))

(declare-fun b!441144 () Bool)

(declare-fun res!261077 () Bool)

(assert (=> b!441144 (=> (not res!261077) (not e!259800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27099 (_ BitVec 32)) Bool)

(assert (=> b!441144 (= res!261077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441145 () Bool)

(declare-fun res!261076 () Bool)

(assert (=> b!441145 (=> (not res!261076) (not e!259800))))

(declare-datatypes ((List!7800 0))(
  ( (Nil!7797) (Cons!7796 (h!8652 (_ BitVec 64)) (t!13556 List!7800)) )
))
(declare-fun arrayNoDuplicates!0 (array!27099 (_ BitVec 32) List!7800) Bool)

(assert (=> b!441145 (= res!261076 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7797))))

(declare-fun b!441146 () Bool)

(declare-fun res!261073 () Bool)

(assert (=> b!441146 (=> (not res!261073) (not e!259800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441146 (= res!261073 (validMask!0 mask!1025))))

(declare-fun b!441147 () Bool)

(declare-fun res!261068 () Bool)

(assert (=> b!441147 (=> (not res!261068) (not e!259800))))

(assert (=> b!441147 (= res!261068 (or (= (select (arr!12999 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12999 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19086 () Bool)

(assert (=> mapIsEmpty!19086 mapRes!19086))

(declare-fun b!441148 () Bool)

(assert (=> b!441148 (= e!259798 (not true))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1510 (ListLongMap!6717 tuple2!7804) ListLongMap!6717)

(assert (=> b!441148 (= (getCurrentListMapNoExtraKeys!1563 lt!202803 lt!202804 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1510 (getCurrentListMapNoExtraKeys!1563 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7805 k0!794 v!412)))))

(declare-datatypes ((Unit!13124 0))(
  ( (Unit!13125) )
))
(declare-fun lt!202801 () Unit!13124)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!679 (array!27099 array!27101 (_ BitVec 32) (_ BitVec 32) V!16629 V!16629 (_ BitVec 32) (_ BitVec 64) V!16629 (_ BitVec 32) Int) Unit!13124)

(assert (=> b!441148 (= lt!202801 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!679 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441149 () Bool)

(declare-fun res!261070 () Bool)

(assert (=> b!441149 (=> (not res!261070) (not e!259800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441149 (= res!261070 (validKeyInArray!0 k0!794))))

(declare-fun b!441150 () Bool)

(declare-fun res!261071 () Bool)

(assert (=> b!441150 (=> (not res!261071) (not e!259797))))

(assert (=> b!441150 (= res!261071 (arrayNoDuplicates!0 lt!202803 #b00000000000000000000000000000000 Nil!7797))))

(declare-fun b!441151 () Bool)

(declare-fun res!261075 () Bool)

(assert (=> b!441151 (=> (not res!261075) (not e!259797))))

(assert (=> b!441151 (= res!261075 (bvsle from!863 i!563))))

(declare-fun b!441152 () Bool)

(declare-fun res!261069 () Bool)

(assert (=> b!441152 (=> (not res!261069) (not e!259800))))

(assert (=> b!441152 (= res!261069 (and (= (size!13352 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13351 _keys!709) (size!13352 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441153 () Bool)

(assert (=> b!441153 (= e!259800 e!259797)))

(declare-fun res!261067 () Bool)

(assert (=> b!441153 (=> (not res!261067) (not e!259797))))

(assert (=> b!441153 (= res!261067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202803 mask!1025))))

(assert (=> b!441153 (= lt!202803 (array!27100 (store (arr!12999 _keys!709) i!563 k0!794) (size!13351 _keys!709)))))

(declare-fun res!261078 () Bool)

(assert (=> start!40224 (=> (not res!261078) (not e!259800))))

(assert (=> start!40224 (= res!261078 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13351 _keys!709))))))

(assert (=> start!40224 e!259800))

(assert (=> start!40224 tp_is_empty!11643))

(assert (=> start!40224 tp!37001))

(assert (=> start!40224 true))

(declare-fun array_inv!9436 (array!27101) Bool)

(assert (=> start!40224 (and (array_inv!9436 _values!549) e!259799)))

(declare-fun array_inv!9437 (array!27099) Bool)

(assert (=> start!40224 (array_inv!9437 _keys!709)))

(declare-fun b!441154 () Bool)

(declare-fun e!259803 () Bool)

(assert (=> b!441154 (= e!259803 tp_is_empty!11643)))

(declare-fun mapNonEmpty!19086 () Bool)

(declare-fun tp!37002 () Bool)

(assert (=> mapNonEmpty!19086 (= mapRes!19086 (and tp!37002 e!259803))))

(declare-fun mapValue!19086 () ValueCell!5478)

(declare-fun mapKey!19086 () (_ BitVec 32))

(declare-fun mapRest!19086 () (Array (_ BitVec 32) ValueCell!5478))

(assert (=> mapNonEmpty!19086 (= (arr!13000 _values!549) (store mapRest!19086 mapKey!19086 mapValue!19086))))

(declare-fun b!441155 () Bool)

(declare-fun res!261074 () Bool)

(assert (=> b!441155 (=> (not res!261074) (not e!259800))))

(declare-fun arrayContainsKey!0 (array!27099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441155 (= res!261074 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40224 res!261078) b!441146))

(assert (= (and b!441146 res!261073) b!441152))

(assert (= (and b!441152 res!261069) b!441144))

(assert (= (and b!441144 res!261077) b!441145))

(assert (= (and b!441145 res!261076) b!441140))

(assert (= (and b!441140 res!261066) b!441149))

(assert (= (and b!441149 res!261070) b!441147))

(assert (= (and b!441147 res!261068) b!441155))

(assert (= (and b!441155 res!261074) b!441153))

(assert (= (and b!441153 res!261067) b!441150))

(assert (= (and b!441150 res!261071) b!441151))

(assert (= (and b!441151 res!261075) b!441142))

(assert (= (and b!441142 res!261072) b!441148))

(assert (= (and b!441143 condMapEmpty!19086) mapIsEmpty!19086))

(assert (= (and b!441143 (not condMapEmpty!19086)) mapNonEmpty!19086))

(get-info :version)

(assert (= (and mapNonEmpty!19086 ((_ is ValueCellFull!5478) mapValue!19086)) b!441154))

(assert (= (and b!441143 ((_ is ValueCellFull!5478) mapDefault!19086)) b!441141))

(assert (= start!40224 b!441143))

(declare-fun m!428039 () Bool)

(assert (=> mapNonEmpty!19086 m!428039))

(declare-fun m!428041 () Bool)

(assert (=> b!441144 m!428041))

(declare-fun m!428043 () Bool)

(assert (=> b!441145 m!428043))

(declare-fun m!428045 () Bool)

(assert (=> b!441142 m!428045))

(declare-fun m!428047 () Bool)

(assert (=> b!441142 m!428047))

(declare-fun m!428049 () Bool)

(assert (=> b!441142 m!428049))

(declare-fun m!428051 () Bool)

(assert (=> b!441153 m!428051))

(declare-fun m!428053 () Bool)

(assert (=> b!441153 m!428053))

(declare-fun m!428055 () Bool)

(assert (=> b!441148 m!428055))

(declare-fun m!428057 () Bool)

(assert (=> b!441148 m!428057))

(assert (=> b!441148 m!428057))

(declare-fun m!428059 () Bool)

(assert (=> b!441148 m!428059))

(declare-fun m!428061 () Bool)

(assert (=> b!441148 m!428061))

(declare-fun m!428063 () Bool)

(assert (=> b!441147 m!428063))

(declare-fun m!428065 () Bool)

(assert (=> start!40224 m!428065))

(declare-fun m!428067 () Bool)

(assert (=> start!40224 m!428067))

(declare-fun m!428069 () Bool)

(assert (=> b!441146 m!428069))

(declare-fun m!428071 () Bool)

(assert (=> b!441149 m!428071))

(declare-fun m!428073 () Bool)

(assert (=> b!441155 m!428073))

(declare-fun m!428075 () Bool)

(assert (=> b!441150 m!428075))

(check-sat b_and!18459 (not b!441145) (not b!441144) (not b!441142) (not b!441155) tp_is_empty!11643 (not start!40224) (not b!441148) (not b!441150) (not mapNonEmpty!19086) (not b!441149) (not b_next!10491) (not b!441153) (not b!441146))
(check-sat b_and!18459 (not b_next!10491))
