; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93702 () Bool)

(assert start!93702)

(declare-fun b_free!21193 () Bool)

(declare-fun b_next!21193 () Bool)

(assert (=> start!93702 (= b_free!21193 (not b_next!21193))))

(declare-fun tp!74999 () Bool)

(declare-fun b_and!33877 () Bool)

(assert (=> start!93702 (= tp!74999 b_and!33877)))

(declare-fun b!1059862 () Bool)

(declare-fun res!707956 () Bool)

(declare-fun e!603340 () Bool)

(assert (=> b!1059862 (=> (not res!707956) (not e!603340))))

(declare-datatypes ((array!66970 0))(
  ( (array!66971 (arr!32194 (Array (_ BitVec 32) (_ BitVec 64))) (size!32732 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66970)

(declare-datatypes ((List!22479 0))(
  ( (Nil!22476) (Cons!22475 (h!23684 (_ BitVec 64)) (t!31777 List!22479)) )
))
(declare-fun arrayNoDuplicates!0 (array!66970 (_ BitVec 32) List!22479) Bool)

(assert (=> b!1059862 (= res!707956 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22476))))

(declare-fun res!707954 () Bool)

(assert (=> start!93702 (=> (not res!707954) (not e!603340))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93702 (= res!707954 (validMask!0 mask!1515))))

(assert (=> start!93702 e!603340))

(assert (=> start!93702 true))

(declare-fun tp_is_empty!25003 () Bool)

(assert (=> start!93702 tp_is_empty!25003))

(declare-datatypes ((V!38473 0))(
  ( (V!38474 (val!12552 Int)) )
))
(declare-datatypes ((ValueCell!11798 0))(
  ( (ValueCellFull!11798 (v!15161 V!38473)) (EmptyCell!11798) )
))
(declare-datatypes ((array!66972 0))(
  ( (array!66973 (arr!32195 (Array (_ BitVec 32) ValueCell!11798)) (size!32733 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66972)

(declare-fun e!603338 () Bool)

(declare-fun array_inv!24958 (array!66972) Bool)

(assert (=> start!93702 (and (array_inv!24958 _values!955) e!603338)))

(assert (=> start!93702 tp!74999))

(declare-fun array_inv!24959 (array!66970) Bool)

(assert (=> start!93702 (array_inv!24959 _keys!1163)))

(declare-fun b!1059863 () Bool)

(assert (=> b!1059863 (= e!603340 false)))

(declare-fun zeroValueBefore!47 () V!38473)

(declare-datatypes ((tuple2!15926 0))(
  ( (tuple2!15927 (_1!7974 (_ BitVec 64)) (_2!7974 V!38473)) )
))
(declare-datatypes ((List!22480 0))(
  ( (Nil!22477) (Cons!22476 (h!23685 tuple2!15926) (t!31778 List!22480)) )
))
(declare-datatypes ((ListLongMap!13895 0))(
  ( (ListLongMap!13896 (toList!6963 List!22480)) )
))
(declare-fun lt!467009 () ListLongMap!13895)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38473)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3580 (array!66970 array!66972 (_ BitVec 32) (_ BitVec 32) V!38473 V!38473 (_ BitVec 32) Int) ListLongMap!13895)

(assert (=> b!1059863 (= lt!467009 (getCurrentListMapNoExtraKeys!3580 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1059864 () Bool)

(declare-fun e!603339 () Bool)

(assert (=> b!1059864 (= e!603339 tp_is_empty!25003)))

(declare-fun b!1059865 () Bool)

(declare-fun res!707953 () Bool)

(assert (=> b!1059865 (=> (not res!707953) (not e!603340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66970 (_ BitVec 32)) Bool)

(assert (=> b!1059865 (= res!707953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059866 () Bool)

(declare-fun mapRes!39172 () Bool)

(assert (=> b!1059866 (= e!603338 (and e!603339 mapRes!39172))))

(declare-fun condMapEmpty!39172 () Bool)

(declare-fun mapDefault!39172 () ValueCell!11798)

(assert (=> b!1059866 (= condMapEmpty!39172 (= (arr!32195 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11798)) mapDefault!39172)))))

(declare-fun mapNonEmpty!39172 () Bool)

(declare-fun tp!74998 () Bool)

(declare-fun e!603342 () Bool)

(assert (=> mapNonEmpty!39172 (= mapRes!39172 (and tp!74998 e!603342))))

(declare-fun mapKey!39172 () (_ BitVec 32))

(declare-fun mapRest!39172 () (Array (_ BitVec 32) ValueCell!11798))

(declare-fun mapValue!39172 () ValueCell!11798)

(assert (=> mapNonEmpty!39172 (= (arr!32195 _values!955) (store mapRest!39172 mapKey!39172 mapValue!39172))))

(declare-fun mapIsEmpty!39172 () Bool)

(assert (=> mapIsEmpty!39172 mapRes!39172))

(declare-fun b!1059867 () Bool)

(assert (=> b!1059867 (= e!603342 tp_is_empty!25003)))

(declare-fun b!1059868 () Bool)

(declare-fun res!707955 () Bool)

(assert (=> b!1059868 (=> (not res!707955) (not e!603340))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059868 (= res!707955 (and (= (size!32733 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32732 _keys!1163) (size!32733 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93702 res!707954) b!1059868))

(assert (= (and b!1059868 res!707955) b!1059865))

(assert (= (and b!1059865 res!707953) b!1059862))

(assert (= (and b!1059862 res!707956) b!1059863))

(assert (= (and b!1059866 condMapEmpty!39172) mapIsEmpty!39172))

(assert (= (and b!1059866 (not condMapEmpty!39172)) mapNonEmpty!39172))

(get-info :version)

(assert (= (and mapNonEmpty!39172 ((_ is ValueCellFull!11798) mapValue!39172)) b!1059867))

(assert (= (and b!1059866 ((_ is ValueCellFull!11798) mapDefault!39172)) b!1059864))

(assert (= start!93702 b!1059866))

(declare-fun m!978611 () Bool)

(assert (=> b!1059865 m!978611))

(declare-fun m!978613 () Bool)

(assert (=> start!93702 m!978613))

(declare-fun m!978615 () Bool)

(assert (=> start!93702 m!978615))

(declare-fun m!978617 () Bool)

(assert (=> start!93702 m!978617))

(declare-fun m!978619 () Bool)

(assert (=> mapNonEmpty!39172 m!978619))

(declare-fun m!978621 () Bool)

(assert (=> b!1059863 m!978621))

(declare-fun m!978623 () Bool)

(assert (=> b!1059862 m!978623))

(check-sat (not b!1059865) (not b!1059862) b_and!33877 (not mapNonEmpty!39172) (not b!1059863) (not start!93702) (not b_next!21193) tp_is_empty!25003)
(check-sat b_and!33877 (not b_next!21193))
