; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39614 () Bool)

(assert start!39614)

(declare-fun b_free!9881 () Bool)

(declare-fun b_next!9881 () Bool)

(assert (=> start!39614 (= b_free!9881 (not b_next!9881))))

(declare-fun tp!35171 () Bool)

(declare-fun b_and!17537 () Bool)

(assert (=> start!39614 (= tp!35171 b_and!17537)))

(declare-fun b!424569 () Bool)

(declare-fun e!252190 () Bool)

(declare-fun e!252189 () Bool)

(assert (=> b!424569 (= e!252190 e!252189)))

(declare-fun res!248391 () Bool)

(assert (=> b!424569 (=> (not res!248391) (not e!252189))))

(declare-datatypes ((array!25905 0))(
  ( (array!25906 (arr!12402 (Array (_ BitVec 32) (_ BitVec 64))) (size!12754 (_ BitVec 32))) )
))
(declare-fun lt!194394 () array!25905)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25905 (_ BitVec 32)) Bool)

(assert (=> b!424569 (= res!248391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194394 mask!1025))))

(declare-fun _keys!709 () array!25905)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424569 (= lt!194394 (array!25906 (store (arr!12402 _keys!709) i!563 k!794) (size!12754 _keys!709)))))

(declare-fun b!424570 () Bool)

(declare-fun res!248382 () Bool)

(assert (=> b!424570 (=> (not res!248382) (not e!252190))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15815 0))(
  ( (V!15816 (val!5561 Int)) )
))
(declare-datatypes ((ValueCell!5173 0))(
  ( (ValueCellFull!5173 (v!7808 V!15815)) (EmptyCell!5173) )
))
(declare-datatypes ((array!25907 0))(
  ( (array!25908 (arr!12403 (Array (_ BitVec 32) ValueCell!5173)) (size!12755 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25907)

(assert (=> b!424570 (= res!248382 (and (= (size!12755 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12754 _keys!709) (size!12755 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424571 () Bool)

(declare-fun res!248384 () Bool)

(assert (=> b!424571 (=> (not res!248384) (not e!252190))))

(assert (=> b!424571 (= res!248384 (or (= (select (arr!12402 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12402 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424572 () Bool)

(declare-fun res!248390 () Bool)

(assert (=> b!424572 (=> (not res!248390) (not e!252190))))

(declare-fun arrayContainsKey!0 (array!25905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424572 (= res!248390 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!424573 () Bool)

(declare-fun res!248386 () Bool)

(assert (=> b!424573 (=> (not res!248386) (not e!252190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424573 (= res!248386 (validKeyInArray!0 k!794))))

(declare-fun b!424575 () Bool)

(declare-fun res!248388 () Bool)

(assert (=> b!424575 (=> (not res!248388) (not e!252190))))

(assert (=> b!424575 (= res!248388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424576 () Bool)

(declare-fun e!252188 () Bool)

(declare-fun tp_is_empty!11033 () Bool)

(assert (=> b!424576 (= e!252188 tp_is_empty!11033)))

(declare-fun b!424577 () Bool)

(declare-fun res!248387 () Bool)

(assert (=> b!424577 (=> (not res!248387) (not e!252189))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!424577 (= res!248387 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18171 () Bool)

(declare-fun mapRes!18171 () Bool)

(declare-fun tp!35172 () Bool)

(assert (=> mapNonEmpty!18171 (= mapRes!18171 (and tp!35172 e!252188))))

(declare-fun mapRest!18171 () (Array (_ BitVec 32) ValueCell!5173))

(declare-fun mapValue!18171 () ValueCell!5173)

(declare-fun mapKey!18171 () (_ BitVec 32))

(assert (=> mapNonEmpty!18171 (= (arr!12403 _values!549) (store mapRest!18171 mapKey!18171 mapValue!18171))))

(declare-fun b!424578 () Bool)

(declare-fun res!248385 () Bool)

(assert (=> b!424578 (=> (not res!248385) (not e!252189))))

(declare-datatypes ((List!7311 0))(
  ( (Nil!7308) (Cons!7307 (h!8163 (_ BitVec 64)) (t!12755 List!7311)) )
))
(declare-fun arrayNoDuplicates!0 (array!25905 (_ BitVec 32) List!7311) Bool)

(assert (=> b!424578 (= res!248385 (arrayNoDuplicates!0 lt!194394 #b00000000000000000000000000000000 Nil!7308))))

(declare-fun b!424579 () Bool)

(assert (=> b!424579 (= e!252189 false)))

(declare-fun minValue!515 () V!15815)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15815)

(declare-datatypes ((tuple2!7300 0))(
  ( (tuple2!7301 (_1!3661 (_ BitVec 64)) (_2!3661 V!15815)) )
))
(declare-datatypes ((List!7312 0))(
  ( (Nil!7309) (Cons!7308 (h!8164 tuple2!7300) (t!12756 List!7312)) )
))
(declare-datatypes ((ListLongMap!6213 0))(
  ( (ListLongMap!6214 (toList!3122 List!7312)) )
))
(declare-fun lt!194396 () ListLongMap!6213)

(declare-fun v!412 () V!15815)

(declare-fun getCurrentListMapNoExtraKeys!1326 (array!25905 array!25907 (_ BitVec 32) (_ BitVec 32) V!15815 V!15815 (_ BitVec 32) Int) ListLongMap!6213)

(assert (=> b!424579 (= lt!194396 (getCurrentListMapNoExtraKeys!1326 lt!194394 (array!25908 (store (arr!12403 _values!549) i!563 (ValueCellFull!5173 v!412)) (size!12755 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194395 () ListLongMap!6213)

(assert (=> b!424579 (= lt!194395 (getCurrentListMapNoExtraKeys!1326 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424580 () Bool)

(declare-fun res!248380 () Bool)

(assert (=> b!424580 (=> (not res!248380) (not e!252190))))

(assert (=> b!424580 (= res!248380 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12754 _keys!709))))))

(declare-fun res!248389 () Bool)

(assert (=> start!39614 (=> (not res!248389) (not e!252190))))

(assert (=> start!39614 (= res!248389 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12754 _keys!709))))))

(assert (=> start!39614 e!252190))

(assert (=> start!39614 tp_is_empty!11033))

(assert (=> start!39614 tp!35171))

(assert (=> start!39614 true))

(declare-fun e!252192 () Bool)

(declare-fun array_inv!9036 (array!25907) Bool)

(assert (=> start!39614 (and (array_inv!9036 _values!549) e!252192)))

(declare-fun array_inv!9037 (array!25905) Bool)

(assert (=> start!39614 (array_inv!9037 _keys!709)))

(declare-fun b!424574 () Bool)

(declare-fun e!252191 () Bool)

(assert (=> b!424574 (= e!252192 (and e!252191 mapRes!18171))))

(declare-fun condMapEmpty!18171 () Bool)

(declare-fun mapDefault!18171 () ValueCell!5173)

