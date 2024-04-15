; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40882 () Bool)

(assert start!40882)

(declare-fun b_free!10831 () Bool)

(declare-fun b_next!10831 () Bool)

(assert (=> start!40882 (= b_free!10831 (not b_next!10831))))

(declare-fun tp!38319 () Bool)

(declare-fun b_and!18947 () Bool)

(assert (=> start!40882 (= tp!38319 b_and!18947)))

(declare-fun b!454051 () Bool)

(declare-fun res!270545 () Bool)

(declare-fun e!265663 () Bool)

(assert (=> b!454051 (=> (not res!270545) (not e!265663))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28135 0))(
  ( (array!28136 (arr!13511 (Array (_ BitVec 32) (_ BitVec 64))) (size!13864 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28135)

(assert (=> b!454051 (= res!270545 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13864 _keys!709))))))

(declare-fun b!454052 () Bool)

(declare-fun res!270549 () Bool)

(assert (=> b!454052 (=> (not res!270549) (not e!265663))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454052 (= res!270549 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454053 () Bool)

(declare-fun e!265659 () Bool)

(declare-fun tp_is_empty!12169 () Bool)

(assert (=> b!454053 (= e!265659 tp_is_empty!12169)))

(declare-fun b!454054 () Bool)

(declare-fun res!270547 () Bool)

(declare-fun e!265658 () Bool)

(assert (=> b!454054 (=> (not res!270547) (not e!265658))))

(declare-fun lt!205880 () array!28135)

(declare-datatypes ((List!8144 0))(
  ( (Nil!8141) (Cons!8140 (h!8996 (_ BitVec 64)) (t!13963 List!8144)) )
))
(declare-fun arrayNoDuplicates!0 (array!28135 (_ BitVec 32) List!8144) Bool)

(assert (=> b!454054 (= res!270547 (arrayNoDuplicates!0 lt!205880 #b00000000000000000000000000000000 Nil!8141))))

(declare-fun b!454055 () Bool)

(declare-fun res!270553 () Bool)

(assert (=> b!454055 (=> (not res!270553) (not e!265663))))

(declare-datatypes ((V!17331 0))(
  ( (V!17332 (val!6129 Int)) )
))
(declare-datatypes ((ValueCell!5741 0))(
  ( (ValueCellFull!5741 (v!8389 V!17331)) (EmptyCell!5741) )
))
(declare-datatypes ((array!28137 0))(
  ( (array!28138 (arr!13512 (Array (_ BitVec 32) ValueCell!5741)) (size!13865 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28137)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454055 (= res!270553 (and (= (size!13865 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13864 _keys!709) (size!13865 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454056 () Bool)

(declare-fun res!270544 () Bool)

(assert (=> b!454056 (=> (not res!270544) (not e!265663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28135 (_ BitVec 32)) Bool)

(assert (=> b!454056 (= res!270544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454057 () Bool)

(assert (=> b!454057 (= e!265663 e!265658)))

(declare-fun res!270550 () Bool)

(assert (=> b!454057 (=> (not res!270550) (not e!265658))))

(assert (=> b!454057 (= res!270550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205880 mask!1025))))

(assert (=> b!454057 (= lt!205880 (array!28136 (store (arr!13511 _keys!709) i!563 k0!794) (size!13864 _keys!709)))))

(declare-fun mapIsEmpty!19894 () Bool)

(declare-fun mapRes!19894 () Bool)

(assert (=> mapIsEmpty!19894 mapRes!19894))

(declare-fun b!454058 () Bool)

(declare-fun res!270551 () Bool)

(assert (=> b!454058 (=> (not res!270551) (not e!265663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454058 (= res!270551 (validKeyInArray!0 k0!794))))

(declare-fun b!454059 () Bool)

(declare-fun res!270543 () Bool)

(assert (=> b!454059 (=> (not res!270543) (not e!265663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454059 (= res!270543 (validMask!0 mask!1025))))

(declare-fun b!454060 () Bool)

(assert (=> b!454060 (= e!265658 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17331)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8084 0))(
  ( (tuple2!8085 (_1!4053 (_ BitVec 64)) (_2!4053 V!17331)) )
))
(declare-datatypes ((List!8145 0))(
  ( (Nil!8142) (Cons!8141 (h!8997 tuple2!8084) (t!13964 List!8145)) )
))
(declare-datatypes ((ListLongMap!6987 0))(
  ( (ListLongMap!6988 (toList!3509 List!8145)) )
))
(declare-fun lt!205879 () ListLongMap!6987)

(declare-fun zeroValue!515 () V!17331)

(declare-fun v!412 () V!17331)

(declare-fun getCurrentListMapNoExtraKeys!1704 (array!28135 array!28137 (_ BitVec 32) (_ BitVec 32) V!17331 V!17331 (_ BitVec 32) Int) ListLongMap!6987)

(assert (=> b!454060 (= lt!205879 (getCurrentListMapNoExtraKeys!1704 lt!205880 (array!28138 (store (arr!13512 _values!549) i!563 (ValueCellFull!5741 v!412)) (size!13865 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!205878 () ListLongMap!6987)

(assert (=> b!454060 (= lt!205878 (getCurrentListMapNoExtraKeys!1704 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454061 () Bool)

(declare-fun res!270552 () Bool)

(assert (=> b!454061 (=> (not res!270552) (not e!265663))))

(assert (=> b!454061 (= res!270552 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8141))))

(declare-fun b!454062 () Bool)

(declare-fun res!270546 () Bool)

(assert (=> b!454062 (=> (not res!270546) (not e!265658))))

(assert (=> b!454062 (= res!270546 (bvsle from!863 i!563))))

(declare-fun b!454063 () Bool)

(declare-fun res!270548 () Bool)

(assert (=> b!454063 (=> (not res!270548) (not e!265663))))

(assert (=> b!454063 (= res!270548 (or (= (select (arr!13511 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13511 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454065 () Bool)

(declare-fun e!265662 () Bool)

(assert (=> b!454065 (= e!265662 tp_is_empty!12169)))

(declare-fun mapNonEmpty!19894 () Bool)

(declare-fun tp!38320 () Bool)

(assert (=> mapNonEmpty!19894 (= mapRes!19894 (and tp!38320 e!265659))))

(declare-fun mapValue!19894 () ValueCell!5741)

(declare-fun mapKey!19894 () (_ BitVec 32))

(declare-fun mapRest!19894 () (Array (_ BitVec 32) ValueCell!5741))

(assert (=> mapNonEmpty!19894 (= (arr!13512 _values!549) (store mapRest!19894 mapKey!19894 mapValue!19894))))

(declare-fun res!270554 () Bool)

(assert (=> start!40882 (=> (not res!270554) (not e!265663))))

(assert (=> start!40882 (= res!270554 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13864 _keys!709))))))

(assert (=> start!40882 e!265663))

(assert (=> start!40882 tp_is_empty!12169))

(assert (=> start!40882 tp!38319))

(assert (=> start!40882 true))

(declare-fun e!265661 () Bool)

(declare-fun array_inv!9844 (array!28137) Bool)

(assert (=> start!40882 (and (array_inv!9844 _values!549) e!265661)))

(declare-fun array_inv!9845 (array!28135) Bool)

(assert (=> start!40882 (array_inv!9845 _keys!709)))

(declare-fun b!454064 () Bool)

(assert (=> b!454064 (= e!265661 (and e!265662 mapRes!19894))))

(declare-fun condMapEmpty!19894 () Bool)

(declare-fun mapDefault!19894 () ValueCell!5741)

(assert (=> b!454064 (= condMapEmpty!19894 (= (arr!13512 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5741)) mapDefault!19894)))))

(assert (= (and start!40882 res!270554) b!454059))

(assert (= (and b!454059 res!270543) b!454055))

(assert (= (and b!454055 res!270553) b!454056))

(assert (= (and b!454056 res!270544) b!454061))

(assert (= (and b!454061 res!270552) b!454051))

(assert (= (and b!454051 res!270545) b!454058))

(assert (= (and b!454058 res!270551) b!454063))

(assert (= (and b!454063 res!270548) b!454052))

(assert (= (and b!454052 res!270549) b!454057))

(assert (= (and b!454057 res!270550) b!454054))

(assert (= (and b!454054 res!270547) b!454062))

(assert (= (and b!454062 res!270546) b!454060))

(assert (= (and b!454064 condMapEmpty!19894) mapIsEmpty!19894))

(assert (= (and b!454064 (not condMapEmpty!19894)) mapNonEmpty!19894))

(get-info :version)

(assert (= (and mapNonEmpty!19894 ((_ is ValueCellFull!5741) mapValue!19894)) b!454053))

(assert (= (and b!454064 ((_ is ValueCellFull!5741) mapDefault!19894)) b!454065))

(assert (= start!40882 b!454064))

(declare-fun m!437747 () Bool)

(assert (=> b!454057 m!437747))

(declare-fun m!437749 () Bool)

(assert (=> b!454057 m!437749))

(declare-fun m!437751 () Bool)

(assert (=> b!454058 m!437751))

(declare-fun m!437753 () Bool)

(assert (=> mapNonEmpty!19894 m!437753))

(declare-fun m!437755 () Bool)

(assert (=> b!454063 m!437755))

(declare-fun m!437757 () Bool)

(assert (=> start!40882 m!437757))

(declare-fun m!437759 () Bool)

(assert (=> start!40882 m!437759))

(declare-fun m!437761 () Bool)

(assert (=> b!454061 m!437761))

(declare-fun m!437763 () Bool)

(assert (=> b!454060 m!437763))

(declare-fun m!437765 () Bool)

(assert (=> b!454060 m!437765))

(declare-fun m!437767 () Bool)

(assert (=> b!454060 m!437767))

(declare-fun m!437769 () Bool)

(assert (=> b!454052 m!437769))

(declare-fun m!437771 () Bool)

(assert (=> b!454054 m!437771))

(declare-fun m!437773 () Bool)

(assert (=> b!454056 m!437773))

(declare-fun m!437775 () Bool)

(assert (=> b!454059 m!437775))

(check-sat (not b!454056) (not start!40882) (not b!454052) b_and!18947 (not mapNonEmpty!19894) (not b!454057) (not b_next!10831) (not b!454059) (not b!454058) tp_is_empty!12169 (not b!454060) (not b!454054) (not b!454061))
(check-sat b_and!18947 (not b_next!10831))
