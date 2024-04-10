; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83158 () Bool)

(assert start!83158)

(declare-fun b_free!19151 () Bool)

(declare-fun b_next!19151 () Bool)

(assert (=> start!83158 (= b_free!19151 (not b_next!19151))))

(declare-fun tp!66731 () Bool)

(declare-fun b_and!30639 () Bool)

(assert (=> start!83158 (= tp!66731 b_and!30639)))

(declare-fun res!649333 () Bool)

(declare-fun e!546933 () Bool)

(assert (=> start!83158 (=> (not res!649333) (not e!546933))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83158 (= res!649333 (validMask!0 mask!2147))))

(assert (=> start!83158 e!546933))

(assert (=> start!83158 true))

(declare-datatypes ((V!34381 0))(
  ( (V!34382 (val!11075 Int)) )
))
(declare-datatypes ((ValueCell!10543 0))(
  ( (ValueCellFull!10543 (v!13634 V!34381)) (EmptyCell!10543) )
))
(declare-datatypes ((array!60157 0))(
  ( (array!60158 (arr!28942 (Array (_ BitVec 32) ValueCell!10543)) (size!29421 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60157)

(declare-fun e!546930 () Bool)

(declare-fun array_inv!22403 (array!60157) Bool)

(assert (=> start!83158 (and (array_inv!22403 _values!1425) e!546930)))

(declare-fun tp_is_empty!22049 () Bool)

(assert (=> start!83158 tp_is_empty!22049))

(assert (=> start!83158 tp!66731))

(declare-datatypes ((array!60159 0))(
  ( (array!60160 (arr!28943 (Array (_ BitVec 32) (_ BitVec 64))) (size!29422 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60159)

(declare-fun array_inv!22404 (array!60159) Bool)

(assert (=> start!83158 (array_inv!22404 _keys!1717)))

(declare-fun b!970141 () Bool)

(declare-fun res!649332 () Bool)

(assert (=> b!970141 (=> (not res!649332) (not e!546933))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970141 (= res!649332 (validKeyInArray!0 (select (arr!28943 _keys!1717) i!822)))))

(declare-fun b!970142 () Bool)

(declare-fun res!649331 () Bool)

(assert (=> b!970142 (=> (not res!649331) (not e!546933))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970142 (= res!649331 (and (= (size!29421 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29422 _keys!1717) (size!29421 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970143 () Bool)

(declare-fun res!649335 () Bool)

(assert (=> b!970143 (=> (not res!649335) (not e!546933))))

(declare-datatypes ((List!20059 0))(
  ( (Nil!20056) (Cons!20055 (h!21217 (_ BitVec 64)) (t!28422 List!20059)) )
))
(declare-fun arrayNoDuplicates!0 (array!60159 (_ BitVec 32) List!20059) Bool)

(assert (=> b!970143 (= res!649335 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20056))))

(declare-fun mapNonEmpty!35083 () Bool)

(declare-fun mapRes!35083 () Bool)

(declare-fun tp!66732 () Bool)

(declare-fun e!546932 () Bool)

(assert (=> mapNonEmpty!35083 (= mapRes!35083 (and tp!66732 e!546932))))

(declare-fun mapKey!35083 () (_ BitVec 32))

(declare-fun mapValue!35083 () ValueCell!10543)

(declare-fun mapRest!35083 () (Array (_ BitVec 32) ValueCell!10543))

(assert (=> mapNonEmpty!35083 (= (arr!28942 _values!1425) (store mapRest!35083 mapKey!35083 mapValue!35083))))

(declare-fun b!970144 () Bool)

(declare-fun res!649334 () Bool)

(assert (=> b!970144 (=> (not res!649334) (not e!546933))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!970144 (= res!649334 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29422 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29422 _keys!1717))))))

(declare-fun b!970145 () Bool)

(assert (=> b!970145 (= e!546932 tp_is_empty!22049)))

(declare-fun mapIsEmpty!35083 () Bool)

(assert (=> mapIsEmpty!35083 mapRes!35083))

(declare-fun b!970146 () Bool)

(declare-fun res!649330 () Bool)

(assert (=> b!970146 (=> (not res!649330) (not e!546933))))

(declare-fun zeroValue!1367 () V!34381)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34381)

(declare-datatypes ((tuple2!14188 0))(
  ( (tuple2!14189 (_1!7105 (_ BitVec 64)) (_2!7105 V!34381)) )
))
(declare-datatypes ((List!20060 0))(
  ( (Nil!20057) (Cons!20056 (h!21218 tuple2!14188) (t!28423 List!20060)) )
))
(declare-datatypes ((ListLongMap!12885 0))(
  ( (ListLongMap!12886 (toList!6458 List!20060)) )
))
(declare-fun contains!5562 (ListLongMap!12885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3691 (array!60159 array!60157 (_ BitVec 32) (_ BitVec 32) V!34381 V!34381 (_ BitVec 32) Int) ListLongMap!12885)

(assert (=> b!970146 (= res!649330 (contains!5562 (getCurrentListMap!3691 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28943 _keys!1717) i!822)))))

(declare-fun b!970147 () Bool)

(assert (=> b!970147 (= e!546933 (or (bvslt from!2118 #b00000000000000000000000000000000) (bvsgt from!2118 (size!29422 _keys!1717))))))

(declare-fun b!970148 () Bool)

(declare-fun e!546934 () Bool)

(assert (=> b!970148 (= e!546930 (and e!546934 mapRes!35083))))

(declare-fun condMapEmpty!35083 () Bool)

(declare-fun mapDefault!35083 () ValueCell!10543)

