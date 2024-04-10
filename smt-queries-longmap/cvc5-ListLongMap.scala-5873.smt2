; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75768 () Bool)

(assert start!75768)

(declare-fun b!891064 () Bool)

(declare-fun b_free!15739 () Bool)

(declare-fun b_next!15739 () Bool)

(assert (=> b!891064 (= b_free!15739 (not b_next!15739))))

(declare-fun tp!55185 () Bool)

(declare-fun b_and!25979 () Bool)

(assert (=> b!891064 (= tp!55185 b_and!25979)))

(declare-fun b!891059 () Bool)

(declare-fun e!497134 () Bool)

(declare-fun e!497140 () Bool)

(assert (=> b!891059 (= e!497134 (not e!497140))))

(declare-fun res!603717 () Bool)

(assert (=> b!891059 (=> res!603717 e!497140)))

(declare-datatypes ((SeekEntryResult!8815 0))(
  ( (MissingZero!8815 (index!37631 (_ BitVec 32))) (Found!8815 (index!37632 (_ BitVec 32))) (Intermediate!8815 (undefined!9627 Bool) (index!37633 (_ BitVec 32)) (x!75711 (_ BitVec 32))) (Undefined!8815) (MissingVacant!8815 (index!37634 (_ BitVec 32))) )
))
(declare-fun lt!402526 () SeekEntryResult!8815)

(assert (=> b!891059 (= res!603717 (not (is-Found!8815 lt!402526)))))

(declare-fun e!497135 () Bool)

(assert (=> b!891059 e!497135))

(declare-fun res!603721 () Bool)

(assert (=> b!891059 (=> res!603721 e!497135)))

(assert (=> b!891059 (= res!603721 (not (is-Found!8815 lt!402526)))))

(declare-datatypes ((Unit!30326 0))(
  ( (Unit!30327) )
))
(declare-fun lt!402524 () Unit!30326)

(declare-datatypes ((array!52114 0))(
  ( (array!52115 (arr!25063 (Array (_ BitVec 32) (_ BitVec 64))) (size!25507 (_ BitVec 32))) )
))
(declare-datatypes ((V!29055 0))(
  ( (V!29056 (val!9084 Int)) )
))
(declare-datatypes ((ValueCell!8552 0))(
  ( (ValueCellFull!8552 (v!11562 V!29055)) (EmptyCell!8552) )
))
(declare-datatypes ((array!52116 0))(
  ( (array!52117 (arr!25064 (Array (_ BitVec 32) ValueCell!8552)) (size!25508 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4120 0))(
  ( (LongMapFixedSize!4121 (defaultEntry!5257 Int) (mask!25744 (_ BitVec 32)) (extraKeys!4951 (_ BitVec 32)) (zeroValue!5055 V!29055) (minValue!5055 V!29055) (_size!2115 (_ BitVec 32)) (_keys!9940 array!52114) (_values!5242 array!52116) (_vacant!2115 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4120)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!21 (array!52114 array!52116 (_ BitVec 32) (_ BitVec 32) V!29055 V!29055 (_ BitVec 64)) Unit!30326)

(assert (=> b!891059 (= lt!402524 (lemmaSeekEntryGivesInRangeIndex!21 (_keys!9940 thiss!1181) (_values!5242 thiss!1181) (mask!25744 thiss!1181) (extraKeys!4951 thiss!1181) (zeroValue!5055 thiss!1181) (minValue!5055 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52114 (_ BitVec 32)) SeekEntryResult!8815)

(assert (=> b!891059 (= lt!402526 (seekEntry!0 key!785 (_keys!9940 thiss!1181) (mask!25744 thiss!1181)))))

(declare-fun mapIsEmpty!28655 () Bool)

(declare-fun mapRes!28655 () Bool)

(assert (=> mapIsEmpty!28655 mapRes!28655))

(declare-fun b!891060 () Bool)

(declare-fun res!603722 () Bool)

(declare-fun e!497141 () Bool)

(assert (=> b!891060 (=> res!603722 e!497141)))

(assert (=> b!891060 (= res!603722 (or (not (= (size!25508 (_values!5242 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25744 thiss!1181)))) (not (= (size!25507 (_keys!9940 thiss!1181)) (size!25508 (_values!5242 thiss!1181)))) (bvslt (mask!25744 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4951 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4951 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891061 () Bool)

(declare-fun e!497139 () Bool)

(declare-fun e!497142 () Bool)

(assert (=> b!891061 (= e!497139 (and e!497142 mapRes!28655))))

(declare-fun condMapEmpty!28655 () Bool)

(declare-fun mapDefault!28655 () ValueCell!8552)

