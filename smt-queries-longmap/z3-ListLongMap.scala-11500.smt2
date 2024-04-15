; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133784 () Bool)

(assert start!133784)

(declare-fun res!1069571 () Bool)

(declare-fun e!871945 () Bool)

(assert (=> start!133784 (=> (not res!1069571) (not e!871945))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133784 (= res!1069571 (validMask!0 mask!947))))

(assert (=> start!133784 e!871945))

(assert (=> start!133784 true))

(declare-datatypes ((V!60049 0))(
  ( (V!60050 (val!19524 Int)) )
))
(declare-datatypes ((ValueCell!18410 0))(
  ( (ValueCellFull!18410 (v!22274 V!60049)) (EmptyCell!18410) )
))
(declare-datatypes ((array!104382 0))(
  ( (array!104383 (arr!50382 (Array (_ BitVec 32) ValueCell!18410)) (size!50934 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104382)

(declare-fun e!871943 () Bool)

(declare-fun array_inv!39353 (array!104382) Bool)

(assert (=> start!133784 (and (array_inv!39353 _values!487) e!871943)))

(declare-datatypes ((array!104384 0))(
  ( (array!104385 (arr!50383 (Array (_ BitVec 32) (_ BitVec 64))) (size!50935 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104384)

(declare-fun array_inv!39354 (array!104384) Bool)

(assert (=> start!133784 (array_inv!39354 _keys!637)))

(declare-fun mapIsEmpty!59704 () Bool)

(declare-fun mapRes!59704 () Bool)

(assert (=> mapIsEmpty!59704 mapRes!59704))

(declare-fun mapNonEmpty!59704 () Bool)

(declare-fun tp!113630 () Bool)

(declare-fun e!871941 () Bool)

(assert (=> mapNonEmpty!59704 (= mapRes!59704 (and tp!113630 e!871941))))

(declare-fun mapRest!59704 () (Array (_ BitVec 32) ValueCell!18410))

(declare-fun mapValue!59704 () ValueCell!18410)

(declare-fun mapKey!59704 () (_ BitVec 32))

(assert (=> mapNonEmpty!59704 (= (arr!50382 _values!487) (store mapRest!59704 mapKey!59704 mapValue!59704))))

(declare-fun b!1564428 () Bool)

(declare-fun res!1069572 () Bool)

(assert (=> b!1564428 (=> (not res!1069572) (not e!871945))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564428 (= res!1069572 (and (= (size!50934 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50935 _keys!637) (size!50934 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564429 () Bool)

(declare-fun res!1069573 () Bool)

(assert (=> b!1564429 (=> (not res!1069573) (not e!871945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104384 (_ BitVec 32)) Bool)

(assert (=> b!1564429 (= res!1069573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564430 () Bool)

(declare-fun tp_is_empty!38881 () Bool)

(assert (=> b!1564430 (= e!871941 tp_is_empty!38881)))

(declare-fun b!1564431 () Bool)

(declare-fun e!871944 () Bool)

(assert (=> b!1564431 (= e!871944 tp_is_empty!38881)))

(declare-fun b!1564432 () Bool)

(assert (=> b!1564432 (= e!871943 (and e!871944 mapRes!59704))))

(declare-fun condMapEmpty!59704 () Bool)

(declare-fun mapDefault!59704 () ValueCell!18410)

(assert (=> b!1564432 (= condMapEmpty!59704 (= (arr!50382 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18410)) mapDefault!59704)))))

(declare-fun b!1564433 () Bool)

(assert (=> b!1564433 (= e!871945 false)))

(declare-fun lt!671815 () Bool)

(declare-datatypes ((List!36630 0))(
  ( (Nil!36627) (Cons!36626 (h!38073 (_ BitVec 64)) (t!51469 List!36630)) )
))
(declare-fun arrayNoDuplicates!0 (array!104384 (_ BitVec 32) List!36630) Bool)

(assert (=> b!1564433 (= lt!671815 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36627))))

(assert (= (and start!133784 res!1069571) b!1564428))

(assert (= (and b!1564428 res!1069572) b!1564429))

(assert (= (and b!1564429 res!1069573) b!1564433))

(assert (= (and b!1564432 condMapEmpty!59704) mapIsEmpty!59704))

(assert (= (and b!1564432 (not condMapEmpty!59704)) mapNonEmpty!59704))

(get-info :version)

(assert (= (and mapNonEmpty!59704 ((_ is ValueCellFull!18410) mapValue!59704)) b!1564430))

(assert (= (and b!1564432 ((_ is ValueCellFull!18410) mapDefault!59704)) b!1564431))

(assert (= start!133784 b!1564432))

(declare-fun m!1438953 () Bool)

(assert (=> start!133784 m!1438953))

(declare-fun m!1438955 () Bool)

(assert (=> start!133784 m!1438955))

(declare-fun m!1438957 () Bool)

(assert (=> start!133784 m!1438957))

(declare-fun m!1438959 () Bool)

(assert (=> mapNonEmpty!59704 m!1438959))

(declare-fun m!1438961 () Bool)

(assert (=> b!1564429 m!1438961))

(declare-fun m!1438963 () Bool)

(assert (=> b!1564433 m!1438963))

(check-sat (not b!1564429) (not start!133784) (not b!1564433) (not mapNonEmpty!59704) tp_is_empty!38881)
(check-sat)
