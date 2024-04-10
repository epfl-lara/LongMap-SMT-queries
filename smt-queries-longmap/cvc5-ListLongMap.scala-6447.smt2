; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82522 () Bool)

(assert start!82522)

(declare-fun res!643592 () Bool)

(declare-fun e!542298 () Bool)

(assert (=> start!82522 (=> (not res!643592) (not e!542298))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82522 (= res!643592 (validMask!0 mask!2110))))

(assert (=> start!82522 e!542298))

(assert (=> start!82522 true))

(declare-datatypes ((V!33593 0))(
  ( (V!33594 (val!10779 Int)) )
))
(declare-datatypes ((ValueCell!10247 0))(
  ( (ValueCellFull!10247 (v!13337 V!33593)) (EmptyCell!10247) )
))
(declare-datatypes ((array!59011 0))(
  ( (array!59012 (arr!28374 (Array (_ BitVec 32) ValueCell!10247)) (size!28853 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59011)

(declare-fun e!542300 () Bool)

(declare-fun array_inv!21989 (array!59011) Bool)

(assert (=> start!82522 (and (array_inv!21989 _values!1400) e!542300)))

(declare-datatypes ((array!59013 0))(
  ( (array!59014 (arr!28375 (Array (_ BitVec 32) (_ BitVec 64))) (size!28854 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59013)

(declare-fun array_inv!21990 (array!59013) Bool)

(assert (=> start!82522 (array_inv!21990 _keys!1686)))

(declare-fun b!961676 () Bool)

(declare-fun e!542299 () Bool)

(declare-fun tp_is_empty!21457 () Bool)

(assert (=> b!961676 (= e!542299 tp_is_empty!21457)))

(declare-fun b!961677 () Bool)

(declare-fun res!643594 () Bool)

(assert (=> b!961677 (=> (not res!643594) (not e!542298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59013 (_ BitVec 32)) Bool)

(assert (=> b!961677 (= res!643594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34180 () Bool)

(declare-fun mapRes!34180 () Bool)

(assert (=> mapIsEmpty!34180 mapRes!34180))

(declare-fun b!961678 () Bool)

(declare-fun res!643593 () Bool)

(assert (=> b!961678 (=> (not res!643593) (not e!542298))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961678 (= res!643593 (and (= (size!28853 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28854 _keys!1686) (size!28853 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34180 () Bool)

(declare-fun tp!65109 () Bool)

(declare-fun e!542297 () Bool)

(assert (=> mapNonEmpty!34180 (= mapRes!34180 (and tp!65109 e!542297))))

(declare-fun mapKey!34180 () (_ BitVec 32))

(declare-fun mapValue!34180 () ValueCell!10247)

(declare-fun mapRest!34180 () (Array (_ BitVec 32) ValueCell!10247))

(assert (=> mapNonEmpty!34180 (= (arr!28374 _values!1400) (store mapRest!34180 mapKey!34180 mapValue!34180))))

(declare-fun b!961679 () Bool)

(assert (=> b!961679 (= e!542300 (and e!542299 mapRes!34180))))

(declare-fun condMapEmpty!34180 () Bool)

(declare-fun mapDefault!34180 () ValueCell!10247)

