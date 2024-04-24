; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74454 () Bool)

(assert start!74454)

(declare-fun b_free!15049 () Bool)

(declare-fun b_next!15049 () Bool)

(assert (=> start!74454 (= b_free!15049 (not b_next!15049))))

(declare-fun tp!52823 () Bool)

(declare-fun b_and!24835 () Bool)

(assert (=> start!74454 (= tp!52823 b_and!24835)))

(declare-fun b!874886 () Bool)

(declare-fun res!594261 () Bool)

(declare-fun e!487247 () Bool)

(assert (=> b!874886 (=> (not res!594261) (not e!487247))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50769 0))(
  ( (array!50770 (arr!24408 (Array (_ BitVec 32) (_ BitVec 64))) (size!24849 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50769)

(assert (=> b!874886 (= res!594261 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24849 _keys!868))))))

(declare-fun b!874887 () Bool)

(declare-fun res!594259 () Bool)

(assert (=> b!874887 (=> (not res!594259) (not e!487247))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50769 (_ BitVec 32)) Bool)

(assert (=> b!874887 (= res!594259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874888 () Bool)

(declare-fun res!594266 () Bool)

(assert (=> b!874888 (=> (not res!594266) (not e!487247))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28105 0))(
  ( (V!28106 (val!8694 Int)) )
))
(declare-datatypes ((ValueCell!8207 0))(
  ( (ValueCellFull!8207 (v!11123 V!28105)) (EmptyCell!8207) )
))
(declare-datatypes ((array!50771 0))(
  ( (array!50772 (arr!24409 (Array (_ BitVec 32) ValueCell!8207)) (size!24850 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50771)

(assert (=> b!874888 (= res!594266 (and (= (size!24850 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24849 _keys!868) (size!24850 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874889 () Bool)

(declare-fun e!487243 () Bool)

(declare-fun tp_is_empty!17293 () Bool)

(assert (=> b!874889 (= e!487243 tp_is_empty!17293)))

(declare-fun b!874890 () Bool)

(declare-fun e!487245 () Bool)

(declare-fun e!487244 () Bool)

(declare-fun mapRes!27548 () Bool)

(assert (=> b!874890 (= e!487245 (and e!487244 mapRes!27548))))

(declare-fun condMapEmpty!27548 () Bool)

(declare-fun mapDefault!27548 () ValueCell!8207)

(assert (=> b!874890 (= condMapEmpty!27548 (= (arr!24409 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8207)) mapDefault!27548)))))

(declare-fun b!874891 () Bool)

(declare-fun res!594264 () Bool)

(assert (=> b!874891 (=> (not res!594264) (not e!487247))))

(declare-datatypes ((List!17264 0))(
  ( (Nil!17261) (Cons!17260 (h!18397 (_ BitVec 64)) (t!24297 List!17264)) )
))
(declare-fun arrayNoDuplicates!0 (array!50769 (_ BitVec 32) List!17264) Bool)

(assert (=> b!874891 (= res!594264 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17261))))

(declare-fun b!874892 () Bool)

(declare-fun res!594260 () Bool)

(assert (=> b!874892 (=> (not res!594260) (not e!487247))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874892 (= res!594260 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27548 () Bool)

(declare-fun tp!52822 () Bool)

(assert (=> mapNonEmpty!27548 (= mapRes!27548 (and tp!52822 e!487243))))

(declare-fun mapKey!27548 () (_ BitVec 32))

(declare-fun mapValue!27548 () ValueCell!8207)

(declare-fun mapRest!27548 () (Array (_ BitVec 32) ValueCell!8207))

(assert (=> mapNonEmpty!27548 (= (arr!24409 _values!688) (store mapRest!27548 mapKey!27548 mapValue!27548))))

(declare-fun res!594263 () Bool)

(assert (=> start!74454 (=> (not res!594263) (not e!487247))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74454 (= res!594263 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24849 _keys!868))))))

(assert (=> start!74454 e!487247))

(assert (=> start!74454 tp_is_empty!17293))

(assert (=> start!74454 true))

(assert (=> start!74454 tp!52823))

(declare-fun array_inv!19312 (array!50769) Bool)

(assert (=> start!74454 (array_inv!19312 _keys!868)))

(declare-fun array_inv!19313 (array!50771) Bool)

(assert (=> start!74454 (and (array_inv!19313 _values!688) e!487245)))

(declare-fun b!874893 () Bool)

(assert (=> b!874893 (= e!487247 false)))

(declare-fun v!557 () V!28105)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28105)

(declare-fun zeroValue!654 () V!28105)

(declare-datatypes ((tuple2!11416 0))(
  ( (tuple2!11417 (_1!5719 (_ BitVec 64)) (_2!5719 V!28105)) )
))
(declare-datatypes ((List!17265 0))(
  ( (Nil!17262) (Cons!17261 (h!18398 tuple2!11416) (t!24298 List!17265)) )
))
(declare-datatypes ((ListLongMap!10187 0))(
  ( (ListLongMap!10188 (toList!5109 List!17265)) )
))
(declare-fun lt!396222 () ListLongMap!10187)

(declare-fun getCurrentListMapNoExtraKeys!3152 (array!50769 array!50771 (_ BitVec 32) (_ BitVec 32) V!28105 V!28105 (_ BitVec 32) Int) ListLongMap!10187)

(assert (=> b!874893 (= lt!396222 (getCurrentListMapNoExtraKeys!3152 _keys!868 (array!50772 (store (arr!24409 _values!688) i!612 (ValueCellFull!8207 v!557)) (size!24850 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396221 () ListLongMap!10187)

(assert (=> b!874893 (= lt!396221 (getCurrentListMapNoExtraKeys!3152 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27548 () Bool)

(assert (=> mapIsEmpty!27548 mapRes!27548))

(declare-fun b!874894 () Bool)

(assert (=> b!874894 (= e!487244 tp_is_empty!17293)))

(declare-fun b!874895 () Bool)

(declare-fun res!594262 () Bool)

(assert (=> b!874895 (=> (not res!594262) (not e!487247))))

(assert (=> b!874895 (= res!594262 (and (= (select (arr!24408 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874896 () Bool)

(declare-fun res!594265 () Bool)

(assert (=> b!874896 (=> (not res!594265) (not e!487247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874896 (= res!594265 (validMask!0 mask!1196))))

(assert (= (and start!74454 res!594263) b!874896))

(assert (= (and b!874896 res!594265) b!874888))

(assert (= (and b!874888 res!594266) b!874887))

(assert (= (and b!874887 res!594259) b!874891))

(assert (= (and b!874891 res!594264) b!874886))

(assert (= (and b!874886 res!594261) b!874892))

(assert (= (and b!874892 res!594260) b!874895))

(assert (= (and b!874895 res!594262) b!874893))

(assert (= (and b!874890 condMapEmpty!27548) mapIsEmpty!27548))

(assert (= (and b!874890 (not condMapEmpty!27548)) mapNonEmpty!27548))

(get-info :version)

(assert (= (and mapNonEmpty!27548 ((_ is ValueCellFull!8207) mapValue!27548)) b!874889))

(assert (= (and b!874890 ((_ is ValueCellFull!8207) mapDefault!27548)) b!874894))

(assert (= start!74454 b!874890))

(declare-fun m!815593 () Bool)

(assert (=> b!874887 m!815593))

(declare-fun m!815595 () Bool)

(assert (=> b!874891 m!815595))

(declare-fun m!815597 () Bool)

(assert (=> b!874893 m!815597))

(declare-fun m!815599 () Bool)

(assert (=> b!874893 m!815599))

(declare-fun m!815601 () Bool)

(assert (=> b!874893 m!815601))

(declare-fun m!815603 () Bool)

(assert (=> start!74454 m!815603))

(declare-fun m!815605 () Bool)

(assert (=> start!74454 m!815605))

(declare-fun m!815607 () Bool)

(assert (=> b!874896 m!815607))

(declare-fun m!815609 () Bool)

(assert (=> mapNonEmpty!27548 m!815609))

(declare-fun m!815611 () Bool)

(assert (=> b!874892 m!815611))

(declare-fun m!815613 () Bool)

(assert (=> b!874895 m!815613))

(check-sat (not start!74454) (not b!874896) (not b!874892) (not b_next!15049) (not b!874891) tp_is_empty!17293 (not mapNonEmpty!27548) (not b!874893) (not b!874887) b_and!24835)
(check-sat b_and!24835 (not b_next!15049))
