; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15574 () Bool)

(assert start!15574)

(declare-fun b!154983 () Bool)

(declare-fun b_free!3241 () Bool)

(declare-fun b_next!3241 () Bool)

(assert (=> b!154983 (= b_free!3241 (not b_next!3241))))

(declare-fun tp!12247 () Bool)

(declare-fun b_and!9655 () Bool)

(assert (=> b!154983 (= tp!12247 b_and!9655)))

(declare-fun b!154977 () Bool)

(declare-fun res!73155 () Bool)

(declare-fun e!101242 () Bool)

(assert (=> b!154977 (=> (not res!73155) (not e!101242))))

(declare-datatypes ((V!3705 0))(
  ( (V!3706 (val!1566 Int)) )
))
(declare-datatypes ((ValueCell!1178 0))(
  ( (ValueCellFull!1178 (v!3431 V!3705)) (EmptyCell!1178) )
))
(declare-datatypes ((array!5139 0))(
  ( (array!5140 (arr!2427 (Array (_ BitVec 32) (_ BitVec 64))) (size!2705 (_ BitVec 32))) )
))
(declare-datatypes ((array!5141 0))(
  ( (array!5142 (arr!2428 (Array (_ BitVec 32) ValueCell!1178)) (size!2706 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1264 0))(
  ( (LongMapFixedSize!1265 (defaultEntry!3074 Int) (mask!7487 (_ BitVec 32)) (extraKeys!2815 (_ BitVec 32)) (zeroValue!2917 V!3705) (minValue!2917 V!3705) (_size!681 (_ BitVec 32)) (_keys!4849 array!5139) (_values!3057 array!5141) (_vacant!681 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1264)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154977 (= res!73155 (validMask!0 (mask!7487 thiss!1248)))))

(declare-fun b!154978 () Bool)

(declare-fun e!101245 () Bool)

(declare-fun e!101243 () Bool)

(declare-fun mapRes!5207 () Bool)

(assert (=> b!154978 (= e!101245 (and e!101243 mapRes!5207))))

(declare-fun condMapEmpty!5207 () Bool)

(declare-fun mapDefault!5207 () ValueCell!1178)

