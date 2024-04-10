; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82486 () Bool)

(assert start!82486)

(declare-fun b!961352 () Bool)

(declare-fun res!643431 () Bool)

(declare-fun e!542027 () Bool)

(assert (=> b!961352 (=> (not res!643431) (not e!542027))))

(declare-datatypes ((array!58939 0))(
  ( (array!58940 (arr!28338 (Array (_ BitVec 32) (_ BitVec 64))) (size!28817 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58939)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58939 (_ BitVec 32)) Bool)

(assert (=> b!961352 (= res!643431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961353 () Bool)

(declare-fun e!542030 () Bool)

(declare-fun tp_is_empty!21421 () Bool)

(assert (=> b!961353 (= e!542030 tp_is_empty!21421)))

(declare-fun mapIsEmpty!34126 () Bool)

(declare-fun mapRes!34126 () Bool)

(assert (=> mapIsEmpty!34126 mapRes!34126))

(declare-fun b!961354 () Bool)

(assert (=> b!961354 (= e!542027 false)))

(declare-fun lt!430741 () Bool)

(declare-datatypes ((List!19687 0))(
  ( (Nil!19684) (Cons!19683 (h!20845 (_ BitVec 64)) (t!28050 List!19687)) )
))
(declare-fun arrayNoDuplicates!0 (array!58939 (_ BitVec 32) List!19687) Bool)

(assert (=> b!961354 (= lt!430741 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19684))))

(declare-fun mapNonEmpty!34126 () Bool)

(declare-fun tp!65055 () Bool)

(declare-fun e!542026 () Bool)

(assert (=> mapNonEmpty!34126 (= mapRes!34126 (and tp!65055 e!542026))))

(declare-datatypes ((V!33545 0))(
  ( (V!33546 (val!10761 Int)) )
))
(declare-datatypes ((ValueCell!10229 0))(
  ( (ValueCellFull!10229 (v!13319 V!33545)) (EmptyCell!10229) )
))
(declare-fun mapValue!34126 () ValueCell!10229)

(declare-datatypes ((array!58941 0))(
  ( (array!58942 (arr!28339 (Array (_ BitVec 32) ValueCell!10229)) (size!28818 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58941)

(declare-fun mapKey!34126 () (_ BitVec 32))

(declare-fun mapRest!34126 () (Array (_ BitVec 32) ValueCell!10229))

(assert (=> mapNonEmpty!34126 (= (arr!28339 _values!1400) (store mapRest!34126 mapKey!34126 mapValue!34126))))

(declare-fun b!961355 () Bool)

(declare-fun e!542029 () Bool)

(assert (=> b!961355 (= e!542029 (and e!542030 mapRes!34126))))

(declare-fun condMapEmpty!34126 () Bool)

(declare-fun mapDefault!34126 () ValueCell!10229)

