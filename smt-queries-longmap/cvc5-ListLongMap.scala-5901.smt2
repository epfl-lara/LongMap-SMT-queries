; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76294 () Bool)

(assert start!76294)

(declare-fun b!895468 () Bool)

(declare-fun b_free!15907 () Bool)

(declare-fun b_next!15907 () Bool)

(assert (=> b!895468 (= b_free!15907 (not b_next!15907))))

(declare-fun tp!55731 () Bool)

(declare-fun b_and!26199 () Bool)

(assert (=> b!895468 (= tp!55731 b_and!26199)))

(declare-fun res!605723 () Bool)

(declare-fun e!500330 () Bool)

(assert (=> start!76294 (=> (not res!605723) (not e!500330))))

(declare-datatypes ((array!52472 0))(
  ( (array!52473 (arr!25231 (Array (_ BitVec 32) (_ BitVec 64))) (size!25681 (_ BitVec 32))) )
))
(declare-datatypes ((V!29279 0))(
  ( (V!29280 (val!9168 Int)) )
))
(declare-datatypes ((ValueCell!8636 0))(
  ( (ValueCellFull!8636 (v!11658 V!29279)) (EmptyCell!8636) )
))
(declare-datatypes ((array!52474 0))(
  ( (array!52475 (arr!25232 (Array (_ BitVec 32) ValueCell!8636)) (size!25682 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4288 0))(
  ( (LongMapFixedSize!4289 (defaultEntry!5356 Int) (mask!25955 (_ BitVec 32)) (extraKeys!5052 (_ BitVec 32)) (zeroValue!5156 V!29279) (minValue!5156 V!29279) (_size!2199 (_ BitVec 32)) (_keys!10071 array!52472) (_values!5343 array!52474) (_vacant!2199 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4288)

(declare-fun valid!1655 (LongMapFixedSize!4288) Bool)

(assert (=> start!76294 (= res!605723 (valid!1655 thiss!1181))))

(assert (=> start!76294 e!500330))

(declare-fun e!500327 () Bool)

(assert (=> start!76294 e!500327))

(assert (=> start!76294 true))

(declare-fun b!895467 () Bool)

(declare-fun e!500326 () Bool)

(assert (=> b!895467 (= e!500330 e!500326)))

(declare-fun res!605720 () Bool)

(assert (=> b!895467 (=> (not res!605720) (not e!500326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895467 (= res!605720 (validMask!0 (mask!25955 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8880 0))(
  ( (MissingZero!8880 (index!37891 (_ BitVec 32))) (Found!8880 (index!37892 (_ BitVec 32))) (Intermediate!8880 (undefined!9692 Bool) (index!37893 (_ BitVec 32)) (x!76192 (_ BitVec 32))) (Undefined!8880) (MissingVacant!8880 (index!37894 (_ BitVec 32))) )
))
(declare-fun lt!404533 () SeekEntryResult!8880)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52472 (_ BitVec 32)) SeekEntryResult!8880)

(assert (=> b!895467 (= lt!404533 (seekEntry!0 key!785 (_keys!10071 thiss!1181) (mask!25955 thiss!1181)))))

(declare-fun tp_is_empty!18235 () Bool)

(declare-fun e!500329 () Bool)

(declare-fun array_inv!19810 (array!52472) Bool)

(declare-fun array_inv!19811 (array!52474) Bool)

(assert (=> b!895468 (= e!500327 (and tp!55731 tp_is_empty!18235 (array_inv!19810 (_keys!10071 thiss!1181)) (array_inv!19811 (_values!5343 thiss!1181)) e!500329))))

(declare-fun b!895469 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52472 (_ BitVec 32)) Bool)

(assert (=> b!895469 (= e!500326 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10071 thiss!1181) (mask!25955 thiss!1181))))))

(declare-fun b!895470 () Bool)

(declare-fun res!605722 () Bool)

(assert (=> b!895470 (=> (not res!605722) (not e!500330))))

(assert (=> b!895470 (= res!605722 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28948 () Bool)

(declare-fun mapRes!28948 () Bool)

(assert (=> mapIsEmpty!28948 mapRes!28948))

(declare-fun b!895471 () Bool)

(declare-fun res!605721 () Bool)

(assert (=> b!895471 (=> (not res!605721) (not e!500326))))

(assert (=> b!895471 (= res!605721 (and (= (size!25682 (_values!5343 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25955 thiss!1181))) (= (size!25681 (_keys!10071 thiss!1181)) (size!25682 (_values!5343 thiss!1181))) (bvsge (mask!25955 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5052 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5052 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!895472 () Bool)

(declare-fun e!500325 () Bool)

(assert (=> b!895472 (= e!500325 tp_is_empty!18235)))

(declare-fun b!895473 () Bool)

(declare-fun e!500328 () Bool)

(assert (=> b!895473 (= e!500328 tp_is_empty!18235)))

(declare-fun mapNonEmpty!28948 () Bool)

(declare-fun tp!55730 () Bool)

(assert (=> mapNonEmpty!28948 (= mapRes!28948 (and tp!55730 e!500325))))

(declare-fun mapValue!28948 () ValueCell!8636)

(declare-fun mapKey!28948 () (_ BitVec 32))

(declare-fun mapRest!28948 () (Array (_ BitVec 32) ValueCell!8636))

(assert (=> mapNonEmpty!28948 (= (arr!25232 (_values!5343 thiss!1181)) (store mapRest!28948 mapKey!28948 mapValue!28948))))

(declare-fun b!895474 () Bool)

(assert (=> b!895474 (= e!500329 (and e!500328 mapRes!28948))))

(declare-fun condMapEmpty!28948 () Bool)

(declare-fun mapDefault!28948 () ValueCell!8636)

