; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40778 () Bool)

(assert start!40778)

(declare-fun b_free!10767 () Bool)

(declare-fun b_next!10767 () Bool)

(assert (=> start!40778 (= b_free!10767 (not b_next!10767))))

(declare-fun tp!38124 () Bool)

(declare-fun b_and!18821 () Bool)

(assert (=> start!40778 (= tp!38124 b_and!18821)))

(declare-fun b!451999 () Bool)

(declare-fun e!264708 () Bool)

(declare-fun e!264713 () Bool)

(assert (=> b!451999 (= e!264708 e!264713)))

(declare-fun res!269179 () Bool)

(assert (=> b!451999 (=> (not res!269179) (not e!264713))))

(declare-datatypes ((array!28017 0))(
  ( (array!28018 (arr!13453 (Array (_ BitVec 32) (_ BitVec 64))) (size!13805 (_ BitVec 32))) )
))
(declare-fun lt!205069 () array!28017)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28017 (_ BitVec 32)) Bool)

(assert (=> b!451999 (= res!269179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205069 mask!1025))))

(declare-fun _keys!709 () array!28017)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!451999 (= lt!205069 (array!28018 (store (arr!13453 _keys!709) i!563 k0!794) (size!13805 _keys!709)))))

(declare-fun b!452000 () Bool)

(declare-fun res!269175 () Bool)

(assert (=> b!452000 (=> (not res!269175) (not e!264708))))

(assert (=> b!452000 (= res!269175 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13805 _keys!709))))))

(declare-fun b!452001 () Bool)

(declare-fun e!264710 () Bool)

(declare-fun e!264714 () Bool)

(declare-fun mapRes!19794 () Bool)

(assert (=> b!452001 (= e!264710 (and e!264714 mapRes!19794))))

(declare-fun condMapEmpty!19794 () Bool)

