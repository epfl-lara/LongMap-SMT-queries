; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74312 () Bool)

(assert start!74312)

(declare-fun b_free!15075 () Bool)

(declare-fun b_next!15075 () Bool)

(assert (=> start!74312 (= b_free!15075 (not b_next!15075))))

(declare-fun tp!52900 () Bool)

(declare-fun b_and!24851 () Bool)

(assert (=> start!74312 (= tp!52900 b_and!24851)))

(declare-fun b!874412 () Bool)

(declare-fun res!594230 () Bool)

(declare-fun e!486858 () Bool)

(assert (=> b!874412 (=> (not res!594230) (not e!486858))))

(declare-datatypes ((array!50766 0))(
  ( (array!50767 (arr!24411 (Array (_ BitVec 32) (_ BitVec 64))) (size!24851 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50766)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50766 (_ BitVec 32)) Bool)

(assert (=> b!874412 (= res!594230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27587 () Bool)

(declare-fun mapRes!27587 () Bool)

(declare-fun tp!52899 () Bool)

(declare-fun e!486857 () Bool)

(assert (=> mapNonEmpty!27587 (= mapRes!27587 (and tp!52899 e!486857))))

(declare-fun mapKey!27587 () (_ BitVec 32))

(declare-datatypes ((V!28139 0))(
  ( (V!28140 (val!8707 Int)) )
))
(declare-datatypes ((ValueCell!8220 0))(
  ( (ValueCellFull!8220 (v!11136 V!28139)) (EmptyCell!8220) )
))
(declare-fun mapValue!27587 () ValueCell!8220)

(declare-fun mapRest!27587 () (Array (_ BitVec 32) ValueCell!8220))

(declare-datatypes ((array!50768 0))(
  ( (array!50769 (arr!24412 (Array (_ BitVec 32) ValueCell!8220)) (size!24852 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50768)

(assert (=> mapNonEmpty!27587 (= (arr!24412 _values!688) (store mapRest!27587 mapKey!27587 mapValue!27587))))

(declare-fun b!874413 () Bool)

(declare-fun res!594227 () Bool)

(assert (=> b!874413 (=> (not res!594227) (not e!486858))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!874413 (= res!594227 (and (= (size!24852 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24851 _keys!868) (size!24852 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874414 () Bool)

(declare-fun res!594232 () Bool)

(assert (=> b!874414 (=> (not res!594232) (not e!486858))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874414 (= res!594232 (and (= (select (arr!24411 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874415 () Bool)

(declare-fun res!594233 () Bool)

(assert (=> b!874415 (=> (not res!594233) (not e!486858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874415 (= res!594233 (validMask!0 mask!1196))))

(declare-fun b!874416 () Bool)

(declare-fun res!594234 () Bool)

(assert (=> b!874416 (=> (not res!594234) (not e!486858))))

(assert (=> b!874416 (= res!594234 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24851 _keys!868))))))

(declare-fun b!874417 () Bool)

(declare-fun tp_is_empty!17319 () Bool)

(assert (=> b!874417 (= e!486857 tp_is_empty!17319)))

(declare-fun b!874418 () Bool)

(assert (=> b!874418 (= e!486858 false)))

(declare-fun v!557 () V!28139)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11506 0))(
  ( (tuple2!11507 (_1!5764 (_ BitVec 64)) (_2!5764 V!28139)) )
))
(declare-datatypes ((List!17327 0))(
  ( (Nil!17324) (Cons!17323 (h!18454 tuple2!11506) (t!24368 List!17327)) )
))
(declare-datatypes ((ListLongMap!10275 0))(
  ( (ListLongMap!10276 (toList!5153 List!17327)) )
))
(declare-fun lt!395939 () ListLongMap!10275)

(declare-fun minValue!654 () V!28139)

(declare-fun zeroValue!654 () V!28139)

(declare-fun getCurrentListMapNoExtraKeys!3120 (array!50766 array!50768 (_ BitVec 32) (_ BitVec 32) V!28139 V!28139 (_ BitVec 32) Int) ListLongMap!10275)

(assert (=> b!874418 (= lt!395939 (getCurrentListMapNoExtraKeys!3120 _keys!868 (array!50769 (store (arr!24412 _values!688) i!612 (ValueCellFull!8220 v!557)) (size!24852 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395938 () ListLongMap!10275)

(assert (=> b!874418 (= lt!395938 (getCurrentListMapNoExtraKeys!3120 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27587 () Bool)

(assert (=> mapIsEmpty!27587 mapRes!27587))

(declare-fun b!874420 () Bool)

(declare-fun res!594231 () Bool)

(assert (=> b!874420 (=> (not res!594231) (not e!486858))))

(declare-datatypes ((List!17328 0))(
  ( (Nil!17325) (Cons!17324 (h!18455 (_ BitVec 64)) (t!24369 List!17328)) )
))
(declare-fun arrayNoDuplicates!0 (array!50766 (_ BitVec 32) List!17328) Bool)

(assert (=> b!874420 (= res!594231 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17325))))

(declare-fun b!874421 () Bool)

(declare-fun res!594229 () Bool)

(assert (=> b!874421 (=> (not res!594229) (not e!486858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874421 (= res!594229 (validKeyInArray!0 k0!854))))

(declare-fun b!874422 () Bool)

(declare-fun e!486859 () Bool)

(assert (=> b!874422 (= e!486859 tp_is_empty!17319)))

(declare-fun b!874419 () Bool)

(declare-fun e!486856 () Bool)

(assert (=> b!874419 (= e!486856 (and e!486859 mapRes!27587))))

(declare-fun condMapEmpty!27587 () Bool)

(declare-fun mapDefault!27587 () ValueCell!8220)

(assert (=> b!874419 (= condMapEmpty!27587 (= (arr!24412 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8220)) mapDefault!27587)))))

(declare-fun res!594228 () Bool)

(assert (=> start!74312 (=> (not res!594228) (not e!486858))))

(assert (=> start!74312 (= res!594228 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24851 _keys!868))))))

(assert (=> start!74312 e!486858))

(assert (=> start!74312 tp_is_empty!17319))

(assert (=> start!74312 true))

(assert (=> start!74312 tp!52900))

(declare-fun array_inv!19254 (array!50766) Bool)

(assert (=> start!74312 (array_inv!19254 _keys!868)))

(declare-fun array_inv!19255 (array!50768) Bool)

(assert (=> start!74312 (and (array_inv!19255 _values!688) e!486856)))

(assert (= (and start!74312 res!594228) b!874415))

(assert (= (and b!874415 res!594233) b!874413))

(assert (= (and b!874413 res!594227) b!874412))

(assert (= (and b!874412 res!594230) b!874420))

(assert (= (and b!874420 res!594231) b!874416))

(assert (= (and b!874416 res!594234) b!874421))

(assert (= (and b!874421 res!594229) b!874414))

(assert (= (and b!874414 res!594232) b!874418))

(assert (= (and b!874419 condMapEmpty!27587) mapIsEmpty!27587))

(assert (= (and b!874419 (not condMapEmpty!27587)) mapNonEmpty!27587))

(get-info :version)

(assert (= (and mapNonEmpty!27587 ((_ is ValueCellFull!8220) mapValue!27587)) b!874417))

(assert (= (and b!874419 ((_ is ValueCellFull!8220) mapDefault!27587)) b!874422))

(assert (= start!74312 b!874419))

(declare-fun m!814589 () Bool)

(assert (=> b!874414 m!814589))

(declare-fun m!814591 () Bool)

(assert (=> b!874415 m!814591))

(declare-fun m!814593 () Bool)

(assert (=> b!874412 m!814593))

(declare-fun m!814595 () Bool)

(assert (=> b!874418 m!814595))

(declare-fun m!814597 () Bool)

(assert (=> b!874418 m!814597))

(declare-fun m!814599 () Bool)

(assert (=> b!874418 m!814599))

(declare-fun m!814601 () Bool)

(assert (=> b!874421 m!814601))

(declare-fun m!814603 () Bool)

(assert (=> mapNonEmpty!27587 m!814603))

(declare-fun m!814605 () Bool)

(assert (=> b!874420 m!814605))

(declare-fun m!814607 () Bool)

(assert (=> start!74312 m!814607))

(declare-fun m!814609 () Bool)

(assert (=> start!74312 m!814609))

(check-sat tp_is_empty!17319 (not b!874418) (not start!74312) (not b!874412) (not mapNonEmpty!27587) (not b!874421) (not b!874415) b_and!24851 (not b_next!15075) (not b!874420))
(check-sat b_and!24851 (not b_next!15075))
