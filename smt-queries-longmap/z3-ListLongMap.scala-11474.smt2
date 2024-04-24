; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134054 () Bool)

(assert start!134054)

(declare-fun b!1565070 () Bool)

(declare-fun res!1069228 () Bool)

(declare-fun e!872285 () Bool)

(assert (=> b!1565070 (=> (not res!1069228) (not e!872285))))

(declare-datatypes ((array!104276 0))(
  ( (array!104277 (arr!50323 (Array (_ BitVec 32) (_ BitVec 64))) (size!50874 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104276)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104276 (_ BitVec 32)) Bool)

(assert (=> b!1565070 (= res!1069228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565071 () Bool)

(declare-fun res!1069229 () Bool)

(assert (=> b!1565071 (=> (not res!1069229) (not e!872285))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59841 0))(
  ( (V!59842 (val!19446 Int)) )
))
(declare-datatypes ((ValueCell!18332 0))(
  ( (ValueCellFull!18332 (v!22190 V!59841)) (EmptyCell!18332) )
))
(declare-datatypes ((array!104278 0))(
  ( (array!104279 (arr!50324 (Array (_ BitVec 32) ValueCell!18332)) (size!50875 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104278)

(assert (=> b!1565071 (= res!1069229 (and (= (size!50875 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50874 _keys!637) (size!50875 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565073 () Bool)

(declare-fun e!872287 () Bool)

(declare-fun tp_is_empty!38725 () Bool)

(assert (=> b!1565073 (= e!872287 tp_is_empty!38725)))

(declare-fun b!1565074 () Bool)

(declare-fun e!872283 () Bool)

(declare-fun e!872284 () Bool)

(declare-fun mapRes!59463 () Bool)

(assert (=> b!1565074 (= e!872283 (and e!872284 mapRes!59463))))

(declare-fun condMapEmpty!59463 () Bool)

(declare-fun mapDefault!59463 () ValueCell!18332)

(assert (=> b!1565074 (= condMapEmpty!59463 (= (arr!50324 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18332)) mapDefault!59463)))))

(declare-fun mapIsEmpty!59463 () Bool)

(assert (=> mapIsEmpty!59463 mapRes!59463))

(declare-fun mapNonEmpty!59463 () Bool)

(declare-fun tp!113298 () Bool)

(assert (=> mapNonEmpty!59463 (= mapRes!59463 (and tp!113298 e!872287))))

(declare-fun mapKey!59463 () (_ BitVec 32))

(declare-fun mapRest!59463 () (Array (_ BitVec 32) ValueCell!18332))

(declare-fun mapValue!59463 () ValueCell!18332)

(assert (=> mapNonEmpty!59463 (= (arr!50324 _values!487) (store mapRest!59463 mapKey!59463 mapValue!59463))))

(declare-fun b!1565075 () Bool)

(assert (=> b!1565075 (= e!872285 false)))

(declare-fun lt!672665 () Bool)

(declare-datatypes ((List!36524 0))(
  ( (Nil!36521) (Cons!36520 (h!37984 (_ BitVec 64)) (t!51363 List!36524)) )
))
(declare-fun arrayNoDuplicates!0 (array!104276 (_ BitVec 32) List!36524) Bool)

(assert (=> b!1565075 (= lt!672665 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36521))))

(declare-fun res!1069227 () Bool)

(assert (=> start!134054 (=> (not res!1069227) (not e!872285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134054 (= res!1069227 (validMask!0 mask!947))))

(assert (=> start!134054 e!872285))

(assert (=> start!134054 true))

(declare-fun array_inv!39361 (array!104278) Bool)

(assert (=> start!134054 (and (array_inv!39361 _values!487) e!872283)))

(declare-fun array_inv!39362 (array!104276) Bool)

(assert (=> start!134054 (array_inv!39362 _keys!637)))

(declare-fun b!1565072 () Bool)

(assert (=> b!1565072 (= e!872284 tp_is_empty!38725)))

(assert (= (and start!134054 res!1069227) b!1565071))

(assert (= (and b!1565071 res!1069229) b!1565070))

(assert (= (and b!1565070 res!1069228) b!1565075))

(assert (= (and b!1565074 condMapEmpty!59463) mapIsEmpty!59463))

(assert (= (and b!1565074 (not condMapEmpty!59463)) mapNonEmpty!59463))

(get-info :version)

(assert (= (and mapNonEmpty!59463 ((_ is ValueCellFull!18332) mapValue!59463)) b!1565073))

(assert (= (and b!1565074 ((_ is ValueCellFull!18332) mapDefault!59463)) b!1565072))

(assert (= start!134054 b!1565074))

(declare-fun m!1440675 () Bool)

(assert (=> b!1565070 m!1440675))

(declare-fun m!1440677 () Bool)

(assert (=> mapNonEmpty!59463 m!1440677))

(declare-fun m!1440679 () Bool)

(assert (=> b!1565075 m!1440679))

(declare-fun m!1440681 () Bool)

(assert (=> start!134054 m!1440681))

(declare-fun m!1440683 () Bool)

(assert (=> start!134054 m!1440683))

(declare-fun m!1440685 () Bool)

(assert (=> start!134054 m!1440685))

(check-sat (not b!1565070) tp_is_empty!38725 (not mapNonEmpty!59463) (not b!1565075) (not start!134054))
(check-sat)
