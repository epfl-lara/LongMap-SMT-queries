; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83980 () Bool)

(assert start!83980)

(declare-fun b_free!19735 () Bool)

(declare-fun b_next!19735 () Bool)

(assert (=> start!83980 (= b_free!19735 (not b_next!19735))))

(declare-fun tp!68727 () Bool)

(declare-fun b_and!31553 () Bool)

(assert (=> start!83980 (= tp!68727 b_and!31553)))

(declare-fun b!981404 () Bool)

(declare-fun res!656734 () Bool)

(declare-fun e!553262 () Bool)

(assert (=> b!981404 (=> (not res!656734) (not e!553262))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35361 0))(
  ( (V!35362 (val!11442 Int)) )
))
(declare-datatypes ((ValueCell!10910 0))(
  ( (ValueCellFull!10910 (v!14004 V!35361)) (EmptyCell!10910) )
))
(declare-datatypes ((array!61563 0))(
  ( (array!61564 (arr!29639 (Array (_ BitVec 32) ValueCell!10910)) (size!30118 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61563)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61565 0))(
  ( (array!61566 (arr!29640 (Array (_ BitVec 32) (_ BitVec 64))) (size!30119 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61565)

(assert (=> b!981404 (= res!656734 (and (= (size!30118 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30119 _keys!1544) (size!30118 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!656738 () Bool)

(assert (=> start!83980 (=> (not res!656738) (not e!553262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83980 (= res!656738 (validMask!0 mask!1948))))

(assert (=> start!83980 e!553262))

(assert (=> start!83980 true))

(declare-fun tp_is_empty!22783 () Bool)

(assert (=> start!83980 tp_is_empty!22783))

(declare-fun e!553265 () Bool)

(declare-fun array_inv!22915 (array!61563) Bool)

(assert (=> start!83980 (and (array_inv!22915 _values!1278) e!553265)))

(assert (=> start!83980 tp!68727))

(declare-fun array_inv!22916 (array!61565) Bool)

(assert (=> start!83980 (array_inv!22916 _keys!1544)))

(declare-fun b!981405 () Bool)

(declare-fun res!656736 () Bool)

(assert (=> b!981405 (=> (not res!656736) (not e!553262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61565 (_ BitVec 32)) Bool)

(assert (=> b!981405 (= res!656736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981406 () Bool)

(declare-fun e!553261 () Bool)

(assert (=> b!981406 (= e!553261 tp_is_empty!22783)))

(declare-fun b!981407 () Bool)

(declare-fun e!553263 () Bool)

(assert (=> b!981407 (= e!553262 e!553263)))

(declare-fun res!656737 () Bool)

(assert (=> b!981407 (=> (not res!656737) (not e!553263))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981407 (= res!656737 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29640 _keys!1544) from!1932))))))

(declare-fun lt!435695 () V!35361)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15360 (ValueCell!10910 V!35361) V!35361)

(declare-fun dynLambda!1771 (Int (_ BitVec 64)) V!35361)

(assert (=> b!981407 (= lt!435695 (get!15360 (select (arr!29639 _values!1278) from!1932) (dynLambda!1771 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35361)

(declare-fun zeroValue!1220 () V!35361)

(declare-datatypes ((tuple2!14644 0))(
  ( (tuple2!14645 (_1!7333 (_ BitVec 64)) (_2!7333 V!35361)) )
))
(declare-datatypes ((List!20529 0))(
  ( (Nil!20526) (Cons!20525 (h!21687 tuple2!14644) (t!29214 List!20529)) )
))
(declare-datatypes ((ListLongMap!13341 0))(
  ( (ListLongMap!13342 (toList!6686 List!20529)) )
))
(declare-fun lt!435692 () ListLongMap!13341)

(declare-fun getCurrentListMapNoExtraKeys!3388 (array!61565 array!61563 (_ BitVec 32) (_ BitVec 32) V!35361 V!35361 (_ BitVec 32) Int) ListLongMap!13341)

(assert (=> b!981407 (= lt!435692 (getCurrentListMapNoExtraKeys!3388 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981408 () Bool)

(declare-fun e!553266 () Bool)

(assert (=> b!981408 (= e!553266 tp_is_empty!22783)))

(declare-fun b!981409 () Bool)

(declare-fun mapRes!36203 () Bool)

(assert (=> b!981409 (= e!553265 (and e!553266 mapRes!36203))))

(declare-fun condMapEmpty!36203 () Bool)

(declare-fun mapDefault!36203 () ValueCell!10910)

