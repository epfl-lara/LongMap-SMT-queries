; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37122 () Bool)

(assert start!37122)

(declare-fun b_free!8263 () Bool)

(declare-fun b_next!8263 () Bool)

(assert (=> start!37122 (= b_free!8263 (not b_next!8263))))

(declare-fun tp!29505 () Bool)

(declare-fun b_and!15479 () Bool)

(assert (=> start!37122 (= tp!29505 b_and!15479)))

(declare-fun b!374081 () Bool)

(declare-fun e!227983 () Bool)

(declare-fun e!227979 () Bool)

(declare-fun mapRes!14931 () Bool)

(assert (=> b!374081 (= e!227983 (and e!227979 mapRes!14931))))

(declare-fun condMapEmpty!14931 () Bool)

(declare-datatypes ((V!12987 0))(
  ( (V!12988 (val!4500 Int)) )
))
(declare-datatypes ((ValueCell!4112 0))(
  ( (ValueCellFull!4112 (v!6691 V!12987)) (EmptyCell!4112) )
))
(declare-datatypes ((array!21739 0))(
  ( (array!21740 (arr!10338 (Array (_ BitVec 32) ValueCell!4112)) (size!10691 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21739)

(declare-fun mapDefault!14931 () ValueCell!4112)

(assert (=> b!374081 (= condMapEmpty!14931 (= (arr!10338 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4112)) mapDefault!14931)))))

(declare-fun b!374082 () Bool)

(declare-fun e!227978 () Bool)

(declare-fun e!227982 () Bool)

(assert (=> b!374082 (= e!227978 e!227982)))

(declare-fun res!210956 () Bool)

(assert (=> b!374082 (=> res!210956 e!227982)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!374082 (= res!210956 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5950 0))(
  ( (tuple2!5951 (_1!2986 (_ BitVec 64)) (_2!2986 V!12987)) )
))
(declare-datatypes ((List!5785 0))(
  ( (Nil!5782) (Cons!5781 (h!6637 tuple2!5950) (t!10926 List!5785)) )
))
(declare-datatypes ((ListLongMap!4853 0))(
  ( (ListLongMap!4854 (toList!2442 List!5785)) )
))
(declare-fun lt!172283 () ListLongMap!4853)

(declare-fun lt!172285 () ListLongMap!4853)

(assert (=> b!374082 (= lt!172283 lt!172285)))

(declare-fun lt!172278 () ListLongMap!4853)

(declare-fun lt!172288 () tuple2!5950)

(declare-fun +!810 (ListLongMap!4853 tuple2!5950) ListLongMap!4853)

(assert (=> b!374082 (= lt!172285 (+!810 lt!172278 lt!172288))))

(declare-fun v!373 () V!12987)

(declare-fun lt!172290 () ListLongMap!4853)

(declare-fun zeroValue!472 () V!12987)

(declare-datatypes ((Unit!11492 0))(
  ( (Unit!11493) )
))
(declare-fun lt!172284 () Unit!11492)

(declare-fun addCommutativeForDiffKeys!227 (ListLongMap!4853 (_ BitVec 64) V!12987 (_ BitVec 64) V!12987) Unit!11492)

(assert (=> b!374082 (= lt!172284 (addCommutativeForDiffKeys!227 lt!172290 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172279 () ListLongMap!4853)

(declare-fun lt!172291 () tuple2!5950)

(assert (=> b!374082 (= lt!172279 (+!810 lt!172283 lt!172291))))

(declare-fun lt!172280 () ListLongMap!4853)

(declare-fun lt!172281 () tuple2!5950)

(assert (=> b!374082 (= lt!172283 (+!810 lt!172280 lt!172281))))

(declare-fun lt!172286 () ListLongMap!4853)

(declare-fun lt!172287 () ListLongMap!4853)

(assert (=> b!374082 (= lt!172286 lt!172287)))

(assert (=> b!374082 (= lt!172287 (+!810 lt!172278 lt!172291))))

(assert (=> b!374082 (= lt!172278 (+!810 lt!172290 lt!172281))))

(declare-fun lt!172292 () ListLongMap!4853)

(assert (=> b!374082 (= lt!172279 (+!810 (+!810 lt!172292 lt!172281) lt!172291))))

(declare-fun minValue!472 () V!12987)

(assert (=> b!374082 (= lt!172291 (tuple2!5951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374082 (= lt!172281 (tuple2!5951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!14931 () Bool)

(assert (=> mapIsEmpty!14931 mapRes!14931))

(declare-fun b!374084 () Bool)

(declare-fun res!210955 () Bool)

(declare-fun e!227981 () Bool)

(assert (=> b!374084 (=> (not res!210955) (not e!227981))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!21741 0))(
  ( (array!21742 (arr!10339 (Array (_ BitVec 32) (_ BitVec 64))) (size!10692 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21741)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!374084 (= res!210955 (and (= (size!10691 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10692 _keys!658) (size!10691 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374085 () Bool)

(declare-fun res!210946 () Bool)

(assert (=> b!374085 (=> (not res!210946) (not e!227981))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374085 (= res!210946 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10692 _keys!658))))))

(declare-fun mapNonEmpty!14931 () Bool)

(declare-fun tp!29504 () Bool)

(declare-fun e!227984 () Bool)

(assert (=> mapNonEmpty!14931 (= mapRes!14931 (and tp!29504 e!227984))))

(declare-fun mapRest!14931 () (Array (_ BitVec 32) ValueCell!4112))

(declare-fun mapValue!14931 () ValueCell!4112)

(declare-fun mapKey!14931 () (_ BitVec 32))

(assert (=> mapNonEmpty!14931 (= (arr!10338 _values!506) (store mapRest!14931 mapKey!14931 mapValue!14931))))

(declare-fun b!374086 () Bool)

(declare-fun res!210950 () Bool)

(assert (=> b!374086 (=> (not res!210950) (not e!227981))))

(declare-datatypes ((List!5786 0))(
  ( (Nil!5783) (Cons!5782 (h!6638 (_ BitVec 64)) (t!10927 List!5786)) )
))
(declare-fun arrayNoDuplicates!0 (array!21741 (_ BitVec 32) List!5786) Bool)

(assert (=> b!374086 (= res!210950 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5783))))

(declare-fun b!374087 () Bool)

(declare-fun tp_is_empty!8911 () Bool)

(assert (=> b!374087 (= e!227984 tp_is_empty!8911)))

(declare-fun b!374088 () Bool)

(declare-fun res!210951 () Bool)

(assert (=> b!374088 (=> (not res!210951) (not e!227981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21741 (_ BitVec 32)) Bool)

(assert (=> b!374088 (= res!210951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374089 () Bool)

(assert (=> b!374089 (= e!227982 (bvsle #b00000000000000000000000000000000 (size!10692 _keys!658)))))

(assert (=> b!374089 (= (+!810 lt!172285 lt!172291) (+!810 lt!172287 lt!172288))))

(declare-fun lt!172277 () Unit!11492)

(assert (=> b!374089 (= lt!172277 (addCommutativeForDiffKeys!227 lt!172278 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374090 () Bool)

(declare-fun res!210948 () Bool)

(assert (=> b!374090 (=> (not res!210948) (not e!227981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374090 (= res!210948 (validKeyInArray!0 k0!778))))

(declare-fun b!374091 () Bool)

(declare-fun e!227980 () Bool)

(assert (=> b!374091 (= e!227980 (not e!227978))))

(declare-fun res!210954 () Bool)

(assert (=> b!374091 (=> res!210954 e!227978)))

(assert (=> b!374091 (= res!210954 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1862 (array!21741 array!21739 (_ BitVec 32) (_ BitVec 32) V!12987 V!12987 (_ BitVec 32) Int) ListLongMap!4853)

(assert (=> b!374091 (= lt!172286 (getCurrentListMap!1862 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172289 () array!21741)

(declare-fun lt!172293 () array!21739)

(assert (=> b!374091 (= lt!172279 (getCurrentListMap!1862 lt!172289 lt!172293 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374091 (and (= lt!172292 lt!172280) (= lt!172280 lt!172292))))

(assert (=> b!374091 (= lt!172280 (+!810 lt!172290 lt!172288))))

(assert (=> b!374091 (= lt!172288 (tuple2!5951 k0!778 v!373))))

(declare-fun lt!172282 () Unit!11492)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!55 (array!21741 array!21739 (_ BitVec 32) (_ BitVec 32) V!12987 V!12987 (_ BitVec 32) (_ BitVec 64) V!12987 (_ BitVec 32) Int) Unit!11492)

(assert (=> b!374091 (= lt!172282 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!55 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!727 (array!21741 array!21739 (_ BitVec 32) (_ BitVec 32) V!12987 V!12987 (_ BitVec 32) Int) ListLongMap!4853)

(assert (=> b!374091 (= lt!172292 (getCurrentListMapNoExtraKeys!727 lt!172289 lt!172293 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374091 (= lt!172293 (array!21740 (store (arr!10338 _values!506) i!548 (ValueCellFull!4112 v!373)) (size!10691 _values!506)))))

(assert (=> b!374091 (= lt!172290 (getCurrentListMapNoExtraKeys!727 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374083 () Bool)

(assert (=> b!374083 (= e!227981 e!227980)))

(declare-fun res!210947 () Bool)

(assert (=> b!374083 (=> (not res!210947) (not e!227980))))

(assert (=> b!374083 (= res!210947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172289 mask!970))))

(assert (=> b!374083 (= lt!172289 (array!21742 (store (arr!10339 _keys!658) i!548 k0!778) (size!10692 _keys!658)))))

(declare-fun res!210949 () Bool)

(assert (=> start!37122 (=> (not res!210949) (not e!227981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37122 (= res!210949 (validMask!0 mask!970))))

(assert (=> start!37122 e!227981))

(declare-fun array_inv!7626 (array!21739) Bool)

(assert (=> start!37122 (and (array_inv!7626 _values!506) e!227983)))

(assert (=> start!37122 tp!29505))

(assert (=> start!37122 true))

(assert (=> start!37122 tp_is_empty!8911))

(declare-fun array_inv!7627 (array!21741) Bool)

(assert (=> start!37122 (array_inv!7627 _keys!658)))

(declare-fun b!374092 () Bool)

(declare-fun res!210953 () Bool)

(assert (=> b!374092 (=> (not res!210953) (not e!227980))))

(assert (=> b!374092 (= res!210953 (arrayNoDuplicates!0 lt!172289 #b00000000000000000000000000000000 Nil!5783))))

(declare-fun b!374093 () Bool)

(declare-fun res!210952 () Bool)

(assert (=> b!374093 (=> (not res!210952) (not e!227981))))

(assert (=> b!374093 (= res!210952 (or (= (select (arr!10339 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10339 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374094 () Bool)

(assert (=> b!374094 (= e!227979 tp_is_empty!8911)))

(declare-fun b!374095 () Bool)

(declare-fun res!210945 () Bool)

(assert (=> b!374095 (=> (not res!210945) (not e!227981))))

(declare-fun arrayContainsKey!0 (array!21741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374095 (= res!210945 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37122 res!210949) b!374084))

(assert (= (and b!374084 res!210955) b!374088))

(assert (= (and b!374088 res!210951) b!374086))

(assert (= (and b!374086 res!210950) b!374085))

(assert (= (and b!374085 res!210946) b!374090))

(assert (= (and b!374090 res!210948) b!374093))

(assert (= (and b!374093 res!210952) b!374095))

(assert (= (and b!374095 res!210945) b!374083))

(assert (= (and b!374083 res!210947) b!374092))

(assert (= (and b!374092 res!210953) b!374091))

(assert (= (and b!374091 (not res!210954)) b!374082))

(assert (= (and b!374082 (not res!210956)) b!374089))

(assert (= (and b!374081 condMapEmpty!14931) mapIsEmpty!14931))

(assert (= (and b!374081 (not condMapEmpty!14931)) mapNonEmpty!14931))

(get-info :version)

(assert (= (and mapNonEmpty!14931 ((_ is ValueCellFull!4112) mapValue!14931)) b!374087))

(assert (= (and b!374081 ((_ is ValueCellFull!4112) mapDefault!14931)) b!374094))

(assert (= start!37122 b!374081))

(declare-fun m!369851 () Bool)

(assert (=> b!374088 m!369851))

(declare-fun m!369853 () Bool)

(assert (=> b!374082 m!369853))

(declare-fun m!369855 () Bool)

(assert (=> b!374082 m!369855))

(declare-fun m!369857 () Bool)

(assert (=> b!374082 m!369857))

(declare-fun m!369859 () Bool)

(assert (=> b!374082 m!369859))

(declare-fun m!369861 () Bool)

(assert (=> b!374082 m!369861))

(declare-fun m!369863 () Bool)

(assert (=> b!374082 m!369863))

(assert (=> b!374082 m!369861))

(declare-fun m!369865 () Bool)

(assert (=> b!374082 m!369865))

(declare-fun m!369867 () Bool)

(assert (=> b!374082 m!369867))

(declare-fun m!369869 () Bool)

(assert (=> b!374083 m!369869))

(declare-fun m!369871 () Bool)

(assert (=> b!374083 m!369871))

(declare-fun m!369873 () Bool)

(assert (=> b!374090 m!369873))

(declare-fun m!369875 () Bool)

(assert (=> b!374086 m!369875))

(declare-fun m!369877 () Bool)

(assert (=> b!374091 m!369877))

(declare-fun m!369879 () Bool)

(assert (=> b!374091 m!369879))

(declare-fun m!369881 () Bool)

(assert (=> b!374091 m!369881))

(declare-fun m!369883 () Bool)

(assert (=> b!374091 m!369883))

(declare-fun m!369885 () Bool)

(assert (=> b!374091 m!369885))

(declare-fun m!369887 () Bool)

(assert (=> b!374091 m!369887))

(declare-fun m!369889 () Bool)

(assert (=> b!374091 m!369889))

(declare-fun m!369891 () Bool)

(assert (=> b!374092 m!369891))

(declare-fun m!369893 () Bool)

(assert (=> b!374095 m!369893))

(declare-fun m!369895 () Bool)

(assert (=> b!374093 m!369895))

(declare-fun m!369897 () Bool)

(assert (=> b!374089 m!369897))

(declare-fun m!369899 () Bool)

(assert (=> b!374089 m!369899))

(declare-fun m!369901 () Bool)

(assert (=> b!374089 m!369901))

(declare-fun m!369903 () Bool)

(assert (=> start!37122 m!369903))

(declare-fun m!369905 () Bool)

(assert (=> start!37122 m!369905))

(declare-fun m!369907 () Bool)

(assert (=> start!37122 m!369907))

(declare-fun m!369909 () Bool)

(assert (=> mapNonEmpty!14931 m!369909))

(check-sat tp_is_empty!8911 (not b!374090) (not b!374082) (not b!374095) (not b!374083) (not b!374086) (not start!37122) (not b!374092) b_and!15479 (not b!374088) (not mapNonEmpty!14931) (not b_next!8263) (not b!374091) (not b!374089))
(check-sat b_and!15479 (not b_next!8263))
