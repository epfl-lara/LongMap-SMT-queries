; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8016 () Bool)

(assert start!8016)

(declare-fun b!50354 () Bool)

(declare-fun b_free!1545 () Bool)

(declare-fun b_next!1545 () Bool)

(assert (=> b!50354 (= b_free!1545 (not b_next!1545))))

(declare-fun tp!6694 () Bool)

(declare-fun b_and!2755 () Bool)

(assert (=> b!50354 (= tp!6694 b_and!2755)))

(declare-fun b!50355 () Bool)

(declare-fun b_free!1547 () Bool)

(declare-fun b_next!1547 () Bool)

(assert (=> b!50355 (= b_free!1547 (not b_next!1547))))

(declare-fun tp!6693 () Bool)

(declare-fun b_and!2757 () Bool)

(assert (=> b!50355 (= tp!6693 b_and!2757)))

(declare-fun b!50346 () Bool)

(declare-fun res!28996 () Bool)

(declare-fun e!32527 () Bool)

(assert (=> b!50346 (=> (not res!28996) (not e!32527))))

(declare-datatypes ((V!2565 0))(
  ( (V!2566 (val!1139 Int)) )
))
(declare-datatypes ((array!3289 0))(
  ( (array!3290 (arr!1573 (Array (_ BitVec 32) (_ BitVec 64))) (size!1796 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!751 0))(
  ( (ValueCellFull!751 (v!2164 V!2565)) (EmptyCell!751) )
))
(declare-datatypes ((array!3291 0))(
  ( (array!3292 (arr!1574 (Array (_ BitVec 32) ValueCell!751)) (size!1797 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!410 0))(
  ( (LongMapFixedSize!411 (defaultEntry!1919 Int) (mask!5706 (_ BitVec 32)) (extraKeys!1810 (_ BitVec 32)) (zeroValue!1837 V!2565) (minValue!1837 V!2565) (_size!254 (_ BitVec 32)) (_keys!3527 array!3289) (_values!1902 array!3291) (_vacant!254 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!410)

(declare-datatypes ((Cell!236 0))(
  ( (Cell!237 (v!2165 LongMapFixedSize!410)) )
))
(declare-datatypes ((LongMap!236 0))(
  ( (LongMap!237 (underlying!129 Cell!236)) )
))
(declare-fun thiss!992 () LongMap!236)

(assert (=> b!50346 (= res!28996 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5706 newMap!16)) (_size!254 (v!2165 (underlying!129 thiss!992)))))))

(declare-fun mapIsEmpty!2193 () Bool)

(declare-fun mapRes!2194 () Bool)

(assert (=> mapIsEmpty!2193 mapRes!2194))

(declare-fun b!50347 () Bool)

(declare-fun res!28995 () Bool)

(assert (=> b!50347 (=> (not res!28995) (not e!32527))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50347 (= res!28995 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1796 (_keys!3527 (v!2165 (underlying!129 thiss!992)))))))))

(declare-fun b!50348 () Bool)

(declare-fun e!32531 () Bool)

(declare-fun e!32536 () Bool)

(declare-fun mapRes!2193 () Bool)

(assert (=> b!50348 (= e!32531 (and e!32536 mapRes!2193))))

(declare-fun condMapEmpty!2193 () Bool)

(declare-fun mapDefault!2193 () ValueCell!751)

