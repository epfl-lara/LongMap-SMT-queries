; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134050 () Bool)

(assert start!134050)

(declare-fun res!1070817 () Bool)

(declare-fun e!873324 () Bool)

(assert (=> start!134050 (=> (not res!1070817) (not e!873324))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134050 (= res!1070817 (validMask!0 mask!947))))

(assert (=> start!134050 e!873324))

(assert (=> start!134050 true))

(declare-datatypes ((array!104626 0))(
  ( (array!104627 (arr!50499 (Array (_ BitVec 32) (_ BitVec 64))) (size!51049 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104626)

(declare-fun array_inv!39237 (array!104626) Bool)

(assert (=> start!134050 (array_inv!39237 _keys!637)))

(declare-datatypes ((V!60165 0))(
  ( (V!60166 (val!19568 Int)) )
))
(declare-datatypes ((ValueCell!18454 0))(
  ( (ValueCellFull!18454 (v!22327 V!60165)) (EmptyCell!18454) )
))
(declare-datatypes ((array!104628 0))(
  ( (array!104629 (arr!50500 (Array (_ BitVec 32) ValueCell!18454)) (size!51050 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104628)

(declare-fun e!873327 () Bool)

(declare-fun array_inv!39238 (array!104628) Bool)

(assert (=> start!134050 (and (array_inv!39238 _values!487) e!873327)))

(declare-fun mapIsEmpty!59850 () Bool)

(declare-fun mapRes!59850 () Bool)

(assert (=> mapIsEmpty!59850 mapRes!59850))

(declare-fun b!1566759 () Bool)

(declare-fun res!1070816 () Bool)

(assert (=> b!1566759 (=> (not res!1070816) (not e!873324))))

(declare-datatypes ((List!36634 0))(
  ( (Nil!36631) (Cons!36630 (h!38077 (_ BitVec 64)) (t!51538 List!36634)) )
))
(declare-fun arrayNoDuplicates!0 (array!104626 (_ BitVec 32) List!36634) Bool)

(assert (=> b!1566759 (= res!1070816 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36631))))

(declare-fun b!1566760 () Bool)

(declare-fun e!873326 () Bool)

(assert (=> b!1566760 (= e!873327 (and e!873326 mapRes!59850))))

(declare-fun condMapEmpty!59850 () Bool)

(declare-fun mapDefault!59850 () ValueCell!18454)

