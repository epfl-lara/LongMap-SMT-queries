; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40756 () Bool)

(assert start!40756)

(declare-fun b_free!10759 () Bool)

(declare-fun b_next!10759 () Bool)

(assert (=> start!40756 (= b_free!10759 (not b_next!10759))))

(declare-fun tp!38100 () Bool)

(declare-fun b_and!18815 () Bool)

(assert (=> start!40756 (= tp!38100 b_and!18815)))

(declare-fun b!451702 () Bool)

(declare-fun e!264562 () Bool)

(declare-fun tp_is_empty!12097 () Bool)

(assert (=> b!451702 (= e!264562 tp_is_empty!12097)))

(declare-fun b!451703 () Bool)

(declare-fun e!264564 () Bool)

(declare-fun e!264567 () Bool)

(assert (=> b!451703 (= e!264564 e!264567)))

(declare-fun res!269005 () Bool)

(assert (=> b!451703 (=> (not res!269005) (not e!264567))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451703 (= res!269005 (= from!863 i!563))))

(declare-datatypes ((V!17235 0))(
  ( (V!17236 (val!6093 Int)) )
))
(declare-fun minValue!515 () V!17235)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27992 0))(
  ( (array!27993 (arr!13440 (Array (_ BitVec 32) (_ BitVec 64))) (size!13792 (_ BitVec 32))) )
))
(declare-fun lt!205021 () array!27992)

(declare-datatypes ((tuple2!7918 0))(
  ( (tuple2!7919 (_1!3970 (_ BitVec 64)) (_2!3970 V!17235)) )
))
(declare-datatypes ((List!7987 0))(
  ( (Nil!7984) (Cons!7983 (h!8839 tuple2!7918) (t!13761 List!7987)) )
))
(declare-datatypes ((ListLongMap!6833 0))(
  ( (ListLongMap!6834 (toList!3432 List!7987)) )
))
(declare-fun lt!205025 () ListLongMap!6833)

(declare-fun zeroValue!515 () V!17235)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5705 0))(
  ( (ValueCellFull!5705 (v!8353 V!17235)) (EmptyCell!5705) )
))
(declare-datatypes ((array!27994 0))(
  ( (array!27995 (arr!13441 (Array (_ BitVec 32) ValueCell!5705)) (size!13793 (_ BitVec 32))) )
))
(declare-fun lt!205024 () array!27994)

(declare-fun getCurrentListMapNoExtraKeys!1661 (array!27992 array!27994 (_ BitVec 32) (_ BitVec 32) V!17235 V!17235 (_ BitVec 32) Int) ListLongMap!6833)

