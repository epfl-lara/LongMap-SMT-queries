; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110696 () Bool)

(assert start!110696)

(declare-fun b_free!29531 () Bool)

(declare-fun b_next!29531 () Bool)

(assert (=> start!110696 (= b_free!29531 (not b_next!29531))))

(declare-fun tp!103915 () Bool)

(declare-fun b_and!47739 () Bool)

(assert (=> start!110696 (= tp!103915 b_and!47739)))

(declare-fun b!1309903 () Bool)

(declare-fun e!747345 () Bool)

(declare-fun tp_is_empty!35261 () Bool)

(assert (=> b!1309903 (= e!747345 tp_is_empty!35261)))

(declare-fun mapNonEmpty!54520 () Bool)

(declare-fun mapRes!54520 () Bool)

(declare-fun tp!103914 () Bool)

(declare-fun e!747346 () Bool)

(assert (=> mapNonEmpty!54520 (= mapRes!54520 (and tp!103914 e!747346))))

(declare-datatypes ((V!52117 0))(
  ( (V!52118 (val!17705 Int)) )
))
(declare-datatypes ((ValueCell!16732 0))(
  ( (ValueCellFull!16732 (v!20332 V!52117)) (EmptyCell!16732) )
))
(declare-fun mapRest!54520 () (Array (_ BitVec 32) ValueCell!16732))

(declare-fun mapValue!54520 () ValueCell!16732)

(declare-datatypes ((array!87512 0))(
  ( (array!87513 (arr!42236 (Array (_ BitVec 32) ValueCell!16732)) (size!42786 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87512)

(declare-fun mapKey!54520 () (_ BitVec 32))

(assert (=> mapNonEmpty!54520 (= (arr!42236 _values!1354) (store mapRest!54520 mapKey!54520 mapValue!54520))))

(declare-fun b!1309904 () Bool)

(declare-fun res!869565 () Bool)

(declare-fun e!747344 () Bool)

(assert (=> b!1309904 (=> (not res!869565) (not e!747344))))

(declare-datatypes ((array!87514 0))(
  ( (array!87515 (arr!42237 (Array (_ BitVec 32) (_ BitVec 64))) (size!42787 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87514)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309904 (= res!869565 (validKeyInArray!0 (select (arr!42237 _keys!1628) from!2020)))))

(declare-fun b!1309905 () Bool)

(assert (=> b!1309905 (= e!747346 tp_is_empty!35261)))

(declare-fun b!1309906 () Bool)

(declare-fun res!869561 () Bool)

(assert (=> b!1309906 (=> (not res!869561) (not e!747344))))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1309906 (= res!869561 (not (= (select (arr!42237 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1309907 () Bool)

(assert (=> b!1309907 (= e!747344 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52117)

(declare-fun zeroValue!1296 () V!52117)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((tuple2!22804 0))(
  ( (tuple2!22805 (_1!11413 (_ BitVec 64)) (_2!11413 V!52117)) )
))
(declare-datatypes ((List!29944 0))(
  ( (Nil!29941) (Cons!29940 (h!31149 tuple2!22804) (t!43550 List!29944)) )
))
(declare-datatypes ((ListLongMap!20461 0))(
  ( (ListLongMap!20462 (toList!10246 List!29944)) )
))
(declare-fun contains!8396 (ListLongMap!20461 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5259 (array!87514 array!87512 (_ BitVec 32) (_ BitVec 32) V!52117 V!52117 (_ BitVec 32) Int) ListLongMap!20461)

(assert (=> b!1309907 (contains!8396 (getCurrentListMap!5259 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43318 0))(
  ( (Unit!43319) )
))
(declare-fun lt!585315 () Unit!43318)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!5 (array!87514 array!87512 (_ BitVec 32) (_ BitVec 32) V!52117 V!52117 (_ BitVec 64) (_ BitVec 32) Int) Unit!43318)

(assert (=> b!1309907 (= lt!585315 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!5 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun res!869557 () Bool)

(assert (=> start!110696 (=> (not res!869557) (not e!747344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110696 (= res!869557 (validMask!0 mask!2040))))

(assert (=> start!110696 e!747344))

(assert (=> start!110696 tp!103915))

(declare-fun array_inv!31915 (array!87514) Bool)

(assert (=> start!110696 (array_inv!31915 _keys!1628)))

(assert (=> start!110696 true))

(assert (=> start!110696 tp_is_empty!35261))

(declare-fun e!747347 () Bool)

(declare-fun array_inv!31916 (array!87512) Bool)

(assert (=> start!110696 (and (array_inv!31916 _values!1354) e!747347)))

(declare-fun b!1309908 () Bool)

(declare-fun res!869558 () Bool)

(assert (=> b!1309908 (=> (not res!869558) (not e!747344))))

(assert (=> b!1309908 (= res!869558 (contains!8396 (getCurrentListMap!5259 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapIsEmpty!54520 () Bool)

(assert (=> mapIsEmpty!54520 mapRes!54520))

(declare-fun b!1309909 () Bool)

(declare-fun res!869559 () Bool)

(assert (=> b!1309909 (=> (not res!869559) (not e!747344))))

(assert (=> b!1309909 (= res!869559 (and (= (size!42786 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42787 _keys!1628) (size!42786 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309910 () Bool)

(assert (=> b!1309910 (= e!747347 (and e!747345 mapRes!54520))))

(declare-fun condMapEmpty!54520 () Bool)

(declare-fun mapDefault!54520 () ValueCell!16732)

