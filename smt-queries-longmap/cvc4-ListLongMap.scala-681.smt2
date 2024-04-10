; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16594 () Bool)

(assert start!16594)

(declare-fun b!165474 () Bool)

(declare-fun b_free!3899 () Bool)

(declare-fun b_next!3899 () Bool)

(assert (=> b!165474 (= b_free!3899 (not b_next!3899))))

(declare-fun tp!14298 () Bool)

(declare-fun b_and!10313 () Bool)

(assert (=> b!165474 (= tp!14298 b_and!10313)))

(declare-fun b!165470 () Bool)

(declare-fun res!78514 () Bool)

(declare-fun e!108546 () Bool)

(assert (=> b!165470 (=> (not res!78514) (not e!108546))))

(declare-datatypes ((V!4581 0))(
  ( (V!4582 (val!1895 Int)) )
))
(declare-datatypes ((ValueCell!1507 0))(
  ( (ValueCellFull!1507 (v!3760 V!4581)) (EmptyCell!1507) )
))
(declare-datatypes ((array!6499 0))(
  ( (array!6500 (arr!3085 (Array (_ BitVec 32) (_ BitVec 64))) (size!3373 (_ BitVec 32))) )
))
(declare-datatypes ((array!6501 0))(
  ( (array!6502 (arr!3086 (Array (_ BitVec 32) ValueCell!1507)) (size!3374 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1922 0))(
  ( (LongMapFixedSize!1923 (defaultEntry!3403 Int) (mask!8114 (_ BitVec 32)) (extraKeys!3144 (_ BitVec 32)) (zeroValue!3246 V!4581) (minValue!3246 V!4581) (_size!1010 (_ BitVec 32)) (_keys!5228 array!6499) (_values!3386 array!6501) (_vacant!1010 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1922)

(assert (=> b!165470 (= res!78514 (and (= (size!3374 (_values!3386 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8114 thiss!1248))) (= (size!3373 (_keys!5228 thiss!1248)) (size!3374 (_values!3386 thiss!1248))) (bvsge (mask!8114 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3144 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3144 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165471 () Bool)

(declare-fun e!108543 () Bool)

(declare-fun tp_is_empty!3701 () Bool)

(assert (=> b!165471 (= e!108543 tp_is_empty!3701)))

(declare-fun b!165472 () Bool)

(assert (=> b!165472 (= e!108546 false)))

(declare-fun lt!83077 () Bool)

(declare-datatypes ((List!2055 0))(
  ( (Nil!2052) (Cons!2051 (h!2668 (_ BitVec 64)) (t!6857 List!2055)) )
))
(declare-fun arrayNoDuplicates!0 (array!6499 (_ BitVec 32) List!2055) Bool)

(assert (=> b!165472 (= lt!83077 (arrayNoDuplicates!0 (_keys!5228 thiss!1248) #b00000000000000000000000000000000 Nil!2052))))

(declare-fun b!165473 () Bool)

(declare-fun e!108545 () Bool)

(declare-fun mapRes!6270 () Bool)

(assert (=> b!165473 (= e!108545 (and e!108543 mapRes!6270))))

(declare-fun condMapEmpty!6270 () Bool)

(declare-fun mapDefault!6270 () ValueCell!1507)

