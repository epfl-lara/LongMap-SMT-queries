; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82648 () Bool)

(assert start!82648)

(declare-fun b_free!18799 () Bool)

(declare-fun b_next!18799 () Bool)

(assert (=> start!82648 (= b_free!18799 (not b_next!18799))))

(declare-fun tp!65518 () Bool)

(declare-fun b_and!30261 () Bool)

(assert (=> start!82648 (= tp!65518 b_and!30261)))

(declare-fun b!963517 () Bool)

(declare-fun e!543231 () Bool)

(declare-fun e!543230 () Bool)

(declare-fun mapRes!34396 () Bool)

(assert (=> b!963517 (= e!543231 (and e!543230 mapRes!34396))))

(declare-fun condMapEmpty!34396 () Bool)

(declare-datatypes ((V!33785 0))(
  ( (V!33786 (val!10851 Int)) )
))
(declare-datatypes ((ValueCell!10319 0))(
  ( (ValueCellFull!10319 (v!13408 V!33785)) (EmptyCell!10319) )
))
(declare-datatypes ((array!59228 0))(
  ( (array!59229 (arr!28483 (Array (_ BitVec 32) ValueCell!10319)) (size!28964 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59228)

(declare-fun mapDefault!34396 () ValueCell!10319)

(assert (=> b!963517 (= condMapEmpty!34396 (= (arr!28483 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10319)) mapDefault!34396)))))

(declare-fun mapNonEmpty!34396 () Bool)

(declare-fun tp!65517 () Bool)

(declare-fun e!543228 () Bool)

(assert (=> mapNonEmpty!34396 (= mapRes!34396 (and tp!65517 e!543228))))

(declare-fun mapValue!34396 () ValueCell!10319)

(declare-fun mapKey!34396 () (_ BitVec 32))

(declare-fun mapRest!34396 () (Array (_ BitVec 32) ValueCell!10319))

(assert (=> mapNonEmpty!34396 (= (arr!28483 _values!1400) (store mapRest!34396 mapKey!34396 mapValue!34396))))

(declare-fun b!963518 () Bool)

(declare-fun res!644919 () Bool)

(declare-fun e!543229 () Bool)

(assert (=> b!963518 (=> (not res!644919) (not e!543229))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59230 0))(
  ( (array!59231 (arr!28484 (Array (_ BitVec 32) (_ BitVec 64))) (size!28965 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59230)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33785)

(declare-fun zeroValue!1342 () V!33785)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14010 0))(
  ( (tuple2!14011 (_1!7016 (_ BitVec 64)) (_2!7016 V!33785)) )
))
(declare-datatypes ((List!19817 0))(
  ( (Nil!19814) (Cons!19813 (h!20975 tuple2!14010) (t!28171 List!19817)) )
))
(declare-datatypes ((ListLongMap!12697 0))(
  ( (ListLongMap!12698 (toList!6364 List!19817)) )
))
(declare-fun contains!5411 (ListLongMap!12697 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3526 (array!59230 array!59228 (_ BitVec 32) (_ BitVec 32) V!33785 V!33785 (_ BitVec 32) Int) ListLongMap!12697)

(assert (=> b!963518 (= res!644919 (contains!5411 (getCurrentListMap!3526 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28484 _keys!1686) i!803)))))

(declare-fun b!963519 () Bool)

(declare-fun res!644920 () Bool)

(assert (=> b!963519 (=> (not res!644920) (not e!543229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963519 (= res!644920 (validKeyInArray!0 (select (arr!28484 _keys!1686) i!803)))))

(declare-fun b!963520 () Bool)

(declare-fun res!644918 () Bool)

(assert (=> b!963520 (=> (not res!644918) (not e!543229))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963520 (= res!644918 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28965 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28965 _keys!1686))))))

(declare-fun b!963522 () Bool)

(declare-fun res!644917 () Bool)

(assert (=> b!963522 (=> (not res!644917) (not e!543229))))

