; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84448 () Bool)

(assert start!84448)

(declare-fun b_free!19999 () Bool)

(declare-fun b_next!19999 () Bool)

(assert (=> start!84448 (= b_free!19999 (not b_next!19999))))

(declare-fun tp!69777 () Bool)

(declare-fun b_and!32065 () Bool)

(assert (=> start!84448 (= tp!69777 b_and!32065)))

(declare-fun b!987700 () Bool)

(declare-fun e!556944 () Bool)

(declare-fun e!556943 () Bool)

(assert (=> b!987700 (= e!556944 (not e!556943))))

(declare-fun res!660752 () Bool)

(assert (=> b!987700 (=> res!660752 e!556943)))

(declare-datatypes ((array!62389 0))(
  ( (array!62390 (arr!30050 (Array (_ BitVec 32) (_ BitVec 64))) (size!30529 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62389)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987700 (= res!660752 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30050 _keys!1544) from!1932)))))

(declare-datatypes ((V!35937 0))(
  ( (V!35938 (val!11658 Int)) )
))
(declare-datatypes ((tuple2!14852 0))(
  ( (tuple2!14853 (_1!7437 (_ BitVec 64)) (_2!7437 V!35937)) )
))
(declare-fun lt!437940 () tuple2!14852)

(declare-fun lt!437947 () tuple2!14852)

(declare-datatypes ((List!20783 0))(
  ( (Nil!20780) (Cons!20779 (h!21941 tuple2!14852) (t!29710 List!20783)) )
))
(declare-datatypes ((ListLongMap!13549 0))(
  ( (ListLongMap!13550 (toList!6790 List!20783)) )
))
(declare-fun lt!437942 () ListLongMap!13549)

(declare-fun lt!437943 () ListLongMap!13549)

(declare-fun +!3075 (ListLongMap!13549 tuple2!14852) ListLongMap!13549)

(assert (=> b!987700 (= (+!3075 lt!437942 lt!437940) (+!3075 lt!437943 lt!437947))))

(declare-fun lt!437946 () ListLongMap!13549)

(assert (=> b!987700 (= lt!437943 (+!3075 lt!437946 lt!437940))))

(declare-fun lt!437945 () V!35937)

(assert (=> b!987700 (= lt!437940 (tuple2!14853 (select (arr!30050 _keys!1544) from!1932) lt!437945))))

(assert (=> b!987700 (= lt!437942 (+!3075 lt!437946 lt!437947))))

(declare-fun minValue!1220 () V!35937)

(assert (=> b!987700 (= lt!437947 (tuple2!14853 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32783 0))(
  ( (Unit!32784) )
))
(declare-fun lt!437948 () Unit!32783)

(declare-fun addCommutativeForDiffKeys!699 (ListLongMap!13549 (_ BitVec 64) V!35937 (_ BitVec 64) V!35937) Unit!32783)

(assert (=> b!987700 (= lt!437948 (addCommutativeForDiffKeys!699 lt!437946 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30050 _keys!1544) from!1932) lt!437945))))

