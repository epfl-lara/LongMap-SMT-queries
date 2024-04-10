; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111578 () Bool)

(assert start!111578)

(declare-fun b_free!30235 () Bool)

(declare-fun b_next!30235 () Bool)

(assert (=> start!111578 (= b_free!30235 (not b_next!30235))))

(declare-fun tp!106181 () Bool)

(declare-fun b_and!48629 () Bool)

(assert (=> start!111578 (= tp!106181 b_and!48629)))

(declare-fun res!876997 () Bool)

(declare-fun e!753602 () Bool)

(assert (=> start!111578 (=> (not res!876997) (not e!753602))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111578 (= res!876997 (validMask!0 mask!2019))))

(assert (=> start!111578 e!753602))

(declare-datatypes ((array!89036 0))(
  ( (array!89037 (arr!42992 (Array (_ BitVec 32) (_ BitVec 64))) (size!43542 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89036)

(declare-fun array_inv!32455 (array!89036) Bool)

(assert (=> start!111578 (array_inv!32455 _keys!1609)))

(assert (=> start!111578 true))

(declare-fun tp_is_empty!36055 () Bool)

(assert (=> start!111578 tp_is_empty!36055))

(declare-datatypes ((V!53177 0))(
  ( (V!53178 (val!18102 Int)) )
))
(declare-datatypes ((ValueCell!17129 0))(
  ( (ValueCellFull!17129 (v!20732 V!53177)) (EmptyCell!17129) )
))
(declare-datatypes ((array!89038 0))(
  ( (array!89039 (arr!42993 (Array (_ BitVec 32) ValueCell!17129)) (size!43543 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89038)

(declare-fun e!753601 () Bool)

(declare-fun array_inv!32456 (array!89038) Bool)

(assert (=> start!111578 (and (array_inv!32456 _values!1337) e!753601)))

(assert (=> start!111578 tp!106181))

(declare-fun b!1321330 () Bool)

(declare-fun res!877002 () Bool)

(assert (=> b!1321330 (=> (not res!877002) (not e!753602))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321330 (= res!877002 (validKeyInArray!0 (select (arr!42992 _keys!1609) from!2000)))))

(declare-fun b!1321331 () Bool)

(declare-fun res!877004 () Bool)

(assert (=> b!1321331 (=> (not res!877004) (not e!753602))))

(declare-datatypes ((List!30462 0))(
  ( (Nil!30459) (Cons!30458 (h!31667 (_ BitVec 64)) (t!44246 List!30462)) )
))
(declare-fun arrayNoDuplicates!0 (array!89036 (_ BitVec 32) List!30462) Bool)

(assert (=> b!1321331 (= res!877004 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30459))))

(declare-fun b!1321332 () Bool)

(declare-fun e!753600 () Bool)

(declare-fun mapRes!55730 () Bool)

(assert (=> b!1321332 (= e!753601 (and e!753600 mapRes!55730))))

(declare-fun condMapEmpty!55730 () Bool)

(declare-fun mapDefault!55730 () ValueCell!17129)

