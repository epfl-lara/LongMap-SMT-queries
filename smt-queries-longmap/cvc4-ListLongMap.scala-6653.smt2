; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83894 () Bool)

(assert start!83894)

(declare-fun b_free!19703 () Bool)

(declare-fun b_next!19703 () Bool)

(assert (=> start!83894 (= b_free!19703 (not b_next!19703))))

(declare-fun tp!68550 () Bool)

(declare-fun b_and!31495 () Bool)

(assert (=> start!83894 (= tp!68550 b_and!31495)))

(declare-fun mapIsEmpty!36074 () Bool)

(declare-fun mapRes!36074 () Bool)

(assert (=> mapIsEmpty!36074 mapRes!36074))

(declare-fun b!980346 () Bool)

(declare-fun res!656087 () Bool)

(declare-fun e!552581 () Bool)

(assert (=> b!980346 (=> (not res!656087) (not e!552581))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61403 0))(
  ( (array!61404 (arr!29559 (Array (_ BitVec 32) (_ BitVec 64))) (size!30038 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61403)

(assert (=> b!980346 (= res!656087 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30038 _keys!1544))))))

(declare-fun b!980347 () Bool)

(declare-fun e!552582 () Bool)

(assert (=> b!980347 (= e!552581 (not e!552582))))

(declare-fun res!656090 () Bool)

(assert (=> b!980347 (=> res!656090 e!552582)))

(assert (=> b!980347 (= res!656090 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29559 _keys!1544) from!1932)))))

(declare-datatypes ((V!35245 0))(
  ( (V!35246 (val!11399 Int)) )
))
(declare-datatypes ((tuple2!14620 0))(
  ( (tuple2!14621 (_1!7321 (_ BitVec 64)) (_2!7321 V!35245)) )
))
(declare-fun lt!435238 () tuple2!14620)

(declare-fun lt!435233 () tuple2!14620)

(declare-datatypes ((List!20488 0))(
  ( (Nil!20485) (Cons!20484 (h!21646 tuple2!14620) (t!29147 List!20488)) )
))
(declare-datatypes ((ListLongMap!13317 0))(
  ( (ListLongMap!13318 (toList!6674 List!20488)) )
))
(declare-fun lt!435234 () ListLongMap!13317)

(declare-fun lt!435230 () ListLongMap!13317)

(declare-fun +!2979 (ListLongMap!13317 tuple2!14620) ListLongMap!13317)

(assert (=> b!980347 (= (+!2979 lt!435234 lt!435238) (+!2979 lt!435230 lt!435233))))

(declare-fun lt!435235 () ListLongMap!13317)

(assert (=> b!980347 (= lt!435230 (+!2979 lt!435235 lt!435238))))

(declare-fun lt!435239 () V!35245)

(assert (=> b!980347 (= lt!435238 (tuple2!14621 (select (arr!29559 _keys!1544) from!1932) lt!435239))))

(assert (=> b!980347 (= lt!435234 (+!2979 lt!435235 lt!435233))))

(declare-fun minValue!1220 () V!35245)

(assert (=> b!980347 (= lt!435233 (tuple2!14621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32597 0))(
  ( (Unit!32598) )
))
(declare-fun lt!435231 () Unit!32597)

(declare-fun addCommutativeForDiffKeys!607 (ListLongMap!13317 (_ BitVec 64) V!35245 (_ BitVec 64) V!35245) Unit!32597)

(assert (=> b!980347 (= lt!435231 (addCommutativeForDiffKeys!607 lt!435235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29559 _keys!1544) from!1932) lt!435239))))

(declare-datatypes ((ValueCell!10867 0))(
  ( (ValueCellFull!10867 (v!13961 V!35245)) (EmptyCell!10867) )
))
(declare-datatypes ((array!61405 0))(
  ( (array!61406 (arr!29560 (Array (_ BitVec 32) ValueCell!10867)) (size!30039 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61405)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15324 (ValueCell!10867 V!35245) V!35245)

(declare-fun dynLambda!1765 (Int (_ BitVec 64)) V!35245)

(assert (=> b!980347 (= lt!435239 (get!15324 (select (arr!29560 _values!1278) from!1932) (dynLambda!1765 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435236 () ListLongMap!13317)

(declare-fun lt!435237 () tuple2!14620)

(assert (=> b!980347 (= lt!435235 (+!2979 lt!435236 lt!435237))))

(declare-fun zeroValue!1220 () V!35245)

(assert (=> b!980347 (= lt!435237 (tuple2!14621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3379 (array!61403 array!61405 (_ BitVec 32) (_ BitVec 32) V!35245 V!35245 (_ BitVec 32) Int) ListLongMap!13317)

(assert (=> b!980347 (= lt!435236 (getCurrentListMapNoExtraKeys!3379 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980348 () Bool)

(declare-fun res!656091 () Bool)

(assert (=> b!980348 (=> (not res!656091) (not e!552581))))

(assert (=> b!980348 (= res!656091 (and (= (size!30039 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30038 _keys!1544) (size!30039 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980349 () Bool)

(declare-fun e!552579 () Bool)

(declare-fun tp_is_empty!22697 () Bool)

(assert (=> b!980349 (= e!552579 tp_is_empty!22697)))

(declare-fun res!656092 () Bool)

(assert (=> start!83894 (=> (not res!656092) (not e!552581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83894 (= res!656092 (validMask!0 mask!1948))))

(assert (=> start!83894 e!552581))

(assert (=> start!83894 true))

(assert (=> start!83894 tp_is_empty!22697))

(declare-fun e!552580 () Bool)

(declare-fun array_inv!22851 (array!61405) Bool)

(assert (=> start!83894 (and (array_inv!22851 _values!1278) e!552580)))

(assert (=> start!83894 tp!68550))

(declare-fun array_inv!22852 (array!61403) Bool)

(assert (=> start!83894 (array_inv!22852 _keys!1544)))

(declare-fun b!980350 () Bool)

(declare-fun res!656086 () Bool)

(assert (=> b!980350 (=> (not res!656086) (not e!552581))))

(assert (=> b!980350 (= res!656086 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36074 () Bool)

(declare-fun tp!68551 () Bool)

(declare-fun e!552578 () Bool)

(assert (=> mapNonEmpty!36074 (= mapRes!36074 (and tp!68551 e!552578))))

(declare-fun mapRest!36074 () (Array (_ BitVec 32) ValueCell!10867))

(declare-fun mapKey!36074 () (_ BitVec 32))

(declare-fun mapValue!36074 () ValueCell!10867)

(assert (=> mapNonEmpty!36074 (= (arr!29560 _values!1278) (store mapRest!36074 mapKey!36074 mapValue!36074))))

(declare-fun b!980351 () Bool)

(assert (=> b!980351 (= e!552580 (and e!552579 mapRes!36074))))

(declare-fun condMapEmpty!36074 () Bool)

(declare-fun mapDefault!36074 () ValueCell!10867)

