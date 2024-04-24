; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35598 () Bool)

(assert start!35598)

(declare-fun b_free!7867 () Bool)

(declare-fun b_next!7867 () Bool)

(assert (=> start!35598 (= b_free!7867 (not b_next!7867))))

(declare-fun tp!27585 () Bool)

(declare-fun b_and!15123 () Bool)

(assert (=> start!35598 (= tp!27585 b_and!15123)))

(declare-fun b!357234 () Bool)

(declare-fun e!218753 () Bool)

(assert (=> b!357234 (= e!218753 true)))

(declare-datatypes ((V!11731 0))(
  ( (V!11732 (val!4077 Int)) )
))
(declare-fun minValue!1150 () V!11731)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19680 0))(
  ( (array!19681 (arr!9333 (Array (_ BitVec 32) (_ BitVec 64))) (size!9685 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19680)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-datatypes ((ValueCell!3689 0))(
  ( (ValueCellFull!3689 (v!6272 V!11731)) (EmptyCell!3689) )
))
(declare-datatypes ((array!19682 0))(
  ( (array!19683 (arr!9334 (Array (_ BitVec 32) ValueCell!3689)) (size!9686 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19682)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11731)

(declare-datatypes ((tuple2!5614 0))(
  ( (tuple2!5615 (_1!2818 (_ BitVec 64)) (_2!2818 V!11731)) )
))
(declare-datatypes ((List!5294 0))(
  ( (Nil!5291) (Cons!5290 (h!6146 tuple2!5614) (t!10436 List!5294)) )
))
(declare-datatypes ((ListLongMap!4529 0))(
  ( (ListLongMap!4530 (toList!2280 List!5294)) )
))
(declare-fun contains!2379 (ListLongMap!4529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1808 (array!19680 array!19682 (_ BitVec 32) (_ BitVec 32) V!11731 V!11731 (_ BitVec 32) Int) ListLongMap!4529)

(assert (=> b!357234 (contains!2379 (getCurrentListMap!1808 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!10995 0))(
  ( (Unit!10996) )
))
(declare-fun lt!166033 () Unit!10995)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun lemmaArrayContainsKeyThenInListMap!347 (array!19680 array!19682 (_ BitVec 32) (_ BitVec 32) V!11731 V!11731 (_ BitVec 64) (_ BitVec 32) Int) Unit!10995)

(assert (=> b!357234 (= lt!166033 (lemmaArrayContainsKeyThenInListMap!347 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357235 () Bool)

(declare-fun res!198403 () Bool)

(declare-fun e!218751 () Bool)

(assert (=> b!357235 (=> (not res!198403) (not e!218751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19680 (_ BitVec 32)) Bool)

(assert (=> b!357235 (= res!198403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357236 () Bool)

(declare-fun e!218750 () Bool)

(declare-fun tp_is_empty!8065 () Bool)

(assert (=> b!357236 (= e!218750 tp_is_empty!8065)))

(declare-fun mapIsEmpty!13605 () Bool)

(declare-fun mapRes!13605 () Bool)

(assert (=> mapIsEmpty!13605 mapRes!13605))

(declare-fun b!357237 () Bool)

(declare-fun res!198399 () Bool)

(assert (=> b!357237 (=> (not res!198399) (not e!218751))))

(declare-datatypes ((List!5295 0))(
  ( (Nil!5292) (Cons!5291 (h!6147 (_ BitVec 64)) (t!10437 List!5295)) )
))
(declare-fun arrayNoDuplicates!0 (array!19680 (_ BitVec 32) List!5295) Bool)

(assert (=> b!357237 (= res!198399 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5292))))

(declare-fun b!357238 () Bool)

(declare-fun res!198401 () Bool)

(assert (=> b!357238 (=> (not res!198401) (not e!218751))))

(declare-fun arrayContainsKey!0 (array!19680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357238 (= res!198401 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357239 () Bool)

(declare-fun res!198396 () Bool)

(assert (=> b!357239 (=> (not res!198396) (not e!218751))))

(assert (=> b!357239 (= res!198396 (not (= (select (arr!9333 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357240 () Bool)

(declare-fun res!198395 () Bool)

(assert (=> b!357240 (=> (not res!198395) (not e!218751))))

(assert (=> b!357240 (= res!198395 (and (= (size!9686 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9685 _keys!1456) (size!9686 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357241 () Bool)

(declare-fun res!198397 () Bool)

(assert (=> b!357241 (=> (not res!198397) (not e!218751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357241 (= res!198397 (validKeyInArray!0 k0!1077))))

(declare-fun b!357242 () Bool)

(assert (=> b!357242 (= e!218751 (not e!218753))))

(declare-fun res!198400 () Bool)

(assert (=> b!357242 (=> res!198400 e!218753)))

(assert (=> b!357242 (= res!198400 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9685 _keys!1456))))))

(assert (=> b!357242 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166034 () Unit!10995)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!26 (array!19680 array!19682 (_ BitVec 32) (_ BitVec 32) V!11731 V!11731 (_ BitVec 64) (_ BitVec 32)) Unit!10995)

(assert (=> b!357242 (= lt!166034 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!26 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357243 () Bool)

(declare-fun e!218755 () Bool)

(declare-fun e!218754 () Bool)

(assert (=> b!357243 (= e!218755 (and e!218754 mapRes!13605))))

(declare-fun condMapEmpty!13605 () Bool)

(declare-fun mapDefault!13605 () ValueCell!3689)

(assert (=> b!357243 (= condMapEmpty!13605 (= (arr!9334 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3689)) mapDefault!13605)))))

(declare-fun mapNonEmpty!13605 () Bool)

(declare-fun tp!27584 () Bool)

(assert (=> mapNonEmpty!13605 (= mapRes!13605 (and tp!27584 e!218750))))

(declare-fun mapValue!13605 () ValueCell!3689)

(declare-fun mapKey!13605 () (_ BitVec 32))

(declare-fun mapRest!13605 () (Array (_ BitVec 32) ValueCell!3689))

(assert (=> mapNonEmpty!13605 (= (arr!9334 _values!1208) (store mapRest!13605 mapKey!13605 mapValue!13605))))

(declare-fun b!357244 () Bool)

(assert (=> b!357244 (= e!218754 tp_is_empty!8065)))

(declare-fun b!357245 () Bool)

(declare-fun res!198398 () Bool)

(assert (=> b!357245 (=> (not res!198398) (not e!218751))))

(assert (=> b!357245 (= res!198398 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9685 _keys!1456))))))

(declare-fun res!198402 () Bool)

(assert (=> start!35598 (=> (not res!198402) (not e!218751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35598 (= res!198402 (validMask!0 mask!1842))))

(assert (=> start!35598 e!218751))

(assert (=> start!35598 tp_is_empty!8065))

(assert (=> start!35598 true))

(assert (=> start!35598 tp!27585))

(declare-fun array_inv!6894 (array!19680) Bool)

(assert (=> start!35598 (array_inv!6894 _keys!1456)))

(declare-fun array_inv!6895 (array!19682) Bool)

(assert (=> start!35598 (and (array_inv!6895 _values!1208) e!218755)))

(assert (= (and start!35598 res!198402) b!357240))

(assert (= (and b!357240 res!198395) b!357235))

(assert (= (and b!357235 res!198403) b!357237))

(assert (= (and b!357237 res!198399) b!357241))

(assert (= (and b!357241 res!198397) b!357245))

(assert (= (and b!357245 res!198398) b!357238))

(assert (= (and b!357238 res!198401) b!357239))

(assert (= (and b!357239 res!198396) b!357242))

(assert (= (and b!357242 (not res!198400)) b!357234))

(assert (= (and b!357243 condMapEmpty!13605) mapIsEmpty!13605))

(assert (= (and b!357243 (not condMapEmpty!13605)) mapNonEmpty!13605))

(get-info :version)

(assert (= (and mapNonEmpty!13605 ((_ is ValueCellFull!3689) mapValue!13605)) b!357236))

(assert (= (and b!357243 ((_ is ValueCellFull!3689) mapDefault!13605)) b!357244))

(assert (= start!35598 b!357243))

(declare-fun m!355623 () Bool)

(assert (=> mapNonEmpty!13605 m!355623))

(declare-fun m!355625 () Bool)

(assert (=> b!357241 m!355625))

(declare-fun m!355627 () Bool)

(assert (=> b!357235 m!355627))

(declare-fun m!355629 () Bool)

(assert (=> b!357234 m!355629))

(assert (=> b!357234 m!355629))

(declare-fun m!355631 () Bool)

(assert (=> b!357234 m!355631))

(declare-fun m!355633 () Bool)

(assert (=> b!357234 m!355633))

(declare-fun m!355635 () Bool)

(assert (=> b!357237 m!355635))

(declare-fun m!355637 () Bool)

(assert (=> b!357239 m!355637))

(declare-fun m!355639 () Bool)

(assert (=> start!35598 m!355639))

(declare-fun m!355641 () Bool)

(assert (=> start!35598 m!355641))

(declare-fun m!355643 () Bool)

(assert (=> start!35598 m!355643))

(declare-fun m!355645 () Bool)

(assert (=> b!357238 m!355645))

(declare-fun m!355647 () Bool)

(assert (=> b!357242 m!355647))

(declare-fun m!355649 () Bool)

(assert (=> b!357242 m!355649))

(check-sat (not b!357234) b_and!15123 (not b!357241) (not b_next!7867) (not b!357242) (not mapNonEmpty!13605) (not b!357238) (not start!35598) (not b!357235) tp_is_empty!8065 (not b!357237))
(check-sat b_and!15123 (not b_next!7867))
