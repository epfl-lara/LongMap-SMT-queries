; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77952 () Bool)

(assert start!77952)

(declare-fun b_free!16495 () Bool)

(declare-fun b_next!16495 () Bool)

(assert (=> start!77952 (= b_free!16495 (not b_next!16495))))

(declare-fun tp!57752 () Bool)

(declare-fun b_and!27065 () Bool)

(assert (=> start!77952 (= tp!57752 b_and!27065)))

(declare-fun b!910085 () Bool)

(declare-fun e!510227 () Bool)

(declare-fun tp_is_empty!18913 () Bool)

(assert (=> b!910085 (= e!510227 tp_is_empty!18913)))

(declare-fun res!614172 () Bool)

(declare-fun e!510226 () Bool)

(assert (=> start!77952 (=> (not res!614172) (not e!510226))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77952 (= res!614172 (validMask!0 mask!1756))))

(assert (=> start!77952 e!510226))

(declare-datatypes ((V!30183 0))(
  ( (V!30184 (val!9507 Int)) )
))
(declare-datatypes ((ValueCell!8975 0))(
  ( (ValueCellFull!8975 (v!12015 V!30183)) (EmptyCell!8975) )
))
(declare-datatypes ((array!53846 0))(
  ( (array!53847 (arr!25880 (Array (_ BitVec 32) ValueCell!8975)) (size!26339 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53846)

(declare-fun e!510224 () Bool)

(declare-fun array_inv!20242 (array!53846) Bool)

(assert (=> start!77952 (and (array_inv!20242 _values!1152) e!510224)))

(assert (=> start!77952 tp!57752))

(assert (=> start!77952 true))

(assert (=> start!77952 tp_is_empty!18913))

(declare-datatypes ((array!53848 0))(
  ( (array!53849 (arr!25881 (Array (_ BitVec 32) (_ BitVec 64))) (size!26340 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53848)

(declare-fun array_inv!20243 (array!53848) Bool)

(assert (=> start!77952 (array_inv!20243 _keys!1386)))

(declare-fun b!910086 () Bool)

(assert (=> b!910086 (= e!510226 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30183)

(declare-fun lt!410147 () Bool)

(declare-fun zeroValue!1094 () V!30183)

(declare-datatypes ((tuple2!12390 0))(
  ( (tuple2!12391 (_1!6206 (_ BitVec 64)) (_2!6206 V!30183)) )
))
(declare-datatypes ((List!18181 0))(
  ( (Nil!18178) (Cons!18177 (h!19323 tuple2!12390) (t!25764 List!18181)) )
))
(declare-datatypes ((ListLongMap!11087 0))(
  ( (ListLongMap!11088 (toList!5559 List!18181)) )
))
(declare-fun contains!4602 (ListLongMap!11087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2821 (array!53848 array!53846 (_ BitVec 32) (_ BitVec 32) V!30183 V!30183 (_ BitVec 32) Int) ListLongMap!11087)

(assert (=> b!910086 (= lt!410147 (contains!4602 (getCurrentListMap!2821 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!910087 () Bool)

(declare-fun e!510225 () Bool)

(assert (=> b!910087 (= e!510225 tp_is_empty!18913)))

(declare-fun mapNonEmpty!30088 () Bool)

(declare-fun mapRes!30088 () Bool)

(declare-fun tp!57753 () Bool)

(assert (=> mapNonEmpty!30088 (= mapRes!30088 (and tp!57753 e!510227))))

(declare-fun mapRest!30088 () (Array (_ BitVec 32) ValueCell!8975))

(declare-fun mapValue!30088 () ValueCell!8975)

(declare-fun mapKey!30088 () (_ BitVec 32))

(assert (=> mapNonEmpty!30088 (= (arr!25880 _values!1152) (store mapRest!30088 mapKey!30088 mapValue!30088))))

(declare-fun b!910088 () Bool)

(assert (=> b!910088 (= e!510224 (and e!510225 mapRes!30088))))

(declare-fun condMapEmpty!30088 () Bool)

(declare-fun mapDefault!30088 () ValueCell!8975)

