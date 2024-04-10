; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83834 () Bool)

(assert start!83834)

(declare-fun b_free!19643 () Bool)

(declare-fun b_next!19643 () Bool)

(assert (=> start!83834 (= b_free!19643 (not b_next!19643))))

(declare-fun tp!68371 () Bool)

(declare-fun b_and!31375 () Bool)

(assert (=> start!83834 (= tp!68371 b_and!31375)))

(declare-fun res!655373 () Bool)

(declare-fun e!552038 () Bool)

(assert (=> start!83834 (=> (not res!655373) (not e!552038))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83834 (= res!655373 (validMask!0 mask!1948))))

(assert (=> start!83834 e!552038))

(assert (=> start!83834 true))

(declare-fun tp_is_empty!22637 () Bool)

(assert (=> start!83834 tp_is_empty!22637))

(declare-datatypes ((V!35165 0))(
  ( (V!35166 (val!11369 Int)) )
))
(declare-datatypes ((ValueCell!10837 0))(
  ( (ValueCellFull!10837 (v!13931 V!35165)) (EmptyCell!10837) )
))
(declare-datatypes ((array!61293 0))(
  ( (array!61294 (arr!29504 (Array (_ BitVec 32) ValueCell!10837)) (size!29983 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61293)

(declare-fun e!552037 () Bool)

(declare-fun array_inv!22813 (array!61293) Bool)

(assert (=> start!83834 (and (array_inv!22813 _values!1278) e!552037)))

(assert (=> start!83834 tp!68371))

(declare-datatypes ((array!61295 0))(
  ( (array!61296 (arr!29505 (Array (_ BitVec 32) (_ BitVec 64))) (size!29984 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61295)

(declare-fun array_inv!22814 (array!61295) Bool)

(assert (=> start!83834 (array_inv!22814 _keys!1544)))

(declare-fun b!979296 () Bool)

(declare-fun e!552041 () Bool)

(assert (=> b!979296 (= e!552041 true)))

(declare-datatypes ((tuple2!14586 0))(
  ( (tuple2!14587 (_1!7304 (_ BitVec 64)) (_2!7304 V!35165)) )
))
(declare-datatypes ((List!20455 0))(
  ( (Nil!20452) (Cons!20451 (h!21613 tuple2!14586) (t!29054 List!20455)) )
))
(declare-datatypes ((ListLongMap!13283 0))(
  ( (ListLongMap!13284 (toList!6657 List!20455)) )
))
(declare-fun lt!434335 () ListLongMap!13283)

(declare-fun lt!434337 () tuple2!14586)

(declare-fun lt!434330 () tuple2!14586)

(declare-fun lt!434338 () ListLongMap!13283)

(declare-fun +!2962 (ListLongMap!13283 tuple2!14586) ListLongMap!13283)

(assert (=> b!979296 (= lt!434338 (+!2962 (+!2962 lt!434335 lt!434337) lt!434330))))

(declare-datatypes ((Unit!32563 0))(
  ( (Unit!32564) )
))
(declare-fun lt!434331 () Unit!32563)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!434336 () V!35165)

(declare-fun zeroValue!1220 () V!35165)

(declare-fun addCommutativeForDiffKeys!590 (ListLongMap!13283 (_ BitVec 64) V!35165 (_ BitVec 64) V!35165) Unit!32563)

(assert (=> b!979296 (= lt!434331 (addCommutativeForDiffKeys!590 lt!434335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29505 _keys!1544) from!1932) lt!434336))))

(declare-fun b!979297 () Bool)

(declare-fun res!655372 () Bool)

(assert (=> b!979297 (=> (not res!655372) (not e!552038))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979297 (= res!655372 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!35984 () Bool)

(declare-fun mapRes!35984 () Bool)

(assert (=> mapIsEmpty!35984 mapRes!35984))

(declare-fun b!979298 () Bool)

(declare-fun res!655367 () Bool)

(assert (=> b!979298 (=> (not res!655367) (not e!552038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979298 (= res!655367 (validKeyInArray!0 (select (arr!29505 _keys!1544) from!1932)))))

(declare-fun b!979299 () Bool)

(declare-fun e!552040 () Bool)

(assert (=> b!979299 (= e!552040 tp_is_empty!22637)))

(declare-fun b!979300 () Bool)

(declare-fun res!655371 () Bool)

(assert (=> b!979300 (=> (not res!655371) (not e!552038))))

(declare-datatypes ((List!20456 0))(
  ( (Nil!20453) (Cons!20452 (h!21614 (_ BitVec 64)) (t!29055 List!20456)) )
))
(declare-fun arrayNoDuplicates!0 (array!61295 (_ BitVec 32) List!20456) Bool)

(assert (=> b!979300 (= res!655371 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20453))))

(declare-fun b!979301 () Bool)

(assert (=> b!979301 (= e!552038 (not e!552041))))

(declare-fun res!655370 () Bool)

(assert (=> b!979301 (=> res!655370 e!552041)))

(assert (=> b!979301 (= res!655370 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29505 _keys!1544) from!1932)))))

(declare-fun lt!434339 () tuple2!14586)

(declare-fun lt!434333 () ListLongMap!13283)

(assert (=> b!979301 (= (+!2962 lt!434333 lt!434337) (+!2962 lt!434338 lt!434339))))

(declare-fun lt!434334 () ListLongMap!13283)

(assert (=> b!979301 (= lt!434338 (+!2962 lt!434334 lt!434337))))

(assert (=> b!979301 (= lt!434337 (tuple2!14587 (select (arr!29505 _keys!1544) from!1932) lt!434336))))

(assert (=> b!979301 (= lt!434333 (+!2962 lt!434334 lt!434339))))

(declare-fun minValue!1220 () V!35165)

(assert (=> b!979301 (= lt!434339 (tuple2!14587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434332 () Unit!32563)

(assert (=> b!979301 (= lt!434332 (addCommutativeForDiffKeys!590 lt!434334 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29505 _keys!1544) from!1932) lt!434336))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15288 (ValueCell!10837 V!35165) V!35165)

(declare-fun dynLambda!1749 (Int (_ BitVec 64)) V!35165)

(assert (=> b!979301 (= lt!434336 (get!15288 (select (arr!29504 _values!1278) from!1932) (dynLambda!1749 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979301 (= lt!434334 (+!2962 lt!434335 lt!434330))))

(assert (=> b!979301 (= lt!434330 (tuple2!14587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3363 (array!61295 array!61293 (_ BitVec 32) (_ BitVec 32) V!35165 V!35165 (_ BitVec 32) Int) ListLongMap!13283)

(assert (=> b!979301 (= lt!434335 (getCurrentListMapNoExtraKeys!3363 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979302 () Bool)

(declare-fun e!552039 () Bool)

(assert (=> b!979302 (= e!552037 (and e!552039 mapRes!35984))))

(declare-fun condMapEmpty!35984 () Bool)

(declare-fun mapDefault!35984 () ValueCell!10837)

