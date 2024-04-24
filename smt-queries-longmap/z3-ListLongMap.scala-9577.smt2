; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113548 () Bool)

(assert start!113548)

(declare-fun b_free!31375 () Bool)

(declare-fun b_next!31375 () Bool)

(assert (=> start!113548 (= b_free!31375 (not b_next!31375))))

(declare-fun tp!109930 () Bool)

(declare-fun b_and!50605 () Bool)

(assert (=> start!113548 (= tp!109930 b_and!50605)))

(declare-fun b!1345967 () Bool)

(declare-fun e!766136 () Bool)

(assert (=> b!1345967 (= e!766136 false)))

(declare-datatypes ((V!54937 0))(
  ( (V!54938 (val!18762 Int)) )
))
(declare-fun minValue!1245 () V!54937)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91697 0))(
  ( (array!91698 (arr!44300 (Array (_ BitVec 32) (_ BitVec 64))) (size!44851 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91697)

(declare-fun zeroValue!1245 () V!54937)

(declare-fun lt!595679 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17789 0))(
  ( (ValueCellFull!17789 (v!21405 V!54937)) (EmptyCell!17789) )
))
(declare-datatypes ((array!91699 0))(
  ( (array!91700 (arr!44301 (Array (_ BitVec 32) ValueCell!17789)) (size!44852 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91699)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24220 0))(
  ( (tuple2!24221 (_1!12121 (_ BitVec 64)) (_2!12121 V!54937)) )
))
(declare-datatypes ((List!31365 0))(
  ( (Nil!31362) (Cons!31361 (h!32579 tuple2!24220) (t!45889 List!31365)) )
))
(declare-datatypes ((ListLongMap!21885 0))(
  ( (ListLongMap!21886 (toList!10958 List!31365)) )
))
(declare-fun contains!9146 (ListLongMap!21885 (_ BitVec 64)) Bool)

(declare-fun +!4853 (ListLongMap!21885 tuple2!24220) ListLongMap!21885)

(declare-fun getCurrentListMapNoExtraKeys!6502 (array!91697 array!91699 (_ BitVec 32) (_ BitVec 32) V!54937 V!54937 (_ BitVec 32) Int) ListLongMap!21885)

(declare-fun get!22387 (ValueCell!17789 V!54937) V!54937)

(declare-fun dynLambda!3807 (Int (_ BitVec 64)) V!54937)

(assert (=> b!1345967 (= lt!595679 (contains!9146 (+!4853 (getCurrentListMapNoExtraKeys!6502 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24221 (select (arr!44300 _keys!1571) from!1960) (get!22387 (select (arr!44301 _values!1303) from!1960) (dynLambda!3807 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142))))

(declare-fun b!1345968 () Bool)

(declare-fun e!766132 () Bool)

(declare-fun tp_is_empty!37375 () Bool)

(assert (=> b!1345968 (= e!766132 tp_is_empty!37375)))

(declare-fun b!1345969 () Bool)

(declare-fun res!892688 () Bool)

(assert (=> b!1345969 (=> (not res!892688) (not e!766136))))

(assert (=> b!1345969 (= res!892688 (not (= (select (arr!44300 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345970 () Bool)

(declare-fun res!892682 () Bool)

(assert (=> b!1345970 (=> (not res!892682) (not e!766136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91697 (_ BitVec 32)) Bool)

(assert (=> b!1345970 (= res!892682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345971 () Bool)

(declare-fun e!766135 () Bool)

(assert (=> b!1345971 (= e!766135 tp_is_empty!37375)))

(declare-fun b!1345972 () Bool)

(declare-fun res!892685 () Bool)

(assert (=> b!1345972 (=> (not res!892685) (not e!766136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345972 (= res!892685 (validKeyInArray!0 (select (arr!44300 _keys!1571) from!1960)))))

(declare-fun b!1345973 () Bool)

(declare-fun res!892687 () Bool)

(assert (=> b!1345973 (=> (not res!892687) (not e!766136))))

(declare-fun getCurrentListMap!5901 (array!91697 array!91699 (_ BitVec 32) (_ BitVec 32) V!54937 V!54937 (_ BitVec 32) Int) ListLongMap!21885)

(assert (=> b!1345973 (= res!892687 (contains!9146 (getCurrentListMap!5901 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57769 () Bool)

(declare-fun mapRes!57769 () Bool)

(assert (=> mapIsEmpty!57769 mapRes!57769))

(declare-fun b!1345974 () Bool)

(declare-fun res!892681 () Bool)

(assert (=> b!1345974 (=> (not res!892681) (not e!766136))))

(assert (=> b!1345974 (= res!892681 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44851 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345975 () Bool)

(declare-fun res!892684 () Bool)

(assert (=> b!1345975 (=> (not res!892684) (not e!766136))))

(declare-datatypes ((List!31366 0))(
  ( (Nil!31363) (Cons!31362 (h!32580 (_ BitVec 64)) (t!45890 List!31366)) )
))
(declare-fun arrayNoDuplicates!0 (array!91697 (_ BitVec 32) List!31366) Bool)

(assert (=> b!1345975 (= res!892684 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31363))))

(declare-fun b!1345976 () Bool)

(declare-fun res!892683 () Bool)

(assert (=> b!1345976 (=> (not res!892683) (not e!766136))))

(assert (=> b!1345976 (= res!892683 (and (= (size!44852 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44851 _keys!1571) (size!44852 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!892686 () Bool)

(assert (=> start!113548 (=> (not res!892686) (not e!766136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113548 (= res!892686 (validMask!0 mask!1977))))

(assert (=> start!113548 e!766136))

(assert (=> start!113548 tp_is_empty!37375))

(assert (=> start!113548 true))

(declare-fun array_inv!33653 (array!91697) Bool)

(assert (=> start!113548 (array_inv!33653 _keys!1571)))

(declare-fun e!766134 () Bool)

(declare-fun array_inv!33654 (array!91699) Bool)

(assert (=> start!113548 (and (array_inv!33654 _values!1303) e!766134)))

(assert (=> start!113548 tp!109930))

(declare-fun b!1345977 () Bool)

(assert (=> b!1345977 (= e!766134 (and e!766135 mapRes!57769))))

(declare-fun condMapEmpty!57769 () Bool)

(declare-fun mapDefault!57769 () ValueCell!17789)

(assert (=> b!1345977 (= condMapEmpty!57769 (= (arr!44301 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17789)) mapDefault!57769)))))

(declare-fun mapNonEmpty!57769 () Bool)

(declare-fun tp!109929 () Bool)

(assert (=> mapNonEmpty!57769 (= mapRes!57769 (and tp!109929 e!766132))))

(declare-fun mapRest!57769 () (Array (_ BitVec 32) ValueCell!17789))

(declare-fun mapKey!57769 () (_ BitVec 32))

(declare-fun mapValue!57769 () ValueCell!17789)

(assert (=> mapNonEmpty!57769 (= (arr!44301 _values!1303) (store mapRest!57769 mapKey!57769 mapValue!57769))))

(declare-fun b!1345978 () Bool)

(declare-fun res!892680 () Bool)

(assert (=> b!1345978 (=> (not res!892680) (not e!766136))))

(assert (=> b!1345978 (= res!892680 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!113548 res!892686) b!1345976))

(assert (= (and b!1345976 res!892683) b!1345970))

(assert (= (and b!1345970 res!892682) b!1345975))

(assert (= (and b!1345975 res!892684) b!1345974))

(assert (= (and b!1345974 res!892681) b!1345973))

(assert (= (and b!1345973 res!892687) b!1345969))

(assert (= (and b!1345969 res!892688) b!1345972))

(assert (= (and b!1345972 res!892685) b!1345978))

(assert (= (and b!1345978 res!892680) b!1345967))

(assert (= (and b!1345977 condMapEmpty!57769) mapIsEmpty!57769))

(assert (= (and b!1345977 (not condMapEmpty!57769)) mapNonEmpty!57769))

(get-info :version)

(assert (= (and mapNonEmpty!57769 ((_ is ValueCellFull!17789) mapValue!57769)) b!1345968))

(assert (= (and b!1345977 ((_ is ValueCellFull!17789) mapDefault!57769)) b!1345971))

(assert (= start!113548 b!1345977))

(declare-fun b_lambda!24491 () Bool)

(assert (=> (not b_lambda!24491) (not b!1345967)))

(declare-fun t!45888 () Bool)

(declare-fun tb!12327 () Bool)

(assert (=> (and start!113548 (= defaultEntry!1306 defaultEntry!1306) t!45888) tb!12327))

(declare-fun result!25753 () Bool)

(assert (=> tb!12327 (= result!25753 tp_is_empty!37375)))

(assert (=> b!1345967 t!45888))

(declare-fun b_and!50607 () Bool)

(assert (= b_and!50605 (and (=> t!45888 result!25753) b_and!50607)))

(declare-fun m!1233801 () Bool)

(assert (=> b!1345975 m!1233801))

(declare-fun m!1233803 () Bool)

(assert (=> b!1345967 m!1233803))

(declare-fun m!1233805 () Bool)

(assert (=> b!1345967 m!1233805))

(declare-fun m!1233807 () Bool)

(assert (=> b!1345967 m!1233807))

(declare-fun m!1233809 () Bool)

(assert (=> b!1345967 m!1233809))

(assert (=> b!1345967 m!1233803))

(declare-fun m!1233811 () Bool)

(assert (=> b!1345967 m!1233811))

(assert (=> b!1345967 m!1233805))

(assert (=> b!1345967 m!1233807))

(assert (=> b!1345967 m!1233811))

(declare-fun m!1233813 () Bool)

(assert (=> b!1345967 m!1233813))

(declare-fun m!1233815 () Bool)

(assert (=> b!1345967 m!1233815))

(assert (=> b!1345969 m!1233815))

(declare-fun m!1233817 () Bool)

(assert (=> b!1345973 m!1233817))

(assert (=> b!1345973 m!1233817))

(declare-fun m!1233819 () Bool)

(assert (=> b!1345973 m!1233819))

(declare-fun m!1233821 () Bool)

(assert (=> b!1345970 m!1233821))

(declare-fun m!1233823 () Bool)

(assert (=> mapNonEmpty!57769 m!1233823))

(assert (=> b!1345972 m!1233815))

(assert (=> b!1345972 m!1233815))

(declare-fun m!1233825 () Bool)

(assert (=> b!1345972 m!1233825))

(declare-fun m!1233827 () Bool)

(assert (=> start!113548 m!1233827))

(declare-fun m!1233829 () Bool)

(assert (=> start!113548 m!1233829))

(declare-fun m!1233831 () Bool)

(assert (=> start!113548 m!1233831))

(check-sat tp_is_empty!37375 (not b!1345972) (not b!1345973) (not b_lambda!24491) (not mapNonEmpty!57769) b_and!50607 (not start!113548) (not b!1345967) (not b_next!31375) (not b!1345970) (not b!1345975))
(check-sat b_and!50607 (not b_next!31375))
