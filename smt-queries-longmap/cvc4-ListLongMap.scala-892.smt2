; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20452 () Bool)

(assert start!20452)

(declare-fun b_free!5111 () Bool)

(declare-fun b_next!5111 () Bool)

(assert (=> start!20452 (= b_free!5111 (not b_next!5111))))

(declare-fun tp!18365 () Bool)

(declare-fun b_and!11857 () Bool)

(assert (=> start!20452 (= tp!18365 b_and!11857)))

(declare-fun b!202635 () Bool)

(declare-fun res!97159 () Bool)

(declare-fun e!132718 () Bool)

(assert (=> b!202635 (=> (not res!97159) (not e!132718))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202635 (= res!97159 (validKeyInArray!0 k!843))))

(declare-fun b!202636 () Bool)

(declare-fun res!97156 () Bool)

(assert (=> b!202636 (=> (not res!97156) (not e!132718))))

(declare-datatypes ((array!9159 0))(
  ( (array!9160 (arr!4330 (Array (_ BitVec 32) (_ BitVec 64))) (size!4655 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9159)

(declare-datatypes ((List!2739 0))(
  ( (Nil!2736) (Cons!2735 (h!3377 (_ BitVec 64)) (t!7670 List!2739)) )
))
(declare-fun arrayNoDuplicates!0 (array!9159 (_ BitVec 32) List!2739) Bool)

(assert (=> b!202636 (= res!97156 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2736))))

(declare-fun b!202637 () Bool)

(declare-fun e!132717 () Bool)

(declare-fun tp_is_empty!4967 () Bool)

(assert (=> b!202637 (= e!132717 tp_is_empty!4967)))

(declare-fun b!202638 () Bool)

(declare-fun e!132719 () Bool)

(assert (=> b!202638 (= e!132718 (not e!132719))))

(declare-fun res!97157 () Bool)

(assert (=> b!202638 (=> res!97157 e!132719)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202638 (= res!97157 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6269 0))(
  ( (V!6270 (val!2528 Int)) )
))
(declare-datatypes ((tuple2!3836 0))(
  ( (tuple2!3837 (_1!1929 (_ BitVec 64)) (_2!1929 V!6269)) )
))
(declare-datatypes ((List!2740 0))(
  ( (Nil!2737) (Cons!2736 (h!3378 tuple2!3836) (t!7671 List!2740)) )
))
(declare-datatypes ((ListLongMap!2749 0))(
  ( (ListLongMap!2750 (toList!1390 List!2740)) )
))
(declare-fun lt!101815 () ListLongMap!2749)

(declare-datatypes ((ValueCell!2140 0))(
  ( (ValueCellFull!2140 (v!4498 V!6269)) (EmptyCell!2140) )
))
(declare-datatypes ((array!9161 0))(
  ( (array!9162 (arr!4331 (Array (_ BitVec 32) ValueCell!2140)) (size!4656 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9161)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6269)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6269)

(declare-fun getCurrentListMap!969 (array!9159 array!9161 (_ BitVec 32) (_ BitVec 32) V!6269 V!6269 (_ BitVec 32) Int) ListLongMap!2749)

(assert (=> b!202638 (= lt!101815 (getCurrentListMap!969 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101823 () array!9161)

(declare-fun lt!101817 () ListLongMap!2749)

(assert (=> b!202638 (= lt!101817 (getCurrentListMap!969 _keys!825 lt!101823 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101818 () ListLongMap!2749)

(declare-fun lt!101816 () ListLongMap!2749)

(assert (=> b!202638 (and (= lt!101818 lt!101816) (= lt!101816 lt!101818))))

(declare-fun lt!101814 () ListLongMap!2749)

(declare-fun lt!101819 () tuple2!3836)

(declare-fun +!417 (ListLongMap!2749 tuple2!3836) ListLongMap!2749)

(assert (=> b!202638 (= lt!101816 (+!417 lt!101814 lt!101819))))

(declare-fun v!520 () V!6269)

(assert (=> b!202638 (= lt!101819 (tuple2!3837 k!843 v!520))))

(declare-datatypes ((Unit!6128 0))(
  ( (Unit!6129) )
))
(declare-fun lt!101822 () Unit!6128)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!82 (array!9159 array!9161 (_ BitVec 32) (_ BitVec 32) V!6269 V!6269 (_ BitVec 32) (_ BitVec 64) V!6269 (_ BitVec 32) Int) Unit!6128)

(assert (=> b!202638 (= lt!101822 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!82 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!343 (array!9159 array!9161 (_ BitVec 32) (_ BitVec 32) V!6269 V!6269 (_ BitVec 32) Int) ListLongMap!2749)

(assert (=> b!202638 (= lt!101818 (getCurrentListMapNoExtraKeys!343 _keys!825 lt!101823 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202638 (= lt!101823 (array!9162 (store (arr!4331 _values!649) i!601 (ValueCellFull!2140 v!520)) (size!4656 _values!649)))))

(assert (=> b!202638 (= lt!101814 (getCurrentListMapNoExtraKeys!343 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8519 () Bool)

(declare-fun mapRes!8519 () Bool)

(declare-fun tp!18364 () Bool)

(assert (=> mapNonEmpty!8519 (= mapRes!8519 (and tp!18364 e!132717))))

(declare-fun mapKey!8519 () (_ BitVec 32))

(declare-fun mapValue!8519 () ValueCell!2140)

(declare-fun mapRest!8519 () (Array (_ BitVec 32) ValueCell!2140))

(assert (=> mapNonEmpty!8519 (= (arr!4331 _values!649) (store mapRest!8519 mapKey!8519 mapValue!8519))))

(declare-fun b!202639 () Bool)

(declare-fun e!132715 () Bool)

(assert (=> b!202639 (= e!132715 true)))

(declare-fun lt!101821 () ListLongMap!2749)

(declare-fun lt!101812 () ListLongMap!2749)

(assert (=> b!202639 (= lt!101821 (+!417 lt!101812 lt!101819))))

(declare-fun lt!101813 () Unit!6128)

(declare-fun addCommutativeForDiffKeys!133 (ListLongMap!2749 (_ BitVec 64) V!6269 (_ BitVec 64) V!6269) Unit!6128)

(assert (=> b!202639 (= lt!101813 (addCommutativeForDiffKeys!133 lt!101814 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97155 () Bool)

(assert (=> start!20452 (=> (not res!97155) (not e!132718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20452 (= res!97155 (validMask!0 mask!1149))))

(assert (=> start!20452 e!132718))

(declare-fun e!132713 () Bool)

(declare-fun array_inv!2857 (array!9161) Bool)

(assert (=> start!20452 (and (array_inv!2857 _values!649) e!132713)))

(assert (=> start!20452 true))

(assert (=> start!20452 tp_is_empty!4967))

(declare-fun array_inv!2858 (array!9159) Bool)

(assert (=> start!20452 (array_inv!2858 _keys!825)))

(assert (=> start!20452 tp!18365))

(declare-fun b!202640 () Bool)

(declare-fun res!97151 () Bool)

(assert (=> b!202640 (=> (not res!97151) (not e!132718))))

(assert (=> b!202640 (= res!97151 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4655 _keys!825))))))

(declare-fun b!202641 () Bool)

(declare-fun e!132716 () Bool)

(assert (=> b!202641 (= e!132716 tp_is_empty!4967)))

(declare-fun b!202642 () Bool)

(declare-fun res!97154 () Bool)

(assert (=> b!202642 (=> (not res!97154) (not e!132718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9159 (_ BitVec 32)) Bool)

(assert (=> b!202642 (= res!97154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202643 () Bool)

(declare-fun res!97153 () Bool)

(assert (=> b!202643 (=> (not res!97153) (not e!132718))))

(assert (=> b!202643 (= res!97153 (and (= (size!4656 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4655 _keys!825) (size!4656 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8519 () Bool)

(assert (=> mapIsEmpty!8519 mapRes!8519))

(declare-fun b!202644 () Bool)

(assert (=> b!202644 (= e!132719 e!132715)))

(declare-fun res!97158 () Bool)

(assert (=> b!202644 (=> res!97158 e!132715)))

(assert (=> b!202644 (= res!97158 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!202644 (= lt!101817 lt!101821)))

(declare-fun lt!101820 () tuple2!3836)

(assert (=> b!202644 (= lt!101821 (+!417 lt!101816 lt!101820))))

(assert (=> b!202644 (= lt!101815 lt!101812)))

(assert (=> b!202644 (= lt!101812 (+!417 lt!101814 lt!101820))))

(assert (=> b!202644 (= lt!101817 (+!417 lt!101818 lt!101820))))

(assert (=> b!202644 (= lt!101820 (tuple2!3837 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202645 () Bool)

(assert (=> b!202645 (= e!132713 (and e!132716 mapRes!8519))))

(declare-fun condMapEmpty!8519 () Bool)

(declare-fun mapDefault!8519 () ValueCell!2140)

