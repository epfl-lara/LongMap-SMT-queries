; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16240 () Bool)

(assert start!16240)

(declare-fun b!162032 () Bool)

(declare-fun b_free!3701 () Bool)

(declare-fun b_next!3701 () Bool)

(assert (=> b!162032 (= b_free!3701 (not b_next!3701))))

(declare-fun tp!13672 () Bool)

(declare-fun b_and!10115 () Bool)

(assert (=> b!162032 (= tp!13672 b_and!10115)))

(declare-fun b!162026 () Bool)

(declare-fun e!106046 () Bool)

(declare-fun e!106050 () Bool)

(assert (=> b!162026 (= e!106046 e!106050)))

(declare-fun res!76765 () Bool)

(assert (=> b!162026 (=> (not res!76765) (not e!106050))))

(declare-datatypes ((SeekEntryResult!368 0))(
  ( (MissingZero!368 (index!3640 (_ BitVec 32))) (Found!368 (index!3641 (_ BitVec 32))) (Intermediate!368 (undefined!1180 Bool) (index!3642 (_ BitVec 32)) (x!17896 (_ BitVec 32))) (Undefined!368) (MissingVacant!368 (index!3643 (_ BitVec 32))) )
))
(declare-fun lt!82352 () SeekEntryResult!368)

(assert (=> b!162026 (= res!76765 (and (not (is-Undefined!368 lt!82352)) (is-MissingVacant!368 lt!82352)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4317 0))(
  ( (V!4318 (val!1796 Int)) )
))
(declare-datatypes ((ValueCell!1408 0))(
  ( (ValueCellFull!1408 (v!3661 V!4317)) (EmptyCell!1408) )
))
(declare-datatypes ((array!6085 0))(
  ( (array!6086 (arr!2887 (Array (_ BitVec 32) (_ BitVec 64))) (size!3171 (_ BitVec 32))) )
))
(declare-datatypes ((array!6087 0))(
  ( (array!6088 (arr!2888 (Array (_ BitVec 32) ValueCell!1408)) (size!3172 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1724 0))(
  ( (LongMapFixedSize!1725 (defaultEntry!3304 Int) (mask!7912 (_ BitVec 32)) (extraKeys!3045 (_ BitVec 32)) (zeroValue!3147 V!4317) (minValue!3147 V!4317) (_size!911 (_ BitVec 32)) (_keys!5105 array!6085) (_values!3287 array!6087) (_vacant!911 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1724)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6085 (_ BitVec 32)) SeekEntryResult!368)

(assert (=> b!162026 (= lt!82352 (seekEntryOrOpen!0 key!828 (_keys!5105 thiss!1248) (mask!7912 thiss!1248)))))

(declare-fun mapIsEmpty!5942 () Bool)

(declare-fun mapRes!5942 () Bool)

(assert (=> mapIsEmpty!5942 mapRes!5942))

(declare-fun res!76763 () Bool)

(assert (=> start!16240 (=> (not res!76763) (not e!106046))))

(declare-fun valid!784 (LongMapFixedSize!1724) Bool)

(assert (=> start!16240 (= res!76763 (valid!784 thiss!1248))))

(assert (=> start!16240 e!106046))

(declare-fun e!106044 () Bool)

(assert (=> start!16240 e!106044))

(assert (=> start!16240 true))

(declare-fun tp_is_empty!3503 () Bool)

(assert (=> start!16240 tp_is_empty!3503))

(declare-fun b!162027 () Bool)

(declare-fun e!106048 () Bool)

(declare-fun e!106043 () Bool)

(assert (=> b!162027 (= e!106048 (and e!106043 mapRes!5942))))

(declare-fun condMapEmpty!5942 () Bool)

(declare-fun mapDefault!5942 () ValueCell!1408)

