; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75672 () Bool)

(assert start!75672)

(declare-fun b!889692 () Bool)

(declare-fun b_free!15643 () Bool)

(declare-fun b_next!15643 () Bool)

(assert (=> b!889692 (= b_free!15643 (not b_next!15643))))

(declare-fun tp!54897 () Bool)

(declare-fun b_and!25883 () Bool)

(assert (=> b!889692 (= tp!54897 b_and!25883)))

(declare-fun mapIsEmpty!28511 () Bool)

(declare-fun mapRes!28511 () Bool)

(assert (=> mapIsEmpty!28511 mapRes!28511))

(declare-fun b!889687 () Bool)

(declare-fun e!495979 () Bool)

(declare-fun tp_is_empty!17971 () Bool)

(assert (=> b!889687 (= e!495979 tp_is_empty!17971)))

(declare-fun b!889688 () Bool)

(declare-fun e!495980 () Bool)

(assert (=> b!889688 (= e!495980 tp_is_empty!17971)))

(declare-fun res!602923 () Bool)

(declare-fun e!495978 () Bool)

(assert (=> start!75672 (=> (not res!602923) (not e!495978))))

(declare-datatypes ((array!51922 0))(
  ( (array!51923 (arr!24967 (Array (_ BitVec 32) (_ BitVec 64))) (size!25411 (_ BitVec 32))) )
))
(declare-datatypes ((V!28927 0))(
  ( (V!28928 (val!9036 Int)) )
))
(declare-datatypes ((ValueCell!8504 0))(
  ( (ValueCellFull!8504 (v!11514 V!28927)) (EmptyCell!8504) )
))
(declare-datatypes ((array!51924 0))(
  ( (array!51925 (arr!24968 (Array (_ BitVec 32) ValueCell!8504)) (size!25412 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4024 0))(
  ( (LongMapFixedSize!4025 (defaultEntry!5209 Int) (mask!25664 (_ BitVec 32)) (extraKeys!4903 (_ BitVec 32)) (zeroValue!5007 V!28927) (minValue!5007 V!28927) (_size!2067 (_ BitVec 32)) (_keys!9892 array!51922) (_values!5194 array!51924) (_vacant!2067 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4024)

(declare-fun valid!1563 (LongMapFixedSize!4024) Bool)

(assert (=> start!75672 (= res!602923 (valid!1563 thiss!1181))))

(assert (=> start!75672 e!495978))

(declare-fun e!495982 () Bool)

(assert (=> start!75672 e!495982))

(assert (=> start!75672 true))

(declare-fun b!889689 () Bool)

(declare-fun e!495983 () Bool)

(assert (=> b!889689 (= e!495978 e!495983)))

(declare-fun res!602922 () Bool)

(assert (=> b!889689 (=> (not res!602922) (not e!495983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889689 (= res!602922 (validMask!0 (mask!25664 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8779 0))(
  ( (MissingZero!8779 (index!37487 (_ BitVec 32))) (Found!8779 (index!37488 (_ BitVec 32))) (Intermediate!8779 (undefined!9591 Bool) (index!37489 (_ BitVec 32)) (x!75547 (_ BitVec 32))) (Undefined!8779) (MissingVacant!8779 (index!37490 (_ BitVec 32))) )
))
(declare-fun lt!402087 () SeekEntryResult!8779)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51922 (_ BitVec 32)) SeekEntryResult!8779)

(assert (=> b!889689 (= lt!402087 (seekEntry!0 key!785 (_keys!9892 thiss!1181) (mask!25664 thiss!1181)))))

(declare-fun mapNonEmpty!28511 () Bool)

(declare-fun tp!54898 () Bool)

(assert (=> mapNonEmpty!28511 (= mapRes!28511 (and tp!54898 e!495980))))

(declare-fun mapKey!28511 () (_ BitVec 32))

(declare-fun mapValue!28511 () ValueCell!8504)

(declare-fun mapRest!28511 () (Array (_ BitVec 32) ValueCell!8504))

(assert (=> mapNonEmpty!28511 (= (arr!24968 (_values!5194 thiss!1181)) (store mapRest!28511 mapKey!28511 mapValue!28511))))

(declare-fun b!889690 () Bool)

(declare-fun res!602924 () Bool)

(assert (=> b!889690 (=> (not res!602924) (not e!495983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51922 (_ BitVec 32)) Bool)

(assert (=> b!889690 (= res!602924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9892 thiss!1181) (mask!25664 thiss!1181)))))

(declare-fun b!889691 () Bool)

(declare-fun e!495981 () Bool)

(assert (=> b!889691 (= e!495981 (and e!495979 mapRes!28511))))

(declare-fun condMapEmpty!28511 () Bool)

(declare-fun mapDefault!28511 () ValueCell!8504)

