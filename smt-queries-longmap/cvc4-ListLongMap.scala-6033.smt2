; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78086 () Bool)

(assert start!78086)

(declare-fun b_free!16613 () Bool)

(declare-fun b_next!16613 () Bool)

(assert (=> start!78086 (= b_free!16613 (not b_next!16613))))

(declare-fun tp!58110 () Bool)

(declare-fun b_and!27185 () Bool)

(assert (=> start!78086 (= tp!58110 b_and!27185)))

(declare-fun b!911467 () Bool)

(declare-fun res!614956 () Bool)

(declare-fun e!511185 () Bool)

(assert (=> b!911467 (=> (not res!614956) (not e!511185))))

(declare-datatypes ((V!30339 0))(
  ( (V!30340 (val!9566 Int)) )
))
(declare-datatypes ((ValueCell!9034 0))(
  ( (ValueCellFull!9034 (v!12075 V!30339)) (EmptyCell!9034) )
))
(declare-datatypes ((array!54062 0))(
  ( (array!54063 (arr!25987 (Array (_ BitVec 32) ValueCell!9034)) (size!26446 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54062)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30339)

(declare-datatypes ((array!54064 0))(
  ( (array!54065 (arr!25988 (Array (_ BitVec 32) (_ BitVec 64))) (size!26447 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54064)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30339)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12462 0))(
  ( (tuple2!12463 (_1!6242 (_ BitVec 64)) (_2!6242 V!30339)) )
))
(declare-datatypes ((List!18254 0))(
  ( (Nil!18251) (Cons!18250 (h!19396 tuple2!12462) (t!25839 List!18254)) )
))
(declare-datatypes ((ListLongMap!11159 0))(
  ( (ListLongMap!11160 (toList!5595 List!18254)) )
))
(declare-fun contains!4639 (ListLongMap!11159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2857 (array!54064 array!54062 (_ BitVec 32) (_ BitVec 32) V!30339 V!30339 (_ BitVec 32) Int) ListLongMap!11159)

(assert (=> b!911467 (= res!614956 (contains!4639 (getCurrentListMap!2857 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun res!614958 () Bool)

(assert (=> start!78086 (=> (not res!614958) (not e!511185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78086 (= res!614958 (validMask!0 mask!1756))))

(assert (=> start!78086 e!511185))

(declare-fun e!511184 () Bool)

(declare-fun array_inv!20312 (array!54062) Bool)

(assert (=> start!78086 (and (array_inv!20312 _values!1152) e!511184)))

(assert (=> start!78086 tp!58110))

(assert (=> start!78086 true))

(declare-fun tp_is_empty!19031 () Bool)

(assert (=> start!78086 tp_is_empty!19031))

(declare-fun array_inv!20313 (array!54064) Bool)

(assert (=> start!78086 (array_inv!20313 _keys!1386)))

(declare-fun mapIsEmpty!30268 () Bool)

(declare-fun mapRes!30268 () Bool)

(assert (=> mapIsEmpty!30268 mapRes!30268))

(declare-fun b!911468 () Bool)

(declare-fun res!614959 () Bool)

(assert (=> b!911468 (=> (not res!614959) (not e!511185))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!911468 (= res!614959 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!30268 () Bool)

(declare-fun tp!58109 () Bool)

(declare-fun e!511182 () Bool)

(assert (=> mapNonEmpty!30268 (= mapRes!30268 (and tp!58109 e!511182))))

(declare-fun mapRest!30268 () (Array (_ BitVec 32) ValueCell!9034))

(declare-fun mapKey!30268 () (_ BitVec 32))

(declare-fun mapValue!30268 () ValueCell!9034)

(assert (=> mapNonEmpty!30268 (= (arr!25987 _values!1152) (store mapRest!30268 mapKey!30268 mapValue!30268))))

(declare-fun b!911469 () Bool)

(assert (=> b!911469 (= e!511185 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26447 _keys!1386))))))

(declare-fun b!911470 () Bool)

(declare-fun res!614961 () Bool)

(assert (=> b!911470 (=> (not res!614961) (not e!511185))))

(assert (=> b!911470 (= res!614961 (and (= (size!26446 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26447 _keys!1386) (size!26446 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911471 () Bool)

(declare-fun e!511181 () Bool)

(assert (=> b!911471 (= e!511184 (and e!511181 mapRes!30268))))

(declare-fun condMapEmpty!30268 () Bool)

(declare-fun mapDefault!30268 () ValueCell!9034)

