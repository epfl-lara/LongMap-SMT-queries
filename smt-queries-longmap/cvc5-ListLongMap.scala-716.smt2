; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16800 () Bool)

(assert start!16800)

(declare-fun b!169229 () Bool)

(declare-fun b_free!4111 () Bool)

(declare-fun b_next!4111 () Bool)

(assert (=> b!169229 (= b_free!4111 (not b_next!4111))))

(declare-fun tp!14937 () Bool)

(declare-fun b_and!10525 () Bool)

(assert (=> b!169229 (= tp!14937 b_and!10525)))

(declare-fun b!169224 () Bool)

(declare-fun b_free!4113 () Bool)

(declare-fun b_next!4113 () Bool)

(assert (=> b!169224 (= b_free!4113 (not b_next!4113))))

(declare-fun tp!14938 () Bool)

(declare-fun b_and!10527 () Bool)

(assert (=> b!169224 (= tp!14938 b_and!10527)))

(declare-fun e!111449 () Bool)

(declare-fun e!111442 () Bool)

(declare-fun tp_is_empty!3907 () Bool)

(declare-datatypes ((V!4857 0))(
  ( (V!4858 (val!1998 Int)) )
))
(declare-datatypes ((ValueCell!1610 0))(
  ( (ValueCellFull!1610 (v!3863 V!4857)) (EmptyCell!1610) )
))
(declare-datatypes ((array!6911 0))(
  ( (array!6912 (arr!3291 (Array (_ BitVec 32) (_ BitVec 64))) (size!3579 (_ BitVec 32))) )
))
(declare-datatypes ((array!6913 0))(
  ( (array!6914 (arr!3292 (Array (_ BitVec 32) ValueCell!1610)) (size!3580 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2128 0))(
  ( (LongMapFixedSize!2129 (defaultEntry!3506 Int) (mask!8287 (_ BitVec 32)) (extraKeys!3247 (_ BitVec 32)) (zeroValue!3349 V!4857) (minValue!3349 V!4857) (_size!1113 (_ BitVec 32)) (_keys!5331 array!6911) (_values!3489 array!6913) (_vacant!1113 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2128)

(declare-fun array_inv!2115 (array!6911) Bool)

(declare-fun array_inv!2116 (array!6913) Bool)

(assert (=> b!169224 (= e!111449 (and tp!14938 tp_is_empty!3907 (array_inv!2115 (_keys!5331 thiss!1248)) (array_inv!2116 (_values!3489 thiss!1248)) e!111442))))

(declare-fun b!169225 () Bool)

(declare-fun e!111441 () Bool)

(assert (=> b!169225 (= e!111441 tp_is_empty!3907)))

(declare-fun b!169226 () Bool)

(declare-fun e!111443 () Bool)

(declare-fun e!111444 () Bool)

(assert (=> b!169226 (= e!111443 e!111444)))

(declare-fun res!80519 () Bool)

(assert (=> b!169226 (=> (not res!80519) (not e!111444))))

(declare-datatypes ((tuple2!3200 0))(
  ( (tuple2!3201 (_1!1611 Bool) (_2!1611 LongMapFixedSize!2128)) )
))
(declare-fun lt!84867 () tuple2!3200)

(declare-fun valid!920 (LongMapFixedSize!2128) Bool)

(assert (=> b!169226 (= res!80519 (valid!920 (_2!1611 lt!84867)))))

(declare-fun err!51 () tuple2!3200)

(assert (=> b!169226 (= lt!84867 err!51)))

(assert (=> b!169226 true))

(declare-fun e!111438 () Bool)

(assert (=> b!169226 e!111438))

(declare-fun b!169227 () Bool)

(declare-fun e!111446 () Bool)

(assert (=> b!169227 (= e!111446 tp_is_empty!3907)))

(declare-fun mapNonEmpty!6590 () Bool)

(declare-fun mapRes!6591 () Bool)

(declare-fun tp!14940 () Bool)

(declare-fun e!111448 () Bool)

(assert (=> mapNonEmpty!6590 (= mapRes!6591 (and tp!14940 e!111448))))

(declare-fun mapValue!6591 () ValueCell!1610)

(declare-fun mapKey!6591 () (_ BitVec 32))

(declare-fun mapRest!6590 () (Array (_ BitVec 32) ValueCell!1610))

(assert (=> mapNonEmpty!6590 (= (arr!3292 (_values!3489 (_2!1611 err!51))) (store mapRest!6590 mapKey!6591 mapValue!6591))))

(declare-fun mapNonEmpty!6591 () Bool)

(declare-fun mapRes!6590 () Bool)

(declare-fun tp!14939 () Bool)

(assert (=> mapNonEmpty!6591 (= mapRes!6590 (and tp!14939 e!111441))))

(declare-fun mapValue!6590 () ValueCell!1610)

(declare-fun mapKey!6590 () (_ BitVec 32))

(declare-fun mapRest!6591 () (Array (_ BitVec 32) ValueCell!1610))

(assert (=> mapNonEmpty!6591 (= (arr!3292 (_values!3489 thiss!1248)) (store mapRest!6591 mapKey!6590 mapValue!6590))))

(declare-fun b!169228 () Bool)

(declare-fun res!80518 () Bool)

(assert (=> b!169228 (=> (not res!80518) (not e!111444))))

(assert (=> b!169228 (= res!80518 (_1!1611 lt!84867))))

(declare-fun mapIsEmpty!6590 () Bool)

(assert (=> mapIsEmpty!6590 mapRes!6590))

(declare-fun e!111437 () Bool)

(assert (=> b!169229 (= e!111438 (and tp!14937 tp_is_empty!3907 (array_inv!2115 (_keys!5331 (_2!1611 err!51))) (array_inv!2116 (_values!3489 (_2!1611 err!51))) e!111437))))

(declare-fun b!169230 () Bool)

(declare-fun e!111439 () Bool)

(assert (=> b!169230 (= e!111439 tp_is_empty!3907)))

(declare-fun b!169231 () Bool)

(declare-fun e!111445 () Bool)

(assert (=> b!169231 (= e!111445 e!111443)))

(declare-fun res!80520 () Bool)

(assert (=> b!169231 (=> (not res!80520) (not e!111443))))

(declare-datatypes ((SeekEntryResult!520 0))(
  ( (MissingZero!520 (index!4248 (_ BitVec 32))) (Found!520 (index!4249 (_ BitVec 32))) (Intermediate!520 (undefined!1332 Bool) (index!4250 (_ BitVec 32)) (x!18700 (_ BitVec 32))) (Undefined!520) (MissingVacant!520 (index!4251 (_ BitVec 32))) )
))
(declare-fun lt!84868 () SeekEntryResult!520)

(assert (=> b!169231 (= res!80520 (and (not (is-Undefined!520 lt!84868)) (not (is-MissingVacant!520 lt!84868)) (not (is-MissingZero!520 lt!84868)) (not (is-Found!520 lt!84868))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6911 (_ BitVec 32)) SeekEntryResult!520)

(assert (=> b!169231 (= lt!84868 (seekEntryOrOpen!0 key!828 (_keys!5331 thiss!1248) (mask!8287 thiss!1248)))))

(declare-fun mapIsEmpty!6591 () Bool)

(assert (=> mapIsEmpty!6591 mapRes!6591))

(declare-fun b!169232 () Bool)

(assert (=> b!169232 (= e!111444 false)))

(declare-fun lt!84866 () Bool)

(declare-datatypes ((tuple2!3202 0))(
  ( (tuple2!3203 (_1!1612 (_ BitVec 64)) (_2!1612 V!4857)) )
))
(declare-datatypes ((List!2179 0))(
  ( (Nil!2176) (Cons!2175 (h!2792 tuple2!3202) (t!6981 List!2179)) )
))
(declare-datatypes ((ListLongMap!2151 0))(
  ( (ListLongMap!2152 (toList!1091 List!2179)) )
))
(declare-fun contains!1133 (ListLongMap!2151 (_ BitVec 64)) Bool)

(declare-fun map!1816 (LongMapFixedSize!2128) ListLongMap!2151)

(assert (=> b!169232 (= lt!84866 (contains!1133 (map!1816 (_2!1611 lt!84867)) key!828))))

(declare-fun b!169234 () Bool)

(declare-fun res!80517 () Bool)

(assert (=> b!169234 (=> (not res!80517) (not e!111445))))

(assert (=> b!169234 (= res!80517 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169235 () Bool)

(assert (=> b!169235 (= e!111448 tp_is_empty!3907)))

(declare-fun b!169236 () Bool)

(assert (=> b!169236 (= e!111437 (and e!111439 mapRes!6591))))

(declare-fun condMapEmpty!6590 () Bool)

(declare-fun mapDefault!6591 () ValueCell!1610)

