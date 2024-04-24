; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20164 () Bool)

(assert start!20164)

(declare-fun b_free!4819 () Bool)

(declare-fun b_next!4819 () Bool)

(assert (=> start!20164 (= b_free!4819 (not b_next!4819))))

(declare-fun tp!17489 () Bool)

(declare-fun b_and!11579 () Bool)

(assert (=> start!20164 (= tp!17489 b_and!11579)))

(declare-fun b!197881 () Bool)

(declare-fun e!130145 () Bool)

(declare-fun tp_is_empty!4675 () Bool)

(assert (=> b!197881 (= e!130145 tp_is_empty!4675)))

(declare-fun b!197882 () Bool)

(declare-fun res!93686 () Bool)

(declare-fun e!130146 () Bool)

(assert (=> b!197882 (=> (not res!93686) (not e!130146))))

(declare-datatypes ((array!8591 0))(
  ( (array!8592 (arr!4046 (Array (_ BitVec 32) (_ BitVec 64))) (size!4371 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8591)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5881 0))(
  ( (V!5882 (val!2382 Int)) )
))
(declare-datatypes ((ValueCell!1994 0))(
  ( (ValueCellFull!1994 (v!4353 V!5881)) (EmptyCell!1994) )
))
(declare-datatypes ((array!8593 0))(
  ( (array!8594 (arr!4047 (Array (_ BitVec 32) ValueCell!1994)) (size!4372 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8593)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!197882 (= res!93686 (and (= (size!4372 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4371 _keys!825) (size!4372 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197883 () Bool)

(declare-fun res!93691 () Bool)

(assert (=> b!197883 (=> (not res!93691) (not e!130146))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197883 (= res!93691 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8081 () Bool)

(declare-fun mapRes!8081 () Bool)

(declare-fun tp!17488 () Bool)

(assert (=> mapNonEmpty!8081 (= mapRes!8081 (and tp!17488 e!130145))))

(declare-fun mapValue!8081 () ValueCell!1994)

(declare-fun mapKey!8081 () (_ BitVec 32))

(declare-fun mapRest!8081 () (Array (_ BitVec 32) ValueCell!1994))

(assert (=> mapNonEmpty!8081 (= (arr!4047 _values!649) (store mapRest!8081 mapKey!8081 mapValue!8081))))

(declare-fun b!197884 () Bool)

(declare-fun res!93687 () Bool)

(assert (=> b!197884 (=> (not res!93687) (not e!130146))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197884 (= res!93687 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4371 _keys!825))))))

(declare-fun b!197885 () Bool)

(declare-fun res!93689 () Bool)

(assert (=> b!197885 (=> (not res!93689) (not e!130146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8591 (_ BitVec 32)) Bool)

(assert (=> b!197885 (= res!93689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197886 () Bool)

(declare-fun e!130148 () Bool)

(declare-fun e!130144 () Bool)

(assert (=> b!197886 (= e!130148 (and e!130144 mapRes!8081))))

(declare-fun condMapEmpty!8081 () Bool)

(declare-fun mapDefault!8081 () ValueCell!1994)

(assert (=> b!197886 (= condMapEmpty!8081 (= (arr!4047 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1994)) mapDefault!8081)))))

(declare-fun mapIsEmpty!8081 () Bool)

(assert (=> mapIsEmpty!8081 mapRes!8081))

(declare-fun b!197887 () Bool)

(assert (=> b!197887 (= e!130144 tp_is_empty!4675)))

(declare-fun b!197888 () Bool)

(declare-fun res!93685 () Bool)

(assert (=> b!197888 (=> (not res!93685) (not e!130146))))

(assert (=> b!197888 (= res!93685 (= (select (arr!4046 _keys!825) i!601) k0!843))))

(declare-fun res!93690 () Bool)

(assert (=> start!20164 (=> (not res!93690) (not e!130146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20164 (= res!93690 (validMask!0 mask!1149))))

(assert (=> start!20164 e!130146))

(declare-fun array_inv!2637 (array!8593) Bool)

(assert (=> start!20164 (and (array_inv!2637 _values!649) e!130148)))

(assert (=> start!20164 true))

(assert (=> start!20164 tp_is_empty!4675))

(declare-fun array_inv!2638 (array!8591) Bool)

(assert (=> start!20164 (array_inv!2638 _keys!825)))

(assert (=> start!20164 tp!17489))

(declare-fun b!197889 () Bool)

(assert (=> b!197889 (= e!130146 false)))

(declare-fun v!520 () V!5881)

(declare-datatypes ((tuple2!3566 0))(
  ( (tuple2!3567 (_1!1794 (_ BitVec 64)) (_2!1794 V!5881)) )
))
(declare-datatypes ((List!2483 0))(
  ( (Nil!2480) (Cons!2479 (h!3121 tuple2!3566) (t!7406 List!2483)) )
))
(declare-datatypes ((ListLongMap!2481 0))(
  ( (ListLongMap!2482 (toList!1256 List!2483)) )
))
(declare-fun lt!97855 () ListLongMap!2481)

(declare-fun zeroValue!615 () V!5881)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5881)

(declare-fun getCurrentListMapNoExtraKeys!246 (array!8591 array!8593 (_ BitVec 32) (_ BitVec 32) V!5881 V!5881 (_ BitVec 32) Int) ListLongMap!2481)

(assert (=> b!197889 (= lt!97855 (getCurrentListMapNoExtraKeys!246 _keys!825 (array!8594 (store (arr!4047 _values!649) i!601 (ValueCellFull!1994 v!520)) (size!4372 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97856 () ListLongMap!2481)

(assert (=> b!197889 (= lt!97856 (getCurrentListMapNoExtraKeys!246 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197890 () Bool)

(declare-fun res!93688 () Bool)

(assert (=> b!197890 (=> (not res!93688) (not e!130146))))

(declare-datatypes ((List!2484 0))(
  ( (Nil!2481) (Cons!2480 (h!3122 (_ BitVec 64)) (t!7407 List!2484)) )
))
(declare-fun arrayNoDuplicates!0 (array!8591 (_ BitVec 32) List!2484) Bool)

(assert (=> b!197890 (= res!93688 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2481))))

(assert (= (and start!20164 res!93690) b!197882))

(assert (= (and b!197882 res!93686) b!197885))

(assert (= (and b!197885 res!93689) b!197890))

(assert (= (and b!197890 res!93688) b!197884))

(assert (= (and b!197884 res!93687) b!197883))

(assert (= (and b!197883 res!93691) b!197888))

(assert (= (and b!197888 res!93685) b!197889))

(assert (= (and b!197886 condMapEmpty!8081) mapIsEmpty!8081))

(assert (= (and b!197886 (not condMapEmpty!8081)) mapNonEmpty!8081))

(get-info :version)

(assert (= (and mapNonEmpty!8081 ((_ is ValueCellFull!1994) mapValue!8081)) b!197881))

(assert (= (and b!197886 ((_ is ValueCellFull!1994) mapDefault!8081)) b!197887))

(assert (= start!20164 b!197886))

(declare-fun m!224787 () Bool)

(assert (=> b!197885 m!224787))

(declare-fun m!224789 () Bool)

(assert (=> mapNonEmpty!8081 m!224789))

(declare-fun m!224791 () Bool)

(assert (=> b!197883 m!224791))

(declare-fun m!224793 () Bool)

(assert (=> b!197890 m!224793))

(declare-fun m!224795 () Bool)

(assert (=> b!197888 m!224795))

(declare-fun m!224797 () Bool)

(assert (=> b!197889 m!224797))

(declare-fun m!224799 () Bool)

(assert (=> b!197889 m!224799))

(declare-fun m!224801 () Bool)

(assert (=> b!197889 m!224801))

(declare-fun m!224803 () Bool)

(assert (=> start!20164 m!224803))

(declare-fun m!224805 () Bool)

(assert (=> start!20164 m!224805))

(declare-fun m!224807 () Bool)

(assert (=> start!20164 m!224807))

(check-sat (not b!197885) (not b!197889) (not b!197890) (not b!197883) (not b_next!4819) b_and!11579 (not start!20164) tp_is_empty!4675 (not mapNonEmpty!8081))
(check-sat b_and!11579 (not b_next!4819))
