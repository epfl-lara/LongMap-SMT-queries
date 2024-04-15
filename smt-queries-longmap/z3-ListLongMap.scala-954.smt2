; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20824 () Bool)

(assert start!20824)

(declare-fun b_free!5473 () Bool)

(declare-fun b_next!5473 () Bool)

(assert (=> start!20824 (= b_free!5473 (not b_next!5473))))

(declare-fun tp!19459 () Bool)

(declare-fun b_and!12193 () Bool)

(assert (=> start!20824 (= tp!19459 b_and!12193)))

(declare-fun b!208613 () Bool)

(declare-fun res!101525 () Bool)

(declare-fun e!136005 () Bool)

(assert (=> b!208613 (=> (not res!101525) (not e!136005))))

(declare-datatypes ((array!9859 0))(
  ( (array!9860 (arr!4679 (Array (_ BitVec 32) (_ BitVec 64))) (size!5005 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9859)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9859 (_ BitVec 32)) Bool)

(assert (=> b!208613 (= res!101525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208614 () Bool)

(declare-fun res!101527 () Bool)

(assert (=> b!208614 (=> (not res!101527) (not e!136005))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208614 (= res!101527 (= (select (arr!4679 _keys!825) i!601) k0!843))))

(declare-fun res!101530 () Bool)

(assert (=> start!20824 (=> (not res!101530) (not e!136005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20824 (= res!101530 (validMask!0 mask!1149))))

(assert (=> start!20824 e!136005))

(declare-datatypes ((V!6761 0))(
  ( (V!6762 (val!2712 Int)) )
))
(declare-datatypes ((ValueCell!2324 0))(
  ( (ValueCellFull!2324 (v!4676 V!6761)) (EmptyCell!2324) )
))
(declare-datatypes ((array!9861 0))(
  ( (array!9862 (arr!4680 (Array (_ BitVec 32) ValueCell!2324)) (size!5006 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9861)

(declare-fun e!136007 () Bool)

(declare-fun array_inv!3073 (array!9861) Bool)

(assert (=> start!20824 (and (array_inv!3073 _values!649) e!136007)))

(assert (=> start!20824 true))

(declare-fun tp_is_empty!5335 () Bool)

(assert (=> start!20824 tp_is_empty!5335))

(declare-fun array_inv!3074 (array!9859) Bool)

(assert (=> start!20824 (array_inv!3074 _keys!825)))

(assert (=> start!20824 tp!19459))

(declare-fun mapNonEmpty!9071 () Bool)

(declare-fun mapRes!9071 () Bool)

(declare-fun tp!19460 () Bool)

(declare-fun e!136008 () Bool)

(assert (=> mapNonEmpty!9071 (= mapRes!9071 (and tp!19460 e!136008))))

(declare-fun mapKey!9071 () (_ BitVec 32))

(declare-fun mapRest!9071 () (Array (_ BitVec 32) ValueCell!2324))

(declare-fun mapValue!9071 () ValueCell!2324)

(assert (=> mapNonEmpty!9071 (= (arr!4680 _values!649) (store mapRest!9071 mapKey!9071 mapValue!9071))))

(declare-fun b!208615 () Bool)

(assert (=> b!208615 (= e!136008 tp_is_empty!5335)))

(declare-fun b!208616 () Bool)

(declare-fun res!101529 () Bool)

(assert (=> b!208616 (=> (not res!101529) (not e!136005))))

(assert (=> b!208616 (= res!101529 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5005 _keys!825))))))

(declare-fun b!208617 () Bool)

(declare-fun res!101526 () Bool)

(assert (=> b!208617 (=> (not res!101526) (not e!136005))))

(declare-datatypes ((List!2991 0))(
  ( (Nil!2988) (Cons!2987 (h!3629 (_ BitVec 64)) (t!7913 List!2991)) )
))
(declare-fun arrayNoDuplicates!0 (array!9859 (_ BitVec 32) List!2991) Bool)

(assert (=> b!208617 (= res!101526 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2988))))

(declare-fun mapIsEmpty!9071 () Bool)

(assert (=> mapIsEmpty!9071 mapRes!9071))

(declare-fun b!208618 () Bool)

(declare-fun e!136004 () Bool)

(assert (=> b!208618 (= e!136004 tp_is_empty!5335)))

(declare-fun b!208619 () Bool)

(assert (=> b!208619 (= e!136007 (and e!136004 mapRes!9071))))

(declare-fun condMapEmpty!9071 () Bool)

(declare-fun mapDefault!9071 () ValueCell!2324)

(assert (=> b!208619 (= condMapEmpty!9071 (= (arr!4680 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2324)) mapDefault!9071)))))

(declare-fun b!208620 () Bool)

(declare-fun res!101531 () Bool)

(assert (=> b!208620 (=> (not res!101531) (not e!136005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208620 (= res!101531 (validKeyInArray!0 k0!843))))

(declare-fun b!208621 () Bool)

(declare-fun res!101528 () Bool)

(assert (=> b!208621 (=> (not res!101528) (not e!136005))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208621 (= res!101528 (and (= (size!5006 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5005 _keys!825) (size!5006 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208622 () Bool)

(assert (=> b!208622 (= e!136005 false)))

(declare-fun v!520 () V!6761)

(declare-fun zeroValue!615 () V!6761)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6761)

(declare-datatypes ((tuple2!4084 0))(
  ( (tuple2!4085 (_1!2053 (_ BitVec 64)) (_2!2053 V!6761)) )
))
(declare-datatypes ((List!2992 0))(
  ( (Nil!2989) (Cons!2988 (h!3630 tuple2!4084) (t!7914 List!2992)) )
))
(declare-datatypes ((ListLongMap!2987 0))(
  ( (ListLongMap!2988 (toList!1509 List!2992)) )
))
(declare-fun lt!106669 () ListLongMap!2987)

(declare-fun getCurrentListMapNoExtraKeys!460 (array!9859 array!9861 (_ BitVec 32) (_ BitVec 32) V!6761 V!6761 (_ BitVec 32) Int) ListLongMap!2987)

(assert (=> b!208622 (= lt!106669 (getCurrentListMapNoExtraKeys!460 _keys!825 (array!9862 (store (arr!4680 _values!649) i!601 (ValueCellFull!2324 v!520)) (size!5006 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106670 () ListLongMap!2987)

(assert (=> b!208622 (= lt!106670 (getCurrentListMapNoExtraKeys!460 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20824 res!101530) b!208621))

(assert (= (and b!208621 res!101528) b!208613))

(assert (= (and b!208613 res!101525) b!208617))

(assert (= (and b!208617 res!101526) b!208616))

(assert (= (and b!208616 res!101529) b!208620))

(assert (= (and b!208620 res!101531) b!208614))

(assert (= (and b!208614 res!101527) b!208622))

(assert (= (and b!208619 condMapEmpty!9071) mapIsEmpty!9071))

(assert (= (and b!208619 (not condMapEmpty!9071)) mapNonEmpty!9071))

(get-info :version)

(assert (= (and mapNonEmpty!9071 ((_ is ValueCellFull!2324) mapValue!9071)) b!208615))

(assert (= (and b!208619 ((_ is ValueCellFull!2324) mapDefault!9071)) b!208618))

(assert (= start!20824 b!208619))

(declare-fun m!235689 () Bool)

(assert (=> b!208614 m!235689))

(declare-fun m!235691 () Bool)

(assert (=> b!208622 m!235691))

(declare-fun m!235693 () Bool)

(assert (=> b!208622 m!235693))

(declare-fun m!235695 () Bool)

(assert (=> b!208622 m!235695))

(declare-fun m!235697 () Bool)

(assert (=> b!208620 m!235697))

(declare-fun m!235699 () Bool)

(assert (=> mapNonEmpty!9071 m!235699))

(declare-fun m!235701 () Bool)

(assert (=> b!208617 m!235701))

(declare-fun m!235703 () Bool)

(assert (=> b!208613 m!235703))

(declare-fun m!235705 () Bool)

(assert (=> start!20824 m!235705))

(declare-fun m!235707 () Bool)

(assert (=> start!20824 m!235707))

(declare-fun m!235709 () Bool)

(assert (=> start!20824 m!235709))

(check-sat tp_is_empty!5335 (not b!208620) (not b!208613) (not b!208622) (not start!20824) (not b!208617) (not b_next!5473) (not mapNonEmpty!9071) b_and!12193)
(check-sat b_and!12193 (not b_next!5473))
