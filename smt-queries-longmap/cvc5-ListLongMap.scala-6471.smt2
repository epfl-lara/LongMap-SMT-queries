; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82666 () Bool)

(assert start!82666)

(declare-fun b_free!18799 () Bool)

(declare-fun b_next!18799 () Bool)

(assert (=> start!82666 (= b_free!18799 (not b_next!18799))))

(declare-fun tp!65516 () Bool)

(declare-fun b_and!30287 () Bool)

(assert (=> start!82666 (= tp!65516 b_and!30287)))

(declare-fun mapNonEmpty!34396 () Bool)

(declare-fun mapRes!34396 () Bool)

(declare-fun tp!65517 () Bool)

(declare-fun e!543380 () Bool)

(assert (=> mapNonEmpty!34396 (= mapRes!34396 (and tp!65517 e!543380))))

(declare-fun mapKey!34396 () (_ BitVec 32))

(declare-datatypes ((V!33785 0))(
  ( (V!33786 (val!10851 Int)) )
))
(declare-datatypes ((ValueCell!10319 0))(
  ( (ValueCellFull!10319 (v!13409 V!33785)) (EmptyCell!10319) )
))
(declare-datatypes ((array!59293 0))(
  ( (array!59294 (arr!28515 (Array (_ BitVec 32) ValueCell!10319)) (size!28994 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59293)

(declare-fun mapValue!34396 () ValueCell!10319)

(declare-fun mapRest!34396 () (Array (_ BitVec 32) ValueCell!10319))

(assert (=> mapNonEmpty!34396 (= (arr!28515 _values!1400) (store mapRest!34396 mapKey!34396 mapValue!34396))))

(declare-fun mapIsEmpty!34396 () Bool)

(assert (=> mapIsEmpty!34396 mapRes!34396))

(declare-fun b!963757 () Bool)

(declare-fun e!543379 () Bool)

(assert (=> b!963757 (= e!543379 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59295 0))(
  ( (array!59296 (arr!28516 (Array (_ BitVec 32) (_ BitVec 64))) (size!28995 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59295)

(declare-fun minValue!1342 () V!33785)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33785)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13940 0))(
  ( (tuple2!13941 (_1!6981 (_ BitVec 64)) (_2!6981 V!33785)) )
))
(declare-datatypes ((List!19790 0))(
  ( (Nil!19787) (Cons!19786 (h!20948 tuple2!13940) (t!28153 List!19790)) )
))
(declare-datatypes ((ListLongMap!12637 0))(
  ( (ListLongMap!12638 (toList!6334 List!19790)) )
))
(declare-fun contains!5437 (ListLongMap!12637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3567 (array!59295 array!59293 (_ BitVec 32) (_ BitVec 32) V!33785 V!33785 (_ BitVec 32) Int) ListLongMap!12637)

(assert (=> b!963757 (contains!5437 (getCurrentListMap!3567 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28516 _keys!1686) i!803))))

(declare-datatypes ((Unit!32251 0))(
  ( (Unit!32252) )
))
(declare-fun lt!431002 () Unit!32251)

(declare-fun lemmaInListMapFromThenInFromMinusOne!20 (array!59295 array!59293 (_ BitVec 32) (_ BitVec 32) V!33785 V!33785 (_ BitVec 32) (_ BitVec 32) Int) Unit!32251)

(assert (=> b!963757 (= lt!431002 (lemmaInListMapFromThenInFromMinusOne!20 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963758 () Bool)

(declare-fun e!543378 () Bool)

(declare-fun e!543377 () Bool)

(assert (=> b!963758 (= e!543378 (and e!543377 mapRes!34396))))

(declare-fun condMapEmpty!34396 () Bool)

(declare-fun mapDefault!34396 () ValueCell!10319)

