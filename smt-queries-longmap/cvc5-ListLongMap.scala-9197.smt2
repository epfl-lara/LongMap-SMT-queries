; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110530 () Bool)

(assert start!110530)

(declare-fun b_free!29365 () Bool)

(declare-fun b_next!29365 () Bool)

(assert (=> start!110530 (= b_free!29365 (not b_next!29365))))

(declare-fun tp!103417 () Bool)

(declare-fun b_and!47573 () Bool)

(assert (=> start!110530 (= tp!103417 b_and!47573)))

(declare-fun b!1307519 () Bool)

(declare-fun e!746101 () Bool)

(declare-fun tp_is_empty!35095 () Bool)

(assert (=> b!1307519 (= e!746101 tp_is_empty!35095)))

(declare-fun mapIsEmpty!54271 () Bool)

(declare-fun mapRes!54271 () Bool)

(assert (=> mapIsEmpty!54271 mapRes!54271))

(declare-fun b!1307520 () Bool)

(declare-fun res!867923 () Bool)

(declare-fun e!746102 () Bool)

(assert (=> b!1307520 (=> (not res!867923) (not e!746102))))

(declare-datatypes ((array!87190 0))(
  ( (array!87191 (arr!42075 (Array (_ BitVec 32) (_ BitVec 64))) (size!42625 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87190)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87190 (_ BitVec 32)) Bool)

(assert (=> b!1307520 (= res!867923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307521 () Bool)

(declare-fun e!746098 () Bool)

(declare-fun e!746100 () Bool)

(assert (=> b!1307521 (= e!746098 (and e!746100 mapRes!54271))))

(declare-fun condMapEmpty!54271 () Bool)

(declare-datatypes ((V!51897 0))(
  ( (V!51898 (val!17622 Int)) )
))
(declare-datatypes ((ValueCell!16649 0))(
  ( (ValueCellFull!16649 (v!20249 V!51897)) (EmptyCell!16649) )
))
(declare-datatypes ((array!87192 0))(
  ( (array!87193 (arr!42076 (Array (_ BitVec 32) ValueCell!16649)) (size!42626 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87192)

(declare-fun mapDefault!54271 () ValueCell!16649)

