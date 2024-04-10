; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110548 () Bool)

(assert start!110548)

(declare-fun b_free!29383 () Bool)

(declare-fun b_next!29383 () Bool)

(assert (=> start!110548 (= b_free!29383 (not b_next!29383))))

(declare-fun tp!103470 () Bool)

(declare-fun b_and!47591 () Bool)

(assert (=> start!110548 (= tp!103470 b_and!47591)))

(declare-fun res!868059 () Bool)

(declare-fun e!746237 () Bool)

(assert (=> start!110548 (=> (not res!868059) (not e!746237))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110548 (= res!868059 (validMask!0 mask!2040))))

(assert (=> start!110548 e!746237))

(assert (=> start!110548 tp!103470))

(declare-datatypes ((array!87226 0))(
  ( (array!87227 (arr!42093 (Array (_ BitVec 32) (_ BitVec 64))) (size!42643 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87226)

(declare-fun array_inv!31813 (array!87226) Bool)

(assert (=> start!110548 (array_inv!31813 _keys!1628)))

(assert (=> start!110548 true))

(declare-fun tp_is_empty!35113 () Bool)

(assert (=> start!110548 tp_is_empty!35113))

(declare-datatypes ((V!51921 0))(
  ( (V!51922 (val!17631 Int)) )
))
(declare-datatypes ((ValueCell!16658 0))(
  ( (ValueCellFull!16658 (v!20258 V!51921)) (EmptyCell!16658) )
))
(declare-datatypes ((array!87228 0))(
  ( (array!87229 (arr!42094 (Array (_ BitVec 32) ValueCell!16658)) (size!42644 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87228)

(declare-fun e!746236 () Bool)

(declare-fun array_inv!31814 (array!87228) Bool)

(assert (=> start!110548 (and (array_inv!31814 _values!1354) e!746236)))

(declare-fun b!1307735 () Bool)

(declare-fun res!868058 () Bool)

(assert (=> b!1307735 (=> (not res!868058) (not e!746237))))

(declare-datatypes ((List!29838 0))(
  ( (Nil!29835) (Cons!29834 (h!31043 (_ BitVec 64)) (t!43444 List!29838)) )
))
(declare-fun arrayNoDuplicates!0 (array!87226 (_ BitVec 32) List!29838) Bool)

(assert (=> b!1307735 (= res!868058 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29835))))

(declare-fun b!1307736 () Bool)

(assert (=> b!1307736 (= e!746237 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51921)

(declare-fun zeroValue!1296 () V!51921)

(declare-fun lt!585093 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22696 0))(
  ( (tuple2!22697 (_1!11359 (_ BitVec 64)) (_2!11359 V!51921)) )
))
(declare-datatypes ((List!29839 0))(
  ( (Nil!29836) (Cons!29835 (h!31044 tuple2!22696) (t!43445 List!29839)) )
))
(declare-datatypes ((ListLongMap!20353 0))(
  ( (ListLongMap!20354 (toList!10192 List!29839)) )
))
(declare-fun contains!8342 (ListLongMap!20353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5205 (array!87226 array!87228 (_ BitVec 32) (_ BitVec 32) V!51921 V!51921 (_ BitVec 32) Int) ListLongMap!20353)

(assert (=> b!1307736 (= lt!585093 (contains!8342 (getCurrentListMap!5205 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1307737 () Bool)

(declare-fun e!746234 () Bool)

(assert (=> b!1307737 (= e!746234 tp_is_empty!35113)))

(declare-fun b!1307738 () Bool)

(declare-fun res!868057 () Bool)

(assert (=> b!1307738 (=> (not res!868057) (not e!746237))))

(assert (=> b!1307738 (= res!868057 (and (= (size!42644 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42643 _keys!1628) (size!42644 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307739 () Bool)

(declare-fun res!868055 () Bool)

(assert (=> b!1307739 (=> (not res!868055) (not e!746237))))

(assert (=> b!1307739 (= res!868055 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42643 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307740 () Bool)

(declare-fun e!746235 () Bool)

(declare-fun mapRes!54298 () Bool)

(assert (=> b!1307740 (= e!746236 (and e!746235 mapRes!54298))))

(declare-fun condMapEmpty!54298 () Bool)

(declare-fun mapDefault!54298 () ValueCell!16658)

