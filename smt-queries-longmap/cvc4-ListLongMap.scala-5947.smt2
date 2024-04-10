; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77512 () Bool)

(assert start!77512)

(declare-fun b_free!16097 () Bool)

(declare-fun b_next!16097 () Bool)

(assert (=> start!77512 (= b_free!16097 (not b_next!16097))))

(declare-fun tp!56553 () Bool)

(declare-fun b_and!26463 () Bool)

(assert (=> start!77512 (= tp!56553 b_and!26463)))

(declare-fun b!903152 () Bool)

(declare-fun res!609378 () Bool)

(declare-fun e!505980 () Bool)

(assert (=> b!903152 (=> (not res!609378) (not e!505980))))

(declare-datatypes ((array!53090 0))(
  ( (array!53091 (arr!25504 (Array (_ BitVec 32) (_ BitVec 64))) (size!25963 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53090)

(declare-datatypes ((List!17907 0))(
  ( (Nil!17904) (Cons!17903 (h!19049 (_ BitVec 64)) (t!25290 List!17907)) )
))
(declare-fun arrayNoDuplicates!0 (array!53090 (_ BitVec 32) List!17907) Bool)

(assert (=> b!903152 (= res!609378 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17904))))

(declare-fun mapNonEmpty!29485 () Bool)

(declare-fun mapRes!29485 () Bool)

(declare-fun tp!56552 () Bool)

(declare-fun e!505978 () Bool)

(assert (=> mapNonEmpty!29485 (= mapRes!29485 (and tp!56552 e!505978))))

(declare-datatypes ((V!29651 0))(
  ( (V!29652 (val!9308 Int)) )
))
(declare-datatypes ((ValueCell!8776 0))(
  ( (ValueCellFull!8776 (v!11813 V!29651)) (EmptyCell!8776) )
))
(declare-datatypes ((array!53092 0))(
  ( (array!53093 (arr!25505 (Array (_ BitVec 32) ValueCell!8776)) (size!25964 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53092)

(declare-fun mapKey!29485 () (_ BitVec 32))

(declare-fun mapRest!29485 () (Array (_ BitVec 32) ValueCell!8776))

(declare-fun mapValue!29485 () ValueCell!8776)

(assert (=> mapNonEmpty!29485 (= (arr!25505 _values!1152) (store mapRest!29485 mapKey!29485 mapValue!29485))))

(declare-fun b!903153 () Bool)

(declare-fun res!609377 () Bool)

(assert (=> b!903153 (=> (not res!609377) (not e!505980))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!903153 (= res!609377 (and (= (size!25964 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25963 _keys!1386) (size!25964 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903154 () Bool)

(assert (=> b!903154 (= e!505980 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29651)

(declare-fun lt!407967 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29651)

(declare-datatypes ((tuple2!12086 0))(
  ( (tuple2!12087 (_1!6054 (_ BitVec 64)) (_2!6054 V!29651)) )
))
(declare-datatypes ((List!17908 0))(
  ( (Nil!17905) (Cons!17904 (h!19050 tuple2!12086) (t!25291 List!17908)) )
))
(declare-datatypes ((ListLongMap!10783 0))(
  ( (ListLongMap!10784 (toList!5407 List!17908)) )
))
(declare-fun contains!4455 (ListLongMap!10783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2676 (array!53090 array!53092 (_ BitVec 32) (_ BitVec 32) V!29651 V!29651 (_ BitVec 32) Int) ListLongMap!10783)

(assert (=> b!903154 (= lt!407967 (contains!4455 (getCurrentListMap!2676 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903155 () Bool)

(declare-fun tp_is_empty!18515 () Bool)

(assert (=> b!903155 (= e!505978 tp_is_empty!18515)))

(declare-fun res!609379 () Bool)

(assert (=> start!77512 (=> (not res!609379) (not e!505980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77512 (= res!609379 (validMask!0 mask!1756))))

(assert (=> start!77512 e!505980))

(declare-fun e!505977 () Bool)

(declare-fun array_inv!19994 (array!53092) Bool)

(assert (=> start!77512 (and (array_inv!19994 _values!1152) e!505977)))

(assert (=> start!77512 tp!56553))

(assert (=> start!77512 true))

(assert (=> start!77512 tp_is_empty!18515))

(declare-fun array_inv!19995 (array!53090) Bool)

(assert (=> start!77512 (array_inv!19995 _keys!1386)))

(declare-fun mapIsEmpty!29485 () Bool)

(assert (=> mapIsEmpty!29485 mapRes!29485))

(declare-fun b!903156 () Bool)

(declare-fun res!609380 () Bool)

(assert (=> b!903156 (=> (not res!609380) (not e!505980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53090 (_ BitVec 32)) Bool)

(assert (=> b!903156 (= res!609380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903157 () Bool)

(declare-fun e!505979 () Bool)

(assert (=> b!903157 (= e!505979 tp_is_empty!18515)))

(declare-fun b!903158 () Bool)

(assert (=> b!903158 (= e!505977 (and e!505979 mapRes!29485))))

(declare-fun condMapEmpty!29485 () Bool)

(declare-fun mapDefault!29485 () ValueCell!8776)

