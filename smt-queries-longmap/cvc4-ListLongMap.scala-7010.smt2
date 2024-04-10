; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89056 () Bool)

(assert start!89056)

(declare-fun b!1021091 () Bool)

(declare-fun b_free!20117 () Bool)

(declare-fun b_next!20117 () Bool)

(assert (=> b!1021091 (= b_free!20117 (not b_next!20117))))

(declare-fun tp!71380 () Bool)

(declare-fun b_and!32305 () Bool)

(assert (=> b!1021091 (= tp!71380 b_and!32305)))

(declare-fun b!1021087 () Bool)

(declare-fun e!574957 () Bool)

(declare-fun e!574959 () Bool)

(declare-fun mapRes!37167 () Bool)

(assert (=> b!1021087 (= e!574957 (and e!574959 mapRes!37167))))

(declare-fun condMapEmpty!37167 () Bool)

(declare-datatypes ((V!36655 0))(
  ( (V!36656 (val!11969 Int)) )
))
(declare-datatypes ((array!63714 0))(
  ( (array!63715 (arr!30671 (Array (_ BitVec 32) (_ BitVec 64))) (size!31182 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11215 0))(
  ( (ValueCellFull!11215 (v!14525 V!36655)) (EmptyCell!11215) )
))
(declare-datatypes ((array!63716 0))(
  ( (array!63717 (arr!30672 (Array (_ BitVec 32) ValueCell!11215)) (size!31183 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5024 0))(
  ( (LongMapFixedSize!5025 (defaultEntry!5864 Int) (mask!29425 (_ BitVec 32)) (extraKeys!5596 (_ BitVec 32)) (zeroValue!5700 V!36655) (minValue!5700 V!36655) (_size!2567 (_ BitVec 32)) (_keys!11009 array!63714) (_values!5887 array!63716) (_vacant!2567 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1098 0))(
  ( (Cell!1099 (v!14526 LongMapFixedSize!5024)) )
))
(declare-datatypes ((LongMap!1098 0))(
  ( (LongMap!1099 (underlying!560 Cell!1098)) )
))
(declare-fun thiss!908 () LongMap!1098)

(declare-fun mapDefault!37167 () ValueCell!11215)

