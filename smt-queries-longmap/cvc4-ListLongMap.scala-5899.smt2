; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76238 () Bool)

(assert start!76238)

(declare-fun b!895117 () Bool)

(declare-fun b_free!15899 () Bool)

(declare-fun b_next!15899 () Bool)

(assert (=> b!895117 (= b_free!15899 (not b_next!15899))))

(declare-fun tp!55699 () Bool)

(declare-fun b_and!26191 () Bool)

(assert (=> b!895117 (= tp!55699 b_and!26191)))

(declare-fun b!895115 () Bool)

(declare-fun res!605590 () Bool)

(declare-fun e!500093 () Bool)

(assert (=> b!895115 (=> (not res!605590) (not e!500093))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895115 (= res!605590 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895116 () Bool)

(declare-fun e!500094 () Bool)

(assert (=> b!895116 (= e!500093 e!500094)))

(declare-fun res!605592 () Bool)

(assert (=> b!895116 (=> (not res!605592) (not e!500094))))

(declare-datatypes ((array!52452 0))(
  ( (array!52453 (arr!25223 (Array (_ BitVec 32) (_ BitVec 64))) (size!25671 (_ BitVec 32))) )
))
(declare-datatypes ((V!29267 0))(
  ( (V!29268 (val!9164 Int)) )
))
(declare-datatypes ((ValueCell!8632 0))(
  ( (ValueCellFull!8632 (v!11654 V!29267)) (EmptyCell!8632) )
))
(declare-datatypes ((array!52454 0))(
  ( (array!52455 (arr!25224 (Array (_ BitVec 32) ValueCell!8632)) (size!25672 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4280 0))(
  ( (LongMapFixedSize!4281 (defaultEntry!5352 Int) (mask!25935 (_ BitVec 32)) (extraKeys!5048 (_ BitVec 32)) (zeroValue!5152 V!29267) (minValue!5152 V!29267) (_size!2195 (_ BitVec 32)) (_keys!10059 array!52452) (_values!5339 array!52454) (_vacant!2195 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4280)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895116 (= res!605592 (validMask!0 (mask!25935 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8876 0))(
  ( (MissingZero!8876 (index!37875 (_ BitVec 32))) (Found!8876 (index!37876 (_ BitVec 32))) (Intermediate!8876 (undefined!9688 Bool) (index!37877 (_ BitVec 32)) (x!76138 (_ BitVec 32))) (Undefined!8876) (MissingVacant!8876 (index!37878 (_ BitVec 32))) )
))
(declare-fun lt!404437 () SeekEntryResult!8876)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52452 (_ BitVec 32)) SeekEntryResult!8876)

(assert (=> b!895116 (= lt!404437 (seekEntry!0 key!785 (_keys!10059 thiss!1181) (mask!25935 thiss!1181)))))

(declare-fun e!500092 () Bool)

(declare-fun e!500098 () Bool)

(declare-fun tp_is_empty!18227 () Bool)

(declare-fun array_inv!19802 (array!52452) Bool)

(declare-fun array_inv!19803 (array!52454) Bool)

(assert (=> b!895117 (= e!500098 (and tp!55699 tp_is_empty!18227 (array_inv!19802 (_keys!10059 thiss!1181)) (array_inv!19803 (_values!5339 thiss!1181)) e!500092))))

(declare-fun res!605591 () Bool)

(assert (=> start!76238 (=> (not res!605591) (not e!500093))))

(declare-fun valid!1651 (LongMapFixedSize!4280) Bool)

(assert (=> start!76238 (= res!605591 (valid!1651 thiss!1181))))

(assert (=> start!76238 e!500093))

(assert (=> start!76238 e!500098))

(assert (=> start!76238 true))

(declare-fun b!895118 () Bool)

(declare-fun e!500096 () Bool)

(assert (=> b!895118 (= e!500096 tp_is_empty!18227)))

(declare-fun mapIsEmpty!28928 () Bool)

(declare-fun mapRes!28928 () Bool)

(assert (=> mapIsEmpty!28928 mapRes!28928))

(declare-fun b!895119 () Bool)

(declare-fun e!500097 () Bool)

(assert (=> b!895119 (= e!500097 tp_is_empty!18227)))

(declare-fun b!895120 () Bool)

(assert (=> b!895120 (= e!500092 (and e!500096 mapRes!28928))))

(declare-fun condMapEmpty!28928 () Bool)

(declare-fun mapDefault!28928 () ValueCell!8632)

