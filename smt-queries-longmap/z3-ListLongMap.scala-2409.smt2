; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38124 () Bool)

(assert start!38124)

(declare-fun b_free!9019 () Bool)

(declare-fun b_next!9019 () Bool)

(assert (=> start!38124 (= b_free!9019 (not b_next!9019))))

(declare-fun tp!31838 () Bool)

(declare-fun b_and!16395 () Bool)

(assert (=> start!38124 (= tp!31838 b_and!16395)))

(declare-fun b!392890 () Bool)

(declare-fun e!237917 () Bool)

(declare-fun tp_is_empty!9691 () Bool)

(assert (=> b!392890 (= e!237917 tp_is_empty!9691)))

(declare-fun b!392891 () Bool)

(declare-fun res!225032 () Bool)

(declare-fun e!237914 () Bool)

(assert (=> b!392891 (=> (not res!225032) (not e!237914))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392891 (= res!225032 (validKeyInArray!0 k0!778))))

(declare-fun b!392892 () Bool)

(declare-fun e!237912 () Bool)

(declare-fun e!237913 () Bool)

(assert (=> b!392892 (= e!237912 (not e!237913))))

(declare-fun res!225034 () Bool)

(assert (=> b!392892 (=> res!225034 e!237913)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392892 (= res!225034 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!14027 0))(
  ( (V!14028 (val!4890 Int)) )
))
(declare-datatypes ((ValueCell!4502 0))(
  ( (ValueCellFull!4502 (v!7128 V!14027)) (EmptyCell!4502) )
))
(declare-datatypes ((array!23276 0))(
  ( (array!23277 (arr!11096 (Array (_ BitVec 32) ValueCell!4502)) (size!11448 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23276)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14027)

(declare-datatypes ((array!23278 0))(
  ( (array!23279 (arr!11097 (Array (_ BitVec 32) (_ BitVec 64))) (size!11449 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23278)

(declare-datatypes ((tuple2!6460 0))(
  ( (tuple2!6461 (_1!3241 (_ BitVec 64)) (_2!3241 V!14027)) )
))
(declare-datatypes ((List!6307 0))(
  ( (Nil!6304) (Cons!6303 (h!7159 tuple2!6460) (t!11469 List!6307)) )
))
(declare-datatypes ((ListLongMap!5375 0))(
  ( (ListLongMap!5376 (toList!2703 List!6307)) )
))
(declare-fun lt!185819 () ListLongMap!5375)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14027)

(declare-fun getCurrentListMap!2080 (array!23278 array!23276 (_ BitVec 32) (_ BitVec 32) V!14027 V!14027 (_ BitVec 32) Int) ListLongMap!5375)

(assert (=> b!392892 (= lt!185819 (getCurrentListMap!2080 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185822 () array!23278)

(declare-fun lt!185818 () array!23276)

(declare-fun lt!185815 () ListLongMap!5375)

(assert (=> b!392892 (= lt!185815 (getCurrentListMap!2080 lt!185822 lt!185818 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185813 () ListLongMap!5375)

(declare-fun lt!185820 () ListLongMap!5375)

(assert (=> b!392892 (and (= lt!185813 lt!185820) (= lt!185820 lt!185813))))

(declare-fun lt!185816 () ListLongMap!5375)

(declare-fun lt!185810 () tuple2!6460)

(declare-fun +!1057 (ListLongMap!5375 tuple2!6460) ListLongMap!5375)

(assert (=> b!392892 (= lt!185820 (+!1057 lt!185816 lt!185810))))

(declare-fun v!373 () V!14027)

(assert (=> b!392892 (= lt!185810 (tuple2!6461 k0!778 v!373))))

(declare-datatypes ((Unit!11987 0))(
  ( (Unit!11988) )
))
(declare-fun lt!185811 () Unit!11987)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!271 (array!23278 array!23276 (_ BitVec 32) (_ BitVec 32) V!14027 V!14027 (_ BitVec 32) (_ BitVec 64) V!14027 (_ BitVec 32) Int) Unit!11987)

(assert (=> b!392892 (= lt!185811 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!271 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!969 (array!23278 array!23276 (_ BitVec 32) (_ BitVec 32) V!14027 V!14027 (_ BitVec 32) Int) ListLongMap!5375)

(assert (=> b!392892 (= lt!185813 (getCurrentListMapNoExtraKeys!969 lt!185822 lt!185818 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392892 (= lt!185818 (array!23277 (store (arr!11096 _values!506) i!548 (ValueCellFull!4502 v!373)) (size!11448 _values!506)))))

(assert (=> b!392892 (= lt!185816 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392893 () Bool)

(declare-fun res!225030 () Bool)

(assert (=> b!392893 (=> (not res!225030) (not e!237914))))

(assert (=> b!392893 (= res!225030 (or (= (select (arr!11097 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11097 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392894 () Bool)

(declare-fun res!225035 () Bool)

(assert (=> b!392894 (=> (not res!225035) (not e!237914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23278 (_ BitVec 32)) Bool)

(assert (=> b!392894 (= res!225035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!225031 () Bool)

(assert (=> start!38124 (=> (not res!225031) (not e!237914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38124 (= res!225031 (validMask!0 mask!970))))

(assert (=> start!38124 e!237914))

(declare-fun e!237916 () Bool)

(declare-fun array_inv!8198 (array!23276) Bool)

(assert (=> start!38124 (and (array_inv!8198 _values!506) e!237916)))

(assert (=> start!38124 tp!31838))

(assert (=> start!38124 true))

(assert (=> start!38124 tp_is_empty!9691))

(declare-fun array_inv!8199 (array!23278) Bool)

(assert (=> start!38124 (array_inv!8199 _keys!658)))

(declare-fun mapNonEmpty!16131 () Bool)

(declare-fun mapRes!16131 () Bool)

(declare-fun tp!31839 () Bool)

(declare-fun e!237910 () Bool)

(assert (=> mapNonEmpty!16131 (= mapRes!16131 (and tp!31839 e!237910))))

(declare-fun mapValue!16131 () ValueCell!4502)

(declare-fun mapKey!16131 () (_ BitVec 32))

(declare-fun mapRest!16131 () (Array (_ BitVec 32) ValueCell!4502))

(assert (=> mapNonEmpty!16131 (= (arr!11096 _values!506) (store mapRest!16131 mapKey!16131 mapValue!16131))))

(declare-fun b!392895 () Bool)

(declare-fun res!225028 () Bool)

(assert (=> b!392895 (=> (not res!225028) (not e!237912))))

(declare-datatypes ((List!6308 0))(
  ( (Nil!6305) (Cons!6304 (h!7160 (_ BitVec 64)) (t!11470 List!6308)) )
))
(declare-fun arrayNoDuplicates!0 (array!23278 (_ BitVec 32) List!6308) Bool)

(assert (=> b!392895 (= res!225028 (arrayNoDuplicates!0 lt!185822 #b00000000000000000000000000000000 Nil!6305))))

(declare-fun b!392896 () Bool)

(assert (=> b!392896 (= e!237914 e!237912)))

(declare-fun res!225036 () Bool)

(assert (=> b!392896 (=> (not res!225036) (not e!237912))))

(assert (=> b!392896 (= res!225036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185822 mask!970))))

(assert (=> b!392896 (= lt!185822 (array!23279 (store (arr!11097 _keys!658) i!548 k0!778) (size!11449 _keys!658)))))

(declare-fun b!392897 () Bool)

(assert (=> b!392897 (= e!237910 tp_is_empty!9691)))

(declare-fun b!392898 () Bool)

(declare-fun e!237915 () Bool)

(assert (=> b!392898 (= e!237915 true)))

(declare-fun lt!185821 () ListLongMap!5375)

(declare-fun lt!185817 () ListLongMap!5375)

(assert (=> b!392898 (= lt!185821 (+!1057 lt!185817 lt!185810))))

(declare-fun lt!185812 () Unit!11987)

(declare-fun addCommutativeForDiffKeys!345 (ListLongMap!5375 (_ BitVec 64) V!14027 (_ BitVec 64) V!14027) Unit!11987)

(assert (=> b!392898 (= lt!185812 (addCommutativeForDiffKeys!345 lt!185816 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392899 () Bool)

(assert (=> b!392899 (= e!237913 e!237915)))

(declare-fun res!225039 () Bool)

(assert (=> b!392899 (=> res!225039 e!237915)))

(assert (=> b!392899 (= res!225039 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!392899 (= lt!185819 lt!185817)))

(declare-fun lt!185814 () tuple2!6460)

(assert (=> b!392899 (= lt!185817 (+!1057 lt!185816 lt!185814))))

(assert (=> b!392899 (= lt!185815 lt!185821)))

(assert (=> b!392899 (= lt!185821 (+!1057 lt!185820 lt!185814))))

(assert (=> b!392899 (= lt!185815 (+!1057 lt!185813 lt!185814))))

(assert (=> b!392899 (= lt!185814 (tuple2!6461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392900 () Bool)

(declare-fun res!225037 () Bool)

(assert (=> b!392900 (=> (not res!225037) (not e!237914))))

(assert (=> b!392900 (= res!225037 (and (= (size!11448 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11449 _keys!658) (size!11448 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392901 () Bool)

(declare-fun res!225029 () Bool)

(assert (=> b!392901 (=> (not res!225029) (not e!237914))))

(assert (=> b!392901 (= res!225029 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6305))))

(declare-fun b!392902 () Bool)

(declare-fun res!225033 () Bool)

(assert (=> b!392902 (=> (not res!225033) (not e!237914))))

(declare-fun arrayContainsKey!0 (array!23278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392902 (= res!225033 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16131 () Bool)

(assert (=> mapIsEmpty!16131 mapRes!16131))

(declare-fun b!392903 () Bool)

(assert (=> b!392903 (= e!237916 (and e!237917 mapRes!16131))))

(declare-fun condMapEmpty!16131 () Bool)

(declare-fun mapDefault!16131 () ValueCell!4502)

(assert (=> b!392903 (= condMapEmpty!16131 (= (arr!11096 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4502)) mapDefault!16131)))))

(declare-fun b!392904 () Bool)

(declare-fun res!225038 () Bool)

(assert (=> b!392904 (=> (not res!225038) (not e!237914))))

(assert (=> b!392904 (= res!225038 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11449 _keys!658))))))

(assert (= (and start!38124 res!225031) b!392900))

(assert (= (and b!392900 res!225037) b!392894))

(assert (= (and b!392894 res!225035) b!392901))

(assert (= (and b!392901 res!225029) b!392904))

(assert (= (and b!392904 res!225038) b!392891))

(assert (= (and b!392891 res!225032) b!392893))

(assert (= (and b!392893 res!225030) b!392902))

(assert (= (and b!392902 res!225033) b!392896))

(assert (= (and b!392896 res!225036) b!392895))

(assert (= (and b!392895 res!225028) b!392892))

(assert (= (and b!392892 (not res!225034)) b!392899))

(assert (= (and b!392899 (not res!225039)) b!392898))

(assert (= (and b!392903 condMapEmpty!16131) mapIsEmpty!16131))

(assert (= (and b!392903 (not condMapEmpty!16131)) mapNonEmpty!16131))

(get-info :version)

(assert (= (and mapNonEmpty!16131 ((_ is ValueCellFull!4502) mapValue!16131)) b!392897))

(assert (= (and b!392903 ((_ is ValueCellFull!4502) mapDefault!16131)) b!392890))

(assert (= start!38124 b!392903))

(declare-fun m!389605 () Bool)

(assert (=> b!392894 m!389605))

(declare-fun m!389607 () Bool)

(assert (=> b!392892 m!389607))

(declare-fun m!389609 () Bool)

(assert (=> b!392892 m!389609))

(declare-fun m!389611 () Bool)

(assert (=> b!392892 m!389611))

(declare-fun m!389613 () Bool)

(assert (=> b!392892 m!389613))

(declare-fun m!389615 () Bool)

(assert (=> b!392892 m!389615))

(declare-fun m!389617 () Bool)

(assert (=> b!392892 m!389617))

(declare-fun m!389619 () Bool)

(assert (=> b!392892 m!389619))

(declare-fun m!389621 () Bool)

(assert (=> mapNonEmpty!16131 m!389621))

(declare-fun m!389623 () Bool)

(assert (=> b!392898 m!389623))

(declare-fun m!389625 () Bool)

(assert (=> b!392898 m!389625))

(declare-fun m!389627 () Bool)

(assert (=> b!392901 m!389627))

(declare-fun m!389629 () Bool)

(assert (=> b!392896 m!389629))

(declare-fun m!389631 () Bool)

(assert (=> b!392896 m!389631))

(declare-fun m!389633 () Bool)

(assert (=> b!392902 m!389633))

(declare-fun m!389635 () Bool)

(assert (=> b!392893 m!389635))

(declare-fun m!389637 () Bool)

(assert (=> start!38124 m!389637))

(declare-fun m!389639 () Bool)

(assert (=> start!38124 m!389639))

(declare-fun m!389641 () Bool)

(assert (=> start!38124 m!389641))

(declare-fun m!389643 () Bool)

(assert (=> b!392891 m!389643))

(declare-fun m!389645 () Bool)

(assert (=> b!392895 m!389645))

(declare-fun m!389647 () Bool)

(assert (=> b!392899 m!389647))

(declare-fun m!389649 () Bool)

(assert (=> b!392899 m!389649))

(declare-fun m!389651 () Bool)

(assert (=> b!392899 m!389651))

(check-sat (not b!392896) (not b!392898) (not b!392902) b_and!16395 (not start!38124) (not b!392891) (not b!392894) tp_is_empty!9691 (not mapNonEmpty!16131) (not b!392901) (not b_next!9019) (not b!392892) (not b!392899) (not b!392895))
(check-sat b_and!16395 (not b_next!9019))
