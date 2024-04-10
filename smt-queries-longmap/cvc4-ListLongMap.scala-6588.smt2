; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83416 () Bool)

(assert start!83416)

(declare-fun b_free!19409 () Bool)

(declare-fun b_next!19409 () Bool)

(assert (=> start!83416 (= b_free!19409 (not b_next!19409))))

(declare-fun tp!67506 () Bool)

(declare-fun b_and!31011 () Bool)

(assert (=> start!83416 (= tp!67506 b_and!31011)))

(declare-fun b!974224 () Bool)

(declare-fun e!549121 () Bool)

(assert (=> b!974224 (= e!549121 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34725 0))(
  ( (V!34726 (val!11204 Int)) )
))
(declare-datatypes ((ValueCell!10672 0))(
  ( (ValueCellFull!10672 (v!13763 V!34725)) (EmptyCell!10672) )
))
(declare-datatypes ((array!60655 0))(
  ( (array!60656 (arr!29191 (Array (_ BitVec 32) ValueCell!10672)) (size!29670 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60655)

(declare-fun zeroValue!1367 () V!34725)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34725)

(declare-datatypes ((tuple2!14398 0))(
  ( (tuple2!14399 (_1!7210 (_ BitVec 64)) (_2!7210 V!34725)) )
))
(declare-datatypes ((List!20254 0))(
  ( (Nil!20251) (Cons!20250 (h!21412 tuple2!14398) (t!28731 List!20254)) )
))
(declare-datatypes ((ListLongMap!13095 0))(
  ( (ListLongMap!13096 (toList!6563 List!20254)) )
))
(declare-fun lt!432749 () ListLongMap!13095)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60657 0))(
  ( (array!60658 (arr!29192 (Array (_ BitVec 32) (_ BitVec 64))) (size!29671 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60657)

(declare-fun getCurrentListMap!3796 (array!60657 array!60655 (_ BitVec 32) (_ BitVec 32) V!34725 V!34725 (_ BitVec 32) Int) ListLongMap!13095)

(assert (=> b!974224 (= lt!432749 (getCurrentListMap!3796 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974225 () Bool)

(declare-fun e!549119 () Bool)

(declare-fun e!549118 () Bool)

(declare-fun mapRes!35470 () Bool)

(assert (=> b!974225 (= e!549119 (and e!549118 mapRes!35470))))

(declare-fun condMapEmpty!35470 () Bool)

(declare-fun mapDefault!35470 () ValueCell!10672)

