; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110524 () Bool)

(assert start!110524)

(declare-fun b_free!29359 () Bool)

(declare-fun b_next!29359 () Bool)

(assert (=> start!110524 (= b_free!29359 (not b_next!29359))))

(declare-fun tp!103399 () Bool)

(declare-fun b_and!47567 () Bool)

(assert (=> start!110524 (= tp!103399 b_and!47567)))

(declare-fun b!1307447 () Bool)

(declare-fun e!746054 () Bool)

(assert (=> b!1307447 (= e!746054 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585057 () Bool)

(declare-datatypes ((array!87180 0))(
  ( (array!87181 (arr!42070 (Array (_ BitVec 32) (_ BitVec 64))) (size!42620 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87180)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!51889 0))(
  ( (V!51890 (val!17619 Int)) )
))
(declare-fun minValue!1296 () V!51889)

(declare-datatypes ((ValueCell!16646 0))(
  ( (ValueCellFull!16646 (v!20246 V!51889)) (EmptyCell!16646) )
))
(declare-datatypes ((array!87182 0))(
  ( (array!87183 (arr!42071 (Array (_ BitVec 32) ValueCell!16646)) (size!42621 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87182)

(declare-fun zeroValue!1296 () V!51889)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22684 0))(
  ( (tuple2!22685 (_1!11353 (_ BitVec 64)) (_2!11353 V!51889)) )
))
(declare-datatypes ((List!29825 0))(
  ( (Nil!29822) (Cons!29821 (h!31030 tuple2!22684) (t!43431 List!29825)) )
))
(declare-datatypes ((ListLongMap!20341 0))(
  ( (ListLongMap!20342 (toList!10186 List!29825)) )
))
(declare-fun contains!8336 (ListLongMap!20341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5199 (array!87180 array!87182 (_ BitVec 32) (_ BitVec 32) V!51889 V!51889 (_ BitVec 32) Int) ListLongMap!20341)

(assert (=> b!1307447 (= lt!585057 (contains!8336 (getCurrentListMap!5199 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54262 () Bool)

(declare-fun mapRes!54262 () Bool)

(declare-fun tp!103398 () Bool)

(declare-fun e!746057 () Bool)

(assert (=> mapNonEmpty!54262 (= mapRes!54262 (and tp!103398 e!746057))))

(declare-fun mapValue!54262 () ValueCell!16646)

(declare-fun mapRest!54262 () (Array (_ BitVec 32) ValueCell!16646))

(declare-fun mapKey!54262 () (_ BitVec 32))

(assert (=> mapNonEmpty!54262 (= (arr!42071 _values!1354) (store mapRest!54262 mapKey!54262 mapValue!54262))))

(declare-fun b!1307448 () Bool)

(declare-fun res!867879 () Bool)

(assert (=> b!1307448 (=> (not res!867879) (not e!746054))))

(declare-datatypes ((List!29826 0))(
  ( (Nil!29823) (Cons!29822 (h!31031 (_ BitVec 64)) (t!43432 List!29826)) )
))
(declare-fun arrayNoDuplicates!0 (array!87180 (_ BitVec 32) List!29826) Bool)

(assert (=> b!1307448 (= res!867879 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29823))))

(declare-fun b!1307449 () Bool)

(declare-fun tp_is_empty!35089 () Bool)

(assert (=> b!1307449 (= e!746057 tp_is_empty!35089)))

(declare-fun mapIsEmpty!54262 () Bool)

(assert (=> mapIsEmpty!54262 mapRes!54262))

(declare-fun b!1307450 () Bool)

(declare-fun res!867878 () Bool)

(assert (=> b!1307450 (=> (not res!867878) (not e!746054))))

(assert (=> b!1307450 (= res!867878 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42620 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307451 () Bool)

(declare-fun e!746053 () Bool)

(assert (=> b!1307451 (= e!746053 tp_is_empty!35089)))

(declare-fun res!867877 () Bool)

(assert (=> start!110524 (=> (not res!867877) (not e!746054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110524 (= res!867877 (validMask!0 mask!2040))))

(assert (=> start!110524 e!746054))

(assert (=> start!110524 tp!103399))

(declare-fun array_inv!31801 (array!87180) Bool)

(assert (=> start!110524 (array_inv!31801 _keys!1628)))

(assert (=> start!110524 true))

(assert (=> start!110524 tp_is_empty!35089))

(declare-fun e!746056 () Bool)

(declare-fun array_inv!31802 (array!87182) Bool)

(assert (=> start!110524 (and (array_inv!31802 _values!1354) e!746056)))

(declare-fun b!1307452 () Bool)

(declare-fun res!867875 () Bool)

(assert (=> b!1307452 (=> (not res!867875) (not e!746054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87180 (_ BitVec 32)) Bool)

(assert (=> b!1307452 (= res!867875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307453 () Bool)

(assert (=> b!1307453 (= e!746056 (and e!746053 mapRes!54262))))

(declare-fun condMapEmpty!54262 () Bool)

(declare-fun mapDefault!54262 () ValueCell!16646)

