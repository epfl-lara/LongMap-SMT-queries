; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75754 () Bool)

(assert start!75754)

(declare-fun b!890833 () Bool)

(declare-fun b_free!15725 () Bool)

(declare-fun b_next!15725 () Bool)

(assert (=> b!890833 (= b_free!15725 (not b_next!15725))))

(declare-fun tp!55143 () Bool)

(declare-fun b_and!25965 () Bool)

(assert (=> b!890833 (= tp!55143 b_and!25965)))

(declare-fun b!890828 () Bool)

(declare-fun e!496948 () Bool)

(assert (=> b!890828 (= e!496948 true)))

(declare-fun lt!402439 () Bool)

(declare-datatypes ((array!52086 0))(
  ( (array!52087 (arr!25049 (Array (_ BitVec 32) (_ BitVec 64))) (size!25493 (_ BitVec 32))) )
))
(declare-datatypes ((V!29035 0))(
  ( (V!29036 (val!9077 Int)) )
))
(declare-datatypes ((ValueCell!8545 0))(
  ( (ValueCellFull!8545 (v!11555 V!29035)) (EmptyCell!8545) )
))
(declare-datatypes ((array!52088 0))(
  ( (array!52089 (arr!25050 (Array (_ BitVec 32) ValueCell!8545)) (size!25494 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4106 0))(
  ( (LongMapFixedSize!4107 (defaultEntry!5250 Int) (mask!25731 (_ BitVec 32)) (extraKeys!4944 (_ BitVec 32)) (zeroValue!5048 V!29035) (minValue!5048 V!29035) (_size!2108 (_ BitVec 32)) (_keys!9933 array!52086) (_values!5235 array!52088) (_vacant!2108 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4106)

(declare-datatypes ((List!17728 0))(
  ( (Nil!17725) (Cons!17724 (h!18855 (_ BitVec 64)) (t!25027 List!17728)) )
))
(declare-fun arrayNoDuplicates!0 (array!52086 (_ BitVec 32) List!17728) Bool)

(assert (=> b!890828 (= lt!402439 (arrayNoDuplicates!0 (_keys!9933 thiss!1181) #b00000000000000000000000000000000 Nil!17725))))

(declare-fun mapNonEmpty!28634 () Bool)

(declare-fun mapRes!28634 () Bool)

(declare-fun tp!55144 () Bool)

(declare-fun e!496951 () Bool)

(assert (=> mapNonEmpty!28634 (= mapRes!28634 (and tp!55144 e!496951))))

(declare-fun mapRest!28634 () (Array (_ BitVec 32) ValueCell!8545))

(declare-fun mapValue!28634 () ValueCell!8545)

(declare-fun mapKey!28634 () (_ BitVec 32))

(assert (=> mapNonEmpty!28634 (= (arr!25050 (_values!5235 thiss!1181)) (store mapRest!28634 mapKey!28634 mapValue!28634))))

(declare-fun b!890829 () Bool)

(declare-fun e!496945 () Bool)

(declare-datatypes ((SeekEntryResult!8810 0))(
  ( (MissingZero!8810 (index!37611 (_ BitVec 32))) (Found!8810 (index!37612 (_ BitVec 32))) (Intermediate!8810 (undefined!9622 Bool) (index!37613 (_ BitVec 32)) (x!75682 (_ BitVec 32))) (Undefined!8810) (MissingVacant!8810 (index!37614 (_ BitVec 32))) )
))
(declare-fun lt!402441 () SeekEntryResult!8810)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890829 (= e!496945 (inRange!0 (index!37612 lt!402441) (mask!25731 thiss!1181)))))

(declare-fun b!890830 () Bool)

(declare-fun e!496949 () Bool)

(assert (=> b!890830 (= e!496949 e!496948)))

(declare-fun res!603575 () Bool)

(assert (=> b!890830 (=> res!603575 e!496948)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890830 (= res!603575 (not (validMask!0 (mask!25731 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890830 (arrayContainsKey!0 (_keys!9933 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30318 0))(
  ( (Unit!30319) )
))
(declare-fun lt!402440 () Unit!30318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52086 (_ BitVec 64) (_ BitVec 32)) Unit!30318)

(assert (=> b!890830 (= lt!402440 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9933 thiss!1181) key!785 (index!37612 lt!402441)))))

(declare-fun b!890831 () Bool)

(declare-fun res!603570 () Bool)

(assert (=> b!890831 (=> res!603570 e!496948)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52086 (_ BitVec 32)) Bool)

(assert (=> b!890831 (= res!603570 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9933 thiss!1181) (mask!25731 thiss!1181))))))

(declare-fun b!890832 () Bool)

(declare-fun tp_is_empty!18053 () Bool)

(assert (=> b!890832 (= e!496951 tp_is_empty!18053)))

(declare-fun e!496952 () Bool)

(declare-fun e!496950 () Bool)

(declare-fun array_inv!19690 (array!52086) Bool)

(declare-fun array_inv!19691 (array!52088) Bool)

(assert (=> b!890833 (= e!496952 (and tp!55143 tp_is_empty!18053 (array_inv!19690 (_keys!9933 thiss!1181)) (array_inv!19691 (_values!5235 thiss!1181)) e!496950))))

(declare-fun b!890834 () Bool)

(declare-fun res!603569 () Bool)

(assert (=> b!890834 (=> res!603569 e!496948)))

(assert (=> b!890834 (= res!603569 (or (not (= (size!25494 (_values!5235 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25731 thiss!1181)))) (not (= (size!25493 (_keys!9933 thiss!1181)) (size!25494 (_values!5235 thiss!1181)))) (bvslt (mask!25731 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4944 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4944 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun res!603572 () Bool)

(declare-fun e!496947 () Bool)

(assert (=> start!75754 (=> (not res!603572) (not e!496947))))

(declare-fun valid!1594 (LongMapFixedSize!4106) Bool)

(assert (=> start!75754 (= res!603572 (valid!1594 thiss!1181))))

(assert (=> start!75754 e!496947))

(assert (=> start!75754 e!496952))

(assert (=> start!75754 true))

(declare-fun b!890835 () Bool)

(declare-fun e!496946 () Bool)

(assert (=> b!890835 (= e!496946 tp_is_empty!18053)))

(declare-fun b!890836 () Bool)

(assert (=> b!890836 (= e!496950 (and e!496946 mapRes!28634))))

(declare-fun condMapEmpty!28634 () Bool)

(declare-fun mapDefault!28634 () ValueCell!8545)

