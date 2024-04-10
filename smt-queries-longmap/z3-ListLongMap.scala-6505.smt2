; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82872 () Bool)

(assert start!82872)

(declare-fun b_free!18999 () Bool)

(declare-fun b_next!18999 () Bool)

(assert (=> start!82872 (= b_free!18999 (not b_next!18999))))

(declare-fun tp!66125 () Bool)

(declare-fun b_and!30487 () Bool)

(assert (=> start!82872 (= tp!66125 b_and!30487)))

(declare-fun b!966822 () Bool)

(declare-fun res!647166 () Bool)

(declare-fun e!545005 () Bool)

(assert (=> b!966822 (=> (not res!647166) (not e!545005))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34059 0))(
  ( (V!34060 (val!10954 Int)) )
))
(declare-datatypes ((ValueCell!10422 0))(
  ( (ValueCellFull!10422 (v!13512 V!34059)) (EmptyCell!10422) )
))
(declare-datatypes ((array!59691 0))(
  ( (array!59692 (arr!28714 (Array (_ BitVec 32) ValueCell!10422)) (size!29193 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59691)

(declare-datatypes ((array!59693 0))(
  ( (array!59694 (arr!28715 (Array (_ BitVec 32) (_ BitVec 64))) (size!29194 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59693)

(declare-fun minValue!1342 () V!34059)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34059)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-datatypes ((tuple2!14088 0))(
  ( (tuple2!14089 (_1!7055 (_ BitVec 64)) (_2!7055 V!34059)) )
))
(declare-datatypes ((List!19934 0))(
  ( (Nil!19931) (Cons!19930 (h!21092 tuple2!14088) (t!28297 List!19934)) )
))
(declare-datatypes ((ListLongMap!12785 0))(
  ( (ListLongMap!12786 (toList!6408 List!19934)) )
))
(declare-fun contains!5509 (ListLongMap!12785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3641 (array!59693 array!59691 (_ BitVec 32) (_ BitVec 32) V!34059 V!34059 (_ BitVec 32) Int) ListLongMap!12785)

(assert (=> b!966822 (= res!647166 (contains!5509 (getCurrentListMap!3641 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28715 _keys!1686) i!803)))))

(declare-fun b!966823 () Bool)

(declare-fun e!545004 () Bool)

(declare-fun tp_is_empty!21807 () Bool)

(assert (=> b!966823 (= e!545004 tp_is_empty!21807)))

(declare-fun b!966824 () Bool)

(declare-fun res!647164 () Bool)

(assert (=> b!966824 (=> (not res!647164) (not e!545005))))

(declare-datatypes ((List!19935 0))(
  ( (Nil!19932) (Cons!19931 (h!21093 (_ BitVec 64)) (t!28298 List!19935)) )
))
(declare-fun arrayNoDuplicates!0 (array!59693 (_ BitVec 32) List!19935) Bool)

(assert (=> b!966824 (= res!647164 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19932))))

(declare-fun b!966825 () Bool)

(declare-fun res!647169 () Bool)

(assert (=> b!966825 (=> (not res!647169) (not e!545005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966825 (= res!647169 (validKeyInArray!0 (select (arr!28715 _keys!1686) i!803)))))

(declare-fun b!966826 () Bool)

(declare-fun res!647168 () Bool)

(assert (=> b!966826 (=> (not res!647168) (not e!545005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59693 (_ BitVec 32)) Bool)

(assert (=> b!966826 (= res!647168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966827 () Bool)

(assert (=> b!966827 (= e!545005 (not true))))

(assert (=> b!966827 (contains!5509 (getCurrentListMap!3641 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28715 _keys!1686) i!803))))

(declare-datatypes ((Unit!32303 0))(
  ( (Unit!32304) )
))
(declare-fun lt!431365 () Unit!32303)

(declare-fun lemmaInListMapFromThenInFromMinusOne!46 (array!59693 array!59691 (_ BitVec 32) (_ BitVec 32) V!34059 V!34059 (_ BitVec 32) (_ BitVec 32) Int) Unit!32303)

(assert (=> b!966827 (= lt!431365 (lemmaInListMapFromThenInFromMinusOne!46 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34705 () Bool)

(declare-fun mapRes!34705 () Bool)

(assert (=> mapIsEmpty!34705 mapRes!34705))

(declare-fun b!966828 () Bool)

(declare-fun e!545006 () Bool)

(assert (=> b!966828 (= e!545006 tp_is_empty!21807)))

(declare-fun res!647165 () Bool)

(assert (=> start!82872 (=> (not res!647165) (not e!545005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82872 (= res!647165 (validMask!0 mask!2110))))

(assert (=> start!82872 e!545005))

(assert (=> start!82872 true))

(declare-fun e!545002 () Bool)

(declare-fun array_inv!22241 (array!59691) Bool)

(assert (=> start!82872 (and (array_inv!22241 _values!1400) e!545002)))

(declare-fun array_inv!22242 (array!59693) Bool)

(assert (=> start!82872 (array_inv!22242 _keys!1686)))

(assert (=> start!82872 tp!66125))

(assert (=> start!82872 tp_is_empty!21807))

(declare-fun b!966829 () Bool)

(assert (=> b!966829 (= e!545002 (and e!545006 mapRes!34705))))

(declare-fun condMapEmpty!34705 () Bool)

(declare-fun mapDefault!34705 () ValueCell!10422)

(assert (=> b!966829 (= condMapEmpty!34705 (= (arr!28714 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10422)) mapDefault!34705)))))

(declare-fun mapNonEmpty!34705 () Bool)

(declare-fun tp!66126 () Bool)

(assert (=> mapNonEmpty!34705 (= mapRes!34705 (and tp!66126 e!545004))))

(declare-fun mapValue!34705 () ValueCell!10422)

(declare-fun mapKey!34705 () (_ BitVec 32))

(declare-fun mapRest!34705 () (Array (_ BitVec 32) ValueCell!10422))

(assert (=> mapNonEmpty!34705 (= (arr!28714 _values!1400) (store mapRest!34705 mapKey!34705 mapValue!34705))))

(declare-fun b!966830 () Bool)

(declare-fun res!647170 () Bool)

(assert (=> b!966830 (=> (not res!647170) (not e!545005))))

(assert (=> b!966830 (= res!647170 (and (= (size!29193 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29194 _keys!1686) (size!29193 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966831 () Bool)

(declare-fun res!647163 () Bool)

(assert (=> b!966831 (=> (not res!647163) (not e!545005))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966831 (= res!647163 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29194 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29194 _keys!1686))))))

(declare-fun b!966832 () Bool)

(declare-fun res!647167 () Bool)

(assert (=> b!966832 (=> (not res!647167) (not e!545005))))

(assert (=> b!966832 (= res!647167 (bvsgt from!2084 newFrom!159))))

(assert (= (and start!82872 res!647165) b!966830))

(assert (= (and b!966830 res!647170) b!966826))

(assert (= (and b!966826 res!647168) b!966824))

(assert (= (and b!966824 res!647164) b!966831))

(assert (= (and b!966831 res!647163) b!966825))

(assert (= (and b!966825 res!647169) b!966822))

(assert (= (and b!966822 res!647166) b!966832))

(assert (= (and b!966832 res!647167) b!966827))

(assert (= (and b!966829 condMapEmpty!34705) mapIsEmpty!34705))

(assert (= (and b!966829 (not condMapEmpty!34705)) mapNonEmpty!34705))

(get-info :version)

(assert (= (and mapNonEmpty!34705 ((_ is ValueCellFull!10422) mapValue!34705)) b!966823))

(assert (= (and b!966829 ((_ is ValueCellFull!10422) mapDefault!34705)) b!966828))

(assert (= start!82872 b!966829))

(declare-fun m!895505 () Bool)

(assert (=> start!82872 m!895505))

(declare-fun m!895507 () Bool)

(assert (=> start!82872 m!895507))

(declare-fun m!895509 () Bool)

(assert (=> start!82872 m!895509))

(declare-fun m!895511 () Bool)

(assert (=> b!966827 m!895511))

(declare-fun m!895513 () Bool)

(assert (=> b!966827 m!895513))

(assert (=> b!966827 m!895511))

(assert (=> b!966827 m!895513))

(declare-fun m!895515 () Bool)

(assert (=> b!966827 m!895515))

(declare-fun m!895517 () Bool)

(assert (=> b!966827 m!895517))

(declare-fun m!895519 () Bool)

(assert (=> mapNonEmpty!34705 m!895519))

(declare-fun m!895521 () Bool)

(assert (=> b!966826 m!895521))

(declare-fun m!895523 () Bool)

(assert (=> b!966824 m!895523))

(assert (=> b!966825 m!895513))

(assert (=> b!966825 m!895513))

(declare-fun m!895525 () Bool)

(assert (=> b!966825 m!895525))

(declare-fun m!895527 () Bool)

(assert (=> b!966822 m!895527))

(assert (=> b!966822 m!895513))

(assert (=> b!966822 m!895527))

(assert (=> b!966822 m!895513))

(declare-fun m!895529 () Bool)

(assert (=> b!966822 m!895529))

(check-sat (not b!966825) (not b!966826) (not mapNonEmpty!34705) b_and!30487 (not b!966824) (not b_next!18999) tp_is_empty!21807 (not b!966827) (not b!966822) (not start!82872))
(check-sat b_and!30487 (not b_next!18999))
