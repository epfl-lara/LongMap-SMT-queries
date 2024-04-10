; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84206 () Bool)

(assert start!84206)

(declare-fun b_free!19907 () Bool)

(declare-fun b_next!19907 () Bool)

(assert (=> start!84206 (= b_free!19907 (not b_next!19907))))

(declare-fun tp!69325 () Bool)

(declare-fun b_and!31891 () Bool)

(assert (=> start!84206 (= tp!69325 b_and!31891)))

(declare-fun b!984912 () Bool)

(declare-fun e!555205 () Bool)

(declare-fun tp_is_empty!23009 () Bool)

(assert (=> b!984912 (= e!555205 tp_is_empty!23009)))

(declare-fun b!984913 () Bool)

(declare-fun res!659059 () Bool)

(declare-fun e!555206 () Bool)

(assert (=> b!984913 (=> (not res!659059) (not e!555206))))

(declare-datatypes ((array!61997 0))(
  ( (array!61998 (arr!29856 (Array (_ BitVec 32) (_ BitVec 64))) (size!30335 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61997)

(declare-datatypes ((List!20674 0))(
  ( (Nil!20671) (Cons!20670 (h!21832 (_ BitVec 64)) (t!29525 List!20674)) )
))
(declare-fun arrayNoDuplicates!0 (array!61997 (_ BitVec 32) List!20674) Bool)

(assert (=> b!984913 (= res!659059 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20671))))

(declare-fun b!984914 () Bool)

(declare-fun res!659056 () Bool)

(assert (=> b!984914 (=> (not res!659056) (not e!555206))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61997 (_ BitVec 32)) Bool)

(assert (=> b!984914 (= res!659056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984915 () Bool)

(declare-fun res!659057 () Bool)

(assert (=> b!984915 (=> (not res!659057) (not e!555206))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984915 (= res!659057 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984916 () Bool)

(declare-fun res!659060 () Bool)

(assert (=> b!984916 (=> (not res!659060) (not e!555206))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984916 (= res!659060 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30335 _keys!1544))))))

(declare-fun b!984917 () Bool)

(declare-fun e!555210 () Bool)

(assert (=> b!984917 (= e!555206 e!555210)))

(declare-fun res!659058 () Bool)

(assert (=> b!984917 (=> (not res!659058) (not e!555210))))

(assert (=> b!984917 (= res!659058 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29856 _keys!1544) from!1932))))))

(declare-datatypes ((V!35661 0))(
  ( (V!35662 (val!11555 Int)) )
))
(declare-datatypes ((ValueCell!11023 0))(
  ( (ValueCellFull!11023 (v!14117 V!35661)) (EmptyCell!11023) )
))
(declare-datatypes ((array!61999 0))(
  ( (array!62000 (arr!29857 (Array (_ BitVec 32) ValueCell!11023)) (size!30336 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61999)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!437017 () V!35661)

(declare-fun get!15490 (ValueCell!11023 V!35661) V!35661)

(declare-fun dynLambda!1827 (Int (_ BitVec 64)) V!35661)

(assert (=> b!984917 (= lt!437017 (get!15490 (select (arr!29857 _values!1278) from!1932) (dynLambda!1827 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35661)

(declare-fun zeroValue!1220 () V!35661)

(declare-datatypes ((tuple2!14782 0))(
  ( (tuple2!14783 (_1!7402 (_ BitVec 64)) (_2!7402 V!35661)) )
))
(declare-datatypes ((List!20675 0))(
  ( (Nil!20672) (Cons!20671 (h!21833 tuple2!14782) (t!29526 List!20675)) )
))
(declare-datatypes ((ListLongMap!13479 0))(
  ( (ListLongMap!13480 (toList!6755 List!20675)) )
))
(declare-fun lt!437018 () ListLongMap!13479)

(declare-fun getCurrentListMapNoExtraKeys!3447 (array!61997 array!61999 (_ BitVec 32) (_ BitVec 32) V!35661 V!35661 (_ BitVec 32) Int) ListLongMap!13479)

(assert (=> b!984917 (= lt!437018 (getCurrentListMapNoExtraKeys!3447 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36542 () Bool)

(declare-fun mapRes!36542 () Bool)

(assert (=> mapIsEmpty!36542 mapRes!36542))

(declare-fun b!984918 () Bool)

(declare-fun res!659062 () Bool)

(assert (=> b!984918 (=> (not res!659062) (not e!555206))))

(assert (=> b!984918 (= res!659062 (and (= (size!30336 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30335 _keys!1544) (size!30336 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!659061 () Bool)

(assert (=> start!84206 (=> (not res!659061) (not e!555206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84206 (= res!659061 (validMask!0 mask!1948))))

(assert (=> start!84206 e!555206))

(assert (=> start!84206 true))

(assert (=> start!84206 tp_is_empty!23009))

(declare-fun e!555208 () Bool)

(declare-fun array_inv!23081 (array!61999) Bool)

(assert (=> start!84206 (and (array_inv!23081 _values!1278) e!555208)))

(assert (=> start!84206 tp!69325))

(declare-fun array_inv!23082 (array!61997) Bool)

(assert (=> start!84206 (array_inv!23082 _keys!1544)))

(declare-fun b!984919 () Bool)

(declare-fun res!659063 () Bool)

(assert (=> b!984919 (=> (not res!659063) (not e!555206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984919 (= res!659063 (validKeyInArray!0 (select (arr!29856 _keys!1544) from!1932)))))

(declare-fun b!984920 () Bool)

(declare-fun e!555207 () Bool)

(assert (=> b!984920 (= e!555207 tp_is_empty!23009)))

(declare-fun b!984921 () Bool)

(assert (=> b!984921 (= e!555210 (not true))))

(declare-fun lt!437021 () tuple2!14782)

(declare-fun lt!437019 () tuple2!14782)

(declare-fun +!3046 (ListLongMap!13479 tuple2!14782) ListLongMap!13479)

(assert (=> b!984921 (= (+!3046 (+!3046 lt!437018 lt!437021) lt!437019) (+!3046 (+!3046 lt!437018 lt!437019) lt!437021))))

(assert (=> b!984921 (= lt!437019 (tuple2!14783 (select (arr!29856 _keys!1544) from!1932) lt!437017))))

(assert (=> b!984921 (= lt!437021 (tuple2!14783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32731 0))(
  ( (Unit!32732) )
))
(declare-fun lt!437020 () Unit!32731)

(declare-fun addCommutativeForDiffKeys!674 (ListLongMap!13479 (_ BitVec 64) V!35661 (_ BitVec 64) V!35661) Unit!32731)

(assert (=> b!984921 (= lt!437020 (addCommutativeForDiffKeys!674 lt!437018 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29856 _keys!1544) from!1932) lt!437017))))

(declare-fun mapNonEmpty!36542 () Bool)

(declare-fun tp!69324 () Bool)

(assert (=> mapNonEmpty!36542 (= mapRes!36542 (and tp!69324 e!555207))))

(declare-fun mapKey!36542 () (_ BitVec 32))

(declare-fun mapValue!36542 () ValueCell!11023)

(declare-fun mapRest!36542 () (Array (_ BitVec 32) ValueCell!11023))

(assert (=> mapNonEmpty!36542 (= (arr!29857 _values!1278) (store mapRest!36542 mapKey!36542 mapValue!36542))))

(declare-fun b!984922 () Bool)

(assert (=> b!984922 (= e!555208 (and e!555205 mapRes!36542))))

(declare-fun condMapEmpty!36542 () Bool)

(declare-fun mapDefault!36542 () ValueCell!11023)

