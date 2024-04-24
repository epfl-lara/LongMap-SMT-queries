; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35514 () Bool)

(assert start!35514)

(declare-fun b!355971 () Bool)

(declare-fun e!218121 () Bool)

(assert (=> b!355971 (= e!218121 false)))

(declare-fun lt!165905 () Bool)

(declare-datatypes ((array!19524 0))(
  ( (array!19525 (arr!9255 (Array (_ BitVec 32) (_ BitVec 64))) (size!9607 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19524)

(declare-datatypes ((List!5266 0))(
  ( (Nil!5263) (Cons!5262 (h!6118 (_ BitVec 64)) (t!10408 List!5266)) )
))
(declare-fun arrayNoDuplicates!0 (array!19524 (_ BitVec 32) List!5266) Bool)

(assert (=> b!355971 (= lt!165905 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5263))))

(declare-fun mapIsEmpty!13479 () Bool)

(declare-fun mapRes!13479 () Bool)

(assert (=> mapIsEmpty!13479 mapRes!13479))

(declare-fun mapNonEmpty!13479 () Bool)

(declare-fun tp!27456 () Bool)

(declare-fun e!218118 () Bool)

(assert (=> mapNonEmpty!13479 (= mapRes!13479 (and tp!27456 e!218118))))

(declare-datatypes ((V!11619 0))(
  ( (V!11620 (val!4035 Int)) )
))
(declare-datatypes ((ValueCell!3647 0))(
  ( (ValueCellFull!3647 (v!6230 V!11619)) (EmptyCell!3647) )
))
(declare-fun mapValue!13479 () ValueCell!3647)

(declare-fun mapKey!13479 () (_ BitVec 32))

(declare-fun mapRest!13479 () (Array (_ BitVec 32) ValueCell!3647))

(declare-datatypes ((array!19526 0))(
  ( (array!19527 (arr!9256 (Array (_ BitVec 32) ValueCell!3647)) (size!9608 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19526)

(assert (=> mapNonEmpty!13479 (= (arr!9256 _values!1208) (store mapRest!13479 mapKey!13479 mapValue!13479))))

(declare-fun b!355972 () Bool)

(declare-fun e!218119 () Bool)

(declare-fun e!218122 () Bool)

(assert (=> b!355972 (= e!218119 (and e!218122 mapRes!13479))))

(declare-fun condMapEmpty!13479 () Bool)

(declare-fun mapDefault!13479 () ValueCell!3647)

(assert (=> b!355972 (= condMapEmpty!13479 (= (arr!9256 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3647)) mapDefault!13479)))))

(declare-fun res!197510 () Bool)

(assert (=> start!35514 (=> (not res!197510) (not e!218121))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35514 (= res!197510 (validMask!0 mask!1842))))

(assert (=> start!35514 e!218121))

(assert (=> start!35514 true))

(declare-fun array_inv!6842 (array!19526) Bool)

(assert (=> start!35514 (and (array_inv!6842 _values!1208) e!218119)))

(declare-fun array_inv!6843 (array!19524) Bool)

(assert (=> start!35514 (array_inv!6843 _keys!1456)))

(declare-fun b!355973 () Bool)

(declare-fun tp_is_empty!7981 () Bool)

(assert (=> b!355973 (= e!218122 tp_is_empty!7981)))

(declare-fun b!355974 () Bool)

(declare-fun res!197511 () Bool)

(assert (=> b!355974 (=> (not res!197511) (not e!218121))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355974 (= res!197511 (and (= (size!9608 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9607 _keys!1456) (size!9608 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355975 () Bool)

(assert (=> b!355975 (= e!218118 tp_is_empty!7981)))

(declare-fun b!355976 () Bool)

(declare-fun res!197512 () Bool)

(assert (=> b!355976 (=> (not res!197512) (not e!218121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19524 (_ BitVec 32)) Bool)

(assert (=> b!355976 (= res!197512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35514 res!197510) b!355974))

(assert (= (and b!355974 res!197511) b!355976))

(assert (= (and b!355976 res!197512) b!355971))

(assert (= (and b!355972 condMapEmpty!13479) mapIsEmpty!13479))

(assert (= (and b!355972 (not condMapEmpty!13479)) mapNonEmpty!13479))

(get-info :version)

(assert (= (and mapNonEmpty!13479 ((_ is ValueCellFull!3647) mapValue!13479)) b!355975))

(assert (= (and b!355972 ((_ is ValueCellFull!3647) mapDefault!13479)) b!355973))

(assert (= start!35514 b!355972))

(declare-fun m!354789 () Bool)

(assert (=> b!355971 m!354789))

(declare-fun m!354791 () Bool)

(assert (=> mapNonEmpty!13479 m!354791))

(declare-fun m!354793 () Bool)

(assert (=> start!35514 m!354793))

(declare-fun m!354795 () Bool)

(assert (=> start!35514 m!354795))

(declare-fun m!354797 () Bool)

(assert (=> start!35514 m!354797))

(declare-fun m!354799 () Bool)

(assert (=> b!355976 m!354799))

(check-sat (not mapNonEmpty!13479) (not b!355971) tp_is_empty!7981 (not start!35514) (not b!355976))
(check-sat)
