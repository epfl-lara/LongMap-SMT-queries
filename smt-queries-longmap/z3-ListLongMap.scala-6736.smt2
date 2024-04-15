; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84386 () Bool)

(assert start!84386)

(declare-fun b_free!19975 () Bool)

(declare-fun b_next!19975 () Bool)

(assert (=> start!84386 (= b_free!19975 (not b_next!19975))))

(declare-fun tp!69703 () Bool)

(declare-fun b_and!31987 () Bool)

(assert (=> start!84386 (= tp!69703 b_and!31987)))

(declare-fun b!986975 () Bool)

(declare-fun e!556550 () Bool)

(declare-fun tp_is_empty!23191 () Bool)

(assert (=> b!986975 (= e!556550 tp_is_empty!23191)))

(declare-fun mapNonEmpty!36818 () Bool)

(declare-fun mapRes!36818 () Bool)

(declare-fun tp!69704 () Bool)

(declare-fun e!556549 () Bool)

(assert (=> mapNonEmpty!36818 (= mapRes!36818 (and tp!69704 e!556549))))

(declare-datatypes ((V!35905 0))(
  ( (V!35906 (val!11646 Int)) )
))
(declare-datatypes ((ValueCell!11114 0))(
  ( (ValueCellFull!11114 (v!14208 V!35905)) (EmptyCell!11114) )
))
(declare-datatypes ((array!62272 0))(
  ( (array!62273 (arr!29993 (Array (_ BitVec 32) ValueCell!11114)) (size!30474 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62272)

(declare-fun mapValue!36818 () ValueCell!11114)

(declare-fun mapRest!36818 () (Array (_ BitVec 32) ValueCell!11114))

(declare-fun mapKey!36818 () (_ BitVec 32))

(assert (=> mapNonEmpty!36818 (= (arr!29993 _values!1278) (store mapRest!36818 mapKey!36818 mapValue!36818))))

(declare-fun b!986976 () Bool)

(declare-fun res!660334 () Bool)

(declare-fun e!556547 () Bool)

(assert (=> b!986976 (=> (not res!660334) (not e!556547))))

(declare-datatypes ((array!62274 0))(
  ( (array!62275 (arr!29994 (Array (_ BitVec 32) (_ BitVec 64))) (size!30475 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62274)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62274 (_ BitVec 32)) Bool)

(assert (=> b!986976 (= res!660334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986977 () Bool)

(declare-fun res!660335 () Bool)

(assert (=> b!986977 (=> (not res!660335) (not e!556547))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!986977 (= res!660335 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30475 _keys!1544))))))

(declare-fun mapIsEmpty!36818 () Bool)

(assert (=> mapIsEmpty!36818 mapRes!36818))

(declare-fun b!986978 () Bool)

(declare-fun e!556548 () Bool)

(assert (=> b!986978 (= e!556548 (and e!556550 mapRes!36818))))

(declare-fun condMapEmpty!36818 () Bool)

(declare-fun mapDefault!36818 () ValueCell!11114)

(assert (=> b!986978 (= condMapEmpty!36818 (= (arr!29993 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11114)) mapDefault!36818)))))

(declare-fun b!986979 () Bool)

(assert (=> b!986979 (= e!556549 tp_is_empty!23191)))

(declare-fun b!986980 () Bool)

(declare-fun res!660338 () Bool)

(assert (=> b!986980 (=> (not res!660338) (not e!556547))))

(declare-datatypes ((List!20804 0))(
  ( (Nil!20801) (Cons!20800 (h!21962 (_ BitVec 64)) (t!29698 List!20804)) )
))
(declare-fun arrayNoDuplicates!0 (array!62274 (_ BitVec 32) List!20804) Bool)

(assert (=> b!986980 (= res!660338 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20801))))

(declare-fun b!986982 () Bool)

(assert (=> b!986982 (= e!556547 (not true))))

(declare-datatypes ((tuple2!14918 0))(
  ( (tuple2!14919 (_1!7470 (_ BitVec 64)) (_2!7470 V!35905)) )
))
(declare-datatypes ((List!20805 0))(
  ( (Nil!20802) (Cons!20801 (h!21963 tuple2!14918) (t!29699 List!20805)) )
))
(declare-datatypes ((ListLongMap!13605 0))(
  ( (ListLongMap!13606 (toList!6818 List!20805)) )
))
(declare-fun lt!437400 () ListLongMap!13605)

(declare-fun lt!437396 () tuple2!14918)

(declare-fun lt!437398 () tuple2!14918)

(declare-fun +!3094 (ListLongMap!13605 tuple2!14918) ListLongMap!13605)

(assert (=> b!986982 (= (+!3094 (+!3094 lt!437400 lt!437396) lt!437398) (+!3094 (+!3094 lt!437400 lt!437398) lt!437396))))

(declare-fun lt!437397 () V!35905)

(assert (=> b!986982 (= lt!437398 (tuple2!14919 (select (arr!29994 _keys!1544) from!1932) lt!437397))))

(declare-fun minValue!1220 () V!35905)

(assert (=> b!986982 (= lt!437396 (tuple2!14919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32640 0))(
  ( (Unit!32641) )
))
(declare-fun lt!437399 () Unit!32640)

(declare-fun addCommutativeForDiffKeys!690 (ListLongMap!13605 (_ BitVec 64) V!35905 (_ BitVec 64) V!35905) Unit!32640)

(assert (=> b!986982 (= lt!437399 (addCommutativeForDiffKeys!690 lt!437400 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29994 _keys!1544) from!1932) lt!437397))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15573 (ValueCell!11114 V!35905) V!35905)

(declare-fun dynLambda!1843 (Int (_ BitVec 64)) V!35905)

(assert (=> b!986982 (= lt!437397 (get!15573 (select (arr!29993 _values!1278) from!1932) (dynLambda!1843 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35905)

(declare-fun getCurrentListMapNoExtraKeys!3522 (array!62274 array!62272 (_ BitVec 32) (_ BitVec 32) V!35905 V!35905 (_ BitVec 32) Int) ListLongMap!13605)

(assert (=> b!986982 (= lt!437400 (+!3094 (getCurrentListMapNoExtraKeys!3522 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14919 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!986981 () Bool)

(declare-fun res!660333 () Bool)

(assert (=> b!986981 (=> (not res!660333) (not e!556547))))

(assert (=> b!986981 (= res!660333 (and (= (size!30474 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30475 _keys!1544) (size!30474 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!660336 () Bool)

(assert (=> start!84386 (=> (not res!660336) (not e!556547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84386 (= res!660336 (validMask!0 mask!1948))))

(assert (=> start!84386 e!556547))

(assert (=> start!84386 true))

(assert (=> start!84386 tp_is_empty!23191))

(declare-fun array_inv!23185 (array!62272) Bool)

(assert (=> start!84386 (and (array_inv!23185 _values!1278) e!556548)))

(assert (=> start!84386 tp!69703))

(declare-fun array_inv!23186 (array!62274) Bool)

(assert (=> start!84386 (array_inv!23186 _keys!1544)))

(declare-fun b!986983 () Bool)

(declare-fun res!660337 () Bool)

(assert (=> b!986983 (=> (not res!660337) (not e!556547))))

(assert (=> b!986983 (= res!660337 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!986984 () Bool)

(declare-fun res!660339 () Bool)

(assert (=> b!986984 (=> (not res!660339) (not e!556547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986984 (= res!660339 (validKeyInArray!0 (select (arr!29994 _keys!1544) from!1932)))))

(assert (= (and start!84386 res!660336) b!986981))

(assert (= (and b!986981 res!660333) b!986976))

(assert (= (and b!986976 res!660334) b!986980))

(assert (= (and b!986980 res!660338) b!986977))

(assert (= (and b!986977 res!660335) b!986984))

(assert (= (and b!986984 res!660339) b!986983))

(assert (= (and b!986983 res!660337) b!986982))

(assert (= (and b!986978 condMapEmpty!36818) mapIsEmpty!36818))

(assert (= (and b!986978 (not condMapEmpty!36818)) mapNonEmpty!36818))

(get-info :version)

(assert (= (and mapNonEmpty!36818 ((_ is ValueCellFull!11114) mapValue!36818)) b!986979))

(assert (= (and b!986978 ((_ is ValueCellFull!11114) mapDefault!36818)) b!986975))

(assert (= start!84386 b!986978))

(declare-fun b_lambda!14979 () Bool)

(assert (=> (not b_lambda!14979) (not b!986982)))

(declare-fun t!29697 () Bool)

(declare-fun tb!6745 () Bool)

(assert (=> (and start!84386 (= defaultEntry!1281 defaultEntry!1281) t!29697) tb!6745))

(declare-fun result!13489 () Bool)

(assert (=> tb!6745 (= result!13489 tp_is_empty!23191)))

(assert (=> b!986982 t!29697))

(declare-fun b_and!31989 () Bool)

(assert (= b_and!31987 (and (=> t!29697 result!13489) b_and!31989)))

(declare-fun m!913025 () Bool)

(assert (=> b!986984 m!913025))

(assert (=> b!986984 m!913025))

(declare-fun m!913027 () Bool)

(assert (=> b!986984 m!913027))

(declare-fun m!913029 () Bool)

(assert (=> start!84386 m!913029))

(declare-fun m!913031 () Bool)

(assert (=> start!84386 m!913031))

(declare-fun m!913033 () Bool)

(assert (=> start!84386 m!913033))

(declare-fun m!913035 () Bool)

(assert (=> b!986976 m!913035))

(assert (=> b!986982 m!913025))

(declare-fun m!913037 () Bool)

(assert (=> b!986982 m!913037))

(declare-fun m!913039 () Bool)

(assert (=> b!986982 m!913039))

(declare-fun m!913041 () Bool)

(assert (=> b!986982 m!913041))

(assert (=> b!986982 m!913025))

(declare-fun m!913043 () Bool)

(assert (=> b!986982 m!913043))

(declare-fun m!913045 () Bool)

(assert (=> b!986982 m!913045))

(declare-fun m!913047 () Bool)

(assert (=> b!986982 m!913047))

(assert (=> b!986982 m!913045))

(assert (=> b!986982 m!913039))

(declare-fun m!913049 () Bool)

(assert (=> b!986982 m!913049))

(assert (=> b!986982 m!913049))

(declare-fun m!913051 () Bool)

(assert (=> b!986982 m!913051))

(declare-fun m!913053 () Bool)

(assert (=> b!986982 m!913053))

(assert (=> b!986982 m!913037))

(assert (=> b!986982 m!913053))

(declare-fun m!913055 () Bool)

(assert (=> b!986982 m!913055))

(declare-fun m!913057 () Bool)

(assert (=> mapNonEmpty!36818 m!913057))

(declare-fun m!913059 () Bool)

(assert (=> b!986980 m!913059))

(check-sat tp_is_empty!23191 (not start!84386) (not b_lambda!14979) (not mapNonEmpty!36818) b_and!31989 (not b_next!19975) (not b!986976) (not b!986982) (not b!986984) (not b!986980))
(check-sat b_and!31989 (not b_next!19975))
