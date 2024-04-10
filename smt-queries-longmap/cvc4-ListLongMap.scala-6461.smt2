; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82610 () Bool)

(assert start!82610)

(declare-fun b_free!18743 () Bool)

(declare-fun b_next!18743 () Bool)

(assert (=> start!82610 (= b_free!18743 (not b_next!18743))))

(declare-fun tp!65348 () Bool)

(declare-fun b_and!30231 () Bool)

(assert (=> start!82610 (= tp!65348 b_and!30231)))

(declare-fun b!962832 () Bool)

(declare-fun res!644356 () Bool)

(declare-fun e!542958 () Bool)

(assert (=> b!962832 (=> (not res!644356) (not e!542958))))

(declare-datatypes ((array!59185 0))(
  ( (array!59186 (arr!28461 (Array (_ BitVec 32) (_ BitVec 64))) (size!28940 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59185)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962832 (= res!644356 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28940 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28940 _keys!1686))))))

(declare-fun b!962833 () Bool)

(declare-fun res!644358 () Bool)

(assert (=> b!962833 (=> (not res!644358) (not e!542958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962833 (= res!644358 (validKeyInArray!0 (select (arr!28461 _keys!1686) i!803)))))

(declare-fun b!962834 () Bool)

(declare-fun e!542960 () Bool)

(declare-fun tp_is_empty!21545 () Bool)

(assert (=> b!962834 (= e!542960 tp_is_empty!21545)))

(declare-fun b!962835 () Bool)

(declare-fun res!644353 () Bool)

(assert (=> b!962835 (=> (not res!644353) (not e!542958))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33709 0))(
  ( (V!33710 (val!10823 Int)) )
))
(declare-datatypes ((ValueCell!10291 0))(
  ( (ValueCellFull!10291 (v!13381 V!33709)) (EmptyCell!10291) )
))
(declare-datatypes ((array!59187 0))(
  ( (array!59188 (arr!28462 (Array (_ BitVec 32) ValueCell!10291)) (size!28941 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59187)

(declare-fun minValue!1342 () V!33709)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33709)

(declare-datatypes ((tuple2!13904 0))(
  ( (tuple2!13905 (_1!6963 (_ BitVec 64)) (_2!6963 V!33709)) )
))
(declare-datatypes ((List!19753 0))(
  ( (Nil!19750) (Cons!19749 (h!20911 tuple2!13904) (t!28116 List!19753)) )
))
(declare-datatypes ((ListLongMap!12601 0))(
  ( (ListLongMap!12602 (toList!6316 List!19753)) )
))
(declare-fun contains!5419 (ListLongMap!12601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3549 (array!59185 array!59187 (_ BitVec 32) (_ BitVec 32) V!33709 V!33709 (_ BitVec 32) Int) ListLongMap!12601)

(assert (=> b!962835 (= res!644353 (contains!5419 (getCurrentListMap!3549 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28461 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34312 () Bool)

(declare-fun mapRes!34312 () Bool)

(declare-fun tp!65349 () Bool)

(assert (=> mapNonEmpty!34312 (= mapRes!34312 (and tp!65349 e!542960))))

(declare-fun mapKey!34312 () (_ BitVec 32))

(declare-fun mapRest!34312 () (Array (_ BitVec 32) ValueCell!10291))

(declare-fun mapValue!34312 () ValueCell!10291)

(assert (=> mapNonEmpty!34312 (= (arr!28462 _values!1400) (store mapRest!34312 mapKey!34312 mapValue!34312))))

(declare-fun b!962836 () Bool)

(declare-fun res!644357 () Bool)

(assert (=> b!962836 (=> (not res!644357) (not e!542958))))

(assert (=> b!962836 (= res!644357 (and (= (size!28941 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28940 _keys!1686) (size!28941 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962838 () Bool)

(declare-fun res!644359 () Bool)

(assert (=> b!962838 (=> (not res!644359) (not e!542958))))

(declare-datatypes ((List!19754 0))(
  ( (Nil!19751) (Cons!19750 (h!20912 (_ BitVec 64)) (t!28117 List!19754)) )
))
(declare-fun arrayNoDuplicates!0 (array!59185 (_ BitVec 32) List!19754) Bool)

(assert (=> b!962838 (= res!644359 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19751))))

(declare-fun b!962839 () Bool)

(declare-fun res!644354 () Bool)

(assert (=> b!962839 (=> (not res!644354) (not e!542958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59185 (_ BitVec 32)) Bool)

(assert (=> b!962839 (= res!644354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962840 () Bool)

(declare-fun e!542957 () Bool)

(assert (=> b!962840 (= e!542957 tp_is_empty!21545)))

(declare-fun mapIsEmpty!34312 () Bool)

(assert (=> mapIsEmpty!34312 mapRes!34312))

(declare-fun b!962841 () Bool)

(declare-fun res!644355 () Bool)

(assert (=> b!962841 (=> (not res!644355) (not e!542958))))

(assert (=> b!962841 (= res!644355 (bvsgt from!2084 newFrom!159))))

(declare-fun b!962842 () Bool)

(assert (=> b!962842 (= e!542958 (not true))))

(assert (=> b!962842 (contains!5419 (getCurrentListMap!3549 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28461 _keys!1686) i!803))))

(declare-datatypes ((Unit!32217 0))(
  ( (Unit!32218) )
))
(declare-fun lt!430918 () Unit!32217)

(declare-fun lemmaInListMapFromThenInFromMinusOne!3 (array!59185 array!59187 (_ BitVec 32) (_ BitVec 32) V!33709 V!33709 (_ BitVec 32) (_ BitVec 32) Int) Unit!32217)

(assert (=> b!962842 (= lt!430918 (lemmaInListMapFromThenInFromMinusOne!3 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!644352 () Bool)

(assert (=> start!82610 (=> (not res!644352) (not e!542958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82610 (= res!644352 (validMask!0 mask!2110))))

(assert (=> start!82610 e!542958))

(assert (=> start!82610 true))

(declare-fun e!542956 () Bool)

(declare-fun array_inv!22053 (array!59187) Bool)

(assert (=> start!82610 (and (array_inv!22053 _values!1400) e!542956)))

(declare-fun array_inv!22054 (array!59185) Bool)

(assert (=> start!82610 (array_inv!22054 _keys!1686)))

(assert (=> start!82610 tp!65348))

(assert (=> start!82610 tp_is_empty!21545))

(declare-fun b!962837 () Bool)

(assert (=> b!962837 (= e!542956 (and e!542957 mapRes!34312))))

(declare-fun condMapEmpty!34312 () Bool)

(declare-fun mapDefault!34312 () ValueCell!10291)

