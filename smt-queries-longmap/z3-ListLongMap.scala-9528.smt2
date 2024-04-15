; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113030 () Bool)

(assert start!113030)

(declare-fun b_free!31081 () Bool)

(declare-fun b_next!31081 () Bool)

(assert (=> start!113030 (= b_free!31081 (not b_next!31081))))

(declare-fun tp!109049 () Bool)

(declare-fun b_and!50093 () Bool)

(assert (=> start!113030 (= tp!109049 b_and!50093)))

(declare-fun b!1339622 () Bool)

(declare-fun res!888679 () Bool)

(declare-fun e!763052 () Bool)

(assert (=> b!1339622 (=> (not res!888679) (not e!763052))))

(declare-datatypes ((array!90963 0))(
  ( (array!90964 (arr!43938 (Array (_ BitVec 32) (_ BitVec 64))) (size!44490 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90963)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90963 (_ BitVec 32)) Bool)

(assert (=> b!1339622 (= res!888679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339623 () Bool)

(declare-fun res!888682 () Bool)

(assert (=> b!1339623 (=> (not res!888682) (not e!763052))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1339623 (= res!888682 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44490 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339624 () Bool)

(declare-fun res!888681 () Bool)

(assert (=> b!1339624 (=> (not res!888681) (not e!763052))))

(declare-datatypes ((V!54545 0))(
  ( (V!54546 (val!18615 Int)) )
))
(declare-datatypes ((ValueCell!17642 0))(
  ( (ValueCellFull!17642 (v!21262 V!54545)) (EmptyCell!17642) )
))
(declare-datatypes ((array!90965 0))(
  ( (array!90966 (arr!43939 (Array (_ BitVec 32) ValueCell!17642)) (size!44491 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90965)

(assert (=> b!1339624 (= res!888681 (and (= (size!44491 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44490 _keys!1571) (size!44491 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339625 () Bool)

(declare-fun e!763054 () Bool)

(declare-fun tp_is_empty!37081 () Bool)

(assert (=> b!1339625 (= e!763054 tp_is_empty!37081)))

(declare-fun b!1339626 () Bool)

(assert (=> b!1339626 (= e!763052 false)))

(declare-fun minValue!1245 () V!54545)

(declare-fun lt!593730 () Bool)

(declare-fun zeroValue!1245 () V!54545)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24018 0))(
  ( (tuple2!24019 (_1!12020 (_ BitVec 64)) (_2!12020 V!54545)) )
))
(declare-datatypes ((List!31167 0))(
  ( (Nil!31164) (Cons!31163 (h!32372 tuple2!24018) (t!45491 List!31167)) )
))
(declare-datatypes ((ListLongMap!21675 0))(
  ( (ListLongMap!21676 (toList!10853 List!31167)) )
))
(declare-fun contains!8958 (ListLongMap!21675 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5706 (array!90963 array!90965 (_ BitVec 32) (_ BitVec 32) V!54545 V!54545 (_ BitVec 32) Int) ListLongMap!21675)

(assert (=> b!1339626 (= lt!593730 (contains!8958 (getCurrentListMap!5706 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339627 () Bool)

(declare-fun e!763053 () Bool)

(declare-fun e!763051 () Bool)

(declare-fun mapRes!57328 () Bool)

(assert (=> b!1339627 (= e!763053 (and e!763051 mapRes!57328))))

(declare-fun condMapEmpty!57328 () Bool)

(declare-fun mapDefault!57328 () ValueCell!17642)

(assert (=> b!1339627 (= condMapEmpty!57328 (= (arr!43939 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17642)) mapDefault!57328)))))

(declare-fun mapNonEmpty!57328 () Bool)

(declare-fun tp!109048 () Bool)

(assert (=> mapNonEmpty!57328 (= mapRes!57328 (and tp!109048 e!763054))))

(declare-fun mapRest!57328 () (Array (_ BitVec 32) ValueCell!17642))

(declare-fun mapValue!57328 () ValueCell!17642)

(declare-fun mapKey!57328 () (_ BitVec 32))

(assert (=> mapNonEmpty!57328 (= (arr!43939 _values!1303) (store mapRest!57328 mapKey!57328 mapValue!57328))))

(declare-fun b!1339628 () Bool)

(declare-fun res!888678 () Bool)

(assert (=> b!1339628 (=> (not res!888678) (not e!763052))))

(declare-datatypes ((List!31168 0))(
  ( (Nil!31165) (Cons!31164 (h!32373 (_ BitVec 64)) (t!45492 List!31168)) )
))
(declare-fun arrayNoDuplicates!0 (array!90963 (_ BitVec 32) List!31168) Bool)

(assert (=> b!1339628 (= res!888678 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31165))))

(declare-fun b!1339629 () Bool)

(assert (=> b!1339629 (= e!763051 tp_is_empty!37081)))

(declare-fun mapIsEmpty!57328 () Bool)

(assert (=> mapIsEmpty!57328 mapRes!57328))

(declare-fun res!888680 () Bool)

(assert (=> start!113030 (=> (not res!888680) (not e!763052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113030 (= res!888680 (validMask!0 mask!1977))))

(assert (=> start!113030 e!763052))

(assert (=> start!113030 tp_is_empty!37081))

(assert (=> start!113030 true))

(declare-fun array_inv!33323 (array!90963) Bool)

(assert (=> start!113030 (array_inv!33323 _keys!1571)))

(declare-fun array_inv!33324 (array!90965) Bool)

(assert (=> start!113030 (and (array_inv!33324 _values!1303) e!763053)))

(assert (=> start!113030 tp!109049))

(assert (= (and start!113030 res!888680) b!1339624))

(assert (= (and b!1339624 res!888681) b!1339622))

(assert (= (and b!1339622 res!888679) b!1339628))

(assert (= (and b!1339628 res!888678) b!1339623))

(assert (= (and b!1339623 res!888682) b!1339626))

(assert (= (and b!1339627 condMapEmpty!57328) mapIsEmpty!57328))

(assert (= (and b!1339627 (not condMapEmpty!57328)) mapNonEmpty!57328))

(get-info :version)

(assert (= (and mapNonEmpty!57328 ((_ is ValueCellFull!17642) mapValue!57328)) b!1339625))

(assert (= (and b!1339627 ((_ is ValueCellFull!17642) mapDefault!57328)) b!1339629))

(assert (= start!113030 b!1339627))

(declare-fun m!1227145 () Bool)

(assert (=> b!1339628 m!1227145))

(declare-fun m!1227147 () Bool)

(assert (=> start!113030 m!1227147))

(declare-fun m!1227149 () Bool)

(assert (=> start!113030 m!1227149))

(declare-fun m!1227151 () Bool)

(assert (=> start!113030 m!1227151))

(declare-fun m!1227153 () Bool)

(assert (=> b!1339626 m!1227153))

(assert (=> b!1339626 m!1227153))

(declare-fun m!1227155 () Bool)

(assert (=> b!1339626 m!1227155))

(declare-fun m!1227157 () Bool)

(assert (=> b!1339622 m!1227157))

(declare-fun m!1227159 () Bool)

(assert (=> mapNonEmpty!57328 m!1227159))

(check-sat b_and!50093 tp_is_empty!37081 (not mapNonEmpty!57328) (not b_next!31081) (not b!1339626) (not start!113030) (not b!1339628) (not b!1339622))
(check-sat b_and!50093 (not b_next!31081))
