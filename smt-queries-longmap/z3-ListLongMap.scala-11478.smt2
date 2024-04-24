; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134078 () Bool)

(assert start!134078)

(declare-fun b!1565286 () Bool)

(declare-fun e!872465 () Bool)

(declare-fun e!872463 () Bool)

(declare-fun mapRes!59499 () Bool)

(assert (=> b!1565286 (= e!872465 (and e!872463 mapRes!59499))))

(declare-fun condMapEmpty!59499 () Bool)

(declare-datatypes ((V!59873 0))(
  ( (V!59874 (val!19458 Int)) )
))
(declare-datatypes ((ValueCell!18344 0))(
  ( (ValueCellFull!18344 (v!22202 V!59873)) (EmptyCell!18344) )
))
(declare-datatypes ((array!104322 0))(
  ( (array!104323 (arr!50346 (Array (_ BitVec 32) ValueCell!18344)) (size!50897 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104322)

(declare-fun mapDefault!59499 () ValueCell!18344)

(assert (=> b!1565286 (= condMapEmpty!59499 (= (arr!50346 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18344)) mapDefault!59499)))))

(declare-fun res!1069336 () Bool)

(declare-fun e!872464 () Bool)

(assert (=> start!134078 (=> (not res!1069336) (not e!872464))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134078 (= res!1069336 (validMask!0 mask!947))))

(assert (=> start!134078 e!872464))

(assert (=> start!134078 true))

(declare-fun array_inv!39377 (array!104322) Bool)

(assert (=> start!134078 (and (array_inv!39377 _values!487) e!872465)))

(declare-datatypes ((array!104324 0))(
  ( (array!104325 (arr!50347 (Array (_ BitVec 32) (_ BitVec 64))) (size!50898 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104324)

(declare-fun array_inv!39378 (array!104324) Bool)

(assert (=> start!134078 (array_inv!39378 _keys!637)))

(declare-fun mapIsEmpty!59499 () Bool)

(assert (=> mapIsEmpty!59499 mapRes!59499))

(declare-fun b!1565287 () Bool)

(assert (=> b!1565287 (= e!872464 false)))

(declare-fun lt!672701 () Bool)

(declare-datatypes ((List!36533 0))(
  ( (Nil!36530) (Cons!36529 (h!37993 (_ BitVec 64)) (t!51372 List!36533)) )
))
(declare-fun arrayNoDuplicates!0 (array!104324 (_ BitVec 32) List!36533) Bool)

(assert (=> b!1565287 (= lt!672701 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36530))))

(declare-fun b!1565288 () Bool)

(declare-fun res!1069335 () Bool)

(assert (=> b!1565288 (=> (not res!1069335) (not e!872464))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565288 (= res!1069335 (and (= (size!50897 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50898 _keys!637) (size!50897 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565289 () Bool)

(declare-fun tp_is_empty!38749 () Bool)

(assert (=> b!1565289 (= e!872463 tp_is_empty!38749)))

(declare-fun b!1565290 () Bool)

(declare-fun res!1069337 () Bool)

(assert (=> b!1565290 (=> (not res!1069337) (not e!872464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104324 (_ BitVec 32)) Bool)

(assert (=> b!1565290 (= res!1069337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59499 () Bool)

(declare-fun tp!113334 () Bool)

(declare-fun e!872466 () Bool)

(assert (=> mapNonEmpty!59499 (= mapRes!59499 (and tp!113334 e!872466))))

(declare-fun mapRest!59499 () (Array (_ BitVec 32) ValueCell!18344))

(declare-fun mapValue!59499 () ValueCell!18344)

(declare-fun mapKey!59499 () (_ BitVec 32))

(assert (=> mapNonEmpty!59499 (= (arr!50346 _values!487) (store mapRest!59499 mapKey!59499 mapValue!59499))))

(declare-fun b!1565291 () Bool)

(assert (=> b!1565291 (= e!872466 tp_is_empty!38749)))

(assert (= (and start!134078 res!1069336) b!1565288))

(assert (= (and b!1565288 res!1069335) b!1565290))

(assert (= (and b!1565290 res!1069337) b!1565287))

(assert (= (and b!1565286 condMapEmpty!59499) mapIsEmpty!59499))

(assert (= (and b!1565286 (not condMapEmpty!59499)) mapNonEmpty!59499))

(get-info :version)

(assert (= (and mapNonEmpty!59499 ((_ is ValueCellFull!18344) mapValue!59499)) b!1565291))

(assert (= (and b!1565286 ((_ is ValueCellFull!18344) mapDefault!59499)) b!1565289))

(assert (= start!134078 b!1565286))

(declare-fun m!1440819 () Bool)

(assert (=> start!134078 m!1440819))

(declare-fun m!1440821 () Bool)

(assert (=> start!134078 m!1440821))

(declare-fun m!1440823 () Bool)

(assert (=> start!134078 m!1440823))

(declare-fun m!1440825 () Bool)

(assert (=> b!1565287 m!1440825))

(declare-fun m!1440827 () Bool)

(assert (=> b!1565290 m!1440827))

(declare-fun m!1440829 () Bool)

(assert (=> mapNonEmpty!59499 m!1440829))

(check-sat (not b!1565290) (not start!134078) tp_is_empty!38749 (not b!1565287) (not mapNonEmpty!59499))
(check-sat)
