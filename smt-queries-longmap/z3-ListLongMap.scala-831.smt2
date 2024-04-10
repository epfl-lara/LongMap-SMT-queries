; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20084 () Bool)

(assert start!20084)

(declare-fun b_free!4743 () Bool)

(declare-fun b_next!4743 () Bool)

(assert (=> start!20084 (= b_free!4743 (not b_next!4743))))

(declare-fun tp!17260 () Bool)

(declare-fun b_and!11489 () Bool)

(assert (=> start!20084 (= tp!17260 b_and!11489)))

(declare-fun b!196694 () Bool)

(declare-fun e!129554 () Bool)

(assert (=> b!196694 (= e!129554 false)))

(declare-datatypes ((V!5779 0))(
  ( (V!5780 (val!2344 Int)) )
))
(declare-datatypes ((ValueCell!1956 0))(
  ( (ValueCellFull!1956 (v!4314 V!5779)) (EmptyCell!1956) )
))
(declare-datatypes ((array!8455 0))(
  ( (array!8456 (arr!3978 (Array (_ BitVec 32) ValueCell!1956)) (size!4303 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8455)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5779)

(declare-datatypes ((array!8457 0))(
  ( (array!8458 (arr!3979 (Array (_ BitVec 32) (_ BitVec 64))) (size!4304 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8457)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5779)

(declare-datatypes ((tuple2!3572 0))(
  ( (tuple2!3573 (_1!1797 (_ BitVec 64)) (_2!1797 V!5779)) )
))
(declare-datatypes ((List!2483 0))(
  ( (Nil!2480) (Cons!2479 (h!3121 tuple2!3572) (t!7414 List!2483)) )
))
(declare-datatypes ((ListLongMap!2485 0))(
  ( (ListLongMap!2486 (toList!1258 List!2483)) )
))
(declare-fun lt!97644 () ListLongMap!2485)

(declare-fun getCurrentListMapNoExtraKeys!223 (array!8457 array!8455 (_ BitVec 32) (_ BitVec 32) V!5779 V!5779 (_ BitVec 32) Int) ListLongMap!2485)

(assert (=> b!196694 (= lt!97644 (getCurrentListMapNoExtraKeys!223 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196695 () Bool)

(declare-fun res!92872 () Bool)

(assert (=> b!196695 (=> (not res!92872) (not e!129554))))

(assert (=> b!196695 (= res!92872 (and (= (size!4303 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4304 _keys!825) (size!4303 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196696 () Bool)

(declare-fun e!129552 () Bool)

(declare-fun e!129551 () Bool)

(declare-fun mapRes!7967 () Bool)

(assert (=> b!196696 (= e!129552 (and e!129551 mapRes!7967))))

(declare-fun condMapEmpty!7967 () Bool)

(declare-fun mapDefault!7967 () ValueCell!1956)

(assert (=> b!196696 (= condMapEmpty!7967 (= (arr!3978 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1956)) mapDefault!7967)))))

(declare-fun b!196697 () Bool)

(declare-fun res!92869 () Bool)

(assert (=> b!196697 (=> (not res!92869) (not e!129554))))

(declare-datatypes ((List!2484 0))(
  ( (Nil!2481) (Cons!2480 (h!3122 (_ BitVec 64)) (t!7415 List!2484)) )
))
(declare-fun arrayNoDuplicates!0 (array!8457 (_ BitVec 32) List!2484) Bool)

(assert (=> b!196697 (= res!92869 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2481))))

(declare-fun b!196698 () Bool)

(declare-fun e!129550 () Bool)

(declare-fun tp_is_empty!4599 () Bool)

(assert (=> b!196698 (= e!129550 tp_is_empty!4599)))

(declare-fun b!196699 () Bool)

(declare-fun res!92870 () Bool)

(assert (=> b!196699 (=> (not res!92870) (not e!129554))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196699 (= res!92870 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4304 _keys!825))))))

(declare-fun b!196700 () Bool)

(declare-fun res!92866 () Bool)

(assert (=> b!196700 (=> (not res!92866) (not e!129554))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!196700 (= res!92866 (= (select (arr!3979 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!7967 () Bool)

(declare-fun tp!17261 () Bool)

(assert (=> mapNonEmpty!7967 (= mapRes!7967 (and tp!17261 e!129550))))

(declare-fun mapRest!7967 () (Array (_ BitVec 32) ValueCell!1956))

(declare-fun mapKey!7967 () (_ BitVec 32))

(declare-fun mapValue!7967 () ValueCell!1956)

(assert (=> mapNonEmpty!7967 (= (arr!3978 _values!649) (store mapRest!7967 mapKey!7967 mapValue!7967))))

(declare-fun res!92867 () Bool)

(assert (=> start!20084 (=> (not res!92867) (not e!129554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20084 (= res!92867 (validMask!0 mask!1149))))

(assert (=> start!20084 e!129554))

(declare-fun array_inv!2595 (array!8455) Bool)

(assert (=> start!20084 (and (array_inv!2595 _values!649) e!129552)))

(assert (=> start!20084 true))

(assert (=> start!20084 tp_is_empty!4599))

(declare-fun array_inv!2596 (array!8457) Bool)

(assert (=> start!20084 (array_inv!2596 _keys!825)))

(assert (=> start!20084 tp!17260))

(declare-fun b!196701 () Bool)

(assert (=> b!196701 (= e!129551 tp_is_empty!4599)))

(declare-fun b!196702 () Bool)

(declare-fun res!92868 () Bool)

(assert (=> b!196702 (=> (not res!92868) (not e!129554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196702 (= res!92868 (validKeyInArray!0 k0!843))))

(declare-fun b!196703 () Bool)

(declare-fun res!92871 () Bool)

(assert (=> b!196703 (=> (not res!92871) (not e!129554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8457 (_ BitVec 32)) Bool)

(assert (=> b!196703 (= res!92871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!7967 () Bool)

(assert (=> mapIsEmpty!7967 mapRes!7967))

(assert (= (and start!20084 res!92867) b!196695))

(assert (= (and b!196695 res!92872) b!196703))

(assert (= (and b!196703 res!92871) b!196697))

(assert (= (and b!196697 res!92869) b!196699))

(assert (= (and b!196699 res!92870) b!196702))

(assert (= (and b!196702 res!92868) b!196700))

(assert (= (and b!196700 res!92866) b!196694))

(assert (= (and b!196696 condMapEmpty!7967) mapIsEmpty!7967))

(assert (= (and b!196696 (not condMapEmpty!7967)) mapNonEmpty!7967))

(get-info :version)

(assert (= (and mapNonEmpty!7967 ((_ is ValueCellFull!1956) mapValue!7967)) b!196698))

(assert (= (and b!196696 ((_ is ValueCellFull!1956) mapDefault!7967)) b!196701))

(assert (= start!20084 b!196696))

(declare-fun m!223873 () Bool)

(assert (=> b!196697 m!223873))

(declare-fun m!223875 () Bool)

(assert (=> b!196700 m!223875))

(declare-fun m!223877 () Bool)

(assert (=> b!196702 m!223877))

(declare-fun m!223879 () Bool)

(assert (=> mapNonEmpty!7967 m!223879))

(declare-fun m!223881 () Bool)

(assert (=> b!196703 m!223881))

(declare-fun m!223883 () Bool)

(assert (=> b!196694 m!223883))

(declare-fun m!223885 () Bool)

(assert (=> start!20084 m!223885))

(declare-fun m!223887 () Bool)

(assert (=> start!20084 m!223887))

(declare-fun m!223889 () Bool)

(assert (=> start!20084 m!223889))

(check-sat tp_is_empty!4599 (not b!196694) (not b!196702) (not b!196703) (not b!196697) (not mapNonEmpty!7967) (not b_next!4743) b_and!11489 (not start!20084))
(check-sat b_and!11489 (not b_next!4743))
