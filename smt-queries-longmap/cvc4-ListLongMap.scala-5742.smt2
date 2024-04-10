; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74284 () Bool)

(assert start!74284)

(declare-fun b_free!15047 () Bool)

(declare-fun b_next!15047 () Bool)

(assert (=> start!74284 (= b_free!15047 (not b_next!15047))))

(declare-fun tp!52816 () Bool)

(declare-fun b_and!24823 () Bool)

(assert (=> start!74284 (= tp!52816 b_and!24823)))

(declare-fun b!873950 () Bool)

(declare-fun e!486647 () Bool)

(declare-fun tp_is_empty!17291 () Bool)

(assert (=> b!873950 (= e!486647 tp_is_empty!17291)))

(declare-fun b!873951 () Bool)

(declare-fun res!593894 () Bool)

(declare-fun e!486646 () Bool)

(assert (=> b!873951 (=> (not res!593894) (not e!486646))))

(declare-datatypes ((array!50710 0))(
  ( (array!50711 (arr!24383 (Array (_ BitVec 32) (_ BitVec 64))) (size!24823 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50710)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50710 (_ BitVec 32)) Bool)

(assert (=> b!873951 (= res!593894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873952 () Bool)

(declare-fun res!593891 () Bool)

(assert (=> b!873952 (=> (not res!593891) (not e!486646))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28101 0))(
  ( (V!28102 (val!8693 Int)) )
))
(declare-datatypes ((ValueCell!8206 0))(
  ( (ValueCellFull!8206 (v!11122 V!28101)) (EmptyCell!8206) )
))
(declare-datatypes ((array!50712 0))(
  ( (array!50713 (arr!24384 (Array (_ BitVec 32) ValueCell!8206)) (size!24824 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50712)

(assert (=> b!873952 (= res!593891 (and (= (size!24824 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24823 _keys!868) (size!24824 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873953 () Bool)

(declare-fun e!486650 () Bool)

(assert (=> b!873953 (= e!486650 tp_is_empty!17291)))

(declare-fun b!873955 () Bool)

(declare-fun res!593893 () Bool)

(assert (=> b!873955 (=> (not res!593893) (not e!486646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873955 (= res!593893 (validMask!0 mask!1196))))

(declare-fun b!873956 () Bool)

(assert (=> b!873956 (= e!486646 false)))

(declare-fun v!557 () V!28101)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28101)

(declare-fun zeroValue!654 () V!28101)

(declare-datatypes ((tuple2!11488 0))(
  ( (tuple2!11489 (_1!5755 (_ BitVec 64)) (_2!5755 V!28101)) )
))
(declare-datatypes ((List!17307 0))(
  ( (Nil!17304) (Cons!17303 (h!18434 tuple2!11488) (t!24348 List!17307)) )
))
(declare-datatypes ((ListLongMap!10257 0))(
  ( (ListLongMap!10258 (toList!5144 List!17307)) )
))
(declare-fun lt!395854 () ListLongMap!10257)

(declare-fun getCurrentListMapNoExtraKeys!3111 (array!50710 array!50712 (_ BitVec 32) (_ BitVec 32) V!28101 V!28101 (_ BitVec 32) Int) ListLongMap!10257)

(assert (=> b!873956 (= lt!395854 (getCurrentListMapNoExtraKeys!3111 _keys!868 (array!50713 (store (arr!24384 _values!688) i!612 (ValueCellFull!8206 v!557)) (size!24824 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395855 () ListLongMap!10257)

(assert (=> b!873956 (= lt!395855 (getCurrentListMapNoExtraKeys!3111 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27545 () Bool)

(declare-fun mapRes!27545 () Bool)

(declare-fun tp!52815 () Bool)

(assert (=> mapNonEmpty!27545 (= mapRes!27545 (and tp!52815 e!486647))))

(declare-fun mapRest!27545 () (Array (_ BitVec 32) ValueCell!8206))

(declare-fun mapValue!27545 () ValueCell!8206)

(declare-fun mapKey!27545 () (_ BitVec 32))

(assert (=> mapNonEmpty!27545 (= (arr!24384 _values!688) (store mapRest!27545 mapKey!27545 mapValue!27545))))

(declare-fun b!873957 () Bool)

(declare-fun res!593898 () Bool)

(assert (=> b!873957 (=> (not res!593898) (not e!486646))))

(assert (=> b!873957 (= res!593898 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24823 _keys!868))))))

(declare-fun b!873958 () Bool)

(declare-fun res!593897 () Bool)

(assert (=> b!873958 (=> (not res!593897) (not e!486646))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873958 (= res!593897 (validKeyInArray!0 k!854))))

(declare-fun b!873959 () Bool)

(declare-fun res!593892 () Bool)

(assert (=> b!873959 (=> (not res!593892) (not e!486646))))

(assert (=> b!873959 (= res!593892 (and (= (select (arr!24383 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!873960 () Bool)

(declare-fun res!593896 () Bool)

(assert (=> b!873960 (=> (not res!593896) (not e!486646))))

(declare-datatypes ((List!17308 0))(
  ( (Nil!17305) (Cons!17304 (h!18435 (_ BitVec 64)) (t!24349 List!17308)) )
))
(declare-fun arrayNoDuplicates!0 (array!50710 (_ BitVec 32) List!17308) Bool)

(assert (=> b!873960 (= res!593896 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17305))))

(declare-fun mapIsEmpty!27545 () Bool)

(assert (=> mapIsEmpty!27545 mapRes!27545))

(declare-fun b!873954 () Bool)

(declare-fun e!486649 () Bool)

(assert (=> b!873954 (= e!486649 (and e!486650 mapRes!27545))))

(declare-fun condMapEmpty!27545 () Bool)

(declare-fun mapDefault!27545 () ValueCell!8206)

