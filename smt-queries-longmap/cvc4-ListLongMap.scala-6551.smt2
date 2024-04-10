; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83194 () Bool)

(assert start!83194)

(declare-fun b_free!19187 () Bool)

(declare-fun b_next!19187 () Bool)

(assert (=> start!83194 (= b_free!19187 (not b_next!19187))))

(declare-fun tp!66840 () Bool)

(declare-fun b_and!30675 () Bool)

(assert (=> start!83194 (= tp!66840 b_and!30675)))

(declare-fun b!970628 () Bool)

(declare-fun res!649657 () Bool)

(declare-fun e!547203 () Bool)

(assert (=> b!970628 (=> (not res!649657) (not e!547203))))

(declare-datatypes ((array!60225 0))(
  ( (array!60226 (arr!28976 (Array (_ BitVec 32) (_ BitVec 64))) (size!29455 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60225)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970628 (= res!649657 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29455 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29455 _keys!1717))))))

(declare-fun b!970629 () Bool)

(declare-fun res!649656 () Bool)

(assert (=> b!970629 (=> (not res!649656) (not e!547203))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34429 0))(
  ( (V!34430 (val!11093 Int)) )
))
(declare-datatypes ((ValueCell!10561 0))(
  ( (ValueCellFull!10561 (v!13652 V!34429)) (EmptyCell!10561) )
))
(declare-datatypes ((array!60227 0))(
  ( (array!60228 (arr!28977 (Array (_ BitVec 32) ValueCell!10561)) (size!29456 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60227)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970629 (= res!649656 (and (= (size!29456 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29455 _keys!1717) (size!29456 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970630 () Bool)

(declare-fun e!547200 () Bool)

(declare-fun tp_is_empty!22085 () Bool)

(assert (=> b!970630 (= e!547200 tp_is_empty!22085)))

(declare-fun b!970631 () Bool)

(assert (=> b!970631 (= e!547203 false)))

(declare-fun lt!431759 () Bool)

(declare-fun zeroValue!1367 () V!34429)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34429)

(declare-datatypes ((tuple2!14216 0))(
  ( (tuple2!14217 (_1!7119 (_ BitVec 64)) (_2!7119 V!34429)) )
))
(declare-datatypes ((List!20085 0))(
  ( (Nil!20082) (Cons!20081 (h!21243 tuple2!14216) (t!28448 List!20085)) )
))
(declare-datatypes ((ListLongMap!12913 0))(
  ( (ListLongMap!12914 (toList!6472 List!20085)) )
))
(declare-fun contains!5576 (ListLongMap!12913 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3705 (array!60225 array!60227 (_ BitVec 32) (_ BitVec 32) V!34429 V!34429 (_ BitVec 32) Int) ListLongMap!12913)

(assert (=> b!970631 (= lt!431759 (contains!5576 (getCurrentListMap!3705 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28976 _keys!1717) i!822)))))

(declare-fun b!970632 () Bool)

(declare-fun e!547204 () Bool)

(declare-fun mapRes!35137 () Bool)

(assert (=> b!970632 (= e!547204 (and e!547200 mapRes!35137))))

(declare-fun condMapEmpty!35137 () Bool)

(declare-fun mapDefault!35137 () ValueCell!10561)

