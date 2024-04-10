; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93914 () Bool)

(assert start!93914)

(declare-fun b_free!21373 () Bool)

(declare-fun b_next!21373 () Bool)

(assert (=> start!93914 (= b_free!21373 (not b_next!21373))))

(declare-fun tp!75545 () Bool)

(declare-fun b_and!34095 () Bool)

(assert (=> start!93914 (= tp!75545 b_and!34095)))

(declare-fun b!1062112 () Bool)

(declare-fun res!709213 () Bool)

(declare-fun e!604937 () Bool)

(assert (=> b!1062112 (=> (not res!709213) (not e!604937))))

(declare-datatypes ((array!67371 0))(
  ( (array!67372 (arr!32392 (Array (_ BitVec 32) (_ BitVec 64))) (size!32928 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67371)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67371 (_ BitVec 32)) Bool)

(assert (=> b!1062112 (= res!709213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062113 () Bool)

(declare-fun e!604938 () Bool)

(declare-fun e!604934 () Bool)

(declare-fun mapRes!39448 () Bool)

(assert (=> b!1062113 (= e!604938 (and e!604934 mapRes!39448))))

(declare-fun condMapEmpty!39448 () Bool)

(declare-datatypes ((V!38713 0))(
  ( (V!38714 (val!12642 Int)) )
))
(declare-datatypes ((ValueCell!11888 0))(
  ( (ValueCellFull!11888 (v!15252 V!38713)) (EmptyCell!11888) )
))
(declare-datatypes ((array!67373 0))(
  ( (array!67374 (arr!32393 (Array (_ BitVec 32) ValueCell!11888)) (size!32929 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67373)

(declare-fun mapDefault!39448 () ValueCell!11888)

