; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83518 () Bool)

(assert start!83518)

(declare-fun b_free!19505 () Bool)

(declare-fun b_next!19505 () Bool)

(assert (=> start!83518 (= b_free!19505 (not b_next!19505))))

(declare-fun tp!67803 () Bool)

(declare-fun b_and!31107 () Bool)

(assert (=> start!83518 (= tp!67803 b_and!31107)))

(declare-fun b!975736 () Bool)

(declare-fun e!549901 () Bool)

(declare-fun tp_is_empty!22409 () Bool)

(assert (=> b!975736 (= e!549901 tp_is_empty!22409)))

(declare-fun mapIsEmpty!35623 () Bool)

(declare-fun mapRes!35623 () Bool)

(assert (=> mapIsEmpty!35623 mapRes!35623))

(declare-fun b!975737 () Bool)

(declare-fun res!653192 () Bool)

(declare-fun e!549903 () Bool)

(assert (=> b!975737 (=> (not res!653192) (not e!549903))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34861 0))(
  ( (V!34862 (val!11255 Int)) )
))
(declare-datatypes ((ValueCell!10723 0))(
  ( (ValueCellFull!10723 (v!13814 V!34861)) (EmptyCell!10723) )
))
(declare-datatypes ((array!60849 0))(
  ( (array!60850 (arr!29288 (Array (_ BitVec 32) ValueCell!10723)) (size!29767 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60849)

(declare-fun zeroValue!1367 () V!34861)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34861)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60851 0))(
  ( (array!60852 (arr!29289 (Array (_ BitVec 32) (_ BitVec 64))) (size!29768 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60851)

(declare-datatypes ((tuple2!14476 0))(
  ( (tuple2!14477 (_1!7249 (_ BitVec 64)) (_2!7249 V!34861)) )
))
(declare-datatypes ((List!20329 0))(
  ( (Nil!20326) (Cons!20325 (h!21487 tuple2!14476) (t!28806 List!20329)) )
))
(declare-datatypes ((ListLongMap!13173 0))(
  ( (ListLongMap!13174 (toList!6602 List!20329)) )
))
(declare-fun contains!5683 (ListLongMap!13173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3835 (array!60851 array!60849 (_ BitVec 32) (_ BitVec 32) V!34861 V!34861 (_ BitVec 32) Int) ListLongMap!13173)

(assert (=> b!975737 (= res!653192 (contains!5683 (getCurrentListMap!3835 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29289 _keys!1717) i!822)))))

(declare-fun b!975738 () Bool)

(declare-fun e!549900 () Bool)

(declare-fun e!549902 () Bool)

(assert (=> b!975738 (= e!549900 (and e!549902 mapRes!35623))))

(declare-fun condMapEmpty!35623 () Bool)

(declare-fun mapDefault!35623 () ValueCell!10723)

