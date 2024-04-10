; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78198 () Bool)

(assert start!78198)

(declare-fun b_free!16689 () Bool)

(declare-fun b_next!16689 () Bool)

(assert (=> start!78198 (= b_free!16689 (not b_next!16689))))

(declare-fun tp!58343 () Bool)

(declare-fun b_and!27265 () Bool)

(assert (=> start!78198 (= tp!58343 b_and!27265)))

(declare-fun mapNonEmpty!30388 () Bool)

(declare-fun mapRes!30388 () Bool)

(declare-fun tp!58344 () Bool)

(declare-fun e!511905 () Bool)

(assert (=> mapNonEmpty!30388 (= mapRes!30388 (and tp!58344 e!511905))))

(declare-datatypes ((V!30441 0))(
  ( (V!30442 (val!9604 Int)) )
))
(declare-datatypes ((ValueCell!9072 0))(
  ( (ValueCellFull!9072 (v!12115 V!30441)) (EmptyCell!9072) )
))
(declare-datatypes ((array!54208 0))(
  ( (array!54209 (arr!26058 (Array (_ BitVec 32) ValueCell!9072)) (size!26517 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54208)

(declare-fun mapKey!30388 () (_ BitVec 32))

(declare-fun mapRest!30388 () (Array (_ BitVec 32) ValueCell!9072))

(declare-fun mapValue!30388 () ValueCell!9072)

(assert (=> mapNonEmpty!30388 (= (arr!26058 _values!1152) (store mapRest!30388 mapKey!30388 mapValue!30388))))

(declare-fun b!912593 () Bool)

(declare-fun res!615612 () Bool)

(declare-fun e!511906 () Bool)

(assert (=> b!912593 (=> (not res!615612) (not e!511906))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((array!54210 0))(
  ( (array!54211 (arr!26059 (Array (_ BitVec 32) (_ BitVec 64))) (size!26518 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54210)

(assert (=> b!912593 (= res!615612 (and (= (select (arr!26059 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!615610 () Bool)

(assert (=> start!78198 (=> (not res!615610) (not e!511906))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78198 (= res!615610 (validMask!0 mask!1756))))

(assert (=> start!78198 e!511906))

(declare-fun e!511908 () Bool)

(declare-fun array_inv!20358 (array!54208) Bool)

(assert (=> start!78198 (and (array_inv!20358 _values!1152) e!511908)))

(assert (=> start!78198 tp!58343))

(assert (=> start!78198 true))

(declare-fun tp_is_empty!19107 () Bool)

(assert (=> start!78198 tp_is_empty!19107))

(declare-fun array_inv!20359 (array!54210) Bool)

(assert (=> start!78198 (array_inv!20359 _keys!1386)))

(declare-fun b!912594 () Bool)

(assert (=> b!912594 (= e!511906 (not true))))

(declare-fun arrayContainsKey!0 (array!54210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912594 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!30441)

(declare-datatypes ((Unit!30880 0))(
  ( (Unit!30881) )
))
(declare-fun lt!410684 () Unit!30880)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30441)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lemmaKeyInListMapIsInArray!265 (array!54210 array!54208 (_ BitVec 32) (_ BitVec 32) V!30441 V!30441 (_ BitVec 64) Int) Unit!30880)

(assert (=> b!912594 (= lt!410684 (lemmaKeyInListMapIsInArray!265 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912595 () Bool)

(declare-fun res!615606 () Bool)

(assert (=> b!912595 (=> (not res!615606) (not e!511906))))

(assert (=> b!912595 (= res!615606 (and (= (size!26517 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26518 _keys!1386) (size!26517 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912596 () Bool)

(declare-fun res!615608 () Bool)

(assert (=> b!912596 (=> (not res!615608) (not e!511906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54210 (_ BitVec 32)) Bool)

(assert (=> b!912596 (= res!615608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912597 () Bool)

(declare-fun e!511904 () Bool)

(assert (=> b!912597 (= e!511908 (and e!511904 mapRes!30388))))

(declare-fun condMapEmpty!30388 () Bool)

(declare-fun mapDefault!30388 () ValueCell!9072)

(assert (=> b!912597 (= condMapEmpty!30388 (= (arr!26058 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9072)) mapDefault!30388)))))

(declare-fun b!912598 () Bool)

(declare-fun res!615607 () Bool)

(assert (=> b!912598 (=> (not res!615607) (not e!511906))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912598 (= res!615607 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30388 () Bool)

(assert (=> mapIsEmpty!30388 mapRes!30388))

(declare-fun b!912599 () Bool)

(declare-fun res!615611 () Bool)

(assert (=> b!912599 (=> (not res!615611) (not e!511906))))

(declare-datatypes ((tuple2!12512 0))(
  ( (tuple2!12513 (_1!6267 (_ BitVec 64)) (_2!6267 V!30441)) )
))
(declare-datatypes ((List!18302 0))(
  ( (Nil!18299) (Cons!18298 (h!19444 tuple2!12512) (t!25891 List!18302)) )
))
(declare-datatypes ((ListLongMap!11209 0))(
  ( (ListLongMap!11210 (toList!5620 List!18302)) )
))
(declare-fun contains!4666 (ListLongMap!11209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2882 (array!54210 array!54208 (_ BitVec 32) (_ BitVec 32) V!30441 V!30441 (_ BitVec 32) Int) ListLongMap!11209)

(assert (=> b!912599 (= res!615611 (contains!4666 (getCurrentListMap!2882 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912600 () Bool)

(declare-fun res!615609 () Bool)

(assert (=> b!912600 (=> (not res!615609) (not e!511906))))

(declare-datatypes ((List!18303 0))(
  ( (Nil!18300) (Cons!18299 (h!19445 (_ BitVec 64)) (t!25892 List!18303)) )
))
(declare-fun arrayNoDuplicates!0 (array!54210 (_ BitVec 32) List!18303) Bool)

(assert (=> b!912600 (= res!615609 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18300))))

(declare-fun b!912601 () Bool)

(assert (=> b!912601 (= e!511905 tp_is_empty!19107)))

(declare-fun b!912602 () Bool)

(assert (=> b!912602 (= e!511904 tp_is_empty!19107)))

(assert (= (and start!78198 res!615610) b!912595))

(assert (= (and b!912595 res!615606) b!912596))

(assert (= (and b!912596 res!615608) b!912600))

(assert (= (and b!912600 res!615609) b!912599))

(assert (= (and b!912599 res!615611) b!912598))

(assert (= (and b!912598 res!615607) b!912593))

(assert (= (and b!912593 res!615612) b!912594))

(assert (= (and b!912597 condMapEmpty!30388) mapIsEmpty!30388))

(assert (= (and b!912597 (not condMapEmpty!30388)) mapNonEmpty!30388))

(get-info :version)

(assert (= (and mapNonEmpty!30388 ((_ is ValueCellFull!9072) mapValue!30388)) b!912601))

(assert (= (and b!912597 ((_ is ValueCellFull!9072) mapDefault!30388)) b!912602))

(assert (= start!78198 b!912597))

(declare-fun m!847067 () Bool)

(assert (=> b!912594 m!847067))

(declare-fun m!847069 () Bool)

(assert (=> b!912594 m!847069))

(declare-fun m!847071 () Bool)

(assert (=> b!912598 m!847071))

(declare-fun m!847073 () Bool)

(assert (=> b!912600 m!847073))

(declare-fun m!847075 () Bool)

(assert (=> start!78198 m!847075))

(declare-fun m!847077 () Bool)

(assert (=> start!78198 m!847077))

(declare-fun m!847079 () Bool)

(assert (=> start!78198 m!847079))

(declare-fun m!847081 () Bool)

(assert (=> b!912593 m!847081))

(declare-fun m!847083 () Bool)

(assert (=> mapNonEmpty!30388 m!847083))

(declare-fun m!847085 () Bool)

(assert (=> b!912599 m!847085))

(assert (=> b!912599 m!847085))

(declare-fun m!847087 () Bool)

(assert (=> b!912599 m!847087))

(declare-fun m!847089 () Bool)

(assert (=> b!912596 m!847089))

(check-sat (not start!78198) (not b!912599) b_and!27265 (not mapNonEmpty!30388) (not b!912594) (not b!912600) (not b!912598) tp_is_empty!19107 (not b_next!16689) (not b!912596))
(check-sat b_and!27265 (not b_next!16689))
