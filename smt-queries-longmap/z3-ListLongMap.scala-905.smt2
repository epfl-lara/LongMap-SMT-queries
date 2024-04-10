; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20528 () Bool)

(assert start!20528)

(declare-fun b_free!5187 () Bool)

(declare-fun b_next!5187 () Bool)

(assert (=> start!20528 (= b_free!5187 (not b_next!5187))))

(declare-fun tp!18592 () Bool)

(declare-fun b_and!11933 () Bool)

(assert (=> start!20528 (= tp!18592 b_and!11933)))

(declare-fun b!204003 () Bool)

(declare-fun e!133515 () Bool)

(declare-fun tp_is_empty!5043 () Bool)

(assert (=> b!204003 (= e!133515 tp_is_empty!5043)))

(declare-fun mapIsEmpty!8633 () Bool)

(declare-fun mapRes!8633 () Bool)

(assert (=> mapIsEmpty!8633 mapRes!8633))

(declare-fun b!204004 () Bool)

(declare-fun res!98183 () Bool)

(declare-fun e!133512 () Bool)

(assert (=> b!204004 (=> (not res!98183) (not e!133512))))

(declare-datatypes ((array!9305 0))(
  ( (array!9306 (arr!4403 (Array (_ BitVec 32) (_ BitVec 64))) (size!4728 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9305)

(declare-datatypes ((List!2792 0))(
  ( (Nil!2789) (Cons!2788 (h!3430 (_ BitVec 64)) (t!7723 List!2792)) )
))
(declare-fun arrayNoDuplicates!0 (array!9305 (_ BitVec 32) List!2792) Bool)

(assert (=> b!204004 (= res!98183 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2789))))

(declare-fun b!204005 () Bool)

(declare-fun e!133516 () Bool)

(assert (=> b!204005 (= e!133512 (not e!133516))))

(declare-fun res!98184 () Bool)

(assert (=> b!204005 (=> res!98184 e!133516)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204005 (= res!98184 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!6371 0))(
  ( (V!6372 (val!2566 Int)) )
))
(declare-fun zeroValue!615 () V!6371)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6371)

(declare-datatypes ((tuple2!3892 0))(
  ( (tuple2!3893 (_1!1957 (_ BitVec 64)) (_2!1957 V!6371)) )
))
(declare-datatypes ((List!2793 0))(
  ( (Nil!2790) (Cons!2789 (h!3431 tuple2!3892) (t!7724 List!2793)) )
))
(declare-datatypes ((ListLongMap!2805 0))(
  ( (ListLongMap!2806 (toList!1418 List!2793)) )
))
(declare-fun lt!103182 () ListLongMap!2805)

(declare-datatypes ((ValueCell!2178 0))(
  ( (ValueCellFull!2178 (v!4536 V!6371)) (EmptyCell!2178) )
))
(declare-datatypes ((array!9307 0))(
  ( (array!9308 (arr!4404 (Array (_ BitVec 32) ValueCell!2178)) (size!4729 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9307)

(declare-fun getCurrentListMap!992 (array!9305 array!9307 (_ BitVec 32) (_ BitVec 32) V!6371 V!6371 (_ BitVec 32) Int) ListLongMap!2805)

(assert (=> b!204005 (= lt!103182 (getCurrentListMap!992 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103187 () array!9307)

(declare-fun lt!103191 () ListLongMap!2805)

(assert (=> b!204005 (= lt!103191 (getCurrentListMap!992 _keys!825 lt!103187 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103188 () ListLongMap!2805)

(declare-fun lt!103186 () ListLongMap!2805)

(assert (=> b!204005 (and (= lt!103188 lt!103186) (= lt!103186 lt!103188))))

(declare-fun lt!103181 () ListLongMap!2805)

(declare-fun lt!103190 () tuple2!3892)

(declare-fun +!445 (ListLongMap!2805 tuple2!3892) ListLongMap!2805)

(assert (=> b!204005 (= lt!103186 (+!445 lt!103181 lt!103190))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6371)

(assert (=> b!204005 (= lt!103190 (tuple2!3893 k0!843 v!520))))

(declare-datatypes ((Unit!6184 0))(
  ( (Unit!6185) )
))
(declare-fun lt!103184 () Unit!6184)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!105 (array!9305 array!9307 (_ BitVec 32) (_ BitVec 32) V!6371 V!6371 (_ BitVec 32) (_ BitVec 64) V!6371 (_ BitVec 32) Int) Unit!6184)

(assert (=> b!204005 (= lt!103184 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!105 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!366 (array!9305 array!9307 (_ BitVec 32) (_ BitVec 32) V!6371 V!6371 (_ BitVec 32) Int) ListLongMap!2805)

(assert (=> b!204005 (= lt!103188 (getCurrentListMapNoExtraKeys!366 _keys!825 lt!103187 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204005 (= lt!103187 (array!9308 (store (arr!4404 _values!649) i!601 (ValueCellFull!2178 v!520)) (size!4729 _values!649)))))

(assert (=> b!204005 (= lt!103181 (getCurrentListMapNoExtraKeys!366 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204006 () Bool)

(declare-fun e!133514 () Bool)

(assert (=> b!204006 (= e!133514 true)))

(declare-fun lt!103189 () ListLongMap!2805)

(declare-fun lt!103185 () ListLongMap!2805)

(assert (=> b!204006 (= lt!103189 (+!445 lt!103185 lt!103190))))

(declare-fun lt!103183 () Unit!6184)

(declare-fun addCommutativeForDiffKeys!155 (ListLongMap!2805 (_ BitVec 64) V!6371 (_ BitVec 64) V!6371) Unit!6184)

(assert (=> b!204006 (= lt!103183 (addCommutativeForDiffKeys!155 lt!103181 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204007 () Bool)

(declare-fun res!98182 () Bool)

(assert (=> b!204007 (=> (not res!98182) (not e!133512))))

(assert (=> b!204007 (= res!98182 (= (select (arr!4403 _keys!825) i!601) k0!843))))

(declare-fun b!204008 () Bool)

(declare-fun res!98180 () Bool)

(assert (=> b!204008 (=> (not res!98180) (not e!133512))))

(assert (=> b!204008 (= res!98180 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4728 _keys!825))))))

(declare-fun mapNonEmpty!8633 () Bool)

(declare-fun tp!18593 () Bool)

(declare-fun e!133511 () Bool)

(assert (=> mapNonEmpty!8633 (= mapRes!8633 (and tp!18593 e!133511))))

(declare-fun mapRest!8633 () (Array (_ BitVec 32) ValueCell!2178))

(declare-fun mapValue!8633 () ValueCell!2178)

(declare-fun mapKey!8633 () (_ BitVec 32))

(assert (=> mapNonEmpty!8633 (= (arr!4404 _values!649) (store mapRest!8633 mapKey!8633 mapValue!8633))))

(declare-fun b!204009 () Bool)

(declare-fun res!98181 () Bool)

(assert (=> b!204009 (=> (not res!98181) (not e!133512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204009 (= res!98181 (validKeyInArray!0 k0!843))))

(declare-fun b!204010 () Bool)

(assert (=> b!204010 (= e!133516 e!133514)))

(declare-fun res!98177 () Bool)

(assert (=> b!204010 (=> res!98177 e!133514)))

(assert (=> b!204010 (= res!98177 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204010 (= lt!103191 lt!103189)))

(declare-fun lt!103180 () tuple2!3892)

(assert (=> b!204010 (= lt!103189 (+!445 lt!103186 lt!103180))))

(assert (=> b!204010 (= lt!103182 lt!103185)))

(assert (=> b!204010 (= lt!103185 (+!445 lt!103181 lt!103180))))

(assert (=> b!204010 (= lt!103191 (+!445 lt!103188 lt!103180))))

(assert (=> b!204010 (= lt!103180 (tuple2!3893 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204011 () Bool)

(declare-fun e!133517 () Bool)

(assert (=> b!204011 (= e!133517 (and e!133515 mapRes!8633))))

(declare-fun condMapEmpty!8633 () Bool)

(declare-fun mapDefault!8633 () ValueCell!2178)

(assert (=> b!204011 (= condMapEmpty!8633 (= (arr!4404 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2178)) mapDefault!8633)))))

(declare-fun b!204012 () Bool)

(declare-fun res!98179 () Bool)

(assert (=> b!204012 (=> (not res!98179) (not e!133512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9305 (_ BitVec 32)) Bool)

(assert (=> b!204012 (= res!98179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204013 () Bool)

(assert (=> b!204013 (= e!133511 tp_is_empty!5043)))

(declare-fun b!204014 () Bool)

(declare-fun res!98178 () Bool)

(assert (=> b!204014 (=> (not res!98178) (not e!133512))))

(assert (=> b!204014 (= res!98178 (and (= (size!4729 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4728 _keys!825) (size!4729 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!98185 () Bool)

(assert (=> start!20528 (=> (not res!98185) (not e!133512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20528 (= res!98185 (validMask!0 mask!1149))))

(assert (=> start!20528 e!133512))

(declare-fun array_inv!2909 (array!9307) Bool)

(assert (=> start!20528 (and (array_inv!2909 _values!649) e!133517)))

(assert (=> start!20528 true))

(assert (=> start!20528 tp_is_empty!5043))

(declare-fun array_inv!2910 (array!9305) Bool)

(assert (=> start!20528 (array_inv!2910 _keys!825)))

(assert (=> start!20528 tp!18592))

(assert (= (and start!20528 res!98185) b!204014))

(assert (= (and b!204014 res!98178) b!204012))

(assert (= (and b!204012 res!98179) b!204004))

(assert (= (and b!204004 res!98183) b!204008))

(assert (= (and b!204008 res!98180) b!204009))

(assert (= (and b!204009 res!98181) b!204007))

(assert (= (and b!204007 res!98182) b!204005))

(assert (= (and b!204005 (not res!98184)) b!204010))

(assert (= (and b!204010 (not res!98177)) b!204006))

(assert (= (and b!204011 condMapEmpty!8633) mapIsEmpty!8633))

(assert (= (and b!204011 (not condMapEmpty!8633)) mapNonEmpty!8633))

(get-info :version)

(assert (= (and mapNonEmpty!8633 ((_ is ValueCellFull!2178) mapValue!8633)) b!204013))

(assert (= (and b!204011 ((_ is ValueCellFull!2178) mapDefault!8633)) b!204003))

(assert (= start!20528 b!204011))

(declare-fun m!231491 () Bool)

(assert (=> b!204005 m!231491))

(declare-fun m!231493 () Bool)

(assert (=> b!204005 m!231493))

(declare-fun m!231495 () Bool)

(assert (=> b!204005 m!231495))

(declare-fun m!231497 () Bool)

(assert (=> b!204005 m!231497))

(declare-fun m!231499 () Bool)

(assert (=> b!204005 m!231499))

(declare-fun m!231501 () Bool)

(assert (=> b!204005 m!231501))

(declare-fun m!231503 () Bool)

(assert (=> b!204005 m!231503))

(declare-fun m!231505 () Bool)

(assert (=> b!204012 m!231505))

(declare-fun m!231507 () Bool)

(assert (=> start!20528 m!231507))

(declare-fun m!231509 () Bool)

(assert (=> start!20528 m!231509))

(declare-fun m!231511 () Bool)

(assert (=> start!20528 m!231511))

(declare-fun m!231513 () Bool)

(assert (=> mapNonEmpty!8633 m!231513))

(declare-fun m!231515 () Bool)

(assert (=> b!204010 m!231515))

(declare-fun m!231517 () Bool)

(assert (=> b!204010 m!231517))

(declare-fun m!231519 () Bool)

(assert (=> b!204010 m!231519))

(declare-fun m!231521 () Bool)

(assert (=> b!204007 m!231521))

(declare-fun m!231523 () Bool)

(assert (=> b!204009 m!231523))

(declare-fun m!231525 () Bool)

(assert (=> b!204006 m!231525))

(declare-fun m!231527 () Bool)

(assert (=> b!204006 m!231527))

(declare-fun m!231529 () Bool)

(assert (=> b!204004 m!231529))

(check-sat (not b_next!5187) (not mapNonEmpty!8633) (not b!204005) (not b!204009) (not b!204006) (not b!204004) b_and!11933 (not start!20528) (not b!204010) tp_is_empty!5043 (not b!204012))
(check-sat b_and!11933 (not b_next!5187))
