; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83314 () Bool)

(assert start!83314)

(declare-fun b_free!19307 () Bool)

(declare-fun b_next!19307 () Bool)

(assert (=> start!83314 (= b_free!19307 (not b_next!19307))))

(declare-fun tp!67200 () Bool)

(declare-fun b_and!30835 () Bool)

(assert (=> start!83314 (= tp!67200 b_and!30835)))

(declare-fun b!972511 () Bool)

(declare-fun e!548166 () Bool)

(declare-fun tp_is_empty!22205 () Bool)

(assert (=> b!972511 (= e!548166 tp_is_empty!22205)))

(declare-fun b!972512 () Bool)

(declare-fun e!548167 () Bool)

(assert (=> b!972512 (= e!548167 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34589 0))(
  ( (V!34590 (val!11153 Int)) )
))
(declare-datatypes ((ValueCell!10621 0))(
  ( (ValueCellFull!10621 (v!13712 V!34589)) (EmptyCell!10621) )
))
(declare-datatypes ((array!60457 0))(
  ( (array!60458 (arr!29092 (Array (_ BitVec 32) ValueCell!10621)) (size!29571 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60457)

(declare-fun zeroValue!1367 () V!34589)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34589)

(declare-fun lt!432056 () (_ BitVec 64))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60459 0))(
  ( (array!60460 (arr!29093 (Array (_ BitVec 32) (_ BitVec 64))) (size!29572 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60459)

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((tuple2!14306 0))(
  ( (tuple2!14307 (_1!7164 (_ BitVec 64)) (_2!7164 V!34589)) )
))
(declare-datatypes ((List!20171 0))(
  ( (Nil!20168) (Cons!20167 (h!21329 tuple2!14306) (t!28576 List!20171)) )
))
(declare-datatypes ((ListLongMap!13003 0))(
  ( (ListLongMap!13004 (toList!6517 List!20171)) )
))
(declare-fun lt!432054 () ListLongMap!13003)

(declare-fun +!2891 (ListLongMap!13003 tuple2!14306) ListLongMap!13003)

(declare-fun getCurrentListMap!3750 (array!60459 array!60457 (_ BitVec 32) (_ BitVec 32) V!34589 V!34589 (_ BitVec 32) Int) ListLongMap!13003)

(declare-fun get!15072 (ValueCell!10621 V!34589) V!34589)

(declare-fun dynLambda!1680 (Int (_ BitVec 64)) V!34589)

(assert (=> b!972512 (= lt!432054 (+!2891 (getCurrentListMap!3750 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14307 lt!432056 (get!15072 (select (arr!29092 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1680 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32403 0))(
  ( (Unit!32404) )
))
(declare-fun lt!432055 () Unit!32403)

(declare-fun lemmaListMapRecursiveValidKeyArray!257 (array!60459 array!60457 (_ BitVec 32) (_ BitVec 32) V!34589 V!34589 (_ BitVec 32) Int) Unit!32403)

(assert (=> b!972512 (= lt!432055 (lemmaListMapRecursiveValidKeyArray!257 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972513 () Bool)

(declare-fun res!650963 () Bool)

(declare-fun e!548164 () Bool)

(assert (=> b!972513 (=> (not res!650963) (not e!548164))))

(assert (=> b!972513 (= res!650963 (and (= (size!29571 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29572 _keys!1717) (size!29571 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972514 () Bool)

(declare-fun res!650961 () Bool)

(assert (=> b!972514 (=> (not res!650961) (not e!548164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60459 (_ BitVec 32)) Bool)

(assert (=> b!972514 (= res!650961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35317 () Bool)

(declare-fun mapRes!35317 () Bool)

(assert (=> mapIsEmpty!35317 mapRes!35317))

(declare-fun b!972515 () Bool)

(assert (=> b!972515 (= e!548164 e!548167)))

(declare-fun res!650962 () Bool)

(assert (=> b!972515 (=> (not res!650962) (not e!548167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972515 (= res!650962 (validKeyInArray!0 lt!432056))))

(assert (=> b!972515 (= lt!432056 (select (arr!29093 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972515 (= lt!432054 (getCurrentListMap!3750 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972516 () Bool)

(declare-fun res!650958 () Bool)

(assert (=> b!972516 (=> (not res!650958) (not e!548164))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972516 (= res!650958 (validKeyInArray!0 (select (arr!29093 _keys!1717) i!822)))))

(declare-fun b!972517 () Bool)

(declare-fun res!650957 () Bool)

(assert (=> b!972517 (=> (not res!650957) (not e!548164))))

(declare-datatypes ((List!20172 0))(
  ( (Nil!20169) (Cons!20168 (h!21330 (_ BitVec 64)) (t!28577 List!20172)) )
))
(declare-fun arrayNoDuplicates!0 (array!60459 (_ BitVec 32) List!20172) Bool)

(assert (=> b!972517 (= res!650957 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20169))))

(declare-fun b!972518 () Bool)

(declare-fun res!650960 () Bool)

(assert (=> b!972518 (=> (not res!650960) (not e!548164))))

(assert (=> b!972518 (= res!650960 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29572 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29572 _keys!1717))))))

(declare-fun res!650964 () Bool)

(assert (=> start!83314 (=> (not res!650964) (not e!548164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83314 (= res!650964 (validMask!0 mask!2147))))

(assert (=> start!83314 e!548164))

(assert (=> start!83314 true))

(declare-fun e!548162 () Bool)

(declare-fun array_inv!22505 (array!60457) Bool)

(assert (=> start!83314 (and (array_inv!22505 _values!1425) e!548162)))

(assert (=> start!83314 tp_is_empty!22205))

(assert (=> start!83314 tp!67200))

(declare-fun array_inv!22506 (array!60459) Bool)

(assert (=> start!83314 (array_inv!22506 _keys!1717)))

(declare-fun b!972519 () Bool)

(assert (=> b!972519 (= e!548162 (and e!548166 mapRes!35317))))

(declare-fun condMapEmpty!35317 () Bool)

(declare-fun mapDefault!35317 () ValueCell!10621)