(declare-datatypes ((V!17245 0))(
  ( (V!17246 (val!6097 Int)) )
))
(declare-datatypes ((ValueCell!5709 0))(
  ( (ValueCellFull!5709 (v!8356 V!17245)) (EmptyCell!5709) )
))
(declare-datatypes ((array!28019 0))(
  ( (array!28020 (arr!13454 (Array (_ BitVec 32) ValueCell!5709)) (size!13806 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28019)

(declare-fun mapDefault!19794 () ValueCell!5709)

(assert (=> b!452001 (= condMapEmpty!19794 (= (arr!13454 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5709)) mapDefault!19794)))))

(declare-fun b!452003 () Bool)

(declare-fun res!269171 () Bool)

(assert (=> b!452003 (=> (not res!269171) (not e!264708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452003 (= res!269171 (validMask!0 mask!1025))))

(declare-fun c!56099 () Bool)

(declare-datatypes ((tuple2!8022 0))(
  ( (tuple2!8023 (_1!4022 (_ BitVec 64)) (_2!4022 V!17245)) )
))
(declare-datatypes ((List!8082 0))(
  ( (Nil!8079) (Cons!8078 (h!8934 tuple2!8022) (t!13872 List!8082)) )
))
(declare-datatypes ((ListLongMap!6935 0))(
  ( (ListLongMap!6936 (toList!3483 List!8082)) )
))
(declare-fun call!29914 () ListLongMap!6935)

(declare-fun minValue!515 () V!17245)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29911 () Bool)

(declare-fun zeroValue!515 () V!17245)

(declare-fun lt!205073 () array!28019)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1667 (array!28017 array!28019 (_ BitVec 32) (_ BitVec 32) V!17245 V!17245 (_ BitVec 32) Int) ListLongMap!6935)

(assert (=> bm!29911 (= call!29914 (getCurrentListMapNoExtraKeys!1667 (ite c!56099 _keys!709 lt!205069) (ite c!56099 _values!549 lt!205073) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452004 () Bool)

(declare-fun e!264711 () Bool)

(declare-fun tp_is_empty!12105 () Bool)

(assert (=> b!452004 (= e!264711 tp_is_empty!12105)))

(declare-fun b!452005 () Bool)

(declare-fun e!264712 () Bool)

(assert (=> b!452005 (= e!264712 (bvslt from!863 (size!13806 _values!549)))))

(declare-fun lt!205072 () ListLongMap!6935)

(declare-fun +!1560 (ListLongMap!6935 tuple2!8022) ListLongMap!6935)

(declare-fun get!6627 (ValueCell!5709 V!17245) V!17245)

(declare-fun dynLambda!860 (Int (_ BitVec 64)) V!17245)

(assert (=> b!452005 (= lt!205072 (+!1560 (getCurrentListMapNoExtraKeys!1667 lt!205069 lt!205073 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8023 (select (arr!13453 lt!205069) from!863) (get!6627 (select (arr!13454 lt!205073) from!863) (dynLambda!860 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!452006 () Bool)

(declare-fun res!269178 () Bool)

(assert (=> b!452006 (=> (not res!269178) (not e!264708))))

(assert (=> b!452006 (= res!269178 (or (= (select (arr!13453 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13453 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264716 () Bool)

(declare-fun b!452007 () Bool)

(declare-fun call!29915 () ListLongMap!6935)

(declare-fun v!412 () V!17245)

(assert (=> b!452007 (= e!264716 (= call!29915 (+!1560 call!29914 (tuple2!8023 k0!794 v!412))))))

(declare-fun b!452008 () Bool)

(declare-fun e!264715 () Bool)

(assert (=> b!452008 (= e!264713 e!264715)))

(declare-fun res!269173 () Bool)

(assert (=> b!452008 (=> (not res!269173) (not e!264715))))

(assert (=> b!452008 (= res!269173 (= from!863 i!563))))

(assert (=> b!452008 (= lt!205072 (getCurrentListMapNoExtraKeys!1667 lt!205069 lt!205073 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452008 (= lt!205073 (array!28020 (store (arr!13454 _values!549) i!563 (ValueCellFull!5709 v!412)) (size!13806 _values!549)))))

(declare-fun lt!205070 () ListLongMap!6935)

(assert (=> b!452008 (= lt!205070 (getCurrentListMapNoExtraKeys!1667 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452009 () Bool)

(assert (=> b!452009 (= e!264716 (= call!29914 call!29915))))

(declare-fun mapNonEmpty!19794 () Bool)

(declare-fun tp!38123 () Bool)

(assert (=> mapNonEmpty!19794 (= mapRes!19794 (and tp!38123 e!264711))))

(declare-fun mapValue!19794 () ValueCell!5709)

(declare-fun mapRest!19794 () (Array (_ BitVec 32) ValueCell!5709))

(declare-fun mapKey!19794 () (_ BitVec 32))

(assert (=> mapNonEmpty!19794 (= (arr!13454 _values!549) (store mapRest!19794 mapKey!19794 mapValue!19794))))

(declare-fun b!452010 () Bool)

(assert (=> b!452010 (= e!264715 (not e!264712))))

(declare-fun res!269172 () Bool)

(assert (=> b!452010 (=> res!269172 e!264712)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452010 (= res!269172 (validKeyInArray!0 (select (arr!13453 _keys!709) from!863)))))

(assert (=> b!452010 e!264716))

(assert (=> b!452010 (= c!56099 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13218 0))(
  ( (Unit!13219) )
))
(declare-fun lt!205071 () Unit!13218)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!724 (array!28017 array!28019 (_ BitVec 32) (_ BitVec 32) V!17245 V!17245 (_ BitVec 32) (_ BitVec 64) V!17245 (_ BitVec 32) Int) Unit!13218)

(assert (=> b!452010 (= lt!205071 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!724 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!269181 () Bool)

(assert (=> start!40778 (=> (not res!269181) (not e!264708))))

(assert (=> start!40778 (= res!269181 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13805 _keys!709))))))

(assert (=> start!40778 e!264708))

(assert (=> start!40778 tp_is_empty!12105))

(assert (=> start!40778 tp!38124))

(assert (=> start!40778 true))

(declare-fun array_inv!9742 (array!28019) Bool)

(assert (=> start!40778 (and (array_inv!9742 _values!549) e!264710)))

(declare-fun array_inv!9743 (array!28017) Bool)

(assert (=> start!40778 (array_inv!9743 _keys!709)))

(declare-fun b!452002 () Bool)

(assert (=> b!452002 (= e!264714 tp_is_empty!12105)))

(declare-fun b!452011 () Bool)

(declare-fun res!269176 () Bool)

(assert (=> b!452011 (=> (not res!269176) (not e!264708))))

(assert (=> b!452011 (= res!269176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452012 () Bool)

(declare-fun res!269183 () Bool)

(assert (=> b!452012 (=> (not res!269183) (not e!264713))))

(assert (=> b!452012 (= res!269183 (bvsle from!863 i!563))))

(declare-fun b!452013 () Bool)

(declare-fun res!269174 () Bool)

(assert (=> b!452013 (=> (not res!269174) (not e!264708))))

(assert (=> b!452013 (= res!269174 (validKeyInArray!0 k0!794))))

(declare-fun b!452014 () Bool)

(declare-fun res!269170 () Bool)

(assert (=> b!452014 (=> (not res!269170) (not e!264713))))

(declare-datatypes ((List!8083 0))(
  ( (Nil!8080) (Cons!8079 (h!8935 (_ BitVec 64)) (t!13873 List!8083)) )
))
(declare-fun arrayNoDuplicates!0 (array!28017 (_ BitVec 32) List!8083) Bool)

(assert (=> b!452014 (= res!269170 (arrayNoDuplicates!0 lt!205069 #b00000000000000000000000000000000 Nil!8080))))

(declare-fun mapIsEmpty!19794 () Bool)

(assert (=> mapIsEmpty!19794 mapRes!19794))

(declare-fun bm!29912 () Bool)

(assert (=> bm!29912 (= call!29915 (getCurrentListMapNoExtraKeys!1667 (ite c!56099 lt!205069 _keys!709) (ite c!56099 lt!205073 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452015 () Bool)

(declare-fun res!269182 () Bool)

(assert (=> b!452015 (=> (not res!269182) (not e!264708))))

(declare-fun arrayContainsKey!0 (array!28017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452015 (= res!269182 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452016 () Bool)

(declare-fun res!269180 () Bool)

(assert (=> b!452016 (=> (not res!269180) (not e!264708))))

(assert (=> b!452016 (= res!269180 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8080))))

(declare-fun b!452017 () Bool)

(declare-fun res!269177 () Bool)

(assert (=> b!452017 (=> (not res!269177) (not e!264708))))

(assert (=> b!452017 (= res!269177 (and (= (size!13806 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13805 _keys!709) (size!13806 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40778 res!269181) b!452003))

(assert (= (and b!452003 res!269171) b!452017))

(assert (= (and b!452017 res!269177) b!452011))

(assert (= (and b!452011 res!269176) b!452016))

(assert (= (and b!452016 res!269180) b!452000))

(assert (= (and b!452000 res!269175) b!452013))

(assert (= (and b!452013 res!269174) b!452006))

(assert (= (and b!452006 res!269178) b!452015))

(assert (= (and b!452015 res!269182) b!451999))

(assert (= (and b!451999 res!269179) b!452014))

(assert (= (and b!452014 res!269170) b!452012))

(assert (= (and b!452012 res!269183) b!452008))

(assert (= (and b!452008 res!269173) b!452010))

(assert (= (and b!452010 c!56099) b!452007))

(assert (= (and b!452010 (not c!56099)) b!452009))

(assert (= (or b!452007 b!452009) bm!29912))

(assert (= (or b!452007 b!452009) bm!29911))

(assert (= (and b!452010 (not res!269172)) b!452005))

(assert (= (and b!452001 condMapEmpty!19794) mapIsEmpty!19794))

(assert (= (and b!452001 (not condMapEmpty!19794)) mapNonEmpty!19794))

(get-info :version)

(assert (= (and mapNonEmpty!19794 ((_ is ValueCellFull!5709) mapValue!19794)) b!452004))

(assert (= (and b!452001 ((_ is ValueCellFull!5709) mapDefault!19794)) b!452002))

(assert (= start!40778 b!452001))

(declare-fun b_lambda!9545 () Bool)

(assert (=> (not b_lambda!9545) (not b!452005)))

(declare-fun t!13871 () Bool)

(declare-fun tb!3747 () Bool)

(assert (=> (and start!40778 (= defaultEntry!557 defaultEntry!557) t!13871) tb!3747))

(declare-fun result!7031 () Bool)

(assert (=> tb!3747 (= result!7031 tp_is_empty!12105)))

(assert (=> b!452005 t!13871))

(declare-fun b_and!18823 () Bool)

(assert (= b_and!18821 (and (=> t!13871 result!7031) b_and!18823)))

(declare-fun m!435725 () Bool)

(assert (=> b!452011 m!435725))

(declare-fun m!435727 () Bool)

(assert (=> b!452003 m!435727))

(declare-fun m!435729 () Bool)

(assert (=> b!452005 m!435729))

(declare-fun m!435731 () Bool)

(assert (=> b!452005 m!435731))

(declare-fun m!435733 () Bool)

(assert (=> b!452005 m!435733))

(declare-fun m!435735 () Bool)

(assert (=> b!452005 m!435735))

(assert (=> b!452005 m!435731))

(declare-fun m!435737 () Bool)

(assert (=> b!452005 m!435737))

(assert (=> b!452005 m!435733))

(declare-fun m!435739 () Bool)

(assert (=> b!452005 m!435739))

(assert (=> b!452005 m!435735))

(declare-fun m!435741 () Bool)

(assert (=> b!452006 m!435741))

(declare-fun m!435743 () Bool)

(assert (=> b!452016 m!435743))

(declare-fun m!435745 () Bool)

(assert (=> b!452008 m!435745))

(declare-fun m!435747 () Bool)

(assert (=> b!452008 m!435747))

(declare-fun m!435749 () Bool)

(assert (=> b!452008 m!435749))

(declare-fun m!435751 () Bool)

(assert (=> b!452010 m!435751))

(assert (=> b!452010 m!435751))

(declare-fun m!435753 () Bool)

(assert (=> b!452010 m!435753))

(declare-fun m!435755 () Bool)

(assert (=> b!452010 m!435755))

(declare-fun m!435757 () Bool)

(assert (=> b!451999 m!435757))

(declare-fun m!435759 () Bool)

(assert (=> b!451999 m!435759))

(declare-fun m!435761 () Bool)

(assert (=> bm!29912 m!435761))

(declare-fun m!435763 () Bool)

(assert (=> mapNonEmpty!19794 m!435763))

(declare-fun m!435765 () Bool)

(assert (=> start!40778 m!435765))

(declare-fun m!435767 () Bool)

(assert (=> start!40778 m!435767))

(declare-fun m!435769 () Bool)

(assert (=> b!452007 m!435769))

(declare-fun m!435771 () Bool)

(assert (=> b!452014 m!435771))

(declare-fun m!435773 () Bool)

(assert (=> b!452015 m!435773))

(declare-fun m!435775 () Bool)

(assert (=> bm!29911 m!435775))

(declare-fun m!435777 () Bool)

(assert (=> b!452013 m!435777))

(check-sat tp_is_empty!12105 (not b!452010) (not bm!29911) b_and!18823 (not b!451999) (not b!452014) (not b!452007) (not b!452005) (not mapNonEmpty!19794) (not b!452016) (not b_lambda!9545) (not b!452015) (not start!40778) (not b!452008) (not b!452011) (not bm!29912) (not b!452013) (not b!452003) (not b_next!10767))
(check-sat b_and!18823 (not b_next!10767))
