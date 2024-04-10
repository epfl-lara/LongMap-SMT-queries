; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8012 () Bool)

(assert start!8012)

(declare-fun b!50265 () Bool)

(declare-fun b_free!1537 () Bool)

(declare-fun b_next!1537 () Bool)

(assert (=> b!50265 (= b_free!1537 (not b_next!1537))))

(declare-fun tp!6669 () Bool)

(declare-fun b_and!2747 () Bool)

(assert (=> b!50265 (= tp!6669 b_and!2747)))

(declare-fun b!50257 () Bool)

(declare-fun b_free!1539 () Bool)

(declare-fun b_next!1539 () Bool)

(assert (=> b!50257 (= b_free!1539 (not b_next!1539))))

(declare-fun tp!6668 () Bool)

(declare-fun b_and!2749 () Bool)

(assert (=> b!50257 (= tp!6668 b_and!2749)))

(declare-fun b!50256 () Bool)

(declare-fun e!32457 () Bool)

(declare-fun tp_is_empty!2185 () Bool)

(assert (=> b!50256 (= e!32457 tp_is_empty!2185)))

(declare-fun res!28966 () Bool)

(declare-fun e!32452 () Bool)

(assert (=> start!8012 (=> (not res!28966) (not e!32452))))

(declare-datatypes ((V!2561 0))(
  ( (V!2562 (val!1137 Int)) )
))
(declare-datatypes ((array!3281 0))(
  ( (array!3282 (arr!1569 (Array (_ BitVec 32) (_ BitVec 64))) (size!1792 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!749 0))(
  ( (ValueCellFull!749 (v!2160 V!2561)) (EmptyCell!749) )
))
(declare-datatypes ((array!3283 0))(
  ( (array!3284 (arr!1570 (Array (_ BitVec 32) ValueCell!749)) (size!1793 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!406 0))(
  ( (LongMapFixedSize!407 (defaultEntry!1917 Int) (mask!5704 (_ BitVec 32)) (extraKeys!1808 (_ BitVec 32)) (zeroValue!1835 V!2561) (minValue!1835 V!2561) (_size!252 (_ BitVec 32)) (_keys!3525 array!3281) (_values!1900 array!3283) (_vacant!252 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!232 0))(
  ( (Cell!233 (v!2161 LongMapFixedSize!406)) )
))
(declare-datatypes ((LongMap!232 0))(
  ( (LongMap!233 (underlying!127 Cell!232)) )
))
(declare-fun thiss!992 () LongMap!232)

(declare-fun valid!134 (LongMap!232) Bool)

(assert (=> start!8012 (= res!28966 (valid!134 thiss!992))))

(assert (=> start!8012 e!32452))

(declare-fun e!32449 () Bool)

(assert (=> start!8012 e!32449))

(assert (=> start!8012 true))

(declare-fun e!32455 () Bool)

(assert (=> start!8012 e!32455))

(declare-fun newMap!16 () LongMapFixedSize!406)

(declare-fun e!32461 () Bool)

(declare-fun array_inv!961 (array!3281) Bool)

(declare-fun array_inv!962 (array!3283) Bool)

(assert (=> b!50257 (= e!32455 (and tp!6668 tp_is_empty!2185 (array_inv!961 (_keys!3525 newMap!16)) (array_inv!962 (_values!1900 newMap!16)) e!32461))))

(declare-fun b!50258 () Bool)

(declare-fun e!32453 () Bool)

(declare-fun mapRes!2181 () Bool)

(assert (=> b!50258 (= e!32461 (and e!32453 mapRes!2181))))

(declare-fun condMapEmpty!2182 () Bool)

(declare-fun mapDefault!2182 () ValueCell!749)

