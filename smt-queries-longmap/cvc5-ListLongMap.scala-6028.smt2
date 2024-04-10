; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78052 () Bool)

(assert start!78052)

(declare-fun b_free!16579 () Bool)

(declare-fun b_next!16579 () Bool)

(assert (=> start!78052 (= b_free!16579 (not b_next!16579))))

(declare-fun tp!58008 () Bool)

(declare-fun b_and!27151 () Bool)

(assert (=> start!78052 (= tp!58008 b_and!27151)))

(declare-fun mapIsEmpty!30217 () Bool)

(declare-fun mapRes!30217 () Bool)

(assert (=> mapIsEmpty!30217 mapRes!30217))

(declare-fun b!911094 () Bool)

(declare-fun res!614738 () Bool)

(declare-fun e!510927 () Bool)

(assert (=> b!911094 (=> (not res!614738) (not e!510927))))

(declare-datatypes ((array!53998 0))(
  ( (array!53999 (arr!25955 (Array (_ BitVec 32) (_ BitVec 64))) (size!26414 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53998)

(declare-datatypes ((List!18230 0))(
  ( (Nil!18227) (Cons!18226 (h!19372 (_ BitVec 64)) (t!25815 List!18230)) )
))
(declare-fun arrayNoDuplicates!0 (array!53998 (_ BitVec 32) List!18230) Bool)

(assert (=> b!911094 (= res!614738 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18227))))

(declare-fun b!911095 () Bool)

(declare-fun e!510926 () Bool)

(declare-fun tp_is_empty!18997 () Bool)

(assert (=> b!911095 (= e!510926 tp_is_empty!18997)))

(declare-fun res!614737 () Bool)

(assert (=> start!78052 (=> (not res!614737) (not e!510927))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78052 (= res!614737 (validMask!0 mask!1756))))

(assert (=> start!78052 e!510927))

(declare-datatypes ((V!30295 0))(
  ( (V!30296 (val!9549 Int)) )
))
(declare-datatypes ((ValueCell!9017 0))(
  ( (ValueCellFull!9017 (v!12058 V!30295)) (EmptyCell!9017) )
))
(declare-datatypes ((array!54000 0))(
  ( (array!54001 (arr!25956 (Array (_ BitVec 32) ValueCell!9017)) (size!26415 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54000)

(declare-fun e!510929 () Bool)

(declare-fun array_inv!20290 (array!54000) Bool)

(assert (=> start!78052 (and (array_inv!20290 _values!1152) e!510929)))

(assert (=> start!78052 tp!58008))

(assert (=> start!78052 true))

(assert (=> start!78052 tp_is_empty!18997))

(declare-fun array_inv!20291 (array!53998) Bool)

(assert (=> start!78052 (array_inv!20291 _keys!1386)))

(declare-fun b!911096 () Bool)

(declare-fun res!614736 () Bool)

(assert (=> b!911096 (=> (not res!614736) (not e!510927))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911096 (= res!614736 (and (= (size!26415 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26414 _keys!1386) (size!26415 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911097 () Bool)

(assert (=> b!911097 (= e!510927 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30295)

(declare-fun lt!410351 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30295)

(declare-datatypes ((tuple2!12440 0))(
  ( (tuple2!12441 (_1!6231 (_ BitVec 64)) (_2!6231 V!30295)) )
))
(declare-datatypes ((List!18231 0))(
  ( (Nil!18228) (Cons!18227 (h!19373 tuple2!12440) (t!25816 List!18231)) )
))
(declare-datatypes ((ListLongMap!11137 0))(
  ( (ListLongMap!11138 (toList!5584 List!18231)) )
))
(declare-fun contains!4628 (ListLongMap!11137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2846 (array!53998 array!54000 (_ BitVec 32) (_ BitVec 32) V!30295 V!30295 (_ BitVec 32) Int) ListLongMap!11137)

(assert (=> b!911097 (= lt!410351 (contains!4628 (getCurrentListMap!2846 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911098 () Bool)

(assert (=> b!911098 (= e!510929 (and e!510926 mapRes!30217))))

(declare-fun condMapEmpty!30217 () Bool)

(declare-fun mapDefault!30217 () ValueCell!9017)

