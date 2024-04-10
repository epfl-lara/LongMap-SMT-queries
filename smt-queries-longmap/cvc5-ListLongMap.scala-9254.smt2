; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110872 () Bool)

(assert start!110872)

(declare-fun b_free!29707 () Bool)

(declare-fun b_next!29707 () Bool)

(assert (=> start!110872 (= b_free!29707 (not b_next!29707))))

(declare-fun tp!104443 () Bool)

(declare-fun b_and!47915 () Bool)

(assert (=> start!110872 (= tp!104443 b_and!47915)))

(declare-fun b!1312595 () Bool)

(declare-fun e!748665 () Bool)

(declare-fun e!748664 () Bool)

(declare-fun mapRes!54784 () Bool)

(assert (=> b!1312595 (= e!748665 (and e!748664 mapRes!54784))))

(declare-fun condMapEmpty!54784 () Bool)

(declare-datatypes ((V!52353 0))(
  ( (V!52354 (val!17793 Int)) )
))
(declare-datatypes ((ValueCell!16820 0))(
  ( (ValueCellFull!16820 (v!20420 V!52353)) (EmptyCell!16820) )
))
(declare-datatypes ((array!87858 0))(
  ( (array!87859 (arr!42409 (Array (_ BitVec 32) ValueCell!16820)) (size!42959 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87858)

(declare-fun mapDefault!54784 () ValueCell!16820)

