; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83752 () Bool)

(assert start!83752)

(declare-fun b_free!19561 () Bool)

(declare-fun b_next!19561 () Bool)

(assert (=> start!83752 (= b_free!19561 (not b_next!19561))))

(declare-fun tp!68125 () Bool)

(declare-fun b_and!31211 () Bool)

(assert (=> start!83752 (= tp!68125 b_and!31211)))

(declare-fun b!977949 () Bool)

(declare-fun e!551389 () Bool)

(assert (=> b!977949 (= e!551389 (not true))))

(declare-datatypes ((V!35057 0))(
  ( (V!35058 (val!11328 Int)) )
))
(declare-datatypes ((tuple2!14520 0))(
  ( (tuple2!14521 (_1!7271 (_ BitVec 64)) (_2!7271 V!35057)) )
))
(declare-datatypes ((List!20392 0))(
  ( (Nil!20389) (Cons!20388 (h!21550 tuple2!14520) (t!28909 List!20392)) )
))
(declare-datatypes ((ListLongMap!13217 0))(
  ( (ListLongMap!13218 (toList!6624 List!20392)) )
))
(declare-fun lt!433542 () ListLongMap!13217)

(declare-fun lt!433543 () tuple2!14520)

(declare-fun lt!433544 () tuple2!14520)

(declare-fun +!2929 (ListLongMap!13217 tuple2!14520) ListLongMap!13217)

(assert (=> b!977949 (= (+!2929 (+!2929 lt!433542 lt!433543) lt!433544) (+!2929 (+!2929 lt!433542 lt!433544) lt!433543))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!433541 () V!35057)

(declare-datatypes ((array!61137 0))(
  ( (array!61138 (arr!29426 (Array (_ BitVec 32) (_ BitVec 64))) (size!29905 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61137)

(assert (=> b!977949 (= lt!433544 (tuple2!14521 (select (arr!29426 _keys!1544) from!1932) lt!433541))))

(declare-fun minValue!1220 () V!35057)

(assert (=> b!977949 (= lt!433543 (tuple2!14521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32497 0))(
  ( (Unit!32498) )
))
(declare-fun lt!433540 () Unit!32497)

(declare-fun addCommutativeForDiffKeys!557 (ListLongMap!13217 (_ BitVec 64) V!35057 (_ BitVec 64) V!35057) Unit!32497)

(assert (=> b!977949 (= lt!433540 (addCommutativeForDiffKeys!557 lt!433542 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29426 _keys!1544) from!1932) lt!433541))))

(declare-datatypes ((ValueCell!10796 0))(
  ( (ValueCellFull!10796 (v!13890 V!35057)) (EmptyCell!10796) )
))
(declare-datatypes ((array!61139 0))(
  ( (array!61140 (arr!29427 (Array (_ BitVec 32) ValueCell!10796)) (size!29906 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61139)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15230 (ValueCell!10796 V!35057) V!35057)

(declare-fun dynLambda!1717 (Int (_ BitVec 64)) V!35057)

(assert (=> b!977949 (= lt!433541 (get!15230 (select (arr!29427 _values!1278) from!1932) (dynLambda!1717 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35057)

(declare-fun getCurrentListMapNoExtraKeys!3331 (array!61137 array!61139 (_ BitVec 32) (_ BitVec 32) V!35057 V!35057 (_ BitVec 32) Int) ListLongMap!13217)

(assert (=> b!977949 (= lt!433542 (+!2929 (getCurrentListMapNoExtraKeys!3331 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!977950 () Bool)

(declare-fun res!654470 () Bool)

(assert (=> b!977950 (=> (not res!654470) (not e!551389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977950 (= res!654470 (validKeyInArray!0 (select (arr!29426 _keys!1544) from!1932)))))

(declare-fun b!977951 () Bool)

(declare-fun res!654473 () Bool)

(assert (=> b!977951 (=> (not res!654473) (not e!551389))))

(assert (=> b!977951 (= res!654473 (and (= (size!29906 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29905 _keys!1544) (size!29906 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977952 () Bool)

(declare-fun e!551390 () Bool)

(declare-fun tp_is_empty!22555 () Bool)

(assert (=> b!977952 (= e!551390 tp_is_empty!22555)))

(declare-fun b!977953 () Bool)

(declare-fun e!551387 () Bool)

(assert (=> b!977953 (= e!551387 tp_is_empty!22555)))

(declare-fun res!654471 () Bool)

(assert (=> start!83752 (=> (not res!654471) (not e!551389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83752 (= res!654471 (validMask!0 mask!1948))))

(assert (=> start!83752 e!551389))

(assert (=> start!83752 true))

(assert (=> start!83752 tp_is_empty!22555))

(declare-fun e!551391 () Bool)

(declare-fun array_inv!22745 (array!61139) Bool)

(assert (=> start!83752 (and (array_inv!22745 _values!1278) e!551391)))

(assert (=> start!83752 tp!68125))

(declare-fun array_inv!22746 (array!61137) Bool)

(assert (=> start!83752 (array_inv!22746 _keys!1544)))

(declare-fun b!977954 () Bool)

(declare-fun mapRes!35861 () Bool)

(assert (=> b!977954 (= e!551391 (and e!551390 mapRes!35861))))

(declare-fun condMapEmpty!35861 () Bool)

(declare-fun mapDefault!35861 () ValueCell!10796)

