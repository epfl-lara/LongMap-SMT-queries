; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111338 () Bool)

(assert start!111338)

(declare-fun mapNonEmpty!55370 () Bool)

(declare-fun mapRes!55370 () Bool)

(declare-fun tp!105476 () Bool)

(declare-fun e!751800 () Bool)

(assert (=> mapNonEmpty!55370 (= mapRes!55370 (and tp!105476 e!751800))))

(declare-datatypes ((V!52857 0))(
  ( (V!52858 (val!17982 Int)) )
))
(declare-datatypes ((ValueCell!17009 0))(
  ( (ValueCellFull!17009 (v!20612 V!52857)) (EmptyCell!17009) )
))
(declare-fun mapRest!55370 () (Array (_ BitVec 32) ValueCell!17009))

(declare-datatypes ((array!88586 0))(
  ( (array!88587 (arr!42767 (Array (_ BitVec 32) ValueCell!17009)) (size!43317 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88586)

(declare-fun mapKey!55370 () (_ BitVec 32))

(declare-fun mapValue!55370 () ValueCell!17009)

(assert (=> mapNonEmpty!55370 (= (arr!42767 _values!1337) (store mapRest!55370 mapKey!55370 mapValue!55370))))

(declare-fun res!874404 () Bool)

(declare-fun e!751804 () Bool)

(assert (=> start!111338 (=> (not res!874404) (not e!751804))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111338 (= res!874404 (validMask!0 mask!2019))))

(assert (=> start!111338 e!751804))

(assert (=> start!111338 true))

(declare-fun e!751803 () Bool)

(declare-fun array_inv!32301 (array!88586) Bool)

(assert (=> start!111338 (and (array_inv!32301 _values!1337) e!751803)))

(declare-datatypes ((array!88588 0))(
  ( (array!88589 (arr!42768 (Array (_ BitVec 32) (_ BitVec 64))) (size!43318 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88588)

(declare-fun array_inv!32302 (array!88588) Bool)

(assert (=> start!111338 (array_inv!32302 _keys!1609)))

(declare-fun b!1317483 () Bool)

(assert (=> b!1317483 (= e!751804 false)))

(declare-fun lt!586377 () Bool)

(declare-datatypes ((List!30308 0))(
  ( (Nil!30305) (Cons!30304 (h!31513 (_ BitVec 64)) (t!43916 List!30308)) )
))
(declare-fun arrayNoDuplicates!0 (array!88588 (_ BitVec 32) List!30308) Bool)

(assert (=> b!1317483 (= lt!586377 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30305))))

(declare-fun b!1317484 () Bool)

(declare-fun e!751802 () Bool)

(assert (=> b!1317484 (= e!751803 (and e!751802 mapRes!55370))))

(declare-fun condMapEmpty!55370 () Bool)

(declare-fun mapDefault!55370 () ValueCell!17009)

