; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78076 () Bool)

(assert start!78076)

(declare-fun b_free!16603 () Bool)

(declare-fun b_next!16603 () Bool)

(assert (=> start!78076 (= b_free!16603 (not b_next!16603))))

(declare-fun tp!58080 () Bool)

(declare-fun b_and!27175 () Bool)

(assert (=> start!78076 (= tp!58080 b_and!27175)))

(declare-fun b!911346 () Bool)

(declare-fun e!511109 () Bool)

(declare-fun tp_is_empty!19021 () Bool)

(assert (=> b!911346 (= e!511109 tp_is_empty!19021)))

(declare-fun b!911347 () Bool)

(declare-fun res!614882 () Bool)

(declare-fun e!511110 () Bool)

(assert (=> b!911347 (=> (not res!614882) (not e!511110))))

(declare-datatypes ((V!30327 0))(
  ( (V!30328 (val!9561 Int)) )
))
(declare-datatypes ((ValueCell!9029 0))(
  ( (ValueCellFull!9029 (v!12070 V!30327)) (EmptyCell!9029) )
))
(declare-datatypes ((array!54042 0))(
  ( (array!54043 (arr!25977 (Array (_ BitVec 32) ValueCell!9029)) (size!26436 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54042)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54044 0))(
  ( (array!54045 (arr!25978 (Array (_ BitVec 32) (_ BitVec 64))) (size!26437 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54044)

(assert (=> b!911347 (= res!614882 (and (= (size!26436 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26437 _keys!1386) (size!26436 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911348 () Bool)

(declare-fun res!614880 () Bool)

(assert (=> b!911348 (=> (not res!614880) (not e!511110))))

(declare-datatypes ((List!18246 0))(
  ( (Nil!18243) (Cons!18242 (h!19388 (_ BitVec 64)) (t!25831 List!18246)) )
))
(declare-fun arrayNoDuplicates!0 (array!54044 (_ BitVec 32) List!18246) Bool)

(assert (=> b!911348 (= res!614880 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18243))))

(declare-fun b!911349 () Bool)

(declare-fun res!614883 () Bool)

(assert (=> b!911349 (=> (not res!614883) (not e!511110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54044 (_ BitVec 32)) Bool)

(assert (=> b!911349 (= res!614883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911350 () Bool)

(assert (=> b!911350 (= e!511110 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30327)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30327)

(declare-fun lt!410387 () Bool)

(declare-datatypes ((tuple2!12454 0))(
  ( (tuple2!12455 (_1!6238 (_ BitVec 64)) (_2!6238 V!30327)) )
))
(declare-datatypes ((List!18247 0))(
  ( (Nil!18244) (Cons!18243 (h!19389 tuple2!12454) (t!25832 List!18247)) )
))
(declare-datatypes ((ListLongMap!11151 0))(
  ( (ListLongMap!11152 (toList!5591 List!18247)) )
))
(declare-fun contains!4635 (ListLongMap!11151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2853 (array!54044 array!54042 (_ BitVec 32) (_ BitVec 32) V!30327 V!30327 (_ BitVec 32) Int) ListLongMap!11151)

(assert (=> b!911350 (= lt!410387 (contains!4635 (getCurrentListMap!2853 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911351 () Bool)

(declare-fun e!511108 () Bool)

(assert (=> b!911351 (= e!511108 tp_is_empty!19021)))

(declare-fun b!911352 () Bool)

(declare-fun e!511106 () Bool)

(declare-fun mapRes!30253 () Bool)

(assert (=> b!911352 (= e!511106 (and e!511108 mapRes!30253))))

(declare-fun condMapEmpty!30253 () Bool)

(declare-fun mapDefault!30253 () ValueCell!9029)

