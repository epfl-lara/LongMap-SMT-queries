; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39896 () Bool)

(assert start!39896)

(declare-fun b_free!10177 () Bool)

(declare-fun b_next!10177 () Bool)

(assert (=> start!39896 (= b_free!10177 (not b_next!10177))))

(declare-fun tp!36060 () Bool)

(declare-fun b_and!18027 () Bool)

(assert (=> start!39896 (= tp!36060 b_and!18027)))

(declare-fun b!432639 () Bool)

(declare-fun e!255881 () Bool)

(declare-fun e!255887 () Bool)

(assert (=> b!432639 (= e!255881 (not e!255887))))

(declare-fun res!254553 () Bool)

(assert (=> b!432639 (=> res!254553 e!255887)))

(declare-datatypes ((array!26494 0))(
  ( (array!26495 (arr!12696 (Array (_ BitVec 32) (_ BitVec 64))) (size!13048 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26494)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432639 (= res!254553 (not (validKeyInArray!0 (select (arr!12696 _keys!709) from!863))))))

(declare-datatypes ((V!16211 0))(
  ( (V!16212 (val!5709 Int)) )
))
(declare-datatypes ((tuple2!7444 0))(
  ( (tuple2!7445 (_1!3733 (_ BitVec 64)) (_2!3733 V!16211)) )
))
(declare-datatypes ((List!7437 0))(
  ( (Nil!7434) (Cons!7433 (h!8289 tuple2!7444) (t!13055 List!7437)) )
))
(declare-datatypes ((ListLongMap!6359 0))(
  ( (ListLongMap!6360 (toList!3195 List!7437)) )
))
(declare-fun lt!198517 () ListLongMap!6359)

(declare-fun lt!198507 () ListLongMap!6359)

(assert (=> b!432639 (= lt!198517 lt!198507)))

(declare-fun lt!198512 () ListLongMap!6359)

(declare-fun lt!198511 () tuple2!7444)

(declare-fun +!1402 (ListLongMap!6359 tuple2!7444) ListLongMap!6359)

(assert (=> b!432639 (= lt!198507 (+!1402 lt!198512 lt!198511))))

(declare-fun minValue!515 () V!16211)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16211)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5321 0))(
  ( (ValueCellFull!5321 (v!7957 V!16211)) (EmptyCell!5321) )
))
(declare-datatypes ((array!26496 0))(
  ( (array!26497 (arr!12697 (Array (_ BitVec 32) ValueCell!5321)) (size!13049 (_ BitVec 32))) )
))
(declare-fun lt!198513 () array!26496)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!198519 () array!26494)

(declare-fun getCurrentListMapNoExtraKeys!1434 (array!26494 array!26496 (_ BitVec 32) (_ BitVec 32) V!16211 V!16211 (_ BitVec 32) Int) ListLongMap!6359)

