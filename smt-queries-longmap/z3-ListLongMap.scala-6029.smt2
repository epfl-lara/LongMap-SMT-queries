; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78040 () Bool)

(assert start!78040)

(declare-fun b_free!16585 () Bool)

(declare-fun b_next!16585 () Bool)

(assert (=> start!78040 (= b_free!16585 (not b_next!16585))))

(declare-fun tp!58026 () Bool)

(declare-fun b_and!27131 () Bool)

(assert (=> start!78040 (= tp!58026 b_and!27131)))

(declare-fun mapIsEmpty!30226 () Bool)

(declare-fun mapRes!30226 () Bool)

(assert (=> mapIsEmpty!30226 mapRes!30226))

(declare-fun res!614664 () Bool)

(declare-fun e!510827 () Bool)

(assert (=> start!78040 (=> (not res!614664) (not e!510827))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78040 (= res!614664 (validMask!0 mask!1756))))

(assert (=> start!78040 e!510827))

(declare-datatypes ((V!30303 0))(
  ( (V!30304 (val!9552 Int)) )
))
(declare-datatypes ((ValueCell!9020 0))(
  ( (ValueCellFull!9020 (v!12060 V!30303)) (EmptyCell!9020) )
))
(declare-datatypes ((array!54011 0))(
  ( (array!54012 (arr!25962 (Array (_ BitVec 32) ValueCell!9020)) (size!26423 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54011)

(declare-fun e!510826 () Bool)

(declare-fun array_inv!20354 (array!54011) Bool)

(assert (=> start!78040 (and (array_inv!20354 _values!1152) e!510826)))

(assert (=> start!78040 tp!58026))

(assert (=> start!78040 true))

(declare-fun tp_is_empty!19003 () Bool)

(assert (=> start!78040 tp_is_empty!19003))

(declare-datatypes ((array!54013 0))(
  ( (array!54014 (arr!25963 (Array (_ BitVec 32) (_ BitVec 64))) (size!26424 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54013)

(declare-fun array_inv!20355 (array!54013) Bool)

(assert (=> start!78040 (array_inv!20355 _keys!1386)))

(declare-fun b!910918 () Bool)

(declare-fun res!614663 () Bool)

(assert (=> b!910918 (=> (not res!614663) (not e!510827))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910918 (= res!614663 (and (= (size!26423 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26424 _keys!1386) (size!26423 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910919 () Bool)

(declare-fun e!510824 () Bool)

(assert (=> b!910919 (= e!510824 tp_is_empty!19003)))

(declare-fun b!910920 () Bool)

(declare-fun res!614662 () Bool)

(assert (=> b!910920 (=> (not res!614662) (not e!510827))))

(declare-datatypes ((List!18266 0))(
  ( (Nil!18263) (Cons!18262 (h!19408 (_ BitVec 64)) (t!25842 List!18266)) )
))
(declare-fun arrayNoDuplicates!0 (array!54013 (_ BitVec 32) List!18266) Bool)

(assert (=> b!910920 (= res!614662 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18263))))

(declare-fun b!910921 () Bool)

(declare-fun e!510823 () Bool)

(assert (=> b!910921 (= e!510823 tp_is_empty!19003)))

(declare-fun b!910922 () Bool)

(assert (=> b!910922 (= e!510827 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30303)

(declare-fun lt!410124 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30303)

(declare-datatypes ((tuple2!12482 0))(
  ( (tuple2!12483 (_1!6252 (_ BitVec 64)) (_2!6252 V!30303)) )
))
(declare-datatypes ((List!18267 0))(
  ( (Nil!18264) (Cons!18263 (h!19409 tuple2!12482) (t!25843 List!18267)) )
))
(declare-datatypes ((ListLongMap!11169 0))(
  ( (ListLongMap!11170 (toList!5600 List!18267)) )
))
(declare-fun contains!4601 (ListLongMap!11169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2802 (array!54013 array!54011 (_ BitVec 32) (_ BitVec 32) V!30303 V!30303 (_ BitVec 32) Int) ListLongMap!11169)

(assert (=> b!910922 (= lt!410124 (contains!4601 (getCurrentListMap!2802 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30226 () Bool)

(declare-fun tp!58027 () Bool)

(assert (=> mapNonEmpty!30226 (= mapRes!30226 (and tp!58027 e!510824))))

(declare-fun mapRest!30226 () (Array (_ BitVec 32) ValueCell!9020))

(declare-fun mapKey!30226 () (_ BitVec 32))

(declare-fun mapValue!30226 () ValueCell!9020)

(assert (=> mapNonEmpty!30226 (= (arr!25962 _values!1152) (store mapRest!30226 mapKey!30226 mapValue!30226))))

(declare-fun b!910923 () Bool)

(assert (=> b!910923 (= e!510826 (and e!510823 mapRes!30226))))

(declare-fun condMapEmpty!30226 () Bool)

(declare-fun mapDefault!30226 () ValueCell!9020)

(assert (=> b!910923 (= condMapEmpty!30226 (= (arr!25962 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9020)) mapDefault!30226)))))

(declare-fun b!910924 () Bool)

(declare-fun res!614665 () Bool)

(assert (=> b!910924 (=> (not res!614665) (not e!510827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54013 (_ BitVec 32)) Bool)

(assert (=> b!910924 (= res!614665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78040 res!614664) b!910918))

(assert (= (and b!910918 res!614663) b!910924))

(assert (= (and b!910924 res!614665) b!910920))

(assert (= (and b!910920 res!614662) b!910922))

(assert (= (and b!910923 condMapEmpty!30226) mapIsEmpty!30226))

(assert (= (and b!910923 (not condMapEmpty!30226)) mapNonEmpty!30226))

(get-info :version)

(assert (= (and mapNonEmpty!30226 ((_ is ValueCellFull!9020) mapValue!30226)) b!910919))

(assert (= (and b!910923 ((_ is ValueCellFull!9020) mapDefault!30226)) b!910921))

(assert (= start!78040 b!910923))

(declare-fun m!845227 () Bool)

(assert (=> b!910920 m!845227))

(declare-fun m!845229 () Bool)

(assert (=> mapNonEmpty!30226 m!845229))

(declare-fun m!845231 () Bool)

(assert (=> start!78040 m!845231))

(declare-fun m!845233 () Bool)

(assert (=> start!78040 m!845233))

(declare-fun m!845235 () Bool)

(assert (=> start!78040 m!845235))

(declare-fun m!845237 () Bool)

(assert (=> b!910922 m!845237))

(assert (=> b!910922 m!845237))

(declare-fun m!845239 () Bool)

(assert (=> b!910922 m!845239))

(declare-fun m!845241 () Bool)

(assert (=> b!910924 m!845241))

(check-sat (not mapNonEmpty!30226) (not b_next!16585) (not b!910920) (not start!78040) (not b!910924) (not b!910922) b_and!27131 tp_is_empty!19003)
(check-sat b_and!27131 (not b_next!16585))