(assert (=> b!963522 (= res!644917 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963523 () Bool)

(declare-fun res!644915 () Bool)

(assert (=> b!963523 (=> (not res!644915) (not e!543229))))

(assert (=> b!963523 (= res!644915 (and (= (size!28964 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28965 _keys!1686) (size!28964 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963524 () Bool)

(declare-fun res!644916 () Bool)

(assert (=> b!963524 (=> (not res!644916) (not e!543229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59230 (_ BitVec 32)) Bool)

(assert (=> b!963524 (= res!644916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963525 () Bool)

(declare-fun tp_is_empty!21601 () Bool)

(assert (=> b!963525 (= e!543228 tp_is_empty!21601)))

(declare-fun b!963526 () Bool)

(assert (=> b!963526 (= e!543229 (not true))))

(assert (=> b!963526 (contains!5411 (getCurrentListMap!3526 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28484 _keys!1686) i!803))))

(declare-datatypes ((Unit!32114 0))(
  ( (Unit!32115) )
))
(declare-fun lt!430766 () Unit!32114)

(declare-fun lemmaInListMapFromThenInFromMinusOne!23 (array!59230 array!59228 (_ BitVec 32) (_ BitVec 32) V!33785 V!33785 (_ BitVec 32) (_ BitVec 32) Int) Unit!32114)

(assert (=> b!963526 (= lt!430766 (lemmaInListMapFromThenInFromMinusOne!23 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963521 () Bool)

(declare-fun res!644914 () Bool)

(assert (=> b!963521 (=> (not res!644914) (not e!543229))))

(declare-datatypes ((List!19818 0))(
  ( (Nil!19815) (Cons!19814 (h!20976 (_ BitVec 64)) (t!28172 List!19818)) )
))
(declare-fun arrayNoDuplicates!0 (array!59230 (_ BitVec 32) List!19818) Bool)

(assert (=> b!963521 (= res!644914 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19815))))

(declare-fun res!644921 () Bool)

(assert (=> start!82648 (=> (not res!644921) (not e!543229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82648 (= res!644921 (validMask!0 mask!2110))))

(assert (=> start!82648 e!543229))

(assert (=> start!82648 true))

(declare-fun array_inv!22127 (array!59228) Bool)

(assert (=> start!82648 (and (array_inv!22127 _values!1400) e!543231)))

(declare-fun array_inv!22128 (array!59230) Bool)

(assert (=> start!82648 (array_inv!22128 _keys!1686)))

(assert (=> start!82648 tp!65518))

(assert (=> start!82648 tp_is_empty!21601))

(declare-fun mapIsEmpty!34396 () Bool)

(assert (=> mapIsEmpty!34396 mapRes!34396))

(declare-fun b!963527 () Bool)

(assert (=> b!963527 (= e!543230 tp_is_empty!21601)))

(assert (= (and start!82648 res!644921) b!963523))

(assert (= (and b!963523 res!644915) b!963524))

(assert (= (and b!963524 res!644916) b!963521))

(assert (= (and b!963521 res!644914) b!963520))

(assert (= (and b!963520 res!644918) b!963519))

(assert (= (and b!963519 res!644920) b!963518))

(assert (= (and b!963518 res!644919) b!963522))

(assert (= (and b!963522 res!644917) b!963526))

(assert (= (and b!963517 condMapEmpty!34396) mapIsEmpty!34396))

(assert (= (and b!963517 (not condMapEmpty!34396)) mapNonEmpty!34396))

(get-info :version)

(assert (= (and mapNonEmpty!34396 ((_ is ValueCellFull!10319) mapValue!34396)) b!963525))

(assert (= (and b!963517 ((_ is ValueCellFull!10319) mapDefault!34396)) b!963527))

(assert (= start!82648 b!963517))

(declare-fun m!892351 () Bool)

(assert (=> b!963526 m!892351))

(declare-fun m!892353 () Bool)

(assert (=> b!963526 m!892353))

(assert (=> b!963526 m!892351))

(assert (=> b!963526 m!892353))

(declare-fun m!892355 () Bool)

(assert (=> b!963526 m!892355))

(declare-fun m!892357 () Bool)

(assert (=> b!963526 m!892357))

(declare-fun m!892359 () Bool)

(assert (=> b!963518 m!892359))

(assert (=> b!963518 m!892353))

(assert (=> b!963518 m!892359))

(assert (=> b!963518 m!892353))

(declare-fun m!892361 () Bool)

(assert (=> b!963518 m!892361))

(declare-fun m!892363 () Bool)

(assert (=> start!82648 m!892363))

(declare-fun m!892365 () Bool)

(assert (=> start!82648 m!892365))

(declare-fun m!892367 () Bool)

(assert (=> start!82648 m!892367))

(declare-fun m!892369 () Bool)

(assert (=> b!963521 m!892369))

(declare-fun m!892371 () Bool)

(assert (=> b!963524 m!892371))

(declare-fun m!892373 () Bool)

(assert (=> mapNonEmpty!34396 m!892373))

(assert (=> b!963519 m!892353))

(assert (=> b!963519 m!892353))

(declare-fun m!892375 () Bool)

(assert (=> b!963519 m!892375))

(check-sat (not b!963526) b_and!30261 (not b!963519) (not mapNonEmpty!34396) (not b!963518) tp_is_empty!21601 (not b!963524) (not b!963521) (not b_next!18799) (not start!82648))
(check-sat b_and!30261 (not b_next!18799))
