; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16992 () Bool)

(assert start!16992)

(declare-fun b!170794 () Bool)

(declare-fun b_free!4229 () Bool)

(declare-fun b_next!4229 () Bool)

(assert (=> b!170794 (= b_free!4229 (not b_next!4229))))

(declare-fun tp!15314 () Bool)

(declare-fun b_and!10643 () Bool)

(assert (=> b!170794 (= tp!15314 b_and!10643)))

(declare-fun b!170791 () Bool)

(declare-fun e!112735 () Bool)

(declare-datatypes ((V!4981 0))(
  ( (V!4982 (val!2045 Int)) )
))
(declare-datatypes ((ValueCell!1657 0))(
  ( (ValueCellFull!1657 (v!3910 V!4981)) (EmptyCell!1657) )
))
(declare-datatypes ((array!7113 0))(
  ( (array!7114 (arr!3385 (Array (_ BitVec 32) (_ BitVec 64))) (size!3678 (_ BitVec 32))) )
))
(declare-datatypes ((array!7115 0))(
  ( (array!7116 (arr!3386 (Array (_ BitVec 32) ValueCell!1657)) (size!3679 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2222 0))(
  ( (LongMapFixedSize!2223 (defaultEntry!3553 Int) (mask!8377 (_ BitVec 32)) (extraKeys!3294 (_ BitVec 32)) (zeroValue!3396 V!4981) (minValue!3396 V!4981) (_size!1160 (_ BitVec 32)) (_keys!5384 array!7113) (_values!3536 array!7115) (_vacant!1160 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2222)

(declare-datatypes ((List!2191 0))(
  ( (Nil!2188) (Cons!2187 (h!2804 (_ BitVec 64)) (t!6993 List!2191)) )
))
(declare-fun arrayNoDuplicates!0 (array!7113 (_ BitVec 32) List!2191) Bool)

(assert (=> b!170791 (= e!112735 (not (arrayNoDuplicates!0 (_keys!5384 thiss!1248) #b00000000000000000000000000000000 Nil!2188)))))

(declare-fun b!170792 () Bool)

(declare-fun e!112736 () Bool)

(declare-fun tp_is_empty!4001 () Bool)

(assert (=> b!170792 (= e!112736 tp_is_empty!4001)))

(declare-fun b!170793 () Bool)

(declare-fun res!81192 () Bool)

(assert (=> b!170793 (=> (not res!81192) (not e!112735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7113 (_ BitVec 32)) Bool)

(assert (=> b!170793 (= res!81192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5384 thiss!1248) (mask!8377 thiss!1248)))))

(declare-fun e!112739 () Bool)

(declare-fun e!112740 () Bool)

(declare-fun array_inv!2165 (array!7113) Bool)

(declare-fun array_inv!2166 (array!7115) Bool)

(assert (=> b!170794 (= e!112740 (and tp!15314 tp_is_empty!4001 (array_inv!2165 (_keys!5384 thiss!1248)) (array_inv!2166 (_values!3536 thiss!1248)) e!112739))))

(declare-fun b!170795 () Bool)

(declare-fun e!112737 () Bool)

(assert (=> b!170795 (= e!112737 tp_is_empty!4001)))

(declare-fun b!170796 () Bool)

(declare-fun mapRes!6791 () Bool)

(assert (=> b!170796 (= e!112739 (and e!112736 mapRes!6791))))

(declare-fun condMapEmpty!6791 () Bool)

(declare-fun mapDefault!6791 () ValueCell!1657)

