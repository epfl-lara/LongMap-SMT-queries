; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35728 () Bool)

(assert start!35728)

(declare-fun b!358841 () Bool)

(declare-fun res!199430 () Bool)

(declare-fun e!219733 () Bool)

(assert (=> b!358841 (=> (not res!199430) (not e!219733))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19923 0))(
  ( (array!19924 (arr!9455 (Array (_ BitVec 32) (_ BitVec 64))) (size!9807 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19923)

(declare-datatypes ((V!11885 0))(
  ( (V!11886 (val!4135 Int)) )
))
(declare-datatypes ((ValueCell!3747 0))(
  ( (ValueCellFull!3747 (v!6329 V!11885)) (EmptyCell!3747) )
))
(declare-datatypes ((array!19925 0))(
  ( (array!19926 (arr!9456 (Array (_ BitVec 32) ValueCell!3747)) (size!9808 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19925)

(assert (=> b!358841 (= res!199430 (and (= (size!9808 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9807 _keys!1456) (size!9808 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199432 () Bool)

(assert (=> start!35728 (=> (not res!199432) (not e!219733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35728 (= res!199432 (validMask!0 mask!1842))))

(assert (=> start!35728 e!219733))

(assert (=> start!35728 true))

(declare-fun e!219734 () Bool)

(declare-fun array_inv!6954 (array!19925) Bool)

(assert (=> start!35728 (and (array_inv!6954 _values!1208) e!219734)))

(declare-fun array_inv!6955 (array!19923) Bool)

(assert (=> start!35728 (array_inv!6955 _keys!1456)))

(declare-fun mapIsEmpty!13779 () Bool)

(declare-fun mapRes!13779 () Bool)

(assert (=> mapIsEmpty!13779 mapRes!13779))

(declare-fun b!358842 () Bool)

(declare-fun res!199431 () Bool)

(assert (=> b!358842 (=> (not res!199431) (not e!219733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19923 (_ BitVec 32)) Bool)

(assert (=> b!358842 (= res!199431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13779 () Bool)

(declare-fun tp!27837 () Bool)

(declare-fun e!219737 () Bool)

(assert (=> mapNonEmpty!13779 (= mapRes!13779 (and tp!27837 e!219737))))

(declare-fun mapRest!13779 () (Array (_ BitVec 32) ValueCell!3747))

(declare-fun mapValue!13779 () ValueCell!3747)

(declare-fun mapKey!13779 () (_ BitVec 32))

(assert (=> mapNonEmpty!13779 (= (arr!9456 _values!1208) (store mapRest!13779 mapKey!13779 mapValue!13779))))

(declare-fun b!358843 () Bool)

(assert (=> b!358843 (= e!219733 false)))

(declare-fun lt!166259 () Bool)

(declare-datatypes ((List!5447 0))(
  ( (Nil!5444) (Cons!5443 (h!6299 (_ BitVec 64)) (t!10597 List!5447)) )
))
(declare-fun arrayNoDuplicates!0 (array!19923 (_ BitVec 32) List!5447) Bool)

(assert (=> b!358843 (= lt!166259 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5444))))

(declare-fun b!358844 () Bool)

(declare-fun e!219735 () Bool)

(assert (=> b!358844 (= e!219734 (and e!219735 mapRes!13779))))

(declare-fun condMapEmpty!13779 () Bool)

(declare-fun mapDefault!13779 () ValueCell!3747)

(assert (=> b!358844 (= condMapEmpty!13779 (= (arr!9456 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3747)) mapDefault!13779)))))

(declare-fun b!358845 () Bool)

(declare-fun tp_is_empty!8181 () Bool)

(assert (=> b!358845 (= e!219735 tp_is_empty!8181)))

(declare-fun b!358846 () Bool)

(assert (=> b!358846 (= e!219737 tp_is_empty!8181)))

(assert (= (and start!35728 res!199432) b!358841))

(assert (= (and b!358841 res!199430) b!358842))

(assert (= (and b!358842 res!199431) b!358843))

(assert (= (and b!358844 condMapEmpty!13779) mapIsEmpty!13779))

(assert (= (and b!358844 (not condMapEmpty!13779)) mapNonEmpty!13779))

(get-info :version)

(assert (= (and mapNonEmpty!13779 ((_ is ValueCellFull!3747) mapValue!13779)) b!358846))

(assert (= (and b!358844 ((_ is ValueCellFull!3747) mapDefault!13779)) b!358845))

(assert (= start!35728 b!358844))

(declare-fun m!356539 () Bool)

(assert (=> start!35728 m!356539))

(declare-fun m!356541 () Bool)

(assert (=> start!35728 m!356541))

(declare-fun m!356543 () Bool)

(assert (=> start!35728 m!356543))

(declare-fun m!356545 () Bool)

(assert (=> b!358842 m!356545))

(declare-fun m!356547 () Bool)

(assert (=> mapNonEmpty!13779 m!356547))

(declare-fun m!356549 () Bool)

(assert (=> b!358843 m!356549))

(check-sat tp_is_empty!8181 (not start!35728) (not b!358842) (not mapNonEmpty!13779) (not b!358843))
(check-sat)
