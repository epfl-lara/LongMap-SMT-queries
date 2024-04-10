; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76316 () Bool)

(assert start!76316)

(declare-fun b!895649 () Bool)

(declare-fun b_free!15917 () Bool)

(declare-fun b_next!15917 () Bool)

(assert (=> b!895649 (= b_free!15917 (not b_next!15917))))

(declare-fun tp!55764 () Bool)

(declare-fun b_and!26209 () Bool)

(assert (=> b!895649 (= tp!55764 b_and!26209)))

(declare-fun b!895642 () Bool)

(declare-fun e!500461 () Bool)

(declare-fun e!500458 () Bool)

(assert (=> b!895642 (= e!500461 e!500458)))

(declare-fun res!605807 () Bool)

(assert (=> b!895642 (=> (not res!605807) (not e!500458))))

(declare-datatypes ((array!52494 0))(
  ( (array!52495 (arr!25241 (Array (_ BitVec 32) (_ BitVec 64))) (size!25691 (_ BitVec 32))) )
))
(declare-datatypes ((V!29291 0))(
  ( (V!29292 (val!9173 Int)) )
))
(declare-datatypes ((ValueCell!8641 0))(
  ( (ValueCellFull!8641 (v!11663 V!29291)) (EmptyCell!8641) )
))
(declare-datatypes ((array!52496 0))(
  ( (array!52497 (arr!25242 (Array (_ BitVec 32) ValueCell!8641)) (size!25692 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4298 0))(
  ( (LongMapFixedSize!4299 (defaultEntry!5361 Int) (mask!25965 (_ BitVec 32)) (extraKeys!5057 (_ BitVec 32)) (zeroValue!5161 V!29291) (minValue!5161 V!29291) (_size!2204 (_ BitVec 32)) (_keys!10078 array!52494) (_values!5348 array!52496) (_vacant!2204 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4298)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895642 (= res!605807 (validMask!0 (mask!25965 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8885 0))(
  ( (MissingZero!8885 (index!37911 (_ BitVec 32))) (Found!8885 (index!37912 (_ BitVec 32))) (Intermediate!8885 (undefined!9697 Bool) (index!37913 (_ BitVec 32)) (x!76213 (_ BitVec 32))) (Undefined!8885) (MissingVacant!8885 (index!37914 (_ BitVec 32))) )
))
(declare-fun lt!404569 () SeekEntryResult!8885)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52494 (_ BitVec 32)) SeekEntryResult!8885)

(assert (=> b!895642 (= lt!404569 (seekEntry!0 key!785 (_keys!10078 thiss!1181) (mask!25965 thiss!1181)))))

(declare-fun res!605806 () Bool)

(assert (=> start!76316 (=> (not res!605806) (not e!500461))))

(declare-fun valid!1658 (LongMapFixedSize!4298) Bool)

(assert (=> start!76316 (= res!605806 (valid!1658 thiss!1181))))

(assert (=> start!76316 e!500461))

(declare-fun e!500456 () Bool)

(assert (=> start!76316 e!500456))

(assert (=> start!76316 true))

(declare-fun b!895643 () Bool)

(declare-fun e!500460 () Bool)

(declare-fun e!500462 () Bool)

(declare-fun mapRes!28966 () Bool)

(assert (=> b!895643 (= e!500460 (and e!500462 mapRes!28966))))

(declare-fun condMapEmpty!28966 () Bool)

(declare-fun mapDefault!28966 () ValueCell!8641)

