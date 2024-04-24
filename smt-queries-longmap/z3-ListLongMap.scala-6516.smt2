; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83104 () Bool)

(assert start!83104)

(declare-fun b_free!19063 () Bool)

(declare-fun b_next!19063 () Bool)

(assert (=> start!83104 (= b_free!19063 (not b_next!19063))))

(declare-fun tp!66319 () Bool)

(declare-fun b_and!30561 () Bool)

(assert (=> start!83104 (= tp!66319 b_and!30561)))

(declare-fun mapNonEmpty!34801 () Bool)

(declare-fun mapRes!34801 () Bool)

(declare-fun tp!66318 () Bool)

(declare-fun e!546065 () Bool)

(assert (=> mapNonEmpty!34801 (= mapRes!34801 (and tp!66318 e!546065))))

(declare-datatypes ((V!34145 0))(
  ( (V!34146 (val!10986 Int)) )
))
(declare-datatypes ((ValueCell!10454 0))(
  ( (ValueCellFull!10454 (v!13541 V!34145)) (EmptyCell!10454) )
))
(declare-fun mapRest!34801 () (Array (_ BitVec 32) ValueCell!10454))

(declare-datatypes ((array!59832 0))(
  ( (array!59833 (arr!28780 (Array (_ BitVec 32) ValueCell!10454)) (size!29260 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59832)

(declare-fun mapValue!34801 () ValueCell!10454)

(declare-fun mapKey!34801 () (_ BitVec 32))

(assert (=> mapNonEmpty!34801 (= (arr!28780 _values!1400) (store mapRest!34801 mapKey!34801 mapValue!34801))))

(declare-fun mapIsEmpty!34801 () Bool)

(assert (=> mapIsEmpty!34801 mapRes!34801))

(declare-fun b!968781 () Bool)

(declare-fun res!648278 () Bool)

(declare-fun e!546064 () Bool)

(assert (=> b!968781 (=> (not res!648278) (not e!546064))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968781 (= res!648278 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968782 () Bool)

(declare-fun res!648276 () Bool)

(assert (=> b!968782 (=> (not res!648276) (not e!546064))))

(declare-datatypes ((array!59834 0))(
  ( (array!59835 (arr!28781 (Array (_ BitVec 32) (_ BitVec 64))) (size!29261 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59834)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968782 (= res!648276 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29261 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29261 _keys!1686))))))

(declare-fun b!968783 () Bool)

(declare-fun e!546067 () Bool)

(declare-fun tp_is_empty!21871 () Bool)

(assert (=> b!968783 (= e!546067 tp_is_empty!21871)))

(declare-fun b!968784 () Bool)

(declare-fun res!648275 () Bool)

(assert (=> b!968784 (=> (not res!648275) (not e!546064))))

(declare-datatypes ((List!19968 0))(
  ( (Nil!19965) (Cons!19964 (h!21132 (_ BitVec 64)) (t!28323 List!19968)) )
))
(declare-fun arrayNoDuplicates!0 (array!59834 (_ BitVec 32) List!19968) Bool)

(assert (=> b!968784 (= res!648275 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19965))))

(declare-fun res!648282 () Bool)

(assert (=> start!83104 (=> (not res!648282) (not e!546064))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83104 (= res!648282 (validMask!0 mask!2110))))

(assert (=> start!83104 e!546064))

(assert (=> start!83104 true))

(declare-fun e!546068 () Bool)

(declare-fun array_inv!22341 (array!59832) Bool)

(assert (=> start!83104 (and (array_inv!22341 _values!1400) e!546068)))

(declare-fun array_inv!22342 (array!59834) Bool)

(assert (=> start!83104 (array_inv!22342 _keys!1686)))

(assert (=> start!83104 tp!66319))

(assert (=> start!83104 tp_is_empty!21871))

(declare-fun b!968785 () Bool)

(declare-fun res!648280 () Bool)

(assert (=> b!968785 (=> (not res!648280) (not e!546064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59834 (_ BitVec 32)) Bool)

(assert (=> b!968785 (= res!648280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968786 () Bool)

(assert (=> b!968786 (= e!546065 tp_is_empty!21871)))

(declare-fun b!968787 () Bool)

(declare-fun res!648279 () Bool)

(assert (=> b!968787 (=> (not res!648279) (not e!546064))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34145)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34145)

(declare-datatypes ((tuple2!14122 0))(
  ( (tuple2!14123 (_1!7072 (_ BitVec 64)) (_2!7072 V!34145)) )
))
(declare-datatypes ((List!19969 0))(
  ( (Nil!19966) (Cons!19965 (h!21133 tuple2!14122) (t!28324 List!19969)) )
))
(declare-datatypes ((ListLongMap!12821 0))(
  ( (ListLongMap!12822 (toList!6426 List!19969)) )
))
(declare-fun contains!5538 (ListLongMap!12821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3659 (array!59834 array!59832 (_ BitVec 32) (_ BitVec 32) V!34145 V!34145 (_ BitVec 32) Int) ListLongMap!12821)

(assert (=> b!968787 (= res!648279 (contains!5538 (getCurrentListMap!3659 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28781 _keys!1686) i!803)))))

(declare-fun b!968788 () Bool)

(declare-fun res!648277 () Bool)

(assert (=> b!968788 (=> (not res!648277) (not e!546064))))

(assert (=> b!968788 (= res!648277 (and (= (size!29260 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29261 _keys!1686) (size!29260 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968789 () Bool)

(assert (=> b!968789 (= e!546064 (not true))))

(assert (=> b!968789 (contains!5538 (getCurrentListMap!3659 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28781 _keys!1686) i!803))))

(declare-datatypes ((Unit!32306 0))(
  ( (Unit!32307) )
))
(declare-fun lt!431822 () Unit!32306)

(declare-fun lemmaInListMapFromThenInFromMinusOne!64 (array!59834 array!59832 (_ BitVec 32) (_ BitVec 32) V!34145 V!34145 (_ BitVec 32) (_ BitVec 32) Int) Unit!32306)

(assert (=> b!968789 (= lt!431822 (lemmaInListMapFromThenInFromMinusOne!64 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968790 () Bool)

(declare-fun res!648281 () Bool)

(assert (=> b!968790 (=> (not res!648281) (not e!546064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968790 (= res!648281 (validKeyInArray!0 (select (arr!28781 _keys!1686) i!803)))))

(declare-fun b!968791 () Bool)

(assert (=> b!968791 (= e!546068 (and e!546067 mapRes!34801))))

(declare-fun condMapEmpty!34801 () Bool)

(declare-fun mapDefault!34801 () ValueCell!10454)

(assert (=> b!968791 (= condMapEmpty!34801 (= (arr!28780 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10454)) mapDefault!34801)))))

(assert (= (and start!83104 res!648282) b!968788))

(assert (= (and b!968788 res!648277) b!968785))

(assert (= (and b!968785 res!648280) b!968784))

(assert (= (and b!968784 res!648275) b!968782))

(assert (= (and b!968782 res!648276) b!968790))

(assert (= (and b!968790 res!648281) b!968787))

(assert (= (and b!968787 res!648279) b!968781))

(assert (= (and b!968781 res!648278) b!968789))

(assert (= (and b!968791 condMapEmpty!34801) mapIsEmpty!34801))

(assert (= (and b!968791 (not condMapEmpty!34801)) mapNonEmpty!34801))

(get-info :version)

(assert (= (and mapNonEmpty!34801 ((_ is ValueCellFull!10454) mapValue!34801)) b!968786))

(assert (= (and b!968791 ((_ is ValueCellFull!10454) mapDefault!34801)) b!968783))

(assert (= start!83104 b!968791))

(declare-fun m!897631 () Bool)

(assert (=> start!83104 m!897631))

(declare-fun m!897633 () Bool)

(assert (=> start!83104 m!897633))

(declare-fun m!897635 () Bool)

(assert (=> start!83104 m!897635))

(declare-fun m!897637 () Bool)

(assert (=> mapNonEmpty!34801 m!897637))

(declare-fun m!897639 () Bool)

(assert (=> b!968790 m!897639))

(assert (=> b!968790 m!897639))

(declare-fun m!897641 () Bool)

(assert (=> b!968790 m!897641))

(declare-fun m!897643 () Bool)

(assert (=> b!968784 m!897643))

(declare-fun m!897645 () Bool)

(assert (=> b!968787 m!897645))

(assert (=> b!968787 m!897639))

(assert (=> b!968787 m!897645))

(assert (=> b!968787 m!897639))

(declare-fun m!897647 () Bool)

(assert (=> b!968787 m!897647))

(declare-fun m!897649 () Bool)

(assert (=> b!968785 m!897649))

(declare-fun m!897651 () Bool)

(assert (=> b!968789 m!897651))

(assert (=> b!968789 m!897639))

(assert (=> b!968789 m!897651))

(assert (=> b!968789 m!897639))

(declare-fun m!897653 () Bool)

(assert (=> b!968789 m!897653))

(declare-fun m!897655 () Bool)

(assert (=> b!968789 m!897655))

(check-sat (not b!968790) (not b!968787) (not b_next!19063) tp_is_empty!21871 (not b!968789) (not b!968785) (not start!83104) (not mapNonEmpty!34801) b_and!30561 (not b!968784))
(check-sat b_and!30561 (not b_next!19063))
