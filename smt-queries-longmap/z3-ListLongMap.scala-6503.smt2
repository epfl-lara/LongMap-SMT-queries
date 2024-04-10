; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82860 () Bool)

(assert start!82860)

(declare-fun b_free!18987 () Bool)

(declare-fun b_next!18987 () Bool)

(assert (=> start!82860 (= b_free!18987 (not b_next!18987))))

(declare-fun tp!66090 () Bool)

(declare-fun b_and!30475 () Bool)

(assert (=> start!82860 (= tp!66090 b_and!30475)))

(declare-fun mapNonEmpty!34687 () Bool)

(declare-fun mapRes!34687 () Bool)

(declare-fun tp!66089 () Bool)

(declare-fun e!544915 () Bool)

(assert (=> mapNonEmpty!34687 (= mapRes!34687 (and tp!66089 e!544915))))

(declare-datatypes ((V!34043 0))(
  ( (V!34044 (val!10948 Int)) )
))
(declare-datatypes ((ValueCell!10416 0))(
  ( (ValueCellFull!10416 (v!13506 V!34043)) (EmptyCell!10416) )
))
(declare-fun mapRest!34687 () (Array (_ BitVec 32) ValueCell!10416))

(declare-datatypes ((array!59667 0))(
  ( (array!59668 (arr!28702 (Array (_ BitVec 32) ValueCell!10416)) (size!29181 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59667)

(declare-fun mapKey!34687 () (_ BitVec 32))

(declare-fun mapValue!34687 () ValueCell!10416)

(assert (=> mapNonEmpty!34687 (= (arr!28702 _values!1400) (store mapRest!34687 mapKey!34687 mapValue!34687))))

(declare-fun b!966650 () Bool)

(declare-fun res!647046 () Bool)

(declare-fun e!544912 () Bool)

(assert (=> b!966650 (=> (not res!647046) (not e!544912))))

(declare-datatypes ((array!59669 0))(
  ( (array!59670 (arr!28703 (Array (_ BitVec 32) (_ BitVec 64))) (size!29182 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59669)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966650 (= res!647046 (validKeyInArray!0 (select (arr!28703 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34687 () Bool)

(assert (=> mapIsEmpty!34687 mapRes!34687))

(declare-fun b!966651 () Bool)

(declare-fun res!647045 () Bool)

(assert (=> b!966651 (=> (not res!647045) (not e!544912))))

(declare-datatypes ((List!19923 0))(
  ( (Nil!19920) (Cons!19919 (h!21081 (_ BitVec 64)) (t!28286 List!19923)) )
))
(declare-fun arrayNoDuplicates!0 (array!59669 (_ BitVec 32) List!19923) Bool)

(assert (=> b!966651 (= res!647045 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19920))))

(declare-fun b!966653 () Bool)

(declare-fun e!544913 () Bool)

(declare-fun tp_is_empty!21795 () Bool)

(assert (=> b!966653 (= e!544913 tp_is_empty!21795)))

(declare-fun b!966654 () Bool)

(assert (=> b!966654 (= e!544912 false)))

(declare-fun minValue!1342 () V!34043)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431347 () Bool)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34043)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14078 0))(
  ( (tuple2!14079 (_1!7050 (_ BitVec 64)) (_2!7050 V!34043)) )
))
(declare-datatypes ((List!19924 0))(
  ( (Nil!19921) (Cons!19920 (h!21082 tuple2!14078) (t!28287 List!19924)) )
))
(declare-datatypes ((ListLongMap!12775 0))(
  ( (ListLongMap!12776 (toList!6403 List!19924)) )
))
(declare-fun contains!5504 (ListLongMap!12775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3636 (array!59669 array!59667 (_ BitVec 32) (_ BitVec 32) V!34043 V!34043 (_ BitVec 32) Int) ListLongMap!12775)

(assert (=> b!966654 (= lt!431347 (contains!5504 (getCurrentListMap!3636 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28703 _keys!1686) i!803)))))

(declare-fun b!966655 () Bool)

(declare-fun res!647049 () Bool)

(assert (=> b!966655 (=> (not res!647049) (not e!544912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59669 (_ BitVec 32)) Bool)

(assert (=> b!966655 (= res!647049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966656 () Bool)

(declare-fun res!647050 () Bool)

(assert (=> b!966656 (=> (not res!647050) (not e!544912))))

(assert (=> b!966656 (= res!647050 (and (= (size!29181 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29182 _keys!1686) (size!29181 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!647047 () Bool)

(assert (=> start!82860 (=> (not res!647047) (not e!544912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82860 (= res!647047 (validMask!0 mask!2110))))

(assert (=> start!82860 e!544912))

(assert (=> start!82860 true))

(declare-fun e!544914 () Bool)

(declare-fun array_inv!22229 (array!59667) Bool)

(assert (=> start!82860 (and (array_inv!22229 _values!1400) e!544914)))

(declare-fun array_inv!22230 (array!59669) Bool)

(assert (=> start!82860 (array_inv!22230 _keys!1686)))

(assert (=> start!82860 tp!66090))

(assert (=> start!82860 tp_is_empty!21795))

(declare-fun b!966652 () Bool)

(declare-fun res!647048 () Bool)

(assert (=> b!966652 (=> (not res!647048) (not e!544912))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966652 (= res!647048 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29182 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29182 _keys!1686))))))

(declare-fun b!966657 () Bool)

(assert (=> b!966657 (= e!544914 (and e!544913 mapRes!34687))))

(declare-fun condMapEmpty!34687 () Bool)

(declare-fun mapDefault!34687 () ValueCell!10416)

(assert (=> b!966657 (= condMapEmpty!34687 (= (arr!28702 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10416)) mapDefault!34687)))))

(declare-fun b!966658 () Bool)

(assert (=> b!966658 (= e!544915 tp_is_empty!21795)))

(assert (= (and start!82860 res!647047) b!966656))

(assert (= (and b!966656 res!647050) b!966655))

(assert (= (and b!966655 res!647049) b!966651))

(assert (= (and b!966651 res!647045) b!966652))

(assert (= (and b!966652 res!647048) b!966650))

(assert (= (and b!966650 res!647046) b!966654))

(assert (= (and b!966657 condMapEmpty!34687) mapIsEmpty!34687))

(assert (= (and b!966657 (not condMapEmpty!34687)) mapNonEmpty!34687))

(get-info :version)

(assert (= (and mapNonEmpty!34687 ((_ is ValueCellFull!10416) mapValue!34687)) b!966658))

(assert (= (and b!966657 ((_ is ValueCellFull!10416) mapDefault!34687)) b!966653))

(assert (= start!82860 b!966657))

(declare-fun m!895379 () Bool)

(assert (=> b!966655 m!895379))

(declare-fun m!895381 () Bool)

(assert (=> mapNonEmpty!34687 m!895381))

(declare-fun m!895383 () Bool)

(assert (=> b!966651 m!895383))

(declare-fun m!895385 () Bool)

(assert (=> b!966654 m!895385))

(declare-fun m!895387 () Bool)

(assert (=> b!966654 m!895387))

(assert (=> b!966654 m!895385))

(assert (=> b!966654 m!895387))

(declare-fun m!895389 () Bool)

(assert (=> b!966654 m!895389))

(declare-fun m!895391 () Bool)

(assert (=> start!82860 m!895391))

(declare-fun m!895393 () Bool)

(assert (=> start!82860 m!895393))

(declare-fun m!895395 () Bool)

(assert (=> start!82860 m!895395))

(assert (=> b!966650 m!895387))

(assert (=> b!966650 m!895387))

(declare-fun m!895397 () Bool)

(assert (=> b!966650 m!895397))

(check-sat (not mapNonEmpty!34687) (not b_next!18987) (not start!82860) (not b!966650) (not b!966651) (not b!966654) b_and!30475 tp_is_empty!21795 (not b!966655))
(check-sat b_and!30475 (not b_next!18987))
