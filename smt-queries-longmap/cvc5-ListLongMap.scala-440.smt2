; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8252 () Bool)

(assert start!8252)

(declare-fun b!52576 () Bool)

(declare-fun b_free!1669 () Bool)

(declare-fun b_next!1669 () Bool)

(assert (=> b!52576 (= b_free!1669 (not b_next!1669))))

(declare-fun tp!7109 () Bool)

(declare-fun b_and!2879 () Bool)

(assert (=> b!52576 (= tp!7109 b_and!2879)))

(declare-fun b!52562 () Bool)

(declare-fun b_free!1671 () Bool)

(declare-fun b_next!1671 () Bool)

(assert (=> b!52562 (= b_free!1671 (not b_next!1671))))

(declare-fun tp!7110 () Bool)

(declare-fun b_and!2881 () Bool)

(assert (=> b!52562 (= tp!7110 b_and!2881)))

(declare-fun b!52560 () Bool)

(declare-fun res!29854 () Bool)

(declare-fun e!34249 () Bool)

(assert (=> b!52560 (=> (not res!29854) (not e!34249))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2649 0))(
  ( (V!2650 (val!1170 Int)) )
))
(declare-datatypes ((array!3425 0))(
  ( (array!3426 (arr!1635 (Array (_ BitVec 32) (_ BitVec 64))) (size!1864 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!782 0))(
  ( (ValueCellFull!782 (v!2229 V!2649)) (EmptyCell!782) )
))
(declare-datatypes ((array!3427 0))(
  ( (array!3428 (arr!1636 (Array (_ BitVec 32) ValueCell!782)) (size!1865 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!472 0))(
  ( (LongMapFixedSize!473 (defaultEntry!1950 Int) (mask!5777 (_ BitVec 32)) (extraKeys!1841 (_ BitVec 32)) (zeroValue!1868 V!2649) (minValue!1868 V!2649) (_size!285 (_ BitVec 32)) (_keys!3570 array!3425) (_values!1933 array!3427) (_vacant!285 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!294 0))(
  ( (Cell!295 (v!2230 LongMapFixedSize!472)) )
))
(declare-datatypes ((LongMap!294 0))(
  ( (LongMap!295 (underlying!158 Cell!294)) )
))
(declare-fun thiss!992 () LongMap!294)

(assert (=> b!52560 (= res!29854 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1864 (_keys!3570 (v!2230 (underlying!158 thiss!992)))))))))

(declare-fun b!52561 () Bool)

(declare-fun res!29851 () Bool)

(declare-fun e!34248 () Bool)

(assert (=> b!52561 (=> (not res!29851) (not e!34248))))

(assert (=> b!52561 (= res!29851 (and (= (size!1865 (_values!1933 (v!2230 (underlying!158 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5777 (v!2230 (underlying!158 thiss!992))))) (= (size!1864 (_keys!3570 (v!2230 (underlying!158 thiss!992)))) (size!1865 (_values!1933 (v!2230 (underlying!158 thiss!992))))) (bvsge (mask!5777 (v!2230 (underlying!158 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1841 (v!2230 (underlying!158 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1841 (v!2230 (underlying!158 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!2251 () Bool)

(declare-fun e!34255 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!472)

(declare-fun e!34254 () Bool)

(declare-fun array_inv!1009 (array!3425) Bool)

(declare-fun array_inv!1010 (array!3427) Bool)

(assert (=> b!52562 (= e!34254 (and tp!7110 tp_is_empty!2251 (array_inv!1009 (_keys!3570 newMap!16)) (array_inv!1010 (_values!1933 newMap!16)) e!34255))))

(declare-fun res!29856 () Bool)

(assert (=> start!8252 (=> (not res!29856) (not e!34249))))

(declare-fun valid!172 (LongMap!294) Bool)

(assert (=> start!8252 (= res!29856 (valid!172 thiss!992))))

(assert (=> start!8252 e!34249))

(declare-fun e!34250 () Bool)

(assert (=> start!8252 e!34250))

(assert (=> start!8252 true))

(assert (=> start!8252 e!34254))

(declare-fun mapIsEmpty!2423 () Bool)

(declare-fun mapRes!2424 () Bool)

(assert (=> mapIsEmpty!2423 mapRes!2424))

(declare-fun b!52563 () Bool)

(declare-fun e!34257 () Bool)

(declare-fun e!34256 () Bool)

(declare-fun mapRes!2423 () Bool)

(assert (=> b!52563 (= e!34257 (and e!34256 mapRes!2423))))

(declare-fun condMapEmpty!2424 () Bool)

(declare-fun mapDefault!2424 () ValueCell!782)

