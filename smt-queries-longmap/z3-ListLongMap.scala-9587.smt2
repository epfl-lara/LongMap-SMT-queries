; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113386 () Bool)

(assert start!113386)

(declare-fun b_free!31437 () Bool)

(declare-fun b_next!31437 () Bool)

(assert (=> start!113386 (= b_free!31437 (not b_next!31437))))

(declare-fun tp!110116 () Bool)

(declare-fun b_and!50725 () Bool)

(assert (=> start!113386 (= tp!110116 b_and!50725)))

(declare-fun mapNonEmpty!57862 () Bool)

(declare-fun mapRes!57862 () Bool)

(declare-fun tp!110115 () Bool)

(declare-fun e!765835 () Bool)

(assert (=> mapNonEmpty!57862 (= mapRes!57862 (and tp!110115 e!765835))))

(declare-fun mapKey!57862 () (_ BitVec 32))

(declare-datatypes ((V!55019 0))(
  ( (V!55020 (val!18793 Int)) )
))
(declare-datatypes ((ValueCell!17820 0))(
  ( (ValueCellFull!17820 (v!21441 V!55019)) (EmptyCell!17820) )
))
(declare-fun mapValue!57862 () ValueCell!17820)

(declare-fun mapRest!57862 () (Array (_ BitVec 32) ValueCell!17820))

(declare-datatypes ((array!91714 0))(
  ( (array!91715 (arr!44313 (Array (_ BitVec 32) ValueCell!17820)) (size!44863 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91714)

(assert (=> mapNonEmpty!57862 (= (arr!44313 _values!1303) (store mapRest!57862 mapKey!57862 mapValue!57862))))

(declare-fun b!1345986 () Bool)

(declare-fun res!893141 () Bool)

(declare-fun e!765838 () Bool)

(assert (=> b!1345986 (=> (not res!893141) (not e!765838))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91716 0))(
  ( (array!91717 (arr!44314 (Array (_ BitVec 32) (_ BitVec 64))) (size!44864 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91716)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345986 (= res!893141 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44864 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345987 () Bool)

(assert (=> b!1345987 (= e!765838 false)))

(declare-fun minValue!1245 () V!55019)

(declare-fun lt!595458 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55019)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24228 0))(
  ( (tuple2!24229 (_1!12125 (_ BitVec 64)) (_2!12125 V!55019)) )
))
(declare-datatypes ((List!31383 0))(
  ( (Nil!31380) (Cons!31379 (h!32588 tuple2!24228) (t!45973 List!31383)) )
))
(declare-datatypes ((ListLongMap!21885 0))(
  ( (ListLongMap!21886 (toList!10958 List!31383)) )
))
(declare-fun contains!9134 (ListLongMap!21885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5910 (array!91716 array!91714 (_ BitVec 32) (_ BitVec 32) V!55019 V!55019 (_ BitVec 32) Int) ListLongMap!21885)

(assert (=> b!1345987 (= lt!595458 (contains!9134 (getCurrentListMap!5910 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345988 () Bool)

(declare-fun e!765839 () Bool)

(declare-fun e!765837 () Bool)

(assert (=> b!1345988 (= e!765839 (and e!765837 mapRes!57862))))

(declare-fun condMapEmpty!57862 () Bool)

(declare-fun mapDefault!57862 () ValueCell!17820)

(assert (=> b!1345988 (= condMapEmpty!57862 (= (arr!44313 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17820)) mapDefault!57862)))))

(declare-fun b!1345989 () Bool)

(declare-fun res!893145 () Bool)

(assert (=> b!1345989 (=> (not res!893145) (not e!765838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91716 (_ BitVec 32)) Bool)

(assert (=> b!1345989 (= res!893145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345990 () Bool)

(declare-fun tp_is_empty!37437 () Bool)

(assert (=> b!1345990 (= e!765835 tp_is_empty!37437)))

(declare-fun mapIsEmpty!57862 () Bool)

(assert (=> mapIsEmpty!57862 mapRes!57862))

(declare-fun b!1345992 () Bool)

(assert (=> b!1345992 (= e!765837 tp_is_empty!37437)))

(declare-fun b!1345993 () Bool)

(declare-fun res!893142 () Bool)

(assert (=> b!1345993 (=> (not res!893142) (not e!765838))))

(assert (=> b!1345993 (= res!893142 (and (= (size!44863 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44864 _keys!1571) (size!44863 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345991 () Bool)

(declare-fun res!893143 () Bool)

(assert (=> b!1345991 (=> (not res!893143) (not e!765838))))

(declare-datatypes ((List!31384 0))(
  ( (Nil!31381) (Cons!31380 (h!32589 (_ BitVec 64)) (t!45974 List!31384)) )
))
(declare-fun arrayNoDuplicates!0 (array!91716 (_ BitVec 32) List!31384) Bool)

(assert (=> b!1345991 (= res!893143 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31381))))

(declare-fun res!893144 () Bool)

(assert (=> start!113386 (=> (not res!893144) (not e!765838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113386 (= res!893144 (validMask!0 mask!1977))))

(assert (=> start!113386 e!765838))

(assert (=> start!113386 tp_is_empty!37437))

(assert (=> start!113386 true))

(declare-fun array_inv!33391 (array!91716) Bool)

(assert (=> start!113386 (array_inv!33391 _keys!1571)))

(declare-fun array_inv!33392 (array!91714) Bool)

(assert (=> start!113386 (and (array_inv!33392 _values!1303) e!765839)))

(assert (=> start!113386 tp!110116))

(assert (= (and start!113386 res!893144) b!1345993))

(assert (= (and b!1345993 res!893142) b!1345989))

(assert (= (and b!1345989 res!893145) b!1345991))

(assert (= (and b!1345991 res!893143) b!1345986))

(assert (= (and b!1345986 res!893141) b!1345987))

(assert (= (and b!1345988 condMapEmpty!57862) mapIsEmpty!57862))

(assert (= (and b!1345988 (not condMapEmpty!57862)) mapNonEmpty!57862))

(get-info :version)

(assert (= (and mapNonEmpty!57862 ((_ is ValueCellFull!17820) mapValue!57862)) b!1345990))

(assert (= (and b!1345988 ((_ is ValueCellFull!17820) mapDefault!57862)) b!1345992))

(assert (= start!113386 b!1345988))

(declare-fun m!1233287 () Bool)

(assert (=> b!1345991 m!1233287))

(declare-fun m!1233289 () Bool)

(assert (=> start!113386 m!1233289))

(declare-fun m!1233291 () Bool)

(assert (=> start!113386 m!1233291))

(declare-fun m!1233293 () Bool)

(assert (=> start!113386 m!1233293))

(declare-fun m!1233295 () Bool)

(assert (=> mapNonEmpty!57862 m!1233295))

(declare-fun m!1233297 () Bool)

(assert (=> b!1345989 m!1233297))

(declare-fun m!1233299 () Bool)

(assert (=> b!1345987 m!1233299))

(assert (=> b!1345987 m!1233299))

(declare-fun m!1233301 () Bool)

(assert (=> b!1345987 m!1233301))

(check-sat (not b_next!31437) (not mapNonEmpty!57862) tp_is_empty!37437 (not b!1345989) (not b!1345991) (not start!113386) (not b!1345987) b_and!50725)
(check-sat b_and!50725 (not b_next!31437))
