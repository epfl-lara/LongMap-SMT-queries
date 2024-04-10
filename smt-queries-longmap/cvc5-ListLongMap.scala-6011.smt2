; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77934 () Bool)

(assert start!77934)

(declare-fun b_free!16477 () Bool)

(declare-fun b_next!16477 () Bool)

(assert (=> start!77934 (= b_free!16477 (not b_next!16477))))

(declare-fun tp!57698 () Bool)

(declare-fun b_and!27047 () Bool)

(assert (=> start!77934 (= tp!57698 b_and!27047)))

(declare-fun mapIsEmpty!30061 () Bool)

(declare-fun mapRes!30061 () Bool)

(assert (=> mapIsEmpty!30061 mapRes!30061))

(declare-fun b!909896 () Bool)

(declare-fun e!510090 () Bool)

(declare-fun tp_is_empty!18895 () Bool)

(assert (=> b!909896 (= e!510090 tp_is_empty!18895)))

(declare-fun b!909897 () Bool)

(declare-fun e!510091 () Bool)

(assert (=> b!909897 (= e!510091 tp_is_empty!18895)))

(declare-fun b!909898 () Bool)

(declare-fun res!614062 () Bool)

(declare-fun e!510089 () Bool)

(assert (=> b!909898 (=> (not res!614062) (not e!510089))))

(declare-datatypes ((array!53812 0))(
  ( (array!53813 (arr!25863 (Array (_ BitVec 32) (_ BitVec 64))) (size!26322 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53812)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53812 (_ BitVec 32)) Bool)

(assert (=> b!909898 (= res!614062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909899 () Bool)

(assert (=> b!909899 (= e!510089 false)))

(declare-datatypes ((V!30159 0))(
  ( (V!30160 (val!9498 Int)) )
))
(declare-datatypes ((ValueCell!8966 0))(
  ( (ValueCellFull!8966 (v!12006 V!30159)) (EmptyCell!8966) )
))
(declare-datatypes ((array!53814 0))(
  ( (array!53815 (arr!25864 (Array (_ BitVec 32) ValueCell!8966)) (size!26323 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53814)

(declare-fun zeroValue!1094 () V!30159)

(declare-fun lt!410120 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30159)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12378 0))(
  ( (tuple2!12379 (_1!6200 (_ BitVec 64)) (_2!6200 V!30159)) )
))
(declare-datatypes ((List!18170 0))(
  ( (Nil!18167) (Cons!18166 (h!19312 tuple2!12378) (t!25753 List!18170)) )
))
(declare-datatypes ((ListLongMap!11075 0))(
  ( (ListLongMap!11076 (toList!5553 List!18170)) )
))
(declare-fun contains!4596 (ListLongMap!11075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2815 (array!53812 array!53814 (_ BitVec 32) (_ BitVec 32) V!30159 V!30159 (_ BitVec 32) Int) ListLongMap!11075)

(assert (=> b!909899 (= lt!410120 (contains!4596 (getCurrentListMap!2815 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909900 () Bool)

(declare-fun e!510092 () Bool)

(assert (=> b!909900 (= e!510092 (and e!510090 mapRes!30061))))

(declare-fun condMapEmpty!30061 () Bool)

(declare-fun mapDefault!30061 () ValueCell!8966)

