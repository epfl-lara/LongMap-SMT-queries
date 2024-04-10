; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83828 () Bool)

(assert start!83828)

(declare-fun b_free!19637 () Bool)

(declare-fun b_next!19637 () Bool)

(assert (=> start!83828 (= b_free!19637 (not b_next!19637))))

(declare-fun tp!68352 () Bool)

(declare-fun b_and!31363 () Bool)

(assert (=> start!83828 (= tp!68352 b_and!31363)))

(declare-fun b!979191 () Bool)

(declare-fun res!655294 () Bool)

(declare-fun e!551985 () Bool)

(assert (=> b!979191 (=> (not res!655294) (not e!551985))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979191 (= res!655294 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979192 () Bool)

(declare-fun res!655297 () Bool)

(assert (=> b!979192 (=> (not res!655297) (not e!551985))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35157 0))(
  ( (V!35158 (val!11366 Int)) )
))
(declare-datatypes ((ValueCell!10834 0))(
  ( (ValueCellFull!10834 (v!13928 V!35157)) (EmptyCell!10834) )
))
(declare-datatypes ((array!61281 0))(
  ( (array!61282 (arr!29498 (Array (_ BitVec 32) ValueCell!10834)) (size!29977 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61281)

(declare-datatypes ((array!61283 0))(
  ( (array!61284 (arr!29499 (Array (_ BitVec 32) (_ BitVec 64))) (size!29978 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61283)

(assert (=> b!979192 (= res!655297 (and (= (size!29977 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29978 _keys!1544) (size!29977 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!655295 () Bool)

(assert (=> start!83828 (=> (not res!655295) (not e!551985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83828 (= res!655295 (validMask!0 mask!1948))))

(assert (=> start!83828 e!551985))

(assert (=> start!83828 true))

(declare-fun tp_is_empty!22631 () Bool)

(assert (=> start!83828 tp_is_empty!22631))

(declare-fun e!551984 () Bool)

(declare-fun array_inv!22807 (array!61281) Bool)

(assert (=> start!83828 (and (array_inv!22807 _values!1278) e!551984)))

(assert (=> start!83828 tp!68352))

(declare-fun array_inv!22808 (array!61283) Bool)

(assert (=> start!83828 (array_inv!22808 _keys!1544)))

(declare-fun b!979193 () Bool)

(declare-fun e!551986 () Bool)

(assert (=> b!979193 (= e!551985 (not e!551986))))

(declare-fun res!655299 () Bool)

(assert (=> b!979193 (=> res!655299 e!551986)))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979193 (= res!655299 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29499 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14580 0))(
  ( (tuple2!14581 (_1!7301 (_ BitVec 64)) (_2!7301 V!35157)) )
))
(declare-fun lt!434248 () tuple2!14580)

(declare-fun lt!434242 () tuple2!14580)

(declare-datatypes ((List!20450 0))(
  ( (Nil!20447) (Cons!20446 (h!21608 tuple2!14580) (t!29043 List!20450)) )
))
(declare-datatypes ((ListLongMap!13277 0))(
  ( (ListLongMap!13278 (toList!6654 List!20450)) )
))
(declare-fun lt!434244 () ListLongMap!13277)

(declare-fun lt!434240 () ListLongMap!13277)

(declare-fun +!2959 (ListLongMap!13277 tuple2!14580) ListLongMap!13277)

(assert (=> b!979193 (= (+!2959 lt!434244 lt!434242) (+!2959 lt!434240 lt!434248))))

(declare-fun lt!434249 () ListLongMap!13277)

(assert (=> b!979193 (= lt!434240 (+!2959 lt!434249 lt!434242))))

(declare-fun lt!434246 () V!35157)

(assert (=> b!979193 (= lt!434242 (tuple2!14581 (select (arr!29499 _keys!1544) from!1932) lt!434246))))

(assert (=> b!979193 (= lt!434244 (+!2959 lt!434249 lt!434248))))

(declare-fun minValue!1220 () V!35157)

(assert (=> b!979193 (= lt!434248 (tuple2!14581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32557 0))(
  ( (Unit!32558) )
))
(declare-fun lt!434243 () Unit!32557)

(declare-fun addCommutativeForDiffKeys!587 (ListLongMap!13277 (_ BitVec 64) V!35157 (_ BitVec 64) V!35157) Unit!32557)

(assert (=> b!979193 (= lt!434243 (addCommutativeForDiffKeys!587 lt!434249 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29499 _keys!1544) from!1932) lt!434246))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15283 (ValueCell!10834 V!35157) V!35157)

(declare-fun dynLambda!1746 (Int (_ BitVec 64)) V!35157)

(assert (=> b!979193 (= lt!434246 (get!15283 (select (arr!29498 _values!1278) from!1932) (dynLambda!1746 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434247 () ListLongMap!13277)

(declare-fun lt!434245 () tuple2!14580)

(assert (=> b!979193 (= lt!434249 (+!2959 lt!434247 lt!434245))))

(declare-fun zeroValue!1220 () V!35157)

(assert (=> b!979193 (= lt!434245 (tuple2!14581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3360 (array!61283 array!61281 (_ BitVec 32) (_ BitVec 32) V!35157 V!35157 (_ BitVec 32) Int) ListLongMap!13277)

(assert (=> b!979193 (= lt!434247 (getCurrentListMapNoExtraKeys!3360 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!35975 () Bool)

(declare-fun mapRes!35975 () Bool)

(declare-fun tp!68353 () Bool)

(declare-fun e!551988 () Bool)

(assert (=> mapNonEmpty!35975 (= mapRes!35975 (and tp!68353 e!551988))))

(declare-fun mapRest!35975 () (Array (_ BitVec 32) ValueCell!10834))

(declare-fun mapValue!35975 () ValueCell!10834)

(declare-fun mapKey!35975 () (_ BitVec 32))

(assert (=> mapNonEmpty!35975 (= (arr!29498 _values!1278) (store mapRest!35975 mapKey!35975 mapValue!35975))))

(declare-fun b!979194 () Bool)

(declare-fun res!655300 () Bool)

(assert (=> b!979194 (=> (not res!655300) (not e!551985))))

(declare-datatypes ((List!20451 0))(
  ( (Nil!20448) (Cons!20447 (h!21609 (_ BitVec 64)) (t!29044 List!20451)) )
))
(declare-fun arrayNoDuplicates!0 (array!61283 (_ BitVec 32) List!20451) Bool)

(assert (=> b!979194 (= res!655300 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20448))))

(declare-fun b!979195 () Bool)

(declare-fun res!655298 () Bool)

(assert (=> b!979195 (=> (not res!655298) (not e!551985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61283 (_ BitVec 32)) Bool)

(assert (=> b!979195 (= res!655298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979196 () Bool)

(declare-fun res!655296 () Bool)

(assert (=> b!979196 (=> (not res!655296) (not e!551985))))

(assert (=> b!979196 (= res!655296 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29978 _keys!1544))))))

(declare-fun b!979197 () Bool)

(declare-fun res!655301 () Bool)

(assert (=> b!979197 (=> (not res!655301) (not e!551985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979197 (= res!655301 (validKeyInArray!0 (select (arr!29499 _keys!1544) from!1932)))))

(declare-fun b!979198 () Bool)

(assert (=> b!979198 (= e!551988 tp_is_empty!22631)))

(declare-fun b!979199 () Bool)

(declare-fun e!551983 () Bool)

(assert (=> b!979199 (= e!551984 (and e!551983 mapRes!35975))))

(declare-fun condMapEmpty!35975 () Bool)

(declare-fun mapDefault!35975 () ValueCell!10834)

