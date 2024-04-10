; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110404 () Bool)

(assert start!110404)

(declare-fun b!1306356 () Bool)

(declare-fun res!867254 () Bool)

(declare-fun e!745260 () Bool)

(assert (=> b!1306356 (=> (not res!867254) (not e!745260))))

(declare-datatypes ((array!86996 0))(
  ( (array!86997 (arr!41980 (Array (_ BitVec 32) (_ BitVec 64))) (size!42530 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86996)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51757 0))(
  ( (V!51758 (val!17570 Int)) )
))
(declare-datatypes ((ValueCell!16597 0))(
  ( (ValueCellFull!16597 (v!20196 V!51757)) (EmptyCell!16597) )
))
(declare-datatypes ((array!86998 0))(
  ( (array!86999 (arr!41981 (Array (_ BitVec 32) ValueCell!16597)) (size!42531 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86998)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306356 (= res!867254 (and (= (size!42531 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42530 _keys!1628) (size!42531 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!867255 () Bool)

(assert (=> start!110404 (=> (not res!867255) (not e!745260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110404 (= res!867255 (validMask!0 mask!2040))))

(assert (=> start!110404 e!745260))

(assert (=> start!110404 true))

(declare-fun e!745263 () Bool)

(declare-fun array_inv!31737 (array!86998) Bool)

(assert (=> start!110404 (and (array_inv!31737 _values!1354) e!745263)))

(declare-fun array_inv!31738 (array!86996) Bool)

(assert (=> start!110404 (array_inv!31738 _keys!1628)))

(declare-fun mapIsEmpty!54109 () Bool)

(declare-fun mapRes!54109 () Bool)

(assert (=> mapIsEmpty!54109 mapRes!54109))

(declare-fun b!1306357 () Bool)

(declare-datatypes ((List!29787 0))(
  ( (Nil!29784) (Cons!29783 (h!30992 (_ BitVec 64)) (t!43393 List!29787)) )
))
(declare-fun noDuplicate!2058 (List!29787) Bool)

(assert (=> b!1306357 (= e!745260 (not (noDuplicate!2058 Nil!29784)))))

(declare-fun b!1306358 () Bool)

(declare-fun e!745259 () Bool)

(assert (=> b!1306358 (= e!745263 (and e!745259 mapRes!54109))))

(declare-fun condMapEmpty!54109 () Bool)

(declare-fun mapDefault!54109 () ValueCell!16597)

