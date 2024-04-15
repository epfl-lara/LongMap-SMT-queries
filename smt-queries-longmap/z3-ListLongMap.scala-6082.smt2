; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78582 () Bool)

(assert start!78582)

(declare-fun b_free!16813 () Bool)

(declare-fun b_next!16813 () Bool)

(assert (=> start!78582 (= b_free!16813 (not b_next!16813))))

(declare-fun tp!58880 () Bool)

(declare-fun b_and!27409 () Bool)

(assert (=> start!78582 (= tp!58880 b_and!27409)))

(declare-fun mapIsEmpty!30738 () Bool)

(declare-fun mapRes!30738 () Bool)

(assert (=> mapIsEmpty!30738 mapRes!30738))

(declare-fun res!617588 () Bool)

(declare-fun e!514172 () Bool)

(assert (=> start!78582 (=> (not res!617588) (not e!514172))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78582 (= res!617588 (validMask!0 mask!1881))))

(assert (=> start!78582 e!514172))

(assert (=> start!78582 true))

(declare-datatypes ((V!30727 0))(
  ( (V!30728 (val!9711 Int)) )
))
(declare-datatypes ((ValueCell!9179 0))(
  ( (ValueCellFull!9179 (v!12228 V!30727)) (EmptyCell!9179) )
))
(declare-datatypes ((array!54619 0))(
  ( (array!54620 (arr!26255 (Array (_ BitVec 32) ValueCell!9179)) (size!26716 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54619)

(declare-fun e!514171 () Bool)

(declare-fun array_inv!20566 (array!54619) Bool)

(assert (=> start!78582 (and (array_inv!20566 _values!1231) e!514171)))

(assert (=> start!78582 tp!58880))

(declare-datatypes ((array!54621 0))(
  ( (array!54622 (arr!26256 (Array (_ BitVec 32) (_ BitVec 64))) (size!26717 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54621)

(declare-fun array_inv!20567 (array!54621) Bool)

(assert (=> start!78582 (array_inv!20567 _keys!1487)))

(declare-fun tp_is_empty!19321 () Bool)

(assert (=> start!78582 tp_is_empty!19321))

(declare-fun mapNonEmpty!30738 () Bool)

(declare-fun tp!58881 () Bool)

(declare-fun e!514170 () Bool)

(assert (=> mapNonEmpty!30738 (= mapRes!30738 (and tp!58881 e!514170))))

(declare-fun mapValue!30738 () ValueCell!9179)

(declare-fun mapKey!30738 () (_ BitVec 32))

(declare-fun mapRest!30738 () (Array (_ BitVec 32) ValueCell!9179))

(assert (=> mapNonEmpty!30738 (= (arr!26255 _values!1231) (store mapRest!30738 mapKey!30738 mapValue!30738))))

(declare-fun b!916012 () Bool)

(declare-fun e!514169 () Bool)

(assert (=> b!916012 (= e!514169 tp_is_empty!19321)))

(declare-fun b!916013 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916013 (= e!514172 (bvsgt from!1844 (size!26717 _keys!1487)))))

(declare-fun b!916014 () Bool)

(declare-fun res!617586 () Bool)

(assert (=> b!916014 (=> (not res!617586) (not e!514172))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30727)

(declare-fun minValue!1173 () V!30727)

(declare-datatypes ((tuple2!12644 0))(
  ( (tuple2!12645 (_1!6333 (_ BitVec 64)) (_2!6333 V!30727)) )
))
(declare-datatypes ((List!18442 0))(
  ( (Nil!18439) (Cons!18438 (h!19584 tuple2!12644) (t!26046 List!18442)) )
))
(declare-datatypes ((ListLongMap!11331 0))(
  ( (ListLongMap!11332 (toList!5681 List!18442)) )
))
(declare-fun contains!4691 (ListLongMap!11331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2880 (array!54621 array!54619 (_ BitVec 32) (_ BitVec 32) V!30727 V!30727 (_ BitVec 32) Int) ListLongMap!11331)

(assert (=> b!916014 (= res!617586 (contains!4691 (getCurrentListMap!2880 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!916015 () Bool)

(declare-fun res!617585 () Bool)

(assert (=> b!916015 (=> (not res!617585) (not e!514172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54621 (_ BitVec 32)) Bool)

(assert (=> b!916015 (= res!617585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916016 () Bool)

(declare-fun res!617584 () Bool)

(assert (=> b!916016 (=> (not res!617584) (not e!514172))))

(assert (=> b!916016 (= res!617584 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26717 _keys!1487))))))

(declare-fun b!916017 () Bool)

(assert (=> b!916017 (= e!514171 (and e!514169 mapRes!30738))))

(declare-fun condMapEmpty!30738 () Bool)

(declare-fun mapDefault!30738 () ValueCell!9179)

(assert (=> b!916017 (= condMapEmpty!30738 (= (arr!26255 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9179)) mapDefault!30738)))))

(declare-fun b!916018 () Bool)

(declare-fun res!617587 () Bool)

(assert (=> b!916018 (=> (not res!617587) (not e!514172))))

(assert (=> b!916018 (= res!617587 (and (= (size!26716 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26717 _keys!1487) (size!26716 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916019 () Bool)

(assert (=> b!916019 (= e!514170 tp_is_empty!19321)))

(declare-fun b!916020 () Bool)

(declare-fun res!617583 () Bool)

(assert (=> b!916020 (=> (not res!617583) (not e!514172))))

(declare-datatypes ((List!18443 0))(
  ( (Nil!18440) (Cons!18439 (h!19585 (_ BitVec 64)) (t!26047 List!18443)) )
))
(declare-fun arrayNoDuplicates!0 (array!54621 (_ BitVec 32) List!18443) Bool)

(assert (=> b!916020 (= res!617583 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18440))))

(assert (= (and start!78582 res!617588) b!916018))

(assert (= (and b!916018 res!617587) b!916015))

(assert (= (and b!916015 res!617585) b!916020))

(assert (= (and b!916020 res!617583) b!916016))

(assert (= (and b!916016 res!617584) b!916014))

(assert (= (and b!916014 res!617586) b!916013))

(assert (= (and b!916017 condMapEmpty!30738) mapIsEmpty!30738))

(assert (= (and b!916017 (not condMapEmpty!30738)) mapNonEmpty!30738))

(get-info :version)

(assert (= (and mapNonEmpty!30738 ((_ is ValueCellFull!9179) mapValue!30738)) b!916019))

(assert (= (and b!916017 ((_ is ValueCellFull!9179) mapDefault!30738)) b!916012))

(assert (= start!78582 b!916017))

(declare-fun m!849589 () Bool)

(assert (=> start!78582 m!849589))

(declare-fun m!849591 () Bool)

(assert (=> start!78582 m!849591))

(declare-fun m!849593 () Bool)

(assert (=> start!78582 m!849593))

(declare-fun m!849595 () Bool)

(assert (=> b!916020 m!849595))

(declare-fun m!849597 () Bool)

(assert (=> b!916014 m!849597))

(assert (=> b!916014 m!849597))

(declare-fun m!849599 () Bool)

(assert (=> b!916014 m!849599))

(declare-fun m!849601 () Bool)

(assert (=> mapNonEmpty!30738 m!849601))

(declare-fun m!849603 () Bool)

(assert (=> b!916015 m!849603))

(check-sat (not start!78582) tp_is_empty!19321 b_and!27409 (not b_next!16813) (not b!916015) (not b!916020) (not b!916014) (not mapNonEmpty!30738))
(check-sat b_and!27409 (not b_next!16813))
