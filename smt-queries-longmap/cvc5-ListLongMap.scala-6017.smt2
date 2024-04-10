; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77970 () Bool)

(assert start!77970)

(declare-fun b_free!16513 () Bool)

(declare-fun b_next!16513 () Bool)

(assert (=> start!77970 (= b_free!16513 (not b_next!16513))))

(declare-fun tp!57807 () Bool)

(declare-fun b_and!27083 () Bool)

(assert (=> start!77970 (= tp!57807 b_and!27083)))

(declare-fun b!910274 () Bool)

(declare-fun e!510360 () Bool)

(declare-fun tp_is_empty!18931 () Bool)

(assert (=> b!910274 (= e!510360 tp_is_empty!18931)))

(declare-fun b!910275 () Bool)

(declare-fun e!510361 () Bool)

(assert (=> b!910275 (= e!510361 false)))

(declare-datatypes ((V!30207 0))(
  ( (V!30208 (val!9516 Int)) )
))
(declare-datatypes ((ValueCell!8984 0))(
  ( (ValueCellFull!8984 (v!12024 V!30207)) (EmptyCell!8984) )
))
(declare-datatypes ((array!53878 0))(
  ( (array!53879 (arr!25896 (Array (_ BitVec 32) ValueCell!8984)) (size!26355 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53878)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30207)

(declare-datatypes ((array!53880 0))(
  ( (array!53881 (arr!25897 (Array (_ BitVec 32) (_ BitVec 64))) (size!26356 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53880)

(declare-fun lt!410174 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30207)

(declare-datatypes ((tuple2!12398 0))(
  ( (tuple2!12399 (_1!6210 (_ BitVec 64)) (_2!6210 V!30207)) )
))
(declare-datatypes ((List!18190 0))(
  ( (Nil!18187) (Cons!18186 (h!19332 tuple2!12398) (t!25773 List!18190)) )
))
(declare-datatypes ((ListLongMap!11095 0))(
  ( (ListLongMap!11096 (toList!5563 List!18190)) )
))
(declare-fun contains!4606 (ListLongMap!11095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2825 (array!53880 array!53878 (_ BitVec 32) (_ BitVec 32) V!30207 V!30207 (_ BitVec 32) Int) ListLongMap!11095)

(assert (=> b!910275 (= lt!410174 (contains!4606 (getCurrentListMap!2825 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!910276 () Bool)

(declare-fun e!510359 () Bool)

(assert (=> b!910276 (= e!510359 tp_is_empty!18931)))

(declare-fun b!910277 () Bool)

(declare-fun res!614278 () Bool)

(assert (=> b!910277 (=> (not res!614278) (not e!510361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53880 (_ BitVec 32)) Bool)

(assert (=> b!910277 (= res!614278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30115 () Bool)

(declare-fun mapRes!30115 () Bool)

(declare-fun tp!57806 () Bool)

(assert (=> mapNonEmpty!30115 (= mapRes!30115 (and tp!57806 e!510359))))

(declare-fun mapKey!30115 () (_ BitVec 32))

(declare-fun mapValue!30115 () ValueCell!8984)

(declare-fun mapRest!30115 () (Array (_ BitVec 32) ValueCell!8984))

(assert (=> mapNonEmpty!30115 (= (arr!25896 _values!1152) (store mapRest!30115 mapKey!30115 mapValue!30115))))

(declare-fun b!910278 () Bool)

(declare-fun res!614279 () Bool)

(assert (=> b!910278 (=> (not res!614279) (not e!510361))))

(assert (=> b!910278 (= res!614279 (and (= (size!26355 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26356 _keys!1386) (size!26355 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910280 () Bool)

(declare-fun e!510362 () Bool)

(assert (=> b!910280 (= e!510362 (and e!510360 mapRes!30115))))

(declare-fun condMapEmpty!30115 () Bool)

(declare-fun mapDefault!30115 () ValueCell!8984)

