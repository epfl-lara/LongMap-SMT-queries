; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39172 () Bool)

(assert start!39172)

(declare-fun b_free!9439 () Bool)

(declare-fun b_next!9439 () Bool)

(assert (=> start!39172 (= b_free!9439 (not b_next!9439))))

(declare-fun tp!33846 () Bool)

(declare-fun b_and!16825 () Bool)

(assert (=> start!39172 (= tp!33846 b_and!16825)))

(declare-fun b!412482 () Bool)

(declare-fun res!239533 () Bool)

(declare-fun e!246827 () Bool)

(assert (=> b!412482 (=> (not res!239533) (not e!246827))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25043 0))(
  ( (array!25044 (arr!11971 (Array (_ BitVec 32) (_ BitVec 64))) (size!12323 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25043)

(assert (=> b!412482 (= res!239533 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12323 _keys!709))))))

(declare-fun b!412483 () Bool)

(declare-fun res!239532 () Bool)

(declare-fun e!246828 () Bool)

(assert (=> b!412483 (=> (not res!239532) (not e!246828))))

(declare-fun lt!189490 () array!25043)

(declare-datatypes ((List!6956 0))(
  ( (Nil!6953) (Cons!6952 (h!7808 (_ BitVec 64)) (t!12130 List!6956)) )
))
(declare-fun arrayNoDuplicates!0 (array!25043 (_ BitVec 32) List!6956) Bool)

(assert (=> b!412483 (= res!239532 (arrayNoDuplicates!0 lt!189490 #b00000000000000000000000000000000 Nil!6953))))

(declare-fun b!412484 () Bool)

(assert (=> b!412484 (= e!246827 e!246828)))

(declare-fun res!239535 () Bool)

(assert (=> b!412484 (=> (not res!239535) (not e!246828))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25043 (_ BitVec 32)) Bool)

(assert (=> b!412484 (= res!239535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189490 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!412484 (= lt!189490 (array!25044 (store (arr!11971 _keys!709) i!563 k!794) (size!12323 _keys!709)))))

(declare-fun b!412485 () Bool)

(declare-fun res!239525 () Bool)

(assert (=> b!412485 (=> (not res!239525) (not e!246828))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!412485 (= res!239525 (bvsle from!863 i!563))))

(declare-fun b!412486 () Bool)

(declare-fun e!246825 () Bool)

(declare-fun tp_is_empty!10591 () Bool)

(assert (=> b!412486 (= e!246825 tp_is_empty!10591)))

(declare-fun b!412487 () Bool)

(declare-fun res!239527 () Bool)

(assert (=> b!412487 (=> (not res!239527) (not e!246827))))

(assert (=> b!412487 (= res!239527 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6953))))

(declare-fun b!412488 () Bool)

(declare-fun res!239529 () Bool)

(assert (=> b!412488 (=> (not res!239529) (not e!246827))))

(assert (=> b!412488 (= res!239529 (or (= (select (arr!11971 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11971 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!239526 () Bool)

(assert (=> start!39172 (=> (not res!239526) (not e!246827))))

(assert (=> start!39172 (= res!239526 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12323 _keys!709))))))

(assert (=> start!39172 e!246827))

(assert (=> start!39172 tp_is_empty!10591))

(assert (=> start!39172 tp!33846))

(assert (=> start!39172 true))

(declare-datatypes ((V!15227 0))(
  ( (V!15228 (val!5340 Int)) )
))
(declare-datatypes ((ValueCell!4952 0))(
  ( (ValueCellFull!4952 (v!7587 V!15227)) (EmptyCell!4952) )
))
(declare-datatypes ((array!25045 0))(
  ( (array!25046 (arr!11972 (Array (_ BitVec 32) ValueCell!4952)) (size!12324 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25045)

(declare-fun e!246823 () Bool)

(declare-fun array_inv!8728 (array!25045) Bool)

(assert (=> start!39172 (and (array_inv!8728 _values!549) e!246823)))

(declare-fun array_inv!8729 (array!25043) Bool)

(assert (=> start!39172 (array_inv!8729 _keys!709)))

(declare-fun b!412489 () Bool)

(declare-fun res!239528 () Bool)

(assert (=> b!412489 (=> (not res!239528) (not e!246827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412489 (= res!239528 (validKeyInArray!0 k!794))))

(declare-fun b!412490 () Bool)

(declare-fun res!239530 () Bool)

(assert (=> b!412490 (=> (not res!239530) (not e!246827))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!412490 (= res!239530 (and (= (size!12324 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12323 _keys!709) (size!12324 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412491 () Bool)

(declare-fun res!239534 () Bool)

(assert (=> b!412491 (=> (not res!239534) (not e!246827))))

(assert (=> b!412491 (= res!239534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412492 () Bool)

(declare-fun e!246826 () Bool)

(assert (=> b!412492 (= e!246826 tp_is_empty!10591)))

(declare-fun mapIsEmpty!17508 () Bool)

(declare-fun mapRes!17508 () Bool)

(assert (=> mapIsEmpty!17508 mapRes!17508))

(declare-fun b!412493 () Bool)

(declare-fun res!239524 () Bool)

(assert (=> b!412493 (=> (not res!239524) (not e!246827))))

(declare-fun arrayContainsKey!0 (array!25043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412493 (= res!239524 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!412494 () Bool)

(assert (=> b!412494 (= e!246828 false)))

(declare-fun minValue!515 () V!15227)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15227)

(declare-datatypes ((tuple2!6930 0))(
  ( (tuple2!6931 (_1!3476 (_ BitVec 64)) (_2!3476 V!15227)) )
))
(declare-datatypes ((List!6957 0))(
  ( (Nil!6954) (Cons!6953 (h!7809 tuple2!6930) (t!12131 List!6957)) )
))
(declare-datatypes ((ListLongMap!5843 0))(
  ( (ListLongMap!5844 (toList!2937 List!6957)) )
))
(declare-fun lt!189489 () ListLongMap!5843)

(declare-fun v!412 () V!15227)

(declare-fun getCurrentListMapNoExtraKeys!1145 (array!25043 array!25045 (_ BitVec 32) (_ BitVec 32) V!15227 V!15227 (_ BitVec 32) Int) ListLongMap!5843)

(assert (=> b!412494 (= lt!189489 (getCurrentListMapNoExtraKeys!1145 lt!189490 (array!25046 (store (arr!11972 _values!549) i!563 (ValueCellFull!4952 v!412)) (size!12324 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189491 () ListLongMap!5843)

(assert (=> b!412494 (= lt!189491 (getCurrentListMapNoExtraKeys!1145 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412495 () Bool)

(declare-fun res!239531 () Bool)

(assert (=> b!412495 (=> (not res!239531) (not e!246827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412495 (= res!239531 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17508 () Bool)

(declare-fun tp!33845 () Bool)

(assert (=> mapNonEmpty!17508 (= mapRes!17508 (and tp!33845 e!246826))))

(declare-fun mapRest!17508 () (Array (_ BitVec 32) ValueCell!4952))

(declare-fun mapValue!17508 () ValueCell!4952)

(declare-fun mapKey!17508 () (_ BitVec 32))

(assert (=> mapNonEmpty!17508 (= (arr!11972 _values!549) (store mapRest!17508 mapKey!17508 mapValue!17508))))

(declare-fun b!412496 () Bool)

(assert (=> b!412496 (= e!246823 (and e!246825 mapRes!17508))))

(declare-fun condMapEmpty!17508 () Bool)

(declare-fun mapDefault!17508 () ValueCell!4952)

