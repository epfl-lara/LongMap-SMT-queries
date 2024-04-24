; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4320 () Bool)

(assert start!4320)

(declare-fun b_free!1165 () Bool)

(declare-fun b_next!1165 () Bool)

(assert (=> start!4320 (= b_free!1165 (not b_next!1165))))

(declare-fun tp!4923 () Bool)

(declare-fun b_and!1971 () Bool)

(assert (=> start!4320 (= tp!4923 b_and!1971)))

(declare-fun b!33180 () Bool)

(declare-fun e!21071 () Bool)

(assert (=> b!33180 (= e!21071 (not true))))

(declare-datatypes ((SeekEntryResult!123 0))(
  ( (MissingZero!123 (index!2614 (_ BitVec 32))) (Found!123 (index!2615 (_ BitVec 32))) (Intermediate!123 (undefined!935 Bool) (index!2616 (_ BitVec 32)) (x!6799 (_ BitVec 32))) (Undefined!123) (MissingVacant!123 (index!2617 (_ BitVec 32))) )
))
(declare-fun lt!12051 () SeekEntryResult!123)

(declare-fun lt!12052 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33180 (and ((_ is Found!123) lt!12051) (= (index!2615 lt!12051) lt!12052))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((array!2237 0))(
  ( (array!2238 (arr!1069 (Array (_ BitVec 32) (_ BitVec 64))) (size!1170 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2237)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2237 (_ BitVec 32)) SeekEntryResult!123)

(assert (=> b!33180 (= lt!12051 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!746 0))(
  ( (Unit!747) )
))
(declare-fun lt!12049 () Unit!746)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2237 (_ BitVec 32)) Unit!746)

(assert (=> b!33180 (= lt!12049 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12052 _keys!1833 mask!2294))))

(declare-datatypes ((V!1851 0))(
  ( (V!1852 (val!786 Int)) )
))
(declare-datatypes ((tuple2!1264 0))(
  ( (tuple2!1265 (_1!643 (_ BitVec 64)) (_2!643 V!1851)) )
))
(declare-datatypes ((List!859 0))(
  ( (Nil!856) (Cons!855 (h!1422 tuple2!1264) (t!3552 List!859)) )
))
(declare-datatypes ((ListLongMap!835 0))(
  ( (ListLongMap!836 (toList!433 List!859)) )
))
(declare-fun lt!12050 () ListLongMap!835)

(declare-fun contains!378 (ListLongMap!835 (_ BitVec 64)) Bool)

