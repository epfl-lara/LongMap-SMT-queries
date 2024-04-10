; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112134 () Bool)

(assert start!112134)

(declare-fun res!881182 () Bool)

(declare-fun e!757169 () Bool)

(assert (=> start!112134 (=> (not res!881182) (not e!757169))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112134 (= res!881182 (validMask!0 mask!1998))))

(assert (=> start!112134 e!757169))

(assert (=> start!112134 true))

(declare-datatypes ((V!53689 0))(
  ( (V!53690 (val!18294 Int)) )
))
(declare-datatypes ((ValueCell!17321 0))(
  ( (ValueCellFull!17321 (v!20931 V!53689)) (EmptyCell!17321) )
))
(declare-datatypes ((array!89778 0))(
  ( (array!89779 (arr!43355 (Array (_ BitVec 32) ValueCell!17321)) (size!43905 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89778)

(declare-fun e!757171 () Bool)

(declare-fun array_inv!32717 (array!89778) Bool)

(assert (=> start!112134 (and (array_inv!32717 _values!1320) e!757171)))

(declare-datatypes ((array!89780 0))(
  ( (array!89781 (arr!43356 (Array (_ BitVec 32) (_ BitVec 64))) (size!43906 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89780)

(declare-fun array_inv!32718 (array!89780) Bool)

(assert (=> start!112134 (array_inv!32718 _keys!1590)))

(declare-fun b!1328063 () Bool)

(assert (=> b!1328063 (= e!757169 false)))

(declare-fun lt!590800 () Bool)

(declare-datatypes ((List!30709 0))(
  ( (Nil!30706) (Cons!30705 (h!31914 (_ BitVec 64)) (t!44715 List!30709)) )
))
(declare-fun arrayNoDuplicates!0 (array!89780 (_ BitVec 32) List!30709) Bool)

(assert (=> b!1328063 (= lt!590800 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30706))))

(declare-fun b!1328064 () Bool)

(declare-fun e!757167 () Bool)

(declare-fun mapRes!56332 () Bool)

(assert (=> b!1328064 (= e!757171 (and e!757167 mapRes!56332))))

(declare-fun condMapEmpty!56332 () Bool)

(declare-fun mapDefault!56332 () ValueCell!17321)

