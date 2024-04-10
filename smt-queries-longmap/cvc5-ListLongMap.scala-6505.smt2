; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82870 () Bool)

(assert start!82870)

(declare-fun b_free!18997 () Bool)

(declare-fun b_next!18997 () Bool)

(assert (=> start!82870 (= b_free!18997 (not b_next!18997))))

(declare-fun tp!66120 () Bool)

(declare-fun b_and!30485 () Bool)

(assert (=> start!82870 (= tp!66120 b_and!30485)))

(declare-fun b!966789 () Bool)

(declare-fun res!647140 () Bool)

(declare-fun e!544991 () Bool)

(assert (=> b!966789 (=> (not res!647140) (not e!544991))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966789 (= res!647140 (bvsgt from!2084 newFrom!159))))

(declare-fun b!966790 () Bool)

(declare-fun res!647139 () Bool)

(assert (=> b!966790 (=> (not res!647139) (not e!544991))))

(declare-datatypes ((array!59687 0))(
  ( (array!59688 (arr!28712 (Array (_ BitVec 32) (_ BitVec 64))) (size!29191 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59687)

(declare-datatypes ((List!19932 0))(
  ( (Nil!19929) (Cons!19928 (h!21090 (_ BitVec 64)) (t!28295 List!19932)) )
))
(declare-fun arrayNoDuplicates!0 (array!59687 (_ BitVec 32) List!19932) Bool)

(assert (=> b!966790 (= res!647139 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19929))))

(declare-fun b!966791 () Bool)

(declare-fun res!647145 () Bool)

(assert (=> b!966791 (=> (not res!647145) (not e!544991))))

(declare-datatypes ((V!34057 0))(
  ( (V!34058 (val!10953 Int)) )
))
(declare-datatypes ((ValueCell!10421 0))(
  ( (ValueCellFull!10421 (v!13511 V!34057)) (EmptyCell!10421) )
))
(declare-datatypes ((array!59689 0))(
  ( (array!59690 (arr!28713 (Array (_ BitVec 32) ValueCell!10421)) (size!29192 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59689)

(declare-fun minValue!1342 () V!34057)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34057)

(declare-datatypes ((tuple2!14086 0))(
  ( (tuple2!14087 (_1!7054 (_ BitVec 64)) (_2!7054 V!34057)) )
))
(declare-datatypes ((List!19933 0))(
  ( (Nil!19930) (Cons!19929 (h!21091 tuple2!14086) (t!28296 List!19933)) )
))
(declare-datatypes ((ListLongMap!12783 0))(
  ( (ListLongMap!12784 (toList!6407 List!19933)) )
))
(declare-fun contains!5508 (ListLongMap!12783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3640 (array!59687 array!59689 (_ BitVec 32) (_ BitVec 32) V!34057 V!34057 (_ BitVec 32) Int) ListLongMap!12783)

(assert (=> b!966791 (= res!647145 (contains!5508 (getCurrentListMap!3640 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28712 _keys!1686) i!803)))))

(declare-fun res!647146 () Bool)

(assert (=> start!82870 (=> (not res!647146) (not e!544991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82870 (= res!647146 (validMask!0 mask!2110))))

(assert (=> start!82870 e!544991))

(assert (=> start!82870 true))

(declare-fun e!544989 () Bool)

(declare-fun array_inv!22239 (array!59689) Bool)

(assert (=> start!82870 (and (array_inv!22239 _values!1400) e!544989)))

(declare-fun array_inv!22240 (array!59687) Bool)

(assert (=> start!82870 (array_inv!22240 _keys!1686)))

(assert (=> start!82870 tp!66120))

(declare-fun tp_is_empty!21805 () Bool)

(assert (=> start!82870 tp_is_empty!21805))

(declare-fun b!966792 () Bool)

(assert (=> b!966792 (= e!544991 (not true))))

(assert (=> b!966792 (contains!5508 (getCurrentListMap!3640 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28712 _keys!1686) i!803))))

(declare-datatypes ((Unit!32301 0))(
  ( (Unit!32302) )
))
(declare-fun lt!431362 () Unit!32301)

(declare-fun lemmaInListMapFromThenInFromMinusOne!45 (array!59687 array!59689 (_ BitVec 32) (_ BitVec 32) V!34057 V!34057 (_ BitVec 32) (_ BitVec 32) Int) Unit!32301)

(assert (=> b!966792 (= lt!431362 (lemmaInListMapFromThenInFromMinusOne!45 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!966793 () Bool)

(declare-fun res!647141 () Bool)

(assert (=> b!966793 (=> (not res!647141) (not e!544991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59687 (_ BitVec 32)) Bool)

(assert (=> b!966793 (= res!647141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966794 () Bool)

(declare-fun res!647144 () Bool)

(assert (=> b!966794 (=> (not res!647144) (not e!544991))))

(assert (=> b!966794 (= res!647144 (and (= (size!29192 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29191 _keys!1686) (size!29192 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966795 () Bool)

(declare-fun e!544988 () Bool)

(assert (=> b!966795 (= e!544988 tp_is_empty!21805)))

(declare-fun mapNonEmpty!34702 () Bool)

(declare-fun mapRes!34702 () Bool)

(declare-fun tp!66119 () Bool)

(declare-fun e!544987 () Bool)

(assert (=> mapNonEmpty!34702 (= mapRes!34702 (and tp!66119 e!544987))))

(declare-fun mapRest!34702 () (Array (_ BitVec 32) ValueCell!10421))

(declare-fun mapKey!34702 () (_ BitVec 32))

(declare-fun mapValue!34702 () ValueCell!10421)

(assert (=> mapNonEmpty!34702 (= (arr!28713 _values!1400) (store mapRest!34702 mapKey!34702 mapValue!34702))))

(declare-fun b!966796 () Bool)

(assert (=> b!966796 (= e!544989 (and e!544988 mapRes!34702))))

(declare-fun condMapEmpty!34702 () Bool)

(declare-fun mapDefault!34702 () ValueCell!10421)

