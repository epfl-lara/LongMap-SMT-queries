; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16010 () Bool)

(assert start!16010)

(declare-fun b!158922 () Bool)

(declare-fun b_free!3499 () Bool)

(declare-fun b_next!3499 () Bool)

(assert (=> b!158922 (= b_free!3499 (not b_next!3499))))

(declare-fun tp!13061 () Bool)

(declare-fun b_and!9913 () Bool)

(assert (=> b!158922 (= tp!13061 b_and!9913)))

(declare-fun b!158916 () Bool)

(declare-fun e!104062 () Bool)

(declare-datatypes ((V!4049 0))(
  ( (V!4050 (val!1695 Int)) )
))
(declare-datatypes ((ValueCell!1307 0))(
  ( (ValueCellFull!1307 (v!3560 V!4049)) (EmptyCell!1307) )
))
(declare-datatypes ((array!5677 0))(
  ( (array!5678 (arr!2685 (Array (_ BitVec 32) (_ BitVec 64))) (size!2969 (_ BitVec 32))) )
))
(declare-datatypes ((array!5679 0))(
  ( (array!5680 (arr!2686 (Array (_ BitVec 32) ValueCell!1307)) (size!2970 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1522 0))(
  ( (LongMapFixedSize!1523 (defaultEntry!3203 Int) (mask!7739 (_ BitVec 32)) (extraKeys!2944 (_ BitVec 32)) (zeroValue!3046 V!4049) (minValue!3046 V!4049) (_size!810 (_ BitVec 32)) (_keys!5000 array!5677) (_values!3186 array!5679) (_vacant!810 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1522)

(declare-datatypes ((List!1893 0))(
  ( (Nil!1890) (Cons!1889 (h!2502 (_ BitVec 64)) (t!6695 List!1893)) )
))
(declare-fun arrayNoDuplicates!0 (array!5677 (_ BitVec 32) List!1893) Bool)

(assert (=> b!158916 (= e!104062 (not (arrayNoDuplicates!0 (_keys!5000 thiss!1248) #b00000000000000000000000000000000 Nil!1890)))))

(declare-fun b!158917 () Bool)

(declare-fun res!75033 () Bool)

(assert (=> b!158917 (=> (not res!75033) (not e!104062))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!302 0))(
  ( (MissingZero!302 (index!3376 (_ BitVec 32))) (Found!302 (index!3377 (_ BitVec 32))) (Intermediate!302 (undefined!1114 Bool) (index!3378 (_ BitVec 32)) (x!17550 (_ BitVec 32))) (Undefined!302) (MissingVacant!302 (index!3379 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5677 (_ BitVec 32)) SeekEntryResult!302)

(assert (=> b!158917 (= res!75033 (is-Undefined!302 (seekEntryOrOpen!0 key!828 (_keys!5000 thiss!1248) (mask!7739 thiss!1248))))))

(declare-fun b!158918 () Bool)

(declare-fun e!104064 () Bool)

(declare-fun tp_is_empty!3301 () Bool)

(assert (=> b!158918 (= e!104064 tp_is_empty!3301)))

(declare-fun mapNonEmpty!5633 () Bool)

(declare-fun mapRes!5633 () Bool)

(declare-fun tp!13060 () Bool)

(assert (=> mapNonEmpty!5633 (= mapRes!5633 (and tp!13060 e!104064))))

(declare-fun mapValue!5633 () ValueCell!1307)

(declare-fun mapKey!5633 () (_ BitVec 32))

(declare-fun mapRest!5633 () (Array (_ BitVec 32) ValueCell!1307))

(assert (=> mapNonEmpty!5633 (= (arr!2686 (_values!3186 thiss!1248)) (store mapRest!5633 mapKey!5633 mapValue!5633))))

(declare-fun b!158919 () Bool)

(declare-fun res!75030 () Bool)

(assert (=> b!158919 (=> (not res!75030) (not e!104062))))

(assert (=> b!158919 (= res!75030 (and (= (size!2970 (_values!3186 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7739 thiss!1248))) (= (size!2969 (_keys!5000 thiss!1248)) (size!2970 (_values!3186 thiss!1248))) (bvsge (mask!7739 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2944 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2944 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158920 () Bool)

(declare-fun res!75032 () Bool)

(assert (=> b!158920 (=> (not res!75032) (not e!104062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5677 (_ BitVec 32)) Bool)

(assert (=> b!158920 (= res!75032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5000 thiss!1248) (mask!7739 thiss!1248)))))

(declare-fun b!158921 () Bool)

(declare-fun res!75031 () Bool)

(assert (=> b!158921 (=> (not res!75031) (not e!104062))))

(assert (=> b!158921 (= res!75031 (not (= key!828 (bvneg key!828))))))

(declare-fun e!104061 () Bool)

(declare-fun e!104059 () Bool)

(declare-fun array_inv!1707 (array!5677) Bool)

(declare-fun array_inv!1708 (array!5679) Bool)

(assert (=> b!158922 (= e!104059 (and tp!13061 tp_is_empty!3301 (array_inv!1707 (_keys!5000 thiss!1248)) (array_inv!1708 (_values!3186 thiss!1248)) e!104061))))

(declare-fun b!158924 () Bool)

(declare-fun res!75035 () Bool)

(assert (=> b!158924 (=> (not res!75035) (not e!104062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158924 (= res!75035 (validMask!0 (mask!7739 thiss!1248)))))

(declare-fun mapIsEmpty!5633 () Bool)

(assert (=> mapIsEmpty!5633 mapRes!5633))

(declare-fun b!158925 () Bool)

(declare-fun e!104063 () Bool)

(assert (=> b!158925 (= e!104063 tp_is_empty!3301)))

(declare-fun b!158923 () Bool)

(assert (=> b!158923 (= e!104061 (and e!104063 mapRes!5633))))

(declare-fun condMapEmpty!5633 () Bool)

(declare-fun mapDefault!5633 () ValueCell!1307)

