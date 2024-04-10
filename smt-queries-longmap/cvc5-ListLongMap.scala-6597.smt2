; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83466 () Bool)

(assert start!83466)

(declare-fun b_free!19453 () Bool)

(declare-fun b_next!19453 () Bool)

(assert (=> start!83466 (= b_free!19453 (not b_next!19453))))

(declare-fun tp!67646 () Bool)

(declare-fun b_and!31055 () Bool)

(assert (=> start!83466 (= tp!67646 b_and!31055)))

(declare-fun b!974947 () Bool)

(declare-fun e!549505 () Bool)

(assert (=> b!974947 (= e!549505 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34793 0))(
  ( (V!34794 (val!11229 Int)) )
))
(declare-datatypes ((ValueCell!10697 0))(
  ( (ValueCellFull!10697 (v!13788 V!34793)) (EmptyCell!10697) )
))
(declare-datatypes ((array!60749 0))(
  ( (array!60750 (arr!29238 (Array (_ BitVec 32) ValueCell!10697)) (size!29717 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60749)

(declare-fun zeroValue!1367 () V!34793)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34793)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60751 0))(
  ( (array!60752 (arr!29239 (Array (_ BitVec 32) (_ BitVec 64))) (size!29718 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60751)

(declare-datatypes ((tuple2!14434 0))(
  ( (tuple2!14435 (_1!7228 (_ BitVec 64)) (_2!7228 V!34793)) )
))
(declare-datatypes ((List!20288 0))(
  ( (Nil!20285) (Cons!20284 (h!21446 tuple2!14434) (t!28765 List!20288)) )
))
(declare-datatypes ((ListLongMap!13131 0))(
  ( (ListLongMap!13132 (toList!6581 List!20288)) )
))
(declare-fun lt!432815 () ListLongMap!13131)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun getCurrentListMap!3814 (array!60751 array!60749 (_ BitVec 32) (_ BitVec 32) V!34793 V!34793 (_ BitVec 32) Int) ListLongMap!13131)

(assert (=> b!974947 (= lt!432815 (getCurrentListMap!3814 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974948 () Bool)

(declare-fun e!549504 () Bool)

(declare-fun e!549502 () Bool)

(declare-fun mapRes!35545 () Bool)

(assert (=> b!974948 (= e!549504 (and e!549502 mapRes!35545))))

(declare-fun condMapEmpty!35545 () Bool)

(declare-fun mapDefault!35545 () ValueCell!10697)

