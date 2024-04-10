; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20954 () Bool)

(assert start!20954)

(declare-fun b_free!5547 () Bool)

(declare-fun b_next!5547 () Bool)

(assert (=> start!20954 (= b_free!5547 (not b_next!5547))))

(declare-fun tp!19691 () Bool)

(declare-fun b_and!12329 () Bool)

(assert (=> start!20954 (= tp!19691 b_and!12329)))

(declare-fun b!210514 () Bool)

(declare-fun e!137081 () Bool)

(declare-fun tp_is_empty!5409 () Bool)

(assert (=> b!210514 (= e!137081 tp_is_empty!5409)))

(declare-fun b!210515 () Bool)

(declare-fun res!102719 () Bool)

(declare-fun e!137079 () Bool)

(assert (=> b!210515 (=> (not res!102719) (not e!137079))))

(declare-datatypes ((array!10019 0))(
  ( (array!10020 (arr!4757 (Array (_ BitVec 32) (_ BitVec 64))) (size!5082 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10019)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6859 0))(
  ( (V!6860 (val!2749 Int)) )
))
(declare-datatypes ((ValueCell!2361 0))(
  ( (ValueCellFull!2361 (v!4731 V!6859)) (EmptyCell!2361) )
))
(declare-datatypes ((array!10021 0))(
  ( (array!10022 (arr!4758 (Array (_ BitVec 32) ValueCell!2361)) (size!5083 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10021)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!210515 (= res!102719 (and (= (size!5083 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5082 _keys!825) (size!5083 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210516 () Bool)

(declare-fun e!137082 () Bool)

(assert (=> b!210516 (= e!137082 tp_is_empty!5409)))

(declare-fun b!210517 () Bool)

(declare-fun res!102721 () Bool)

(assert (=> b!210517 (=> (not res!102721) (not e!137079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10019 (_ BitVec 32)) Bool)

(assert (=> b!210517 (= res!102721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210518 () Bool)

(declare-fun e!137083 () Bool)

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!210518 (= e!137083 (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4156 0))(
  ( (tuple2!4157 (_1!2089 (_ BitVec 64)) (_2!2089 V!6859)) )
))
(declare-datatypes ((List!3049 0))(
  ( (Nil!3046) (Cons!3045 (h!3687 tuple2!4156) (t!7986 List!3049)) )
))
(declare-datatypes ((ListLongMap!3069 0))(
  ( (ListLongMap!3070 (toList!1550 List!3049)) )
))
(declare-fun lt!107876 () ListLongMap!3069)

(declare-fun lt!107867 () ListLongMap!3069)

(declare-fun lt!107871 () tuple2!4156)

(declare-fun +!553 (ListLongMap!3069 tuple2!4156) ListLongMap!3069)

(assert (=> b!210518 (= lt!107876 (+!553 lt!107867 lt!107871))))

(declare-datatypes ((Unit!6394 0))(
  ( (Unit!6395) )
))
(declare-fun lt!107865 () Unit!6394)

(declare-fun zeroValue!615 () V!6859)

(declare-fun v!520 () V!6859)

(declare-fun lt!107866 () ListLongMap!3069)

(declare-fun addCommutativeForDiffKeys!198 (ListLongMap!3069 (_ BitVec 64) V!6859 (_ BitVec 64) V!6859) Unit!6394)

(assert (=> b!210518 (= lt!107865 (addCommutativeForDiffKeys!198 lt!107866 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!107869 () ListLongMap!3069)

(declare-fun lt!107877 () tuple2!4156)

(assert (=> b!210518 (= lt!107869 (+!553 lt!107876 lt!107877))))

(declare-fun lt!107873 () ListLongMap!3069)

(declare-fun lt!107868 () tuple2!4156)

(assert (=> b!210518 (= lt!107876 (+!553 lt!107873 lt!107868))))

(declare-fun lt!107870 () ListLongMap!3069)

(assert (=> b!210518 (= lt!107870 (+!553 lt!107867 lt!107877))))

(assert (=> b!210518 (= lt!107867 (+!553 lt!107866 lt!107868))))

(declare-fun lt!107874 () ListLongMap!3069)

(assert (=> b!210518 (= lt!107869 (+!553 (+!553 lt!107874 lt!107868) lt!107877))))

(declare-fun minValue!615 () V!6859)

(assert (=> b!210518 (= lt!107877 (tuple2!4157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210518 (= lt!107868 (tuple2!4157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210519 () Bool)

(declare-fun res!102723 () Bool)

(assert (=> b!210519 (=> (not res!102723) (not e!137079))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210519 (= res!102723 (= (select (arr!4757 _keys!825) i!601) k0!843))))

(declare-fun b!210520 () Bool)

(assert (=> b!210520 (= e!137079 (not e!137083))))

(declare-fun res!102724 () Bool)

(assert (=> b!210520 (=> res!102724 e!137083)))

(assert (=> b!210520 (= res!102724 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1086 (array!10019 array!10021 (_ BitVec 32) (_ BitVec 32) V!6859 V!6859 (_ BitVec 32) Int) ListLongMap!3069)

(assert (=> b!210520 (= lt!107870 (getCurrentListMap!1086 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107875 () array!10021)

(assert (=> b!210520 (= lt!107869 (getCurrentListMap!1086 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210520 (and (= lt!107874 lt!107873) (= lt!107873 lt!107874))))

(assert (=> b!210520 (= lt!107873 (+!553 lt!107866 lt!107871))))

(assert (=> b!210520 (= lt!107871 (tuple2!4157 k0!843 v!520))))

(declare-fun lt!107872 () Unit!6394)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!203 (array!10019 array!10021 (_ BitVec 32) (_ BitVec 32) V!6859 V!6859 (_ BitVec 32) (_ BitVec 64) V!6859 (_ BitVec 32) Int) Unit!6394)

(assert (=> b!210520 (= lt!107872 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!203 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!488 (array!10019 array!10021 (_ BitVec 32) (_ BitVec 32) V!6859 V!6859 (_ BitVec 32) Int) ListLongMap!3069)

(assert (=> b!210520 (= lt!107874 (getCurrentListMapNoExtraKeys!488 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210520 (= lt!107875 (array!10022 (store (arr!4758 _values!649) i!601 (ValueCellFull!2361 v!520)) (size!5083 _values!649)))))

(assert (=> b!210520 (= lt!107866 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9191 () Bool)

(declare-fun mapRes!9191 () Bool)

(assert (=> mapIsEmpty!9191 mapRes!9191))

(declare-fun b!210521 () Bool)

(declare-fun res!102722 () Bool)

(assert (=> b!210521 (=> (not res!102722) (not e!137079))))

(assert (=> b!210521 (= res!102722 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5082 _keys!825))))))

(declare-fun b!210522 () Bool)

(declare-fun res!102717 () Bool)

(assert (=> b!210522 (=> (not res!102717) (not e!137079))))

(declare-datatypes ((List!3050 0))(
  ( (Nil!3047) (Cons!3046 (h!3688 (_ BitVec 64)) (t!7987 List!3050)) )
))
(declare-fun arrayNoDuplicates!0 (array!10019 (_ BitVec 32) List!3050) Bool)

(assert (=> b!210522 (= res!102717 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3047))))

(declare-fun res!102718 () Bool)

(assert (=> start!20954 (=> (not res!102718) (not e!137079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20954 (= res!102718 (validMask!0 mask!1149))))

(assert (=> start!20954 e!137079))

(declare-fun e!137084 () Bool)

(declare-fun array_inv!3149 (array!10021) Bool)

(assert (=> start!20954 (and (array_inv!3149 _values!649) e!137084)))

(assert (=> start!20954 true))

(assert (=> start!20954 tp_is_empty!5409))

(declare-fun array_inv!3150 (array!10019) Bool)

(assert (=> start!20954 (array_inv!3150 _keys!825)))

(assert (=> start!20954 tp!19691))

(declare-fun b!210523 () Bool)

(assert (=> b!210523 (= e!137084 (and e!137081 mapRes!9191))))

(declare-fun condMapEmpty!9191 () Bool)

(declare-fun mapDefault!9191 () ValueCell!2361)

(assert (=> b!210523 (= condMapEmpty!9191 (= (arr!4758 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2361)) mapDefault!9191)))))

(declare-fun mapNonEmpty!9191 () Bool)

(declare-fun tp!19690 () Bool)

(assert (=> mapNonEmpty!9191 (= mapRes!9191 (and tp!19690 e!137082))))

(declare-fun mapRest!9191 () (Array (_ BitVec 32) ValueCell!2361))

(declare-fun mapKey!9191 () (_ BitVec 32))

(declare-fun mapValue!9191 () ValueCell!2361)

(assert (=> mapNonEmpty!9191 (= (arr!4758 _values!649) (store mapRest!9191 mapKey!9191 mapValue!9191))))

(declare-fun b!210524 () Bool)

(declare-fun res!102720 () Bool)

(assert (=> b!210524 (=> (not res!102720) (not e!137079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210524 (= res!102720 (validKeyInArray!0 k0!843))))

(assert (= (and start!20954 res!102718) b!210515))

(assert (= (and b!210515 res!102719) b!210517))

(assert (= (and b!210517 res!102721) b!210522))

(assert (= (and b!210522 res!102717) b!210521))

(assert (= (and b!210521 res!102722) b!210524))

(assert (= (and b!210524 res!102720) b!210519))

(assert (= (and b!210519 res!102723) b!210520))

(assert (= (and b!210520 (not res!102724)) b!210518))

(assert (= (and b!210523 condMapEmpty!9191) mapIsEmpty!9191))

(assert (= (and b!210523 (not condMapEmpty!9191)) mapNonEmpty!9191))

(get-info :version)

(assert (= (and mapNonEmpty!9191 ((_ is ValueCellFull!2361) mapValue!9191)) b!210516))

(assert (= (and b!210523 ((_ is ValueCellFull!2361) mapDefault!9191)) b!210514))

(assert (= start!20954 b!210523))

(declare-fun m!238049 () Bool)

(assert (=> start!20954 m!238049))

(declare-fun m!238051 () Bool)

(assert (=> start!20954 m!238051))

(declare-fun m!238053 () Bool)

(assert (=> start!20954 m!238053))

(declare-fun m!238055 () Bool)

(assert (=> b!210520 m!238055))

(declare-fun m!238057 () Bool)

(assert (=> b!210520 m!238057))

(declare-fun m!238059 () Bool)

(assert (=> b!210520 m!238059))

(declare-fun m!238061 () Bool)

(assert (=> b!210520 m!238061))

(declare-fun m!238063 () Bool)

(assert (=> b!210520 m!238063))

(declare-fun m!238065 () Bool)

(assert (=> b!210520 m!238065))

(declare-fun m!238067 () Bool)

(assert (=> b!210520 m!238067))

(declare-fun m!238069 () Bool)

(assert (=> b!210524 m!238069))

(declare-fun m!238071 () Bool)

(assert (=> b!210518 m!238071))

(declare-fun m!238073 () Bool)

(assert (=> b!210518 m!238073))

(declare-fun m!238075 () Bool)

(assert (=> b!210518 m!238075))

(declare-fun m!238077 () Bool)

(assert (=> b!210518 m!238077))

(declare-fun m!238079 () Bool)

(assert (=> b!210518 m!238079))

(declare-fun m!238081 () Bool)

(assert (=> b!210518 m!238081))

(assert (=> b!210518 m!238077))

(declare-fun m!238083 () Bool)

(assert (=> b!210518 m!238083))

(declare-fun m!238085 () Bool)

(assert (=> b!210518 m!238085))

(declare-fun m!238087 () Bool)

(assert (=> b!210522 m!238087))

(declare-fun m!238089 () Bool)

(assert (=> mapNonEmpty!9191 m!238089))

(declare-fun m!238091 () Bool)

(assert (=> b!210517 m!238091))

(declare-fun m!238093 () Bool)

(assert (=> b!210519 m!238093))

(check-sat (not b_next!5547) (not b!210522) (not mapNonEmpty!9191) (not start!20954) tp_is_empty!5409 (not b!210517) (not b!210524) b_and!12329 (not b!210520) (not b!210518))
(check-sat b_and!12329 (not b_next!5547))
(get-model)

(declare-fun bm!19908 () Bool)

(declare-fun call!19911 () Bool)

(assert (=> bm!19908 (= call!19911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!210566 () Bool)

(declare-fun e!137109 () Bool)

(declare-fun e!137110 () Bool)

(assert (=> b!210566 (= e!137109 e!137110)))

(declare-fun lt!107925 () (_ BitVec 64))

(assert (=> b!210566 (= lt!107925 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107923 () Unit!6394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10019 (_ BitVec 64) (_ BitVec 32)) Unit!6394)

(assert (=> b!210566 (= lt!107923 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107925 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!210566 (arrayContainsKey!0 _keys!825 lt!107925 #b00000000000000000000000000000000)))

(declare-fun lt!107924 () Unit!6394)

(assert (=> b!210566 (= lt!107924 lt!107923)))

(declare-fun res!102753 () Bool)

(declare-datatypes ((SeekEntryResult!707 0))(
  ( (MissingZero!707 (index!4998 (_ BitVec 32))) (Found!707 (index!4999 (_ BitVec 32))) (Intermediate!707 (undefined!1519 Bool) (index!5000 (_ BitVec 32)) (x!22042 (_ BitVec 32))) (Undefined!707) (MissingVacant!707 (index!5001 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10019 (_ BitVec 32)) SeekEntryResult!707)

(assert (=> b!210566 (= res!102753 (= (seekEntryOrOpen!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!707 #b00000000000000000000000000000000)))))

(assert (=> b!210566 (=> (not res!102753) (not e!137110))))

(declare-fun b!210567 () Bool)

(assert (=> b!210567 (= e!137109 call!19911)))

(declare-fun d!57965 () Bool)

(declare-fun res!102754 () Bool)

(declare-fun e!137111 () Bool)

(assert (=> d!57965 (=> res!102754 e!137111)))

(assert (=> d!57965 (= res!102754 (bvsge #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(assert (=> d!57965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137111)))

(declare-fun b!210568 () Bool)

(assert (=> b!210568 (= e!137110 call!19911)))

(declare-fun b!210569 () Bool)

(assert (=> b!210569 (= e!137111 e!137109)))

(declare-fun c!35585 () Bool)

(assert (=> b!210569 (= c!35585 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57965 (not res!102754)) b!210569))

(assert (= (and b!210569 c!35585) b!210566))

(assert (= (and b!210569 (not c!35585)) b!210567))

(assert (= (and b!210566 res!102753) b!210568))

(assert (= (or b!210568 b!210567) bm!19908))

(declare-fun m!238141 () Bool)

(assert (=> bm!19908 m!238141))

(declare-fun m!238143 () Bool)

(assert (=> b!210566 m!238143))

(declare-fun m!238145 () Bool)

(assert (=> b!210566 m!238145))

(declare-fun m!238147 () Bool)

(assert (=> b!210566 m!238147))

(assert (=> b!210566 m!238143))

(declare-fun m!238149 () Bool)

(assert (=> b!210566 m!238149))

(assert (=> b!210569 m!238143))

(assert (=> b!210569 m!238143))

(declare-fun m!238151 () Bool)

(assert (=> b!210569 m!238151))

(assert (=> b!210517 d!57965))

(declare-fun d!57967 () Bool)

(declare-fun res!102762 () Bool)

(declare-fun e!137122 () Bool)

(assert (=> d!57967 (=> res!102762 e!137122)))

(assert (=> d!57967 (= res!102762 (bvsge #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(assert (=> d!57967 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3047) e!137122)))

(declare-fun b!210580 () Bool)

(declare-fun e!137120 () Bool)

(declare-fun e!137121 () Bool)

(assert (=> b!210580 (= e!137120 e!137121)))

(declare-fun c!35588 () Bool)

(assert (=> b!210580 (= c!35588 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210581 () Bool)

(declare-fun call!19914 () Bool)

(assert (=> b!210581 (= e!137121 call!19914)))

(declare-fun b!210582 () Bool)

(assert (=> b!210582 (= e!137121 call!19914)))

(declare-fun b!210583 () Bool)

(declare-fun e!137123 () Bool)

(declare-fun contains!1398 (List!3050 (_ BitVec 64)) Bool)

(assert (=> b!210583 (= e!137123 (contains!1398 Nil!3047 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19911 () Bool)

(assert (=> bm!19911 (= call!19914 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35588 (Cons!3046 (select (arr!4757 _keys!825) #b00000000000000000000000000000000) Nil!3047) Nil!3047)))))

(declare-fun b!210584 () Bool)

(assert (=> b!210584 (= e!137122 e!137120)))

(declare-fun res!102763 () Bool)

(assert (=> b!210584 (=> (not res!102763) (not e!137120))))

(assert (=> b!210584 (= res!102763 (not e!137123))))

(declare-fun res!102761 () Bool)

(assert (=> b!210584 (=> (not res!102761) (not e!137123))))

(assert (=> b!210584 (= res!102761 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57967 (not res!102762)) b!210584))

(assert (= (and b!210584 res!102761) b!210583))

(assert (= (and b!210584 res!102763) b!210580))

(assert (= (and b!210580 c!35588) b!210581))

(assert (= (and b!210580 (not c!35588)) b!210582))

(assert (= (or b!210581 b!210582) bm!19911))

(assert (=> b!210580 m!238143))

(assert (=> b!210580 m!238143))

(assert (=> b!210580 m!238151))

(assert (=> b!210583 m!238143))

(assert (=> b!210583 m!238143))

(declare-fun m!238153 () Bool)

(assert (=> b!210583 m!238153))

(assert (=> bm!19911 m!238143))

(declare-fun m!238155 () Bool)

(assert (=> bm!19911 m!238155))

(assert (=> b!210584 m!238143))

(assert (=> b!210584 m!238143))

(assert (=> b!210584 m!238151))

(assert (=> b!210522 d!57967))

(declare-fun d!57969 () Bool)

(declare-fun e!137126 () Bool)

(assert (=> d!57969 e!137126))

(declare-fun res!102769 () Bool)

(assert (=> d!57969 (=> (not res!102769) (not e!137126))))

(declare-fun lt!107934 () ListLongMap!3069)

(declare-fun contains!1399 (ListLongMap!3069 (_ BitVec 64)) Bool)

(assert (=> d!57969 (= res!102769 (contains!1399 lt!107934 (_1!2089 lt!107877)))))

(declare-fun lt!107935 () List!3049)

(assert (=> d!57969 (= lt!107934 (ListLongMap!3070 lt!107935))))

(declare-fun lt!107937 () Unit!6394)

(declare-fun lt!107936 () Unit!6394)

(assert (=> d!57969 (= lt!107937 lt!107936)))

(declare-datatypes ((Option!256 0))(
  ( (Some!255 (v!4736 V!6859)) (None!254) )
))
(declare-fun getValueByKey!250 (List!3049 (_ BitVec 64)) Option!256)

(assert (=> d!57969 (= (getValueByKey!250 lt!107935 (_1!2089 lt!107877)) (Some!255 (_2!2089 lt!107877)))))

(declare-fun lemmaContainsTupThenGetReturnValue!137 (List!3049 (_ BitVec 64) V!6859) Unit!6394)

(assert (=> d!57969 (= lt!107936 (lemmaContainsTupThenGetReturnValue!137 lt!107935 (_1!2089 lt!107877) (_2!2089 lt!107877)))))

(declare-fun insertStrictlySorted!140 (List!3049 (_ BitVec 64) V!6859) List!3049)

(assert (=> d!57969 (= lt!107935 (insertStrictlySorted!140 (toList!1550 lt!107876) (_1!2089 lt!107877) (_2!2089 lt!107877)))))

(assert (=> d!57969 (= (+!553 lt!107876 lt!107877) lt!107934)))

(declare-fun b!210589 () Bool)

(declare-fun res!102768 () Bool)

(assert (=> b!210589 (=> (not res!102768) (not e!137126))))

(assert (=> b!210589 (= res!102768 (= (getValueByKey!250 (toList!1550 lt!107934) (_1!2089 lt!107877)) (Some!255 (_2!2089 lt!107877))))))

(declare-fun b!210590 () Bool)

(declare-fun contains!1400 (List!3049 tuple2!4156) Bool)

(assert (=> b!210590 (= e!137126 (contains!1400 (toList!1550 lt!107934) lt!107877))))

(assert (= (and d!57969 res!102769) b!210589))

(assert (= (and b!210589 res!102768) b!210590))

(declare-fun m!238157 () Bool)

(assert (=> d!57969 m!238157))

(declare-fun m!238159 () Bool)

(assert (=> d!57969 m!238159))

(declare-fun m!238161 () Bool)

(assert (=> d!57969 m!238161))

(declare-fun m!238163 () Bool)

(assert (=> d!57969 m!238163))

(declare-fun m!238165 () Bool)

(assert (=> b!210589 m!238165))

(declare-fun m!238167 () Bool)

(assert (=> b!210590 m!238167))

(assert (=> b!210518 d!57969))

(declare-fun d!57971 () Bool)

(declare-fun e!137127 () Bool)

(assert (=> d!57971 e!137127))

(declare-fun res!102771 () Bool)

(assert (=> d!57971 (=> (not res!102771) (not e!137127))))

(declare-fun lt!107938 () ListLongMap!3069)

(assert (=> d!57971 (= res!102771 (contains!1399 lt!107938 (_1!2089 lt!107868)))))

(declare-fun lt!107939 () List!3049)

(assert (=> d!57971 (= lt!107938 (ListLongMap!3070 lt!107939))))

(declare-fun lt!107941 () Unit!6394)

(declare-fun lt!107940 () Unit!6394)

(assert (=> d!57971 (= lt!107941 lt!107940)))

(assert (=> d!57971 (= (getValueByKey!250 lt!107939 (_1!2089 lt!107868)) (Some!255 (_2!2089 lt!107868)))))

(assert (=> d!57971 (= lt!107940 (lemmaContainsTupThenGetReturnValue!137 lt!107939 (_1!2089 lt!107868) (_2!2089 lt!107868)))))

(assert (=> d!57971 (= lt!107939 (insertStrictlySorted!140 (toList!1550 lt!107866) (_1!2089 lt!107868) (_2!2089 lt!107868)))))

(assert (=> d!57971 (= (+!553 lt!107866 lt!107868) lt!107938)))

(declare-fun b!210591 () Bool)

(declare-fun res!102770 () Bool)

(assert (=> b!210591 (=> (not res!102770) (not e!137127))))

(assert (=> b!210591 (= res!102770 (= (getValueByKey!250 (toList!1550 lt!107938) (_1!2089 lt!107868)) (Some!255 (_2!2089 lt!107868))))))

(declare-fun b!210592 () Bool)

(assert (=> b!210592 (= e!137127 (contains!1400 (toList!1550 lt!107938) lt!107868))))

(assert (= (and d!57971 res!102771) b!210591))

(assert (= (and b!210591 res!102770) b!210592))

(declare-fun m!238169 () Bool)

(assert (=> d!57971 m!238169))

(declare-fun m!238171 () Bool)

(assert (=> d!57971 m!238171))

(declare-fun m!238173 () Bool)

(assert (=> d!57971 m!238173))

(declare-fun m!238175 () Bool)

(assert (=> d!57971 m!238175))

(declare-fun m!238177 () Bool)

(assert (=> b!210591 m!238177))

(declare-fun m!238179 () Bool)

(assert (=> b!210592 m!238179))

(assert (=> b!210518 d!57971))

(declare-fun d!57973 () Bool)

(assert (=> d!57973 (= (+!553 (+!553 lt!107866 (tuple2!4157 k0!843 v!520)) (tuple2!4157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (+!553 (+!553 lt!107866 (tuple2!4157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4157 k0!843 v!520)))))

(declare-fun lt!107944 () Unit!6394)

(declare-fun choose!1075 (ListLongMap!3069 (_ BitVec 64) V!6859 (_ BitVec 64) V!6859) Unit!6394)

(assert (=> d!57973 (= lt!107944 (choose!1075 lt!107866 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> d!57973 (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57973 (= (addCommutativeForDiffKeys!198 lt!107866 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) lt!107944)))

(declare-fun bs!8266 () Bool)

(assert (= bs!8266 d!57973))

(declare-fun m!238181 () Bool)

(assert (=> bs!8266 m!238181))

(declare-fun m!238183 () Bool)

(assert (=> bs!8266 m!238183))

(assert (=> bs!8266 m!238181))

(declare-fun m!238185 () Bool)

(assert (=> bs!8266 m!238185))

(assert (=> bs!8266 m!238183))

(declare-fun m!238187 () Bool)

(assert (=> bs!8266 m!238187))

(declare-fun m!238189 () Bool)

(assert (=> bs!8266 m!238189))

(assert (=> b!210518 d!57973))

(declare-fun d!57975 () Bool)

(declare-fun e!137128 () Bool)

(assert (=> d!57975 e!137128))

(declare-fun res!102773 () Bool)

(assert (=> d!57975 (=> (not res!102773) (not e!137128))))

(declare-fun lt!107945 () ListLongMap!3069)

(assert (=> d!57975 (= res!102773 (contains!1399 lt!107945 (_1!2089 lt!107877)))))

(declare-fun lt!107946 () List!3049)

(assert (=> d!57975 (= lt!107945 (ListLongMap!3070 lt!107946))))

(declare-fun lt!107948 () Unit!6394)

(declare-fun lt!107947 () Unit!6394)

(assert (=> d!57975 (= lt!107948 lt!107947)))

(assert (=> d!57975 (= (getValueByKey!250 lt!107946 (_1!2089 lt!107877)) (Some!255 (_2!2089 lt!107877)))))

(assert (=> d!57975 (= lt!107947 (lemmaContainsTupThenGetReturnValue!137 lt!107946 (_1!2089 lt!107877) (_2!2089 lt!107877)))))

(assert (=> d!57975 (= lt!107946 (insertStrictlySorted!140 (toList!1550 (+!553 lt!107874 lt!107868)) (_1!2089 lt!107877) (_2!2089 lt!107877)))))

(assert (=> d!57975 (= (+!553 (+!553 lt!107874 lt!107868) lt!107877) lt!107945)))

(declare-fun b!210593 () Bool)

(declare-fun res!102772 () Bool)

(assert (=> b!210593 (=> (not res!102772) (not e!137128))))

(assert (=> b!210593 (= res!102772 (= (getValueByKey!250 (toList!1550 lt!107945) (_1!2089 lt!107877)) (Some!255 (_2!2089 lt!107877))))))

(declare-fun b!210594 () Bool)

(assert (=> b!210594 (= e!137128 (contains!1400 (toList!1550 lt!107945) lt!107877))))

(assert (= (and d!57975 res!102773) b!210593))

(assert (= (and b!210593 res!102772) b!210594))

(declare-fun m!238191 () Bool)

(assert (=> d!57975 m!238191))

(declare-fun m!238193 () Bool)

(assert (=> d!57975 m!238193))

(declare-fun m!238195 () Bool)

(assert (=> d!57975 m!238195))

(declare-fun m!238197 () Bool)

(assert (=> d!57975 m!238197))

(declare-fun m!238199 () Bool)

(assert (=> b!210593 m!238199))

(declare-fun m!238201 () Bool)

(assert (=> b!210594 m!238201))

(assert (=> b!210518 d!57975))

(declare-fun d!57977 () Bool)

(declare-fun e!137129 () Bool)

(assert (=> d!57977 e!137129))

(declare-fun res!102775 () Bool)

(assert (=> d!57977 (=> (not res!102775) (not e!137129))))

(declare-fun lt!107949 () ListLongMap!3069)

(assert (=> d!57977 (= res!102775 (contains!1399 lt!107949 (_1!2089 lt!107871)))))

(declare-fun lt!107950 () List!3049)

(assert (=> d!57977 (= lt!107949 (ListLongMap!3070 lt!107950))))

(declare-fun lt!107952 () Unit!6394)

(declare-fun lt!107951 () Unit!6394)

(assert (=> d!57977 (= lt!107952 lt!107951)))

(assert (=> d!57977 (= (getValueByKey!250 lt!107950 (_1!2089 lt!107871)) (Some!255 (_2!2089 lt!107871)))))

(assert (=> d!57977 (= lt!107951 (lemmaContainsTupThenGetReturnValue!137 lt!107950 (_1!2089 lt!107871) (_2!2089 lt!107871)))))

(assert (=> d!57977 (= lt!107950 (insertStrictlySorted!140 (toList!1550 lt!107867) (_1!2089 lt!107871) (_2!2089 lt!107871)))))

(assert (=> d!57977 (= (+!553 lt!107867 lt!107871) lt!107949)))

(declare-fun b!210595 () Bool)

(declare-fun res!102774 () Bool)

(assert (=> b!210595 (=> (not res!102774) (not e!137129))))

(assert (=> b!210595 (= res!102774 (= (getValueByKey!250 (toList!1550 lt!107949) (_1!2089 lt!107871)) (Some!255 (_2!2089 lt!107871))))))

(declare-fun b!210596 () Bool)

(assert (=> b!210596 (= e!137129 (contains!1400 (toList!1550 lt!107949) lt!107871))))

(assert (= (and d!57977 res!102775) b!210595))

(assert (= (and b!210595 res!102774) b!210596))

(declare-fun m!238203 () Bool)

(assert (=> d!57977 m!238203))

(declare-fun m!238205 () Bool)

(assert (=> d!57977 m!238205))

(declare-fun m!238207 () Bool)

(assert (=> d!57977 m!238207))

(declare-fun m!238209 () Bool)

(assert (=> d!57977 m!238209))

(declare-fun m!238211 () Bool)

(assert (=> b!210595 m!238211))

(declare-fun m!238213 () Bool)

(assert (=> b!210596 m!238213))

(assert (=> b!210518 d!57977))

(declare-fun d!57979 () Bool)

(declare-fun e!137130 () Bool)

(assert (=> d!57979 e!137130))

(declare-fun res!102777 () Bool)

(assert (=> d!57979 (=> (not res!102777) (not e!137130))))

(declare-fun lt!107953 () ListLongMap!3069)

(assert (=> d!57979 (= res!102777 (contains!1399 lt!107953 (_1!2089 lt!107868)))))

(declare-fun lt!107954 () List!3049)

(assert (=> d!57979 (= lt!107953 (ListLongMap!3070 lt!107954))))

(declare-fun lt!107956 () Unit!6394)

(declare-fun lt!107955 () Unit!6394)

(assert (=> d!57979 (= lt!107956 lt!107955)))

(assert (=> d!57979 (= (getValueByKey!250 lt!107954 (_1!2089 lt!107868)) (Some!255 (_2!2089 lt!107868)))))

(assert (=> d!57979 (= lt!107955 (lemmaContainsTupThenGetReturnValue!137 lt!107954 (_1!2089 lt!107868) (_2!2089 lt!107868)))))

(assert (=> d!57979 (= lt!107954 (insertStrictlySorted!140 (toList!1550 lt!107874) (_1!2089 lt!107868) (_2!2089 lt!107868)))))

(assert (=> d!57979 (= (+!553 lt!107874 lt!107868) lt!107953)))

(declare-fun b!210597 () Bool)

(declare-fun res!102776 () Bool)

(assert (=> b!210597 (=> (not res!102776) (not e!137130))))

(assert (=> b!210597 (= res!102776 (= (getValueByKey!250 (toList!1550 lt!107953) (_1!2089 lt!107868)) (Some!255 (_2!2089 lt!107868))))))

(declare-fun b!210598 () Bool)

(assert (=> b!210598 (= e!137130 (contains!1400 (toList!1550 lt!107953) lt!107868))))

(assert (= (and d!57979 res!102777) b!210597))

(assert (= (and b!210597 res!102776) b!210598))

(declare-fun m!238215 () Bool)

(assert (=> d!57979 m!238215))

(declare-fun m!238217 () Bool)

(assert (=> d!57979 m!238217))

(declare-fun m!238219 () Bool)

(assert (=> d!57979 m!238219))

(declare-fun m!238221 () Bool)

(assert (=> d!57979 m!238221))

(declare-fun m!238223 () Bool)

(assert (=> b!210597 m!238223))

(declare-fun m!238225 () Bool)

(assert (=> b!210598 m!238225))

(assert (=> b!210518 d!57979))

(declare-fun d!57981 () Bool)

(declare-fun e!137131 () Bool)

(assert (=> d!57981 e!137131))

(declare-fun res!102779 () Bool)

(assert (=> d!57981 (=> (not res!102779) (not e!137131))))

(declare-fun lt!107957 () ListLongMap!3069)

(assert (=> d!57981 (= res!102779 (contains!1399 lt!107957 (_1!2089 lt!107877)))))

(declare-fun lt!107958 () List!3049)

(assert (=> d!57981 (= lt!107957 (ListLongMap!3070 lt!107958))))

(declare-fun lt!107960 () Unit!6394)

(declare-fun lt!107959 () Unit!6394)

(assert (=> d!57981 (= lt!107960 lt!107959)))

(assert (=> d!57981 (= (getValueByKey!250 lt!107958 (_1!2089 lt!107877)) (Some!255 (_2!2089 lt!107877)))))

(assert (=> d!57981 (= lt!107959 (lemmaContainsTupThenGetReturnValue!137 lt!107958 (_1!2089 lt!107877) (_2!2089 lt!107877)))))

(assert (=> d!57981 (= lt!107958 (insertStrictlySorted!140 (toList!1550 lt!107867) (_1!2089 lt!107877) (_2!2089 lt!107877)))))

(assert (=> d!57981 (= (+!553 lt!107867 lt!107877) lt!107957)))

(declare-fun b!210599 () Bool)

(declare-fun res!102778 () Bool)

(assert (=> b!210599 (=> (not res!102778) (not e!137131))))

(assert (=> b!210599 (= res!102778 (= (getValueByKey!250 (toList!1550 lt!107957) (_1!2089 lt!107877)) (Some!255 (_2!2089 lt!107877))))))

(declare-fun b!210600 () Bool)

(assert (=> b!210600 (= e!137131 (contains!1400 (toList!1550 lt!107957) lt!107877))))

(assert (= (and d!57981 res!102779) b!210599))

(assert (= (and b!210599 res!102778) b!210600))

(declare-fun m!238227 () Bool)

(assert (=> d!57981 m!238227))

(declare-fun m!238229 () Bool)

(assert (=> d!57981 m!238229))

(declare-fun m!238231 () Bool)

(assert (=> d!57981 m!238231))

(declare-fun m!238233 () Bool)

(assert (=> d!57981 m!238233))

(declare-fun m!238235 () Bool)

(assert (=> b!210599 m!238235))

(declare-fun m!238237 () Bool)

(assert (=> b!210600 m!238237))

(assert (=> b!210518 d!57981))

(declare-fun d!57983 () Bool)

(declare-fun e!137132 () Bool)

(assert (=> d!57983 e!137132))

(declare-fun res!102781 () Bool)

(assert (=> d!57983 (=> (not res!102781) (not e!137132))))

(declare-fun lt!107961 () ListLongMap!3069)

(assert (=> d!57983 (= res!102781 (contains!1399 lt!107961 (_1!2089 lt!107868)))))

(declare-fun lt!107962 () List!3049)

(assert (=> d!57983 (= lt!107961 (ListLongMap!3070 lt!107962))))

(declare-fun lt!107964 () Unit!6394)

(declare-fun lt!107963 () Unit!6394)

(assert (=> d!57983 (= lt!107964 lt!107963)))

(assert (=> d!57983 (= (getValueByKey!250 lt!107962 (_1!2089 lt!107868)) (Some!255 (_2!2089 lt!107868)))))

(assert (=> d!57983 (= lt!107963 (lemmaContainsTupThenGetReturnValue!137 lt!107962 (_1!2089 lt!107868) (_2!2089 lt!107868)))))

(assert (=> d!57983 (= lt!107962 (insertStrictlySorted!140 (toList!1550 lt!107873) (_1!2089 lt!107868) (_2!2089 lt!107868)))))

(assert (=> d!57983 (= (+!553 lt!107873 lt!107868) lt!107961)))

(declare-fun b!210601 () Bool)

(declare-fun res!102780 () Bool)

(assert (=> b!210601 (=> (not res!102780) (not e!137132))))

(assert (=> b!210601 (= res!102780 (= (getValueByKey!250 (toList!1550 lt!107961) (_1!2089 lt!107868)) (Some!255 (_2!2089 lt!107868))))))

(declare-fun b!210602 () Bool)

(assert (=> b!210602 (= e!137132 (contains!1400 (toList!1550 lt!107961) lt!107868))))

(assert (= (and d!57983 res!102781) b!210601))

(assert (= (and b!210601 res!102780) b!210602))

(declare-fun m!238239 () Bool)

(assert (=> d!57983 m!238239))

(declare-fun m!238241 () Bool)

(assert (=> d!57983 m!238241))

(declare-fun m!238243 () Bool)

(assert (=> d!57983 m!238243))

(declare-fun m!238245 () Bool)

(assert (=> d!57983 m!238245))

(declare-fun m!238247 () Bool)

(assert (=> b!210601 m!238247))

(declare-fun m!238249 () Bool)

(assert (=> b!210602 m!238249))

(assert (=> b!210518 d!57983))

(declare-fun d!57985 () Bool)

(assert (=> d!57985 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20954 d!57985))

(declare-fun d!57987 () Bool)

(assert (=> d!57987 (= (array_inv!3149 _values!649) (bvsge (size!5083 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20954 d!57987))

(declare-fun d!57989 () Bool)

(assert (=> d!57989 (= (array_inv!3150 _keys!825) (bvsge (size!5082 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20954 d!57989))

(declare-fun b!210645 () Bool)

(declare-fun e!137165 () Unit!6394)

(declare-fun lt!108023 () Unit!6394)

(assert (=> b!210645 (= e!137165 lt!108023)))

(declare-fun lt!108014 () ListLongMap!3069)

(assert (=> b!210645 (= lt!108014 (getCurrentListMapNoExtraKeys!488 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108026 () (_ BitVec 64))

(assert (=> b!210645 (= lt!108026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108028 () (_ BitVec 64))

(assert (=> b!210645 (= lt!108028 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108025 () Unit!6394)

(declare-fun addStillContains!168 (ListLongMap!3069 (_ BitVec 64) V!6859 (_ BitVec 64)) Unit!6394)

(assert (=> b!210645 (= lt!108025 (addStillContains!168 lt!108014 lt!108026 zeroValue!615 lt!108028))))

(assert (=> b!210645 (contains!1399 (+!553 lt!108014 (tuple2!4157 lt!108026 zeroValue!615)) lt!108028)))

(declare-fun lt!108012 () Unit!6394)

(assert (=> b!210645 (= lt!108012 lt!108025)))

(declare-fun lt!108018 () ListLongMap!3069)

(assert (=> b!210645 (= lt!108018 (getCurrentListMapNoExtraKeys!488 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108009 () (_ BitVec 64))

(assert (=> b!210645 (= lt!108009 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108027 () (_ BitVec 64))

(assert (=> b!210645 (= lt!108027 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108030 () Unit!6394)

(declare-fun addApplyDifferent!168 (ListLongMap!3069 (_ BitVec 64) V!6859 (_ BitVec 64)) Unit!6394)

(assert (=> b!210645 (= lt!108030 (addApplyDifferent!168 lt!108018 lt!108009 minValue!615 lt!108027))))

(declare-fun apply!192 (ListLongMap!3069 (_ BitVec 64)) V!6859)

(assert (=> b!210645 (= (apply!192 (+!553 lt!108018 (tuple2!4157 lt!108009 minValue!615)) lt!108027) (apply!192 lt!108018 lt!108027))))

(declare-fun lt!108013 () Unit!6394)

(assert (=> b!210645 (= lt!108013 lt!108030)))

(declare-fun lt!108011 () ListLongMap!3069)

(assert (=> b!210645 (= lt!108011 (getCurrentListMapNoExtraKeys!488 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108029 () (_ BitVec 64))

(assert (=> b!210645 (= lt!108029 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108010 () (_ BitVec 64))

(assert (=> b!210645 (= lt!108010 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108024 () Unit!6394)

(assert (=> b!210645 (= lt!108024 (addApplyDifferent!168 lt!108011 lt!108029 zeroValue!615 lt!108010))))

(assert (=> b!210645 (= (apply!192 (+!553 lt!108011 (tuple2!4157 lt!108029 zeroValue!615)) lt!108010) (apply!192 lt!108011 lt!108010))))

(declare-fun lt!108019 () Unit!6394)

(assert (=> b!210645 (= lt!108019 lt!108024)))

(declare-fun lt!108020 () ListLongMap!3069)

(assert (=> b!210645 (= lt!108020 (getCurrentListMapNoExtraKeys!488 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108017 () (_ BitVec 64))

(assert (=> b!210645 (= lt!108017 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108021 () (_ BitVec 64))

(assert (=> b!210645 (= lt!108021 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210645 (= lt!108023 (addApplyDifferent!168 lt!108020 lt!108017 minValue!615 lt!108021))))

(assert (=> b!210645 (= (apply!192 (+!553 lt!108020 (tuple2!4157 lt!108017 minValue!615)) lt!108021) (apply!192 lt!108020 lt!108021))))

(declare-fun b!210646 () Bool)

(declare-fun e!137163 () Bool)

(declare-fun lt!108015 () ListLongMap!3069)

(assert (=> b!210646 (= e!137163 (= (apply!192 lt!108015 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210647 () Bool)

(declare-fun e!137160 () Bool)

(declare-fun e!137169 () Bool)

(assert (=> b!210647 (= e!137160 e!137169)))

(declare-fun c!35604 () Bool)

(assert (=> b!210647 (= c!35604 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210648 () Bool)

(declare-fun call!19931 () Bool)

(assert (=> b!210648 (= e!137169 (not call!19931))))

(declare-fun bm!19926 () Bool)

(declare-fun call!19932 () ListLongMap!3069)

(assert (=> bm!19926 (= call!19932 (getCurrentListMapNoExtraKeys!488 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!19927 () Bool)

(declare-fun call!19933 () Bool)

(assert (=> bm!19927 (= call!19933 (contains!1399 lt!108015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19928 () Bool)

(declare-fun call!19934 () ListLongMap!3069)

(declare-fun call!19930 () ListLongMap!3069)

(assert (=> bm!19928 (= call!19934 call!19930)))

(declare-fun b!210650 () Bool)

(declare-fun e!137168 () ListLongMap!3069)

(declare-fun call!19929 () ListLongMap!3069)

(assert (=> b!210650 (= e!137168 (+!553 call!19929 (tuple2!4157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210651 () Bool)

(declare-fun e!137171 () Bool)

(assert (=> b!210651 (= e!137171 (not call!19933))))

(declare-fun b!210652 () Bool)

(declare-fun res!102807 () Bool)

(assert (=> b!210652 (=> (not res!102807) (not e!137160))))

(assert (=> b!210652 (= res!102807 e!137171)))

(declare-fun c!35601 () Bool)

(assert (=> b!210652 (= c!35601 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210653 () Bool)

(declare-fun c!35603 () Bool)

(assert (=> b!210653 (= c!35603 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137166 () ListLongMap!3069)

(declare-fun e!137162 () ListLongMap!3069)

(assert (=> b!210653 (= e!137166 e!137162)))

(declare-fun b!210654 () Bool)

(assert (=> b!210654 (= e!137162 call!19934)))

(declare-fun b!210655 () Bool)

(declare-fun call!19935 () ListLongMap!3069)

(assert (=> b!210655 (= e!137166 call!19935)))

(declare-fun b!210656 () Bool)

(assert (=> b!210656 (= e!137168 e!137166)))

(declare-fun c!35606 () Bool)

(assert (=> b!210656 (= c!35606 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19929 () Bool)

(assert (=> bm!19929 (= call!19930 call!19932)))

(declare-fun b!210657 () Bool)

(declare-fun e!137167 () Bool)

(assert (=> b!210657 (= e!137167 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210658 () Bool)

(declare-fun e!137161 () Bool)

(declare-fun e!137170 () Bool)

(assert (=> b!210658 (= e!137161 e!137170)))

(declare-fun res!102804 () Bool)

(assert (=> b!210658 (=> (not res!102804) (not e!137170))))

(assert (=> b!210658 (= res!102804 (contains!1399 lt!108015 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210659 () Bool)

(assert (=> b!210659 (= e!137171 e!137163)))

(declare-fun res!102808 () Bool)

(assert (=> b!210659 (= res!102808 call!19933)))

(assert (=> b!210659 (=> (not res!102808) (not e!137163))))

(declare-fun b!210660 () Bool)

(declare-fun Unit!6396 () Unit!6394)

(assert (=> b!210660 (= e!137165 Unit!6396)))

(declare-fun b!210661 () Bool)

(declare-fun res!102802 () Bool)

(assert (=> b!210661 (=> (not res!102802) (not e!137160))))

(assert (=> b!210661 (= res!102802 e!137161)))

(declare-fun res!102805 () Bool)

(assert (=> b!210661 (=> res!102805 e!137161)))

(declare-fun e!137164 () Bool)

(assert (=> b!210661 (= res!102805 (not e!137164))))

(declare-fun res!102801 () Bool)

(assert (=> b!210661 (=> (not res!102801) (not e!137164))))

(assert (=> b!210661 (= res!102801 (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210662 () Bool)

(assert (=> b!210662 (= e!137164 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19930 () Bool)

(assert (=> bm!19930 (= call!19931 (contains!1399 lt!108015 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19931 () Bool)

(declare-fun c!35602 () Bool)

(assert (=> bm!19931 (= call!19929 (+!553 (ite c!35602 call!19932 (ite c!35606 call!19930 call!19934)) (ite (or c!35602 c!35606) (tuple2!4157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210663 () Bool)

(declare-fun get!2550 (ValueCell!2361 V!6859) V!6859)

(declare-fun dynLambda!535 (Int (_ BitVec 64)) V!6859)

(assert (=> b!210663 (= e!137170 (= (apply!192 lt!108015 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)) (get!2550 (select (arr!4758 lt!107875) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5083 lt!107875)))))

(assert (=> b!210663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210664 () Bool)

(declare-fun e!137159 () Bool)

(assert (=> b!210664 (= e!137169 e!137159)))

(declare-fun res!102806 () Bool)

(assert (=> b!210664 (= res!102806 call!19931)))

(assert (=> b!210664 (=> (not res!102806) (not e!137159))))

(declare-fun d!57991 () Bool)

(assert (=> d!57991 e!137160))

(declare-fun res!102800 () Bool)

(assert (=> d!57991 (=> (not res!102800) (not e!137160))))

(assert (=> d!57991 (= res!102800 (or (bvsge #b00000000000000000000000000000000 (size!5082 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))))

(declare-fun lt!108016 () ListLongMap!3069)

(assert (=> d!57991 (= lt!108015 lt!108016)))

(declare-fun lt!108022 () Unit!6394)

(assert (=> d!57991 (= lt!108022 e!137165)))

(declare-fun c!35605 () Bool)

(assert (=> d!57991 (= c!35605 e!137167)))

(declare-fun res!102803 () Bool)

(assert (=> d!57991 (=> (not res!102803) (not e!137167))))

(assert (=> d!57991 (= res!102803 (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(assert (=> d!57991 (= lt!108016 e!137168)))

(assert (=> d!57991 (= c!35602 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57991 (validMask!0 mask!1149)))

(assert (=> d!57991 (= (getCurrentListMap!1086 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108015)))

(declare-fun b!210649 () Bool)

(assert (=> b!210649 (= e!137159 (= (apply!192 lt!108015 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19932 () Bool)

(assert (=> bm!19932 (= call!19935 call!19929)))

(declare-fun b!210665 () Bool)

(assert (=> b!210665 (= e!137162 call!19935)))

(assert (= (and d!57991 c!35602) b!210650))

(assert (= (and d!57991 (not c!35602)) b!210656))

(assert (= (and b!210656 c!35606) b!210655))

(assert (= (and b!210656 (not c!35606)) b!210653))

(assert (= (and b!210653 c!35603) b!210665))

(assert (= (and b!210653 (not c!35603)) b!210654))

(assert (= (or b!210665 b!210654) bm!19928))

(assert (= (or b!210655 bm!19928) bm!19929))

(assert (= (or b!210655 b!210665) bm!19932))

(assert (= (or b!210650 bm!19929) bm!19926))

(assert (= (or b!210650 bm!19932) bm!19931))

(assert (= (and d!57991 res!102803) b!210657))

(assert (= (and d!57991 c!35605) b!210645))

(assert (= (and d!57991 (not c!35605)) b!210660))

(assert (= (and d!57991 res!102800) b!210661))

(assert (= (and b!210661 res!102801) b!210662))

(assert (= (and b!210661 (not res!102805)) b!210658))

(assert (= (and b!210658 res!102804) b!210663))

(assert (= (and b!210661 res!102802) b!210652))

(assert (= (and b!210652 c!35601) b!210659))

(assert (= (and b!210652 (not c!35601)) b!210651))

(assert (= (and b!210659 res!102808) b!210646))

(assert (= (or b!210659 b!210651) bm!19927))

(assert (= (and b!210652 res!102807) b!210647))

(assert (= (and b!210647 c!35604) b!210664))

(assert (= (and b!210647 (not c!35604)) b!210648))

(assert (= (and b!210664 res!102806) b!210649))

(assert (= (or b!210664 b!210648) bm!19930))

(declare-fun b_lambda!7611 () Bool)

(assert (=> (not b_lambda!7611) (not b!210663)))

(declare-fun t!7989 () Bool)

(declare-fun tb!2897 () Bool)

(assert (=> (and start!20954 (= defaultEntry!657 defaultEntry!657) t!7989) tb!2897))

(declare-fun result!4979 () Bool)

(assert (=> tb!2897 (= result!4979 tp_is_empty!5409)))

(assert (=> b!210663 t!7989))

(declare-fun b_and!12333 () Bool)

(assert (= b_and!12329 (and (=> t!7989 result!4979) b_and!12333)))

(declare-fun m!238251 () Bool)

(assert (=> bm!19930 m!238251))

(assert (=> b!210663 m!238143))

(declare-fun m!238253 () Bool)

(assert (=> b!210663 m!238253))

(declare-fun m!238255 () Bool)

(assert (=> b!210663 m!238255))

(declare-fun m!238257 () Bool)

(assert (=> b!210663 m!238257))

(assert (=> b!210663 m!238143))

(assert (=> b!210663 m!238255))

(assert (=> b!210663 m!238257))

(declare-fun m!238259 () Bool)

(assert (=> b!210663 m!238259))

(declare-fun m!238261 () Bool)

(assert (=> b!210649 m!238261))

(declare-fun m!238263 () Bool)

(assert (=> b!210650 m!238263))

(assert (=> b!210658 m!238143))

(assert (=> b!210658 m!238143))

(declare-fun m!238265 () Bool)

(assert (=> b!210658 m!238265))

(assert (=> b!210662 m!238143))

(assert (=> b!210662 m!238143))

(assert (=> b!210662 m!238151))

(assert (=> b!210657 m!238143))

(assert (=> b!210657 m!238143))

(assert (=> b!210657 m!238151))

(assert (=> d!57991 m!238049))

(declare-fun m!238267 () Bool)

(assert (=> b!210645 m!238267))

(declare-fun m!238269 () Bool)

(assert (=> b!210645 m!238269))

(declare-fun m!238271 () Bool)

(assert (=> b!210645 m!238271))

(declare-fun m!238273 () Bool)

(assert (=> b!210645 m!238273))

(declare-fun m!238275 () Bool)

(assert (=> b!210645 m!238275))

(declare-fun m!238277 () Bool)

(assert (=> b!210645 m!238277))

(declare-fun m!238279 () Bool)

(assert (=> b!210645 m!238279))

(assert (=> b!210645 m!238279))

(declare-fun m!238281 () Bool)

(assert (=> b!210645 m!238281))

(assert (=> b!210645 m!238143))

(assert (=> b!210645 m!238269))

(assert (=> b!210645 m!238063))

(declare-fun m!238283 () Bool)

(assert (=> b!210645 m!238283))

(declare-fun m!238285 () Bool)

(assert (=> b!210645 m!238285))

(declare-fun m!238287 () Bool)

(assert (=> b!210645 m!238287))

(declare-fun m!238289 () Bool)

(assert (=> b!210645 m!238289))

(declare-fun m!238291 () Bool)

(assert (=> b!210645 m!238291))

(assert (=> b!210645 m!238285))

(declare-fun m!238293 () Bool)

(assert (=> b!210645 m!238293))

(assert (=> b!210645 m!238273))

(declare-fun m!238295 () Bool)

(assert (=> b!210645 m!238295))

(declare-fun m!238297 () Bool)

(assert (=> bm!19931 m!238297))

(declare-fun m!238299 () Bool)

(assert (=> bm!19927 m!238299))

(declare-fun m!238301 () Bool)

(assert (=> b!210646 m!238301))

(assert (=> bm!19926 m!238063))

(assert (=> b!210520 d!57991))

(declare-fun b!210692 () Bool)

(declare-fun e!137192 () Bool)

(declare-fun e!137189 () Bool)

(assert (=> b!210692 (= e!137192 e!137189)))

(assert (=> b!210692 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun res!102817 () Bool)

(declare-fun lt!108049 () ListLongMap!3069)

(assert (=> b!210692 (= res!102817 (contains!1399 lt!108049 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210692 (=> (not res!102817) (not e!137189))))

(declare-fun b!210693 () Bool)

(declare-fun e!137190 () ListLongMap!3069)

(declare-fun e!137188 () ListLongMap!3069)

(assert (=> b!210693 (= e!137190 e!137188)))

(declare-fun c!35618 () Bool)

(assert (=> b!210693 (= c!35618 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun e!137187 () Bool)

(declare-fun b!210694 () Bool)

(assert (=> b!210694 (= e!137187 (= lt!108049 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!57993 () Bool)

(declare-fun e!137186 () Bool)

(assert (=> d!57993 e!137186))

(declare-fun res!102819 () Bool)

(assert (=> d!57993 (=> (not res!102819) (not e!137186))))

(assert (=> d!57993 (= res!102819 (not (contains!1399 lt!108049 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57993 (= lt!108049 e!137190)))

(declare-fun c!35616 () Bool)

(assert (=> d!57993 (= c!35616 (bvsge #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(assert (=> d!57993 (validMask!0 mask!1149)))

(assert (=> d!57993 (= (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108049)))

(declare-fun b!210695 () Bool)

(assert (=> b!210695 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(assert (=> b!210695 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5083 _values!649)))))

(assert (=> b!210695 (= e!137189 (= (apply!192 lt!108049 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)) (get!2550 (select (arr!4758 _values!649) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210696 () Bool)

(declare-fun lt!108046 () Unit!6394)

(declare-fun lt!108047 () Unit!6394)

(assert (=> b!210696 (= lt!108046 lt!108047)))

(declare-fun lt!108045 () ListLongMap!3069)

(declare-fun lt!108050 () V!6859)

(declare-fun lt!108051 () (_ BitVec 64))

(declare-fun lt!108048 () (_ BitVec 64))

(assert (=> b!210696 (not (contains!1399 (+!553 lt!108045 (tuple2!4157 lt!108051 lt!108050)) lt!108048))))

(declare-fun addStillNotContains!101 (ListLongMap!3069 (_ BitVec 64) V!6859 (_ BitVec 64)) Unit!6394)

(assert (=> b!210696 (= lt!108047 (addStillNotContains!101 lt!108045 lt!108051 lt!108050 lt!108048))))

(assert (=> b!210696 (= lt!108048 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210696 (= lt!108050 (get!2550 (select (arr!4758 _values!649) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210696 (= lt!108051 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19938 () ListLongMap!3069)

(assert (=> b!210696 (= lt!108045 call!19938)))

(assert (=> b!210696 (= e!137188 (+!553 call!19938 (tuple2!4157 (select (arr!4757 _keys!825) #b00000000000000000000000000000000) (get!2550 (select (arr!4758 _values!649) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210697 () Bool)

(assert (=> b!210697 (= e!137188 call!19938)))

(declare-fun b!210698 () Bool)

(assert (=> b!210698 (= e!137192 e!137187)))

(declare-fun c!35615 () Bool)

(assert (=> b!210698 (= c!35615 (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210699 () Bool)

(assert (=> b!210699 (= e!137186 e!137192)))

(declare-fun c!35617 () Bool)

(declare-fun e!137191 () Bool)

(assert (=> b!210699 (= c!35617 e!137191)))

(declare-fun res!102818 () Bool)

(assert (=> b!210699 (=> (not res!102818) (not e!137191))))

(assert (=> b!210699 (= res!102818 (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210700 () Bool)

(assert (=> b!210700 (= e!137191 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210700 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210701 () Bool)

(assert (=> b!210701 (= e!137190 (ListLongMap!3070 Nil!3046))))

(declare-fun bm!19935 () Bool)

(assert (=> bm!19935 (= call!19938 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210702 () Bool)

(declare-fun isEmpty!493 (ListLongMap!3069) Bool)

(assert (=> b!210702 (= e!137187 (isEmpty!493 lt!108049))))

(declare-fun b!210703 () Bool)

(declare-fun res!102820 () Bool)

(assert (=> b!210703 (=> (not res!102820) (not e!137186))))

(assert (=> b!210703 (= res!102820 (not (contains!1399 lt!108049 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57993 c!35616) b!210701))

(assert (= (and d!57993 (not c!35616)) b!210693))

(assert (= (and b!210693 c!35618) b!210696))

(assert (= (and b!210693 (not c!35618)) b!210697))

(assert (= (or b!210696 b!210697) bm!19935))

(assert (= (and d!57993 res!102819) b!210703))

(assert (= (and b!210703 res!102820) b!210699))

(assert (= (and b!210699 res!102818) b!210700))

(assert (= (and b!210699 c!35617) b!210692))

(assert (= (and b!210699 (not c!35617)) b!210698))

(assert (= (and b!210692 res!102817) b!210695))

(assert (= (and b!210698 c!35615) b!210694))

(assert (= (and b!210698 (not c!35615)) b!210702))

(declare-fun b_lambda!7613 () Bool)

(assert (=> (not b_lambda!7613) (not b!210695)))

(assert (=> b!210695 t!7989))

(declare-fun b_and!12335 () Bool)

(assert (= b_and!12333 (and (=> t!7989 result!4979) b_and!12335)))

(declare-fun b_lambda!7615 () Bool)

(assert (=> (not b_lambda!7615) (not b!210696)))

(assert (=> b!210696 t!7989))

(declare-fun b_and!12337 () Bool)

(assert (= b_and!12335 (and (=> t!7989 result!4979) b_and!12337)))

(assert (=> b!210700 m!238143))

(assert (=> b!210700 m!238143))

(assert (=> b!210700 m!238151))

(assert (=> b!210692 m!238143))

(assert (=> b!210692 m!238143))

(declare-fun m!238303 () Bool)

(assert (=> b!210692 m!238303))

(declare-fun m!238305 () Bool)

(assert (=> b!210703 m!238305))

(declare-fun m!238307 () Bool)

(assert (=> bm!19935 m!238307))

(assert (=> b!210694 m!238307))

(declare-fun m!238309 () Bool)

(assert (=> d!57993 m!238309))

(assert (=> d!57993 m!238049))

(assert (=> b!210695 m!238257))

(declare-fun m!238311 () Bool)

(assert (=> b!210695 m!238311))

(assert (=> b!210695 m!238257))

(declare-fun m!238313 () Bool)

(assert (=> b!210695 m!238313))

(assert (=> b!210695 m!238143))

(assert (=> b!210695 m!238311))

(assert (=> b!210695 m!238143))

(declare-fun m!238315 () Bool)

(assert (=> b!210695 m!238315))

(declare-fun m!238317 () Bool)

(assert (=> b!210696 m!238317))

(assert (=> b!210696 m!238257))

(assert (=> b!210696 m!238311))

(assert (=> b!210696 m!238257))

(assert (=> b!210696 m!238313))

(assert (=> b!210696 m!238143))

(declare-fun m!238319 () Bool)

(assert (=> b!210696 m!238319))

(assert (=> b!210696 m!238319))

(declare-fun m!238321 () Bool)

(assert (=> b!210696 m!238321))

(declare-fun m!238323 () Bool)

(assert (=> b!210696 m!238323))

(assert (=> b!210696 m!238311))

(declare-fun m!238325 () Bool)

(assert (=> b!210702 m!238325))

(assert (=> b!210693 m!238143))

(assert (=> b!210693 m!238143))

(assert (=> b!210693 m!238151))

(assert (=> b!210520 d!57993))

(declare-fun d!57995 () Bool)

(declare-fun e!137193 () Bool)

(assert (=> d!57995 e!137193))

(declare-fun res!102822 () Bool)

(assert (=> d!57995 (=> (not res!102822) (not e!137193))))

(declare-fun lt!108052 () ListLongMap!3069)

(assert (=> d!57995 (= res!102822 (contains!1399 lt!108052 (_1!2089 lt!107871)))))

(declare-fun lt!108053 () List!3049)

(assert (=> d!57995 (= lt!108052 (ListLongMap!3070 lt!108053))))

(declare-fun lt!108055 () Unit!6394)

(declare-fun lt!108054 () Unit!6394)

(assert (=> d!57995 (= lt!108055 lt!108054)))

(assert (=> d!57995 (= (getValueByKey!250 lt!108053 (_1!2089 lt!107871)) (Some!255 (_2!2089 lt!107871)))))

(assert (=> d!57995 (= lt!108054 (lemmaContainsTupThenGetReturnValue!137 lt!108053 (_1!2089 lt!107871) (_2!2089 lt!107871)))))

(assert (=> d!57995 (= lt!108053 (insertStrictlySorted!140 (toList!1550 lt!107866) (_1!2089 lt!107871) (_2!2089 lt!107871)))))

(assert (=> d!57995 (= (+!553 lt!107866 lt!107871) lt!108052)))

(declare-fun b!210704 () Bool)

(declare-fun res!102821 () Bool)

(assert (=> b!210704 (=> (not res!102821) (not e!137193))))

(assert (=> b!210704 (= res!102821 (= (getValueByKey!250 (toList!1550 lt!108052) (_1!2089 lt!107871)) (Some!255 (_2!2089 lt!107871))))))

(declare-fun b!210705 () Bool)

(assert (=> b!210705 (= e!137193 (contains!1400 (toList!1550 lt!108052) lt!107871))))

(assert (= (and d!57995 res!102822) b!210704))

(assert (= (and b!210704 res!102821) b!210705))

(declare-fun m!238327 () Bool)

(assert (=> d!57995 m!238327))

(declare-fun m!238329 () Bool)

(assert (=> d!57995 m!238329))

(declare-fun m!238331 () Bool)

(assert (=> d!57995 m!238331))

(declare-fun m!238333 () Bool)

(assert (=> d!57995 m!238333))

(declare-fun m!238335 () Bool)

(assert (=> b!210704 m!238335))

(declare-fun m!238337 () Bool)

(assert (=> b!210705 m!238337))

(assert (=> b!210520 d!57995))

(declare-fun b!210713 () Bool)

(declare-fun call!19944 () ListLongMap!3069)

(declare-fun e!137198 () Bool)

(declare-fun call!19943 () ListLongMap!3069)

(assert (=> b!210713 (= e!137198 (= call!19943 (+!553 call!19944 (tuple2!4157 k0!843 v!520))))))

(declare-fun b!210714 () Bool)

(declare-fun e!137199 () Bool)

(assert (=> b!210714 (= e!137199 e!137198)))

(declare-fun c!35621 () Bool)

(assert (=> b!210714 (= c!35621 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun bm!19940 () Bool)

(assert (=> bm!19940 (= call!19943 (getCurrentListMapNoExtraKeys!488 _keys!825 (array!10022 (store (arr!4758 _values!649) i!601 (ValueCellFull!2361 v!520)) (size!5083 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!19941 () Bool)

(assert (=> bm!19941 (= call!19944 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!57997 () Bool)

(assert (=> d!57997 e!137199))

(declare-fun res!102825 () Bool)

(assert (=> d!57997 (=> (not res!102825) (not e!137199))))

(assert (=> d!57997 (= res!102825 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5083 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5083 _values!649))))))))

(declare-fun lt!108058 () Unit!6394)

(declare-fun choose!1076 (array!10019 array!10021 (_ BitVec 32) (_ BitVec 32) V!6859 V!6859 (_ BitVec 32) (_ BitVec 64) V!6859 (_ BitVec 32) Int) Unit!6394)

(assert (=> d!57997 (= lt!108058 (choose!1076 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(assert (=> d!57997 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!203 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108058)))

(declare-fun b!210712 () Bool)

(assert (=> b!210712 (= e!137198 (= call!19943 call!19944))))

(assert (= (and d!57997 res!102825) b!210714))

(assert (= (and b!210714 c!35621) b!210713))

(assert (= (and b!210714 (not c!35621)) b!210712))

(assert (= (or b!210713 b!210712) bm!19940))

(assert (= (or b!210713 b!210712) bm!19941))

(declare-fun m!238339 () Bool)

(assert (=> b!210713 m!238339))

(assert (=> bm!19940 m!238055))

(declare-fun m!238341 () Bool)

(assert (=> bm!19940 m!238341))

(assert (=> bm!19941 m!238061))

(declare-fun m!238343 () Bool)

(assert (=> d!57997 m!238343))

(assert (=> b!210520 d!57997))

(declare-fun b!210715 () Bool)

(declare-fun e!137206 () Unit!6394)

(declare-fun lt!108073 () Unit!6394)

(assert (=> b!210715 (= e!137206 lt!108073)))

(declare-fun lt!108064 () ListLongMap!3069)

(assert (=> b!210715 (= lt!108064 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108076 () (_ BitVec 64))

(assert (=> b!210715 (= lt!108076 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108078 () (_ BitVec 64))

(assert (=> b!210715 (= lt!108078 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108075 () Unit!6394)

(assert (=> b!210715 (= lt!108075 (addStillContains!168 lt!108064 lt!108076 zeroValue!615 lt!108078))))

(assert (=> b!210715 (contains!1399 (+!553 lt!108064 (tuple2!4157 lt!108076 zeroValue!615)) lt!108078)))

(declare-fun lt!108062 () Unit!6394)

(assert (=> b!210715 (= lt!108062 lt!108075)))

(declare-fun lt!108068 () ListLongMap!3069)

(assert (=> b!210715 (= lt!108068 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108059 () (_ BitVec 64))

(assert (=> b!210715 (= lt!108059 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108077 () (_ BitVec 64))

(assert (=> b!210715 (= lt!108077 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108080 () Unit!6394)

(assert (=> b!210715 (= lt!108080 (addApplyDifferent!168 lt!108068 lt!108059 minValue!615 lt!108077))))

(assert (=> b!210715 (= (apply!192 (+!553 lt!108068 (tuple2!4157 lt!108059 minValue!615)) lt!108077) (apply!192 lt!108068 lt!108077))))

(declare-fun lt!108063 () Unit!6394)

(assert (=> b!210715 (= lt!108063 lt!108080)))

(declare-fun lt!108061 () ListLongMap!3069)

(assert (=> b!210715 (= lt!108061 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108079 () (_ BitVec 64))

(assert (=> b!210715 (= lt!108079 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108060 () (_ BitVec 64))

(assert (=> b!210715 (= lt!108060 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108074 () Unit!6394)

(assert (=> b!210715 (= lt!108074 (addApplyDifferent!168 lt!108061 lt!108079 zeroValue!615 lt!108060))))

(assert (=> b!210715 (= (apply!192 (+!553 lt!108061 (tuple2!4157 lt!108079 zeroValue!615)) lt!108060) (apply!192 lt!108061 lt!108060))))

(declare-fun lt!108069 () Unit!6394)

(assert (=> b!210715 (= lt!108069 lt!108074)))

(declare-fun lt!108070 () ListLongMap!3069)

(assert (=> b!210715 (= lt!108070 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108067 () (_ BitVec 64))

(assert (=> b!210715 (= lt!108067 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108071 () (_ BitVec 64))

(assert (=> b!210715 (= lt!108071 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210715 (= lt!108073 (addApplyDifferent!168 lt!108070 lt!108067 minValue!615 lt!108071))))

(assert (=> b!210715 (= (apply!192 (+!553 lt!108070 (tuple2!4157 lt!108067 minValue!615)) lt!108071) (apply!192 lt!108070 lt!108071))))

(declare-fun b!210716 () Bool)

(declare-fun e!137204 () Bool)

(declare-fun lt!108065 () ListLongMap!3069)

(assert (=> b!210716 (= e!137204 (= (apply!192 lt!108065 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210717 () Bool)

(declare-fun e!137201 () Bool)

(declare-fun e!137210 () Bool)

(assert (=> b!210717 (= e!137201 e!137210)))

(declare-fun c!35625 () Bool)

(assert (=> b!210717 (= c!35625 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210718 () Bool)

(declare-fun call!19947 () Bool)

(assert (=> b!210718 (= e!137210 (not call!19947))))

(declare-fun call!19948 () ListLongMap!3069)

(declare-fun bm!19942 () Bool)

(assert (=> bm!19942 (= call!19948 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!19943 () Bool)

(declare-fun call!19949 () Bool)

(assert (=> bm!19943 (= call!19949 (contains!1399 lt!108065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19944 () Bool)

(declare-fun call!19950 () ListLongMap!3069)

(declare-fun call!19946 () ListLongMap!3069)

(assert (=> bm!19944 (= call!19950 call!19946)))

(declare-fun b!210720 () Bool)

(declare-fun e!137209 () ListLongMap!3069)

(declare-fun call!19945 () ListLongMap!3069)

(assert (=> b!210720 (= e!137209 (+!553 call!19945 (tuple2!4157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210721 () Bool)

(declare-fun e!137212 () Bool)

(assert (=> b!210721 (= e!137212 (not call!19949))))

(declare-fun b!210722 () Bool)

(declare-fun res!102833 () Bool)

(assert (=> b!210722 (=> (not res!102833) (not e!137201))))

(assert (=> b!210722 (= res!102833 e!137212)))

(declare-fun c!35622 () Bool)

(assert (=> b!210722 (= c!35622 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210723 () Bool)

(declare-fun c!35624 () Bool)

(assert (=> b!210723 (= c!35624 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137207 () ListLongMap!3069)

(declare-fun e!137203 () ListLongMap!3069)

(assert (=> b!210723 (= e!137207 e!137203)))

(declare-fun b!210724 () Bool)

(assert (=> b!210724 (= e!137203 call!19950)))

(declare-fun b!210725 () Bool)

(declare-fun call!19951 () ListLongMap!3069)

(assert (=> b!210725 (= e!137207 call!19951)))

(declare-fun b!210726 () Bool)

(assert (=> b!210726 (= e!137209 e!137207)))

(declare-fun c!35627 () Bool)

(assert (=> b!210726 (= c!35627 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19945 () Bool)

(assert (=> bm!19945 (= call!19946 call!19948)))

(declare-fun b!210727 () Bool)

(declare-fun e!137208 () Bool)

(assert (=> b!210727 (= e!137208 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210728 () Bool)

(declare-fun e!137202 () Bool)

(declare-fun e!137211 () Bool)

(assert (=> b!210728 (= e!137202 e!137211)))

(declare-fun res!102830 () Bool)

(assert (=> b!210728 (=> (not res!102830) (not e!137211))))

(assert (=> b!210728 (= res!102830 (contains!1399 lt!108065 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210729 () Bool)

(assert (=> b!210729 (= e!137212 e!137204)))

(declare-fun res!102834 () Bool)

(assert (=> b!210729 (= res!102834 call!19949)))

(assert (=> b!210729 (=> (not res!102834) (not e!137204))))

(declare-fun b!210730 () Bool)

(declare-fun Unit!6397 () Unit!6394)

(assert (=> b!210730 (= e!137206 Unit!6397)))

(declare-fun b!210731 () Bool)

(declare-fun res!102828 () Bool)

(assert (=> b!210731 (=> (not res!102828) (not e!137201))))

(assert (=> b!210731 (= res!102828 e!137202)))

(declare-fun res!102831 () Bool)

(assert (=> b!210731 (=> res!102831 e!137202)))

(declare-fun e!137205 () Bool)

(assert (=> b!210731 (= res!102831 (not e!137205))))

(declare-fun res!102827 () Bool)

(assert (=> b!210731 (=> (not res!102827) (not e!137205))))

(assert (=> b!210731 (= res!102827 (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210732 () Bool)

(assert (=> b!210732 (= e!137205 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19946 () Bool)

(assert (=> bm!19946 (= call!19947 (contains!1399 lt!108065 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!35623 () Bool)

(declare-fun bm!19947 () Bool)

(assert (=> bm!19947 (= call!19945 (+!553 (ite c!35623 call!19948 (ite c!35627 call!19946 call!19950)) (ite (or c!35623 c!35627) (tuple2!4157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210733 () Bool)

(assert (=> b!210733 (= e!137211 (= (apply!192 lt!108065 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)) (get!2550 (select (arr!4758 _values!649) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5083 _values!649)))))

(assert (=> b!210733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210734 () Bool)

(declare-fun e!137200 () Bool)

(assert (=> b!210734 (= e!137210 e!137200)))

(declare-fun res!102832 () Bool)

(assert (=> b!210734 (= res!102832 call!19947)))

(assert (=> b!210734 (=> (not res!102832) (not e!137200))))

(declare-fun d!57999 () Bool)

(assert (=> d!57999 e!137201))

(declare-fun res!102826 () Bool)

(assert (=> d!57999 (=> (not res!102826) (not e!137201))))

(assert (=> d!57999 (= res!102826 (or (bvsge #b00000000000000000000000000000000 (size!5082 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))))

(declare-fun lt!108066 () ListLongMap!3069)

(assert (=> d!57999 (= lt!108065 lt!108066)))

(declare-fun lt!108072 () Unit!6394)

(assert (=> d!57999 (= lt!108072 e!137206)))

(declare-fun c!35626 () Bool)

(assert (=> d!57999 (= c!35626 e!137208)))

(declare-fun res!102829 () Bool)

(assert (=> d!57999 (=> (not res!102829) (not e!137208))))

(assert (=> d!57999 (= res!102829 (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(assert (=> d!57999 (= lt!108066 e!137209)))

(assert (=> d!57999 (= c!35623 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57999 (validMask!0 mask!1149)))

(assert (=> d!57999 (= (getCurrentListMap!1086 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108065)))

(declare-fun b!210719 () Bool)

(assert (=> b!210719 (= e!137200 (= (apply!192 lt!108065 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19948 () Bool)

(assert (=> bm!19948 (= call!19951 call!19945)))

(declare-fun b!210735 () Bool)

(assert (=> b!210735 (= e!137203 call!19951)))

(assert (= (and d!57999 c!35623) b!210720))

(assert (= (and d!57999 (not c!35623)) b!210726))

(assert (= (and b!210726 c!35627) b!210725))

(assert (= (and b!210726 (not c!35627)) b!210723))

(assert (= (and b!210723 c!35624) b!210735))

(assert (= (and b!210723 (not c!35624)) b!210724))

(assert (= (or b!210735 b!210724) bm!19944))

(assert (= (or b!210725 bm!19944) bm!19945))

(assert (= (or b!210725 b!210735) bm!19948))

(assert (= (or b!210720 bm!19945) bm!19942))

(assert (= (or b!210720 bm!19948) bm!19947))

(assert (= (and d!57999 res!102829) b!210727))

(assert (= (and d!57999 c!35626) b!210715))

(assert (= (and d!57999 (not c!35626)) b!210730))

(assert (= (and d!57999 res!102826) b!210731))

(assert (= (and b!210731 res!102827) b!210732))

(assert (= (and b!210731 (not res!102831)) b!210728))

(assert (= (and b!210728 res!102830) b!210733))

(assert (= (and b!210731 res!102828) b!210722))

(assert (= (and b!210722 c!35622) b!210729))

(assert (= (and b!210722 (not c!35622)) b!210721))

(assert (= (and b!210729 res!102834) b!210716))

(assert (= (or b!210729 b!210721) bm!19943))

(assert (= (and b!210722 res!102833) b!210717))

(assert (= (and b!210717 c!35625) b!210734))

(assert (= (and b!210717 (not c!35625)) b!210718))

(assert (= (and b!210734 res!102832) b!210719))

(assert (= (or b!210734 b!210718) bm!19946))

(declare-fun b_lambda!7617 () Bool)

(assert (=> (not b_lambda!7617) (not b!210733)))

(assert (=> b!210733 t!7989))

(declare-fun b_and!12339 () Bool)

(assert (= b_and!12337 (and (=> t!7989 result!4979) b_and!12339)))

(declare-fun m!238345 () Bool)

(assert (=> bm!19946 m!238345))

(assert (=> b!210733 m!238143))

(declare-fun m!238347 () Bool)

(assert (=> b!210733 m!238347))

(assert (=> b!210733 m!238311))

(assert (=> b!210733 m!238257))

(assert (=> b!210733 m!238143))

(assert (=> b!210733 m!238311))

(assert (=> b!210733 m!238257))

(assert (=> b!210733 m!238313))

(declare-fun m!238349 () Bool)

(assert (=> b!210719 m!238349))

(declare-fun m!238351 () Bool)

(assert (=> b!210720 m!238351))

(assert (=> b!210728 m!238143))

(assert (=> b!210728 m!238143))

(declare-fun m!238353 () Bool)

(assert (=> b!210728 m!238353))

(assert (=> b!210732 m!238143))

(assert (=> b!210732 m!238143))

(assert (=> b!210732 m!238151))

(assert (=> b!210727 m!238143))

(assert (=> b!210727 m!238143))

(assert (=> b!210727 m!238151))

(assert (=> d!57999 m!238049))

(declare-fun m!238355 () Bool)

(assert (=> b!210715 m!238355))

(declare-fun m!238357 () Bool)

(assert (=> b!210715 m!238357))

(declare-fun m!238359 () Bool)

(assert (=> b!210715 m!238359))

(declare-fun m!238361 () Bool)

(assert (=> b!210715 m!238361))

(declare-fun m!238363 () Bool)

(assert (=> b!210715 m!238363))

(declare-fun m!238365 () Bool)

(assert (=> b!210715 m!238365))

(declare-fun m!238367 () Bool)

(assert (=> b!210715 m!238367))

(assert (=> b!210715 m!238367))

(declare-fun m!238369 () Bool)

(assert (=> b!210715 m!238369))

(assert (=> b!210715 m!238143))

(assert (=> b!210715 m!238357))

(assert (=> b!210715 m!238061))

(declare-fun m!238371 () Bool)

(assert (=> b!210715 m!238371))

(declare-fun m!238373 () Bool)

(assert (=> b!210715 m!238373))

(declare-fun m!238375 () Bool)

(assert (=> b!210715 m!238375))

(declare-fun m!238377 () Bool)

(assert (=> b!210715 m!238377))

(declare-fun m!238379 () Bool)

(assert (=> b!210715 m!238379))

(assert (=> b!210715 m!238373))

(declare-fun m!238381 () Bool)

(assert (=> b!210715 m!238381))

(assert (=> b!210715 m!238361))

(declare-fun m!238383 () Bool)

(assert (=> b!210715 m!238383))

(declare-fun m!238385 () Bool)

(assert (=> bm!19947 m!238385))

(declare-fun m!238387 () Bool)

(assert (=> bm!19943 m!238387))

(declare-fun m!238389 () Bool)

(assert (=> b!210716 m!238389))

(assert (=> bm!19942 m!238061))

(assert (=> b!210520 d!57999))

(declare-fun b!210736 () Bool)

(declare-fun e!137219 () Bool)

(declare-fun e!137216 () Bool)

(assert (=> b!210736 (= e!137219 e!137216)))

(assert (=> b!210736 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun res!102835 () Bool)

(declare-fun lt!108085 () ListLongMap!3069)

(assert (=> b!210736 (= res!102835 (contains!1399 lt!108085 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210736 (=> (not res!102835) (not e!137216))))

(declare-fun b!210737 () Bool)

(declare-fun e!137217 () ListLongMap!3069)

(declare-fun e!137215 () ListLongMap!3069)

(assert (=> b!210737 (= e!137217 e!137215)))

(declare-fun c!35631 () Bool)

(assert (=> b!210737 (= c!35631 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun e!137214 () Bool)

(declare-fun b!210738 () Bool)

(assert (=> b!210738 (= e!137214 (= lt!108085 (getCurrentListMapNoExtraKeys!488 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!58001 () Bool)

(declare-fun e!137213 () Bool)

(assert (=> d!58001 e!137213))

(declare-fun res!102837 () Bool)

(assert (=> d!58001 (=> (not res!102837) (not e!137213))))

(assert (=> d!58001 (= res!102837 (not (contains!1399 lt!108085 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58001 (= lt!108085 e!137217)))

(declare-fun c!35629 () Bool)

(assert (=> d!58001 (= c!35629 (bvsge #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(assert (=> d!58001 (validMask!0 mask!1149)))

(assert (=> d!58001 (= (getCurrentListMapNoExtraKeys!488 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108085)))

(declare-fun b!210739 () Bool)

(assert (=> b!210739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(assert (=> b!210739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5083 lt!107875)))))

(assert (=> b!210739 (= e!137216 (= (apply!192 lt!108085 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)) (get!2550 (select (arr!4758 lt!107875) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210740 () Bool)

(declare-fun lt!108082 () Unit!6394)

(declare-fun lt!108083 () Unit!6394)

(assert (=> b!210740 (= lt!108082 lt!108083)))

(declare-fun lt!108081 () ListLongMap!3069)

(declare-fun lt!108084 () (_ BitVec 64))

(declare-fun lt!108086 () V!6859)

(declare-fun lt!108087 () (_ BitVec 64))

(assert (=> b!210740 (not (contains!1399 (+!553 lt!108081 (tuple2!4157 lt!108087 lt!108086)) lt!108084))))

(assert (=> b!210740 (= lt!108083 (addStillNotContains!101 lt!108081 lt!108087 lt!108086 lt!108084))))

(assert (=> b!210740 (= lt!108084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210740 (= lt!108086 (get!2550 (select (arr!4758 lt!107875) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210740 (= lt!108087 (select (arr!4757 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19952 () ListLongMap!3069)

(assert (=> b!210740 (= lt!108081 call!19952)))

(assert (=> b!210740 (= e!137215 (+!553 call!19952 (tuple2!4157 (select (arr!4757 _keys!825) #b00000000000000000000000000000000) (get!2550 (select (arr!4758 lt!107875) #b00000000000000000000000000000000) (dynLambda!535 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210741 () Bool)

(assert (=> b!210741 (= e!137215 call!19952)))

(declare-fun b!210742 () Bool)

(assert (=> b!210742 (= e!137219 e!137214)))

(declare-fun c!35628 () Bool)

(assert (=> b!210742 (= c!35628 (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210743 () Bool)

(assert (=> b!210743 (= e!137213 e!137219)))

(declare-fun c!35630 () Bool)

(declare-fun e!137218 () Bool)

(assert (=> b!210743 (= c!35630 e!137218)))

(declare-fun res!102836 () Bool)

(assert (=> b!210743 (=> (not res!102836) (not e!137218))))

(assert (=> b!210743 (= res!102836 (bvslt #b00000000000000000000000000000000 (size!5082 _keys!825)))))

(declare-fun b!210744 () Bool)

(assert (=> b!210744 (= e!137218 (validKeyInArray!0 (select (arr!4757 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210744 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210745 () Bool)

(assert (=> b!210745 (= e!137217 (ListLongMap!3070 Nil!3046))))

(declare-fun bm!19949 () Bool)

(assert (=> bm!19949 (= call!19952 (getCurrentListMapNoExtraKeys!488 _keys!825 lt!107875 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210746 () Bool)

(assert (=> b!210746 (= e!137214 (isEmpty!493 lt!108085))))

(declare-fun b!210747 () Bool)

(declare-fun res!102838 () Bool)

(assert (=> b!210747 (=> (not res!102838) (not e!137213))))

(assert (=> b!210747 (= res!102838 (not (contains!1399 lt!108085 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58001 c!35629) b!210745))

(assert (= (and d!58001 (not c!35629)) b!210737))

(assert (= (and b!210737 c!35631) b!210740))

(assert (= (and b!210737 (not c!35631)) b!210741))

(assert (= (or b!210740 b!210741) bm!19949))

(assert (= (and d!58001 res!102837) b!210747))

(assert (= (and b!210747 res!102838) b!210743))

(assert (= (and b!210743 res!102836) b!210744))

(assert (= (and b!210743 c!35630) b!210736))

(assert (= (and b!210743 (not c!35630)) b!210742))

(assert (= (and b!210736 res!102835) b!210739))

(assert (= (and b!210742 c!35628) b!210738))

(assert (= (and b!210742 (not c!35628)) b!210746))

(declare-fun b_lambda!7619 () Bool)

(assert (=> (not b_lambda!7619) (not b!210739)))

(assert (=> b!210739 t!7989))

(declare-fun b_and!12341 () Bool)

(assert (= b_and!12339 (and (=> t!7989 result!4979) b_and!12341)))

(declare-fun b_lambda!7621 () Bool)

(assert (=> (not b_lambda!7621) (not b!210740)))

(assert (=> b!210740 t!7989))

(declare-fun b_and!12343 () Bool)

(assert (= b_and!12341 (and (=> t!7989 result!4979) b_and!12343)))

(assert (=> b!210744 m!238143))

(assert (=> b!210744 m!238143))

(assert (=> b!210744 m!238151))

(assert (=> b!210736 m!238143))

(assert (=> b!210736 m!238143))

(declare-fun m!238391 () Bool)

(assert (=> b!210736 m!238391))

(declare-fun m!238393 () Bool)

(assert (=> b!210747 m!238393))

(declare-fun m!238395 () Bool)

(assert (=> bm!19949 m!238395))

(assert (=> b!210738 m!238395))

(declare-fun m!238397 () Bool)

(assert (=> d!58001 m!238397))

(assert (=> d!58001 m!238049))

(assert (=> b!210739 m!238257))

(assert (=> b!210739 m!238255))

(assert (=> b!210739 m!238257))

(assert (=> b!210739 m!238259))

(assert (=> b!210739 m!238143))

(assert (=> b!210739 m!238255))

(assert (=> b!210739 m!238143))

(declare-fun m!238399 () Bool)

(assert (=> b!210739 m!238399))

(declare-fun m!238401 () Bool)

(assert (=> b!210740 m!238401))

(assert (=> b!210740 m!238257))

(assert (=> b!210740 m!238255))

(assert (=> b!210740 m!238257))

(assert (=> b!210740 m!238259))

(assert (=> b!210740 m!238143))

(declare-fun m!238403 () Bool)

(assert (=> b!210740 m!238403))

(assert (=> b!210740 m!238403))

(declare-fun m!238405 () Bool)

(assert (=> b!210740 m!238405))

(declare-fun m!238407 () Bool)

(assert (=> b!210740 m!238407))

(assert (=> b!210740 m!238255))

(declare-fun m!238409 () Bool)

(assert (=> b!210746 m!238409))

(assert (=> b!210737 m!238143))

(assert (=> b!210737 m!238143))

(assert (=> b!210737 m!238151))

(assert (=> b!210520 d!58001))

(declare-fun d!58003 () Bool)

(assert (=> d!58003 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210524 d!58003))

(declare-fun b!210755 () Bool)

(declare-fun e!137224 () Bool)

(assert (=> b!210755 (= e!137224 tp_is_empty!5409)))

(declare-fun mapNonEmpty!9197 () Bool)

(declare-fun mapRes!9197 () Bool)

(declare-fun tp!19700 () Bool)

(declare-fun e!137225 () Bool)

(assert (=> mapNonEmpty!9197 (= mapRes!9197 (and tp!19700 e!137225))))

(declare-fun mapRest!9197 () (Array (_ BitVec 32) ValueCell!2361))

(declare-fun mapKey!9197 () (_ BitVec 32))

(declare-fun mapValue!9197 () ValueCell!2361)

(assert (=> mapNonEmpty!9197 (= mapRest!9191 (store mapRest!9197 mapKey!9197 mapValue!9197))))

(declare-fun b!210754 () Bool)

(assert (=> b!210754 (= e!137225 tp_is_empty!5409)))

(declare-fun condMapEmpty!9197 () Bool)

(declare-fun mapDefault!9197 () ValueCell!2361)

(assert (=> mapNonEmpty!9191 (= condMapEmpty!9197 (= mapRest!9191 ((as const (Array (_ BitVec 32) ValueCell!2361)) mapDefault!9197)))))

(assert (=> mapNonEmpty!9191 (= tp!19690 (and e!137224 mapRes!9197))))

(declare-fun mapIsEmpty!9197 () Bool)

(assert (=> mapIsEmpty!9197 mapRes!9197))

(assert (= (and mapNonEmpty!9191 condMapEmpty!9197) mapIsEmpty!9197))

(assert (= (and mapNonEmpty!9191 (not condMapEmpty!9197)) mapNonEmpty!9197))

(assert (= (and mapNonEmpty!9197 ((_ is ValueCellFull!2361) mapValue!9197)) b!210754))

(assert (= (and mapNonEmpty!9191 ((_ is ValueCellFull!2361) mapDefault!9197)) b!210755))

(declare-fun m!238411 () Bool)

(assert (=> mapNonEmpty!9197 m!238411))

(declare-fun b_lambda!7623 () Bool)

(assert (= b_lambda!7619 (or (and start!20954 b_free!5547) b_lambda!7623)))

(declare-fun b_lambda!7625 () Bool)

(assert (= b_lambda!7613 (or (and start!20954 b_free!5547) b_lambda!7625)))

(declare-fun b_lambda!7627 () Bool)

(assert (= b_lambda!7611 (or (and start!20954 b_free!5547) b_lambda!7627)))

(declare-fun b_lambda!7629 () Bool)

(assert (= b_lambda!7615 (or (and start!20954 b_free!5547) b_lambda!7629)))

(declare-fun b_lambda!7631 () Bool)

(assert (= b_lambda!7621 (or (and start!20954 b_free!5547) b_lambda!7631)))

(declare-fun b_lambda!7633 () Bool)

(assert (= b_lambda!7617 (or (and start!20954 b_free!5547) b_lambda!7633)))

(check-sat (not b!210702) (not d!57977) (not b!210694) (not d!57979) (not b_lambda!7633) (not b!210716) (not b_lambda!7629) (not d!57995) (not b!210746) (not bm!19949) (not b!210646) (not b!210591) (not b_next!5547) (not d!57997) (not b!210658) (not b!210738) (not b!210737) (not bm!19927) (not bm!19942) (not b!210713) (not b!210695) (not b!210740) (not b!210596) (not bm!19947) (not d!57993) (not bm!19926) (not b!210589) (not b!210649) (not b!210598) (not b!210590) (not b!210736) (not b!210693) (not b!210700) (not bm!19908) (not b!210597) (not b!210650) (not bm!19930) (not b_lambda!7627) (not mapNonEmpty!9197) (not b!210645) (not b!210715) (not b!210569) (not b!210594) (not bm!19940) (not b!210732) (not b!210744) (not b!210728) (not d!57973) (not d!57975) (not b!210599) (not d!57969) tp_is_empty!5409 (not d!57991) (not bm!19941) (not b!210600) (not b!210602) (not b!210580) (not b!210662) (not bm!19931) (not b!210583) (not b!210663) (not b!210747) (not d!57983) (not d!57971) (not b_lambda!7623) (not b_lambda!7631) (not bm!19911) (not b!210584) (not b!210593) (not b!210696) (not bm!19935) (not b!210692) (not d!58001) (not b!210739) (not b!210727) (not b!210703) (not b!210720) (not b!210657) (not b_lambda!7625) (not b!210719) (not bm!19943) (not d!57999) (not d!57981) (not bm!19946) (not b!210595) (not b!210704) (not b!210705) (not b!210592) (not b!210733) (not b!210601) b_and!12343 (not b!210566))
(check-sat b_and!12343 (not b_next!5547))
