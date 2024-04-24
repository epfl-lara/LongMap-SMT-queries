; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73030 () Bool)

(assert start!73030)

(declare-fun b_free!13777 () Bool)

(declare-fun b_next!13777 () Bool)

(assert (=> start!73030 (= b_free!13777 (not b_next!13777))))

(declare-fun tp!48836 () Bool)

(declare-fun b_and!22873 () Bool)

(assert (=> start!73030 (= tp!48836 b_and!22873)))

(declare-fun b!846607 () Bool)

(declare-fun res!574884 () Bool)

(declare-fun e!472667 () Bool)

(assert (=> b!846607 (=> (not res!574884) (not e!472667))))

(declare-datatypes ((array!48089 0))(
  ( (array!48090 (arr!23071 (Array (_ BitVec 32) (_ BitVec 64))) (size!23512 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48089)

(declare-datatypes ((List!16248 0))(
  ( (Nil!16245) (Cons!16244 (h!17381 (_ BitVec 64)) (t!22611 List!16248)) )
))
(declare-fun arrayNoDuplicates!0 (array!48089 (_ BitVec 32) List!16248) Bool)

(assert (=> b!846607 (= res!574884 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16245))))

(declare-fun b!846608 () Bool)

(declare-fun e!472666 () Bool)

(declare-fun tp_is_empty!15913 () Bool)

(assert (=> b!846608 (= e!472666 tp_is_empty!15913)))

(declare-fun b!846609 () Bool)

(declare-fun e!472668 () Bool)

(declare-fun e!472665 () Bool)

(declare-fun mapRes!25469 () Bool)

(assert (=> b!846609 (= e!472668 (and e!472665 mapRes!25469))))

(declare-fun condMapEmpty!25469 () Bool)

(declare-datatypes ((V!26265 0))(
  ( (V!26266 (val!8004 Int)) )
))
(declare-datatypes ((ValueCell!7517 0))(
  ( (ValueCellFull!7517 (v!10429 V!26265)) (EmptyCell!7517) )
))
(declare-datatypes ((array!48091 0))(
  ( (array!48092 (arr!23072 (Array (_ BitVec 32) ValueCell!7517)) (size!23513 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48091)

(declare-fun mapDefault!25469 () ValueCell!7517)

(assert (=> b!846609 (= condMapEmpty!25469 (= (arr!23072 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7517)) mapDefault!25469)))))

(declare-fun b!846610 () Bool)

(assert (=> b!846610 (= e!472667 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10382 0))(
  ( (tuple2!10383 (_1!5202 (_ BitVec 64)) (_2!5202 V!26265)) )
))
(declare-datatypes ((List!16249 0))(
  ( (Nil!16246) (Cons!16245 (h!17382 tuple2!10382) (t!22612 List!16249)) )
))
(declare-datatypes ((ListLongMap!9153 0))(
  ( (ListLongMap!9154 (toList!4592 List!16249)) )
))
(declare-fun lt!381797 () ListLongMap!9153)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26265)

(declare-fun zeroValue!654 () V!26265)

(declare-fun getCurrentListMapNoExtraKeys!2650 (array!48089 array!48091 (_ BitVec 32) (_ BitVec 32) V!26265 V!26265 (_ BitVec 32) Int) ListLongMap!9153)

(assert (=> b!846610 (= lt!381797 (getCurrentListMapNoExtraKeys!2650 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846611 () Bool)

(declare-fun res!574880 () Bool)

(assert (=> b!846611 (=> (not res!574880) (not e!472667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48089 (_ BitVec 32)) Bool)

(assert (=> b!846611 (= res!574880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25469 () Bool)

(declare-fun tp!48835 () Bool)

(assert (=> mapNonEmpty!25469 (= mapRes!25469 (and tp!48835 e!472666))))

(declare-fun mapRest!25469 () (Array (_ BitVec 32) ValueCell!7517))

(declare-fun mapValue!25469 () ValueCell!7517)

(declare-fun mapKey!25469 () (_ BitVec 32))

(assert (=> mapNonEmpty!25469 (= (arr!23072 _values!688) (store mapRest!25469 mapKey!25469 mapValue!25469))))

(declare-fun b!846612 () Bool)

(declare-fun res!574883 () Bool)

(assert (=> b!846612 (=> (not res!574883) (not e!472667))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846612 (= res!574883 (validKeyInArray!0 k0!854))))

(declare-fun res!574881 () Bool)

(assert (=> start!73030 (=> (not res!574881) (not e!472667))))

(assert (=> start!73030 (= res!574881 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23512 _keys!868))))))

(assert (=> start!73030 e!472667))

(assert (=> start!73030 true))

(assert (=> start!73030 tp!48836))

(declare-fun array_inv!18384 (array!48089) Bool)

(assert (=> start!73030 (array_inv!18384 _keys!868)))

(declare-fun array_inv!18385 (array!48091) Bool)

(assert (=> start!73030 (and (array_inv!18385 _values!688) e!472668)))

(assert (=> start!73030 tp_is_empty!15913))

(declare-fun b!846613 () Bool)

(declare-fun res!574882 () Bool)

(assert (=> b!846613 (=> (not res!574882) (not e!472667))))

(assert (=> b!846613 (= res!574882 (and (= (size!23513 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23512 _keys!868) (size!23513 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25469 () Bool)

(assert (=> mapIsEmpty!25469 mapRes!25469))

(declare-fun b!846614 () Bool)

(declare-fun res!574879 () Bool)

(assert (=> b!846614 (=> (not res!574879) (not e!472667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846614 (= res!574879 (validMask!0 mask!1196))))

(declare-fun b!846615 () Bool)

(declare-fun res!574885 () Bool)

(assert (=> b!846615 (=> (not res!574885) (not e!472667))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!846615 (= res!574885 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23512 _keys!868))))))

(declare-fun b!846616 () Bool)

(declare-fun res!574878 () Bool)

(assert (=> b!846616 (=> (not res!574878) (not e!472667))))

(assert (=> b!846616 (= res!574878 (and (= (select (arr!23071 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846617 () Bool)

(assert (=> b!846617 (= e!472665 tp_is_empty!15913)))

(assert (= (and start!73030 res!574881) b!846614))

(assert (= (and b!846614 res!574879) b!846613))

(assert (= (and b!846613 res!574882) b!846611))

(assert (= (and b!846611 res!574880) b!846607))

(assert (= (and b!846607 res!574884) b!846615))

(assert (= (and b!846615 res!574885) b!846612))

(assert (= (and b!846612 res!574883) b!846616))

(assert (= (and b!846616 res!574878) b!846610))

(assert (= (and b!846609 condMapEmpty!25469) mapIsEmpty!25469))

(assert (= (and b!846609 (not condMapEmpty!25469)) mapNonEmpty!25469))

(get-info :version)

(assert (= (and mapNonEmpty!25469 ((_ is ValueCellFull!7517) mapValue!25469)) b!846608))

(assert (= (and b!846609 ((_ is ValueCellFull!7517) mapDefault!25469)) b!846617))

(assert (= start!73030 b!846609))

(declare-fun m!788687 () Bool)

(assert (=> b!846612 m!788687))

(declare-fun m!788689 () Bool)

(assert (=> b!846611 m!788689))

(declare-fun m!788691 () Bool)

(assert (=> b!846610 m!788691))

(declare-fun m!788693 () Bool)

(assert (=> start!73030 m!788693))

(declare-fun m!788695 () Bool)

(assert (=> start!73030 m!788695))

(declare-fun m!788697 () Bool)

(assert (=> b!846614 m!788697))

(declare-fun m!788699 () Bool)

(assert (=> b!846607 m!788699))

(declare-fun m!788701 () Bool)

(assert (=> mapNonEmpty!25469 m!788701))

(declare-fun m!788703 () Bool)

(assert (=> b!846616 m!788703))

(check-sat tp_is_empty!15913 (not b!846612) (not b_next!13777) (not b!846607) (not b!846614) (not mapNonEmpty!25469) (not start!73030) b_and!22873 (not b!846611) (not b!846610))
(check-sat b_and!22873 (not b_next!13777))
