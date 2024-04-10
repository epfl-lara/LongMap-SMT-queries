; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78064 () Bool)

(assert start!78064)

(declare-fun b_free!16591 () Bool)

(declare-fun b_next!16591 () Bool)

(assert (=> start!78064 (= b_free!16591 (not b_next!16591))))

(declare-fun tp!58044 () Bool)

(declare-fun b_and!27163 () Bool)

(assert (=> start!78064 (= tp!58044 b_and!27163)))

(declare-fun mapNonEmpty!30235 () Bool)

(declare-fun mapRes!30235 () Bool)

(declare-fun tp!58043 () Bool)

(declare-fun e!511019 () Bool)

(assert (=> mapNonEmpty!30235 (= mapRes!30235 (and tp!58043 e!511019))))

(declare-datatypes ((V!30311 0))(
  ( (V!30312 (val!9555 Int)) )
))
(declare-datatypes ((ValueCell!9023 0))(
  ( (ValueCellFull!9023 (v!12064 V!30311)) (EmptyCell!9023) )
))
(declare-datatypes ((array!54020 0))(
  ( (array!54021 (arr!25966 (Array (_ BitVec 32) ValueCell!9023)) (size!26425 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54020)

(declare-fun mapValue!30235 () ValueCell!9023)

(declare-fun mapKey!30235 () (_ BitVec 32))

(declare-fun mapRest!30235 () (Array (_ BitVec 32) ValueCell!9023))

(assert (=> mapNonEmpty!30235 (= (arr!25966 _values!1152) (store mapRest!30235 mapKey!30235 mapValue!30235))))

(declare-fun b!911220 () Bool)

(declare-fun e!511016 () Bool)

(assert (=> b!911220 (= e!511016 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54022 0))(
  ( (array!54023 (arr!25967 (Array (_ BitVec 32) (_ BitVec 64))) (size!26426 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54022)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30311)

(declare-fun lt!410369 () Bool)

(declare-fun zeroValue!1094 () V!30311)

(declare-datatypes ((tuple2!12448 0))(
  ( (tuple2!12449 (_1!6235 (_ BitVec 64)) (_2!6235 V!30311)) )
))
(declare-datatypes ((List!18238 0))(
  ( (Nil!18235) (Cons!18234 (h!19380 tuple2!12448) (t!25823 List!18238)) )
))
(declare-datatypes ((ListLongMap!11145 0))(
  ( (ListLongMap!11146 (toList!5588 List!18238)) )
))
(declare-fun contains!4632 (ListLongMap!11145 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2850 (array!54022 array!54020 (_ BitVec 32) (_ BitVec 32) V!30311 V!30311 (_ BitVec 32) Int) ListLongMap!11145)

(assert (=> b!911220 (= lt!410369 (contains!4632 (getCurrentListMap!2850 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapIsEmpty!30235 () Bool)

(assert (=> mapIsEmpty!30235 mapRes!30235))

(declare-fun b!911222 () Bool)

(declare-fun res!614809 () Bool)

(assert (=> b!911222 (=> (not res!614809) (not e!511016))))

(declare-datatypes ((List!18239 0))(
  ( (Nil!18236) (Cons!18235 (h!19381 (_ BitVec 64)) (t!25824 List!18239)) )
))
(declare-fun arrayNoDuplicates!0 (array!54022 (_ BitVec 32) List!18239) Bool)

(assert (=> b!911222 (= res!614809 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18236))))

(declare-fun b!911223 () Bool)

(declare-fun e!511020 () Bool)

(declare-fun e!511017 () Bool)

(assert (=> b!911223 (= e!511020 (and e!511017 mapRes!30235))))

(declare-fun condMapEmpty!30235 () Bool)

(declare-fun mapDefault!30235 () ValueCell!9023)

