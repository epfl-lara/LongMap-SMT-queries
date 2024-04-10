; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78050 () Bool)

(assert start!78050)

(declare-fun b_free!16577 () Bool)

(declare-fun b_next!16577 () Bool)

(assert (=> start!78050 (= b_free!16577 (not b_next!16577))))

(declare-fun tp!58002 () Bool)

(declare-fun b_and!27149 () Bool)

(assert (=> start!78050 (= tp!58002 b_and!27149)))

(declare-fun res!614727 () Bool)

(declare-fun e!510915 () Bool)

(assert (=> start!78050 (=> (not res!614727) (not e!510915))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78050 (= res!614727 (validMask!0 mask!1756))))

(assert (=> start!78050 e!510915))

(declare-datatypes ((V!30291 0))(
  ( (V!30292 (val!9548 Int)) )
))
(declare-datatypes ((ValueCell!9016 0))(
  ( (ValueCellFull!9016 (v!12057 V!30291)) (EmptyCell!9016) )
))
(declare-datatypes ((array!53994 0))(
  ( (array!53995 (arr!25953 (Array (_ BitVec 32) ValueCell!9016)) (size!26412 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53994)

(declare-fun e!510912 () Bool)

(declare-fun array_inv!20288 (array!53994) Bool)

(assert (=> start!78050 (and (array_inv!20288 _values!1152) e!510912)))

(assert (=> start!78050 tp!58002))

(assert (=> start!78050 true))

(declare-fun tp_is_empty!18995 () Bool)

(assert (=> start!78050 tp_is_empty!18995))

(declare-datatypes ((array!53996 0))(
  ( (array!53997 (arr!25954 (Array (_ BitVec 32) (_ BitVec 64))) (size!26413 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53996)

(declare-fun array_inv!20289 (array!53996) Bool)

(assert (=> start!78050 (array_inv!20289 _keys!1386)))

(declare-fun b!911073 () Bool)

(declare-fun e!510911 () Bool)

(assert (=> b!911073 (= e!510911 tp_is_empty!18995)))

(declare-fun b!911074 () Bool)

(declare-fun res!614725 () Bool)

(assert (=> b!911074 (=> (not res!614725) (not e!510915))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911074 (= res!614725 (and (= (size!26412 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26413 _keys!1386) (size!26412 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911075 () Bool)

(declare-fun e!510914 () Bool)

(assert (=> b!911075 (= e!510914 tp_is_empty!18995)))

(declare-fun b!911076 () Bool)

(declare-fun res!614726 () Bool)

(assert (=> b!911076 (=> (not res!614726) (not e!510915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53996 (_ BitVec 32)) Bool)

(assert (=> b!911076 (= res!614726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911077 () Bool)

(assert (=> b!911077 (= e!510915 false)))

(declare-fun zeroValue!1094 () V!30291)

(declare-fun lt!410348 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30291)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12438 0))(
  ( (tuple2!12439 (_1!6230 (_ BitVec 64)) (_2!6230 V!30291)) )
))
(declare-datatypes ((List!18229 0))(
  ( (Nil!18226) (Cons!18225 (h!19371 tuple2!12438) (t!25814 List!18229)) )
))
(declare-datatypes ((ListLongMap!11135 0))(
  ( (ListLongMap!11136 (toList!5583 List!18229)) )
))
(declare-fun contains!4627 (ListLongMap!11135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2845 (array!53996 array!53994 (_ BitVec 32) (_ BitVec 32) V!30291 V!30291 (_ BitVec 32) Int) ListLongMap!11135)

(assert (=> b!911077 (= lt!410348 (contains!4627 (getCurrentListMap!2845 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapNonEmpty!30214 () Bool)

(declare-fun mapRes!30214 () Bool)

(declare-fun tp!58001 () Bool)

(assert (=> mapNonEmpty!30214 (= mapRes!30214 (and tp!58001 e!510911))))

(declare-fun mapValue!30214 () ValueCell!9016)

(declare-fun mapKey!30214 () (_ BitVec 32))

(declare-fun mapRest!30214 () (Array (_ BitVec 32) ValueCell!9016))

(assert (=> mapNonEmpty!30214 (= (arr!25953 _values!1152) (store mapRest!30214 mapKey!30214 mapValue!30214))))

(declare-fun b!911078 () Bool)

(assert (=> b!911078 (= e!510912 (and e!510914 mapRes!30214))))

(declare-fun condMapEmpty!30214 () Bool)

(declare-fun mapDefault!30214 () ValueCell!9016)

