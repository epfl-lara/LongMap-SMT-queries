; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90050 () Bool)

(assert start!90050)

(declare-fun b!1031342 () Bool)

(declare-fun b_free!20657 () Bool)

(declare-fun b_next!20657 () Bool)

(assert (=> b!1031342 (= b_free!20657 (not b_next!20657))))

(declare-fun tp!73041 () Bool)

(declare-fun b_and!33081 () Bool)

(assert (=> b!1031342 (= tp!73041 b_and!33081)))

(declare-fun e!582501 () Bool)

(declare-fun tp_is_empty!24377 () Bool)

(declare-fun e!582498 () Bool)

(declare-datatypes ((V!37375 0))(
  ( (V!37376 (val!12239 Int)) )
))
(declare-datatypes ((ValueCell!11485 0))(
  ( (ValueCellFull!11485 (v!14816 V!37375)) (EmptyCell!11485) )
))
(declare-datatypes ((array!64818 0))(
  ( (array!64819 (arr!31211 (Array (_ BitVec 32) (_ BitVec 64))) (size!31728 (_ BitVec 32))) )
))
(declare-datatypes ((array!64820 0))(
  ( (array!64821 (arr!31212 (Array (_ BitVec 32) ValueCell!11485)) (size!31729 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5564 0))(
  ( (LongMapFixedSize!5565 (defaultEntry!6156 Int) (mask!29950 (_ BitVec 32)) (extraKeys!5888 (_ BitVec 32)) (zeroValue!5992 V!37375) (minValue!5992 V!37375) (_size!2837 (_ BitVec 32)) (_keys!11329 array!64818) (_values!6179 array!64820) (_vacant!2837 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5564)

(declare-fun array_inv!24159 (array!64818) Bool)

(declare-fun array_inv!24160 (array!64820) Bool)

(assert (=> b!1031342 (= e!582501 (and tp!73041 tp_is_empty!24377 (array_inv!24159 (_keys!11329 thiss!1427)) (array_inv!24160 (_values!6179 thiss!1427)) e!582498))))

(declare-fun b!1031343 () Bool)

(declare-fun res!689588 () Bool)

(declare-fun e!582500 () Bool)

(assert (=> b!1031343 (=> (not res!689588) (not e!582500))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1031343 (= res!689588 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031344 () Bool)

(declare-fun e!582496 () Bool)

(assert (=> b!1031344 (= e!582500 e!582496)))

(declare-fun res!689594 () Bool)

(assert (=> b!1031344 (=> (not res!689594) (not e!582496))))

(declare-datatypes ((SeekEntryResult!9705 0))(
  ( (MissingZero!9705 (index!41191 (_ BitVec 32))) (Found!9705 (index!41192 (_ BitVec 32))) (Intermediate!9705 (undefined!10517 Bool) (index!41193 (_ BitVec 32)) (x!91831 (_ BitVec 32))) (Undefined!9705) (MissingVacant!9705 (index!41194 (_ BitVec 32))) )
))
(declare-fun lt!455290 () SeekEntryResult!9705)

(assert (=> b!1031344 (= res!689594 (is-Found!9705 lt!455290))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64818 (_ BitVec 32)) SeekEntryResult!9705)

(assert (=> b!1031344 (= lt!455290 (seekEntry!0 key!909 (_keys!11329 thiss!1427) (mask!29950 thiss!1427)))))

(declare-fun b!1031345 () Bool)

(declare-fun e!582494 () Bool)

(declare-fun mapRes!38019 () Bool)

(assert (=> b!1031345 (= e!582498 (and e!582494 mapRes!38019))))

(declare-fun condMapEmpty!38019 () Bool)

(declare-fun mapDefault!38019 () ValueCell!11485)

