; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133616 () Bool)

(assert start!133616)

(declare-fun b!1562537 () Bool)

(declare-fun res!1068346 () Bool)

(declare-fun e!870757 () Bool)

(assert (=> b!1562537 (=> (not res!1068346) (not e!870757))))

(declare-datatypes ((array!104122 0))(
  ( (array!104123 (arr!50254 (Array (_ BitVec 32) (_ BitVec 64))) (size!50806 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104122)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104122 (_ BitVec 32)) Bool)

(assert (=> b!1562537 (= res!1068346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562538 () Bool)

(declare-fun e!870760 () Bool)

(declare-fun tp_is_empty!38749 () Bool)

(assert (=> b!1562538 (= e!870760 tp_is_empty!38749)))

(declare-fun b!1562539 () Bool)

(declare-fun res!1068348 () Bool)

(assert (=> b!1562539 (=> (not res!1068348) (not e!870757))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59873 0))(
  ( (V!59874 (val!19458 Int)) )
))
(declare-datatypes ((ValueCell!18344 0))(
  ( (ValueCellFull!18344 (v!22206 V!59873)) (EmptyCell!18344) )
))
(declare-datatypes ((array!104124 0))(
  ( (array!104125 (arr!50255 (Array (_ BitVec 32) ValueCell!18344)) (size!50807 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104124)

(assert (=> b!1562539 (= res!1068348 (and (= (size!50807 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50806 _keys!637) (size!50807 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562540 () Bool)

(declare-fun e!870759 () Bool)

(declare-fun mapRes!59499 () Bool)

(assert (=> b!1562540 (= e!870759 (and e!870760 mapRes!59499))))

(declare-fun condMapEmpty!59499 () Bool)

(declare-fun mapDefault!59499 () ValueCell!18344)

(assert (=> b!1562540 (= condMapEmpty!59499 (= (arr!50255 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18344)) mapDefault!59499)))))

(declare-fun b!1562541 () Bool)

(assert (=> b!1562541 (= e!870757 false)))

(declare-fun lt!671507 () Bool)

(declare-datatypes ((List!36544 0))(
  ( (Nil!36541) (Cons!36540 (h!37987 (_ BitVec 64)) (t!51383 List!36544)) )
))
(declare-fun arrayNoDuplicates!0 (array!104122 (_ BitVec 32) List!36544) Bool)

(assert (=> b!1562541 (= lt!671507 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36541))))

(declare-fun res!1068347 () Bool)

(assert (=> start!133616 (=> (not res!1068347) (not e!870757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133616 (= res!1068347 (validMask!0 mask!947))))

(assert (=> start!133616 e!870757))

(assert (=> start!133616 true))

(declare-fun array_inv!39247 (array!104124) Bool)

(assert (=> start!133616 (and (array_inv!39247 _values!487) e!870759)))

(declare-fun array_inv!39248 (array!104122) Bool)

(assert (=> start!133616 (array_inv!39248 _keys!637)))

(declare-fun b!1562542 () Bool)

(declare-fun e!870756 () Bool)

(assert (=> b!1562542 (= e!870756 tp_is_empty!38749)))

(declare-fun mapNonEmpty!59499 () Bool)

(declare-fun tp!113335 () Bool)

(assert (=> mapNonEmpty!59499 (= mapRes!59499 (and tp!113335 e!870756))))

(declare-fun mapValue!59499 () ValueCell!18344)

(declare-fun mapRest!59499 () (Array (_ BitVec 32) ValueCell!18344))

(declare-fun mapKey!59499 () (_ BitVec 32))

(assert (=> mapNonEmpty!59499 (= (arr!50255 _values!487) (store mapRest!59499 mapKey!59499 mapValue!59499))))

(declare-fun mapIsEmpty!59499 () Bool)

(assert (=> mapIsEmpty!59499 mapRes!59499))

(assert (= (and start!133616 res!1068347) b!1562539))

(assert (= (and b!1562539 res!1068348) b!1562537))

(assert (= (and b!1562537 res!1068346) b!1562541))

(assert (= (and b!1562540 condMapEmpty!59499) mapIsEmpty!59499))

(assert (= (and b!1562540 (not condMapEmpty!59499)) mapNonEmpty!59499))

(get-info :version)

(assert (= (and mapNonEmpty!59499 ((_ is ValueCellFull!18344) mapValue!59499)) b!1562542))

(assert (= (and b!1562540 ((_ is ValueCellFull!18344) mapDefault!59499)) b!1562538))

(assert (= start!133616 b!1562540))

(declare-fun m!1437669 () Bool)

(assert (=> b!1562537 m!1437669))

(declare-fun m!1437671 () Bool)

(assert (=> b!1562541 m!1437671))

(declare-fun m!1437673 () Bool)

(assert (=> start!133616 m!1437673))

(declare-fun m!1437675 () Bool)

(assert (=> start!133616 m!1437675))

(declare-fun m!1437677 () Bool)

(assert (=> start!133616 m!1437677))

(declare-fun m!1437679 () Bool)

(assert (=> mapNonEmpty!59499 m!1437679))

(check-sat (not b!1562537) tp_is_empty!38749 (not start!133616) (not mapNonEmpty!59499) (not b!1562541))
(check-sat)
