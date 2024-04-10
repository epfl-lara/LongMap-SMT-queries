; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82922 () Bool)

(assert start!82922)

(declare-fun b_free!19049 () Bool)

(declare-fun b_next!19049 () Bool)

(assert (=> start!82922 (= b_free!19049 (not b_next!19049))))

(declare-fun tp!66275 () Bool)

(declare-fun b_and!30537 () Bool)

(assert (=> start!82922 (= tp!66275 b_and!30537)))

(declare-fun b!967647 () Bool)

(declare-fun e!545377 () Bool)

(declare-fun tp_is_empty!21857 () Bool)

(assert (=> b!967647 (= e!545377 tp_is_empty!21857)))

(declare-fun b!967648 () Bool)

(declare-fun e!545379 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((array!59787 0))(
  ( (array!59788 (arr!28762 (Array (_ BitVec 32) (_ BitVec 64))) (size!29241 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59787)

(assert (=> b!967648 (= e!545379 (not (and (bvsge (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2084 #b00000000000000000000000000000001) (size!29241 _keys!1686)))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34125 0))(
  ( (V!34126 (val!10979 Int)) )
))
(declare-datatypes ((ValueCell!10447 0))(
  ( (ValueCellFull!10447 (v!13537 V!34125)) (EmptyCell!10447) )
))
(declare-datatypes ((array!59789 0))(
  ( (array!59790 (arr!28763 (Array (_ BitVec 32) ValueCell!10447)) (size!29242 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59789)

(declare-fun minValue!1342 () V!34125)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34125)

(declare-datatypes ((tuple2!14122 0))(
  ( (tuple2!14123 (_1!7072 (_ BitVec 64)) (_2!7072 V!34125)) )
))
(declare-datatypes ((List!19970 0))(
  ( (Nil!19967) (Cons!19966 (h!21128 tuple2!14122) (t!28333 List!19970)) )
))
(declare-datatypes ((ListLongMap!12819 0))(
  ( (ListLongMap!12820 (toList!6425 List!19970)) )
))
(declare-fun contains!5526 (ListLongMap!12819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3658 (array!59787 array!59789 (_ BitVec 32) (_ BitVec 32) V!34125 V!34125 (_ BitVec 32) Int) ListLongMap!12819)

(assert (=> b!967648 (contains!5526 (getCurrentListMap!3658 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28762 _keys!1686) i!803))))

(declare-datatypes ((Unit!32333 0))(
  ( (Unit!32334) )
))
(declare-fun lt!431440 () Unit!32333)

(declare-fun lemmaInListMapFromThenInFromMinusOne!61 (array!59787 array!59789 (_ BitVec 32) (_ BitVec 32) V!34125 V!34125 (_ BitVec 32) (_ BitVec 32) Int) Unit!32333)

(assert (=> b!967648 (= lt!431440 (lemmaInListMapFromThenInFromMinusOne!61 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967649 () Bool)

(declare-fun res!647769 () Bool)

(assert (=> b!967649 (=> (not res!647769) (not e!545379))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967649 (= res!647769 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29241 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29241 _keys!1686))))))

(declare-fun b!967650 () Bool)

(declare-fun res!647766 () Bool)

(assert (=> b!967650 (=> (not res!647766) (not e!545379))))

(assert (=> b!967650 (= res!647766 (and (= (size!29242 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29241 _keys!1686) (size!29242 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967652 () Bool)

(declare-fun e!545381 () Bool)

(declare-fun mapRes!34780 () Bool)

(assert (=> b!967652 (= e!545381 (and e!545377 mapRes!34780))))

(declare-fun condMapEmpty!34780 () Bool)

(declare-fun mapDefault!34780 () ValueCell!10447)

