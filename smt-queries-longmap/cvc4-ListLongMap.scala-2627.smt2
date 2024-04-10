; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39584 () Bool)

(assert start!39584)

(declare-fun b_free!9851 () Bool)

(declare-fun b_next!9851 () Bool)

(assert (=> start!39584 (= b_free!9851 (not b_next!9851))))

(declare-fun tp!35082 () Bool)

(declare-fun b_and!17507 () Bool)

(assert (=> start!39584 (= tp!35082 b_and!17507)))

(declare-fun mapIsEmpty!18126 () Bool)

(declare-fun mapRes!18126 () Bool)

(assert (=> mapIsEmpty!18126 mapRes!18126))

(declare-fun b!423894 () Bool)

(declare-fun res!247850 () Bool)

(declare-fun e!251917 () Bool)

(assert (=> b!423894 (=> (not res!247850) (not e!251917))))

(declare-datatypes ((array!25847 0))(
  ( (array!25848 (arr!12373 (Array (_ BitVec 32) (_ BitVec 64))) (size!12725 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25847)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423894 (= res!247850 (or (= (select (arr!12373 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12373 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18126 () Bool)

(declare-fun tp!35081 () Bool)

(declare-fun e!251919 () Bool)

(assert (=> mapNonEmpty!18126 (= mapRes!18126 (and tp!35081 e!251919))))

(declare-fun mapKey!18126 () (_ BitVec 32))

(declare-datatypes ((V!15775 0))(
  ( (V!15776 (val!5546 Int)) )
))
(declare-datatypes ((ValueCell!5158 0))(
  ( (ValueCellFull!5158 (v!7793 V!15775)) (EmptyCell!5158) )
))
(declare-fun mapValue!18126 () ValueCell!5158)

(declare-datatypes ((array!25849 0))(
  ( (array!25850 (arr!12374 (Array (_ BitVec 32) ValueCell!5158)) (size!12726 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25849)

(declare-fun mapRest!18126 () (Array (_ BitVec 32) ValueCell!5158))

(assert (=> mapNonEmpty!18126 (= (arr!12374 _values!549) (store mapRest!18126 mapKey!18126 mapValue!18126))))

(declare-fun b!423895 () Bool)

(declare-fun tp_is_empty!11003 () Bool)

(assert (=> b!423895 (= e!251919 tp_is_empty!11003)))

(declare-fun b!423896 () Bool)

(declare-fun res!247842 () Bool)

(declare-fun e!251920 () Bool)

(assert (=> b!423896 (=> (not res!247842) (not e!251920))))

(declare-fun lt!194259 () array!25847)

(declare-datatypes ((List!7294 0))(
  ( (Nil!7291) (Cons!7290 (h!8146 (_ BitVec 64)) (t!12738 List!7294)) )
))
(declare-fun arrayNoDuplicates!0 (array!25847 (_ BitVec 32) List!7294) Bool)

(assert (=> b!423896 (= res!247842 (arrayNoDuplicates!0 lt!194259 #b00000000000000000000000000000000 Nil!7291))))

(declare-fun b!423897 () Bool)

(declare-fun res!247847 () Bool)

(assert (=> b!423897 (=> (not res!247847) (not e!251917))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!423897 (= res!247847 (and (= (size!12726 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12725 _keys!709) (size!12726 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423898 () Bool)

(declare-fun res!247846 () Bool)

(assert (=> b!423898 (=> (not res!247846) (not e!251917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423898 (= res!247846 (validMask!0 mask!1025))))

(declare-fun b!423899 () Bool)

(assert (=> b!423899 (= e!251917 e!251920)))

(declare-fun res!247843 () Bool)

(assert (=> b!423899 (=> (not res!247843) (not e!251920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25847 (_ BitVec 32)) Bool)

(assert (=> b!423899 (= res!247843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194259 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!423899 (= lt!194259 (array!25848 (store (arr!12373 _keys!709) i!563 k!794) (size!12725 _keys!709)))))

(declare-fun b!423900 () Bool)

(declare-fun res!247851 () Bool)

(assert (=> b!423900 (=> (not res!247851) (not e!251917))))

(assert (=> b!423900 (= res!247851 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12725 _keys!709))))))

(declare-fun res!247840 () Bool)

(assert (=> start!39584 (=> (not res!247840) (not e!251917))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39584 (= res!247840 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12725 _keys!709))))))

(assert (=> start!39584 e!251917))

(assert (=> start!39584 tp_is_empty!11003))

(assert (=> start!39584 tp!35082))

(assert (=> start!39584 true))

(declare-fun e!251918 () Bool)

(declare-fun array_inv!9018 (array!25849) Bool)

(assert (=> start!39584 (and (array_inv!9018 _values!549) e!251918)))

(declare-fun array_inv!9019 (array!25847) Bool)

(assert (=> start!39584 (array_inv!9019 _keys!709)))

(declare-fun b!423901 () Bool)

(declare-fun res!247844 () Bool)

(assert (=> b!423901 (=> (not res!247844) (not e!251917))))

(declare-fun arrayContainsKey!0 (array!25847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423901 (= res!247844 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!423902 () Bool)

(declare-fun res!247848 () Bool)

(assert (=> b!423902 (=> (not res!247848) (not e!251917))))

(assert (=> b!423902 (= res!247848 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7291))))

(declare-fun b!423903 () Bool)

(declare-fun res!247845 () Bool)

(assert (=> b!423903 (=> (not res!247845) (not e!251917))))

(assert (=> b!423903 (= res!247845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423904 () Bool)

(declare-fun res!247849 () Bool)

(assert (=> b!423904 (=> (not res!247849) (not e!251917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423904 (= res!247849 (validKeyInArray!0 k!794))))

(declare-fun b!423905 () Bool)

(assert (=> b!423905 (= e!251920 false)))

(declare-fun minValue!515 () V!15775)

(declare-datatypes ((tuple2!7286 0))(
  ( (tuple2!7287 (_1!3654 (_ BitVec 64)) (_2!3654 V!15775)) )
))
(declare-datatypes ((List!7295 0))(
  ( (Nil!7292) (Cons!7291 (h!8147 tuple2!7286) (t!12739 List!7295)) )
))
(declare-datatypes ((ListLongMap!6199 0))(
  ( (ListLongMap!6200 (toList!3115 List!7295)) )
))
(declare-fun lt!194261 () ListLongMap!6199)

(declare-fun zeroValue!515 () V!15775)

(declare-fun v!412 () V!15775)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1319 (array!25847 array!25849 (_ BitVec 32) (_ BitVec 32) V!15775 V!15775 (_ BitVec 32) Int) ListLongMap!6199)

(assert (=> b!423905 (= lt!194261 (getCurrentListMapNoExtraKeys!1319 lt!194259 (array!25850 (store (arr!12374 _values!549) i!563 (ValueCellFull!5158 v!412)) (size!12726 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194260 () ListLongMap!6199)

(assert (=> b!423905 (= lt!194260 (getCurrentListMapNoExtraKeys!1319 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423906 () Bool)

(declare-fun res!247841 () Bool)

(assert (=> b!423906 (=> (not res!247841) (not e!251920))))

(assert (=> b!423906 (= res!247841 (bvsle from!863 i!563))))

(declare-fun b!423907 () Bool)

(declare-fun e!251922 () Bool)

(assert (=> b!423907 (= e!251918 (and e!251922 mapRes!18126))))

(declare-fun condMapEmpty!18126 () Bool)

(declare-fun mapDefault!18126 () ValueCell!5158)

