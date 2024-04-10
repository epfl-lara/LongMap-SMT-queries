; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76558 () Bool)

(assert start!76558)

(declare-fun b!897030 () Bool)

(declare-fun b_free!15971 () Bool)

(declare-fun b_next!15971 () Bool)

(assert (=> b!897030 (= b_free!15971 (not b_next!15971))))

(declare-fun tp!55955 () Bool)

(declare-fun b_and!26263 () Bool)

(assert (=> b!897030 (= tp!55955 b_and!26263)))

(declare-fun b!897029 () Bool)

(declare-fun e!501523 () Bool)

(declare-datatypes ((SeekEntryResult!8904 0))(
  ( (MissingZero!8904 (index!37987 (_ BitVec 32))) (Found!8904 (index!37988 (_ BitVec 32))) (Intermediate!8904 (undefined!9716 Bool) (index!37989 (_ BitVec 32)) (x!76403 (_ BitVec 32))) (Undefined!8904) (MissingVacant!8904 (index!37990 (_ BitVec 32))) )
))
(declare-fun lt!405032 () SeekEntryResult!8904)

(declare-datatypes ((array!52620 0))(
  ( (array!52621 (arr!25295 (Array (_ BitVec 32) (_ BitVec 64))) (size!25748 (_ BitVec 32))) )
))
(declare-datatypes ((V!29363 0))(
  ( (V!29364 (val!9200 Int)) )
))
(declare-datatypes ((ValueCell!8668 0))(
  ( (ValueCellFull!8668 (v!11690 V!29363)) (EmptyCell!8668) )
))
(declare-datatypes ((array!52622 0))(
  ( (array!52623 (arr!25296 (Array (_ BitVec 32) ValueCell!8668)) (size!25749 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4352 0))(
  ( (LongMapFixedSize!4353 (defaultEntry!5388 Int) (mask!26056 (_ BitVec 32)) (extraKeys!5094 (_ BitVec 32)) (zeroValue!5198 V!29363) (minValue!5198 V!29363) (_size!2231 (_ BitVec 32)) (_keys!10135 array!52620) (_values!5385 array!52622) (_vacant!2231 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4352)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897029 (= e!501523 (inRange!0 (index!37988 lt!405032) (mask!26056 thiss!1181)))))

(declare-fun e!501530 () Bool)

(declare-fun tp_is_empty!18299 () Bool)

(declare-fun e!501525 () Bool)

(declare-fun array_inv!19852 (array!52620) Bool)

(declare-fun array_inv!19853 (array!52622) Bool)

(assert (=> b!897030 (= e!501530 (and tp!55955 tp_is_empty!18299 (array_inv!19852 (_keys!10135 thiss!1181)) (array_inv!19853 (_values!5385 thiss!1181)) e!501525))))

(declare-fun b!897031 () Bool)

(declare-fun res!606429 () Bool)

(declare-fun e!501527 () Bool)

(assert (=> b!897031 (=> (not res!606429) (not e!501527))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897031 (= res!606429 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897032 () Bool)

(declare-fun e!501526 () Bool)

(assert (=> b!897032 (= e!501526 (or (not (= (size!25749 (_values!5385 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26056 thiss!1181)))) (not (= (size!25748 (_keys!10135 thiss!1181)) (size!25749 (_values!5385 thiss!1181)))) (bvsge (mask!26056 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!897033 () Bool)

(declare-fun e!501528 () Bool)

(assert (=> b!897033 (= e!501527 (not e!501528))))

(declare-fun res!606427 () Bool)

(assert (=> b!897033 (=> res!606427 e!501528)))

(assert (=> b!897033 (= res!606427 (not (is-Found!8904 lt!405032)))))

(assert (=> b!897033 e!501523))

(declare-fun res!606428 () Bool)

(assert (=> b!897033 (=> res!606428 e!501523)))

(assert (=> b!897033 (= res!606428 (not (is-Found!8904 lt!405032)))))

(declare-datatypes ((Unit!30498 0))(
  ( (Unit!30499) )
))
(declare-fun lt!405033 () Unit!30498)

(declare-fun lemmaSeekEntryGivesInRangeIndex!75 (array!52620 array!52622 (_ BitVec 32) (_ BitVec 32) V!29363 V!29363 (_ BitVec 64)) Unit!30498)

(assert (=> b!897033 (= lt!405033 (lemmaSeekEntryGivesInRangeIndex!75 (_keys!10135 thiss!1181) (_values!5385 thiss!1181) (mask!26056 thiss!1181) (extraKeys!5094 thiss!1181) (zeroValue!5198 thiss!1181) (minValue!5198 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52620 (_ BitVec 32)) SeekEntryResult!8904)

(assert (=> b!897033 (= lt!405032 (seekEntry!0 key!785 (_keys!10135 thiss!1181) (mask!26056 thiss!1181)))))

(declare-fun b!897034 () Bool)

(assert (=> b!897034 (= e!501528 e!501526)))

(declare-fun res!606425 () Bool)

(assert (=> b!897034 (=> res!606425 e!501526)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897034 (= res!606425 (not (validMask!0 (mask!26056 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897034 (arrayContainsKey!0 (_keys!10135 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405034 () Unit!30498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52620 (_ BitVec 64) (_ BitVec 32)) Unit!30498)

(assert (=> b!897034 (= lt!405034 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10135 thiss!1181) key!785 (index!37988 lt!405032)))))

(declare-fun b!897035 () Bool)

(declare-fun e!501531 () Bool)

(assert (=> b!897035 (= e!501531 tp_is_empty!18299)))

(declare-fun b!897036 () Bool)

(declare-fun e!501529 () Bool)

(declare-fun mapRes!29077 () Bool)

(assert (=> b!897036 (= e!501525 (and e!501529 mapRes!29077))))

(declare-fun condMapEmpty!29077 () Bool)

(declare-fun mapDefault!29077 () ValueCell!8668)

