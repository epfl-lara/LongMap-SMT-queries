; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133460 () Bool)

(assert start!133460)

(declare-fun b!1560443 () Bool)

(declare-fun e!869579 () Bool)

(declare-fun e!869580 () Bool)

(declare-fun mapRes!59265 () Bool)

(assert (=> b!1560443 (= e!869579 (and e!869580 mapRes!59265))))

(declare-fun condMapEmpty!59265 () Bool)

(declare-datatypes ((V!59665 0))(
  ( (V!59666 (val!19380 Int)) )
))
(declare-datatypes ((ValueCell!18266 0))(
  ( (ValueCellFull!18266 (v!22128 V!59665)) (EmptyCell!18266) )
))
(declare-datatypes ((array!103822 0))(
  ( (array!103823 (arr!50104 (Array (_ BitVec 32) ValueCell!18266)) (size!50656 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103822)

(declare-fun mapDefault!59265 () ValueCell!18266)

(assert (=> b!1560443 (= condMapEmpty!59265 (= (arr!50104 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18266)) mapDefault!59265)))))

(declare-fun b!1560445 () Bool)

(declare-fun res!1067070 () Bool)

(declare-fun e!869581 () Bool)

(assert (=> b!1560445 (=> (not res!1067070) (not e!869581))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103824 0))(
  ( (array!103825 (arr!50105 (Array (_ BitVec 32) (_ BitVec 64))) (size!50657 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103824)

(assert (=> b!1560445 (= res!1067070 (and (= (size!50656 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50657 _keys!637) (size!50656 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59265 () Bool)

(assert (=> mapIsEmpty!59265 mapRes!59265))

(declare-fun b!1560446 () Bool)

(declare-fun res!1067068 () Bool)

(assert (=> b!1560446 (=> (not res!1067068) (not e!869581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103824 (_ BitVec 32)) Bool)

(assert (=> b!1560446 (= res!1067068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59265 () Bool)

(declare-fun tp!112921 () Bool)

(declare-fun e!869578 () Bool)

(assert (=> mapNonEmpty!59265 (= mapRes!59265 (and tp!112921 e!869578))))

(declare-fun mapKey!59265 () (_ BitVec 32))

(declare-fun mapRest!59265 () (Array (_ BitVec 32) ValueCell!18266))

(declare-fun mapValue!59265 () ValueCell!18266)

(assert (=> mapNonEmpty!59265 (= (arr!50104 _values!487) (store mapRest!59265 mapKey!59265 mapValue!59265))))

(declare-fun b!1560444 () Bool)

(declare-fun tp_is_empty!38593 () Bool)

(assert (=> b!1560444 (= e!869580 tp_is_empty!38593)))

(declare-fun res!1067069 () Bool)

(assert (=> start!133460 (=> (not res!1067069) (not e!869581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133460 (= res!1067069 (validMask!0 mask!947))))

(assert (=> start!133460 e!869581))

(assert (=> start!133460 true))

(declare-fun array_inv!39141 (array!103822) Bool)

(assert (=> start!133460 (and (array_inv!39141 _values!487) e!869579)))

(declare-fun array_inv!39142 (array!103824) Bool)

(assert (=> start!133460 (array_inv!39142 _keys!637)))

(declare-fun b!1560447 () Bool)

(assert (=> b!1560447 (= e!869581 false)))

(declare-fun lt!670760 () Bool)

(declare-datatypes ((List!36445 0))(
  ( (Nil!36442) (Cons!36441 (h!37888 (_ BitVec 64)) (t!51170 List!36445)) )
))
(declare-fun arrayNoDuplicates!0 (array!103824 (_ BitVec 32) List!36445) Bool)

(assert (=> b!1560447 (= lt!670760 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36442))))

(declare-fun b!1560448 () Bool)

(assert (=> b!1560448 (= e!869578 tp_is_empty!38593)))

(assert (= (and start!133460 res!1067069) b!1560445))

(assert (= (and b!1560445 res!1067070) b!1560446))

(assert (= (and b!1560446 res!1067068) b!1560447))

(assert (= (and b!1560443 condMapEmpty!59265) mapIsEmpty!59265))

(assert (= (and b!1560443 (not condMapEmpty!59265)) mapNonEmpty!59265))

(get-info :version)

(assert (= (and mapNonEmpty!59265 ((_ is ValueCellFull!18266) mapValue!59265)) b!1560448))

(assert (= (and b!1560443 ((_ is ValueCellFull!18266) mapDefault!59265)) b!1560444))

(assert (= start!133460 b!1560443))

(declare-fun m!1435605 () Bool)

(assert (=> b!1560446 m!1435605))

(declare-fun m!1435607 () Bool)

(assert (=> mapNonEmpty!59265 m!1435607))

(declare-fun m!1435609 () Bool)

(assert (=> start!133460 m!1435609))

(declare-fun m!1435611 () Bool)

(assert (=> start!133460 m!1435611))

(declare-fun m!1435613 () Bool)

(assert (=> start!133460 m!1435613))

(declare-fun m!1435615 () Bool)

(assert (=> b!1560447 m!1435615))

(check-sat (not b!1560447) (not b!1560446) (not start!133460) (not mapNonEmpty!59265) tp_is_empty!38593)
(check-sat)
