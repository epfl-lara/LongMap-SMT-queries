; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111140 () Bool)

(assert start!111140)

(declare-fun b_free!29975 () Bool)

(declare-fun b_next!29975 () Bool)

(assert (=> start!111140 (= b_free!29975 (not b_next!29975))))

(declare-fun tp!105247 () Bool)

(declare-fun b_and!48183 () Bool)

(assert (=> start!111140 (= tp!105247 b_and!48183)))

(declare-fun b!1315910 () Bool)

(declare-fun e!750673 () Bool)

(assert (=> b!1315910 (= e!750673 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88370 0))(
  ( (array!88371 (arr!42665 (Array (_ BitVec 32) (_ BitVec 64))) (size!43215 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88370)

(declare-datatypes ((V!52709 0))(
  ( (V!52710 (val!17927 Int)) )
))
(declare-fun minValue!1296 () V!52709)

(declare-datatypes ((ValueCell!16954 0))(
  ( (ValueCellFull!16954 (v!20554 V!52709)) (EmptyCell!16954) )
))
(declare-datatypes ((array!88372 0))(
  ( (array!88373 (arr!42666 (Array (_ BitVec 32) ValueCell!16954)) (size!43216 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88372)

(declare-fun zeroValue!1296 () V!52709)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585972 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!23130 0))(
  ( (tuple2!23131 (_1!11576 (_ BitVec 64)) (_2!11576 V!52709)) )
))
(declare-datatypes ((List!30268 0))(
  ( (Nil!30265) (Cons!30264 (h!31473 tuple2!23130) (t!43874 List!30268)) )
))
(declare-datatypes ((ListLongMap!20787 0))(
  ( (ListLongMap!20788 (toList!10409 List!30268)) )
))
(declare-fun contains!8559 (ListLongMap!20787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5422 (array!88370 array!88372 (_ BitVec 32) (_ BitVec 32) V!52709 V!52709 (_ BitVec 32) Int) ListLongMap!20787)

(assert (=> b!1315910 (= lt!585972 (contains!8559 (getCurrentListMap!5422 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!873566 () Bool)

(assert (=> start!111140 (=> (not res!873566) (not e!750673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111140 (= res!873566 (validMask!0 mask!2040))))

(assert (=> start!111140 e!750673))

(assert (=> start!111140 tp!105247))

(declare-fun array_inv!32223 (array!88370) Bool)

(assert (=> start!111140 (array_inv!32223 _keys!1628)))

(assert (=> start!111140 true))

(declare-fun tp_is_empty!35705 () Bool)

(assert (=> start!111140 tp_is_empty!35705))

(declare-fun e!750674 () Bool)

(declare-fun array_inv!32224 (array!88372) Bool)

(assert (=> start!111140 (and (array_inv!32224 _values!1354) e!750674)))

(declare-fun b!1315911 () Bool)

(declare-fun e!750676 () Bool)

(assert (=> b!1315911 (= e!750676 tp_is_empty!35705)))

(declare-fun b!1315912 () Bool)

(declare-fun e!750675 () Bool)

(assert (=> b!1315912 (= e!750675 tp_is_empty!35705)))

(declare-fun mapNonEmpty!55186 () Bool)

(declare-fun mapRes!55186 () Bool)

(declare-fun tp!105246 () Bool)

(assert (=> mapNonEmpty!55186 (= mapRes!55186 (and tp!105246 e!750676))))

(declare-fun mapRest!55186 () (Array (_ BitVec 32) ValueCell!16954))

(declare-fun mapValue!55186 () ValueCell!16954)

(declare-fun mapKey!55186 () (_ BitVec 32))

(assert (=> mapNonEmpty!55186 (= (arr!42666 _values!1354) (store mapRest!55186 mapKey!55186 mapValue!55186))))

(declare-fun b!1315913 () Bool)

(declare-fun res!873570 () Bool)

(assert (=> b!1315913 (=> (not res!873570) (not e!750673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88370 (_ BitVec 32)) Bool)

(assert (=> b!1315913 (= res!873570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315914 () Bool)

(declare-fun res!873569 () Bool)

(assert (=> b!1315914 (=> (not res!873569) (not e!750673))))

(assert (=> b!1315914 (= res!873569 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43215 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315915 () Bool)

(declare-fun res!873568 () Bool)

(assert (=> b!1315915 (=> (not res!873568) (not e!750673))))

(declare-datatypes ((List!30269 0))(
  ( (Nil!30266) (Cons!30265 (h!31474 (_ BitVec 64)) (t!43875 List!30269)) )
))
(declare-fun arrayNoDuplicates!0 (array!88370 (_ BitVec 32) List!30269) Bool)

(assert (=> b!1315915 (= res!873568 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30266))))

(declare-fun b!1315916 () Bool)

(assert (=> b!1315916 (= e!750674 (and e!750675 mapRes!55186))))

(declare-fun condMapEmpty!55186 () Bool)

(declare-fun mapDefault!55186 () ValueCell!16954)

