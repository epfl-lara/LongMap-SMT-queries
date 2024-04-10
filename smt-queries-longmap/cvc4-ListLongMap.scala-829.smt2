; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20074 () Bool)

(assert start!20074)

(declare-fun mapIsEmpty!7952 () Bool)

(declare-fun mapRes!7952 () Bool)

(assert (=> mapIsEmpty!7952 mapRes!7952))

(declare-fun b!196557 () Bool)

(declare-fun e!129475 () Bool)

(declare-fun tp_is_empty!4589 () Bool)

(assert (=> b!196557 (= e!129475 tp_is_empty!4589)))

(declare-fun b!196558 () Bool)

(declare-fun e!129476 () Bool)

(assert (=> b!196558 (= e!129476 false)))

(declare-fun lt!97638 () Bool)

(declare-datatypes ((array!8435 0))(
  ( (array!8436 (arr!3968 (Array (_ BitVec 32) (_ BitVec 64))) (size!4293 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8435)

(declare-datatypes ((List!2479 0))(
  ( (Nil!2476) (Cons!2475 (h!3117 (_ BitVec 64)) (t!7410 List!2479)) )
))
(declare-fun arrayNoDuplicates!0 (array!8435 (_ BitVec 32) List!2479) Bool)

(assert (=> b!196558 (= lt!97638 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2476))))

(declare-fun b!196559 () Bool)

(declare-fun res!92775 () Bool)

(assert (=> b!196559 (=> (not res!92775) (not e!129476))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8435 (_ BitVec 32)) Bool)

(assert (=> b!196559 (= res!92775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!92776 () Bool)

(assert (=> start!20074 (=> (not res!92776) (not e!129476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20074 (= res!92776 (validMask!0 mask!1149))))

(assert (=> start!20074 e!129476))

(assert (=> start!20074 true))

(declare-datatypes ((V!5765 0))(
  ( (V!5766 (val!2339 Int)) )
))
(declare-datatypes ((ValueCell!1951 0))(
  ( (ValueCellFull!1951 (v!4309 V!5765)) (EmptyCell!1951) )
))
(declare-datatypes ((array!8437 0))(
  ( (array!8438 (arr!3969 (Array (_ BitVec 32) ValueCell!1951)) (size!4294 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8437)

(declare-fun e!129477 () Bool)

(declare-fun array_inv!2587 (array!8437) Bool)

(assert (=> start!20074 (and (array_inv!2587 _values!649) e!129477)))

(declare-fun array_inv!2588 (array!8435) Bool)

(assert (=> start!20074 (array_inv!2588 _keys!825)))

(declare-fun mapNonEmpty!7952 () Bool)

(declare-fun tp!17240 () Bool)

(assert (=> mapNonEmpty!7952 (= mapRes!7952 (and tp!17240 e!129475))))

(declare-fun mapValue!7952 () ValueCell!1951)

(declare-fun mapRest!7952 () (Array (_ BitVec 32) ValueCell!1951))

(declare-fun mapKey!7952 () (_ BitVec 32))

(assert (=> mapNonEmpty!7952 (= (arr!3969 _values!649) (store mapRest!7952 mapKey!7952 mapValue!7952))))

(declare-fun b!196560 () Bool)

(declare-fun e!129479 () Bool)

(assert (=> b!196560 (= e!129479 tp_is_empty!4589)))

(declare-fun b!196561 () Bool)

(assert (=> b!196561 (= e!129477 (and e!129479 mapRes!7952))))

(declare-fun condMapEmpty!7952 () Bool)

(declare-fun mapDefault!7952 () ValueCell!1951)

