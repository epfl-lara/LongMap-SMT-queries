; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39104 () Bool)

(assert start!39104)

(declare-fun b_free!9385 () Bool)

(declare-fun b_next!9385 () Bool)

(assert (=> start!39104 (= b_free!9385 (not b_next!9385))))

(declare-fun tp!33684 () Bool)

(declare-fun b_and!16745 () Bool)

(assert (=> start!39104 (= tp!33684 b_and!16745)))

(declare-fun b!410996 () Bool)

(declare-fun res!238434 () Bool)

(declare-fun e!246168 () Bool)

(assert (=> b!410996 (=> (not res!238434) (not e!246168))))

(declare-datatypes ((array!24929 0))(
  ( (array!24930 (arr!11914 (Array (_ BitVec 32) (_ BitVec 64))) (size!12267 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24929)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410996 (= res!238434 (or (= (select (arr!11914 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11914 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410997 () Bool)

(declare-fun res!238433 () Bool)

(declare-fun e!246164 () Bool)

(assert (=> b!410997 (=> (not res!238433) (not e!246164))))

(declare-fun lt!189014 () array!24929)

(declare-datatypes ((List!6892 0))(
  ( (Nil!6889) (Cons!6888 (h!7744 (_ BitVec 64)) (t!12057 List!6892)) )
))
(declare-fun arrayNoDuplicates!0 (array!24929 (_ BitVec 32) List!6892) Bool)

(assert (=> b!410997 (= res!238433 (arrayNoDuplicates!0 lt!189014 #b00000000000000000000000000000000 Nil!6889))))

(declare-fun b!410998 () Bool)

(declare-fun res!238424 () Bool)

(assert (=> b!410998 (=> (not res!238424) (not e!246164))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!410998 (= res!238424 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17427 () Bool)

(declare-fun mapRes!17427 () Bool)

(declare-fun tp!33683 () Bool)

(declare-fun e!246165 () Bool)

(assert (=> mapNonEmpty!17427 (= mapRes!17427 (and tp!33683 e!246165))))

(declare-datatypes ((V!15155 0))(
  ( (V!15156 (val!5313 Int)) )
))
(declare-datatypes ((ValueCell!4925 0))(
  ( (ValueCellFull!4925 (v!7554 V!15155)) (EmptyCell!4925) )
))
(declare-fun mapRest!17427 () (Array (_ BitVec 32) ValueCell!4925))

(declare-fun mapValue!17427 () ValueCell!4925)

(declare-datatypes ((array!24931 0))(
  ( (array!24932 (arr!11915 (Array (_ BitVec 32) ValueCell!4925)) (size!12268 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24931)

(declare-fun mapKey!17427 () (_ BitVec 32))

(assert (=> mapNonEmpty!17427 (= (arr!11915 _values!549) (store mapRest!17427 mapKey!17427 mapValue!17427))))

(declare-fun b!410999 () Bool)

(declare-fun tp_is_empty!10537 () Bool)

(assert (=> b!410999 (= e!246165 tp_is_empty!10537)))

(declare-fun b!411001 () Bool)

(declare-fun res!238430 () Bool)

(assert (=> b!411001 (=> (not res!238430) (not e!246168))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411001 (= res!238430 (validMask!0 mask!1025))))

(declare-fun b!411002 () Bool)

(declare-fun e!246167 () Bool)

(declare-fun e!246166 () Bool)

(assert (=> b!411002 (= e!246167 (and e!246166 mapRes!17427))))

(declare-fun condMapEmpty!17427 () Bool)

(declare-fun mapDefault!17427 () ValueCell!4925)

(assert (=> b!411002 (= condMapEmpty!17427 (= (arr!11915 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4925)) mapDefault!17427)))))

(declare-fun b!411003 () Bool)

(declare-fun res!238428 () Bool)

(assert (=> b!411003 (=> (not res!238428) (not e!246168))))

(assert (=> b!411003 (= res!238428 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6889))))

(declare-fun b!411004 () Bool)

(declare-fun res!238427 () Bool)

(assert (=> b!411004 (=> (not res!238427) (not e!246168))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!411004 (= res!238427 (and (= (size!12268 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12267 _keys!709) (size!12268 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411005 () Bool)

(assert (=> b!411005 (= e!246164 false)))

(declare-fun minValue!515 () V!15155)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15155)

(declare-fun v!412 () V!15155)

(declare-datatypes ((tuple2!6880 0))(
  ( (tuple2!6881 (_1!3451 (_ BitVec 64)) (_2!3451 V!15155)) )
))
(declare-datatypes ((List!6893 0))(
  ( (Nil!6890) (Cons!6889 (h!7745 tuple2!6880) (t!12058 List!6893)) )
))
(declare-datatypes ((ListLongMap!5783 0))(
  ( (ListLongMap!5784 (toList!2907 List!6893)) )
))
(declare-fun lt!189013 () ListLongMap!5783)

(declare-fun getCurrentListMapNoExtraKeys!1121 (array!24929 array!24931 (_ BitVec 32) (_ BitVec 32) V!15155 V!15155 (_ BitVec 32) Int) ListLongMap!5783)

(assert (=> b!411005 (= lt!189013 (getCurrentListMapNoExtraKeys!1121 lt!189014 (array!24932 (store (arr!11915 _values!549) i!563 (ValueCellFull!4925 v!412)) (size!12268 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189012 () ListLongMap!5783)

(assert (=> b!411005 (= lt!189012 (getCurrentListMapNoExtraKeys!1121 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!238432 () Bool)

(assert (=> start!39104 (=> (not res!238432) (not e!246168))))

(assert (=> start!39104 (= res!238432 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12267 _keys!709))))))

(assert (=> start!39104 e!246168))

(assert (=> start!39104 tp_is_empty!10537))

(assert (=> start!39104 tp!33684))

(assert (=> start!39104 true))

(declare-fun array_inv!8742 (array!24931) Bool)

(assert (=> start!39104 (and (array_inv!8742 _values!549) e!246167)))

(declare-fun array_inv!8743 (array!24929) Bool)

(assert (=> start!39104 (array_inv!8743 _keys!709)))

(declare-fun b!411000 () Bool)

(declare-fun res!238426 () Bool)

(assert (=> b!411000 (=> (not res!238426) (not e!246168))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411000 (= res!238426 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411006 () Bool)

(assert (=> b!411006 (= e!246166 tp_is_empty!10537)))

(declare-fun b!411007 () Bool)

(assert (=> b!411007 (= e!246168 e!246164)))

(declare-fun res!238431 () Bool)

(assert (=> b!411007 (=> (not res!238431) (not e!246164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24929 (_ BitVec 32)) Bool)

(assert (=> b!411007 (= res!238431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189014 mask!1025))))

(assert (=> b!411007 (= lt!189014 (array!24930 (store (arr!11914 _keys!709) i!563 k0!794) (size!12267 _keys!709)))))

(declare-fun b!411008 () Bool)

(declare-fun res!238423 () Bool)

(assert (=> b!411008 (=> (not res!238423) (not e!246168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411008 (= res!238423 (validKeyInArray!0 k0!794))))

(declare-fun b!411009 () Bool)

(declare-fun res!238429 () Bool)

(assert (=> b!411009 (=> (not res!238429) (not e!246168))))

(assert (=> b!411009 (= res!238429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411010 () Bool)

(declare-fun res!238425 () Bool)

(assert (=> b!411010 (=> (not res!238425) (not e!246168))))

(assert (=> b!411010 (= res!238425 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12267 _keys!709))))))

(declare-fun mapIsEmpty!17427 () Bool)

(assert (=> mapIsEmpty!17427 mapRes!17427))

(assert (= (and start!39104 res!238432) b!411001))

(assert (= (and b!411001 res!238430) b!411004))

(assert (= (and b!411004 res!238427) b!411009))

(assert (= (and b!411009 res!238429) b!411003))

(assert (= (and b!411003 res!238428) b!411010))

(assert (= (and b!411010 res!238425) b!411008))

(assert (= (and b!411008 res!238423) b!410996))

(assert (= (and b!410996 res!238434) b!411000))

(assert (= (and b!411000 res!238426) b!411007))

(assert (= (and b!411007 res!238431) b!410997))

(assert (= (and b!410997 res!238433) b!410998))

(assert (= (and b!410998 res!238424) b!411005))

(assert (= (and b!411002 condMapEmpty!17427) mapIsEmpty!17427))

(assert (= (and b!411002 (not condMapEmpty!17427)) mapNonEmpty!17427))

(get-info :version)

(assert (= (and mapNonEmpty!17427 ((_ is ValueCellFull!4925) mapValue!17427)) b!410999))

(assert (= (and b!411002 ((_ is ValueCellFull!4925) mapDefault!17427)) b!411006))

(assert (= start!39104 b!411002))

(declare-fun m!400749 () Bool)

(assert (=> b!411008 m!400749))

(declare-fun m!400751 () Bool)

(assert (=> b!410996 m!400751))

(declare-fun m!400753 () Bool)

(assert (=> b!411001 m!400753))

(declare-fun m!400755 () Bool)

(assert (=> b!411007 m!400755))

(declare-fun m!400757 () Bool)

(assert (=> b!411007 m!400757))

(declare-fun m!400759 () Bool)

(assert (=> start!39104 m!400759))

(declare-fun m!400761 () Bool)

(assert (=> start!39104 m!400761))

(declare-fun m!400763 () Bool)

(assert (=> b!411003 m!400763))

(declare-fun m!400765 () Bool)

(assert (=> b!411009 m!400765))

(declare-fun m!400767 () Bool)

(assert (=> mapNonEmpty!17427 m!400767))

(declare-fun m!400769 () Bool)

(assert (=> b!411000 m!400769))

(declare-fun m!400771 () Bool)

(assert (=> b!411005 m!400771))

(declare-fun m!400773 () Bool)

(assert (=> b!411005 m!400773))

(declare-fun m!400775 () Bool)

(assert (=> b!411005 m!400775))

(declare-fun m!400777 () Bool)

(assert (=> b!410997 m!400777))

(check-sat (not mapNonEmpty!17427) (not b!411003) (not b!411000) (not b!411009) (not b!411008) (not b_next!9385) tp_is_empty!10537 (not b!411007) b_and!16745 (not start!39104) (not b!411001) (not b!410997) (not b!411005))
(check-sat b_and!16745 (not b_next!9385))
