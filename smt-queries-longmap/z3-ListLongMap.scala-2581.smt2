; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39290 () Bool)

(assert start!39290)

(declare-fun b_free!9571 () Bool)

(declare-fun b_next!9571 () Bool)

(assert (=> start!39290 (= b_free!9571 (not b_next!9571))))

(declare-fun tp!34241 () Bool)

(declare-fun b_and!16991 () Bool)

(assert (=> start!39290 (= tp!34241 b_and!16991)))

(declare-fun b!415861 () Bool)

(declare-fun res!242050 () Bool)

(declare-fun e!248292 () Bool)

(assert (=> b!415861 (=> (not res!242050) (not e!248292))))

(declare-datatypes ((array!25291 0))(
  ( (array!25292 (arr!12095 (Array (_ BitVec 32) (_ BitVec 64))) (size!12448 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25291)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415861 (= res!242050 (or (= (select (arr!12095 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12095 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!242045 () Bool)

(assert (=> start!39290 (=> (not res!242045) (not e!248292))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39290 (= res!242045 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12448 _keys!709))))))

(assert (=> start!39290 e!248292))

(declare-fun tp_is_empty!10723 () Bool)

(assert (=> start!39290 tp_is_empty!10723))

(assert (=> start!39290 tp!34241))

(assert (=> start!39290 true))

(declare-datatypes ((V!15403 0))(
  ( (V!15404 (val!5406 Int)) )
))
(declare-datatypes ((ValueCell!5018 0))(
  ( (ValueCellFull!5018 (v!7647 V!15403)) (EmptyCell!5018) )
))
(declare-datatypes ((array!25293 0))(
  ( (array!25294 (arr!12096 (Array (_ BitVec 32) ValueCell!5018)) (size!12449 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25293)

(declare-fun e!248286 () Bool)

(declare-fun array_inv!8862 (array!25293) Bool)

(assert (=> start!39290 (and (array_inv!8862 _values!549) e!248286)))

(declare-fun array_inv!8863 (array!25291) Bool)

(assert (=> start!39290 (array_inv!8863 _keys!709)))

(declare-fun b!415862 () Bool)

(declare-fun e!248288 () Bool)

(declare-fun e!248289 () Bool)

(assert (=> b!415862 (= e!248288 e!248289)))

(declare-fun res!242057 () Bool)

(assert (=> b!415862 (=> (not res!242057) (not e!248289))))

(assert (=> b!415862 (= res!242057 (= from!863 i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7030 0))(
  ( (tuple2!7031 (_1!3526 (_ BitVec 64)) (_2!3526 V!15403)) )
))
(declare-datatypes ((List!7036 0))(
  ( (Nil!7033) (Cons!7032 (h!7888 tuple2!7030) (t!12263 List!7036)) )
))
(declare-datatypes ((ListLongMap!5933 0))(
  ( (ListLongMap!5934 (toList!2982 List!7036)) )
))
(declare-fun lt!190264 () ListLongMap!5933)

(declare-fun lt!190270 () array!25293)

(declare-fun zeroValue!515 () V!15403)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15403)

(declare-fun lt!190263 () array!25291)

(declare-fun getCurrentListMapNoExtraKeys!1193 (array!25291 array!25293 (_ BitVec 32) (_ BitVec 32) V!15403 V!15403 (_ BitVec 32) Int) ListLongMap!5933)

(assert (=> b!415862 (= lt!190264 (getCurrentListMapNoExtraKeys!1193 lt!190263 lt!190270 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15403)

(assert (=> b!415862 (= lt!190270 (array!25294 (store (arr!12096 _values!549) i!563 (ValueCellFull!5018 v!412)) (size!12449 _values!549)))))

(declare-fun lt!190265 () ListLongMap!5933)

(assert (=> b!415862 (= lt!190265 (getCurrentListMapNoExtraKeys!1193 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415863 () Bool)

(declare-fun e!248285 () Bool)

(assert (=> b!415863 (= e!248285 true)))

(declare-fun lt!190268 () V!15403)

(declare-fun lt!190271 () ListLongMap!5933)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!190261 () tuple2!7030)

(declare-fun +!1213 (ListLongMap!5933 tuple2!7030) ListLongMap!5933)

(assert (=> b!415863 (= (+!1213 lt!190271 lt!190261) (+!1213 (+!1213 lt!190271 (tuple2!7031 k0!794 lt!190268)) lt!190261))))

(declare-fun lt!190267 () V!15403)

(assert (=> b!415863 (= lt!190261 (tuple2!7031 k0!794 lt!190267))))

(declare-datatypes ((Unit!12266 0))(
  ( (Unit!12267) )
))
(declare-fun lt!190269 () Unit!12266)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!3 (ListLongMap!5933 (_ BitVec 64) V!15403 V!15403) Unit!12266)

(assert (=> b!415863 (= lt!190269 (addSameAsAddTwiceSameKeyDiffValues!3 lt!190271 k0!794 lt!190268 lt!190267))))

(declare-fun lt!190266 () V!15403)

(declare-fun get!5968 (ValueCell!5018 V!15403) V!15403)

(assert (=> b!415863 (= lt!190268 (get!5968 (select (arr!12096 _values!549) from!863) lt!190266))))

(assert (=> b!415863 (= lt!190264 (+!1213 lt!190271 (tuple2!7031 (select (arr!12095 lt!190263) from!863) lt!190267)))))

(assert (=> b!415863 (= lt!190267 (get!5968 (select (store (arr!12096 _values!549) i!563 (ValueCellFull!5018 v!412)) from!863) lt!190266))))

(declare-fun dynLambda!660 (Int (_ BitVec 64)) V!15403)

(assert (=> b!415863 (= lt!190266 (dynLambda!660 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!415863 (= lt!190271 (getCurrentListMapNoExtraKeys!1193 lt!190263 lt!190270 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415864 () Bool)

(declare-fun res!242055 () Bool)

(assert (=> b!415864 (=> (not res!242055) (not e!248288))))

(declare-datatypes ((List!7037 0))(
  ( (Nil!7034) (Cons!7033 (h!7889 (_ BitVec 64)) (t!12264 List!7037)) )
))
(declare-fun arrayNoDuplicates!0 (array!25291 (_ BitVec 32) List!7037) Bool)

(assert (=> b!415864 (= res!242055 (arrayNoDuplicates!0 lt!190263 #b00000000000000000000000000000000 Nil!7034))))

(declare-fun b!415865 () Bool)

(declare-fun res!242058 () Bool)

(assert (=> b!415865 (=> (not res!242058) (not e!248292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25291 (_ BitVec 32)) Bool)

(assert (=> b!415865 (= res!242058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415866 () Bool)

(declare-fun res!242053 () Bool)

(assert (=> b!415866 (=> (not res!242053) (not e!248292))))

(declare-fun arrayContainsKey!0 (array!25291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415866 (= res!242053 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17706 () Bool)

(declare-fun mapRes!17706 () Bool)

(assert (=> mapIsEmpty!17706 mapRes!17706))

(declare-fun b!415867 () Bool)

(declare-fun res!242046 () Bool)

(assert (=> b!415867 (=> (not res!242046) (not e!248292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415867 (= res!242046 (validKeyInArray!0 k0!794))))

(declare-fun b!415868 () Bool)

(declare-fun e!248287 () Bool)

(assert (=> b!415868 (= e!248286 (and e!248287 mapRes!17706))))

(declare-fun condMapEmpty!17706 () Bool)

(declare-fun mapDefault!17706 () ValueCell!5018)

(assert (=> b!415868 (= condMapEmpty!17706 (= (arr!12096 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5018)) mapDefault!17706)))))

(declare-fun b!415869 () Bool)

(assert (=> b!415869 (= e!248287 tp_is_empty!10723)))

(declare-fun b!415870 () Bool)

(declare-fun res!242047 () Bool)

(assert (=> b!415870 (=> (not res!242047) (not e!248288))))

(assert (=> b!415870 (= res!242047 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17706 () Bool)

(declare-fun tp!34242 () Bool)

(declare-fun e!248290 () Bool)

(assert (=> mapNonEmpty!17706 (= mapRes!17706 (and tp!34242 e!248290))))

(declare-fun mapValue!17706 () ValueCell!5018)

(declare-fun mapKey!17706 () (_ BitVec 32))

(declare-fun mapRest!17706 () (Array (_ BitVec 32) ValueCell!5018))

(assert (=> mapNonEmpty!17706 (= (arr!12096 _values!549) (store mapRest!17706 mapKey!17706 mapValue!17706))))

(declare-fun b!415871 () Bool)

(assert (=> b!415871 (= e!248289 (not e!248285))))

(declare-fun res!242052 () Bool)

(assert (=> b!415871 (=> res!242052 e!248285)))

(assert (=> b!415871 (= res!242052 (validKeyInArray!0 (select (arr!12095 _keys!709) from!863)))))

(declare-fun e!248291 () Bool)

(assert (=> b!415871 e!248291))

(declare-fun c!54999 () Bool)

(assert (=> b!415871 (= c!54999 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190262 () Unit!12266)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!395 (array!25291 array!25293 (_ BitVec 32) (_ BitVec 32) V!15403 V!15403 (_ BitVec 32) (_ BitVec 64) V!15403 (_ BitVec 32) Int) Unit!12266)

(assert (=> b!415871 (= lt!190262 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!395 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415872 () Bool)

(declare-fun res!242049 () Bool)

(assert (=> b!415872 (=> (not res!242049) (not e!248292))))

(assert (=> b!415872 (= res!242049 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7034))))

(declare-fun b!415873 () Bool)

(declare-fun res!242048 () Bool)

(assert (=> b!415873 (=> (not res!242048) (not e!248292))))

(assert (=> b!415873 (= res!242048 (and (= (size!12449 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12448 _keys!709) (size!12449 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun call!28867 () ListLongMap!5933)

(declare-fun bm!28863 () Bool)

(assert (=> bm!28863 (= call!28867 (getCurrentListMapNoExtraKeys!1193 (ite c!54999 lt!190263 _keys!709) (ite c!54999 lt!190270 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415874 () Bool)

(assert (=> b!415874 (= e!248292 e!248288)))

(declare-fun res!242051 () Bool)

(assert (=> b!415874 (=> (not res!242051) (not e!248288))))

(assert (=> b!415874 (= res!242051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190263 mask!1025))))

(assert (=> b!415874 (= lt!190263 (array!25292 (store (arr!12095 _keys!709) i!563 k0!794) (size!12448 _keys!709)))))

(declare-fun b!415875 () Bool)

(declare-fun res!242054 () Bool)

(assert (=> b!415875 (=> (not res!242054) (not e!248292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415875 (= res!242054 (validMask!0 mask!1025))))

(declare-fun b!415876 () Bool)

(declare-fun call!28866 () ListLongMap!5933)

(assert (=> b!415876 (= e!248291 (= call!28866 call!28867))))

(declare-fun b!415877 () Bool)

(declare-fun res!242056 () Bool)

(assert (=> b!415877 (=> (not res!242056) (not e!248292))))

(assert (=> b!415877 (= res!242056 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12448 _keys!709))))))

(declare-fun b!415878 () Bool)

(assert (=> b!415878 (= e!248291 (= call!28867 (+!1213 call!28866 (tuple2!7031 k0!794 v!412))))))

(declare-fun b!415879 () Bool)

(assert (=> b!415879 (= e!248290 tp_is_empty!10723)))

(declare-fun bm!28864 () Bool)

(assert (=> bm!28864 (= call!28866 (getCurrentListMapNoExtraKeys!1193 (ite c!54999 _keys!709 lt!190263) (ite c!54999 _values!549 lt!190270) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39290 res!242045) b!415875))

(assert (= (and b!415875 res!242054) b!415873))

(assert (= (and b!415873 res!242048) b!415865))

(assert (= (and b!415865 res!242058) b!415872))

(assert (= (and b!415872 res!242049) b!415877))

(assert (= (and b!415877 res!242056) b!415867))

(assert (= (and b!415867 res!242046) b!415861))

(assert (= (and b!415861 res!242050) b!415866))

(assert (= (and b!415866 res!242053) b!415874))

(assert (= (and b!415874 res!242051) b!415864))

(assert (= (and b!415864 res!242055) b!415870))

(assert (= (and b!415870 res!242047) b!415862))

(assert (= (and b!415862 res!242057) b!415871))

(assert (= (and b!415871 c!54999) b!415878))

(assert (= (and b!415871 (not c!54999)) b!415876))

(assert (= (or b!415878 b!415876) bm!28863))

(assert (= (or b!415878 b!415876) bm!28864))

(assert (= (and b!415871 (not res!242052)) b!415863))

(assert (= (and b!415868 condMapEmpty!17706) mapIsEmpty!17706))

(assert (= (and b!415868 (not condMapEmpty!17706)) mapNonEmpty!17706))

(get-info :version)

(assert (= (and mapNonEmpty!17706 ((_ is ValueCellFull!5018) mapValue!17706)) b!415879))

(assert (= (and b!415868 ((_ is ValueCellFull!5018) mapDefault!17706)) b!415869))

(assert (= start!39290 b!415868))

(declare-fun b_lambda!8857 () Bool)

(assert (=> (not b_lambda!8857) (not b!415863)))

(declare-fun t!12262 () Bool)

(declare-fun tb!3185 () Bool)

(assert (=> (and start!39290 (= defaultEntry!557 defaultEntry!557) t!12262) tb!3185))

(declare-fun result!5905 () Bool)

(assert (=> tb!3185 (= result!5905 tp_is_empty!10723)))

(assert (=> b!415863 t!12262))

(declare-fun b_and!16993 () Bool)

(assert (= b_and!16991 (and (=> t!12262 result!5905) b_and!16993)))

(declare-fun m!404519 () Bool)

(assert (=> b!415862 m!404519))

(declare-fun m!404521 () Bool)

(assert (=> b!415862 m!404521))

(declare-fun m!404523 () Bool)

(assert (=> b!415862 m!404523))

(declare-fun m!404525 () Bool)

(assert (=> b!415875 m!404525))

(declare-fun m!404527 () Bool)

(assert (=> b!415874 m!404527))

(declare-fun m!404529 () Bool)

(assert (=> b!415874 m!404529))

(declare-fun m!404531 () Bool)

(assert (=> mapNonEmpty!17706 m!404531))

(declare-fun m!404533 () Bool)

(assert (=> b!415871 m!404533))

(assert (=> b!415871 m!404533))

(declare-fun m!404535 () Bool)

(assert (=> b!415871 m!404535))

(declare-fun m!404537 () Bool)

(assert (=> b!415871 m!404537))

(declare-fun m!404539 () Bool)

(assert (=> bm!28863 m!404539))

(declare-fun m!404541 () Bool)

(assert (=> b!415867 m!404541))

(declare-fun m!404543 () Bool)

(assert (=> b!415866 m!404543))

(declare-fun m!404545 () Bool)

(assert (=> b!415878 m!404545))

(declare-fun m!404547 () Bool)

(assert (=> start!39290 m!404547))

(declare-fun m!404549 () Bool)

(assert (=> start!39290 m!404549))

(declare-fun m!404551 () Bool)

(assert (=> b!415863 m!404551))

(declare-fun m!404553 () Bool)

(assert (=> b!415863 m!404553))

(declare-fun m!404555 () Bool)

(assert (=> b!415863 m!404555))

(declare-fun m!404557 () Bool)

(assert (=> b!415863 m!404557))

(declare-fun m!404559 () Bool)

(assert (=> b!415863 m!404559))

(assert (=> b!415863 m!404555))

(declare-fun m!404561 () Bool)

(assert (=> b!415863 m!404561))

(declare-fun m!404563 () Bool)

(assert (=> b!415863 m!404563))

(declare-fun m!404565 () Bool)

(assert (=> b!415863 m!404565))

(declare-fun m!404567 () Bool)

(assert (=> b!415863 m!404567))

(assert (=> b!415863 m!404521))

(declare-fun m!404569 () Bool)

(assert (=> b!415863 m!404569))

(assert (=> b!415863 m!404563))

(declare-fun m!404571 () Bool)

(assert (=> b!415863 m!404571))

(declare-fun m!404573 () Bool)

(assert (=> b!415863 m!404573))

(assert (=> b!415863 m!404565))

(declare-fun m!404575 () Bool)

(assert (=> b!415865 m!404575))

(declare-fun m!404577 () Bool)

(assert (=> b!415864 m!404577))

(declare-fun m!404579 () Bool)

(assert (=> b!415861 m!404579))

(declare-fun m!404581 () Bool)

(assert (=> b!415872 m!404581))

(declare-fun m!404583 () Bool)

(assert (=> bm!28864 m!404583))

(check-sat (not b!415862) (not start!39290) (not b!415864) (not b!415867) (not b!415863) (not mapNonEmpty!17706) (not bm!28864) (not bm!28863) (not b!415865) (not b!415866) (not b!415878) (not b!415874) (not b!415871) (not b!415872) b_and!16993 (not b_lambda!8857) (not b!415875) tp_is_empty!10723 (not b_next!9571))
(check-sat b_and!16993 (not b_next!9571))
