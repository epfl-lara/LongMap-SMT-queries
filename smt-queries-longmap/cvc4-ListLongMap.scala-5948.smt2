; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77518 () Bool)

(assert start!77518)

(declare-fun b_free!16103 () Bool)

(declare-fun b_next!16103 () Bool)

(assert (=> start!77518 (= b_free!16103 (not b_next!16103))))

(declare-fun tp!56570 () Bool)

(declare-fun b_and!26469 () Bool)

(assert (=> start!77518 (= tp!56570 b_and!26469)))

(declare-fun b!903215 () Bool)

(declare-fun e!506024 () Bool)

(declare-fun tp_is_empty!18521 () Bool)

(assert (=> b!903215 (= e!506024 tp_is_empty!18521)))

(declare-fun b!903216 () Bool)

(declare-fun res!609415 () Bool)

(declare-fun e!506022 () Bool)

(assert (=> b!903216 (=> (not res!609415) (not e!506022))))

(declare-datatypes ((array!53100 0))(
  ( (array!53101 (arr!25509 (Array (_ BitVec 32) (_ BitVec 64))) (size!25968 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53100)

(declare-datatypes ((List!17911 0))(
  ( (Nil!17908) (Cons!17907 (h!19053 (_ BitVec 64)) (t!25294 List!17911)) )
))
(declare-fun arrayNoDuplicates!0 (array!53100 (_ BitVec 32) List!17911) Bool)

(assert (=> b!903216 (= res!609415 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17908))))

(declare-fun b!903217 () Bool)

(declare-fun res!609414 () Bool)

(assert (=> b!903217 (=> (not res!609414) (not e!506022))))

(declare-datatypes ((V!29659 0))(
  ( (V!29660 (val!9311 Int)) )
))
(declare-datatypes ((ValueCell!8779 0))(
  ( (ValueCellFull!8779 (v!11816 V!29659)) (EmptyCell!8779) )
))
(declare-datatypes ((array!53102 0))(
  ( (array!53103 (arr!25510 (Array (_ BitVec 32) ValueCell!8779)) (size!25969 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53102)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!903217 (= res!609414 (and (= (size!25969 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25968 _keys!1386) (size!25969 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903218 () Bool)

(assert (=> b!903218 (= e!506022 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29659)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!407976 () Bool)

(declare-fun minValue!1094 () V!29659)

(declare-datatypes ((tuple2!12090 0))(
  ( (tuple2!12091 (_1!6056 (_ BitVec 64)) (_2!6056 V!29659)) )
))
(declare-datatypes ((List!17912 0))(
  ( (Nil!17909) (Cons!17908 (h!19054 tuple2!12090) (t!25295 List!17912)) )
))
(declare-datatypes ((ListLongMap!10787 0))(
  ( (ListLongMap!10788 (toList!5409 List!17912)) )
))
(declare-fun contains!4457 (ListLongMap!10787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2678 (array!53100 array!53102 (_ BitVec 32) (_ BitVec 32) V!29659 V!29659 (_ BitVec 32) Int) ListLongMap!10787)

(assert (=> b!903218 (= lt!407976 (contains!4457 (getCurrentListMap!2678 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903219 () Bool)

(declare-fun e!506021 () Bool)

(assert (=> b!903219 (= e!506021 tp_is_empty!18521)))

(declare-fun mapIsEmpty!29494 () Bool)

(declare-fun mapRes!29494 () Bool)

(assert (=> mapIsEmpty!29494 mapRes!29494))

(declare-fun mapNonEmpty!29494 () Bool)

(declare-fun tp!56571 () Bool)

(assert (=> mapNonEmpty!29494 (= mapRes!29494 (and tp!56571 e!506021))))

(declare-fun mapValue!29494 () ValueCell!8779)

(declare-fun mapKey!29494 () (_ BitVec 32))

(declare-fun mapRest!29494 () (Array (_ BitVec 32) ValueCell!8779))

(assert (=> mapNonEmpty!29494 (= (arr!25510 _values!1152) (store mapRest!29494 mapKey!29494 mapValue!29494))))

(declare-fun b!903220 () Bool)

(declare-fun e!506025 () Bool)

(assert (=> b!903220 (= e!506025 (and e!506024 mapRes!29494))))

(declare-fun condMapEmpty!29494 () Bool)

(declare-fun mapDefault!29494 () ValueCell!8779)

