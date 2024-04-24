; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40680 () Bool)

(assert start!40680)

(declare-fun b_free!10705 () Bool)

(declare-fun b_next!10705 () Bool)

(assert (=> start!40680 (= b_free!10705 (not b_next!10705))))

(declare-fun tp!37935 () Bool)

(declare-fun b_and!18727 () Bool)

(assert (=> start!40680 (= tp!37935 b_and!18727)))

(declare-fun b!450016 () Bool)

(declare-fun res!267821 () Bool)

(declare-fun e!263759 () Bool)

(assert (=> b!450016 (=> (not res!267821) (not e!263759))))

(declare-datatypes ((array!27886 0))(
  ( (array!27887 (arr!13388 (Array (_ BitVec 32) (_ BitVec 64))) (size!13740 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27886)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17163 0))(
  ( (V!17164 (val!6066 Int)) )
))
(declare-datatypes ((ValueCell!5678 0))(
  ( (ValueCellFull!5678 (v!8322 V!17163)) (EmptyCell!5678) )
))
(declare-datatypes ((array!27888 0))(
  ( (array!27889 (arr!13389 (Array (_ BitVec 32) ValueCell!5678)) (size!13741 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27888)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!450016 (= res!267821 (and (= (size!13741 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13740 _keys!709) (size!13741 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450017 () Bool)

(declare-fun res!267827 () Bool)

(assert (=> b!450017 (=> (not res!267827) (not e!263759))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450017 (= res!267827 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13740 _keys!709))))))

(declare-fun b!450018 () Bool)

(declare-fun res!267816 () Bool)

(assert (=> b!450018 (=> (not res!267816) (not e!263759))))

(assert (=> b!450018 (= res!267816 (or (= (select (arr!13388 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13388 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450019 () Bool)

(declare-fun e!263755 () Bool)

(declare-datatypes ((tuple2!7870 0))(
  ( (tuple2!7871 (_1!3946 (_ BitVec 64)) (_2!3946 V!17163)) )
))
(declare-datatypes ((List!7942 0))(
  ( (Nil!7939) (Cons!7938 (h!8794 tuple2!7870) (t!13696 List!7942)) )
))
(declare-datatypes ((ListLongMap!6785 0))(
  ( (ListLongMap!6786 (toList!3408 List!7942)) )
))
(declare-fun call!29694 () ListLongMap!6785)

(declare-fun call!29695 () ListLongMap!6785)

(assert (=> b!450019 (= e!263755 (= call!29694 call!29695))))

(declare-fun res!267824 () Bool)

(assert (=> start!40680 (=> (not res!267824) (not e!263759))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40680 (= res!267824 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13740 _keys!709))))))

(assert (=> start!40680 e!263759))

(declare-fun tp_is_empty!12043 () Bool)

(assert (=> start!40680 tp_is_empty!12043))

(assert (=> start!40680 tp!37935))

(assert (=> start!40680 true))

(declare-fun e!263756 () Bool)

(declare-fun array_inv!9778 (array!27888) Bool)

(assert (=> start!40680 (and (array_inv!9778 _values!549) e!263756)))

(declare-fun array_inv!9779 (array!27886) Bool)

(assert (=> start!40680 (array_inv!9779 _keys!709)))

(declare-fun minValue!515 () V!17163)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!29691 () Bool)

(declare-fun zeroValue!515 () V!17163)

(declare-fun c!55941 () Bool)

(declare-fun lt!204526 () array!27888)

(declare-fun lt!204529 () array!27886)

(declare-fun getCurrentListMapNoExtraKeys!1638 (array!27886 array!27888 (_ BitVec 32) (_ BitVec 32) V!17163 V!17163 (_ BitVec 32) Int) ListLongMap!6785)

(assert (=> bm!29691 (= call!29694 (getCurrentListMapNoExtraKeys!1638 (ite c!55941 _keys!709 lt!204529) (ite c!55941 _values!549 lt!204526) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450020 () Bool)

(declare-fun res!267817 () Bool)

(assert (=> b!450020 (=> (not res!267817) (not e!263759))))

(declare-datatypes ((List!7943 0))(
  ( (Nil!7940) (Cons!7939 (h!8795 (_ BitVec 64)) (t!13697 List!7943)) )
))
(declare-fun arrayNoDuplicates!0 (array!27886 (_ BitVec 32) List!7943) Bool)

(assert (=> b!450020 (= res!267817 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7940))))

(declare-fun b!450021 () Bool)

(declare-fun res!267819 () Bool)

(declare-fun e!263757 () Bool)

(assert (=> b!450021 (=> (not res!267819) (not e!263757))))

(assert (=> b!450021 (= res!267819 (bvsle from!863 i!563))))

(declare-fun b!450022 () Bool)

(declare-fun res!267826 () Bool)

(assert (=> b!450022 (=> (not res!267826) (not e!263759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27886 (_ BitVec 32)) Bool)

(assert (=> b!450022 (= res!267826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19698 () Bool)

(declare-fun mapRes!19698 () Bool)

(assert (=> mapIsEmpty!19698 mapRes!19698))

(declare-fun b!450023 () Bool)

(declare-fun e!263753 () Bool)

(assert (=> b!450023 (= e!263753 tp_is_empty!12043)))

(declare-fun b!450024 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17163)

(declare-fun +!1539 (ListLongMap!6785 tuple2!7870) ListLongMap!6785)

(assert (=> b!450024 (= e!263755 (= call!29695 (+!1539 call!29694 (tuple2!7871 k0!794 v!412))))))

(declare-fun mapNonEmpty!19698 () Bool)

(declare-fun tp!37934 () Bool)

(assert (=> mapNonEmpty!19698 (= mapRes!19698 (and tp!37934 e!263753))))

(declare-fun mapValue!19698 () ValueCell!5678)

(declare-fun mapKey!19698 () (_ BitVec 32))

(declare-fun mapRest!19698 () (Array (_ BitVec 32) ValueCell!5678))

(assert (=> mapNonEmpty!19698 (= (arr!13389 _values!549) (store mapRest!19698 mapKey!19698 mapValue!19698))))

(declare-fun b!450025 () Bool)

(assert (=> b!450025 (= e!263759 e!263757)))

(declare-fun res!267820 () Bool)

(assert (=> b!450025 (=> (not res!267820) (not e!263757))))

(assert (=> b!450025 (= res!267820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204529 mask!1025))))

(assert (=> b!450025 (= lt!204529 (array!27887 (store (arr!13388 _keys!709) i!563 k0!794) (size!13740 _keys!709)))))

(declare-fun b!450026 () Bool)

(declare-fun e!263758 () Bool)

(assert (=> b!450026 (= e!263756 (and e!263758 mapRes!19698))))

(declare-fun condMapEmpty!19698 () Bool)

(declare-fun mapDefault!19698 () ValueCell!5678)

(assert (=> b!450026 (= condMapEmpty!19698 (= (arr!13389 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5678)) mapDefault!19698)))))

(declare-fun b!450027 () Bool)

(declare-fun res!267825 () Bool)

(assert (=> b!450027 (=> (not res!267825) (not e!263759))))

(declare-fun arrayContainsKey!0 (array!27886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450027 (= res!267825 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450028 () Bool)

(declare-fun e!263760 () Bool)

(assert (=> b!450028 (= e!263760 (not true))))

(assert (=> b!450028 e!263755))

(assert (=> b!450028 (= c!55941 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13161 0))(
  ( (Unit!13162) )
))
(declare-fun lt!204525 () Unit!13161)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!701 (array!27886 array!27888 (_ BitVec 32) (_ BitVec 32) V!17163 V!17163 (_ BitVec 32) (_ BitVec 64) V!17163 (_ BitVec 32) Int) Unit!13161)

(assert (=> b!450028 (= lt!204525 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!701 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450029 () Bool)

(declare-fun res!267818 () Bool)

(assert (=> b!450029 (=> (not res!267818) (not e!263757))))

(assert (=> b!450029 (= res!267818 (arrayNoDuplicates!0 lt!204529 #b00000000000000000000000000000000 Nil!7940))))

(declare-fun b!450030 () Bool)

(declare-fun res!267828 () Bool)

(assert (=> b!450030 (=> (not res!267828) (not e!263759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450030 (= res!267828 (validKeyInArray!0 k0!794))))

(declare-fun bm!29692 () Bool)

(assert (=> bm!29692 (= call!29695 (getCurrentListMapNoExtraKeys!1638 (ite c!55941 lt!204529 _keys!709) (ite c!55941 lt!204526 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450031 () Bool)

(declare-fun res!267822 () Bool)

(assert (=> b!450031 (=> (not res!267822) (not e!263759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450031 (= res!267822 (validMask!0 mask!1025))))

(declare-fun b!450032 () Bool)

(assert (=> b!450032 (= e!263757 e!263760)))

(declare-fun res!267823 () Bool)

(assert (=> b!450032 (=> (not res!267823) (not e!263760))))

(assert (=> b!450032 (= res!267823 (= from!863 i!563))))

(declare-fun lt!204527 () ListLongMap!6785)

(assert (=> b!450032 (= lt!204527 (getCurrentListMapNoExtraKeys!1638 lt!204529 lt!204526 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450032 (= lt!204526 (array!27889 (store (arr!13389 _values!549) i!563 (ValueCellFull!5678 v!412)) (size!13741 _values!549)))))

(declare-fun lt!204528 () ListLongMap!6785)

(assert (=> b!450032 (= lt!204528 (getCurrentListMapNoExtraKeys!1638 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450033 () Bool)

(assert (=> b!450033 (= e!263758 tp_is_empty!12043)))

(assert (= (and start!40680 res!267824) b!450031))

(assert (= (and b!450031 res!267822) b!450016))

(assert (= (and b!450016 res!267821) b!450022))

(assert (= (and b!450022 res!267826) b!450020))

(assert (= (and b!450020 res!267817) b!450017))

(assert (= (and b!450017 res!267827) b!450030))

(assert (= (and b!450030 res!267828) b!450018))

(assert (= (and b!450018 res!267816) b!450027))

(assert (= (and b!450027 res!267825) b!450025))

(assert (= (and b!450025 res!267820) b!450029))

(assert (= (and b!450029 res!267818) b!450021))

(assert (= (and b!450021 res!267819) b!450032))

(assert (= (and b!450032 res!267823) b!450028))

(assert (= (and b!450028 c!55941) b!450024))

(assert (= (and b!450028 (not c!55941)) b!450019))

(assert (= (or b!450024 b!450019) bm!29692))

(assert (= (or b!450024 b!450019) bm!29691))

(assert (= (and b!450026 condMapEmpty!19698) mapIsEmpty!19698))

(assert (= (and b!450026 (not condMapEmpty!19698)) mapNonEmpty!19698))

(get-info :version)

(assert (= (and mapNonEmpty!19698 ((_ is ValueCellFull!5678) mapValue!19698)) b!450023))

(assert (= (and b!450026 ((_ is ValueCellFull!5678) mapDefault!19698)) b!450033))

(assert (= start!40680 b!450026))

(declare-fun m!434295 () Bool)

(assert (=> b!450027 m!434295))

(declare-fun m!434297 () Bool)

(assert (=> bm!29691 m!434297))

(declare-fun m!434299 () Bool)

(assert (=> b!450030 m!434299))

(declare-fun m!434301 () Bool)

(assert (=> bm!29692 m!434301))

(declare-fun m!434303 () Bool)

(assert (=> b!450020 m!434303))

(declare-fun m!434305 () Bool)

(assert (=> b!450031 m!434305))

(declare-fun m!434307 () Bool)

(assert (=> b!450028 m!434307))

(declare-fun m!434309 () Bool)

(assert (=> start!40680 m!434309))

(declare-fun m!434311 () Bool)

(assert (=> start!40680 m!434311))

(declare-fun m!434313 () Bool)

(assert (=> b!450025 m!434313))

(declare-fun m!434315 () Bool)

(assert (=> b!450025 m!434315))

(declare-fun m!434317 () Bool)

(assert (=> b!450022 m!434317))

(declare-fun m!434319 () Bool)

(assert (=> b!450029 m!434319))

(declare-fun m!434321 () Bool)

(assert (=> b!450018 m!434321))

(declare-fun m!434323 () Bool)

(assert (=> b!450024 m!434323))

(declare-fun m!434325 () Bool)

(assert (=> mapNonEmpty!19698 m!434325))

(declare-fun m!434327 () Bool)

(assert (=> b!450032 m!434327))

(declare-fun m!434329 () Bool)

(assert (=> b!450032 m!434329))

(declare-fun m!434331 () Bool)

(assert (=> b!450032 m!434331))

(check-sat tp_is_empty!12043 (not start!40680) (not b!450027) (not b!450031) (not b!450022) (not b!450028) (not bm!29692) (not b!450024) (not b!450025) (not b!450030) (not b_next!10705) (not mapNonEmpty!19698) (not b!450032) b_and!18727 (not b!450029) (not bm!29691) (not b!450020))
(check-sat b_and!18727 (not b_next!10705))
