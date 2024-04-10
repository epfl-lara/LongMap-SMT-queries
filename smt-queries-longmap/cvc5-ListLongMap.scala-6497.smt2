; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82822 () Bool)

(assert start!82822)

(declare-fun b_free!18949 () Bool)

(declare-fun b_next!18949 () Bool)

(assert (=> start!82822 (= b_free!18949 (not b_next!18949))))

(declare-fun tp!65975 () Bool)

(declare-fun b_and!30437 () Bool)

(assert (=> start!82822 (= tp!65975 b_and!30437)))

(declare-fun res!646695 () Bool)

(declare-fun e!544630 () Bool)

(assert (=> start!82822 (=> (not res!646695) (not e!544630))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82822 (= res!646695 (validMask!0 mask!2110))))

(assert (=> start!82822 e!544630))

(assert (=> start!82822 true))

(declare-datatypes ((V!33993 0))(
  ( (V!33994 (val!10929 Int)) )
))
(declare-datatypes ((ValueCell!10397 0))(
  ( (ValueCellFull!10397 (v!13487 V!33993)) (EmptyCell!10397) )
))
(declare-datatypes ((array!59599 0))(
  ( (array!59600 (arr!28668 (Array (_ BitVec 32) ValueCell!10397)) (size!29147 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59599)

(declare-fun e!544631 () Bool)

(declare-fun array_inv!22205 (array!59599) Bool)

(assert (=> start!82822 (and (array_inv!22205 _values!1400) e!544631)))

(declare-datatypes ((array!59601 0))(
  ( (array!59602 (arr!28669 (Array (_ BitVec 32) (_ BitVec 64))) (size!29148 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59601)

(declare-fun array_inv!22206 (array!59601) Bool)

(assert (=> start!82822 (array_inv!22206 _keys!1686)))

(assert (=> start!82822 tp!65975))

(declare-fun tp_is_empty!21757 () Bool)

(assert (=> start!82822 tp_is_empty!21757))

(declare-fun mapIsEmpty!34630 () Bool)

(declare-fun mapRes!34630 () Bool)

(assert (=> mapIsEmpty!34630 mapRes!34630))

(declare-fun b!966128 () Bool)

(declare-fun res!646694 () Bool)

(assert (=> b!966128 (=> (not res!646694) (not e!544630))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966128 (= res!646694 (validKeyInArray!0 (select (arr!28669 _keys!1686) i!803)))))

(declare-fun b!966129 () Bool)

(assert (=> b!966129 (= e!544630 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33993)

(declare-fun lt!431299 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33993)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14056 0))(
  ( (tuple2!14057 (_1!7039 (_ BitVec 64)) (_2!7039 V!33993)) )
))
(declare-datatypes ((List!19897 0))(
  ( (Nil!19894) (Cons!19893 (h!21055 tuple2!14056) (t!28260 List!19897)) )
))
(declare-datatypes ((ListLongMap!12753 0))(
  ( (ListLongMap!12754 (toList!6392 List!19897)) )
))
(declare-fun contains!5493 (ListLongMap!12753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3625 (array!59601 array!59599 (_ BitVec 32) (_ BitVec 32) V!33993 V!33993 (_ BitVec 32) Int) ListLongMap!12753)

(assert (=> b!966129 (= lt!431299 (contains!5493 (getCurrentListMap!3625 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28669 _keys!1686) i!803)))))

(declare-fun b!966130 () Bool)

(declare-fun res!646696 () Bool)

(assert (=> b!966130 (=> (not res!646696) (not e!544630))))

(declare-datatypes ((List!19898 0))(
  ( (Nil!19895) (Cons!19894 (h!21056 (_ BitVec 64)) (t!28261 List!19898)) )
))
(declare-fun arrayNoDuplicates!0 (array!59601 (_ BitVec 32) List!19898) Bool)

(assert (=> b!966130 (= res!646696 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19895))))

(declare-fun b!966131 () Bool)

(declare-fun res!646698 () Bool)

(assert (=> b!966131 (=> (not res!646698) (not e!544630))))

(assert (=> b!966131 (= res!646698 (and (= (size!29147 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29148 _keys!1686) (size!29147 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966132 () Bool)

(declare-fun res!646699 () Bool)

(assert (=> b!966132 (=> (not res!646699) (not e!544630))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966132 (= res!646699 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29148 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29148 _keys!1686))))))

(declare-fun b!966133 () Bool)

(declare-fun res!646697 () Bool)

(assert (=> b!966133 (=> (not res!646697) (not e!544630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59601 (_ BitVec 32)) Bool)

(assert (=> b!966133 (= res!646697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966134 () Bool)

(declare-fun e!544627 () Bool)

(assert (=> b!966134 (= e!544627 tp_is_empty!21757)))

(declare-fun mapNonEmpty!34630 () Bool)

(declare-fun tp!65976 () Bool)

(assert (=> mapNonEmpty!34630 (= mapRes!34630 (and tp!65976 e!544627))))

(declare-fun mapRest!34630 () (Array (_ BitVec 32) ValueCell!10397))

(declare-fun mapKey!34630 () (_ BitVec 32))

(declare-fun mapValue!34630 () ValueCell!10397)

(assert (=> mapNonEmpty!34630 (= (arr!28668 _values!1400) (store mapRest!34630 mapKey!34630 mapValue!34630))))

(declare-fun b!966135 () Bool)

(declare-fun e!544629 () Bool)

(assert (=> b!966135 (= e!544629 tp_is_empty!21757)))

(declare-fun b!966136 () Bool)

(assert (=> b!966136 (= e!544631 (and e!544629 mapRes!34630))))

(declare-fun condMapEmpty!34630 () Bool)

(declare-fun mapDefault!34630 () ValueCell!10397)

