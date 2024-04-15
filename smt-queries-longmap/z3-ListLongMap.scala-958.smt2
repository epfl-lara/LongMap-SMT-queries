; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20848 () Bool)

(assert start!20848)

(declare-fun b_free!5497 () Bool)

(declare-fun b_next!5497 () Bool)

(assert (=> start!20848 (= b_free!5497 (not b_next!5497))))

(declare-fun tp!19532 () Bool)

(declare-fun b_and!12217 () Bool)

(assert (=> start!20848 (= tp!19532 b_and!12217)))

(declare-fun b!208973 () Bool)

(declare-fun res!101783 () Bool)

(declare-fun e!136186 () Bool)

(assert (=> b!208973 (=> (not res!101783) (not e!136186))))

(declare-datatypes ((array!9907 0))(
  ( (array!9908 (arr!4703 (Array (_ BitVec 32) (_ BitVec 64))) (size!5029 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9907)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208973 (= res!101783 (= (select (arr!4703 _keys!825) i!601) k0!843))))

(declare-fun b!208974 () Bool)

(declare-fun res!101780 () Bool)

(assert (=> b!208974 (=> (not res!101780) (not e!136186))))

(assert (=> b!208974 (= res!101780 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5029 _keys!825))))))

(declare-fun res!101778 () Bool)

(assert (=> start!20848 (=> (not res!101778) (not e!136186))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20848 (= res!101778 (validMask!0 mask!1149))))

(assert (=> start!20848 e!136186))

