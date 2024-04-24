; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41116 () Bool)

(assert start!41116)

(declare-fun b_free!10999 () Bool)

(declare-fun b_next!10999 () Bool)

(assert (=> start!41116 (= b_free!10999 (not b_next!10999))))

(declare-fun tp!38832 () Bool)

(declare-fun b_and!19247 () Bool)

(assert (=> start!41116 (= tp!38832 b_and!19247)))

(declare-fun b!458757 () Bool)

(declare-fun res!274111 () Bool)

(declare-fun e!267823 () Bool)

(assert (=> b!458757 (=> (not res!274111) (not e!267823))))

(declare-datatypes ((array!28468 0))(
  ( (array!28469 (arr!13674 (Array (_ BitVec 32) (_ BitVec 64))) (size!14026 (_ BitVec 32))) )
))
(declare-fun lt!207562 () array!28468)

(declare-datatypes ((List!8177 0))(
  ( (Nil!8174) (Cons!8173 (h!9029 (_ BitVec 64)) (t!14047 List!8177)) )
))
(declare-fun arrayNoDuplicates!0 (array!28468 (_ BitVec 32) List!8177) Bool)

(assert (=> b!458757 (= res!274111 (arrayNoDuplicates!0 lt!207562 #b00000000000000000000000000000000 Nil!8174))))

(declare-fun b!458758 () Bool)

(declare-fun e!267829 () Bool)

(declare-fun tp_is_empty!12337 () Bool)

(assert (=> b!458758 (= e!267829 tp_is_empty!12337)))

(declare-fun b!458759 () Bool)

(declare-fun res!274119 () Bool)

(declare-fun e!267825 () Bool)

(assert (=> b!458759 (=> (not res!274119) (not e!267825))))

(declare-fun _keys!709 () array!28468)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28468 (_ BitVec 32)) Bool)

(assert (=> b!458759 (= res!274119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458760 () Bool)

(declare-fun res!274113 () Bool)

(assert (=> b!458760 (=> (not res!274113) (not e!267823))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458760 (= res!274113 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!20155 () Bool)

(declare-fun mapRes!20155 () Bool)

(assert (=> mapIsEmpty!20155 mapRes!20155))

(declare-fun b!458761 () Bool)

(assert (=> b!458761 (= e!267825 e!267823)))

(declare-fun res!274114 () Bool)

(assert (=> b!458761 (=> (not res!274114) (not e!267823))))

(assert (=> b!458761 (= res!274114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207562 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!458761 (= lt!207562 (array!28469 (store (arr!13674 _keys!709) i!563 k0!794) (size!14026 _keys!709)))))

(declare-fun mapNonEmpty!20155 () Bool)

(declare-fun tp!38833 () Bool)

(declare-fun e!267828 () Bool)

(assert (=> mapNonEmpty!20155 (= mapRes!20155 (and tp!38833 e!267828))))

(declare-datatypes ((V!17555 0))(
  ( (V!17556 (val!6213 Int)) )
))
(declare-datatypes ((ValueCell!5825 0))(
  ( (ValueCellFull!5825 (v!8492 V!17555)) (EmptyCell!5825) )
))
(declare-fun mapRest!20155 () (Array (_ BitVec 32) ValueCell!5825))

(declare-fun mapValue!20155 () ValueCell!5825)

(declare-datatypes ((array!28470 0))(
  ( (array!28471 (arr!13675 (Array (_ BitVec 32) ValueCell!5825)) (size!14027 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28470)

(declare-fun mapKey!20155 () (_ BitVec 32))

(assert (=> mapNonEmpty!20155 (= (arr!13675 _values!549) (store mapRest!20155 mapKey!20155 mapValue!20155))))

(declare-fun b!458762 () Bool)

(declare-fun res!274118 () Bool)

(assert (=> b!458762 (=> (not res!274118) (not e!267825))))

(declare-fun arrayContainsKey!0 (array!28468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458762 (= res!274118 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458763 () Bool)

(declare-fun res!274108 () Bool)

(assert (=> b!458763 (=> (not res!274108) (not e!267825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458763 (= res!274108 (validKeyInArray!0 k0!794))))

(declare-fun b!458765 () Bool)

(declare-fun e!267827 () Bool)

(assert (=> b!458765 (= e!267823 e!267827)))

(declare-fun res!274115 () Bool)

(assert (=> b!458765 (=> (not res!274115) (not e!267827))))

(assert (=> b!458765 (= res!274115 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17555)

(declare-fun lt!207569 () array!28470)

(declare-fun minValue!515 () V!17555)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8106 0))(
  ( (tuple2!8107 (_1!4064 (_ BitVec 64)) (_2!4064 V!17555)) )
))
(declare-datatypes ((List!8178 0))(
  ( (Nil!8175) (Cons!8174 (h!9030 tuple2!8106) (t!14048 List!8178)) )
))
(declare-datatypes ((ListLongMap!7021 0))(
  ( (ListLongMap!7022 (toList!3526 List!8178)) )
))
(declare-fun lt!207564 () ListLongMap!7021)

(declare-fun getCurrentListMapNoExtraKeys!1755 (array!28468 array!28470 (_ BitVec 32) (_ BitVec 32) V!17555 V!17555 (_ BitVec 32) Int) ListLongMap!7021)

(assert (=> b!458765 (= lt!207564 (getCurrentListMapNoExtraKeys!1755 lt!207562 lt!207569 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17555)

(assert (=> b!458765 (= lt!207569 (array!28471 (store (arr!13675 _values!549) i!563 (ValueCellFull!5825 v!412)) (size!14027 _values!549)))))

(declare-fun lt!207565 () ListLongMap!7021)

(assert (=> b!458765 (= lt!207565 (getCurrentListMapNoExtraKeys!1755 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458766 () Bool)

(declare-fun res!274107 () Bool)

(assert (=> b!458766 (=> (not res!274107) (not e!267825))))

(assert (=> b!458766 (= res!274107 (and (= (size!14027 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14026 _keys!709) (size!14027 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458767 () Bool)

(declare-fun res!274105 () Bool)

(assert (=> b!458767 (=> (not res!274105) (not e!267825))))

(assert (=> b!458767 (= res!274105 (or (= (select (arr!13674 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13674 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458768 () Bool)

(declare-fun e!267830 () Bool)

(declare-fun e!267831 () Bool)

(assert (=> b!458768 (= e!267830 e!267831)))

(declare-fun res!274112 () Bool)

(assert (=> b!458768 (=> res!274112 e!267831)))

(assert (=> b!458768 (= res!274112 (not (= (select (arr!13674 _keys!709) from!863) k0!794)))))

(declare-fun lt!207568 () ListLongMap!7021)

(declare-fun +!1608 (ListLongMap!7021 tuple2!8106) ListLongMap!7021)

(declare-fun get!6749 (ValueCell!5825 V!17555) V!17555)

(declare-fun dynLambda!889 (Int (_ BitVec 64)) V!17555)

(assert (=> b!458768 (= lt!207564 (+!1608 lt!207568 (tuple2!8107 (select (arr!13674 _keys!709) from!863) (get!6749 (select (arr!13675 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458769 () Bool)

(declare-fun res!274109 () Bool)

(assert (=> b!458769 (=> (not res!274109) (not e!267825))))

(assert (=> b!458769 (= res!274109 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14026 _keys!709))))))

(declare-fun b!458770 () Bool)

(declare-fun res!274117 () Bool)

(assert (=> b!458770 (=> (not res!274117) (not e!267825))))

(assert (=> b!458770 (= res!274117 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8174))))

(declare-fun b!458771 () Bool)

(declare-fun e!267824 () Bool)

(assert (=> b!458771 (= e!267824 (and e!267829 mapRes!20155))))

(declare-fun condMapEmpty!20155 () Bool)

(declare-fun mapDefault!20155 () ValueCell!5825)

(assert (=> b!458771 (= condMapEmpty!20155 (= (arr!13675 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5825)) mapDefault!20155)))))

(declare-fun b!458772 () Bool)

(assert (=> b!458772 (= e!267828 tp_is_empty!12337)))

(declare-fun b!458773 () Bool)

(declare-fun res!274116 () Bool)

(assert (=> b!458773 (=> (not res!274116) (not e!267825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458773 (= res!274116 (validMask!0 mask!1025))))

(declare-fun b!458774 () Bool)

(assert (=> b!458774 (= e!267827 (not e!267830))))

(declare-fun res!274110 () Bool)

(assert (=> b!458774 (=> res!274110 e!267830)))

(assert (=> b!458774 (= res!274110 (not (validKeyInArray!0 (select (arr!13674 _keys!709) from!863))))))

(declare-fun lt!207561 () ListLongMap!7021)

(assert (=> b!458774 (= lt!207561 lt!207568)))

(declare-fun lt!207567 () ListLongMap!7021)

(assert (=> b!458774 (= lt!207568 (+!1608 lt!207567 (tuple2!8107 k0!794 v!412)))))

(assert (=> b!458774 (= lt!207561 (getCurrentListMapNoExtraKeys!1755 lt!207562 lt!207569 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458774 (= lt!207567 (getCurrentListMapNoExtraKeys!1755 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13315 0))(
  ( (Unit!13316) )
))
(declare-fun lt!207566 () Unit!13315)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!765 (array!28468 array!28470 (_ BitVec 32) (_ BitVec 32) V!17555 V!17555 (_ BitVec 32) (_ BitVec 64) V!17555 (_ BitVec 32) Int) Unit!13315)

(assert (=> b!458774 (= lt!207566 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!765 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!274106 () Bool)

(assert (=> start!41116 (=> (not res!274106) (not e!267825))))

(assert (=> start!41116 (= res!274106 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14026 _keys!709))))))

(assert (=> start!41116 e!267825))

(assert (=> start!41116 tp_is_empty!12337))

(assert (=> start!41116 tp!38832))

(assert (=> start!41116 true))

(declare-fun array_inv!9976 (array!28470) Bool)

(assert (=> start!41116 (and (array_inv!9976 _values!549) e!267824)))

(declare-fun array_inv!9977 (array!28468) Bool)

(assert (=> start!41116 (array_inv!9977 _keys!709)))

(declare-fun b!458764 () Bool)

(assert (=> b!458764 (= e!267831 true)))

(assert (=> b!458764 false))

(declare-fun lt!207563 () Unit!13315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13315)

(assert (=> b!458764 (= lt!207563 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (= (and start!41116 res!274106) b!458773))

(assert (= (and b!458773 res!274116) b!458766))

(assert (= (and b!458766 res!274107) b!458759))

(assert (= (and b!458759 res!274119) b!458770))

(assert (= (and b!458770 res!274117) b!458769))

(assert (= (and b!458769 res!274109) b!458763))

(assert (= (and b!458763 res!274108) b!458767))

(assert (= (and b!458767 res!274105) b!458762))

(assert (= (and b!458762 res!274118) b!458761))

(assert (= (and b!458761 res!274114) b!458757))

(assert (= (and b!458757 res!274111) b!458760))

(assert (= (and b!458760 res!274113) b!458765))

(assert (= (and b!458765 res!274115) b!458774))

(assert (= (and b!458774 (not res!274110)) b!458768))

(assert (= (and b!458768 (not res!274112)) b!458764))

(assert (= (and b!458771 condMapEmpty!20155) mapIsEmpty!20155))

(assert (= (and b!458771 (not condMapEmpty!20155)) mapNonEmpty!20155))

(get-info :version)

(assert (= (and mapNonEmpty!20155 ((_ is ValueCellFull!5825) mapValue!20155)) b!458772))

(assert (= (and b!458771 ((_ is ValueCellFull!5825) mapDefault!20155)) b!458758))

(assert (= start!41116 b!458771))

(declare-fun b_lambda!9847 () Bool)

(assert (=> (not b_lambda!9847) (not b!458768)))

(declare-fun t!14046 () Bool)

(declare-fun tb!3827 () Bool)

(assert (=> (and start!41116 (= defaultEntry!557 defaultEntry!557) t!14046) tb!3827))

(declare-fun result!7207 () Bool)

(assert (=> tb!3827 (= result!7207 tp_is_empty!12337)))

(assert (=> b!458768 t!14046))

(declare-fun b_and!19249 () Bool)

(assert (= b_and!19247 (and (=> t!14046 result!7207) b_and!19249)))

(declare-fun m!442349 () Bool)

(assert (=> b!458764 m!442349))

(declare-fun m!442351 () Bool)

(assert (=> b!458759 m!442351))

(declare-fun m!442353 () Bool)

(assert (=> b!458767 m!442353))

(declare-fun m!442355 () Bool)

(assert (=> start!41116 m!442355))

(declare-fun m!442357 () Bool)

(assert (=> start!41116 m!442357))

(declare-fun m!442359 () Bool)

(assert (=> b!458765 m!442359))

(declare-fun m!442361 () Bool)

(assert (=> b!458765 m!442361))

(declare-fun m!442363 () Bool)

(assert (=> b!458765 m!442363))

(declare-fun m!442365 () Bool)

(assert (=> b!458761 m!442365))

(declare-fun m!442367 () Bool)

(assert (=> b!458761 m!442367))

(declare-fun m!442369 () Bool)

(assert (=> b!458768 m!442369))

(declare-fun m!442371 () Bool)

(assert (=> b!458768 m!442371))

(declare-fun m!442373 () Bool)

(assert (=> b!458768 m!442373))

(declare-fun m!442375 () Bool)

(assert (=> b!458768 m!442375))

(assert (=> b!458768 m!442375))

(assert (=> b!458768 m!442371))

(declare-fun m!442377 () Bool)

(assert (=> b!458768 m!442377))

(declare-fun m!442379 () Bool)

(assert (=> b!458762 m!442379))

(declare-fun m!442381 () Bool)

(assert (=> b!458763 m!442381))

(declare-fun m!442383 () Bool)

(assert (=> b!458770 m!442383))

(declare-fun m!442385 () Bool)

(assert (=> b!458757 m!442385))

(assert (=> b!458774 m!442369))

(declare-fun m!442387 () Bool)

(assert (=> b!458774 m!442387))

(declare-fun m!442389 () Bool)

(assert (=> b!458774 m!442389))

(assert (=> b!458774 m!442369))

(declare-fun m!442391 () Bool)

(assert (=> b!458774 m!442391))

(declare-fun m!442393 () Bool)

(assert (=> b!458774 m!442393))

(declare-fun m!442395 () Bool)

(assert (=> b!458774 m!442395))

(declare-fun m!442397 () Bool)

(assert (=> mapNonEmpty!20155 m!442397))

(declare-fun m!442399 () Bool)

(assert (=> b!458773 m!442399))

(check-sat (not b!458770) b_and!19249 (not b!458759) (not b!458763) (not b!458764) (not b!458765) (not b!458757) (not b!458762) (not b!458761) (not b_lambda!9847) (not b!458768) (not b!458773) (not start!41116) (not b_next!10999) (not b!458774) tp_is_empty!12337 (not mapNonEmpty!20155))
(check-sat b_and!19249 (not b_next!10999))
