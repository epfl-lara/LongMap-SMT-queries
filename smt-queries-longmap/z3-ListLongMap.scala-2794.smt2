; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40638 () Bool)

(assert start!40638)

(declare-fun b_free!10663 () Bool)

(declare-fun b_next!10663 () Bool)

(assert (=> start!40638 (= b_free!10663 (not b_next!10663))))

(declare-fun tp!37808 () Bool)

(declare-fun b_and!18685 () Bool)

(assert (=> start!40638 (= tp!37808 b_and!18685)))

(declare-fun b!449039 () Bool)

(declare-fun res!267049 () Bool)

(declare-fun e!263356 () Bool)

(assert (=> b!449039 (=> (not res!267049) (not e!263356))))

(declare-datatypes ((array!27804 0))(
  ( (array!27805 (arr!13347 (Array (_ BitVec 32) (_ BitVec 64))) (size!13699 (_ BitVec 32))) )
))
(declare-fun lt!204316 () array!27804)

(declare-datatypes ((List!7911 0))(
  ( (Nil!7908) (Cons!7907 (h!8763 (_ BitVec 64)) (t!13665 List!7911)) )
))
(declare-fun arrayNoDuplicates!0 (array!27804 (_ BitVec 32) List!7911) Bool)

(assert (=> b!449039 (= res!267049 (arrayNoDuplicates!0 lt!204316 #b00000000000000000000000000000000 Nil!7908))))

(declare-fun b!449040 () Bool)

(declare-fun res!267055 () Bool)

(declare-fun e!263358 () Bool)

(assert (=> b!449040 (=> (not res!267055) (not e!263358))))

(declare-fun _keys!709 () array!27804)

(assert (=> b!449040 (= res!267055 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7908))))

(declare-fun b!449041 () Bool)

(declare-fun e!263357 () Bool)

(declare-fun tp_is_empty!12001 () Bool)

(assert (=> b!449041 (= e!263357 tp_is_empty!12001)))

(declare-fun b!449042 () Bool)

(declare-fun e!263353 () Bool)

(declare-fun e!263354 () Bool)

(declare-fun mapRes!19635 () Bool)

(assert (=> b!449042 (= e!263353 (and e!263354 mapRes!19635))))

(declare-fun condMapEmpty!19635 () Bool)

(declare-datatypes ((V!17107 0))(
  ( (V!17108 (val!6045 Int)) )
))
(declare-datatypes ((ValueCell!5657 0))(
  ( (ValueCellFull!5657 (v!8301 V!17107)) (EmptyCell!5657) )
))
(declare-datatypes ((array!27806 0))(
  ( (array!27807 (arr!13348 (Array (_ BitVec 32) ValueCell!5657)) (size!13700 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27806)

(declare-fun mapDefault!19635 () ValueCell!5657)

(assert (=> b!449042 (= condMapEmpty!19635 (= (arr!13348 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5657)) mapDefault!19635)))))

(declare-fun b!449043 () Bool)

(declare-fun res!267058 () Bool)

(assert (=> b!449043 (=> (not res!267058) (not e!263358))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!449043 (= res!267058 (and (= (size!13700 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13699 _keys!709) (size!13700 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449044 () Bool)

(assert (=> b!449044 (= e!263358 e!263356)))

(declare-fun res!267060 () Bool)

(assert (=> b!449044 (=> (not res!267060) (not e!263356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27804 (_ BitVec 32)) Bool)

(assert (=> b!449044 (= res!267060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204316 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!449044 (= lt!204316 (array!27805 (store (arr!13347 _keys!709) i!563 k0!794) (size!13699 _keys!709)))))

(declare-fun b!449045 () Bool)

(declare-fun res!267050 () Bool)

(assert (=> b!449045 (=> (not res!267050) (not e!263358))))

(assert (=> b!449045 (= res!267050 (or (= (select (arr!13347 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13347 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449046 () Bool)

(declare-fun res!267053 () Bool)

(assert (=> b!449046 (=> (not res!267053) (not e!263358))))

(assert (=> b!449046 (= res!267053 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13699 _keys!709))))))

(declare-fun b!449047 () Bool)

(assert (=> b!449047 (= e!263354 tp_is_empty!12001)))

(declare-fun b!449048 () Bool)

(declare-fun res!267052 () Bool)

(assert (=> b!449048 (=> (not res!267052) (not e!263358))))

(assert (=> b!449048 (= res!267052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449038 () Bool)

(declare-fun res!267056 () Bool)

(assert (=> b!449038 (=> (not res!267056) (not e!263358))))

(declare-fun arrayContainsKey!0 (array!27804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449038 (= res!267056 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!267059 () Bool)

(assert (=> start!40638 (=> (not res!267059) (not e!263358))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40638 (= res!267059 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13699 _keys!709))))))

(assert (=> start!40638 e!263358))

(assert (=> start!40638 tp_is_empty!12001))

(assert (=> start!40638 tp!37808))

(assert (=> start!40638 true))

(declare-fun array_inv!9748 (array!27806) Bool)

(assert (=> start!40638 (and (array_inv!9748 _values!549) e!263353)))

(declare-fun array_inv!9749 (array!27804) Bool)

(assert (=> start!40638 (array_inv!9749 _keys!709)))

(declare-fun mapNonEmpty!19635 () Bool)

(declare-fun tp!37809 () Bool)

(assert (=> mapNonEmpty!19635 (= mapRes!19635 (and tp!37809 e!263357))))

(declare-fun mapRest!19635 () (Array (_ BitVec 32) ValueCell!5657))

(declare-fun mapValue!19635 () ValueCell!5657)

(declare-fun mapKey!19635 () (_ BitVec 32))

(assert (=> mapNonEmpty!19635 (= (arr!13348 _values!549) (store mapRest!19635 mapKey!19635 mapValue!19635))))

(declare-fun b!449049 () Bool)

(declare-fun res!267054 () Bool)

(assert (=> b!449049 (=> (not res!267054) (not e!263356))))

(assert (=> b!449049 (= res!267054 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19635 () Bool)

(assert (=> mapIsEmpty!19635 mapRes!19635))

(declare-fun b!449050 () Bool)

(declare-fun res!267057 () Bool)

(assert (=> b!449050 (=> (not res!267057) (not e!263358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449050 (= res!267057 (validMask!0 mask!1025))))

(declare-fun b!449051 () Bool)

(declare-fun res!267051 () Bool)

(assert (=> b!449051 (=> (not res!267051) (not e!263358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449051 (= res!267051 (validKeyInArray!0 k0!794))))

(declare-fun b!449052 () Bool)

(assert (=> b!449052 (= e!263356 false)))

(declare-fun minValue!515 () V!17107)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7840 0))(
  ( (tuple2!7841 (_1!3931 (_ BitVec 64)) (_2!3931 V!17107)) )
))
(declare-datatypes ((List!7912 0))(
  ( (Nil!7909) (Cons!7908 (h!8764 tuple2!7840) (t!13666 List!7912)) )
))
(declare-datatypes ((ListLongMap!6755 0))(
  ( (ListLongMap!6756 (toList!3393 List!7912)) )
))
(declare-fun lt!204315 () ListLongMap!6755)

(declare-fun zeroValue!515 () V!17107)

(declare-fun v!412 () V!17107)

(declare-fun getCurrentListMapNoExtraKeys!1623 (array!27804 array!27806 (_ BitVec 32) (_ BitVec 32) V!17107 V!17107 (_ BitVec 32) Int) ListLongMap!6755)

(assert (=> b!449052 (= lt!204315 (getCurrentListMapNoExtraKeys!1623 lt!204316 (array!27807 (store (arr!13348 _values!549) i!563 (ValueCellFull!5657 v!412)) (size!13700 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204314 () ListLongMap!6755)

(assert (=> b!449052 (= lt!204314 (getCurrentListMapNoExtraKeys!1623 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40638 res!267059) b!449050))

(assert (= (and b!449050 res!267057) b!449043))

(assert (= (and b!449043 res!267058) b!449048))

(assert (= (and b!449048 res!267052) b!449040))

(assert (= (and b!449040 res!267055) b!449046))

(assert (= (and b!449046 res!267053) b!449051))

(assert (= (and b!449051 res!267051) b!449045))

(assert (= (and b!449045 res!267050) b!449038))

(assert (= (and b!449038 res!267056) b!449044))

(assert (= (and b!449044 res!267060) b!449039))

(assert (= (and b!449039 res!267049) b!449049))

(assert (= (and b!449049 res!267054) b!449052))

(assert (= (and b!449042 condMapEmpty!19635) mapIsEmpty!19635))

(assert (= (and b!449042 (not condMapEmpty!19635)) mapNonEmpty!19635))

(get-info :version)

(assert (= (and mapNonEmpty!19635 ((_ is ValueCellFull!5657) mapValue!19635)) b!449041))

(assert (= (and b!449042 ((_ is ValueCellFull!5657) mapDefault!19635)) b!449047))

(assert (= start!40638 b!449042))

(declare-fun m!433641 () Bool)

(assert (=> b!449051 m!433641))

(declare-fun m!433643 () Bool)

(assert (=> mapNonEmpty!19635 m!433643))

(declare-fun m!433645 () Bool)

(assert (=> b!449050 m!433645))

(declare-fun m!433647 () Bool)

(assert (=> b!449039 m!433647))

(declare-fun m!433649 () Bool)

(assert (=> start!40638 m!433649))

(declare-fun m!433651 () Bool)

(assert (=> start!40638 m!433651))

(declare-fun m!433653 () Bool)

(assert (=> b!449045 m!433653))

(declare-fun m!433655 () Bool)

(assert (=> b!449044 m!433655))

(declare-fun m!433657 () Bool)

(assert (=> b!449044 m!433657))

(declare-fun m!433659 () Bool)

(assert (=> b!449040 m!433659))

(declare-fun m!433661 () Bool)

(assert (=> b!449052 m!433661))

(declare-fun m!433663 () Bool)

(assert (=> b!449052 m!433663))

(declare-fun m!433665 () Bool)

(assert (=> b!449052 m!433665))

(declare-fun m!433667 () Bool)

(assert (=> b!449048 m!433667))

(declare-fun m!433669 () Bool)

(assert (=> b!449038 m!433669))

(check-sat (not b!449044) (not b!449048) tp_is_empty!12001 (not b!449050) (not b!449051) (not start!40638) (not b!449052) b_and!18685 (not b_next!10663) (not b!449039) (not b!449038) (not mapNonEmpty!19635) (not b!449040))
(check-sat b_and!18685 (not b_next!10663))
