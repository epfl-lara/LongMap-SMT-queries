; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39068 () Bool)

(assert start!39068)

(declare-fun b_free!9349 () Bool)

(declare-fun b_next!9349 () Bool)

(assert (=> start!39068 (= b_free!9349 (not b_next!9349))))

(declare-fun tp!33575 () Bool)

(declare-fun b_and!16709 () Bool)

(assert (=> start!39068 (= tp!33575 b_and!16709)))

(declare-fun b!410186 () Bool)

(declare-fun e!245844 () Bool)

(declare-fun e!245839 () Bool)

(declare-fun mapRes!17373 () Bool)

(assert (=> b!410186 (= e!245844 (and e!245839 mapRes!17373))))

(declare-fun condMapEmpty!17373 () Bool)

(declare-datatypes ((V!15107 0))(
  ( (V!15108 (val!5295 Int)) )
))
(declare-datatypes ((ValueCell!4907 0))(
  ( (ValueCellFull!4907 (v!7536 V!15107)) (EmptyCell!4907) )
))
(declare-datatypes ((array!24859 0))(
  ( (array!24860 (arr!11879 (Array (_ BitVec 32) ValueCell!4907)) (size!12232 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24859)

(declare-fun mapDefault!17373 () ValueCell!4907)

(assert (=> b!410186 (= condMapEmpty!17373 (= (arr!11879 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4907)) mapDefault!17373)))))

(declare-fun b!410187 () Bool)

(declare-fun res!237786 () Bool)

(declare-fun e!245843 () Bool)

(assert (=> b!410187 (=> (not res!237786) (not e!245843))))

(declare-datatypes ((array!24861 0))(
  ( (array!24862 (arr!11880 (Array (_ BitVec 32) (_ BitVec 64))) (size!12233 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24861)

(declare-datatypes ((List!6863 0))(
  ( (Nil!6860) (Cons!6859 (h!7715 (_ BitVec 64)) (t!12028 List!6863)) )
))
(declare-fun arrayNoDuplicates!0 (array!24861 (_ BitVec 32) List!6863) Bool)

(assert (=> b!410187 (= res!237786 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6860))))

(declare-fun b!410188 () Bool)

(declare-fun res!237776 () Bool)

(declare-fun e!245840 () Bool)

(assert (=> b!410188 (=> (not res!237776) (not e!245840))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410188 (= res!237776 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17373 () Bool)

(assert (=> mapIsEmpty!17373 mapRes!17373))

(declare-fun b!410189 () Bool)

(declare-fun res!237779 () Bool)

(assert (=> b!410189 (=> (not res!237779) (not e!245843))))

(assert (=> b!410189 (= res!237779 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12233 _keys!709))))))

(declare-fun b!410190 () Bool)

(declare-fun res!237782 () Bool)

(assert (=> b!410190 (=> (not res!237782) (not e!245843))))

(assert (=> b!410190 (= res!237782 (or (= (select (arr!11880 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11880 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410191 () Bool)

(declare-fun e!245841 () Bool)

(declare-fun tp_is_empty!10501 () Bool)

(assert (=> b!410191 (= e!245841 tp_is_empty!10501)))

(declare-fun mapNonEmpty!17373 () Bool)

(declare-fun tp!33576 () Bool)

(assert (=> mapNonEmpty!17373 (= mapRes!17373 (and tp!33576 e!245841))))

(declare-fun mapKey!17373 () (_ BitVec 32))

(declare-fun mapValue!17373 () ValueCell!4907)

(declare-fun mapRest!17373 () (Array (_ BitVec 32) ValueCell!4907))

(assert (=> mapNonEmpty!17373 (= (arr!11879 _values!549) (store mapRest!17373 mapKey!17373 mapValue!17373))))

(declare-fun b!410192 () Bool)

(declare-fun res!237784 () Bool)

(assert (=> b!410192 (=> (not res!237784) (not e!245843))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410192 (= res!237784 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410193 () Bool)

(assert (=> b!410193 (= e!245839 tp_is_empty!10501)))

(declare-fun b!410194 () Bool)

(declare-fun res!237775 () Bool)

(assert (=> b!410194 (=> (not res!237775) (not e!245843))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410194 (= res!237775 (validMask!0 mask!1025))))

(declare-fun b!410195 () Bool)

(declare-fun res!237785 () Bool)

(assert (=> b!410195 (=> (not res!237785) (not e!245843))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410195 (= res!237785 (and (= (size!12232 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12233 _keys!709) (size!12232 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410196 () Bool)

(declare-fun res!237783 () Bool)

(assert (=> b!410196 (=> (not res!237783) (not e!245843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24861 (_ BitVec 32)) Bool)

(assert (=> b!410196 (= res!237783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410197 () Bool)

(assert (=> b!410197 (= e!245840 false)))

(declare-fun minValue!515 () V!15107)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15107)

(declare-datatypes ((tuple2!6850 0))(
  ( (tuple2!6851 (_1!3436 (_ BitVec 64)) (_2!3436 V!15107)) )
))
(declare-datatypes ((List!6864 0))(
  ( (Nil!6861) (Cons!6860 (h!7716 tuple2!6850) (t!12029 List!6864)) )
))
(declare-datatypes ((ListLongMap!5753 0))(
  ( (ListLongMap!5754 (toList!2892 List!6864)) )
))
(declare-fun lt!188852 () ListLongMap!5753)

(declare-fun v!412 () V!15107)

(declare-fun lt!188850 () array!24861)

(declare-fun getCurrentListMapNoExtraKeys!1106 (array!24861 array!24859 (_ BitVec 32) (_ BitVec 32) V!15107 V!15107 (_ BitVec 32) Int) ListLongMap!5753)

(assert (=> b!410197 (= lt!188852 (getCurrentListMapNoExtraKeys!1106 lt!188850 (array!24860 (store (arr!11879 _values!549) i!563 (ValueCellFull!4907 v!412)) (size!12232 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!188851 () ListLongMap!5753)

(assert (=> b!410197 (= lt!188851 (getCurrentListMapNoExtraKeys!1106 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!237780 () Bool)

(assert (=> start!39068 (=> (not res!237780) (not e!245843))))

(assert (=> start!39068 (= res!237780 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12233 _keys!709))))))

(assert (=> start!39068 e!245843))

(assert (=> start!39068 tp_is_empty!10501))

(assert (=> start!39068 tp!33575))

(assert (=> start!39068 true))

(declare-fun array_inv!8712 (array!24859) Bool)

(assert (=> start!39068 (and (array_inv!8712 _values!549) e!245844)))

(declare-fun array_inv!8713 (array!24861) Bool)

(assert (=> start!39068 (array_inv!8713 _keys!709)))

(declare-fun b!410198 () Bool)

(assert (=> b!410198 (= e!245843 e!245840)))

(declare-fun res!237778 () Bool)

(assert (=> b!410198 (=> (not res!237778) (not e!245840))))

(assert (=> b!410198 (= res!237778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188850 mask!1025))))

(assert (=> b!410198 (= lt!188850 (array!24862 (store (arr!11880 _keys!709) i!563 k0!794) (size!12233 _keys!709)))))

(declare-fun b!410199 () Bool)

(declare-fun res!237777 () Bool)

(assert (=> b!410199 (=> (not res!237777) (not e!245843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410199 (= res!237777 (validKeyInArray!0 k0!794))))

(declare-fun b!410200 () Bool)

(declare-fun res!237781 () Bool)

(assert (=> b!410200 (=> (not res!237781) (not e!245840))))

(assert (=> b!410200 (= res!237781 (arrayNoDuplicates!0 lt!188850 #b00000000000000000000000000000000 Nil!6860))))

(assert (= (and start!39068 res!237780) b!410194))

(assert (= (and b!410194 res!237775) b!410195))

(assert (= (and b!410195 res!237785) b!410196))

(assert (= (and b!410196 res!237783) b!410187))

(assert (= (and b!410187 res!237786) b!410189))

(assert (= (and b!410189 res!237779) b!410199))

(assert (= (and b!410199 res!237777) b!410190))

(assert (= (and b!410190 res!237782) b!410192))

(assert (= (and b!410192 res!237784) b!410198))

(assert (= (and b!410198 res!237778) b!410200))

(assert (= (and b!410200 res!237781) b!410188))

(assert (= (and b!410188 res!237776) b!410197))

(assert (= (and b!410186 condMapEmpty!17373) mapIsEmpty!17373))

(assert (= (and b!410186 (not condMapEmpty!17373)) mapNonEmpty!17373))

(get-info :version)

(assert (= (and mapNonEmpty!17373 ((_ is ValueCellFull!4907) mapValue!17373)) b!410191))

(assert (= (and b!410186 ((_ is ValueCellFull!4907) mapDefault!17373)) b!410193))

(assert (= start!39068 b!410186))

(declare-fun m!400209 () Bool)

(assert (=> b!410200 m!400209))

(declare-fun m!400211 () Bool)

(assert (=> b!410187 m!400211))

(declare-fun m!400213 () Bool)

(assert (=> b!410199 m!400213))

(declare-fun m!400215 () Bool)

(assert (=> start!39068 m!400215))

(declare-fun m!400217 () Bool)

(assert (=> start!39068 m!400217))

(declare-fun m!400219 () Bool)

(assert (=> b!410192 m!400219))

(declare-fun m!400221 () Bool)

(assert (=> b!410197 m!400221))

(declare-fun m!400223 () Bool)

(assert (=> b!410197 m!400223))

(declare-fun m!400225 () Bool)

(assert (=> b!410197 m!400225))

(declare-fun m!400227 () Bool)

(assert (=> b!410190 m!400227))

(declare-fun m!400229 () Bool)

(assert (=> b!410194 m!400229))

(declare-fun m!400231 () Bool)

(assert (=> b!410198 m!400231))

(declare-fun m!400233 () Bool)

(assert (=> b!410198 m!400233))

(declare-fun m!400235 () Bool)

(assert (=> mapNonEmpty!17373 m!400235))

(declare-fun m!400237 () Bool)

(assert (=> b!410196 m!400237))

(check-sat (not b!410194) (not b!410197) (not b_next!9349) (not b!410192) (not start!39068) (not mapNonEmpty!17373) (not b!410187) (not b!410196) tp_is_empty!10501 b_and!16709 (not b!410199) (not b!410200) (not b!410198))
(check-sat b_and!16709 (not b_next!9349))
