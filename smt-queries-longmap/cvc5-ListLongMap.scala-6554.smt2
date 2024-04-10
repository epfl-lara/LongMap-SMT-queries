; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83208 () Bool)

(assert start!83208)

(declare-fun b_free!19201 () Bool)

(declare-fun b_next!19201 () Bool)

(assert (=> start!83208 (= b_free!19201 (not b_next!19201))))

(declare-fun tp!66882 () Bool)

(declare-fun b_and!30689 () Bool)

(assert (=> start!83208 (= tp!66882 b_and!30689)))

(declare-fun b!970819 () Bool)

(declare-fun res!649786 () Bool)

(declare-fun e!547309 () Bool)

(assert (=> b!970819 (=> (not res!649786) (not e!547309))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34449 0))(
  ( (V!34450 (val!11100 Int)) )
))
(declare-datatypes ((ValueCell!10568 0))(
  ( (ValueCellFull!10568 (v!13659 V!34449)) (EmptyCell!10568) )
))
(declare-datatypes ((array!60253 0))(
  ( (array!60254 (arr!28990 (Array (_ BitVec 32) ValueCell!10568)) (size!29469 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60253)

(declare-fun zeroValue!1367 () V!34449)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34449)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60255 0))(
  ( (array!60256 (arr!28991 (Array (_ BitVec 32) (_ BitVec 64))) (size!29470 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60255)

(declare-datatypes ((tuple2!14224 0))(
  ( (tuple2!14225 (_1!7123 (_ BitVec 64)) (_2!7123 V!34449)) )
))
(declare-datatypes ((List!20095 0))(
  ( (Nil!20092) (Cons!20091 (h!21253 tuple2!14224) (t!28458 List!20095)) )
))
(declare-datatypes ((ListLongMap!12921 0))(
  ( (ListLongMap!12922 (toList!6476 List!20095)) )
))
(declare-fun contains!5580 (ListLongMap!12921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3709 (array!60255 array!60253 (_ BitVec 32) (_ BitVec 32) V!34449 V!34449 (_ BitVec 32) Int) ListLongMap!12921)

(assert (=> b!970819 (= res!649786 (contains!5580 (getCurrentListMap!3709 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28991 _keys!1717) i!822)))))

(declare-fun b!970820 () Bool)

(declare-fun res!649783 () Bool)

(assert (=> b!970820 (=> (not res!649783) (not e!547309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970820 (= res!649783 (validKeyInArray!0 (select (arr!28991 _keys!1717) i!822)))))

(declare-fun b!970821 () Bool)

(declare-fun e!547306 () Bool)

(declare-fun e!547308 () Bool)

(declare-fun mapRes!35158 () Bool)

(assert (=> b!970821 (= e!547306 (and e!547308 mapRes!35158))))

(declare-fun condMapEmpty!35158 () Bool)

(declare-fun mapDefault!35158 () ValueCell!10568)

