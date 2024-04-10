; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21188 () Bool)

(assert start!21188)

(declare-fun b_free!5639 () Bool)

(declare-fun b_next!5639 () Bool)

(assert (=> start!21188 (= b_free!5639 (not b_next!5639))))

(declare-fun tp!19987 () Bool)

(declare-fun b_and!12505 () Bool)

(assert (=> start!21188 (= tp!19987 b_and!12505)))

(declare-fun b!213460 () Bool)

(declare-fun res!104497 () Bool)

(declare-fun e!138824 () Bool)

(assert (=> b!213460 (=> (not res!104497) (not e!138824))))

(declare-datatypes ((array!10205 0))(
  ( (array!10206 (arr!4843 (Array (_ BitVec 32) (_ BitVec 64))) (size!5168 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10205)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213460 (= res!104497 (= (select (arr!4843 _keys!825) i!601) k!843))))

(declare-fun mapIsEmpty!9350 () Bool)

(declare-fun mapRes!9350 () Bool)

(assert (=> mapIsEmpty!9350 mapRes!9350))

(declare-fun b!213461 () Bool)

(declare-fun e!138821 () Bool)

(declare-fun tp_is_empty!5501 () Bool)

(assert (=> b!213461 (= e!138821 tp_is_empty!5501)))

(declare-fun mapNonEmpty!9350 () Bool)

(declare-fun tp!19988 () Bool)

(declare-fun e!138825 () Bool)

(assert (=> mapNonEmpty!9350 (= mapRes!9350 (and tp!19988 e!138825))))

(declare-datatypes ((V!6981 0))(
  ( (V!6982 (val!2795 Int)) )
))
(declare-datatypes ((ValueCell!2407 0))(
  ( (ValueCellFull!2407 (v!4805 V!6981)) (EmptyCell!2407) )
))
(declare-fun mapRest!9350 () (Array (_ BitVec 32) ValueCell!2407))

(declare-fun mapKey!9350 () (_ BitVec 32))

(declare-datatypes ((array!10207 0))(
  ( (array!10208 (arr!4844 (Array (_ BitVec 32) ValueCell!2407)) (size!5169 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10207)

(declare-fun mapValue!9350 () ValueCell!2407)

(assert (=> mapNonEmpty!9350 (= (arr!4844 _values!649) (store mapRest!9350 mapKey!9350 mapValue!9350))))

(declare-fun b!213462 () Bool)

(declare-fun res!104499 () Bool)

(assert (=> b!213462 (=> (not res!104499) (not e!138824))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10205 (_ BitVec 32)) Bool)

(assert (=> b!213462 (= res!104499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213463 () Bool)

(declare-fun res!104498 () Bool)

(assert (=> b!213463 (=> (not res!104498) (not e!138824))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!213463 (= res!104498 (and (= (size!5169 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5168 _keys!825) (size!5169 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!104494 () Bool)

(assert (=> start!21188 (=> (not res!104494) (not e!138824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21188 (= res!104494 (validMask!0 mask!1149))))

(assert (=> start!21188 e!138824))

(declare-fun e!138822 () Bool)

(declare-fun array_inv!3203 (array!10207) Bool)

(assert (=> start!21188 (and (array_inv!3203 _values!649) e!138822)))

(assert (=> start!21188 true))

(assert (=> start!21188 tp_is_empty!5501))

(declare-fun array_inv!3204 (array!10205) Bool)

(assert (=> start!21188 (array_inv!3204 _keys!825)))

(assert (=> start!21188 tp!19987))

(declare-fun b!213464 () Bool)

(declare-fun res!104495 () Bool)

(assert (=> b!213464 (=> (not res!104495) (not e!138824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213464 (= res!104495 (validKeyInArray!0 k!843))))

(declare-fun b!213465 () Bool)

(assert (=> b!213465 (= e!138822 (and e!138821 mapRes!9350))))

(declare-fun condMapEmpty!9350 () Bool)

(declare-fun mapDefault!9350 () ValueCell!2407)

