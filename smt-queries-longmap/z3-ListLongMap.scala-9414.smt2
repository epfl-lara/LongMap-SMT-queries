; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112316 () Bool)

(assert start!112316)

(declare-fun b!1328984 () Bool)

(declare-fun e!757698 () Bool)

(declare-fun tp_is_empty!36397 () Bool)

(assert (=> b!1328984 (= e!757698 tp_is_empty!36397)))

(declare-fun b!1328985 () Bool)

(declare-fun e!757699 () Bool)

(assert (=> b!1328985 (= e!757699 false)))

(declare-fun lt!591213 () Bool)

(declare-datatypes ((array!89805 0))(
  ( (array!89806 (arr!43364 (Array (_ BitVec 32) (_ BitVec 64))) (size!43915 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89805)

(declare-datatypes ((List!30738 0))(
  ( (Nil!30735) (Cons!30734 (h!31952 (_ BitVec 64)) (t!44736 List!30738)) )
))
(declare-fun arrayNoDuplicates!0 (array!89805 (_ BitVec 32) List!30738) Bool)

(assert (=> b!1328985 (= lt!591213 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30735))))

(declare-fun b!1328986 () Bool)

(declare-fun res!881512 () Bool)

(assert (=> b!1328986 (=> (not res!881512) (not e!757699))))

(declare-datatypes ((V!53633 0))(
  ( (V!53634 (val!18273 Int)) )
))
(declare-datatypes ((ValueCell!17300 0))(
  ( (ValueCellFull!17300 (v!20905 V!53633)) (EmptyCell!17300) )
))
(declare-datatypes ((array!89807 0))(
  ( (array!89808 (arr!43365 (Array (_ BitVec 32) ValueCell!17300)) (size!43916 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89807)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328986 (= res!881512 (and (= (size!43916 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43915 _keys!1590) (size!43916 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56269 () Bool)

(declare-fun mapRes!56269 () Bool)

(assert (=> mapIsEmpty!56269 mapRes!56269))

(declare-fun b!1328987 () Bool)

(declare-fun e!757696 () Bool)

(declare-fun e!757697 () Bool)

(assert (=> b!1328987 (= e!757696 (and e!757697 mapRes!56269))))

(declare-fun condMapEmpty!56269 () Bool)

(declare-fun mapDefault!56269 () ValueCell!17300)

(assert (=> b!1328987 (= condMapEmpty!56269 (= (arr!43365 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17300)) mapDefault!56269)))))

(declare-fun mapNonEmpty!56269 () Bool)

(declare-fun tp!107176 () Bool)

(assert (=> mapNonEmpty!56269 (= mapRes!56269 (and tp!107176 e!757698))))

(declare-fun mapKey!56269 () (_ BitVec 32))

(declare-fun mapRest!56269 () (Array (_ BitVec 32) ValueCell!17300))

(declare-fun mapValue!56269 () ValueCell!17300)

(assert (=> mapNonEmpty!56269 (= (arr!43365 _values!1320) (store mapRest!56269 mapKey!56269 mapValue!56269))))

(declare-fun res!881511 () Bool)

(assert (=> start!112316 (=> (not res!881511) (not e!757699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112316 (= res!881511 (validMask!0 mask!1998))))

(assert (=> start!112316 e!757699))

(assert (=> start!112316 true))

(declare-fun array_inv!32993 (array!89807) Bool)

(assert (=> start!112316 (and (array_inv!32993 _values!1320) e!757696)))

(declare-fun array_inv!32994 (array!89805) Bool)

(assert (=> start!112316 (array_inv!32994 _keys!1590)))

(declare-fun b!1328988 () Bool)

(assert (=> b!1328988 (= e!757697 tp_is_empty!36397)))

(declare-fun b!1328989 () Bool)

(declare-fun res!881513 () Bool)

(assert (=> b!1328989 (=> (not res!881513) (not e!757699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89805 (_ BitVec 32)) Bool)

(assert (=> b!1328989 (= res!881513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112316 res!881511) b!1328986))

(assert (= (and b!1328986 res!881512) b!1328989))

(assert (= (and b!1328989 res!881513) b!1328985))

(assert (= (and b!1328987 condMapEmpty!56269) mapIsEmpty!56269))

(assert (= (and b!1328987 (not condMapEmpty!56269)) mapNonEmpty!56269))

(get-info :version)

(assert (= (and mapNonEmpty!56269 ((_ is ValueCellFull!17300) mapValue!56269)) b!1328984))

(assert (= (and b!1328987 ((_ is ValueCellFull!17300) mapDefault!56269)) b!1328988))

(assert (= start!112316 b!1328987))

(declare-fun m!1218515 () Bool)

(assert (=> b!1328985 m!1218515))

(declare-fun m!1218517 () Bool)

(assert (=> mapNonEmpty!56269 m!1218517))

(declare-fun m!1218519 () Bool)

(assert (=> start!112316 m!1218519))

(declare-fun m!1218521 () Bool)

(assert (=> start!112316 m!1218521))

(declare-fun m!1218523 () Bool)

(assert (=> start!112316 m!1218523))

(declare-fun m!1218525 () Bool)

(assert (=> b!1328989 m!1218525))

(check-sat (not start!112316) (not b!1328989) tp_is_empty!36397 (not b!1328985) (not mapNonEmpty!56269))
(check-sat)
