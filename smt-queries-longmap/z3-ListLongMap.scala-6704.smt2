; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84364 () Bool)

(assert start!84364)

(declare-fun b_free!19897 () Bool)

(declare-fun b_next!19897 () Bool)

(assert (=> start!84364 (= b_free!19897 (not b_next!19897))))

(declare-fun tp!69295 () Bool)

(declare-fun b_and!31881 () Bool)

(assert (=> start!84364 (= tp!69295 b_and!31881)))

(declare-fun b!985640 () Bool)

(declare-fun res!659285 () Bool)

(declare-fun e!555701 () Bool)

(assert (=> b!985640 (=> (not res!659285) (not e!555701))))

(declare-datatypes ((array!62014 0))(
  ( (array!62015 (arr!29860 (Array (_ BitVec 32) (_ BitVec 64))) (size!30340 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62014)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62014 (_ BitVec 32)) Bool)

(assert (=> b!985640 (= res!659285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985641 () Bool)

(declare-fun res!659286 () Bool)

(assert (=> b!985641 (=> (not res!659286) (not e!555701))))

(declare-datatypes ((List!20673 0))(
  ( (Nil!20670) (Cons!20669 (h!21837 (_ BitVec 64)) (t!29506 List!20673)) )
))
(declare-fun arrayNoDuplicates!0 (array!62014 (_ BitVec 32) List!20673) Bool)

(assert (=> b!985641 (= res!659286 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20670))))

(declare-fun b!985642 () Bool)

(declare-fun res!659284 () Bool)

(assert (=> b!985642 (=> (not res!659284) (not e!555701))))

(declare-datatypes ((V!35649 0))(
  ( (V!35650 (val!11550 Int)) )
))
(declare-datatypes ((ValueCell!11018 0))(
  ( (ValueCellFull!11018 (v!14109 V!35649)) (EmptyCell!11018) )
))
(declare-datatypes ((array!62016 0))(
  ( (array!62017 (arr!29861 (Array (_ BitVec 32) ValueCell!11018)) (size!30341 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62016)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985642 (= res!659284 (and (= (size!30341 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30340 _keys!1544) (size!30341 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985643 () Bool)

(declare-fun e!555699 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985643 (= e!555699 (not (bvsle from!1932 (size!30340 _keys!1544))))))

(declare-datatypes ((tuple2!14792 0))(
  ( (tuple2!14793 (_1!7407 (_ BitVec 64)) (_2!7407 V!35649)) )
))
(declare-datatypes ((List!20674 0))(
  ( (Nil!20671) (Cons!20670 (h!21838 tuple2!14792) (t!29507 List!20674)) )
))
(declare-datatypes ((ListLongMap!13491 0))(
  ( (ListLongMap!13492 (toList!6761 List!20674)) )
))
(declare-fun lt!437306 () ListLongMap!13491)

(declare-fun lt!437305 () tuple2!14792)

(declare-fun lt!437307 () tuple2!14792)

(declare-fun +!3063 (ListLongMap!13491 tuple2!14792) ListLongMap!13491)

(assert (=> b!985643 (= (+!3063 (+!3063 lt!437306 lt!437305) lt!437307) (+!3063 (+!3063 lt!437306 lt!437307) lt!437305))))

(declare-fun lt!437303 () V!35649)

(assert (=> b!985643 (= lt!437307 (tuple2!14793 (select (arr!29860 _keys!1544) from!1932) lt!437303))))

(declare-fun minValue!1220 () V!35649)

(assert (=> b!985643 (= lt!437305 (tuple2!14793 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32706 0))(
  ( (Unit!32707) )
))
(declare-fun lt!437304 () Unit!32706)

(declare-fun addCommutativeForDiffKeys!670 (ListLongMap!13491 (_ BitVec 64) V!35649 (_ BitVec 64) V!35649) Unit!32706)

(assert (=> b!985643 (= lt!437304 (addCommutativeForDiffKeys!670 lt!437306 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29860 _keys!1544) from!1932) lt!437303))))

(declare-fun res!659282 () Bool)

(assert (=> start!84364 (=> (not res!659282) (not e!555701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84364 (= res!659282 (validMask!0 mask!1948))))

(assert (=> start!84364 e!555701))

(assert (=> start!84364 true))

(declare-fun tp_is_empty!22999 () Bool)

(assert (=> start!84364 tp_is_empty!22999))

(declare-fun e!555700 () Bool)

(declare-fun array_inv!23101 (array!62016) Bool)

(assert (=> start!84364 (and (array_inv!23101 _values!1278) e!555700)))

(assert (=> start!84364 tp!69295))

(declare-fun array_inv!23102 (array!62014) Bool)

(assert (=> start!84364 (array_inv!23102 _keys!1544)))

(declare-fun mapIsEmpty!36527 () Bool)

(declare-fun mapRes!36527 () Bool)

(assert (=> mapIsEmpty!36527 mapRes!36527))

(declare-fun b!985644 () Bool)

(declare-fun res!659283 () Bool)

(assert (=> b!985644 (=> (not res!659283) (not e!555701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985644 (= res!659283 (validKeyInArray!0 (select (arr!29860 _keys!1544) from!1932)))))

(declare-fun b!985645 () Bool)

(declare-fun e!555697 () Bool)

(assert (=> b!985645 (= e!555697 tp_is_empty!22999)))

(declare-fun b!985646 () Bool)

(assert (=> b!985646 (= e!555700 (and e!555697 mapRes!36527))))

(declare-fun condMapEmpty!36527 () Bool)

(declare-fun mapDefault!36527 () ValueCell!11018)

(assert (=> b!985646 (= condMapEmpty!36527 (= (arr!29861 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11018)) mapDefault!36527)))))

(declare-fun b!985647 () Bool)

(declare-fun e!555702 () Bool)

(assert (=> b!985647 (= e!555702 tp_is_empty!22999)))

(declare-fun b!985648 () Bool)

(declare-fun res!659280 () Bool)

(assert (=> b!985648 (=> (not res!659280) (not e!555701))))

(assert (=> b!985648 (= res!659280 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30340 _keys!1544))))))

(declare-fun b!985649 () Bool)

(declare-fun res!659281 () Bool)

(assert (=> b!985649 (=> (not res!659281) (not e!555701))))

(assert (=> b!985649 (= res!659281 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985650 () Bool)

(assert (=> b!985650 (= e!555701 e!555699)))

(declare-fun res!659287 () Bool)

(assert (=> b!985650 (=> (not res!659287) (not e!555699))))

(assert (=> b!985650 (= res!659287 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29860 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15518 (ValueCell!11018 V!35649) V!35649)

(declare-fun dynLambda!1853 (Int (_ BitVec 64)) V!35649)

(assert (=> b!985650 (= lt!437303 (get!15518 (select (arr!29861 _values!1278) from!1932) (dynLambda!1853 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35649)

(declare-fun getCurrentListMapNoExtraKeys!3496 (array!62014 array!62016 (_ BitVec 32) (_ BitVec 32) V!35649 V!35649 (_ BitVec 32) Int) ListLongMap!13491)

(assert (=> b!985650 (= lt!437306 (getCurrentListMapNoExtraKeys!3496 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36527 () Bool)

(declare-fun tp!69296 () Bool)

(assert (=> mapNonEmpty!36527 (= mapRes!36527 (and tp!69296 e!555702))))

(declare-fun mapKey!36527 () (_ BitVec 32))

(declare-fun mapRest!36527 () (Array (_ BitVec 32) ValueCell!11018))

(declare-fun mapValue!36527 () ValueCell!11018)

(assert (=> mapNonEmpty!36527 (= (arr!29861 _values!1278) (store mapRest!36527 mapKey!36527 mapValue!36527))))

(assert (= (and start!84364 res!659282) b!985642))

(assert (= (and b!985642 res!659284) b!985640))

(assert (= (and b!985640 res!659285) b!985641))

(assert (= (and b!985641 res!659286) b!985648))

(assert (= (and b!985648 res!659280) b!985644))

(assert (= (and b!985644 res!659283) b!985649))

(assert (= (and b!985649 res!659281) b!985650))

(assert (= (and b!985650 res!659287) b!985643))

(assert (= (and b!985646 condMapEmpty!36527) mapIsEmpty!36527))

(assert (= (and b!985646 (not condMapEmpty!36527)) mapNonEmpty!36527))

(get-info :version)

(assert (= (and mapNonEmpty!36527 ((_ is ValueCellFull!11018) mapValue!36527)) b!985647))

(assert (= (and b!985646 ((_ is ValueCellFull!11018) mapDefault!36527)) b!985645))

(assert (= start!84364 b!985646))

(declare-fun b_lambda!14943 () Bool)

(assert (=> (not b_lambda!14943) (not b!985650)))

(declare-fun t!29505 () Bool)

(declare-fun tb!6683 () Bool)

(assert (=> (and start!84364 (= defaultEntry!1281 defaultEntry!1281) t!29505) tb!6683))

(declare-fun result!13363 () Bool)

(assert (=> tb!6683 (= result!13363 tp_is_empty!22999)))

(assert (=> b!985650 t!29505))

(declare-fun b_and!31883 () Bool)

(assert (= b_and!31881 (and (=> t!29505 result!13363) b_and!31883)))

(declare-fun m!913109 () Bool)

(assert (=> b!985640 m!913109))

(declare-fun m!913111 () Bool)

(assert (=> b!985643 m!913111))

(declare-fun m!913113 () Bool)

(assert (=> b!985643 m!913113))

(declare-fun m!913115 () Bool)

(assert (=> b!985643 m!913115))

(declare-fun m!913117 () Bool)

(assert (=> b!985643 m!913117))

(assert (=> b!985643 m!913111))

(declare-fun m!913119 () Bool)

(assert (=> b!985643 m!913119))

(assert (=> b!985643 m!913113))

(declare-fun m!913121 () Bool)

(assert (=> b!985643 m!913121))

(assert (=> b!985643 m!913115))

(declare-fun m!913123 () Bool)

(assert (=> mapNonEmpty!36527 m!913123))

(declare-fun m!913125 () Bool)

(assert (=> start!84364 m!913125))

(declare-fun m!913127 () Bool)

(assert (=> start!84364 m!913127))

(declare-fun m!913129 () Bool)

(assert (=> start!84364 m!913129))

(declare-fun m!913131 () Bool)

(assert (=> b!985641 m!913131))

(assert (=> b!985650 m!913111))

(declare-fun m!913133 () Bool)

(assert (=> b!985650 m!913133))

(declare-fun m!913135 () Bool)

(assert (=> b!985650 m!913135))

(declare-fun m!913137 () Bool)

(assert (=> b!985650 m!913137))

(assert (=> b!985650 m!913133))

(assert (=> b!985650 m!913137))

(declare-fun m!913139 () Bool)

(assert (=> b!985650 m!913139))

(assert (=> b!985644 m!913111))

(assert (=> b!985644 m!913111))

(declare-fun m!913141 () Bool)

(assert (=> b!985644 m!913141))

(check-sat (not start!84364) (not b_lambda!14943) tp_is_empty!22999 (not b!985641) (not b_next!19897) (not b!985643) (not b!985640) (not mapNonEmpty!36527) b_and!31883 (not b!985644) (not b!985650))
(check-sat b_and!31883 (not b_next!19897))
