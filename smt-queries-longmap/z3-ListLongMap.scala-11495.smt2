; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133780 () Bool)

(assert start!133780)

(declare-fun b!1564268 () Bool)

(declare-fun e!871851 () Bool)

(declare-fun tp_is_empty!38853 () Bool)

(assert (=> b!1564268 (= e!871851 tp_is_empty!38853)))

(declare-fun mapNonEmpty!59658 () Bool)

(declare-fun mapRes!59658 () Bool)

(declare-fun tp!113583 () Bool)

(declare-fun e!871853 () Bool)

(assert (=> mapNonEmpty!59658 (= mapRes!59658 (and tp!113583 e!871853))))

(declare-datatypes ((V!60011 0))(
  ( (V!60012 (val!19510 Int)) )
))
(declare-datatypes ((ValueCell!18396 0))(
  ( (ValueCellFull!18396 (v!22262 V!60011)) (EmptyCell!18396) )
))
(declare-fun mapValue!59658 () ValueCell!18396)

(declare-fun mapRest!59658 () (Array (_ BitVec 32) ValueCell!18396))

(declare-fun mapKey!59658 () (_ BitVec 32))

(declare-datatypes ((array!104398 0))(
  ( (array!104399 (arr!50390 (Array (_ BitVec 32) ValueCell!18396)) (size!50940 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104398)

(assert (=> mapNonEmpty!59658 (= (arr!50390 _values!487) (store mapRest!59658 mapKey!59658 mapValue!59658))))

(declare-fun b!1564269 () Bool)

(declare-fun e!871854 () Bool)

(assert (=> b!1564269 (= e!871854 false)))

(declare-fun lt!672021 () Bool)

(declare-datatypes ((tuple2!25170 0))(
  ( (tuple2!25171 (_1!12596 (_ BitVec 64)) (_2!12596 V!60011)) )
))
(declare-datatypes ((List!36558 0))(
  ( (Nil!36555) (Cons!36554 (h!38000 tuple2!25170) (t!51405 List!36558)) )
))
(declare-datatypes ((ListLongMap!22605 0))(
  ( (ListLongMap!22606 (toList!11318 List!36558)) )
))
(declare-fun contains!10309 (ListLongMap!22605 (_ BitVec 64)) Bool)

(assert (=> b!1564269 (= lt!672021 (contains!10309 (ListLongMap!22606 Nil!36555) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564270 () Bool)

(declare-fun res!1069409 () Bool)

(assert (=> b!1564270 (=> (not res!1069409) (not e!871854))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104400 0))(
  ( (array!104401 (arr!50391 (Array (_ BitVec 32) (_ BitVec 64))) (size!50941 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104400)

(assert (=> b!1564270 (= res!1069409 (and (= (size!50940 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50941 _keys!637) (size!50940 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564271 () Bool)

(declare-fun res!1069405 () Bool)

(assert (=> b!1564271 (=> (not res!1069405) (not e!871854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104400 (_ BitVec 32)) Bool)

(assert (=> b!1564271 (= res!1069405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564272 () Bool)

(declare-fun res!1069406 () Bool)

(assert (=> b!1564272 (=> (not res!1069406) (not e!871854))))

(assert (=> b!1564272 (= res!1069406 (not (contains!10309 (ListLongMap!22606 Nil!36555) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!59658 () Bool)

(assert (=> mapIsEmpty!59658 mapRes!59658))

(declare-fun b!1564273 () Bool)

(declare-fun res!1069408 () Bool)

(assert (=> b!1564273 (=> (not res!1069408) (not e!871854))))

(declare-datatypes ((List!36559 0))(
  ( (Nil!36556) (Cons!36555 (h!38001 (_ BitVec 64)) (t!51406 List!36559)) )
))
(declare-fun arrayNoDuplicates!0 (array!104400 (_ BitVec 32) List!36559) Bool)

(assert (=> b!1564273 (= res!1069408 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36556))))

(declare-fun b!1564275 () Bool)

(assert (=> b!1564275 (= e!871853 tp_is_empty!38853)))

(declare-fun b!1564276 () Bool)

(declare-fun res!1069410 () Bool)

(assert (=> b!1564276 (=> (not res!1069410) (not e!871854))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564276 (= res!1069410 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50941 _keys!637)) (bvsge from!782 (size!50941 _keys!637))))))

(declare-fun b!1564274 () Bool)

(declare-fun e!871855 () Bool)

(assert (=> b!1564274 (= e!871855 (and e!871851 mapRes!59658))))

(declare-fun condMapEmpty!59658 () Bool)

(declare-fun mapDefault!59658 () ValueCell!18396)

(assert (=> b!1564274 (= condMapEmpty!59658 (= (arr!50390 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18396)) mapDefault!59658)))))

(declare-fun res!1069407 () Bool)

(assert (=> start!133780 (=> (not res!1069407) (not e!871854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133780 (= res!1069407 (validMask!0 mask!947))))

(assert (=> start!133780 e!871854))

(assert (=> start!133780 true))

(declare-fun array_inv!39161 (array!104400) Bool)

(assert (=> start!133780 (array_inv!39161 _keys!637)))

(declare-fun array_inv!39162 (array!104398) Bool)

(assert (=> start!133780 (and (array_inv!39162 _values!487) e!871855)))

(assert (= (and start!133780 res!1069407) b!1564270))

(assert (= (and b!1564270 res!1069409) b!1564271))

(assert (= (and b!1564271 res!1069405) b!1564273))

(assert (= (and b!1564273 res!1069408) b!1564276))

(assert (= (and b!1564276 res!1069410) b!1564272))

(assert (= (and b!1564272 res!1069406) b!1564269))

(assert (= (and b!1564274 condMapEmpty!59658) mapIsEmpty!59658))

(assert (= (and b!1564274 (not condMapEmpty!59658)) mapNonEmpty!59658))

(get-info :version)

(assert (= (and mapNonEmpty!59658 ((_ is ValueCellFull!18396) mapValue!59658)) b!1564275))

(assert (= (and b!1564274 ((_ is ValueCellFull!18396) mapDefault!59658)) b!1564268))

(assert (= start!133780 b!1564274))

(declare-fun m!1439531 () Bool)

(assert (=> b!1564273 m!1439531))

(declare-fun m!1439533 () Bool)

(assert (=> mapNonEmpty!59658 m!1439533))

(declare-fun m!1439535 () Bool)

(assert (=> b!1564272 m!1439535))

(declare-fun m!1439537 () Bool)

(assert (=> b!1564271 m!1439537))

(declare-fun m!1439539 () Bool)

(assert (=> start!133780 m!1439539))

(declare-fun m!1439541 () Bool)

(assert (=> start!133780 m!1439541))

(declare-fun m!1439543 () Bool)

(assert (=> start!133780 m!1439543))

(declare-fun m!1439545 () Bool)

(assert (=> b!1564269 m!1439545))

(check-sat (not start!133780) (not mapNonEmpty!59658) (not b!1564271) (not b!1564269) (not b!1564273) (not b!1564272) tp_is_empty!38853)
(check-sat)
