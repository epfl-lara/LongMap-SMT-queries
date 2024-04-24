; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40768 () Bool)

(assert start!40768)

(declare-fun b_free!10771 () Bool)

(declare-fun b_next!10771 () Bool)

(assert (=> start!40768 (= b_free!10771 (not b_next!10771))))

(declare-fun tp!38136 () Bool)

(declare-fun b_and!18839 () Bool)

(assert (=> start!40768 (= tp!38136 b_and!18839)))

(declare-fun b!452056 () Bool)

(declare-fun res!269248 () Bool)

(declare-fun e!264730 () Bool)

(assert (=> b!452056 (=> (not res!269248) (not e!264730))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452056 (= res!269248 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19800 () Bool)

(declare-fun mapRes!19800 () Bool)

(assert (=> mapIsEmpty!19800 mapRes!19800))

(declare-fun b!452057 () Bool)

(declare-fun res!269260 () Bool)

(declare-fun e!264731 () Bool)

(assert (=> b!452057 (=> (not res!269260) (not e!264731))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452057 (= res!269260 (validMask!0 mask!1025))))

(declare-fun b!452058 () Bool)

(declare-fun e!264724 () Bool)

(declare-datatypes ((V!17251 0))(
  ( (V!17252 (val!6099 Int)) )
))
(declare-datatypes ((ValueCell!5711 0))(
  ( (ValueCellFull!5711 (v!8359 V!17251)) (EmptyCell!5711) )
))
(declare-datatypes ((array!28014 0))(
  ( (array!28015 (arr!13451 (Array (_ BitVec 32) ValueCell!5711)) (size!13803 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28014)

(assert (=> b!452058 (= e!264724 (bvslt from!863 (size!13803 _values!549)))))

(declare-fun minValue!515 () V!17251)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7926 0))(
  ( (tuple2!7927 (_1!3974 (_ BitVec 64)) (_2!3974 V!17251)) )
))
(declare-datatypes ((List!7995 0))(
  ( (Nil!7992) (Cons!7991 (h!8847 tuple2!7926) (t!13781 List!7995)) )
))
(declare-datatypes ((ListLongMap!6841 0))(
  ( (ListLongMap!6842 (toList!3436 List!7995)) )
))
(declare-fun lt!205113 () ListLongMap!6841)

(declare-fun zeroValue!515 () V!17251)

(declare-datatypes ((array!28016 0))(
  ( (array!28017 (arr!13452 (Array (_ BitVec 32) (_ BitVec 64))) (size!13804 (_ BitVec 32))) )
))
(declare-fun lt!205115 () array!28016)

(declare-fun lt!205112 () array!28014)

(declare-fun +!1562 (ListLongMap!6841 tuple2!7926) ListLongMap!6841)

(declare-fun getCurrentListMapNoExtraKeys!1665 (array!28016 array!28014 (_ BitVec 32) (_ BitVec 32) V!17251 V!17251 (_ BitVec 32) Int) ListLongMap!6841)

(declare-fun get!6636 (ValueCell!5711 V!17251) V!17251)

(declare-fun dynLambda!861 (Int (_ BitVec 64)) V!17251)

(assert (=> b!452058 (= lt!205113 (+!1562 (getCurrentListMapNoExtraKeys!1665 lt!205115 lt!205112 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7927 (select (arr!13452 lt!205115) from!863) (get!6636 (select (arr!13451 lt!205112) from!863) (dynLambda!861 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!452060 () Bool)

(declare-fun res!269257 () Bool)

(assert (=> b!452060 (=> (not res!269257) (not e!264731))))

(declare-fun _keys!709 () array!28016)

(assert (=> b!452060 (= res!269257 (or (= (select (arr!13452 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13452 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19800 () Bool)

(declare-fun tp!38135 () Bool)

(declare-fun e!264729 () Bool)

(assert (=> mapNonEmpty!19800 (= mapRes!19800 (and tp!38135 e!264729))))

(declare-fun mapValue!19800 () ValueCell!5711)

(declare-fun mapKey!19800 () (_ BitVec 32))

(declare-fun mapRest!19800 () (Array (_ BitVec 32) ValueCell!5711))

(assert (=> mapNonEmpty!19800 (= (arr!13451 _values!549) (store mapRest!19800 mapKey!19800 mapValue!19800))))

(declare-fun b!452061 () Bool)

(declare-fun res!269251 () Bool)

(assert (=> b!452061 (=> (not res!269251) (not e!264731))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452061 (= res!269251 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452062 () Bool)

(declare-fun res!269259 () Bool)

(assert (=> b!452062 (=> (not res!269259) (not e!264731))))

(declare-datatypes ((List!7996 0))(
  ( (Nil!7993) (Cons!7992 (h!8848 (_ BitVec 64)) (t!13782 List!7996)) )
))
(declare-fun arrayNoDuplicates!0 (array!28016 (_ BitVec 32) List!7996) Bool)

(assert (=> b!452062 (= res!269259 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7993))))

(declare-fun b!452063 () Bool)

(assert (=> b!452063 (= e!264731 e!264730)))

(declare-fun res!269249 () Bool)

(assert (=> b!452063 (=> (not res!269249) (not e!264730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28016 (_ BitVec 32)) Bool)

(assert (=> b!452063 (= res!269249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205115 mask!1025))))

(assert (=> b!452063 (= lt!205115 (array!28017 (store (arr!13452 _keys!709) i!563 k0!794) (size!13804 _keys!709)))))

(declare-fun b!452064 () Bool)

(declare-fun res!269253 () Bool)

(assert (=> b!452064 (=> (not res!269253) (not e!264731))))

(assert (=> b!452064 (= res!269253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452065 () Bool)

(declare-fun res!269258 () Bool)

(assert (=> b!452065 (=> (not res!269258) (not e!264731))))

(assert (=> b!452065 (= res!269258 (and (= (size!13803 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13804 _keys!709) (size!13803 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452066 () Bool)

(declare-fun tp_is_empty!12109 () Bool)

(assert (=> b!452066 (= e!264729 tp_is_empty!12109)))

(declare-fun b!452067 () Bool)

(declare-fun res!269252 () Bool)

(assert (=> b!452067 (=> (not res!269252) (not e!264730))))

(assert (=> b!452067 (= res!269252 (arrayNoDuplicates!0 lt!205115 #b00000000000000000000000000000000 Nil!7993))))

(declare-fun b!452068 () Bool)

(declare-fun e!264728 () Bool)

(declare-fun e!264725 () Bool)

(assert (=> b!452068 (= e!264728 (and e!264725 mapRes!19800))))

(declare-fun condMapEmpty!19800 () Bool)

(declare-fun mapDefault!19800 () ValueCell!5711)

(assert (=> b!452068 (= condMapEmpty!19800 (= (arr!13451 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5711)) mapDefault!19800)))))

(declare-fun call!29913 () ListLongMap!6841)

(declare-fun e!264727 () Bool)

(declare-fun call!29912 () ListLongMap!6841)

(declare-fun v!412 () V!17251)

(declare-fun b!452059 () Bool)

(assert (=> b!452059 (= e!264727 (= call!29913 (+!1562 call!29912 (tuple2!7927 k0!794 v!412))))))

(declare-fun res!269256 () Bool)

(assert (=> start!40768 (=> (not res!269256) (not e!264731))))

(assert (=> start!40768 (= res!269256 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13804 _keys!709))))))

(assert (=> start!40768 e!264731))

(assert (=> start!40768 tp_is_empty!12109))

(assert (=> start!40768 tp!38136))

(assert (=> start!40768 true))

(declare-fun array_inv!9818 (array!28014) Bool)

(assert (=> start!40768 (and (array_inv!9818 _values!549) e!264728)))

(declare-fun array_inv!9819 (array!28016) Bool)

(assert (=> start!40768 (array_inv!9819 _keys!709)))

(declare-fun c!56078 () Bool)

(declare-fun bm!29909 () Bool)

(assert (=> bm!29909 (= call!29913 (getCurrentListMapNoExtraKeys!1665 (ite c!56078 lt!205115 _keys!709) (ite c!56078 lt!205112 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452069 () Bool)

(declare-fun res!269254 () Bool)

(assert (=> b!452069 (=> (not res!269254) (not e!264731))))

(assert (=> b!452069 (= res!269254 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13804 _keys!709))))))

(declare-fun b!452070 () Bool)

(declare-fun e!264723 () Bool)

(assert (=> b!452070 (= e!264723 (not e!264724))))

(declare-fun res!269250 () Bool)

(assert (=> b!452070 (=> res!269250 e!264724)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452070 (= res!269250 (validKeyInArray!0 (select (arr!13452 _keys!709) from!863)))))

(assert (=> b!452070 e!264727))

(assert (=> b!452070 (= c!56078 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13201 0))(
  ( (Unit!13202) )
))
(declare-fun lt!205111 () Unit!13201)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!721 (array!28016 array!28014 (_ BitVec 32) (_ BitVec 32) V!17251 V!17251 (_ BitVec 32) (_ BitVec 64) V!17251 (_ BitVec 32) Int) Unit!13201)

(assert (=> b!452070 (= lt!205111 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!721 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452071 () Bool)

(assert (=> b!452071 (= e!264730 e!264723)))

(declare-fun res!269255 () Bool)

(assert (=> b!452071 (=> (not res!269255) (not e!264723))))

(assert (=> b!452071 (= res!269255 (= from!863 i!563))))

(assert (=> b!452071 (= lt!205113 (getCurrentListMapNoExtraKeys!1665 lt!205115 lt!205112 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452071 (= lt!205112 (array!28015 (store (arr!13451 _values!549) i!563 (ValueCellFull!5711 v!412)) (size!13803 _values!549)))))

(declare-fun lt!205114 () ListLongMap!6841)

(assert (=> b!452071 (= lt!205114 (getCurrentListMapNoExtraKeys!1665 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452072 () Bool)

(assert (=> b!452072 (= e!264727 (= call!29912 call!29913))))

(declare-fun b!452073 () Bool)

(declare-fun res!269247 () Bool)

(assert (=> b!452073 (=> (not res!269247) (not e!264731))))

(assert (=> b!452073 (= res!269247 (validKeyInArray!0 k0!794))))

(declare-fun b!452074 () Bool)

(assert (=> b!452074 (= e!264725 tp_is_empty!12109)))

(declare-fun bm!29910 () Bool)

(assert (=> bm!29910 (= call!29912 (getCurrentListMapNoExtraKeys!1665 (ite c!56078 _keys!709 lt!205115) (ite c!56078 _values!549 lt!205112) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40768 res!269256) b!452057))

(assert (= (and b!452057 res!269260) b!452065))

(assert (= (and b!452065 res!269258) b!452064))

(assert (= (and b!452064 res!269253) b!452062))

(assert (= (and b!452062 res!269259) b!452069))

(assert (= (and b!452069 res!269254) b!452073))

(assert (= (and b!452073 res!269247) b!452060))

(assert (= (and b!452060 res!269257) b!452061))

(assert (= (and b!452061 res!269251) b!452063))

(assert (= (and b!452063 res!269249) b!452067))

(assert (= (and b!452067 res!269252) b!452056))

(assert (= (and b!452056 res!269248) b!452071))

(assert (= (and b!452071 res!269255) b!452070))

(assert (= (and b!452070 c!56078) b!452059))

(assert (= (and b!452070 (not c!56078)) b!452072))

(assert (= (or b!452059 b!452072) bm!29909))

(assert (= (or b!452059 b!452072) bm!29910))

(assert (= (and b!452070 (not res!269250)) b!452058))

(assert (= (and b!452068 condMapEmpty!19800) mapIsEmpty!19800))

(assert (= (and b!452068 (not condMapEmpty!19800)) mapNonEmpty!19800))

(get-info :version)

(assert (= (and mapNonEmpty!19800 ((_ is ValueCellFull!5711) mapValue!19800)) b!452066))

(assert (= (and b!452068 ((_ is ValueCellFull!5711) mapDefault!19800)) b!452074))

(assert (= start!40768 b!452068))

(declare-fun b_lambda!9563 () Bool)

(assert (=> (not b_lambda!9563) (not b!452058)))

(declare-fun t!13780 () Bool)

(declare-fun tb!3743 () Bool)

(assert (=> (and start!40768 (= defaultEntry!557 defaultEntry!557) t!13780) tb!3743))

(declare-fun result!7031 () Bool)

(assert (=> tb!3743 (= result!7031 tp_is_empty!12109)))

(assert (=> b!452058 t!13780))

(declare-fun b_and!18841 () Bool)

(assert (= b_and!18839 (and (=> t!13780 result!7031) b_and!18841)))

(declare-fun m!436017 () Bool)

(assert (=> bm!29909 m!436017))

(declare-fun m!436019 () Bool)

(assert (=> b!452059 m!436019))

(declare-fun m!436021 () Bool)

(assert (=> b!452064 m!436021))

(declare-fun m!436023 () Bool)

(assert (=> b!452073 m!436023))

(declare-fun m!436025 () Bool)

(assert (=> b!452058 m!436025))

(declare-fun m!436027 () Bool)

(assert (=> b!452058 m!436027))

(assert (=> b!452058 m!436025))

(assert (=> b!452058 m!436027))

(declare-fun m!436029 () Bool)

(assert (=> b!452058 m!436029))

(declare-fun m!436031 () Bool)

(assert (=> b!452058 m!436031))

(declare-fun m!436033 () Bool)

(assert (=> b!452058 m!436033))

(assert (=> b!452058 m!436033))

(declare-fun m!436035 () Bool)

(assert (=> b!452058 m!436035))

(declare-fun m!436037 () Bool)

(assert (=> b!452063 m!436037))

(declare-fun m!436039 () Bool)

(assert (=> b!452063 m!436039))

(declare-fun m!436041 () Bool)

(assert (=> b!452060 m!436041))

(declare-fun m!436043 () Bool)

(assert (=> b!452071 m!436043))

(declare-fun m!436045 () Bool)

(assert (=> b!452071 m!436045))

(declare-fun m!436047 () Bool)

(assert (=> b!452071 m!436047))

(declare-fun m!436049 () Bool)

(assert (=> start!40768 m!436049))

(declare-fun m!436051 () Bool)

(assert (=> start!40768 m!436051))

(declare-fun m!436053 () Bool)

(assert (=> b!452061 m!436053))

(declare-fun m!436055 () Bool)

(assert (=> b!452062 m!436055))

(declare-fun m!436057 () Bool)

(assert (=> b!452067 m!436057))

(declare-fun m!436059 () Bool)

(assert (=> mapNonEmpty!19800 m!436059))

(declare-fun m!436061 () Bool)

(assert (=> b!452070 m!436061))

(assert (=> b!452070 m!436061))

(declare-fun m!436063 () Bool)

(assert (=> b!452070 m!436063))

(declare-fun m!436065 () Bool)

(assert (=> b!452070 m!436065))

(declare-fun m!436067 () Bool)

(assert (=> b!452057 m!436067))

(declare-fun m!436069 () Bool)

(assert (=> bm!29910 m!436069))

(check-sat (not b!452057) (not b!452064) (not b!452061) (not bm!29909) (not b!452062) (not b!452058) (not start!40768) b_and!18841 (not b!452059) (not b!452071) (not b!452073) (not b_lambda!9563) (not mapNonEmpty!19800) (not bm!29910) (not b!452063) tp_is_empty!12109 (not b!452067) (not b_next!10771) (not b!452070))
(check-sat b_and!18841 (not b_next!10771))