(declare-datatypes ((ValueCell!11126 0))(
  ( (ValueCellFull!11126 (v!14222 V!35937)) (EmptyCell!11126) )
))
(declare-datatypes ((array!62391 0))(
  ( (array!62392 (arr!30051 (Array (_ BitVec 32) ValueCell!11126)) (size!30530 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62391)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15593 (ValueCell!11126 V!35937) V!35937)

(declare-fun dynLambda!1858 (Int (_ BitVec 64)) V!35937)

(assert (=> b!987700 (= lt!437945 (get!15593 (select (arr!30051 _values!1278) from!1932) (dynLambda!1858 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!437949 () ListLongMap!13549)

(declare-fun lt!437944 () tuple2!14852)

(assert (=> b!987700 (= lt!437946 (+!3075 lt!437949 lt!437944))))

(declare-fun zeroValue!1220 () V!35937)

(assert (=> b!987700 (= lt!437944 (tuple2!14853 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3481 (array!62389 array!62391 (_ BitVec 32) (_ BitVec 32) V!35937 V!35937 (_ BitVec 32) Int) ListLongMap!13549)

(assert (=> b!987700 (= lt!437949 (getCurrentListMapNoExtraKeys!3481 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!987701 () Bool)

(declare-fun res!660751 () Bool)

(assert (=> b!987701 (=> (not res!660751) (not e!556944))))

(assert (=> b!987701 (= res!660751 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987702 () Bool)

(declare-fun e!556946 () Bool)

(declare-fun tp_is_empty!23215 () Bool)

(assert (=> b!987702 (= e!556946 tp_is_empty!23215)))

(declare-fun res!660754 () Bool)

(assert (=> start!84448 (=> (not res!660754) (not e!556944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84448 (= res!660754 (validMask!0 mask!1948))))

(assert (=> start!84448 e!556944))

(assert (=> start!84448 true))

(assert (=> start!84448 tp_is_empty!23215))

(declare-fun e!556948 () Bool)

(declare-fun array_inv!23219 (array!62391) Bool)

(assert (=> start!84448 (and (array_inv!23219 _values!1278) e!556948)))

(assert (=> start!84448 tp!69777))

(declare-fun array_inv!23220 (array!62389) Bool)

(assert (=> start!84448 (array_inv!23220 _keys!1544)))

(declare-fun b!987703 () Bool)

(assert (=> b!987703 (= e!556943 (bvslt from!1932 (size!30530 _values!1278)))))

(declare-fun lt!437939 () ListLongMap!13549)

(declare-fun getCurrentListMap!3857 (array!62389 array!62391 (_ BitVec 32) (_ BitVec 32) V!35937 V!35937 (_ BitVec 32) Int) ListLongMap!13549)

(assert (=> b!987703 (= lt!437939 (getCurrentListMap!3857 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (=> b!987703 (= lt!437943 (+!3075 (+!3075 lt!437949 lt!437940) lt!437944))))

(declare-fun lt!437941 () Unit!32783)

(assert (=> b!987703 (= lt!437941 (addCommutativeForDiffKeys!699 lt!437949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30050 _keys!1544) from!1932) lt!437945))))

(declare-fun b!987704 () Bool)

(declare-fun res!660753 () Bool)

(assert (=> b!987704 (=> (not res!660753) (not e!556944))))

(assert (=> b!987704 (= res!660753 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30529 _keys!1544))))))

(declare-fun b!987705 () Bool)

(declare-fun e!556947 () Bool)

(assert (=> b!987705 (= e!556947 tp_is_empty!23215)))

(declare-fun mapIsEmpty!36857 () Bool)

(declare-fun mapRes!36857 () Bool)

(assert (=> mapIsEmpty!36857 mapRes!36857))

(declare-fun b!987706 () Bool)

(declare-fun res!660750 () Bool)

(assert (=> b!987706 (=> (not res!660750) (not e!556944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987706 (= res!660750 (validKeyInArray!0 (select (arr!30050 _keys!1544) from!1932)))))

(declare-fun b!987707 () Bool)

(declare-fun res!660748 () Bool)

(assert (=> b!987707 (=> (not res!660748) (not e!556944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62389 (_ BitVec 32)) Bool)

(assert (=> b!987707 (= res!660748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36857 () Bool)

(declare-fun tp!69778 () Bool)

(assert (=> mapNonEmpty!36857 (= mapRes!36857 (and tp!69778 e!556946))))

(declare-fun mapKey!36857 () (_ BitVec 32))

(declare-fun mapRest!36857 () (Array (_ BitVec 32) ValueCell!11126))

(declare-fun mapValue!36857 () ValueCell!11126)

(assert (=> mapNonEmpty!36857 (= (arr!30051 _values!1278) (store mapRest!36857 mapKey!36857 mapValue!36857))))

(declare-fun b!987708 () Bool)

(declare-fun res!660749 () Bool)

(assert (=> b!987708 (=> (not res!660749) (not e!556944))))

(declare-datatypes ((List!20784 0))(
  ( (Nil!20781) (Cons!20780 (h!21942 (_ BitVec 64)) (t!29711 List!20784)) )
))
(declare-fun arrayNoDuplicates!0 (array!62389 (_ BitVec 32) List!20784) Bool)

(assert (=> b!987708 (= res!660749 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20781))))

(declare-fun b!987709 () Bool)

(declare-fun res!660747 () Bool)

(assert (=> b!987709 (=> (not res!660747) (not e!556944))))

(assert (=> b!987709 (= res!660747 (and (= (size!30530 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30529 _keys!1544) (size!30530 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987710 () Bool)

(assert (=> b!987710 (= e!556948 (and e!556947 mapRes!36857))))

(declare-fun condMapEmpty!36857 () Bool)

(declare-fun mapDefault!36857 () ValueCell!11126)

