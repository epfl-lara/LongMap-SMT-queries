; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84572 () Bool)

(assert start!84572)

(declare-fun b_free!19975 () Bool)

(declare-fun b_next!19975 () Bool)

(assert (=> start!84572 (= b_free!19975 (not b_next!19975))))

(declare-fun tp!69704 () Bool)

(declare-fun b_and!32023 () Bool)

(assert (=> start!84572 (= tp!69704 b_and!32023)))

(declare-fun b!988117 () Bool)

(declare-fun res!660788 () Bool)

(declare-fun e!557276 () Bool)

(assert (=> b!988117 (=> (not res!660788) (not e!557276))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988117 (= res!660788 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!988118 () Bool)

(declare-fun e!557280 () Bool)

(declare-fun tp_is_empty!23191 () Bool)

(assert (=> b!988118 (= e!557280 tp_is_empty!23191)))

(declare-fun b!988119 () Bool)

(declare-fun e!557278 () Bool)

(assert (=> b!988119 (= e!557278 tp_is_empty!23191)))

(declare-fun b!988120 () Bool)

(declare-fun res!660792 () Bool)

(assert (=> b!988120 (=> (not res!660792) (not e!557276))))

(declare-datatypes ((array!62386 0))(
  ( (array!62387 (arr!30045 (Array (_ BitVec 32) (_ BitVec 64))) (size!30525 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62386)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62386 (_ BitVec 32)) Bool)

(assert (=> b!988120 (= res!660792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988121 () Bool)

(declare-fun res!660787 () Bool)

(assert (=> b!988121 (=> (not res!660787) (not e!557276))))

(declare-datatypes ((V!35905 0))(
  ( (V!35906 (val!11646 Int)) )
))
(declare-datatypes ((ValueCell!11114 0))(
  ( (ValueCellFull!11114 (v!14206 V!35905)) (EmptyCell!11114) )
))
(declare-datatypes ((array!62388 0))(
  ( (array!62389 (arr!30046 (Array (_ BitVec 32) ValueCell!11114)) (size!30526 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62388)

(assert (=> b!988121 (= res!660787 (and (= (size!30526 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30525 _keys!1544) (size!30526 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988122 () Bool)

(declare-fun res!660791 () Bool)

(assert (=> b!988122 (=> (not res!660791) (not e!557276))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!988122 (= res!660791 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30525 _keys!1544))))))

(declare-fun b!988123 () Bool)

(declare-fun res!660793 () Bool)

(assert (=> b!988123 (=> (not res!660793) (not e!557276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988123 (= res!660793 (validKeyInArray!0 (select (arr!30045 _keys!1544) from!1932)))))

(declare-fun b!988124 () Bool)

(assert (=> b!988124 (= e!557276 (not true))))

(declare-datatypes ((tuple2!14852 0))(
  ( (tuple2!14853 (_1!7437 (_ BitVec 64)) (_2!7437 V!35905)) )
))
(declare-datatypes ((List!20761 0))(
  ( (Nil!20758) (Cons!20757 (h!21925 tuple2!14852) (t!29656 List!20761)) )
))
(declare-datatypes ((ListLongMap!13551 0))(
  ( (ListLongMap!13552 (toList!6791 List!20761)) )
))
(declare-fun lt!437994 () ListLongMap!13551)

(declare-fun lt!437996 () tuple2!14852)

(declare-fun lt!437997 () tuple2!14852)

(declare-fun +!3090 (ListLongMap!13551 tuple2!14852) ListLongMap!13551)

(assert (=> b!988124 (= (+!3090 (+!3090 lt!437994 lt!437996) lt!437997) (+!3090 (+!3090 lt!437994 lt!437997) lt!437996))))

(declare-fun lt!437993 () V!35905)

(assert (=> b!988124 (= lt!437997 (tuple2!14853 (select (arr!30045 _keys!1544) from!1932) lt!437993))))

(declare-fun minValue!1220 () V!35905)

(assert (=> b!988124 (= lt!437996 (tuple2!14853 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32754 0))(
  ( (Unit!32755) )
))
(declare-fun lt!437995 () Unit!32754)

(declare-fun addCommutativeForDiffKeys!693 (ListLongMap!13551 (_ BitVec 64) V!35905 (_ BitVec 64) V!35905) Unit!32754)

(assert (=> b!988124 (= lt!437995 (addCommutativeForDiffKeys!693 lt!437994 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30045 _keys!1544) from!1932) lt!437993))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15603 (ValueCell!11114 V!35905) V!35905)

(declare-fun dynLambda!1874 (Int (_ BitVec 64)) V!35905)

(assert (=> b!988124 (= lt!437993 (get!15603 (select (arr!30046 _values!1278) from!1932) (dynLambda!1874 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35905)

(declare-fun getCurrentListMapNoExtraKeys!3520 (array!62386 array!62388 (_ BitVec 32) (_ BitVec 32) V!35905 V!35905 (_ BitVec 32) Int) ListLongMap!13551)

(assert (=> b!988124 (= lt!437994 (+!3090 (getCurrentListMapNoExtraKeys!3520 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14853 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun res!660789 () Bool)

(assert (=> start!84572 (=> (not res!660789) (not e!557276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84572 (= res!660789 (validMask!0 mask!1948))))

(assert (=> start!84572 e!557276))

(assert (=> start!84572 true))

(assert (=> start!84572 tp_is_empty!23191))

(declare-fun e!557277 () Bool)

(declare-fun array_inv!23235 (array!62388) Bool)

(assert (=> start!84572 (and (array_inv!23235 _values!1278) e!557277)))

(assert (=> start!84572 tp!69704))

(declare-fun array_inv!23236 (array!62386) Bool)

(assert (=> start!84572 (array_inv!23236 _keys!1544)))

(declare-fun b!988125 () Bool)

(declare-fun mapRes!36818 () Bool)

(assert (=> b!988125 (= e!557277 (and e!557280 mapRes!36818))))

(declare-fun condMapEmpty!36818 () Bool)

(declare-fun mapDefault!36818 () ValueCell!11114)

(assert (=> b!988125 (= condMapEmpty!36818 (= (arr!30046 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11114)) mapDefault!36818)))))

(declare-fun b!988126 () Bool)

(declare-fun res!660790 () Bool)

(assert (=> b!988126 (=> (not res!660790) (not e!557276))))

(declare-datatypes ((List!20762 0))(
  ( (Nil!20759) (Cons!20758 (h!21926 (_ BitVec 64)) (t!29657 List!20762)) )
))
(declare-fun arrayNoDuplicates!0 (array!62386 (_ BitVec 32) List!20762) Bool)

(assert (=> b!988126 (= res!660790 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20759))))

(declare-fun mapIsEmpty!36818 () Bool)

(assert (=> mapIsEmpty!36818 mapRes!36818))

(declare-fun mapNonEmpty!36818 () Bool)

(declare-fun tp!69703 () Bool)

(assert (=> mapNonEmpty!36818 (= mapRes!36818 (and tp!69703 e!557278))))

(declare-fun mapKey!36818 () (_ BitVec 32))

(declare-fun mapValue!36818 () ValueCell!11114)

(declare-fun mapRest!36818 () (Array (_ BitVec 32) ValueCell!11114))

(assert (=> mapNonEmpty!36818 (= (arr!30046 _values!1278) (store mapRest!36818 mapKey!36818 mapValue!36818))))

(assert (= (and start!84572 res!660789) b!988121))

(assert (= (and b!988121 res!660787) b!988120))

(assert (= (and b!988120 res!660792) b!988126))

(assert (= (and b!988126 res!660790) b!988122))

(assert (= (and b!988122 res!660791) b!988123))

(assert (= (and b!988123 res!660793) b!988117))

(assert (= (and b!988117 res!660788) b!988124))

(assert (= (and b!988125 condMapEmpty!36818) mapIsEmpty!36818))

(assert (= (and b!988125 (not condMapEmpty!36818)) mapNonEmpty!36818))

(get-info :version)

(assert (= (and mapNonEmpty!36818 ((_ is ValueCellFull!11114) mapValue!36818)) b!988119))

(assert (= (and b!988125 ((_ is ValueCellFull!11114) mapDefault!36818)) b!988118))

(assert (= start!84572 b!988125))

(declare-fun b_lambda!15011 () Bool)

(assert (=> (not b_lambda!15011) (not b!988124)))

(declare-fun t!29655 () Bool)

(declare-fun tb!6745 () Bool)

(assert (=> (and start!84572 (= defaultEntry!1281 defaultEntry!1281) t!29655) tb!6745))

(declare-fun result!13489 () Bool)

(assert (=> tb!6745 (= result!13489 tp_is_empty!23191)))

(assert (=> b!988124 t!29655))

(declare-fun b_and!32025 () Bool)

(assert (= b_and!32023 (and (=> t!29655 result!13489) b_and!32025)))

(declare-fun m!915077 () Bool)

(assert (=> b!988126 m!915077))

(declare-fun m!915079 () Bool)

(assert (=> start!84572 m!915079))

(declare-fun m!915081 () Bool)

(assert (=> start!84572 m!915081))

(declare-fun m!915083 () Bool)

(assert (=> start!84572 m!915083))

(declare-fun m!915085 () Bool)

(assert (=> b!988123 m!915085))

(assert (=> b!988123 m!915085))

(declare-fun m!915087 () Bool)

(assert (=> b!988123 m!915087))

(declare-fun m!915089 () Bool)

(assert (=> mapNonEmpty!36818 m!915089))

(declare-fun m!915091 () Bool)

(assert (=> b!988120 m!915091))

(assert (=> b!988124 m!915085))

(declare-fun m!915093 () Bool)

(assert (=> b!988124 m!915093))

(assert (=> b!988124 m!915085))

(declare-fun m!915095 () Bool)

(assert (=> b!988124 m!915095))

(declare-fun m!915097 () Bool)

(assert (=> b!988124 m!915097))

(declare-fun m!915099 () Bool)

(assert (=> b!988124 m!915099))

(declare-fun m!915101 () Bool)

(assert (=> b!988124 m!915101))

(declare-fun m!915103 () Bool)

(assert (=> b!988124 m!915103))

(declare-fun m!915105 () Bool)

(assert (=> b!988124 m!915105))

(assert (=> b!988124 m!915097))

(assert (=> b!988124 m!915101))

(assert (=> b!988124 m!915105))

(declare-fun m!915107 () Bool)

(assert (=> b!988124 m!915107))

(declare-fun m!915109 () Bool)

(assert (=> b!988124 m!915109))

(assert (=> b!988124 m!915095))

(assert (=> b!988124 m!915109))

(declare-fun m!915111 () Bool)

(assert (=> b!988124 m!915111))

(check-sat (not b!988123) (not b!988124) b_and!32025 (not b!988126) (not start!84572) (not b_next!19975) (not b!988120) (not b_lambda!15011) (not mapNonEmpty!36818) tp_is_empty!23191)
(check-sat b_and!32025 (not b_next!19975))
