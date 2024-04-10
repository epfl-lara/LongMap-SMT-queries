; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70742 () Bool)

(assert start!70742)

(declare-fun b_free!13015 () Bool)

(declare-fun b_next!13015 () Bool)

(assert (=> start!70742 (= b_free!13015 (not b_next!13015))))

(declare-fun tp!45786 () Bool)

(declare-fun b_and!21877 () Bool)

(assert (=> start!70742 (= tp!45786 b_and!21877)))

(declare-fun b!821697 () Bool)

(declare-fun e!456718 () Bool)

(declare-fun tp_is_empty!14725 () Bool)

(assert (=> b!821697 (= e!456718 tp_is_empty!14725)))

(declare-fun b!821698 () Bool)

(declare-fun e!456720 () Bool)

(declare-fun e!456717 () Bool)

(declare-fun mapRes!23695 () Bool)

(assert (=> b!821698 (= e!456720 (and e!456717 mapRes!23695))))

(declare-fun condMapEmpty!23695 () Bool)

(declare-datatypes ((V!24635 0))(
  ( (V!24636 (val!7410 Int)) )
))
(declare-datatypes ((ValueCell!6947 0))(
  ( (ValueCellFull!6947 (v!9841 V!24635)) (EmptyCell!6947) )
))
(declare-datatypes ((array!45646 0))(
  ( (array!45647 (arr!21874 (Array (_ BitVec 32) ValueCell!6947)) (size!22295 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45646)

(declare-fun mapDefault!23695 () ValueCell!6947)

