; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18102 () Bool)

(assert start!18102)

(declare-fun b!180295 () Bool)

(declare-fun b_free!4457 () Bool)

(declare-fun b_next!4457 () Bool)

(assert (=> b!180295 (= b_free!4457 (not b_next!4457))))

(declare-fun tp!16104 () Bool)

(declare-fun b_and!10991 () Bool)

(assert (=> b!180295 (= tp!16104 b_and!10991)))

(declare-fun b!180293 () Bool)

(declare-fun e!118778 () Bool)

(declare-fun e!118777 () Bool)

(assert (=> b!180293 (= e!118778 e!118777)))

(declare-datatypes ((V!5285 0))(
  ( (V!5286 (val!2159 Int)) )
))
(declare-datatypes ((tuple2!3366 0))(
  ( (tuple2!3367 (_1!1694 (_ BitVec 64)) (_2!1694 V!5285)) )
))
(declare-datatypes ((List!2294 0))(
  ( (Nil!2291) (Cons!2290 (h!2915 tuple2!3366) (t!7142 List!2294)) )
))
(declare-datatypes ((ListLongMap!2285 0))(
  ( (ListLongMap!2286 (toList!1158 List!2294)) )
))
(declare-fun lt!89048 () ListLongMap!2285)

(declare-fun call!18223 () ListLongMap!2285)

(assert (=> b!180293 (= lt!89048 call!18223)))

(declare-fun res!85402 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1233 (ListLongMap!2285 (_ BitVec 64)) Bool)

(assert (=> b!180293 (= res!85402 (not (contains!1233 lt!89048 key!828)))))

(assert (=> b!180293 (=> res!85402 e!118777)))

(declare-fun mapIsEmpty!7240 () Bool)

(declare-fun mapRes!7240 () Bool)

(assert (=> mapIsEmpty!7240 mapRes!7240))

(declare-fun b!180294 () Bool)

(declare-fun e!118780 () Bool)

(declare-fun e!118776 () Bool)

(assert (=> b!180294 (= e!118780 e!118776)))

(declare-fun res!85399 () Bool)

(assert (=> b!180294 (=> (not res!85399) (not e!118776))))

(declare-datatypes ((SeekEntryResult!592 0))(
  ( (MissingZero!592 (index!4537 (_ BitVec 32))) (Found!592 (index!4538 (_ BitVec 32))) (Intermediate!592 (undefined!1404 Bool) (index!4539 (_ BitVec 32)) (x!19704 (_ BitVec 32))) (Undefined!592) (MissingVacant!592 (index!4540 (_ BitVec 32))) )
))
(declare-fun lt!89047 () SeekEntryResult!592)

(assert (=> b!180294 (= res!85399 (and (not (is-Undefined!592 lt!89047)) (not (is-MissingVacant!592 lt!89047)) (is-MissingZero!592 lt!89047)))))

