; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82600 () Bool)

(assert start!82600)

(declare-fun b_free!18751 () Bool)

(declare-fun b_next!18751 () Bool)

(assert (=> start!82600 (= b_free!18751 (not b_next!18751))))

(declare-fun tp!65373 () Bool)

(declare-fun b_and!30213 () Bool)

(assert (=> start!82600 (= tp!65373 b_and!30213)))

(declare-fun b!962725 () Bool)

(declare-fun res!644345 () Bool)

(declare-fun e!542869 () Bool)

(assert (=> b!962725 (=> (not res!644345) (not e!542869))))

(declare-datatypes ((array!59132 0))(
  ( (array!59133 (arr!28435 (Array (_ BitVec 32) (_ BitVec 64))) (size!28916 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59132)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962725 (= res!644345 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28916 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28916 _keys!1686))))))

(declare-fun mapNonEmpty!34324 () Bool)

(declare-fun mapRes!34324 () Bool)

(declare-fun tp!65374 () Bool)

(declare-fun e!542872 () Bool)

(assert (=> mapNonEmpty!34324 (= mapRes!34324 (and tp!65374 e!542872))))

(declare-datatypes ((V!33721 0))(
  ( (V!33722 (val!10827 Int)) )
))
(declare-datatypes ((ValueCell!10295 0))(
  ( (ValueCellFull!10295 (v!13384 V!33721)) (EmptyCell!10295) )
))
(declare-datatypes ((array!59134 0))(
  ( (array!59135 (arr!28436 (Array (_ BitVec 32) ValueCell!10295)) (size!28917 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59134)

(declare-fun mapRest!34324 () (Array (_ BitVec 32) ValueCell!10295))

(declare-fun mapValue!34324 () ValueCell!10295)

(declare-fun mapKey!34324 () (_ BitVec 32))

(assert (=> mapNonEmpty!34324 (= (arr!28436 _values!1400) (store mapRest!34324 mapKey!34324 mapValue!34324))))

(declare-fun b!962726 () Bool)

(declare-fun e!542871 () Bool)

(declare-fun e!542870 () Bool)

(assert (=> b!962726 (= e!542871 (and e!542870 mapRes!34324))))

(declare-fun condMapEmpty!34324 () Bool)

(declare-fun mapDefault!34324 () ValueCell!10295)

(assert (=> b!962726 (= condMapEmpty!34324 (= (arr!28436 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10295)) mapDefault!34324)))))

(declare-fun b!962727 () Bool)

(declare-fun res!644341 () Bool)

(assert (=> b!962727 (=> (not res!644341) (not e!542869))))

(declare-datatypes ((List!19777 0))(
  ( (Nil!19774) (Cons!19773 (h!20935 (_ BitVec 64)) (t!28131 List!19777)) )
))
(declare-fun arrayNoDuplicates!0 (array!59132 (_ BitVec 32) List!19777) Bool)

(assert (=> b!962727 (= res!644341 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19774))))

(declare-fun b!962728 () Bool)

(declare-fun res!644343 () Bool)

(assert (=> b!962728 (=> (not res!644343) (not e!542869))))

(assert (=> b!962728 (= res!644343 (bvsgt from!2084 newFrom!159))))

(declare-fun b!962729 () Bool)

(declare-fun res!644340 () Bool)

(assert (=> b!962729 (=> (not res!644340) (not e!542869))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962729 (= res!644340 (and (= (size!28917 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28916 _keys!1686) (size!28917 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34324 () Bool)

(assert (=> mapIsEmpty!34324 mapRes!34324))

(declare-fun b!962731 () Bool)

(declare-fun res!644339 () Bool)

(assert (=> b!962731 (=> (not res!644339) (not e!542869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962731 (= res!644339 (validKeyInArray!0 (select (arr!28435 _keys!1686) i!803)))))

(declare-fun b!962730 () Bool)

(declare-fun res!644338 () Bool)

(assert (=> b!962730 (=> (not res!644338) (not e!542869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59132 (_ BitVec 32)) Bool)

(assert (=> b!962730 (= res!644338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!644344 () Bool)

(assert (=> start!82600 (=> (not res!644344) (not e!542869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82600 (= res!644344 (validMask!0 mask!2110))))

(assert (=> start!82600 e!542869))

(assert (=> start!82600 true))

(declare-fun array_inv!22093 (array!59134) Bool)

(assert (=> start!82600 (and (array_inv!22093 _values!1400) e!542871)))

(declare-fun array_inv!22094 (array!59132) Bool)

(assert (=> start!82600 (array_inv!22094 _keys!1686)))

(assert (=> start!82600 tp!65373))

(declare-fun tp_is_empty!21553 () Bool)

(assert (=> start!82600 tp_is_empty!21553))

(declare-fun b!962732 () Bool)

(assert (=> b!962732 (= e!542870 tp_is_empty!21553)))

(declare-fun b!962733 () Bool)

(assert (=> b!962733 (= e!542869 (not true))))

(declare-fun minValue!1342 () V!33721)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33721)

(declare-datatypes ((tuple2!13966 0))(
  ( (tuple2!13967 (_1!6994 (_ BitVec 64)) (_2!6994 V!33721)) )
))
(declare-datatypes ((List!19778 0))(
  ( (Nil!19775) (Cons!19774 (h!20936 tuple2!13966) (t!28132 List!19778)) )
))
(declare-datatypes ((ListLongMap!12653 0))(
  ( (ListLongMap!12654 (toList!6342 List!19778)) )
))
(declare-fun contains!5389 (ListLongMap!12653 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3504 (array!59132 array!59134 (_ BitVec 32) (_ BitVec 32) V!33721 V!33721 (_ BitVec 32) Int) ListLongMap!12653)

(assert (=> b!962733 (contains!5389 (getCurrentListMap!3504 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28435 _keys!1686) i!803))))

(declare-datatypes ((Unit!32076 0))(
  ( (Unit!32077) )
))
(declare-fun lt!430694 () Unit!32076)

(declare-fun lemmaInListMapFromThenInFromMinusOne!4 (array!59132 array!59134 (_ BitVec 32) (_ BitVec 32) V!33721 V!33721 (_ BitVec 32) (_ BitVec 32) Int) Unit!32076)

(assert (=> b!962733 (= lt!430694 (lemmaInListMapFromThenInFromMinusOne!4 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!962734 () Bool)

(declare-fun res!644342 () Bool)

(assert (=> b!962734 (=> (not res!644342) (not e!542869))))

(assert (=> b!962734 (= res!644342 (contains!5389 (getCurrentListMap!3504 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28435 _keys!1686) i!803)))))

(declare-fun b!962735 () Bool)

(assert (=> b!962735 (= e!542872 tp_is_empty!21553)))

(assert (= (and start!82600 res!644344) b!962729))

(assert (= (and b!962729 res!644340) b!962730))

(assert (= (and b!962730 res!644338) b!962727))

(assert (= (and b!962727 res!644341) b!962725))

(assert (= (and b!962725 res!644345) b!962731))

(assert (= (and b!962731 res!644339) b!962734))

(assert (= (and b!962734 res!644342) b!962728))

(assert (= (and b!962728 res!644343) b!962733))

(assert (= (and b!962726 condMapEmpty!34324) mapIsEmpty!34324))

(assert (= (and b!962726 (not condMapEmpty!34324)) mapNonEmpty!34324))

(get-info :version)

(assert (= (and mapNonEmpty!34324 ((_ is ValueCellFull!10295) mapValue!34324)) b!962735))

(assert (= (and b!962726 ((_ is ValueCellFull!10295) mapDefault!34324)) b!962732))

(assert (= start!82600 b!962726))

(declare-fun m!891727 () Bool)

(assert (=> b!962733 m!891727))

(declare-fun m!891729 () Bool)

(assert (=> b!962733 m!891729))

(assert (=> b!962733 m!891727))

(assert (=> b!962733 m!891729))

(declare-fun m!891731 () Bool)

(assert (=> b!962733 m!891731))

(declare-fun m!891733 () Bool)

(assert (=> b!962733 m!891733))

(assert (=> b!962731 m!891729))

(assert (=> b!962731 m!891729))

(declare-fun m!891735 () Bool)

(assert (=> b!962731 m!891735))

(declare-fun m!891737 () Bool)

(assert (=> b!962727 m!891737))

(declare-fun m!891739 () Bool)

(assert (=> b!962734 m!891739))

(assert (=> b!962734 m!891729))

(assert (=> b!962734 m!891739))

(assert (=> b!962734 m!891729))

(declare-fun m!891741 () Bool)

(assert (=> b!962734 m!891741))

(declare-fun m!891743 () Bool)

(assert (=> mapNonEmpty!34324 m!891743))

(declare-fun m!891745 () Bool)

(assert (=> b!962730 m!891745))

(declare-fun m!891747 () Bool)

(assert (=> start!82600 m!891747))

(declare-fun m!891749 () Bool)

(assert (=> start!82600 m!891749))

(declare-fun m!891751 () Bool)

(assert (=> start!82600 m!891751))

(check-sat (not b!962734) (not b!962727) (not b!962731) (not b_next!18751) (not start!82600) (not b!962730) b_and!30213 (not mapNonEmpty!34324) tp_is_empty!21553 (not b!962733))
(check-sat b_and!30213 (not b_next!18751))
