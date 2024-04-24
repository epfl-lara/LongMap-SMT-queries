; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77676 () Bool)

(assert start!77676)

(declare-fun b_free!16093 () Bool)

(declare-fun b_next!16093 () Bool)

(assert (=> start!77676 (= b_free!16093 (not b_next!16093))))

(declare-fun tp!56541 () Bool)

(declare-fun b_and!26469 () Bool)

(assert (=> start!77676 (= tp!56541 b_and!26469)))

(declare-fun b!904013 () Bool)

(declare-fun res!609699 () Bool)

(declare-fun e!506531 () Bool)

(assert (=> b!904013 (=> (not res!609699) (not e!506531))))

(declare-datatypes ((array!53117 0))(
  ( (array!53118 (arr!25513 (Array (_ BitVec 32) (_ BitVec 64))) (size!25973 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53117)

(declare-datatypes ((List!17861 0))(
  ( (Nil!17858) (Cons!17857 (h!19009 (_ BitVec 64)) (t!25236 List!17861)) )
))
(declare-fun arrayNoDuplicates!0 (array!53117 (_ BitVec 32) List!17861) Bool)

(assert (=> b!904013 (= res!609699 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17858))))

(declare-fun b!904014 () Bool)

(declare-fun e!506532 () Bool)

(declare-fun tp_is_empty!18511 () Bool)

(assert (=> b!904014 (= e!506532 tp_is_empty!18511)))

(declare-fun b!904015 () Bool)

(declare-fun res!609697 () Bool)

(assert (=> b!904015 (=> (not res!609697) (not e!506531))))

(declare-datatypes ((V!29647 0))(
  ( (V!29648 (val!9306 Int)) )
))
(declare-datatypes ((ValueCell!8774 0))(
  ( (ValueCellFull!8774 (v!11808 V!29647)) (EmptyCell!8774) )
))
(declare-datatypes ((array!53119 0))(
  ( (array!53120 (arr!25514 (Array (_ BitVec 32) ValueCell!8774)) (size!25974 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53119)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!904015 (= res!609697 (and (= (size!25974 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25973 _keys!1386) (size!25974 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904016 () Bool)

(declare-fun res!609700 () Bool)

(assert (=> b!904016 (=> (not res!609700) (not e!506531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53117 (_ BitVec 32)) Bool)

(assert (=> b!904016 (= res!609700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29479 () Bool)

(declare-fun mapRes!29479 () Bool)

(assert (=> mapIsEmpty!29479 mapRes!29479))

(declare-fun res!609698 () Bool)

(assert (=> start!77676 (=> (not res!609698) (not e!506531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77676 (= res!609698 (validMask!0 mask!1756))))

(assert (=> start!77676 e!506531))

(declare-fun e!506529 () Bool)

(declare-fun array_inv!20060 (array!53119) Bool)

(assert (=> start!77676 (and (array_inv!20060 _values!1152) e!506529)))

(assert (=> start!77676 tp!56541))

(assert (=> start!77676 true))

(assert (=> start!77676 tp_is_empty!18511))

(declare-fun array_inv!20061 (array!53117) Bool)

(assert (=> start!77676 (array_inv!20061 _keys!1386)))

(declare-fun mapNonEmpty!29479 () Bool)

(declare-fun tp!56542 () Bool)

(assert (=> mapNonEmpty!29479 (= mapRes!29479 (and tp!56542 e!506532))))

(declare-fun mapValue!29479 () ValueCell!8774)

(declare-fun mapKey!29479 () (_ BitVec 32))

(declare-fun mapRest!29479 () (Array (_ BitVec 32) ValueCell!8774))

(assert (=> mapNonEmpty!29479 (= (arr!25514 _values!1152) (store mapRest!29479 mapKey!29479 mapValue!29479))))

(declare-fun b!904017 () Bool)

(declare-fun e!506528 () Bool)

(assert (=> b!904017 (= e!506528 tp_is_empty!18511)))

(declare-fun b!904018 () Bool)

(assert (=> b!904018 (= e!506529 (and e!506528 mapRes!29479))))

(declare-fun condMapEmpty!29479 () Bool)

(declare-fun mapDefault!29479 () ValueCell!8774)

(assert (=> b!904018 (= condMapEmpty!29479 (= (arr!25514 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8774)) mapDefault!29479)))))

(declare-fun b!904019 () Bool)

(assert (=> b!904019 (= e!506531 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29647)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29647)

(declare-fun lt!408322 () Bool)

(declare-datatypes ((tuple2!12010 0))(
  ( (tuple2!12011 (_1!6016 (_ BitVec 64)) (_2!6016 V!29647)) )
))
(declare-datatypes ((List!17862 0))(
  ( (Nil!17859) (Cons!17858 (h!19010 tuple2!12010) (t!25237 List!17862)) )
))
(declare-datatypes ((ListLongMap!10709 0))(
  ( (ListLongMap!10710 (toList!5370 List!17862)) )
))
(declare-fun contains!4428 (ListLongMap!10709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2639 (array!53117 array!53119 (_ BitVec 32) (_ BitVec 32) V!29647 V!29647 (_ BitVec 32) Int) ListLongMap!10709)

(assert (=> b!904019 (= lt!408322 (contains!4428 (getCurrentListMap!2639 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!77676 res!609698) b!904015))

(assert (= (and b!904015 res!609697) b!904016))

(assert (= (and b!904016 res!609700) b!904013))

(assert (= (and b!904013 res!609699) b!904019))

(assert (= (and b!904018 condMapEmpty!29479) mapIsEmpty!29479))

(assert (= (and b!904018 (not condMapEmpty!29479)) mapNonEmpty!29479))

(get-info :version)

(assert (= (and mapNonEmpty!29479 ((_ is ValueCellFull!8774) mapValue!29479)) b!904014))

(assert (= (and b!904018 ((_ is ValueCellFull!8774) mapDefault!29479)) b!904017))

(assert (= start!77676 b!904018))

(declare-fun m!840167 () Bool)

(assert (=> b!904013 m!840167))

(declare-fun m!840169 () Bool)

(assert (=> start!77676 m!840169))

(declare-fun m!840171 () Bool)

(assert (=> start!77676 m!840171))

(declare-fun m!840173 () Bool)

(assert (=> start!77676 m!840173))

(declare-fun m!840175 () Bool)

(assert (=> b!904016 m!840175))

(declare-fun m!840177 () Bool)

(assert (=> mapNonEmpty!29479 m!840177))

(declare-fun m!840179 () Bool)

(assert (=> b!904019 m!840179))

(assert (=> b!904019 m!840179))

(declare-fun m!840181 () Bool)

(assert (=> b!904019 m!840181))

(check-sat tp_is_empty!18511 (not mapNonEmpty!29479) (not start!77676) (not b!904019) (not b!904013) (not b!904016) (not b_next!16093) b_and!26469)
(check-sat b_and!26469 (not b_next!16093))
