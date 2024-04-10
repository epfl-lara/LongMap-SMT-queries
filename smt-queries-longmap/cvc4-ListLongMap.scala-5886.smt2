; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75850 () Bool)

(assert start!75850)

(declare-fun b!892549 () Bool)

(declare-fun b_free!15821 () Bool)

(declare-fun b_next!15821 () Bool)

(assert (=> b!892549 (= b_free!15821 (not b_next!15821))))

(declare-fun tp!55431 () Bool)

(declare-fun b_and!26065 () Bool)

(assert (=> b!892549 (= tp!55431 b_and!26065)))

(declare-fun bm!39524 () Bool)

(declare-datatypes ((V!29163 0))(
  ( (V!29164 (val!9125 Int)) )
))
(declare-fun call!39528 () V!29163)

(declare-fun call!39527 () V!29163)

(assert (=> bm!39524 (= call!39528 call!39527)))

(declare-fun b!892539 () Bool)

(declare-fun e!498269 () Bool)

(declare-fun tp_is_empty!18149 () Bool)

(assert (=> b!892539 (= e!498269 tp_is_empty!18149)))

(declare-datatypes ((SeekEntryResult!8850 0))(
  ( (MissingZero!8850 (index!37771 (_ BitVec 32))) (Found!8850 (index!37772 (_ BitVec 32))) (Intermediate!8850 (undefined!9662 Bool) (index!37773 (_ BitVec 32)) (x!75856 (_ BitVec 32))) (Undefined!8850) (MissingVacant!8850 (index!37774 (_ BitVec 32))) )
))
(declare-fun lt!403229 () SeekEntryResult!8850)

