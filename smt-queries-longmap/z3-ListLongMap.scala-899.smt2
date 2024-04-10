; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20492 () Bool)

(assert start!20492)

(declare-fun b_free!5151 () Bool)

(declare-fun b_next!5151 () Bool)

(assert (=> start!20492 (= b_free!5151 (not b_next!5151))))

(declare-fun tp!18485 () Bool)

(declare-fun b_and!11897 () Bool)

(assert (=> start!20492 (= tp!18485 b_and!11897)))

(declare-fun b!203355 () Bool)

(declare-fun res!97691 () Bool)

(declare-fun e!133137 () Bool)

(assert (=> b!203355 (=> (not res!97691) (not e!133137))))

(declare-datatypes ((array!9237 0))(
  ( (array!9238 (arr!4369 (Array (_ BitVec 32) (_ BitVec 64))) (size!4694 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9237)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203355 (= res!97691 (= (select (arr!4369 _keys!825) i!601) k0!843))))

(declare-fun b!203356 () Bool)

(declare-fun e!133136 () Bool)

(declare-fun tp_is_empty!5007 () Bool)

(assert (=> b!203356 (= e!133136 tp_is_empty!5007)))

(declare-fun b!203357 () Bool)

(declare-fun e!133139 () Bool)

(assert (=> b!203357 (= e!133137 (not e!133139))))

(declare-fun res!97698 () Bool)

(assert (=> b!203357 (=> res!97698 e!133139)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203357 (= res!97698 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6323 0))(
  ( (V!6324 (val!2548 Int)) )
))
(declare-datatypes ((ValueCell!2160 0))(
  ( (ValueCellFull!2160 (v!4518 V!6323)) (EmptyCell!2160) )
))
(declare-datatypes ((array!9239 0))(
  ( (array!9240 (arr!4370 (Array (_ BitVec 32) ValueCell!2160)) (size!4695 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9239)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6323)

(declare-datatypes ((tuple2!3866 0))(
  ( (tuple2!3867 (_1!1944 (_ BitVec 64)) (_2!1944 V!6323)) )
))
(declare-datatypes ((List!2768 0))(
  ( (Nil!2765) (Cons!2764 (h!3406 tuple2!3866) (t!7699 List!2768)) )
))
(declare-datatypes ((ListLongMap!2779 0))(
  ( (ListLongMap!2780 (toList!1405 List!2768)) )
))
(declare-fun lt!102539 () ListLongMap!2779)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6323)

(declare-fun getCurrentListMap!980 (array!9237 array!9239 (_ BitVec 32) (_ BitVec 32) V!6323 V!6323 (_ BitVec 32) Int) ListLongMap!2779)

(assert (=> b!203357 (= lt!102539 (getCurrentListMap!980 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102536 () ListLongMap!2779)

(declare-fun lt!102534 () array!9239)

(assert (=> b!203357 (= lt!102536 (getCurrentListMap!980 _keys!825 lt!102534 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102543 () ListLongMap!2779)

(declare-fun lt!102533 () ListLongMap!2779)

(assert (=> b!203357 (and (= lt!102543 lt!102533) (= lt!102533 lt!102543))))

(declare-fun lt!102541 () ListLongMap!2779)

(declare-fun lt!102537 () tuple2!3866)

(declare-fun +!432 (ListLongMap!2779 tuple2!3866) ListLongMap!2779)

(assert (=> b!203357 (= lt!102533 (+!432 lt!102541 lt!102537))))

(declare-fun v!520 () V!6323)

(assert (=> b!203357 (= lt!102537 (tuple2!3867 k0!843 v!520))))

(declare-datatypes ((Unit!6158 0))(
  ( (Unit!6159) )
))
(declare-fun lt!102538 () Unit!6158)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!93 (array!9237 array!9239 (_ BitVec 32) (_ BitVec 32) V!6323 V!6323 (_ BitVec 32) (_ BitVec 64) V!6323 (_ BitVec 32) Int) Unit!6158)

(assert (=> b!203357 (= lt!102538 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!93 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!354 (array!9237 array!9239 (_ BitVec 32) (_ BitVec 32) V!6323 V!6323 (_ BitVec 32) Int) ListLongMap!2779)

(assert (=> b!203357 (= lt!102543 (getCurrentListMapNoExtraKeys!354 _keys!825 lt!102534 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203357 (= lt!102534 (array!9240 (store (arr!4370 _values!649) i!601 (ValueCellFull!2160 v!520)) (size!4695 _values!649)))))

(assert (=> b!203357 (= lt!102541 (getCurrentListMapNoExtraKeys!354 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203358 () Bool)

(declare-fun e!133134 () Bool)

(assert (=> b!203358 (= e!133139 e!133134)))

(declare-fun res!97695 () Bool)

(assert (=> b!203358 (=> res!97695 e!133134)))

(assert (=> b!203358 (= res!97695 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102535 () ListLongMap!2779)

(assert (=> b!203358 (= lt!102536 lt!102535)))

(declare-fun lt!102532 () tuple2!3866)

(assert (=> b!203358 (= lt!102535 (+!432 lt!102533 lt!102532))))

(declare-fun lt!102542 () ListLongMap!2779)

(assert (=> b!203358 (= lt!102539 lt!102542)))

(assert (=> b!203358 (= lt!102542 (+!432 lt!102541 lt!102532))))

(assert (=> b!203358 (= lt!102536 (+!432 lt!102543 lt!102532))))

(assert (=> b!203358 (= lt!102532 (tuple2!3867 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203359 () Bool)

(assert (=> b!203359 (= e!133134 (bvsle #b00000000000000000000000000000000 (size!4694 _keys!825)))))

(assert (=> b!203359 (= lt!102535 (+!432 lt!102542 lt!102537))))

(declare-fun lt!102540 () Unit!6158)

(declare-fun addCommutativeForDiffKeys!146 (ListLongMap!2779 (_ BitVec 64) V!6323 (_ BitVec 64) V!6323) Unit!6158)

(assert (=> b!203359 (= lt!102540 (addCommutativeForDiffKeys!146 lt!102541 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203360 () Bool)

(declare-fun res!97697 () Bool)

(assert (=> b!203360 (=> (not res!97697) (not e!133137))))

(declare-datatypes ((List!2769 0))(
  ( (Nil!2766) (Cons!2765 (h!3407 (_ BitVec 64)) (t!7700 List!2769)) )
))
(declare-fun arrayNoDuplicates!0 (array!9237 (_ BitVec 32) List!2769) Bool)

(assert (=> b!203360 (= res!97697 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2766))))

(declare-fun res!97694 () Bool)

(assert (=> start!20492 (=> (not res!97694) (not e!133137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20492 (= res!97694 (validMask!0 mask!1149))))

(assert (=> start!20492 e!133137))

(declare-fun e!133138 () Bool)

(declare-fun array_inv!2889 (array!9239) Bool)

(assert (=> start!20492 (and (array_inv!2889 _values!649) e!133138)))

(assert (=> start!20492 true))

(assert (=> start!20492 tp_is_empty!5007))

(declare-fun array_inv!2890 (array!9237) Bool)

(assert (=> start!20492 (array_inv!2890 _keys!825)))

(assert (=> start!20492 tp!18485))

(declare-fun b!203361 () Bool)

(declare-fun res!97693 () Bool)

(assert (=> b!203361 (=> (not res!97693) (not e!133137))))

(assert (=> b!203361 (= res!97693 (and (= (size!4695 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4694 _keys!825) (size!4695 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203362 () Bool)

(declare-fun res!97696 () Bool)

(assert (=> b!203362 (=> (not res!97696) (not e!133137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9237 (_ BitVec 32)) Bool)

(assert (=> b!203362 (= res!97696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203363 () Bool)

(declare-fun e!133133 () Bool)

(declare-fun mapRes!8579 () Bool)

(assert (=> b!203363 (= e!133138 (and e!133133 mapRes!8579))))

(declare-fun condMapEmpty!8579 () Bool)

(declare-fun mapDefault!8579 () ValueCell!2160)

(assert (=> b!203363 (= condMapEmpty!8579 (= (arr!4370 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2160)) mapDefault!8579)))))

(declare-fun b!203364 () Bool)

(declare-fun res!97692 () Bool)

(assert (=> b!203364 (=> (not res!97692) (not e!133137))))

(assert (=> b!203364 (= res!97692 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4694 _keys!825))))))

(declare-fun b!203365 () Bool)

(assert (=> b!203365 (= e!133133 tp_is_empty!5007)))

(declare-fun b!203366 () Bool)

(declare-fun res!97699 () Bool)

(assert (=> b!203366 (=> (not res!97699) (not e!133137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203366 (= res!97699 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8579 () Bool)

(assert (=> mapIsEmpty!8579 mapRes!8579))

(declare-fun mapNonEmpty!8579 () Bool)

(declare-fun tp!18484 () Bool)

(assert (=> mapNonEmpty!8579 (= mapRes!8579 (and tp!18484 e!133136))))

(declare-fun mapValue!8579 () ValueCell!2160)

(declare-fun mapRest!8579 () (Array (_ BitVec 32) ValueCell!2160))

(declare-fun mapKey!8579 () (_ BitVec 32))

(assert (=> mapNonEmpty!8579 (= (arr!4370 _values!649) (store mapRest!8579 mapKey!8579 mapValue!8579))))

(assert (= (and start!20492 res!97694) b!203361))

(assert (= (and b!203361 res!97693) b!203362))

(assert (= (and b!203362 res!97696) b!203360))

(assert (= (and b!203360 res!97697) b!203364))

(assert (= (and b!203364 res!97692) b!203366))

(assert (= (and b!203366 res!97699) b!203355))

(assert (= (and b!203355 res!97691) b!203357))

(assert (= (and b!203357 (not res!97698)) b!203358))

(assert (= (and b!203358 (not res!97695)) b!203359))

(assert (= (and b!203363 condMapEmpty!8579) mapIsEmpty!8579))

(assert (= (and b!203363 (not condMapEmpty!8579)) mapNonEmpty!8579))

(get-info :version)

(assert (= (and mapNonEmpty!8579 ((_ is ValueCellFull!2160) mapValue!8579)) b!203356))

(assert (= (and b!203363 ((_ is ValueCellFull!2160) mapDefault!8579)) b!203365))

(assert (= start!20492 b!203363))

(declare-fun m!230771 () Bool)

(assert (=> b!203366 m!230771))

(declare-fun m!230773 () Bool)

(assert (=> mapNonEmpty!8579 m!230773))

(declare-fun m!230775 () Bool)

(assert (=> b!203359 m!230775))

(declare-fun m!230777 () Bool)

(assert (=> b!203359 m!230777))

(declare-fun m!230779 () Bool)

(assert (=> b!203357 m!230779))

(declare-fun m!230781 () Bool)

(assert (=> b!203357 m!230781))

(declare-fun m!230783 () Bool)

(assert (=> b!203357 m!230783))

(declare-fun m!230785 () Bool)

(assert (=> b!203357 m!230785))

(declare-fun m!230787 () Bool)

(assert (=> b!203357 m!230787))

(declare-fun m!230789 () Bool)

(assert (=> b!203357 m!230789))

(declare-fun m!230791 () Bool)

(assert (=> b!203357 m!230791))

(declare-fun m!230793 () Bool)

(assert (=> b!203358 m!230793))

(declare-fun m!230795 () Bool)

(assert (=> b!203358 m!230795))

(declare-fun m!230797 () Bool)

(assert (=> b!203358 m!230797))

(declare-fun m!230799 () Bool)

(assert (=> b!203362 m!230799))

(declare-fun m!230801 () Bool)

(assert (=> b!203360 m!230801))

(declare-fun m!230803 () Bool)

(assert (=> b!203355 m!230803))

(declare-fun m!230805 () Bool)

(assert (=> start!20492 m!230805))

(declare-fun m!230807 () Bool)

(assert (=> start!20492 m!230807))

(declare-fun m!230809 () Bool)

(assert (=> start!20492 m!230809))

(check-sat (not b!203358) (not start!20492) (not b_next!5151) (not mapNonEmpty!8579) (not b!203362) (not b!203357) (not b!203360) b_and!11897 (not b!203359) (not b!203366) tp_is_empty!5007)
(check-sat b_and!11897 (not b_next!5151))
