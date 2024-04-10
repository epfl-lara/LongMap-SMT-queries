; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82862 () Bool)

(assert start!82862)

(declare-fun b_free!18989 () Bool)

(declare-fun b_next!18989 () Bool)

(assert (=> start!82862 (= b_free!18989 (not b_next!18989))))

(declare-fun tp!66096 () Bool)

(declare-fun b_and!30477 () Bool)

(assert (=> start!82862 (= tp!66096 b_and!30477)))

(declare-fun b!966677 () Bool)

(declare-fun res!647067 () Bool)

(declare-fun e!544929 () Bool)

(assert (=> b!966677 (=> (not res!647067) (not e!544929))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34045 0))(
  ( (V!34046 (val!10949 Int)) )
))
(declare-datatypes ((ValueCell!10417 0))(
  ( (ValueCellFull!10417 (v!13507 V!34045)) (EmptyCell!10417) )
))
(declare-datatypes ((array!59671 0))(
  ( (array!59672 (arr!28704 (Array (_ BitVec 32) ValueCell!10417)) (size!29183 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59671)

(declare-datatypes ((array!59673 0))(
  ( (array!59674 (arr!28705 (Array (_ BitVec 32) (_ BitVec 64))) (size!29184 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59673)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966677 (= res!647067 (and (= (size!29183 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29184 _keys!1686) (size!29183 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966678 () Bool)

(declare-fun res!647064 () Bool)

(assert (=> b!966678 (=> (not res!647064) (not e!544929))))

(declare-datatypes ((List!19925 0))(
  ( (Nil!19922) (Cons!19921 (h!21083 (_ BitVec 64)) (t!28288 List!19925)) )
))
(declare-fun arrayNoDuplicates!0 (array!59673 (_ BitVec 32) List!19925) Bool)

(assert (=> b!966678 (= res!647064 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19922))))

(declare-fun b!966679 () Bool)

(assert (=> b!966679 (= e!544929 false)))

(declare-fun lt!431350 () Bool)

(declare-fun minValue!1342 () V!34045)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34045)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14080 0))(
  ( (tuple2!14081 (_1!7051 (_ BitVec 64)) (_2!7051 V!34045)) )
))
(declare-datatypes ((List!19926 0))(
  ( (Nil!19923) (Cons!19922 (h!21084 tuple2!14080) (t!28289 List!19926)) )
))
(declare-datatypes ((ListLongMap!12777 0))(
  ( (ListLongMap!12778 (toList!6404 List!19926)) )
))
(declare-fun contains!5505 (ListLongMap!12777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3637 (array!59673 array!59671 (_ BitVec 32) (_ BitVec 32) V!34045 V!34045 (_ BitVec 32) Int) ListLongMap!12777)

(assert (=> b!966679 (= lt!431350 (contains!5505 (getCurrentListMap!3637 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28705 _keys!1686) i!803)))))

(declare-fun b!966680 () Bool)

(declare-fun e!544931 () Bool)

(declare-fun tp_is_empty!21797 () Bool)

(assert (=> b!966680 (= e!544931 tp_is_empty!21797)))

(declare-fun b!966681 () Bool)

(declare-fun res!647065 () Bool)

(assert (=> b!966681 (=> (not res!647065) (not e!544929))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966681 (= res!647065 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29184 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29184 _keys!1686))))))

(declare-fun mapNonEmpty!34690 () Bool)

(declare-fun mapRes!34690 () Bool)

(declare-fun tp!66095 () Bool)

(declare-fun e!544927 () Bool)

(assert (=> mapNonEmpty!34690 (= mapRes!34690 (and tp!66095 e!544927))))

(declare-fun mapRest!34690 () (Array (_ BitVec 32) ValueCell!10417))

(declare-fun mapValue!34690 () ValueCell!10417)

(declare-fun mapKey!34690 () (_ BitVec 32))

(assert (=> mapNonEmpty!34690 (= (arr!28704 _values!1400) (store mapRest!34690 mapKey!34690 mapValue!34690))))

(declare-fun b!966682 () Bool)

(assert (=> b!966682 (= e!544927 tp_is_empty!21797)))

(declare-fun res!647068 () Bool)

(assert (=> start!82862 (=> (not res!647068) (not e!544929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82862 (= res!647068 (validMask!0 mask!2110))))

(assert (=> start!82862 e!544929))

(assert (=> start!82862 true))

(declare-fun e!544928 () Bool)

(declare-fun array_inv!22231 (array!59671) Bool)

(assert (=> start!82862 (and (array_inv!22231 _values!1400) e!544928)))

(declare-fun array_inv!22232 (array!59673) Bool)

(assert (=> start!82862 (array_inv!22232 _keys!1686)))

(assert (=> start!82862 tp!66096))

(assert (=> start!82862 tp_is_empty!21797))

(declare-fun b!966683 () Bool)

(assert (=> b!966683 (= e!544928 (and e!544931 mapRes!34690))))

(declare-fun condMapEmpty!34690 () Bool)

(declare-fun mapDefault!34690 () ValueCell!10417)

