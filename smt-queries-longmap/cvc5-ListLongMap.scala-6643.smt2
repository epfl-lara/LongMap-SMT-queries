; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83830 () Bool)

(assert start!83830)

(declare-fun b_free!19639 () Bool)

(declare-fun b_next!19639 () Bool)

(assert (=> start!83830 (= b_free!19639 (not b_next!19639))))

(declare-fun tp!68358 () Bool)

(declare-fun b_and!31367 () Bool)

(assert (=> start!83830 (= tp!68358 b_and!31367)))

(declare-fun b!979226 () Bool)

(declare-fun e!552003 () Bool)

(declare-fun tp_is_empty!22633 () Bool)

(assert (=> b!979226 (= e!552003 tp_is_empty!22633)))

(declare-fun res!655318 () Bool)

(declare-fun e!552002 () Bool)

(assert (=> start!83830 (=> (not res!655318) (not e!552002))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83830 (= res!655318 (validMask!0 mask!1948))))

(assert (=> start!83830 e!552002))

(assert (=> start!83830 true))

(assert (=> start!83830 tp_is_empty!22633))

(declare-datatypes ((V!35161 0))(
  ( (V!35162 (val!11367 Int)) )
))
(declare-datatypes ((ValueCell!10835 0))(
  ( (ValueCellFull!10835 (v!13929 V!35161)) (EmptyCell!10835) )
))
(declare-datatypes ((array!61285 0))(
  ( (array!61286 (arr!29500 (Array (_ BitVec 32) ValueCell!10835)) (size!29979 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61285)

(declare-fun e!552001 () Bool)

(declare-fun array_inv!22809 (array!61285) Bool)

(assert (=> start!83830 (and (array_inv!22809 _values!1278) e!552001)))

(assert (=> start!83830 tp!68358))

(declare-datatypes ((array!61287 0))(
  ( (array!61288 (arr!29501 (Array (_ BitVec 32) (_ BitVec 64))) (size!29980 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61287)

(declare-fun array_inv!22810 (array!61287) Bool)

(assert (=> start!83830 (array_inv!22810 _keys!1544)))

(declare-fun mapNonEmpty!35978 () Bool)

(declare-fun mapRes!35978 () Bool)

(declare-fun tp!68359 () Bool)

(declare-fun e!552004 () Bool)

(assert (=> mapNonEmpty!35978 (= mapRes!35978 (and tp!68359 e!552004))))

(declare-fun mapKey!35978 () (_ BitVec 32))

(declare-fun mapValue!35978 () ValueCell!10835)

(declare-fun mapRest!35978 () (Array (_ BitVec 32) ValueCell!10835))

(assert (=> mapNonEmpty!35978 (= (arr!29500 _values!1278) (store mapRest!35978 mapKey!35978 mapValue!35978))))

(declare-fun b!979227 () Bool)

(declare-fun res!655322 () Bool)

(assert (=> b!979227 (=> (not res!655322) (not e!552002))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979227 (= res!655322 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29980 _keys!1544))))))

(declare-fun b!979228 () Bool)

(declare-fun e!552006 () Bool)

(assert (=> b!979228 (= e!552002 (not e!552006))))

(declare-fun res!655323 () Bool)

(assert (=> b!979228 (=> res!655323 e!552006)))

(assert (=> b!979228 (= res!655323 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29501 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14582 0))(
  ( (tuple2!14583 (_1!7302 (_ BitVec 64)) (_2!7302 V!35161)) )
))
(declare-fun lt!434277 () tuple2!14582)

(declare-datatypes ((List!20452 0))(
  ( (Nil!20449) (Cons!20448 (h!21610 tuple2!14582) (t!29047 List!20452)) )
))
(declare-datatypes ((ListLongMap!13279 0))(
  ( (ListLongMap!13280 (toList!6655 List!20452)) )
))
(declare-fun lt!434278 () ListLongMap!13279)

(declare-fun lt!434270 () ListLongMap!13279)

(declare-fun lt!434272 () tuple2!14582)

(declare-fun +!2960 (ListLongMap!13279 tuple2!14582) ListLongMap!13279)

(assert (=> b!979228 (= (+!2960 lt!434270 lt!434277) (+!2960 lt!434278 lt!434272))))

(declare-fun lt!434275 () ListLongMap!13279)

(assert (=> b!979228 (= lt!434278 (+!2960 lt!434275 lt!434277))))

(declare-fun lt!434273 () V!35161)

(assert (=> b!979228 (= lt!434277 (tuple2!14583 (select (arr!29501 _keys!1544) from!1932) lt!434273))))

(assert (=> b!979228 (= lt!434270 (+!2960 lt!434275 lt!434272))))

(declare-fun minValue!1220 () V!35161)

(assert (=> b!979228 (= lt!434272 (tuple2!14583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32559 0))(
  ( (Unit!32560) )
))
(declare-fun lt!434279 () Unit!32559)

(declare-fun addCommutativeForDiffKeys!588 (ListLongMap!13279 (_ BitVec 64) V!35161 (_ BitVec 64) V!35161) Unit!32559)

(assert (=> b!979228 (= lt!434279 (addCommutativeForDiffKeys!588 lt!434275 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29501 _keys!1544) from!1932) lt!434273))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15286 (ValueCell!10835 V!35161) V!35161)

(declare-fun dynLambda!1747 (Int (_ BitVec 64)) V!35161)

(assert (=> b!979228 (= lt!434273 (get!15286 (select (arr!29500 _values!1278) from!1932) (dynLambda!1747 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434274 () ListLongMap!13279)

(declare-fun lt!434276 () tuple2!14582)

(assert (=> b!979228 (= lt!434275 (+!2960 lt!434274 lt!434276))))

(declare-fun zeroValue!1220 () V!35161)

(assert (=> b!979228 (= lt!434276 (tuple2!14583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3361 (array!61287 array!61285 (_ BitVec 32) (_ BitVec 32) V!35161 V!35161 (_ BitVec 32) Int) ListLongMap!13279)

(assert (=> b!979228 (= lt!434274 (getCurrentListMapNoExtraKeys!3361 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979229 () Bool)

(assert (=> b!979229 (= e!552001 (and e!552003 mapRes!35978))))

(declare-fun condMapEmpty!35978 () Bool)

(declare-fun mapDefault!35978 () ValueCell!10835)

