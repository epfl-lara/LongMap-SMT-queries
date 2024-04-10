; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104740 () Bool)

(assert start!104740)

(declare-fun b_free!26545 () Bool)

(declare-fun b_next!26545 () Bool)

(assert (=> start!104740 (= b_free!26545 (not b_next!26545))))

(declare-fun tp!93124 () Bool)

(declare-fun b_and!44313 () Bool)

(assert (=> start!104740 (= tp!93124 b_and!44313)))

(declare-fun mapIsEmpty!48931 () Bool)

(declare-fun mapRes!48931 () Bool)

(assert (=> mapIsEmpty!48931 mapRes!48931))

(declare-fun res!832992 () Bool)

(declare-fun e!708543 () Bool)

(assert (=> start!104740 (=> (not res!832992) (not e!708543))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104740 (= res!832992 (validMask!0 mask!1466))))

(assert (=> start!104740 e!708543))

(assert (=> start!104740 true))

(assert (=> start!104740 tp!93124))

(declare-fun tp_is_empty!31447 () Bool)

(assert (=> start!104740 tp_is_empty!31447))

(declare-datatypes ((array!80586 0))(
  ( (array!80587 (arr!38860 (Array (_ BitVec 32) (_ BitVec 64))) (size!39396 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80586)

(declare-fun array_inv!29659 (array!80586) Bool)

(assert (=> start!104740 (array_inv!29659 _keys!1118)))

(declare-datatypes ((V!47295 0))(
  ( (V!47296 (val!15786 Int)) )
))
(declare-datatypes ((ValueCell!14960 0))(
  ( (ValueCellFull!14960 (v!18482 V!47295)) (EmptyCell!14960) )
))
(declare-datatypes ((array!80588 0))(
  ( (array!80589 (arr!38861 (Array (_ BitVec 32) ValueCell!14960)) (size!39397 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80588)

(declare-fun e!708546 () Bool)

(declare-fun array_inv!29660 (array!80588) Bool)

(assert (=> start!104740 (and (array_inv!29660 _values!914) e!708546)))

(declare-fun b!1248612 () Bool)

(declare-fun e!708547 () Bool)

(assert (=> b!1248612 (= e!708547 tp_is_empty!31447)))

(declare-fun b!1248613 () Bool)

(assert (=> b!1248613 (= e!708546 (and e!708547 mapRes!48931))))

(declare-fun condMapEmpty!48931 () Bool)

(declare-fun mapDefault!48931 () ValueCell!14960)

