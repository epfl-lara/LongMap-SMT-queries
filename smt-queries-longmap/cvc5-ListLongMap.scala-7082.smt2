; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89546 () Bool)

(assert start!89546)

(declare-fun b!1027122 () Bool)

(declare-fun b_free!20545 () Bool)

(declare-fun b_next!20545 () Bool)

(assert (=> b!1027122 (= b_free!20545 (not b_next!20545))))

(declare-fun tp!72680 () Bool)

(declare-fun b_and!32791 () Bool)

(assert (=> b!1027122 (= tp!72680 b_and!32791)))

(declare-fun b!1027121 () Bool)

(declare-fun e!579591 () Bool)

(declare-fun tp_is_empty!24265 () Bool)

(assert (=> b!1027121 (= e!579591 tp_is_empty!24265)))

(declare-fun e!579592 () Bool)

(declare-fun e!579594 () Bool)

(declare-datatypes ((V!37227 0))(
  ( (V!37228 (val!12183 Int)) )
))
(declare-datatypes ((ValueCell!11429 0))(
  ( (ValueCellFull!11429 (v!14752 V!37227)) (EmptyCell!11429) )
))
(declare-datatypes ((array!64580 0))(
  ( (array!64581 (arr!31099 (Array (_ BitVec 32) (_ BitVec 64))) (size!31612 (_ BitVec 32))) )
))
(declare-datatypes ((array!64582 0))(
  ( (array!64583 (arr!31100 (Array (_ BitVec 32) ValueCell!11429)) (size!31613 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5452 0))(
  ( (LongMapFixedSize!5453 (defaultEntry!6078 Int) (mask!29788 (_ BitVec 32)) (extraKeys!5810 (_ BitVec 32)) (zeroValue!5914 V!37227) (minValue!5914 V!37227) (_size!2781 (_ BitVec 32)) (_keys!11225 array!64580) (_values!6101 array!64582) (_vacant!2781 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5452)

(declare-fun array_inv!24079 (array!64580) Bool)

(declare-fun array_inv!24080 (array!64582) Bool)

(assert (=> b!1027122 (= e!579594 (and tp!72680 tp_is_empty!24265 (array_inv!24079 (_keys!11225 thiss!1427)) (array_inv!24080 (_values!6101 thiss!1427)) e!579592))))

(declare-fun res!687513 () Bool)

(declare-fun e!579597 () Bool)

(assert (=> start!89546 (=> (not res!687513) (not e!579597))))

(declare-fun valid!2067 (LongMapFixedSize!5452) Bool)

(assert (=> start!89546 (= res!687513 (valid!2067 thiss!1427))))

(assert (=> start!89546 e!579597))

(assert (=> start!89546 e!579594))

(assert (=> start!89546 true))

(declare-fun b!1027123 () Bool)

(declare-fun e!579593 () Bool)

(assert (=> b!1027123 (= e!579593 true)))

(declare-fun lt!452037 () Bool)

(declare-datatypes ((List!21798 0))(
  ( (Nil!21795) (Cons!21794 (h!22992 (_ BitVec 64)) (t!30860 List!21798)) )
))
(declare-fun arrayNoDuplicates!0 (array!64580 (_ BitVec 32) List!21798) Bool)

(assert (=> b!1027123 (= lt!452037 (arrayNoDuplicates!0 (_keys!11225 thiss!1427) #b00000000000000000000000000000000 Nil!21795))))

(declare-fun b!1027124 () Bool)

(declare-fun res!687514 () Bool)

(assert (=> b!1027124 (=> res!687514 e!579593)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64580 (_ BitVec 32)) Bool)

(assert (=> b!1027124 (= res!687514 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11225 thiss!1427) (mask!29788 thiss!1427))))))

(declare-fun b!1027125 () Bool)

(declare-fun e!579596 () Bool)

(assert (=> b!1027125 (= e!579596 tp_is_empty!24265)))

(declare-fun b!1027126 () Bool)

(declare-fun res!687515 () Bool)

(assert (=> b!1027126 (=> (not res!687515) (not e!579597))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027126 (= res!687515 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027127 () Bool)

(declare-fun e!579595 () Bool)

(assert (=> b!1027127 (= e!579597 e!579595)))

(declare-fun res!687518 () Bool)

(assert (=> b!1027127 (=> (not res!687518) (not e!579595))))

(declare-datatypes ((SeekEntryResult!9665 0))(
  ( (MissingZero!9665 (index!41031 (_ BitVec 32))) (Found!9665 (index!41032 (_ BitVec 32))) (Intermediate!9665 (undefined!10477 Bool) (index!41033 (_ BitVec 32)) (x!91391 (_ BitVec 32))) (Undefined!9665) (MissingVacant!9665 (index!41034 (_ BitVec 32))) )
))
(declare-fun lt!452040 () SeekEntryResult!9665)

(assert (=> b!1027127 (= res!687518 (is-Found!9665 lt!452040))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64580 (_ BitVec 32)) SeekEntryResult!9665)

(assert (=> b!1027127 (= lt!452040 (seekEntry!0 key!909 (_keys!11225 thiss!1427) (mask!29788 thiss!1427)))))

(declare-fun b!1027128 () Bool)

(declare-fun mapRes!37826 () Bool)

(assert (=> b!1027128 (= e!579592 (and e!579596 mapRes!37826))))

(declare-fun condMapEmpty!37826 () Bool)

(declare-fun mapDefault!37826 () ValueCell!11429)

