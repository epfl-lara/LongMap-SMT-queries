; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73810 () Bool)

(assert start!73810)

(declare-fun b_free!14725 () Bool)

(declare-fun b_next!14725 () Bool)

(assert (=> start!73810 (= b_free!14725 (not b_next!14725))))

(declare-fun tp!51678 () Bool)

(declare-fun b_and!24429 () Bool)

(assert (=> start!73810 (= tp!51678 b_and!24429)))

(declare-fun mapIsEmpty!26891 () Bool)

(declare-fun mapRes!26891 () Bool)

(assert (=> mapIsEmpty!26891 mapRes!26891))

(declare-fun b!866375 () Bool)

(declare-fun res!588664 () Bool)

(declare-fun e!482619 () Bool)

(assert (=> b!866375 (=> (not res!588664) (not e!482619))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49882 0))(
  ( (array!49883 (arr!23972 (Array (_ BitVec 32) (_ BitVec 64))) (size!24412 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49882)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866375 (= res!588664 (and (= (select (arr!23972 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26891 () Bool)

(declare-fun tp!51679 () Bool)

(declare-fun e!482616 () Bool)

(assert (=> mapNonEmpty!26891 (= mapRes!26891 (and tp!51679 e!482616))))

(declare-datatypes ((V!27529 0))(
  ( (V!27530 (val!8478 Int)) )
))
(declare-datatypes ((ValueCell!7991 0))(
  ( (ValueCellFull!7991 (v!10903 V!27529)) (EmptyCell!7991) )
))
(declare-fun mapRest!26891 () (Array (_ BitVec 32) ValueCell!7991))

(declare-fun mapKey!26891 () (_ BitVec 32))

(declare-fun mapValue!26891 () ValueCell!7991)

(declare-datatypes ((array!49884 0))(
  ( (array!49885 (arr!23973 (Array (_ BitVec 32) ValueCell!7991)) (size!24413 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49884)

(assert (=> mapNonEmpty!26891 (= (arr!23973 _values!688) (store mapRest!26891 mapKey!26891 mapValue!26891))))

(declare-fun b!866377 () Bool)

(declare-datatypes ((Unit!29694 0))(
  ( (Unit!29695) )
))
(declare-fun e!482617 () Unit!29694)

(declare-fun Unit!29696 () Unit!29694)

(assert (=> b!866377 (= e!482617 Unit!29696)))

(declare-fun b!866378 () Bool)

(declare-fun res!588663 () Bool)

(assert (=> b!866378 (=> (not res!588663) (not e!482619))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866378 (= res!588663 (validMask!0 mask!1196))))

(declare-fun b!866379 () Bool)

(declare-fun e!482620 () Bool)

(declare-fun e!482613 () Bool)

(assert (=> b!866379 (= e!482620 (and e!482613 mapRes!26891))))

(declare-fun condMapEmpty!26891 () Bool)

(declare-fun mapDefault!26891 () ValueCell!7991)

