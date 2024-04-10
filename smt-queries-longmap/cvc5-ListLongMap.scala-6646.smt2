; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83848 () Bool)

(assert start!83848)

(declare-fun b_free!19657 () Bool)

(declare-fun b_next!19657 () Bool)

(assert (=> start!83848 (= b_free!19657 (not b_next!19657))))

(declare-fun tp!68413 () Bool)

(declare-fun b_and!31403 () Bool)

(assert (=> start!83848 (= tp!68413 b_and!31403)))

(declare-fun b!979541 () Bool)

(declare-fun e!552164 () Bool)

(declare-fun tp_is_empty!22651 () Bool)

(assert (=> b!979541 (= e!552164 tp_is_empty!22651)))

(declare-fun b!979542 () Bool)

(declare-fun res!655540 () Bool)

(declare-fun e!552166 () Bool)

(assert (=> b!979542 (=> (not res!655540) (not e!552166))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61319 0))(
  ( (array!61320 (arr!29517 (Array (_ BitVec 32) (_ BitVec 64))) (size!29996 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61319)

(assert (=> b!979542 (= res!655540 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29996 _keys!1544))))))

(declare-fun b!979543 () Bool)

(declare-fun e!552168 () Bool)

(assert (=> b!979543 (= e!552166 (not e!552168))))

(declare-fun res!655541 () Bool)

(assert (=> b!979543 (=> res!655541 e!552168)))

(assert (=> b!979543 (= res!655541 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29517 _keys!1544) from!1932)))))

(declare-datatypes ((V!35185 0))(
  ( (V!35186 (val!11376 Int)) )
))
(declare-datatypes ((tuple2!14592 0))(
  ( (tuple2!14593 (_1!7307 (_ BitVec 64)) (_2!7307 V!35185)) )
))
(declare-fun lt!434548 () tuple2!14592)

(declare-fun lt!434543 () tuple2!14592)

(declare-datatypes ((List!20462 0))(
  ( (Nil!20459) (Cons!20458 (h!21620 tuple2!14592) (t!29075 List!20462)) )
))
(declare-datatypes ((ListLongMap!13289 0))(
  ( (ListLongMap!13290 (toList!6660 List!20462)) )
))
(declare-fun lt!434545 () ListLongMap!13289)

(declare-fun lt!434549 () ListLongMap!13289)

(declare-fun +!2965 (ListLongMap!13289 tuple2!14592) ListLongMap!13289)

(assert (=> b!979543 (= (+!2965 lt!434549 lt!434548) (+!2965 lt!434545 lt!434543))))

(declare-fun lt!434541 () ListLongMap!13289)

(assert (=> b!979543 (= lt!434545 (+!2965 lt!434541 lt!434548))))

(declare-fun lt!434546 () V!35185)

(assert (=> b!979543 (= lt!434548 (tuple2!14593 (select (arr!29517 _keys!1544) from!1932) lt!434546))))

(assert (=> b!979543 (= lt!434549 (+!2965 lt!434541 lt!434543))))

(declare-fun minValue!1220 () V!35185)

(assert (=> b!979543 (= lt!434543 (tuple2!14593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32569 0))(
  ( (Unit!32570) )
))
(declare-fun lt!434540 () Unit!32569)

(declare-fun addCommutativeForDiffKeys!593 (ListLongMap!13289 (_ BitVec 64) V!35185 (_ BitVec 64) V!35185) Unit!32569)

(assert (=> b!979543 (= lt!434540 (addCommutativeForDiffKeys!593 lt!434541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29517 _keys!1544) from!1932) lt!434546))))

(declare-datatypes ((ValueCell!10844 0))(
  ( (ValueCellFull!10844 (v!13938 V!35185)) (EmptyCell!10844) )
))
(declare-datatypes ((array!61321 0))(
  ( (array!61322 (arr!29518 (Array (_ BitVec 32) ValueCell!10844)) (size!29997 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61321)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15297 (ValueCell!10844 V!35185) V!35185)

(declare-fun dynLambda!1752 (Int (_ BitVec 64)) V!35185)

(assert (=> b!979543 (= lt!434546 (get!15297 (select (arr!29518 _values!1278) from!1932) (dynLambda!1752 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434544 () ListLongMap!13289)

(declare-fun lt!434547 () tuple2!14592)

(assert (=> b!979543 (= lt!434541 (+!2965 lt!434544 lt!434547))))

(declare-fun zeroValue!1220 () V!35185)

(assert (=> b!979543 (= lt!434547 (tuple2!14593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3366 (array!61319 array!61321 (_ BitVec 32) (_ BitVec 32) V!35185 V!35185 (_ BitVec 32) Int) ListLongMap!13289)

(assert (=> b!979543 (= lt!434544 (getCurrentListMapNoExtraKeys!3366 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!655536 () Bool)

(assert (=> start!83848 (=> (not res!655536) (not e!552166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83848 (= res!655536 (validMask!0 mask!1948))))

(assert (=> start!83848 e!552166))

(assert (=> start!83848 true))

(assert (=> start!83848 tp_is_empty!22651))

(declare-fun e!552165 () Bool)

(declare-fun array_inv!22821 (array!61321) Bool)

(assert (=> start!83848 (and (array_inv!22821 _values!1278) e!552165)))

(assert (=> start!83848 tp!68413))

(declare-fun array_inv!22822 (array!61319) Bool)

(assert (=> start!83848 (array_inv!22822 _keys!1544)))

(declare-fun b!979544 () Bool)

(declare-fun res!655534 () Bool)

(assert (=> b!979544 (=> (not res!655534) (not e!552166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979544 (= res!655534 (validKeyInArray!0 (select (arr!29517 _keys!1544) from!1932)))))

(declare-fun b!979545 () Bool)

(declare-fun res!655535 () Bool)

(assert (=> b!979545 (=> (not res!655535) (not e!552166))))

(assert (=> b!979545 (= res!655535 (and (= (size!29997 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29996 _keys!1544) (size!29997 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979546 () Bool)

(declare-fun e!552163 () Bool)

(declare-fun mapRes!36005 () Bool)

(assert (=> b!979546 (= e!552165 (and e!552163 mapRes!36005))))

(declare-fun condMapEmpty!36005 () Bool)

(declare-fun mapDefault!36005 () ValueCell!10844)

