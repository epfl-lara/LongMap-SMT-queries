; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113374 () Bool)

(assert start!113374)

(declare-fun b_free!31425 () Bool)

(declare-fun b_next!31425 () Bool)

(assert (=> start!113374 (= b_free!31425 (not b_next!31425))))

(declare-fun tp!110079 () Bool)

(declare-fun b_and!50703 () Bool)

(assert (=> start!113374 (= tp!110079 b_and!50703)))

(declare-fun b!1345754 () Bool)

(declare-fun e!765734 () Bool)

(assert (=> b!1345754 (= e!765734 (not true))))

(declare-datatypes ((V!55003 0))(
  ( (V!55004 (val!18787 Int)) )
))
(declare-datatypes ((tuple2!24218 0))(
  ( (tuple2!24219 (_1!12120 (_ BitVec 64)) (_2!12120 V!55003)) )
))
(declare-datatypes ((List!31374 0))(
  ( (Nil!31371) (Cons!31370 (h!32579 tuple2!24218) (t!45956 List!31374)) )
))
(declare-datatypes ((ListLongMap!21875 0))(
  ( (ListLongMap!21876 (toList!10953 List!31374)) )
))
(declare-fun lt!595414 () ListLongMap!21875)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9129 (ListLongMap!21875 (_ BitVec 64)) Bool)

(assert (=> b!1345754 (contains!9129 lt!595414 k0!1142)))

