; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37454 () Bool)

(assert start!37454)

(declare-fun b_free!8581 () Bool)

(declare-fun b_next!8581 () Bool)

(assert (=> start!37454 (= b_free!8581 (not b_next!8581))))

(declare-fun tp!30459 () Bool)

(declare-fun b_and!15823 () Bool)

(assert (=> start!37454 (= tp!30459 b_and!15823)))

(declare-fun b!381478 () Bool)

(declare-fun res!216779 () Bool)

(declare-fun e!231925 () Bool)

(assert (=> b!381478 (=> (not res!216779) (not e!231925))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381478 (= res!216779 (validKeyInArray!0 k!778))))

(declare-fun b!381479 () Bool)

(declare-fun e!231926 () Bool)

(assert (=> b!381479 (= e!231926 true)))

(declare-datatypes ((V!13411 0))(
  ( (V!13412 (val!4659 Int)) )
))
(declare-datatypes ((tuple2!6258 0))(
  ( (tuple2!6259 (_1!3140 (_ BitVec 64)) (_2!3140 V!13411)) )
))
(declare-datatypes ((List!6089 0))(
  ( (Nil!6086) (Cons!6085 (h!6941 tuple2!6258) (t!11239 List!6089)) )
))
(declare-datatypes ((ListLongMap!5171 0))(
  ( (ListLongMap!5172 (toList!2601 List!6089)) )
))
(declare-fun lt!178812 () ListLongMap!5171)

(declare-fun lt!178804 () ListLongMap!5171)

(assert (=> b!381479 (= lt!178812 lt!178804)))

(declare-fun b!381480 () Bool)

(declare-fun res!216772 () Bool)

(declare-fun e!231922 () Bool)

(assert (=> b!381480 (=> (not res!216772) (not e!231922))))

(declare-datatypes ((array!22373 0))(
  ( (array!22374 (arr!10655 (Array (_ BitVec 32) (_ BitVec 64))) (size!11007 (_ BitVec 32))) )
))
(declare-fun lt!178809 () array!22373)

(declare-datatypes ((List!6090 0))(
  ( (Nil!6087) (Cons!6086 (h!6942 (_ BitVec 64)) (t!11240 List!6090)) )
))
(declare-fun arrayNoDuplicates!0 (array!22373 (_ BitVec 32) List!6090) Bool)

(assert (=> b!381480 (= res!216772 (arrayNoDuplicates!0 lt!178809 #b00000000000000000000000000000000 Nil!6087))))

(declare-fun mapNonEmpty!15408 () Bool)

(declare-fun mapRes!15408 () Bool)

(declare-fun tp!30458 () Bool)

(declare-fun e!231920 () Bool)

(assert (=> mapNonEmpty!15408 (= mapRes!15408 (and tp!30458 e!231920))))

(declare-datatypes ((ValueCell!4271 0))(
  ( (ValueCellFull!4271 (v!6856 V!13411)) (EmptyCell!4271) )
))
(declare-fun mapValue!15408 () ValueCell!4271)

(declare-datatypes ((array!22375 0))(
  ( (array!22376 (arr!10656 (Array (_ BitVec 32) ValueCell!4271)) (size!11008 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22375)

(declare-fun mapRest!15408 () (Array (_ BitVec 32) ValueCell!4271))

(declare-fun mapKey!15408 () (_ BitVec 32))

(assert (=> mapNonEmpty!15408 (= (arr!10656 _values!506) (store mapRest!15408 mapKey!15408 mapValue!15408))))

(declare-fun b!381481 () Bool)

(declare-fun tp_is_empty!9229 () Bool)

(assert (=> b!381481 (= e!231920 tp_is_empty!9229)))

(declare-fun b!381482 () Bool)

(declare-fun res!216773 () Bool)

(assert (=> b!381482 (=> (not res!216773) (not e!231925))))

(declare-fun _keys!658 () array!22373)

(declare-fun arrayContainsKey!0 (array!22373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381482 (= res!216773 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!381483 () Bool)

(declare-fun res!216769 () Bool)

(assert (=> b!381483 (=> (not res!216769) (not e!231925))))

(assert (=> b!381483 (= res!216769 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6087))))

(declare-fun b!381484 () Bool)

(declare-fun res!216775 () Bool)

(assert (=> b!381484 (=> (not res!216775) (not e!231925))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381484 (= res!216775 (or (= (select (arr!10655 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10655 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381486 () Bool)

(declare-fun e!231921 () Bool)

(declare-fun e!231923 () Bool)

(assert (=> b!381486 (= e!231921 (and e!231923 mapRes!15408))))

(declare-fun condMapEmpty!15408 () Bool)

(declare-fun mapDefault!15408 () ValueCell!4271)

