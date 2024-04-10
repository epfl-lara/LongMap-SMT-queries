; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77930 () Bool)

(assert start!77930)

(declare-fun b_free!16473 () Bool)

(declare-fun b_next!16473 () Bool)

(assert (=> start!77930 (= b_free!16473 (not b_next!16473))))

(declare-fun tp!57686 () Bool)

(declare-fun b_and!27043 () Bool)

(assert (=> start!77930 (= tp!57686 b_and!27043)))

(declare-fun b!909854 () Bool)

(declare-fun res!614037 () Bool)

(declare-fun e!510062 () Bool)

(assert (=> b!909854 (=> (not res!614037) (not e!510062))))

(declare-datatypes ((array!53804 0))(
  ( (array!53805 (arr!25859 (Array (_ BitVec 32) (_ BitVec 64))) (size!26318 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53804)

(declare-datatypes ((List!18167 0))(
  ( (Nil!18164) (Cons!18163 (h!19309 (_ BitVec 64)) (t!25750 List!18167)) )
))
(declare-fun arrayNoDuplicates!0 (array!53804 (_ BitVec 32) List!18167) Bool)

(assert (=> b!909854 (= res!614037 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18164))))

(declare-fun b!909855 () Bool)

(declare-fun res!614038 () Bool)

(assert (=> b!909855 (=> (not res!614038) (not e!510062))))

(declare-datatypes ((V!30153 0))(
  ( (V!30154 (val!9496 Int)) )
))
(declare-datatypes ((ValueCell!8964 0))(
  ( (ValueCellFull!8964 (v!12004 V!30153)) (EmptyCell!8964) )
))
(declare-datatypes ((array!53806 0))(
  ( (array!53807 (arr!25860 (Array (_ BitVec 32) ValueCell!8964)) (size!26319 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53806)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!909855 (= res!614038 (and (= (size!26319 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26318 _keys!1386) (size!26319 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909856 () Bool)

(assert (=> b!909856 (= e!510062 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30153)

(declare-fun lt!410114 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30153)

(declare-datatypes ((tuple2!12374 0))(
  ( (tuple2!12375 (_1!6198 (_ BitVec 64)) (_2!6198 V!30153)) )
))
(declare-datatypes ((List!18168 0))(
  ( (Nil!18165) (Cons!18164 (h!19310 tuple2!12374) (t!25751 List!18168)) )
))
(declare-datatypes ((ListLongMap!11071 0))(
  ( (ListLongMap!11072 (toList!5551 List!18168)) )
))
(declare-fun contains!4594 (ListLongMap!11071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2813 (array!53804 array!53806 (_ BitVec 32) (_ BitVec 32) V!30153 V!30153 (_ BitVec 32) Int) ListLongMap!11071)

(assert (=> b!909856 (= lt!410114 (contains!4594 (getCurrentListMap!2813 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614040 () Bool)

(assert (=> start!77930 (=> (not res!614040) (not e!510062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77930 (= res!614040 (validMask!0 mask!1756))))

(assert (=> start!77930 e!510062))

(declare-fun e!510060 () Bool)

(declare-fun array_inv!20226 (array!53806) Bool)

(assert (=> start!77930 (and (array_inv!20226 _values!1152) e!510060)))

(assert (=> start!77930 tp!57686))

(assert (=> start!77930 true))

(declare-fun tp_is_empty!18891 () Bool)

(assert (=> start!77930 tp_is_empty!18891))

(declare-fun array_inv!20227 (array!53804) Bool)

(assert (=> start!77930 (array_inv!20227 _keys!1386)))

(declare-fun mapIsEmpty!30055 () Bool)

(declare-fun mapRes!30055 () Bool)

(assert (=> mapIsEmpty!30055 mapRes!30055))

(declare-fun mapNonEmpty!30055 () Bool)

(declare-fun tp!57687 () Bool)

(declare-fun e!510059 () Bool)

(assert (=> mapNonEmpty!30055 (= mapRes!30055 (and tp!57687 e!510059))))

(declare-fun mapValue!30055 () ValueCell!8964)

(declare-fun mapKey!30055 () (_ BitVec 32))

(declare-fun mapRest!30055 () (Array (_ BitVec 32) ValueCell!8964))

(assert (=> mapNonEmpty!30055 (= (arr!25860 _values!1152) (store mapRest!30055 mapKey!30055 mapValue!30055))))

(declare-fun b!909857 () Bool)

(declare-fun res!614039 () Bool)

(assert (=> b!909857 (=> (not res!614039) (not e!510062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53804 (_ BitVec 32)) Bool)

(assert (=> b!909857 (= res!614039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909858 () Bool)

(assert (=> b!909858 (= e!510059 tp_is_empty!18891)))

(declare-fun b!909859 () Bool)

(declare-fun e!510061 () Bool)

(assert (=> b!909859 (= e!510061 tp_is_empty!18891)))

(declare-fun b!909860 () Bool)

(assert (=> b!909860 (= e!510060 (and e!510061 mapRes!30055))))

(declare-fun condMapEmpty!30055 () Bool)

(declare-fun mapDefault!30055 () ValueCell!8964)

(assert (=> b!909860 (= condMapEmpty!30055 (= (arr!25860 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8964)) mapDefault!30055)))))

(assert (= (and start!77930 res!614040) b!909855))

(assert (= (and b!909855 res!614038) b!909857))

(assert (= (and b!909857 res!614039) b!909854))

(assert (= (and b!909854 res!614037) b!909856))

(assert (= (and b!909860 condMapEmpty!30055) mapIsEmpty!30055))

(assert (= (and b!909860 (not condMapEmpty!30055)) mapNonEmpty!30055))

(get-info :version)

(assert (= (and mapNonEmpty!30055 ((_ is ValueCellFull!8964) mapValue!30055)) b!909858))

(assert (= (and b!909860 ((_ is ValueCellFull!8964) mapDefault!30055)) b!909859))

(assert (= start!77930 b!909860))

(declare-fun m!844997 () Bool)

(assert (=> start!77930 m!844997))

(declare-fun m!844999 () Bool)

(assert (=> start!77930 m!844999))

(declare-fun m!845001 () Bool)

(assert (=> start!77930 m!845001))

(declare-fun m!845003 () Bool)

(assert (=> b!909854 m!845003))

(declare-fun m!845005 () Bool)

(assert (=> b!909857 m!845005))

(declare-fun m!845007 () Bool)

(assert (=> mapNonEmpty!30055 m!845007))

(declare-fun m!845009 () Bool)

(assert (=> b!909856 m!845009))

(assert (=> b!909856 m!845009))

(declare-fun m!845011 () Bool)

(assert (=> b!909856 m!845011))

(check-sat (not b!909854) (not b!909857) (not b_next!16473) b_and!27043 (not b!909856) (not start!77930) tp_is_empty!18891 (not mapNonEmpty!30055))
(check-sat b_and!27043 (not b_next!16473))
