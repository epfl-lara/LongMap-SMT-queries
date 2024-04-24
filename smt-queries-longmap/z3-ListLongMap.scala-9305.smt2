; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111446 () Bool)

(assert start!111446)

(declare-fun b!1318004 () Bool)

(declare-fun e!752012 () Bool)

(declare-fun tp_is_empty!35743 () Bool)

(assert (=> b!1318004 (= e!752012 tp_is_empty!35743)))

(declare-fun mapIsEmpty!55247 () Bool)

(declare-fun mapRes!55247 () Bool)

(assert (=> mapIsEmpty!55247 mapRes!55247))

(declare-fun res!874532 () Bool)

(declare-fun e!752010 () Bool)

(assert (=> start!111446 (=> (not res!874532) (not e!752010))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111446 (= res!874532 (validMask!0 mask!2019))))

(assert (=> start!111446 e!752010))

(assert (=> start!111446 true))

(declare-datatypes ((V!52761 0))(
  ( (V!52762 (val!17946 Int)) )
))
(declare-datatypes ((ValueCell!16973 0))(
  ( (ValueCellFull!16973 (v!20570 V!52761)) (EmptyCell!16973) )
))
(declare-datatypes ((array!88501 0))(
  ( (array!88502 (arr!42725 (Array (_ BitVec 32) ValueCell!16973)) (size!43276 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88501)

(declare-fun e!752009 () Bool)

(declare-fun array_inv!32535 (array!88501) Bool)

(assert (=> start!111446 (and (array_inv!32535 _values!1337) e!752009)))

(declare-datatypes ((array!88503 0))(
  ( (array!88504 (arr!42726 (Array (_ BitVec 32) (_ BitVec 64))) (size!43277 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88503)

(declare-fun array_inv!32536 (array!88503) Bool)

(assert (=> start!111446 (array_inv!32536 _keys!1609)))

(declare-fun b!1318005 () Bool)

(declare-fun e!752008 () Bool)

(assert (=> b!1318005 (= e!752009 (and e!752008 mapRes!55247))))

(declare-fun condMapEmpty!55247 () Bool)

(declare-fun mapDefault!55247 () ValueCell!16973)

(assert (=> b!1318005 (= condMapEmpty!55247 (= (arr!42725 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16973)) mapDefault!55247)))))

(declare-fun b!1318006 () Bool)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318006 (= e!752010 (and (= (size!43276 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43277 _keys!1609) (size!43276 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011) (= (size!43277 _keys!1609) (bvadd #b00000000000000000000000000000001 mask!2019)) (bvsgt #b00000000000000000000000000000000 (size!43277 _keys!1609))))))

(declare-fun mapNonEmpty!55247 () Bool)

(declare-fun tp!105353 () Bool)

(assert (=> mapNonEmpty!55247 (= mapRes!55247 (and tp!105353 e!752012))))

(declare-fun mapKey!55247 () (_ BitVec 32))

(declare-fun mapValue!55247 () ValueCell!16973)

(declare-fun mapRest!55247 () (Array (_ BitVec 32) ValueCell!16973))

(assert (=> mapNonEmpty!55247 (= (arr!42725 _values!1337) (store mapRest!55247 mapKey!55247 mapValue!55247))))

(declare-fun b!1318007 () Bool)

(assert (=> b!1318007 (= e!752008 tp_is_empty!35743)))

(assert (= (and start!111446 res!874532) b!1318006))

(assert (= (and b!1318005 condMapEmpty!55247) mapIsEmpty!55247))

(assert (= (and b!1318005 (not condMapEmpty!55247)) mapNonEmpty!55247))

(get-info :version)

(assert (= (and mapNonEmpty!55247 ((_ is ValueCellFull!16973) mapValue!55247)) b!1318004))

(assert (= (and b!1318005 ((_ is ValueCellFull!16973) mapDefault!55247)) b!1318007))

(assert (= start!111446 b!1318005))

(declare-fun m!1206433 () Bool)

(assert (=> start!111446 m!1206433))

(declare-fun m!1206435 () Bool)

(assert (=> start!111446 m!1206435))

(declare-fun m!1206437 () Bool)

(assert (=> start!111446 m!1206437))

(declare-fun m!1206439 () Bool)

(assert (=> mapNonEmpty!55247 m!1206439))

(check-sat (not start!111446) (not mapNonEmpty!55247) tp_is_empty!35743)
(check-sat)
(get-model)

(declare-fun d!143115 () Bool)

(assert (=> d!143115 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111446 d!143115))

(declare-fun d!143117 () Bool)

(assert (=> d!143117 (= (array_inv!32535 _values!1337) (bvsge (size!43276 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111446 d!143117))

(declare-fun d!143119 () Bool)

(assert (=> d!143119 (= (array_inv!32536 _keys!1609) (bvsge (size!43277 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111446 d!143119))

(declare-fun b!1318039 () Bool)

(declare-fun e!752048 () Bool)

(assert (=> b!1318039 (= e!752048 tp_is_empty!35743)))

(declare-fun condMapEmpty!55256 () Bool)

(declare-fun mapDefault!55256 () ValueCell!16973)

(assert (=> mapNonEmpty!55247 (= condMapEmpty!55256 (= mapRest!55247 ((as const (Array (_ BitVec 32) ValueCell!16973)) mapDefault!55256)))))

(declare-fun mapRes!55256 () Bool)

(assert (=> mapNonEmpty!55247 (= tp!105353 (and e!752048 mapRes!55256))))

(declare-fun b!1318038 () Bool)

(declare-fun e!752047 () Bool)

(assert (=> b!1318038 (= e!752047 tp_is_empty!35743)))

(declare-fun mapNonEmpty!55256 () Bool)

(declare-fun tp!105362 () Bool)

(assert (=> mapNonEmpty!55256 (= mapRes!55256 (and tp!105362 e!752047))))

(declare-fun mapValue!55256 () ValueCell!16973)

(declare-fun mapRest!55256 () (Array (_ BitVec 32) ValueCell!16973))

(declare-fun mapKey!55256 () (_ BitVec 32))

(assert (=> mapNonEmpty!55256 (= mapRest!55247 (store mapRest!55256 mapKey!55256 mapValue!55256))))

(declare-fun mapIsEmpty!55256 () Bool)

(assert (=> mapIsEmpty!55256 mapRes!55256))

(assert (= (and mapNonEmpty!55247 condMapEmpty!55256) mapIsEmpty!55256))

(assert (= (and mapNonEmpty!55247 (not condMapEmpty!55256)) mapNonEmpty!55256))

(assert (= (and mapNonEmpty!55256 ((_ is ValueCellFull!16973) mapValue!55256)) b!1318038))

(assert (= (and mapNonEmpty!55247 ((_ is ValueCellFull!16973) mapDefault!55256)) b!1318039))

(declare-fun m!1206457 () Bool)

(assert (=> mapNonEmpty!55256 m!1206457))

(check-sat (not mapNonEmpty!55256) tp_is_empty!35743)
(check-sat)
