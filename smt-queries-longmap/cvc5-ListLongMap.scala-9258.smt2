; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110896 () Bool)

(assert start!110896)

(declare-fun b_free!29731 () Bool)

(declare-fun b_next!29731 () Bool)

(assert (=> start!110896 (= b_free!29731 (not b_next!29731))))

(declare-fun tp!104514 () Bool)

(declare-fun b_and!47939 () Bool)

(assert (=> start!110896 (= tp!104514 b_and!47939)))

(declare-fun b!1312883 () Bool)

(declare-fun res!871639 () Bool)

(declare-fun e!748844 () Bool)

(assert (=> b!1312883 (=> (not res!871639) (not e!748844))))

(declare-datatypes ((array!87904 0))(
  ( (array!87905 (arr!42432 (Array (_ BitVec 32) (_ BitVec 64))) (size!42982 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87904)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87904 (_ BitVec 32)) Bool)

(assert (=> b!1312883 (= res!871639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312884 () Bool)

(assert (=> b!1312884 (= e!748844 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585615 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52385 0))(
  ( (V!52386 (val!17805 Int)) )
))
(declare-fun minValue!1296 () V!52385)

(declare-datatypes ((ValueCell!16832 0))(
  ( (ValueCellFull!16832 (v!20432 V!52385)) (EmptyCell!16832) )
))
(declare-datatypes ((array!87906 0))(
  ( (array!87907 (arr!42433 (Array (_ BitVec 32) ValueCell!16832)) (size!42983 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87906)

(declare-fun zeroValue!1296 () V!52385)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22950 0))(
  ( (tuple2!22951 (_1!11486 (_ BitVec 64)) (_2!11486 V!52385)) )
))
(declare-datatypes ((List!30088 0))(
  ( (Nil!30085) (Cons!30084 (h!31293 tuple2!22950) (t!43694 List!30088)) )
))
(declare-datatypes ((ListLongMap!20607 0))(
  ( (ListLongMap!20608 (toList!10319 List!30088)) )
))
(declare-fun contains!8469 (ListLongMap!20607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5332 (array!87904 array!87906 (_ BitVec 32) (_ BitVec 32) V!52385 V!52385 (_ BitVec 32) Int) ListLongMap!20607)

(assert (=> b!1312884 (= lt!585615 (contains!8469 (getCurrentListMap!5332 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312885 () Bool)

(declare-fun e!748843 () Bool)

(declare-fun tp_is_empty!35461 () Bool)

(assert (=> b!1312885 (= e!748843 tp_is_empty!35461)))

(declare-fun b!1312886 () Bool)

(declare-fun res!871637 () Bool)

(assert (=> b!1312886 (=> (not res!871637) (not e!748844))))

(assert (=> b!1312886 (= res!871637 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42982 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312887 () Bool)

(declare-fun e!748846 () Bool)

(declare-fun e!748845 () Bool)

(declare-fun mapRes!54820 () Bool)

(assert (=> b!1312887 (= e!748846 (and e!748845 mapRes!54820))))

(declare-fun condMapEmpty!54820 () Bool)

(declare-fun mapDefault!54820 () ValueCell!16832)

