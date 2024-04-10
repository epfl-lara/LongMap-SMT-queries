; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73332 () Bool)

(assert start!73332)

(declare-fun b_free!14247 () Bool)

(declare-fun b_next!14247 () Bool)

(assert (=> start!73332 (= b_free!14247 (not b_next!14247))))

(declare-fun tp!50245 () Bool)

(declare-fun b_and!23603 () Bool)

(assert (=> start!73332 (= tp!50245 b_and!23603)))

(declare-fun b!855601 () Bool)

(declare-fun res!581081 () Bool)

(declare-fun e!476995 () Bool)

(assert (=> b!855601 (=> (not res!581081) (not e!476995))))

(declare-datatypes ((array!48962 0))(
  ( (array!48963 (arr!23512 (Array (_ BitVec 32) (_ BitVec 64))) (size!23952 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48962)

(declare-datatypes ((List!16671 0))(
  ( (Nil!16668) (Cons!16667 (h!17798 (_ BitVec 64)) (t!23312 List!16671)) )
))
(declare-fun arrayNoDuplicates!0 (array!48962 (_ BitVec 32) List!16671) Bool)

(assert (=> b!855601 (= res!581081 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16668))))

(declare-fun b!855602 () Bool)

(declare-fun res!581079 () Bool)

(assert (=> b!855602 (=> (not res!581079) (not e!476995))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48962 (_ BitVec 32)) Bool)

(assert (=> b!855602 (= res!581079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26174 () Bool)

(declare-fun mapRes!26174 () Bool)

(assert (=> mapIsEmpty!26174 mapRes!26174))

(declare-fun mapNonEmpty!26174 () Bool)

(declare-fun tp!50244 () Bool)

(declare-fun e!476998 () Bool)

(assert (=> mapNonEmpty!26174 (= mapRes!26174 (and tp!50244 e!476998))))

(declare-datatypes ((V!26891 0))(
  ( (V!26892 (val!8239 Int)) )
))
(declare-datatypes ((ValueCell!7752 0))(
  ( (ValueCellFull!7752 (v!10664 V!26891)) (EmptyCell!7752) )
))
(declare-fun mapRest!26174 () (Array (_ BitVec 32) ValueCell!7752))

(declare-fun mapKey!26174 () (_ BitVec 32))

(declare-fun mapValue!26174 () ValueCell!7752)

(declare-datatypes ((array!48964 0))(
  ( (array!48965 (arr!23513 (Array (_ BitVec 32) ValueCell!7752)) (size!23953 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48964)

(assert (=> mapNonEmpty!26174 (= (arr!23513 _values!688) (store mapRest!26174 mapKey!26174 mapValue!26174))))

(declare-fun b!855604 () Bool)

(declare-fun res!581074 () Bool)

(assert (=> b!855604 (=> (not res!581074) (not e!476995))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855604 (= res!581074 (and (= (select (arr!23512 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855605 () Bool)

(declare-fun res!581076 () Bool)

(assert (=> b!855605 (=> (not res!581076) (not e!476995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855605 (= res!581076 (validKeyInArray!0 k0!854))))

(declare-fun b!855606 () Bool)

(assert (=> b!855606 (= e!476995 false)))

(declare-fun v!557 () V!26891)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26891)

(declare-fun zeroValue!654 () V!26891)

(declare-datatypes ((tuple2!10858 0))(
  ( (tuple2!10859 (_1!5440 (_ BitVec 64)) (_2!5440 V!26891)) )
))
(declare-datatypes ((List!16672 0))(
  ( (Nil!16669) (Cons!16668 (h!17799 tuple2!10858) (t!23313 List!16672)) )
))
(declare-datatypes ((ListLongMap!9627 0))(
  ( (ListLongMap!9628 (toList!4829 List!16672)) )
))
(declare-fun lt!385728 () ListLongMap!9627)

(declare-fun getCurrentListMapNoExtraKeys!2810 (array!48962 array!48964 (_ BitVec 32) (_ BitVec 32) V!26891 V!26891 (_ BitVec 32) Int) ListLongMap!9627)

(assert (=> b!855606 (= lt!385728 (getCurrentListMapNoExtraKeys!2810 _keys!868 (array!48965 (store (arr!23513 _values!688) i!612 (ValueCellFull!7752 v!557)) (size!23953 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385729 () ListLongMap!9627)

(assert (=> b!855606 (= lt!385729 (getCurrentListMapNoExtraKeys!2810 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855603 () Bool)

(declare-fun e!476997 () Bool)

(declare-fun tp_is_empty!16383 () Bool)

(assert (=> b!855603 (= e!476997 tp_is_empty!16383)))

(declare-fun res!581077 () Bool)

(assert (=> start!73332 (=> (not res!581077) (not e!476995))))

(assert (=> start!73332 (= res!581077 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23952 _keys!868))))))

(assert (=> start!73332 e!476995))

(assert (=> start!73332 tp_is_empty!16383))

(assert (=> start!73332 true))

(assert (=> start!73332 tp!50245))

(declare-fun array_inv!18630 (array!48962) Bool)

(assert (=> start!73332 (array_inv!18630 _keys!868)))

(declare-fun e!476996 () Bool)

(declare-fun array_inv!18631 (array!48964) Bool)

(assert (=> start!73332 (and (array_inv!18631 _values!688) e!476996)))

(declare-fun b!855607 () Bool)

(assert (=> b!855607 (= e!476996 (and e!476997 mapRes!26174))))

(declare-fun condMapEmpty!26174 () Bool)

(declare-fun mapDefault!26174 () ValueCell!7752)

(assert (=> b!855607 (= condMapEmpty!26174 (= (arr!23513 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7752)) mapDefault!26174)))))

(declare-fun b!855608 () Bool)

(declare-fun res!581080 () Bool)

(assert (=> b!855608 (=> (not res!581080) (not e!476995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855608 (= res!581080 (validMask!0 mask!1196))))

(declare-fun b!855609 () Bool)

(declare-fun res!581078 () Bool)

(assert (=> b!855609 (=> (not res!581078) (not e!476995))))

(assert (=> b!855609 (= res!581078 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23952 _keys!868))))))

(declare-fun b!855610 () Bool)

(assert (=> b!855610 (= e!476998 tp_is_empty!16383)))

(declare-fun b!855611 () Bool)

(declare-fun res!581075 () Bool)

(assert (=> b!855611 (=> (not res!581075) (not e!476995))))

(assert (=> b!855611 (= res!581075 (and (= (size!23953 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23952 _keys!868) (size!23953 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73332 res!581077) b!855608))

(assert (= (and b!855608 res!581080) b!855611))

(assert (= (and b!855611 res!581075) b!855602))

(assert (= (and b!855602 res!581079) b!855601))

(assert (= (and b!855601 res!581081) b!855609))

(assert (= (and b!855609 res!581078) b!855605))

(assert (= (and b!855605 res!581076) b!855604))

(assert (= (and b!855604 res!581074) b!855606))

(assert (= (and b!855607 condMapEmpty!26174) mapIsEmpty!26174))

(assert (= (and b!855607 (not condMapEmpty!26174)) mapNonEmpty!26174))

(get-info :version)

(assert (= (and mapNonEmpty!26174 ((_ is ValueCellFull!7752) mapValue!26174)) b!855610))

(assert (= (and b!855607 ((_ is ValueCellFull!7752) mapDefault!26174)) b!855603))

(assert (= start!73332 b!855607))

(declare-fun m!796749 () Bool)

(assert (=> mapNonEmpty!26174 m!796749))

(declare-fun m!796751 () Bool)

(assert (=> b!855602 m!796751))

(declare-fun m!796753 () Bool)

(assert (=> b!855604 m!796753))

(declare-fun m!796755 () Bool)

(assert (=> b!855608 m!796755))

(declare-fun m!796757 () Bool)

(assert (=> b!855601 m!796757))

(declare-fun m!796759 () Bool)

(assert (=> start!73332 m!796759))

(declare-fun m!796761 () Bool)

(assert (=> start!73332 m!796761))

(declare-fun m!796763 () Bool)

(assert (=> b!855606 m!796763))

(declare-fun m!796765 () Bool)

(assert (=> b!855606 m!796765))

(declare-fun m!796767 () Bool)

(assert (=> b!855606 m!796767))

(declare-fun m!796769 () Bool)

(assert (=> b!855605 m!796769))

(check-sat (not b!855608) (not b!855601) (not start!73332) (not b_next!14247) (not b!855605) tp_is_empty!16383 (not mapNonEmpty!26174) b_and!23603 (not b!855602) (not b!855606))
(check-sat b_and!23603 (not b_next!14247))
