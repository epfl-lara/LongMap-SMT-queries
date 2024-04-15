; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82630 () Bool)

(assert start!82630)

(declare-fun b_free!18781 () Bool)

(declare-fun b_next!18781 () Bool)

(assert (=> start!82630 (= b_free!18781 (not b_next!18781))))

(declare-fun tp!65463 () Bool)

(declare-fun b_and!30243 () Bool)

(assert (=> start!82630 (= tp!65463 b_and!30243)))

(declare-fun mapNonEmpty!34369 () Bool)

(declare-fun mapRes!34369 () Bool)

(declare-fun tp!65464 () Bool)

(declare-fun e!543096 () Bool)

(assert (=> mapNonEmpty!34369 (= mapRes!34369 (and tp!65464 e!543096))))

(declare-datatypes ((V!33761 0))(
  ( (V!33762 (val!10842 Int)) )
))
(declare-datatypes ((ValueCell!10310 0))(
  ( (ValueCellFull!10310 (v!13399 V!33761)) (EmptyCell!10310) )
))
(declare-datatypes ((array!59192 0))(
  ( (array!59193 (arr!28465 (Array (_ BitVec 32) ValueCell!10310)) (size!28946 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59192)

(declare-fun mapKey!34369 () (_ BitVec 32))

(declare-fun mapValue!34369 () ValueCell!10310)

(declare-fun mapRest!34369 () (Array (_ BitVec 32) ValueCell!10310))

(assert (=> mapNonEmpty!34369 (= (arr!28465 _values!1400) (store mapRest!34369 mapKey!34369 mapValue!34369))))

(declare-fun b!963220 () Bool)

(declare-fun res!644703 () Bool)

(declare-fun e!543095 () Bool)

(assert (=> b!963220 (=> (not res!644703) (not e!543095))))

(declare-datatypes ((array!59194 0))(
  ( (array!59195 (arr!28466 (Array (_ BitVec 32) (_ BitVec 64))) (size!28947 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59194)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963220 (= res!644703 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28947 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28947 _keys!1686))))))

(declare-fun b!963221 () Bool)

(declare-fun res!644699 () Bool)

(assert (=> b!963221 (=> (not res!644699) (not e!543095))))

(assert (=> b!963221 (= res!644699 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963222 () Bool)

(declare-fun res!644705 () Bool)

(assert (=> b!963222 (=> (not res!644705) (not e!543095))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963222 (= res!644705 (and (= (size!28946 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28947 _keys!1686) (size!28946 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963223 () Bool)

(declare-fun res!644704 () Bool)

(assert (=> b!963223 (=> (not res!644704) (not e!543095))))

(declare-fun minValue!1342 () V!33761)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33761)

(declare-datatypes ((tuple2!13992 0))(
  ( (tuple2!13993 (_1!7007 (_ BitVec 64)) (_2!7007 V!33761)) )
))
(declare-datatypes ((List!19801 0))(
  ( (Nil!19798) (Cons!19797 (h!20959 tuple2!13992) (t!28155 List!19801)) )
))
(declare-datatypes ((ListLongMap!12679 0))(
  ( (ListLongMap!12680 (toList!6355 List!19801)) )
))
(declare-fun contains!5402 (ListLongMap!12679 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3517 (array!59194 array!59192 (_ BitVec 32) (_ BitVec 32) V!33761 V!33761 (_ BitVec 32) Int) ListLongMap!12679)

(assert (=> b!963223 (= res!644704 (contains!5402 (getCurrentListMap!3517 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28466 _keys!1686) i!803)))))

(declare-fun res!644698 () Bool)

(assert (=> start!82630 (=> (not res!644698) (not e!543095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82630 (= res!644698 (validMask!0 mask!2110))))

(assert (=> start!82630 e!543095))

(assert (=> start!82630 true))

(declare-fun e!543094 () Bool)

(declare-fun array_inv!22113 (array!59192) Bool)

(assert (=> start!82630 (and (array_inv!22113 _values!1400) e!543094)))

(declare-fun array_inv!22114 (array!59194) Bool)

(assert (=> start!82630 (array_inv!22114 _keys!1686)))

(assert (=> start!82630 tp!65463))

(declare-fun tp_is_empty!21583 () Bool)

(assert (=> start!82630 tp_is_empty!21583))

(declare-fun b!963224 () Bool)

(declare-fun res!644701 () Bool)

(assert (=> b!963224 (=> (not res!644701) (not e!543095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963224 (= res!644701 (validKeyInArray!0 (select (arr!28466 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34369 () Bool)

(assert (=> mapIsEmpty!34369 mapRes!34369))

(declare-fun b!963225 () Bool)

(assert (=> b!963225 (= e!543096 tp_is_empty!21583)))

(declare-fun b!963226 () Bool)

(declare-fun res!644702 () Bool)

(assert (=> b!963226 (=> (not res!644702) (not e!543095))))

(declare-datatypes ((List!19802 0))(
  ( (Nil!19799) (Cons!19798 (h!20960 (_ BitVec 64)) (t!28156 List!19802)) )
))
(declare-fun arrayNoDuplicates!0 (array!59194 (_ BitVec 32) List!19802) Bool)

(assert (=> b!963226 (= res!644702 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19799))))

(declare-fun b!963227 () Bool)

(assert (=> b!963227 (= e!543095 (not true))))

(assert (=> b!963227 (contains!5402 (getCurrentListMap!3517 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28466 _keys!1686) i!803))))

(declare-datatypes ((Unit!32098 0))(
  ( (Unit!32099) )
))
(declare-fun lt!430739 () Unit!32098)

(declare-fun lemmaInListMapFromThenInFromMinusOne!15 (array!59194 array!59192 (_ BitVec 32) (_ BitVec 32) V!33761 V!33761 (_ BitVec 32) (_ BitVec 32) Int) Unit!32098)

(assert (=> b!963227 (= lt!430739 (lemmaInListMapFromThenInFromMinusOne!15 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963228 () Bool)

(declare-fun e!543097 () Bool)

(assert (=> b!963228 (= e!543097 tp_is_empty!21583)))

(declare-fun b!963229 () Bool)

(declare-fun res!644700 () Bool)

(assert (=> b!963229 (=> (not res!644700) (not e!543095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59194 (_ BitVec 32)) Bool)

(assert (=> b!963229 (= res!644700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963230 () Bool)

(assert (=> b!963230 (= e!543094 (and e!543097 mapRes!34369))))

(declare-fun condMapEmpty!34369 () Bool)

(declare-fun mapDefault!34369 () ValueCell!10310)

(assert (=> b!963230 (= condMapEmpty!34369 (= (arr!28465 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10310)) mapDefault!34369)))))

(assert (= (and start!82630 res!644698) b!963222))

(assert (= (and b!963222 res!644705) b!963229))

(assert (= (and b!963229 res!644700) b!963226))

(assert (= (and b!963226 res!644702) b!963220))

(assert (= (and b!963220 res!644703) b!963224))

(assert (= (and b!963224 res!644701) b!963223))

(assert (= (and b!963223 res!644704) b!963221))

(assert (= (and b!963221 res!644699) b!963227))

(assert (= (and b!963230 condMapEmpty!34369) mapIsEmpty!34369))

(assert (= (and b!963230 (not condMapEmpty!34369)) mapNonEmpty!34369))

(get-info :version)

(assert (= (and mapNonEmpty!34369 ((_ is ValueCellFull!10310) mapValue!34369)) b!963225))

(assert (= (and b!963230 ((_ is ValueCellFull!10310) mapDefault!34369)) b!963228))

(assert (= start!82630 b!963230))

(declare-fun m!892117 () Bool)

(assert (=> b!963223 m!892117))

(declare-fun m!892119 () Bool)

(assert (=> b!963223 m!892119))

(assert (=> b!963223 m!892117))

(assert (=> b!963223 m!892119))

(declare-fun m!892121 () Bool)

(assert (=> b!963223 m!892121))

(declare-fun m!892123 () Bool)

(assert (=> b!963229 m!892123))

(declare-fun m!892125 () Bool)

(assert (=> b!963226 m!892125))

(assert (=> b!963224 m!892119))

(assert (=> b!963224 m!892119))

(declare-fun m!892127 () Bool)

(assert (=> b!963224 m!892127))

(declare-fun m!892129 () Bool)

(assert (=> start!82630 m!892129))

(declare-fun m!892131 () Bool)

(assert (=> start!82630 m!892131))

(declare-fun m!892133 () Bool)

(assert (=> start!82630 m!892133))

(declare-fun m!892135 () Bool)

(assert (=> b!963227 m!892135))

(assert (=> b!963227 m!892119))

(assert (=> b!963227 m!892135))

(assert (=> b!963227 m!892119))

(declare-fun m!892137 () Bool)

(assert (=> b!963227 m!892137))

(declare-fun m!892139 () Bool)

(assert (=> b!963227 m!892139))

(declare-fun m!892141 () Bool)

(assert (=> mapNonEmpty!34369 m!892141))

(check-sat (not b!963223) b_and!30243 (not b!963227) (not b_next!18781) (not b!963224) (not mapNonEmpty!34369) (not start!82630) tp_is_empty!21583 (not b!963226) (not b!963229))
(check-sat b_and!30243 (not b_next!18781))
