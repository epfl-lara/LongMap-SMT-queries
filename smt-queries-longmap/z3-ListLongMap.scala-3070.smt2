; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43258 () Bool)

(assert start!43258)

(declare-fun b_free!12139 () Bool)

(declare-fun b_next!12139 () Bool)

(assert (=> start!43258 (= b_free!12139 (not b_next!12139))))

(declare-fun tp!42688 () Bool)

(declare-fun b_and!20901 () Bool)

(assert (=> start!43258 (= tp!42688 b_and!20901)))

(declare-fun mapIsEmpty!22174 () Bool)

(declare-fun mapRes!22174 () Bool)

(assert (=> mapIsEmpty!22174 mapRes!22174))

(declare-fun b!479365 () Bool)

(declare-fun e!282018 () Bool)

(declare-fun tp_is_empty!13651 () Bool)

(assert (=> b!479365 (= e!282018 tp_is_empty!13651)))

(declare-fun b!479366 () Bool)

(declare-fun e!282020 () Bool)

(assert (=> b!479366 (= e!282020 tp_is_empty!13651)))

(declare-fun b!479367 () Bool)

(declare-fun res!285974 () Bool)

(declare-fun e!282021 () Bool)

(assert (=> b!479367 (=> (not res!285974) (not e!282021))))

(declare-datatypes ((array!30956 0))(
  ( (array!30957 (arr!14884 (Array (_ BitVec 32) (_ BitVec 64))) (size!15242 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30956)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19273 0))(
  ( (V!19274 (val!6873 Int)) )
))
(declare-datatypes ((ValueCell!6464 0))(
  ( (ValueCellFull!6464 (v!9163 V!19273)) (EmptyCell!6464) )
))
(declare-datatypes ((array!30958 0))(
  ( (array!30959 (arr!14885 (Array (_ BitVec 32) ValueCell!6464)) (size!15243 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30958)

(declare-fun mask!2352 () (_ BitVec 32))

(assert (=> b!479367 (= res!285974 (and (= (size!15243 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15242 _keys!1874) (size!15243 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!285975 () Bool)

(assert (=> start!43258 (=> (not res!285975) (not e!282021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43258 (= res!285975 (validMask!0 mask!2352))))

(assert (=> start!43258 e!282021))

(assert (=> start!43258 true))

(assert (=> start!43258 tp_is_empty!13651))

(declare-fun e!282019 () Bool)

(declare-fun array_inv!10814 (array!30958) Bool)

(assert (=> start!43258 (and (array_inv!10814 _values!1516) e!282019)))

(assert (=> start!43258 tp!42688))

(declare-fun array_inv!10815 (array!30956) Bool)

(assert (=> start!43258 (array_inv!10815 _keys!1874)))

(declare-fun mapNonEmpty!22174 () Bool)

(declare-fun tp!42687 () Bool)

(assert (=> mapNonEmpty!22174 (= mapRes!22174 (and tp!42687 e!282020))))

(declare-fun mapRest!22174 () (Array (_ BitVec 32) ValueCell!6464))

(declare-fun mapValue!22174 () ValueCell!6464)

(declare-fun mapKey!22174 () (_ BitVec 32))

(assert (=> mapNonEmpty!22174 (= (arr!14885 _values!1516) (store mapRest!22174 mapKey!22174 mapValue!22174))))

(declare-fun b!479368 () Bool)

(assert (=> b!479368 (= e!282021 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19273)

(declare-fun zeroValue!1458 () V!19273)

(declare-fun lt!217873 () Bool)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8940 0))(
  ( (tuple2!8941 (_1!4481 (_ BitVec 64)) (_2!4481 V!19273)) )
))
(declare-datatypes ((List!9008 0))(
  ( (Nil!9005) (Cons!9004 (h!9860 tuple2!8940) (t!15206 List!9008)) )
))
(declare-datatypes ((ListLongMap!7855 0))(
  ( (ListLongMap!7856 (toList!3943 List!9008)) )
))
(declare-fun contains!2571 (ListLongMap!7855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2257 (array!30956 array!30958 (_ BitVec 32) (_ BitVec 32) V!19273 V!19273 (_ BitVec 32) Int) ListLongMap!7855)

(assert (=> b!479368 (= lt!217873 (contains!2571 (getCurrentListMap!2257 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479369 () Bool)

(declare-fun res!285977 () Bool)

(assert (=> b!479369 (=> (not res!285977) (not e!282021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30956 (_ BitVec 32)) Bool)

(assert (=> b!479369 (= res!285977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479370 () Bool)

(declare-fun res!285976 () Bool)

(assert (=> b!479370 (=> (not res!285976) (not e!282021))))

(declare-datatypes ((List!9009 0))(
  ( (Nil!9006) (Cons!9005 (h!9861 (_ BitVec 64)) (t!15207 List!9009)) )
))
(declare-fun arrayNoDuplicates!0 (array!30956 (_ BitVec 32) List!9009) Bool)

(assert (=> b!479370 (= res!285976 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9006))))

(declare-fun b!479371 () Bool)

(assert (=> b!479371 (= e!282019 (and e!282018 mapRes!22174))))

(declare-fun condMapEmpty!22174 () Bool)

(declare-fun mapDefault!22174 () ValueCell!6464)

(assert (=> b!479371 (= condMapEmpty!22174 (= (arr!14885 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6464)) mapDefault!22174)))))

(assert (= (and start!43258 res!285975) b!479367))

(assert (= (and b!479367 res!285974) b!479369))

(assert (= (and b!479369 res!285977) b!479370))

(assert (= (and b!479370 res!285976) b!479368))

(assert (= (and b!479371 condMapEmpty!22174) mapIsEmpty!22174))

(assert (= (and b!479371 (not condMapEmpty!22174)) mapNonEmpty!22174))

(get-info :version)

(assert (= (and mapNonEmpty!22174 ((_ is ValueCellFull!6464) mapValue!22174)) b!479366))

(assert (= (and b!479371 ((_ is ValueCellFull!6464) mapDefault!22174)) b!479365))

(assert (= start!43258 b!479371))

(declare-fun m!461557 () Bool)

(assert (=> mapNonEmpty!22174 m!461557))

(declare-fun m!461559 () Bool)

(assert (=> b!479368 m!461559))

(assert (=> b!479368 m!461559))

(declare-fun m!461561 () Bool)

(assert (=> b!479368 m!461561))

(declare-fun m!461563 () Bool)

(assert (=> b!479369 m!461563))

(declare-fun m!461565 () Bool)

(assert (=> b!479370 m!461565))

(declare-fun m!461567 () Bool)

(assert (=> start!43258 m!461567))

(declare-fun m!461569 () Bool)

(assert (=> start!43258 m!461569))

(declare-fun m!461571 () Bool)

(assert (=> start!43258 m!461571))

(check-sat tp_is_empty!13651 (not start!43258) (not b!479370) b_and!20901 (not b!479369) (not b_next!12139) (not mapNonEmpty!22174) (not b!479368))
(check-sat b_and!20901 (not b_next!12139))
