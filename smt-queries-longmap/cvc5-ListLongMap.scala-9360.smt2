; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111596 () Bool)

(assert start!111596)

(declare-fun b_free!30253 () Bool)

(declare-fun b_next!30253 () Bool)

(assert (=> start!111596 (= b_free!30253 (not b_next!30253))))

(declare-fun tp!106235 () Bool)

(declare-fun b_and!48665 () Bool)

(assert (=> start!111596 (= tp!106235 b_and!48665)))

(declare-fun b!1321645 () Bool)

(declare-fun res!877219 () Bool)

(declare-fun e!753738 () Bool)

(assert (=> b!1321645 (=> (not res!877219) (not e!753738))))

(declare-datatypes ((array!89070 0))(
  ( (array!89071 (arr!43009 (Array (_ BitVec 32) (_ BitVec 64))) (size!43559 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89070)

(declare-datatypes ((List!30476 0))(
  ( (Nil!30473) (Cons!30472 (h!31681 (_ BitVec 64)) (t!44278 List!30476)) )
))
(declare-fun arrayNoDuplicates!0 (array!89070 (_ BitVec 32) List!30476) Bool)

(assert (=> b!1321645 (= res!877219 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30473))))

(declare-fun res!877218 () Bool)

(assert (=> start!111596 (=> (not res!877218) (not e!753738))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111596 (= res!877218 (validMask!0 mask!2019))))

(assert (=> start!111596 e!753738))

(declare-fun array_inv!32469 (array!89070) Bool)

(assert (=> start!111596 (array_inv!32469 _keys!1609)))

(assert (=> start!111596 true))

(declare-fun tp_is_empty!36073 () Bool)

(assert (=> start!111596 tp_is_empty!36073))

(declare-datatypes ((V!53201 0))(
  ( (V!53202 (val!18111 Int)) )
))
(declare-datatypes ((ValueCell!17138 0))(
  ( (ValueCellFull!17138 (v!20741 V!53201)) (EmptyCell!17138) )
))
(declare-datatypes ((array!89072 0))(
  ( (array!89073 (arr!43010 (Array (_ BitVec 32) ValueCell!17138)) (size!43560 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89072)

(declare-fun e!753735 () Bool)

(declare-fun array_inv!32470 (array!89072) Bool)

(assert (=> start!111596 (and (array_inv!32470 _values!1337) e!753735)))

(assert (=> start!111596 tp!106235))

(declare-fun mapIsEmpty!55757 () Bool)

(declare-fun mapRes!55757 () Bool)

(assert (=> mapIsEmpty!55757 mapRes!55757))

(declare-fun b!1321646 () Bool)

(declare-fun res!877216 () Bool)

(assert (=> b!1321646 (=> (not res!877216) (not e!753738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89070 (_ BitVec 32)) Bool)

(assert (=> b!1321646 (= res!877216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321647 () Bool)

(declare-fun e!753739 () Bool)

(assert (=> b!1321647 (= e!753735 (and e!753739 mapRes!55757))))

(declare-fun condMapEmpty!55757 () Bool)

(declare-fun mapDefault!55757 () ValueCell!17138)

