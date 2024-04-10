; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16540 () Bool)

(assert start!16540)

(declare-fun b!164589 () Bool)

(declare-fun b_free!3845 () Bool)

(declare-fun b_next!3845 () Bool)

(assert (=> b!164589 (= b_free!3845 (not b_next!3845))))

(declare-fun tp!14136 () Bool)

(declare-fun b_and!10259 () Bool)

(assert (=> b!164589 (= tp!14136 b_and!10259)))

(declare-fun res!77946 () Bool)

(declare-fun e!107979 () Bool)

(assert (=> start!16540 (=> (not res!77946) (not e!107979))))

(declare-datatypes ((V!4509 0))(
  ( (V!4510 (val!1868 Int)) )
))
(declare-datatypes ((ValueCell!1480 0))(
  ( (ValueCellFull!1480 (v!3733 V!4509)) (EmptyCell!1480) )
))
(declare-datatypes ((array!6391 0))(
  ( (array!6392 (arr!3031 (Array (_ BitVec 32) (_ BitVec 64))) (size!3319 (_ BitVec 32))) )
))
(declare-datatypes ((array!6393 0))(
  ( (array!6394 (arr!3032 (Array (_ BitVec 32) ValueCell!1480)) (size!3320 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1868 0))(
  ( (LongMapFixedSize!1869 (defaultEntry!3376 Int) (mask!8069 (_ BitVec 32)) (extraKeys!3117 (_ BitVec 32)) (zeroValue!3219 V!4509) (minValue!3219 V!4509) (_size!983 (_ BitVec 32)) (_keys!5201 array!6391) (_values!3359 array!6393) (_vacant!983 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1868)

(declare-fun valid!832 (LongMapFixedSize!1868) Bool)

(assert (=> start!16540 (= res!77946 (valid!832 thiss!1248))))

(assert (=> start!16540 e!107979))

(declare-fun e!107976 () Bool)

(assert (=> start!16540 e!107976))

(assert (=> start!16540 true))

(declare-fun mapNonEmpty!6189 () Bool)

(declare-fun mapRes!6189 () Bool)

(declare-fun tp!14135 () Bool)

(declare-fun e!107981 () Bool)

(assert (=> mapNonEmpty!6189 (= mapRes!6189 (and tp!14135 e!107981))))

(declare-fun mapRest!6189 () (Array (_ BitVec 32) ValueCell!1480))

(declare-fun mapKey!6189 () (_ BitVec 32))

(declare-fun mapValue!6189 () ValueCell!1480)

(assert (=> mapNonEmpty!6189 (= (arr!3032 (_values!3359 thiss!1248)) (store mapRest!6189 mapKey!6189 mapValue!6189))))

(declare-fun b!164579 () Bool)

(declare-fun res!77947 () Bool)

(declare-fun e!107977 () Bool)

(assert (=> b!164579 (=> (not res!77947) (not e!107977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164579 (= res!77947 (validMask!0 (mask!8069 thiss!1248)))))

(declare-fun b!164580 () Bool)

(declare-fun res!77945 () Bool)

(assert (=> b!164580 (=> (not res!77945) (not e!107977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6391 (_ BitVec 32)) Bool)

(assert (=> b!164580 (= res!77945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5201 thiss!1248) (mask!8069 thiss!1248)))))

(declare-fun b!164581 () Bool)

(declare-fun e!107978 () Bool)

(declare-fun tp_is_empty!3647 () Bool)

(assert (=> b!164581 (= e!107978 tp_is_empty!3647)))

(declare-fun b!164582 () Bool)

(declare-fun e!107980 () Bool)

(assert (=> b!164582 (= e!107980 (and e!107978 mapRes!6189))))

(declare-fun condMapEmpty!6189 () Bool)

(declare-fun mapDefault!6189 () ValueCell!1480)

