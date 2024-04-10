; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74330 () Bool)

(assert start!74330)

(declare-fun b_free!15093 () Bool)

(declare-fun b_next!15093 () Bool)

(assert (=> start!74330 (= b_free!15093 (not b_next!15093))))

(declare-fun tp!52954 () Bool)

(declare-fun b_and!24869 () Bool)

(assert (=> start!74330 (= tp!52954 b_and!24869)))

(declare-fun b!874709 () Bool)

(declare-fun res!594449 () Bool)

(declare-fun e!486992 () Bool)

(assert (=> b!874709 (=> (not res!594449) (not e!486992))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50802 0))(
  ( (array!50803 (arr!24429 (Array (_ BitVec 32) (_ BitVec 64))) (size!24869 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50802)

(assert (=> b!874709 (= res!594449 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24869 _keys!868))))))

(declare-fun mapIsEmpty!27614 () Bool)

(declare-fun mapRes!27614 () Bool)

(assert (=> mapIsEmpty!27614 mapRes!27614))

(declare-fun b!874710 () Bool)

(assert (=> b!874710 (= e!486992 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28163 0))(
  ( (V!28164 (val!8716 Int)) )
))
(declare-datatypes ((ValueCell!8229 0))(
  ( (ValueCellFull!8229 (v!11145 V!28163)) (EmptyCell!8229) )
))
(declare-datatypes ((array!50804 0))(
  ( (array!50805 (arr!24430 (Array (_ BitVec 32) ValueCell!8229)) (size!24870 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50804)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28163)

(declare-fun zeroValue!654 () V!28163)

(declare-datatypes ((tuple2!11518 0))(
  ( (tuple2!11519 (_1!5770 (_ BitVec 64)) (_2!5770 V!28163)) )
))
(declare-datatypes ((List!17340 0))(
  ( (Nil!17337) (Cons!17336 (h!18467 tuple2!11518) (t!24381 List!17340)) )
))
(declare-datatypes ((ListLongMap!10287 0))(
  ( (ListLongMap!10288 (toList!5159 List!17340)) )
))
(declare-fun lt!395993 () ListLongMap!10287)

(declare-fun v!557 () V!28163)

(declare-fun getCurrentListMapNoExtraKeys!3126 (array!50802 array!50804 (_ BitVec 32) (_ BitVec 32) V!28163 V!28163 (_ BitVec 32) Int) ListLongMap!10287)

(assert (=> b!874710 (= lt!395993 (getCurrentListMapNoExtraKeys!3126 _keys!868 (array!50805 (store (arr!24430 _values!688) i!612 (ValueCellFull!8229 v!557)) (size!24870 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395992 () ListLongMap!10287)

(assert (=> b!874710 (= lt!395992 (getCurrentListMapNoExtraKeys!3126 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874711 () Bool)

(declare-fun res!594448 () Bool)

(assert (=> b!874711 (=> (not res!594448) (not e!486992))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!874711 (= res!594448 (and (= (select (arr!24429 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!594447 () Bool)

(assert (=> start!74330 (=> (not res!594447) (not e!486992))))

(assert (=> start!74330 (= res!594447 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24869 _keys!868))))))

(assert (=> start!74330 e!486992))

(declare-fun tp_is_empty!17337 () Bool)

(assert (=> start!74330 tp_is_empty!17337))

(assert (=> start!74330 true))

(assert (=> start!74330 tp!52954))

(declare-fun array_inv!19264 (array!50802) Bool)

(assert (=> start!74330 (array_inv!19264 _keys!868)))

(declare-fun e!486991 () Bool)

(declare-fun array_inv!19265 (array!50804) Bool)

(assert (=> start!74330 (and (array_inv!19265 _values!688) e!486991)))

(declare-fun b!874712 () Bool)

(declare-fun res!594443 () Bool)

(assert (=> b!874712 (=> (not res!594443) (not e!486992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50802 (_ BitVec 32)) Bool)

(assert (=> b!874712 (= res!594443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874713 () Bool)

(declare-fun e!486993 () Bool)

(assert (=> b!874713 (= e!486993 tp_is_empty!17337)))

(declare-fun b!874714 () Bool)

(declare-fun res!594444 () Bool)

(assert (=> b!874714 (=> (not res!594444) (not e!486992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874714 (= res!594444 (validMask!0 mask!1196))))

(declare-fun b!874715 () Bool)

(assert (=> b!874715 (= e!486991 (and e!486993 mapRes!27614))))

(declare-fun condMapEmpty!27614 () Bool)

(declare-fun mapDefault!27614 () ValueCell!8229)

(assert (=> b!874715 (= condMapEmpty!27614 (= (arr!24430 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8229)) mapDefault!27614)))))

(declare-fun b!874716 () Bool)

(declare-fun e!486995 () Bool)

(assert (=> b!874716 (= e!486995 tp_is_empty!17337)))

(declare-fun b!874717 () Bool)

(declare-fun res!594446 () Bool)

(assert (=> b!874717 (=> (not res!594446) (not e!486992))))

(assert (=> b!874717 (= res!594446 (and (= (size!24870 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24869 _keys!868) (size!24870 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874718 () Bool)

(declare-fun res!594445 () Bool)

(assert (=> b!874718 (=> (not res!594445) (not e!486992))))

(declare-datatypes ((List!17341 0))(
  ( (Nil!17338) (Cons!17337 (h!18468 (_ BitVec 64)) (t!24382 List!17341)) )
))
(declare-fun arrayNoDuplicates!0 (array!50802 (_ BitVec 32) List!17341) Bool)

(assert (=> b!874718 (= res!594445 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17338))))

(declare-fun mapNonEmpty!27614 () Bool)

(declare-fun tp!52953 () Bool)

(assert (=> mapNonEmpty!27614 (= mapRes!27614 (and tp!52953 e!486995))))

(declare-fun mapValue!27614 () ValueCell!8229)

(declare-fun mapRest!27614 () (Array (_ BitVec 32) ValueCell!8229))

(declare-fun mapKey!27614 () (_ BitVec 32))

(assert (=> mapNonEmpty!27614 (= (arr!24430 _values!688) (store mapRest!27614 mapKey!27614 mapValue!27614))))

(declare-fun b!874719 () Bool)

(declare-fun res!594450 () Bool)

(assert (=> b!874719 (=> (not res!594450) (not e!486992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874719 (= res!594450 (validKeyInArray!0 k0!854))))

(assert (= (and start!74330 res!594447) b!874714))

(assert (= (and b!874714 res!594444) b!874717))

(assert (= (and b!874717 res!594446) b!874712))

(assert (= (and b!874712 res!594443) b!874718))

(assert (= (and b!874718 res!594445) b!874709))

(assert (= (and b!874709 res!594449) b!874719))

(assert (= (and b!874719 res!594450) b!874711))

(assert (= (and b!874711 res!594448) b!874710))

(assert (= (and b!874715 condMapEmpty!27614) mapIsEmpty!27614))

(assert (= (and b!874715 (not condMapEmpty!27614)) mapNonEmpty!27614))

(get-info :version)

(assert (= (and mapNonEmpty!27614 ((_ is ValueCellFull!8229) mapValue!27614)) b!874716))

(assert (= (and b!874715 ((_ is ValueCellFull!8229) mapDefault!27614)) b!874713))

(assert (= start!74330 b!874715))

(declare-fun m!814787 () Bool)

(assert (=> b!874719 m!814787))

(declare-fun m!814789 () Bool)

(assert (=> start!74330 m!814789))

(declare-fun m!814791 () Bool)

(assert (=> start!74330 m!814791))

(declare-fun m!814793 () Bool)

(assert (=> b!874710 m!814793))

(declare-fun m!814795 () Bool)

(assert (=> b!874710 m!814795))

(declare-fun m!814797 () Bool)

(assert (=> b!874710 m!814797))

(declare-fun m!814799 () Bool)

(assert (=> b!874712 m!814799))

(declare-fun m!814801 () Bool)

(assert (=> b!874711 m!814801))

(declare-fun m!814803 () Bool)

(assert (=> b!874714 m!814803))

(declare-fun m!814805 () Bool)

(assert (=> b!874718 m!814805))

(declare-fun m!814807 () Bool)

(assert (=> mapNonEmpty!27614 m!814807))

(check-sat (not mapNonEmpty!27614) (not b!874719) tp_is_empty!17337 (not b_next!15093) (not b!874710) (not b!874714) (not start!74330) (not b!874712) b_and!24869 (not b!874718))
(check-sat b_and!24869 (not b_next!15093))
