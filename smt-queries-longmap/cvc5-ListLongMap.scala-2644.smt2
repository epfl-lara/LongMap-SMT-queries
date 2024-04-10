; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39682 () Bool)

(assert start!39682)

(declare-fun b_free!9949 () Bool)

(declare-fun b_next!9949 () Bool)

(assert (=> start!39682 (= b_free!9949 (not b_next!9949))))

(declare-fun tp!35376 () Bool)

(declare-fun b_and!17605 () Bool)

(assert (=> start!39682 (= tp!35376 b_and!17605)))

(declare-fun b!426191 () Bool)

(declare-fun res!249700 () Bool)

(declare-fun e!252895 () Bool)

(assert (=> b!426191 (=> (not res!249700) (not e!252895))))

(declare-datatypes ((array!26041 0))(
  ( (array!26042 (arr!12470 (Array (_ BitVec 32) (_ BitVec 64))) (size!12822 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26041)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!15907 0))(
  ( (V!15908 (val!5595 Int)) )
))
(declare-datatypes ((ValueCell!5207 0))(
  ( (ValueCellFull!5207 (v!7842 V!15907)) (EmptyCell!5207) )
))
(declare-datatypes ((array!26043 0))(
  ( (array!26044 (arr!12471 (Array (_ BitVec 32) ValueCell!5207)) (size!12823 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26043)

(assert (=> b!426191 (= res!249700 (and (= (size!12823 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12822 _keys!709) (size!12823 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426192 () Bool)

(declare-fun e!252893 () Bool)

(declare-fun e!252894 () Bool)

(assert (=> b!426192 (= e!252893 e!252894)))

(declare-fun res!249699 () Bool)

(assert (=> b!426192 (=> (not res!249699) (not e!252894))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426192 (= res!249699 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((tuple2!7348 0))(
  ( (tuple2!7349 (_1!3685 (_ BitVec 64)) (_2!3685 V!15907)) )
))
(declare-datatypes ((List!7362 0))(
  ( (Nil!7359) (Cons!7358 (h!8214 tuple2!7348) (t!12806 List!7362)) )
))
(declare-datatypes ((ListLongMap!6261 0))(
  ( (ListLongMap!6262 (toList!3146 List!7362)) )
))
(declare-fun lt!194888 () ListLongMap!6261)

(declare-fun minValue!515 () V!15907)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!194885 () array!26041)

(declare-fun zeroValue!515 () V!15907)

(declare-fun lt!194887 () array!26043)

(declare-fun getCurrentListMapNoExtraKeys!1350 (array!26041 array!26043 (_ BitVec 32) (_ BitVec 32) V!15907 V!15907 (_ BitVec 32) Int) ListLongMap!6261)

(assert (=> b!426192 (= lt!194888 (getCurrentListMapNoExtraKeys!1350 lt!194885 lt!194887 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15907)

(assert (=> b!426192 (= lt!194887 (array!26044 (store (arr!12471 _values!549) i!563 (ValueCellFull!5207 v!412)) (size!12823 _values!549)))))

(declare-fun lt!194884 () ListLongMap!6261)

(assert (=> b!426192 (= lt!194884 (getCurrentListMapNoExtraKeys!1350 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426193 () Bool)

(declare-fun res!249701 () Bool)

(assert (=> b!426193 (=> (not res!249701) (not e!252895))))

(declare-datatypes ((List!7363 0))(
  ( (Nil!7360) (Cons!7359 (h!8215 (_ BitVec 64)) (t!12807 List!7363)) )
))
(declare-fun arrayNoDuplicates!0 (array!26041 (_ BitVec 32) List!7363) Bool)

(assert (=> b!426193 (= res!249701 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7360))))

(declare-fun b!426194 () Bool)

(assert (=> b!426194 (= e!252894 (not true))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1304 (ListLongMap!6261 tuple2!7348) ListLongMap!6261)

(assert (=> b!426194 (= (getCurrentListMapNoExtraKeys!1350 lt!194885 lt!194887 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1304 (getCurrentListMapNoExtraKeys!1350 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7349 k!794 v!412)))))

(declare-datatypes ((Unit!12510 0))(
  ( (Unit!12511) )
))
(declare-fun lt!194886 () Unit!12510)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!499 (array!26041 array!26043 (_ BitVec 32) (_ BitVec 32) V!15907 V!15907 (_ BitVec 32) (_ BitVec 64) V!15907 (_ BitVec 32) Int) Unit!12510)

(assert (=> b!426194 (= lt!194886 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!499 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426195 () Bool)

(assert (=> b!426195 (= e!252895 e!252893)))

(declare-fun res!249697 () Bool)

(assert (=> b!426195 (=> (not res!249697) (not e!252893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26041 (_ BitVec 32)) Bool)

(assert (=> b!426195 (= res!249697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194885 mask!1025))))

(assert (=> b!426195 (= lt!194885 (array!26042 (store (arr!12470 _keys!709) i!563 k!794) (size!12822 _keys!709)))))

(declare-fun b!426196 () Bool)

(declare-fun res!249705 () Bool)

(assert (=> b!426196 (=> (not res!249705) (not e!252895))))

(declare-fun arrayContainsKey!0 (array!26041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426196 (= res!249705 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!426197 () Bool)

(declare-fun res!249706 () Bool)

(assert (=> b!426197 (=> (not res!249706) (not e!252893))))

(assert (=> b!426197 (= res!249706 (arrayNoDuplicates!0 lt!194885 #b00000000000000000000000000000000 Nil!7360))))

(declare-fun b!426198 () Bool)

(declare-fun e!252892 () Bool)

(declare-fun tp_is_empty!11101 () Bool)

(assert (=> b!426198 (= e!252892 tp_is_empty!11101)))

(declare-fun b!426199 () Bool)

(declare-fun res!249696 () Bool)

(assert (=> b!426199 (=> (not res!249696) (not e!252895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426199 (= res!249696 (validKeyInArray!0 k!794))))

(declare-fun b!426200 () Bool)

(declare-fun res!249708 () Bool)

(assert (=> b!426200 (=> (not res!249708) (not e!252895))))

(assert (=> b!426200 (= res!249708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426201 () Bool)

(declare-fun res!249707 () Bool)

(assert (=> b!426201 (=> (not res!249707) (not e!252895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426201 (= res!249707 (validMask!0 mask!1025))))

(declare-fun b!426202 () Bool)

(declare-fun e!252897 () Bool)

(assert (=> b!426202 (= e!252897 tp_is_empty!11101)))

(declare-fun b!426203 () Bool)

(declare-fun res!249698 () Bool)

(assert (=> b!426203 (=> (not res!249698) (not e!252893))))

(assert (=> b!426203 (= res!249698 (bvsle from!863 i!563))))

(declare-fun b!426204 () Bool)

(declare-fun res!249703 () Bool)

(assert (=> b!426204 (=> (not res!249703) (not e!252895))))

(assert (=> b!426204 (= res!249703 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12822 _keys!709))))))

(declare-fun b!426205 () Bool)

(declare-fun res!249704 () Bool)

(assert (=> b!426205 (=> (not res!249704) (not e!252895))))

(assert (=> b!426205 (= res!249704 (or (= (select (arr!12470 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12470 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!249702 () Bool)

(assert (=> start!39682 (=> (not res!249702) (not e!252895))))

(assert (=> start!39682 (= res!249702 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12822 _keys!709))))))

(assert (=> start!39682 e!252895))

(assert (=> start!39682 tp_is_empty!11101))

(assert (=> start!39682 tp!35376))

(assert (=> start!39682 true))

(declare-fun e!252891 () Bool)

(declare-fun array_inv!9088 (array!26043) Bool)

(assert (=> start!39682 (and (array_inv!9088 _values!549) e!252891)))

(declare-fun array_inv!9089 (array!26041) Bool)

(assert (=> start!39682 (array_inv!9089 _keys!709)))

(declare-fun mapNonEmpty!18273 () Bool)

(declare-fun mapRes!18273 () Bool)

(declare-fun tp!35375 () Bool)

(assert (=> mapNonEmpty!18273 (= mapRes!18273 (and tp!35375 e!252897))))

(declare-fun mapKey!18273 () (_ BitVec 32))

(declare-fun mapRest!18273 () (Array (_ BitVec 32) ValueCell!5207))

(declare-fun mapValue!18273 () ValueCell!5207)

(assert (=> mapNonEmpty!18273 (= (arr!12471 _values!549) (store mapRest!18273 mapKey!18273 mapValue!18273))))

(declare-fun mapIsEmpty!18273 () Bool)

(assert (=> mapIsEmpty!18273 mapRes!18273))

(declare-fun b!426206 () Bool)

(assert (=> b!426206 (= e!252891 (and e!252892 mapRes!18273))))

(declare-fun condMapEmpty!18273 () Bool)

(declare-fun mapDefault!18273 () ValueCell!5207)