(assert (=> b!451703 (= lt!205025 (getCurrentListMapNoExtraKeys!1661 lt!205021 lt!205024 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27994)

(declare-fun v!412 () V!17235)

(assert (=> b!451703 (= lt!205024 (array!27995 (store (arr!13441 _values!549) i!563 (ValueCellFull!5705 v!412)) (size!13793 _values!549)))))

(declare-fun lt!205023 () ListLongMap!6833)

(declare-fun _keys!709 () array!27992)

(assert (=> b!451703 (= lt!205023 (getCurrentListMapNoExtraKeys!1661 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451704 () Bool)

(declare-fun res!268995 () Bool)

(declare-fun e!264563 () Bool)

(assert (=> b!451704 (=> (not res!268995) (not e!264563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451704 (= res!268995 (validKeyInArray!0 k0!794))))

(declare-fun b!451705 () Bool)

(declare-fun e!264565 () Bool)

(declare-fun call!29877 () ListLongMap!6833)

(declare-fun call!29876 () ListLongMap!6833)

(assert (=> b!451705 (= e!264565 (= call!29877 call!29876))))

(declare-fun b!451706 () Bool)

(declare-fun res!268999 () Bool)

(assert (=> b!451706 (=> (not res!268999) (not e!264563))))

(declare-fun arrayContainsKey!0 (array!27992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451706 (= res!268999 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451707 () Bool)

(declare-fun res!269007 () Bool)

(assert (=> b!451707 (=> (not res!269007) (not e!264563))))

(assert (=> b!451707 (= res!269007 (and (= (size!13793 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13792 _keys!709) (size!13793 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451708 () Bool)

(declare-fun +!1558 (ListLongMap!6833 tuple2!7918) ListLongMap!6833)

(assert (=> b!451708 (= e!264565 (= call!29876 (+!1558 call!29877 (tuple2!7919 k0!794 v!412))))))

(declare-fun b!451709 () Bool)

(declare-fun res!269008 () Bool)

(assert (=> b!451709 (=> (not res!269008) (not e!264563))))

(assert (=> b!451709 (= res!269008 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13792 _keys!709))))))

(declare-fun c!56060 () Bool)

(declare-fun bm!29873 () Bool)

(assert (=> bm!29873 (= call!29877 (getCurrentListMapNoExtraKeys!1661 (ite c!56060 _keys!709 lt!205021) (ite c!56060 _values!549 lt!205024) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451710 () Bool)

(declare-fun res!269003 () Bool)

(assert (=> b!451710 (=> (not res!269003) (not e!264563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451710 (= res!269003 (validMask!0 mask!1025))))

(declare-fun b!451711 () Bool)

(declare-fun e!264569 () Bool)

(assert (=> b!451711 (= e!264569 tp_is_empty!12097)))

(declare-fun b!451712 () Bool)

(declare-fun e!264561 () Bool)

(declare-fun mapRes!19782 () Bool)

(assert (=> b!451712 (= e!264561 (and e!264569 mapRes!19782))))

(declare-fun condMapEmpty!19782 () Bool)

(declare-fun mapDefault!19782 () ValueCell!5705)

(assert (=> b!451712 (= condMapEmpty!19782 (= (arr!13441 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5705)) mapDefault!19782)))))

(declare-fun mapIsEmpty!19782 () Bool)

(assert (=> mapIsEmpty!19782 mapRes!19782))

(declare-fun b!451713 () Bool)

(declare-fun e!264568 () Bool)

(assert (=> b!451713 (= e!264567 (not e!264568))))

(declare-fun res!269004 () Bool)

(assert (=> b!451713 (=> res!269004 e!264568)))

(assert (=> b!451713 (= res!269004 (validKeyInArray!0 (select (arr!13440 _keys!709) from!863)))))

(assert (=> b!451713 e!264565))

(assert (=> b!451713 (= c!56060 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13193 0))(
  ( (Unit!13194) )
))
(declare-fun lt!205022 () Unit!13193)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!717 (array!27992 array!27994 (_ BitVec 32) (_ BitVec 32) V!17235 V!17235 (_ BitVec 32) (_ BitVec 64) V!17235 (_ BitVec 32) Int) Unit!13193)

(assert (=> b!451713 (= lt!205022 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!717 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451714 () Bool)

(declare-fun res!268996 () Bool)

(assert (=> b!451714 (=> (not res!268996) (not e!264564))))

(declare-datatypes ((List!7988 0))(
  ( (Nil!7985) (Cons!7984 (h!8840 (_ BitVec 64)) (t!13762 List!7988)) )
))
(declare-fun arrayNoDuplicates!0 (array!27992 (_ BitVec 32) List!7988) Bool)

(assert (=> b!451714 (= res!268996 (arrayNoDuplicates!0 lt!205021 #b00000000000000000000000000000000 Nil!7985))))

(declare-fun res!269002 () Bool)

(assert (=> start!40756 (=> (not res!269002) (not e!264563))))

(assert (=> start!40756 (= res!269002 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13792 _keys!709))))))

(assert (=> start!40756 e!264563))

(assert (=> start!40756 tp_is_empty!12097))

(assert (=> start!40756 tp!38100))

(assert (=> start!40756 true))

(declare-fun array_inv!9812 (array!27994) Bool)

(assert (=> start!40756 (and (array_inv!9812 _values!549) e!264561)))

(declare-fun array_inv!9813 (array!27992) Bool)

(assert (=> start!40756 (array_inv!9813 _keys!709)))

(declare-fun b!451715 () Bool)

(declare-fun res!269006 () Bool)

(assert (=> b!451715 (=> (not res!269006) (not e!264563))))

(assert (=> b!451715 (= res!269006 (or (= (select (arr!13440 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13440 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451716 () Bool)

(assert (=> b!451716 (= e!264563 e!264564)))

(declare-fun res!268998 () Bool)

(assert (=> b!451716 (=> (not res!268998) (not e!264564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27992 (_ BitVec 32)) Bool)

(assert (=> b!451716 (= res!268998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205021 mask!1025))))

(assert (=> b!451716 (= lt!205021 (array!27993 (store (arr!13440 _keys!709) i!563 k0!794) (size!13792 _keys!709)))))

(declare-fun b!451717 () Bool)

(declare-fun res!269001 () Bool)

(assert (=> b!451717 (=> (not res!269001) (not e!264564))))

(assert (=> b!451717 (= res!269001 (bvsle from!863 i!563))))

(declare-fun b!451718 () Bool)

(declare-fun res!268997 () Bool)

(assert (=> b!451718 (=> (not res!268997) (not e!264563))))

(assert (=> b!451718 (= res!268997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451719 () Bool)

(assert (=> b!451719 (= e!264568 (bvslt i!563 (size!13793 _values!549)))))

(declare-fun get!6630 (ValueCell!5705 V!17235) V!17235)

(declare-fun dynLambda!859 (Int (_ BitVec 64)) V!17235)

(assert (=> b!451719 (= lt!205025 (+!1558 (getCurrentListMapNoExtraKeys!1661 lt!205021 lt!205024 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7919 (select (arr!13440 lt!205021) from!863) (get!6630 (select (arr!13441 lt!205024) from!863) (dynLambda!859 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!29874 () Bool)

(assert (=> bm!29874 (= call!29876 (getCurrentListMapNoExtraKeys!1661 (ite c!56060 lt!205021 _keys!709) (ite c!56060 lt!205024 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451720 () Bool)

(declare-fun res!269000 () Bool)

(assert (=> b!451720 (=> (not res!269000) (not e!264563))))

(assert (=> b!451720 (= res!269000 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7985))))

(declare-fun mapNonEmpty!19782 () Bool)

(declare-fun tp!38099 () Bool)

(assert (=> mapNonEmpty!19782 (= mapRes!19782 (and tp!38099 e!264562))))

(declare-fun mapRest!19782 () (Array (_ BitVec 32) ValueCell!5705))

(declare-fun mapKey!19782 () (_ BitVec 32))

(declare-fun mapValue!19782 () ValueCell!5705)

(assert (=> mapNonEmpty!19782 (= (arr!13441 _values!549) (store mapRest!19782 mapKey!19782 mapValue!19782))))

(assert (= (and start!40756 res!269002) b!451710))

(assert (= (and b!451710 res!269003) b!451707))

(assert (= (and b!451707 res!269007) b!451718))

(assert (= (and b!451718 res!268997) b!451720))

(assert (= (and b!451720 res!269000) b!451709))

(assert (= (and b!451709 res!269008) b!451704))

(assert (= (and b!451704 res!268995) b!451715))

(assert (= (and b!451715 res!269006) b!451706))

(assert (= (and b!451706 res!268999) b!451716))

(assert (= (and b!451716 res!268998) b!451714))

(assert (= (and b!451714 res!268996) b!451717))

(assert (= (and b!451717 res!269001) b!451703))

(assert (= (and b!451703 res!269005) b!451713))

(assert (= (and b!451713 c!56060) b!451708))

(assert (= (and b!451713 (not c!56060)) b!451705))

(assert (= (or b!451708 b!451705) bm!29874))

(assert (= (or b!451708 b!451705) bm!29873))

(assert (= (and b!451713 (not res!269004)) b!451719))

(assert (= (and b!451712 condMapEmpty!19782) mapIsEmpty!19782))

(assert (= (and b!451712 (not condMapEmpty!19782)) mapNonEmpty!19782))

(get-info :version)

(assert (= (and mapNonEmpty!19782 ((_ is ValueCellFull!5705) mapValue!19782)) b!451702))

(assert (= (and b!451712 ((_ is ValueCellFull!5705) mapDefault!19782)) b!451711))

(assert (= start!40756 b!451712))

(declare-fun b_lambda!9551 () Bool)

(assert (=> (not b_lambda!9551) (not b!451719)))

(declare-fun t!13760 () Bool)

(declare-fun tb!3731 () Bool)

(assert (=> (and start!40756 (= defaultEntry!557 defaultEntry!557) t!13760) tb!3731))

(declare-fun result!7007 () Bool)

(assert (=> tb!3731 (= result!7007 tp_is_empty!12097)))

(assert (=> b!451719 t!13760))

(declare-fun b_and!18817 () Bool)

(assert (= b_and!18815 (and (=> t!13760 result!7007) b_and!18817)))

(declare-fun m!435695 () Bool)

(assert (=> b!451708 m!435695))

(declare-fun m!435697 () Bool)

(assert (=> b!451719 m!435697))

(declare-fun m!435699 () Bool)

(assert (=> b!451719 m!435699))

(declare-fun m!435701 () Bool)

(assert (=> b!451719 m!435701))

(declare-fun m!435703 () Bool)

(assert (=> b!451719 m!435703))

(declare-fun m!435705 () Bool)

(assert (=> b!451719 m!435705))

(assert (=> b!451719 m!435701))

(assert (=> b!451719 m!435705))

(assert (=> b!451719 m!435697))

(declare-fun m!435707 () Bool)

(assert (=> b!451719 m!435707))

(declare-fun m!435709 () Bool)

(assert (=> bm!29873 m!435709))

(declare-fun m!435711 () Bool)

(assert (=> b!451715 m!435711))

(declare-fun m!435713 () Bool)

(assert (=> bm!29874 m!435713))

(declare-fun m!435715 () Bool)

(assert (=> b!451714 m!435715))

(declare-fun m!435717 () Bool)

(assert (=> b!451713 m!435717))

(assert (=> b!451713 m!435717))

(declare-fun m!435719 () Bool)

(assert (=> b!451713 m!435719))

(declare-fun m!435721 () Bool)

(assert (=> b!451713 m!435721))

(declare-fun m!435723 () Bool)

(assert (=> b!451720 m!435723))

(declare-fun m!435725 () Bool)

(assert (=> b!451716 m!435725))

(declare-fun m!435727 () Bool)

(assert (=> b!451716 m!435727))

(declare-fun m!435729 () Bool)

(assert (=> b!451704 m!435729))

(declare-fun m!435731 () Bool)

(assert (=> b!451706 m!435731))

(declare-fun m!435733 () Bool)

(assert (=> start!40756 m!435733))

(declare-fun m!435735 () Bool)

(assert (=> start!40756 m!435735))

(declare-fun m!435737 () Bool)

(assert (=> b!451710 m!435737))

(declare-fun m!435739 () Bool)

(assert (=> mapNonEmpty!19782 m!435739))

(declare-fun m!435741 () Bool)

(assert (=> b!451703 m!435741))

(declare-fun m!435743 () Bool)

(assert (=> b!451703 m!435743))

(declare-fun m!435745 () Bool)

(assert (=> b!451703 m!435745))

(declare-fun m!435747 () Bool)

(assert (=> b!451718 m!435747))

(check-sat (not b!451713) (not b!451708) (not b!451704) (not b!451714) (not bm!29874) (not b!451718) (not start!40756) (not bm!29873) (not b_lambda!9551) (not b!451719) b_and!18817 (not b!451716) (not b_next!10759) (not b!451703) (not b!451710) (not b!451720) (not b!451706) (not mapNonEmpty!19782) tp_is_empty!12097)
(check-sat b_and!18817 (not b_next!10759))
