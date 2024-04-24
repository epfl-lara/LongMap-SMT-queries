; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20440 () Bool)

(assert start!20440)

(declare-fun b_free!5095 () Bool)

(declare-fun b_next!5095 () Bool)

(assert (=> start!20440 (= b_free!5095 (not b_next!5095))))

(declare-fun tp!18317 () Bool)

(declare-fun b_and!11855 () Bool)

(assert (=> start!20440 (= tp!18317 b_and!11855)))

(declare-fun b!202387 () Bool)

(declare-fun res!96956 () Bool)

(declare-fun e!132572 () Bool)

(assert (=> b!202387 (=> (not res!96956) (not e!132572))))

(declare-datatypes ((array!9119 0))(
  ( (array!9120 (arr!4310 (Array (_ BitVec 32) (_ BitVec 64))) (size!4635 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9119)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202387 (= res!96956 (= (select (arr!4310 _keys!825) i!601) k0!843))))

(declare-fun b!202388 () Bool)

(declare-fun res!96955 () Bool)

(assert (=> b!202388 (=> (not res!96955) (not e!132572))))

(assert (=> b!202388 (= res!96955 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4635 _keys!825))))))

(declare-fun b!202389 () Bool)

(declare-fun e!132569 () Bool)

(assert (=> b!202389 (= e!132572 (not e!132569))))

(declare-fun res!96957 () Bool)

(assert (=> b!202389 (=> res!96957 e!132569)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202389 (= res!96957 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6249 0))(
  ( (V!6250 (val!2520 Int)) )
))
(declare-datatypes ((ValueCell!2132 0))(
  ( (ValueCellFull!2132 (v!4491 V!6249)) (EmptyCell!2132) )
))
(declare-datatypes ((array!9121 0))(
  ( (array!9122 (arr!4311 (Array (_ BitVec 32) ValueCell!2132)) (size!4636 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9121)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3754 0))(
  ( (tuple2!3755 (_1!1888 (_ BitVec 64)) (_2!1888 V!6249)) )
))
(declare-datatypes ((List!2662 0))(
  ( (Nil!2659) (Cons!2658 (h!3300 tuple2!3754) (t!7585 List!2662)) )
))
(declare-datatypes ((ListLongMap!2669 0))(
  ( (ListLongMap!2670 (toList!1350 List!2662)) )
))
(declare-fun lt!101611 () ListLongMap!2669)

(declare-fun zeroValue!615 () V!6249)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6249)

(declare-fun getCurrentListMap!934 (array!9119 array!9121 (_ BitVec 32) (_ BitVec 32) V!6249 V!6249 (_ BitVec 32) Int) ListLongMap!2669)

