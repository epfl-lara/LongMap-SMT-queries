; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40218 () Bool)

(assert start!40218)

(declare-fun b_free!10485 () Bool)

(declare-fun b_next!10485 () Bool)

(assert (=> start!40218 (= b_free!10485 (not b_next!10485))))

(declare-fun tp!36984 () Bool)

(declare-fun b_and!18453 () Bool)

(assert (=> start!40218 (= tp!36984 b_and!18453)))

(declare-fun b!440996 () Bool)

(declare-fun e!259737 () Bool)

(declare-fun tp_is_empty!11637 () Bool)

(assert (=> b!440996 (= e!259737 tp_is_empty!11637)))

(declare-fun b!440997 () Bool)

(declare-fun e!259735 () Bool)

(assert (=> b!440997 (= e!259735 (not true))))

(declare-datatypes ((V!16621 0))(
  ( (V!16622 (val!5863 Int)) )
))
(declare-fun minValue!515 () V!16621)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27087 0))(
  ( (array!27088 (arr!12993 (Array (_ BitVec 32) (_ BitVec 64))) (size!13345 (_ BitVec 32))) )
))
(declare-fun lt!202758 () array!27087)

(declare-datatypes ((ValueCell!5475 0))(
  ( (ValueCellFull!5475 (v!8110 V!16621)) (EmptyCell!5475) )
))
(declare-datatypes ((array!27089 0))(
  ( (array!27090 (arr!12994 (Array (_ BitVec 32) ValueCell!5475)) (size!13346 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27089)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202760 () array!27089)

(declare-fun v!412 () V!16621)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27087)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16621)

(declare-datatypes ((tuple2!7798 0))(
  ( (tuple2!7799 (_1!3910 (_ BitVec 64)) (_2!3910 V!16621)) )
))
(declare-datatypes ((List!7793 0))(
  ( (Nil!7790) (Cons!7789 (h!8645 tuple2!7798) (t!13549 List!7793)) )
))
(declare-datatypes ((ListLongMap!6711 0))(
  ( (ListLongMap!6712 (toList!3371 List!7793)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1560 (array!27087 array!27089 (_ BitVec 32) (_ BitVec 32) V!16621 V!16621 (_ BitVec 32) Int) ListLongMap!6711)

(declare-fun +!1507 (ListLongMap!6711 tuple2!7798) ListLongMap!6711)

(assert (=> b!440997 (= (getCurrentListMapNoExtraKeys!1560 lt!202758 lt!202760 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1507 (getCurrentListMapNoExtraKeys!1560 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7799 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13118 0))(
  ( (Unit!13119) )
))
(declare-fun lt!202756 () Unit!13118)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!676 (array!27087 array!27089 (_ BitVec 32) (_ BitVec 32) V!16621 V!16621 (_ BitVec 32) (_ BitVec 64) V!16621 (_ BitVec 32) Int) Unit!13118)

(assert (=> b!440997 (= lt!202756 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!676 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440998 () Bool)

(declare-fun res!260949 () Bool)

(declare-fun e!259738 () Bool)

(assert (=> b!440998 (=> (not res!260949) (not e!259738))))

(declare-fun arrayContainsKey!0 (array!27087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440998 (= res!260949 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440999 () Bool)

(declare-fun res!260953 () Bool)

(assert (=> b!440999 (=> (not res!260953) (not e!259738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440999 (= res!260953 (validKeyInArray!0 k0!794))))

(declare-fun b!441001 () Bool)

(declare-fun e!259734 () Bool)

(declare-fun mapRes!19077 () Bool)

(assert (=> b!441001 (= e!259734 (and e!259737 mapRes!19077))))

(declare-fun condMapEmpty!19077 () Bool)

(declare-fun mapDefault!19077 () ValueCell!5475)

(assert (=> b!441001 (= condMapEmpty!19077 (= (arr!12994 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5475)) mapDefault!19077)))))

(declare-fun b!441002 () Bool)

(declare-fun res!260958 () Bool)

(declare-fun e!259739 () Bool)

(assert (=> b!441002 (=> (not res!260958) (not e!259739))))

(assert (=> b!441002 (= res!260958 (bvsle from!863 i!563))))

(declare-fun b!441003 () Bool)

(declare-fun res!260952 () Bool)

(assert (=> b!441003 (=> (not res!260952) (not e!259738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441003 (= res!260952 (validMask!0 mask!1025))))

(declare-fun b!441004 () Bool)

(declare-fun res!260961 () Bool)

(assert (=> b!441004 (=> (not res!260961) (not e!259738))))

(assert (=> b!441004 (= res!260961 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13345 _keys!709))))))

(declare-fun mapIsEmpty!19077 () Bool)

(assert (=> mapIsEmpty!19077 mapRes!19077))

(declare-fun b!441005 () Bool)

(declare-fun res!260951 () Bool)

(assert (=> b!441005 (=> (not res!260951) (not e!259738))))

(assert (=> b!441005 (= res!260951 (or (= (select (arr!12993 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12993 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441006 () Bool)

(declare-fun res!260956 () Bool)

(assert (=> b!441006 (=> (not res!260956) (not e!259738))))

(declare-datatypes ((List!7794 0))(
  ( (Nil!7791) (Cons!7790 (h!8646 (_ BitVec 64)) (t!13550 List!7794)) )
))
(declare-fun arrayNoDuplicates!0 (array!27087 (_ BitVec 32) List!7794) Bool)

(assert (=> b!441006 (= res!260956 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7791))))

(declare-fun b!441007 () Bool)

(assert (=> b!441007 (= e!259739 e!259735)))

(declare-fun res!260957 () Bool)

(assert (=> b!441007 (=> (not res!260957) (not e!259735))))

(assert (=> b!441007 (= res!260957 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202757 () ListLongMap!6711)

(assert (=> b!441007 (= lt!202757 (getCurrentListMapNoExtraKeys!1560 lt!202758 lt!202760 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441007 (= lt!202760 (array!27090 (store (arr!12994 _values!549) i!563 (ValueCellFull!5475 v!412)) (size!13346 _values!549)))))

(declare-fun lt!202759 () ListLongMap!6711)

(assert (=> b!441007 (= lt!202759 (getCurrentListMapNoExtraKeys!1560 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441008 () Bool)

(declare-fun e!259736 () Bool)

(assert (=> b!441008 (= e!259736 tp_is_empty!11637)))

(declare-fun b!441009 () Bool)

(declare-fun res!260960 () Bool)

(assert (=> b!441009 (=> (not res!260960) (not e!259738))))

(assert (=> b!441009 (= res!260960 (and (= (size!13346 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13345 _keys!709) (size!13346 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19077 () Bool)

(declare-fun tp!36983 () Bool)

(assert (=> mapNonEmpty!19077 (= mapRes!19077 (and tp!36983 e!259736))))

(declare-fun mapKey!19077 () (_ BitVec 32))

(declare-fun mapRest!19077 () (Array (_ BitVec 32) ValueCell!5475))

(declare-fun mapValue!19077 () ValueCell!5475)

(assert (=> mapNonEmpty!19077 (= (arr!12994 _values!549) (store mapRest!19077 mapKey!19077 mapValue!19077))))

(declare-fun b!441010 () Bool)

(assert (=> b!441010 (= e!259738 e!259739)))

(declare-fun res!260950 () Bool)

(assert (=> b!441010 (=> (not res!260950) (not e!259739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27087 (_ BitVec 32)) Bool)

(assert (=> b!441010 (= res!260950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202758 mask!1025))))

(assert (=> b!441010 (= lt!202758 (array!27088 (store (arr!12993 _keys!709) i!563 k0!794) (size!13345 _keys!709)))))

(declare-fun b!441011 () Bool)

(declare-fun res!260955 () Bool)

(assert (=> b!441011 (=> (not res!260955) (not e!259739))))

(assert (=> b!441011 (= res!260955 (arrayNoDuplicates!0 lt!202758 #b00000000000000000000000000000000 Nil!7791))))

(declare-fun b!441000 () Bool)

(declare-fun res!260954 () Bool)

(assert (=> b!441000 (=> (not res!260954) (not e!259738))))

(assert (=> b!441000 (= res!260954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!260959 () Bool)

(assert (=> start!40218 (=> (not res!260959) (not e!259738))))

(assert (=> start!40218 (= res!260959 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13345 _keys!709))))))

(assert (=> start!40218 e!259738))

(assert (=> start!40218 tp_is_empty!11637))

(assert (=> start!40218 tp!36984))

(assert (=> start!40218 true))

(declare-fun array_inv!9430 (array!27089) Bool)

(assert (=> start!40218 (and (array_inv!9430 _values!549) e!259734)))

(declare-fun array_inv!9431 (array!27087) Bool)

(assert (=> start!40218 (array_inv!9431 _keys!709)))

(assert (= (and start!40218 res!260959) b!441003))

(assert (= (and b!441003 res!260952) b!441009))

(assert (= (and b!441009 res!260960) b!441000))

(assert (= (and b!441000 res!260954) b!441006))

(assert (= (and b!441006 res!260956) b!441004))

(assert (= (and b!441004 res!260961) b!440999))

(assert (= (and b!440999 res!260953) b!441005))

(assert (= (and b!441005 res!260951) b!440998))

(assert (= (and b!440998 res!260949) b!441010))

(assert (= (and b!441010 res!260950) b!441011))

(assert (= (and b!441011 res!260955) b!441002))

(assert (= (and b!441002 res!260958) b!441007))

(assert (= (and b!441007 res!260957) b!440997))

(assert (= (and b!441001 condMapEmpty!19077) mapIsEmpty!19077))

(assert (= (and b!441001 (not condMapEmpty!19077)) mapNonEmpty!19077))

(get-info :version)

(assert (= (and mapNonEmpty!19077 ((_ is ValueCellFull!5475) mapValue!19077)) b!441008))

(assert (= (and b!441001 ((_ is ValueCellFull!5475) mapDefault!19077)) b!440996))

(assert (= start!40218 b!441001))

(declare-fun m!427925 () Bool)

(assert (=> mapNonEmpty!19077 m!427925))

(declare-fun m!427927 () Bool)

(assert (=> b!440998 m!427927))

(declare-fun m!427929 () Bool)

(assert (=> b!441010 m!427929))

(declare-fun m!427931 () Bool)

(assert (=> b!441010 m!427931))

(declare-fun m!427933 () Bool)

(assert (=> b!441005 m!427933))

(declare-fun m!427935 () Bool)

(assert (=> b!441000 m!427935))

(declare-fun m!427937 () Bool)

(assert (=> b!441007 m!427937))

(declare-fun m!427939 () Bool)

(assert (=> b!441007 m!427939))

(declare-fun m!427941 () Bool)

(assert (=> b!441007 m!427941))

(declare-fun m!427943 () Bool)

(assert (=> start!40218 m!427943))

(declare-fun m!427945 () Bool)

(assert (=> start!40218 m!427945))

(declare-fun m!427947 () Bool)

(assert (=> b!441011 m!427947))

(declare-fun m!427949 () Bool)

(assert (=> b!441006 m!427949))

(declare-fun m!427951 () Bool)

(assert (=> b!440997 m!427951))

(declare-fun m!427953 () Bool)

(assert (=> b!440997 m!427953))

(assert (=> b!440997 m!427953))

(declare-fun m!427955 () Bool)

(assert (=> b!440997 m!427955))

(declare-fun m!427957 () Bool)

(assert (=> b!440997 m!427957))

(declare-fun m!427959 () Bool)

(assert (=> b!440999 m!427959))

(declare-fun m!427961 () Bool)

(assert (=> b!441003 m!427961))

(check-sat tp_is_empty!11637 (not b_next!10485) (not b!441007) (not b!441006) (not b!441000) (not start!40218) (not b!441010) (not b!441003) (not b!440999) (not mapNonEmpty!19077) (not b!441011) b_and!18453 (not b!440997) (not b!440998))
(check-sat b_and!18453 (not b_next!10485))
