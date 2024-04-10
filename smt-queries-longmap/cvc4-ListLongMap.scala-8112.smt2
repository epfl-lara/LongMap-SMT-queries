; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99542 () Bool)

(assert start!99542)

(declare-fun b_free!25121 () Bool)

(declare-fun b_next!25121 () Bool)

(assert (=> start!99542 (= b_free!25121 (not b_next!25121))))

(declare-fun tp!88077 () Bool)

(declare-fun b_and!41109 () Bool)

(assert (=> start!99542 (= tp!88077 b_and!41109)))

(declare-fun b!1177775 () Bool)

(declare-fun e!669544 () Bool)

(declare-fun e!669538 () Bool)

(declare-fun mapRes!46304 () Bool)

(assert (=> b!1177775 (= e!669544 (and e!669538 mapRes!46304))))

(declare-fun condMapEmpty!46304 () Bool)

(declare-datatypes ((V!44661 0))(
  ( (V!44662 (val!14882 Int)) )
))
(declare-datatypes ((ValueCell!14116 0))(
  ( (ValueCellFull!14116 (v!17520 V!44661)) (EmptyCell!14116) )
))
(declare-datatypes ((array!76109 0))(
  ( (array!76110 (arr!36704 (Array (_ BitVec 32) ValueCell!14116)) (size!37240 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76109)

(declare-fun mapDefault!46304 () ValueCell!14116)

