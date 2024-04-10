; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77956 () Bool)

(assert start!77956)

(declare-fun b_free!16499 () Bool)

(declare-fun b_next!16499 () Bool)

(assert (=> start!77956 (= b_free!16499 (not b_next!16499))))

(declare-fun tp!57764 () Bool)

(declare-fun b_and!27069 () Bool)

(assert (=> start!77956 (= tp!57764 b_and!27069)))

(declare-fun b!910127 () Bool)

(declare-fun res!614195 () Bool)

(declare-fun e!510255 () Bool)

(assert (=> b!910127 (=> (not res!614195) (not e!510255))))

(declare-datatypes ((array!53854 0))(
  ( (array!53855 (arr!25884 (Array (_ BitVec 32) (_ BitVec 64))) (size!26343 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53854)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53854 (_ BitVec 32)) Bool)

(assert (=> b!910127 (= res!614195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910128 () Bool)

(declare-fun res!614196 () Bool)

(assert (=> b!910128 (=> (not res!614196) (not e!510255))))

(declare-datatypes ((V!30187 0))(
  ( (V!30188 (val!9509 Int)) )
))
(declare-datatypes ((ValueCell!8977 0))(
  ( (ValueCellFull!8977 (v!12017 V!30187)) (EmptyCell!8977) )
))
(declare-datatypes ((array!53856 0))(
  ( (array!53857 (arr!25885 (Array (_ BitVec 32) ValueCell!8977)) (size!26344 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53856)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910128 (= res!614196 (and (= (size!26344 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26343 _keys!1386) (size!26344 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!614193 () Bool)

(assert (=> start!77956 (=> (not res!614193) (not e!510255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77956 (= res!614193 (validMask!0 mask!1756))))

(assert (=> start!77956 e!510255))

(declare-fun e!510256 () Bool)

(declare-fun array_inv!20246 (array!53856) Bool)

(assert (=> start!77956 (and (array_inv!20246 _values!1152) e!510256)))

(assert (=> start!77956 tp!57764))

(assert (=> start!77956 true))

(declare-fun tp_is_empty!18917 () Bool)

(assert (=> start!77956 tp_is_empty!18917))

(declare-fun array_inv!20247 (array!53854) Bool)

(assert (=> start!77956 (array_inv!20247 _keys!1386)))

(declare-fun mapIsEmpty!30094 () Bool)

(declare-fun mapRes!30094 () Bool)

(assert (=> mapIsEmpty!30094 mapRes!30094))

(declare-fun mapNonEmpty!30094 () Bool)

(declare-fun tp!57765 () Bool)

(declare-fun e!510258 () Bool)

(assert (=> mapNonEmpty!30094 (= mapRes!30094 (and tp!57765 e!510258))))

(declare-fun mapRest!30094 () (Array (_ BitVec 32) ValueCell!8977))

(declare-fun mapKey!30094 () (_ BitVec 32))

(declare-fun mapValue!30094 () ValueCell!8977)

(assert (=> mapNonEmpty!30094 (= (arr!25885 _values!1152) (store mapRest!30094 mapKey!30094 mapValue!30094))))

(declare-fun b!910129 () Bool)

(declare-fun e!510254 () Bool)

(assert (=> b!910129 (= e!510254 tp_is_empty!18917)))

(declare-fun b!910130 () Bool)

(assert (=> b!910130 (= e!510258 tp_is_empty!18917)))

(declare-fun b!910131 () Bool)

(declare-fun res!614194 () Bool)

(assert (=> b!910131 (=> (not res!614194) (not e!510255))))

(declare-datatypes ((List!18184 0))(
  ( (Nil!18181) (Cons!18180 (h!19326 (_ BitVec 64)) (t!25767 List!18184)) )
))
(declare-fun arrayNoDuplicates!0 (array!53854 (_ BitVec 32) List!18184) Bool)

(assert (=> b!910131 (= res!614194 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18181))))

(declare-fun b!910132 () Bool)

(assert (=> b!910132 (= e!510256 (and e!510254 mapRes!30094))))

(declare-fun condMapEmpty!30094 () Bool)

(declare-fun mapDefault!30094 () ValueCell!8977)

