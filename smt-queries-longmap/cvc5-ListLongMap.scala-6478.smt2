; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82708 () Bool)

(assert start!82708)

(declare-fun b_free!18841 () Bool)

(declare-fun b_next!18841 () Bool)

(assert (=> start!82708 (= b_free!18841 (not b_next!18841))))

(declare-fun tp!65643 () Bool)

(declare-fun b_and!30329 () Bool)

(assert (=> start!82708 (= tp!65643 b_and!30329)))

(declare-fun mapNonEmpty!34459 () Bool)

(declare-fun mapRes!34459 () Bool)

(declare-fun tp!65642 () Bool)

(declare-fun e!543741 () Bool)

(assert (=> mapNonEmpty!34459 (= mapRes!34459 (and tp!65642 e!543741))))

(declare-datatypes ((V!33841 0))(
  ( (V!33842 (val!10872 Int)) )
))
(declare-datatypes ((ValueCell!10340 0))(
  ( (ValueCellFull!10340 (v!13430 V!33841)) (EmptyCell!10340) )
))
(declare-fun mapRest!34459 () (Array (_ BitVec 32) ValueCell!10340))

(declare-datatypes ((array!59373 0))(
  ( (array!59374 (arr!28555 (Array (_ BitVec 32) ValueCell!10340)) (size!29034 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59373)

(declare-fun mapKey!34459 () (_ BitVec 32))

(declare-fun mapValue!34459 () ValueCell!10340)

(assert (=> mapNonEmpty!34459 (= (arr!28555 _values!1400) (store mapRest!34459 mapKey!34459 mapValue!34459))))

(declare-fun b!964496 () Bool)

(declare-fun tp_is_empty!21643 () Bool)

(assert (=> b!964496 (= e!543741 tp_is_empty!21643)))

(declare-fun b!964497 () Bool)

(declare-fun res!645582 () Bool)

(declare-fun e!543739 () Bool)

(assert (=> b!964497 (=> (not res!645582) (not e!543739))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964497 (= res!645582 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964498 () Bool)

(declare-fun res!645581 () Bool)

(assert (=> b!964498 (=> (not res!645581) (not e!543739))))

(declare-datatypes ((array!59375 0))(
  ( (array!59376 (arr!28556 (Array (_ BitVec 32) (_ BitVec 64))) (size!29035 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59375)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964498 (= res!645581 (validKeyInArray!0 (select (arr!28556 _keys!1686) i!803)))))

(declare-fun b!964499 () Bool)

(declare-fun e!543738 () Bool)

(declare-fun e!543740 () Bool)

(assert (=> b!964499 (= e!543738 (and e!543740 mapRes!34459))))

(declare-fun condMapEmpty!34459 () Bool)

(declare-fun mapDefault!34459 () ValueCell!10340)

