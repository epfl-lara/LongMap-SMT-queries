; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78134 () Bool)

(assert start!78134)

(declare-fun b_free!16663 () Bool)

(declare-fun b_next!16663 () Bool)

(assert (=> start!78134 (= b_free!16663 (not b_next!16663))))

(declare-fun tp!58264 () Bool)

(declare-fun b_and!27211 () Bool)

(assert (=> start!78134 (= tp!58264 b_and!27211)))

(declare-fun b!911864 () Bool)

(declare-fun e!511480 () Bool)

(assert (=> b!911864 (= e!511480 false)))

(declare-datatypes ((V!30407 0))(
  ( (V!30408 (val!9591 Int)) )
))
(declare-datatypes ((ValueCell!9059 0))(
  ( (ValueCellFull!9059 (v!12100 V!30407)) (EmptyCell!9059) )
))
(declare-datatypes ((array!54157 0))(
  ( (array!54158 (arr!26034 (Array (_ BitVec 32) ValueCell!9059)) (size!26495 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54157)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30407)

(declare-datatypes ((array!54159 0))(
  ( (array!54160 (arr!26035 (Array (_ BitVec 32) (_ BitVec 64))) (size!26496 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54159)

(declare-fun lt!410319 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30407)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12540 0))(
  ( (tuple2!12541 (_1!6281 (_ BitVec 64)) (_2!6281 V!30407)) )
))
(declare-datatypes ((List!18321 0))(
  ( (Nil!18318) (Cons!18317 (h!19463 tuple2!12540) (t!25899 List!18321)) )
))
(declare-datatypes ((ListLongMap!11227 0))(
  ( (ListLongMap!11228 (toList!5629 List!18321)) )
))
(declare-fun contains!4631 (ListLongMap!11227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2831 (array!54159 array!54157 (_ BitVec 32) (_ BitVec 32) V!30407 V!30407 (_ BitVec 32) Int) ListLongMap!11227)

(assert (=> b!911864 (= lt!410319 (contains!4631 (getCurrentListMap!2831 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30346 () Bool)

(declare-fun mapRes!30346 () Bool)

(declare-fun tp!58263 () Bool)

(declare-fun e!511481 () Bool)

(assert (=> mapNonEmpty!30346 (= mapRes!30346 (and tp!58263 e!511481))))

(declare-fun mapRest!30346 () (Array (_ BitVec 32) ValueCell!9059))

(declare-fun mapKey!30346 () (_ BitVec 32))

(declare-fun mapValue!30346 () ValueCell!9059)

(assert (=> mapNonEmpty!30346 (= (arr!26034 _values!1152) (store mapRest!30346 mapKey!30346 mapValue!30346))))

(declare-fun b!911865 () Bool)

(declare-fun e!511484 () Bool)

(declare-fun e!511482 () Bool)

(assert (=> b!911865 (= e!511484 (and e!511482 mapRes!30346))))

(declare-fun condMapEmpty!30346 () Bool)

(declare-fun mapDefault!30346 () ValueCell!9059)

(assert (=> b!911865 (= condMapEmpty!30346 (= (arr!26034 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9059)) mapDefault!30346)))))

(declare-fun mapIsEmpty!30346 () Bool)

(assert (=> mapIsEmpty!30346 mapRes!30346))

(declare-fun res!615196 () Bool)

(assert (=> start!78134 (=> (not res!615196) (not e!511480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78134 (= res!615196 (validMask!0 mask!1756))))

(assert (=> start!78134 e!511480))

(declare-fun array_inv!20414 (array!54157) Bool)

(assert (=> start!78134 (and (array_inv!20414 _values!1152) e!511484)))

(assert (=> start!78134 tp!58264))

(assert (=> start!78134 true))

(declare-fun tp_is_empty!19081 () Bool)

(assert (=> start!78134 tp_is_empty!19081))

(declare-fun array_inv!20415 (array!54159) Bool)

(assert (=> start!78134 (array_inv!20415 _keys!1386)))

(declare-fun b!911866 () Bool)

(declare-fun res!615194 () Bool)

(assert (=> b!911866 (=> (not res!615194) (not e!511480))))

(declare-datatypes ((List!18322 0))(
  ( (Nil!18319) (Cons!18318 (h!19464 (_ BitVec 64)) (t!25900 List!18322)) )
))
(declare-fun arrayNoDuplicates!0 (array!54159 (_ BitVec 32) List!18322) Bool)

(assert (=> b!911866 (= res!615194 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18319))))

(declare-fun b!911867 () Bool)

(declare-fun res!615195 () Bool)

(assert (=> b!911867 (=> (not res!615195) (not e!511480))))

(assert (=> b!911867 (= res!615195 (and (= (size!26495 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26496 _keys!1386) (size!26495 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911868 () Bool)

(assert (=> b!911868 (= e!511482 tp_is_empty!19081)))

(declare-fun b!911869 () Bool)

(assert (=> b!911869 (= e!511481 tp_is_empty!19081)))

(declare-fun b!911870 () Bool)

(declare-fun res!615193 () Bool)

(assert (=> b!911870 (=> (not res!615193) (not e!511480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54159 (_ BitVec 32)) Bool)

(assert (=> b!911870 (= res!615193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78134 res!615196) b!911867))

(assert (= (and b!911867 res!615195) b!911870))

(assert (= (and b!911870 res!615193) b!911866))

(assert (= (and b!911866 res!615194) b!911864))

(assert (= (and b!911865 condMapEmpty!30346) mapIsEmpty!30346))

(assert (= (and b!911865 (not condMapEmpty!30346)) mapNonEmpty!30346))

(get-info :version)

(assert (= (and mapNonEmpty!30346 ((_ is ValueCellFull!9059) mapValue!30346)) b!911869))

(assert (= (and b!911865 ((_ is ValueCellFull!9059) mapDefault!30346)) b!911868))

(assert (= start!78134 b!911865))

(declare-fun m!845937 () Bool)

(assert (=> b!911870 m!845937))

(declare-fun m!845939 () Bool)

(assert (=> mapNonEmpty!30346 m!845939))

(declare-fun m!845941 () Bool)

(assert (=> b!911866 m!845941))

(declare-fun m!845943 () Bool)

(assert (=> start!78134 m!845943))

(declare-fun m!845945 () Bool)

(assert (=> start!78134 m!845945))

(declare-fun m!845947 () Bool)

(assert (=> start!78134 m!845947))

(declare-fun m!845949 () Bool)

(assert (=> b!911864 m!845949))

(assert (=> b!911864 m!845949))

(declare-fun m!845951 () Bool)

(assert (=> b!911864 m!845951))

(check-sat tp_is_empty!19081 (not b!911866) (not b!911870) (not b_next!16663) (not mapNonEmpty!30346) b_and!27211 (not b!911864) (not start!78134))
(check-sat b_and!27211 (not b_next!16663))
