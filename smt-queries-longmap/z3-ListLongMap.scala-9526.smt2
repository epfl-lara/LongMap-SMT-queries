; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113242 () Bool)

(assert start!113242)

(declare-fun b_free!31069 () Bool)

(declare-fun b_next!31069 () Bool)

(assert (=> start!113242 (= b_free!31069 (not b_next!31069))))

(declare-fun tp!109011 () Bool)

(declare-fun b_and!50101 () Bool)

(assert (=> start!113242 (= tp!109011 b_and!50101)))

(declare-fun b!1340847 () Bool)

(declare-fun res!889137 () Bool)

(declare-fun e!763839 () Bool)

(assert (=> b!1340847 (=> (not res!889137) (not e!763839))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91115 0))(
  ( (array!91116 (arr!44009 (Array (_ BitVec 32) (_ BitVec 64))) (size!44560 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91115)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54529 0))(
  ( (V!54530 (val!18609 Int)) )
))
(declare-datatypes ((ValueCell!17636 0))(
  ( (ValueCellFull!17636 (v!21252 V!54529)) (EmptyCell!17636) )
))
(declare-datatypes ((array!91117 0))(
  ( (array!91118 (arr!44010 (Array (_ BitVec 32) ValueCell!17636)) (size!44561 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91117)

(assert (=> b!1340847 (= res!889137 (and (= (size!44561 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44560 _keys!1571) (size!44561 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!889139 () Bool)

(assert (=> start!113242 (=> (not res!889139) (not e!763839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113242 (= res!889139 (validMask!0 mask!1977))))

(assert (=> start!113242 e!763839))

(declare-fun tp_is_empty!37069 () Bool)

(assert (=> start!113242 tp_is_empty!37069))

(assert (=> start!113242 true))

(declare-fun array_inv!33449 (array!91115) Bool)

(assert (=> start!113242 (array_inv!33449 _keys!1571)))

(declare-fun e!763838 () Bool)

(declare-fun array_inv!33450 (array!91117) Bool)

(assert (=> start!113242 (and (array_inv!33450 _values!1303) e!763838)))

(assert (=> start!113242 tp!109011))

(declare-fun mapIsEmpty!57310 () Bool)

(declare-fun mapRes!57310 () Bool)

(assert (=> mapIsEmpty!57310 mapRes!57310))

(declare-fun b!1340848 () Bool)

(assert (=> b!1340848 (= e!763839 false)))

(declare-fun minValue!1245 () V!54529)

(declare-fun zeroValue!1245 () V!54529)

(declare-fun lt!594374 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24000 0))(
  ( (tuple2!24001 (_1!12011 (_ BitVec 64)) (_2!12011 V!54529)) )
))
(declare-datatypes ((List!31158 0))(
  ( (Nil!31155) (Cons!31154 (h!32372 tuple2!24000) (t!45482 List!31158)) )
))
(declare-datatypes ((ListLongMap!21665 0))(
  ( (ListLongMap!21666 (toList!10848 List!31158)) )
))
(declare-fun contains!9036 (ListLongMap!21665 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5801 (array!91115 array!91117 (_ BitVec 32) (_ BitVec 32) V!54529 V!54529 (_ BitVec 32) Int) ListLongMap!21665)

(assert (=> b!1340848 (= lt!594374 (contains!9036 (getCurrentListMap!5801 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340849 () Bool)

(declare-fun res!889135 () Bool)

(assert (=> b!1340849 (=> (not res!889135) (not e!763839))))

(declare-datatypes ((List!31159 0))(
  ( (Nil!31156) (Cons!31155 (h!32373 (_ BitVec 64)) (t!45483 List!31159)) )
))
(declare-fun arrayNoDuplicates!0 (array!91115 (_ BitVec 32) List!31159) Bool)

(assert (=> b!1340849 (= res!889135 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31156))))

(declare-fun b!1340850 () Bool)

(declare-fun res!889138 () Bool)

(assert (=> b!1340850 (=> (not res!889138) (not e!763839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91115 (_ BitVec 32)) Bool)

(assert (=> b!1340850 (= res!889138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340851 () Bool)

(declare-fun e!763840 () Bool)

(assert (=> b!1340851 (= e!763838 (and e!763840 mapRes!57310))))

(declare-fun condMapEmpty!57310 () Bool)

(declare-fun mapDefault!57310 () ValueCell!17636)

(assert (=> b!1340851 (= condMapEmpty!57310 (= (arr!44010 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17636)) mapDefault!57310)))))

(declare-fun b!1340852 () Bool)

(declare-fun e!763837 () Bool)

(assert (=> b!1340852 (= e!763837 tp_is_empty!37069)))

(declare-fun b!1340853 () Bool)

(declare-fun res!889136 () Bool)

(assert (=> b!1340853 (=> (not res!889136) (not e!763839))))

(assert (=> b!1340853 (= res!889136 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44560 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57310 () Bool)

(declare-fun tp!109012 () Bool)

(assert (=> mapNonEmpty!57310 (= mapRes!57310 (and tp!109012 e!763837))))

(declare-fun mapRest!57310 () (Array (_ BitVec 32) ValueCell!17636))

(declare-fun mapKey!57310 () (_ BitVec 32))

(declare-fun mapValue!57310 () ValueCell!17636)

(assert (=> mapNonEmpty!57310 (= (arr!44010 _values!1303) (store mapRest!57310 mapKey!57310 mapValue!57310))))

(declare-fun b!1340854 () Bool)

(assert (=> b!1340854 (= e!763840 tp_is_empty!37069)))

(assert (= (and start!113242 res!889139) b!1340847))

(assert (= (and b!1340847 res!889137) b!1340850))

(assert (= (and b!1340850 res!889138) b!1340849))

(assert (= (and b!1340849 res!889135) b!1340853))

(assert (= (and b!1340853 res!889136) b!1340848))

(assert (= (and b!1340851 condMapEmpty!57310) mapIsEmpty!57310))

(assert (= (and b!1340851 (not condMapEmpty!57310)) mapNonEmpty!57310))

(get-info :version)

(assert (= (and mapNonEmpty!57310 ((_ is ValueCellFull!17636) mapValue!57310)) b!1340852))

(assert (= (and b!1340851 ((_ is ValueCellFull!17636) mapDefault!57310)) b!1340854))

(assert (= start!113242 b!1340851))

(declare-fun m!1229163 () Bool)

(assert (=> b!1340849 m!1229163))

(declare-fun m!1229165 () Bool)

(assert (=> b!1340850 m!1229165))

(declare-fun m!1229167 () Bool)

(assert (=> start!113242 m!1229167))

(declare-fun m!1229169 () Bool)

(assert (=> start!113242 m!1229169))

(declare-fun m!1229171 () Bool)

(assert (=> start!113242 m!1229171))

(declare-fun m!1229173 () Bool)

(assert (=> b!1340848 m!1229173))

(assert (=> b!1340848 m!1229173))

(declare-fun m!1229175 () Bool)

(assert (=> b!1340848 m!1229175))

(declare-fun m!1229177 () Bool)

(assert (=> mapNonEmpty!57310 m!1229177))

(check-sat (not b_next!31069) (not b!1340849) (not b!1340850) (not mapNonEmpty!57310) (not b!1340848) tp_is_empty!37069 (not start!113242) b_and!50101)
(check-sat b_and!50101 (not b_next!31069))
