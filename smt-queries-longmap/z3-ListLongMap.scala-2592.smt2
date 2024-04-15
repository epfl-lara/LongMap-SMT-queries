; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39356 () Bool)

(assert start!39356)

(declare-fun b_free!9637 () Bool)

(declare-fun b_next!9637 () Bool)

(assert (=> start!39356 (= b_free!9637 (not b_next!9637))))

(declare-fun tp!34440 () Bool)

(declare-fun b_and!17123 () Bool)

(assert (=> start!39356 (= tp!34440 b_and!17123)))

(declare-datatypes ((array!25419 0))(
  ( (array!25420 (arr!12159 (Array (_ BitVec 32) (_ BitVec 64))) (size!12512 (_ BitVec 32))) )
))
(declare-fun lt!191357 () array!25419)

(declare-datatypes ((V!15491 0))(
  ( (V!15492 (val!5439 Int)) )
))
(declare-fun minValue!515 () V!15491)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5051 0))(
  ( (ValueCellFull!5051 (v!7680 V!15491)) (EmptyCell!5051) )
))
(declare-datatypes ((array!25421 0))(
  ( (array!25422 (arr!12160 (Array (_ BitVec 32) ValueCell!5051)) (size!12513 (_ BitVec 32))) )
))
(declare-fun lt!191350 () array!25421)

(declare-fun _values!549 () array!25421)

(declare-fun zeroValue!515 () V!15491)

(declare-datatypes ((tuple2!7092 0))(
  ( (tuple2!7093 (_1!3557 (_ BitVec 64)) (_2!3557 V!15491)) )
))
(declare-datatypes ((List!7091 0))(
  ( (Nil!7088) (Cons!7087 (h!7943 tuple2!7092) (t!12384 List!7091)) )
))
(declare-datatypes ((ListLongMap!5995 0))(
  ( (ListLongMap!5996 (toList!3013 List!7091)) )
))
(declare-fun call!29065 () ListLongMap!5995)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25419)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!29061 () Bool)

(declare-fun c!55098 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1224 (array!25419 array!25421 (_ BitVec 32) (_ BitVec 32) V!15491 V!15491 (_ BitVec 32) Int) ListLongMap!5995)

(assert (=> bm!29061 (= call!29065 (getCurrentListMapNoExtraKeys!1224 (ite c!55098 lt!191357 _keys!709) (ite c!55098 lt!191350 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417808 () Bool)

(declare-fun res!243442 () Bool)

(declare-fun e!249183 () Bool)

(assert (=> b!417808 (=> (not res!243442) (not e!249183))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417808 (= res!243442 (validKeyInArray!0 k0!794))))

(declare-fun b!417809 () Bool)

(declare-fun res!243440 () Bool)

(assert (=> b!417809 (=> (not res!243440) (not e!249183))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417809 (= res!243440 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12512 _keys!709))))))

(declare-fun b!417810 () Bool)

(declare-fun e!249179 () Bool)

(assert (=> b!417810 (= e!249179 true)))

(declare-fun lt!191360 () V!15491)

(declare-fun lt!191359 () tuple2!7092)

(declare-fun lt!191355 () ListLongMap!5995)

(declare-fun +!1242 (ListLongMap!5995 tuple2!7092) ListLongMap!5995)

(assert (=> b!417810 (= (+!1242 lt!191355 lt!191359) (+!1242 (+!1242 lt!191355 (tuple2!7093 k0!794 lt!191360)) lt!191359))))

(declare-fun lt!191358 () V!15491)

(assert (=> b!417810 (= lt!191359 (tuple2!7093 k0!794 lt!191358))))

(declare-datatypes ((Unit!12324 0))(
  ( (Unit!12325) )
))
(declare-fun lt!191356 () Unit!12324)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!29 (ListLongMap!5995 (_ BitVec 64) V!15491 V!15491) Unit!12324)

(assert (=> b!417810 (= lt!191356 (addSameAsAddTwiceSameKeyDiffValues!29 lt!191355 k0!794 lt!191360 lt!191358))))

(declare-fun lt!191353 () V!15491)

(declare-fun get!6016 (ValueCell!5051 V!15491) V!15491)

(assert (=> b!417810 (= lt!191360 (get!6016 (select (arr!12160 _values!549) from!863) lt!191353))))

(declare-fun lt!191352 () ListLongMap!5995)

(assert (=> b!417810 (= lt!191352 (+!1242 lt!191355 (tuple2!7093 (select (arr!12159 lt!191357) from!863) lt!191358)))))

