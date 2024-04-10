; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73984 () Bool)

(assert start!73984)

(declare-fun b_free!14899 () Bool)

(declare-fun b_next!14899 () Bool)

(assert (=> start!73984 (= b_free!14899 (not b_next!14899))))

(declare-fun tp!52200 () Bool)

(declare-fun b_and!24651 () Bool)

(assert (=> start!73984 (= tp!52200 b_and!24651)))

(declare-fun b!869835 () Bool)

(declare-fun res!591157 () Bool)

(declare-fun e!484390 () Bool)

(assert (=> b!869835 (=> (not res!591157) (not e!484390))))

(declare-datatypes ((array!50216 0))(
  ( (array!50217 (arr!24139 (Array (_ BitVec 32) (_ BitVec 64))) (size!24579 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50216)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50216 (_ BitVec 32)) Bool)

(assert (=> b!869835 (= res!591157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869836 () Bool)

(declare-fun res!591155 () Bool)

(assert (=> b!869836 (=> (not res!591155) (not e!484390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869836 (= res!591155 (validMask!0 mask!1196))))

(declare-fun b!869837 () Bool)

(declare-fun res!591156 () Bool)

(assert (=> b!869837 (=> (not res!591156) (not e!484390))))

(declare-datatypes ((List!17170 0))(
  ( (Nil!17167) (Cons!17166 (h!18297 (_ BitVec 64)) (t!24207 List!17170)) )
))
(declare-fun arrayNoDuplicates!0 (array!50216 (_ BitVec 32) List!17170) Bool)

(assert (=> b!869837 (= res!591156 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17167))))

(declare-fun b!869838 () Bool)

(declare-fun e!484392 () Bool)

(declare-fun tp_is_empty!17035 () Bool)

(assert (=> b!869838 (= e!484392 tp_is_empty!17035)))

(declare-fun b!869839 () Bool)

(declare-fun res!591150 () Bool)

(assert (=> b!869839 (=> (not res!591150) (not e!484390))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869839 (= res!591150 (and (= (select (arr!24139 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!869840 () Bool)

(declare-fun e!484388 () Bool)

(assert (=> b!869840 (= e!484388 tp_is_empty!17035)))

(declare-fun b!869841 () Bool)

(declare-fun res!591152 () Bool)

(assert (=> b!869841 (=> (not res!591152) (not e!484390))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27761 0))(
  ( (V!27762 (val!8565 Int)) )
))
(declare-datatypes ((ValueCell!8078 0))(
  ( (ValueCellFull!8078 (v!10990 V!27761)) (EmptyCell!8078) )
))
(declare-datatypes ((array!50218 0))(
  ( (array!50219 (arr!24140 (Array (_ BitVec 32) ValueCell!8078)) (size!24580 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50218)

(assert (=> b!869841 (= res!591152 (and (= (size!24580 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24579 _keys!868) (size!24580 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27152 () Bool)

(declare-fun mapRes!27152 () Bool)

(declare-fun tp!52201 () Bool)

(assert (=> mapNonEmpty!27152 (= mapRes!27152 (and tp!52201 e!484392))))

(declare-fun mapRest!27152 () (Array (_ BitVec 32) ValueCell!8078))

(declare-fun mapValue!27152 () ValueCell!8078)

(declare-fun mapKey!27152 () (_ BitVec 32))

(assert (=> mapNonEmpty!27152 (= (arr!24140 _values!688) (store mapRest!27152 mapKey!27152 mapValue!27152))))

(declare-fun b!869842 () Bool)

(declare-fun e!484391 () Bool)

(assert (=> b!869842 (= e!484391 (and e!484388 mapRes!27152))))

(declare-fun condMapEmpty!27152 () Bool)

(declare-fun mapDefault!27152 () ValueCell!8078)

