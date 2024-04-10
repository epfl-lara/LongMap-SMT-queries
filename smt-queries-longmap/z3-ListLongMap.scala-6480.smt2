; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82722 () Bool)

(assert start!82722)

(declare-fun b_free!18855 () Bool)

(declare-fun b_next!18855 () Bool)

(assert (=> start!82722 (= b_free!18855 (not b_next!18855))))

(declare-fun tp!65685 () Bool)

(declare-fun b_and!30343 () Bool)

(assert (=> start!82722 (= tp!65685 b_and!30343)))

(declare-fun b!964748 () Bool)

(declare-fun res!645764 () Bool)

(declare-fun e!543867 () Bool)

(assert (=> b!964748 (=> (not res!645764) (not e!543867))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33859 0))(
  ( (V!33860 (val!10879 Int)) )
))
(declare-datatypes ((ValueCell!10347 0))(
  ( (ValueCellFull!10347 (v!13437 V!33859)) (EmptyCell!10347) )
))
(declare-datatypes ((array!59401 0))(
  ( (array!59402 (arr!28569 (Array (_ BitVec 32) ValueCell!10347)) (size!29048 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59401)

(declare-datatypes ((array!59403 0))(
  ( (array!59404 (arr!28570 (Array (_ BitVec 32) (_ BitVec 64))) (size!29049 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59403)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!964748 (= res!645764 (and (= (size!29048 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29049 _keys!1686) (size!29048 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964749 () Bool)

(declare-fun e!543864 () Bool)

(declare-fun tp_is_empty!21657 () Bool)

(assert (=> b!964749 (= e!543864 tp_is_empty!21657)))

(declare-fun b!964750 () Bool)

(declare-fun e!543869 () Bool)

(assert (=> b!964750 (= e!543867 (not e!543869))))

(declare-fun res!645770 () Bool)

(assert (=> b!964750 (=> res!645770 e!543869)))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964750 (= res!645770 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29049 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun minValue!1342 () V!33859)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33859)

(declare-datatypes ((tuple2!13984 0))(
  ( (tuple2!13985 (_1!7003 (_ BitVec 64)) (_2!7003 V!33859)) )
))
(declare-datatypes ((List!19829 0))(
  ( (Nil!19826) (Cons!19825 (h!20987 tuple2!13984) (t!28192 List!19829)) )
))
(declare-datatypes ((ListLongMap!12681 0))(
  ( (ListLongMap!12682 (toList!6356 List!19829)) )
))
(declare-fun contains!5459 (ListLongMap!12681 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3589 (array!59403 array!59401 (_ BitVec 32) (_ BitVec 32) V!33859 V!33859 (_ BitVec 32) Int) ListLongMap!12681)

(assert (=> b!964750 (contains!5459 (getCurrentListMap!3589 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28570 _keys!1686) i!803))))

(declare-datatypes ((Unit!32293 0))(
  ( (Unit!32294) )
))
(declare-fun lt!431155 () Unit!32293)

(declare-fun lemmaInListMapFromThenInFromMinusOne!41 (array!59403 array!59401 (_ BitVec 32) (_ BitVec 32) V!33859 V!33859 (_ BitVec 32) (_ BitVec 32) Int) Unit!32293)

(assert (=> b!964750 (= lt!431155 (lemmaInListMapFromThenInFromMinusOne!41 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964752 () Bool)

(declare-fun res!645768 () Bool)

(assert (=> b!964752 (=> (not res!645768) (not e!543867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964752 (= res!645768 (validKeyInArray!0 (select (arr!28570 _keys!1686) i!803)))))

(declare-fun b!964753 () Bool)

(declare-fun res!645767 () Bool)

(assert (=> b!964753 (=> (not res!645767) (not e!543867))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964753 (= res!645767 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34480 () Bool)

(declare-fun mapRes!34480 () Bool)

(assert (=> mapIsEmpty!34480 mapRes!34480))

(declare-fun b!964754 () Bool)

(declare-fun res!645771 () Bool)

(assert (=> b!964754 (=> (not res!645771) (not e!543867))))

(assert (=> b!964754 (= res!645771 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29049 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29049 _keys!1686))))))

(declare-fun b!964755 () Bool)

(declare-fun res!645772 () Bool)

(assert (=> b!964755 (=> (not res!645772) (not e!543867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59403 (_ BitVec 32)) Bool)

(assert (=> b!964755 (= res!645772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964756 () Bool)

(declare-fun res!645766 () Bool)

(assert (=> b!964756 (=> (not res!645766) (not e!543867))))

(assert (=> b!964756 (= res!645766 (contains!5459 (getCurrentListMap!3589 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28570 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34480 () Bool)

(declare-fun tp!65684 () Bool)

(assert (=> mapNonEmpty!34480 (= mapRes!34480 (and tp!65684 e!543864))))

(declare-fun mapRest!34480 () (Array (_ BitVec 32) ValueCell!10347))

(declare-fun mapValue!34480 () ValueCell!10347)

(declare-fun mapKey!34480 () (_ BitVec 32))

(assert (=> mapNonEmpty!34480 (= (arr!28569 _values!1400) (store mapRest!34480 mapKey!34480 mapValue!34480))))

(declare-fun b!964757 () Bool)

(assert (=> b!964757 (= e!543869 true)))

(assert (=> b!964757 (contains!5459 (getCurrentListMap!3589 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28570 _keys!1686) i!803))))

(declare-fun lt!431154 () Unit!32293)

(declare-fun lemmaInListMapFromThenInFromSmaller!36 (array!59403 array!59401 (_ BitVec 32) (_ BitVec 32) V!33859 V!33859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32293)

(assert (=> b!964757 (= lt!431154 (lemmaInListMapFromThenInFromSmaller!36 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964758 () Bool)

(declare-fun e!543866 () Bool)

(declare-fun e!543868 () Bool)

(assert (=> b!964758 (= e!543866 (and e!543868 mapRes!34480))))

(declare-fun condMapEmpty!34480 () Bool)

(declare-fun mapDefault!34480 () ValueCell!10347)

(assert (=> b!964758 (= condMapEmpty!34480 (= (arr!28569 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10347)) mapDefault!34480)))))

(declare-fun b!964759 () Bool)

(assert (=> b!964759 (= e!543868 tp_is_empty!21657)))

(declare-fun res!645769 () Bool)

(assert (=> start!82722 (=> (not res!645769) (not e!543867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82722 (= res!645769 (validMask!0 mask!2110))))

(assert (=> start!82722 e!543867))

(assert (=> start!82722 true))

(declare-fun array_inv!22119 (array!59401) Bool)

(assert (=> start!82722 (and (array_inv!22119 _values!1400) e!543866)))

(declare-fun array_inv!22120 (array!59403) Bool)

(assert (=> start!82722 (array_inv!22120 _keys!1686)))

(assert (=> start!82722 tp!65685))

(assert (=> start!82722 tp_is_empty!21657))

(declare-fun b!964751 () Bool)

(declare-fun res!645765 () Bool)

(assert (=> b!964751 (=> (not res!645765) (not e!543867))))

(declare-datatypes ((List!19830 0))(
  ( (Nil!19827) (Cons!19826 (h!20988 (_ BitVec 64)) (t!28193 List!19830)) )
))
(declare-fun arrayNoDuplicates!0 (array!59403 (_ BitVec 32) List!19830) Bool)

(assert (=> b!964751 (= res!645765 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19827))))

(assert (= (and start!82722 res!645769) b!964748))

(assert (= (and b!964748 res!645764) b!964755))

(assert (= (and b!964755 res!645772) b!964751))

(assert (= (and b!964751 res!645765) b!964754))

(assert (= (and b!964754 res!645771) b!964752))

(assert (= (and b!964752 res!645768) b!964756))

(assert (= (and b!964756 res!645766) b!964753))

(assert (= (and b!964753 res!645767) b!964750))

(assert (= (and b!964750 (not res!645770)) b!964757))

(assert (= (and b!964758 condMapEmpty!34480) mapIsEmpty!34480))

(assert (= (and b!964758 (not condMapEmpty!34480)) mapNonEmpty!34480))

(get-info :version)

(assert (= (and mapNonEmpty!34480 ((_ is ValueCellFull!10347) mapValue!34480)) b!964749))

(assert (= (and b!964758 ((_ is ValueCellFull!10347) mapDefault!34480)) b!964759))

(assert (= start!82722 b!964758))

(declare-fun m!893969 () Bool)

(assert (=> mapNonEmpty!34480 m!893969))

(declare-fun m!893971 () Bool)

(assert (=> start!82722 m!893971))

(declare-fun m!893973 () Bool)

(assert (=> start!82722 m!893973))

(declare-fun m!893975 () Bool)

(assert (=> start!82722 m!893975))

(declare-fun m!893977 () Bool)

(assert (=> b!964755 m!893977))

(declare-fun m!893979 () Bool)

(assert (=> b!964756 m!893979))

(declare-fun m!893981 () Bool)

(assert (=> b!964756 m!893981))

(assert (=> b!964756 m!893979))

(assert (=> b!964756 m!893981))

(declare-fun m!893983 () Bool)

(assert (=> b!964756 m!893983))

(assert (=> b!964752 m!893981))

(assert (=> b!964752 m!893981))

(declare-fun m!893985 () Bool)

(assert (=> b!964752 m!893985))

(declare-fun m!893987 () Bool)

(assert (=> b!964751 m!893987))

(declare-fun m!893989 () Bool)

(assert (=> b!964750 m!893989))

(assert (=> b!964750 m!893981))

(assert (=> b!964750 m!893989))

(assert (=> b!964750 m!893981))

(declare-fun m!893991 () Bool)

(assert (=> b!964750 m!893991))

(declare-fun m!893993 () Bool)

(assert (=> b!964750 m!893993))

(declare-fun m!893995 () Bool)

(assert (=> b!964757 m!893995))

(assert (=> b!964757 m!893981))

(assert (=> b!964757 m!893995))

(assert (=> b!964757 m!893981))

(declare-fun m!893997 () Bool)

(assert (=> b!964757 m!893997))

(declare-fun m!893999 () Bool)

(assert (=> b!964757 m!893999))

(check-sat (not mapNonEmpty!34480) (not b_next!18855) (not b!964755) (not b!964750) b_and!30343 (not b!964752) tp_is_empty!21657 (not start!82722) (not b!964757) (not b!964751) (not b!964756))
(check-sat b_and!30343 (not b_next!18855))
