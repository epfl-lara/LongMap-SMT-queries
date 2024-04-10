; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15200 () Bool)

(assert start!15200)

(declare-fun b!146124 () Bool)

(declare-fun b_free!3105 () Bool)

(declare-fun b_next!3105 () Bool)

(assert (=> b!146124 (= b_free!3105 (not b_next!3105))))

(declare-fun tp!11817 () Bool)

(declare-fun b_and!9127 () Bool)

(assert (=> b!146124 (= tp!11817 b_and!9127)))

(declare-fun b!146121 () Bool)

(declare-fun b_free!3107 () Bool)

(declare-fun b_next!3107 () Bool)

(assert (=> b!146121 (= b_free!3107 (not b_next!3107))))

(declare-fun tp!11818 () Bool)

(declare-fun b_and!9129 () Bool)

(assert (=> b!146121 (= tp!11818 b_and!9129)))

(declare-fun b!146115 () Bool)

(declare-fun e!95293 () Bool)

(declare-fun e!95281 () Bool)

(declare-fun mapRes!4980 () Bool)

(assert (=> b!146115 (= e!95293 (and e!95281 mapRes!4980))))

(declare-fun condMapEmpty!4979 () Bool)

(declare-datatypes ((V!3605 0))(
  ( (V!3606 (val!1529 Int)) )
))
(declare-datatypes ((array!4983 0))(
  ( (array!4984 (arr!2353 (Array (_ BitVec 32) (_ BitVec 64))) (size!2629 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1141 0))(
  ( (ValueCellFull!1141 (v!3348 V!3605)) (EmptyCell!1141) )
))
(declare-datatypes ((array!4985 0))(
  ( (array!4986 (arr!2354 (Array (_ BitVec 32) ValueCell!1141)) (size!2630 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1190 0))(
  ( (LongMapFixedSize!1191 (defaultEntry!3011 Int) (mask!7385 (_ BitVec 32)) (extraKeys!2756 (_ BitVec 32)) (zeroValue!2856 V!3605) (minValue!2856 V!3605) (_size!644 (_ BitVec 32)) (_keys!4780 array!4983) (_values!2994 array!4985) (_vacant!644 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!974 0))(
  ( (Cell!975 (v!3349 LongMapFixedSize!1190)) )
))
(declare-datatypes ((LongMap!974 0))(
  ( (LongMap!975 (underlying!498 Cell!974)) )
))
(declare-fun thiss!992 () LongMap!974)

(declare-fun mapDefault!4980 () ValueCell!1141)

