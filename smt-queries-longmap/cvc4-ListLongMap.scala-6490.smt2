; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82784 () Bool)

(assert start!82784)

(declare-fun b_free!18917 () Bool)

(declare-fun b_next!18917 () Bool)

(assert (=> start!82784 (= b_free!18917 (not b_next!18917))))

(declare-fun tp!65871 () Bool)

(declare-fun b_and!30405 () Bool)

(assert (=> start!82784 (= tp!65871 b_and!30405)))

(declare-fun b!965632 () Bool)

(declare-fun res!646369 () Bool)

(declare-fun e!544343 () Bool)

(assert (=> b!965632 (=> (not res!646369) (not e!544343))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59523 0))(
  ( (array!59524 (arr!28630 (Array (_ BitVec 32) (_ BitVec 64))) (size!29109 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59523)

(declare-datatypes ((V!33941 0))(
  ( (V!33942 (val!10910 Int)) )
))
(declare-fun minValue!1342 () V!33941)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10378 0))(
  ( (ValueCellFull!10378 (v!13468 V!33941)) (EmptyCell!10378) )
))
(declare-datatypes ((array!59525 0))(
  ( (array!59526 (arr!28631 (Array (_ BitVec 32) ValueCell!10378)) (size!29110 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59525)

(declare-fun zeroValue!1342 () V!33941)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14034 0))(
  ( (tuple2!14035 (_1!7028 (_ BitVec 64)) (_2!7028 V!33941)) )
))
(declare-datatypes ((List!19876 0))(
  ( (Nil!19873) (Cons!19872 (h!21034 tuple2!14034) (t!28239 List!19876)) )
))
(declare-datatypes ((ListLongMap!12731 0))(
  ( (ListLongMap!12732 (toList!6381 List!19876)) )
))
(declare-fun contains!5484 (ListLongMap!12731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3614 (array!59523 array!59525 (_ BitVec 32) (_ BitVec 32) V!33941 V!33941 (_ BitVec 32) Int) ListLongMap!12731)

(assert (=> b!965632 (= res!646369 (contains!5484 (getCurrentListMap!3614 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28630 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34573 () Bool)

(declare-fun mapRes!34573 () Bool)

(declare-fun tp!65870 () Bool)

(declare-fun e!544346 () Bool)

(assert (=> mapNonEmpty!34573 (= mapRes!34573 (and tp!65870 e!544346))))

(declare-fun mapValue!34573 () ValueCell!10378)

(declare-fun mapRest!34573 () (Array (_ BitVec 32) ValueCell!10378))

(declare-fun mapKey!34573 () (_ BitVec 32))

(assert (=> mapNonEmpty!34573 (= (arr!28631 _values!1400) (store mapRest!34573 mapKey!34573 mapValue!34573))))

(declare-fun b!965633 () Bool)

(declare-fun tp_is_empty!21719 () Bool)

(assert (=> b!965633 (= e!544346 tp_is_empty!21719)))

(declare-fun b!965634 () Bool)

(declare-fun e!544344 () Bool)

(assert (=> b!965634 (= e!544344 tp_is_empty!21719)))

(declare-fun b!965635 () Bool)

(declare-fun res!646374 () Bool)

(assert (=> b!965635 (=> (not res!646374) (not e!544343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965635 (= res!646374 (validKeyInArray!0 (select (arr!28630 _keys!1686) i!803)))))

(declare-fun b!965636 () Bool)

(declare-fun e!544342 () Bool)

(assert (=> b!965636 (= e!544342 (and e!544344 mapRes!34573))))

(declare-fun condMapEmpty!34573 () Bool)

(declare-fun mapDefault!34573 () ValueCell!10378)

