; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74524 () Bool)

(assert start!74524)

(declare-fun b_free!15213 () Bool)

(declare-fun b_next!15213 () Bool)

(assert (=> start!74524 (= b_free!15213 (not b_next!15213))))

(declare-fun tp!53321 () Bool)

(declare-fun b_and!25089 () Bool)

(assert (=> start!74524 (= tp!53321 b_and!25089)))

(declare-fun res!596355 () Bool)

(declare-fun e!488632 () Bool)

(assert (=> start!74524 (=> (not res!596355) (not e!488632))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51042 0))(
  ( (array!51043 (arr!24547 (Array (_ BitVec 32) (_ BitVec 64))) (size!24987 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51042)

(assert (=> start!74524 (= res!596355 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24987 _keys!868))))))

(assert (=> start!74524 e!488632))

(declare-fun tp_is_empty!17457 () Bool)

(assert (=> start!74524 tp_is_empty!17457))

(assert (=> start!74524 true))

(assert (=> start!74524 tp!53321))

(declare-fun array_inv!19350 (array!51042) Bool)

(assert (=> start!74524 (array_inv!19350 _keys!868)))

(declare-datatypes ((V!28323 0))(
  ( (V!28324 (val!8776 Int)) )
))
(declare-datatypes ((ValueCell!8289 0))(
  ( (ValueCellFull!8289 (v!11216 V!28323)) (EmptyCell!8289) )
))
(declare-datatypes ((array!51044 0))(
  ( (array!51045 (arr!24548 (Array (_ BitVec 32) ValueCell!8289)) (size!24988 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51044)

(declare-fun e!488631 () Bool)

(declare-fun array_inv!19351 (array!51044) Bool)

(assert (=> start!74524 (and (array_inv!19351 _values!688) e!488631)))

(declare-fun b!877850 () Bool)

(declare-fun res!596359 () Bool)

(assert (=> b!877850 (=> (not res!596359) (not e!488632))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877850 (= res!596359 (validMask!0 mask!1196))))

(declare-fun b!877851 () Bool)

(declare-fun res!596358 () Bool)

(assert (=> b!877851 (=> (not res!596358) (not e!488632))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877851 (= res!596358 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27801 () Bool)

(declare-fun mapRes!27801 () Bool)

(assert (=> mapIsEmpty!27801 mapRes!27801))

(declare-fun b!877852 () Bool)

(declare-fun e!488633 () Bool)

(assert (=> b!877852 (= e!488633 tp_is_empty!17457)))

(declare-fun b!877853 () Bool)

(assert (=> b!877853 (= e!488631 (and e!488633 mapRes!27801))))

(declare-fun condMapEmpty!27801 () Bool)

(declare-fun mapDefault!27801 () ValueCell!8289)

(assert (=> b!877853 (= condMapEmpty!27801 (= (arr!24548 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8289)) mapDefault!27801)))))

(declare-fun b!877854 () Bool)

(declare-fun e!488634 () Bool)

(assert (=> b!877854 (= e!488634 tp_is_empty!17457)))

(declare-fun b!877855 () Bool)

(assert (=> b!877855 (= e!488632 false)))

(declare-datatypes ((tuple2!11604 0))(
  ( (tuple2!11605 (_1!5813 (_ BitVec 64)) (_2!5813 V!28323)) )
))
(declare-datatypes ((List!17419 0))(
  ( (Nil!17416) (Cons!17415 (h!18546 tuple2!11604) (t!24508 List!17419)) )
))
(declare-datatypes ((ListLongMap!10373 0))(
  ( (ListLongMap!10374 (toList!5202 List!17419)) )
))
(declare-fun lt!397148 () ListLongMap!10373)

(declare-fun v!557 () V!28323)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28323)

(declare-fun zeroValue!654 () V!28323)

(declare-fun getCurrentListMapNoExtraKeys!3169 (array!51042 array!51044 (_ BitVec 32) (_ BitVec 32) V!28323 V!28323 (_ BitVec 32) Int) ListLongMap!10373)

(assert (=> b!877855 (= lt!397148 (getCurrentListMapNoExtraKeys!3169 _keys!868 (array!51045 (store (arr!24548 _values!688) i!612 (ValueCellFull!8289 v!557)) (size!24988 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397149 () ListLongMap!10373)

(assert (=> b!877855 (= lt!397149 (getCurrentListMapNoExtraKeys!3169 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877856 () Bool)

(declare-fun res!596356 () Bool)

(assert (=> b!877856 (=> (not res!596356) (not e!488632))))

(assert (=> b!877856 (= res!596356 (and (= (size!24988 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24987 _keys!868) (size!24988 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877857 () Bool)

(declare-fun res!596360 () Bool)

(assert (=> b!877857 (=> (not res!596360) (not e!488632))))

(assert (=> b!877857 (= res!596360 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24987 _keys!868))))))

(declare-fun b!877858 () Bool)

(declare-fun res!596354 () Bool)

(assert (=> b!877858 (=> (not res!596354) (not e!488632))))

(assert (=> b!877858 (= res!596354 (and (= (select (arr!24547 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877859 () Bool)

(declare-fun res!596357 () Bool)

(assert (=> b!877859 (=> (not res!596357) (not e!488632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51042 (_ BitVec 32)) Bool)

(assert (=> b!877859 (= res!596357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27801 () Bool)

(declare-fun tp!53320 () Bool)

(assert (=> mapNonEmpty!27801 (= mapRes!27801 (and tp!53320 e!488634))))

(declare-fun mapValue!27801 () ValueCell!8289)

(declare-fun mapKey!27801 () (_ BitVec 32))

(declare-fun mapRest!27801 () (Array (_ BitVec 32) ValueCell!8289))

(assert (=> mapNonEmpty!27801 (= (arr!24548 _values!688) (store mapRest!27801 mapKey!27801 mapValue!27801))))

(declare-fun b!877860 () Bool)

(declare-fun res!596353 () Bool)

(assert (=> b!877860 (=> (not res!596353) (not e!488632))))

(declare-datatypes ((List!17420 0))(
  ( (Nil!17417) (Cons!17416 (h!18547 (_ BitVec 64)) (t!24509 List!17420)) )
))
(declare-fun arrayNoDuplicates!0 (array!51042 (_ BitVec 32) List!17420) Bool)

(assert (=> b!877860 (= res!596353 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17417))))

(assert (= (and start!74524 res!596355) b!877850))

(assert (= (and b!877850 res!596359) b!877856))

(assert (= (and b!877856 res!596356) b!877859))

(assert (= (and b!877859 res!596357) b!877860))

(assert (= (and b!877860 res!596353) b!877857))

(assert (= (and b!877857 res!596360) b!877851))

(assert (= (and b!877851 res!596358) b!877858))

(assert (= (and b!877858 res!596354) b!877855))

(assert (= (and b!877853 condMapEmpty!27801) mapIsEmpty!27801))

(assert (= (and b!877853 (not condMapEmpty!27801)) mapNonEmpty!27801))

(get-info :version)

(assert (= (and mapNonEmpty!27801 ((_ is ValueCellFull!8289) mapValue!27801)) b!877854))

(assert (= (and b!877853 ((_ is ValueCellFull!8289) mapDefault!27801)) b!877852))

(assert (= start!74524 b!877853))

(declare-fun m!817917 () Bool)

(assert (=> b!877860 m!817917))

(declare-fun m!817919 () Bool)

(assert (=> b!877858 m!817919))

(declare-fun m!817921 () Bool)

(assert (=> b!877855 m!817921))

(declare-fun m!817923 () Bool)

(assert (=> b!877855 m!817923))

(declare-fun m!817925 () Bool)

(assert (=> b!877855 m!817925))

(declare-fun m!817927 () Bool)

(assert (=> b!877851 m!817927))

(declare-fun m!817929 () Bool)

(assert (=> mapNonEmpty!27801 m!817929))

(declare-fun m!817931 () Bool)

(assert (=> start!74524 m!817931))

(declare-fun m!817933 () Bool)

(assert (=> start!74524 m!817933))

(declare-fun m!817935 () Bool)

(assert (=> b!877859 m!817935))

(declare-fun m!817937 () Bool)

(assert (=> b!877850 m!817937))

(check-sat tp_is_empty!17457 (not b!877855) (not b!877851) (not b!877850) (not b!877859) b_and!25089 (not start!74524) (not b!877860) (not mapNonEmpty!27801) (not b_next!15213))
(check-sat b_and!25089 (not b_next!15213))
