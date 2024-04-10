; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84070 () Bool)

(assert start!84070)

(declare-fun b_free!19825 () Bool)

(declare-fun b_next!19825 () Bool)

(assert (=> start!84070 (= b_free!19825 (not b_next!19825))))

(declare-fun tp!68997 () Bool)

(declare-fun b_and!31733 () Bool)

(assert (=> start!84070 (= tp!68997 b_and!31733)))

(declare-fun b!982980 () Bool)

(declare-fun e!554075 () Bool)

(declare-fun tp_is_empty!22873 () Bool)

(assert (=> b!982980 (= e!554075 tp_is_empty!22873)))

(declare-fun b!982981 () Bool)

(declare-fun e!554076 () Bool)

(declare-fun e!554074 () Bool)

(assert (=> b!982981 (= e!554076 e!554074)))

(declare-fun res!657813 () Bool)

(assert (=> b!982981 (=> (not res!657813) (not e!554074))))

(declare-datatypes ((array!61735 0))(
  ( (array!61736 (arr!29725 (Array (_ BitVec 32) (_ BitVec 64))) (size!30204 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61735)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982981 (= res!657813 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29725 _keys!1544) from!1932))))))

(declare-datatypes ((V!35481 0))(
  ( (V!35482 (val!11487 Int)) )
))
(declare-fun lt!436367 () V!35481)

(declare-datatypes ((ValueCell!10955 0))(
  ( (ValueCellFull!10955 (v!14049 V!35481)) (EmptyCell!10955) )
))
(declare-datatypes ((array!61737 0))(
  ( (array!61738 (arr!29726 (Array (_ BitVec 32) ValueCell!10955)) (size!30205 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61737)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15421 (ValueCell!10955 V!35481) V!35481)

(declare-fun dynLambda!1802 (Int (_ BitVec 64)) V!35481)

(assert (=> b!982981 (= lt!436367 (get!15421 (select (arr!29726 _values!1278) from!1932) (dynLambda!1802 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35481)

(declare-fun minValue!1220 () V!35481)

(declare-datatypes ((tuple2!14718 0))(
  ( (tuple2!14719 (_1!7370 (_ BitVec 64)) (_2!7370 V!35481)) )
))
(declare-datatypes ((List!20595 0))(
  ( (Nil!20592) (Cons!20591 (h!21753 tuple2!14718) (t!29370 List!20595)) )
))
(declare-datatypes ((ListLongMap!13415 0))(
  ( (ListLongMap!13416 (toList!6723 List!20595)) )
))
(declare-fun lt!436368 () ListLongMap!13415)

(declare-fun getCurrentListMapNoExtraKeys!3419 (array!61735 array!61737 (_ BitVec 32) (_ BitVec 32) V!35481 V!35481 (_ BitVec 32) Int) ListLongMap!13415)

(assert (=> b!982981 (= lt!436368 (getCurrentListMapNoExtraKeys!3419 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982982 () Bool)

(declare-fun res!657815 () Bool)

(assert (=> b!982982 (=> (not res!657815) (not e!554076))))

(assert (=> b!982982 (= res!657815 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982983 () Bool)

(declare-fun res!657817 () Bool)

(assert (=> b!982983 (=> (not res!657817) (not e!554076))))

(assert (=> b!982983 (= res!657817 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30204 _keys!1544))))))

(declare-fun mapNonEmpty!36338 () Bool)

(declare-fun mapRes!36338 () Bool)

(declare-fun tp!68998 () Bool)

(declare-fun e!554072 () Bool)

(assert (=> mapNonEmpty!36338 (= mapRes!36338 (and tp!68998 e!554072))))

(declare-fun mapValue!36338 () ValueCell!10955)

(declare-fun mapKey!36338 () (_ BitVec 32))

(declare-fun mapRest!36338 () (Array (_ BitVec 32) ValueCell!10955))

(assert (=> mapNonEmpty!36338 (= (arr!29726 _values!1278) (store mapRest!36338 mapKey!36338 mapValue!36338))))

(declare-fun b!982984 () Bool)

(declare-fun res!657811 () Bool)

(assert (=> b!982984 (=> (not res!657811) (not e!554076))))

(assert (=> b!982984 (= res!657811 (and (= (size!30205 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30204 _keys!1544) (size!30205 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982985 () Bool)

(declare-fun res!657818 () Bool)

(assert (=> b!982985 (=> (not res!657818) (not e!554076))))

(declare-datatypes ((List!20596 0))(
  ( (Nil!20593) (Cons!20592 (h!21754 (_ BitVec 64)) (t!29371 List!20596)) )
))
(declare-fun arrayNoDuplicates!0 (array!61735 (_ BitVec 32) List!20596) Bool)

(assert (=> b!982985 (= res!657818 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20593))))

(declare-fun b!982986 () Bool)

(assert (=> b!982986 (= e!554074 (not true))))

(declare-fun lt!436366 () tuple2!14718)

(declare-fun lt!436369 () tuple2!14718)

(declare-fun +!3020 (ListLongMap!13415 tuple2!14718) ListLongMap!13415)

(assert (=> b!982986 (= (+!3020 (+!3020 lt!436368 lt!436366) lt!436369) (+!3020 (+!3020 lt!436368 lt!436369) lt!436366))))

(assert (=> b!982986 (= lt!436369 (tuple2!14719 (select (arr!29725 _keys!1544) from!1932) lt!436367))))

(assert (=> b!982986 (= lt!436366 (tuple2!14719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32679 0))(
  ( (Unit!32680) )
))
(declare-fun lt!436370 () Unit!32679)

(declare-fun addCommutativeForDiffKeys!648 (ListLongMap!13415 (_ BitVec 64) V!35481 (_ BitVec 64) V!35481) Unit!32679)

(assert (=> b!982986 (= lt!436370 (addCommutativeForDiffKeys!648 lt!436368 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29725 _keys!1544) from!1932) lt!436367))))

(declare-fun b!982987 () Bool)

(assert (=> b!982987 (= e!554072 tp_is_empty!22873)))

(declare-fun res!657814 () Bool)

(assert (=> start!84070 (=> (not res!657814) (not e!554076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84070 (= res!657814 (validMask!0 mask!1948))))

(assert (=> start!84070 e!554076))

(assert (=> start!84070 true))

(assert (=> start!84070 tp_is_empty!22873))

(declare-fun e!554071 () Bool)

(declare-fun array_inv!22987 (array!61737) Bool)

(assert (=> start!84070 (and (array_inv!22987 _values!1278) e!554071)))

(assert (=> start!84070 tp!68997))

(declare-fun array_inv!22988 (array!61735) Bool)

(assert (=> start!84070 (array_inv!22988 _keys!1544)))

(declare-fun b!982979 () Bool)

(assert (=> b!982979 (= e!554071 (and e!554075 mapRes!36338))))

(declare-fun condMapEmpty!36338 () Bool)

(declare-fun mapDefault!36338 () ValueCell!10955)

