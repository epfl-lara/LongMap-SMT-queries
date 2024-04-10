; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34688 () Bool)

(assert start!34688)

(declare-fun b_free!7495 () Bool)

(declare-fun b_next!7495 () Bool)

(assert (=> start!34688 (= b_free!7495 (not b_next!7495))))

(declare-fun tp!26048 () Bool)

(declare-fun b_and!14715 () Bool)

(assert (=> start!34688 (= tp!26048 b_and!14715)))

(declare-fun res!191709 () Bool)

(declare-fun e!212413 () Bool)

(assert (=> start!34688 (=> (not res!191709) (not e!212413))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34688 (= res!191709 (validMask!0 mask!2385))))

(assert (=> start!34688 e!212413))

(assert (=> start!34688 true))

(declare-fun tp_is_empty!7447 () Bool)

(assert (=> start!34688 tp_is_empty!7447))

(assert (=> start!34688 tp!26048))

(declare-datatypes ((V!10907 0))(
  ( (V!10908 (val!3768 Int)) )
))
(declare-datatypes ((ValueCell!3380 0))(
  ( (ValueCellFull!3380 (v!5950 V!10907)) (EmptyCell!3380) )
))
(declare-datatypes ((array!18487 0))(
  ( (array!18488 (arr!8754 (Array (_ BitVec 32) ValueCell!3380)) (size!9106 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18487)

(declare-fun e!212415 () Bool)

(declare-fun array_inv!6482 (array!18487) Bool)

(assert (=> start!34688 (and (array_inv!6482 _values!1525) e!212415)))

(declare-datatypes ((array!18489 0))(
  ( (array!18490 (arr!8755 (Array (_ BitVec 32) (_ BitVec 64))) (size!9107 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18489)

(declare-fun array_inv!6483 (array!18489) Bool)

(assert (=> start!34688 (array_inv!6483 _keys!1895)))

(declare-fun b!346583 () Bool)

(declare-fun res!191710 () Bool)

(assert (=> b!346583 (=> (not res!191710) (not e!212413))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346583 (= res!191710 (validKeyInArray!0 k!1348))))

(declare-fun b!346584 () Bool)

(declare-fun res!191712 () Bool)

(assert (=> b!346584 (=> (not res!191712) (not e!212413))))

(declare-datatypes ((List!5073 0))(
  ( (Nil!5070) (Cons!5069 (h!5925 (_ BitVec 64)) (t!10201 List!5073)) )
))
(declare-fun arrayNoDuplicates!0 (array!18489 (_ BitVec 32) List!5073) Bool)

(assert (=> b!346584 (= res!191712 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5070))))

(declare-fun b!346585 () Bool)

(declare-fun res!191713 () Bool)

(assert (=> b!346585 (=> (not res!191713) (not e!212413))))

(declare-fun zeroValue!1467 () V!10907)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10907)

(declare-datatypes ((tuple2!5450 0))(
  ( (tuple2!5451 (_1!2736 (_ BitVec 64)) (_2!2736 V!10907)) )
))
(declare-datatypes ((List!5074 0))(
  ( (Nil!5071) (Cons!5070 (h!5926 tuple2!5450) (t!10202 List!5074)) )
))
(declare-datatypes ((ListLongMap!4363 0))(
  ( (ListLongMap!4364 (toList!2197 List!5074)) )
))
(declare-fun contains!2261 (ListLongMap!4363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1718 (array!18489 array!18487 (_ BitVec 32) (_ BitVec 32) V!10907 V!10907 (_ BitVec 32) Int) ListLongMap!4363)

(assert (=> b!346585 (= res!191713 (not (contains!2261 (getCurrentListMap!1718 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346586 () Bool)

(declare-fun e!212418 () Bool)

(assert (=> b!346586 (= e!212418 (not true))))

(declare-fun arrayContainsKey!0 (array!18489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346586 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3376 0))(
  ( (MissingZero!3376 (index!15683 (_ BitVec 32))) (Found!3376 (index!15684 (_ BitVec 32))) (Intermediate!3376 (undefined!4188 Bool) (index!15685 (_ BitVec 32)) (x!34526 (_ BitVec 32))) (Undefined!3376) (MissingVacant!3376 (index!15686 (_ BitVec 32))) )
))
(declare-fun lt!163396 () SeekEntryResult!3376)

(declare-datatypes ((Unit!10753 0))(
  ( (Unit!10754) )
))
(declare-fun lt!163395 () Unit!10753)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18489 (_ BitVec 64) (_ BitVec 32)) Unit!10753)

(assert (=> b!346586 (= lt!163395 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15684 lt!163396)))))

(declare-fun b!346587 () Bool)

(declare-fun res!191708 () Bool)

(assert (=> b!346587 (=> (not res!191708) (not e!212418))))

(assert (=> b!346587 (= res!191708 (arrayContainsKey!0 _keys!1895 k!1348 (index!15684 lt!163396)))))

(declare-fun mapNonEmpty!12627 () Bool)

(declare-fun mapRes!12627 () Bool)

(declare-fun tp!26049 () Bool)

(declare-fun e!212414 () Bool)

(assert (=> mapNonEmpty!12627 (= mapRes!12627 (and tp!26049 e!212414))))

(declare-fun mapValue!12627 () ValueCell!3380)

(declare-fun mapRest!12627 () (Array (_ BitVec 32) ValueCell!3380))

(declare-fun mapKey!12627 () (_ BitVec 32))

(assert (=> mapNonEmpty!12627 (= (arr!8754 _values!1525) (store mapRest!12627 mapKey!12627 mapValue!12627))))

(declare-fun b!346588 () Bool)

(declare-fun res!191707 () Bool)

(assert (=> b!346588 (=> (not res!191707) (not e!212413))))

(assert (=> b!346588 (= res!191707 (and (= (size!9106 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9107 _keys!1895) (size!9106 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346589 () Bool)

(declare-fun e!212417 () Bool)

(assert (=> b!346589 (= e!212415 (and e!212417 mapRes!12627))))

(declare-fun condMapEmpty!12627 () Bool)

(declare-fun mapDefault!12627 () ValueCell!3380)

