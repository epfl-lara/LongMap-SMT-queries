; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39764 () Bool)

(assert start!39764)

(declare-fun b_free!10045 () Bool)

(declare-fun b_next!10045 () Bool)

(assert (=> start!39764 (= b_free!10045 (not b_next!10045))))

(declare-fun tp!35664 () Bool)

(declare-fun b_and!17763 () Bool)

(assert (=> start!39764 (= tp!35664 b_and!17763)))

(declare-fun b!428617 () Bool)

(declare-fun res!251650 () Bool)

(declare-fun e!253976 () Bool)

(assert (=> b!428617 (=> (not res!251650) (not e!253976))))

(declare-datatypes ((array!26236 0))(
  ( (array!26237 (arr!12567 (Array (_ BitVec 32) (_ BitVec 64))) (size!12919 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26236)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26236 (_ BitVec 32)) Bool)

(assert (=> b!428617 (= res!251650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428618 () Bool)

(declare-datatypes ((Unit!12571 0))(
  ( (Unit!12572) )
))
(declare-fun e!253977 () Unit!12571)

(declare-fun Unit!12573 () Unit!12571)

(assert (=> b!428618 (= e!253977 Unit!12573)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!195893 () Unit!12571)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26236 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12571)

(assert (=> b!428618 (= lt!195893 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428618 false))

(declare-fun b!428619 () Bool)

(declare-fun res!251649 () Bool)

(assert (=> b!428619 (=> (not res!251649) (not e!253976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428619 (= res!251649 (validMask!0 mask!1025))))

(declare-fun b!428620 () Bool)

(declare-fun Unit!12574 () Unit!12571)

(assert (=> b!428620 (= e!253977 Unit!12574)))

(declare-fun b!428621 () Bool)

(declare-fun res!251658 () Bool)

(assert (=> b!428621 (=> (not res!251658) (not e!253976))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428621 (= res!251658 (or (= (select (arr!12567 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12567 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428622 () Bool)

(declare-fun res!251653 () Bool)

(declare-fun e!253972 () Bool)

(assert (=> b!428622 (=> (not res!251653) (not e!253972))))

(declare-fun lt!195885 () array!26236)

(declare-datatypes ((List!7326 0))(
  ( (Nil!7323) (Cons!7322 (h!8178 (_ BitVec 64)) (t!12812 List!7326)) )
))
(declare-fun arrayNoDuplicates!0 (array!26236 (_ BitVec 32) List!7326) Bool)

(assert (=> b!428622 (= res!251653 (arrayNoDuplicates!0 lt!195885 #b00000000000000000000000000000000 Nil!7323))))

(declare-fun mapNonEmpty!18417 () Bool)

(declare-fun mapRes!18417 () Bool)

(declare-fun tp!35663 () Bool)

(declare-fun e!253971 () Bool)

(assert (=> mapNonEmpty!18417 (= mapRes!18417 (and tp!35663 e!253971))))

(declare-datatypes ((V!16035 0))(
  ( (V!16036 (val!5643 Int)) )
))
(declare-datatypes ((ValueCell!5255 0))(
  ( (ValueCellFull!5255 (v!7891 V!16035)) (EmptyCell!5255) )
))
(declare-datatypes ((array!26238 0))(
  ( (array!26239 (arr!12568 (Array (_ BitVec 32) ValueCell!5255)) (size!12920 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26238)

(declare-fun mapValue!18417 () ValueCell!5255)

(declare-fun mapKey!18417 () (_ BitVec 32))

(declare-fun mapRest!18417 () (Array (_ BitVec 32) ValueCell!5255))

(assert (=> mapNonEmpty!18417 (= (arr!12568 _values!549) (store mapRest!18417 mapKey!18417 mapValue!18417))))

(declare-fun b!428623 () Bool)

(declare-fun res!251651 () Bool)

(assert (=> b!428623 (=> (not res!251651) (not e!253976))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!428623 (= res!251651 (and (= (size!12920 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12919 _keys!709) (size!12920 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428624 () Bool)

(declare-fun e!253973 () Bool)

(declare-fun tp_is_empty!11197 () Bool)

(assert (=> b!428624 (= e!253973 tp_is_empty!11197)))

(declare-fun b!428625 () Bool)

(declare-fun e!253974 () Bool)

(assert (=> b!428625 (= e!253972 e!253974)))

(declare-fun res!251654 () Bool)

(assert (=> b!428625 (=> (not res!251654) (not e!253974))))

(assert (=> b!428625 (= res!251654 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16035)

(declare-fun zeroValue!515 () V!16035)

(declare-fun lt!195891 () array!26238)

(declare-datatypes ((tuple2!7324 0))(
  ( (tuple2!7325 (_1!3673 (_ BitVec 64)) (_2!3673 V!16035)) )
))
(declare-datatypes ((List!7327 0))(
  ( (Nil!7324) (Cons!7323 (h!8179 tuple2!7324) (t!12813 List!7327)) )
))
(declare-datatypes ((ListLongMap!6239 0))(
  ( (ListLongMap!6240 (toList!3135 List!7327)) )
))
(declare-fun lt!195886 () ListLongMap!6239)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1380 (array!26236 array!26238 (_ BitVec 32) (_ BitVec 32) V!16035 V!16035 (_ BitVec 32) Int) ListLongMap!6239)

(assert (=> b!428625 (= lt!195886 (getCurrentListMapNoExtraKeys!1380 lt!195885 lt!195891 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16035)

(assert (=> b!428625 (= lt!195891 (array!26239 (store (arr!12568 _values!549) i!563 (ValueCellFull!5255 v!412)) (size!12920 _values!549)))))

(declare-fun lt!195888 () ListLongMap!6239)

(assert (=> b!428625 (= lt!195888 (getCurrentListMapNoExtraKeys!1380 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428627 () Bool)

(declare-fun res!251655 () Bool)

(assert (=> b!428627 (=> (not res!251655) (not e!253976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428627 (= res!251655 (validKeyInArray!0 k0!794))))

(declare-fun b!428628 () Bool)

(declare-fun res!251656 () Bool)

(assert (=> b!428628 (=> (not res!251656) (not e!253976))))

(declare-fun arrayContainsKey!0 (array!26236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428628 (= res!251656 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18417 () Bool)

(assert (=> mapIsEmpty!18417 mapRes!18417))

(declare-fun b!428629 () Bool)

(declare-fun res!251661 () Bool)

(assert (=> b!428629 (=> (not res!251661) (not e!253972))))

(assert (=> b!428629 (= res!251661 (bvsle from!863 i!563))))

(declare-fun b!428630 () Bool)

(assert (=> b!428630 (= e!253971 tp_is_empty!11197)))

(declare-fun b!428631 () Bool)

(assert (=> b!428631 (= e!253976 e!253972)))

(declare-fun res!251659 () Bool)

(assert (=> b!428631 (=> (not res!251659) (not e!253972))))

(assert (=> b!428631 (= res!251659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195885 mask!1025))))

(assert (=> b!428631 (= lt!195885 (array!26237 (store (arr!12567 _keys!709) i!563 k0!794) (size!12919 _keys!709)))))

(declare-fun b!428632 () Bool)

(declare-fun res!251660 () Bool)

(assert (=> b!428632 (=> (not res!251660) (not e!253976))))

(assert (=> b!428632 (= res!251660 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12919 _keys!709))))))

(declare-fun b!428633 () Bool)

(declare-fun e!253975 () Bool)

(assert (=> b!428633 (= e!253974 (not e!253975))))

(declare-fun res!251657 () Bool)

(assert (=> b!428633 (=> res!251657 e!253975)))

(assert (=> b!428633 (= res!251657 (not (validKeyInArray!0 (select (arr!12567 _keys!709) from!863))))))

(declare-fun lt!195894 () ListLongMap!6239)

(declare-fun lt!195889 () ListLongMap!6239)

(assert (=> b!428633 (= lt!195894 lt!195889)))

(declare-fun lt!195887 () ListLongMap!6239)

(declare-fun +!1347 (ListLongMap!6239 tuple2!7324) ListLongMap!6239)

(assert (=> b!428633 (= lt!195889 (+!1347 lt!195887 (tuple2!7325 k0!794 v!412)))))

(assert (=> b!428633 (= lt!195894 (getCurrentListMapNoExtraKeys!1380 lt!195885 lt!195891 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428633 (= lt!195887 (getCurrentListMapNoExtraKeys!1380 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195890 () Unit!12571)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!529 (array!26236 array!26238 (_ BitVec 32) (_ BitVec 32) V!16035 V!16035 (_ BitVec 32) (_ BitVec 64) V!16035 (_ BitVec 32) Int) Unit!12571)

(assert (=> b!428633 (= lt!195890 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!529 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428634 () Bool)

(declare-fun e!253970 () Bool)

(assert (=> b!428634 (= e!253970 (and e!253973 mapRes!18417))))

(declare-fun condMapEmpty!18417 () Bool)

(declare-fun mapDefault!18417 () ValueCell!5255)

(assert (=> b!428634 (= condMapEmpty!18417 (= (arr!12568 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5255)) mapDefault!18417)))))

(declare-fun b!428635 () Bool)

(declare-fun res!251652 () Bool)

(assert (=> b!428635 (=> (not res!251652) (not e!253976))))

(assert (=> b!428635 (= res!251652 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7323))))

(declare-fun res!251648 () Bool)

(assert (=> start!39764 (=> (not res!251648) (not e!253976))))

(assert (=> start!39764 (= res!251648 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12919 _keys!709))))))

(assert (=> start!39764 e!253976))

(assert (=> start!39764 tp_is_empty!11197))

(assert (=> start!39764 tp!35664))

(assert (=> start!39764 true))

(declare-fun array_inv!9220 (array!26238) Bool)

(assert (=> start!39764 (and (array_inv!9220 _values!549) e!253970)))

(declare-fun array_inv!9221 (array!26236) Bool)

(assert (=> start!39764 (array_inv!9221 _keys!709)))

(declare-fun b!428626 () Bool)

(assert (=> b!428626 (= e!253975 true)))

(assert (=> b!428626 (not (= (select (arr!12567 _keys!709) from!863) k0!794))))

(declare-fun lt!195892 () Unit!12571)

(assert (=> b!428626 (= lt!195892 e!253977)))

(declare-fun c!55380 () Bool)

(assert (=> b!428626 (= c!55380 (= (select (arr!12567 _keys!709) from!863) k0!794))))

(declare-fun get!6231 (ValueCell!5255 V!16035) V!16035)

(declare-fun dynLambda!762 (Int (_ BitVec 64)) V!16035)

(assert (=> b!428626 (= lt!195886 (+!1347 lt!195889 (tuple2!7325 (select (arr!12567 _keys!709) from!863) (get!6231 (select (arr!12568 _values!549) from!863) (dynLambda!762 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!39764 res!251648) b!428619))

(assert (= (and b!428619 res!251649) b!428623))

(assert (= (and b!428623 res!251651) b!428617))

(assert (= (and b!428617 res!251650) b!428635))

(assert (= (and b!428635 res!251652) b!428632))

(assert (= (and b!428632 res!251660) b!428627))

(assert (= (and b!428627 res!251655) b!428621))

(assert (= (and b!428621 res!251658) b!428628))

(assert (= (and b!428628 res!251656) b!428631))

(assert (= (and b!428631 res!251659) b!428622))

(assert (= (and b!428622 res!251653) b!428629))

(assert (= (and b!428629 res!251661) b!428625))

(assert (= (and b!428625 res!251654) b!428633))

(assert (= (and b!428633 (not res!251657)) b!428626))

(assert (= (and b!428626 c!55380) b!428618))

(assert (= (and b!428626 (not c!55380)) b!428620))

(assert (= (and b!428634 condMapEmpty!18417) mapIsEmpty!18417))

(assert (= (and b!428634 (not condMapEmpty!18417)) mapNonEmpty!18417))

(get-info :version)

(assert (= (and mapNonEmpty!18417 ((_ is ValueCellFull!5255) mapValue!18417)) b!428630))

(assert (= (and b!428634 ((_ is ValueCellFull!5255) mapDefault!18417)) b!428624))

(assert (= start!39764 b!428634))

(declare-fun b_lambda!9155 () Bool)

(assert (=> (not b_lambda!9155) (not b!428626)))

(declare-fun t!12811 () Bool)

(declare-fun tb!3443 () Bool)

(assert (=> (and start!39764 (= defaultEntry!557 defaultEntry!557) t!12811) tb!3443))

(declare-fun result!6421 () Bool)

(assert (=> tb!3443 (= result!6421 tp_is_empty!11197)))

(assert (=> b!428626 t!12811))

(declare-fun b_and!17765 () Bool)

(assert (= b_and!17763 (and (=> t!12811 result!6421) b_and!17765)))

(declare-fun m!417287 () Bool)

(assert (=> b!428635 m!417287))

(declare-fun m!417289 () Bool)

(assert (=> b!428633 m!417289))

(declare-fun m!417291 () Bool)

(assert (=> b!428633 m!417291))

(declare-fun m!417293 () Bool)

(assert (=> b!428633 m!417293))

(declare-fun m!417295 () Bool)

(assert (=> b!428633 m!417295))

(assert (=> b!428633 m!417289))

(declare-fun m!417297 () Bool)

(assert (=> b!428633 m!417297))

(declare-fun m!417299 () Bool)

(assert (=> b!428633 m!417299))

(declare-fun m!417301 () Bool)

(assert (=> b!428618 m!417301))

(declare-fun m!417303 () Bool)

(assert (=> start!39764 m!417303))

(declare-fun m!417305 () Bool)

(assert (=> start!39764 m!417305))

(declare-fun m!417307 () Bool)

(assert (=> b!428617 m!417307))

(declare-fun m!417309 () Bool)

(assert (=> b!428628 m!417309))

(declare-fun m!417311 () Bool)

(assert (=> b!428622 m!417311))

(declare-fun m!417313 () Bool)

(assert (=> mapNonEmpty!18417 m!417313))

(declare-fun m!417315 () Bool)

(assert (=> b!428621 m!417315))

(assert (=> b!428626 m!417289))

(declare-fun m!417317 () Bool)

(assert (=> b!428626 m!417317))

(declare-fun m!417319 () Bool)

(assert (=> b!428626 m!417319))

(declare-fun m!417321 () Bool)

(assert (=> b!428626 m!417321))

(assert (=> b!428626 m!417321))

(assert (=> b!428626 m!417319))

(declare-fun m!417323 () Bool)

(assert (=> b!428626 m!417323))

(declare-fun m!417325 () Bool)

(assert (=> b!428619 m!417325))

(declare-fun m!417327 () Bool)

(assert (=> b!428627 m!417327))

(declare-fun m!417329 () Bool)

(assert (=> b!428625 m!417329))

(declare-fun m!417331 () Bool)

(assert (=> b!428625 m!417331))

(declare-fun m!417333 () Bool)

(assert (=> b!428625 m!417333))

(declare-fun m!417335 () Bool)

(assert (=> b!428631 m!417335))

(declare-fun m!417337 () Bool)

(assert (=> b!428631 m!417337))

(check-sat (not mapNonEmpty!18417) (not b!428625) (not b!428628) (not b!428619) (not b!428622) (not start!39764) (not b!428633) (not b_lambda!9155) (not b!428617) tp_is_empty!11197 (not b!428618) b_and!17765 (not b!428626) (not b_next!10045) (not b!428631) (not b!428635) (not b!428627))
(check-sat b_and!17765 (not b_next!10045))
