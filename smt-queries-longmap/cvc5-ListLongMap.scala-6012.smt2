; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77940 () Bool)

(assert start!77940)

(declare-fun b_free!16483 () Bool)

(declare-fun b_next!16483 () Bool)

(assert (=> start!77940 (= b_free!16483 (not b_next!16483))))

(declare-fun tp!57716 () Bool)

(declare-fun b_and!27053 () Bool)

(assert (=> start!77940 (= tp!57716 b_and!27053)))

(declare-fun b!909959 () Bool)

(declare-fun res!614099 () Bool)

(declare-fun e!510134 () Bool)

(assert (=> b!909959 (=> (not res!614099) (not e!510134))))

(declare-datatypes ((V!30167 0))(
  ( (V!30168 (val!9501 Int)) )
))
(declare-datatypes ((ValueCell!8969 0))(
  ( (ValueCellFull!8969 (v!12009 V!30167)) (EmptyCell!8969) )
))
(declare-datatypes ((array!53824 0))(
  ( (array!53825 (arr!25869 (Array (_ BitVec 32) ValueCell!8969)) (size!26328 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53824)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53826 0))(
  ( (array!53827 (arr!25870 (Array (_ BitVec 32) (_ BitVec 64))) (size!26329 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53826)

(assert (=> b!909959 (= res!614099 (and (= (size!26328 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26329 _keys!1386) (size!26328 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30070 () Bool)

(declare-fun mapRes!30070 () Bool)

(declare-fun tp!57717 () Bool)

(declare-fun e!510136 () Bool)

(assert (=> mapNonEmpty!30070 (= mapRes!30070 (and tp!57717 e!510136))))

(declare-fun mapValue!30070 () ValueCell!8969)

(declare-fun mapKey!30070 () (_ BitVec 32))

(declare-fun mapRest!30070 () (Array (_ BitVec 32) ValueCell!8969))

(assert (=> mapNonEmpty!30070 (= (arr!25869 _values!1152) (store mapRest!30070 mapKey!30070 mapValue!30070))))

(declare-fun b!909960 () Bool)

(declare-fun e!510138 () Bool)

(declare-fun tp_is_empty!18901 () Bool)

(assert (=> b!909960 (= e!510138 tp_is_empty!18901)))

(declare-fun res!614098 () Bool)

(assert (=> start!77940 (=> (not res!614098) (not e!510134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77940 (= res!614098 (validMask!0 mask!1756))))

(assert (=> start!77940 e!510134))

(declare-fun e!510137 () Bool)

(declare-fun array_inv!20232 (array!53824) Bool)

(assert (=> start!77940 (and (array_inv!20232 _values!1152) e!510137)))

(assert (=> start!77940 tp!57716))

(assert (=> start!77940 true))

(assert (=> start!77940 tp_is_empty!18901))

(declare-fun array_inv!20233 (array!53826) Bool)

(assert (=> start!77940 (array_inv!20233 _keys!1386)))

(declare-fun b!909961 () Bool)

(assert (=> b!909961 (= e!510136 tp_is_empty!18901)))

(declare-fun b!909962 () Bool)

(declare-fun res!614097 () Bool)

(assert (=> b!909962 (=> (not res!614097) (not e!510134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53826 (_ BitVec 32)) Bool)

(assert (=> b!909962 (= res!614097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909963 () Bool)

(assert (=> b!909963 (= e!510134 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410129 () Bool)

(declare-fun zeroValue!1094 () V!30167)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30167)

(declare-datatypes ((tuple2!12384 0))(
  ( (tuple2!12385 (_1!6203 (_ BitVec 64)) (_2!6203 V!30167)) )
))
(declare-datatypes ((List!18174 0))(
  ( (Nil!18171) (Cons!18170 (h!19316 tuple2!12384) (t!25757 List!18174)) )
))
(declare-datatypes ((ListLongMap!11081 0))(
  ( (ListLongMap!11082 (toList!5556 List!18174)) )
))
(declare-fun contains!4599 (ListLongMap!11081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2818 (array!53826 array!53824 (_ BitVec 32) (_ BitVec 32) V!30167 V!30167 (_ BitVec 32) Int) ListLongMap!11081)

(assert (=> b!909963 (= lt!410129 (contains!4599 (getCurrentListMap!2818 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909964 () Bool)

(declare-fun res!614100 () Bool)

(assert (=> b!909964 (=> (not res!614100) (not e!510134))))

(declare-datatypes ((List!18175 0))(
  ( (Nil!18172) (Cons!18171 (h!19317 (_ BitVec 64)) (t!25758 List!18175)) )
))
(declare-fun arrayNoDuplicates!0 (array!53826 (_ BitVec 32) List!18175) Bool)

(assert (=> b!909964 (= res!614100 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18172))))

(declare-fun mapIsEmpty!30070 () Bool)

(assert (=> mapIsEmpty!30070 mapRes!30070))

(declare-fun b!909965 () Bool)

(assert (=> b!909965 (= e!510137 (and e!510138 mapRes!30070))))

(declare-fun condMapEmpty!30070 () Bool)

(declare-fun mapDefault!30070 () ValueCell!8969)

