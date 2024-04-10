; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111332 () Bool)

(assert start!111332)

(declare-fun res!874378 () Bool)

(declare-fun e!751755 () Bool)

(assert (=> start!111332 (=> (not res!874378) (not e!751755))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111332 (= res!874378 (validMask!0 mask!2019))))

(assert (=> start!111332 e!751755))

(assert (=> start!111332 true))

(declare-datatypes ((V!52849 0))(
  ( (V!52850 (val!17979 Int)) )
))
(declare-datatypes ((ValueCell!17006 0))(
  ( (ValueCellFull!17006 (v!20609 V!52849)) (EmptyCell!17006) )
))
(declare-datatypes ((array!88574 0))(
  ( (array!88575 (arr!42761 (Array (_ BitVec 32) ValueCell!17006)) (size!43311 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88574)

(declare-fun e!751759 () Bool)

(declare-fun array_inv!32295 (array!88574) Bool)

(assert (=> start!111332 (and (array_inv!32295 _values!1337) e!751759)))

(declare-datatypes ((array!88576 0))(
  ( (array!88577 (arr!42762 (Array (_ BitVec 32) (_ BitVec 64))) (size!43312 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88576)

(declare-fun array_inv!32296 (array!88576) Bool)

(assert (=> start!111332 (array_inv!32296 _keys!1609)))

(declare-fun b!1317429 () Bool)

(assert (=> b!1317429 (= e!751755 false)))

(declare-fun lt!586368 () Bool)

(declare-datatypes ((List!30306 0))(
  ( (Nil!30303) (Cons!30302 (h!31511 (_ BitVec 64)) (t!43914 List!30306)) )
))
(declare-fun arrayNoDuplicates!0 (array!88576 (_ BitVec 32) List!30306) Bool)

(assert (=> b!1317429 (= lt!586368 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30303))))

(declare-fun mapNonEmpty!55361 () Bool)

(declare-fun mapRes!55361 () Bool)

(declare-fun tp!105467 () Bool)

(declare-fun e!751756 () Bool)

(assert (=> mapNonEmpty!55361 (= mapRes!55361 (and tp!105467 e!751756))))

(declare-fun mapValue!55361 () ValueCell!17006)

(declare-fun mapKey!55361 () (_ BitVec 32))

(declare-fun mapRest!55361 () (Array (_ BitVec 32) ValueCell!17006))

(assert (=> mapNonEmpty!55361 (= (arr!42761 _values!1337) (store mapRest!55361 mapKey!55361 mapValue!55361))))

(declare-fun b!1317430 () Bool)

(declare-fun e!751757 () Bool)

(assert (=> b!1317430 (= e!751759 (and e!751757 mapRes!55361))))

(declare-fun condMapEmpty!55361 () Bool)

(declare-fun mapDefault!55361 () ValueCell!17006)

