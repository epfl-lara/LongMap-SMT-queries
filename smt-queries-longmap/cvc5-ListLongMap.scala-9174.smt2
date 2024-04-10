; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110334 () Bool)

(assert start!110334)

(declare-fun b_free!29317 () Bool)

(declare-fun b_next!29317 () Bool)

(assert (=> start!110334 (= b_free!29317 (not b_next!29317))))

(declare-fun tp!103119 () Bool)

(declare-fun b_and!47523 () Bool)

(assert (=> start!110334 (= tp!103119 b_and!47523)))

(declare-fun mapIsEmpty!54046 () Bool)

(declare-fun mapRes!54046 () Bool)

(assert (=> mapIsEmpty!54046 mapRes!54046))

(declare-fun b!1305900 () Bool)

(declare-fun res!867051 () Bool)

(declare-fun e!744897 () Bool)

(assert (=> b!1305900 (=> (not res!867051) (not e!744897))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86930 0))(
  ( (array!86931 (arr!41951 (Array (_ BitVec 32) (_ BitVec 64))) (size!42501 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86930)

(assert (=> b!1305900 (= res!867051 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42501 _keys!1741))))))

(declare-fun b!1305902 () Bool)

(declare-fun e!744898 () Bool)

(declare-fun e!744896 () Bool)

(assert (=> b!1305902 (= e!744898 (and e!744896 mapRes!54046))))

(declare-fun condMapEmpty!54046 () Bool)

(declare-datatypes ((V!51713 0))(
  ( (V!51714 (val!17553 Int)) )
))
(declare-datatypes ((ValueCell!16580 0))(
  ( (ValueCellFull!16580 (v!20178 V!51713)) (EmptyCell!16580) )
))
(declare-datatypes ((array!86932 0))(
  ( (array!86933 (arr!41952 (Array (_ BitVec 32) ValueCell!16580)) (size!42502 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86932)

(declare-fun mapDefault!54046 () ValueCell!16580)

