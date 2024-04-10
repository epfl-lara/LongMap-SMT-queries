; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84444 () Bool)

(assert start!84444)

(declare-fun b_free!19995 () Bool)

(declare-fun b_next!19995 () Bool)

(assert (=> start!84444 (= b_free!19995 (not b_next!19995))))

(declare-fun tp!69765 () Bool)

(declare-fun b_and!32057 () Bool)

(assert (=> start!84444 (= tp!69765 b_and!32057)))

(declare-fun b!987630 () Bool)

(declare-fun res!660699 () Bool)

(declare-fun e!556908 () Bool)

(assert (=> b!987630 (=> (not res!660699) (not e!556908))))

(declare-datatypes ((array!62381 0))(
  ( (array!62382 (arr!30046 (Array (_ BitVec 32) (_ BitVec 64))) (size!30525 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62381)

(declare-datatypes ((List!20779 0))(
  ( (Nil!20776) (Cons!20775 (h!21937 (_ BitVec 64)) (t!29702 List!20779)) )
))
(declare-fun arrayNoDuplicates!0 (array!62381 (_ BitVec 32) List!20779) Bool)

(assert (=> b!987630 (= res!660699 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20776))))

(declare-fun b!987631 () Bool)

(declare-fun e!556911 () Bool)

(declare-fun tp_is_empty!23211 () Bool)

(assert (=> b!987631 (= e!556911 tp_is_empty!23211)))

(declare-fun mapNonEmpty!36851 () Bool)

(declare-fun mapRes!36851 () Bool)

(declare-fun tp!69766 () Bool)

(declare-fun e!556910 () Bool)

(assert (=> mapNonEmpty!36851 (= mapRes!36851 (and tp!69766 e!556910))))

(declare-datatypes ((V!35931 0))(
  ( (V!35932 (val!11656 Int)) )
))
(declare-datatypes ((ValueCell!11124 0))(
  ( (ValueCellFull!11124 (v!14220 V!35931)) (EmptyCell!11124) )
))
(declare-datatypes ((array!62383 0))(
  ( (array!62384 (arr!30047 (Array (_ BitVec 32) ValueCell!11124)) (size!30526 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62383)

(declare-fun mapRest!36851 () (Array (_ BitVec 32) ValueCell!11124))

(declare-fun mapValue!36851 () ValueCell!11124)

(declare-fun mapKey!36851 () (_ BitVec 32))

(assert (=> mapNonEmpty!36851 (= (arr!30047 _values!1278) (store mapRest!36851 mapKey!36851 mapValue!36851))))

(declare-fun mapIsEmpty!36851 () Bool)

(assert (=> mapIsEmpty!36851 mapRes!36851))

(declare-fun b!987632 () Bool)

(declare-fun res!660705 () Bool)

(assert (=> b!987632 (=> (not res!660705) (not e!556908))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987632 (= res!660705 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30525 _keys!1544))))))

(declare-fun b!987633 () Bool)

(declare-fun res!660706 () Bool)

(assert (=> b!987633 (=> (not res!660706) (not e!556908))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987633 (= res!660706 (and (= (size!30526 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30525 _keys!1544) (size!30526 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987634 () Bool)

(declare-fun e!556912 () Bool)

(assert (=> b!987634 (= e!556912 true)))

(declare-fun minValue!1220 () V!35931)

(declare-fun zeroValue!1220 () V!35931)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14848 0))(
  ( (tuple2!14849 (_1!7435 (_ BitVec 64)) (_2!7435 V!35931)) )
))
(declare-datatypes ((List!20780 0))(
  ( (Nil!20777) (Cons!20776 (h!21938 tuple2!14848) (t!29703 List!20780)) )
))
(declare-datatypes ((ListLongMap!13545 0))(
  ( (ListLongMap!13546 (toList!6788 List!20780)) )
))
(declare-fun lt!437878 () ListLongMap!13545)

(declare-fun getCurrentListMap!3855 (array!62381 array!62383 (_ BitVec 32) (_ BitVec 32) V!35931 V!35931 (_ BitVec 32) Int) ListLongMap!13545)

(assert (=> b!987634 (= lt!437878 (getCurrentListMap!3855 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!437874 () ListLongMap!13545)

(declare-fun lt!437881 () ListLongMap!13545)

(declare-fun lt!437882 () tuple2!14848)

(declare-fun lt!437873 () tuple2!14848)

(declare-fun +!3073 (ListLongMap!13545 tuple2!14848) ListLongMap!13545)

(assert (=> b!987634 (= lt!437874 (+!3073 (+!3073 lt!437881 lt!437873) lt!437882))))

(declare-datatypes ((Unit!32779 0))(
  ( (Unit!32780) )
))
(declare-fun lt!437883 () Unit!32779)

(declare-fun lt!437880 () V!35931)

(declare-fun addCommutativeForDiffKeys!697 (ListLongMap!13545 (_ BitVec 64) V!35931 (_ BitVec 64) V!35931) Unit!32779)

(assert (=> b!987634 (= lt!437883 (addCommutativeForDiffKeys!697 lt!437881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30046 _keys!1544) from!1932) lt!437880))))

(declare-fun b!987635 () Bool)

(declare-fun res!660701 () Bool)

(assert (=> b!987635 (=> (not res!660701) (not e!556908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62381 (_ BitVec 32)) Bool)

(assert (=> b!987635 (= res!660701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987636 () Bool)

(declare-fun res!660702 () Bool)

(assert (=> b!987636 (=> (not res!660702) (not e!556908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987636 (= res!660702 (validKeyInArray!0 (select (arr!30046 _keys!1544) from!1932)))))

(declare-fun b!987637 () Bool)

(assert (=> b!987637 (= e!556908 (not e!556912))))

(declare-fun res!660704 () Bool)

(assert (=> b!987637 (=> res!660704 e!556912)))

(assert (=> b!987637 (= res!660704 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30046 _keys!1544) from!1932)))))

(declare-fun lt!437879 () ListLongMap!13545)

(declare-fun lt!437875 () tuple2!14848)

(assert (=> b!987637 (= (+!3073 lt!437879 lt!437873) (+!3073 lt!437874 lt!437875))))

(declare-fun lt!437876 () ListLongMap!13545)

(assert (=> b!987637 (= lt!437874 (+!3073 lt!437876 lt!437873))))

(assert (=> b!987637 (= lt!437873 (tuple2!14849 (select (arr!30046 _keys!1544) from!1932) lt!437880))))

(assert (=> b!987637 (= lt!437879 (+!3073 lt!437876 lt!437875))))

(assert (=> b!987637 (= lt!437875 (tuple2!14849 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!437877 () Unit!32779)

(assert (=> b!987637 (= lt!437877 (addCommutativeForDiffKeys!697 lt!437876 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30046 _keys!1544) from!1932) lt!437880))))

(declare-fun get!15589 (ValueCell!11124 V!35931) V!35931)

(declare-fun dynLambda!1856 (Int (_ BitVec 64)) V!35931)

(assert (=> b!987637 (= lt!437880 (get!15589 (select (arr!30047 _values!1278) from!1932) (dynLambda!1856 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987637 (= lt!437876 (+!3073 lt!437881 lt!437882))))

(assert (=> b!987637 (= lt!437882 (tuple2!14849 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3479 (array!62381 array!62383 (_ BitVec 32) (_ BitVec 32) V!35931 V!35931 (_ BitVec 32) Int) ListLongMap!13545)

(assert (=> b!987637 (= lt!437881 (getCurrentListMapNoExtraKeys!3479 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!987638 () Bool)

(declare-fun e!556909 () Bool)

(assert (=> b!987638 (= e!556909 (and e!556911 mapRes!36851))))

(declare-fun condMapEmpty!36851 () Bool)

(declare-fun mapDefault!36851 () ValueCell!11124)

(assert (=> b!987638 (= condMapEmpty!36851 (= (arr!30047 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11124)) mapDefault!36851)))))

(declare-fun b!987639 () Bool)

(assert (=> b!987639 (= e!556910 tp_is_empty!23211)))

(declare-fun b!987640 () Bool)

(declare-fun res!660703 () Bool)

(assert (=> b!987640 (=> (not res!660703) (not e!556908))))

(assert (=> b!987640 (= res!660703 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!660700 () Bool)

(assert (=> start!84444 (=> (not res!660700) (not e!556908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84444 (= res!660700 (validMask!0 mask!1948))))

(assert (=> start!84444 e!556908))

(assert (=> start!84444 true))

(assert (=> start!84444 tp_is_empty!23211))

(declare-fun array_inv!23215 (array!62383) Bool)

(assert (=> start!84444 (and (array_inv!23215 _values!1278) e!556909)))

(assert (=> start!84444 tp!69765))

(declare-fun array_inv!23216 (array!62381) Bool)

(assert (=> start!84444 (array_inv!23216 _keys!1544)))

(assert (= (and start!84444 res!660700) b!987633))

(assert (= (and b!987633 res!660706) b!987635))

(assert (= (and b!987635 res!660701) b!987630))

(assert (= (and b!987630 res!660699) b!987632))

(assert (= (and b!987632 res!660705) b!987636))

(assert (= (and b!987636 res!660702) b!987640))

(assert (= (and b!987640 res!660703) b!987637))

(assert (= (and b!987637 (not res!660704)) b!987634))

(assert (= (and b!987638 condMapEmpty!36851) mapIsEmpty!36851))

(assert (= (and b!987638 (not condMapEmpty!36851)) mapNonEmpty!36851))

(get-info :version)

(assert (= (and mapNonEmpty!36851 ((_ is ValueCellFull!11124) mapValue!36851)) b!987639))

(assert (= (and b!987638 ((_ is ValueCellFull!11124) mapDefault!36851)) b!987631))

(assert (= start!84444 b!987638))

(declare-fun b_lambda!15027 () Bool)

(assert (=> (not b_lambda!15027) (not b!987637)))

(declare-fun t!29701 () Bool)

(declare-fun tb!6773 () Bool)

(assert (=> (and start!84444 (= defaultEntry!1281 defaultEntry!1281) t!29701) tb!6773))

(declare-fun result!13539 () Bool)

(assert (=> tb!6773 (= result!13539 tp_is_empty!23211)))

(assert (=> b!987637 t!29701))

(declare-fun b_and!32059 () Bool)

(assert (= b_and!32057 (and (=> t!29701 result!13539) b_and!32059)))

(declare-fun m!914271 () Bool)

(assert (=> b!987637 m!914271))

(declare-fun m!914273 () Bool)

(assert (=> b!987637 m!914273))

(declare-fun m!914275 () Bool)

(assert (=> b!987637 m!914275))

(declare-fun m!914277 () Bool)

(assert (=> b!987637 m!914277))

(declare-fun m!914279 () Bool)

(assert (=> b!987637 m!914279))

(assert (=> b!987637 m!914273))

(declare-fun m!914281 () Bool)

(assert (=> b!987637 m!914281))

(declare-fun m!914283 () Bool)

(assert (=> b!987637 m!914283))

(declare-fun m!914285 () Bool)

(assert (=> b!987637 m!914285))

(declare-fun m!914287 () Bool)

(assert (=> b!987637 m!914287))

(declare-fun m!914289 () Bool)

(assert (=> b!987637 m!914289))

(assert (=> b!987637 m!914275))

(assert (=> b!987637 m!914289))

(declare-fun m!914291 () Bool)

(assert (=> b!987637 m!914291))

(declare-fun m!914293 () Bool)

(assert (=> b!987630 m!914293))

(declare-fun m!914295 () Bool)

(assert (=> start!84444 m!914295))

(declare-fun m!914297 () Bool)

(assert (=> start!84444 m!914297))

(declare-fun m!914299 () Bool)

(assert (=> start!84444 m!914299))

(declare-fun m!914301 () Bool)

(assert (=> mapNonEmpty!36851 m!914301))

(assert (=> b!987636 m!914273))

(assert (=> b!987636 m!914273))

(declare-fun m!914303 () Bool)

(assert (=> b!987636 m!914303))

(declare-fun m!914305 () Bool)

(assert (=> b!987635 m!914305))

(assert (=> b!987634 m!914273))

(assert (=> b!987634 m!914273))

(declare-fun m!914307 () Bool)

(assert (=> b!987634 m!914307))

(declare-fun m!914309 () Bool)

(assert (=> b!987634 m!914309))

(assert (=> b!987634 m!914309))

(declare-fun m!914311 () Bool)

(assert (=> b!987634 m!914311))

(declare-fun m!914313 () Bool)

(assert (=> b!987634 m!914313))

(check-sat (not mapNonEmpty!36851) (not b!987635) tp_is_empty!23211 (not b_next!19995) (not start!84444) (not b!987637) b_and!32059 (not b!987636) (not b!987634) (not b_lambda!15027) (not b!987630))
(check-sat b_and!32059 (not b_next!19995))
