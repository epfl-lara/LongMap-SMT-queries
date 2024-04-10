; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90666 () Bool)

(assert start!90666)

(declare-fun b!1036983 () Bool)

(declare-fun b_free!20881 () Bool)

(declare-fun b_next!20881 () Bool)

(assert (=> b!1036983 (= b_free!20881 (not b_next!20881))))

(declare-fun tp!73782 () Bool)

(declare-fun b_and!33413 () Bool)

(assert (=> b!1036983 (= tp!73782 b_and!33413)))

(declare-fun mapIsEmpty!38423 () Bool)

(declare-fun mapRes!38423 () Bool)

(assert (=> mapIsEmpty!38423 mapRes!38423))

(declare-fun res!691999 () Bool)

(declare-fun e!586507 () Bool)

(assert (=> start!90666 (=> (not res!691999) (not e!586507))))

(declare-datatypes ((V!37675 0))(
  ( (V!37676 (val!12351 Int)) )
))
(declare-datatypes ((ValueCell!11597 0))(
  ( (ValueCellFull!11597 (v!14934 V!37675)) (EmptyCell!11597) )
))
(declare-datatypes ((array!65302 0))(
  ( (array!65303 (arr!31435 (Array (_ BitVec 32) (_ BitVec 64))) (size!31964 (_ BitVec 32))) )
))
(declare-datatypes ((array!65304 0))(
  ( (array!65305 (arr!31436 (Array (_ BitVec 32) ValueCell!11597)) (size!31965 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5788 0))(
  ( (LongMapFixedSize!5789 (defaultEntry!6276 Int) (mask!30182 (_ BitVec 32)) (extraKeys!6004 (_ BitVec 32)) (zeroValue!6110 V!37675) (minValue!6110 V!37675) (_size!2949 (_ BitVec 32)) (_keys!11467 array!65302) (_values!6299 array!65304) (_vacant!2949 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5788)

(declare-fun valid!2183 (LongMapFixedSize!5788) Bool)

(assert (=> start!90666 (= res!691999 (valid!2183 thiss!1427))))

(assert (=> start!90666 e!586507))

(declare-fun e!586505 () Bool)

(assert (=> start!90666 e!586505))

(assert (=> start!90666 true))

(declare-fun b!1036976 () Bool)

(declare-fun res!692000 () Bool)

(declare-fun e!586504 () Bool)

(assert (=> b!1036976 (=> res!692000 e!586504)))

(declare-datatypes ((SeekEntryResult!9747 0))(
  ( (MissingZero!9747 (index!41359 (_ BitVec 32))) (Found!9747 (index!41360 (_ BitVec 32))) (Intermediate!9747 (undefined!10559 Bool) (index!41361 (_ BitVec 32)) (x!92489 (_ BitVec 32))) (Undefined!9747) (MissingVacant!9747 (index!41362 (_ BitVec 32))) )
))
(declare-fun lt!457366 () SeekEntryResult!9747)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1036976 (= res!692000 (not (validKeyInArray!0 (select (arr!31435 (_keys!11467 thiss!1427)) (index!41360 lt!457366)))))))

(declare-fun b!1036977 () Bool)

(declare-fun e!586509 () Bool)

(declare-fun tp_is_empty!24601 () Bool)

(assert (=> b!1036977 (= e!586509 tp_is_empty!24601)))

(declare-fun b!1036978 () Bool)

(declare-fun e!586502 () Bool)

(assert (=> b!1036978 (= e!586507 e!586502)))

(declare-fun res!691996 () Bool)

(assert (=> b!1036978 (=> (not res!691996) (not e!586502))))

(assert (=> b!1036978 (= res!691996 (is-Found!9747 lt!457366))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65302 (_ BitVec 32)) SeekEntryResult!9747)

(assert (=> b!1036978 (= lt!457366 (seekEntry!0 key!909 (_keys!11467 thiss!1427) (mask!30182 thiss!1427)))))

(declare-fun b!1036979 () Bool)

(declare-fun e!586508 () Bool)

(assert (=> b!1036979 (= e!586508 tp_is_empty!24601)))

(declare-fun b!1036980 () Bool)

(declare-fun e!586503 () Bool)

(assert (=> b!1036980 (= e!586503 (and e!586509 mapRes!38423))))

(declare-fun condMapEmpty!38423 () Bool)

(declare-fun mapDefault!38423 () ValueCell!11597)

