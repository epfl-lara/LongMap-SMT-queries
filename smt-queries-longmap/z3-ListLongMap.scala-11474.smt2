; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133592 () Bool)

(assert start!133592)

(declare-fun b!1562321 () Bool)

(declare-fun e!870580 () Bool)

(declare-fun tp_is_empty!38725 () Bool)

(assert (=> b!1562321 (= e!870580 tp_is_empty!38725)))

(declare-fun mapIsEmpty!59463 () Bool)

(declare-fun mapRes!59463 () Bool)

(assert (=> mapIsEmpty!59463 mapRes!59463))

(declare-fun b!1562322 () Bool)

(declare-fun res!1068239 () Bool)

(declare-fun e!870576 () Bool)

(assert (=> b!1562322 (=> (not res!1068239) (not e!870576))))

(declare-datatypes ((array!104076 0))(
  ( (array!104077 (arr!50231 (Array (_ BitVec 32) (_ BitVec 64))) (size!50783 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104076)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104076 (_ BitVec 32)) Bool)

(assert (=> b!1562322 (= res!1068239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562323 () Bool)

(declare-fun res!1068238 () Bool)

(assert (=> b!1562323 (=> (not res!1068238) (not e!870576))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59841 0))(
  ( (V!59842 (val!19446 Int)) )
))
(declare-datatypes ((ValueCell!18332 0))(
  ( (ValueCellFull!18332 (v!22194 V!59841)) (EmptyCell!18332) )
))
(declare-datatypes ((array!104078 0))(
  ( (array!104079 (arr!50232 (Array (_ BitVec 32) ValueCell!18332)) (size!50784 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104078)

(assert (=> b!1562323 (= res!1068238 (and (= (size!50784 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50783 _keys!637) (size!50784 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1068240 () Bool)

(assert (=> start!133592 (=> (not res!1068240) (not e!870576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133592 (= res!1068240 (validMask!0 mask!947))))

(assert (=> start!133592 e!870576))

(assert (=> start!133592 true))

(declare-fun e!870579 () Bool)

(declare-fun array_inv!39229 (array!104078) Bool)

(assert (=> start!133592 (and (array_inv!39229 _values!487) e!870579)))

(declare-fun array_inv!39230 (array!104076) Bool)

(assert (=> start!133592 (array_inv!39230 _keys!637)))

(declare-fun b!1562324 () Bool)

(declare-fun e!870577 () Bool)

(assert (=> b!1562324 (= e!870577 tp_is_empty!38725)))

(declare-fun b!1562325 () Bool)

(assert (=> b!1562325 (= e!870576 false)))

(declare-fun lt!671471 () Bool)

(declare-datatypes ((List!36535 0))(
  ( (Nil!36532) (Cons!36531 (h!37978 (_ BitVec 64)) (t!51374 List!36535)) )
))
(declare-fun arrayNoDuplicates!0 (array!104076 (_ BitVec 32) List!36535) Bool)

(assert (=> b!1562325 (= lt!671471 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36532))))

(declare-fun mapNonEmpty!59463 () Bool)

(declare-fun tp!113299 () Bool)

(assert (=> mapNonEmpty!59463 (= mapRes!59463 (and tp!113299 e!870577))))

(declare-fun mapRest!59463 () (Array (_ BitVec 32) ValueCell!18332))

(declare-fun mapValue!59463 () ValueCell!18332)

(declare-fun mapKey!59463 () (_ BitVec 32))

(assert (=> mapNonEmpty!59463 (= (arr!50232 _values!487) (store mapRest!59463 mapKey!59463 mapValue!59463))))

(declare-fun b!1562326 () Bool)

(assert (=> b!1562326 (= e!870579 (and e!870580 mapRes!59463))))

(declare-fun condMapEmpty!59463 () Bool)

(declare-fun mapDefault!59463 () ValueCell!18332)

(assert (=> b!1562326 (= condMapEmpty!59463 (= (arr!50232 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18332)) mapDefault!59463)))))

(assert (= (and start!133592 res!1068240) b!1562323))

(assert (= (and b!1562323 res!1068238) b!1562322))

(assert (= (and b!1562322 res!1068239) b!1562325))

(assert (= (and b!1562326 condMapEmpty!59463) mapIsEmpty!59463))

(assert (= (and b!1562326 (not condMapEmpty!59463)) mapNonEmpty!59463))

(get-info :version)

(assert (= (and mapNonEmpty!59463 ((_ is ValueCellFull!18332) mapValue!59463)) b!1562324))

(assert (= (and b!1562326 ((_ is ValueCellFull!18332) mapDefault!59463)) b!1562321))

(assert (= start!133592 b!1562326))

(declare-fun m!1437525 () Bool)

(assert (=> b!1562322 m!1437525))

(declare-fun m!1437527 () Bool)

(assert (=> start!133592 m!1437527))

(declare-fun m!1437529 () Bool)

(assert (=> start!133592 m!1437529))

(declare-fun m!1437531 () Bool)

(assert (=> start!133592 m!1437531))

(declare-fun m!1437533 () Bool)

(assert (=> b!1562325 m!1437533))

(declare-fun m!1437535 () Bool)

(assert (=> mapNonEmpty!59463 m!1437535))

(check-sat (not mapNonEmpty!59463) tp_is_empty!38725 (not b!1562322) (not b!1562325) (not start!133592))
(check-sat)
