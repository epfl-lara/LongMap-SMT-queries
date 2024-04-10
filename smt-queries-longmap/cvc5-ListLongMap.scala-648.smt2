; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16236 () Bool)

(assert start!16236)

(declare-fun b!161973 () Bool)

(declare-fun b_free!3697 () Bool)

(declare-fun b_next!3697 () Bool)

(assert (=> b!161973 (= b_free!3697 (not b_next!3697))))

(declare-fun tp!13660 () Bool)

(declare-fun b_and!10111 () Bool)

(assert (=> b!161973 (= tp!13660 b_and!10111)))

(declare-fun b!161972 () Bool)

(declare-fun e!105995 () Bool)

(declare-fun tp_is_empty!3499 () Bool)

(assert (=> b!161972 (= e!105995 tp_is_empty!3499)))

(declare-fun e!106001 () Bool)

(declare-fun e!105999 () Bool)

(declare-datatypes ((V!4313 0))(
  ( (V!4314 (val!1794 Int)) )
))
(declare-datatypes ((ValueCell!1406 0))(
  ( (ValueCellFull!1406 (v!3659 V!4313)) (EmptyCell!1406) )
))
(declare-datatypes ((array!6077 0))(
  ( (array!6078 (arr!2883 (Array (_ BitVec 32) (_ BitVec 64))) (size!3167 (_ BitVec 32))) )
))
(declare-datatypes ((array!6079 0))(
  ( (array!6080 (arr!2884 (Array (_ BitVec 32) ValueCell!1406)) (size!3168 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1720 0))(
  ( (LongMapFixedSize!1721 (defaultEntry!3302 Int) (mask!7910 (_ BitVec 32)) (extraKeys!3043 (_ BitVec 32)) (zeroValue!3145 V!4313) (minValue!3145 V!4313) (_size!909 (_ BitVec 32)) (_keys!5103 array!6077) (_values!3285 array!6079) (_vacant!909 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1720)

(declare-fun array_inv!1843 (array!6077) Bool)

(declare-fun array_inv!1844 (array!6079) Bool)

(assert (=> b!161973 (= e!105999 (and tp!13660 tp_is_empty!3499 (array_inv!1843 (_keys!5103 thiss!1248)) (array_inv!1844 (_values!3285 thiss!1248)) e!106001))))

(declare-fun b!161974 () Bool)

(declare-fun e!105996 () Bool)

(declare-fun e!106000 () Bool)

(assert (=> b!161974 (= e!105996 e!106000)))

(declare-fun res!76734 () Bool)

(assert (=> b!161974 (=> (not res!76734) (not e!106000))))

(declare-datatypes ((SeekEntryResult!366 0))(
  ( (MissingZero!366 (index!3632 (_ BitVec 32))) (Found!366 (index!3633 (_ BitVec 32))) (Intermediate!366 (undefined!1178 Bool) (index!3634 (_ BitVec 32)) (x!17894 (_ BitVec 32))) (Undefined!366) (MissingVacant!366 (index!3635 (_ BitVec 32))) )
))
(declare-fun lt!82334 () SeekEntryResult!366)

(assert (=> b!161974 (= res!76734 (and (not (is-Undefined!366 lt!82334)) (is-MissingVacant!366 lt!82334)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6077 (_ BitVec 32)) SeekEntryResult!366)

(assert (=> b!161974 (= lt!82334 (seekEntryOrOpen!0 key!828 (_keys!5103 thiss!1248) (mask!7910 thiss!1248)))))

(declare-fun mapIsEmpty!5936 () Bool)

(declare-fun mapRes!5936 () Bool)

(assert (=> mapIsEmpty!5936 mapRes!5936))

(declare-fun mapNonEmpty!5936 () Bool)

(declare-fun tp!13661 () Bool)

(assert (=> mapNonEmpty!5936 (= mapRes!5936 (and tp!13661 e!105995))))

(declare-fun mapKey!5936 () (_ BitVec 32))

(declare-fun mapRest!5936 () (Array (_ BitVec 32) ValueCell!1406))

(declare-fun mapValue!5936 () ValueCell!1406)

(assert (=> mapNonEmpty!5936 (= (arr!2884 (_values!3285 thiss!1248)) (store mapRest!5936 mapKey!5936 mapValue!5936))))

(declare-fun b!161976 () Bool)

(declare-fun res!76732 () Bool)

(assert (=> b!161976 (=> (not res!76732) (not e!105996))))

(assert (=> b!161976 (= res!76732 (not (= key!828 (bvneg key!828))))))

(declare-fun res!76733 () Bool)

(assert (=> start!16236 (=> (not res!76733) (not e!105996))))

(declare-fun valid!782 (LongMapFixedSize!1720) Bool)

(assert (=> start!16236 (= res!76733 (valid!782 thiss!1248))))

(assert (=> start!16236 e!105996))

(assert (=> start!16236 e!105999))

(assert (=> start!16236 true))

(assert (=> start!16236 tp_is_empty!3499))

(declare-fun b!161975 () Bool)

(declare-fun e!105998 () Bool)

(assert (=> b!161975 (= e!106000 e!105998)))

(declare-fun res!76735 () Bool)

(assert (=> b!161975 (=> (not res!76735) (not e!105998))))

(declare-datatypes ((tuple2!2980 0))(
  ( (tuple2!2981 (_1!1501 Bool) (_2!1501 LongMapFixedSize!1720)) )
))
(declare-fun lt!82336 () tuple2!2980)

(assert (=> b!161975 (= res!76735 (valid!782 (_2!1501 lt!82336)))))

(declare-fun v!309 () V!4313)

(declare-fun updateHelperNewKey!74 (LongMapFixedSize!1720 (_ BitVec 64) V!4313 (_ BitVec 32)) tuple2!2980)

(assert (=> b!161975 (= lt!82336 (updateHelperNewKey!74 thiss!1248 key!828 v!309 (index!3635 lt!82334)))))

(declare-fun b!161977 () Bool)

(declare-fun e!105997 () Bool)

(assert (=> b!161977 (= e!106001 (and e!105997 mapRes!5936))))

(declare-fun condMapEmpty!5936 () Bool)

(declare-fun mapDefault!5936 () ValueCell!1406)

