; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111330 () Bool)

(assert start!111330)

(declare-fun b!1317411 () Bool)

(declare-fun e!751743 () Bool)

(assert (=> b!1317411 (= e!751743 false)))

(declare-fun lt!586365 () Bool)

(declare-datatypes ((array!88570 0))(
  ( (array!88571 (arr!42759 (Array (_ BitVec 32) (_ BitVec 64))) (size!43309 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88570)

(declare-datatypes ((List!30305 0))(
  ( (Nil!30302) (Cons!30301 (h!31510 (_ BitVec 64)) (t!43913 List!30305)) )
))
(declare-fun arrayNoDuplicates!0 (array!88570 (_ BitVec 32) List!30305) Bool)

(assert (=> b!1317411 (= lt!586365 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30302))))

(declare-fun res!874369 () Bool)

(assert (=> start!111330 (=> (not res!874369) (not e!751743))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111330 (= res!874369 (validMask!0 mask!2019))))

(assert (=> start!111330 e!751743))

(assert (=> start!111330 true))

(declare-datatypes ((V!52845 0))(
  ( (V!52846 (val!17978 Int)) )
))
(declare-datatypes ((ValueCell!17005 0))(
  ( (ValueCellFull!17005 (v!20608 V!52845)) (EmptyCell!17005) )
))
(declare-datatypes ((array!88572 0))(
  ( (array!88573 (arr!42760 (Array (_ BitVec 32) ValueCell!17005)) (size!43310 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88572)

(declare-fun e!751744 () Bool)

(declare-fun array_inv!32293 (array!88572) Bool)

(assert (=> start!111330 (and (array_inv!32293 _values!1337) e!751744)))

(declare-fun array_inv!32294 (array!88570) Bool)

(assert (=> start!111330 (array_inv!32294 _keys!1609)))

(declare-fun b!1317412 () Bool)

(declare-fun e!751742 () Bool)

(declare-fun tp_is_empty!35807 () Bool)

(assert (=> b!1317412 (= e!751742 tp_is_empty!35807)))

(declare-fun b!1317413 () Bool)

(declare-fun e!751740 () Bool)

(declare-fun mapRes!55358 () Bool)

(assert (=> b!1317413 (= e!751744 (and e!751740 mapRes!55358))))

(declare-fun condMapEmpty!55358 () Bool)

(declare-fun mapDefault!55358 () ValueCell!17005)

