; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82846 () Bool)

(assert start!82846)

(declare-fun b_free!18973 () Bool)

(declare-fun b_next!18973 () Bool)

(assert (=> start!82846 (= b_free!18973 (not b_next!18973))))

(declare-fun tp!66048 () Bool)

(declare-fun b_and!30461 () Bool)

(assert (=> start!82846 (= tp!66048 b_and!30461)))

(declare-fun b!966452 () Bool)

(declare-fun e!544809 () Bool)

(declare-fun tp_is_empty!21781 () Bool)

(assert (=> b!966452 (= e!544809 tp_is_empty!21781)))

(declare-fun mapIsEmpty!34666 () Bool)

(declare-fun mapRes!34666 () Bool)

(assert (=> mapIsEmpty!34666 mapRes!34666))

(declare-fun b!966453 () Bool)

(declare-fun res!646913 () Bool)

(declare-fun e!544807 () Bool)

(assert (=> b!966453 (=> (not res!646913) (not e!544807))))

(declare-datatypes ((array!59645 0))(
  ( (array!59646 (arr!28691 (Array (_ BitVec 32) (_ BitVec 64))) (size!29170 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59645)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59645 (_ BitVec 32)) Bool)

(assert (=> b!966453 (= res!646913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966454 () Bool)

(declare-fun res!646915 () Bool)

(assert (=> b!966454 (=> (not res!646915) (not e!544807))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966454 (= res!646915 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29170 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29170 _keys!1686))))))

(declare-fun mapNonEmpty!34666 () Bool)

(declare-fun tp!66047 () Bool)

(assert (=> mapNonEmpty!34666 (= mapRes!34666 (and tp!66047 e!544809))))

(declare-fun mapKey!34666 () (_ BitVec 32))

(declare-datatypes ((V!34025 0))(
  ( (V!34026 (val!10941 Int)) )
))
(declare-datatypes ((ValueCell!10409 0))(
  ( (ValueCellFull!10409 (v!13499 V!34025)) (EmptyCell!10409) )
))
(declare-fun mapRest!34666 () (Array (_ BitVec 32) ValueCell!10409))

(declare-datatypes ((array!59647 0))(
  ( (array!59648 (arr!28692 (Array (_ BitVec 32) ValueCell!10409)) (size!29171 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59647)

(declare-fun mapValue!34666 () ValueCell!10409)

(assert (=> mapNonEmpty!34666 (= (arr!28692 _values!1400) (store mapRest!34666 mapKey!34666 mapValue!34666))))

(declare-fun b!966455 () Bool)

(declare-fun res!646910 () Bool)

(assert (=> b!966455 (=> (not res!646910) (not e!544807))))

(declare-datatypes ((List!19916 0))(
  ( (Nil!19913) (Cons!19912 (h!21074 (_ BitVec 64)) (t!28279 List!19916)) )
))
(declare-fun arrayNoDuplicates!0 (array!59645 (_ BitVec 32) List!19916) Bool)

(assert (=> b!966455 (= res!646910 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19913))))

(declare-fun res!646914 () Bool)

(assert (=> start!82846 (=> (not res!646914) (not e!544807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82846 (= res!646914 (validMask!0 mask!2110))))

(assert (=> start!82846 e!544807))

(assert (=> start!82846 true))

(declare-fun e!544808 () Bool)

(declare-fun array_inv!22223 (array!59647) Bool)

(assert (=> start!82846 (and (array_inv!22223 _values!1400) e!544808)))

(declare-fun array_inv!22224 (array!59645) Bool)

(assert (=> start!82846 (array_inv!22224 _keys!1686)))

(assert (=> start!82846 tp!66048))

(assert (=> start!82846 tp_is_empty!21781))

(declare-fun b!966456 () Bool)

(declare-fun e!544811 () Bool)

(assert (=> b!966456 (= e!544808 (and e!544811 mapRes!34666))))

(declare-fun condMapEmpty!34666 () Bool)

(declare-fun mapDefault!34666 () ValueCell!10409)

