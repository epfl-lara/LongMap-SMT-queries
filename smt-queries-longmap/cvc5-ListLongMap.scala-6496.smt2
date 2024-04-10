; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82816 () Bool)

(assert start!82816)

(declare-fun b_free!18943 () Bool)

(declare-fun b_next!18943 () Bool)

(assert (=> start!82816 (= b_free!18943 (not b_next!18943))))

(declare-fun tp!65958 () Bool)

(declare-fun b_and!30431 () Bool)

(assert (=> start!82816 (= tp!65958 b_and!30431)))

(declare-fun b!966047 () Bool)

(declare-fun res!646643 () Bool)

(declare-fun e!544583 () Bool)

(assert (=> b!966047 (=> (not res!646643) (not e!544583))))

(declare-datatypes ((array!59587 0))(
  ( (array!59588 (arr!28662 (Array (_ BitVec 32) (_ BitVec 64))) (size!29141 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59587)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966047 (= res!646643 (validKeyInArray!0 (select (arr!28662 _keys!1686) i!803)))))

(declare-fun b!966048 () Bool)

(declare-fun e!544582 () Bool)

(declare-fun tp_is_empty!21751 () Bool)

(assert (=> b!966048 (= e!544582 tp_is_empty!21751)))

(declare-fun b!966049 () Bool)

(declare-fun res!646641 () Bool)

(assert (=> b!966049 (=> (not res!646641) (not e!544583))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33985 0))(
  ( (V!33986 (val!10926 Int)) )
))
(declare-datatypes ((ValueCell!10394 0))(
  ( (ValueCellFull!10394 (v!13484 V!33985)) (EmptyCell!10394) )
))
(declare-datatypes ((array!59589 0))(
  ( (array!59590 (arr!28663 (Array (_ BitVec 32) ValueCell!10394)) (size!29142 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59589)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966049 (= res!646641 (and (= (size!29142 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29141 _keys!1686) (size!29142 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966050 () Bool)

(assert (=> b!966050 (= e!544583 false)))

(declare-fun lt!431290 () Bool)

(declare-fun minValue!1342 () V!33985)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33985)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14050 0))(
  ( (tuple2!14051 (_1!7036 (_ BitVec 64)) (_2!7036 V!33985)) )
))
(declare-datatypes ((List!19892 0))(
  ( (Nil!19889) (Cons!19888 (h!21050 tuple2!14050) (t!28255 List!19892)) )
))
(declare-datatypes ((ListLongMap!12747 0))(
  ( (ListLongMap!12748 (toList!6389 List!19892)) )
))
(declare-fun contains!5490 (ListLongMap!12747 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3622 (array!59587 array!59589 (_ BitVec 32) (_ BitVec 32) V!33985 V!33985 (_ BitVec 32) Int) ListLongMap!12747)

(assert (=> b!966050 (= lt!431290 (contains!5490 (getCurrentListMap!3622 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28662 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34621 () Bool)

(declare-fun mapRes!34621 () Bool)

(declare-fun tp!65957 () Bool)

(assert (=> mapNonEmpty!34621 (= mapRes!34621 (and tp!65957 e!544582))))

(declare-fun mapKey!34621 () (_ BitVec 32))

(declare-fun mapValue!34621 () ValueCell!10394)

(declare-fun mapRest!34621 () (Array (_ BitVec 32) ValueCell!10394))

(assert (=> mapNonEmpty!34621 (= (arr!28663 _values!1400) (store mapRest!34621 mapKey!34621 mapValue!34621))))

(declare-fun b!966051 () Bool)

(declare-fun e!544585 () Bool)

(assert (=> b!966051 (= e!544585 tp_is_empty!21751)))

(declare-fun b!966052 () Bool)

(declare-fun res!646644 () Bool)

(assert (=> b!966052 (=> (not res!646644) (not e!544583))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966052 (= res!646644 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29141 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29141 _keys!1686))))))

(declare-fun mapIsEmpty!34621 () Bool)

(assert (=> mapIsEmpty!34621 mapRes!34621))

(declare-fun b!966053 () Bool)

(declare-fun res!646642 () Bool)

(assert (=> b!966053 (=> (not res!646642) (not e!544583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59587 (_ BitVec 32)) Bool)

(assert (=> b!966053 (= res!646642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!646645 () Bool)

(assert (=> start!82816 (=> (not res!646645) (not e!544583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82816 (= res!646645 (validMask!0 mask!2110))))

(assert (=> start!82816 e!544583))

(assert (=> start!82816 true))

(declare-fun e!544584 () Bool)

(declare-fun array_inv!22201 (array!59589) Bool)

(assert (=> start!82816 (and (array_inv!22201 _values!1400) e!544584)))

(declare-fun array_inv!22202 (array!59587) Bool)

(assert (=> start!82816 (array_inv!22202 _keys!1686)))

(assert (=> start!82816 tp!65958))

(assert (=> start!82816 tp_is_empty!21751))

(declare-fun b!966054 () Bool)

(assert (=> b!966054 (= e!544584 (and e!544585 mapRes!34621))))

(declare-fun condMapEmpty!34621 () Bool)

(declare-fun mapDefault!34621 () ValueCell!10394)

