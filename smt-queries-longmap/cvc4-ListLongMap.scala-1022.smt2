; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21736 () Bool)

(assert start!21736)

(declare-fun b!218725 () Bool)

(declare-fun b_free!5885 () Bool)

(declare-fun b_next!5885 () Bool)

(assert (=> b!218725 (= b_free!5885 (not b_next!5885))))

(declare-fun tp!20790 () Bool)

(declare-fun b_and!12775 () Bool)

(assert (=> b!218725 (= tp!20790 b_and!12775)))

(declare-fun b!218724 () Bool)

(declare-fun e!142302 () Bool)

(declare-fun call!20417 () Bool)

(assert (=> b!218724 (= e!142302 (not call!20417))))

(declare-fun tp_is_empty!5747 () Bool)

(declare-datatypes ((V!7309 0))(
  ( (V!7310 (val!2918 Int)) )
))
(declare-datatypes ((ValueCell!2530 0))(
  ( (ValueCellFull!2530 (v!4936 V!7309)) (EmptyCell!2530) )
))
(declare-datatypes ((array!10733 0))(
  ( (array!10734 (arr!5088 (Array (_ BitVec 32) ValueCell!2530)) (size!5420 (_ BitVec 32))) )
))
(declare-datatypes ((array!10735 0))(
  ( (array!10736 (arr!5089 (Array (_ BitVec 32) (_ BitVec 64))) (size!5421 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2960 0))(
  ( (LongMapFixedSize!2961 (defaultEntry!4130 Int) (mask!9909 (_ BitVec 32)) (extraKeys!3867 (_ BitVec 32)) (zeroValue!3971 V!7309) (minValue!3971 V!7309) (_size!1529 (_ BitVec 32)) (_keys!6179 array!10735) (_values!4113 array!10733) (_vacant!1529 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2960)

(declare-fun e!142296 () Bool)

(declare-fun e!142297 () Bool)

(declare-fun array_inv!3369 (array!10735) Bool)

(declare-fun array_inv!3370 (array!10733) Bool)

(assert (=> b!218725 (= e!142297 (and tp!20790 tp_is_empty!5747 (array_inv!3369 (_keys!6179 thiss!1504)) (array_inv!3370 (_values!4113 thiss!1504)) e!142296))))

(declare-fun b!218726 () Bool)

(declare-fun res!107229 () Bool)

(declare-fun e!142306 () Bool)

(assert (=> b!218726 (=> (not res!107229) (not e!142306))))

(declare-datatypes ((SeekEntryResult!793 0))(
  ( (MissingZero!793 (index!5342 (_ BitVec 32))) (Found!793 (index!5343 (_ BitVec 32))) (Intermediate!793 (undefined!1605 Bool) (index!5344 (_ BitVec 32)) (x!22857 (_ BitVec 32))) (Undefined!793) (MissingVacant!793 (index!5345 (_ BitVec 32))) )
))
(declare-fun lt!111596 () SeekEntryResult!793)

(assert (=> b!218726 (= res!107229 (= (select (arr!5089 (_keys!6179 thiss!1504)) (index!5342 lt!111596)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218727 () Bool)

(declare-fun e!142300 () Bool)

(declare-fun e!142298 () Bool)

(assert (=> b!218727 (= e!142300 e!142298)))

(declare-fun res!107232 () Bool)

(assert (=> b!218727 (=> (not res!107232) (not e!142298))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218727 (= res!107232 (or (= lt!111596 (MissingZero!793 index!297)) (= lt!111596 (MissingVacant!793 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10735 (_ BitVec 32)) SeekEntryResult!793)

(assert (=> b!218727 (= lt!111596 (seekEntryOrOpen!0 key!932 (_keys!6179 thiss!1504) (mask!9909 thiss!1504)))))

(declare-fun b!218728 () Bool)

(assert (=> b!218728 (= e!142306 (not call!20417))))

(declare-fun bm!20414 () Bool)

(declare-fun arrayContainsKey!0 (array!10735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20414 (= call!20417 (arrayContainsKey!0 (_keys!6179 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218729 () Bool)

(declare-datatypes ((Unit!6521 0))(
  ( (Unit!6522) )
))
(declare-fun e!142305 () Unit!6521)

(declare-fun Unit!6523 () Unit!6521)

(assert (=> b!218729 (= e!142305 Unit!6523)))

(declare-fun lt!111597 () Unit!6521)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!190 (array!10735 array!10733 (_ BitVec 32) (_ BitVec 32) V!7309 V!7309 (_ BitVec 64) Int) Unit!6521)

(assert (=> b!218729 (= lt!111597 (lemmaInListMapThenSeekEntryOrOpenFindsIt!190 (_keys!6179 thiss!1504) (_values!4113 thiss!1504) (mask!9909 thiss!1504) (extraKeys!3867 thiss!1504) (zeroValue!3971 thiss!1504) (minValue!3971 thiss!1504) key!932 (defaultEntry!4130 thiss!1504)))))

(assert (=> b!218729 false))

(declare-fun b!218730 () Bool)

(declare-fun e!142294 () Bool)

(assert (=> b!218730 (= e!142294 e!142302)))

(declare-fun res!107225 () Bool)

(declare-fun call!20418 () Bool)

(assert (=> b!218730 (= res!107225 call!20418)))

(assert (=> b!218730 (=> (not res!107225) (not e!142302))))

(declare-fun mapIsEmpty!9783 () Bool)

(declare-fun mapRes!9783 () Bool)

(assert (=> mapIsEmpty!9783 mapRes!9783))

(declare-fun bm!20415 () Bool)

(declare-fun c!36382 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20415 (= call!20418 (inRange!0 (ite c!36382 (index!5342 lt!111596) (index!5345 lt!111596)) (mask!9909 thiss!1504)))))

(declare-fun b!218731 () Bool)

(declare-fun c!36381 () Bool)

(assert (=> b!218731 (= c!36381 (is-MissingVacant!793 lt!111596))))

(declare-fun e!142303 () Bool)

(assert (=> b!218731 (= e!142303 e!142294)))

(declare-fun b!218732 () Bool)

(assert (=> b!218732 (= e!142294 (is-Undefined!793 lt!111596))))

(declare-fun b!218733 () Bool)

(declare-fun e!142299 () Bool)

(assert (=> b!218733 (= e!142299 (bvsge #b00000000000000000000000000000000 (size!5421 (_keys!6179 thiss!1504))))))

(declare-fun res!107227 () Bool)

(assert (=> start!21736 (=> (not res!107227) (not e!142300))))

(declare-fun valid!1198 (LongMapFixedSize!2960) Bool)

(assert (=> start!21736 (= res!107227 (valid!1198 thiss!1504))))

(assert (=> start!21736 e!142300))

(assert (=> start!21736 e!142297))

(assert (=> start!21736 true))

(declare-fun b!218734 () Bool)

(declare-fun res!107226 () Bool)

(assert (=> b!218734 (=> (not res!107226) (not e!142306))))

(assert (=> b!218734 (= res!107226 call!20418)))

(assert (=> b!218734 (= e!142303 e!142306)))

(declare-fun b!218735 () Bool)

(declare-fun e!142295 () Bool)

(assert (=> b!218735 (= e!142295 tp_is_empty!5747)))

(declare-fun b!218736 () Bool)

(assert (=> b!218736 (= e!142296 (and e!142295 mapRes!9783))))

(declare-fun condMapEmpty!9783 () Bool)

(declare-fun mapDefault!9783 () ValueCell!2530)

