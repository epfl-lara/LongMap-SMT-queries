; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40638 () Bool)

(assert start!40638)

(declare-fun b_free!10663 () Bool)

(declare-fun b_next!10663 () Bool)

(assert (=> start!40638 (= b_free!10663 (not b_next!10663))))

(declare-fun tp!37808 () Bool)

(declare-fun b_and!18645 () Bool)

(assert (=> start!40638 (= tp!37808 b_and!18645)))

(declare-fun b!448816 () Bool)

(declare-fun res!266928 () Bool)

(declare-fun e!263216 () Bool)

(assert (=> b!448816 (=> (not res!266928) (not e!263216))))

(declare-datatypes ((array!27807 0))(
  ( (array!27808 (arr!13349 (Array (_ BitVec 32) (_ BitVec 64))) (size!13702 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27807)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448816 (= res!266928 (or (= (select (arr!13349 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13349 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448817 () Bool)

(declare-fun res!266930 () Bool)

(assert (=> b!448817 (=> (not res!266930) (not e!263216))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448817 (= res!266930 (validKeyInArray!0 k0!794))))

(declare-fun b!448818 () Bool)

(declare-fun e!263212 () Bool)

(declare-fun e!263214 () Bool)

(declare-fun mapRes!19635 () Bool)

(assert (=> b!448818 (= e!263212 (and e!263214 mapRes!19635))))

(declare-fun condMapEmpty!19635 () Bool)

(declare-datatypes ((V!17107 0))(
  ( (V!17108 (val!6045 Int)) )
))
(declare-datatypes ((ValueCell!5657 0))(
  ( (ValueCellFull!5657 (v!8294 V!17107)) (EmptyCell!5657) )
))
(declare-datatypes ((array!27809 0))(
  ( (array!27810 (arr!13350 (Array (_ BitVec 32) ValueCell!5657)) (size!13703 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27809)

(declare-fun mapDefault!19635 () ValueCell!5657)

(assert (=> b!448818 (= condMapEmpty!19635 (= (arr!13350 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5657)) mapDefault!19635)))))

(declare-fun b!448819 () Bool)

(declare-fun e!263211 () Bool)

(assert (=> b!448819 (= e!263211 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17107)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17107)

(declare-datatypes ((tuple2!7942 0))(
  ( (tuple2!7943 (_1!3982 (_ BitVec 64)) (_2!3982 V!17107)) )
))
(declare-datatypes ((List!8006 0))(
  ( (Nil!8003) (Cons!8002 (h!8858 tuple2!7942) (t!13759 List!8006)) )
))
(declare-datatypes ((ListLongMap!6845 0))(
  ( (ListLongMap!6846 (toList!3438 List!8006)) )
))
(declare-fun lt!204062 () ListLongMap!6845)

(declare-fun lt!204061 () array!27807)

(declare-fun v!412 () V!17107)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1636 (array!27807 array!27809 (_ BitVec 32) (_ BitVec 32) V!17107 V!17107 (_ BitVec 32) Int) ListLongMap!6845)

(assert (=> b!448819 (= lt!204062 (getCurrentListMapNoExtraKeys!1636 lt!204061 (array!27810 (store (arr!13350 _values!549) i!563 (ValueCellFull!5657 v!412)) (size!13703 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204063 () ListLongMap!6845)

(assert (=> b!448819 (= lt!204063 (getCurrentListMapNoExtraKeys!1636 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448820 () Bool)

(declare-fun e!263213 () Bool)

(declare-fun tp_is_empty!12001 () Bool)

(assert (=> b!448820 (= e!263213 tp_is_empty!12001)))

(declare-fun mapNonEmpty!19635 () Bool)

(declare-fun tp!37809 () Bool)

(assert (=> mapNonEmpty!19635 (= mapRes!19635 (and tp!37809 e!263213))))

(declare-fun mapKey!19635 () (_ BitVec 32))

(declare-fun mapValue!19635 () ValueCell!5657)

(declare-fun mapRest!19635 () (Array (_ BitVec 32) ValueCell!5657))

(assert (=> mapNonEmpty!19635 (= (arr!13350 _values!549) (store mapRest!19635 mapKey!19635 mapValue!19635))))

(declare-fun b!448821 () Bool)

(declare-fun res!266927 () Bool)

(assert (=> b!448821 (=> (not res!266927) (not e!263211))))

(declare-datatypes ((List!8007 0))(
  ( (Nil!8004) (Cons!8003 (h!8859 (_ BitVec 64)) (t!13760 List!8007)) )
))
(declare-fun arrayNoDuplicates!0 (array!27807 (_ BitVec 32) List!8007) Bool)

(assert (=> b!448821 (= res!266927 (arrayNoDuplicates!0 lt!204061 #b00000000000000000000000000000000 Nil!8004))))

(declare-fun mapIsEmpty!19635 () Bool)

(assert (=> mapIsEmpty!19635 mapRes!19635))

(declare-fun b!448823 () Bool)

(assert (=> b!448823 (= e!263214 tp_is_empty!12001)))

(declare-fun b!448824 () Bool)

(declare-fun res!266925 () Bool)

(assert (=> b!448824 (=> (not res!266925) (not e!263211))))

(assert (=> b!448824 (= res!266925 (bvsle from!863 i!563))))

(declare-fun b!448825 () Bool)

(declare-fun res!266932 () Bool)

(assert (=> b!448825 (=> (not res!266932) (not e!263216))))

(assert (=> b!448825 (= res!266932 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8004))))

(declare-fun b!448826 () Bool)

(declare-fun res!266924 () Bool)

(assert (=> b!448826 (=> (not res!266924) (not e!263216))))

(assert (=> b!448826 (= res!266924 (and (= (size!13703 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13702 _keys!709) (size!13703 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448822 () Bool)

(declare-fun res!266931 () Bool)

(assert (=> b!448822 (=> (not res!266931) (not e!263216))))

(assert (=> b!448822 (= res!266931 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13702 _keys!709))))))

(declare-fun res!266933 () Bool)

(assert (=> start!40638 (=> (not res!266933) (not e!263216))))

(assert (=> start!40638 (= res!266933 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13702 _keys!709))))))

(assert (=> start!40638 e!263216))

(assert (=> start!40638 tp_is_empty!12001))

(assert (=> start!40638 tp!37808))

(assert (=> start!40638 true))

(declare-fun array_inv!9730 (array!27809) Bool)

(assert (=> start!40638 (and (array_inv!9730 _values!549) e!263212)))

(declare-fun array_inv!9731 (array!27807) Bool)

(assert (=> start!40638 (array_inv!9731 _keys!709)))

(declare-fun b!448827 () Bool)

(declare-fun res!266926 () Bool)

(assert (=> b!448827 (=> (not res!266926) (not e!263216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27807 (_ BitVec 32)) Bool)

(assert (=> b!448827 (= res!266926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448828 () Bool)

(declare-fun res!266934 () Bool)

(assert (=> b!448828 (=> (not res!266934) (not e!263216))))

(declare-fun arrayContainsKey!0 (array!27807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448828 (= res!266934 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448829 () Bool)

(assert (=> b!448829 (= e!263216 e!263211)))

(declare-fun res!266929 () Bool)

(assert (=> b!448829 (=> (not res!266929) (not e!263211))))

(assert (=> b!448829 (= res!266929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204061 mask!1025))))

(assert (=> b!448829 (= lt!204061 (array!27808 (store (arr!13349 _keys!709) i!563 k0!794) (size!13702 _keys!709)))))

(declare-fun b!448830 () Bool)

(declare-fun res!266923 () Bool)

(assert (=> b!448830 (=> (not res!266923) (not e!263216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448830 (= res!266923 (validMask!0 mask!1025))))

(assert (= (and start!40638 res!266933) b!448830))

(assert (= (and b!448830 res!266923) b!448826))

(assert (= (and b!448826 res!266924) b!448827))

(assert (= (and b!448827 res!266926) b!448825))

(assert (= (and b!448825 res!266932) b!448822))

(assert (= (and b!448822 res!266931) b!448817))

(assert (= (and b!448817 res!266930) b!448816))

(assert (= (and b!448816 res!266928) b!448828))

(assert (= (and b!448828 res!266934) b!448829))

(assert (= (and b!448829 res!266929) b!448821))

(assert (= (and b!448821 res!266927) b!448824))

(assert (= (and b!448824 res!266925) b!448819))

(assert (= (and b!448818 condMapEmpty!19635) mapIsEmpty!19635))

(assert (= (and b!448818 (not condMapEmpty!19635)) mapNonEmpty!19635))

(get-info :version)

(assert (= (and mapNonEmpty!19635 ((_ is ValueCellFull!5657) mapValue!19635)) b!448820))

(assert (= (and b!448818 ((_ is ValueCellFull!5657) mapDefault!19635)) b!448823))

(assert (= start!40638 b!448818))

(declare-fun m!432691 () Bool)

(assert (=> b!448816 m!432691))

(declare-fun m!432693 () Bool)

(assert (=> b!448825 m!432693))

(declare-fun m!432695 () Bool)

(assert (=> b!448828 m!432695))

(declare-fun m!432697 () Bool)

(assert (=> b!448829 m!432697))

(declare-fun m!432699 () Bool)

(assert (=> b!448829 m!432699))

(declare-fun m!432701 () Bool)

(assert (=> mapNonEmpty!19635 m!432701))

(declare-fun m!432703 () Bool)

(assert (=> b!448827 m!432703))

(declare-fun m!432705 () Bool)

(assert (=> b!448817 m!432705))

(declare-fun m!432707 () Bool)

(assert (=> b!448830 m!432707))

(declare-fun m!432709 () Bool)

(assert (=> b!448821 m!432709))

(declare-fun m!432711 () Bool)

(assert (=> b!448819 m!432711))

(declare-fun m!432713 () Bool)

(assert (=> b!448819 m!432713))

(declare-fun m!432715 () Bool)

(assert (=> b!448819 m!432715))

(declare-fun m!432717 () Bool)

(assert (=> start!40638 m!432717))

(declare-fun m!432719 () Bool)

(assert (=> start!40638 m!432719))

(check-sat (not b!448821) (not b!448830) (not b!448819) (not mapNonEmpty!19635) (not b_next!10663) (not start!40638) (not b!448828) (not b!448817) (not b!448829) (not b!448825) b_and!18645 (not b!448827) tp_is_empty!12001)
(check-sat b_and!18645 (not b_next!10663))
