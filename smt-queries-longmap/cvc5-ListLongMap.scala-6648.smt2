; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83860 () Bool)

(assert start!83860)

(declare-fun b_free!19669 () Bool)

(declare-fun b_next!19669 () Bool)

(assert (=> start!83860 (= b_free!19669 (not b_next!19669))))

(declare-fun tp!68448 () Bool)

(declare-fun b_and!31427 () Bool)

(assert (=> start!83860 (= tp!68448 b_and!31427)))

(declare-fun b!979751 () Bool)

(declare-fun e!552276 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61341 0))(
  ( (array!61342 (arr!29528 (Array (_ BitVec 32) (_ BitVec 64))) (size!30007 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61341)

(assert (=> b!979751 (= e!552276 (bvsle from!1932 (size!30007 _keys!1544)))))

(declare-datatypes ((V!35201 0))(
  ( (V!35202 (val!11382 Int)) )
))
(declare-datatypes ((tuple2!14598 0))(
  ( (tuple2!14599 (_1!7310 (_ BitVec 64)) (_2!7310 V!35201)) )
))
(declare-fun lt!434728 () tuple2!14598)

(declare-datatypes ((List!20467 0))(
  ( (Nil!20464) (Cons!20463 (h!21625 tuple2!14598) (t!29092 List!20467)) )
))
(declare-datatypes ((ListLongMap!13295 0))(
  ( (ListLongMap!13296 (toList!6663 List!20467)) )
))
(declare-fun lt!434729 () ListLongMap!13295)

(declare-fun lt!434720 () ListLongMap!13295)

(declare-fun lt!434723 () tuple2!14598)

(declare-fun +!2968 (ListLongMap!13295 tuple2!14598) ListLongMap!13295)

(assert (=> b!979751 (= lt!434729 (+!2968 (+!2968 lt!434720 lt!434728) lt!434723))))

(declare-fun zeroValue!1220 () V!35201)

(declare-fun lt!434724 () V!35201)

(declare-datatypes ((Unit!32575 0))(
  ( (Unit!32576) )
))
(declare-fun lt!434721 () Unit!32575)

(declare-fun addCommutativeForDiffKeys!596 (ListLongMap!13295 (_ BitVec 64) V!35201 (_ BitVec 64) V!35201) Unit!32575)

(assert (=> b!979751 (= lt!434721 (addCommutativeForDiffKeys!596 lt!434720 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29528 _keys!1544) from!1932) lt!434724))))

(declare-fun b!979752 () Bool)

(declare-fun e!552274 () Bool)

(assert (=> b!979752 (= e!552274 (not e!552276))))

(declare-fun res!655679 () Bool)

(assert (=> b!979752 (=> res!655679 e!552276)))

(assert (=> b!979752 (= res!655679 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29528 _keys!1544) from!1932)))))

(declare-fun lt!434725 () tuple2!14598)

(declare-fun lt!434726 () ListLongMap!13295)

(assert (=> b!979752 (= (+!2968 lt!434726 lt!434728) (+!2968 lt!434729 lt!434725))))

(declare-fun lt!434727 () ListLongMap!13295)

(assert (=> b!979752 (= lt!434729 (+!2968 lt!434727 lt!434728))))

(assert (=> b!979752 (= lt!434728 (tuple2!14599 (select (arr!29528 _keys!1544) from!1932) lt!434724))))

(assert (=> b!979752 (= lt!434726 (+!2968 lt!434727 lt!434725))))

(declare-fun minValue!1220 () V!35201)

(assert (=> b!979752 (= lt!434725 (tuple2!14599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434722 () Unit!32575)

(assert (=> b!979752 (= lt!434722 (addCommutativeForDiffKeys!596 lt!434727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29528 _keys!1544) from!1932) lt!434724))))

(declare-datatypes ((ValueCell!10850 0))(
  ( (ValueCellFull!10850 (v!13944 V!35201)) (EmptyCell!10850) )
))
(declare-datatypes ((array!61343 0))(
  ( (array!61344 (arr!29529 (Array (_ BitVec 32) ValueCell!10850)) (size!30008 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61343)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15304 (ValueCell!10850 V!35201) V!35201)

(declare-fun dynLambda!1755 (Int (_ BitVec 64)) V!35201)

(assert (=> b!979752 (= lt!434724 (get!15304 (select (arr!29529 _values!1278) from!1932) (dynLambda!1755 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979752 (= lt!434727 (+!2968 lt!434720 lt!434723))))

(assert (=> b!979752 (= lt!434723 (tuple2!14599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3369 (array!61341 array!61343 (_ BitVec 32) (_ BitVec 32) V!35201 V!35201 (_ BitVec 32) Int) ListLongMap!13295)

(assert (=> b!979752 (= lt!434720 (getCurrentListMapNoExtraKeys!3369 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36023 () Bool)

(declare-fun mapRes!36023 () Bool)

(assert (=> mapIsEmpty!36023 mapRes!36023))

(declare-fun b!979753 () Bool)

(declare-fun e!552273 () Bool)

(declare-fun e!552272 () Bool)

(assert (=> b!979753 (= e!552273 (and e!552272 mapRes!36023))))

(declare-fun condMapEmpty!36023 () Bool)

(declare-fun mapDefault!36023 () ValueCell!10850)