(declare-datatypes ((array!52278 0))(
  ( (array!52279 (arr!25145 (Array (_ BitVec 32) (_ BitVec 64))) (size!25589 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8593 0))(
  ( (ValueCellFull!8593 (v!11603 V!29163)) (EmptyCell!8593) )
))
(declare-datatypes ((array!52280 0))(
  ( (array!52281 (arr!25146 (Array (_ BitVec 32) ValueCell!8593)) (size!25590 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4202 0))(
  ( (LongMapFixedSize!4203 (defaultEntry!5298 Int) (mask!25811 (_ BitVec 32)) (extraKeys!4992 (_ BitVec 32)) (zeroValue!5096 V!29163) (minValue!5096 V!29163) (_size!2156 (_ BitVec 32)) (_keys!9981 array!52278) (_values!5283 array!52280) (_vacant!2156 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4202)

(declare-fun b!892540 () Bool)

(declare-fun e!498266 () Bool)

(declare-fun get!13234 (ValueCell!8593 V!29163) V!29163)

(declare-fun dynLambda!1292 (Int (_ BitVec 64)) V!29163)

(assert (=> b!892540 (= e!498266 (= call!39528 (get!13234 (select (arr!25146 (_values!5283 thiss!1181)) (index!37772 lt!403229)) (dynLambda!1292 (defaultEntry!5298 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!39525 () Bool)

(declare-datatypes ((tuple2!12000 0))(
  ( (tuple2!12001 (_1!6011 (_ BitVec 64)) (_2!6011 V!29163)) )
))
(declare-datatypes ((List!17787 0))(
  ( (Nil!17784) (Cons!17783 (h!18914 tuple2!12000) (t!25092 List!17787)) )
))
(declare-datatypes ((ListLongMap!10697 0))(
  ( (ListLongMap!10698 (toList!5364 List!17787)) )
))
(declare-fun lt!403230 () ListLongMap!10697)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun apply!402 (ListLongMap!10697 (_ BitVec 64)) V!29163)

(assert (=> bm!39525 (= call!39527 (apply!402 lt!403230 key!785))))

(declare-fun b!892541 () Bool)

(declare-fun e!498270 () Bool)

(assert (=> b!892541 (= e!498270 true)))

(declare-fun e!498271 () Bool)

(assert (=> b!892541 e!498271))

(declare-fun c!93962 () Bool)

(assert (=> b!892541 (= c!93962 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!30394 0))(
  ( (Unit!30395) )
))
(declare-fun lt!403234 () Unit!30394)

(declare-fun lemmaKeyInListMapThenSameValueInArray!5 (array!52278 array!52280 (_ BitVec 32) (_ BitVec 32) V!29163 V!29163 (_ BitVec 64) (_ BitVec 32) Int) Unit!30394)

(assert (=> b!892541 (= lt!403234 (lemmaKeyInListMapThenSameValueInArray!5 (_keys!9981 thiss!1181) (_values!5283 thiss!1181) (mask!25811 thiss!1181) (extraKeys!4992 thiss!1181) (zeroValue!5096 thiss!1181) (minValue!5096 thiss!1181) key!785 (index!37772 lt!403229) (defaultEntry!5298 thiss!1181)))))

(declare-fun contains!4366 (ListLongMap!10697 (_ BitVec 64)) Bool)

(assert (=> b!892541 (contains!4366 lt!403230 (select (arr!25145 (_keys!9981 thiss!1181)) (index!37772 lt!403229)))))

(declare-fun getCurrentListMap!2644 (array!52278 array!52280 (_ BitVec 32) (_ BitVec 32) V!29163 V!29163 (_ BitVec 32) Int) ListLongMap!10697)

(assert (=> b!892541 (= lt!403230 (getCurrentListMap!2644 (_keys!9981 thiss!1181) (_values!5283 thiss!1181) (mask!25811 thiss!1181) (extraKeys!4992 thiss!1181) (zeroValue!5096 thiss!1181) (minValue!5096 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5298 thiss!1181)))))

(declare-fun lt!403232 () Unit!30394)

(declare-fun lemmaValidKeyInArrayIsInListMap!233 (array!52278 array!52280 (_ BitVec 32) (_ BitVec 32) V!29163 V!29163 (_ BitVec 32) Int) Unit!30394)

(assert (=> b!892541 (= lt!403232 (lemmaValidKeyInArrayIsInListMap!233 (_keys!9981 thiss!1181) (_values!5283 thiss!1181) (mask!25811 thiss!1181) (extraKeys!4992 thiss!1181) (zeroValue!5096 thiss!1181) (minValue!5096 thiss!1181) (index!37772 lt!403229) (defaultEntry!5298 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892541 (arrayContainsKey!0 (_keys!9981 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403231 () Unit!30394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52278 (_ BitVec 64) (_ BitVec 32)) Unit!30394)

(assert (=> b!892541 (= lt!403231 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9981 thiss!1181) key!785 (index!37772 lt!403229)))))

(declare-fun b!892542 () Bool)

(declare-fun e!498274 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892542 (= e!498274 (inRange!0 (index!37772 lt!403229) (mask!25811 thiss!1181)))))

(declare-fun b!892543 () Bool)

(declare-fun e!498275 () Bool)

(assert (=> b!892543 (= e!498275 tp_is_empty!18149)))

(declare-fun mapNonEmpty!28778 () Bool)

(declare-fun mapRes!28778 () Bool)

(declare-fun tp!55432 () Bool)

(assert (=> mapNonEmpty!28778 (= mapRes!28778 (and tp!55432 e!498275))))

(declare-fun mapRest!28778 () (Array (_ BitVec 32) ValueCell!8593))

(declare-fun mapKey!28778 () (_ BitVec 32))

(declare-fun mapValue!28778 () ValueCell!8593)

(assert (=> mapNonEmpty!28778 (= (arr!25146 (_values!5283 thiss!1181)) (store mapRest!28778 mapKey!28778 mapValue!28778))))

(declare-fun b!892544 () Bool)

(declare-fun e!498265 () Bool)

(assert (=> b!892544 (= e!498271 e!498265)))

(declare-fun res!604668 () Bool)

(assert (=> b!892544 (= res!604668 (not (= (bvand (extraKeys!4992 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892544 (=> (not res!604668) (not e!498265))))

(declare-fun b!892545 () Bool)

(declare-fun res!604673 () Bool)

(declare-fun e!498268 () Bool)

(assert (=> b!892545 (=> (not res!604673) (not e!498268))))

(assert (=> b!892545 (= res!604673 (not (= (bvand (extraKeys!4992 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!892545 (= e!498266 e!498268)))

(declare-fun b!892546 () Bool)

(assert (=> b!892546 (= e!498271 e!498266)))

(declare-fun c!93963 () Bool)

(assert (=> b!892546 (= c!93963 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!604669 () Bool)

(declare-fun e!498273 () Bool)

(assert (=> start!75850 (=> (not res!604669) (not e!498273))))

(declare-fun valid!1625 (LongMapFixedSize!4202) Bool)

(assert (=> start!75850 (= res!604669 (valid!1625 thiss!1181))))

(assert (=> start!75850 e!498273))

(declare-fun e!498272 () Bool)

(assert (=> start!75850 e!498272))

(assert (=> start!75850 true))

(declare-fun mapIsEmpty!28778 () Bool)

(assert (=> mapIsEmpty!28778 mapRes!28778))

(declare-fun b!892547 () Bool)

(declare-fun res!604670 () Bool)

(assert (=> b!892547 (=> (not res!604670) (not e!498273))))

(assert (=> b!892547 (= res!604670 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892548 () Bool)

(assert (=> b!892548 (= e!498273 (not e!498270))))

(declare-fun res!604672 () Bool)

(assert (=> b!892548 (=> res!604672 e!498270)))

(assert (=> b!892548 (= res!604672 (not (is-Found!8850 lt!403229)))))

(assert (=> b!892548 e!498274))

(declare-fun res!604671 () Bool)

(assert (=> b!892548 (=> res!604671 e!498274)))

(assert (=> b!892548 (= res!604671 (not (is-Found!8850 lt!403229)))))

(declare-fun lt!403233 () Unit!30394)

(declare-fun lemmaSeekEntryGivesInRangeIndex!49 (array!52278 array!52280 (_ BitVec 32) (_ BitVec 32) V!29163 V!29163 (_ BitVec 64)) Unit!30394)

(assert (=> b!892548 (= lt!403233 (lemmaSeekEntryGivesInRangeIndex!49 (_keys!9981 thiss!1181) (_values!5283 thiss!1181) (mask!25811 thiss!1181) (extraKeys!4992 thiss!1181) (zeroValue!5096 thiss!1181) (minValue!5096 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52278 (_ BitVec 32)) SeekEntryResult!8850)

(assert (=> b!892548 (= lt!403229 (seekEntry!0 key!785 (_keys!9981 thiss!1181) (mask!25811 thiss!1181)))))

(declare-fun e!498276 () Bool)

(declare-fun array_inv!19748 (array!52278) Bool)

(declare-fun array_inv!19749 (array!52280) Bool)

(assert (=> b!892549 (= e!498272 (and tp!55431 tp_is_empty!18149 (array_inv!19748 (_keys!9981 thiss!1181)) (array_inv!19749 (_values!5283 thiss!1181)) e!498276))))

(declare-fun b!892550 () Bool)

(assert (=> b!892550 (= e!498276 (and e!498269 mapRes!28778))))

(declare-fun condMapEmpty!28778 () Bool)

(declare-fun mapDefault!28778 () ValueCell!8593)

