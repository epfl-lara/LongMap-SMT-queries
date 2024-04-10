; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33616 () Bool)

(assert start!33616)

(declare-fun b_free!6851 () Bool)

(declare-fun b_next!6851 () Bool)

(assert (=> start!33616 (= b_free!6851 (not b_next!6851))))

(declare-fun tp!24057 () Bool)

(declare-fun b_and!14031 () Bool)

(assert (=> start!33616 (= tp!24057 b_and!14031)))

(declare-fun b!333584 () Bool)

(declare-fun res!183765 () Bool)

(declare-fun e!204827 () Bool)

(assert (=> b!333584 (=> (not res!183765) (not e!204827))))

(declare-datatypes ((array!17201 0))(
  ( (array!17202 (arr!8131 (Array (_ BitVec 32) (_ BitVec 64))) (size!8483 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17201)

(declare-datatypes ((List!4628 0))(
  ( (Nil!4625) (Cons!4624 (h!5480 (_ BitVec 64)) (t!9716 List!4628)) )
))
(declare-fun arrayNoDuplicates!0 (array!17201 (_ BitVec 32) List!4628) Bool)

(assert (=> b!333584 (= res!183765 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4625))))

(declare-fun b!333585 () Bool)

(declare-fun e!204830 () Bool)

(declare-fun tp_is_empty!6803 () Bool)

(assert (=> b!333585 (= e!204830 tp_is_empty!6803)))

(declare-fun mapIsEmpty!11601 () Bool)

(declare-fun mapRes!11601 () Bool)

(assert (=> mapIsEmpty!11601 mapRes!11601))

(declare-fun res!183767 () Bool)

(assert (=> start!33616 (=> (not res!183767) (not e!204827))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33616 (= res!183767 (validMask!0 mask!2385))))

(assert (=> start!33616 e!204827))

(assert (=> start!33616 true))

(assert (=> start!33616 tp_is_empty!6803))

(assert (=> start!33616 tp!24057))

(declare-datatypes ((V!10047 0))(
  ( (V!10048 (val!3446 Int)) )
))
(declare-datatypes ((ValueCell!3058 0))(
  ( (ValueCellFull!3058 (v!5608 V!10047)) (EmptyCell!3058) )
))
(declare-datatypes ((array!17203 0))(
  ( (array!17204 (arr!8132 (Array (_ BitVec 32) ValueCell!3058)) (size!8484 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17203)

(declare-fun e!204828 () Bool)

(declare-fun array_inv!6046 (array!17203) Bool)

(assert (=> start!33616 (and (array_inv!6046 _values!1525) e!204828)))

(declare-fun array_inv!6047 (array!17201) Bool)

(assert (=> start!33616 (array_inv!6047 _keys!1895)))

(declare-fun b!333586 () Bool)

(declare-fun res!183764 () Bool)

(assert (=> b!333586 (=> (not res!183764) (not e!204827))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333586 (= res!183764 (and (= (size!8484 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8483 _keys!1895) (size!8484 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333587 () Bool)

(assert (=> b!333587 (= e!204828 (and e!204830 mapRes!11601))))

(declare-fun condMapEmpty!11601 () Bool)

(declare-fun mapDefault!11601 () ValueCell!3058)

