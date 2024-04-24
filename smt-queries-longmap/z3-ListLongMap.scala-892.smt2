; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20452 () Bool)

(assert start!20452)

(declare-fun b_free!5107 () Bool)

(declare-fun b_next!5107 () Bool)

(assert (=> start!20452 (= b_free!5107 (not b_next!5107))))

(declare-fun tp!18353 () Bool)

(declare-fun b_and!11867 () Bool)

(assert (=> start!20452 (= tp!18353 b_and!11867)))

(declare-fun b!202610 () Bool)

(declare-fun res!97125 () Bool)

(declare-fun e!132698 () Bool)

(assert (=> b!202610 (=> (not res!97125) (not e!132698))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9143 0))(
  ( (array!9144 (arr!4322 (Array (_ BitVec 32) (_ BitVec 64))) (size!4647 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9143)

(assert (=> b!202610 (= res!97125 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4647 _keys!825))))))

(declare-fun b!202611 () Bool)

(declare-fun e!132695 () Bool)

(declare-fun tp_is_empty!4963 () Bool)

(assert (=> b!202611 (= e!132695 tp_is_empty!4963)))

(declare-fun mapIsEmpty!8513 () Bool)

(declare-fun mapRes!8513 () Bool)

(assert (=> mapIsEmpty!8513 mapRes!8513))

(declare-fun b!202612 () Bool)

(declare-fun e!132699 () Bool)

(assert (=> b!202612 (= e!132699 true)))

(declare-datatypes ((V!6265 0))(
  ( (V!6266 (val!2526 Int)) )
))
(declare-datatypes ((tuple2!3766 0))(
  ( (tuple2!3767 (_1!1894 (_ BitVec 64)) (_2!1894 V!6265)) )
))
(declare-datatypes ((List!2671 0))(
  ( (Nil!2668) (Cons!2667 (h!3309 tuple2!3766) (t!7594 List!2671)) )
))
(declare-datatypes ((ListLongMap!2681 0))(
  ( (ListLongMap!2682 (toList!1356 List!2671)) )
))
(declare-fun lt!101805 () ListLongMap!2681)

(declare-fun lt!101799 () ListLongMap!2681)

(declare-fun lt!101809 () tuple2!3766)

(declare-fun +!410 (ListLongMap!2681 tuple2!3766) ListLongMap!2681)

(assert (=> b!202612 (= lt!101805 (+!410 lt!101799 lt!101809))))

(declare-datatypes ((Unit!6104 0))(
  ( (Unit!6105) )
))
(declare-fun lt!101807 () Unit!6104)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6265)

(declare-fun v!520 () V!6265)

(declare-fun lt!101810 () ListLongMap!2681)

(declare-fun addCommutativeForDiffKeys!129 (ListLongMap!2681 (_ BitVec 64) V!6265 (_ BitVec 64) V!6265) Unit!6104)

(assert (=> b!202612 (= lt!101807 (addCommutativeForDiffKeys!129 lt!101810 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202613 () Bool)

(declare-fun res!97121 () Bool)

(assert (=> b!202613 (=> (not res!97121) (not e!132698))))

(declare-datatypes ((List!2672 0))(
  ( (Nil!2669) (Cons!2668 (h!3310 (_ BitVec 64)) (t!7595 List!2672)) )
))
(declare-fun arrayNoDuplicates!0 (array!9143 (_ BitVec 32) List!2672) Bool)

(assert (=> b!202613 (= res!97121 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2669))))

(declare-fun mapNonEmpty!8513 () Bool)

(declare-fun tp!18352 () Bool)

(declare-fun e!132701 () Bool)

(assert (=> mapNonEmpty!8513 (= mapRes!8513 (and tp!18352 e!132701))))

(declare-fun mapKey!8513 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2138 0))(
  ( (ValueCellFull!2138 (v!4497 V!6265)) (EmptyCell!2138) )
))
(declare-fun mapValue!8513 () ValueCell!2138)

