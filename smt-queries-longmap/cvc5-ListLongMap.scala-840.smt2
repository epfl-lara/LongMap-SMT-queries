; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20136 () Bool)

(assert start!20136)

(declare-fun b_free!4795 () Bool)

(declare-fun b_next!4795 () Bool)

(assert (=> start!20136 (= b_free!4795 (not b_next!4795))))

(declare-fun tp!17417 () Bool)

(declare-fun b_and!11541 () Bool)

(assert (=> start!20136 (= tp!17417 b_and!11541)))

(declare-fun mapIsEmpty!8045 () Bool)

(declare-fun mapRes!8045 () Bool)

(assert (=> mapIsEmpty!8045 mapRes!8045))

(declare-fun b!197474 () Bool)

(declare-fun e!129941 () Bool)

(declare-fun tp_is_empty!4651 () Bool)

(assert (=> b!197474 (= e!129941 tp_is_empty!4651)))

(declare-fun b!197475 () Bool)

(declare-fun res!93415 () Bool)

(declare-fun e!129942 () Bool)

(assert (=> b!197475 (=> (not res!93415) (not e!129942))))

(declare-datatypes ((array!8555 0))(
  ( (array!8556 (arr!4028 (Array (_ BitVec 32) (_ BitVec 64))) (size!4353 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8555)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8555 (_ BitVec 32)) Bool)

(assert (=> b!197475 (= res!93415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197476 () Bool)

(declare-fun e!129943 () Bool)

(assert (=> b!197476 (= e!129943 (and e!129941 mapRes!8045))))

(declare-fun condMapEmpty!8045 () Bool)

(declare-datatypes ((V!5849 0))(
  ( (V!5850 (val!2370 Int)) )
))
(declare-datatypes ((ValueCell!1982 0))(
  ( (ValueCellFull!1982 (v!4340 V!5849)) (EmptyCell!1982) )
))
(declare-datatypes ((array!8557 0))(
  ( (array!8558 (arr!4029 (Array (_ BitVec 32) ValueCell!1982)) (size!4354 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8557)

(declare-fun mapDefault!8045 () ValueCell!1982)

