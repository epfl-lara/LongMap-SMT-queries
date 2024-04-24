; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134246 () Bool)

(assert start!134246)

(declare-fun mapIsEmpty!59704 () Bool)

(declare-fun mapRes!59704 () Bool)

(assert (=> mapIsEmpty!59704 mapRes!59704))

(declare-fun b!1567177 () Bool)

(declare-fun res!1070562 () Bool)

(declare-fun e!873651 () Bool)

(assert (=> b!1567177 (=> (not res!1070562) (not e!873651))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104576 0))(
  ( (array!104577 (arr!50471 (Array (_ BitVec 32) (_ BitVec 64))) (size!51022 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104576)

(declare-datatypes ((V!60049 0))(
  ( (V!60050 (val!19524 Int)) )
))
(declare-datatypes ((ValueCell!18410 0))(
  ( (ValueCellFull!18410 (v!22270 V!60049)) (EmptyCell!18410) )
))
(declare-datatypes ((array!104578 0))(
  ( (array!104579 (arr!50472 (Array (_ BitVec 32) ValueCell!18410)) (size!51023 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104578)

(assert (=> b!1567177 (= res!1070562 (and (= (size!51023 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51022 _keys!637) (size!51023 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567178 () Bool)

(declare-fun e!873652 () Bool)

(declare-fun tp_is_empty!38881 () Bool)

(assert (=> b!1567178 (= e!873652 tp_is_empty!38881)))

(declare-fun b!1567179 () Bool)

(declare-fun res!1070561 () Bool)

(assert (=> b!1567179 (=> (not res!1070561) (not e!873651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104576 (_ BitVec 32)) Bool)

(assert (=> b!1567179 (= res!1070561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567180 () Bool)

(declare-fun e!873648 () Bool)

(assert (=> b!1567180 (= e!873648 tp_is_empty!38881)))

(declare-fun res!1070560 () Bool)

(assert (=> start!134246 (=> (not res!1070560) (not e!873651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134246 (= res!1070560 (validMask!0 mask!947))))

(assert (=> start!134246 e!873651))

(assert (=> start!134246 true))

(declare-fun e!873649 () Bool)

(declare-fun array_inv!39467 (array!104578) Bool)

(assert (=> start!134246 (and (array_inv!39467 _values!487) e!873649)))

(declare-fun array_inv!39468 (array!104576) Bool)

(assert (=> start!134246 (array_inv!39468 _keys!637)))

(declare-fun mapNonEmpty!59704 () Bool)

(declare-fun tp!113629 () Bool)

(assert (=> mapNonEmpty!59704 (= mapRes!59704 (and tp!113629 e!873652))))

(declare-fun mapKey!59704 () (_ BitVec 32))

(declare-fun mapValue!59704 () ValueCell!18410)

(declare-fun mapRest!59704 () (Array (_ BitVec 32) ValueCell!18410))

(assert (=> mapNonEmpty!59704 (= (arr!50472 _values!487) (store mapRest!59704 mapKey!59704 mapValue!59704))))

(declare-fun b!1567181 () Bool)

(assert (=> b!1567181 (= e!873649 (and e!873648 mapRes!59704))))

(declare-fun condMapEmpty!59704 () Bool)

(declare-fun mapDefault!59704 () ValueCell!18410)

(assert (=> b!1567181 (= condMapEmpty!59704 (= (arr!50472 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18410)) mapDefault!59704)))))

(declare-fun b!1567182 () Bool)

(assert (=> b!1567182 (= e!873651 false)))

(declare-fun lt!673009 () Bool)

(declare-datatypes ((List!36612 0))(
  ( (Nil!36609) (Cons!36608 (h!38072 (_ BitVec 64)) (t!51451 List!36612)) )
))
(declare-fun arrayNoDuplicates!0 (array!104576 (_ BitVec 32) List!36612) Bool)

(assert (=> b!1567182 (= lt!673009 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36609))))

(assert (= (and start!134246 res!1070560) b!1567177))

(assert (= (and b!1567177 res!1070562) b!1567179))

(assert (= (and b!1567179 res!1070561) b!1567182))

(assert (= (and b!1567181 condMapEmpty!59704) mapIsEmpty!59704))

(assert (= (and b!1567181 (not condMapEmpty!59704)) mapNonEmpty!59704))

(get-info :version)

(assert (= (and mapNonEmpty!59704 ((_ is ValueCellFull!18410) mapValue!59704)) b!1567178))

(assert (= (and b!1567181 ((_ is ValueCellFull!18410) mapDefault!59704)) b!1567180))

(assert (= start!134246 b!1567181))

(declare-fun m!1442103 () Bool)

(assert (=> b!1567179 m!1442103))

(declare-fun m!1442105 () Bool)

(assert (=> start!134246 m!1442105))

(declare-fun m!1442107 () Bool)

(assert (=> start!134246 m!1442107))

(declare-fun m!1442109 () Bool)

(assert (=> start!134246 m!1442109))

(declare-fun m!1442111 () Bool)

(assert (=> mapNonEmpty!59704 m!1442111))

(declare-fun m!1442113 () Bool)

(assert (=> b!1567182 m!1442113))

(check-sat (not start!134246) (not b!1567182) tp_is_empty!38881 (not mapNonEmpty!59704) (not b!1567179))
(check-sat)