(assert (=> b!432639 (= lt!198517 (getCurrentListMapNoExtraKeys!1434 lt!198519 lt!198513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16211)

(assert (=> b!432639 (= lt!198511 (tuple2!7445 k0!794 v!412))))

(declare-fun _values!549 () array!26496)

(assert (=> b!432639 (= lt!198512 (getCurrentListMapNoExtraKeys!1434 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12787 0))(
  ( (Unit!12788) )
))
(declare-fun lt!198510 () Unit!12787)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!573 (array!26494 array!26496 (_ BitVec 32) (_ BitVec 32) V!16211 V!16211 (_ BitVec 32) (_ BitVec 64) V!16211 (_ BitVec 32) Int) Unit!12787)

(assert (=> b!432639 (= lt!198510 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!573 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432640 () Bool)

(declare-fun res!254558 () Bool)

(declare-fun e!255889 () Bool)

(assert (=> b!432640 (=> (not res!254558) (not e!255889))))

(assert (=> b!432640 (= res!254558 (bvsle from!863 i!563))))

(declare-fun b!432641 () Bool)

(declare-fun e!255883 () Bool)

(assert (=> b!432641 (= e!255887 e!255883)))

(declare-fun res!254550 () Bool)

(assert (=> b!432641 (=> res!254550 e!255883)))

(assert (=> b!432641 (= res!254550 (= k0!794 (select (arr!12696 _keys!709) from!863)))))

(assert (=> b!432641 (not (= (select (arr!12696 _keys!709) from!863) k0!794))))

(declare-fun lt!198505 () Unit!12787)

(declare-fun e!255880 () Unit!12787)

(assert (=> b!432641 (= lt!198505 e!255880)))

(declare-fun c!55578 () Bool)

(assert (=> b!432641 (= c!55578 (= (select (arr!12696 _keys!709) from!863) k0!794))))

(declare-fun lt!198516 () ListLongMap!6359)

(declare-fun lt!198506 () ListLongMap!6359)

(assert (=> b!432641 (= lt!198516 lt!198506)))

(declare-fun lt!198518 () tuple2!7444)

(assert (=> b!432641 (= lt!198506 (+!1402 lt!198507 lt!198518))))

(declare-fun lt!198509 () V!16211)

(assert (=> b!432641 (= lt!198518 (tuple2!7445 (select (arr!12696 _keys!709) from!863) lt!198509))))

(declare-fun get!6320 (ValueCell!5321 V!16211) V!16211)

(declare-fun dynLambda!807 (Int (_ BitVec 64)) V!16211)

(assert (=> b!432641 (= lt!198509 (get!6320 (select (arr!12697 _values!549) from!863) (dynLambda!807 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432642 () Bool)

(declare-fun res!254562 () Bool)

(declare-fun e!255886 () Bool)

(assert (=> b!432642 (=> (not res!254562) (not e!255886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26494 (_ BitVec 32)) Bool)

(assert (=> b!432642 (= res!254562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432643 () Bool)

(declare-fun res!254549 () Bool)

(assert (=> b!432643 (=> (not res!254549) (not e!255886))))

(declare-datatypes ((List!7438 0))(
  ( (Nil!7435) (Cons!7434 (h!8290 (_ BitVec 64)) (t!13056 List!7438)) )
))
(declare-fun arrayNoDuplicates!0 (array!26494 (_ BitVec 32) List!7438) Bool)

(assert (=> b!432643 (= res!254549 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7435))))

(declare-fun b!432644 () Bool)

(declare-fun e!255884 () Bool)

(declare-fun e!255888 () Bool)

(declare-fun mapRes!18615 () Bool)

(assert (=> b!432644 (= e!255884 (and e!255888 mapRes!18615))))

(declare-fun condMapEmpty!18615 () Bool)

(declare-fun mapDefault!18615 () ValueCell!5321)

(assert (=> b!432644 (= condMapEmpty!18615 (= (arr!12697 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5321)) mapDefault!18615)))))

(declare-fun b!432645 () Bool)

(declare-fun res!254548 () Bool)

(assert (=> b!432645 (=> (not res!254548) (not e!255889))))

(assert (=> b!432645 (= res!254548 (arrayNoDuplicates!0 lt!198519 #b00000000000000000000000000000000 Nil!7435))))

(declare-fun b!432646 () Bool)

(declare-fun res!254561 () Bool)

(assert (=> b!432646 (=> (not res!254561) (not e!255886))))

(assert (=> b!432646 (= res!254561 (or (= (select (arr!12696 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12696 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!254557 () Bool)

(assert (=> start!39896 (=> (not res!254557) (not e!255886))))

(assert (=> start!39896 (= res!254557 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13048 _keys!709))))))

(assert (=> start!39896 e!255886))

(declare-fun tp_is_empty!11329 () Bool)

(assert (=> start!39896 tp_is_empty!11329))

(assert (=> start!39896 tp!36060))

(assert (=> start!39896 true))

(declare-fun array_inv!9292 (array!26496) Bool)

(assert (=> start!39896 (and (array_inv!9292 _values!549) e!255884)))

(declare-fun array_inv!9293 (array!26494) Bool)

(assert (=> start!39896 (array_inv!9293 _keys!709)))

(declare-fun b!432647 () Bool)

(assert (=> b!432647 (= e!255886 e!255889)))

(declare-fun res!254556 () Bool)

(assert (=> b!432647 (=> (not res!254556) (not e!255889))))

(assert (=> b!432647 (= res!254556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198519 mask!1025))))

(assert (=> b!432647 (= lt!198519 (array!26495 (store (arr!12696 _keys!709) i!563 k0!794) (size!13048 _keys!709)))))

(declare-fun b!432648 () Bool)

(assert (=> b!432648 (= e!255888 tp_is_empty!11329)))

(declare-fun b!432649 () Bool)

(declare-fun res!254551 () Bool)

(assert (=> b!432649 (=> (not res!254551) (not e!255886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432649 (= res!254551 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18615 () Bool)

(assert (=> mapIsEmpty!18615 mapRes!18615))

(declare-fun b!432650 () Bool)

(assert (=> b!432650 (= e!255883 true)))

(assert (=> b!432650 (= lt!198506 (+!1402 (+!1402 lt!198512 lt!198518) lt!198511))))

(declare-fun lt!198508 () Unit!12787)

(declare-fun addCommutativeForDiffKeys!380 (ListLongMap!6359 (_ BitVec 64) V!16211 (_ BitVec 64) V!16211) Unit!12787)

(assert (=> b!432650 (= lt!198508 (addCommutativeForDiffKeys!380 lt!198512 k0!794 v!412 (select (arr!12696 _keys!709) from!863) lt!198509))))

(declare-fun b!432651 () Bool)

(declare-fun Unit!12789 () Unit!12787)

(assert (=> b!432651 (= e!255880 Unit!12789)))

(declare-fun lt!198514 () Unit!12787)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26494 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12787)

(assert (=> b!432651 (= lt!198514 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432651 false))

(declare-fun mapNonEmpty!18615 () Bool)

(declare-fun tp!36059 () Bool)

(declare-fun e!255885 () Bool)

(assert (=> mapNonEmpty!18615 (= mapRes!18615 (and tp!36059 e!255885))))

(declare-fun mapRest!18615 () (Array (_ BitVec 32) ValueCell!5321))

(declare-fun mapKey!18615 () (_ BitVec 32))

(declare-fun mapValue!18615 () ValueCell!5321)

(assert (=> mapNonEmpty!18615 (= (arr!12697 _values!549) (store mapRest!18615 mapKey!18615 mapValue!18615))))

(declare-fun b!432652 () Bool)

(declare-fun Unit!12790 () Unit!12787)

(assert (=> b!432652 (= e!255880 Unit!12790)))

(declare-fun b!432653 () Bool)

(declare-fun res!254554 () Bool)

(assert (=> b!432653 (=> (not res!254554) (not e!255886))))

(assert (=> b!432653 (= res!254554 (validKeyInArray!0 k0!794))))

(declare-fun b!432654 () Bool)

(assert (=> b!432654 (= e!255885 tp_is_empty!11329)))

(declare-fun b!432655 () Bool)

(declare-fun res!254559 () Bool)

(assert (=> b!432655 (=> (not res!254559) (not e!255886))))

(assert (=> b!432655 (= res!254559 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13048 _keys!709))))))

(declare-fun b!432656 () Bool)

(assert (=> b!432656 (= e!255889 e!255881)))

(declare-fun res!254552 () Bool)

(assert (=> b!432656 (=> (not res!254552) (not e!255881))))

(assert (=> b!432656 (= res!254552 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!432656 (= lt!198516 (getCurrentListMapNoExtraKeys!1434 lt!198519 lt!198513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432656 (= lt!198513 (array!26497 (store (arr!12697 _values!549) i!563 (ValueCellFull!5321 v!412)) (size!13049 _values!549)))))

(declare-fun lt!198515 () ListLongMap!6359)

(assert (=> b!432656 (= lt!198515 (getCurrentListMapNoExtraKeys!1434 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432657 () Bool)

(declare-fun res!254560 () Bool)

(assert (=> b!432657 (=> (not res!254560) (not e!255886))))

(assert (=> b!432657 (= res!254560 (and (= (size!13049 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13048 _keys!709) (size!13049 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432658 () Bool)

(declare-fun res!254555 () Bool)

(assert (=> b!432658 (=> (not res!254555) (not e!255886))))

(declare-fun arrayContainsKey!0 (array!26494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432658 (= res!254555 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39896 res!254557) b!432649))

(assert (= (and b!432649 res!254551) b!432657))

(assert (= (and b!432657 res!254560) b!432642))

(assert (= (and b!432642 res!254562) b!432643))

(assert (= (and b!432643 res!254549) b!432655))

(assert (= (and b!432655 res!254559) b!432653))

(assert (= (and b!432653 res!254554) b!432646))

(assert (= (and b!432646 res!254561) b!432658))

(assert (= (and b!432658 res!254555) b!432647))

(assert (= (and b!432647 res!254556) b!432645))

(assert (= (and b!432645 res!254548) b!432640))

(assert (= (and b!432640 res!254558) b!432656))

(assert (= (and b!432656 res!254552) b!432639))

(assert (= (and b!432639 (not res!254553)) b!432641))

(assert (= (and b!432641 c!55578) b!432651))

(assert (= (and b!432641 (not c!55578)) b!432652))

(assert (= (and b!432641 (not res!254550)) b!432650))

(assert (= (and b!432644 condMapEmpty!18615) mapIsEmpty!18615))

(assert (= (and b!432644 (not condMapEmpty!18615)) mapNonEmpty!18615))

(get-info :version)

(assert (= (and mapNonEmpty!18615 ((_ is ValueCellFull!5321) mapValue!18615)) b!432654))

(assert (= (and b!432644 ((_ is ValueCellFull!5321) mapDefault!18615)) b!432648))

(assert (= start!39896 b!432644))

(declare-fun b_lambda!9287 () Bool)

(assert (=> (not b_lambda!9287) (not b!432641)))

(declare-fun t!13054 () Bool)

(declare-fun tb!3575 () Bool)

(assert (=> (and start!39896 (= defaultEntry!557 defaultEntry!557) t!13054) tb!3575))

(declare-fun result!6685 () Bool)

(assert (=> tb!3575 (= result!6685 tp_is_empty!11329)))

(assert (=> b!432641 t!13054))

(declare-fun b_and!18029 () Bool)

(assert (= b_and!18027 (and (=> t!13054 result!6685) b_and!18029)))

(declare-fun m!420971 () Bool)

(assert (=> b!432647 m!420971))

(declare-fun m!420973 () Bool)

(assert (=> b!432647 m!420973))

(declare-fun m!420975 () Bool)

(assert (=> b!432653 m!420975))

(declare-fun m!420977 () Bool)

(assert (=> b!432650 m!420977))

(assert (=> b!432650 m!420977))

(declare-fun m!420979 () Bool)

(assert (=> b!432650 m!420979))

(declare-fun m!420981 () Bool)

(assert (=> b!432650 m!420981))

(assert (=> b!432650 m!420981))

(declare-fun m!420983 () Bool)

(assert (=> b!432650 m!420983))

(declare-fun m!420985 () Bool)

(assert (=> b!432642 m!420985))

(declare-fun m!420987 () Bool)

(assert (=> b!432649 m!420987))

(declare-fun m!420989 () Bool)

(assert (=> b!432643 m!420989))

(declare-fun m!420991 () Bool)

(assert (=> b!432646 m!420991))

(declare-fun m!420993 () Bool)

(assert (=> b!432658 m!420993))

(declare-fun m!420995 () Bool)

(assert (=> start!39896 m!420995))

(declare-fun m!420997 () Bool)

(assert (=> start!39896 m!420997))

(declare-fun m!420999 () Bool)

(assert (=> b!432645 m!420999))

(assert (=> b!432641 m!420981))

(declare-fun m!421001 () Bool)

(assert (=> b!432641 m!421001))

(declare-fun m!421003 () Bool)

(assert (=> b!432641 m!421003))

(declare-fun m!421005 () Bool)

(assert (=> b!432641 m!421005))

(assert (=> b!432641 m!421005))

(assert (=> b!432641 m!421003))

(declare-fun m!421007 () Bool)

(assert (=> b!432641 m!421007))

(declare-fun m!421009 () Bool)

(assert (=> mapNonEmpty!18615 m!421009))

(declare-fun m!421011 () Bool)

(assert (=> b!432651 m!421011))

(assert (=> b!432639 m!420981))

(declare-fun m!421013 () Bool)

(assert (=> b!432639 m!421013))

(declare-fun m!421015 () Bool)

(assert (=> b!432639 m!421015))

(assert (=> b!432639 m!420981))

(declare-fun m!421017 () Bool)

(assert (=> b!432639 m!421017))

(declare-fun m!421019 () Bool)

(assert (=> b!432639 m!421019))

(declare-fun m!421021 () Bool)

(assert (=> b!432639 m!421021))

(declare-fun m!421023 () Bool)

(assert (=> b!432656 m!421023))

(declare-fun m!421025 () Bool)

(assert (=> b!432656 m!421025))

(declare-fun m!421027 () Bool)

(assert (=> b!432656 m!421027))

(check-sat (not mapNonEmpty!18615) (not start!39896) (not b!432650) (not b!432651) (not b!432639) (not b!432658) (not b_lambda!9287) (not b!432649) (not b!432641) (not b!432647) (not b!432653) tp_is_empty!11329 (not b!432642) (not b!432643) (not b!432656) (not b!432645) (not b_next!10177) b_and!18029)
(check-sat b_and!18029 (not b_next!10177))
