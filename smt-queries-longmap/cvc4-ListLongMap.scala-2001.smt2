; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34990 () Bool)

(assert start!34990)

(declare-fun b_free!7679 () Bool)

(declare-fun b_next!7679 () Bool)

(assert (=> start!34990 (= b_free!7679 (not b_next!7679))))

(declare-fun tp!26616 () Bool)

(declare-fun b_and!14909 () Bool)

(assert (=> start!34990 (= tp!26616 b_and!14909)))

(declare-fun b!350447 () Bool)

(declare-fun res!194203 () Bool)

(declare-fun e!214665 () Bool)

(assert (=> b!350447 (=> (not res!194203) (not e!214665))))

(declare-datatypes ((array!18849 0))(
  ( (array!18850 (arr!8930 (Array (_ BitVec 32) (_ BitVec 64))) (size!9282 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18849)

(declare-datatypes ((List!5196 0))(
  ( (Nil!5193) (Cons!5192 (h!6048 (_ BitVec 64)) (t!10334 List!5196)) )
))
(declare-fun arrayNoDuplicates!0 (array!18849 (_ BitVec 32) List!5196) Bool)

(assert (=> b!350447 (= res!194203 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5193))))

(declare-fun b!350448 () Bool)

(declare-fun res!194202 () Bool)

(assert (=> b!350448 (=> (not res!194202) (not e!214665))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11151 0))(
  ( (V!11152 (val!3860 Int)) )
))
(declare-datatypes ((ValueCell!3472 0))(
  ( (ValueCellFull!3472 (v!6047 V!11151)) (EmptyCell!3472) )
))
(declare-datatypes ((array!18851 0))(
  ( (array!18852 (arr!8931 (Array (_ BitVec 32) ValueCell!3472)) (size!9283 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18851)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!350448 (= res!194202 (and (= (size!9283 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9282 _keys!1895) (size!9283 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350449 () Bool)

(declare-fun res!194208 () Bool)

(declare-fun e!214669 () Bool)

(assert (=> b!350449 (=> (not res!194208) (not e!214669))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350449 (= res!194208 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!350450 () Bool)

(declare-fun res!194201 () Bool)

(assert (=> b!350450 (=> (not res!194201) (not e!214665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350450 (= res!194201 (validKeyInArray!0 k!1348))))

(declare-fun res!194204 () Bool)

(assert (=> start!34990 (=> (not res!194204) (not e!214665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34990 (= res!194204 (validMask!0 mask!2385))))

(assert (=> start!34990 e!214665))

(assert (=> start!34990 true))

(declare-fun tp_is_empty!7631 () Bool)

(assert (=> start!34990 tp_is_empty!7631))

(assert (=> start!34990 tp!26616))

(declare-fun e!214664 () Bool)

(declare-fun array_inv!6594 (array!18851) Bool)

(assert (=> start!34990 (and (array_inv!6594 _values!1525) e!214664)))

(declare-fun array_inv!6595 (array!18849) Bool)

(assert (=> start!34990 (array_inv!6595 _keys!1895)))

(declare-fun b!350451 () Bool)

(declare-fun e!214666 () Bool)

(assert (=> b!350451 (= e!214666 tp_is_empty!7631)))

(declare-fun mapIsEmpty!12918 () Bool)

(declare-fun mapRes!12918 () Bool)

(assert (=> mapIsEmpty!12918 mapRes!12918))

(declare-fun b!350452 () Bool)

(assert (=> b!350452 (= e!214665 e!214669)))

(declare-fun res!194207 () Bool)

(assert (=> b!350452 (=> (not res!194207) (not e!214669))))

(declare-datatypes ((SeekEntryResult!3440 0))(
  ( (MissingZero!3440 (index!15939 (_ BitVec 32))) (Found!3440 (index!15940 (_ BitVec 32))) (Intermediate!3440 (undefined!4252 Bool) (index!15941 (_ BitVec 32)) (x!34880 (_ BitVec 32))) (Undefined!3440) (MissingVacant!3440 (index!15942 (_ BitVec 32))) )
))
(declare-fun lt!164583 () SeekEntryResult!3440)

(assert (=> b!350452 (= res!194207 (and (not (is-Found!3440 lt!164583)) (not (is-MissingZero!3440 lt!164583)) (is-MissingVacant!3440 lt!164583)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18849 (_ BitVec 32)) SeekEntryResult!3440)

(assert (=> b!350452 (= lt!164583 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!350453 () Bool)

(assert (=> b!350453 (= e!214664 (and e!214666 mapRes!12918))))

(declare-fun condMapEmpty!12918 () Bool)

(declare-fun mapDefault!12918 () ValueCell!3472)

