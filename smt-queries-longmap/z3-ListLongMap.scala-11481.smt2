; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133634 () Bool)

(assert start!133634)

(declare-fun b!1562699 () Bool)

(declare-fun res!1068429 () Bool)

(declare-fun e!870892 () Bool)

(assert (=> b!1562699 (=> (not res!1068429) (not e!870892))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104154 0))(
  ( (array!104155 (arr!50270 (Array (_ BitVec 32) (_ BitVec 64))) (size!50822 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104154)

(declare-datatypes ((V!59897 0))(
  ( (V!59898 (val!19467 Int)) )
))
(declare-datatypes ((ValueCell!18353 0))(
  ( (ValueCellFull!18353 (v!22215 V!59897)) (EmptyCell!18353) )
))
(declare-datatypes ((array!104156 0))(
  ( (array!104157 (arr!50271 (Array (_ BitVec 32) ValueCell!18353)) (size!50823 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104156)

(assert (=> b!1562699 (= res!1068429 (and (= (size!50823 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50822 _keys!637) (size!50823 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562700 () Bool)

(declare-fun e!870894 () Bool)

(declare-fun tp_is_empty!38767 () Bool)

(assert (=> b!1562700 (= e!870894 tp_is_empty!38767)))

(declare-fun mapIsEmpty!59526 () Bool)

(declare-fun mapRes!59526 () Bool)

(assert (=> mapIsEmpty!59526 mapRes!59526))

(declare-fun b!1562701 () Bool)

(declare-fun res!1068428 () Bool)

(assert (=> b!1562701 (=> (not res!1068428) (not e!870892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104154 (_ BitVec 32)) Bool)

(assert (=> b!1562701 (= res!1068428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59526 () Bool)

(declare-fun tp!113362 () Bool)

(assert (=> mapNonEmpty!59526 (= mapRes!59526 (and tp!113362 e!870894))))

(declare-fun mapKey!59526 () (_ BitVec 32))

(declare-fun mapRest!59526 () (Array (_ BitVec 32) ValueCell!18353))

(declare-fun mapValue!59526 () ValueCell!18353)

(assert (=> mapNonEmpty!59526 (= (arr!50271 _values!487) (store mapRest!59526 mapKey!59526 mapValue!59526))))

(declare-fun b!1562702 () Bool)

(declare-fun e!870893 () Bool)

(declare-fun e!870895 () Bool)

(assert (=> b!1562702 (= e!870893 (and e!870895 mapRes!59526))))

(declare-fun condMapEmpty!59526 () Bool)

(declare-fun mapDefault!59526 () ValueCell!18353)

(assert (=> b!1562702 (= condMapEmpty!59526 (= (arr!50271 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18353)) mapDefault!59526)))))

(declare-fun res!1068427 () Bool)

(assert (=> start!133634 (=> (not res!1068427) (not e!870892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133634 (= res!1068427 (validMask!0 mask!947))))

(assert (=> start!133634 e!870892))

(assert (=> start!133634 true))

(declare-fun array_inv!39261 (array!104156) Bool)

(assert (=> start!133634 (and (array_inv!39261 _values!487) e!870893)))

(declare-fun array_inv!39262 (array!104154) Bool)

(assert (=> start!133634 (array_inv!39262 _keys!637)))

(declare-fun b!1562703 () Bool)

(assert (=> b!1562703 (= e!870892 false)))

(declare-fun lt!671534 () Bool)

(declare-datatypes ((List!36550 0))(
  ( (Nil!36547) (Cons!36546 (h!37993 (_ BitVec 64)) (t!51389 List!36550)) )
))
(declare-fun arrayNoDuplicates!0 (array!104154 (_ BitVec 32) List!36550) Bool)

(assert (=> b!1562703 (= lt!671534 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36547))))

(declare-fun b!1562704 () Bool)

(assert (=> b!1562704 (= e!870895 tp_is_empty!38767)))

(assert (= (and start!133634 res!1068427) b!1562699))

(assert (= (and b!1562699 res!1068429) b!1562701))

(assert (= (and b!1562701 res!1068428) b!1562703))

(assert (= (and b!1562702 condMapEmpty!59526) mapIsEmpty!59526))

(assert (= (and b!1562702 (not condMapEmpty!59526)) mapNonEmpty!59526))

(get-info :version)

(assert (= (and mapNonEmpty!59526 ((_ is ValueCellFull!18353) mapValue!59526)) b!1562700))

(assert (= (and b!1562702 ((_ is ValueCellFull!18353) mapDefault!59526)) b!1562704))

(assert (= start!133634 b!1562702))

(declare-fun m!1437777 () Bool)

(assert (=> b!1562701 m!1437777))

(declare-fun m!1437779 () Bool)

(assert (=> mapNonEmpty!59526 m!1437779))

(declare-fun m!1437781 () Bool)

(assert (=> start!133634 m!1437781))

(declare-fun m!1437783 () Bool)

(assert (=> start!133634 m!1437783))

(declare-fun m!1437785 () Bool)

(assert (=> start!133634 m!1437785))

(declare-fun m!1437787 () Bool)

(assert (=> b!1562703 m!1437787))

(check-sat (not b!1562701) tp_is_empty!38767 (not start!133634) (not mapNonEmpty!59526) (not b!1562703))
(check-sat)
