; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16478 () Bool)

(assert start!16478)

(declare-fun b!163909 () Bool)

(declare-fun b_free!3811 () Bool)

(declare-fun b_next!3811 () Bool)

(assert (=> b!163909 (= b_free!3811 (not b_next!3811))))

(declare-fun tp!14027 () Bool)

(declare-fun b_and!10225 () Bool)

(assert (=> b!163909 (= tp!14027 b_and!10225)))

(declare-fun mapIsEmpty!6132 () Bool)

(declare-fun mapRes!6132 () Bool)

(assert (=> mapIsEmpty!6132 mapRes!6132))

(declare-fun b!163901 () Bool)

(declare-fun e!107543 () Bool)

(declare-fun e!107546 () Bool)

(assert (=> b!163901 (= e!107543 e!107546)))

(declare-fun res!77546 () Bool)

(assert (=> b!163901 (=> (not res!77546) (not e!107546))))

(declare-datatypes ((SeekEntryResult!406 0))(
  ( (MissingZero!406 (index!3792 (_ BitVec 32))) (Found!406 (index!3793 (_ BitVec 32))) (Intermediate!406 (undefined!1218 Bool) (index!3794 (_ BitVec 32)) (x!18178 (_ BitVec 32))) (Undefined!406) (MissingVacant!406 (index!3795 (_ BitVec 32))) )
))
(declare-fun lt!82792 () SeekEntryResult!406)

(assert (=> b!163901 (= res!77546 (and (not (is-Undefined!406 lt!82792)) (not (is-MissingVacant!406 lt!82792)) (not (is-MissingZero!406 lt!82792)) (is-Found!406 lt!82792)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4465 0))(
  ( (V!4466 (val!1851 Int)) )
))
(declare-datatypes ((ValueCell!1463 0))(
  ( (ValueCellFull!1463 (v!3716 V!4465)) (EmptyCell!1463) )
))
(declare-datatypes ((array!6319 0))(
  ( (array!6320 (arr!2997 (Array (_ BitVec 32) (_ BitVec 64))) (size!3285 (_ BitVec 32))) )
))
(declare-datatypes ((array!6321 0))(
  ( (array!6322 (arr!2998 (Array (_ BitVec 32) ValueCell!1463)) (size!3286 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1834 0))(
  ( (LongMapFixedSize!1835 (defaultEntry!3359 Int) (mask!8036 (_ BitVec 32)) (extraKeys!3100 (_ BitVec 32)) (zeroValue!3202 V!4465) (minValue!3202 V!4465) (_size!966 (_ BitVec 32)) (_keys!5180 array!6319) (_values!3342 array!6321) (_vacant!966 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1834)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6319 (_ BitVec 32)) SeekEntryResult!406)

(assert (=> b!163901 (= lt!82792 (seekEntryOrOpen!0 key!828 (_keys!5180 thiss!1248) (mask!8036 thiss!1248)))))

(declare-fun b!163902 () Bool)

(declare-fun e!107544 () Bool)

(declare-fun tp_is_empty!3613 () Bool)

(assert (=> b!163902 (= e!107544 tp_is_empty!3613)))

(declare-fun b!163903 () Bool)

(declare-fun res!77547 () Bool)

(assert (=> b!163903 (=> (not res!77547) (not e!107546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163903 (= res!77547 (validMask!0 (mask!8036 thiss!1248)))))

(declare-fun b!163904 () Bool)

(declare-fun e!107541 () Bool)

(assert (=> b!163904 (= e!107541 tp_is_empty!3613)))

(declare-fun b!163905 () Bool)

(declare-datatypes ((List!1994 0))(
  ( (Nil!1991) (Cons!1990 (h!2607 (_ BitVec 64)) (t!6796 List!1994)) )
))
(declare-fun arrayNoDuplicates!0 (array!6319 (_ BitVec 32) List!1994) Bool)

(assert (=> b!163905 (= e!107546 (not (arrayNoDuplicates!0 (_keys!5180 thiss!1248) #b00000000000000000000000000000000 Nil!1991)))))

(declare-fun mapNonEmpty!6132 () Bool)

(declare-fun tp!14028 () Bool)

(assert (=> mapNonEmpty!6132 (= mapRes!6132 (and tp!14028 e!107541))))

(declare-fun mapRest!6132 () (Array (_ BitVec 32) ValueCell!1463))

(declare-fun mapKey!6132 () (_ BitVec 32))

(declare-fun mapValue!6132 () ValueCell!1463)

(assert (=> mapNonEmpty!6132 (= (arr!2998 (_values!3342 thiss!1248)) (store mapRest!6132 mapKey!6132 mapValue!6132))))

(declare-fun b!163906 () Bool)

(declare-fun e!107540 () Bool)

(assert (=> b!163906 (= e!107540 (and e!107544 mapRes!6132))))

(declare-fun condMapEmpty!6132 () Bool)

(declare-fun mapDefault!6132 () ValueCell!1463)