(declare-datatypes ((array!9145 0))(
  ( (array!9146 (arr!4323 (Array (_ BitVec 32) ValueCell!2138)) (size!4648 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9145)

(declare-fun mapRest!8513 () (Array (_ BitVec 32) ValueCell!2138))

(assert (=> mapNonEmpty!8513 (= (arr!4323 _values!649) (store mapRest!8513 mapKey!8513 mapValue!8513))))

(declare-fun b!202614 () Bool)

(declare-fun res!97122 () Bool)

(assert (=> b!202614 (=> (not res!97122) (not e!132698))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9143 (_ BitVec 32)) Bool)

(assert (=> b!202614 (= res!97122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202615 () Bool)

(declare-fun res!97123 () Bool)

(assert (=> b!202615 (=> (not res!97123) (not e!132698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202615 (= res!97123 (validKeyInArray!0 k0!843))))

(declare-fun res!97126 () Bool)

(assert (=> start!20452 (=> (not res!97126) (not e!132698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20452 (= res!97126 (validMask!0 mask!1149))))

(assert (=> start!20452 e!132698))

(declare-fun e!132697 () Bool)

(declare-fun array_inv!2821 (array!9145) Bool)

(assert (=> start!20452 (and (array_inv!2821 _values!649) e!132697)))

(assert (=> start!20452 true))

(assert (=> start!20452 tp_is_empty!4963))

(declare-fun array_inv!2822 (array!9143) Bool)

(assert (=> start!20452 (array_inv!2822 _keys!825)))

(assert (=> start!20452 tp!18353))

(declare-fun b!202616 () Bool)

(declare-fun e!132700 () Bool)

(assert (=> b!202616 (= e!132698 (not e!132700))))

(declare-fun res!97124 () Bool)

(assert (=> b!202616 (=> res!97124 e!132700)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202616 (= res!97124 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!101802 () ListLongMap!2681)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6265)

(declare-fun getCurrentListMap!940 (array!9143 array!9145 (_ BitVec 32) (_ BitVec 32) V!6265 V!6265 (_ BitVec 32) Int) ListLongMap!2681)

(assert (=> b!202616 (= lt!101802 (getCurrentListMap!940 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101808 () ListLongMap!2681)

(declare-fun lt!101800 () array!9145)

(assert (=> b!202616 (= lt!101808 (getCurrentListMap!940 _keys!825 lt!101800 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101806 () ListLongMap!2681)

(declare-fun lt!101804 () ListLongMap!2681)

(assert (=> b!202616 (and (= lt!101806 lt!101804) (= lt!101804 lt!101806))))

(assert (=> b!202616 (= lt!101804 (+!410 lt!101810 lt!101809))))

(assert (=> b!202616 (= lt!101809 (tuple2!3767 k0!843 v!520))))

(declare-fun lt!101801 () Unit!6104)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!76 (array!9143 array!9145 (_ BitVec 32) (_ BitVec 32) V!6265 V!6265 (_ BitVec 32) (_ BitVec 64) V!6265 (_ BitVec 32) Int) Unit!6104)

(assert (=> b!202616 (= lt!101801 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!76 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!333 (array!9143 array!9145 (_ BitVec 32) (_ BitVec 32) V!6265 V!6265 (_ BitVec 32) Int) ListLongMap!2681)

(assert (=> b!202616 (= lt!101806 (getCurrentListMapNoExtraKeys!333 _keys!825 lt!101800 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202616 (= lt!101800 (array!9146 (store (arr!4323 _values!649) i!601 (ValueCellFull!2138 v!520)) (size!4648 _values!649)))))

(assert (=> b!202616 (= lt!101810 (getCurrentListMapNoExtraKeys!333 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202617 () Bool)

(assert (=> b!202617 (= e!132697 (and e!132695 mapRes!8513))))

(declare-fun condMapEmpty!8513 () Bool)

(declare-fun mapDefault!8513 () ValueCell!2138)

(assert (=> b!202617 (= condMapEmpty!8513 (= (arr!4323 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2138)) mapDefault!8513)))))

(declare-fun b!202618 () Bool)

(assert (=> b!202618 (= e!132700 e!132699)))

(declare-fun res!97118 () Bool)

(assert (=> b!202618 (=> res!97118 e!132699)))

(assert (=> b!202618 (= res!97118 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!202618 (= lt!101808 lt!101805)))

(declare-fun lt!101803 () tuple2!3766)

(assert (=> b!202618 (= lt!101805 (+!410 lt!101804 lt!101803))))

(assert (=> b!202618 (= lt!101802 lt!101799)))

(assert (=> b!202618 (= lt!101799 (+!410 lt!101810 lt!101803))))

(assert (=> b!202618 (= lt!101808 (+!410 lt!101806 lt!101803))))

(assert (=> b!202618 (= lt!101803 (tuple2!3767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202619 () Bool)

(declare-fun res!97119 () Bool)

(assert (=> b!202619 (=> (not res!97119) (not e!132698))))

(assert (=> b!202619 (= res!97119 (= (select (arr!4322 _keys!825) i!601) k0!843))))

(declare-fun b!202620 () Bool)

(assert (=> b!202620 (= e!132701 tp_is_empty!4963)))

(declare-fun b!202621 () Bool)

(declare-fun res!97120 () Bool)

(assert (=> b!202621 (=> (not res!97120) (not e!132698))))

(assert (=> b!202621 (= res!97120 (and (= (size!4648 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4647 _keys!825) (size!4648 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20452 res!97126) b!202621))

(assert (= (and b!202621 res!97120) b!202614))

(assert (= (and b!202614 res!97122) b!202613))

(assert (= (and b!202613 res!97121) b!202610))

(assert (= (and b!202610 res!97125) b!202615))

(assert (= (and b!202615 res!97123) b!202619))

(assert (= (and b!202619 res!97119) b!202616))

(assert (= (and b!202616 (not res!97124)) b!202618))

(assert (= (and b!202618 (not res!97118)) b!202612))

(assert (= (and b!202617 condMapEmpty!8513) mapIsEmpty!8513))

(assert (= (and b!202617 (not condMapEmpty!8513)) mapNonEmpty!8513))

(get-info :version)

(assert (= (and mapNonEmpty!8513 ((_ is ValueCellFull!2138) mapValue!8513)) b!202620))

(assert (= (and b!202617 ((_ is ValueCellFull!2138) mapDefault!8513)) b!202611))

(assert (= start!20452 b!202617))

(declare-fun m!230073 () Bool)

(assert (=> b!202613 m!230073))

(declare-fun m!230075 () Bool)

(assert (=> b!202616 m!230075))

(declare-fun m!230077 () Bool)

(assert (=> b!202616 m!230077))

(declare-fun m!230079 () Bool)

(assert (=> b!202616 m!230079))

(declare-fun m!230081 () Bool)

(assert (=> b!202616 m!230081))

(declare-fun m!230083 () Bool)

(assert (=> b!202616 m!230083))

(declare-fun m!230085 () Bool)

(assert (=> b!202616 m!230085))

(declare-fun m!230087 () Bool)

(assert (=> b!202616 m!230087))

(declare-fun m!230089 () Bool)

(assert (=> b!202619 m!230089))

(declare-fun m!230091 () Bool)

(assert (=> start!20452 m!230091))

(declare-fun m!230093 () Bool)

(assert (=> start!20452 m!230093))

(declare-fun m!230095 () Bool)

(assert (=> start!20452 m!230095))

(declare-fun m!230097 () Bool)

(assert (=> b!202614 m!230097))

(declare-fun m!230099 () Bool)

(assert (=> b!202612 m!230099))

(declare-fun m!230101 () Bool)

(assert (=> b!202612 m!230101))

(declare-fun m!230103 () Bool)

(assert (=> mapNonEmpty!8513 m!230103))

(declare-fun m!230105 () Bool)

(assert (=> b!202615 m!230105))

(declare-fun m!230107 () Bool)

(assert (=> b!202618 m!230107))

(declare-fun m!230109 () Bool)

(assert (=> b!202618 m!230109))

(declare-fun m!230111 () Bool)

(assert (=> b!202618 m!230111))

(check-sat (not b!202614) (not b!202615) (not b!202616) tp_is_empty!4963 (not b!202613) (not start!20452) b_and!11867 (not b!202612) (not b!202618) (not mapNonEmpty!8513) (not b_next!5107))
(check-sat b_and!11867 (not b_next!5107))
