; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84450 () Bool)

(assert start!84450)

(declare-fun b_free!20001 () Bool)

(declare-fun b_next!20001 () Bool)

(assert (=> start!84450 (= b_free!20001 (not b_next!20001))))

(declare-fun tp!69783 () Bool)

(declare-fun b_and!32069 () Bool)

(assert (=> start!84450 (= tp!69783 b_and!32069)))

(declare-fun b!987735 () Bool)

(declare-fun e!556964 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((V!35939 0))(
  ( (V!35940 (val!11659 Int)) )
))
(declare-datatypes ((ValueCell!11127 0))(
  ( (ValueCellFull!11127 (v!14223 V!35939)) (EmptyCell!11127) )
))
(declare-datatypes ((array!62393 0))(
  ( (array!62394 (arr!30052 (Array (_ BitVec 32) ValueCell!11127)) (size!30531 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62393)

(assert (=> b!987735 (= e!556964 (bvslt from!1932 (size!30531 _values!1278)))))

(declare-datatypes ((tuple2!14854 0))(
  ( (tuple2!14855 (_1!7438 (_ BitVec 64)) (_2!7438 V!35939)) )
))
(declare-datatypes ((List!20785 0))(
  ( (Nil!20782) (Cons!20781 (h!21943 tuple2!14854) (t!29714 List!20785)) )
))
(declare-datatypes ((ListLongMap!13551 0))(
  ( (ListLongMap!13552 (toList!6791 List!20785)) )
))
(declare-fun lt!437976 () ListLongMap!13551)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35939)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35939)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((array!62395 0))(
  ( (array!62396 (arr!30053 (Array (_ BitVec 32) (_ BitVec 64))) (size!30532 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62395)

(declare-fun getCurrentListMap!3858 (array!62395 array!62393 (_ BitVec 32) (_ BitVec 32) V!35939 V!35939 (_ BitVec 32) Int) ListLongMap!13551)

(assert (=> b!987735 (= lt!437976 (getCurrentListMap!3858 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!437974 () ListLongMap!13551)

(declare-fun lt!437972 () ListLongMap!13551)

(declare-fun lt!437981 () tuple2!14854)

(declare-fun lt!437978 () tuple2!14854)

(declare-fun +!3076 (ListLongMap!13551 tuple2!14854) ListLongMap!13551)

(assert (=> b!987735 (= lt!437974 (+!3076 (+!3076 lt!437972 lt!437978) lt!437981))))

(declare-fun lt!437980 () V!35939)

(declare-datatypes ((Unit!32785 0))(
  ( (Unit!32786) )
))
(declare-fun lt!437975 () Unit!32785)

(declare-fun addCommutativeForDiffKeys!700 (ListLongMap!13551 (_ BitVec 64) V!35939 (_ BitVec 64) V!35939) Unit!32785)

(assert (=> b!987735 (= lt!437975 (addCommutativeForDiffKeys!700 lt!437972 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30053 _keys!1544) from!1932) lt!437980))))

(declare-fun b!987736 () Bool)

(declare-fun res!660771 () Bool)

(declare-fun e!556961 () Bool)

(assert (=> b!987736 (=> (not res!660771) (not e!556961))))

(assert (=> b!987736 (= res!660771 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30532 _keys!1544))))))

(declare-fun b!987737 () Bool)

(declare-fun e!556962 () Bool)

(declare-fun tp_is_empty!23217 () Bool)

(assert (=> b!987737 (= e!556962 tp_is_empty!23217)))

(declare-fun b!987738 () Bool)

(declare-fun res!660778 () Bool)

(assert (=> b!987738 (=> (not res!660778) (not e!556961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62395 (_ BitVec 32)) Bool)

(assert (=> b!987738 (= res!660778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36860 () Bool)

(declare-fun mapRes!36860 () Bool)

(assert (=> mapIsEmpty!36860 mapRes!36860))

(declare-fun mapNonEmpty!36860 () Bool)

(declare-fun tp!69784 () Bool)

(assert (=> mapNonEmpty!36860 (= mapRes!36860 (and tp!69784 e!556962))))

(declare-fun mapRest!36860 () (Array (_ BitVec 32) ValueCell!11127))

(declare-fun mapValue!36860 () ValueCell!11127)

(declare-fun mapKey!36860 () (_ BitVec 32))

(assert (=> mapNonEmpty!36860 (= (arr!30052 _values!1278) (store mapRest!36860 mapKey!36860 mapValue!36860))))

(declare-fun b!987739 () Bool)

(declare-fun e!556966 () Bool)

(declare-fun e!556963 () Bool)

(assert (=> b!987739 (= e!556966 (and e!556963 mapRes!36860))))

(declare-fun condMapEmpty!36860 () Bool)

(declare-fun mapDefault!36860 () ValueCell!11127)

(assert (=> b!987739 (= condMapEmpty!36860 (= (arr!30052 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11127)) mapDefault!36860)))))

(declare-fun b!987740 () Bool)

(declare-fun res!660772 () Bool)

(assert (=> b!987740 (=> (not res!660772) (not e!556961))))

(assert (=> b!987740 (= res!660772 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987741 () Bool)

(declare-fun res!660773 () Bool)

(assert (=> b!987741 (=> (not res!660773) (not e!556961))))

(declare-datatypes ((List!20786 0))(
  ( (Nil!20783) (Cons!20782 (h!21944 (_ BitVec 64)) (t!29715 List!20786)) )
))
(declare-fun arrayNoDuplicates!0 (array!62395 (_ BitVec 32) List!20786) Bool)

(assert (=> b!987741 (= res!660773 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20783))))

(declare-fun res!660775 () Bool)

(assert (=> start!84450 (=> (not res!660775) (not e!556961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84450 (= res!660775 (validMask!0 mask!1948))))

(assert (=> start!84450 e!556961))

(assert (=> start!84450 true))

(assert (=> start!84450 tp_is_empty!23217))

(declare-fun array_inv!23221 (array!62393) Bool)

(assert (=> start!84450 (and (array_inv!23221 _values!1278) e!556966)))

(assert (=> start!84450 tp!69783))

(declare-fun array_inv!23222 (array!62395) Bool)

(assert (=> start!84450 (array_inv!23222 _keys!1544)))

(declare-fun b!987742 () Bool)

(declare-fun res!660776 () Bool)

(assert (=> b!987742 (=> (not res!660776) (not e!556961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987742 (= res!660776 (validKeyInArray!0 (select (arr!30053 _keys!1544) from!1932)))))

(declare-fun b!987743 () Bool)

(assert (=> b!987743 (= e!556963 tp_is_empty!23217)))

(declare-fun b!987744 () Bool)

(declare-fun res!660774 () Bool)

(assert (=> b!987744 (=> (not res!660774) (not e!556961))))

(assert (=> b!987744 (= res!660774 (and (= (size!30531 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30532 _keys!1544) (size!30531 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987745 () Bool)

(assert (=> b!987745 (= e!556961 (not e!556964))))

(declare-fun res!660777 () Bool)

(assert (=> b!987745 (=> res!660777 e!556964)))

(assert (=> b!987745 (= res!660777 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30053 _keys!1544) from!1932)))))

(declare-fun lt!437973 () tuple2!14854)

(declare-fun lt!437982 () ListLongMap!13551)

(assert (=> b!987745 (= (+!3076 lt!437982 lt!437978) (+!3076 lt!437974 lt!437973))))

(declare-fun lt!437977 () ListLongMap!13551)

(assert (=> b!987745 (= lt!437974 (+!3076 lt!437977 lt!437978))))

(assert (=> b!987745 (= lt!437978 (tuple2!14855 (select (arr!30053 _keys!1544) from!1932) lt!437980))))

(assert (=> b!987745 (= lt!437982 (+!3076 lt!437977 lt!437973))))

(assert (=> b!987745 (= lt!437973 (tuple2!14855 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!437979 () Unit!32785)

(assert (=> b!987745 (= lt!437979 (addCommutativeForDiffKeys!700 lt!437977 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30053 _keys!1544) from!1932) lt!437980))))

(declare-fun get!15594 (ValueCell!11127 V!35939) V!35939)

(declare-fun dynLambda!1859 (Int (_ BitVec 64)) V!35939)

(assert (=> b!987745 (= lt!437980 (get!15594 (select (arr!30052 _values!1278) from!1932) (dynLambda!1859 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987745 (= lt!437977 (+!3076 lt!437972 lt!437981))))

(assert (=> b!987745 (= lt!437981 (tuple2!14855 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3482 (array!62395 array!62393 (_ BitVec 32) (_ BitVec 32) V!35939 V!35939 (_ BitVec 32) Int) ListLongMap!13551)

(assert (=> b!987745 (= lt!437972 (getCurrentListMapNoExtraKeys!3482 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84450 res!660775) b!987744))

(assert (= (and b!987744 res!660774) b!987738))

(assert (= (and b!987738 res!660778) b!987741))

(assert (= (and b!987741 res!660773) b!987736))

(assert (= (and b!987736 res!660771) b!987742))

(assert (= (and b!987742 res!660776) b!987740))

(assert (= (and b!987740 res!660772) b!987745))

(assert (= (and b!987745 (not res!660777)) b!987735))

(assert (= (and b!987739 condMapEmpty!36860) mapIsEmpty!36860))

(assert (= (and b!987739 (not condMapEmpty!36860)) mapNonEmpty!36860))

(get-info :version)

(assert (= (and mapNonEmpty!36860 ((_ is ValueCellFull!11127) mapValue!36860)) b!987737))

(assert (= (and b!987739 ((_ is ValueCellFull!11127) mapDefault!36860)) b!987743))

(assert (= start!84450 b!987739))

(declare-fun b_lambda!15033 () Bool)

(assert (=> (not b_lambda!15033) (not b!987745)))

(declare-fun t!29713 () Bool)

(declare-fun tb!6779 () Bool)

(assert (=> (and start!84450 (= defaultEntry!1281 defaultEntry!1281) t!29713) tb!6779))

(declare-fun result!13551 () Bool)

(assert (=> tb!6779 (= result!13551 tp_is_empty!23217)))

(assert (=> b!987745 t!29713))

(declare-fun b_and!32071 () Bool)

(assert (= b_and!32069 (and (=> t!29713 result!13551) b_and!32071)))

(declare-fun m!914403 () Bool)

(assert (=> mapNonEmpty!36860 m!914403))

(declare-fun m!914405 () Bool)

(assert (=> b!987738 m!914405))

(declare-fun m!914407 () Bool)

(assert (=> b!987745 m!914407))

(declare-fun m!914409 () Bool)

(assert (=> b!987745 m!914409))

(declare-fun m!914411 () Bool)

(assert (=> b!987745 m!914411))

(declare-fun m!914413 () Bool)

(assert (=> b!987745 m!914413))

(declare-fun m!914415 () Bool)

(assert (=> b!987745 m!914415))

(assert (=> b!987745 m!914409))

(declare-fun m!914417 () Bool)

(assert (=> b!987745 m!914417))

(declare-fun m!914419 () Bool)

(assert (=> b!987745 m!914419))

(declare-fun m!914421 () Bool)

(assert (=> b!987745 m!914421))

(declare-fun m!914423 () Bool)

(assert (=> b!987745 m!914423))

(declare-fun m!914425 () Bool)

(assert (=> b!987745 m!914425))

(assert (=> b!987745 m!914411))

(assert (=> b!987745 m!914425))

(declare-fun m!914427 () Bool)

(assert (=> b!987745 m!914427))

(assert (=> b!987742 m!914409))

(assert (=> b!987742 m!914409))

(declare-fun m!914429 () Bool)

(assert (=> b!987742 m!914429))

(declare-fun m!914431 () Bool)

(assert (=> start!84450 m!914431))

(declare-fun m!914433 () Bool)

(assert (=> start!84450 m!914433))

(declare-fun m!914435 () Bool)

(assert (=> start!84450 m!914435))

(assert (=> b!987735 m!914409))

(declare-fun m!914437 () Bool)

(assert (=> b!987735 m!914437))

(assert (=> b!987735 m!914409))

(declare-fun m!914439 () Bool)

(assert (=> b!987735 m!914439))

(declare-fun m!914441 () Bool)

(assert (=> b!987735 m!914441))

(assert (=> b!987735 m!914437))

(declare-fun m!914443 () Bool)

(assert (=> b!987735 m!914443))

(declare-fun m!914445 () Bool)

(assert (=> b!987741 m!914445))

(check-sat (not b!987742) (not b_next!20001) (not b!987738) (not b!987745) (not b!987741) tp_is_empty!23217 b_and!32071 (not b!987735) (not mapNonEmpty!36860) (not start!84450) (not b_lambda!15033))
(check-sat b_and!32071 (not b_next!20001))
