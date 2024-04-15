; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40744 () Bool)

(assert start!40744)

(declare-fun b_free!10747 () Bool)

(declare-fun b_next!10747 () Bool)

(assert (=> start!40744 (= b_free!10747 (not b_next!10747))))

(declare-fun tp!38064 () Bool)

(declare-fun b_and!18755 () Bool)

(assert (=> start!40744 (= tp!38064 b_and!18755)))

(declare-fun res!268631 () Bool)

(declare-fun e!264266 () Bool)

(assert (=> start!40744 (=> (not res!268631) (not e!264266))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27969 0))(
  ( (array!27970 (arr!13429 (Array (_ BitVec 32) (_ BitVec 64))) (size!13782 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27969)

(assert (=> start!40744 (= res!268631 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13782 _keys!709))))))

(assert (=> start!40744 e!264266))

(declare-fun tp_is_empty!12085 () Bool)

(assert (=> start!40744 tp_is_empty!12085))

(assert (=> start!40744 tp!38064))

(assert (=> start!40744 true))

(declare-datatypes ((V!17219 0))(
  ( (V!17220 (val!6087 Int)) )
))
(declare-datatypes ((ValueCell!5699 0))(
  ( (ValueCellFull!5699 (v!8340 V!17219)) (EmptyCell!5699) )
))
(declare-datatypes ((array!27971 0))(
  ( (array!27972 (arr!13430 (Array (_ BitVec 32) ValueCell!5699)) (size!13783 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27971)

(declare-fun e!264270 () Bool)

(declare-fun array_inv!9788 (array!27971) Bool)

(assert (=> start!40744 (and (array_inv!9788 _values!549) e!264270)))

(declare-fun array_inv!9789 (array!27969) Bool)

(assert (=> start!40744 (array_inv!9789 _keys!709)))

(declare-fun b!451138 () Bool)

(declare-fun res!268621 () Bool)

(assert (=> b!451138 (=> (not res!268621) (not e!264266))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451138 (= res!268621 (validKeyInArray!0 k0!794))))

(declare-fun e!264267 () Bool)

(declare-datatypes ((tuple2!8012 0))(
  ( (tuple2!8013 (_1!4017 (_ BitVec 64)) (_2!4017 V!17219)) )
))
(declare-datatypes ((List!8075 0))(
  ( (Nil!8072) (Cons!8071 (h!8927 tuple2!8012) (t!13836 List!8075)) )
))
(declare-datatypes ((ListLongMap!6915 0))(
  ( (ListLongMap!6916 (toList!3473 List!8075)) )
))
(declare-fun call!29829 () ListLongMap!6915)

(declare-fun call!29830 () ListLongMap!6915)

(declare-fun v!412 () V!17219)

(declare-fun b!451139 () Bool)

(declare-fun +!1574 (ListLongMap!6915 tuple2!8012) ListLongMap!6915)

(assert (=> b!451139 (= e!264267 (= call!29830 (+!1574 call!29829 (tuple2!8013 k0!794 v!412))))))

(declare-fun b!451140 () Bool)

(declare-fun res!268629 () Bool)

(assert (=> b!451140 (=> (not res!268629) (not e!264266))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451140 (= res!268629 (or (= (select (arr!13429 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13429 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451141 () Bool)

(declare-fun res!268634 () Bool)

(declare-fun e!264268 () Bool)

(assert (=> b!451141 (=> (not res!268634) (not e!264268))))

(declare-fun lt!204686 () array!27969)

(declare-datatypes ((List!8076 0))(
  ( (Nil!8073) (Cons!8072 (h!8928 (_ BitVec 64)) (t!13837 List!8076)) )
))
(declare-fun arrayNoDuplicates!0 (array!27969 (_ BitVec 32) List!8076) Bool)

(assert (=> b!451141 (= res!268634 (arrayNoDuplicates!0 lt!204686 #b00000000000000000000000000000000 Nil!8073))))

(declare-fun b!451142 () Bool)

(declare-fun res!268630 () Bool)

(assert (=> b!451142 (=> (not res!268630) (not e!264266))))

(declare-fun arrayContainsKey!0 (array!27969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451142 (= res!268630 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19764 () Bool)

(declare-fun mapRes!19764 () Bool)

(declare-fun tp!38063 () Bool)

(declare-fun e!264272 () Bool)

(assert (=> mapNonEmpty!19764 (= mapRes!19764 (and tp!38063 e!264272))))

(declare-fun mapKey!19764 () (_ BitVec 32))

(declare-fun mapValue!19764 () ValueCell!5699)

(declare-fun mapRest!19764 () (Array (_ BitVec 32) ValueCell!5699))

(assert (=> mapNonEmpty!19764 (= (arr!13430 _values!549) (store mapRest!19764 mapKey!19764 mapValue!19764))))

(declare-fun b!451143 () Bool)

(assert (=> b!451143 (= e!264266 e!264268)))

(declare-fun res!268626 () Bool)

(assert (=> b!451143 (=> (not res!268626) (not e!264268))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27969 (_ BitVec 32)) Bool)

(assert (=> b!451143 (= res!268626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204686 mask!1025))))

(assert (=> b!451143 (= lt!204686 (array!27970 (store (arr!13429 _keys!709) i!563 k0!794) (size!13782 _keys!709)))))

(declare-fun b!451144 () Bool)

(declare-fun res!268627 () Bool)

(assert (=> b!451144 (=> (not res!268627) (not e!264268))))

(assert (=> b!451144 (= res!268627 (bvsle from!863 i!563))))

(declare-fun b!451145 () Bool)

(declare-fun e!264271 () Bool)

(assert (=> b!451145 (= e!264268 e!264271)))

(declare-fun res!268625 () Bool)

(assert (=> b!451145 (=> (not res!268625) (not e!264271))))

(assert (=> b!451145 (= res!268625 (= from!863 i!563))))

(declare-fun lt!204687 () array!27971)

(declare-fun minValue!515 () V!17219)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17219)

(declare-fun lt!204688 () ListLongMap!6915)

(declare-fun getCurrentListMapNoExtraKeys!1670 (array!27969 array!27971 (_ BitVec 32) (_ BitVec 32) V!17219 V!17219 (_ BitVec 32) Int) ListLongMap!6915)

(assert (=> b!451145 (= lt!204688 (getCurrentListMapNoExtraKeys!1670 lt!204686 lt!204687 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451145 (= lt!204687 (array!27972 (store (arr!13430 _values!549) i!563 (ValueCellFull!5699 v!412)) (size!13783 _values!549)))))

(declare-fun lt!204689 () ListLongMap!6915)

(assert (=> b!451145 (= lt!204689 (getCurrentListMapNoExtraKeys!1670 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451146 () Bool)

(assert (=> b!451146 (= e!264272 tp_is_empty!12085)))

(declare-fun bm!29826 () Bool)

(declare-fun c!55998 () Bool)

(assert (=> bm!29826 (= call!29830 (getCurrentListMapNoExtraKeys!1670 (ite c!55998 lt!204686 _keys!709) (ite c!55998 lt!204687 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29827 () Bool)

(assert (=> bm!29827 (= call!29829 (getCurrentListMapNoExtraKeys!1670 (ite c!55998 _keys!709 lt!204686) (ite c!55998 _values!549 lt!204687) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451147 () Bool)

(declare-fun e!264264 () Bool)

(assert (=> b!451147 (= e!264264 tp_is_empty!12085)))

(declare-fun b!451148 () Bool)

(assert (=> b!451148 (= e!264270 (and e!264264 mapRes!19764))))

(declare-fun condMapEmpty!19764 () Bool)

(declare-fun mapDefault!19764 () ValueCell!5699)

(assert (=> b!451148 (= condMapEmpty!19764 (= (arr!13430 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5699)) mapDefault!19764)))))

(declare-fun b!451149 () Bool)

(assert (=> b!451149 (= e!264267 (= call!29829 call!29830))))

(declare-fun mapIsEmpty!19764 () Bool)

(assert (=> mapIsEmpty!19764 mapRes!19764))

(declare-fun b!451150 () Bool)

(declare-fun res!268623 () Bool)

(assert (=> b!451150 (=> (not res!268623) (not e!264266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451150 (= res!268623 (validMask!0 mask!1025))))

(declare-fun b!451151 () Bool)

(declare-fun e!264265 () Bool)

(assert (=> b!451151 (= e!264271 (not e!264265))))

(declare-fun res!268633 () Bool)

(assert (=> b!451151 (=> res!268633 e!264265)))

(assert (=> b!451151 (= res!268633 (validKeyInArray!0 (select (arr!13429 _keys!709) from!863)))))

(assert (=> b!451151 e!264267))

(assert (=> b!451151 (= c!55998 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13167 0))(
  ( (Unit!13168) )
))
(declare-fun lt!204685 () Unit!13167)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!711 (array!27969 array!27971 (_ BitVec 32) (_ BitVec 32) V!17219 V!17219 (_ BitVec 32) (_ BitVec 64) V!17219 (_ BitVec 32) Int) Unit!13167)

(assert (=> b!451151 (= lt!204685 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!711 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451152 () Bool)

(declare-fun res!268622 () Bool)

(assert (=> b!451152 (=> (not res!268622) (not e!264266))))

(assert (=> b!451152 (= res!268622 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13782 _keys!709))))))

(declare-fun b!451153 () Bool)

(declare-fun res!268624 () Bool)

(assert (=> b!451153 (=> (not res!268624) (not e!264266))))

(assert (=> b!451153 (= res!268624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451154 () Bool)

(declare-fun res!268628 () Bool)

(assert (=> b!451154 (=> (not res!268628) (not e!264266))))

(assert (=> b!451154 (= res!268628 (and (= (size!13783 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13782 _keys!709) (size!13783 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451155 () Bool)

(assert (=> b!451155 (= e!264265 (bvslt i!563 (size!13783 _values!549)))))

(declare-fun get!6615 (ValueCell!5699 V!17219) V!17219)

(declare-fun dynLambda!851 (Int (_ BitVec 64)) V!17219)

(assert (=> b!451155 (= lt!204688 (+!1574 (getCurrentListMapNoExtraKeys!1670 lt!204686 lt!204687 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8013 (select (arr!13429 lt!204686) from!863) (get!6615 (select (arr!13430 lt!204687) from!863) (dynLambda!851 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451156 () Bool)

(declare-fun res!268632 () Bool)

(assert (=> b!451156 (=> (not res!268632) (not e!264266))))

(assert (=> b!451156 (= res!268632 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8073))))

(assert (= (and start!40744 res!268631) b!451150))

(assert (= (and b!451150 res!268623) b!451154))

(assert (= (and b!451154 res!268628) b!451153))

(assert (= (and b!451153 res!268624) b!451156))

(assert (= (and b!451156 res!268632) b!451152))

(assert (= (and b!451152 res!268622) b!451138))

(assert (= (and b!451138 res!268621) b!451140))

(assert (= (and b!451140 res!268629) b!451142))

(assert (= (and b!451142 res!268630) b!451143))

(assert (= (and b!451143 res!268626) b!451141))

(assert (= (and b!451141 res!268634) b!451144))

(assert (= (and b!451144 res!268627) b!451145))

(assert (= (and b!451145 res!268625) b!451151))

(assert (= (and b!451151 c!55998) b!451139))

(assert (= (and b!451151 (not c!55998)) b!451149))

(assert (= (or b!451139 b!451149) bm!29826))

(assert (= (or b!451139 b!451149) bm!29827))

(assert (= (and b!451151 (not res!268633)) b!451155))

(assert (= (and b!451148 condMapEmpty!19764) mapIsEmpty!19764))

(assert (= (and b!451148 (not condMapEmpty!19764)) mapNonEmpty!19764))

(get-info :version)

(assert (= (and mapNonEmpty!19764 ((_ is ValueCellFull!5699) mapValue!19764)) b!451146))

(assert (= (and b!451148 ((_ is ValueCellFull!5699) mapDefault!19764)) b!451147))

(assert (= start!40744 b!451148))

(declare-fun b_lambda!9507 () Bool)

(assert (=> (not b_lambda!9507) (not b!451155)))

(declare-fun t!13835 () Bool)

(declare-fun tb!3719 () Bool)

(assert (=> (and start!40744 (= defaultEntry!557 defaultEntry!557) t!13835) tb!3719))

(declare-fun result!6983 () Bool)

(assert (=> tb!3719 (= result!6983 tp_is_empty!12085)))

(assert (=> b!451155 t!13835))

(declare-fun b_and!18757 () Bool)

(assert (= b_and!18755 (and (=> t!13835 result!6983) b_and!18757)))

(declare-fun m!434453 () Bool)

(assert (=> mapNonEmpty!19764 m!434453))

(declare-fun m!434455 () Bool)

(assert (=> b!451141 m!434455))

(declare-fun m!434457 () Bool)

(assert (=> b!451139 m!434457))

(declare-fun m!434459 () Bool)

(assert (=> b!451151 m!434459))

(assert (=> b!451151 m!434459))

(declare-fun m!434461 () Bool)

(assert (=> b!451151 m!434461))

(declare-fun m!434463 () Bool)

(assert (=> b!451151 m!434463))

(declare-fun m!434465 () Bool)

(assert (=> b!451143 m!434465))

(declare-fun m!434467 () Bool)

(assert (=> b!451143 m!434467))

(declare-fun m!434469 () Bool)

(assert (=> b!451156 m!434469))

(declare-fun m!434471 () Bool)

(assert (=> b!451150 m!434471))

(declare-fun m!434473 () Bool)

(assert (=> b!451140 m!434473))

(declare-fun m!434475 () Bool)

(assert (=> start!40744 m!434475))

(declare-fun m!434477 () Bool)

(assert (=> start!40744 m!434477))

(declare-fun m!434479 () Bool)

(assert (=> b!451153 m!434479))

(declare-fun m!434481 () Bool)

(assert (=> b!451142 m!434481))

(declare-fun m!434483 () Bool)

(assert (=> bm!29827 m!434483))

(declare-fun m!434485 () Bool)

(assert (=> b!451155 m!434485))

(declare-fun m!434487 () Bool)

(assert (=> b!451155 m!434487))

(declare-fun m!434489 () Bool)

(assert (=> b!451155 m!434489))

(assert (=> b!451155 m!434485))

(assert (=> b!451155 m!434487))

(declare-fun m!434491 () Bool)

(assert (=> b!451155 m!434491))

(declare-fun m!434493 () Bool)

(assert (=> b!451155 m!434493))

(assert (=> b!451155 m!434493))

(declare-fun m!434495 () Bool)

(assert (=> b!451155 m!434495))

(declare-fun m!434497 () Bool)

(assert (=> bm!29826 m!434497))

(declare-fun m!434499 () Bool)

(assert (=> b!451145 m!434499))

(declare-fun m!434501 () Bool)

(assert (=> b!451145 m!434501))

(declare-fun m!434503 () Bool)

(assert (=> b!451145 m!434503))

(declare-fun m!434505 () Bool)

(assert (=> b!451138 m!434505))

(check-sat (not mapNonEmpty!19764) (not bm!29826) b_and!18757 (not b!451145) (not b!451150) (not b!451138) (not b!451153) (not b_next!10747) (not b!451156) (not b!451141) (not b!451139) (not bm!29827) (not b!451155) (not b!451142) (not start!40744) (not b!451143) (not b!451151) tp_is_empty!12085 (not b_lambda!9507))
(check-sat b_and!18757 (not b_next!10747))
