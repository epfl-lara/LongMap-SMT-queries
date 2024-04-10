; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110866 () Bool)

(assert start!110866)

(declare-fun b_free!29701 () Bool)

(declare-fun b_next!29701 () Bool)

(assert (=> start!110866 (= b_free!29701 (not b_next!29701))))

(declare-fun tp!104424 () Bool)

(declare-fun b_and!47909 () Bool)

(assert (=> start!110866 (= tp!104424 b_and!47909)))

(declare-fun b!1312523 () Bool)

(declare-fun res!871412 () Bool)

(declare-fun e!748621 () Bool)

(assert (=> b!1312523 (=> (not res!871412) (not e!748621))))

(declare-datatypes ((array!87848 0))(
  ( (array!87849 (arr!42404 (Array (_ BitVec 32) (_ BitVec 64))) (size!42954 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87848)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52345 0))(
  ( (V!52346 (val!17790 Int)) )
))
(declare-datatypes ((ValueCell!16817 0))(
  ( (ValueCellFull!16817 (v!20417 V!52345)) (EmptyCell!16817) )
))
(declare-datatypes ((array!87850 0))(
  ( (array!87851 (arr!42405 (Array (_ BitVec 32) ValueCell!16817)) (size!42955 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87850)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312523 (= res!871412 (and (= (size!42955 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42954 _keys!1628) (size!42955 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312524 () Bool)

(declare-fun res!871413 () Bool)

(assert (=> b!1312524 (=> (not res!871413) (not e!748621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87848 (_ BitVec 32)) Bool)

(assert (=> b!1312524 (= res!871413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312525 () Bool)

(declare-fun e!748618 () Bool)

(declare-fun tp_is_empty!35431 () Bool)

(assert (=> b!1312525 (= e!748618 tp_is_empty!35431)))

(declare-fun b!1312526 () Bool)

(assert (=> b!1312526 (= e!748621 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585570 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52345)

(declare-fun zeroValue!1296 () V!52345)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22932 0))(
  ( (tuple2!22933 (_1!11477 (_ BitVec 64)) (_2!11477 V!52345)) )
))
(declare-datatypes ((List!30071 0))(
  ( (Nil!30068) (Cons!30067 (h!31276 tuple2!22932) (t!43677 List!30071)) )
))
(declare-datatypes ((ListLongMap!20589 0))(
  ( (ListLongMap!20590 (toList!10310 List!30071)) )
))
(declare-fun contains!8460 (ListLongMap!20589 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5323 (array!87848 array!87850 (_ BitVec 32) (_ BitVec 32) V!52345 V!52345 (_ BitVec 32) Int) ListLongMap!20589)

(assert (=> b!1312526 (= lt!585570 (contains!8460 (getCurrentListMap!5323 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312527 () Bool)

(declare-fun e!748620 () Bool)

(declare-fun e!748622 () Bool)

(declare-fun mapRes!54775 () Bool)

(assert (=> b!1312527 (= e!748620 (and e!748622 mapRes!54775))))

(declare-fun condMapEmpty!54775 () Bool)

(declare-fun mapDefault!54775 () ValueCell!16817)

