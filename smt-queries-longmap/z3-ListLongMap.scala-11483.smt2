; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133646 () Bool)

(assert start!133646)

(declare-fun b_free!32059 () Bool)

(declare-fun b_next!32059 () Bool)

(assert (=> start!133646 (= b_free!32059 (not b_next!32059))))

(declare-fun tp!113382 () Bool)

(declare-fun b_and!51611 () Bool)

(assert (=> start!133646 (= tp!113382 b_and!51611)))

(declare-fun b!1562842 () Bool)

(declare-fun res!1068520 () Bool)

(declare-fun e!870988 () Bool)

(assert (=> b!1562842 (=> (not res!1068520) (not e!870988))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104176 0))(
  ( (array!104177 (arr!50281 (Array (_ BitVec 32) (_ BitVec 64))) (size!50833 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104176)

(assert (=> b!1562842 (= res!1068520 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50833 _keys!637)) (bvslt from!782 (size!50833 _keys!637))))))

(declare-fun b!1562843 () Bool)

(declare-fun res!1068522 () Bool)

(assert (=> b!1562843 (=> (not res!1068522) (not e!870988))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59913 0))(
  ( (V!59914 (val!19473 Int)) )
))
(declare-datatypes ((ValueCell!18359 0))(
  ( (ValueCellFull!18359 (v!22221 V!59913)) (EmptyCell!18359) )
))
(declare-datatypes ((array!104178 0))(
  ( (array!104179 (arr!50282 (Array (_ BitVec 32) ValueCell!18359)) (size!50834 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104178)

(assert (=> b!1562843 (= res!1068522 (and (= (size!50834 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50833 _keys!637) (size!50834 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1068516 () Bool)

(assert (=> start!133646 (=> (not res!1068516) (not e!870988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133646 (= res!1068516 (validMask!0 mask!947))))

(assert (=> start!133646 e!870988))

(assert (=> start!133646 tp!113382))

(declare-fun tp_is_empty!38779 () Bool)

(assert (=> start!133646 tp_is_empty!38779))

(assert (=> start!133646 true))

(declare-fun array_inv!39267 (array!104176) Bool)

(assert (=> start!133646 (array_inv!39267 _keys!637)))

(declare-fun e!870983 () Bool)

(declare-fun array_inv!39268 (array!104178) Bool)

(assert (=> start!133646 (and (array_inv!39268 _values!487) e!870983)))

(declare-fun mapNonEmpty!59544 () Bool)

(declare-fun mapRes!59544 () Bool)

(declare-fun tp!113383 () Bool)

(declare-fun e!870986 () Bool)

(assert (=> mapNonEmpty!59544 (= mapRes!59544 (and tp!113383 e!870986))))

(declare-fun mapRest!59544 () (Array (_ BitVec 32) ValueCell!18359))

(declare-fun mapKey!59544 () (_ BitVec 32))

(declare-fun mapValue!59544 () ValueCell!18359)

(assert (=> mapNonEmpty!59544 (= (arr!50282 _values!487) (store mapRest!59544 mapKey!59544 mapValue!59544))))

(declare-fun b!1562844 () Bool)

(assert (=> b!1562844 (= e!870986 tp_is_empty!38779)))

(declare-fun b!1562845 () Bool)

(declare-fun res!1068519 () Bool)

(assert (=> b!1562845 (=> (not res!1068519) (not e!870988))))

(declare-datatypes ((List!36553 0))(
  ( (Nil!36550) (Cons!36549 (h!37996 (_ BitVec 64)) (t!51392 List!36553)) )
))
(declare-fun arrayNoDuplicates!0 (array!104176 (_ BitVec 32) List!36553) Bool)

(assert (=> b!1562845 (= res!1068519 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36550))))

(declare-fun b!1562846 () Bool)

(declare-fun e!870987 () Bool)

(assert (=> b!1562846 (= e!870987 false)))

(declare-fun lt!671546 () Bool)

(declare-datatypes ((tuple2!25194 0))(
  ( (tuple2!25195 (_1!12608 (_ BitVec 64)) (_2!12608 V!59913)) )
))
(declare-datatypes ((List!36554 0))(
  ( (Nil!36551) (Cons!36550 (h!37997 tuple2!25194) (t!51393 List!36554)) )
))
(declare-datatypes ((ListLongMap!22629 0))(
  ( (ListLongMap!22630 (toList!11330 List!36554)) )
))
(declare-fun lt!671545 () ListLongMap!22629)

(declare-fun contains!10240 (ListLongMap!22629 (_ BitVec 64)) Bool)

(assert (=> b!1562846 (= lt!671546 (contains!10240 lt!671545 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1562847 () Bool)

(declare-fun res!1068518 () Bool)

(assert (=> b!1562847 (=> (not res!1068518) (not e!870988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562847 (= res!1068518 (not (validKeyInArray!0 (select (arr!50281 _keys!637) from!782))))))

(declare-fun mapIsEmpty!59544 () Bool)

(assert (=> mapIsEmpty!59544 mapRes!59544))

(declare-fun b!1562848 () Bool)

(declare-fun res!1068521 () Bool)

(assert (=> b!1562848 (=> (not res!1068521) (not e!870988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104176 (_ BitVec 32)) Bool)

(assert (=> b!1562848 (= res!1068521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562849 () Bool)

(declare-fun e!870984 () Bool)

(assert (=> b!1562849 (= e!870983 (and e!870984 mapRes!59544))))

(declare-fun condMapEmpty!59544 () Bool)

(declare-fun mapDefault!59544 () ValueCell!18359)

(assert (=> b!1562849 (= condMapEmpty!59544 (= (arr!50282 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18359)) mapDefault!59544)))))

(declare-fun b!1562850 () Bool)

(assert (=> b!1562850 (= e!870988 e!870987)))

(declare-fun res!1068517 () Bool)

(assert (=> b!1562850 (=> (not res!1068517) (not e!870987))))

(assert (=> b!1562850 (= res!1068517 (not (contains!10240 lt!671545 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59913)

(declare-fun minValue!453 () V!59913)

(declare-fun getCurrentListMapNoExtraKeys!6704 (array!104176 array!104178 (_ BitVec 32) (_ BitVec 32) V!59913 V!59913 (_ BitVec 32) Int) ListLongMap!22629)

(assert (=> b!1562850 (= lt!671545 (getCurrentListMapNoExtraKeys!6704 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562851 () Bool)

(assert (=> b!1562851 (= e!870984 tp_is_empty!38779)))

(assert (= (and start!133646 res!1068516) b!1562843))

(assert (= (and b!1562843 res!1068522) b!1562848))

(assert (= (and b!1562848 res!1068521) b!1562845))

(assert (= (and b!1562845 res!1068519) b!1562842))

(assert (= (and b!1562842 res!1068520) b!1562847))

(assert (= (and b!1562847 res!1068518) b!1562850))

(assert (= (and b!1562850 res!1068517) b!1562846))

(assert (= (and b!1562849 condMapEmpty!59544) mapIsEmpty!59544))

(assert (= (and b!1562849 (not condMapEmpty!59544)) mapNonEmpty!59544))

(get-info :version)

(assert (= (and mapNonEmpty!59544 ((_ is ValueCellFull!18359) mapValue!59544)) b!1562844))

(assert (= (and b!1562849 ((_ is ValueCellFull!18359) mapDefault!59544)) b!1562851))

(assert (= start!133646 b!1562849))

(declare-fun m!1437861 () Bool)

(assert (=> b!1562845 m!1437861))

(declare-fun m!1437863 () Bool)

(assert (=> b!1562847 m!1437863))

(assert (=> b!1562847 m!1437863))

(declare-fun m!1437865 () Bool)

(assert (=> b!1562847 m!1437865))

(declare-fun m!1437867 () Bool)

(assert (=> start!133646 m!1437867))

(declare-fun m!1437869 () Bool)

(assert (=> start!133646 m!1437869))

(declare-fun m!1437871 () Bool)

(assert (=> start!133646 m!1437871))

(declare-fun m!1437873 () Bool)

(assert (=> b!1562846 m!1437873))

(declare-fun m!1437875 () Bool)

(assert (=> mapNonEmpty!59544 m!1437875))

(declare-fun m!1437877 () Bool)

(assert (=> b!1562848 m!1437877))

(declare-fun m!1437879 () Bool)

(assert (=> b!1562850 m!1437879))

(declare-fun m!1437881 () Bool)

(assert (=> b!1562850 m!1437881))

(check-sat (not b!1562848) (not b!1562846) (not start!133646) b_and!51611 (not mapNonEmpty!59544) tp_is_empty!38779 (not b!1562845) (not b!1562847) (not b!1562850) (not b_next!32059))
(check-sat b_and!51611 (not b_next!32059))
