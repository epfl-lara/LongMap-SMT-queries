; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4040 () Bool)

(assert start!4040)

(declare-fun b_free!945 () Bool)

(declare-fun b_next!945 () Bool)

(assert (=> start!4040 (= b_free!945 (not b_next!945))))

(declare-fun tp!4254 () Bool)

(declare-fun b_and!1755 () Bool)

(assert (=> start!4040 (= tp!4254 b_and!1755)))

(declare-fun b!29591 () Bool)

(declare-fun e!19097 () Bool)

(declare-fun tp_is_empty!1299 () Bool)

(assert (=> b!29591 (= e!19097 tp_is_empty!1299)))

(declare-fun b!29592 () Bool)

(declare-fun e!19098 () Bool)

(declare-fun mapRes!1477 () Bool)

(assert (=> b!29592 (= e!19098 (and e!19097 mapRes!1477))))

(declare-fun condMapEmpty!1477 () Bool)

(declare-datatypes ((V!1557 0))(
  ( (V!1558 (val!676 Int)) )
))
(declare-datatypes ((ValueCell!450 0))(
  ( (ValueCellFull!450 (v!1765 V!1557)) (EmptyCell!450) )
))
(declare-datatypes ((array!1829 0))(
  ( (array!1830 (arr!868 (Array (_ BitVec 32) ValueCell!450)) (size!969 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1829)

(declare-fun mapDefault!1477 () ValueCell!450)

(assert (=> b!29592 (= condMapEmpty!1477 (= (arr!868 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!450)) mapDefault!1477)))))

(declare-fun b!29593 () Bool)

(declare-fun res!17760 () Bool)

(declare-fun e!19100 () Bool)

(assert (=> b!29593 (=> (not res!17760) (not e!19100))))

(declare-datatypes ((array!1831 0))(
  ( (array!1832 (arr!869 (Array (_ BitVec 32) (_ BitVec 64))) (size!970 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1831)

(declare-datatypes ((List!720 0))(
  ( (Nil!717) (Cons!716 (h!1283 (_ BitVec 64)) (t!3413 List!720)) )
))
(declare-fun arrayNoDuplicates!0 (array!1831 (_ BitVec 32) List!720) Bool)

(assert (=> b!29593 (= res!17760 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!717))))

(declare-fun b!29594 () Bool)

(declare-fun e!19096 () Bool)

(assert (=> b!29594 (= e!19096 tp_is_empty!1299)))

(declare-fun b!29595 () Bool)

(declare-fun res!17757 () Bool)

(assert (=> b!29595 (=> (not res!17757) (not e!19100))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29595 (= res!17757 (validKeyInArray!0 k0!1304))))

(declare-fun b!29596 () Bool)

(declare-fun res!17758 () Bool)

(assert (=> b!29596 (=> (not res!17758) (not e!19100))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1831 (_ BitVec 32)) Bool)

(assert (=> b!29596 (= res!17758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17759 () Bool)

(assert (=> start!4040 (=> (not res!17759) (not e!19100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4040 (= res!17759 (validMask!0 mask!2294))))

(assert (=> start!4040 e!19100))

(assert (=> start!4040 true))

(assert (=> start!4040 tp!4254))

(declare-fun array_inv!603 (array!1829) Bool)

(assert (=> start!4040 (and (array_inv!603 _values!1501) e!19098)))

(declare-fun array_inv!604 (array!1831) Bool)

(assert (=> start!4040 (array_inv!604 _keys!1833)))

(assert (=> start!4040 tp_is_empty!1299))

(declare-fun mapIsEmpty!1477 () Bool)

(assert (=> mapIsEmpty!1477 mapRes!1477))

(declare-fun b!29597 () Bool)

(declare-fun res!17756 () Bool)

(assert (=> b!29597 (=> (not res!17756) (not e!19100))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!29597 (= res!17756 (and (= (size!969 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!970 _keys!1833) (size!969 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1477 () Bool)

(declare-fun tp!4255 () Bool)

(assert (=> mapNonEmpty!1477 (= mapRes!1477 (and tp!4255 e!19096))))

(declare-fun mapRest!1477 () (Array (_ BitVec 32) ValueCell!450))

(declare-fun mapKey!1477 () (_ BitVec 32))

(declare-fun mapValue!1477 () ValueCell!450)

(assert (=> mapNonEmpty!1477 (= (arr!868 _values!1501) (store mapRest!1477 mapKey!1477 mapValue!1477))))

(declare-fun b!29598 () Bool)

(assert (=> b!29598 (= e!19100 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11342 () Bool)

(declare-fun zeroValue!1443 () V!1557)

(declare-fun minValue!1443 () V!1557)

(declare-datatypes ((tuple2!1120 0))(
  ( (tuple2!1121 (_1!571 (_ BitVec 64)) (_2!571 V!1557)) )
))
(declare-datatypes ((List!721 0))(
  ( (Nil!718) (Cons!717 (h!1284 tuple2!1120) (t!3414 List!721)) )
))
(declare-datatypes ((ListLongMap!697 0))(
  ( (ListLongMap!698 (toList!364 List!721)) )
))
(declare-fun contains!304 (ListLongMap!697 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!192 (array!1831 array!1829 (_ BitVec 32) (_ BitVec 32) V!1557 V!1557 (_ BitVec 32) Int) ListLongMap!697)

(assert (=> b!29598 (= lt!11342 (contains!304 (getCurrentListMap!192 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(assert (= (and start!4040 res!17759) b!29597))

(assert (= (and b!29597 res!17756) b!29596))

(assert (= (and b!29596 res!17758) b!29593))

(assert (= (and b!29593 res!17760) b!29595))

(assert (= (and b!29595 res!17757) b!29598))

(assert (= (and b!29592 condMapEmpty!1477) mapIsEmpty!1477))

(assert (= (and b!29592 (not condMapEmpty!1477)) mapNonEmpty!1477))

(get-info :version)

(assert (= (and mapNonEmpty!1477 ((_ is ValueCellFull!450) mapValue!1477)) b!29594))

(assert (= (and b!29592 ((_ is ValueCellFull!450) mapDefault!1477)) b!29591))

(assert (= start!4040 b!29592))

(declare-fun m!23839 () Bool)

(assert (=> mapNonEmpty!1477 m!23839))

(declare-fun m!23841 () Bool)

(assert (=> b!29598 m!23841))

(assert (=> b!29598 m!23841))

(declare-fun m!23843 () Bool)

(assert (=> b!29598 m!23843))

(declare-fun m!23845 () Bool)

(assert (=> b!29593 m!23845))

(declare-fun m!23847 () Bool)

(assert (=> start!4040 m!23847))

(declare-fun m!23849 () Bool)

(assert (=> start!4040 m!23849))

(declare-fun m!23851 () Bool)

(assert (=> start!4040 m!23851))

(declare-fun m!23853 () Bool)

(assert (=> b!29595 m!23853))

(declare-fun m!23855 () Bool)

(assert (=> b!29596 m!23855))

(check-sat (not b!29595) (not mapNonEmpty!1477) (not b_next!945) tp_is_empty!1299 (not b!29598) (not start!4040) (not b!29596) (not b!29593) b_and!1755)
(check-sat b_and!1755 (not b_next!945))