(declare-datatypes ((V!6793 0))(
  ( (V!6794 (val!2724 Int)) )
))
(declare-datatypes ((ValueCell!2336 0))(
  ( (ValueCellFull!2336 (v!4688 V!6793)) (EmptyCell!2336) )
))
(declare-datatypes ((array!9909 0))(
  ( (array!9910 (arr!4704 (Array (_ BitVec 32) ValueCell!2336)) (size!5030 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9909)

(declare-fun e!136185 () Bool)

(declare-fun array_inv!3089 (array!9909) Bool)

(assert (=> start!20848 (and (array_inv!3089 _values!649) e!136185)))

(assert (=> start!20848 true))

(declare-fun tp_is_empty!5359 () Bool)

(assert (=> start!20848 tp_is_empty!5359))

(declare-fun array_inv!3090 (array!9907) Bool)

(assert (=> start!20848 (array_inv!3090 _keys!825)))

(assert (=> start!20848 tp!19532))

(declare-fun b!208975 () Bool)

(assert (=> b!208975 (= e!136186 false)))

(declare-datatypes ((tuple2!4102 0))(
  ( (tuple2!4103 (_1!2062 (_ BitVec 64)) (_2!2062 V!6793)) )
))
(declare-datatypes ((List!3010 0))(
  ( (Nil!3007) (Cons!3006 (h!3648 tuple2!4102) (t!7932 List!3010)) )
))
(declare-datatypes ((ListLongMap!3005 0))(
  ( (ListLongMap!3006 (toList!1518 List!3010)) )
))
(declare-fun lt!106741 () ListLongMap!3005)

(declare-fun v!520 () V!6793)

(declare-fun zeroValue!615 () V!6793)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6793)

(declare-fun getCurrentListMapNoExtraKeys!469 (array!9907 array!9909 (_ BitVec 32) (_ BitVec 32) V!6793 V!6793 (_ BitVec 32) Int) ListLongMap!3005)

(assert (=> b!208975 (= lt!106741 (getCurrentListMapNoExtraKeys!469 _keys!825 (array!9910 (store (arr!4704 _values!649) i!601 (ValueCellFull!2336 v!520)) (size!5030 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106742 () ListLongMap!3005)

(assert (=> b!208975 (= lt!106742 (getCurrentListMapNoExtraKeys!469 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208976 () Bool)

(declare-fun res!101779 () Bool)

(assert (=> b!208976 (=> (not res!101779) (not e!136186))))

(declare-datatypes ((List!3011 0))(
  ( (Nil!3008) (Cons!3007 (h!3649 (_ BitVec 64)) (t!7933 List!3011)) )
))
(declare-fun arrayNoDuplicates!0 (array!9907 (_ BitVec 32) List!3011) Bool)

(assert (=> b!208976 (= res!101779 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3008))))

(declare-fun mapNonEmpty!9107 () Bool)

(declare-fun mapRes!9107 () Bool)

(declare-fun tp!19531 () Bool)

(declare-fun e!136188 () Bool)

(assert (=> mapNonEmpty!9107 (= mapRes!9107 (and tp!19531 e!136188))))

(declare-fun mapKey!9107 () (_ BitVec 32))

(declare-fun mapValue!9107 () ValueCell!2336)

(declare-fun mapRest!9107 () (Array (_ BitVec 32) ValueCell!2336))

(assert (=> mapNonEmpty!9107 (= (arr!4704 _values!649) (store mapRest!9107 mapKey!9107 mapValue!9107))))

(declare-fun b!208977 () Bool)

(declare-fun res!101781 () Bool)

(assert (=> b!208977 (=> (not res!101781) (not e!136186))))

(assert (=> b!208977 (= res!101781 (and (= (size!5030 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5029 _keys!825) (size!5030 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208978 () Bool)

(declare-fun res!101777 () Bool)

(assert (=> b!208978 (=> (not res!101777) (not e!136186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9907 (_ BitVec 32)) Bool)

(assert (=> b!208978 (= res!101777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208979 () Bool)

(assert (=> b!208979 (= e!136188 tp_is_empty!5359)))

(declare-fun mapIsEmpty!9107 () Bool)

(assert (=> mapIsEmpty!9107 mapRes!9107))

(declare-fun b!208980 () Bool)

(declare-fun e!136187 () Bool)

(assert (=> b!208980 (= e!136187 tp_is_empty!5359)))

(declare-fun b!208981 () Bool)

(declare-fun res!101782 () Bool)

(assert (=> b!208981 (=> (not res!101782) (not e!136186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208981 (= res!101782 (validKeyInArray!0 k0!843))))

(declare-fun b!208982 () Bool)

(assert (=> b!208982 (= e!136185 (and e!136187 mapRes!9107))))

(declare-fun condMapEmpty!9107 () Bool)

(declare-fun mapDefault!9107 () ValueCell!2336)

(assert (=> b!208982 (= condMapEmpty!9107 (= (arr!4704 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2336)) mapDefault!9107)))))

(assert (= (and start!20848 res!101778) b!208977))

(assert (= (and b!208977 res!101781) b!208978))

(assert (= (and b!208978 res!101777) b!208976))

(assert (= (and b!208976 res!101779) b!208974))

(assert (= (and b!208974 res!101780) b!208981))

(assert (= (and b!208981 res!101782) b!208973))

(assert (= (and b!208973 res!101783) b!208975))

(assert (= (and b!208982 condMapEmpty!9107) mapIsEmpty!9107))

(assert (= (and b!208982 (not condMapEmpty!9107)) mapNonEmpty!9107))

(get-info :version)

(assert (= (and mapNonEmpty!9107 ((_ is ValueCellFull!2336) mapValue!9107)) b!208979))

(assert (= (and b!208982 ((_ is ValueCellFull!2336) mapDefault!9107)) b!208980))

(assert (= start!20848 b!208982))

(declare-fun m!235953 () Bool)

(assert (=> mapNonEmpty!9107 m!235953))

(declare-fun m!235955 () Bool)

(assert (=> b!208973 m!235955))

(declare-fun m!235957 () Bool)

(assert (=> b!208978 m!235957))

(declare-fun m!235959 () Bool)

(assert (=> start!20848 m!235959))

(declare-fun m!235961 () Bool)

(assert (=> start!20848 m!235961))

(declare-fun m!235963 () Bool)

(assert (=> start!20848 m!235963))

(declare-fun m!235965 () Bool)

(assert (=> b!208976 m!235965))

(declare-fun m!235967 () Bool)

(assert (=> b!208981 m!235967))

(declare-fun m!235969 () Bool)

(assert (=> b!208975 m!235969))

(declare-fun m!235971 () Bool)

(assert (=> b!208975 m!235971))

(declare-fun m!235973 () Bool)

(assert (=> b!208975 m!235973))

(check-sat (not b!208976) (not b!208975) (not b_next!5497) (not start!20848) (not b!208978) b_and!12217 tp_is_empty!5359 (not b!208981) (not mapNonEmpty!9107))
(check-sat b_and!12217 (not b_next!5497))