(declare-fun v!412 () V!15491)

(assert (=> b!417810 (= lt!191358 (get!6016 (select (store (arr!12160 _values!549) i!563 (ValueCellFull!5051 v!412)) from!863) lt!191353))))

(declare-fun dynLambda!686 (Int (_ BitVec 64)) V!15491)

(assert (=> b!417810 (= lt!191353 (dynLambda!686 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417810 (= lt!191355 (getCurrentListMapNoExtraKeys!1224 lt!191357 lt!191350 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417811 () Bool)

(declare-fun res!243433 () Bool)

(assert (=> b!417811 (=> (not res!243433) (not e!249183))))

(assert (=> b!417811 (= res!243433 (and (= (size!12513 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12512 _keys!709) (size!12513 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417812 () Bool)

(declare-fun res!243438 () Bool)

(assert (=> b!417812 (=> (not res!243438) (not e!249183))))

(declare-fun arrayContainsKey!0 (array!25419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417812 (= res!243438 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417813 () Bool)

(declare-fun res!243435 () Bool)

(assert (=> b!417813 (=> (not res!243435) (not e!249183))))

(assert (=> b!417813 (= res!243435 (or (= (select (arr!12159 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12159 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29062 () Bool)

(declare-fun call!29064 () ListLongMap!5995)

(assert (=> bm!29062 (= call!29064 (getCurrentListMapNoExtraKeys!1224 (ite c!55098 _keys!709 lt!191357) (ite c!55098 _values!549 lt!191350) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17805 () Bool)

(declare-fun mapRes!17805 () Bool)

(assert (=> mapIsEmpty!17805 mapRes!17805))

(declare-fun b!417815 () Bool)

(declare-fun e!249180 () Bool)

(declare-fun tp_is_empty!10789 () Bool)

(assert (=> b!417815 (= e!249180 tp_is_empty!10789)))

(declare-fun b!417816 () Bool)

(declare-fun res!243439 () Bool)

(declare-fun e!249177 () Bool)

(assert (=> b!417816 (=> (not res!243439) (not e!249177))))

(declare-datatypes ((List!7092 0))(
  ( (Nil!7089) (Cons!7088 (h!7944 (_ BitVec 64)) (t!12385 List!7092)) )
))
(declare-fun arrayNoDuplicates!0 (array!25419 (_ BitVec 32) List!7092) Bool)

(assert (=> b!417816 (= res!243439 (arrayNoDuplicates!0 lt!191357 #b00000000000000000000000000000000 Nil!7089))))

(declare-fun b!417817 () Bool)

(assert (=> b!417817 (= e!249183 e!249177)))

(declare-fun res!243437 () Bool)

(assert (=> b!417817 (=> (not res!243437) (not e!249177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25419 (_ BitVec 32)) Bool)

(assert (=> b!417817 (= res!243437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191357 mask!1025))))

(assert (=> b!417817 (= lt!191357 (array!25420 (store (arr!12159 _keys!709) i!563 k0!794) (size!12512 _keys!709)))))

(declare-fun b!417818 () Bool)

(declare-fun e!249175 () Bool)

(declare-fun e!249181 () Bool)

(assert (=> b!417818 (= e!249175 (and e!249181 mapRes!17805))))

(declare-fun condMapEmpty!17805 () Bool)

(declare-fun mapDefault!17805 () ValueCell!5051)

(assert (=> b!417818 (= condMapEmpty!17805 (= (arr!12160 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5051)) mapDefault!17805)))))

(declare-fun mapNonEmpty!17805 () Bool)

(declare-fun tp!34439 () Bool)

(assert (=> mapNonEmpty!17805 (= mapRes!17805 (and tp!34439 e!249180))))

(declare-fun mapRest!17805 () (Array (_ BitVec 32) ValueCell!5051))

(declare-fun mapValue!17805 () ValueCell!5051)

(declare-fun mapKey!17805 () (_ BitVec 32))

(assert (=> mapNonEmpty!17805 (= (arr!12160 _values!549) (store mapRest!17805 mapKey!17805 mapValue!17805))))

(declare-fun b!417819 () Bool)

(declare-fun res!243436 () Bool)

(assert (=> b!417819 (=> (not res!243436) (not e!249183))))

(assert (=> b!417819 (= res!243436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417820 () Bool)

(declare-fun res!243441 () Bool)

(assert (=> b!417820 (=> (not res!243441) (not e!249177))))

(assert (=> b!417820 (= res!243441 (bvsle from!863 i!563))))

(declare-fun b!417821 () Bool)

(declare-fun res!243444 () Bool)

(assert (=> b!417821 (=> (not res!243444) (not e!249183))))

(assert (=> b!417821 (= res!243444 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7089))))

(declare-fun b!417822 () Bool)

(declare-fun e!249176 () Bool)

(assert (=> b!417822 (= e!249176 (= call!29065 (+!1242 call!29064 (tuple2!7093 k0!794 v!412))))))

(declare-fun b!417814 () Bool)

(declare-fun e!249182 () Bool)

(assert (=> b!417814 (= e!249182 (not e!249179))))

(declare-fun res!243434 () Bool)

(assert (=> b!417814 (=> res!243434 e!249179)))

(assert (=> b!417814 (= res!243434 (validKeyInArray!0 (select (arr!12159 _keys!709) from!863)))))

(assert (=> b!417814 e!249176))

(assert (=> b!417814 (= c!55098 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191354 () Unit!12324)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!418 (array!25419 array!25421 (_ BitVec 32) (_ BitVec 32) V!15491 V!15491 (_ BitVec 32) (_ BitVec 64) V!15491 (_ BitVec 32) Int) Unit!12324)

(assert (=> b!417814 (= lt!191354 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!418 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!243431 () Bool)

(assert (=> start!39356 (=> (not res!243431) (not e!249183))))

(assert (=> start!39356 (= res!243431 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12512 _keys!709))))))

(assert (=> start!39356 e!249183))

(assert (=> start!39356 tp_is_empty!10789))

(assert (=> start!39356 tp!34440))

(assert (=> start!39356 true))

(declare-fun array_inv!8910 (array!25421) Bool)

(assert (=> start!39356 (and (array_inv!8910 _values!549) e!249175)))

(declare-fun array_inv!8911 (array!25419) Bool)

(assert (=> start!39356 (array_inv!8911 _keys!709)))

(declare-fun b!417823 () Bool)

(assert (=> b!417823 (= e!249177 e!249182)))

(declare-fun res!243443 () Bool)

(assert (=> b!417823 (=> (not res!243443) (not e!249182))))

(assert (=> b!417823 (= res!243443 (= from!863 i!563))))

(assert (=> b!417823 (= lt!191352 (getCurrentListMapNoExtraKeys!1224 lt!191357 lt!191350 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417823 (= lt!191350 (array!25422 (store (arr!12160 _values!549) i!563 (ValueCellFull!5051 v!412)) (size!12513 _values!549)))))

(declare-fun lt!191351 () ListLongMap!5995)

(assert (=> b!417823 (= lt!191351 (getCurrentListMapNoExtraKeys!1224 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417824 () Bool)

(assert (=> b!417824 (= e!249181 tp_is_empty!10789)))

(declare-fun b!417825 () Bool)

(declare-fun res!243432 () Bool)

(assert (=> b!417825 (=> (not res!243432) (not e!249183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417825 (= res!243432 (validMask!0 mask!1025))))

(declare-fun b!417826 () Bool)

(assert (=> b!417826 (= e!249176 (= call!29064 call!29065))))

(assert (= (and start!39356 res!243431) b!417825))

(assert (= (and b!417825 res!243432) b!417811))

(assert (= (and b!417811 res!243433) b!417819))

(assert (= (and b!417819 res!243436) b!417821))

(assert (= (and b!417821 res!243444) b!417809))

(assert (= (and b!417809 res!243440) b!417808))

(assert (= (and b!417808 res!243442) b!417813))

(assert (= (and b!417813 res!243435) b!417812))

(assert (= (and b!417812 res!243438) b!417817))

(assert (= (and b!417817 res!243437) b!417816))

(assert (= (and b!417816 res!243439) b!417820))

(assert (= (and b!417820 res!243441) b!417823))

(assert (= (and b!417823 res!243443) b!417814))

(assert (= (and b!417814 c!55098) b!417822))

(assert (= (and b!417814 (not c!55098)) b!417826))

(assert (= (or b!417822 b!417826) bm!29061))

(assert (= (or b!417822 b!417826) bm!29062))

(assert (= (and b!417814 (not res!243434)) b!417810))

(assert (= (and b!417818 condMapEmpty!17805) mapIsEmpty!17805))

(assert (= (and b!417818 (not condMapEmpty!17805)) mapNonEmpty!17805))

(get-info :version)

(assert (= (and mapNonEmpty!17805 ((_ is ValueCellFull!5051) mapValue!17805)) b!417815))

(assert (= (and b!417818 ((_ is ValueCellFull!5051) mapDefault!17805)) b!417824))

(assert (= start!39356 b!417818))

(declare-fun b_lambda!8923 () Bool)

(assert (=> (not b_lambda!8923) (not b!417810)))

(declare-fun t!12383 () Bool)

(declare-fun tb!3251 () Bool)

(assert (=> (and start!39356 (= defaultEntry!557 defaultEntry!557) t!12383) tb!3251))

(declare-fun result!6037 () Bool)

(assert (=> tb!3251 (= result!6037 tp_is_empty!10789)))

(assert (=> b!417810 t!12383))

(declare-fun b_and!17125 () Bool)

(assert (= b_and!17123 (and (=> t!12383 result!6037) b_and!17125)))

(declare-fun m!406695 () Bool)

(assert (=> b!417812 m!406695))

(declare-fun m!406697 () Bool)

(assert (=> b!417816 m!406697))

(declare-fun m!406699 () Bool)

(assert (=> mapNonEmpty!17805 m!406699))

(declare-fun m!406701 () Bool)

(assert (=> b!417823 m!406701))

(declare-fun m!406703 () Bool)

(assert (=> b!417823 m!406703))

(declare-fun m!406705 () Bool)

(assert (=> b!417823 m!406705))

(declare-fun m!406707 () Bool)

(assert (=> b!417810 m!406707))

(declare-fun m!406709 () Bool)

(assert (=> b!417810 m!406709))

(declare-fun m!406711 () Bool)

(assert (=> b!417810 m!406711))

(declare-fun m!406713 () Bool)

(assert (=> b!417810 m!406713))

(declare-fun m!406715 () Bool)

(assert (=> b!417810 m!406715))

(assert (=> b!417810 m!406707))

(declare-fun m!406717 () Bool)

(assert (=> b!417810 m!406717))

(declare-fun m!406719 () Bool)

(assert (=> b!417810 m!406719))

(declare-fun m!406721 () Bool)

(assert (=> b!417810 m!406721))

(declare-fun m!406723 () Bool)

(assert (=> b!417810 m!406723))

(assert (=> b!417810 m!406713))

(assert (=> b!417810 m!406703))

(declare-fun m!406725 () Bool)

(assert (=> b!417810 m!406725))

(declare-fun m!406727 () Bool)

(assert (=> b!417810 m!406727))

(declare-fun m!406729 () Bool)

(assert (=> b!417810 m!406729))

(assert (=> b!417810 m!406727))

(declare-fun m!406731 () Bool)

(assert (=> b!417821 m!406731))

(declare-fun m!406733 () Bool)

(assert (=> b!417819 m!406733))

(declare-fun m!406735 () Bool)

(assert (=> bm!29062 m!406735))

(declare-fun m!406737 () Bool)

(assert (=> b!417822 m!406737))

(declare-fun m!406739 () Bool)

(assert (=> b!417825 m!406739))

(declare-fun m!406741 () Bool)

(assert (=> bm!29061 m!406741))

(declare-fun m!406743 () Bool)

(assert (=> b!417808 m!406743))

(declare-fun m!406745 () Bool)

(assert (=> b!417817 m!406745))

(declare-fun m!406747 () Bool)

(assert (=> b!417817 m!406747))

(declare-fun m!406749 () Bool)

(assert (=> b!417813 m!406749))

(declare-fun m!406751 () Bool)

(assert (=> b!417814 m!406751))

(assert (=> b!417814 m!406751))

(declare-fun m!406753 () Bool)

(assert (=> b!417814 m!406753))

(declare-fun m!406755 () Bool)

(assert (=> b!417814 m!406755))

(declare-fun m!406757 () Bool)

(assert (=> start!39356 m!406757))

(declare-fun m!406759 () Bool)

(assert (=> start!39356 m!406759))

(check-sat (not b!417808) (not b!417812) (not b!417814) (not b!417825) b_and!17125 (not b!417821) (not start!39356) (not b!417816) (not b_next!9637) (not b!417817) tp_is_empty!10789 (not b_lambda!8923) (not b!417819) (not mapNonEmpty!17805) (not b!417823) (not b!417822) (not b!417810) (not bm!29062) (not bm!29061))
(check-sat b_and!17125 (not b_next!9637))
