; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16056 () Bool)

(assert start!16056)

(declare-fun b!159331 () Bool)

(declare-fun b_free!3517 () Bool)

(declare-fun b_next!3517 () Bool)

(assert (=> b!159331 (= b_free!3517 (not b_next!3517))))

(declare-fun tp!13120 () Bool)

(declare-fun b_and!9931 () Bool)

(assert (=> b!159331 (= tp!13120 b_and!9931)))

(declare-fun b!159330 () Bool)

(declare-fun res!75260 () Bool)

(declare-fun e!104299 () Bool)

(assert (=> b!159330 (=> (not res!75260) (not e!104299))))

(declare-datatypes ((V!4073 0))(
  ( (V!4074 (val!1704 Int)) )
))
(declare-datatypes ((ValueCell!1316 0))(
  ( (ValueCellFull!1316 (v!3569 V!4073)) (EmptyCell!1316) )
))
(declare-datatypes ((array!5717 0))(
  ( (array!5718 (arr!2703 (Array (_ BitVec 32) (_ BitVec 64))) (size!2987 (_ BitVec 32))) )
))
(declare-datatypes ((array!5719 0))(
  ( (array!5720 (arr!2704 (Array (_ BitVec 32) ValueCell!1316)) (size!2988 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1540 0))(
  ( (LongMapFixedSize!1541 (defaultEntry!3212 Int) (mask!7760 (_ BitVec 32)) (extraKeys!2953 (_ BitVec 32)) (zeroValue!3055 V!4073) (minValue!3055 V!4073) (_size!819 (_ BitVec 32)) (_keys!5013 array!5717) (_values!3195 array!5719) (_vacant!819 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1540)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159330 (= res!75260 (validMask!0 (mask!7760 thiss!1248)))))

(declare-fun e!104302 () Bool)

(declare-fun e!104304 () Bool)

(declare-fun tp_is_empty!3319 () Bool)

(declare-fun array_inv!1719 (array!5717) Bool)

(declare-fun array_inv!1720 (array!5719) Bool)

(assert (=> b!159331 (= e!104302 (and tp!13120 tp_is_empty!3319 (array_inv!1719 (_keys!5013 thiss!1248)) (array_inv!1720 (_values!3195 thiss!1248)) e!104304))))

(declare-fun b!159332 () Bool)

(declare-fun res!75263 () Bool)

(assert (=> b!159332 (=> (not res!75263) (not e!104299))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!310 0))(
  ( (MissingZero!310 (index!3408 (_ BitVec 32))) (Found!310 (index!3409 (_ BitVec 32))) (Intermediate!310 (undefined!1122 Bool) (index!3410 (_ BitVec 32)) (x!17598 (_ BitVec 32))) (Undefined!310) (MissingVacant!310 (index!3411 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5717 (_ BitVec 32)) SeekEntryResult!310)

(assert (=> b!159332 (= res!75263 (is-Undefined!310 (seekEntryOrOpen!0 key!828 (_keys!5013 thiss!1248) (mask!7760 thiss!1248))))))

(declare-fun mapNonEmpty!5666 () Bool)

(declare-fun mapRes!5666 () Bool)

(declare-fun tp!13121 () Bool)

(declare-fun e!104303 () Bool)

(assert (=> mapNonEmpty!5666 (= mapRes!5666 (and tp!13121 e!104303))))

(declare-fun mapRest!5666 () (Array (_ BitVec 32) ValueCell!1316))

(declare-fun mapKey!5666 () (_ BitVec 32))

(declare-fun mapValue!5666 () ValueCell!1316)

(assert (=> mapNonEmpty!5666 (= (arr!2704 (_values!3195 thiss!1248)) (store mapRest!5666 mapKey!5666 mapValue!5666))))

(declare-fun b!159333 () Bool)

(assert (=> b!159333 (= e!104299 false)))

(declare-fun lt!81988 () Bool)

(declare-datatypes ((List!1903 0))(
  ( (Nil!1900) (Cons!1899 (h!2512 (_ BitVec 64)) (t!6705 List!1903)) )
))
(declare-fun arrayNoDuplicates!0 (array!5717 (_ BitVec 32) List!1903) Bool)

(assert (=> b!159333 (= lt!81988 (arrayNoDuplicates!0 (_keys!5013 thiss!1248) #b00000000000000000000000000000000 Nil!1900))))

(declare-fun res!75261 () Bool)

(assert (=> start!16056 (=> (not res!75261) (not e!104299))))

(declare-fun valid!721 (LongMapFixedSize!1540) Bool)

(assert (=> start!16056 (= res!75261 (valid!721 thiss!1248))))

(assert (=> start!16056 e!104299))

(assert (=> start!16056 e!104302))

(assert (=> start!16056 true))

(declare-fun b!159334 () Bool)

(declare-fun e!104301 () Bool)

(assert (=> b!159334 (= e!104304 (and e!104301 mapRes!5666))))

(declare-fun condMapEmpty!5666 () Bool)

(declare-fun mapDefault!5666 () ValueCell!1316)

