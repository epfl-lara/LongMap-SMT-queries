; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82798 () Bool)

(assert start!82798)

(declare-fun b_free!18925 () Bool)

(declare-fun b_next!18925 () Bool)

(assert (=> start!82798 (= b_free!18925 (not b_next!18925))))

(declare-fun tp!65903 () Bool)

(declare-fun b_and!30413 () Bool)

(assert (=> start!82798 (= tp!65903 b_and!30413)))

(declare-fun b!965804 () Bool)

(declare-fun res!646478 () Bool)

(declare-fun e!544448 () Bool)

(assert (=> b!965804 (=> (not res!646478) (not e!544448))))

(declare-datatypes ((array!59551 0))(
  ( (array!59552 (arr!28644 (Array (_ BitVec 32) (_ BitVec 64))) (size!29123 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59551)

(declare-datatypes ((List!19882 0))(
  ( (Nil!19879) (Cons!19878 (h!21040 (_ BitVec 64)) (t!28245 List!19882)) )
))
(declare-fun arrayNoDuplicates!0 (array!59551 (_ BitVec 32) List!19882) Bool)

(assert (=> b!965804 (= res!646478 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19879))))

(declare-fun b!965806 () Bool)

(assert (=> b!965806 (= e!544448 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33961 0))(
  ( (V!33962 (val!10917 Int)) )
))
(declare-datatypes ((ValueCell!10385 0))(
  ( (ValueCellFull!10385 (v!13475 V!33961)) (EmptyCell!10385) )
))
(declare-datatypes ((array!59553 0))(
  ( (array!59554 (arr!28645 (Array (_ BitVec 32) ValueCell!10385)) (size!29124 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59553)

(declare-fun minValue!1342 () V!33961)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33961)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lt!431263 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14040 0))(
  ( (tuple2!14041 (_1!7031 (_ BitVec 64)) (_2!7031 V!33961)) )
))
(declare-datatypes ((List!19883 0))(
  ( (Nil!19880) (Cons!19879 (h!21041 tuple2!14040) (t!28246 List!19883)) )
))
(declare-datatypes ((ListLongMap!12737 0))(
  ( (ListLongMap!12738 (toList!6384 List!19883)) )
))
(declare-fun contains!5485 (ListLongMap!12737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3617 (array!59551 array!59553 (_ BitVec 32) (_ BitVec 32) V!33961 V!33961 (_ BitVec 32) Int) ListLongMap!12737)

(assert (=> b!965806 (= lt!431263 (contains!5485 (getCurrentListMap!3617 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28644 _keys!1686) i!803)))))

(declare-fun b!965807 () Bool)

(declare-fun res!646483 () Bool)

(assert (=> b!965807 (=> (not res!646483) (not e!544448))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965807 (= res!646483 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29123 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29123 _keys!1686))))))

(declare-fun b!965808 () Bool)

(declare-fun e!544451 () Bool)

(declare-fun tp_is_empty!21733 () Bool)

(assert (=> b!965808 (= e!544451 tp_is_empty!21733)))

(declare-fun b!965809 () Bool)

(declare-fun e!544450 () Bool)

(assert (=> b!965809 (= e!544450 tp_is_empty!21733)))

(declare-fun b!965810 () Bool)

(declare-fun res!646482 () Bool)

(assert (=> b!965810 (=> (not res!646482) (not e!544448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965810 (= res!646482 (validKeyInArray!0 (select (arr!28644 _keys!1686) i!803)))))

(declare-fun res!646479 () Bool)

(assert (=> start!82798 (=> (not res!646479) (not e!544448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82798 (= res!646479 (validMask!0 mask!2110))))

(assert (=> start!82798 e!544448))

(assert (=> start!82798 true))

(declare-fun e!544447 () Bool)

(declare-fun array_inv!22183 (array!59553) Bool)

(assert (=> start!82798 (and (array_inv!22183 _values!1400) e!544447)))

(declare-fun array_inv!22184 (array!59551) Bool)

(assert (=> start!82798 (array_inv!22184 _keys!1686)))

(assert (=> start!82798 tp!65903))

(assert (=> start!82798 tp_is_empty!21733))

(declare-fun b!965805 () Bool)

(declare-fun res!646481 () Bool)

(assert (=> b!965805 (=> (not res!646481) (not e!544448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59551 (_ BitVec 32)) Bool)

(assert (=> b!965805 (= res!646481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34594 () Bool)

(declare-fun mapRes!34594 () Bool)

(declare-fun tp!65904 () Bool)

(assert (=> mapNonEmpty!34594 (= mapRes!34594 (and tp!65904 e!544450))))

(declare-fun mapValue!34594 () ValueCell!10385)

(declare-fun mapRest!34594 () (Array (_ BitVec 32) ValueCell!10385))

(declare-fun mapKey!34594 () (_ BitVec 32))

(assert (=> mapNonEmpty!34594 (= (arr!28645 _values!1400) (store mapRest!34594 mapKey!34594 mapValue!34594))))

(declare-fun b!965811 () Bool)

(assert (=> b!965811 (= e!544447 (and e!544451 mapRes!34594))))

(declare-fun condMapEmpty!34594 () Bool)

(declare-fun mapDefault!34594 () ValueCell!10385)

