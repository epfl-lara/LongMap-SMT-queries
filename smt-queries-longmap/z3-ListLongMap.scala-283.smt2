; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4628 () Bool)

(assert start!4628)

(declare-fun b_free!1285 () Bool)

(declare-fun b_next!1285 () Bool)

(assert (=> start!4628 (= b_free!1285 (not b_next!1285))))

(declare-fun tp!5305 () Bool)

(declare-fun b_and!2113 () Bool)

(assert (=> start!4628 (= tp!5305 b_and!2113)))

(declare-fun b!36180 () Bool)

(declare-fun e!22838 () Bool)

(assert (=> b!36180 (= e!22838 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!2011 0))(
  ( (V!2012 (val!846 Int)) )
))
(declare-datatypes ((ValueCell!620 0))(
  ( (ValueCellFull!620 (v!1945 V!2011)) (EmptyCell!620) )
))
(declare-datatypes ((array!2469 0))(
  ( (array!2470 (arr!1178 (Array (_ BitVec 32) ValueCell!620)) (size!1279 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2469)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2471 0))(
  ( (array!2472 (arr!1179 (Array (_ BitVec 32) (_ BitVec 64))) (size!1280 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2471)

(declare-fun lt!13436 () Bool)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!2011)

(declare-fun minValue!1443 () V!2011)

(declare-datatypes ((tuple2!1356 0))(
  ( (tuple2!1357 (_1!689 (_ BitVec 64)) (_2!689 V!2011)) )
))
(declare-datatypes ((List!941 0))(
  ( (Nil!938) (Cons!937 (h!1505 tuple2!1356) (t!3647 List!941)) )
))
(declare-datatypes ((ListLongMap!921 0))(
  ( (ListLongMap!922 (toList!476 List!941)) )
))
(declare-fun contains!428 (ListLongMap!921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!294 (array!2471 array!2469 (_ BitVec 32) (_ BitVec 32) V!2011 V!2011 (_ BitVec 32) Int) ListLongMap!921)

(assert (=> b!36180 (= lt!13436 (contains!428 (getCurrentListMap!294 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun mapIsEmpty!2018 () Bool)

(declare-fun mapRes!2018 () Bool)

(assert (=> mapIsEmpty!2018 mapRes!2018))

(declare-fun mapNonEmpty!2018 () Bool)

(declare-fun tp!5306 () Bool)

(declare-fun e!22841 () Bool)

(assert (=> mapNonEmpty!2018 (= mapRes!2018 (and tp!5306 e!22841))))

(declare-fun mapValue!2018 () ValueCell!620)

(declare-fun mapRest!2018 () (Array (_ BitVec 32) ValueCell!620))

(declare-fun mapKey!2018 () (_ BitVec 32))

(assert (=> mapNonEmpty!2018 (= (arr!1178 _values!1501) (store mapRest!2018 mapKey!2018 mapValue!2018))))

(declare-fun b!36181 () Bool)

(declare-fun res!21896 () Bool)

(assert (=> b!36181 (=> (not res!21896) (not e!22838))))

(declare-datatypes ((List!942 0))(
  ( (Nil!939) (Cons!938 (h!1506 (_ BitVec 64)) (t!3648 List!942)) )
))
(declare-fun arrayNoDuplicates!0 (array!2471 (_ BitVec 32) List!942) Bool)

(assert (=> b!36181 (= res!21896 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!939))))

(declare-fun b!36183 () Bool)

(declare-fun res!21894 () Bool)

(assert (=> b!36183 (=> (not res!21894) (not e!22838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!36183 (= res!21894 (validKeyInArray!0 k0!1304))))

(declare-fun b!36184 () Bool)

(declare-fun tp_is_empty!1639 () Bool)

(assert (=> b!36184 (= e!22841 tp_is_empty!1639)))

(declare-fun b!36185 () Bool)

(declare-fun e!22839 () Bool)

(assert (=> b!36185 (= e!22839 tp_is_empty!1639)))

(declare-fun b!36186 () Bool)

(declare-fun res!21898 () Bool)

(assert (=> b!36186 (=> (not res!21898) (not e!22838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2471 (_ BitVec 32)) Bool)

(assert (=> b!36186 (= res!21898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!36187 () Bool)

(declare-fun res!21895 () Bool)

(assert (=> b!36187 (=> (not res!21895) (not e!22838))))

(assert (=> b!36187 (= res!21895 (and (= (size!1279 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1280 _keys!1833) (size!1279 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!36182 () Bool)

(declare-fun e!22840 () Bool)

(assert (=> b!36182 (= e!22840 (and e!22839 mapRes!2018))))

(declare-fun condMapEmpty!2018 () Bool)

(declare-fun mapDefault!2018 () ValueCell!620)

(assert (=> b!36182 (= condMapEmpty!2018 (= (arr!1178 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!620)) mapDefault!2018)))))

(declare-fun res!21897 () Bool)

(assert (=> start!4628 (=> (not res!21897) (not e!22838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4628 (= res!21897 (validMask!0 mask!2294))))

(assert (=> start!4628 e!22838))

(assert (=> start!4628 true))

(assert (=> start!4628 tp!5305))

(declare-fun array_inv!831 (array!2469) Bool)

(assert (=> start!4628 (and (array_inv!831 _values!1501) e!22840)))

(declare-fun array_inv!832 (array!2471) Bool)

(assert (=> start!4628 (array_inv!832 _keys!1833)))

(assert (=> start!4628 tp_is_empty!1639))

(assert (= (and start!4628 res!21897) b!36187))

(assert (= (and b!36187 res!21895) b!36186))

(assert (= (and b!36186 res!21898) b!36181))

(assert (= (and b!36181 res!21896) b!36183))

(assert (= (and b!36183 res!21894) b!36180))

(assert (= (and b!36182 condMapEmpty!2018) mapIsEmpty!2018))

(assert (= (and b!36182 (not condMapEmpty!2018)) mapNonEmpty!2018))

(get-info :version)

(assert (= (and mapNonEmpty!2018 ((_ is ValueCellFull!620) mapValue!2018)) b!36184))

(assert (= (and b!36182 ((_ is ValueCellFull!620) mapDefault!2018)) b!36185))

(assert (= start!4628 b!36182))

(declare-fun m!29141 () Bool)

(assert (=> b!36180 m!29141))

(assert (=> b!36180 m!29141))

(declare-fun m!29143 () Bool)

(assert (=> b!36180 m!29143))

(declare-fun m!29145 () Bool)

(assert (=> b!36181 m!29145))

(declare-fun m!29147 () Bool)

(assert (=> mapNonEmpty!2018 m!29147))

(declare-fun m!29149 () Bool)

(assert (=> b!36183 m!29149))

(declare-fun m!29151 () Bool)

(assert (=> b!36186 m!29151))

(declare-fun m!29153 () Bool)

(assert (=> start!4628 m!29153))

(declare-fun m!29155 () Bool)

(assert (=> start!4628 m!29155))

(declare-fun m!29157 () Bool)

(assert (=> start!4628 m!29157))

(check-sat (not mapNonEmpty!2018) (not b!36180) (not start!4628) tp_is_empty!1639 (not b!36183) (not b!36186) (not b!36181) (not b_next!1285) b_and!2113)
(check-sat b_and!2113 (not b_next!1285))