(declare-datatypes ((ValueCell!1771 0))(
  ( (ValueCellFull!1771 (v!4050 V!5285)) (EmptyCell!1771) )
))
(declare-datatypes ((array!7629 0))(
  ( (array!7630 (arr!3613 (Array (_ BitVec 32) (_ BitVec 64))) (size!3921 (_ BitVec 32))) )
))
(declare-datatypes ((array!7631 0))(
  ( (array!7632 (arr!3614 (Array (_ BitVec 32) ValueCell!1771)) (size!3922 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2450 0))(
  ( (LongMapFixedSize!2451 (defaultEntry!3701 Int) (mask!8699 (_ BitVec 32)) (extraKeys!3438 (_ BitVec 32)) (zeroValue!3542 V!5285) (minValue!3542 V!5285) (_size!1274 (_ BitVec 32)) (_keys!5593 array!7629) (_values!3684 array!7631) (_vacant!1274 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2450)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7629 (_ BitVec 32)) SeekEntryResult!592)

(assert (=> b!180294 (= lt!89047 (seekEntryOrOpen!0 key!828 (_keys!5593 thiss!1248) (mask!8699 thiss!1248)))))

(declare-fun e!118775 () Bool)

(declare-fun e!118774 () Bool)

(declare-fun tp_is_empty!4229 () Bool)

(declare-fun array_inv!2327 (array!7629) Bool)

(declare-fun array_inv!2328 (array!7631) Bool)

(assert (=> b!180295 (= e!118774 (and tp!16104 tp_is_empty!4229 (array_inv!2327 (_keys!5593 thiss!1248)) (array_inv!2328 (_values!3684 thiss!1248)) e!118775))))

(declare-fun bm!18219 () Bool)

(declare-datatypes ((tuple2!3368 0))(
  ( (tuple2!3369 (_1!1695 Bool) (_2!1695 LongMapFixedSize!2450)) )
))
(declare-fun lt!89046 () tuple2!3368)

(declare-fun map!1939 (LongMapFixedSize!2450) ListLongMap!2285)

(assert (=> bm!18219 (= call!18223 (map!1939 (_2!1695 lt!89046)))))

(declare-fun mapNonEmpty!7240 () Bool)

(declare-fun tp!16105 () Bool)

(declare-fun e!118781 () Bool)

(assert (=> mapNonEmpty!7240 (= mapRes!7240 (and tp!16105 e!118781))))

(declare-fun mapRest!7240 () (Array (_ BitVec 32) ValueCell!1771))

(declare-fun mapKey!7240 () (_ BitVec 32))

(declare-fun mapValue!7240 () ValueCell!1771)

(assert (=> mapNonEmpty!7240 (= (arr!3614 (_values!3684 thiss!1248)) (store mapRest!7240 mapKey!7240 mapValue!7240))))

(declare-fun b!180296 () Bool)

(assert (=> b!180296 (= e!118781 tp_is_empty!4229)))

(declare-fun b!180297 () Bool)

(declare-fun e!118779 () Bool)

(assert (=> b!180297 (= e!118776 e!118779)))

(declare-fun res!85400 () Bool)

(assert (=> b!180297 (=> res!85400 e!118779)))

(declare-fun valid!1018 (LongMapFixedSize!2450) Bool)

(assert (=> b!180297 (= res!85400 (not (valid!1018 (_2!1695 lt!89046))))))

(declare-fun v!309 () V!5285)

(declare-fun updateHelperNewKey!89 (LongMapFixedSize!2450 (_ BitVec 64) V!5285 (_ BitVec 32)) tuple2!3368)

(assert (=> b!180297 (= lt!89046 (updateHelperNewKey!89 thiss!1248 key!828 v!309 (index!4537 lt!89047)))))

(declare-fun res!85398 () Bool)

(assert (=> start!18102 (=> (not res!85398) (not e!118780))))

(assert (=> start!18102 (= res!85398 (valid!1018 thiss!1248))))

(assert (=> start!18102 e!118780))

(assert (=> start!18102 e!118774))

(assert (=> start!18102 true))

(assert (=> start!18102 tp_is_empty!4229))

(declare-fun b!180292 () Bool)

(declare-fun call!18222 () ListLongMap!2285)

(assert (=> b!180292 (= e!118778 (not (= call!18223 call!18222)))))

(declare-fun b!180298 () Bool)

(declare-fun res!85401 () Bool)

(assert (=> b!180298 (=> (not res!85401) (not e!118780))))

(assert (=> b!180298 (= res!85401 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180299 () Bool)

(declare-fun +!268 (ListLongMap!2285 tuple2!3366) ListLongMap!2285)

(assert (=> b!180299 (= e!118777 (not (= lt!89048 (+!268 call!18222 (tuple2!3367 key!828 v!309)))))))

(declare-fun b!180300 () Bool)

(declare-fun e!118773 () Bool)

(assert (=> b!180300 (= e!118775 (and e!118773 mapRes!7240))))

(declare-fun condMapEmpty!7240 () Bool)

(declare-fun mapDefault!7240 () ValueCell!1771)

