; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83816 () Bool)

(assert start!83816)

(declare-fun b_free!19625 () Bool)

(declare-fun b_next!19625 () Bool)

(assert (=> start!83816 (= b_free!19625 (not b_next!19625))))

(declare-fun tp!68317 () Bool)

(declare-fun b_and!31339 () Bool)

(assert (=> start!83816 (= tp!68317 b_and!31339)))

(declare-fun res!655156 () Bool)

(declare-fun e!551876 () Bool)

(assert (=> start!83816 (=> (not res!655156) (not e!551876))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83816 (= res!655156 (validMask!0 mask!1948))))

(assert (=> start!83816 e!551876))

(assert (=> start!83816 true))

(declare-fun tp_is_empty!22619 () Bool)

(assert (=> start!83816 tp_is_empty!22619))

(declare-datatypes ((V!35141 0))(
  ( (V!35142 (val!11360 Int)) )
))
(declare-datatypes ((ValueCell!10828 0))(
  ( (ValueCellFull!10828 (v!13922 V!35141)) (EmptyCell!10828) )
))
(declare-datatypes ((array!61261 0))(
  ( (array!61262 (arr!29488 (Array (_ BitVec 32) ValueCell!10828)) (size!29967 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61261)

(declare-fun e!551877 () Bool)

(declare-fun array_inv!22799 (array!61261) Bool)

(assert (=> start!83816 (and (array_inv!22799 _values!1278) e!551877)))

(assert (=> start!83816 tp!68317))

(declare-datatypes ((array!61263 0))(
  ( (array!61264 (arr!29489 (Array (_ BitVec 32) (_ BitVec 64))) (size!29968 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61263)

(declare-fun array_inv!22800 (array!61263) Bool)

(assert (=> start!83816 (array_inv!22800 _keys!1544)))

(declare-fun b!978981 () Bool)

(declare-fun res!655154 () Bool)

(assert (=> b!978981 (=> (not res!655154) (not e!551876))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!978981 (= res!655154 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29968 _keys!1544))))))

(declare-fun b!978982 () Bool)

(declare-fun res!655155 () Bool)

(assert (=> b!978982 (=> (not res!655155) (not e!551876))))

(declare-datatypes ((List!20442 0))(
  ( (Nil!20439) (Cons!20438 (h!21600 (_ BitVec 64)) (t!29023 List!20442)) )
))
(declare-fun arrayNoDuplicates!0 (array!61263 (_ BitVec 32) List!20442) Bool)

(assert (=> b!978982 (= res!655155 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20439))))

(declare-fun b!978983 () Bool)

(declare-fun e!551879 () Bool)

(assert (=> b!978983 (= e!551879 tp_is_empty!22619)))

(declare-fun b!978984 () Bool)

(declare-fun e!551880 () Bool)

(assert (=> b!978984 (= e!551876 (not e!551880))))

(declare-fun res!655150 () Bool)

(assert (=> b!978984 (=> res!655150 e!551880)))

(assert (=> b!978984 (= res!655150 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29489 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14572 0))(
  ( (tuple2!14573 (_1!7297 (_ BitVec 64)) (_2!7297 V!35141)) )
))
(declare-fun lt!434069 () tuple2!14572)

(declare-fun lt!434061 () tuple2!14572)

(declare-datatypes ((List!20443 0))(
  ( (Nil!20440) (Cons!20439 (h!21601 tuple2!14572) (t!29024 List!20443)) )
))
(declare-datatypes ((ListLongMap!13269 0))(
  ( (ListLongMap!13270 (toList!6650 List!20443)) )
))
(declare-fun lt!434066 () ListLongMap!13269)

(declare-fun lt!434060 () ListLongMap!13269)

(declare-fun +!2955 (ListLongMap!13269 tuple2!14572) ListLongMap!13269)

(assert (=> b!978984 (= (+!2955 lt!434066 lt!434061) (+!2955 lt!434060 lt!434069))))

(declare-fun lt!434063 () ListLongMap!13269)

(assert (=> b!978984 (= lt!434060 (+!2955 lt!434063 lt!434061))))

(declare-fun lt!434064 () V!35141)

(assert (=> b!978984 (= lt!434061 (tuple2!14573 (select (arr!29489 _keys!1544) from!1932) lt!434064))))

(assert (=> b!978984 (= lt!434066 (+!2955 lt!434063 lt!434069))))

(declare-fun minValue!1220 () V!35141)

(assert (=> b!978984 (= lt!434069 (tuple2!14573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32549 0))(
  ( (Unit!32550) )
))
(declare-fun lt!434067 () Unit!32549)

(declare-fun addCommutativeForDiffKeys!583 (ListLongMap!13269 (_ BitVec 64) V!35141 (_ BitVec 64) V!35141) Unit!32549)

(assert (=> b!978984 (= lt!434067 (addCommutativeForDiffKeys!583 lt!434063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29489 _keys!1544) from!1932) lt!434064))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15276 (ValueCell!10828 V!35141) V!35141)

(declare-fun dynLambda!1743 (Int (_ BitVec 64)) V!35141)

(assert (=> b!978984 (= lt!434064 (get!15276 (select (arr!29488 _values!1278) from!1932) (dynLambda!1743 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434062 () ListLongMap!13269)

(declare-fun lt!434065 () tuple2!14572)

(assert (=> b!978984 (= lt!434063 (+!2955 lt!434062 lt!434065))))

(declare-fun zeroValue!1220 () V!35141)

(assert (=> b!978984 (= lt!434065 (tuple2!14573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3357 (array!61263 array!61261 (_ BitVec 32) (_ BitVec 32) V!35141 V!35141 (_ BitVec 32) Int) ListLongMap!13269)

(assert (=> b!978984 (= lt!434062 (getCurrentListMapNoExtraKeys!3357 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!978985 () Bool)

(declare-fun e!551875 () Bool)

(declare-fun mapRes!35957 () Bool)

(assert (=> b!978985 (= e!551877 (and e!551875 mapRes!35957))))

(declare-fun condMapEmpty!35957 () Bool)

(declare-fun mapDefault!35957 () ValueCell!10828)

