; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15682 () Bool)

(assert start!15682)

(declare-fun b!156326 () Bool)

(declare-fun b_free!3349 () Bool)

(declare-fun b_next!3349 () Bool)

(assert (=> b!156326 (= b_free!3349 (not b_next!3349))))

(declare-fun tp!12572 () Bool)

(declare-fun b_and!9763 () Bool)

(assert (=> b!156326 (= tp!12572 b_and!9763)))

(declare-fun b!156318 () Bool)

(declare-fun res!73849 () Bool)

(declare-fun e!102237 () Bool)

(assert (=> b!156318 (=> (not res!73849) (not e!102237))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156318 (= res!73849 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156319 () Bool)

(declare-fun res!73848 () Bool)

(assert (=> b!156319 (=> (not res!73848) (not e!102237))))

(declare-datatypes ((V!3849 0))(
  ( (V!3850 (val!1620 Int)) )
))
(declare-datatypes ((ValueCell!1232 0))(
  ( (ValueCellFull!1232 (v!3485 V!3849)) (EmptyCell!1232) )
))
(declare-datatypes ((array!5355 0))(
  ( (array!5356 (arr!2535 (Array (_ BitVec 32) (_ BitVec 64))) (size!2813 (_ BitVec 32))) )
))
(declare-datatypes ((array!5357 0))(
  ( (array!5358 (arr!2536 (Array (_ BitVec 32) ValueCell!1232)) (size!2814 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1372 0))(
  ( (LongMapFixedSize!1373 (defaultEntry!3128 Int) (mask!7577 (_ BitVec 32)) (extraKeys!2869 (_ BitVec 32)) (zeroValue!2971 V!3849) (minValue!2971 V!3849) (_size!735 (_ BitVec 32)) (_keys!4903 array!5355) (_values!3111 array!5357) (_vacant!735 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1372)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5355 (_ BitVec 32)) Bool)

(assert (=> b!156319 (= res!73848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4903 thiss!1248) (mask!7577 thiss!1248)))))

(declare-fun mapNonEmpty!5369 () Bool)

(declare-fun mapRes!5369 () Bool)

(declare-fun tp!12571 () Bool)

(declare-fun e!102234 () Bool)

(assert (=> mapNonEmpty!5369 (= mapRes!5369 (and tp!12571 e!102234))))

(declare-fun mapValue!5369 () ValueCell!1232)

(declare-fun mapRest!5369 () (Array (_ BitVec 32) ValueCell!1232))

(declare-fun mapKey!5369 () (_ BitVec 32))

(assert (=> mapNonEmpty!5369 (= (arr!2536 (_values!3111 thiss!1248)) (store mapRest!5369 mapKey!5369 mapValue!5369))))

(declare-fun b!156320 () Bool)

(assert (=> b!156320 (= e!102237 false)))

(declare-fun lt!81538 () Bool)

(declare-datatypes ((List!1852 0))(
  ( (Nil!1849) (Cons!1848 (h!2457 (_ BitVec 64)) (t!6654 List!1852)) )
))
(declare-fun arrayNoDuplicates!0 (array!5355 (_ BitVec 32) List!1852) Bool)

(assert (=> b!156320 (= lt!81538 (arrayNoDuplicates!0 (_keys!4903 thiss!1248) #b00000000000000000000000000000000 Nil!1849))))

(declare-fun res!73850 () Bool)

(assert (=> start!15682 (=> (not res!73850) (not e!102237))))

(declare-fun valid!665 (LongMapFixedSize!1372) Bool)

(assert (=> start!15682 (= res!73850 (valid!665 thiss!1248))))

(assert (=> start!15682 e!102237))

(declare-fun e!102232 () Bool)

(assert (=> start!15682 e!102232))

(assert (=> start!15682 true))

(declare-fun b!156321 () Bool)

(declare-fun tp_is_empty!3151 () Bool)

(assert (=> b!156321 (= e!102234 tp_is_empty!3151)))

(declare-fun b!156322 () Bool)

(declare-fun e!102235 () Bool)

(declare-fun e!102233 () Bool)

(assert (=> b!156322 (= e!102235 (and e!102233 mapRes!5369))))

(declare-fun condMapEmpty!5369 () Bool)

(declare-fun mapDefault!5369 () ValueCell!1232)

