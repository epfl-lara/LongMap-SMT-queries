; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77530 () Bool)

(assert start!77530)

(declare-fun b_free!16115 () Bool)

(declare-fun b_next!16115 () Bool)

(assert (=> start!77530 (= b_free!16115 (not b_next!16115))))

(declare-fun tp!56606 () Bool)

(declare-fun b_and!26481 () Bool)

(assert (=> start!77530 (= tp!56606 b_and!26481)))

(declare-fun mapNonEmpty!29512 () Bool)

(declare-fun mapRes!29512 () Bool)

(declare-fun tp!56607 () Bool)

(declare-fun e!506114 () Bool)

(assert (=> mapNonEmpty!29512 (= mapRes!29512 (and tp!56607 e!506114))))

(declare-datatypes ((V!29675 0))(
  ( (V!29676 (val!9317 Int)) )
))
(declare-datatypes ((ValueCell!8785 0))(
  ( (ValueCellFull!8785 (v!11822 V!29675)) (EmptyCell!8785) )
))
(declare-datatypes ((array!53122 0))(
  ( (array!53123 (arr!25520 (Array (_ BitVec 32) ValueCell!8785)) (size!25979 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53122)

(declare-fun mapRest!29512 () (Array (_ BitVec 32) ValueCell!8785))

(declare-fun mapValue!29512 () ValueCell!8785)

(declare-fun mapKey!29512 () (_ BitVec 32))

(assert (=> mapNonEmpty!29512 (= (arr!25520 _values!1152) (store mapRest!29512 mapKey!29512 mapValue!29512))))

(declare-fun b!903341 () Bool)

(declare-fun e!506111 () Bool)

(declare-fun tp_is_empty!18533 () Bool)

(assert (=> b!903341 (= e!506111 tp_is_empty!18533)))

(declare-fun b!903342 () Bool)

(declare-fun res!609486 () Bool)

(declare-fun e!506115 () Bool)

(assert (=> b!903342 (=> (not res!609486) (not e!506115))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53124 0))(
  ( (array!53125 (arr!25521 (Array (_ BitVec 32) (_ BitVec 64))) (size!25980 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53124)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903342 (= res!609486 (and (= (size!25979 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25980 _keys!1386) (size!25979 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903343 () Bool)

(assert (=> b!903343 (= e!506115 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29675)

(declare-fun lt!407994 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29675)

(declare-datatypes ((tuple2!12098 0))(
  ( (tuple2!12099 (_1!6060 (_ BitVec 64)) (_2!6060 V!29675)) )
))
(declare-datatypes ((List!17919 0))(
  ( (Nil!17916) (Cons!17915 (h!19061 tuple2!12098) (t!25302 List!17919)) )
))
(declare-datatypes ((ListLongMap!10795 0))(
  ( (ListLongMap!10796 (toList!5413 List!17919)) )
))
(declare-fun contains!4461 (ListLongMap!10795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2682 (array!53124 array!53122 (_ BitVec 32) (_ BitVec 32) V!29675 V!29675 (_ BitVec 32) Int) ListLongMap!10795)

(assert (=> b!903343 (= lt!407994 (contains!4461 (getCurrentListMap!2682 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903344 () Bool)

(declare-fun e!506112 () Bool)

(assert (=> b!903344 (= e!506112 (and e!506111 mapRes!29512))))

(declare-fun condMapEmpty!29512 () Bool)

(declare-fun mapDefault!29512 () ValueCell!8785)

