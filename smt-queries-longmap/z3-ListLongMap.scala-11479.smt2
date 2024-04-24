; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134084 () Bool)

(assert start!134084)

(declare-fun b!1565340 () Bool)

(declare-fun res!1069363 () Bool)

(declare-fun e!872508 () Bool)

(assert (=> b!1565340 (=> (not res!1069363) (not e!872508))))

(declare-datatypes ((array!104334 0))(
  ( (array!104335 (arr!50352 (Array (_ BitVec 32) (_ BitVec 64))) (size!50903 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104334)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104334 (_ BitVec 32)) Bool)

(assert (=> b!1565340 (= res!1069363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565341 () Bool)

(declare-fun e!872511 () Bool)

(declare-fun e!872510 () Bool)

(declare-fun mapRes!59508 () Bool)

(assert (=> b!1565341 (= e!872511 (and e!872510 mapRes!59508))))

(declare-fun condMapEmpty!59508 () Bool)

(declare-datatypes ((V!59881 0))(
  ( (V!59882 (val!19461 Int)) )
))
(declare-datatypes ((ValueCell!18347 0))(
  ( (ValueCellFull!18347 (v!22205 V!59881)) (EmptyCell!18347) )
))
(declare-datatypes ((array!104336 0))(
  ( (array!104337 (arr!50353 (Array (_ BitVec 32) ValueCell!18347)) (size!50904 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104336)

(declare-fun mapDefault!59508 () ValueCell!18347)

(assert (=> b!1565341 (= condMapEmpty!59508 (= (arr!50353 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18347)) mapDefault!59508)))))

(declare-fun b!1565342 () Bool)

(declare-fun tp_is_empty!38755 () Bool)

(assert (=> b!1565342 (= e!872510 tp_is_empty!38755)))

(declare-fun b!1565343 () Bool)

(declare-fun res!1069362 () Bool)

(assert (=> b!1565343 (=> (not res!1069362) (not e!872508))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565343 (= res!1069362 (and (= (size!50904 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50903 _keys!637) (size!50904 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59508 () Bool)

(declare-fun tp!113343 () Bool)

(declare-fun e!872509 () Bool)

(assert (=> mapNonEmpty!59508 (= mapRes!59508 (and tp!113343 e!872509))))

(declare-fun mapValue!59508 () ValueCell!18347)

(declare-fun mapRest!59508 () (Array (_ BitVec 32) ValueCell!18347))

(declare-fun mapKey!59508 () (_ BitVec 32))

(assert (=> mapNonEmpty!59508 (= (arr!50353 _values!487) (store mapRest!59508 mapKey!59508 mapValue!59508))))

(declare-fun b!1565344 () Bool)

(assert (=> b!1565344 (= e!872509 tp_is_empty!38755)))

(declare-fun res!1069364 () Bool)

(assert (=> start!134084 (=> (not res!1069364) (not e!872508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134084 (= res!1069364 (validMask!0 mask!947))))

(assert (=> start!134084 e!872508))

(assert (=> start!134084 true))

(declare-fun array_inv!39383 (array!104336) Bool)

(assert (=> start!134084 (and (array_inv!39383 _values!487) e!872511)))

(declare-fun array_inv!39384 (array!104334) Bool)

(assert (=> start!134084 (array_inv!39384 _keys!637)))

(declare-fun mapIsEmpty!59508 () Bool)

(assert (=> mapIsEmpty!59508 mapRes!59508))

(declare-fun b!1565345 () Bool)

(assert (=> b!1565345 (= e!872508 false)))

(declare-fun lt!672710 () Bool)

(declare-datatypes ((List!36536 0))(
  ( (Nil!36533) (Cons!36532 (h!37996 (_ BitVec 64)) (t!51375 List!36536)) )
))
(declare-fun arrayNoDuplicates!0 (array!104334 (_ BitVec 32) List!36536) Bool)

(assert (=> b!1565345 (= lt!672710 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36533))))

(assert (= (and start!134084 res!1069364) b!1565343))

(assert (= (and b!1565343 res!1069362) b!1565340))

(assert (= (and b!1565340 res!1069363) b!1565345))

(assert (= (and b!1565341 condMapEmpty!59508) mapIsEmpty!59508))

(assert (= (and b!1565341 (not condMapEmpty!59508)) mapNonEmpty!59508))

(get-info :version)

(assert (= (and mapNonEmpty!59508 ((_ is ValueCellFull!18347) mapValue!59508)) b!1565344))

(assert (= (and b!1565341 ((_ is ValueCellFull!18347) mapDefault!59508)) b!1565342))

(assert (= start!134084 b!1565341))

(declare-fun m!1440855 () Bool)

(assert (=> b!1565340 m!1440855))

(declare-fun m!1440857 () Bool)

(assert (=> mapNonEmpty!59508 m!1440857))

(declare-fun m!1440859 () Bool)

(assert (=> start!134084 m!1440859))

(declare-fun m!1440861 () Bool)

(assert (=> start!134084 m!1440861))

(declare-fun m!1440863 () Bool)

(assert (=> start!134084 m!1440863))

(declare-fun m!1440865 () Bool)

(assert (=> b!1565345 m!1440865))

(check-sat (not start!134084) (not b!1565345) (not b!1565340) tp_is_empty!38755 (not mapNonEmpty!59508))
(check-sat)
