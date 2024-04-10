; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82930 () Bool)

(assert start!82930)

(declare-fun b_free!19057 () Bool)

(declare-fun b_next!19057 () Bool)

(assert (=> start!82930 (= b_free!19057 (not b_next!19057))))

(declare-fun tp!66299 () Bool)

(declare-fun b_and!30545 () Bool)

(assert (=> start!82930 (= tp!66299 b_and!30545)))

(declare-fun mapNonEmpty!34792 () Bool)

(declare-fun mapRes!34792 () Bool)

(declare-fun tp!66300 () Bool)

(declare-fun e!545440 () Bool)

(assert (=> mapNonEmpty!34792 (= mapRes!34792 (and tp!66300 e!545440))))

(declare-datatypes ((V!34137 0))(
  ( (V!34138 (val!10983 Int)) )
))
(declare-datatypes ((ValueCell!10451 0))(
  ( (ValueCellFull!10451 (v!13541 V!34137)) (EmptyCell!10451) )
))
(declare-fun mapRest!34792 () (Array (_ BitVec 32) ValueCell!10451))

(declare-fun mapValue!34792 () ValueCell!10451)

(declare-fun mapKey!34792 () (_ BitVec 32))

(declare-datatypes ((array!59803 0))(
  ( (array!59804 (arr!28770 (Array (_ BitVec 32) ValueCell!10451)) (size!29249 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59803)

(assert (=> mapNonEmpty!34792 (= (arr!28770 _values!1400) (store mapRest!34792 mapKey!34792 mapValue!34792))))

(declare-fun b!967779 () Bool)

(declare-fun res!647864 () Bool)

(declare-fun e!545439 () Bool)

(assert (=> b!967779 (=> (not res!647864) (not e!545439))))

(declare-datatypes ((array!59805 0))(
  ( (array!59806 (arr!28771 (Array (_ BitVec 32) (_ BitVec 64))) (size!29250 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59805)

(declare-datatypes ((List!19974 0))(
  ( (Nil!19971) (Cons!19970 (h!21132 (_ BitVec 64)) (t!28337 List!19974)) )
))
(declare-fun arrayNoDuplicates!0 (array!59805 (_ BitVec 32) List!19974) Bool)

(assert (=> b!967779 (= res!647864 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19971))))

(declare-fun b!967780 () Bool)

(declare-fun res!647862 () Bool)

(assert (=> b!967780 (=> (not res!647862) (not e!545439))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967780 (= res!647862 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967781 () Bool)

(declare-fun res!647863 () Bool)

(assert (=> b!967781 (=> (not res!647863) (not e!545439))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59805 (_ BitVec 32)) Bool)

(assert (=> b!967781 (= res!647863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967782 () Bool)

(declare-fun e!545437 () Bool)

(declare-fun e!545441 () Bool)

(assert (=> b!967782 (= e!545437 (and e!545441 mapRes!34792))))

(declare-fun condMapEmpty!34792 () Bool)

(declare-fun mapDefault!34792 () ValueCell!10451)

