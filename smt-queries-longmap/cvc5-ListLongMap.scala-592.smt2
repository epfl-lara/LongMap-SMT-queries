; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15694 () Bool)

(assert start!15694)

(declare-fun b!156486 () Bool)

(declare-fun b_free!3361 () Bool)

(declare-fun b_next!3361 () Bool)

(assert (=> b!156486 (= b_free!3361 (not b_next!3361))))

(declare-fun tp!12608 () Bool)

(declare-fun b_and!9775 () Bool)

(assert (=> b!156486 (= tp!12608 b_and!9775)))

(declare-fun b!156480 () Bool)

(declare-fun res!73942 () Bool)

(declare-fun e!102341 () Bool)

(assert (=> b!156480 (=> (not res!73942) (not e!102341))))

(declare-datatypes ((V!3865 0))(
  ( (V!3866 (val!1626 Int)) )
))
(declare-datatypes ((ValueCell!1238 0))(
  ( (ValueCellFull!1238 (v!3491 V!3865)) (EmptyCell!1238) )
))
(declare-datatypes ((array!5379 0))(
  ( (array!5380 (arr!2547 (Array (_ BitVec 32) (_ BitVec 64))) (size!2825 (_ BitVec 32))) )
))
(declare-datatypes ((array!5381 0))(
  ( (array!5382 (arr!2548 (Array (_ BitVec 32) ValueCell!1238)) (size!2826 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1384 0))(
  ( (LongMapFixedSize!1385 (defaultEntry!3134 Int) (mask!7587 (_ BitVec 32)) (extraKeys!2875 (_ BitVec 32)) (zeroValue!2977 V!3865) (minValue!2977 V!3865) (_size!741 (_ BitVec 32)) (_keys!4909 array!5379) (_values!3117 array!5381) (_vacant!741 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1384)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156480 (= res!73942 (validMask!0 (mask!7587 thiss!1248)))))

(declare-fun mapIsEmpty!5387 () Bool)

(declare-fun mapRes!5387 () Bool)

(assert (=> mapIsEmpty!5387 mapRes!5387))

(declare-fun b!156481 () Bool)

(declare-fun res!73940 () Bool)

(assert (=> b!156481 (=> (not res!73940) (not e!102341))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156481 (= res!73940 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!73939 () Bool)

(assert (=> start!15694 (=> (not res!73939) (not e!102341))))

(declare-fun valid!668 (LongMapFixedSize!1384) Bool)

(assert (=> start!15694 (= res!73939 (valid!668 thiss!1248))))

(assert (=> start!15694 e!102341))

(declare-fun e!102340 () Bool)

(assert (=> start!15694 e!102340))

(assert (=> start!15694 true))

(declare-fun b!156482 () Bool)

(declare-fun e!102343 () Bool)

(declare-fun tp_is_empty!3163 () Bool)

(assert (=> b!156482 (= e!102343 tp_is_empty!3163)))

(declare-fun b!156483 () Bool)

(assert (=> b!156483 (= e!102341 false)))

(declare-fun lt!81556 () Bool)

(declare-datatypes ((List!1856 0))(
  ( (Nil!1853) (Cons!1852 (h!2461 (_ BitVec 64)) (t!6658 List!1856)) )
))
(declare-fun arrayNoDuplicates!0 (array!5379 (_ BitVec 32) List!1856) Bool)

(assert (=> b!156483 (= lt!81556 (arrayNoDuplicates!0 (_keys!4909 thiss!1248) #b00000000000000000000000000000000 Nil!1853))))

(declare-fun b!156484 () Bool)

(declare-fun e!102344 () Bool)

(assert (=> b!156484 (= e!102344 tp_is_empty!3163)))

(declare-fun b!156485 () Bool)

(declare-fun e!102342 () Bool)

(assert (=> b!156485 (= e!102342 (and e!102344 mapRes!5387))))

(declare-fun condMapEmpty!5387 () Bool)

(declare-fun mapDefault!5387 () ValueCell!1238)

