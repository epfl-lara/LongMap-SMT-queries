; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16264 () Bool)

(assert start!16264)

(declare-fun b!162265 () Bool)

(declare-fun b_free!3725 () Bool)

(declare-fun b_next!3725 () Bool)

(assert (=> b!162265 (= b_free!3725 (not b_next!3725))))

(declare-fun tp!13744 () Bool)

(declare-fun b_and!10139 () Bool)

(assert (=> b!162265 (= tp!13744 b_and!10139)))

(declare-fun b!162263 () Bool)

(declare-fun e!106282 () Bool)

(declare-fun tp_is_empty!3527 () Bool)

(assert (=> b!162263 (= e!106282 tp_is_empty!3527)))

(declare-fun res!76855 () Bool)

(declare-fun e!106281 () Bool)

(assert (=> start!16264 (=> (not res!76855) (not e!106281))))

(declare-datatypes ((V!4349 0))(
  ( (V!4350 (val!1808 Int)) )
))
(declare-datatypes ((ValueCell!1420 0))(
  ( (ValueCellFull!1420 (v!3673 V!4349)) (EmptyCell!1420) )
))
(declare-datatypes ((array!6133 0))(
  ( (array!6134 (arr!2911 (Array (_ BitVec 32) (_ BitVec 64))) (size!3195 (_ BitVec 32))) )
))
(declare-datatypes ((array!6135 0))(
  ( (array!6136 (arr!2912 (Array (_ BitVec 32) ValueCell!1420)) (size!3196 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1748 0))(
  ( (LongMapFixedSize!1749 (defaultEntry!3316 Int) (mask!7932 (_ BitVec 32)) (extraKeys!3057 (_ BitVec 32)) (zeroValue!3159 V!4349) (minValue!3159 V!4349) (_size!923 (_ BitVec 32)) (_keys!5117 array!6133) (_values!3299 array!6135) (_vacant!923 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1748)

(declare-fun valid!792 (LongMapFixedSize!1748) Bool)

(assert (=> start!16264 (= res!76855 (valid!792 thiss!1248))))

(assert (=> start!16264 e!106281))

(declare-fun e!106280 () Bool)

(assert (=> start!16264 e!106280))

(assert (=> start!16264 true))

(declare-fun b!162264 () Bool)

(declare-fun e!106284 () Bool)

(declare-fun e!106283 () Bool)

(declare-fun mapRes!5978 () Bool)

(assert (=> b!162264 (= e!106284 (and e!106283 mapRes!5978))))

(declare-fun condMapEmpty!5978 () Bool)

(declare-fun mapDefault!5978 () ValueCell!1420)

