; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82262 () Bool)

(assert start!82262)

(declare-fun b_free!18553 () Bool)

(declare-fun b_next!18553 () Bool)

(assert (=> start!82262 (= b_free!18553 (not b_next!18553))))

(declare-fun tp!64620 () Bool)

(declare-fun b_and!30015 () Bool)

(assert (=> start!82262 (= tp!64620 b_and!30015)))

(declare-fun b!958943 () Bool)

(declare-fun e!540572 () Bool)

(declare-fun e!540570 () Bool)

(declare-fun mapRes!33868 () Bool)

(assert (=> b!958943 (= e!540572 (and e!540570 mapRes!33868))))

(declare-fun condMapEmpty!33868 () Bool)

(declare-datatypes ((V!33329 0))(
  ( (V!33330 (val!10680 Int)) )
))
(declare-datatypes ((ValueCell!10148 0))(
  ( (ValueCellFull!10148 (v!13236 V!33329)) (EmptyCell!10148) )
))
(declare-datatypes ((array!58546 0))(
  ( (array!58547 (arr!28147 (Array (_ BitVec 32) ValueCell!10148)) (size!28628 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58546)

(declare-fun mapDefault!33868 () ValueCell!10148)

(assert (=> b!958943 (= condMapEmpty!33868 (= (arr!28147 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10148)) mapDefault!33868)))))

(declare-fun res!641945 () Bool)

(declare-fun e!540571 () Bool)

(assert (=> start!82262 (=> (not res!641945) (not e!540571))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82262 (= res!641945 (validMask!0 mask!2088))))

(assert (=> start!82262 e!540571))

(assert (=> start!82262 true))

(declare-fun tp_is_empty!21259 () Bool)

(assert (=> start!82262 tp_is_empty!21259))

(declare-datatypes ((array!58548 0))(
  ( (array!58549 (arr!28148 (Array (_ BitVec 32) (_ BitVec 64))) (size!28629 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58548)

(declare-fun array_inv!21881 (array!58548) Bool)

(assert (=> start!82262 (array_inv!21881 _keys!1668)))

(declare-fun array_inv!21882 (array!58546) Bool)

(assert (=> start!82262 (and (array_inv!21882 _values!1386) e!540572)))

(assert (=> start!82262 tp!64620))

(declare-fun b!958944 () Bool)

(assert (=> b!958944 (= e!540570 tp_is_empty!21259)))

(declare-fun b!958945 () Bool)

(declare-fun res!641944 () Bool)

(assert (=> b!958945 (=> (not res!641944) (not e!540571))))

(declare-fun minValue!1328 () V!33329)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33329)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13818 0))(
  ( (tuple2!13819 (_1!6920 (_ BitVec 64)) (_2!6920 V!33329)) )
))
(declare-datatypes ((List!19602 0))(
  ( (Nil!19599) (Cons!19598 (h!20760 tuple2!13818) (t!27956 List!19602)) )
))
(declare-datatypes ((ListLongMap!12505 0))(
  ( (ListLongMap!12506 (toList!6268 List!19602)) )
))
(declare-fun contains!5314 (ListLongMap!12505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3430 (array!58548 array!58546 (_ BitVec 32) (_ BitVec 32) V!33329 V!33329 (_ BitVec 32) Int) ListLongMap!12505)

(assert (=> b!958945 (= res!641944 (contains!5314 (getCurrentListMap!3430 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28148 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33868 () Bool)

(assert (=> mapIsEmpty!33868 mapRes!33868))

(declare-fun mapNonEmpty!33868 () Bool)

(declare-fun tp!64621 () Bool)

(declare-fun e!540569 () Bool)

(assert (=> mapNonEmpty!33868 (= mapRes!33868 (and tp!64621 e!540569))))

(declare-fun mapRest!33868 () (Array (_ BitVec 32) ValueCell!10148))

(declare-fun mapKey!33868 () (_ BitVec 32))

(declare-fun mapValue!33868 () ValueCell!10148)

(assert (=> mapNonEmpty!33868 (= (arr!28147 _values!1386) (store mapRest!33868 mapKey!33868 mapValue!33868))))

(declare-fun b!958946 () Bool)

(declare-fun res!641949 () Bool)

(assert (=> b!958946 (=> (not res!641949) (not e!540571))))

(assert (=> b!958946 (= res!641949 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28629 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28629 _keys!1668))))))

(declare-fun b!958947 () Bool)

(declare-fun res!641948 () Bool)

(assert (=> b!958947 (=> (not res!641948) (not e!540571))))

(assert (=> b!958947 (= res!641948 (and (= (size!28628 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28629 _keys!1668) (size!28628 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958948 () Bool)

(declare-fun res!641943 () Bool)

(assert (=> b!958948 (=> (not res!641943) (not e!540571))))

(declare-datatypes ((List!19603 0))(
  ( (Nil!19600) (Cons!19599 (h!20761 (_ BitVec 64)) (t!27957 List!19603)) )
))
(declare-fun arrayNoDuplicates!0 (array!58548 (_ BitVec 32) List!19603) Bool)

(assert (=> b!958948 (= res!641943 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19600))))

(declare-fun b!958949 () Bool)

(assert (=> b!958949 (= e!540569 tp_is_empty!21259)))

(declare-fun b!958950 () Bool)

(declare-fun res!641947 () Bool)

(assert (=> b!958950 (=> (not res!641947) (not e!540571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58548 (_ BitVec 32)) Bool)

(assert (=> b!958950 (= res!641947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958951 () Bool)

(assert (=> b!958951 (= e!540571 (not true))))

(assert (=> b!958951 (contains!5314 (getCurrentListMap!3430 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28148 _keys!1668) i!793))))

(declare-datatypes ((Unit!32034 0))(
  ( (Unit!32035) )
))
(declare-fun lt!430285 () Unit!32034)

(declare-fun lemmaInListMapFromThenInFromSmaller!8 (array!58548 array!58546 (_ BitVec 32) (_ BitVec 32) V!33329 V!33329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32034)

(assert (=> b!958951 (= lt!430285 (lemmaInListMapFromThenInFromSmaller!8 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!958952 () Bool)

(declare-fun res!641946 () Bool)

(assert (=> b!958952 (=> (not res!641946) (not e!540571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958952 (= res!641946 (validKeyInArray!0 (select (arr!28148 _keys!1668) i!793)))))

(assert (= (and start!82262 res!641945) b!958947))

(assert (= (and b!958947 res!641948) b!958950))

(assert (= (and b!958950 res!641947) b!958948))

(assert (= (and b!958948 res!641943) b!958946))

(assert (= (and b!958946 res!641949) b!958952))

(assert (= (and b!958952 res!641946) b!958945))

(assert (= (and b!958945 res!641944) b!958951))

(assert (= (and b!958943 condMapEmpty!33868) mapIsEmpty!33868))

(assert (= (and b!958943 (not condMapEmpty!33868)) mapNonEmpty!33868))

(get-info :version)

(assert (= (and mapNonEmpty!33868 ((_ is ValueCellFull!10148) mapValue!33868)) b!958949))

(assert (= (and b!958943 ((_ is ValueCellFull!10148) mapDefault!33868)) b!958944))

(assert (= start!82262 b!958943))

(declare-fun m!888951 () Bool)

(assert (=> mapNonEmpty!33868 m!888951))

(declare-fun m!888953 () Bool)

(assert (=> b!958951 m!888953))

(declare-fun m!888955 () Bool)

(assert (=> b!958951 m!888955))

(assert (=> b!958951 m!888953))

(assert (=> b!958951 m!888955))

(declare-fun m!888957 () Bool)

(assert (=> b!958951 m!888957))

(declare-fun m!888959 () Bool)

(assert (=> b!958951 m!888959))

(assert (=> b!958952 m!888955))

(assert (=> b!958952 m!888955))

(declare-fun m!888961 () Bool)

(assert (=> b!958952 m!888961))

(declare-fun m!888963 () Bool)

(assert (=> b!958945 m!888963))

(assert (=> b!958945 m!888955))

(assert (=> b!958945 m!888963))

(assert (=> b!958945 m!888955))

(declare-fun m!888965 () Bool)

(assert (=> b!958945 m!888965))

(declare-fun m!888967 () Bool)

(assert (=> b!958948 m!888967))

(declare-fun m!888969 () Bool)

(assert (=> b!958950 m!888969))

(declare-fun m!888971 () Bool)

(assert (=> start!82262 m!888971))

(declare-fun m!888973 () Bool)

(assert (=> start!82262 m!888973))

(declare-fun m!888975 () Bool)

(assert (=> start!82262 m!888975))

(check-sat (not b!958950) b_and!30015 (not b!958952) (not b!958948) (not mapNonEmpty!33868) (not start!82262) (not b!958945) tp_is_empty!21259 (not b_next!18553) (not b!958951))
(check-sat b_and!30015 (not b_next!18553))
