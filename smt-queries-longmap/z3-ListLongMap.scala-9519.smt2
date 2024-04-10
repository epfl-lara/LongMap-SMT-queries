; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112978 () Bool)

(assert start!112978)

(declare-fun mapIsEmpty!57250 () Bool)

(declare-fun mapRes!57250 () Bool)

(assert (=> mapIsEmpty!57250 mapRes!57250))

(declare-fun b!1339175 () Bool)

(declare-fun e!762698 () Bool)

(assert (=> b!1339175 (= e!762698 false)))

(declare-fun lt!593847 () Bool)

(declare-datatypes ((array!90920 0))(
  ( (array!90921 (arr!43916 (Array (_ BitVec 32) (_ BitVec 64))) (size!44466 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90920)

(declare-datatypes ((List!31100 0))(
  ( (Nil!31097) (Cons!31096 (h!32305 (_ BitVec 64)) (t!45432 List!31100)) )
))
(declare-fun arrayNoDuplicates!0 (array!90920 (_ BitVec 32) List!31100) Bool)

(assert (=> b!1339175 (= lt!593847 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31097))))

(declare-fun res!888425 () Bool)

(assert (=> start!112978 (=> (not res!888425) (not e!762698))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112978 (= res!888425 (validMask!0 mask!1977))))

(assert (=> start!112978 e!762698))

(assert (=> start!112978 true))

(declare-datatypes ((V!54475 0))(
  ( (V!54476 (val!18589 Int)) )
))
(declare-datatypes ((ValueCell!17616 0))(
  ( (ValueCellFull!17616 (v!21237 V!54475)) (EmptyCell!17616) )
))
(declare-datatypes ((array!90922 0))(
  ( (array!90923 (arr!43917 (Array (_ BitVec 32) ValueCell!17616)) (size!44467 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90922)

(declare-fun e!762696 () Bool)

(declare-fun array_inv!33115 (array!90922) Bool)

(assert (=> start!112978 (and (array_inv!33115 _values!1303) e!762696)))

(declare-fun array_inv!33116 (array!90920) Bool)

(assert (=> start!112978 (array_inv!33116 _keys!1571)))

(declare-fun mapNonEmpty!57250 () Bool)

(declare-fun tp!108949 () Bool)

(declare-fun e!762694 () Bool)

(assert (=> mapNonEmpty!57250 (= mapRes!57250 (and tp!108949 e!762694))))

(declare-fun mapKey!57250 () (_ BitVec 32))

(declare-fun mapValue!57250 () ValueCell!17616)

(declare-fun mapRest!57250 () (Array (_ BitVec 32) ValueCell!17616))

(assert (=> mapNonEmpty!57250 (= (arr!43917 _values!1303) (store mapRest!57250 mapKey!57250 mapValue!57250))))

(declare-fun b!1339176 () Bool)

(declare-fun e!762697 () Bool)

(assert (=> b!1339176 (= e!762696 (and e!762697 mapRes!57250))))

(declare-fun condMapEmpty!57250 () Bool)

(declare-fun mapDefault!57250 () ValueCell!17616)

(assert (=> b!1339176 (= condMapEmpty!57250 (= (arr!43917 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17616)) mapDefault!57250)))))

(declare-fun b!1339177 () Bool)

(declare-fun tp_is_empty!37029 () Bool)

(assert (=> b!1339177 (= e!762694 tp_is_empty!37029)))

(declare-fun b!1339178 () Bool)

(declare-fun res!888424 () Bool)

(assert (=> b!1339178 (=> (not res!888424) (not e!762698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90920 (_ BitVec 32)) Bool)

(assert (=> b!1339178 (= res!888424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339179 () Bool)

(assert (=> b!1339179 (= e!762697 tp_is_empty!37029)))

(declare-fun b!1339180 () Bool)

(declare-fun res!888426 () Bool)

(assert (=> b!1339180 (=> (not res!888426) (not e!762698))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339180 (= res!888426 (and (= (size!44467 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44466 _keys!1571) (size!44467 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!112978 res!888425) b!1339180))

(assert (= (and b!1339180 res!888426) b!1339178))

(assert (= (and b!1339178 res!888424) b!1339175))

(assert (= (and b!1339176 condMapEmpty!57250) mapIsEmpty!57250))

(assert (= (and b!1339176 (not condMapEmpty!57250)) mapNonEmpty!57250))

(get-info :version)

(assert (= (and mapNonEmpty!57250 ((_ is ValueCellFull!17616) mapValue!57250)) b!1339177))

(assert (= (and b!1339176 ((_ is ValueCellFull!17616) mapDefault!57250)) b!1339179))

(assert (= start!112978 b!1339176))

(declare-fun m!1227325 () Bool)

(assert (=> b!1339175 m!1227325))

(declare-fun m!1227327 () Bool)

(assert (=> start!112978 m!1227327))

(declare-fun m!1227329 () Bool)

(assert (=> start!112978 m!1227329))

(declare-fun m!1227331 () Bool)

(assert (=> start!112978 m!1227331))

(declare-fun m!1227333 () Bool)

(assert (=> mapNonEmpty!57250 m!1227333))

(declare-fun m!1227335 () Bool)

(assert (=> b!1339178 m!1227335))

(check-sat tp_is_empty!37029 (not b!1339178) (not start!112978) (not b!1339175) (not mapNonEmpty!57250))
(check-sat)
