; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11054 () Bool)

(assert start!11054)

(declare-fun b!89862 () Bool)

(declare-fun b_free!2269 () Bool)

(declare-fun b_next!2269 () Bool)

(assert (=> b!89862 (= b_free!2269 (not b_next!2269))))

(declare-fun tp!9053 () Bool)

(declare-fun b_and!5391 () Bool)

(assert (=> b!89862 (= tp!9053 b_and!5391)))

(declare-fun b!89851 () Bool)

(declare-fun b_free!2271 () Bool)

(declare-fun b_next!2271 () Bool)

(assert (=> b!89851 (= b_free!2271 (not b_next!2271))))

(declare-fun tp!9051 () Bool)

(declare-fun b_and!5393 () Bool)

(assert (=> b!89851 (= tp!9051 b_and!5393)))

(declare-fun b!89845 () Bool)

(declare-fun e!58469 () Bool)

(declare-fun e!58473 () Bool)

(assert (=> b!89845 (= e!58469 e!58473)))

(declare-fun b!89846 () Bool)

(declare-fun res!45915 () Bool)

(declare-fun e!58472 () Bool)

(assert (=> b!89846 (=> (not res!45915) (not e!58472))))

(declare-datatypes ((V!3049 0))(
  ( (V!3050 (val!1320 Int)) )
))
(declare-datatypes ((array!4067 0))(
  ( (array!4068 (arr!1935 (Array (_ BitVec 32) (_ BitVec 64))) (size!2182 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!932 0))(
  ( (ValueCellFull!932 (v!2684 V!3049)) (EmptyCell!932) )
))
(declare-datatypes ((array!4069 0))(
  ( (array!4070 (arr!1936 (Array (_ BitVec 32) ValueCell!932)) (size!2183 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!772 0))(
  ( (LongMapFixedSize!773 (defaultEntry!2384 Int) (mask!6434 (_ BitVec 32)) (extraKeys!2215 (_ BitVec 32)) (zeroValue!2272 V!3049) (minValue!2272 V!3049) (_size!435 (_ BitVec 32)) (_keys!4064 array!4067) (_values!2367 array!4069) (_vacant!435 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!772)

(declare-fun valid!332 (LongMapFixedSize!772) Bool)

(assert (=> b!89846 (= res!45915 (valid!332 newMap!16))))

(declare-fun mapIsEmpty!3467 () Bool)

(declare-fun mapRes!3468 () Bool)

(assert (=> mapIsEmpty!3467 mapRes!3468))

(declare-fun b!89847 () Bool)

(declare-fun e!58484 () Bool)

(declare-fun tp_is_empty!2551 () Bool)

(assert (=> b!89847 (= e!58484 tp_is_empty!2551)))

(declare-fun b!89848 () Bool)

(declare-fun res!45913 () Bool)

(assert (=> b!89848 (=> (not res!45913) (not e!58472))))

(declare-datatypes ((Cell!572 0))(
  ( (Cell!573 (v!2685 LongMapFixedSize!772)) )
))
(declare-datatypes ((LongMap!572 0))(
  ( (LongMap!573 (underlying!297 Cell!572)) )
))
(declare-fun thiss!992 () LongMap!572)

(assert (=> b!89848 (= res!45913 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6434 newMap!16)) (_size!435 (v!2685 (underlying!297 thiss!992)))))))

(declare-fun b!89849 () Bool)

(declare-fun e!58477 () Bool)

(assert (=> b!89849 (= e!58477 tp_is_empty!2551)))

(declare-fun b!89850 () Bool)

(declare-fun e!58474 () Bool)

(declare-fun mapRes!3467 () Bool)

(assert (=> b!89850 (= e!58474 (and e!58484 mapRes!3467))))

(declare-fun condMapEmpty!3467 () Bool)

(declare-fun mapDefault!3467 () ValueCell!932)

