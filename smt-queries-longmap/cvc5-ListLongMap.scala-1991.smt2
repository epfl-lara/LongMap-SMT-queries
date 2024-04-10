; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34830 () Bool)

(assert start!34830)

(declare-fun b_free!7615 () Bool)

(declare-fun b_next!7615 () Bool)

(assert (=> start!34830 (= b_free!7615 (not b_next!7615))))

(declare-fun tp!26411 () Bool)

(declare-fun b_and!14837 () Bool)

(assert (=> start!34830 (= tp!26411 b_and!14837)))

(declare-fun b!348707 () Bool)

(declare-fun res!193216 () Bool)

(declare-fun e!213629 () Bool)

(assert (=> b!348707 (=> (not res!193216) (not e!213629))))

(declare-datatypes ((array!18721 0))(
  ( (array!18722 (arr!8870 (Array (_ BitVec 32) (_ BitVec 64))) (size!9222 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18721)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18721 (_ BitVec 32)) Bool)

(assert (=> b!348707 (= res!193216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348708 () Bool)

(declare-fun res!193209 () Bool)

(assert (=> b!348708 (=> (not res!193209) (not e!213629))))

(declare-datatypes ((List!5155 0))(
  ( (Nil!5152) (Cons!5151 (h!6007 (_ BitVec 64)) (t!10285 List!5155)) )
))
(declare-fun arrayNoDuplicates!0 (array!18721 (_ BitVec 32) List!5155) Bool)

(assert (=> b!348708 (= res!193209 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5152))))

(declare-fun b!348709 () Bool)

(declare-fun e!213628 () Bool)

(assert (=> b!348709 (= e!213629 e!213628)))

(declare-fun res!193212 () Bool)

(assert (=> b!348709 (=> (not res!193212) (not e!213628))))

(declare-datatypes ((SeekEntryResult!3420 0))(
  ( (MissingZero!3420 (index!15859 (_ BitVec 32))) (Found!3420 (index!15860 (_ BitVec 32))) (Intermediate!3420 (undefined!4232 Bool) (index!15861 (_ BitVec 32)) (x!34740 (_ BitVec 32))) (Undefined!3420) (MissingVacant!3420 (index!15862 (_ BitVec 32))) )
))
(declare-fun lt!163927 () SeekEntryResult!3420)

(assert (=> b!348709 (= res!193212 (and (not (is-Found!3420 lt!163927)) (is-MissingZero!3420 lt!163927)))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18721 (_ BitVec 32)) SeekEntryResult!3420)

(assert (=> b!348709 (= lt!163927 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!348710 () Bool)

(declare-fun res!193213 () Bool)

(assert (=> b!348710 (=> (not res!193213) (not e!213629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348710 (= res!193213 (validKeyInArray!0 k!1348))))

(declare-fun b!348711 () Bool)

(declare-fun e!213627 () Bool)

(declare-fun tp_is_empty!7567 () Bool)

(assert (=> b!348711 (= e!213627 tp_is_empty!7567)))

(declare-fun b!348712 () Bool)

(declare-fun e!213631 () Bool)

(declare-fun e!213630 () Bool)

(declare-fun mapRes!12810 () Bool)

(assert (=> b!348712 (= e!213631 (and e!213630 mapRes!12810))))

(declare-fun condMapEmpty!12810 () Bool)

(declare-datatypes ((V!11067 0))(
  ( (V!11068 (val!3828 Int)) )
))
(declare-datatypes ((ValueCell!3440 0))(
  ( (ValueCellFull!3440 (v!6011 V!11067)) (EmptyCell!3440) )
))
(declare-datatypes ((array!18723 0))(
  ( (array!18724 (arr!8871 (Array (_ BitVec 32) ValueCell!3440)) (size!9223 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18723)

(declare-fun mapDefault!12810 () ValueCell!3440)

