; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83092 () Bool)

(assert start!83092)

(declare-fun b!969272 () Bool)

(declare-fun e!546436 () Bool)

(assert (=> b!969272 (= e!546436 false)))

(declare-fun lt!431624 () Bool)

(declare-datatypes ((array!60033 0))(
  ( (array!60034 (arr!28880 (Array (_ BitVec 32) (_ BitVec 64))) (size!29359 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60033)

(declare-datatypes ((List!20021 0))(
  ( (Nil!20018) (Cons!20017 (h!21179 (_ BitVec 64)) (t!28384 List!20021)) )
))
(declare-fun arrayNoDuplicates!0 (array!60033 (_ BitVec 32) List!20021) Bool)

(assert (=> b!969272 (= lt!431624 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20018))))

(declare-fun res!648758 () Bool)

(assert (=> start!83092 (=> (not res!648758) (not e!546436))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83092 (= res!648758 (validMask!0 mask!2147))))

(assert (=> start!83092 e!546436))

(assert (=> start!83092 true))

(declare-datatypes ((V!34293 0))(
  ( (V!34294 (val!11042 Int)) )
))
(declare-datatypes ((ValueCell!10510 0))(
  ( (ValueCellFull!10510 (v!13601 V!34293)) (EmptyCell!10510) )
))
(declare-datatypes ((array!60035 0))(
  ( (array!60036 (arr!28881 (Array (_ BitVec 32) ValueCell!10510)) (size!29360 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60035)

(declare-fun e!546437 () Bool)

(declare-fun array_inv!22357 (array!60035) Bool)

(assert (=> start!83092 (and (array_inv!22357 _values!1425) e!546437)))

(declare-fun array_inv!22358 (array!60033) Bool)

(assert (=> start!83092 (array_inv!22358 _keys!1717)))

(declare-fun b!969273 () Bool)

(declare-fun res!648757 () Bool)

(assert (=> b!969273 (=> (not res!648757) (not e!546436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60033 (_ BitVec 32)) Bool)

(assert (=> b!969273 (= res!648757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969274 () Bool)

(declare-fun e!546439 () Bool)

(declare-fun mapRes!34984 () Bool)

(assert (=> b!969274 (= e!546437 (and e!546439 mapRes!34984))))

(declare-fun condMapEmpty!34984 () Bool)

(declare-fun mapDefault!34984 () ValueCell!10510)