(assert (=> b!33180 (contains!378 lt!12050 (select (arr!1069 _keys!1833) lt!12052))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!560 0))(
  ( (ValueCellFull!560 (v!1878 V!1851)) (EmptyCell!560) )
))
(declare-datatypes ((array!2239 0))(
  ( (array!2240 (arr!1070 (Array (_ BitVec 32) ValueCell!560)) (size!1171 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2239)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!12048 () Unit!746)

(declare-fun zeroValue!1443 () V!1851)

(declare-fun minValue!1443 () V!1851)

(declare-fun lemmaValidKeyInArrayIsInListMap!57 (array!2237 array!2239 (_ BitVec 32) (_ BitVec 32) V!1851 V!1851 (_ BitVec 32) Int) Unit!746)

(assert (=> b!33180 (= lt!12048 (lemmaValidKeyInArrayIsInListMap!57 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12052 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2237 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33180 (= lt!12052 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33181 () Bool)

(declare-fun e!21073 () Bool)

(declare-fun e!21072 () Bool)

(declare-fun mapRes!1816 () Bool)

(assert (=> b!33181 (= e!21073 (and e!21072 mapRes!1816))))

(declare-fun condMapEmpty!1816 () Bool)

(declare-fun mapDefault!1816 () ValueCell!560)

(assert (=> b!33181 (= condMapEmpty!1816 (= (arr!1070 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!560)) mapDefault!1816)))))

(declare-fun res!20157 () Bool)

(declare-fun e!21074 () Bool)

(assert (=> start!4320 (=> (not res!20157) (not e!21074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4320 (= res!20157 (validMask!0 mask!2294))))

(assert (=> start!4320 e!21074))

(assert (=> start!4320 true))

(assert (=> start!4320 tp!4923))

(declare-fun array_inv!731 (array!2239) Bool)

(assert (=> start!4320 (and (array_inv!731 _values!1501) e!21073)))

(declare-fun array_inv!732 (array!2237) Bool)

(assert (=> start!4320 (array_inv!732 _keys!1833)))

(declare-fun tp_is_empty!1519 () Bool)

(assert (=> start!4320 tp_is_empty!1519))

(declare-fun b!33182 () Bool)

(declare-fun res!20160 () Bool)

(assert (=> b!33182 (=> (not res!20160) (not e!21071))))

(declare-fun arrayContainsKey!0 (array!2237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33182 (= res!20160 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33183 () Bool)

(assert (=> b!33183 (= e!21074 e!21071)))

(declare-fun res!20161 () Bool)

(assert (=> b!33183 (=> (not res!20161) (not e!21071))))

(assert (=> b!33183 (= res!20161 (not (contains!378 lt!12050 k0!1304)))))

(declare-fun getCurrentListMap!256 (array!2237 array!2239 (_ BitVec 32) (_ BitVec 32) V!1851 V!1851 (_ BitVec 32) Int) ListLongMap!835)

(assert (=> b!33183 (= lt!12050 (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33184 () Bool)

(assert (=> b!33184 (= e!21072 tp_is_empty!1519)))

(declare-fun b!33185 () Bool)

(declare-fun res!20158 () Bool)

(assert (=> b!33185 (=> (not res!20158) (not e!21074))))

(assert (=> b!33185 (= res!20158 (and (= (size!1171 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1170 _keys!1833) (size!1171 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33186 () Bool)

(declare-fun e!21075 () Bool)

(assert (=> b!33186 (= e!21075 tp_is_empty!1519)))

(declare-fun b!33187 () Bool)

(declare-fun res!20159 () Bool)

(assert (=> b!33187 (=> (not res!20159) (not e!21074))))

(declare-datatypes ((List!860 0))(
  ( (Nil!857) (Cons!856 (h!1423 (_ BitVec 64)) (t!3553 List!860)) )
))
(declare-fun arrayNoDuplicates!0 (array!2237 (_ BitVec 32) List!860) Bool)

(assert (=> b!33187 (= res!20159 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!857))))

(declare-fun b!33188 () Bool)

(declare-fun res!20163 () Bool)

(assert (=> b!33188 (=> (not res!20163) (not e!21074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2237 (_ BitVec 32)) Bool)

(assert (=> b!33188 (= res!20163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33189 () Bool)

(declare-fun res!20162 () Bool)

(assert (=> b!33189 (=> (not res!20162) (not e!21074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33189 (= res!20162 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1816 () Bool)

(declare-fun tp!4924 () Bool)

(assert (=> mapNonEmpty!1816 (= mapRes!1816 (and tp!4924 e!21075))))

(declare-fun mapValue!1816 () ValueCell!560)

(declare-fun mapRest!1816 () (Array (_ BitVec 32) ValueCell!560))

(declare-fun mapKey!1816 () (_ BitVec 32))

(assert (=> mapNonEmpty!1816 (= (arr!1070 _values!1501) (store mapRest!1816 mapKey!1816 mapValue!1816))))

(declare-fun mapIsEmpty!1816 () Bool)

(assert (=> mapIsEmpty!1816 mapRes!1816))

(assert (= (and start!4320 res!20157) b!33185))

(assert (= (and b!33185 res!20158) b!33188))

(assert (= (and b!33188 res!20163) b!33187))

(assert (= (and b!33187 res!20159) b!33189))

(assert (= (and b!33189 res!20162) b!33183))

(assert (= (and b!33183 res!20161) b!33182))

(assert (= (and b!33182 res!20160) b!33180))

(assert (= (and b!33181 condMapEmpty!1816) mapIsEmpty!1816))

(assert (= (and b!33181 (not condMapEmpty!1816)) mapNonEmpty!1816))

(assert (= (and mapNonEmpty!1816 ((_ is ValueCellFull!560) mapValue!1816)) b!33186))

(assert (= (and b!33181 ((_ is ValueCellFull!560) mapDefault!1816)) b!33184))

(assert (= start!4320 b!33181))

(declare-fun m!26491 () Bool)

(assert (=> b!33183 m!26491))

(declare-fun m!26493 () Bool)

(assert (=> b!33183 m!26493))

(declare-fun m!26495 () Bool)

(assert (=> start!4320 m!26495))

(declare-fun m!26497 () Bool)

(assert (=> start!4320 m!26497))

(declare-fun m!26499 () Bool)

(assert (=> start!4320 m!26499))

(declare-fun m!26501 () Bool)

(assert (=> b!33180 m!26501))

(declare-fun m!26503 () Bool)

(assert (=> b!33180 m!26503))

(assert (=> b!33180 m!26501))

(declare-fun m!26505 () Bool)

(assert (=> b!33180 m!26505))

(declare-fun m!26507 () Bool)

(assert (=> b!33180 m!26507))

(declare-fun m!26509 () Bool)

(assert (=> b!33180 m!26509))

(declare-fun m!26511 () Bool)

(assert (=> b!33180 m!26511))

(declare-fun m!26513 () Bool)

(assert (=> b!33188 m!26513))

(declare-fun m!26515 () Bool)

(assert (=> mapNonEmpty!1816 m!26515))

(declare-fun m!26517 () Bool)

(assert (=> b!33187 m!26517))

(declare-fun m!26519 () Bool)

(assert (=> b!33189 m!26519))

(declare-fun m!26521 () Bool)

(assert (=> b!33182 m!26521))

(check-sat b_and!1971 (not b!33188) (not b!33183) (not start!4320) (not b!33189) (not mapNonEmpty!1816) (not b!33187) (not b_next!1165) tp_is_empty!1519 (not b!33180) (not b!33182))
(check-sat b_and!1971 (not b_next!1165))
