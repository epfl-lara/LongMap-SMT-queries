; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131830 () Bool)

(assert start!131830)

(declare-fun mapNonEmpty!58432 () Bool)

(declare-fun mapRes!58432 () Bool)

(declare-fun tp!110959 () Bool)

(declare-fun e!858954 () Bool)

(assert (=> mapNonEmpty!58432 (= mapRes!58432 (and tp!110959 e!858954))))

(declare-datatypes ((V!58869 0))(
  ( (V!58870 (val!18987 Int)) )
))
(declare-datatypes ((ValueCell!17999 0))(
  ( (ValueCellFull!17999 (v!21788 V!58869)) (EmptyCell!17999) )
))
(declare-fun mapValue!58432 () ValueCell!17999)

(declare-fun mapRest!58432 () (Array (_ BitVec 32) ValueCell!17999))

(declare-fun mapKey!58432 () (_ BitVec 32))

(declare-datatypes ((array!102862 0))(
  ( (array!102863 (arr!49633 (Array (_ BitVec 32) ValueCell!17999)) (size!50183 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102862)

(assert (=> mapNonEmpty!58432 (= (arr!49633 _values!470) (store mapRest!58432 mapKey!58432 mapValue!58432))))

(declare-fun b!1543425 () Bool)

(declare-fun tp_is_empty!37819 () Bool)

(assert (=> b!1543425 (= e!858954 tp_is_empty!37819)))

(declare-fun b!1543427 () Bool)

(declare-fun res!1058986 () Bool)

(declare-fun e!858953 () Bool)

(assert (=> b!1543427 (=> (not res!1058986) (not e!858953))))

(declare-datatypes ((array!102864 0))(
  ( (array!102865 (arr!49634 (Array (_ BitVec 32) (_ BitVec 64))) (size!50184 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102864)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1543427 (= res!1058986 (and (= (size!50183 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50184 _keys!618) (size!50183 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543428 () Bool)

(assert (=> b!1543428 (= e!858953 false)))

(declare-fun lt!665981 () Bool)

(declare-datatypes ((List!35921 0))(
  ( (Nil!35918) (Cons!35917 (h!37362 (_ BitVec 64)) (t!50615 List!35921)) )
))
(declare-fun arrayNoDuplicates!0 (array!102864 (_ BitVec 32) List!35921) Bool)

(assert (=> b!1543428 (= lt!665981 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35918))))

(declare-fun b!1543429 () Bool)

(declare-fun res!1058988 () Bool)

(assert (=> b!1543429 (=> (not res!1058988) (not e!858953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102864 (_ BitVec 32)) Bool)

(assert (=> b!1543429 (= res!1058988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543430 () Bool)

(declare-fun e!858950 () Bool)

(declare-fun e!858952 () Bool)

(assert (=> b!1543430 (= e!858950 (and e!858952 mapRes!58432))))

(declare-fun condMapEmpty!58432 () Bool)

(declare-fun mapDefault!58432 () ValueCell!17999)

