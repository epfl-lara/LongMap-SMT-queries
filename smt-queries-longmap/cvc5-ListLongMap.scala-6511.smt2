; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82906 () Bool)

(assert start!82906)

(declare-fun b_free!19033 () Bool)

(declare-fun b_next!19033 () Bool)

(assert (=> start!82906 (= b_free!19033 (not b_next!19033))))

(declare-fun tp!66227 () Bool)

(declare-fun b_and!30521 () Bool)

(assert (=> start!82906 (= tp!66227 b_and!30521)))

(declare-fun b!967383 () Bool)

(declare-fun res!647575 () Bool)

(declare-fun e!545257 () Bool)

(assert (=> b!967383 (=> (not res!647575) (not e!545257))))

(declare-datatypes ((array!59755 0))(
  ( (array!59756 (arr!28746 (Array (_ BitVec 32) (_ BitVec 64))) (size!29225 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59755)

(declare-datatypes ((List!19958 0))(
  ( (Nil!19955) (Cons!19954 (h!21116 (_ BitVec 64)) (t!28321 List!19958)) )
))
(declare-fun arrayNoDuplicates!0 (array!59755 (_ BitVec 32) List!19958) Bool)

(assert (=> b!967383 (= res!647575 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19955))))

(declare-fun b!967384 () Bool)

(declare-fun res!647578 () Bool)

(assert (=> b!967384 (=> (not res!647578) (not e!545257))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967384 (= res!647578 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29225 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29225 _keys!1686))))))

(declare-fun b!967385 () Bool)

(declare-fun e!545260 () Bool)

(declare-fun tp_is_empty!21841 () Bool)

(assert (=> b!967385 (= e!545260 tp_is_empty!21841)))

(declare-fun b!967386 () Bool)

(declare-fun e!545261 () Bool)

(assert (=> b!967386 (= e!545261 tp_is_empty!21841)))

(declare-fun mapNonEmpty!34756 () Bool)

(declare-fun mapRes!34756 () Bool)

(declare-fun tp!66228 () Bool)

(assert (=> mapNonEmpty!34756 (= mapRes!34756 (and tp!66228 e!545261))))

(declare-datatypes ((V!34105 0))(
  ( (V!34106 (val!10971 Int)) )
))
(declare-datatypes ((ValueCell!10439 0))(
  ( (ValueCellFull!10439 (v!13529 V!34105)) (EmptyCell!10439) )
))
(declare-datatypes ((array!59757 0))(
  ( (array!59758 (arr!28747 (Array (_ BitVec 32) ValueCell!10439)) (size!29226 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59757)

(declare-fun mapRest!34756 () (Array (_ BitVec 32) ValueCell!10439))

(declare-fun mapKey!34756 () (_ BitVec 32))

(declare-fun mapValue!34756 () ValueCell!10439)

(assert (=> mapNonEmpty!34756 (= (arr!28747 _values!1400) (store mapRest!34756 mapKey!34756 mapValue!34756))))

(declare-fun b!967388 () Bool)

(declare-fun res!647571 () Bool)

(assert (=> b!967388 (=> (not res!647571) (not e!545257))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34105)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34105)

(declare-datatypes ((tuple2!14108 0))(
  ( (tuple2!14109 (_1!7065 (_ BitVec 64)) (_2!7065 V!34105)) )
))
(declare-datatypes ((List!19959 0))(
  ( (Nil!19956) (Cons!19955 (h!21117 tuple2!14108) (t!28322 List!19959)) )
))
(declare-datatypes ((ListLongMap!12805 0))(
  ( (ListLongMap!12806 (toList!6418 List!19959)) )
))
(declare-fun contains!5519 (ListLongMap!12805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3651 (array!59755 array!59757 (_ BitVec 32) (_ BitVec 32) V!34105 V!34105 (_ BitVec 32) Int) ListLongMap!12805)

(assert (=> b!967388 (= res!647571 (contains!5519 (getCurrentListMap!3651 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28746 _keys!1686) i!803)))))

(declare-fun b!967389 () Bool)

(assert (=> b!967389 (= e!545257 (not true))))

(assert (=> b!967389 (contains!5519 (getCurrentListMap!3651 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28746 _keys!1686) i!803))))

(declare-datatypes ((Unit!32319 0))(
  ( (Unit!32320) )
))
(declare-fun lt!431416 () Unit!32319)

(declare-fun lemmaInListMapFromThenInFromMinusOne!54 (array!59755 array!59757 (_ BitVec 32) (_ BitVec 32) V!34105 V!34105 (_ BitVec 32) (_ BitVec 32) Int) Unit!32319)

(assert (=> b!967389 (= lt!431416 (lemmaInListMapFromThenInFromMinusOne!54 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967390 () Bool)

(declare-fun e!545259 () Bool)

(assert (=> b!967390 (= e!545259 (and e!545260 mapRes!34756))))

(declare-fun condMapEmpty!34756 () Bool)

(declare-fun mapDefault!34756 () ValueCell!10439)

