; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40762 () Bool)

(assert start!40762)

(declare-fun b_free!10765 () Bool)

(declare-fun b_next!10765 () Bool)

(assert (=> start!40762 (= b_free!10765 (not b_next!10765))))

(declare-fun tp!38118 () Bool)

(declare-fun b_and!18791 () Bool)

(assert (=> start!40762 (= tp!38118 b_and!18791)))

(declare-fun b!451669 () Bool)

(declare-fun e!264509 () Bool)

(declare-fun e!264512 () Bool)

(declare-fun mapRes!19791 () Bool)

(assert (=> b!451669 (= e!264509 (and e!264512 mapRes!19791))))

(declare-fun condMapEmpty!19791 () Bool)

(declare-datatypes ((V!17243 0))(
  ( (V!17244 (val!6096 Int)) )
))
(declare-datatypes ((ValueCell!5708 0))(
  ( (ValueCellFull!5708 (v!8349 V!17243)) (EmptyCell!5708) )
))
(declare-datatypes ((array!28005 0))(
  ( (array!28006 (arr!13447 (Array (_ BitVec 32) ValueCell!5708)) (size!13800 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28005)

(declare-fun mapDefault!19791 () ValueCell!5708)

(assert (=> b!451669 (= condMapEmpty!19791 (= (arr!13447 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5708)) mapDefault!19791)))))

(declare-fun b!451670 () Bool)

(declare-fun res!269002 () Bool)

(declare-fun e!264513 () Bool)

(assert (=> b!451670 (=> (not res!269002) (not e!264513))))

(declare-datatypes ((array!28007 0))(
  ( (array!28008 (arr!13448 (Array (_ BitVec 32) (_ BitVec 64))) (size!13801 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28007)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451670 (= res!269002 (or (= (select (arr!13448 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13448 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8028 0))(
  ( (tuple2!8029 (_1!4025 (_ BitVec 64)) (_2!4025 V!17243)) )
))
(declare-datatypes ((List!8089 0))(
  ( (Nil!8086) (Cons!8085 (h!8941 tuple2!8028) (t!13868 List!8089)) )
))
(declare-datatypes ((ListLongMap!6931 0))(
  ( (ListLongMap!6932 (toList!3481 List!8089)) )
))
(declare-fun call!29884 () ListLongMap!6931)

(declare-fun e!264514 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17243)

(declare-fun call!29883 () ListLongMap!6931)

(declare-fun b!451671 () Bool)

(declare-fun +!1580 (ListLongMap!6931 tuple2!8028) ListLongMap!6931)

(assert (=> b!451671 (= e!264514 (= call!29883 (+!1580 call!29884 (tuple2!8029 k0!794 v!412))))))

(declare-fun b!451672 () Bool)

(declare-fun res!269011 () Bool)

(assert (=> b!451672 (=> (not res!269011) (not e!264513))))

(assert (=> b!451672 (= res!269011 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13801 _keys!709))))))

(declare-fun b!451673 () Bool)

(declare-fun e!264510 () Bool)

(declare-fun e!264511 () Bool)

(assert (=> b!451673 (= e!264510 e!264511)))

(declare-fun res!269000 () Bool)

(assert (=> b!451673 (=> (not res!269000) (not e!264511))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!451673 (= res!269000 (= from!863 i!563))))

(declare-fun minValue!515 () V!17243)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!204824 () array!28007)

(declare-fun lt!204823 () ListLongMap!6931)

(declare-fun zeroValue!515 () V!17243)

(declare-fun lt!204821 () array!28005)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1678 (array!28007 array!28005 (_ BitVec 32) (_ BitVec 32) V!17243 V!17243 (_ BitVec 32) Int) ListLongMap!6931)

(assert (=> b!451673 (= lt!204823 (getCurrentListMapNoExtraKeys!1678 lt!204824 lt!204821 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451673 (= lt!204821 (array!28006 (store (arr!13447 _values!549) i!563 (ValueCellFull!5708 v!412)) (size!13800 _values!549)))))

(declare-fun lt!204822 () ListLongMap!6931)

(assert (=> b!451673 (= lt!204822 (getCurrentListMapNoExtraKeys!1678 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451675 () Bool)

(declare-fun res!269004 () Bool)

(assert (=> b!451675 (=> (not res!269004) (not e!264513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451675 (= res!269004 (validKeyInArray!0 k0!794))))

(declare-fun b!451676 () Bool)

(declare-fun res!269006 () Bool)

(assert (=> b!451676 (=> (not res!269006) (not e!264510))))

(assert (=> b!451676 (= res!269006 (bvsle from!863 i!563))))

(declare-fun b!451677 () Bool)

(declare-fun res!268999 () Bool)

(assert (=> b!451677 (=> (not res!268999) (not e!264513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28007 (_ BitVec 32)) Bool)

(assert (=> b!451677 (= res!268999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19791 () Bool)

(declare-fun tp!38117 () Bool)

(declare-fun e!264507 () Bool)

(assert (=> mapNonEmpty!19791 (= mapRes!19791 (and tp!38117 e!264507))))

(declare-fun mapRest!19791 () (Array (_ BitVec 32) ValueCell!5708))

(declare-fun mapValue!19791 () ValueCell!5708)

(declare-fun mapKey!19791 () (_ BitVec 32))

(assert (=> mapNonEmpty!19791 (= (arr!13447 _values!549) (store mapRest!19791 mapKey!19791 mapValue!19791))))

(declare-fun b!451678 () Bool)

(declare-fun e!264508 () Bool)

(assert (=> b!451678 (= e!264508 (bvslt from!863 (size!13800 _values!549)))))

(declare-fun get!6627 (ValueCell!5708 V!17243) V!17243)

(declare-fun dynLambda!857 (Int (_ BitVec 64)) V!17243)

(assert (=> b!451678 (= lt!204823 (+!1580 (getCurrentListMapNoExtraKeys!1678 lt!204824 lt!204821 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8029 (select (arr!13448 lt!204824) from!863) (get!6627 (select (arr!13447 lt!204821) from!863) (dynLambda!857 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451679 () Bool)

(declare-fun res!269012 () Bool)

(assert (=> b!451679 (=> (not res!269012) (not e!264513))))

(assert (=> b!451679 (= res!269012 (and (= (size!13800 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13801 _keys!709) (size!13800 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451680 () Bool)

(assert (=> b!451680 (= e!264511 (not e!264508))))

(declare-fun res!269009 () Bool)

(assert (=> b!451680 (=> res!269009 e!264508)))

(assert (=> b!451680 (= res!269009 (validKeyInArray!0 (select (arr!13448 _keys!709) from!863)))))

(assert (=> b!451680 e!264514))

(declare-fun c!56025 () Bool)

(assert (=> b!451680 (= c!56025 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13181 0))(
  ( (Unit!13182) )
))
(declare-fun lt!204820 () Unit!13181)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!718 (array!28007 array!28005 (_ BitVec 32) (_ BitVec 32) V!17243 V!17243 (_ BitVec 32) (_ BitVec 64) V!17243 (_ BitVec 32) Int) Unit!13181)

(assert (=> b!451680 (= lt!204820 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!718 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29880 () Bool)

(assert (=> bm!29880 (= call!29884 (getCurrentListMapNoExtraKeys!1678 (ite c!56025 _keys!709 lt!204824) (ite c!56025 _values!549 lt!204821) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451681 () Bool)

(declare-fun res!269007 () Bool)

(assert (=> b!451681 (=> (not res!269007) (not e!264513))))

(declare-fun arrayContainsKey!0 (array!28007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451681 (= res!269007 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451682 () Bool)

(declare-fun res!269010 () Bool)

(assert (=> b!451682 (=> (not res!269010) (not e!264513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451682 (= res!269010 (validMask!0 mask!1025))))

(declare-fun b!451683 () Bool)

(assert (=> b!451683 (= e!264513 e!264510)))

(declare-fun res!269001 () Bool)

(assert (=> b!451683 (=> (not res!269001) (not e!264510))))

(assert (=> b!451683 (= res!269001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204824 mask!1025))))

(assert (=> b!451683 (= lt!204824 (array!28008 (store (arr!13448 _keys!709) i!563 k0!794) (size!13801 _keys!709)))))

(declare-fun mapIsEmpty!19791 () Bool)

(assert (=> mapIsEmpty!19791 mapRes!19791))

(declare-fun b!451674 () Bool)

(assert (=> b!451674 (= e!264514 (= call!29884 call!29883))))

(declare-fun res!269003 () Bool)

(assert (=> start!40762 (=> (not res!269003) (not e!264513))))

(assert (=> start!40762 (= res!269003 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13801 _keys!709))))))

(assert (=> start!40762 e!264513))

(declare-fun tp_is_empty!12103 () Bool)

(assert (=> start!40762 tp_is_empty!12103))

(assert (=> start!40762 tp!38118))

(assert (=> start!40762 true))

(declare-fun array_inv!9802 (array!28005) Bool)

(assert (=> start!40762 (and (array_inv!9802 _values!549) e!264509)))

(declare-fun array_inv!9803 (array!28007) Bool)

(assert (=> start!40762 (array_inv!9803 _keys!709)))

(declare-fun b!451684 () Bool)

(assert (=> b!451684 (= e!264512 tp_is_empty!12103)))

(declare-fun b!451685 () Bool)

(declare-fun res!269008 () Bool)

(assert (=> b!451685 (=> (not res!269008) (not e!264510))))

(declare-datatypes ((List!8090 0))(
  ( (Nil!8087) (Cons!8086 (h!8942 (_ BitVec 64)) (t!13869 List!8090)) )
))
(declare-fun arrayNoDuplicates!0 (array!28007 (_ BitVec 32) List!8090) Bool)

(assert (=> b!451685 (= res!269008 (arrayNoDuplicates!0 lt!204824 #b00000000000000000000000000000000 Nil!8087))))

(declare-fun bm!29881 () Bool)

(assert (=> bm!29881 (= call!29883 (getCurrentListMapNoExtraKeys!1678 (ite c!56025 lt!204824 _keys!709) (ite c!56025 lt!204821 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451686 () Bool)

(declare-fun res!269005 () Bool)

(assert (=> b!451686 (=> (not res!269005) (not e!264513))))

(assert (=> b!451686 (= res!269005 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8087))))

(declare-fun b!451687 () Bool)

(assert (=> b!451687 (= e!264507 tp_is_empty!12103)))

(assert (= (and start!40762 res!269003) b!451682))

(assert (= (and b!451682 res!269010) b!451679))

(assert (= (and b!451679 res!269012) b!451677))

(assert (= (and b!451677 res!268999) b!451686))

(assert (= (and b!451686 res!269005) b!451672))

(assert (= (and b!451672 res!269011) b!451675))

(assert (= (and b!451675 res!269004) b!451670))

(assert (= (and b!451670 res!269002) b!451681))

(assert (= (and b!451681 res!269007) b!451683))

(assert (= (and b!451683 res!269001) b!451685))

(assert (= (and b!451685 res!269008) b!451676))

(assert (= (and b!451676 res!269006) b!451673))

(assert (= (and b!451673 res!269000) b!451680))

(assert (= (and b!451680 c!56025) b!451671))

(assert (= (and b!451680 (not c!56025)) b!451674))

(assert (= (or b!451671 b!451674) bm!29881))

(assert (= (or b!451671 b!451674) bm!29880))

(assert (= (and b!451680 (not res!269009)) b!451678))

(assert (= (and b!451669 condMapEmpty!19791) mapIsEmpty!19791))

(assert (= (and b!451669 (not condMapEmpty!19791)) mapNonEmpty!19791))

(get-info :version)

(assert (= (and mapNonEmpty!19791 ((_ is ValueCellFull!5708) mapValue!19791)) b!451687))

(assert (= (and b!451669 ((_ is ValueCellFull!5708) mapDefault!19791)) b!451684))

(assert (= start!40762 b!451669))

(declare-fun b_lambda!9525 () Bool)

(assert (=> (not b_lambda!9525) (not b!451678)))

(declare-fun t!13867 () Bool)

(declare-fun tb!3737 () Bool)

(assert (=> (and start!40762 (= defaultEntry!557 defaultEntry!557) t!13867) tb!3737))

(declare-fun result!7019 () Bool)

(assert (=> tb!3737 (= result!7019 tp_is_empty!12103)))

(assert (=> b!451678 t!13867))

(declare-fun b_and!18793 () Bool)

(assert (= b_and!18791 (and (=> t!13867 result!7019) b_and!18793)))

(declare-fun m!434939 () Bool)

(assert (=> b!451678 m!434939))

(assert (=> b!451678 m!434939))

(declare-fun m!434941 () Bool)

(assert (=> b!451678 m!434941))

(declare-fun m!434943 () Bool)

(assert (=> b!451678 m!434943))

(declare-fun m!434945 () Bool)

(assert (=> b!451678 m!434945))

(assert (=> b!451678 m!434943))

(declare-fun m!434947 () Bool)

(assert (=> b!451678 m!434947))

(assert (=> b!451678 m!434945))

(declare-fun m!434949 () Bool)

(assert (=> b!451678 m!434949))

(declare-fun m!434951 () Bool)

(assert (=> start!40762 m!434951))

(declare-fun m!434953 () Bool)

(assert (=> start!40762 m!434953))

(declare-fun m!434955 () Bool)

(assert (=> bm!29881 m!434955))

(declare-fun m!434957 () Bool)

(assert (=> mapNonEmpty!19791 m!434957))

(declare-fun m!434959 () Bool)

(assert (=> b!451683 m!434959))

(declare-fun m!434961 () Bool)

(assert (=> b!451683 m!434961))

(declare-fun m!434963 () Bool)

(assert (=> b!451682 m!434963))

(declare-fun m!434965 () Bool)

(assert (=> b!451673 m!434965))

(declare-fun m!434967 () Bool)

(assert (=> b!451673 m!434967))

(declare-fun m!434969 () Bool)

(assert (=> b!451673 m!434969))

(declare-fun m!434971 () Bool)

(assert (=> b!451680 m!434971))

(assert (=> b!451680 m!434971))

(declare-fun m!434973 () Bool)

(assert (=> b!451680 m!434973))

(declare-fun m!434975 () Bool)

(assert (=> b!451680 m!434975))

(declare-fun m!434977 () Bool)

(assert (=> b!451670 m!434977))

(declare-fun m!434979 () Bool)

(assert (=> bm!29880 m!434979))

(declare-fun m!434981 () Bool)

(assert (=> b!451677 m!434981))

(declare-fun m!434983 () Bool)

(assert (=> b!451675 m!434983))

(declare-fun m!434985 () Bool)

(assert (=> b!451671 m!434985))

(declare-fun m!434987 () Bool)

(assert (=> b!451681 m!434987))

(declare-fun m!434989 () Bool)

(assert (=> b!451685 m!434989))

(declare-fun m!434991 () Bool)

(assert (=> b!451686 m!434991))

(check-sat (not b!451678) (not b!451686) (not bm!29880) (not b!451671) (not bm!29881) (not b!451685) b_and!18793 (not b!451680) (not b!451675) (not b_lambda!9525) (not b!451677) (not b!451682) (not b!451683) tp_is_empty!12103 (not b_next!10765) (not b!451673) (not b!451681) (not start!40762) (not mapNonEmpty!19791))
(check-sat b_and!18793 (not b_next!10765))
