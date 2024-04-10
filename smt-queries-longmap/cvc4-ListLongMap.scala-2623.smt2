; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39560 () Bool)

(assert start!39560)

(declare-fun b_free!9827 () Bool)

(declare-fun b_next!9827 () Bool)

(assert (=> start!39560 (= b_free!9827 (not b_next!9827))))

(declare-fun tp!35009 () Bool)

(declare-fun b_and!17483 () Bool)

(assert (=> start!39560 (= tp!35009 b_and!17483)))

(declare-fun b!423354 () Bool)

(declare-fun res!247419 () Bool)

(declare-fun e!251706 () Bool)

(assert (=> b!423354 (=> (not res!247419) (not e!251706))))

(declare-datatypes ((array!25803 0))(
  ( (array!25804 (arr!12351 (Array (_ BitVec 32) (_ BitVec 64))) (size!12703 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25803)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25803 (_ BitVec 32)) Bool)

(assert (=> b!423354 (= res!247419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423355 () Bool)

(declare-fun e!251705 () Bool)

(assert (=> b!423355 (= e!251706 e!251705)))

(declare-fun res!247410 () Bool)

(assert (=> b!423355 (=> (not res!247410) (not e!251705))))

(declare-fun lt!194151 () array!25803)

(assert (=> b!423355 (= res!247410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194151 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423355 (= lt!194151 (array!25804 (store (arr!12351 _keys!709) i!563 k!794) (size!12703 _keys!709)))))

(declare-fun b!423356 () Bool)

(assert (=> b!423356 (= e!251705 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15743 0))(
  ( (V!15744 (val!5534 Int)) )
))
(declare-fun minValue!515 () V!15743)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5146 0))(
  ( (ValueCellFull!5146 (v!7781 V!15743)) (EmptyCell!5146) )
))
(declare-datatypes ((array!25805 0))(
  ( (array!25806 (arr!12352 (Array (_ BitVec 32) ValueCell!5146)) (size!12704 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25805)

(declare-fun zeroValue!515 () V!15743)

(declare-datatypes ((tuple2!7268 0))(
  ( (tuple2!7269 (_1!3645 (_ BitVec 64)) (_2!3645 V!15743)) )
))
(declare-datatypes ((List!7275 0))(
  ( (Nil!7272) (Cons!7271 (h!8127 tuple2!7268) (t!12719 List!7275)) )
))
(declare-datatypes ((ListLongMap!6181 0))(
  ( (ListLongMap!6182 (toList!3106 List!7275)) )
))
(declare-fun lt!194152 () ListLongMap!6181)

(declare-fun v!412 () V!15743)

(declare-fun getCurrentListMapNoExtraKeys!1310 (array!25803 array!25805 (_ BitVec 32) (_ BitVec 32) V!15743 V!15743 (_ BitVec 32) Int) ListLongMap!6181)

(assert (=> b!423356 (= lt!194152 (getCurrentListMapNoExtraKeys!1310 lt!194151 (array!25806 (store (arr!12352 _values!549) i!563 (ValueCellFull!5146 v!412)) (size!12704 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194153 () ListLongMap!6181)

(assert (=> b!423356 (= lt!194153 (getCurrentListMapNoExtraKeys!1310 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423357 () Bool)

(declare-fun res!247417 () Bool)

(assert (=> b!423357 (=> (not res!247417) (not e!251706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423357 (= res!247417 (validKeyInArray!0 k!794))))

(declare-fun b!423358 () Bool)

(declare-fun res!247415 () Bool)

(assert (=> b!423358 (=> (not res!247415) (not e!251706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423358 (= res!247415 (validMask!0 mask!1025))))

(declare-fun b!423359 () Bool)

(declare-fun res!247412 () Bool)

(assert (=> b!423359 (=> (not res!247412) (not e!251706))))

(declare-fun arrayContainsKey!0 (array!25803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423359 (= res!247412 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!423360 () Bool)

(declare-fun e!251702 () Bool)

(declare-fun tp_is_empty!10979 () Bool)

(assert (=> b!423360 (= e!251702 tp_is_empty!10979)))

(declare-fun b!423361 () Bool)

(declare-fun res!247413 () Bool)

(assert (=> b!423361 (=> (not res!247413) (not e!251705))))

(assert (=> b!423361 (= res!247413 (bvsle from!863 i!563))))

(declare-fun b!423362 () Bool)

(declare-fun res!247416 () Bool)

(assert (=> b!423362 (=> (not res!247416) (not e!251706))))

(assert (=> b!423362 (= res!247416 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12703 _keys!709))))))

(declare-fun b!423363 () Bool)

(declare-fun res!247411 () Bool)

(assert (=> b!423363 (=> (not res!247411) (not e!251706))))

(assert (=> b!423363 (= res!247411 (and (= (size!12704 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12703 _keys!709) (size!12704 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423364 () Bool)

(declare-fun res!247408 () Bool)

(assert (=> b!423364 (=> (not res!247408) (not e!251706))))

(declare-datatypes ((List!7276 0))(
  ( (Nil!7273) (Cons!7272 (h!8128 (_ BitVec 64)) (t!12720 List!7276)) )
))
(declare-fun arrayNoDuplicates!0 (array!25803 (_ BitVec 32) List!7276) Bool)

(assert (=> b!423364 (= res!247408 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7273))))

(declare-fun b!423365 () Bool)

(declare-fun res!247409 () Bool)

(assert (=> b!423365 (=> (not res!247409) (not e!251706))))

(assert (=> b!423365 (= res!247409 (or (= (select (arr!12351 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12351 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18090 () Bool)

(declare-fun mapRes!18090 () Bool)

(assert (=> mapIsEmpty!18090 mapRes!18090))

(declare-fun b!423366 () Bool)

(declare-fun res!247418 () Bool)

(assert (=> b!423366 (=> (not res!247418) (not e!251705))))

(assert (=> b!423366 (= res!247418 (arrayNoDuplicates!0 lt!194151 #b00000000000000000000000000000000 Nil!7273))))

(declare-fun res!247414 () Bool)

(assert (=> start!39560 (=> (not res!247414) (not e!251706))))

(assert (=> start!39560 (= res!247414 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12703 _keys!709))))))

(assert (=> start!39560 e!251706))

(assert (=> start!39560 tp_is_empty!10979))

(assert (=> start!39560 tp!35009))

(assert (=> start!39560 true))

(declare-fun e!251703 () Bool)

(declare-fun array_inv!8998 (array!25805) Bool)

(assert (=> start!39560 (and (array_inv!8998 _values!549) e!251703)))

(declare-fun array_inv!8999 (array!25803) Bool)

(assert (=> start!39560 (array_inv!8999 _keys!709)))

(declare-fun mapNonEmpty!18090 () Bool)

(declare-fun tp!35010 () Bool)

(declare-fun e!251704 () Bool)

(assert (=> mapNonEmpty!18090 (= mapRes!18090 (and tp!35010 e!251704))))

(declare-fun mapValue!18090 () ValueCell!5146)

(declare-fun mapKey!18090 () (_ BitVec 32))

(declare-fun mapRest!18090 () (Array (_ BitVec 32) ValueCell!5146))

(assert (=> mapNonEmpty!18090 (= (arr!12352 _values!549) (store mapRest!18090 mapKey!18090 mapValue!18090))))

(declare-fun b!423367 () Bool)

(assert (=> b!423367 (= e!251703 (and e!251702 mapRes!18090))))

(declare-fun condMapEmpty!18090 () Bool)

(declare-fun mapDefault!18090 () ValueCell!5146)

