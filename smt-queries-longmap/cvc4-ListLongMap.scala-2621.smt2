; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39548 () Bool)

(assert start!39548)

(declare-fun b_free!9815 () Bool)

(declare-fun b_next!9815 () Bool)

(assert (=> start!39548 (= b_free!9815 (not b_next!9815))))

(declare-fun tp!34974 () Bool)

(declare-fun b_and!17471 () Bool)

(assert (=> start!39548 (= tp!34974 b_and!17471)))

(declare-fun mapIsEmpty!18072 () Bool)

(declare-fun mapRes!18072 () Bool)

(assert (=> mapIsEmpty!18072 mapRes!18072))

(declare-fun b!423084 () Bool)

(declare-fun res!247195 () Bool)

(declare-fun e!251598 () Bool)

(assert (=> b!423084 (=> (not res!247195) (not e!251598))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423084 (= res!247195 (bvsle from!863 i!563))))

(declare-fun b!423085 () Bool)

(declare-fun res!247198 () Bool)

(declare-fun e!251594 () Bool)

(assert (=> b!423085 (=> (not res!247198) (not e!251594))))

(declare-datatypes ((array!25781 0))(
  ( (array!25782 (arr!12340 (Array (_ BitVec 32) (_ BitVec 64))) (size!12692 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25781)

(assert (=> b!423085 (= res!247198 (or (= (select (arr!12340 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12340 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423086 () Bool)

(assert (=> b!423086 (= e!251594 e!251598)))

(declare-fun res!247202 () Bool)

(assert (=> b!423086 (=> (not res!247202) (not e!251598))))

(declare-fun lt!194097 () array!25781)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25781 (_ BitVec 32)) Bool)

(assert (=> b!423086 (= res!247202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194097 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!423086 (= lt!194097 (array!25782 (store (arr!12340 _keys!709) i!563 k!794) (size!12692 _keys!709)))))

(declare-fun mapNonEmpty!18072 () Bool)

(declare-fun tp!34973 () Bool)

(declare-fun e!251597 () Bool)

(assert (=> mapNonEmpty!18072 (= mapRes!18072 (and tp!34973 e!251597))))

(declare-datatypes ((V!15727 0))(
  ( (V!15728 (val!5528 Int)) )
))
(declare-datatypes ((ValueCell!5140 0))(
  ( (ValueCellFull!5140 (v!7775 V!15727)) (EmptyCell!5140) )
))
(declare-datatypes ((array!25783 0))(
  ( (array!25784 (arr!12341 (Array (_ BitVec 32) ValueCell!5140)) (size!12693 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25783)

(declare-fun mapRest!18072 () (Array (_ BitVec 32) ValueCell!5140))

(declare-fun mapKey!18072 () (_ BitVec 32))

(declare-fun mapValue!18072 () ValueCell!5140)

(assert (=> mapNonEmpty!18072 (= (arr!12341 _values!549) (store mapRest!18072 mapKey!18072 mapValue!18072))))

(declare-fun b!423087 () Bool)

(declare-fun e!251596 () Bool)

(declare-fun tp_is_empty!10967 () Bool)

(assert (=> b!423087 (= e!251596 tp_is_empty!10967)))

(declare-fun b!423088 () Bool)

(assert (=> b!423088 (= e!251598 false)))

(declare-fun minValue!515 () V!15727)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15727)

(declare-fun v!412 () V!15727)

(declare-datatypes ((tuple2!7260 0))(
  ( (tuple2!7261 (_1!3641 (_ BitVec 64)) (_2!3641 V!15727)) )
))
(declare-datatypes ((List!7267 0))(
  ( (Nil!7264) (Cons!7263 (h!8119 tuple2!7260) (t!12711 List!7267)) )
))
(declare-datatypes ((ListLongMap!6173 0))(
  ( (ListLongMap!6174 (toList!3102 List!7267)) )
))
(declare-fun lt!194099 () ListLongMap!6173)

(declare-fun getCurrentListMapNoExtraKeys!1306 (array!25781 array!25783 (_ BitVec 32) (_ BitVec 32) V!15727 V!15727 (_ BitVec 32) Int) ListLongMap!6173)

(assert (=> b!423088 (= lt!194099 (getCurrentListMapNoExtraKeys!1306 lt!194097 (array!25784 (store (arr!12341 _values!549) i!563 (ValueCellFull!5140 v!412)) (size!12693 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194098 () ListLongMap!6173)

(assert (=> b!423088 (= lt!194098 (getCurrentListMapNoExtraKeys!1306 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423089 () Bool)

(declare-fun res!247203 () Bool)

(assert (=> b!423089 (=> (not res!247203) (not e!251594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423089 (= res!247203 (validKeyInArray!0 k!794))))

(declare-fun b!423090 () Bool)

(declare-fun res!247201 () Bool)

(assert (=> b!423090 (=> (not res!247201) (not e!251594))))

(assert (=> b!423090 (= res!247201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423091 () Bool)

(declare-fun res!247194 () Bool)

(assert (=> b!423091 (=> (not res!247194) (not e!251594))))

(assert (=> b!423091 (= res!247194 (and (= (size!12693 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12692 _keys!709) (size!12693 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423092 () Bool)

(declare-fun res!247200 () Bool)

(assert (=> b!423092 (=> (not res!247200) (not e!251594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423092 (= res!247200 (validMask!0 mask!1025))))

(declare-fun b!423093 () Bool)

(declare-fun res!247197 () Bool)

(assert (=> b!423093 (=> (not res!247197) (not e!251594))))

(declare-datatypes ((List!7268 0))(
  ( (Nil!7265) (Cons!7264 (h!8120 (_ BitVec 64)) (t!12712 List!7268)) )
))
(declare-fun arrayNoDuplicates!0 (array!25781 (_ BitVec 32) List!7268) Bool)

(assert (=> b!423093 (= res!247197 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7265))))

(declare-fun b!423094 () Bool)

(declare-fun res!247196 () Bool)

(assert (=> b!423094 (=> (not res!247196) (not e!251598))))

(assert (=> b!423094 (= res!247196 (arrayNoDuplicates!0 lt!194097 #b00000000000000000000000000000000 Nil!7265))))

(declare-fun res!247199 () Bool)

(assert (=> start!39548 (=> (not res!247199) (not e!251594))))

(assert (=> start!39548 (= res!247199 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12692 _keys!709))))))

(assert (=> start!39548 e!251594))

(assert (=> start!39548 tp_is_empty!10967))

(assert (=> start!39548 tp!34974))

(assert (=> start!39548 true))

(declare-fun e!251595 () Bool)

(declare-fun array_inv!8990 (array!25783) Bool)

(assert (=> start!39548 (and (array_inv!8990 _values!549) e!251595)))

(declare-fun array_inv!8991 (array!25781) Bool)

(assert (=> start!39548 (array_inv!8991 _keys!709)))

(declare-fun b!423095 () Bool)

(assert (=> b!423095 (= e!251595 (and e!251596 mapRes!18072))))

(declare-fun condMapEmpty!18072 () Bool)

(declare-fun mapDefault!18072 () ValueCell!5140)

