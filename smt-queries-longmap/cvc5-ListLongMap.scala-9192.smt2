; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110500 () Bool)

(assert start!110500)

(declare-fun b_free!29335 () Bool)

(declare-fun b_next!29335 () Bool)

(assert (=> start!110500 (= b_free!29335 (not b_next!29335))))

(declare-fun tp!103327 () Bool)

(declare-fun b_and!47543 () Bool)

(assert (=> start!110500 (= tp!103327 b_and!47543)))

(declare-fun b!1307159 () Bool)

(declare-fun e!745876 () Bool)

(declare-fun tp_is_empty!35065 () Bool)

(assert (=> b!1307159 (= e!745876 tp_is_empty!35065)))

(declare-fun mapNonEmpty!54226 () Bool)

(declare-fun mapRes!54226 () Bool)

(declare-fun tp!103326 () Bool)

(assert (=> mapNonEmpty!54226 (= mapRes!54226 (and tp!103326 e!745876))))

(declare-datatypes ((V!51857 0))(
  ( (V!51858 (val!17607 Int)) )
))
(declare-datatypes ((ValueCell!16634 0))(
  ( (ValueCellFull!16634 (v!20234 V!51857)) (EmptyCell!16634) )
))
(declare-fun mapRest!54226 () (Array (_ BitVec 32) ValueCell!16634))

(declare-fun mapKey!54226 () (_ BitVec 32))

(declare-datatypes ((array!87134 0))(
  ( (array!87135 (arr!42047 (Array (_ BitVec 32) ValueCell!16634)) (size!42597 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87134)

(declare-fun mapValue!54226 () ValueCell!16634)

(assert (=> mapNonEmpty!54226 (= (arr!42047 _values!1354) (store mapRest!54226 mapKey!54226 mapValue!54226))))

(declare-fun res!867699 () Bool)

(declare-fun e!745875 () Bool)

(assert (=> start!110500 (=> (not res!867699) (not e!745875))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110500 (= res!867699 (validMask!0 mask!2040))))

(assert (=> start!110500 e!745875))

(assert (=> start!110500 tp!103327))

(declare-datatypes ((array!87136 0))(
  ( (array!87137 (arr!42048 (Array (_ BitVec 32) (_ BitVec 64))) (size!42598 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87136)

(declare-fun array_inv!31785 (array!87136) Bool)

(assert (=> start!110500 (array_inv!31785 _keys!1628)))

(assert (=> start!110500 true))

(assert (=> start!110500 tp_is_empty!35065))

(declare-fun e!745877 () Bool)

(declare-fun array_inv!31786 (array!87134) Bool)

(assert (=> start!110500 (and (array_inv!31786 _values!1354) e!745877)))

(declare-fun b!1307160 () Bool)

(assert (=> b!1307160 (= e!745875 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51857)

(declare-fun zeroValue!1296 () V!51857)

(declare-fun lt!585021 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22670 0))(
  ( (tuple2!22671 (_1!11346 (_ BitVec 64)) (_2!11346 V!51857)) )
))
(declare-datatypes ((List!29811 0))(
  ( (Nil!29808) (Cons!29807 (h!31016 tuple2!22670) (t!43417 List!29811)) )
))
(declare-datatypes ((ListLongMap!20327 0))(
  ( (ListLongMap!20328 (toList!10179 List!29811)) )
))
(declare-fun contains!8329 (ListLongMap!20327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5192 (array!87136 array!87134 (_ BitVec 32) (_ BitVec 32) V!51857 V!51857 (_ BitVec 32) Int) ListLongMap!20327)

(assert (=> b!1307160 (= lt!585021 (contains!8329 (getCurrentListMap!5192 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1307161 () Bool)

(declare-fun res!867696 () Bool)

(assert (=> b!1307161 (=> (not res!867696) (not e!745875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87136 (_ BitVec 32)) Bool)

(assert (=> b!1307161 (= res!867696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307162 () Bool)

(declare-fun res!867695 () Bool)

(assert (=> b!1307162 (=> (not res!867695) (not e!745875))))

(assert (=> b!1307162 (= res!867695 (and (= (size!42597 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42598 _keys!1628) (size!42597 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307163 () Bool)

(declare-fun res!867698 () Bool)

(assert (=> b!1307163 (=> (not res!867698) (not e!745875))))

(assert (=> b!1307163 (= res!867698 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42598 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307164 () Bool)

(declare-fun e!745874 () Bool)

(assert (=> b!1307164 (= e!745877 (and e!745874 mapRes!54226))))

(declare-fun condMapEmpty!54226 () Bool)

(declare-fun mapDefault!54226 () ValueCell!16634)

