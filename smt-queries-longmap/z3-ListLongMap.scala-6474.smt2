; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82666 () Bool)

(assert start!82666)

(declare-fun b_free!18817 () Bool)

(declare-fun b_next!18817 () Bool)

(assert (=> start!82666 (= b_free!18817 (not b_next!18817))))

(declare-fun tp!65571 () Bool)

(declare-fun b_and!30279 () Bool)

(assert (=> start!82666 (= tp!65571 b_and!30279)))

(declare-fun res!645149 () Bool)

(declare-fun e!543378 () Bool)

(assert (=> start!82666 (=> (not res!645149) (not e!543378))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82666 (= res!645149 (validMask!0 mask!2110))))

(assert (=> start!82666 e!543378))

(assert (=> start!82666 true))

(declare-datatypes ((V!33809 0))(
  ( (V!33810 (val!10860 Int)) )
))
(declare-datatypes ((ValueCell!10328 0))(
  ( (ValueCellFull!10328 (v!13417 V!33809)) (EmptyCell!10328) )
))
(declare-datatypes ((array!59262 0))(
  ( (array!59263 (arr!28500 (Array (_ BitVec 32) ValueCell!10328)) (size!28981 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59262)

(declare-fun e!543379 () Bool)

(declare-fun array_inv!22137 (array!59262) Bool)

(assert (=> start!82666 (and (array_inv!22137 _values!1400) e!543379)))

(declare-datatypes ((array!59264 0))(
  ( (array!59265 (arr!28501 (Array (_ BitVec 32) (_ BitVec 64))) (size!28982 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59264)

(declare-fun array_inv!22138 (array!59264) Bool)

(assert (=> start!82666 (array_inv!22138 _keys!1686)))

(assert (=> start!82666 tp!65571))

(declare-fun tp_is_empty!21619 () Bool)

(assert (=> start!82666 tp_is_empty!21619))

(declare-fun mapNonEmpty!34423 () Bool)

(declare-fun mapRes!34423 () Bool)

(declare-fun tp!65572 () Bool)

(declare-fun e!543377 () Bool)

(assert (=> mapNonEmpty!34423 (= mapRes!34423 (and tp!65572 e!543377))))

(declare-fun mapKey!34423 () (_ BitVec 32))

(declare-fun mapValue!34423 () ValueCell!10328)

(declare-fun mapRest!34423 () (Array (_ BitVec 32) ValueCell!10328))

(assert (=> mapNonEmpty!34423 (= (arr!28500 _values!1400) (store mapRest!34423 mapKey!34423 mapValue!34423))))

(declare-fun b!963825 () Bool)

(declare-fun res!645148 () Bool)

(assert (=> b!963825 (=> (not res!645148) (not e!543378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59264 (_ BitVec 32)) Bool)

(assert (=> b!963825 (= res!645148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963826 () Bool)

(declare-fun res!645143 () Bool)

(assert (=> b!963826 (=> (not res!645143) (not e!543378))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!963826 (= res!645143 (and (= (size!28981 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28982 _keys!1686) (size!28981 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34423 () Bool)

(assert (=> mapIsEmpty!34423 mapRes!34423))

(declare-fun b!963827 () Bool)

(declare-fun res!645142 () Bool)

(assert (=> b!963827 (=> (not res!645142) (not e!543378))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!963827 (= res!645142 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28982 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28982 _keys!1686))))))

(declare-fun b!963828 () Bool)

(assert (=> b!963828 (= e!543377 tp_is_empty!21619)))

(declare-fun b!963829 () Bool)

(declare-fun e!543374 () Bool)

(assert (=> b!963829 (= e!543378 (not e!543374))))

(declare-fun res!645147 () Bool)

(assert (=> b!963829 (=> res!645147 e!543374)))

(assert (=> b!963829 (= res!645147 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!28982 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun minValue!1342 () V!33809)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33809)

(declare-datatypes ((tuple2!14022 0))(
  ( (tuple2!14023 (_1!7022 (_ BitVec 64)) (_2!7022 V!33809)) )
))
(declare-datatypes ((List!19830 0))(
  ( (Nil!19827) (Cons!19826 (h!20988 tuple2!14022) (t!28184 List!19830)) )
))
(declare-datatypes ((ListLongMap!12709 0))(
  ( (ListLongMap!12710 (toList!6370 List!19830)) )
))
(declare-fun contains!5417 (ListLongMap!12709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3532 (array!59264 array!59262 (_ BitVec 32) (_ BitVec 32) V!33809 V!33809 (_ BitVec 32) Int) ListLongMap!12709)

(assert (=> b!963829 (contains!5417 (getCurrentListMap!3532 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28501 _keys!1686) i!803))))

(declare-datatypes ((Unit!32126 0))(
  ( (Unit!32127) )
))
(declare-fun lt!430805 () Unit!32126)

(declare-fun lemmaInListMapFromThenInFromMinusOne!29 (array!59264 array!59262 (_ BitVec 32) (_ BitVec 32) V!33809 V!33809 (_ BitVec 32) (_ BitVec 32) Int) Unit!32126)

(assert (=> b!963829 (= lt!430805 (lemmaInListMapFromThenInFromMinusOne!29 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963830 () Bool)

(declare-fun res!645146 () Bool)

(assert (=> b!963830 (=> (not res!645146) (not e!543378))))

(assert (=> b!963830 (= res!645146 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963831 () Bool)

(declare-fun res!645144 () Bool)

(assert (=> b!963831 (=> (not res!645144) (not e!543378))))

(assert (=> b!963831 (= res!645144 (contains!5417 (getCurrentListMap!3532 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28501 _keys!1686) i!803)))))

(declare-fun b!963832 () Bool)

(assert (=> b!963832 (= e!543374 true)))

(assert (=> b!963832 (contains!5417 (getCurrentListMap!3532 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28501 _keys!1686) i!803))))

(declare-fun lt!430804 () Unit!32126)

(declare-fun lemmaInListMapFromThenInFromSmaller!25 (array!59264 array!59262 (_ BitVec 32) (_ BitVec 32) V!33809 V!33809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32126)

(assert (=> b!963832 (= lt!430804 (lemmaInListMapFromThenInFromSmaller!25 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!963833 () Bool)

(declare-fun res!645141 () Bool)

(assert (=> b!963833 (=> (not res!645141) (not e!543378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963833 (= res!645141 (validKeyInArray!0 (select (arr!28501 _keys!1686) i!803)))))

(declare-fun b!963834 () Bool)

(declare-fun e!543375 () Bool)

(assert (=> b!963834 (= e!543379 (and e!543375 mapRes!34423))))

(declare-fun condMapEmpty!34423 () Bool)

(declare-fun mapDefault!34423 () ValueCell!10328)

(assert (=> b!963834 (= condMapEmpty!34423 (= (arr!28500 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10328)) mapDefault!34423)))))

(declare-fun b!963835 () Bool)

(declare-fun res!645145 () Bool)

(assert (=> b!963835 (=> (not res!645145) (not e!543378))))

(declare-datatypes ((List!19831 0))(
  ( (Nil!19828) (Cons!19827 (h!20989 (_ BitVec 64)) (t!28185 List!19831)) )
))
(declare-fun arrayNoDuplicates!0 (array!59264 (_ BitVec 32) List!19831) Bool)

(assert (=> b!963835 (= res!645145 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19828))))

(declare-fun b!963836 () Bool)

(assert (=> b!963836 (= e!543375 tp_is_empty!21619)))

(assert (= (and start!82666 res!645149) b!963826))

(assert (= (and b!963826 res!645143) b!963825))

(assert (= (and b!963825 res!645148) b!963835))

(assert (= (and b!963835 res!645145) b!963827))

(assert (= (and b!963827 res!645142) b!963833))

(assert (= (and b!963833 res!645141) b!963831))

(assert (= (and b!963831 res!645144) b!963830))

(assert (= (and b!963830 res!645146) b!963829))

(assert (= (and b!963829 (not res!645147)) b!963832))

(assert (= (and b!963834 condMapEmpty!34423) mapIsEmpty!34423))

(assert (= (and b!963834 (not condMapEmpty!34423)) mapNonEmpty!34423))

(get-info :version)

(assert (= (and mapNonEmpty!34423 ((_ is ValueCellFull!10328) mapValue!34423)) b!963828))

(assert (= (and b!963834 ((_ is ValueCellFull!10328) mapDefault!34423)) b!963836))

(assert (= start!82666 b!963834))

(declare-fun m!892603 () Bool)

(assert (=> mapNonEmpty!34423 m!892603))

(declare-fun m!892605 () Bool)

(assert (=> b!963825 m!892605))

(declare-fun m!892607 () Bool)

(assert (=> b!963833 m!892607))

(assert (=> b!963833 m!892607))

(declare-fun m!892609 () Bool)

(assert (=> b!963833 m!892609))

(declare-fun m!892611 () Bool)

(assert (=> b!963831 m!892611))

(assert (=> b!963831 m!892607))

(assert (=> b!963831 m!892611))

(assert (=> b!963831 m!892607))

(declare-fun m!892613 () Bool)

(assert (=> b!963831 m!892613))

(declare-fun m!892615 () Bool)

(assert (=> start!82666 m!892615))

(declare-fun m!892617 () Bool)

(assert (=> start!82666 m!892617))

(declare-fun m!892619 () Bool)

(assert (=> start!82666 m!892619))

(declare-fun m!892621 () Bool)

(assert (=> b!963835 m!892621))

(declare-fun m!892623 () Bool)

(assert (=> b!963829 m!892623))

(assert (=> b!963829 m!892607))

(assert (=> b!963829 m!892623))

(assert (=> b!963829 m!892607))

(declare-fun m!892625 () Bool)

(assert (=> b!963829 m!892625))

(declare-fun m!892627 () Bool)

(assert (=> b!963829 m!892627))

(declare-fun m!892629 () Bool)

(assert (=> b!963832 m!892629))

(assert (=> b!963832 m!892607))

(assert (=> b!963832 m!892629))

(assert (=> b!963832 m!892607))

(declare-fun m!892631 () Bool)

(assert (=> b!963832 m!892631))

(declare-fun m!892633 () Bool)

(assert (=> b!963832 m!892633))

(check-sat (not b_next!18817) b_and!30279 (not b!963831) (not mapNonEmpty!34423) (not start!82666) (not b!963832) (not b!963829) (not b!963833) (not b!963825) (not b!963835) tp_is_empty!21619)
(check-sat b_and!30279 (not b_next!18817))
