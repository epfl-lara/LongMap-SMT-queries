; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17254 () Bool)

(assert start!17254)

(declare-fun b!173090 () Bool)

(declare-fun b_free!4301 () Bool)

(declare-fun b_next!4301 () Bool)

(assert (=> b!173090 (= b_free!4301 (not b_next!4301))))

(declare-fun tp!15561 () Bool)

(declare-fun b_and!10741 () Bool)

(assert (=> b!173090 (= tp!15561 b_and!10741)))

(declare-fun b!173087 () Bool)

(declare-fun e!114330 () Bool)

(declare-datatypes ((V!5077 0))(
  ( (V!5078 (val!2081 Int)) )
))
(declare-datatypes ((ValueCell!1693 0))(
  ( (ValueCellFull!1693 (v!3949 V!5077)) (EmptyCell!1693) )
))
(declare-datatypes ((array!7273 0))(
  ( (array!7274 (arr!3457 (Array (_ BitVec 32) (_ BitVec 64))) (size!3756 (_ BitVec 32))) )
))
(declare-datatypes ((array!7275 0))(
  ( (array!7276 (arr!3458 (Array (_ BitVec 32) ValueCell!1693)) (size!3757 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2294 0))(
  ( (LongMapFixedSize!2295 (defaultEntry!3593 Int) (mask!8457 (_ BitVec 32)) (extraKeys!3332 (_ BitVec 32)) (zeroValue!3434 V!5077) (minValue!3436 V!5077) (_size!1196 (_ BitVec 32)) (_keys!5432 array!7273) (_values!3576 array!7275) (_vacant!1196 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2294)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7273 (_ BitVec 32)) Bool)

(assert (=> b!173087 (= e!114330 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5432 thiss!1248) (mask!8457 thiss!1248))))))

(declare-fun mapIsEmpty!6930 () Bool)

(declare-fun mapRes!6930 () Bool)

(assert (=> mapIsEmpty!6930 mapRes!6930))

(declare-fun b!173088 () Bool)

(declare-fun res!82177 () Bool)

(assert (=> b!173088 (=> (not res!82177) (not e!114330))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!173088 (= res!82177 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173089 () Bool)

(declare-fun res!82178 () Bool)

(assert (=> b!173089 (=> (not res!82178) (not e!114330))))

(assert (=> b!173089 (= res!82178 (and (= (size!3757 (_values!3576 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8457 thiss!1248))) (= (size!3756 (_keys!5432 thiss!1248)) (size!3757 (_values!3576 thiss!1248))) (bvsge (mask!8457 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3332 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3332 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3332 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3332 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3332 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3332 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!3332 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun tp_is_empty!4073 () Bool)

(declare-fun e!114328 () Bool)

(declare-fun e!114327 () Bool)

(declare-fun array_inv!2213 (array!7273) Bool)

(declare-fun array_inv!2214 (array!7275) Bool)

(assert (=> b!173090 (= e!114328 (and tp!15561 tp_is_empty!4073 (array_inv!2213 (_keys!5432 thiss!1248)) (array_inv!2214 (_values!3576 thiss!1248)) e!114327))))

(declare-fun b!173091 () Bool)

(declare-fun e!114331 () Bool)

(assert (=> b!173091 (= e!114331 tp_is_empty!4073)))

(declare-fun b!173092 () Bool)

(declare-fun e!114329 () Bool)

(assert (=> b!173092 (= e!114327 (and e!114329 mapRes!6930))))

(declare-fun condMapEmpty!6930 () Bool)

(declare-fun mapDefault!6930 () ValueCell!1693)

