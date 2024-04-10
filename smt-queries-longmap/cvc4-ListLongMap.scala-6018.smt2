; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77980 () Bool)

(assert start!77980)

(declare-fun b_free!16523 () Bool)

(declare-fun b_next!16523 () Bool)

(assert (=> start!77980 (= b_free!16523 (not b_next!16523))))

(declare-fun tp!57837 () Bool)

(declare-fun b_and!27093 () Bool)

(assert (=> start!77980 (= tp!57837 b_and!27093)))

(declare-fun b!910395 () Bool)

(declare-fun res!614356 () Bool)

(declare-fun e!510437 () Bool)

(assert (=> b!910395 (=> (not res!614356) (not e!510437))))

(declare-datatypes ((array!53896 0))(
  ( (array!53897 (arr!25905 (Array (_ BitVec 32) (_ BitVec 64))) (size!26364 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53896)

(declare-datatypes ((List!18196 0))(
  ( (Nil!18193) (Cons!18192 (h!19338 (_ BitVec 64)) (t!25779 List!18196)) )
))
(declare-fun arrayNoDuplicates!0 (array!53896 (_ BitVec 32) List!18196) Bool)

(assert (=> b!910395 (= res!614356 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18193))))

(declare-fun b!910396 () Bool)

(declare-fun e!510435 () Bool)

(declare-fun tp_is_empty!18941 () Bool)

(assert (=> b!910396 (= e!510435 tp_is_empty!18941)))

(declare-fun b!910397 () Bool)

(declare-fun res!614354 () Bool)

(assert (=> b!910397 (=> (not res!614354) (not e!510437))))

(declare-datatypes ((V!30219 0))(
  ( (V!30220 (val!9521 Int)) )
))
(declare-datatypes ((ValueCell!8989 0))(
  ( (ValueCellFull!8989 (v!12029 V!30219)) (EmptyCell!8989) )
))
(declare-datatypes ((array!53898 0))(
  ( (array!53899 (arr!25906 (Array (_ BitVec 32) ValueCell!8989)) (size!26365 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53898)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30219)

(declare-fun zeroValue!1094 () V!30219)

(declare-datatypes ((tuple2!12406 0))(
  ( (tuple2!12407 (_1!6214 (_ BitVec 64)) (_2!6214 V!30219)) )
))
(declare-datatypes ((List!18197 0))(
  ( (Nil!18194) (Cons!18193 (h!19339 tuple2!12406) (t!25780 List!18197)) )
))
(declare-datatypes ((ListLongMap!11103 0))(
  ( (ListLongMap!11104 (toList!5567 List!18197)) )
))
(declare-fun contains!4610 (ListLongMap!11103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2829 (array!53896 array!53898 (_ BitVec 32) (_ BitVec 32) V!30219 V!30219 (_ BitVec 32) Int) ListLongMap!11103)

(assert (=> b!910397 (= res!614354 (contains!4610 (getCurrentListMap!2829 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!910399 () Bool)

(declare-fun res!614357 () Bool)

(assert (=> b!910399 (=> (not res!614357) (not e!510437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53896 (_ BitVec 32)) Bool)

(assert (=> b!910399 (= res!614357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun b!910400 () Bool)

(assert (=> b!910400 (= e!510437 (and (= (select (arr!25905 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!26364 _keys!1386))))))

(declare-fun b!910401 () Bool)

(declare-fun e!510438 () Bool)

(assert (=> b!910401 (= e!510438 tp_is_empty!18941)))

(declare-fun b!910402 () Bool)

(declare-fun e!510436 () Bool)

(declare-fun mapRes!30130 () Bool)

(assert (=> b!910402 (= e!510436 (and e!510438 mapRes!30130))))

(declare-fun condMapEmpty!30130 () Bool)

(declare-fun mapDefault!30130 () ValueCell!8989)

