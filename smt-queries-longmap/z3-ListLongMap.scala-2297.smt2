; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37246 () Bool)

(assert start!37246)

(declare-fun b_free!8373 () Bool)

(declare-fun b_next!8373 () Bool)

(assert (=> start!37246 (= b_free!8373 (not b_next!8373))))

(declare-fun tp!29835 () Bool)

(declare-fun b_and!15615 () Bool)

(assert (=> start!37246 (= tp!29835 b_and!15615)))

(declare-fun b!376836 () Bool)

(declare-fun e!229474 () Bool)

(declare-fun tp_is_empty!9021 () Bool)

(assert (=> b!376836 (= e!229474 tp_is_empty!9021)))

(declare-fun b!376837 () Bool)

(declare-fun e!229471 () Bool)

(declare-fun mapRes!15096 () Bool)

(assert (=> b!376837 (= e!229471 (and e!229474 mapRes!15096))))

(declare-fun condMapEmpty!15096 () Bool)

(declare-datatypes ((V!13133 0))(
  ( (V!13134 (val!4555 Int)) )
))
(declare-datatypes ((ValueCell!4167 0))(
  ( (ValueCellFull!4167 (v!6752 V!13133)) (EmptyCell!4167) )
))
(declare-datatypes ((array!21971 0))(
  ( (array!21972 (arr!10454 (Array (_ BitVec 32) ValueCell!4167)) (size!10806 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21971)

(declare-fun mapDefault!15096 () ValueCell!4167)

(assert (=> b!376837 (= condMapEmpty!15096 (= (arr!10454 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4167)) mapDefault!15096)))))

(declare-fun b!376838 () Bool)

(declare-fun res!213064 () Bool)

(declare-fun e!229476 () Bool)

(assert (=> b!376838 (=> (not res!213064) (not e!229476))))

(declare-datatypes ((array!21973 0))(
  ( (array!21974 (arr!10455 (Array (_ BitVec 32) (_ BitVec 64))) (size!10807 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21973)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21973 (_ BitVec 32)) Bool)

(assert (=> b!376838 (= res!213064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376839 () Bool)

(declare-fun res!213066 () Bool)

(assert (=> b!376839 (=> (not res!213066) (not e!229476))))

(declare-datatypes ((List!5909 0))(
  ( (Nil!5906) (Cons!5905 (h!6761 (_ BitVec 64)) (t!11059 List!5909)) )
))
(declare-fun arrayNoDuplicates!0 (array!21973 (_ BitVec 32) List!5909) Bool)

(assert (=> b!376839 (= res!213066 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5906))))

(declare-fun res!213070 () Bool)

(assert (=> start!37246 (=> (not res!213070) (not e!229476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37246 (= res!213070 (validMask!0 mask!970))))

(assert (=> start!37246 e!229476))

(declare-fun array_inv!7704 (array!21971) Bool)

(assert (=> start!37246 (and (array_inv!7704 _values!506) e!229471)))

(assert (=> start!37246 tp!29835))

(assert (=> start!37246 true))

(assert (=> start!37246 tp_is_empty!9021))

(declare-fun array_inv!7705 (array!21973) Bool)

(assert (=> start!37246 (array_inv!7705 _keys!658)))

(declare-fun b!376840 () Bool)

(declare-fun e!229472 () Bool)

(declare-fun e!229478 () Bool)

(assert (=> b!376840 (= e!229472 (not e!229478))))

(declare-fun res!213065 () Bool)

(assert (=> b!376840 (=> res!213065 e!229478)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376840 (= res!213065 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6068 0))(
  ( (tuple2!6069 (_1!3045 (_ BitVec 64)) (_2!3045 V!13133)) )
))
(declare-datatypes ((List!5910 0))(
  ( (Nil!5907) (Cons!5906 (h!6762 tuple2!6068) (t!11060 List!5910)) )
))
(declare-datatypes ((ListLongMap!4981 0))(
  ( (ListLongMap!4982 (toList!2506 List!5910)) )
))
(declare-fun lt!174973 () ListLongMap!4981)

(declare-fun zeroValue!472 () V!13133)

(declare-fun minValue!472 () V!13133)

(declare-fun getCurrentListMap!1939 (array!21973 array!21971 (_ BitVec 32) (_ BitVec 32) V!13133 V!13133 (_ BitVec 32) Int) ListLongMap!4981)

(assert (=> b!376840 (= lt!174973 (getCurrentListMap!1939 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174982 () array!21973)

(declare-fun lt!174977 () array!21971)

(declare-fun lt!174978 () ListLongMap!4981)

(assert (=> b!376840 (= lt!174978 (getCurrentListMap!1939 lt!174982 lt!174977 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174972 () ListLongMap!4981)

(declare-fun lt!174976 () ListLongMap!4981)

(assert (=> b!376840 (and (= lt!174972 lt!174976) (= lt!174976 lt!174972))))

(declare-fun lt!174980 () ListLongMap!4981)

(declare-fun lt!174975 () tuple2!6068)

(declare-fun +!852 (ListLongMap!4981 tuple2!6068) ListLongMap!4981)

(assert (=> b!376840 (= lt!174976 (+!852 lt!174980 lt!174975))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13133)

(assert (=> b!376840 (= lt!174975 (tuple2!6069 k0!778 v!373))))

(declare-datatypes ((Unit!11608 0))(
  ( (Unit!11609) )
))
(declare-fun lt!174979 () Unit!11608)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!97 (array!21973 array!21971 (_ BitVec 32) (_ BitVec 32) V!13133 V!13133 (_ BitVec 32) (_ BitVec 64) V!13133 (_ BitVec 32) Int) Unit!11608)

(assert (=> b!376840 (= lt!174979 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!97 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!773 (array!21973 array!21971 (_ BitVec 32) (_ BitVec 32) V!13133 V!13133 (_ BitVec 32) Int) ListLongMap!4981)

(assert (=> b!376840 (= lt!174972 (getCurrentListMapNoExtraKeys!773 lt!174982 lt!174977 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376840 (= lt!174977 (array!21972 (store (arr!10454 _values!506) i!548 (ValueCellFull!4167 v!373)) (size!10806 _values!506)))))

(assert (=> b!376840 (= lt!174980 (getCurrentListMapNoExtraKeys!773 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15096 () Bool)

(assert (=> mapIsEmpty!15096 mapRes!15096))

(declare-fun b!376841 () Bool)

(declare-fun res!213063 () Bool)

(assert (=> b!376841 (=> (not res!213063) (not e!229472))))

(assert (=> b!376841 (= res!213063 (arrayNoDuplicates!0 lt!174982 #b00000000000000000000000000000000 Nil!5906))))

(declare-fun b!376842 () Bool)

(declare-fun res!213071 () Bool)

(assert (=> b!376842 (=> (not res!213071) (not e!229476))))

(declare-fun arrayContainsKey!0 (array!21973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376842 (= res!213071 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376843 () Bool)

(declare-fun e!229475 () Bool)

(assert (=> b!376843 (= e!229475 true)))

(declare-fun lt!174983 () ListLongMap!4981)

(declare-fun lt!174981 () ListLongMap!4981)

(assert (=> b!376843 (= lt!174983 (+!852 lt!174981 lt!174975))))

(declare-fun lt!174984 () Unit!11608)

(declare-fun addCommutativeForDiffKeys!263 (ListLongMap!4981 (_ BitVec 64) V!13133 (_ BitVec 64) V!13133) Unit!11608)

(assert (=> b!376843 (= lt!174984 (addCommutativeForDiffKeys!263 lt!174980 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376844 () Bool)

(assert (=> b!376844 (= e!229476 e!229472)))

(declare-fun res!213074 () Bool)

(assert (=> b!376844 (=> (not res!213074) (not e!229472))))

(assert (=> b!376844 (= res!213074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174982 mask!970))))

(assert (=> b!376844 (= lt!174982 (array!21974 (store (arr!10455 _keys!658) i!548 k0!778) (size!10807 _keys!658)))))

(declare-fun b!376845 () Bool)

(assert (=> b!376845 (= e!229478 e!229475)))

(declare-fun res!213067 () Bool)

(assert (=> b!376845 (=> res!213067 e!229475)))

(assert (=> b!376845 (= res!213067 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376845 (= lt!174978 lt!174983)))

(declare-fun lt!174974 () tuple2!6068)

(assert (=> b!376845 (= lt!174983 (+!852 lt!174976 lt!174974))))

(assert (=> b!376845 (= lt!174973 lt!174981)))

(assert (=> b!376845 (= lt!174981 (+!852 lt!174980 lt!174974))))

(assert (=> b!376845 (= lt!174978 (+!852 lt!174972 lt!174974))))

(assert (=> b!376845 (= lt!174974 (tuple2!6069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15096 () Bool)

(declare-fun tp!29834 () Bool)

(declare-fun e!229477 () Bool)

(assert (=> mapNonEmpty!15096 (= mapRes!15096 (and tp!29834 e!229477))))

(declare-fun mapKey!15096 () (_ BitVec 32))

(declare-fun mapValue!15096 () ValueCell!4167)

(declare-fun mapRest!15096 () (Array (_ BitVec 32) ValueCell!4167))

(assert (=> mapNonEmpty!15096 (= (arr!10454 _values!506) (store mapRest!15096 mapKey!15096 mapValue!15096))))

(declare-fun b!376846 () Bool)

(declare-fun res!213072 () Bool)

(assert (=> b!376846 (=> (not res!213072) (not e!229476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376846 (= res!213072 (validKeyInArray!0 k0!778))))

(declare-fun b!376847 () Bool)

(assert (=> b!376847 (= e!229477 tp_is_empty!9021)))

(declare-fun b!376848 () Bool)

(declare-fun res!213069 () Bool)

(assert (=> b!376848 (=> (not res!213069) (not e!229476))))

(assert (=> b!376848 (= res!213069 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10807 _keys!658))))))

(declare-fun b!376849 () Bool)

(declare-fun res!213068 () Bool)

(assert (=> b!376849 (=> (not res!213068) (not e!229476))))

(assert (=> b!376849 (= res!213068 (or (= (select (arr!10455 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10455 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376850 () Bool)

(declare-fun res!213073 () Bool)

(assert (=> b!376850 (=> (not res!213073) (not e!229476))))

(assert (=> b!376850 (= res!213073 (and (= (size!10806 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10807 _keys!658) (size!10806 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37246 res!213070) b!376850))

(assert (= (and b!376850 res!213073) b!376838))

(assert (= (and b!376838 res!213064) b!376839))

(assert (= (and b!376839 res!213066) b!376848))

(assert (= (and b!376848 res!213069) b!376846))

(assert (= (and b!376846 res!213072) b!376849))

(assert (= (and b!376849 res!213068) b!376842))

(assert (= (and b!376842 res!213071) b!376844))

(assert (= (and b!376844 res!213074) b!376841))

(assert (= (and b!376841 res!213063) b!376840))

(assert (= (and b!376840 (not res!213065)) b!376845))

(assert (= (and b!376845 (not res!213067)) b!376843))

(assert (= (and b!376837 condMapEmpty!15096) mapIsEmpty!15096))

(assert (= (and b!376837 (not condMapEmpty!15096)) mapNonEmpty!15096))

(get-info :version)

(assert (= (and mapNonEmpty!15096 ((_ is ValueCellFull!4167) mapValue!15096)) b!376847))

(assert (= (and b!376837 ((_ is ValueCellFull!4167) mapDefault!15096)) b!376836))

(assert (= start!37246 b!376837))

(declare-fun m!373563 () Bool)

(assert (=> b!376846 m!373563))

(declare-fun m!373565 () Bool)

(assert (=> start!37246 m!373565))

(declare-fun m!373567 () Bool)

(assert (=> start!37246 m!373567))

(declare-fun m!373569 () Bool)

(assert (=> start!37246 m!373569))

(declare-fun m!373571 () Bool)

(assert (=> b!376843 m!373571))

(declare-fun m!373573 () Bool)

(assert (=> b!376843 m!373573))

(declare-fun m!373575 () Bool)

(assert (=> b!376849 m!373575))

(declare-fun m!373577 () Bool)

(assert (=> b!376845 m!373577))

(declare-fun m!373579 () Bool)

(assert (=> b!376845 m!373579))

(declare-fun m!373581 () Bool)

(assert (=> b!376845 m!373581))

(declare-fun m!373583 () Bool)

(assert (=> b!376838 m!373583))

(declare-fun m!373585 () Bool)

(assert (=> b!376840 m!373585))

(declare-fun m!373587 () Bool)

(assert (=> b!376840 m!373587))

(declare-fun m!373589 () Bool)

(assert (=> b!376840 m!373589))

(declare-fun m!373591 () Bool)

(assert (=> b!376840 m!373591))

(declare-fun m!373593 () Bool)

(assert (=> b!376840 m!373593))

(declare-fun m!373595 () Bool)

(assert (=> b!376840 m!373595))

(declare-fun m!373597 () Bool)

(assert (=> b!376840 m!373597))

(declare-fun m!373599 () Bool)

(assert (=> b!376839 m!373599))

(declare-fun m!373601 () Bool)

(assert (=> b!376841 m!373601))

(declare-fun m!373603 () Bool)

(assert (=> mapNonEmpty!15096 m!373603))

(declare-fun m!373605 () Bool)

(assert (=> b!376844 m!373605))

(declare-fun m!373607 () Bool)

(assert (=> b!376844 m!373607))

(declare-fun m!373609 () Bool)

(assert (=> b!376842 m!373609))

(check-sat (not b!376844) b_and!15615 (not b!376840) (not b!376841) (not mapNonEmpty!15096) (not b!376839) (not b!376846) tp_is_empty!9021 (not b!376845) (not b!376842) (not b!376838) (not b!376843) (not start!37246) (not b_next!8373))
(check-sat b_and!15615 (not b_next!8373))
