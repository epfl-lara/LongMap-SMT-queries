; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3492 () Bool)

(assert start!3492)

(declare-fun b!23094 () Bool)

(declare-fun b_free!757 () Bool)

(declare-fun b_next!757 () Bool)

(assert (=> b!23094 (= b_free!757 (not b_next!757))))

(declare-fun tp!3517 () Bool)

(declare-fun b_and!1479 () Bool)

(assert (=> b!23094 (= tp!3517 b_and!1479)))

(declare-fun b!23091 () Bool)

(declare-fun e!15015 () Bool)

(declare-fun e!15009 () Bool)

(declare-fun mapRes!1022 () Bool)

(assert (=> b!23091 (= e!15015 (and e!15009 mapRes!1022))))

(declare-fun condMapEmpty!1022 () Bool)

(declare-datatypes ((V!1187 0))(
  ( (V!1188 (val!537 Int)) )
))
(declare-datatypes ((ValueCell!311 0))(
  ( (ValueCellFull!311 (v!1601 V!1187)) (EmptyCell!311) )
))
(declare-datatypes ((array!1279 0))(
  ( (array!1280 (arr!605 (Array (_ BitVec 32) ValueCell!311)) (size!701 (_ BitVec 32))) )
))
(declare-datatypes ((array!1281 0))(
  ( (array!1282 (arr!606 (Array (_ BitVec 32) (_ BitVec 64))) (size!702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!208 0))(
  ( (LongMapFixedSize!209 (defaultEntry!1742 Int) (mask!4729 (_ BitVec 32)) (extraKeys!1640 (_ BitVec 32)) (zeroValue!1665 V!1187) (minValue!1665 V!1187) (_size!149 (_ BitVec 32)) (_keys!3163 array!1281) (_values!1728 array!1279) (_vacant!149 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!208 0))(
  ( (Cell!209 (v!1602 LongMapFixedSize!208)) )
))
(declare-datatypes ((LongMap!208 0))(
  ( (LongMap!209 (underlying!115 Cell!208)) )
))
(declare-fun thiss!938 () LongMap!208)

(declare-fun mapDefault!1022 () ValueCell!311)