(declare-datatypes ((array!91690 0))(
  ( (array!91691 (arr!44301 (Array (_ BitVec 32) (_ BitVec 64))) (size!44851 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91690)

(declare-datatypes ((Unit!44137 0))(
  ( (Unit!44138) )
))
(declare-fun lt!595416 () Unit!44137)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!595415 () V!55003)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!399 ((_ BitVec 64) (_ BitVec 64) V!55003 ListLongMap!21875) Unit!44137)

(assert (=> b!1345754 (= lt!595416 (lemmaInListMapAfterAddingDiffThenInBefore!399 k0!1142 (select (arr!44301 _keys!1571) from!1960) lt!595415 lt!595414))))

(declare-fun b!1345755 () Bool)

(declare-fun e!765737 () Bool)

(declare-fun tp_is_empty!37425 () Bool)

(assert (=> b!1345755 (= e!765737 tp_is_empty!37425)))

(declare-fun b!1345756 () Bool)

(declare-fun res!892976 () Bool)

(declare-fun e!765733 () Bool)

(assert (=> b!1345756 (=> (not res!892976) (not e!765733))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345756 (= res!892976 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!57844 () Bool)

(declare-fun mapRes!57844 () Bool)

(assert (=> mapIsEmpty!57844 mapRes!57844))

(declare-fun b!1345757 () Bool)

(declare-fun res!892982 () Bool)

(assert (=> b!1345757 (=> (not res!892982) (not e!765734))))

(assert (=> b!1345757 (= res!892982 (not (= k0!1142 (select (arr!44301 _keys!1571) from!1960))))))

(declare-fun b!1345758 () Bool)

(declare-fun res!892983 () Bool)

(assert (=> b!1345758 (=> (not res!892983) (not e!765733))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91690 (_ BitVec 32)) Bool)

(assert (=> b!1345758 (= res!892983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345759 () Bool)

(declare-fun res!892981 () Bool)

(assert (=> b!1345759 (=> (not res!892981) (not e!765733))))

(declare-fun minValue!1245 () V!55003)

(declare-fun zeroValue!1245 () V!55003)

(declare-datatypes ((ValueCell!17814 0))(
  ( (ValueCellFull!17814 (v!21435 V!55003)) (EmptyCell!17814) )
))
(declare-datatypes ((array!91692 0))(
  ( (array!91693 (arr!44302 (Array (_ BitVec 32) ValueCell!17814)) (size!44852 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91692)

(declare-fun defaultEntry!1306 () Int)

(declare-fun getCurrentListMap!5906 (array!91690 array!91692 (_ BitVec 32) (_ BitVec 32) V!55003 V!55003 (_ BitVec 32) Int) ListLongMap!21875)

(assert (=> b!1345759 (= res!892981 (contains!9129 (getCurrentListMap!5906 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345760 () Bool)

(declare-fun e!765735 () Bool)

(assert (=> b!1345760 (= e!765735 tp_is_empty!37425)))

(declare-fun b!1345761 () Bool)

(declare-fun res!892974 () Bool)

(assert (=> b!1345761 (=> (not res!892974) (not e!765733))))

(declare-datatypes ((List!31375 0))(
  ( (Nil!31372) (Cons!31371 (h!32580 (_ BitVec 64)) (t!45957 List!31375)) )
))
(declare-fun arrayNoDuplicates!0 (array!91690 (_ BitVec 32) List!31375) Bool)

(assert (=> b!1345761 (= res!892974 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31372))))

(declare-fun res!892973 () Bool)

(assert (=> start!113374 (=> (not res!892973) (not e!765733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113374 (= res!892973 (validMask!0 mask!1977))))

(assert (=> start!113374 e!765733))

(assert (=> start!113374 tp_is_empty!37425))

(assert (=> start!113374 true))

(declare-fun array_inv!33381 (array!91690) Bool)

(assert (=> start!113374 (array_inv!33381 _keys!1571)))

(declare-fun e!765732 () Bool)

(declare-fun array_inv!33382 (array!91692) Bool)

(assert (=> start!113374 (and (array_inv!33382 _values!1303) e!765732)))

(assert (=> start!113374 tp!110079))

(declare-fun b!1345762 () Bool)

(declare-fun res!892977 () Bool)

(assert (=> b!1345762 (=> (not res!892977) (not e!765733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345762 (= res!892977 (validKeyInArray!0 (select (arr!44301 _keys!1571) from!1960)))))

(declare-fun b!1345763 () Bool)

(declare-fun res!892975 () Bool)

(assert (=> b!1345763 (=> (not res!892975) (not e!765733))))

(assert (=> b!1345763 (= res!892975 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44851 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57844 () Bool)

(declare-fun tp!110080 () Bool)

(assert (=> mapNonEmpty!57844 (= mapRes!57844 (and tp!110080 e!765737))))

(declare-fun mapValue!57844 () ValueCell!17814)

(declare-fun mapRest!57844 () (Array (_ BitVec 32) ValueCell!17814))

(declare-fun mapKey!57844 () (_ BitVec 32))

(assert (=> mapNonEmpty!57844 (= (arr!44302 _values!1303) (store mapRest!57844 mapKey!57844 mapValue!57844))))

(declare-fun b!1345764 () Bool)

(declare-fun res!892979 () Bool)

(assert (=> b!1345764 (=> (not res!892979) (not e!765733))))

(assert (=> b!1345764 (= res!892979 (not (= (select (arr!44301 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345765 () Bool)

(declare-fun res!892978 () Bool)

(assert (=> b!1345765 (=> (not res!892978) (not e!765733))))

(assert (=> b!1345765 (= res!892978 (and (= (size!44852 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44851 _keys!1571) (size!44852 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345766 () Bool)

(assert (=> b!1345766 (= e!765732 (and e!765735 mapRes!57844))))

(declare-fun condMapEmpty!57844 () Bool)

(declare-fun mapDefault!57844 () ValueCell!17814)

(assert (=> b!1345766 (= condMapEmpty!57844 (= (arr!44302 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17814)) mapDefault!57844)))))

(declare-fun b!1345767 () Bool)

(assert (=> b!1345767 (= e!765733 e!765734)))

(declare-fun res!892980 () Bool)

(assert (=> b!1345767 (=> (not res!892980) (not e!765734))))

(declare-fun +!4834 (ListLongMap!21875 tuple2!24218) ListLongMap!21875)

(assert (=> b!1345767 (= res!892980 (contains!9129 (+!4834 lt!595414 (tuple2!24219 (select (arr!44301 _keys!1571) from!1960) lt!595415)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6476 (array!91690 array!91692 (_ BitVec 32) (_ BitVec 32) V!55003 V!55003 (_ BitVec 32) Int) ListLongMap!21875)

(assert (=> b!1345767 (= lt!595414 (getCurrentListMapNoExtraKeys!6476 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22381 (ValueCell!17814 V!55003) V!55003)

(declare-fun dynLambda!3773 (Int (_ BitVec 64)) V!55003)

(assert (=> b!1345767 (= lt!595415 (get!22381 (select (arr!44302 _values!1303) from!1960) (dynLambda!3773 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113374 res!892973) b!1345765))

(assert (= (and b!1345765 res!892978) b!1345758))

(assert (= (and b!1345758 res!892983) b!1345761))

(assert (= (and b!1345761 res!892974) b!1345763))

(assert (= (and b!1345763 res!892975) b!1345759))

(assert (= (and b!1345759 res!892981) b!1345764))

(assert (= (and b!1345764 res!892979) b!1345762))

(assert (= (and b!1345762 res!892977) b!1345756))

(assert (= (and b!1345756 res!892976) b!1345767))

(assert (= (and b!1345767 res!892980) b!1345757))

(assert (= (and b!1345757 res!892982) b!1345754))

(assert (= (and b!1345766 condMapEmpty!57844) mapIsEmpty!57844))

(assert (= (and b!1345766 (not condMapEmpty!57844)) mapNonEmpty!57844))

(get-info :version)

(assert (= (and mapNonEmpty!57844 ((_ is ValueCellFull!17814) mapValue!57844)) b!1345755))

(assert (= (and b!1345766 ((_ is ValueCellFull!17814) mapDefault!57844)) b!1345760))

(assert (= start!113374 b!1345766))

(declare-fun b_lambda!24547 () Bool)

(assert (=> (not b_lambda!24547) (not b!1345767)))

(declare-fun t!45955 () Bool)

(declare-fun tb!12385 () Bool)

(assert (=> (and start!113374 (= defaultEntry!1306 defaultEntry!1306) t!45955) tb!12385))

(declare-fun result!25861 () Bool)

(assert (=> tb!12385 (= result!25861 tp_is_empty!37425)))

(assert (=> b!1345767 t!45955))

(declare-fun b_and!50705 () Bool)

(assert (= b_and!50703 (and (=> t!45955 result!25861) b_and!50705)))

(declare-fun m!1233091 () Bool)

(assert (=> b!1345762 m!1233091))

(assert (=> b!1345762 m!1233091))

(declare-fun m!1233093 () Bool)

(assert (=> b!1345762 m!1233093))

(declare-fun m!1233095 () Bool)

(assert (=> b!1345758 m!1233095))

(declare-fun m!1233097 () Bool)

(assert (=> b!1345767 m!1233097))

(declare-fun m!1233099 () Bool)

(assert (=> b!1345767 m!1233099))

(declare-fun m!1233101 () Bool)

(assert (=> b!1345767 m!1233101))

(declare-fun m!1233103 () Bool)

(assert (=> b!1345767 m!1233103))

(assert (=> b!1345767 m!1233099))

(declare-fun m!1233105 () Bool)

(assert (=> b!1345767 m!1233105))

(declare-fun m!1233107 () Bool)

(assert (=> b!1345767 m!1233107))

(assert (=> b!1345767 m!1233101))

(assert (=> b!1345767 m!1233105))

(assert (=> b!1345767 m!1233091))

(declare-fun m!1233109 () Bool)

(assert (=> b!1345759 m!1233109))

(assert (=> b!1345759 m!1233109))

(declare-fun m!1233111 () Bool)

(assert (=> b!1345759 m!1233111))

(assert (=> b!1345764 m!1233091))

(declare-fun m!1233113 () Bool)

(assert (=> start!113374 m!1233113))

(declare-fun m!1233115 () Bool)

(assert (=> start!113374 m!1233115))

(declare-fun m!1233117 () Bool)

(assert (=> start!113374 m!1233117))

(declare-fun m!1233119 () Bool)

(assert (=> mapNonEmpty!57844 m!1233119))

(declare-fun m!1233121 () Bool)

(assert (=> b!1345761 m!1233121))

(assert (=> b!1345757 m!1233091))

(declare-fun m!1233123 () Bool)

(assert (=> b!1345754 m!1233123))

(assert (=> b!1345754 m!1233091))

(assert (=> b!1345754 m!1233091))

(declare-fun m!1233125 () Bool)

(assert (=> b!1345754 m!1233125))

(check-sat (not b!1345767) (not b_lambda!24547) tp_is_empty!37425 (not b_next!31425) b_and!50705 (not b!1345759) (not mapNonEmpty!57844) (not b!1345762) (not start!113374) (not b!1345761) (not b!1345758) (not b!1345754))
(check-sat b_and!50705 (not b_next!31425))
