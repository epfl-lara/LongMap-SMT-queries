; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110686 () Bool)

(assert start!110686)

(declare-fun b_free!29521 () Bool)

(declare-fun b_next!29521 () Bool)

(assert (=> start!110686 (= b_free!29521 (not b_next!29521))))

(declare-fun tp!103884 () Bool)

(declare-fun b_and!47729 () Bool)

(assert (=> start!110686 (= tp!103884 b_and!47729)))

(declare-fun b!1309723 () Bool)

(declare-fun res!869427 () Bool)

(declare-fun e!747270 () Bool)

(assert (=> b!1309723 (=> (not res!869427) (not e!747270))))

(declare-datatypes ((array!87492 0))(
  ( (array!87493 (arr!42226 (Array (_ BitVec 32) (_ BitVec 64))) (size!42776 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87492)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87492 (_ BitVec 32)) Bool)

(assert (=> b!1309723 (= res!869427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309724 () Bool)

(declare-fun res!869426 () Bool)

(assert (=> b!1309724 (=> (not res!869426) (not e!747270))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309724 (= res!869426 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42776 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309725 () Bool)

(declare-fun res!869424 () Bool)

(assert (=> b!1309725 (=> (not res!869424) (not e!747270))))

(declare-datatypes ((V!52105 0))(
  ( (V!52106 (val!17700 Int)) )
))
(declare-datatypes ((ValueCell!16727 0))(
  ( (ValueCellFull!16727 (v!20327 V!52105)) (EmptyCell!16727) )
))
(declare-datatypes ((array!87494 0))(
  ( (array!87495 (arr!42227 (Array (_ BitVec 32) ValueCell!16727)) (size!42777 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87494)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309725 (= res!869424 (and (= (size!42777 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42776 _keys!1628) (size!42777 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!869422 () Bool)

(assert (=> start!110686 (=> (not res!869422) (not e!747270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110686 (= res!869422 (validMask!0 mask!2040))))

(assert (=> start!110686 e!747270))

(assert (=> start!110686 tp!103884))

(declare-fun array_inv!31909 (array!87492) Bool)

(assert (=> start!110686 (array_inv!31909 _keys!1628)))

(assert (=> start!110686 true))

(declare-fun tp_is_empty!35251 () Bool)

(assert (=> start!110686 tp_is_empty!35251))

(declare-fun e!747272 () Bool)

(declare-fun array_inv!31910 (array!87494) Bool)

(assert (=> start!110686 (and (array_inv!31910 _values!1354) e!747272)))

(declare-fun b!1309726 () Bool)

(declare-fun res!869429 () Bool)

(assert (=> b!1309726 (=> (not res!869429) (not e!747270))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52105)

(declare-fun zeroValue!1296 () V!52105)

(declare-datatypes ((tuple2!22796 0))(
  ( (tuple2!22797 (_1!11409 (_ BitVec 64)) (_2!11409 V!52105)) )
))
(declare-datatypes ((List!29937 0))(
  ( (Nil!29934) (Cons!29933 (h!31142 tuple2!22796) (t!43543 List!29937)) )
))
(declare-datatypes ((ListLongMap!20453 0))(
  ( (ListLongMap!20454 (toList!10242 List!29937)) )
))
(declare-fun contains!8392 (ListLongMap!20453 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5255 (array!87492 array!87494 (_ BitVec 32) (_ BitVec 32) V!52105 V!52105 (_ BitVec 32) Int) ListLongMap!20453)

(assert (=> b!1309726 (= res!869429 (contains!8392 (getCurrentListMap!5255 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309727 () Bool)

(declare-fun res!869430 () Bool)

(assert (=> b!1309727 (=> (not res!869430) (not e!747270))))

(assert (=> b!1309727 (= res!869430 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1309728 () Bool)

(declare-fun res!869423 () Bool)

(assert (=> b!1309728 (=> (not res!869423) (not e!747270))))

(declare-datatypes ((List!29938 0))(
  ( (Nil!29935) (Cons!29934 (h!31143 (_ BitVec 64)) (t!43544 List!29938)) )
))
(declare-fun arrayNoDuplicates!0 (array!87492 (_ BitVec 32) List!29938) Bool)

(assert (=> b!1309728 (= res!869423 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29935))))

(declare-fun b!1309729 () Bool)

(assert (=> b!1309729 (= e!747270 (not true))))

(assert (=> b!1309729 (contains!8392 (getCurrentListMap!5255 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43310 0))(
  ( (Unit!43311) )
))
(declare-fun lt!585300 () Unit!43310)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!1 (array!87492 array!87494 (_ BitVec 32) (_ BitVec 32) V!52105 V!52105 (_ BitVec 64) (_ BitVec 32) Int) Unit!43310)

(assert (=> b!1309729 (= lt!585300 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!1 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309730 () Bool)

(declare-fun e!747269 () Bool)

(declare-fun mapRes!54505 () Bool)

(assert (=> b!1309730 (= e!747272 (and e!747269 mapRes!54505))))

(declare-fun condMapEmpty!54505 () Bool)

(declare-fun mapDefault!54505 () ValueCell!16727)

