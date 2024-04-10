; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76234 () Bool)

(assert start!76234)

(declare-fun b!895079 () Bool)

(declare-fun b_free!15895 () Bool)

(declare-fun b_next!15895 () Bool)

(assert (=> b!895079 (= b_free!15895 (not b_next!15895))))

(declare-fun tp!55687 () Bool)

(declare-fun b_and!26187 () Bool)

(assert (=> b!895079 (= tp!55687 b_and!26187)))

(declare-fun b!895073 () Bool)

(declare-fun res!605574 () Bool)

(declare-fun e!500054 () Bool)

(assert (=> b!895073 (=> (not res!605574) (not e!500054))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895073 (= res!605574 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895074 () Bool)

(declare-fun e!500052 () Bool)

(declare-datatypes ((array!52444 0))(
  ( (array!52445 (arr!25219 (Array (_ BitVec 32) (_ BitVec 64))) (size!25667 (_ BitVec 32))) )
))
(declare-datatypes ((V!29263 0))(
  ( (V!29264 (val!9162 Int)) )
))
(declare-datatypes ((ValueCell!8630 0))(
  ( (ValueCellFull!8630 (v!11652 V!29263)) (EmptyCell!8630) )
))
(declare-datatypes ((array!52446 0))(
  ( (array!52447 (arr!25220 (Array (_ BitVec 32) ValueCell!8630)) (size!25668 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4276 0))(
  ( (LongMapFixedSize!4277 (defaultEntry!5350 Int) (mask!25933 (_ BitVec 32)) (extraKeys!5046 (_ BitVec 32)) (zeroValue!5150 V!29263) (minValue!5150 V!29263) (_size!2193 (_ BitVec 32)) (_keys!10057 array!52444) (_values!5337 array!52446) (_vacant!2193 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4276)

(assert (=> b!895074 (= e!500052 (and (= (size!25668 (_values!5337 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25933 thiss!1181))) (= (size!25667 (_keys!10057 thiss!1181)) (size!25668 (_values!5337 thiss!1181))) (bvsge (mask!25933 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5046 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!895075 () Bool)

(declare-fun e!500051 () Bool)

(declare-fun tp_is_empty!18223 () Bool)

(assert (=> b!895075 (= e!500051 tp_is_empty!18223)))

(declare-fun res!605573 () Bool)

(assert (=> start!76234 (=> (not res!605573) (not e!500054))))

(declare-fun valid!1649 (LongMapFixedSize!4276) Bool)

(assert (=> start!76234 (= res!605573 (valid!1649 thiss!1181))))

(assert (=> start!76234 e!500054))

(declare-fun e!500056 () Bool)

(assert (=> start!76234 e!500056))

(assert (=> start!76234 true))

(declare-fun b!895076 () Bool)

(declare-fun e!500055 () Bool)

(assert (=> b!895076 (= e!500055 tp_is_empty!18223)))

(declare-fun b!895077 () Bool)

(assert (=> b!895077 (= e!500054 e!500052)))

(declare-fun res!605572 () Bool)

(assert (=> b!895077 (=> (not res!605572) (not e!500052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895077 (= res!605572 (validMask!0 (mask!25933 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8874 0))(
  ( (MissingZero!8874 (index!37867 (_ BitVec 32))) (Found!8874 (index!37868 (_ BitVec 32))) (Intermediate!8874 (undefined!9686 Bool) (index!37869 (_ BitVec 32)) (x!76136 (_ BitVec 32))) (Undefined!8874) (MissingVacant!8874 (index!37870 (_ BitVec 32))) )
))
(declare-fun lt!404431 () SeekEntryResult!8874)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52444 (_ BitVec 32)) SeekEntryResult!8874)

(assert (=> b!895077 (= lt!404431 (seekEntry!0 key!785 (_keys!10057 thiss!1181) (mask!25933 thiss!1181)))))

(declare-fun mapIsEmpty!28922 () Bool)

(declare-fun mapRes!28922 () Bool)

(assert (=> mapIsEmpty!28922 mapRes!28922))

(declare-fun b!895078 () Bool)

(declare-fun e!500053 () Bool)

(assert (=> b!895078 (= e!500053 (and e!500051 mapRes!28922))))

(declare-fun condMapEmpty!28922 () Bool)

(declare-fun mapDefault!28922 () ValueCell!8630)

