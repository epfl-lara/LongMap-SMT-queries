; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76720 () Bool)

(assert start!76720)

(declare-fun b!897950 () Bool)

(declare-fun b_free!16001 () Bool)

(declare-fun b_next!16001 () Bool)

(assert (=> b!897950 (= b_free!16001 (not b_next!16001))))

(declare-fun tp!56063 () Bool)

(declare-fun b_and!26293 () Bool)

(assert (=> b!897950 (= tp!56063 b_and!26293)))

(declare-fun tp_is_empty!18329 () Bool)

(declare-fun e!502218 () Bool)

(declare-datatypes ((array!52690 0))(
  ( (array!52691 (arr!25325 (Array (_ BitVec 32) (_ BitVec 64))) (size!25780 (_ BitVec 32))) )
))
(declare-datatypes ((V!29403 0))(
  ( (V!29404 (val!9215 Int)) )
))
(declare-datatypes ((ValueCell!8683 0))(
  ( (ValueCellFull!8683 (v!11705 V!29403)) (EmptyCell!8683) )
))
(declare-datatypes ((array!52692 0))(
  ( (array!52693 (arr!25326 (Array (_ BitVec 32) ValueCell!8683)) (size!25781 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4382 0))(
  ( (LongMapFixedSize!4383 (defaultEntry!5403 Int) (mask!26113 (_ BitVec 32)) (extraKeys!5116 (_ BitVec 32)) (zeroValue!5220 V!29403) (minValue!5220 V!29403) (_size!2246 (_ BitVec 32)) (_keys!10170 array!52690) (_values!5407 array!52692) (_vacant!2246 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4382)

(declare-fun e!502221 () Bool)

(declare-fun array_inv!19878 (array!52690) Bool)

(declare-fun array_inv!19879 (array!52692) Bool)

(assert (=> b!897950 (= e!502221 (and tp!56063 tp_is_empty!18329 (array_inv!19878 (_keys!10170 thiss!1181)) (array_inv!19879 (_values!5407 thiss!1181)) e!502218))))

(declare-fun b!897951 () Bool)

(declare-fun e!502220 () Bool)

(declare-fun e!502223 () Bool)

(assert (=> b!897951 (= e!502220 e!502223)))

(declare-fun res!606899 () Bool)

(assert (=> b!897951 (=> res!606899 e!502223)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897951 (= res!606899 (not (validMask!0 (mask!26113 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897951 (arrayContainsKey!0 (_keys!10170 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8918 0))(
  ( (MissingZero!8918 (index!38043 (_ BitVec 32))) (Found!8918 (index!38044 (_ BitVec 32))) (Intermediate!8918 (undefined!9730 Bool) (index!38045 (_ BitVec 32)) (x!76515 (_ BitVec 32))) (Undefined!8918) (MissingVacant!8918 (index!38046 (_ BitVec 32))) )
))
(declare-fun lt!405358 () SeekEntryResult!8918)

(declare-datatypes ((Unit!30526 0))(
  ( (Unit!30527) )
))
(declare-fun lt!405357 () Unit!30526)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52690 (_ BitVec 64) (_ BitVec 32)) Unit!30526)

(assert (=> b!897951 (= lt!405357 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10170 thiss!1181) key!785 (index!38044 lt!405358)))))

(declare-fun res!606900 () Bool)

(declare-fun e!502217 () Bool)

(assert (=> start!76720 (=> (not res!606900) (not e!502217))))

(declare-fun valid!1688 (LongMapFixedSize!4382) Bool)

(assert (=> start!76720 (= res!606900 (valid!1688 thiss!1181))))

(assert (=> start!76720 e!502217))

(assert (=> start!76720 e!502221))

(assert (=> start!76720 true))

(declare-fun b!897952 () Bool)

(assert (=> b!897952 (= e!502223 (and (bvsge (index!38044 lt!405358) #b00000000000000000000000000000000) (bvslt (index!38044 lt!405358) (size!25780 (_keys!10170 thiss!1181)))))))

(declare-fun b!897953 () Bool)

(declare-fun res!606902 () Bool)

(assert (=> b!897953 (=> res!606902 e!502223)))

(assert (=> b!897953 (= res!606902 (or (not (= (size!25781 (_values!5407 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26113 thiss!1181)))) (not (= (size!25780 (_keys!10170 thiss!1181)) (size!25781 (_values!5407 thiss!1181)))) (bvslt (mask!26113 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5116 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5116 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!897954 () Bool)

(declare-fun e!502219 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897954 (= e!502219 (inRange!0 (index!38044 lt!405358) (mask!26113 thiss!1181)))))

(declare-fun b!897955 () Bool)

(declare-fun res!606903 () Bool)

(assert (=> b!897955 (=> res!606903 e!502223)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52690 (_ BitVec 32)) Bool)

(assert (=> b!897955 (= res!606903 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10170 thiss!1181) (mask!26113 thiss!1181))))))

(declare-fun b!897956 () Bool)

(declare-fun e!502215 () Bool)

(declare-fun mapRes!29139 () Bool)

(assert (=> b!897956 (= e!502218 (and e!502215 mapRes!29139))))

(declare-fun condMapEmpty!29139 () Bool)

(declare-fun mapDefault!29139 () ValueCell!8683)

