; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84052 () Bool)

(assert start!84052)

(declare-fun b_free!19807 () Bool)

(declare-fun b_next!19807 () Bool)

(assert (=> start!84052 (= b_free!19807 (not b_next!19807))))

(declare-fun tp!68944 () Bool)

(declare-fun b_and!31697 () Bool)

(assert (=> start!84052 (= tp!68944 b_and!31697)))

(declare-fun b!982664 () Bool)

(declare-fun e!553910 () Bool)

(declare-fun e!553914 () Bool)

(declare-fun mapRes!36311 () Bool)

(assert (=> b!982664 (= e!553910 (and e!553914 mapRes!36311))))

(declare-fun condMapEmpty!36311 () Bool)

(declare-datatypes ((V!35457 0))(
  ( (V!35458 (val!11478 Int)) )
))
(declare-datatypes ((ValueCell!10946 0))(
  ( (ValueCellFull!10946 (v!14040 V!35457)) (EmptyCell!10946) )
))
(declare-datatypes ((array!61701 0))(
  ( (array!61702 (arr!29708 (Array (_ BitVec 32) ValueCell!10946)) (size!30187 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61701)

(declare-fun mapDefault!36311 () ValueCell!10946)

