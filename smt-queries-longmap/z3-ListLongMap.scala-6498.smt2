; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82996 () Bool)

(assert start!82996)

(declare-fun b_free!18955 () Bool)

(declare-fun b_next!18955 () Bool)

(assert (=> start!82996 (= b_free!18955 (not b_next!18955))))

(declare-fun tp!65995 () Bool)

(declare-fun b_and!30453 () Bool)

(assert (=> start!82996 (= tp!65995 b_and!30453)))

(declare-fun b!967112 () Bool)

(declare-fun res!647092 () Bool)

(declare-fun e!545255 () Bool)

(assert (=> b!967112 (=> (not res!647092) (not e!545255))))

(declare-datatypes ((array!59624 0))(
  ( (array!59625 (arr!28676 (Array (_ BitVec 32) (_ BitVec 64))) (size!29156 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59624)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967112 (= res!647092 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29156 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29156 _keys!1686))))))

(declare-fun b!967113 () Bool)

(declare-fun e!545257 () Bool)

(declare-fun e!545256 () Bool)

(declare-fun mapRes!34639 () Bool)

(assert (=> b!967113 (= e!545257 (and e!545256 mapRes!34639))))

(declare-fun condMapEmpty!34639 () Bool)

(declare-datatypes ((V!34001 0))(
  ( (V!34002 (val!10932 Int)) )
))
(declare-datatypes ((ValueCell!10400 0))(
  ( (ValueCellFull!10400 (v!13487 V!34001)) (EmptyCell!10400) )
))
(declare-datatypes ((array!59626 0))(
  ( (array!59627 (arr!28677 (Array (_ BitVec 32) ValueCell!10400)) (size!29157 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59626)

(declare-fun mapDefault!34639 () ValueCell!10400)

(assert (=> b!967113 (= condMapEmpty!34639 (= (arr!28677 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10400)) mapDefault!34639)))))

(declare-fun b!967114 () Bool)

(declare-fun res!647093 () Bool)

(assert (=> b!967114 (=> (not res!647093) (not e!545255))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59624 (_ BitVec 32)) Bool)

(assert (=> b!967114 (= res!647093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!647095 () Bool)

(assert (=> start!82996 (=> (not res!647095) (not e!545255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82996 (= res!647095 (validMask!0 mask!2110))))

(assert (=> start!82996 e!545255))

(assert (=> start!82996 true))

(declare-fun array_inv!22265 (array!59626) Bool)

(assert (=> start!82996 (and (array_inv!22265 _values!1400) e!545257)))

(declare-fun array_inv!22266 (array!59624) Bool)

(assert (=> start!82996 (array_inv!22266 _keys!1686)))

(assert (=> start!82996 tp!65995))

(declare-fun tp_is_empty!21763 () Bool)

(assert (=> start!82996 tp_is_empty!21763))

(declare-fun mapNonEmpty!34639 () Bool)

(declare-fun tp!65994 () Bool)

(declare-fun e!545254 () Bool)

(assert (=> mapNonEmpty!34639 (= mapRes!34639 (and tp!65994 e!545254))))

(declare-fun mapKey!34639 () (_ BitVec 32))

(declare-fun mapRest!34639 () (Array (_ BitVec 32) ValueCell!10400))

(declare-fun mapValue!34639 () ValueCell!10400)

(assert (=> mapNonEmpty!34639 (= (arr!28677 _values!1400) (store mapRest!34639 mapKey!34639 mapValue!34639))))

(declare-fun b!967115 () Bool)

(assert (=> b!967115 (= e!545255 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34001)

(declare-fun lt!431669 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34001)

(declare-datatypes ((tuple2!14042 0))(
  ( (tuple2!14043 (_1!7032 (_ BitVec 64)) (_2!7032 V!34001)) )
))
(declare-datatypes ((List!19891 0))(
  ( (Nil!19888) (Cons!19887 (h!21055 tuple2!14042) (t!28246 List!19891)) )
))
(declare-datatypes ((ListLongMap!12741 0))(
  ( (ListLongMap!12742 (toList!6386 List!19891)) )
))
(declare-fun contains!5498 (ListLongMap!12741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3619 (array!59624 array!59626 (_ BitVec 32) (_ BitVec 32) V!34001 V!34001 (_ BitVec 32) Int) ListLongMap!12741)

(assert (=> b!967115 (= lt!431669 (contains!5498 (getCurrentListMap!3619 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28676 _keys!1686) i!803)))))

(declare-fun b!967116 () Bool)

(assert (=> b!967116 (= e!545254 tp_is_empty!21763)))

(declare-fun b!967117 () Bool)

(declare-fun res!647096 () Bool)

(assert (=> b!967117 (=> (not res!647096) (not e!545255))))

(assert (=> b!967117 (= res!647096 (and (= (size!29157 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29156 _keys!1686) (size!29157 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967118 () Bool)

(declare-fun res!647094 () Bool)

(assert (=> b!967118 (=> (not res!647094) (not e!545255))))

(declare-datatypes ((List!19892 0))(
  ( (Nil!19889) (Cons!19888 (h!21056 (_ BitVec 64)) (t!28247 List!19892)) )
))
(declare-fun arrayNoDuplicates!0 (array!59624 (_ BitVec 32) List!19892) Bool)

(assert (=> b!967118 (= res!647094 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19889))))

(declare-fun mapIsEmpty!34639 () Bool)

(assert (=> mapIsEmpty!34639 mapRes!34639))

(declare-fun b!967119 () Bool)

(assert (=> b!967119 (= e!545256 tp_is_empty!21763)))

(declare-fun b!967120 () Bool)

(declare-fun res!647097 () Bool)

(assert (=> b!967120 (=> (not res!647097) (not e!545255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967120 (= res!647097 (validKeyInArray!0 (select (arr!28676 _keys!1686) i!803)))))

(assert (= (and start!82996 res!647095) b!967117))

(assert (= (and b!967117 res!647096) b!967114))

(assert (= (and b!967114 res!647093) b!967118))

(assert (= (and b!967118 res!647094) b!967112))

(assert (= (and b!967112 res!647092) b!967120))

(assert (= (and b!967120 res!647097) b!967115))

(assert (= (and b!967113 condMapEmpty!34639) mapIsEmpty!34639))

(assert (= (and b!967113 (not condMapEmpty!34639)) mapNonEmpty!34639))

(get-info :version)

(assert (= (and mapNonEmpty!34639 ((_ is ValueCellFull!10400) mapValue!34639)) b!967116))

(assert (= (and b!967113 ((_ is ValueCellFull!10400) mapDefault!34639)) b!967119))

(assert (= start!82996 b!967113))

(declare-fun m!896353 () Bool)

(assert (=> b!967118 m!896353))

(declare-fun m!896355 () Bool)

(assert (=> b!967114 m!896355))

(declare-fun m!896357 () Bool)

(assert (=> b!967115 m!896357))

(declare-fun m!896359 () Bool)

(assert (=> b!967115 m!896359))

(assert (=> b!967115 m!896357))

(assert (=> b!967115 m!896359))

(declare-fun m!896361 () Bool)

(assert (=> b!967115 m!896361))

(declare-fun m!896363 () Bool)

(assert (=> start!82996 m!896363))

(declare-fun m!896365 () Bool)

(assert (=> start!82996 m!896365))

(declare-fun m!896367 () Bool)

(assert (=> start!82996 m!896367))

(assert (=> b!967120 m!896359))

(assert (=> b!967120 m!896359))

(declare-fun m!896369 () Bool)

(assert (=> b!967120 m!896369))

(declare-fun m!896371 () Bool)

(assert (=> mapNonEmpty!34639 m!896371))

(check-sat tp_is_empty!21763 (not b!967114) (not mapNonEmpty!34639) (not b!967120) b_and!30453 (not b!967118) (not start!82996) (not b_next!18955) (not b!967115))
(check-sat b_and!30453 (not b_next!18955))
