; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43106 () Bool)

(assert start!43106)

(declare-fun b!478218 () Bool)

(declare-fun e!281094 () Bool)

(declare-fun tp_is_empty!13539 () Bool)

(assert (=> b!478218 (= e!281094 tp_is_empty!13539)))

(declare-fun mapNonEmpty!21988 () Bool)

(declare-fun mapRes!21988 () Bool)

(declare-fun tp!42463 () Bool)

(declare-fun e!281096 () Bool)

(assert (=> mapNonEmpty!21988 (= mapRes!21988 (and tp!42463 e!281096))))

(declare-datatypes ((V!19123 0))(
  ( (V!19124 (val!6817 Int)) )
))
(declare-datatypes ((ValueCell!6408 0))(
  ( (ValueCellFull!6408 (v!9105 V!19123)) (EmptyCell!6408) )
))
(declare-fun mapValue!21988 () ValueCell!6408)

(declare-datatypes ((array!30749 0))(
  ( (array!30750 (arr!14787 (Array (_ BitVec 32) ValueCell!6408)) (size!15145 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30749)

(declare-fun mapKey!21988 () (_ BitVec 32))

(declare-fun mapRest!21988 () (Array (_ BitVec 32) ValueCell!6408))

(assert (=> mapNonEmpty!21988 (= (arr!14787 _values!1516) (store mapRest!21988 mapKey!21988 mapValue!21988))))

(declare-fun mapIsEmpty!21988 () Bool)

(assert (=> mapIsEmpty!21988 mapRes!21988))

(declare-fun b!478220 () Bool)

(declare-fun e!281095 () Bool)

(assert (=> b!478220 (= e!281095 (and e!281094 mapRes!21988))))

(declare-fun condMapEmpty!21988 () Bool)

(declare-fun mapDefault!21988 () ValueCell!6408)

(assert (=> b!478220 (= condMapEmpty!21988 (= (arr!14787 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6408)) mapDefault!21988)))))

(declare-fun b!478221 () Bool)

(assert (=> b!478221 (= e!281096 tp_is_empty!13539)))

(declare-fun res!285361 () Bool)

(declare-fun e!281097 () Bool)

(assert (=> start!43106 (=> (not res!285361) (not e!281097))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43106 (= res!285361 (validMask!0 mask!2352))))

(assert (=> start!43106 e!281097))

(assert (=> start!43106 true))

(declare-fun array_inv!10670 (array!30749) Bool)

(assert (=> start!43106 (and (array_inv!10670 _values!1516) e!281095)))

(declare-datatypes ((array!30751 0))(
  ( (array!30752 (arr!14788 (Array (_ BitVec 32) (_ BitVec 64))) (size!15146 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30751)

(declare-fun array_inv!10671 (array!30751) Bool)

(assert (=> start!43106 (array_inv!10671 _keys!1874)))

(declare-fun b!478219 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478219 (= e!281097 (and (= (size!15145 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15146 _keys!1874) (size!15145 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011) (not (= (size!15146 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352)))))))

(assert (= (and start!43106 res!285361) b!478219))

(assert (= (and b!478220 condMapEmpty!21988) mapIsEmpty!21988))

(assert (= (and b!478220 (not condMapEmpty!21988)) mapNonEmpty!21988))

(get-info :version)

(assert (= (and mapNonEmpty!21988 ((_ is ValueCellFull!6408) mapValue!21988)) b!478221))

(assert (= (and b!478220 ((_ is ValueCellFull!6408) mapDefault!21988)) b!478218))

(assert (= start!43106 b!478220))

(declare-fun m!460581 () Bool)

(assert (=> mapNonEmpty!21988 m!460581))

(declare-fun m!460583 () Bool)

(assert (=> start!43106 m!460583))

(declare-fun m!460585 () Bool)

(assert (=> start!43106 m!460585))

(declare-fun m!460587 () Bool)

(assert (=> start!43106 m!460587))

(check-sat (not start!43106) (not mapNonEmpty!21988) tp_is_empty!13539)
(check-sat)
