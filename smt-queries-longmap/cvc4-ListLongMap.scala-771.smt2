; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18144 () Bool)

(assert start!18144)

(declare-fun b!180666 () Bool)

(declare-fun b_free!4469 () Bool)

(declare-fun b_next!4469 () Bool)

(assert (=> b!180666 (= b_free!4469 (not b_next!4469))))

(declare-fun tp!16146 () Bool)

(declare-fun b_and!11005 () Bool)

(assert (=> b!180666 (= tp!16146 b_and!11005)))

(declare-fun mapNonEmpty!7264 () Bool)

(declare-fun mapRes!7264 () Bool)

(declare-fun tp!16147 () Bool)

(declare-fun e!119016 () Bool)

(assert (=> mapNonEmpty!7264 (= mapRes!7264 (and tp!16147 e!119016))))

(declare-datatypes ((V!5301 0))(
  ( (V!5302 (val!2165 Int)) )
))
(declare-datatypes ((ValueCell!1777 0))(
  ( (ValueCellFull!1777 (v!4059 V!5301)) (EmptyCell!1777) )
))
(declare-fun mapValue!7264 () ValueCell!1777)

(declare-fun mapRest!7264 () (Array (_ BitVec 32) ValueCell!1777))

(declare-fun mapKey!7264 () (_ BitVec 32))

(declare-datatypes ((array!7657 0))(
  ( (array!7658 (arr!3625 (Array (_ BitVec 32) (_ BitVec 64))) (size!3933 (_ BitVec 32))) )
))
(declare-datatypes ((array!7659 0))(
  ( (array!7660 (arr!3626 (Array (_ BitVec 32) ValueCell!1777)) (size!3934 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2462 0))(
  ( (LongMapFixedSize!2463 (defaultEntry!3708 Int) (mask!8713 (_ BitVec 32)) (extraKeys!3445 (_ BitVec 32)) (zeroValue!3549 V!5301) (minValue!3549 V!5301) (_size!1280 (_ BitVec 32)) (_keys!5602 array!7657) (_values!3691 array!7659) (_vacant!1280 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2462)

(assert (=> mapNonEmpty!7264 (= (arr!3626 (_values!3691 thiss!1248)) (store mapRest!7264 mapKey!7264 mapValue!7264))))

(declare-fun b!180660 () Bool)

(declare-fun res!85568 () Bool)

(declare-fun e!119017 () Bool)

(assert (=> b!180660 (=> (not res!85568) (not e!119017))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!180660 (= res!85568 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180661 () Bool)

(declare-fun e!119021 () Bool)

(assert (=> b!180661 (= e!119021 (not (= (size!3934 (_values!3691 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8713 thiss!1248)))))))

(declare-fun b!180662 () Bool)

(declare-fun e!119018 () Bool)

(declare-fun tp_is_empty!4241 () Bool)

(assert (=> b!180662 (= e!119018 tp_is_empty!4241)))

(declare-fun b!180663 () Bool)

(assert (=> b!180663 (= e!119017 e!119021)))

(declare-fun res!85569 () Bool)

(assert (=> b!180663 (=> (not res!85569) (not e!119021))))

(declare-datatypes ((SeekEntryResult!596 0))(
  ( (MissingZero!596 (index!4554 (_ BitVec 32))) (Found!596 (index!4555 (_ BitVec 32))) (Intermediate!596 (undefined!1408 Bool) (index!4556 (_ BitVec 32)) (x!19748 (_ BitVec 32))) (Undefined!596) (MissingVacant!596 (index!4557 (_ BitVec 32))) )
))
(declare-fun lt!89276 () SeekEntryResult!596)

(assert (=> b!180663 (= res!85569 (and (not (is-Undefined!596 lt!89276)) (not (is-MissingVacant!596 lt!89276)) (not (is-MissingZero!596 lt!89276)) (is-Found!596 lt!89276)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7657 (_ BitVec 32)) SeekEntryResult!596)

(assert (=> b!180663 (= lt!89276 (seekEntryOrOpen!0 key!828 (_keys!5602 thiss!1248) (mask!8713 thiss!1248)))))

(declare-fun res!85567 () Bool)

(assert (=> start!18144 (=> (not res!85567) (not e!119017))))

(declare-fun valid!1023 (LongMapFixedSize!2462) Bool)

(assert (=> start!18144 (= res!85567 (valid!1023 thiss!1248))))

(assert (=> start!18144 e!119017))

(declare-fun e!119019 () Bool)

(assert (=> start!18144 e!119019))

(assert (=> start!18144 true))

(declare-fun b!180664 () Bool)

(assert (=> b!180664 (= e!119016 tp_is_empty!4241)))

(declare-fun b!180665 () Bool)

(declare-fun res!85566 () Bool)

(assert (=> b!180665 (=> (not res!85566) (not e!119021))))

(declare-datatypes ((tuple2!3376 0))(
  ( (tuple2!3377 (_1!1699 (_ BitVec 64)) (_2!1699 V!5301)) )
))
(declare-datatypes ((List!2300 0))(
  ( (Nil!2297) (Cons!2296 (h!2921 tuple2!3376) (t!7150 List!2300)) )
))
(declare-datatypes ((ListLongMap!2293 0))(
  ( (ListLongMap!2294 (toList!1162 List!2300)) )
))
(declare-fun contains!1238 (ListLongMap!2293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!810 (array!7657 array!7659 (_ BitVec 32) (_ BitVec 32) V!5301 V!5301 (_ BitVec 32) Int) ListLongMap!2293)

(assert (=> b!180665 (= res!85566 (contains!1238 (getCurrentListMap!810 (_keys!5602 thiss!1248) (_values!3691 thiss!1248) (mask!8713 thiss!1248) (extraKeys!3445 thiss!1248) (zeroValue!3549 thiss!1248) (minValue!3549 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3708 thiss!1248)) key!828))))

(declare-fun e!119022 () Bool)

(declare-fun array_inv!2335 (array!7657) Bool)

(declare-fun array_inv!2336 (array!7659) Bool)

(assert (=> b!180666 (= e!119019 (and tp!16146 tp_is_empty!4241 (array_inv!2335 (_keys!5602 thiss!1248)) (array_inv!2336 (_values!3691 thiss!1248)) e!119022))))

(declare-fun b!180667 () Bool)

(assert (=> b!180667 (= e!119022 (and e!119018 mapRes!7264))))

(declare-fun condMapEmpty!7264 () Bool)

(declare-fun mapDefault!7264 () ValueCell!1777)

