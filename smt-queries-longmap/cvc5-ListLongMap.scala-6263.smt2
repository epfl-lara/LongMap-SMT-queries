; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80044 () Bool)

(assert start!80044)

(declare-fun b!941137 () Bool)

(declare-fun b_free!17899 () Bool)

(declare-fun b_next!17899 () Bool)

(assert (=> b!941137 (= b_free!17899 (not b_next!17899))))

(declare-fun tp!62171 () Bool)

(declare-fun b_and!29311 () Bool)

(assert (=> b!941137 (= tp!62171 b_and!29311)))

(declare-fun b!941133 () Bool)

(declare-fun res!632755 () Bool)

(declare-fun e!529065 () Bool)

(assert (=> b!941133 (=> (not res!632755) (not e!529065))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32175 0))(
  ( (V!32176 (val!10254 Int)) )
))
(declare-datatypes ((ValueCell!9722 0))(
  ( (ValueCellFull!9722 (v!12785 V!32175)) (EmptyCell!9722) )
))
(declare-datatypes ((array!56762 0))(
  ( (array!56763 (arr!27316 (Array (_ BitVec 32) ValueCell!9722)) (size!27777 (_ BitVec 32))) )
))
(declare-datatypes ((array!56764 0))(
  ( (array!56765 (arr!27317 (Array (_ BitVec 32) (_ BitVec 64))) (size!27778 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4594 0))(
  ( (LongMapFixedSize!4595 (defaultEntry!5588 Int) (mask!27145 (_ BitVec 32)) (extraKeys!5320 (_ BitVec 32)) (zeroValue!5424 V!32175) (minValue!5424 V!32175) (_size!2352 (_ BitVec 32)) (_keys!10438 array!56764) (_values!5611 array!56762) (_vacant!2352 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4594)

(declare-datatypes ((SeekEntryResult!9017 0))(
  ( (MissingZero!9017 (index!38439 (_ BitVec 32))) (Found!9017 (index!38440 (_ BitVec 32))) (Intermediate!9017 (undefined!9829 Bool) (index!38441 (_ BitVec 32)) (x!80742 (_ BitVec 32))) (Undefined!9017) (MissingVacant!9017 (index!38442 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56764 (_ BitVec 32)) SeekEntryResult!9017)

(assert (=> b!941133 (= res!632755 (not (is-Found!9017 (seekEntry!0 key!756 (_keys!10438 thiss!1141) (mask!27145 thiss!1141)))))))

(declare-fun b!941134 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941134 (= e!529065 (not (validMask!0 (mask!27145 thiss!1141))))))

(declare-fun b!941135 () Bool)

(declare-fun e!529069 () Bool)

(declare-fun e!529064 () Bool)

(declare-fun mapRes!32401 () Bool)

(assert (=> b!941135 (= e!529069 (and e!529064 mapRes!32401))))

(declare-fun condMapEmpty!32401 () Bool)

(declare-fun mapDefault!32401 () ValueCell!9722)

