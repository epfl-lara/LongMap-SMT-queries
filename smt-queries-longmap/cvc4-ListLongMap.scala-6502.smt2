; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82856 () Bool)

(assert start!82856)

(declare-fun b_free!18983 () Bool)

(declare-fun b_next!18983 () Bool)

(assert (=> start!82856 (= b_free!18983 (not b_next!18983))))

(declare-fun tp!66078 () Bool)

(declare-fun b_and!30471 () Bool)

(assert (=> start!82856 (= tp!66078 b_and!30471)))

(declare-fun mapNonEmpty!34681 () Bool)

(declare-fun mapRes!34681 () Bool)

(declare-fun tp!66077 () Bool)

(declare-fun e!544883 () Bool)

(assert (=> mapNonEmpty!34681 (= mapRes!34681 (and tp!66077 e!544883))))

(declare-datatypes ((V!34037 0))(
  ( (V!34038 (val!10946 Int)) )
))
(declare-datatypes ((ValueCell!10414 0))(
  ( (ValueCellFull!10414 (v!13504 V!34037)) (EmptyCell!10414) )
))
(declare-fun mapRest!34681 () (Array (_ BitVec 32) ValueCell!10414))

(declare-fun mapKey!34681 () (_ BitVec 32))

(declare-fun mapValue!34681 () ValueCell!10414)

(declare-datatypes ((array!59661 0))(
  ( (array!59662 (arr!28699 (Array (_ BitVec 32) ValueCell!10414)) (size!29178 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59661)

(assert (=> mapNonEmpty!34681 (= (arr!28699 _values!1400) (store mapRest!34681 mapKey!34681 mapValue!34681))))

(declare-fun b!966595 () Bool)

(declare-fun e!544886 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966595 (= e!544886 (and (bvsgt from!2084 newFrom!159) (bvsle from!2084 #b00000000000000000000000000000000)))))

(declare-fun b!966596 () Bool)

(declare-fun res!647009 () Bool)

(assert (=> b!966596 (=> (not res!647009) (not e!544886))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59663 0))(
  ( (array!59664 (arr!28700 (Array (_ BitVec 32) (_ BitVec 64))) (size!29179 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59663)

(declare-fun minValue!1342 () V!34037)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34037)

(declare-datatypes ((tuple2!14076 0))(
  ( (tuple2!14077 (_1!7049 (_ BitVec 64)) (_2!7049 V!34037)) )
))
(declare-datatypes ((List!19921 0))(
  ( (Nil!19918) (Cons!19917 (h!21079 tuple2!14076) (t!28284 List!19921)) )
))
(declare-datatypes ((ListLongMap!12773 0))(
  ( (ListLongMap!12774 (toList!6402 List!19921)) )
))
(declare-fun contains!5503 (ListLongMap!12773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3635 (array!59663 array!59661 (_ BitVec 32) (_ BitVec 32) V!34037 V!34037 (_ BitVec 32) Int) ListLongMap!12773)

(assert (=> b!966596 (= res!647009 (contains!5503 (getCurrentListMap!3635 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28700 _keys!1686) i!803)))))

(declare-fun b!966597 () Bool)

(declare-fun res!647013 () Bool)

(assert (=> b!966597 (=> (not res!647013) (not e!544886))))

(assert (=> b!966597 (= res!647013 (and (= (size!29178 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29179 _keys!1686) (size!29178 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966598 () Bool)

(declare-fun res!647011 () Bool)

(assert (=> b!966598 (=> (not res!647011) (not e!544886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966598 (= res!647011 (validKeyInArray!0 (select (arr!28700 _keys!1686) i!803)))))

(declare-fun b!966599 () Bool)

(declare-fun e!544882 () Bool)

(declare-fun tp_is_empty!21791 () Bool)

(assert (=> b!966599 (= e!544882 tp_is_empty!21791)))

(declare-fun b!966601 () Bool)

(declare-fun res!647008 () Bool)

(assert (=> b!966601 (=> (not res!647008) (not e!544886))))

(declare-datatypes ((List!19922 0))(
  ( (Nil!19919) (Cons!19918 (h!21080 (_ BitVec 64)) (t!28285 List!19922)) )
))
(declare-fun arrayNoDuplicates!0 (array!59663 (_ BitVec 32) List!19922) Bool)

(assert (=> b!966601 (= res!647008 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19919))))

(declare-fun b!966602 () Bool)

(declare-fun e!544885 () Bool)

(assert (=> b!966602 (= e!544885 (and e!544882 mapRes!34681))))

(declare-fun condMapEmpty!34681 () Bool)

(declare-fun mapDefault!34681 () ValueCell!10414)

