; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81508 () Bool)

(assert start!81508)

(declare-fun b!952440 () Bool)

(declare-fun b_free!18289 () Bool)

(declare-fun b_next!18289 () Bool)

(assert (=> b!952440 (= b_free!18289 (not b_next!18289))))

(declare-fun tp!63489 () Bool)

(declare-fun b_and!29769 () Bool)

(assert (=> b!952440 (= tp!63489 b_and!29769)))

(declare-fun b!952437 () Bool)

(declare-fun res!638069 () Bool)

(declare-fun e!536395 () Bool)

(assert (=> b!952437 (=> res!638069 e!536395)))

(declare-datatypes ((V!32695 0))(
  ( (V!32696 (val!10449 Int)) )
))
(declare-datatypes ((ValueCell!9917 0))(
  ( (ValueCellFull!9917 (v!13000 V!32695)) (EmptyCell!9917) )
))
(declare-datatypes ((array!57628 0))(
  ( (array!57629 (arr!27706 (Array (_ BitVec 32) ValueCell!9917)) (size!28185 (_ BitVec 32))) )
))
(declare-datatypes ((array!57630 0))(
  ( (array!57631 (arr!27707 (Array (_ BitVec 32) (_ BitVec 64))) (size!28186 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4984 0))(
  ( (LongMapFixedSize!4985 (defaultEntry!5823 Int) (mask!27671 (_ BitVec 32)) (extraKeys!5555 (_ BitVec 32)) (zeroValue!5659 V!32695) (minValue!5659 V!32695) (_size!2547 (_ BitVec 32)) (_keys!10777 array!57630) (_values!5846 array!57628) (_vacant!2547 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4984)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57630 (_ BitVec 32)) Bool)

(assert (=> b!952437 (= res!638069 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10777 thiss!1141) (mask!27671 thiss!1141))))))

(declare-fun b!952438 () Bool)

(declare-fun res!638068 () Bool)

(declare-fun e!536394 () Bool)

(assert (=> b!952438 (=> (not res!638068) (not e!536394))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9160 0))(
  ( (MissingZero!9160 (index!39011 (_ BitVec 32))) (Found!9160 (index!39012 (_ BitVec 32))) (Intermediate!9160 (undefined!9972 Bool) (index!39013 (_ BitVec 32)) (x!81938 (_ BitVec 32))) (Undefined!9160) (MissingVacant!9160 (index!39014 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57630 (_ BitVec 32)) SeekEntryResult!9160)

(assert (=> b!952438 (= res!638068 (not (is-Found!9160 (seekEntry!0 key!756 (_keys!10777 thiss!1141) (mask!27671 thiss!1141)))))))

(declare-fun res!638065 () Bool)

(assert (=> start!81508 (=> (not res!638065) (not e!536394))))

(declare-fun valid!1897 (LongMapFixedSize!4984) Bool)

(assert (=> start!81508 (= res!638065 (valid!1897 thiss!1141))))

(assert (=> start!81508 e!536394))

(declare-fun e!536397 () Bool)

(assert (=> start!81508 e!536397))

(assert (=> start!81508 true))

(declare-fun b!952439 () Bool)

(declare-fun e!536396 () Bool)

(declare-fun e!536393 () Bool)

(declare-fun mapRes!33133 () Bool)

(assert (=> b!952439 (= e!536396 (and e!536393 mapRes!33133))))

(declare-fun condMapEmpty!33133 () Bool)

(declare-fun mapDefault!33133 () ValueCell!9917)

