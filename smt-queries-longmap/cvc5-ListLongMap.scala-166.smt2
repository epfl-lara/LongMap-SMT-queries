; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3178 () Bool)

(assert start!3178)

(declare-fun b!19344 () Bool)

(declare-fun b_free!673 () Bool)

(declare-fun b_next!673 () Bool)

(assert (=> b!19344 (= b_free!673 (not b_next!673))))

(declare-fun tp!3226 () Bool)

(declare-fun b_and!1333 () Bool)

(assert (=> b!19344 (= tp!3226 b_and!1333)))

(declare-fun b!19337 () Bool)

(declare-fun res!13159 () Bool)

(declare-fun e!12468 () Bool)

(assert (=> b!19337 (=> (not res!13159) (not e!12468))))

(declare-datatypes ((V!1075 0))(
  ( (V!1076 (val!495 Int)) )
))
(declare-datatypes ((ValueCell!269 0))(
  ( (ValueCellFull!269 (v!1506 V!1075)) (EmptyCell!269) )
))
(declare-datatypes ((array!1087 0))(
  ( (array!1088 (arr!521 (Array (_ BitVec 32) ValueCell!269)) (size!613 (_ BitVec 32))) )
))
(declare-datatypes ((array!1089 0))(
  ( (array!1090 (arr!522 (Array (_ BitVec 32) (_ BitVec 64))) (size!614 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!124 0))(
  ( (LongMapFixedSize!125 (defaultEntry!1681 Int) (mask!4628 (_ BitVec 32)) (extraKeys!1591 (_ BitVec 32)) (zeroValue!1615 V!1075) (minValue!1615 V!1075) (_size!95 (_ BitVec 32)) (_keys!3108 array!1089) (_values!1677 array!1087) (_vacant!95 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!124 0))(
  ( (Cell!125 (v!1507 LongMapFixedSize!124)) )
))
(declare-datatypes ((LongMap!124 0))(
  ( (LongMap!125 (underlying!73 Cell!124)) )
))
(declare-fun thiss!938 () LongMap!124)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19337 (= res!13159 (validMask!0 (mask!4628 (v!1507 (underlying!73 thiss!938)))))))

(declare-fun b!19338 () Bool)

(declare-fun e!12465 () Bool)

(declare-fun e!12466 () Bool)

(declare-fun mapRes!857 () Bool)

(assert (=> b!19338 (= e!12465 (and e!12466 mapRes!857))))

(declare-fun condMapEmpty!857 () Bool)

(declare-fun mapDefault!857 () ValueCell!269)

