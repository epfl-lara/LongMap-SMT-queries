; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110358 () Bool)

(assert start!110358)

(declare-fun res!867145 () Bool)

(declare-fun e!745044 () Bool)

(assert (=> start!110358 (=> (not res!867145) (not e!745044))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110358 (= res!867145 (validMask!0 mask!2040))))

(assert (=> start!110358 e!745044))

(assert (=> start!110358 true))

(declare-datatypes ((V!51725 0))(
  ( (V!51726 (val!17558 Int)) )
))
(declare-datatypes ((ValueCell!16585 0))(
  ( (ValueCellFull!16585 (v!20184 V!51725)) (EmptyCell!16585) )
))
(declare-datatypes ((array!86950 0))(
  ( (array!86951 (arr!41960 (Array (_ BitVec 32) ValueCell!16585)) (size!42510 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86950)

(declare-fun e!745047 () Bool)

(declare-fun array_inv!31727 (array!86950) Bool)

(assert (=> start!110358 (and (array_inv!31727 _values!1354) e!745047)))

(declare-datatypes ((array!86952 0))(
  ( (array!86953 (arr!41961 (Array (_ BitVec 32) (_ BitVec 64))) (size!42511 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86952)

(declare-fun array_inv!31728 (array!86952) Bool)

(assert (=> start!110358 (array_inv!31728 _keys!1628)))

(declare-fun b!1306104 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306104 (= e!745044 (and (= (size!42510 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42511 _keys!1628) (size!42510 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011) (not (= (size!42511 _keys!1628) (bvadd #b00000000000000000000000000000001 mask!2040)))))))

(declare-fun b!1306105 () Bool)

(declare-fun e!745043 () Bool)

(declare-fun mapRes!54064 () Bool)

(assert (=> b!1306105 (= e!745047 (and e!745043 mapRes!54064))))

(declare-fun condMapEmpty!54064 () Bool)

(declare-fun mapDefault!54064 () ValueCell!16585)

