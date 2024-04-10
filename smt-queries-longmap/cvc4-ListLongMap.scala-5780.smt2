; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74586 () Bool)

(assert start!74586)

(declare-fun b_free!15275 () Bool)

(declare-fun b_next!15275 () Bool)

(assert (=> start!74586 (= b_free!15275 (not b_next!15275))))

(declare-fun tp!53507 () Bool)

(declare-fun b_and!25151 () Bool)

(assert (=> start!74586 (= tp!53507 b_and!25151)))

(declare-fun mapIsEmpty!27894 () Bool)

(declare-fun mapRes!27894 () Bool)

(assert (=> mapIsEmpty!27894 mapRes!27894))

(declare-fun b!878898 () Bool)

(declare-fun e!489123 () Bool)

(declare-fun tp_is_empty!17519 () Bool)

(assert (=> b!878898 (= e!489123 tp_is_empty!17519)))

(declare-fun b!878899 () Bool)

(declare-fun e!489121 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((V!28405 0))(
  ( (V!28406 (val!8807 Int)) )
))
(declare-datatypes ((ValueCell!8320 0))(
  ( (ValueCellFull!8320 (v!11247 V!28405)) (EmptyCell!8320) )
))
(declare-datatypes ((array!51164 0))(
  ( (array!51165 (arr!24608 (Array (_ BitVec 32) ValueCell!8320)) (size!25048 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51164)

(assert (=> b!878899 (= e!489121 (bvslt i!612 (size!25048 _values!688)))))

(declare-fun b!878900 () Bool)

(declare-fun e!489126 () Bool)

(declare-fun e!489127 () Bool)

(assert (=> b!878900 (= e!489126 e!489127)))

(declare-fun res!597124 () Bool)

(assert (=> b!878900 (=> (not res!597124) (not e!489127))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878900 (= res!597124 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11646 0))(
  ( (tuple2!11647 (_1!5834 (_ BitVec 64)) (_2!5834 V!28405)) )
))
(declare-datatypes ((List!17463 0))(
  ( (Nil!17460) (Cons!17459 (h!18590 tuple2!11646) (t!24552 List!17463)) )
))
(declare-datatypes ((ListLongMap!10415 0))(
  ( (ListLongMap!10416 (toList!5223 List!17463)) )
))
(declare-fun lt!397370 () ListLongMap!10415)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51166 0))(
  ( (array!51167 (arr!24609 (Array (_ BitVec 32) (_ BitVec 64))) (size!25049 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51166)

(declare-fun lt!397368 () array!51164)

(declare-fun minValue!654 () V!28405)

(declare-fun zeroValue!654 () V!28405)

(declare-fun getCurrentListMapNoExtraKeys!3190 (array!51166 array!51164 (_ BitVec 32) (_ BitVec 32) V!28405 V!28405 (_ BitVec 32) Int) ListLongMap!10415)

(assert (=> b!878900 (= lt!397370 (getCurrentListMapNoExtraKeys!3190 _keys!868 lt!397368 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28405)

(assert (=> b!878900 (= lt!397368 (array!51165 (store (arr!24608 _values!688) i!612 (ValueCellFull!8320 v!557)) (size!25048 _values!688)))))

(declare-fun lt!397371 () ListLongMap!10415)

(assert (=> b!878900 (= lt!397371 (getCurrentListMapNoExtraKeys!3190 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878901 () Bool)

(declare-fun res!597125 () Bool)

(assert (=> b!878901 (=> (not res!597125) (not e!489126))))

(assert (=> b!878901 (= res!597125 (and (= (size!25048 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25049 _keys!868) (size!25048 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878902 () Bool)

(declare-fun e!489125 () Bool)

(assert (=> b!878902 (= e!489125 tp_is_empty!17519)))

(declare-fun b!878903 () Bool)

(declare-fun res!597129 () Bool)

(assert (=> b!878903 (=> (not res!597129) (not e!489126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51166 (_ BitVec 32)) Bool)

(assert (=> b!878903 (= res!597129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878904 () Bool)

(declare-fun res!597122 () Bool)

(assert (=> b!878904 (=> (not res!597122) (not e!489126))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878904 (= res!597122 (validKeyInArray!0 k!854))))

(declare-fun b!878905 () Bool)

(declare-fun res!597131 () Bool)

(assert (=> b!878905 (=> (not res!597131) (not e!489126))))

(declare-datatypes ((List!17464 0))(
  ( (Nil!17461) (Cons!17460 (h!18591 (_ BitVec 64)) (t!24553 List!17464)) )
))
(declare-fun arrayNoDuplicates!0 (array!51166 (_ BitVec 32) List!17464) Bool)

(assert (=> b!878905 (= res!597131 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17461))))

(declare-fun b!878906 () Bool)

(declare-fun res!597126 () Bool)

(assert (=> b!878906 (=> (not res!597126) (not e!489126))))

(assert (=> b!878906 (= res!597126 (and (= (select (arr!24609 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!597130 () Bool)

(assert (=> start!74586 (=> (not res!597130) (not e!489126))))

(assert (=> start!74586 (= res!597130 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25049 _keys!868))))))

(assert (=> start!74586 e!489126))

(assert (=> start!74586 tp_is_empty!17519))

(assert (=> start!74586 true))

(assert (=> start!74586 tp!53507))

(declare-fun array_inv!19392 (array!51166) Bool)

(assert (=> start!74586 (array_inv!19392 _keys!868)))

(declare-fun e!489124 () Bool)

(declare-fun array_inv!19393 (array!51164) Bool)

(assert (=> start!74586 (and (array_inv!19393 _values!688) e!489124)))

(declare-fun b!878907 () Bool)

(declare-fun res!597128 () Bool)

(assert (=> b!878907 (=> (not res!597128) (not e!489126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878907 (= res!597128 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27894 () Bool)

(declare-fun tp!53506 () Bool)

(assert (=> mapNonEmpty!27894 (= mapRes!27894 (and tp!53506 e!489123))))

(declare-fun mapRest!27894 () (Array (_ BitVec 32) ValueCell!8320))

(declare-fun mapKey!27894 () (_ BitVec 32))

(declare-fun mapValue!27894 () ValueCell!8320)

(assert (=> mapNonEmpty!27894 (= (arr!24608 _values!688) (store mapRest!27894 mapKey!27894 mapValue!27894))))

(declare-fun b!878908 () Bool)

(assert (=> b!878908 (= e!489124 (and e!489125 mapRes!27894))))

(declare-fun condMapEmpty!27894 () Bool)

(declare-fun mapDefault!27894 () ValueCell!8320)

