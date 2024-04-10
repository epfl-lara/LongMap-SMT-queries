; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133662 () Bool)

(assert start!133662)

(declare-fun mapNonEmpty!59493 () Bool)

(declare-fun mapRes!59493 () Bool)

(declare-fun tp!113328 () Bool)

(declare-fun e!870928 () Bool)

(assert (=> mapNonEmpty!59493 (= mapRes!59493 (and tp!113328 e!870928))))

(declare-datatypes ((V!59867 0))(
  ( (V!59868 (val!19456 Int)) )
))
(declare-datatypes ((ValueCell!18342 0))(
  ( (ValueCellFull!18342 (v!22208 V!59867)) (EmptyCell!18342) )
))
(declare-fun mapValue!59493 () ValueCell!18342)

(declare-fun mapKey!59493 () (_ BitVec 32))

(declare-datatypes ((array!104196 0))(
  ( (array!104197 (arr!50290 (Array (_ BitVec 32) ValueCell!18342)) (size!50840 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104196)

(declare-fun mapRest!59493 () (Array (_ BitVec 32) ValueCell!18342))

(assert (=> mapNonEmpty!59493 (= (arr!50290 _values!487) (store mapRest!59493 mapKey!59493 mapValue!59493))))

(declare-fun b!1562814 () Bool)

(declare-fun e!870926 () Bool)

(declare-fun tp_is_empty!38745 () Bool)

(assert (=> b!1562814 (= e!870926 tp_is_empty!38745)))

(declare-fun b!1562815 () Bool)

(declare-fun e!870925 () Bool)

(assert (=> b!1562815 (= e!870925 false)))

(declare-fun lt!671787 () Bool)

(declare-datatypes ((array!104198 0))(
  ( (array!104199 (arr!50291 (Array (_ BitVec 32) (_ BitVec 64))) (size!50841 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104198)

(declare-datatypes ((List!36500 0))(
  ( (Nil!36497) (Cons!36496 (h!37942 (_ BitVec 64)) (t!51347 List!36500)) )
))
(declare-fun arrayNoDuplicates!0 (array!104198 (_ BitVec 32) List!36500) Bool)

(assert (=> b!1562815 (= lt!671787 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36497))))

(declare-fun mapIsEmpty!59493 () Bool)

(assert (=> mapIsEmpty!59493 mapRes!59493))

(declare-fun b!1562816 () Bool)

(declare-fun res!1068459 () Bool)

(assert (=> b!1562816 (=> (not res!1068459) (not e!870925))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104198 (_ BitVec 32)) Bool)

(assert (=> b!1562816 (= res!1068459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562817 () Bool)

(assert (=> b!1562817 (= e!870928 tp_is_empty!38745)))

(declare-fun b!1562818 () Bool)

(declare-fun res!1068457 () Bool)

(assert (=> b!1562818 (=> (not res!1068457) (not e!870925))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562818 (= res!1068457 (and (= (size!50840 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50841 _keys!637) (size!50840 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1068458 () Bool)

(assert (=> start!133662 (=> (not res!1068458) (not e!870925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133662 (= res!1068458 (validMask!0 mask!947))))

(assert (=> start!133662 e!870925))

(assert (=> start!133662 true))

(declare-fun e!870927 () Bool)

(declare-fun array_inv!39087 (array!104196) Bool)

(assert (=> start!133662 (and (array_inv!39087 _values!487) e!870927)))

(declare-fun array_inv!39088 (array!104198) Bool)

(assert (=> start!133662 (array_inv!39088 _keys!637)))

(declare-fun b!1562819 () Bool)

(assert (=> b!1562819 (= e!870927 (and e!870926 mapRes!59493))))

(declare-fun condMapEmpty!59493 () Bool)

(declare-fun mapDefault!59493 () ValueCell!18342)

(assert (=> b!1562819 (= condMapEmpty!59493 (= (arr!50290 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18342)) mapDefault!59493)))))

(assert (= (and start!133662 res!1068458) b!1562818))

(assert (= (and b!1562818 res!1068457) b!1562816))

(assert (= (and b!1562816 res!1068459) b!1562815))

(assert (= (and b!1562819 condMapEmpty!59493) mapIsEmpty!59493))

(assert (= (and b!1562819 (not condMapEmpty!59493)) mapNonEmpty!59493))

(get-info :version)

(assert (= (and mapNonEmpty!59493 ((_ is ValueCellFull!18342) mapValue!59493)) b!1562817))

(assert (= (and b!1562819 ((_ is ValueCellFull!18342) mapDefault!59493)) b!1562814))

(assert (= start!133662 b!1562819))

(declare-fun m!1438537 () Bool)

(assert (=> mapNonEmpty!59493 m!1438537))

(declare-fun m!1438539 () Bool)

(assert (=> b!1562815 m!1438539))

(declare-fun m!1438541 () Bool)

(assert (=> b!1562816 m!1438541))

(declare-fun m!1438543 () Bool)

(assert (=> start!133662 m!1438543))

(declare-fun m!1438545 () Bool)

(assert (=> start!133662 m!1438545))

(declare-fun m!1438547 () Bool)

(assert (=> start!133662 m!1438547))

(check-sat (not b!1562816) (not start!133662) (not b!1562815) tp_is_empty!38745 (not mapNonEmpty!59493))
(check-sat)
