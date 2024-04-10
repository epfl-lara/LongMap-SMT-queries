; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89092 () Bool)

(assert start!89092)

(declare-fun b!1021431 () Bool)

(declare-fun b_free!20141 () Bool)

(declare-fun b_next!20141 () Bool)

(assert (=> b!1021431 (= b_free!20141 (not b_next!20141))))

(declare-fun tp!71455 () Bool)

(declare-fun b_and!32339 () Bool)

(assert (=> b!1021431 (= tp!71455 b_and!32339)))

(declare-fun b!1021427 () Bool)

(declare-fun e!575293 () Bool)

(declare-fun tp_is_empty!23861 () Bool)

(assert (=> b!1021427 (= e!575293 tp_is_empty!23861)))

(declare-fun mapNonEmpty!37206 () Bool)

(declare-fun mapRes!37206 () Bool)

(declare-fun tp!71454 () Bool)

(assert (=> mapNonEmpty!37206 (= mapRes!37206 (and tp!71454 e!575293))))

(declare-datatypes ((V!36687 0))(
  ( (V!36688 (val!11981 Int)) )
))
(declare-datatypes ((ValueCell!11227 0))(
  ( (ValueCellFull!11227 (v!14549 V!36687)) (EmptyCell!11227) )
))
(declare-fun mapRest!37206 () (Array (_ BitVec 32) ValueCell!11227))

(declare-datatypes ((array!63764 0))(
  ( (array!63765 (arr!30695 (Array (_ BitVec 32) (_ BitVec 64))) (size!31206 (_ BitVec 32))) )
))
(declare-datatypes ((array!63766 0))(
  ( (array!63767 (arr!30696 (Array (_ BitVec 32) ValueCell!11227)) (size!31207 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5048 0))(
  ( (LongMapFixedSize!5049 (defaultEntry!5876 Int) (mask!29445 (_ BitVec 32)) (extraKeys!5608 (_ BitVec 32)) (zeroValue!5712 V!36687) (minValue!5712 V!36687) (_size!2579 (_ BitVec 32)) (_keys!11021 array!63764) (_values!5899 array!63766) (_vacant!2579 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1122 0))(
  ( (Cell!1123 (v!14550 LongMapFixedSize!5048)) )
))
(declare-datatypes ((LongMap!1122 0))(
  ( (LongMap!1123 (underlying!572 Cell!1122)) )
))
(declare-fun thiss!1120 () LongMap!1122)

(declare-fun mapKey!37206 () (_ BitVec 32))

(declare-fun mapValue!37206 () ValueCell!11227)

(assert (=> mapNonEmpty!37206 (= (arr!30696 (_values!5899 (v!14550 (underlying!572 thiss!1120)))) (store mapRest!37206 mapKey!37206 mapValue!37206))))

(declare-fun b!1021428 () Bool)

(declare-fun e!575296 () Bool)

(declare-fun e!575297 () Bool)

(assert (=> b!1021428 (= e!575296 e!575297)))

(declare-fun res!684377 () Bool)

(declare-fun e!575291 () Bool)

(assert (=> start!89092 (=> (not res!684377) (not e!575291))))

(declare-fun valid!1925 (LongMap!1122) Bool)

(assert (=> start!89092 (= res!684377 (valid!1925 thiss!1120))))

(assert (=> start!89092 e!575291))

(assert (=> start!89092 e!575296))

(declare-fun b!1021429 () Bool)

(declare-fun e!575292 () Bool)

(declare-fun e!575295 () Bool)

(assert (=> b!1021429 (= e!575292 (and e!575295 mapRes!37206))))

(declare-fun condMapEmpty!37206 () Bool)

(declare-fun mapDefault!37206 () ValueCell!11227)

