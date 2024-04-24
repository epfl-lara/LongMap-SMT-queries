; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78196 () Bool)

(assert start!78196)

(declare-fun b_free!16555 () Bool)

(declare-fun b_next!16555 () Bool)

(assert (=> start!78196 (= b_free!16555 (not b_next!16555))))

(declare-fun tp!57936 () Bool)

(declare-fun b_and!27137 () Bool)

(assert (=> start!78196 (= tp!57936 b_and!27137)))

(declare-fun b!911745 () Bool)

(declare-fun res!614936 () Bool)

(declare-fun e!511330 () Bool)

(assert (=> b!911745 (=> (not res!614936) (not e!511330))))

(declare-datatypes ((V!30263 0))(
  ( (V!30264 (val!9537 Int)) )
))
(declare-datatypes ((ValueCell!9005 0))(
  ( (ValueCellFull!9005 (v!12043 V!30263)) (EmptyCell!9005) )
))
(declare-datatypes ((array!54017 0))(
  ( (array!54018 (arr!25960 (Array (_ BitVec 32) ValueCell!9005)) (size!26420 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54017)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54019 0))(
  ( (array!54020 (arr!25961 (Array (_ BitVec 32) (_ BitVec 64))) (size!26421 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54019)

(assert (=> b!911745 (= res!614936 (and (= (size!26420 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26421 _keys!1386) (size!26420 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30181 () Bool)

(declare-fun mapRes!30181 () Bool)

(assert (=> mapIsEmpty!30181 mapRes!30181))

(declare-fun b!911746 () Bool)

(declare-fun e!511328 () Bool)

(declare-fun e!511332 () Bool)

(assert (=> b!911746 (= e!511328 (and e!511332 mapRes!30181))))

(declare-fun condMapEmpty!30181 () Bool)

(declare-fun mapDefault!30181 () ValueCell!9005)

(assert (=> b!911746 (= condMapEmpty!30181 (= (arr!25960 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9005)) mapDefault!30181)))))

(declare-fun res!614938 () Bool)

(assert (=> start!78196 (=> (not res!614938) (not e!511330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78196 (= res!614938 (validMask!0 mask!1756))))

(assert (=> start!78196 e!511330))

(declare-fun array_inv!20370 (array!54017) Bool)

(assert (=> start!78196 (and (array_inv!20370 _values!1152) e!511328)))

(assert (=> start!78196 tp!57936))

(assert (=> start!78196 true))

(declare-fun tp_is_empty!18973 () Bool)

(assert (=> start!78196 tp_is_empty!18973))

(declare-fun array_inv!20371 (array!54019) Bool)

(assert (=> start!78196 (array_inv!20371 _keys!1386)))

(declare-fun b!911747 () Bool)

(assert (=> b!911747 (= e!511332 tp_is_empty!18973)))

(declare-fun b!911748 () Bool)

(assert (=> b!911748 (= e!511330 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30263)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30263)

(declare-fun lt!410676 () Bool)

(declare-datatypes ((tuple2!12388 0))(
  ( (tuple2!12389 (_1!6205 (_ BitVec 64)) (_2!6205 V!30263)) )
))
(declare-datatypes ((List!18209 0))(
  ( (Nil!18206) (Cons!18205 (h!19357 tuple2!12388) (t!25786 List!18209)) )
))
(declare-datatypes ((ListLongMap!11087 0))(
  ( (ListLongMap!11088 (toList!5559 List!18209)) )
))
(declare-fun contains!4612 (ListLongMap!11087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2820 (array!54019 array!54017 (_ BitVec 32) (_ BitVec 32) V!30263 V!30263 (_ BitVec 32) Int) ListLongMap!11087)

(assert (=> b!911748 (= lt!410676 (contains!4612 (getCurrentListMap!2820 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911749 () Bool)

(declare-fun e!511329 () Bool)

(assert (=> b!911749 (= e!511329 tp_is_empty!18973)))

(declare-fun b!911750 () Bool)

(declare-fun res!614939 () Bool)

(assert (=> b!911750 (=> (not res!614939) (not e!511330))))

(declare-datatypes ((List!18210 0))(
  ( (Nil!18207) (Cons!18206 (h!19358 (_ BitVec 64)) (t!25787 List!18210)) )
))
(declare-fun arrayNoDuplicates!0 (array!54019 (_ BitVec 32) List!18210) Bool)

(assert (=> b!911750 (= res!614939 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18207))))

(declare-fun b!911751 () Bool)

(declare-fun res!614937 () Bool)

(assert (=> b!911751 (=> (not res!614937) (not e!511330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54019 (_ BitVec 32)) Bool)

(assert (=> b!911751 (= res!614937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30181 () Bool)

(declare-fun tp!57937 () Bool)

(assert (=> mapNonEmpty!30181 (= mapRes!30181 (and tp!57937 e!511329))))

(declare-fun mapKey!30181 () (_ BitVec 32))

(declare-fun mapRest!30181 () (Array (_ BitVec 32) ValueCell!9005))

(declare-fun mapValue!30181 () ValueCell!9005)

(assert (=> mapNonEmpty!30181 (= (arr!25960 _values!1152) (store mapRest!30181 mapKey!30181 mapValue!30181))))

(assert (= (and start!78196 res!614938) b!911745))

(assert (= (and b!911745 res!614936) b!911751))

(assert (= (and b!911751 res!614937) b!911750))

(assert (= (and b!911750 res!614939) b!911748))

(assert (= (and b!911746 condMapEmpty!30181) mapIsEmpty!30181))

(assert (= (and b!911746 (not condMapEmpty!30181)) mapNonEmpty!30181))

(get-info :version)

(assert (= (and mapNonEmpty!30181 ((_ is ValueCellFull!9005) mapValue!30181)) b!911749))

(assert (= (and b!911746 ((_ is ValueCellFull!9005) mapDefault!30181)) b!911747))

(assert (= start!78196 b!911746))

(declare-fun m!847039 () Bool)

(assert (=> b!911751 m!847039))

(declare-fun m!847041 () Bool)

(assert (=> start!78196 m!847041))

(declare-fun m!847043 () Bool)

(assert (=> start!78196 m!847043))

(declare-fun m!847045 () Bool)

(assert (=> start!78196 m!847045))

(declare-fun m!847047 () Bool)

(assert (=> b!911748 m!847047))

(assert (=> b!911748 m!847047))

(declare-fun m!847049 () Bool)

(assert (=> b!911748 m!847049))

(declare-fun m!847051 () Bool)

(assert (=> mapNonEmpty!30181 m!847051))

(declare-fun m!847053 () Bool)

(assert (=> b!911750 m!847053))

(check-sat (not start!78196) (not b_next!16555) (not mapNonEmpty!30181) b_and!27137 (not b!911751) (not b!911750) tp_is_empty!18973 (not b!911748))
(check-sat b_and!27137 (not b_next!16555))
