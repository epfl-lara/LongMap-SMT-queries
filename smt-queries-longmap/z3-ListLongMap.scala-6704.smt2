; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84178 () Bool)

(assert start!84178)

(declare-fun b_free!19897 () Bool)

(declare-fun b_next!19897 () Bool)

(assert (=> start!84178 (= b_free!19897 (not b_next!19897))))

(declare-fun tp!69296 () Bool)

(declare-fun b_and!31845 () Bool)

(assert (=> start!84178 (= tp!69296 b_and!31845)))

(declare-fun b!984498 () Bool)

(declare-fun e!554970 () Bool)

(declare-fun e!554971 () Bool)

(assert (=> b!984498 (= e!554970 e!554971)))

(declare-fun res!658827 () Bool)

(assert (=> b!984498 (=> (not res!658827) (not e!554971))))

(declare-datatypes ((array!61906 0))(
  ( (array!61907 (arr!29811 (Array (_ BitVec 32) (_ BitVec 64))) (size!30292 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61906)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984498 (= res!658827 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29811 _keys!1544) from!1932))))))

(declare-datatypes ((V!35649 0))(
  ( (V!35650 (val!11550 Int)) )
))
(declare-datatypes ((ValueCell!11018 0))(
  ( (ValueCellFull!11018 (v!14111 V!35649)) (EmptyCell!11018) )
))
(declare-datatypes ((array!61908 0))(
  ( (array!61909 (arr!29812 (Array (_ BitVec 32) ValueCell!11018)) (size!30293 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61908)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436708 () V!35649)

(declare-fun get!15484 (ValueCell!11018 V!35649) V!35649)

(declare-fun dynLambda!1818 (Int (_ BitVec 64)) V!35649)

(assert (=> b!984498 (= lt!436708 (get!15484 (select (arr!29812 _values!1278) from!1932) (dynLambda!1818 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35649)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14852 0))(
  ( (tuple2!14853 (_1!7437 (_ BitVec 64)) (_2!7437 V!35649)) )
))
(declare-datatypes ((List!20703 0))(
  ( (Nil!20700) (Cons!20699 (h!21861 tuple2!14852) (t!29535 List!20703)) )
))
(declare-datatypes ((ListLongMap!13539 0))(
  ( (ListLongMap!13540 (toList!6785 List!20703)) )
))
(declare-fun lt!436709 () ListLongMap!13539)

(declare-fun zeroValue!1220 () V!35649)

(declare-fun getCurrentListMapNoExtraKeys!3490 (array!61906 array!61908 (_ BitVec 32) (_ BitVec 32) V!35649 V!35649 (_ BitVec 32) Int) ListLongMap!13539)

(assert (=> b!984498 (= lt!436709 (getCurrentListMapNoExtraKeys!3490 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984499 () Bool)

(assert (=> b!984499 (= e!554971 (not (bvsle from!1932 (size!30292 _keys!1544))))))

(declare-fun lt!436706 () tuple2!14852)

(declare-fun lt!436707 () tuple2!14852)

(declare-fun +!3065 (ListLongMap!13539 tuple2!14852) ListLongMap!13539)

(assert (=> b!984499 (= (+!3065 (+!3065 lt!436709 lt!436706) lt!436707) (+!3065 (+!3065 lt!436709 lt!436707) lt!436706))))

(assert (=> b!984499 (= lt!436707 (tuple2!14853 (select (arr!29811 _keys!1544) from!1932) lt!436708))))

(assert (=> b!984499 (= lt!436706 (tuple2!14853 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32596 0))(
  ( (Unit!32597) )
))
(declare-fun lt!436710 () Unit!32596)

(declare-fun addCommutativeForDiffKeys!669 (ListLongMap!13539 (_ BitVec 64) V!35649 (_ BitVec 64) V!35649) Unit!32596)

(assert (=> b!984499 (= lt!436710 (addCommutativeForDiffKeys!669 lt!436709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29811 _keys!1544) from!1932) lt!436708))))

(declare-fun b!984500 () Bool)

(declare-fun e!554968 () Bool)

(declare-fun e!554969 () Bool)

(declare-fun mapRes!36527 () Bool)

(assert (=> b!984500 (= e!554968 (and e!554969 mapRes!36527))))

(declare-fun condMapEmpty!36527 () Bool)

(declare-fun mapDefault!36527 () ValueCell!11018)

(assert (=> b!984500 (= condMapEmpty!36527 (= (arr!29812 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11018)) mapDefault!36527)))))

(declare-fun b!984501 () Bool)

(declare-fun res!658826 () Bool)

(assert (=> b!984501 (=> (not res!658826) (not e!554970))))

(declare-datatypes ((List!20704 0))(
  ( (Nil!20701) (Cons!20700 (h!21862 (_ BitVec 64)) (t!29536 List!20704)) )
))
(declare-fun arrayNoDuplicates!0 (array!61906 (_ BitVec 32) List!20704) Bool)

(assert (=> b!984501 (= res!658826 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20701))))

(declare-fun b!984502 () Bool)

(declare-fun res!658833 () Bool)

(assert (=> b!984502 (=> (not res!658833) (not e!554970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984502 (= res!658833 (validKeyInArray!0 (select (arr!29811 _keys!1544) from!1932)))))

(declare-fun b!984503 () Bool)

(declare-fun res!658831 () Bool)

(assert (=> b!984503 (=> (not res!658831) (not e!554970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61906 (_ BitVec 32)) Bool)

(assert (=> b!984503 (= res!658831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984504 () Bool)

(declare-fun res!658830 () Bool)

(assert (=> b!984504 (=> (not res!658830) (not e!554970))))

(assert (=> b!984504 (= res!658830 (and (= (size!30293 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30292 _keys!1544) (size!30293 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984505 () Bool)

(declare-fun res!658832 () Bool)

(assert (=> b!984505 (=> (not res!658832) (not e!554970))))

(assert (=> b!984505 (= res!658832 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984506 () Bool)

(declare-fun res!658828 () Bool)

(assert (=> b!984506 (=> (not res!658828) (not e!554970))))

(assert (=> b!984506 (= res!658828 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30292 _keys!1544))))))

(declare-fun b!984507 () Bool)

(declare-fun e!554972 () Bool)

(declare-fun tp_is_empty!22999 () Bool)

(assert (=> b!984507 (= e!554972 tp_is_empty!22999)))

(declare-fun res!658829 () Bool)

(assert (=> start!84178 (=> (not res!658829) (not e!554970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84178 (= res!658829 (validMask!0 mask!1948))))

(assert (=> start!84178 e!554970))

(assert (=> start!84178 true))

(assert (=> start!84178 tp_is_empty!22999))

(declare-fun array_inv!23047 (array!61908) Bool)

(assert (=> start!84178 (and (array_inv!23047 _values!1278) e!554968)))

(assert (=> start!84178 tp!69296))

(declare-fun array_inv!23048 (array!61906) Bool)

(assert (=> start!84178 (array_inv!23048 _keys!1544)))

(declare-fun b!984508 () Bool)

(assert (=> b!984508 (= e!554969 tp_is_empty!22999)))

(declare-fun mapNonEmpty!36527 () Bool)

(declare-fun tp!69295 () Bool)

(assert (=> mapNonEmpty!36527 (= mapRes!36527 (and tp!69295 e!554972))))

(declare-fun mapRest!36527 () (Array (_ BitVec 32) ValueCell!11018))

(declare-fun mapValue!36527 () ValueCell!11018)

(declare-fun mapKey!36527 () (_ BitVec 32))

(assert (=> mapNonEmpty!36527 (= (arr!29812 _values!1278) (store mapRest!36527 mapKey!36527 mapValue!36527))))

(declare-fun mapIsEmpty!36527 () Bool)

(assert (=> mapIsEmpty!36527 mapRes!36527))

(assert (= (and start!84178 res!658829) b!984504))

(assert (= (and b!984504 res!658830) b!984503))

(assert (= (and b!984503 res!658831) b!984501))

(assert (= (and b!984501 res!658826) b!984506))

(assert (= (and b!984506 res!658828) b!984502))

(assert (= (and b!984502 res!658833) b!984505))

(assert (= (and b!984505 res!658832) b!984498))

(assert (= (and b!984498 res!658827) b!984499))

(assert (= (and b!984500 condMapEmpty!36527) mapIsEmpty!36527))

(assert (= (and b!984500 (not condMapEmpty!36527)) mapNonEmpty!36527))

(get-info :version)

(assert (= (and mapNonEmpty!36527 ((_ is ValueCellFull!11018) mapValue!36527)) b!984507))

(assert (= (and b!984500 ((_ is ValueCellFull!11018) mapDefault!36527)) b!984508))

(assert (= start!84178 b!984500))

(declare-fun b_lambda!14911 () Bool)

(assert (=> (not b_lambda!14911) (not b!984498)))

(declare-fun t!29534 () Bool)

(declare-fun tb!6683 () Bool)

(assert (=> (and start!84178 (= defaultEntry!1281 defaultEntry!1281) t!29534) tb!6683))

(declare-fun result!13363 () Bool)

(assert (=> tb!6683 (= result!13363 tp_is_empty!22999)))

(assert (=> b!984498 t!29534))

(declare-fun b_and!31847 () Bool)

(assert (= b_and!31845 (and (=> t!29534 result!13363) b_and!31847)))

(declare-fun m!911057 () Bool)

(assert (=> b!984501 m!911057))

(declare-fun m!911059 () Bool)

(assert (=> b!984503 m!911059))

(declare-fun m!911061 () Bool)

(assert (=> b!984499 m!911061))

(assert (=> b!984499 m!911061))

(declare-fun m!911063 () Bool)

(assert (=> b!984499 m!911063))

(declare-fun m!911065 () Bool)

(assert (=> b!984499 m!911065))

(declare-fun m!911067 () Bool)

(assert (=> b!984499 m!911067))

(declare-fun m!911069 () Bool)

(assert (=> b!984499 m!911069))

(assert (=> b!984499 m!911065))

(declare-fun m!911071 () Bool)

(assert (=> b!984499 m!911071))

(assert (=> b!984499 m!911067))

(declare-fun m!911073 () Bool)

(assert (=> mapNonEmpty!36527 m!911073))

(assert (=> b!984498 m!911061))

(declare-fun m!911075 () Bool)

(assert (=> b!984498 m!911075))

(declare-fun m!911077 () Bool)

(assert (=> b!984498 m!911077))

(declare-fun m!911079 () Bool)

(assert (=> b!984498 m!911079))

(assert (=> b!984498 m!911075))

(assert (=> b!984498 m!911079))

(declare-fun m!911081 () Bool)

(assert (=> b!984498 m!911081))

(declare-fun m!911083 () Bool)

(assert (=> start!84178 m!911083))

(declare-fun m!911085 () Bool)

(assert (=> start!84178 m!911085))

(declare-fun m!911087 () Bool)

(assert (=> start!84178 m!911087))

(assert (=> b!984502 m!911061))

(assert (=> b!984502 m!911061))

(declare-fun m!911089 () Bool)

(assert (=> b!984502 m!911089))

(check-sat b_and!31847 tp_is_empty!22999 (not b!984499) (not b_next!19897) (not b!984501) (not b_lambda!14911) (not mapNonEmpty!36527) (not b!984502) (not b!984503) (not start!84178) (not b!984498))
(check-sat b_and!31847 (not b_next!19897))
