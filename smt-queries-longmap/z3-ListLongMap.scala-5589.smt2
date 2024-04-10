; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73320 () Bool)

(assert start!73320)

(declare-fun b_free!14235 () Bool)

(declare-fun b_next!14235 () Bool)

(assert (=> start!73320 (= b_free!14235 (not b_next!14235))))

(declare-fun tp!50208 () Bool)

(declare-fun b_and!23591 () Bool)

(assert (=> start!73320 (= tp!50208 b_and!23591)))

(declare-fun b!855403 () Bool)

(declare-fun res!580930 () Bool)

(declare-fun e!476905 () Bool)

(assert (=> b!855403 (=> (not res!580930) (not e!476905))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48938 0))(
  ( (array!48939 (arr!23500 (Array (_ BitVec 32) (_ BitVec 64))) (size!23940 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48938)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855403 (= res!580930 (and (= (select (arr!23500 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855404 () Bool)

(declare-fun res!580936 () Bool)

(assert (=> b!855404 (=> (not res!580936) (not e!476905))))

(assert (=> b!855404 (= res!580936 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23940 _keys!868))))))

(declare-fun b!855405 () Bool)

(declare-fun e!476904 () Bool)

(declare-fun tp_is_empty!16371 () Bool)

(assert (=> b!855405 (= e!476904 tp_is_empty!16371)))

(declare-fun mapNonEmpty!26156 () Bool)

(declare-fun mapRes!26156 () Bool)

(declare-fun tp!50209 () Bool)

(declare-fun e!476908 () Bool)

(assert (=> mapNonEmpty!26156 (= mapRes!26156 (and tp!50209 e!476908))))

(declare-fun mapKey!26156 () (_ BitVec 32))

(declare-datatypes ((V!26875 0))(
  ( (V!26876 (val!8233 Int)) )
))
(declare-datatypes ((ValueCell!7746 0))(
  ( (ValueCellFull!7746 (v!10658 V!26875)) (EmptyCell!7746) )
))
(declare-fun mapValue!26156 () ValueCell!7746)

(declare-datatypes ((array!48940 0))(
  ( (array!48941 (arr!23501 (Array (_ BitVec 32) ValueCell!7746)) (size!23941 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48940)

(declare-fun mapRest!26156 () (Array (_ BitVec 32) ValueCell!7746))

(assert (=> mapNonEmpty!26156 (= (arr!23501 _values!688) (store mapRest!26156 mapKey!26156 mapValue!26156))))

(declare-fun b!855406 () Bool)

(declare-fun res!580935 () Bool)

(assert (=> b!855406 (=> (not res!580935) (not e!476905))))

(declare-datatypes ((List!16661 0))(
  ( (Nil!16658) (Cons!16657 (h!17788 (_ BitVec 64)) (t!23302 List!16661)) )
))
(declare-fun arrayNoDuplicates!0 (array!48938 (_ BitVec 32) List!16661) Bool)

(assert (=> b!855406 (= res!580935 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16658))))

(declare-fun mapIsEmpty!26156 () Bool)

(assert (=> mapIsEmpty!26156 mapRes!26156))

(declare-fun b!855407 () Bool)

(declare-fun res!580931 () Bool)

(assert (=> b!855407 (=> (not res!580931) (not e!476905))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48938 (_ BitVec 32)) Bool)

(assert (=> b!855407 (= res!580931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855408 () Bool)

(assert (=> b!855408 (= e!476905 false)))

(declare-datatypes ((tuple2!10848 0))(
  ( (tuple2!10849 (_1!5435 (_ BitVec 64)) (_2!5435 V!26875)) )
))
(declare-datatypes ((List!16662 0))(
  ( (Nil!16659) (Cons!16658 (h!17789 tuple2!10848) (t!23303 List!16662)) )
))
(declare-datatypes ((ListLongMap!9617 0))(
  ( (ListLongMap!9618 (toList!4824 List!16662)) )
))
(declare-fun lt!385692 () ListLongMap!9617)

(declare-fun v!557 () V!26875)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26875)

(declare-fun zeroValue!654 () V!26875)

(declare-fun getCurrentListMapNoExtraKeys!2805 (array!48938 array!48940 (_ BitVec 32) (_ BitVec 32) V!26875 V!26875 (_ BitVec 32) Int) ListLongMap!9617)

(assert (=> b!855408 (= lt!385692 (getCurrentListMapNoExtraKeys!2805 _keys!868 (array!48941 (store (arr!23501 _values!688) i!612 (ValueCellFull!7746 v!557)) (size!23941 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385693 () ListLongMap!9617)

(assert (=> b!855408 (= lt!385693 (getCurrentListMapNoExtraKeys!2805 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855409 () Bool)

(declare-fun e!476906 () Bool)

(assert (=> b!855409 (= e!476906 (and e!476904 mapRes!26156))))

(declare-fun condMapEmpty!26156 () Bool)

(declare-fun mapDefault!26156 () ValueCell!7746)

(assert (=> b!855409 (= condMapEmpty!26156 (= (arr!23501 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7746)) mapDefault!26156)))))

(declare-fun res!580937 () Bool)

(assert (=> start!73320 (=> (not res!580937) (not e!476905))))

(assert (=> start!73320 (= res!580937 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23940 _keys!868))))))

(assert (=> start!73320 e!476905))

(assert (=> start!73320 tp_is_empty!16371))

(assert (=> start!73320 true))

(assert (=> start!73320 tp!50208))

(declare-fun array_inv!18618 (array!48938) Bool)

(assert (=> start!73320 (array_inv!18618 _keys!868)))

(declare-fun array_inv!18619 (array!48940) Bool)

(assert (=> start!73320 (and (array_inv!18619 _values!688) e!476906)))

(declare-fun b!855410 () Bool)

(declare-fun res!580932 () Bool)

(assert (=> b!855410 (=> (not res!580932) (not e!476905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855410 (= res!580932 (validMask!0 mask!1196))))

(declare-fun b!855411 () Bool)

(assert (=> b!855411 (= e!476908 tp_is_empty!16371)))

(declare-fun b!855412 () Bool)

(declare-fun res!580934 () Bool)

(assert (=> b!855412 (=> (not res!580934) (not e!476905))))

(assert (=> b!855412 (= res!580934 (and (= (size!23941 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23940 _keys!868) (size!23941 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855413 () Bool)

(declare-fun res!580933 () Bool)

(assert (=> b!855413 (=> (not res!580933) (not e!476905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855413 (= res!580933 (validKeyInArray!0 k0!854))))

(assert (= (and start!73320 res!580937) b!855410))

(assert (= (and b!855410 res!580932) b!855412))

(assert (= (and b!855412 res!580934) b!855407))

(assert (= (and b!855407 res!580931) b!855406))

(assert (= (and b!855406 res!580935) b!855404))

(assert (= (and b!855404 res!580936) b!855413))

(assert (= (and b!855413 res!580933) b!855403))

(assert (= (and b!855403 res!580930) b!855408))

(assert (= (and b!855409 condMapEmpty!26156) mapIsEmpty!26156))

(assert (= (and b!855409 (not condMapEmpty!26156)) mapNonEmpty!26156))

(get-info :version)

(assert (= (and mapNonEmpty!26156 ((_ is ValueCellFull!7746) mapValue!26156)) b!855411))

(assert (= (and b!855409 ((_ is ValueCellFull!7746) mapDefault!26156)) b!855405))

(assert (= start!73320 b!855409))

(declare-fun m!796617 () Bool)

(assert (=> mapNonEmpty!26156 m!796617))

(declare-fun m!796619 () Bool)

(assert (=> b!855408 m!796619))

(declare-fun m!796621 () Bool)

(assert (=> b!855408 m!796621))

(declare-fun m!796623 () Bool)

(assert (=> b!855408 m!796623))

(declare-fun m!796625 () Bool)

(assert (=> b!855410 m!796625))

(declare-fun m!796627 () Bool)

(assert (=> b!855413 m!796627))

(declare-fun m!796629 () Bool)

(assert (=> b!855403 m!796629))

(declare-fun m!796631 () Bool)

(assert (=> b!855407 m!796631))

(declare-fun m!796633 () Bool)

(assert (=> start!73320 m!796633))

(declare-fun m!796635 () Bool)

(assert (=> start!73320 m!796635))

(declare-fun m!796637 () Bool)

(assert (=> b!855406 m!796637))

(check-sat (not b!855407) (not mapNonEmpty!26156) (not b!855406) (not b!855413) (not start!73320) b_and!23591 tp_is_empty!16371 (not b!855408) (not b!855410) (not b_next!14235))
(check-sat b_and!23591 (not b_next!14235))
