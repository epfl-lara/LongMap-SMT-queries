; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113114 () Bool)

(assert start!113114)

(declare-fun mapIsEmpty!57169 () Bool)

(declare-fun mapRes!57169 () Bool)

(assert (=> mapIsEmpty!57169 mapRes!57169))

(declare-fun res!888678 () Bool)

(declare-fun e!763114 () Bool)

(assert (=> start!113114 (=> (not res!888678) (not e!763114))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113114 (= res!888678 (validMask!0 mask!1977))))

(assert (=> start!113114 e!763114))

(assert (=> start!113114 true))

(declare-datatypes ((V!54417 0))(
  ( (V!54418 (val!18567 Int)) )
))
(declare-datatypes ((ValueCell!17594 0))(
  ( (ValueCellFull!17594 (v!21209 V!54417)) (EmptyCell!17594) )
))
(declare-datatypes ((array!90951 0))(
  ( (array!90952 (arr!43932 (Array (_ BitVec 32) ValueCell!17594)) (size!44483 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90951)

(declare-fun e!763115 () Bool)

(declare-fun array_inv!33395 (array!90951) Bool)

(assert (=> start!113114 (and (array_inv!33395 _values!1303) e!763115)))

(declare-datatypes ((array!90953 0))(
  ( (array!90954 (arr!43933 (Array (_ BitVec 32) (_ BitVec 64))) (size!44484 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90953)

(declare-fun array_inv!33396 (array!90953) Bool)

(assert (=> start!113114 (array_inv!33396 _keys!1571)))

(declare-fun b!1339948 () Bool)

(declare-fun e!763112 () Bool)

(declare-fun tp_is_empty!36985 () Bool)

(assert (=> b!1339948 (= e!763112 tp_is_empty!36985)))

(declare-fun b!1339949 () Bool)

(declare-fun e!763113 () Bool)

(assert (=> b!1339949 (= e!763113 tp_is_empty!36985)))

(declare-fun mapNonEmpty!57169 () Bool)

(declare-fun tp!108868 () Bool)

(assert (=> mapNonEmpty!57169 (= mapRes!57169 (and tp!108868 e!763113))))

(declare-fun mapRest!57169 () (Array (_ BitVec 32) ValueCell!17594))

(declare-fun mapValue!57169 () ValueCell!17594)

(declare-fun mapKey!57169 () (_ BitVec 32))

(assert (=> mapNonEmpty!57169 (= (arr!43932 _values!1303) (store mapRest!57169 mapKey!57169 mapValue!57169))))

(declare-fun b!1339950 () Bool)

(assert (=> b!1339950 (= e!763115 (and e!763112 mapRes!57169))))

(declare-fun condMapEmpty!57169 () Bool)

(declare-fun mapDefault!57169 () ValueCell!17594)

(assert (=> b!1339950 (= condMapEmpty!57169 (= (arr!43932 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17594)) mapDefault!57169)))))

(declare-fun b!1339951 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339951 (= e!763114 (and (= (size!44483 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44484 _keys!1571) (size!44483 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011) (= (size!44484 _keys!1571) (bvadd #b00000000000000000000000000000001 mask!1977)) (bvsgt #b00000000000000000000000000000000 (size!44484 _keys!1571))))))

(assert (= (and start!113114 res!888678) b!1339951))

(assert (= (and b!1339950 condMapEmpty!57169) mapIsEmpty!57169))

(assert (= (and b!1339950 (not condMapEmpty!57169)) mapNonEmpty!57169))

(get-info :version)

(assert (= (and mapNonEmpty!57169 ((_ is ValueCellFull!17594) mapValue!57169)) b!1339949))

(assert (= (and b!1339950 ((_ is ValueCellFull!17594) mapDefault!57169)) b!1339948))

(assert (= start!113114 b!1339950))

(declare-fun m!1228595 () Bool)

(assert (=> start!113114 m!1228595))

(declare-fun m!1228597 () Bool)

(assert (=> start!113114 m!1228597))

(declare-fun m!1228599 () Bool)

(assert (=> start!113114 m!1228599))

(declare-fun m!1228601 () Bool)

(assert (=> mapNonEmpty!57169 m!1228601))

(check-sat (not start!113114) (not mapNonEmpty!57169) tp_is_empty!36985)
(check-sat)
(get-model)

(declare-fun d!144517 () Bool)

(assert (=> d!144517 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113114 d!144517))

(declare-fun d!144519 () Bool)

(assert (=> d!144519 (= (array_inv!33395 _values!1303) (bvsge (size!44483 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113114 d!144519))

(declare-fun d!144521 () Bool)

(assert (=> d!144521 (= (array_inv!33396 _keys!1571) (bvsge (size!44484 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113114 d!144521))

(declare-fun b!1339982 () Bool)

(declare-fun e!763152 () Bool)

(assert (=> b!1339982 (= e!763152 tp_is_empty!36985)))

(declare-fun mapIsEmpty!57178 () Bool)

(declare-fun mapRes!57178 () Bool)

(assert (=> mapIsEmpty!57178 mapRes!57178))

(declare-fun condMapEmpty!57178 () Bool)

(declare-fun mapDefault!57178 () ValueCell!17594)

(assert (=> mapNonEmpty!57169 (= condMapEmpty!57178 (= mapRest!57169 ((as const (Array (_ BitVec 32) ValueCell!17594)) mapDefault!57178)))))

(declare-fun e!763151 () Bool)

(assert (=> mapNonEmpty!57169 (= tp!108868 (and e!763151 mapRes!57178))))

(declare-fun mapNonEmpty!57178 () Bool)

(declare-fun tp!108877 () Bool)

(assert (=> mapNonEmpty!57178 (= mapRes!57178 (and tp!108877 e!763152))))

(declare-fun mapValue!57178 () ValueCell!17594)

(declare-fun mapRest!57178 () (Array (_ BitVec 32) ValueCell!17594))

(declare-fun mapKey!57178 () (_ BitVec 32))

(assert (=> mapNonEmpty!57178 (= mapRest!57169 (store mapRest!57178 mapKey!57178 mapValue!57178))))

(declare-fun b!1339983 () Bool)

(assert (=> b!1339983 (= e!763151 tp_is_empty!36985)))

(assert (= (and mapNonEmpty!57169 condMapEmpty!57178) mapIsEmpty!57178))

(assert (= (and mapNonEmpty!57169 (not condMapEmpty!57178)) mapNonEmpty!57178))

(assert (= (and mapNonEmpty!57178 ((_ is ValueCellFull!17594) mapValue!57178)) b!1339982))

(assert (= (and mapNonEmpty!57169 ((_ is ValueCellFull!17594) mapDefault!57178)) b!1339983))

(declare-fun m!1228619 () Bool)

(assert (=> mapNonEmpty!57178 m!1228619))

(check-sat (not mapNonEmpty!57178) tp_is_empty!36985)
(check-sat)
