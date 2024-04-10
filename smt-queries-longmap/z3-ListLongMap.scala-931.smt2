; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20684 () Bool)

(assert start!20684)

(declare-fun b_free!5343 () Bool)

(declare-fun b_next!5343 () Bool)

(assert (=> start!20684 (= b_free!5343 (not b_next!5343))))

(declare-fun tp!19061 () Bool)

(declare-fun b_and!12089 () Bool)

(assert (=> start!20684 (= tp!19061 b_and!12089)))

(declare-fun b!206756 () Bool)

(declare-fun res!100233 () Bool)

(declare-fun e!135089 () Bool)

(assert (=> b!206756 (=> (not res!100233) (not e!135089))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206756 (= res!100233 (validKeyInArray!0 k0!843))))

(declare-fun b!206757 () Bool)

(assert (=> b!206757 (= e!135089 (not true))))

(declare-datatypes ((V!6579 0))(
  ( (V!6580 (val!2644 Int)) )
))
(declare-datatypes ((ValueCell!2256 0))(
  ( (ValueCellFull!2256 (v!4614 V!6579)) (EmptyCell!2256) )
))
(declare-datatypes ((array!9607 0))(
  ( (array!9608 (arr!4554 (Array (_ BitVec 32) ValueCell!2256)) (size!4879 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9607)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4014 0))(
  ( (tuple2!4015 (_1!2018 (_ BitVec 64)) (_2!2018 V!6579)) )
))
(declare-datatypes ((List!2905 0))(
  ( (Nil!2902) (Cons!2901 (h!3543 tuple2!4014) (t!7836 List!2905)) )
))
(declare-datatypes ((ListLongMap!2927 0))(
  ( (ListLongMap!2928 (toList!1479 List!2905)) )
))
(declare-fun lt!105797 () ListLongMap!2927)

(declare-fun zeroValue!615 () V!6579)

(declare-datatypes ((array!9609 0))(
  ( (array!9610 (arr!4555 (Array (_ BitVec 32) (_ BitVec 64))) (size!4880 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9609)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6579)

(declare-fun getCurrentListMap!1046 (array!9609 array!9607 (_ BitVec 32) (_ BitVec 32) V!6579 V!6579 (_ BitVec 32) Int) ListLongMap!2927)

(assert (=> b!206757 (= lt!105797 (getCurrentListMap!1046 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105793 () ListLongMap!2927)

(declare-fun lt!105796 () array!9607)

(assert (=> b!206757 (= lt!105793 (getCurrentListMap!1046 _keys!825 lt!105796 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105795 () ListLongMap!2927)

(declare-fun lt!105794 () ListLongMap!2927)

(assert (=> b!206757 (and (= lt!105795 lt!105794) (= lt!105794 lt!105795))))

(declare-fun lt!105798 () ListLongMap!2927)

(declare-fun v!520 () V!6579)

(declare-fun +!506 (ListLongMap!2927 tuple2!4014) ListLongMap!2927)

(assert (=> b!206757 (= lt!105794 (+!506 lt!105798 (tuple2!4015 k0!843 v!520)))))

(declare-datatypes ((Unit!6300 0))(
  ( (Unit!6301) )
))
(declare-fun lt!105792 () Unit!6300)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!159 (array!9609 array!9607 (_ BitVec 32) (_ BitVec 32) V!6579 V!6579 (_ BitVec 32) (_ BitVec 64) V!6579 (_ BitVec 32) Int) Unit!6300)

(assert (=> b!206757 (= lt!105792 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!159 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!420 (array!9609 array!9607 (_ BitVec 32) (_ BitVec 32) V!6579 V!6579 (_ BitVec 32) Int) ListLongMap!2927)

(assert (=> b!206757 (= lt!105795 (getCurrentListMapNoExtraKeys!420 _keys!825 lt!105796 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206757 (= lt!105796 (array!9608 (store (arr!4554 _values!649) i!601 (ValueCellFull!2256 v!520)) (size!4879 _values!649)))))

(assert (=> b!206757 (= lt!105798 (getCurrentListMapNoExtraKeys!420 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206758 () Bool)

(declare-fun res!100230 () Bool)

(assert (=> b!206758 (=> (not res!100230) (not e!135089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9609 (_ BitVec 32)) Bool)

(assert (=> b!206758 (= res!100230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206759 () Bool)

(declare-fun res!100231 () Bool)

(assert (=> b!206759 (=> (not res!100231) (not e!135089))))

(assert (=> b!206759 (= res!100231 (and (= (size!4879 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4880 _keys!825) (size!4879 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206760 () Bool)

(declare-fun res!100228 () Bool)

(assert (=> b!206760 (=> (not res!100228) (not e!135089))))

(assert (=> b!206760 (= res!100228 (= (select (arr!4555 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8867 () Bool)

(declare-fun mapRes!8867 () Bool)

(assert (=> mapIsEmpty!8867 mapRes!8867))

(declare-fun b!206761 () Bool)

(declare-fun e!135086 () Bool)

(declare-fun e!135085 () Bool)

(assert (=> b!206761 (= e!135086 (and e!135085 mapRes!8867))))

(declare-fun condMapEmpty!8867 () Bool)

(declare-fun mapDefault!8867 () ValueCell!2256)

(assert (=> b!206761 (= condMapEmpty!8867 (= (arr!4554 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2256)) mapDefault!8867)))))

(declare-fun res!100229 () Bool)

(assert (=> start!20684 (=> (not res!100229) (not e!135089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20684 (= res!100229 (validMask!0 mask!1149))))

(assert (=> start!20684 e!135089))

(declare-fun array_inv!3011 (array!9607) Bool)

(assert (=> start!20684 (and (array_inv!3011 _values!649) e!135086)))

(assert (=> start!20684 true))

(declare-fun tp_is_empty!5199 () Bool)

(assert (=> start!20684 tp_is_empty!5199))

(declare-fun array_inv!3012 (array!9609) Bool)

(assert (=> start!20684 (array_inv!3012 _keys!825)))

(assert (=> start!20684 tp!19061))

(declare-fun mapNonEmpty!8867 () Bool)

(declare-fun tp!19060 () Bool)

(declare-fun e!135088 () Bool)

(assert (=> mapNonEmpty!8867 (= mapRes!8867 (and tp!19060 e!135088))))

(declare-fun mapValue!8867 () ValueCell!2256)

(declare-fun mapRest!8867 () (Array (_ BitVec 32) ValueCell!2256))

(declare-fun mapKey!8867 () (_ BitVec 32))

(assert (=> mapNonEmpty!8867 (= (arr!4554 _values!649) (store mapRest!8867 mapKey!8867 mapValue!8867))))

(declare-fun b!206762 () Bool)

(assert (=> b!206762 (= e!135088 tp_is_empty!5199)))

(declare-fun b!206763 () Bool)

(declare-fun res!100232 () Bool)

(assert (=> b!206763 (=> (not res!100232) (not e!135089))))

(declare-datatypes ((List!2906 0))(
  ( (Nil!2903) (Cons!2902 (h!3544 (_ BitVec 64)) (t!7837 List!2906)) )
))
(declare-fun arrayNoDuplicates!0 (array!9609 (_ BitVec 32) List!2906) Bool)

(assert (=> b!206763 (= res!100232 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2903))))

(declare-fun b!206764 () Bool)

(declare-fun res!100234 () Bool)

(assert (=> b!206764 (=> (not res!100234) (not e!135089))))

(assert (=> b!206764 (= res!100234 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4880 _keys!825))))))

(declare-fun b!206765 () Bool)

(assert (=> b!206765 (= e!135085 tp_is_empty!5199)))

(assert (= (and start!20684 res!100229) b!206759))

(assert (= (and b!206759 res!100231) b!206758))

(assert (= (and b!206758 res!100230) b!206763))

(assert (= (and b!206763 res!100232) b!206764))

(assert (= (and b!206764 res!100234) b!206756))

(assert (= (and b!206756 res!100233) b!206760))

(assert (= (and b!206760 res!100228) b!206757))

(assert (= (and b!206761 condMapEmpty!8867) mapIsEmpty!8867))

(assert (= (and b!206761 (not condMapEmpty!8867)) mapNonEmpty!8867))

(get-info :version)

(assert (= (and mapNonEmpty!8867 ((_ is ValueCellFull!2256) mapValue!8867)) b!206762))

(assert (= (and b!206761 ((_ is ValueCellFull!2256) mapDefault!8867)) b!206765))

(assert (= start!20684 b!206761))

(declare-fun m!234499 () Bool)

(assert (=> b!206760 m!234499))

(declare-fun m!234501 () Bool)

(assert (=> mapNonEmpty!8867 m!234501))

(declare-fun m!234503 () Bool)

(assert (=> b!206756 m!234503))

(declare-fun m!234505 () Bool)

(assert (=> b!206758 m!234505))

(declare-fun m!234507 () Bool)

(assert (=> b!206763 m!234507))

(declare-fun m!234509 () Bool)

(assert (=> start!20684 m!234509))

(declare-fun m!234511 () Bool)

(assert (=> start!20684 m!234511))

(declare-fun m!234513 () Bool)

(assert (=> start!20684 m!234513))

(declare-fun m!234515 () Bool)

(assert (=> b!206757 m!234515))

(declare-fun m!234517 () Bool)

(assert (=> b!206757 m!234517))

(declare-fun m!234519 () Bool)

(assert (=> b!206757 m!234519))

(declare-fun m!234521 () Bool)

(assert (=> b!206757 m!234521))

(declare-fun m!234523 () Bool)

(assert (=> b!206757 m!234523))

(declare-fun m!234525 () Bool)

(assert (=> b!206757 m!234525))

(declare-fun m!234527 () Bool)

(assert (=> b!206757 m!234527))

(check-sat (not mapNonEmpty!8867) (not b!206763) tp_is_empty!5199 (not start!20684) (not b!206758) (not b_next!5343) b_and!12089 (not b!206756) (not b!206757))
(check-sat b_and!12089 (not b_next!5343))
