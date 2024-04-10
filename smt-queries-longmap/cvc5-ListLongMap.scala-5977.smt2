; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77688 () Bool)

(assert start!77688)

(declare-fun b_free!16273 () Bool)

(declare-fun b_next!16273 () Bool)

(assert (=> start!77688 (= b_free!16273 (not b_next!16273))))

(declare-fun tp!57080 () Bool)

(declare-fun b_and!26699 () Bool)

(assert (=> start!77688 (= tp!57080 b_and!26699)))

(declare-fun b!906107 () Bool)

(declare-fun res!611483 () Bool)

(declare-fun e!507775 () Bool)

(assert (=> b!906107 (=> (not res!611483) (not e!507775))))

(declare-datatypes ((V!29887 0))(
  ( (V!29888 (val!9396 Int)) )
))
(declare-datatypes ((ValueCell!8864 0))(
  ( (ValueCellFull!8864 (v!11901 V!29887)) (EmptyCell!8864) )
))
(declare-datatypes ((array!53424 0))(
  ( (array!53425 (arr!25671 (Array (_ BitVec 32) ValueCell!8864)) (size!26130 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53424)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53426 0))(
  ( (array!53427 (arr!25672 (Array (_ BitVec 32) (_ BitVec 64))) (size!26131 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53426)

(assert (=> b!906107 (= res!611483 (and (= (size!26130 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26131 _keys!1386) (size!26130 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906108 () Bool)

(declare-fun res!611482 () Bool)

(declare-fun e!507776 () Bool)

(assert (=> b!906108 (=> (not res!611482) (not e!507776))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906108 (= res!611482 (inRange!0 i!717 mask!1756))))

(declare-fun b!906109 () Bool)

(assert (=> b!906109 (= e!507775 e!507776)))

(declare-fun res!611486 () Bool)

(assert (=> b!906109 (=> (not res!611486) (not e!507776))))

(declare-datatypes ((tuple2!12226 0))(
  ( (tuple2!12227 (_1!6124 (_ BitVec 64)) (_2!6124 V!29887)) )
))
(declare-datatypes ((List!18034 0))(
  ( (Nil!18031) (Cons!18030 (h!19176 tuple2!12226) (t!25479 List!18034)) )
))
(declare-datatypes ((ListLongMap!10923 0))(
  ( (ListLongMap!10924 (toList!5477 List!18034)) )
))
(declare-fun lt!408798 () ListLongMap!10923)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4522 (ListLongMap!10923 (_ BitVec 64)) Bool)

(assert (=> b!906109 (= res!611486 (contains!4522 lt!408798 k!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29887)

(declare-fun minValue!1094 () V!29887)

(declare-fun getCurrentListMap!2743 (array!53426 array!53424 (_ BitVec 32) (_ BitVec 32) V!29887 V!29887 (_ BitVec 32) Int) ListLongMap!10923)

(assert (=> b!906109 (= lt!408798 (getCurrentListMap!2743 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun res!611480 () Bool)

(assert (=> start!77688 (=> (not res!611480) (not e!507775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77688 (= res!611480 (validMask!0 mask!1756))))

(assert (=> start!77688 e!507775))

(declare-fun e!507771 () Bool)

(declare-fun array_inv!20110 (array!53424) Bool)

(assert (=> start!77688 (and (array_inv!20110 _values!1152) e!507771)))

(assert (=> start!77688 tp!57080))

(assert (=> start!77688 true))

(declare-fun tp_is_empty!18691 () Bool)

(assert (=> start!77688 tp_is_empty!18691))

(declare-fun array_inv!20111 (array!53426) Bool)

(assert (=> start!77688 (array_inv!20111 _keys!1386)))

(declare-fun b!906110 () Bool)

(declare-fun e!507777 () Bool)

(declare-fun mapRes!29749 () Bool)

(assert (=> b!906110 (= e!507771 (and e!507777 mapRes!29749))))

(declare-fun condMapEmpty!29749 () Bool)

(declare-fun mapDefault!29749 () ValueCell!8864)

