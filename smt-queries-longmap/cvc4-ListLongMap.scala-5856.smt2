; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75670 () Bool)

(assert start!75670)

(declare-fun b!889666 () Bool)

(declare-fun b_free!15641 () Bool)

(declare-fun b_next!15641 () Bool)

(assert (=> b!889666 (= b_free!15641 (not b_next!15641))))

(declare-fun tp!54891 () Bool)

(declare-fun b_and!25881 () Bool)

(assert (=> b!889666 (= tp!54891 b_and!25881)))

(declare-fun b!889660 () Bool)

(declare-fun res!602906 () Bool)

(declare-fun e!495960 () Bool)

(assert (=> b!889660 (=> (not res!602906) (not e!495960))))

(declare-datatypes ((array!51918 0))(
  ( (array!51919 (arr!24965 (Array (_ BitVec 32) (_ BitVec 64))) (size!25409 (_ BitVec 32))) )
))
(declare-datatypes ((V!28923 0))(
  ( (V!28924 (val!9035 Int)) )
))
(declare-datatypes ((ValueCell!8503 0))(
  ( (ValueCellFull!8503 (v!11513 V!28923)) (EmptyCell!8503) )
))
(declare-datatypes ((array!51920 0))(
  ( (array!51921 (arr!24966 (Array (_ BitVec 32) ValueCell!8503)) (size!25410 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4022 0))(
  ( (LongMapFixedSize!4023 (defaultEntry!5208 Int) (mask!25661 (_ BitVec 32)) (extraKeys!4902 (_ BitVec 32)) (zeroValue!5006 V!28923) (minValue!5006 V!28923) (_size!2066 (_ BitVec 32)) (_keys!9891 array!51918) (_values!5193 array!51920) (_vacant!2066 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4022)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51918 (_ BitVec 32)) Bool)

(assert (=> b!889660 (= res!602906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9891 thiss!1181) (mask!25661 thiss!1181)))))

(declare-fun b!889661 () Bool)

(assert (=> b!889661 (= e!495960 false)))

(declare-fun lt!402081 () Bool)

(declare-datatypes ((List!17707 0))(
  ( (Nil!17704) (Cons!17703 (h!18834 (_ BitVec 64)) (t!25006 List!17707)) )
))
(declare-fun arrayNoDuplicates!0 (array!51918 (_ BitVec 32) List!17707) Bool)

(assert (=> b!889661 (= lt!402081 (arrayNoDuplicates!0 (_keys!9891 thiss!1181) #b00000000000000000000000000000000 Nil!17704))))

(declare-fun b!889662 () Bool)

(declare-fun e!495958 () Bool)

(assert (=> b!889662 (= e!495958 e!495960)))

(declare-fun res!602909 () Bool)

(assert (=> b!889662 (=> (not res!602909) (not e!495960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889662 (= res!602909 (validMask!0 (mask!25661 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8778 0))(
  ( (MissingZero!8778 (index!37483 (_ BitVec 32))) (Found!8778 (index!37484 (_ BitVec 32))) (Intermediate!8778 (undefined!9590 Bool) (index!37485 (_ BitVec 32)) (x!75538 (_ BitVec 32))) (Undefined!8778) (MissingVacant!8778 (index!37486 (_ BitVec 32))) )
))
(declare-fun lt!402082 () SeekEntryResult!8778)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51918 (_ BitVec 32)) SeekEntryResult!8778)

(assert (=> b!889662 (= lt!402082 (seekEntry!0 key!785 (_keys!9891 thiss!1181) (mask!25661 thiss!1181)))))

(declare-fun b!889663 () Bool)

(declare-fun res!602905 () Bool)

(assert (=> b!889663 (=> (not res!602905) (not e!495960))))

(assert (=> b!889663 (= res!602905 (and (= (size!25410 (_values!5193 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25661 thiss!1181))) (= (size!25409 (_keys!9891 thiss!1181)) (size!25410 (_values!5193 thiss!1181))) (bvsge (mask!25661 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4902 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4902 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889664 () Bool)

(declare-fun e!495961 () Bool)

(declare-fun e!495957 () Bool)

(declare-fun mapRes!28508 () Bool)

(assert (=> b!889664 (= e!495961 (and e!495957 mapRes!28508))))

(declare-fun condMapEmpty!28508 () Bool)

(declare-fun mapDefault!28508 () ValueCell!8503)

