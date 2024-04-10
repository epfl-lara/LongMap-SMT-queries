; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83196 () Bool)

(assert start!83196)

(declare-fun b_free!19189 () Bool)

(declare-fun b_next!19189 () Bool)

(assert (=> start!83196 (= b_free!19189 (not b_next!19189))))

(declare-fun tp!66845 () Bool)

(declare-fun b_and!30677 () Bool)

(assert (=> start!83196 (= tp!66845 b_and!30677)))

(declare-fun res!649677 () Bool)

(declare-fun e!547218 () Bool)

(assert (=> start!83196 (=> (not res!649677) (not e!547218))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83196 (= res!649677 (validMask!0 mask!2147))))

(assert (=> start!83196 e!547218))

(assert (=> start!83196 true))

(declare-datatypes ((V!34433 0))(
  ( (V!34434 (val!11094 Int)) )
))
(declare-datatypes ((ValueCell!10562 0))(
  ( (ValueCellFull!10562 (v!13653 V!34433)) (EmptyCell!10562) )
))
(declare-datatypes ((array!60229 0))(
  ( (array!60230 (arr!28978 (Array (_ BitVec 32) ValueCell!10562)) (size!29457 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60229)

(declare-fun e!547216 () Bool)

(declare-fun array_inv!22429 (array!60229) Bool)

(assert (=> start!83196 (and (array_inv!22429 _values!1425) e!547216)))

(declare-fun tp_is_empty!22087 () Bool)

(assert (=> start!83196 tp_is_empty!22087))

(assert (=> start!83196 tp!66845))

(declare-datatypes ((array!60231 0))(
  ( (array!60232 (arr!28979 (Array (_ BitVec 32) (_ BitVec 64))) (size!29458 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60231)

(declare-fun array_inv!22430 (array!60231) Bool)

(assert (=> start!83196 (array_inv!22430 _keys!1717)))

(declare-fun mapIsEmpty!35140 () Bool)

(declare-fun mapRes!35140 () Bool)

(assert (=> mapIsEmpty!35140 mapRes!35140))

(declare-fun b!970655 () Bool)

(declare-fun res!649672 () Bool)

(assert (=> b!970655 (=> (not res!649672) (not e!547218))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970655 (= res!649672 (and (= (size!29457 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29458 _keys!1717) (size!29457 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970656 () Bool)

(declare-fun e!547217 () Bool)

(assert (=> b!970656 (= e!547217 tp_is_empty!22087)))

(declare-fun b!970657 () Bool)

(declare-fun res!649676 () Bool)

(assert (=> b!970657 (=> (not res!649676) (not e!547218))))

(declare-datatypes ((List!20086 0))(
  ( (Nil!20083) (Cons!20082 (h!21244 (_ BitVec 64)) (t!28449 List!20086)) )
))
(declare-fun arrayNoDuplicates!0 (array!60231 (_ BitVec 32) List!20086) Bool)

(assert (=> b!970657 (= res!649676 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20083))))

(declare-fun b!970658 () Bool)

(assert (=> b!970658 (= e!547218 false)))

(declare-fun zeroValue!1367 () V!34433)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34433)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun lt!431762 () Bool)

(declare-datatypes ((tuple2!14218 0))(
  ( (tuple2!14219 (_1!7120 (_ BitVec 64)) (_2!7120 V!34433)) )
))
(declare-datatypes ((List!20087 0))(
  ( (Nil!20084) (Cons!20083 (h!21245 tuple2!14218) (t!28450 List!20087)) )
))
(declare-datatypes ((ListLongMap!12915 0))(
  ( (ListLongMap!12916 (toList!6473 List!20087)) )
))
(declare-fun contains!5577 (ListLongMap!12915 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3706 (array!60231 array!60229 (_ BitVec 32) (_ BitVec 32) V!34433 V!34433 (_ BitVec 32) Int) ListLongMap!12915)

(assert (=> b!970658 (= lt!431762 (contains!5577 (getCurrentListMap!3706 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28979 _keys!1717) i!822)))))

(declare-fun b!970659 () Bool)

(assert (=> b!970659 (= e!547216 (and e!547217 mapRes!35140))))

(declare-fun condMapEmpty!35140 () Bool)

(declare-fun mapDefault!35140 () ValueCell!10562)

