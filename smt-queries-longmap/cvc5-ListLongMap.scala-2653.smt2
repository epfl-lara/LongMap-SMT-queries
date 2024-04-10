; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39736 () Bool)

(assert start!39736)

(declare-fun b_free!10003 () Bool)

(declare-fun b_next!10003 () Bool)

(assert (=> start!39736 (= b_free!10003 (not b_next!10003))))

(declare-fun tp!35537 () Bool)

(declare-fun b_and!17665 () Bool)

(assert (=> start!39736 (= tp!35537 b_and!17665)))

(declare-fun mapNonEmpty!18354 () Bool)

(declare-fun mapRes!18354 () Bool)

(declare-fun tp!35538 () Bool)

(declare-fun e!253478 () Bool)

(assert (=> mapNonEmpty!18354 (= mapRes!18354 (and tp!35538 e!253478))))

(declare-datatypes ((V!15979 0))(
  ( (V!15980 (val!5622 Int)) )
))
(declare-datatypes ((ValueCell!5234 0))(
  ( (ValueCellFull!5234 (v!7869 V!15979)) (EmptyCell!5234) )
))
(declare-fun mapValue!18354 () ValueCell!5234)

(declare-datatypes ((array!26147 0))(
  ( (array!26148 (arr!12523 (Array (_ BitVec 32) ValueCell!5234)) (size!12875 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26147)

(declare-fun mapRest!18354 () (Array (_ BitVec 32) ValueCell!5234))

(declare-fun mapKey!18354 () (_ BitVec 32))

(assert (=> mapNonEmpty!18354 (= (arr!12523 _values!549) (store mapRest!18354 mapKey!18354 mapValue!18354))))

(declare-fun b!427513 () Bool)

(declare-fun e!253482 () Bool)

(declare-fun e!253480 () Bool)

(assert (=> b!427513 (= e!253482 e!253480)))

(declare-fun res!250773 () Bool)

(assert (=> b!427513 (=> (not res!250773) (not e!253480))))

(declare-datatypes ((array!26149 0))(
  ( (array!26150 (arr!12524 (Array (_ BitVec 32) (_ BitVec 64))) (size!12876 (_ BitVec 32))) )
))
(declare-fun lt!195329 () array!26149)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26149 (_ BitVec 32)) Bool)

(assert (=> b!427513 (= res!250773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195329 mask!1025))))

(declare-fun _keys!709 () array!26149)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427513 (= lt!195329 (array!26150 (store (arr!12524 _keys!709) i!563 k!794) (size!12876 _keys!709)))))

(declare-fun b!427514 () Bool)

(declare-fun res!250775 () Bool)

(assert (=> b!427514 (=> (not res!250775) (not e!253482))))

(assert (=> b!427514 (= res!250775 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12876 _keys!709))))))

(declare-fun b!427515 () Bool)

(declare-fun res!250779 () Bool)

(assert (=> b!427515 (=> (not res!250779) (not e!253482))))

(assert (=> b!427515 (= res!250779 (or (= (select (arr!12524 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12524 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427516 () Bool)

(declare-fun e!253481 () Bool)

(assert (=> b!427516 (= e!253481 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7390 0))(
  ( (tuple2!7391 (_1!3706 (_ BitVec 64)) (_2!3706 V!15979)) )
))
(declare-datatypes ((List!7404 0))(
  ( (Nil!7401) (Cons!7400 (h!8256 tuple2!7390) (t!12856 List!7404)) )
))
(declare-datatypes ((ListLongMap!6303 0))(
  ( (ListLongMap!6304 (toList!3167 List!7404)) )
))
(declare-fun lt!195324 () ListLongMap!6303)

(declare-fun lt!195327 () ListLongMap!6303)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1322 (ListLongMap!6303 tuple2!7390) ListLongMap!6303)

(declare-fun get!6199 (ValueCell!5234 V!15979) V!15979)

(declare-fun dynLambda!750 (Int (_ BitVec 64)) V!15979)

(assert (=> b!427516 (= lt!195327 (+!1322 lt!195324 (tuple2!7391 (select (arr!12524 _keys!709) from!863) (get!6199 (select (arr!12523 _values!549) from!863) (dynLambda!750 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427517 () Bool)

(declare-fun res!250780 () Bool)

(assert (=> b!427517 (=> (not res!250780) (not e!253482))))

(declare-fun arrayContainsKey!0 (array!26149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427517 (= res!250780 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!427518 () Bool)

(declare-fun res!250776 () Bool)

(assert (=> b!427518 (=> (not res!250776) (not e!253482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427518 (= res!250776 (validMask!0 mask!1025))))

(declare-fun b!427519 () Bool)

(declare-fun res!250777 () Bool)

(assert (=> b!427519 (=> (not res!250777) (not e!253482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427519 (= res!250777 (validKeyInArray!0 k!794))))

(declare-fun res!250771 () Bool)

(assert (=> start!39736 (=> (not res!250771) (not e!253482))))

(assert (=> start!39736 (= res!250771 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12876 _keys!709))))))

(assert (=> start!39736 e!253482))

(declare-fun tp_is_empty!11155 () Bool)

(assert (=> start!39736 tp_is_empty!11155))

(assert (=> start!39736 tp!35537))

(assert (=> start!39736 true))

(declare-fun e!253484 () Bool)

(declare-fun array_inv!9126 (array!26147) Bool)

(assert (=> start!39736 (and (array_inv!9126 _values!549) e!253484)))

(declare-fun array_inv!9127 (array!26149) Bool)

(assert (=> start!39736 (array_inv!9127 _keys!709)))

(declare-fun b!427520 () Bool)

(declare-fun res!250782 () Bool)

(assert (=> b!427520 (=> (not res!250782) (not e!253482))))

(assert (=> b!427520 (= res!250782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427521 () Bool)

(assert (=> b!427521 (= e!253478 tp_is_empty!11155)))

(declare-fun b!427522 () Bool)

(declare-fun e!253485 () Bool)

(assert (=> b!427522 (= e!253484 (and e!253485 mapRes!18354))))

(declare-fun condMapEmpty!18354 () Bool)

(declare-fun mapDefault!18354 () ValueCell!5234)

