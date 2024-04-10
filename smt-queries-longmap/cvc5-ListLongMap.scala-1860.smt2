; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33558 () Bool)

(assert start!33558)

(declare-fun b_free!6829 () Bool)

(declare-fun b_next!6829 () Bool)

(assert (=> start!33558 (= b_free!6829 (not b_next!6829))))

(declare-fun tp!23984 () Bool)

(declare-fun b_and!14005 () Bool)

(assert (=> start!33558 (= tp!23984 b_and!14005)))

(declare-fun mapIsEmpty!11562 () Bool)

(declare-fun mapRes!11562 () Bool)

(assert (=> mapIsEmpty!11562 mapRes!11562))

(declare-fun b!333033 () Bool)

(declare-fun e!204503 () Bool)

(declare-fun tp_is_empty!6781 () Bool)

(assert (=> b!333033 (= e!204503 tp_is_empty!6781)))

(declare-fun b!333034 () Bool)

(declare-fun e!204502 () Bool)

(assert (=> b!333034 (= e!204502 tp_is_empty!6781)))

(declare-fun b!333035 () Bool)

(declare-fun res!183475 () Bool)

(declare-fun e!204501 () Bool)

(assert (=> b!333035 (=> (not res!183475) (not e!204501))))

(declare-datatypes ((array!17157 0))(
  ( (array!17158 (arr!8111 (Array (_ BitVec 32) (_ BitVec 64))) (size!8463 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17157)

(declare-datatypes ((List!4616 0))(
  ( (Nil!4613) (Cons!4612 (h!5468 (_ BitVec 64)) (t!9700 List!4616)) )
))
(declare-fun arrayNoDuplicates!0 (array!17157 (_ BitVec 32) List!4616) Bool)

(assert (=> b!333035 (= res!183475 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4613))))

(declare-fun b!333036 () Bool)

(declare-fun e!204504 () Bool)

(assert (=> b!333036 (= e!204504 (and e!204503 mapRes!11562))))

(declare-fun condMapEmpty!11562 () Bool)

(declare-datatypes ((V!10019 0))(
  ( (V!10020 (val!3435 Int)) )
))
(declare-datatypes ((ValueCell!3047 0))(
  ( (ValueCellFull!3047 (v!5595 V!10019)) (EmptyCell!3047) )
))
(declare-datatypes ((array!17159 0))(
  ( (array!17160 (arr!8112 (Array (_ BitVec 32) ValueCell!3047)) (size!8464 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17159)

(declare-fun mapDefault!11562 () ValueCell!3047)

