; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16224 () Bool)

(assert start!16224)

(declare-fun b!161827 () Bool)

(declare-fun b_free!3685 () Bool)

(declare-fun b_next!3685 () Bool)

(assert (=> b!161827 (= b_free!3685 (not b_next!3685))))

(declare-fun tp!13624 () Bool)

(declare-fun b_and!10099 () Bool)

(assert (=> b!161827 (= tp!13624 b_and!10099)))

(declare-fun b!161824 () Bool)

(declare-fun e!105863 () Bool)

(declare-fun tp_is_empty!3487 () Bool)

(assert (=> b!161824 (= e!105863 tp_is_empty!3487)))

(declare-fun b!161825 () Bool)

(declare-fun res!76658 () Bool)

(declare-fun e!105862 () Bool)

(assert (=> b!161825 (=> (not res!76658) (not e!105862))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161825 (= res!76658 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161826 () Bool)

(declare-fun e!105860 () Bool)

(assert (=> b!161826 (= e!105862 e!105860)))

(declare-fun res!76657 () Bool)

(assert (=> b!161826 (=> (not res!76657) (not e!105860))))

(declare-datatypes ((SeekEntryResult!363 0))(
  ( (MissingZero!363 (index!3620 (_ BitVec 32))) (Found!363 (index!3621 (_ BitVec 32))) (Intermediate!363 (undefined!1175 Bool) (index!3622 (_ BitVec 32)) (x!17875 (_ BitVec 32))) (Undefined!363) (MissingVacant!363 (index!3623 (_ BitVec 32))) )
))
(declare-fun lt!82288 () SeekEntryResult!363)

(assert (=> b!161826 (= res!76657 (and (not (is-Undefined!363 lt!82288)) (is-MissingVacant!363 lt!82288)))))

(declare-datatypes ((V!4297 0))(
  ( (V!4298 (val!1788 Int)) )
))
(declare-datatypes ((ValueCell!1400 0))(
  ( (ValueCellFull!1400 (v!3653 V!4297)) (EmptyCell!1400) )
))
(declare-datatypes ((array!6053 0))(
  ( (array!6054 (arr!2871 (Array (_ BitVec 32) (_ BitVec 64))) (size!3155 (_ BitVec 32))) )
))
(declare-datatypes ((array!6055 0))(
  ( (array!6056 (arr!2872 (Array (_ BitVec 32) ValueCell!1400)) (size!3156 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1708 0))(
  ( (LongMapFixedSize!1709 (defaultEntry!3296 Int) (mask!7900 (_ BitVec 32)) (extraKeys!3037 (_ BitVec 32)) (zeroValue!3139 V!4297) (minValue!3139 V!4297) (_size!903 (_ BitVec 32)) (_keys!5097 array!6053) (_values!3279 array!6055) (_vacant!903 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1708)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6053 (_ BitVec 32)) SeekEntryResult!363)

(assert (=> b!161826 (= lt!82288 (seekEntryOrOpen!0 key!828 (_keys!5097 thiss!1248) (mask!7900 thiss!1248)))))

(declare-fun e!105861 () Bool)

(declare-fun e!105858 () Bool)

(declare-fun array_inv!1837 (array!6053) Bool)

(declare-fun array_inv!1838 (array!6055) Bool)

(assert (=> b!161827 (= e!105858 (and tp!13624 tp_is_empty!3487 (array_inv!1837 (_keys!5097 thiss!1248)) (array_inv!1838 (_values!3279 thiss!1248)) e!105861))))

(declare-fun b!161828 () Bool)

(declare-fun mapRes!5918 () Bool)

(assert (=> b!161828 (= e!105861 (and e!105863 mapRes!5918))))

(declare-fun condMapEmpty!5918 () Bool)

(declare-fun mapDefault!5918 () ValueCell!1400)

