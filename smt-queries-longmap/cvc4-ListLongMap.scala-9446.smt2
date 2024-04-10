; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112288 () Bool)

(assert start!112288)

(declare-fun b_free!30683 () Bool)

(declare-fun b_next!30683 () Bool)

(assert (=> start!112288 (= b_free!30683 (not b_next!30683))))

(declare-fun tp!107686 () Bool)

(declare-fun b_and!49421 () Bool)

(assert (=> start!112288 (= tp!107686 b_and!49421)))

(declare-fun b!1330539 () Bool)

(declare-fun e!758323 () Bool)

(declare-fun tp_is_empty!36593 () Bool)

(assert (=> b!1330539 (= e!758323 tp_is_empty!36593)))

(declare-fun b!1330540 () Bool)

(declare-fun e!758325 () Bool)

(declare-fun mapRes!56563 () Bool)

(assert (=> b!1330540 (= e!758325 (and e!758323 mapRes!56563))))

(declare-fun condMapEmpty!56563 () Bool)

(declare-datatypes ((V!53893 0))(
  ( (V!53894 (val!18371 Int)) )
))
(declare-datatypes ((ValueCell!17398 0))(
  ( (ValueCellFull!17398 (v!21008 V!53893)) (EmptyCell!17398) )
))
(declare-datatypes ((array!90072 0))(
  ( (array!90073 (arr!43502 (Array (_ BitVec 32) ValueCell!17398)) (size!44052 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90072)

(declare-fun mapDefault!56563 () ValueCell!17398)

