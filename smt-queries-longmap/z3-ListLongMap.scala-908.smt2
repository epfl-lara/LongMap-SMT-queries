; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20546 () Bool)

(assert start!20546)

(declare-fun b_free!5205 () Bool)

(declare-fun b_next!5205 () Bool)

(assert (=> start!20546 (= b_free!5205 (not b_next!5205))))

(declare-fun tp!18646 () Bool)

(declare-fun b_and!11951 () Bool)

(assert (=> start!20546 (= tp!18646 b_and!11951)))

(declare-fun res!98423 () Bool)

(declare-fun e!133706 () Bool)

(assert (=> start!20546 (=> (not res!98423) (not e!133706))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20546 (= res!98423 (validMask!0 mask!1149))))

(assert (=> start!20546 e!133706))

(declare-datatypes ((V!6395 0))(
  ( (V!6396 (val!2575 Int)) )
))
(declare-datatypes ((ValueCell!2187 0))(
  ( (ValueCellFull!2187 (v!4545 V!6395)) (EmptyCell!2187) )
))
(declare-datatypes ((array!9339 0))(
  ( (array!9340 (arr!4420 (Array (_ BitVec 32) ValueCell!2187)) (size!4745 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9339)

(declare-fun e!133700 () Bool)

(declare-fun array_inv!2919 (array!9339) Bool)

(assert (=> start!20546 (and (array_inv!2919 _values!649) e!133700)))

(assert (=> start!20546 true))

(declare-fun tp_is_empty!5061 () Bool)

(assert (=> start!20546 tp_is_empty!5061))

(declare-datatypes ((array!9341 0))(
  ( (array!9342 (arr!4421 (Array (_ BitVec 32) (_ BitVec 64))) (size!4746 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9341)

(declare-fun array_inv!2920 (array!9341) Bool)

(assert (=> start!20546 (array_inv!2920 _keys!825)))

(assert (=> start!20546 tp!18646))

(declare-fun b!204327 () Bool)

(declare-fun res!98420 () Bool)

(assert (=> b!204327 (=> (not res!98420) (not e!133706))))

(declare-datatypes ((List!2805 0))(
  ( (Nil!2802) (Cons!2801 (h!3443 (_ BitVec 64)) (t!7736 List!2805)) )
))
(declare-fun arrayNoDuplicates!0 (array!9341 (_ BitVec 32) List!2805) Bool)

(assert (=> b!204327 (= res!98420 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2802))))

(declare-fun b!204328 () Bool)

(declare-fun e!133701 () Bool)

(declare-fun mapRes!8660 () Bool)

(assert (=> b!204328 (= e!133700 (and e!133701 mapRes!8660))))

(declare-fun condMapEmpty!8660 () Bool)

(declare-fun mapDefault!8660 () ValueCell!2187)

(assert (=> b!204328 (= condMapEmpty!8660 (= (arr!4420 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2187)) mapDefault!8660)))))

(declare-fun b!204329 () Bool)

(declare-fun res!98428 () Bool)

(assert (=> b!204329 (=> (not res!98428) (not e!133706))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204329 (= res!98428 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4746 _keys!825))))))

(declare-fun b!204330 () Bool)

(declare-fun e!133704 () Bool)

(declare-fun e!133705 () Bool)

(assert (=> b!204330 (= e!133704 e!133705)))

(declare-fun res!98426 () Bool)

(assert (=> b!204330 (=> res!98426 e!133705)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!204330 (= res!98426 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3906 0))(
  ( (tuple2!3907 (_1!1964 (_ BitVec 64)) (_2!1964 V!6395)) )
))
(declare-datatypes ((List!2806 0))(
  ( (Nil!2803) (Cons!2802 (h!3444 tuple2!3906) (t!7737 List!2806)) )
))
(declare-datatypes ((ListLongMap!2819 0))(
  ( (ListLongMap!2820 (toList!1425 List!2806)) )
))
(declare-fun lt!103510 () ListLongMap!2819)

(declare-fun lt!103513 () ListLongMap!2819)

(assert (=> b!204330 (= lt!103510 lt!103513)))

(declare-fun lt!103511 () ListLongMap!2819)

(declare-fun lt!103515 () tuple2!3906)

(declare-fun +!452 (ListLongMap!2819 tuple2!3906) ListLongMap!2819)

(assert (=> b!204330 (= lt!103513 (+!452 lt!103511 lt!103515))))

(declare-fun lt!103507 () ListLongMap!2819)

(declare-fun lt!103514 () ListLongMap!2819)

(assert (=> b!204330 (= lt!103507 lt!103514)))

(declare-fun lt!103512 () ListLongMap!2819)

(assert (=> b!204330 (= lt!103514 (+!452 lt!103512 lt!103515))))

(declare-fun lt!103506 () ListLongMap!2819)

(assert (=> b!204330 (= lt!103510 (+!452 lt!103506 lt!103515))))

(declare-fun zeroValue!615 () V!6395)

(assert (=> b!204330 (= lt!103515 (tuple2!3907 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204331 () Bool)

(assert (=> b!204331 (= e!133705 (bvsle #b00000000000000000000000000000000 (size!4746 _keys!825)))))

(declare-fun lt!103504 () tuple2!3906)

(assert (=> b!204331 (= lt!103513 (+!452 lt!103514 lt!103504))))

(declare-datatypes ((Unit!6196 0))(
  ( (Unit!6197) )
))
(declare-fun lt!103505 () Unit!6196)

(declare-fun v!520 () V!6395)

(declare-fun addCommutativeForDiffKeys!160 (ListLongMap!2819 (_ BitVec 64) V!6395 (_ BitVec 64) V!6395) Unit!6196)

(assert (=> b!204331 (= lt!103505 (addCommutativeForDiffKeys!160 lt!103512 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204332 () Bool)

(declare-fun res!98427 () Bool)

(assert (=> b!204332 (=> (not res!98427) (not e!133706))))

(assert (=> b!204332 (= res!98427 (= (select (arr!4421 _keys!825) i!601) k0!843))))

(declare-fun b!204333 () Bool)

(declare-fun res!98422 () Bool)

(assert (=> b!204333 (=> (not res!98422) (not e!133706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204333 (= res!98422 (validKeyInArray!0 k0!843))))

(declare-fun b!204334 () Bool)

(assert (=> b!204334 (= e!133706 (not e!133704))))

(declare-fun res!98425 () Bool)

(assert (=> b!204334 (=> res!98425 e!133704)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204334 (= res!98425 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6395)

(declare-fun getCurrentListMap!998 (array!9341 array!9339 (_ BitVec 32) (_ BitVec 32) V!6395 V!6395 (_ BitVec 32) Int) ListLongMap!2819)

(assert (=> b!204334 (= lt!103507 (getCurrentListMap!998 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103509 () array!9339)

(assert (=> b!204334 (= lt!103510 (getCurrentListMap!998 _keys!825 lt!103509 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204334 (and (= lt!103506 lt!103511) (= lt!103511 lt!103506))))

(assert (=> b!204334 (= lt!103511 (+!452 lt!103512 lt!103504))))

(assert (=> b!204334 (= lt!103504 (tuple2!3907 k0!843 v!520))))

(declare-fun lt!103508 () Unit!6196)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!111 (array!9341 array!9339 (_ BitVec 32) (_ BitVec 32) V!6395 V!6395 (_ BitVec 32) (_ BitVec 64) V!6395 (_ BitVec 32) Int) Unit!6196)

(assert (=> b!204334 (= lt!103508 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!111 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!372 (array!9341 array!9339 (_ BitVec 32) (_ BitVec 32) V!6395 V!6395 (_ BitVec 32) Int) ListLongMap!2819)

(assert (=> b!204334 (= lt!103506 (getCurrentListMapNoExtraKeys!372 _keys!825 lt!103509 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204334 (= lt!103509 (array!9340 (store (arr!4420 _values!649) i!601 (ValueCellFull!2187 v!520)) (size!4745 _values!649)))))

(assert (=> b!204334 (= lt!103512 (getCurrentListMapNoExtraKeys!372 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204335 () Bool)

(declare-fun e!133703 () Bool)

(assert (=> b!204335 (= e!133703 tp_is_empty!5061)))

(declare-fun b!204336 () Bool)

(assert (=> b!204336 (= e!133701 tp_is_empty!5061)))

(declare-fun b!204337 () Bool)

(declare-fun res!98421 () Bool)

(assert (=> b!204337 (=> (not res!98421) (not e!133706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9341 (_ BitVec 32)) Bool)

(assert (=> b!204337 (= res!98421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8660 () Bool)

(assert (=> mapIsEmpty!8660 mapRes!8660))

(declare-fun mapNonEmpty!8660 () Bool)

(declare-fun tp!18647 () Bool)

(assert (=> mapNonEmpty!8660 (= mapRes!8660 (and tp!18647 e!133703))))

(declare-fun mapValue!8660 () ValueCell!2187)

(declare-fun mapKey!8660 () (_ BitVec 32))

(declare-fun mapRest!8660 () (Array (_ BitVec 32) ValueCell!2187))

(assert (=> mapNonEmpty!8660 (= (arr!4420 _values!649) (store mapRest!8660 mapKey!8660 mapValue!8660))))

(declare-fun b!204338 () Bool)

(declare-fun res!98424 () Bool)

(assert (=> b!204338 (=> (not res!98424) (not e!133706))))

(assert (=> b!204338 (= res!98424 (and (= (size!4745 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4746 _keys!825) (size!4745 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20546 res!98423) b!204338))

(assert (= (and b!204338 res!98424) b!204337))

(assert (= (and b!204337 res!98421) b!204327))

(assert (= (and b!204327 res!98420) b!204329))

(assert (= (and b!204329 res!98428) b!204333))

(assert (= (and b!204333 res!98422) b!204332))

(assert (= (and b!204332 res!98427) b!204334))

(assert (= (and b!204334 (not res!98425)) b!204330))

(assert (= (and b!204330 (not res!98426)) b!204331))

(assert (= (and b!204328 condMapEmpty!8660) mapIsEmpty!8660))

(assert (= (and b!204328 (not condMapEmpty!8660)) mapNonEmpty!8660))

(get-info :version)

(assert (= (and mapNonEmpty!8660 ((_ is ValueCellFull!2187) mapValue!8660)) b!204335))

(assert (= (and b!204328 ((_ is ValueCellFull!2187) mapDefault!8660)) b!204336))

(assert (= start!20546 b!204328))

(declare-fun m!231851 () Bool)

(assert (=> start!20546 m!231851))

(declare-fun m!231853 () Bool)

(assert (=> start!20546 m!231853))

(declare-fun m!231855 () Bool)

(assert (=> start!20546 m!231855))

(declare-fun m!231857 () Bool)

(assert (=> b!204337 m!231857))

(declare-fun m!231859 () Bool)

(assert (=> b!204334 m!231859))

(declare-fun m!231861 () Bool)

(assert (=> b!204334 m!231861))

(declare-fun m!231863 () Bool)

(assert (=> b!204334 m!231863))

(declare-fun m!231865 () Bool)

(assert (=> b!204334 m!231865))

(declare-fun m!231867 () Bool)

(assert (=> b!204334 m!231867))

(declare-fun m!231869 () Bool)

(assert (=> b!204334 m!231869))

(declare-fun m!231871 () Bool)

(assert (=> b!204334 m!231871))

(declare-fun m!231873 () Bool)

(assert (=> b!204331 m!231873))

(declare-fun m!231875 () Bool)

(assert (=> b!204331 m!231875))

(declare-fun m!231877 () Bool)

(assert (=> mapNonEmpty!8660 m!231877))

(declare-fun m!231879 () Bool)

(assert (=> b!204327 m!231879))

(declare-fun m!231881 () Bool)

(assert (=> b!204333 m!231881))

(declare-fun m!231883 () Bool)

(assert (=> b!204330 m!231883))

(declare-fun m!231885 () Bool)

(assert (=> b!204330 m!231885))

(declare-fun m!231887 () Bool)

(assert (=> b!204330 m!231887))

(declare-fun m!231889 () Bool)

(assert (=> b!204332 m!231889))

(check-sat (not b!204330) (not b!204337) (not b!204334) (not mapNonEmpty!8660) (not b!204327) (not b_next!5205) tp_is_empty!5061 b_and!11951 (not b!204333) (not start!20546) (not b!204331))
(check-sat b_and!11951 (not b_next!5205))
