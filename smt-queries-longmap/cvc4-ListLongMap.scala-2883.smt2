; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41432 () Bool)

(assert start!41432)

(declare-fun b_free!11111 () Bool)

(declare-fun b_next!11111 () Bool)

(assert (=> start!41432 (= b_free!11111 (not b_next!11111))))

(declare-fun tp!39328 () Bool)

(declare-fun b_and!19447 () Bool)

(assert (=> start!41432 (= tp!39328 b_and!19447)))

(declare-fun b!462939 () Bool)

(declare-fun e!270233 () Bool)

(assert (=> b!462939 (= e!270233 false)))

(declare-datatypes ((V!17823 0))(
  ( (V!17824 (val!6314 Int)) )
))
(declare-fun minValueBefore!38 () V!17823)

(declare-fun zeroValue!794 () V!17823)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8276 0))(
  ( (tuple2!8277 (_1!4149 (_ BitVec 64)) (_2!4149 V!17823)) )
))
(declare-datatypes ((List!8367 0))(
  ( (Nil!8364) (Cons!8363 (h!9219 tuple2!8276) (t!14311 List!8367)) )
))
(declare-datatypes ((ListLongMap!7189 0))(
  ( (ListLongMap!7190 (toList!3610 List!8367)) )
))
(declare-fun lt!209282 () ListLongMap!7189)

(declare-datatypes ((array!28879 0))(
  ( (array!28880 (arr!13872 (Array (_ BitVec 32) (_ BitVec 64))) (size!14224 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28879)

(declare-datatypes ((ValueCell!5926 0))(
  ( (ValueCellFull!5926 (v!8601 V!17823)) (EmptyCell!5926) )
))
(declare-datatypes ((array!28881 0))(
  ( (array!28882 (arr!13873 (Array (_ BitVec 32) ValueCell!5926)) (size!14225 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28881)

(declare-fun getCurrentListMapNoExtraKeys!1790 (array!28879 array!28881 (_ BitVec 32) (_ BitVec 32) V!17823 V!17823 (_ BitVec 32) Int) ListLongMap!7189)

(assert (=> b!462939 (= lt!209282 (getCurrentListMapNoExtraKeys!1790 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462940 () Bool)

(declare-fun e!270231 () Bool)

(declare-fun e!270234 () Bool)

(declare-fun mapRes!20482 () Bool)

(assert (=> b!462940 (= e!270231 (and e!270234 mapRes!20482))))

(declare-fun condMapEmpty!20482 () Bool)

(declare-fun mapDefault!20482 () ValueCell!5926)

