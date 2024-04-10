; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20834 () Bool)

(assert start!20834)

(declare-fun b_free!5487 () Bool)

(declare-fun b_next!5487 () Bool)

(assert (=> start!20834 (= b_free!5487 (not b_next!5487))))

(declare-fun tp!19502 () Bool)

(declare-fun b_and!12233 () Bool)

(assert (=> start!20834 (= tp!19502 b_and!12233)))

(declare-fun b!208970 () Bool)

(declare-fun res!101771 () Bool)

(declare-fun e!136210 () Bool)

(assert (=> b!208970 (=> (not res!101771) (not e!136210))))

(declare-datatypes ((array!9901 0))(
  ( (array!9902 (arr!4701 (Array (_ BitVec 32) (_ BitVec 64))) (size!5026 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9901)

(declare-datatypes ((List!3010 0))(
  ( (Nil!3007) (Cons!3006 (h!3648 (_ BitVec 64)) (t!7941 List!3010)) )
))
(declare-fun arrayNoDuplicates!0 (array!9901 (_ BitVec 32) List!3010) Bool)

(assert (=> b!208970 (= res!101771 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3007))))

(declare-fun b!208971 () Bool)

(declare-fun res!101770 () Bool)

(assert (=> b!208971 (=> (not res!101770) (not e!136210))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6779 0))(
  ( (V!6780 (val!2719 Int)) )
))
(declare-datatypes ((ValueCell!2331 0))(
  ( (ValueCellFull!2331 (v!4689 V!6779)) (EmptyCell!2331) )
))
(declare-datatypes ((array!9903 0))(
  ( (array!9904 (arr!4702 (Array (_ BitVec 32) ValueCell!2331)) (size!5027 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9903)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!208971 (= res!101770 (and (= (size!5027 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5026 _keys!825) (size!5027 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9092 () Bool)

(declare-fun mapRes!9092 () Bool)

(assert (=> mapIsEmpty!9092 mapRes!9092))

(declare-fun mapNonEmpty!9092 () Bool)

(declare-fun tp!19501 () Bool)

(declare-fun e!136213 () Bool)

(assert (=> mapNonEmpty!9092 (= mapRes!9092 (and tp!19501 e!136213))))

(declare-fun mapKey!9092 () (_ BitVec 32))

(declare-fun mapValue!9092 () ValueCell!2331)

(declare-fun mapRest!9092 () (Array (_ BitVec 32) ValueCell!2331))

(assert (=> mapNonEmpty!9092 (= (arr!4702 _values!649) (store mapRest!9092 mapKey!9092 mapValue!9092))))

(declare-fun b!208972 () Bool)

(declare-fun res!101773 () Bool)

(assert (=> b!208972 (=> (not res!101773) (not e!136210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9901 (_ BitVec 32)) Bool)

(assert (=> b!208972 (= res!101773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208973 () Bool)

(declare-fun e!136214 () Bool)

(declare-fun e!136212 () Bool)

(assert (=> b!208973 (= e!136214 (and e!136212 mapRes!9092))))

(declare-fun condMapEmpty!9092 () Bool)

(declare-fun mapDefault!9092 () ValueCell!2331)

(assert (=> b!208973 (= condMapEmpty!9092 (= (arr!4702 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2331)) mapDefault!9092)))))

(declare-fun b!208975 () Bool)

(declare-fun res!101769 () Bool)

(assert (=> b!208975 (=> (not res!101769) (not e!136210))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208975 (= res!101769 (= (select (arr!4701 _keys!825) i!601) k0!843))))

(declare-fun b!208976 () Bool)

(declare-fun res!101768 () Bool)

(assert (=> b!208976 (=> (not res!101768) (not e!136210))))

(assert (=> b!208976 (= res!101768 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5026 _keys!825))))))

(declare-fun b!208977 () Bool)

(assert (=> b!208977 (= e!136210 false)))

(declare-fun v!520 () V!6779)

(declare-fun zeroValue!615 () V!6779)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6779)

(declare-datatypes ((tuple2!4114 0))(
  ( (tuple2!4115 (_1!2068 (_ BitVec 64)) (_2!2068 V!6779)) )
))
(declare-datatypes ((List!3011 0))(
  ( (Nil!3008) (Cons!3007 (h!3649 tuple2!4114) (t!7942 List!3011)) )
))
(declare-datatypes ((ListLongMap!3027 0))(
  ( (ListLongMap!3028 (toList!1529 List!3011)) )
))
(declare-fun lt!106892 () ListLongMap!3027)

(declare-fun getCurrentListMapNoExtraKeys!470 (array!9901 array!9903 (_ BitVec 32) (_ BitVec 32) V!6779 V!6779 (_ BitVec 32) Int) ListLongMap!3027)

(assert (=> b!208977 (= lt!106892 (getCurrentListMapNoExtraKeys!470 _keys!825 (array!9904 (store (arr!4702 _values!649) i!601 (ValueCellFull!2331 v!520)) (size!5027 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106893 () ListLongMap!3027)

(assert (=> b!208977 (= lt!106893 (getCurrentListMapNoExtraKeys!470 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208978 () Bool)

(declare-fun tp_is_empty!5349 () Bool)

(assert (=> b!208978 (= e!136213 tp_is_empty!5349)))

(declare-fun b!208979 () Bool)

(assert (=> b!208979 (= e!136212 tp_is_empty!5349)))

(declare-fun res!101772 () Bool)

(assert (=> start!20834 (=> (not res!101772) (not e!136210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20834 (= res!101772 (validMask!0 mask!1149))))

(assert (=> start!20834 e!136210))

(declare-fun array_inv!3117 (array!9903) Bool)

(assert (=> start!20834 (and (array_inv!3117 _values!649) e!136214)))

(assert (=> start!20834 true))

(assert (=> start!20834 tp_is_empty!5349))

(declare-fun array_inv!3118 (array!9901) Bool)

(assert (=> start!20834 (array_inv!3118 _keys!825)))

(assert (=> start!20834 tp!19502))

(declare-fun b!208974 () Bool)

(declare-fun res!101767 () Bool)

(assert (=> b!208974 (=> (not res!101767) (not e!136210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208974 (= res!101767 (validKeyInArray!0 k0!843))))

(assert (= (and start!20834 res!101772) b!208971))

(assert (= (and b!208971 res!101770) b!208972))

(assert (= (and b!208972 res!101773) b!208970))

(assert (= (and b!208970 res!101771) b!208976))

(assert (= (and b!208976 res!101768) b!208974))

(assert (= (and b!208974 res!101767) b!208975))

(assert (= (and b!208975 res!101769) b!208977))

(assert (= (and b!208973 condMapEmpty!9092) mapIsEmpty!9092))

(assert (= (and b!208973 (not condMapEmpty!9092)) mapNonEmpty!9092))

(get-info :version)

(assert (= (and mapNonEmpty!9092 ((_ is ValueCellFull!2331) mapValue!9092)) b!208978))

(assert (= (and b!208973 ((_ is ValueCellFull!2331) mapDefault!9092)) b!208979))

(assert (= start!20834 b!208973))

(declare-fun m!236459 () Bool)

(assert (=> b!208972 m!236459))

(declare-fun m!236461 () Bool)

(assert (=> b!208975 m!236461))

(declare-fun m!236463 () Bool)

(assert (=> b!208977 m!236463))

(declare-fun m!236465 () Bool)

(assert (=> b!208977 m!236465))

(declare-fun m!236467 () Bool)

(assert (=> b!208977 m!236467))

(declare-fun m!236469 () Bool)

(assert (=> b!208974 m!236469))

(declare-fun m!236471 () Bool)

(assert (=> start!20834 m!236471))

(declare-fun m!236473 () Bool)

(assert (=> start!20834 m!236473))

(declare-fun m!236475 () Bool)

(assert (=> start!20834 m!236475))

(declare-fun m!236477 () Bool)

(assert (=> mapNonEmpty!9092 m!236477))

(declare-fun m!236479 () Bool)

(assert (=> b!208970 m!236479))

(check-sat (not b!208974) (not b_next!5487) (not mapNonEmpty!9092) (not b!208972) (not start!20834) (not b!208977) (not b!208970) b_and!12233 tp_is_empty!5349)
(check-sat b_and!12233 (not b_next!5487))
