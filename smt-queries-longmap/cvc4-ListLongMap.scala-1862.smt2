; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33610 () Bool)

(assert start!33610)

(declare-fun b_free!6845 () Bool)

(declare-fun b_next!6845 () Bool)

(assert (=> start!33610 (= b_free!6845 (not b_next!6845))))

(declare-fun tp!24039 () Bool)

(declare-fun b_and!14025 () Bool)

(assert (=> start!33610 (= tp!24039 b_and!14025)))

(declare-fun b!333504 () Bool)

(declare-fun e!204785 () Bool)

(declare-fun tp_is_empty!6797 () Bool)

(assert (=> b!333504 (= e!204785 tp_is_empty!6797)))

(declare-fun b!333505 () Bool)

(declare-fun res!183710 () Bool)

(declare-fun e!204784 () Bool)

(assert (=> b!333505 (=> (not res!183710) (not e!204784))))

(declare-datatypes ((array!17191 0))(
  ( (array!17192 (arr!8126 (Array (_ BitVec 32) (_ BitVec 64))) (size!8478 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17191)

(declare-datatypes ((List!4625 0))(
  ( (Nil!4622) (Cons!4621 (h!5477 (_ BitVec 64)) (t!9713 List!4625)) )
))
(declare-fun arrayNoDuplicates!0 (array!17191 (_ BitVec 32) List!4625) Bool)

(assert (=> b!333505 (= res!183710 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4622))))

(declare-fun mapNonEmpty!11592 () Bool)

(declare-fun mapRes!11592 () Bool)

(declare-fun tp!24038 () Bool)

(assert (=> mapNonEmpty!11592 (= mapRes!11592 (and tp!24038 e!204785))))

(declare-datatypes ((V!10039 0))(
  ( (V!10040 (val!3443 Int)) )
))
(declare-datatypes ((ValueCell!3055 0))(
  ( (ValueCellFull!3055 (v!5605 V!10039)) (EmptyCell!3055) )
))
(declare-fun mapValue!11592 () ValueCell!3055)

(declare-fun mapRest!11592 () (Array (_ BitVec 32) ValueCell!3055))

(declare-fun mapKey!11592 () (_ BitVec 32))

(declare-datatypes ((array!17193 0))(
  ( (array!17194 (arr!8127 (Array (_ BitVec 32) ValueCell!3055)) (size!8479 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17193)

(assert (=> mapNonEmpty!11592 (= (arr!8127 _values!1525) (store mapRest!11592 mapKey!11592 mapValue!11592))))

(declare-fun mapIsEmpty!11592 () Bool)

(assert (=> mapIsEmpty!11592 mapRes!11592))

(declare-fun b!333506 () Bool)

(declare-fun e!204783 () Bool)

(assert (=> b!333506 (= e!204783 tp_is_empty!6797)))

(declare-fun b!333507 () Bool)

(declare-fun e!204786 () Bool)

(assert (=> b!333507 (= e!204786 (and e!204783 mapRes!11592))))

(declare-fun condMapEmpty!11592 () Bool)

(declare-fun mapDefault!11592 () ValueCell!3055)

