; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75718 () Bool)

(assert start!75718)

(declare-fun b!890242 () Bool)

(declare-fun b_free!15689 () Bool)

(declare-fun b_next!15689 () Bool)

(assert (=> b!890242 (= b_free!15689 (not b_next!15689))))

(declare-fun tp!55036 () Bool)

(declare-fun b_and!25929 () Bool)

(assert (=> b!890242 (= tp!55036 b_and!25929)))

(declare-fun mapNonEmpty!28580 () Bool)

(declare-fun mapRes!28580 () Bool)

(declare-fun tp!55035 () Bool)

(declare-fun e!496466 () Bool)

(assert (=> mapNonEmpty!28580 (= mapRes!28580 (and tp!55035 e!496466))))

(declare-fun mapKey!28580 () (_ BitVec 32))

(declare-datatypes ((V!28987 0))(
  ( (V!28988 (val!9059 Int)) )
))
(declare-datatypes ((ValueCell!8527 0))(
  ( (ValueCellFull!8527 (v!11537 V!28987)) (EmptyCell!8527) )
))
(declare-fun mapRest!28580 () (Array (_ BitVec 32) ValueCell!8527))

(declare-fun mapValue!28580 () ValueCell!8527)

(declare-datatypes ((array!52014 0))(
  ( (array!52015 (arr!25013 (Array (_ BitVec 32) (_ BitVec 64))) (size!25457 (_ BitVec 32))) )
))
(declare-datatypes ((array!52016 0))(
  ( (array!52017 (arr!25014 (Array (_ BitVec 32) ValueCell!8527)) (size!25458 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4070 0))(
  ( (LongMapFixedSize!4071 (defaultEntry!5232 Int) (mask!25701 (_ BitVec 32)) (extraKeys!4926 (_ BitVec 32)) (zeroValue!5030 V!28987) (minValue!5030 V!28987) (_size!2090 (_ BitVec 32)) (_keys!9915 array!52014) (_values!5217 array!52016) (_vacant!2090 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4070)

(assert (=> mapNonEmpty!28580 (= (arr!25014 (_values!5217 thiss!1181)) (store mapRest!28580 mapKey!28580 mapValue!28580))))

(declare-fun res!603195 () Bool)

(declare-fun e!496464 () Bool)

(assert (=> start!75718 (=> (not res!603195) (not e!496464))))

(declare-fun valid!1580 (LongMapFixedSize!4070) Bool)

(assert (=> start!75718 (= res!603195 (valid!1580 thiss!1181))))

(assert (=> start!75718 e!496464))

(declare-fun e!496461 () Bool)

(assert (=> start!75718 e!496461))

(assert (=> start!75718 true))

(declare-fun b!890238 () Bool)

(declare-fun e!496465 () Bool)

(declare-datatypes ((SeekEntryResult!8795 0))(
  ( (MissingZero!8795 (index!37551 (_ BitVec 32))) (Found!8795 (index!37552 (_ BitVec 32))) (Intermediate!8795 (undefined!9607 Bool) (index!37553 (_ BitVec 32)) (x!75619 (_ BitVec 32))) (Undefined!8795) (MissingVacant!8795 (index!37554 (_ BitVec 32))) )
))
(declare-fun lt!402225 () SeekEntryResult!8795)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890238 (= e!496465 (inRange!0 (index!37552 lt!402225) (mask!25701 thiss!1181)))))

(declare-fun b!890239 () Bool)

(declare-fun e!496462 () Bool)

(declare-fun e!496463 () Bool)

(assert (=> b!890239 (= e!496462 (and e!496463 mapRes!28580))))

(declare-fun condMapEmpty!28580 () Bool)

(declare-fun mapDefault!28580 () ValueCell!8527)

