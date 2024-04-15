; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82918 () Bool)

(assert start!82918)

(declare-fun b_free!19063 () Bool)

(declare-fun b_next!19063 () Bool)

(assert (=> start!82918 (= b_free!19063 (not b_next!19063))))

(declare-fun tp!66319 () Bool)

(declare-fun b_and!30525 () Bool)

(assert (=> start!82918 (= tp!66319 b_and!30525)))

(declare-fun b!967639 () Bool)

(declare-fun e!545334 () Bool)

(declare-fun tp_is_empty!21871 () Bool)

(assert (=> b!967639 (= e!545334 tp_is_empty!21871)))

(declare-fun b!967640 () Bool)

(declare-fun e!545336 () Bool)

(declare-fun e!545335 () Bool)

(declare-fun mapRes!34801 () Bool)

(assert (=> b!967640 (= e!545336 (and e!545335 mapRes!34801))))

(declare-fun condMapEmpty!34801 () Bool)

(declare-datatypes ((V!34145 0))(
  ( (V!34146 (val!10986 Int)) )
))
(declare-datatypes ((ValueCell!10454 0))(
  ( (ValueCellFull!10454 (v!13543 V!34145)) (EmptyCell!10454) )
))
(declare-datatypes ((array!59746 0))(
  ( (array!59747 (arr!28742 (Array (_ BitVec 32) ValueCell!10454)) (size!29223 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59746)

(declare-fun mapDefault!34801 () ValueCell!10454)

(assert (=> b!967640 (= condMapEmpty!34801 (= (arr!28742 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10454)) mapDefault!34801)))))

(declare-fun b!967641 () Bool)

(declare-fun res!647828 () Bool)

(declare-fun e!545338 () Bool)

(assert (=> b!967641 (=> (not res!647828) (not e!545338))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59748 0))(
  ( (array!59749 (arr!28743 (Array (_ BitVec 32) (_ BitVec 64))) (size!29224 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59748)

(declare-fun minValue!1342 () V!34145)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34145)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14210 0))(
  ( (tuple2!14211 (_1!7116 (_ BitVec 64)) (_2!7116 V!34145)) )
))
(declare-datatypes ((List!20011 0))(
  ( (Nil!20008) (Cons!20007 (h!21169 tuple2!14210) (t!28365 List!20011)) )
))
(declare-datatypes ((ListLongMap!12897 0))(
  ( (ListLongMap!12898 (toList!6464 List!20011)) )
))
(declare-fun contains!5509 (ListLongMap!12897 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3626 (array!59748 array!59746 (_ BitVec 32) (_ BitVec 32) V!34145 V!34145 (_ BitVec 32) Int) ListLongMap!12897)

(assert (=> b!967641 (= res!647828 (contains!5509 (getCurrentListMap!3626 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28743 _keys!1686) i!803)))))

(declare-fun res!647822 () Bool)

(assert (=> start!82918 (=> (not res!647822) (not e!545338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82918 (= res!647822 (validMask!0 mask!2110))))

(assert (=> start!82918 e!545338))

(assert (=> start!82918 true))

(declare-fun array_inv!22321 (array!59746) Bool)

(assert (=> start!82918 (and (array_inv!22321 _values!1400) e!545336)))

(declare-fun array_inv!22322 (array!59748) Bool)

(assert (=> start!82918 (array_inv!22322 _keys!1686)))

(assert (=> start!82918 tp!66319))

(assert (=> start!82918 tp_is_empty!21871))

(declare-fun b!967642 () Bool)

(declare-fun res!647826 () Bool)

(assert (=> b!967642 (=> (not res!647826) (not e!545338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59748 (_ BitVec 32)) Bool)

(assert (=> b!967642 (= res!647826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967643 () Bool)

(declare-fun res!647821 () Bool)

(assert (=> b!967643 (=> (not res!647821) (not e!545338))))

(assert (=> b!967643 (= res!647821 (and (= (size!29223 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29224 _keys!1686) (size!29223 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967644 () Bool)

(declare-fun res!647827 () Bool)

(assert (=> b!967644 (=> (not res!647827) (not e!545338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967644 (= res!647827 (validKeyInArray!0 (select (arr!28743 _keys!1686) i!803)))))

(declare-fun b!967645 () Bool)

(assert (=> b!967645 (= e!545335 tp_is_empty!21871)))

(declare-fun b!967646 () Bool)

(declare-fun res!647825 () Bool)

(assert (=> b!967646 (=> (not res!647825) (not e!545338))))

(declare-datatypes ((List!20012 0))(
  ( (Nil!20009) (Cons!20008 (h!21170 (_ BitVec 64)) (t!28366 List!20012)) )
))
(declare-fun arrayNoDuplicates!0 (array!59748 (_ BitVec 32) List!20012) Bool)

(assert (=> b!967646 (= res!647825 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!20009))))

(declare-fun b!967647 () Bool)

(declare-fun res!647824 () Bool)

(assert (=> b!967647 (=> (not res!647824) (not e!545338))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967647 (= res!647824 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967648 () Bool)

(declare-fun res!647823 () Bool)

(assert (=> b!967648 (=> (not res!647823) (not e!545338))))

(assert (=> b!967648 (= res!647823 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29224 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29224 _keys!1686))))))

(declare-fun mapIsEmpty!34801 () Bool)

(assert (=> mapIsEmpty!34801 mapRes!34801))

(declare-fun b!967649 () Bool)

(assert (=> b!967649 (= e!545338 (not true))))

(assert (=> b!967649 (contains!5509 (getCurrentListMap!3626 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28743 _keys!1686) i!803))))

(declare-datatypes ((Unit!32216 0))(
  ( (Unit!32217) )
))
(declare-fun lt!431225 () Unit!32216)

(declare-fun lemmaInListMapFromThenInFromMinusOne!72 (array!59748 array!59746 (_ BitVec 32) (_ BitVec 32) V!34145 V!34145 (_ BitVec 32) (_ BitVec 32) Int) Unit!32216)

(assert (=> b!967649 (= lt!431225 (lemmaInListMapFromThenInFromMinusOne!72 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34801 () Bool)

(declare-fun tp!66318 () Bool)

(assert (=> mapNonEmpty!34801 (= mapRes!34801 (and tp!66318 e!545334))))

(declare-fun mapRest!34801 () (Array (_ BitVec 32) ValueCell!10454))

(declare-fun mapKey!34801 () (_ BitVec 32))

(declare-fun mapValue!34801 () ValueCell!10454)

(assert (=> mapNonEmpty!34801 (= (arr!28742 _values!1400) (store mapRest!34801 mapKey!34801 mapValue!34801))))

(assert (= (and start!82918 res!647822) b!967643))

(assert (= (and b!967643 res!647821) b!967642))

(assert (= (and b!967642 res!647826) b!967646))

(assert (= (and b!967646 res!647825) b!967648))

(assert (= (and b!967648 res!647823) b!967644))

(assert (= (and b!967644 res!647827) b!967641))

(assert (= (and b!967641 res!647828) b!967647))

(assert (= (and b!967647 res!647824) b!967649))

(assert (= (and b!967640 condMapEmpty!34801) mapIsEmpty!34801))

(assert (= (and b!967640 (not condMapEmpty!34801)) mapNonEmpty!34801))

(get-info :version)

(assert (= (and mapNonEmpty!34801 ((_ is ValueCellFull!10454) mapValue!34801)) b!967639))

(assert (= (and b!967640 ((_ is ValueCellFull!10454) mapDefault!34801)) b!967645))

(assert (= start!82918 b!967640))

(declare-fun m!895579 () Bool)

(assert (=> b!967642 m!895579))

(declare-fun m!895581 () Bool)

(assert (=> start!82918 m!895581))

(declare-fun m!895583 () Bool)

(assert (=> start!82918 m!895583))

(declare-fun m!895585 () Bool)

(assert (=> start!82918 m!895585))

(declare-fun m!895587 () Bool)

(assert (=> b!967641 m!895587))

(declare-fun m!895589 () Bool)

(assert (=> b!967641 m!895589))

(assert (=> b!967641 m!895587))

(assert (=> b!967641 m!895589))

(declare-fun m!895591 () Bool)

(assert (=> b!967641 m!895591))

(declare-fun m!895593 () Bool)

(assert (=> b!967649 m!895593))

(assert (=> b!967649 m!895589))

(assert (=> b!967649 m!895593))

(assert (=> b!967649 m!895589))

(declare-fun m!895595 () Bool)

(assert (=> b!967649 m!895595))

(declare-fun m!895597 () Bool)

(assert (=> b!967649 m!895597))

(assert (=> b!967644 m!895589))

(assert (=> b!967644 m!895589))

(declare-fun m!895599 () Bool)

(assert (=> b!967644 m!895599))

(declare-fun m!895601 () Bool)

(assert (=> b!967646 m!895601))

(declare-fun m!895603 () Bool)

(assert (=> mapNonEmpty!34801 m!895603))

(check-sat (not b!967646) tp_is_empty!21871 (not b_next!19063) (not mapNonEmpty!34801) (not b!967649) (not b!967641) b_and!30525 (not start!82918) (not b!967642) (not b!967644))
(check-sat b_and!30525 (not b_next!19063))
