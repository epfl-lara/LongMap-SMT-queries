; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131702 () Bool)

(assert start!131702)

(declare-fun b!1542273 () Bool)

(declare-fun e!857991 () Bool)

(assert (=> b!1542273 (= e!857991 false)))

(declare-fun lt!665789 () Bool)

(declare-datatypes ((array!102612 0))(
  ( (array!102613 (arr!49508 (Array (_ BitVec 32) (_ BitVec 64))) (size!50058 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102612)

(declare-datatypes ((List!35869 0))(
  ( (Nil!35866) (Cons!35865 (h!37310 (_ BitVec 64)) (t!50563 List!35869)) )
))
(declare-fun arrayNoDuplicates!0 (array!102612 (_ BitVec 32) List!35869) Bool)

(assert (=> b!1542273 (= lt!665789 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35866))))

(declare-fun res!1058410 () Bool)

(assert (=> start!131702 (=> (not res!1058410) (not e!857991))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131702 (= res!1058410 (validMask!0 mask!926))))

(assert (=> start!131702 e!857991))

(assert (=> start!131702 true))

(declare-datatypes ((V!58697 0))(
  ( (V!58698 (val!18923 Int)) )
))
(declare-datatypes ((ValueCell!17935 0))(
  ( (ValueCellFull!17935 (v!21724 V!58697)) (EmptyCell!17935) )
))
(declare-datatypes ((array!102614 0))(
  ( (array!102615 (arr!49509 (Array (_ BitVec 32) ValueCell!17935)) (size!50059 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102614)

(declare-fun e!857992 () Bool)

(declare-fun array_inv!38519 (array!102614) Bool)

(assert (=> start!131702 (and (array_inv!38519 _values!470) e!857992)))

(declare-fun array_inv!38520 (array!102612) Bool)

(assert (=> start!131702 (array_inv!38520 _keys!618)))

(declare-fun b!1542274 () Bool)

(declare-fun res!1058412 () Bool)

(assert (=> b!1542274 (=> (not res!1058412) (not e!857991))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542274 (= res!1058412 (and (= (size!50059 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50058 _keys!618) (size!50059 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542275 () Bool)

(declare-fun e!857994 () Bool)

(declare-fun tp_is_empty!37691 () Bool)

(assert (=> b!1542275 (= e!857994 tp_is_empty!37691)))

(declare-fun mapIsEmpty!58240 () Bool)

(declare-fun mapRes!58240 () Bool)

(assert (=> mapIsEmpty!58240 mapRes!58240))

(declare-fun b!1542276 () Bool)

(declare-fun res!1058411 () Bool)

(assert (=> b!1542276 (=> (not res!1058411) (not e!857991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102612 (_ BitVec 32)) Bool)

(assert (=> b!1542276 (= res!1058411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542277 () Bool)

(declare-fun e!857993 () Bool)

(assert (=> b!1542277 (= e!857993 tp_is_empty!37691)))

(declare-fun b!1542278 () Bool)

(assert (=> b!1542278 (= e!857992 (and e!857994 mapRes!58240))))

(declare-fun condMapEmpty!58240 () Bool)

(declare-fun mapDefault!58240 () ValueCell!17935)

