; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110596 () Bool)

(assert start!110596)

(declare-fun b_free!29431 () Bool)

(declare-fun b_next!29431 () Bool)

(assert (=> start!110596 (= b_free!29431 (not b_next!29431))))

(declare-fun tp!103615 () Bool)

(declare-fun b_and!47639 () Bool)

(assert (=> start!110596 (= tp!103615 b_and!47639)))

(declare-fun b!1308535 () Bool)

(declare-fun res!868641 () Bool)

(declare-fun e!746596 () Bool)

(assert (=> b!1308535 (=> (not res!868641) (not e!746596))))

(declare-datatypes ((array!87320 0))(
  ( (array!87321 (arr!42140 (Array (_ BitVec 32) (_ BitVec 64))) (size!42690 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87320)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308535 (= res!868641 (not (= (select (arr!42140 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1308536 () Bool)

(assert (=> b!1308536 (= e!746596 (not true))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51985 0))(
  ( (V!51986 (val!17655 Int)) )
))
(declare-fun minValue!1296 () V!51985)

(declare-datatypes ((ValueCell!16682 0))(
  ( (ValueCellFull!16682 (v!20282 V!51985)) (EmptyCell!16682) )
))
(declare-datatypes ((array!87322 0))(
  ( (array!87323 (arr!42141 (Array (_ BitVec 32) ValueCell!16682)) (size!42691 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87322)

(declare-fun zeroValue!1296 () V!51985)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22732 0))(
  ( (tuple2!22733 (_1!11377 (_ BitVec 64)) (_2!11377 V!51985)) )
))
(declare-datatypes ((List!29873 0))(
  ( (Nil!29870) (Cons!29869 (h!31078 tuple2!22732) (t!43479 List!29873)) )
))
(declare-datatypes ((ListLongMap!20389 0))(
  ( (ListLongMap!20390 (toList!10210 List!29873)) )
))
(declare-fun contains!8360 (ListLongMap!20389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5223 (array!87320 array!87322 (_ BitVec 32) (_ BitVec 32) V!51985 V!51985 (_ BitVec 32) Int) ListLongMap!20389)

(assert (=> b!1308536 (contains!8360 (getCurrentListMap!5223 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43298 0))(
  ( (Unit!43299) )
))
(declare-fun lt!585165 () Unit!43298)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!13 (array!87320 array!87322 (_ BitVec 32) (_ BitVec 32) V!51985 V!51985 (_ BitVec 64) (_ BitVec 32) Int) Unit!43298)

(assert (=> b!1308536 (= lt!585165 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!13 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308537 () Bool)

(declare-fun res!868645 () Bool)

(assert (=> b!1308537 (=> (not res!868645) (not e!746596))))

(assert (=> b!1308537 (= res!868645 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42690 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308538 () Bool)

(declare-fun res!868646 () Bool)

(assert (=> b!1308538 (=> (not res!868646) (not e!746596))))

(declare-datatypes ((List!29874 0))(
  ( (Nil!29871) (Cons!29870 (h!31079 (_ BitVec 64)) (t!43480 List!29874)) )
))
(declare-fun arrayNoDuplicates!0 (array!87320 (_ BitVec 32) List!29874) Bool)

(assert (=> b!1308538 (= res!868646 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29871))))

(declare-fun b!1308539 () Bool)

(declare-fun res!868642 () Bool)

(assert (=> b!1308539 (=> (not res!868642) (not e!746596))))

(assert (=> b!1308539 (= res!868642 (and (= (size!42691 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42690 _keys!1628) (size!42691 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54370 () Bool)

(declare-fun mapRes!54370 () Bool)

(assert (=> mapIsEmpty!54370 mapRes!54370))

(declare-fun res!868644 () Bool)

(assert (=> start!110596 (=> (not res!868644) (not e!746596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110596 (= res!868644 (validMask!0 mask!2040))))

(assert (=> start!110596 e!746596))

(assert (=> start!110596 tp!103615))

(declare-fun array_inv!31851 (array!87320) Bool)

(assert (=> start!110596 (array_inv!31851 _keys!1628)))

(assert (=> start!110596 true))

(declare-fun tp_is_empty!35161 () Bool)

(assert (=> start!110596 tp_is_empty!35161))

(declare-fun e!746597 () Bool)

(declare-fun array_inv!31852 (array!87322) Bool)

(assert (=> start!110596 (and (array_inv!31852 _values!1354) e!746597)))

(declare-fun b!1308540 () Bool)

(declare-fun e!746594 () Bool)

(assert (=> b!1308540 (= e!746594 tp_is_empty!35161)))

(declare-fun b!1308541 () Bool)

(declare-fun res!868647 () Bool)

(assert (=> b!1308541 (=> (not res!868647) (not e!746596))))

(assert (=> b!1308541 (= res!868647 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308542 () Bool)

(declare-fun e!746595 () Bool)

(assert (=> b!1308542 (= e!746597 (and e!746595 mapRes!54370))))

(declare-fun condMapEmpty!54370 () Bool)

(declare-fun mapDefault!54370 () ValueCell!16682)