(assert (=> b!202389 (= lt!101611 (getCurrentListMap!934 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101617 () ListLongMap!2669)

(declare-fun lt!101616 () array!9121)

(assert (=> b!202389 (= lt!101617 (getCurrentListMap!934 _keys!825 lt!101616 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101613 () ListLongMap!2669)

(declare-fun lt!101612 () ListLongMap!2669)

(assert (=> b!202389 (and (= lt!101613 lt!101612) (= lt!101612 lt!101613))))

(declare-fun lt!101614 () ListLongMap!2669)

(declare-fun v!520 () V!6249)

(declare-fun +!404 (ListLongMap!2669 tuple2!3754) ListLongMap!2669)

(assert (=> b!202389 (= lt!101612 (+!404 lt!101614 (tuple2!3755 k0!843 v!520)))))

(declare-datatypes ((Unit!6092 0))(
  ( (Unit!6093) )
))
(declare-fun lt!101618 () Unit!6092)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!70 (array!9119 array!9121 (_ BitVec 32) (_ BitVec 32) V!6249 V!6249 (_ BitVec 32) (_ BitVec 64) V!6249 (_ BitVec 32) Int) Unit!6092)

(assert (=> b!202389 (= lt!101618 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!70 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!327 (array!9119 array!9121 (_ BitVec 32) (_ BitVec 32) V!6249 V!6249 (_ BitVec 32) Int) ListLongMap!2669)

(assert (=> b!202389 (= lt!101613 (getCurrentListMapNoExtraKeys!327 _keys!825 lt!101616 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202389 (= lt!101616 (array!9122 (store (arr!4311 _values!649) i!601 (ValueCellFull!2132 v!520)) (size!4636 _values!649)))))

(assert (=> b!202389 (= lt!101614 (getCurrentListMapNoExtraKeys!327 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8495 () Bool)

(declare-fun mapRes!8495 () Bool)

(declare-fun tp!18316 () Bool)

(declare-fun e!132571 () Bool)

(assert (=> mapNonEmpty!8495 (= mapRes!8495 (and tp!18316 e!132571))))

(declare-fun mapKey!8495 () (_ BitVec 32))

(declare-fun mapRest!8495 () (Array (_ BitVec 32) ValueCell!2132))

(declare-fun mapValue!8495 () ValueCell!2132)

(assert (=> mapNonEmpty!8495 (= (arr!4311 _values!649) (store mapRest!8495 mapKey!8495 mapValue!8495))))

(declare-fun lt!101615 () tuple2!3754)

(declare-fun b!202390 () Bool)

(declare-fun e!132575 () Bool)

(assert (=> b!202390 (= e!132575 (= lt!101617 (+!404 lt!101612 lt!101615)))))

(declare-fun b!202391 () Bool)

(assert (=> b!202391 (= e!132569 true)))

(assert (=> b!202391 e!132575))

(declare-fun res!96958 () Bool)

(assert (=> b!202391 (=> (not res!96958) (not e!132575))))

(assert (=> b!202391 (= res!96958 (= lt!101617 (+!404 lt!101613 lt!101615)))))

(assert (=> b!202391 (= lt!101615 (tuple2!3755 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8495 () Bool)

(assert (=> mapIsEmpty!8495 mapRes!8495))

(declare-fun b!202392 () Bool)

(declare-fun res!96954 () Bool)

(assert (=> b!202392 (=> (not res!96954) (not e!132572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202392 (= res!96954 (validKeyInArray!0 k0!843))))

(declare-fun b!202393 () Bool)

(declare-fun e!132574 () Bool)

(declare-fun e!132573 () Bool)

(assert (=> b!202393 (= e!132574 (and e!132573 mapRes!8495))))

(declare-fun condMapEmpty!8495 () Bool)

(declare-fun mapDefault!8495 () ValueCell!2132)

(assert (=> b!202393 (= condMapEmpty!8495 (= (arr!4311 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2132)) mapDefault!8495)))))

(declare-fun b!202394 () Bool)

(declare-fun res!96949 () Bool)

(assert (=> b!202394 (=> (not res!96949) (not e!132572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9119 (_ BitVec 32)) Bool)

(assert (=> b!202394 (= res!96949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202395 () Bool)

(declare-fun tp_is_empty!4951 () Bool)

(assert (=> b!202395 (= e!132573 tp_is_empty!4951)))

(declare-fun b!202396 () Bool)

(declare-fun res!96952 () Bool)

(assert (=> b!202396 (=> (not res!96952) (not e!132572))))

(declare-datatypes ((List!2663 0))(
  ( (Nil!2660) (Cons!2659 (h!3301 (_ BitVec 64)) (t!7586 List!2663)) )
))
(declare-fun arrayNoDuplicates!0 (array!9119 (_ BitVec 32) List!2663) Bool)

(assert (=> b!202396 (= res!96952 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2660))))

(declare-fun b!202397 () Bool)

(declare-fun res!96951 () Bool)

(assert (=> b!202397 (=> (not res!96951) (not e!132575))))

(assert (=> b!202397 (= res!96951 (= lt!101611 (+!404 lt!101614 lt!101615)))))

(declare-fun res!96950 () Bool)

(assert (=> start!20440 (=> (not res!96950) (not e!132572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20440 (= res!96950 (validMask!0 mask!1149))))

(assert (=> start!20440 e!132572))

(declare-fun array_inv!2811 (array!9121) Bool)

(assert (=> start!20440 (and (array_inv!2811 _values!649) e!132574)))

(assert (=> start!20440 true))

(assert (=> start!20440 tp_is_empty!4951))

(declare-fun array_inv!2812 (array!9119) Bool)

(assert (=> start!20440 (array_inv!2812 _keys!825)))

(assert (=> start!20440 tp!18317))

(declare-fun b!202398 () Bool)

(assert (=> b!202398 (= e!132571 tp_is_empty!4951)))

(declare-fun b!202399 () Bool)

(declare-fun res!96953 () Bool)

(assert (=> b!202399 (=> (not res!96953) (not e!132572))))

(assert (=> b!202399 (= res!96953 (and (= (size!4636 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4635 _keys!825) (size!4636 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20440 res!96950) b!202399))

(assert (= (and b!202399 res!96953) b!202394))

(assert (= (and b!202394 res!96949) b!202396))

(assert (= (and b!202396 res!96952) b!202388))

(assert (= (and b!202388 res!96955) b!202392))

(assert (= (and b!202392 res!96954) b!202387))

(assert (= (and b!202387 res!96956) b!202389))

(assert (= (and b!202389 (not res!96957)) b!202391))

(assert (= (and b!202391 res!96958) b!202397))

(assert (= (and b!202397 res!96951) b!202390))

(assert (= (and b!202393 condMapEmpty!8495) mapIsEmpty!8495))

(assert (= (and b!202393 (not condMapEmpty!8495)) mapNonEmpty!8495))

(get-info :version)

(assert (= (and mapNonEmpty!8495 ((_ is ValueCellFull!2132) mapValue!8495)) b!202398))

(assert (= (and b!202393 ((_ is ValueCellFull!2132) mapDefault!8495)) b!202395))

(assert (= start!20440 b!202393))

(declare-fun m!229845 () Bool)

(assert (=> mapNonEmpty!8495 m!229845))

(declare-fun m!229847 () Bool)

(assert (=> b!202389 m!229847))

(declare-fun m!229849 () Bool)

(assert (=> b!202389 m!229849))

(declare-fun m!229851 () Bool)

(assert (=> b!202389 m!229851))

(declare-fun m!229853 () Bool)

(assert (=> b!202389 m!229853))

(declare-fun m!229855 () Bool)

(assert (=> b!202389 m!229855))

(declare-fun m!229857 () Bool)

(assert (=> b!202389 m!229857))

(declare-fun m!229859 () Bool)

(assert (=> b!202389 m!229859))

(declare-fun m!229861 () Bool)

(assert (=> start!20440 m!229861))

(declare-fun m!229863 () Bool)

(assert (=> start!20440 m!229863))

(declare-fun m!229865 () Bool)

(assert (=> start!20440 m!229865))

(declare-fun m!229867 () Bool)

(assert (=> b!202390 m!229867))

(declare-fun m!229869 () Bool)

(assert (=> b!202396 m!229869))

(declare-fun m!229871 () Bool)

(assert (=> b!202394 m!229871))

(declare-fun m!229873 () Bool)

(assert (=> b!202387 m!229873))

(declare-fun m!229875 () Bool)

(assert (=> b!202397 m!229875))

(declare-fun m!229877 () Bool)

(assert (=> b!202392 m!229877))

(declare-fun m!229879 () Bool)

(assert (=> b!202391 m!229879))

(check-sat (not start!20440) tp_is_empty!4951 (not b!202390) (not mapNonEmpty!8495) (not b!202397) b_and!11855 (not b!202389) (not b!202391) (not b!202392) (not b!202396) (not b_next!5095) (not b!202394))
(check-sat b_and!11855 (not b_next!5095))
