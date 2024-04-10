; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80254 () Bool)

(assert start!80254)

(declare-fun b!942609 () Bool)

(declare-fun b_free!17953 () Bool)

(declare-fun b_next!17953 () Bool)

(assert (=> b!942609 (= b_free!17953 (not b_next!17953))))

(declare-fun tp!62364 () Bool)

(declare-fun b_and!29365 () Bool)

(assert (=> b!942609 (= tp!62364 b_and!29365)))

(declare-fun b!942607 () Bool)

(declare-fun res!633401 () Bool)

(declare-fun e!529990 () Bool)

(assert (=> b!942607 (=> (not res!633401) (not e!529990))))

(declare-datatypes ((V!32247 0))(
  ( (V!32248 (val!10281 Int)) )
))
(declare-datatypes ((ValueCell!9749 0))(
  ( (ValueCellFull!9749 (v!12812 V!32247)) (EmptyCell!9749) )
))
(declare-datatypes ((array!56888 0))(
  ( (array!56889 (arr!27370 (Array (_ BitVec 32) ValueCell!9749)) (size!27835 (_ BitVec 32))) )
))
(declare-datatypes ((array!56890 0))(
  ( (array!56891 (arr!27371 (Array (_ BitVec 32) (_ BitVec 64))) (size!27836 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4648 0))(
  ( (LongMapFixedSize!4649 (defaultEntry!5615 Int) (mask!27227 (_ BitVec 32)) (extraKeys!5347 (_ BitVec 32)) (zeroValue!5451 V!32247) (minValue!5451 V!32247) (_size!2379 (_ BitVec 32)) (_keys!10489 array!56890) (_values!5638 array!56888) (_vacant!2379 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4648)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56890 (_ BitVec 32)) Bool)

(assert (=> b!942607 (= res!633401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10489 thiss!1141) (mask!27227 thiss!1141)))))

(declare-fun res!633395 () Bool)

(assert (=> start!80254 (=> (not res!633395) (not e!529990))))

(declare-fun valid!1779 (LongMapFixedSize!4648) Bool)

(assert (=> start!80254 (= res!633395 (valid!1779 thiss!1141))))

(assert (=> start!80254 e!529990))

(declare-fun e!529988 () Bool)

(assert (=> start!80254 e!529988))

(assert (=> start!80254 true))

(declare-fun b!942608 () Bool)

(declare-fun e!529987 () Bool)

(declare-fun e!529989 () Bool)

(declare-fun mapRes!32513 () Bool)

(assert (=> b!942608 (= e!529987 (and e!529989 mapRes!32513))))

(declare-fun condMapEmpty!32513 () Bool)

(declare-fun mapDefault!32513 () ValueCell!9749)

