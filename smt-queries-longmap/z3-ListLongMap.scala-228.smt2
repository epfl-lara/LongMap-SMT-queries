; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4046 () Bool)

(assert start!4046)

(declare-fun b_free!955 () Bool)

(declare-fun b_next!955 () Bool)

(assert (=> start!4046 (= b_free!955 (not b_next!955))))

(declare-fun tp!4284 () Bool)

(declare-fun b_and!1755 () Bool)

(assert (=> start!4046 (= tp!4284 b_and!1755)))

(declare-fun mapNonEmpty!1492 () Bool)

(declare-fun mapRes!1492 () Bool)

(declare-fun tp!4285 () Bool)

(declare-fun e!19123 () Bool)

(assert (=> mapNonEmpty!1492 (= mapRes!1492 (and tp!4285 e!19123))))

(declare-fun mapKey!1492 () (_ BitVec 32))

(declare-datatypes ((V!1571 0))(
  ( (V!1572 (val!681 Int)) )
))
(declare-datatypes ((ValueCell!455 0))(
  ( (ValueCellFull!455 (v!1770 V!1571)) (EmptyCell!455) )
))
(declare-fun mapValue!1492 () ValueCell!455)

(declare-fun mapRest!1492 () (Array (_ BitVec 32) ValueCell!455))

(declare-datatypes ((array!1829 0))(
  ( (array!1830 (arr!868 (Array (_ BitVec 32) ValueCell!455)) (size!969 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1829)

(assert (=> mapNonEmpty!1492 (= (arr!868 _values!1501) (store mapRest!1492 mapKey!1492 mapValue!1492))))

(declare-fun b!29657 () Bool)

(declare-fun res!17809 () Bool)

(declare-fun e!19121 () Bool)

(assert (=> b!29657 (=> (not res!17809) (not e!19121))))

(declare-datatypes ((array!1831 0))(
  ( (array!1832 (arr!869 (Array (_ BitVec 32) (_ BitVec 64))) (size!970 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1831)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1831 (_ BitVec 32)) Bool)

(assert (=> b!29657 (= res!17809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29658 () Bool)

(assert (=> b!29658 (= e!19121 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11304 () Bool)

(declare-fun zeroValue!1443 () V!1571)

(declare-fun minValue!1443 () V!1571)

(declare-datatypes ((tuple2!1126 0))(
  ( (tuple2!1127 (_1!574 (_ BitVec 64)) (_2!574 V!1571)) )
))
(declare-datatypes ((List!717 0))(
  ( (Nil!714) (Cons!713 (h!1280 tuple2!1126) (t!3404 List!717)) )
))
(declare-datatypes ((ListLongMap!697 0))(
  ( (ListLongMap!698 (toList!364 List!717)) )
))
(declare-fun contains!306 (ListLongMap!697 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!189 (array!1831 array!1829 (_ BitVec 32) (_ BitVec 32) V!1571 V!1571 (_ BitVec 32) Int) ListLongMap!697)

(assert (=> b!29658 (= lt!11304 (contains!306 (getCurrentListMap!189 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!29659 () Bool)

(declare-fun res!17811 () Bool)

(assert (=> b!29659 (=> (not res!17811) (not e!19121))))

(assert (=> b!29659 (= res!17811 (and (= (size!969 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!970 _keys!1833) (size!969 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1492 () Bool)

(assert (=> mapIsEmpty!1492 mapRes!1492))

(declare-fun b!29660 () Bool)

(declare-fun e!19119 () Bool)

(declare-fun tp_is_empty!1309 () Bool)

(assert (=> b!29660 (= e!19119 tp_is_empty!1309)))

(declare-fun b!29661 () Bool)

(declare-fun res!17810 () Bool)

(assert (=> b!29661 (=> (not res!17810) (not e!19121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29661 (= res!17810 (validKeyInArray!0 k0!1304))))

(declare-fun res!17813 () Bool)

(assert (=> start!4046 (=> (not res!17813) (not e!19121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4046 (= res!17813 (validMask!0 mask!2294))))

(assert (=> start!4046 e!19121))

(assert (=> start!4046 true))

(assert (=> start!4046 tp!4284))

(declare-fun e!19122 () Bool)

(declare-fun array_inv!599 (array!1829) Bool)

(assert (=> start!4046 (and (array_inv!599 _values!1501) e!19122)))

(declare-fun array_inv!600 (array!1831) Bool)

(assert (=> start!4046 (array_inv!600 _keys!1833)))

(assert (=> start!4046 tp_is_empty!1309))

(declare-fun b!29662 () Bool)

(assert (=> b!29662 (= e!19122 (and e!19119 mapRes!1492))))

(declare-fun condMapEmpty!1492 () Bool)

(declare-fun mapDefault!1492 () ValueCell!455)

(assert (=> b!29662 (= condMapEmpty!1492 (= (arr!868 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!455)) mapDefault!1492)))))

(declare-fun b!29663 () Bool)

(assert (=> b!29663 (= e!19123 tp_is_empty!1309)))

(declare-fun b!29664 () Bool)

(declare-fun res!17812 () Bool)

(assert (=> b!29664 (=> (not res!17812) (not e!19121))))

(declare-datatypes ((List!718 0))(
  ( (Nil!715) (Cons!714 (h!1281 (_ BitVec 64)) (t!3405 List!718)) )
))
(declare-fun arrayNoDuplicates!0 (array!1831 (_ BitVec 32) List!718) Bool)

(assert (=> b!29664 (= res!17812 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!715))))

(assert (= (and start!4046 res!17813) b!29659))

(assert (= (and b!29659 res!17811) b!29657))

(assert (= (and b!29657 res!17809) b!29664))

(assert (= (and b!29664 res!17812) b!29661))

(assert (= (and b!29661 res!17810) b!29658))

(assert (= (and b!29662 condMapEmpty!1492) mapIsEmpty!1492))

(assert (= (and b!29662 (not condMapEmpty!1492)) mapNonEmpty!1492))

(get-info :version)

(assert (= (and mapNonEmpty!1492 ((_ is ValueCellFull!455) mapValue!1492)) b!29663))

(assert (= (and b!29662 ((_ is ValueCellFull!455) mapDefault!1492)) b!29660))

(assert (= start!4046 b!29662))

(declare-fun m!23783 () Bool)

(assert (=> mapNonEmpty!1492 m!23783))

(declare-fun m!23785 () Bool)

(assert (=> b!29661 m!23785))

(declare-fun m!23787 () Bool)

(assert (=> start!4046 m!23787))

(declare-fun m!23789 () Bool)

(assert (=> start!4046 m!23789))

(declare-fun m!23791 () Bool)

(assert (=> start!4046 m!23791))

(declare-fun m!23793 () Bool)

(assert (=> b!29657 m!23793))

(declare-fun m!23795 () Bool)

(assert (=> b!29658 m!23795))

(assert (=> b!29658 m!23795))

(declare-fun m!23797 () Bool)

(assert (=> b!29658 m!23797))

(declare-fun m!23799 () Bool)

(assert (=> b!29664 m!23799))

(check-sat (not b!29664) (not b!29661) b_and!1755 (not start!4046) tp_is_empty!1309 (not b_next!955) (not mapNonEmpty!1492) (not b!29657) (not b!29658))
(check-sat b_and!1755 (not b_next!955))
