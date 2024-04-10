; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11270 () Bool)

(assert start!11270)

(declare-fun b!92997 () Bool)

(declare-fun b_free!2365 () Bool)

(declare-fun b_next!2365 () Bool)

(assert (=> b!92997 (= b_free!2365 (not b_next!2365))))

(declare-fun tp!9355 () Bool)

(declare-fun b_and!5659 () Bool)

(assert (=> b!92997 (= tp!9355 b_and!5659)))

(declare-fun b!92994 () Bool)

(declare-fun b_free!2367 () Bool)

(declare-fun b_next!2367 () Bool)

(assert (=> b!92994 (= b_free!2367 (not b_next!2367))))

(declare-fun tp!9354 () Bool)

(declare-fun b_and!5661 () Bool)

(assert (=> b!92994 (= tp!9354 b_and!5661)))

(declare-fun mapIsEmpty!3625 () Bool)

(declare-fun mapRes!3626 () Bool)

(assert (=> mapIsEmpty!3625 mapRes!3626))

(declare-fun b!92980 () Bool)

(declare-fun res!47245 () Bool)

(declare-fun e!60682 () Bool)

(assert (=> b!92980 (=> res!47245 e!60682)))

(declare-datatypes ((V!3113 0))(
  ( (V!3114 (val!1344 Int)) )
))
(declare-datatypes ((array!4169 0))(
  ( (array!4170 (arr!1983 (Array (_ BitVec 32) (_ BitVec 64))) (size!2231 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!956 0))(
  ( (ValueCellFull!956 (v!2743 V!3113)) (EmptyCell!956) )
))
(declare-datatypes ((array!4171 0))(
  ( (array!4172 (arr!1984 (Array (_ BitVec 32) ValueCell!956)) (size!2232 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!820 0))(
  ( (LongMapFixedSize!821 (defaultEntry!2424 Int) (mask!6494 (_ BitVec 32)) (extraKeys!2253 (_ BitVec 32)) (zeroValue!2311 V!3113) (minValue!2311 V!3113) (_size!459 (_ BitVec 32)) (_keys!4106 array!4169) (_values!2407 array!4171) (_vacant!459 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2292 0))(
  ( (tuple2!2293 (_1!1157 Bool) (_2!1157 LongMapFixedSize!820)) )
))
(declare-fun lt!45834 () tuple2!2292)

(declare-fun valid!364 (LongMapFixedSize!820) Bool)

(assert (=> b!92980 (= res!47245 (not (valid!364 (_2!1157 lt!45834))))))

(declare-fun b!92981 () Bool)

(declare-fun e!60678 () Bool)

(declare-fun e!60680 () Bool)

(declare-fun mapRes!3625 () Bool)

(assert (=> b!92981 (= e!60678 (and e!60680 mapRes!3625))))

(declare-fun condMapEmpty!3626 () Bool)

(declare-datatypes ((Cell!620 0))(
  ( (Cell!621 (v!2744 LongMapFixedSize!820)) )
))
(declare-datatypes ((LongMap!620 0))(
  ( (LongMap!621 (underlying!321 Cell!620)) )
))
(declare-fun thiss!992 () LongMap!620)

(declare-fun mapDefault!3625 () ValueCell!956)

