; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21944 () Bool)

(assert start!21944)

(declare-fun b!224011 () Bool)

(declare-fun b_free!6011 () Bool)

(declare-fun b_next!6011 () Bool)

(assert (=> b!224011 (= b_free!6011 (not b_next!6011))))

(declare-fun tp!21175 () Bool)

(declare-fun b_and!12909 () Bool)

(assert (=> b!224011 (= tp!21175 b_and!12909)))

(declare-fun b!223989 () Bool)

(declare-fun res!110162 () Bool)

(declare-datatypes ((V!7477 0))(
  ( (V!7478 (val!2981 Int)) )
))
(declare-datatypes ((ValueCell!2593 0))(
  ( (ValueCellFull!2593 (v!5001 V!7477)) (EmptyCell!2593) )
))
(declare-datatypes ((array!10989 0))(
  ( (array!10990 (arr!5214 (Array (_ BitVec 32) ValueCell!2593)) (size!5547 (_ BitVec 32))) )
))
(declare-datatypes ((array!10991 0))(
  ( (array!10992 (arr!5215 (Array (_ BitVec 32) (_ BitVec 64))) (size!5548 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3086 0))(
  ( (LongMapFixedSize!3087 (defaultEntry!4202 Int) (mask!10032 (_ BitVec 32)) (extraKeys!3939 (_ BitVec 32)) (zeroValue!4043 V!7477) (minValue!4043 V!7477) (_size!1592 (_ BitVec 32)) (_keys!6256 array!10991) (_values!4185 array!10989) (_vacant!1592 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3086)

(declare-datatypes ((SeekEntryResult!854 0))(
  ( (MissingZero!854 (index!5586 (_ BitVec 32))) (Found!854 (index!5587 (_ BitVec 32))) (Intermediate!854 (undefined!1666 Bool) (index!5588 (_ BitVec 32)) (x!23114 (_ BitVec 32))) (Undefined!854) (MissingVacant!854 (index!5589 (_ BitVec 32))) )
))
(declare-fun lt!113042 () SeekEntryResult!854)

(assert (=> b!223989 (= res!110162 (= (select (arr!5215 (_keys!6256 thiss!1504)) (index!5589 lt!113042)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!145459 () Bool)

(assert (=> b!223989 (=> (not res!110162) (not e!145459))))

(declare-fun b!223990 () Bool)

(declare-fun res!110156 () Bool)

(declare-fun e!145452 () Bool)

(assert (=> b!223990 (=> (not res!110156) (not e!145452))))

(declare-fun call!20868 () Bool)

(assert (=> b!223990 (= res!110156 call!20868)))

(declare-fun e!145464 () Bool)

(assert (=> b!223990 (= e!145464 e!145452)))

(declare-fun b!223991 () Bool)

(declare-fun res!110167 () Bool)

(declare-fun e!145462 () Bool)

(assert (=> b!223991 (=> (not res!110167) (not e!145462))))

(declare-fun lt!113044 () Bool)

(assert (=> b!223991 (= res!110167 (not lt!113044))))

(declare-fun b!223992 () Bool)

(declare-fun e!145466 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3329 0))(
  ( (Nil!3326) (Cons!3325 (h!3973 (_ BitVec 64)) (t!8288 List!3329)) )
))
(declare-fun contains!1549 (List!3329 (_ BitVec 64)) Bool)

(assert (=> b!223992 (= e!145466 (not (contains!1549 Nil!3326 key!932)))))

(declare-fun b!223993 () Bool)

(declare-fun e!145465 () Bool)

(declare-fun e!145457 () Bool)

(assert (=> b!223993 (= e!145465 e!145457)))

(declare-fun res!110153 () Bool)

(assert (=> b!223993 (=> (not res!110153) (not e!145457))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223993 (= res!110153 (inRange!0 index!297 (mask!10032 thiss!1504)))))

(declare-datatypes ((Unit!6735 0))(
  ( (Unit!6736) )
))
(declare-fun lt!113040 () Unit!6735)

(declare-fun e!145460 () Unit!6735)

(assert (=> b!223993 (= lt!113040 e!145460)))

(declare-fun c!37164 () Bool)

(declare-datatypes ((tuple2!4418 0))(
  ( (tuple2!4419 (_1!2220 (_ BitVec 64)) (_2!2220 V!7477)) )
))
(declare-datatypes ((List!3330 0))(
  ( (Nil!3327) (Cons!3326 (h!3974 tuple2!4418) (t!8289 List!3330)) )
))
(declare-datatypes ((ListLongMap!3331 0))(
  ( (ListLongMap!3332 (toList!1681 List!3330)) )
))
(declare-fun contains!1550 (ListLongMap!3331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1209 (array!10991 array!10989 (_ BitVec 32) (_ BitVec 32) V!7477 V!7477 (_ BitVec 32) Int) ListLongMap!3331)

(assert (=> b!223993 (= c!37164 (contains!1550 (getCurrentListMap!1209 (_keys!6256 thiss!1504) (_values!4185 thiss!1504) (mask!10032 thiss!1504) (extraKeys!3939 thiss!1504) (zeroValue!4043 thiss!1504) (minValue!4043 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4202 thiss!1504)) key!932))))

(declare-fun b!223994 () Bool)

(declare-fun e!145458 () Bool)

(declare-fun e!145463 () Bool)

(declare-fun mapRes!9979 () Bool)

(assert (=> b!223994 (= e!145458 (and e!145463 mapRes!9979))))

(declare-fun condMapEmpty!9979 () Bool)

(declare-fun mapDefault!9979 () ValueCell!2593)

