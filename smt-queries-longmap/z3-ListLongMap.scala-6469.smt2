; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82656 () Bool)

(assert start!82656)

(declare-fun b_free!18789 () Bool)

(declare-fun b_next!18789 () Bool)

(assert (=> start!82656 (= b_free!18789 (not b_next!18789))))

(declare-fun tp!65486 () Bool)

(declare-fun b_and!30277 () Bool)

(assert (=> start!82656 (= tp!65486 b_and!30277)))

(declare-fun b!963591 () Bool)

(declare-fun res!644906 () Bool)

(declare-fun e!543304 () Bool)

(assert (=> b!963591 (=> (not res!644906) (not e!543304))))

(declare-datatypes ((array!59273 0))(
  ( (array!59274 (arr!28505 (Array (_ BitVec 32) (_ BitVec 64))) (size!28984 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59273)

(declare-datatypes ((List!19782 0))(
  ( (Nil!19779) (Cons!19778 (h!20940 (_ BitVec 64)) (t!28145 List!19782)) )
))
(declare-fun arrayNoDuplicates!0 (array!59273 (_ BitVec 32) List!19782) Bool)

(assert (=> b!963591 (= res!644906 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19779))))

(declare-fun b!963592 () Bool)

(declare-fun res!644907 () Bool)

(assert (=> b!963592 (=> (not res!644907) (not e!543304))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33771 0))(
  ( (V!33772 (val!10846 Int)) )
))
(declare-datatypes ((ValueCell!10314 0))(
  ( (ValueCellFull!10314 (v!13404 V!33771)) (EmptyCell!10314) )
))
(declare-datatypes ((array!59275 0))(
  ( (array!59276 (arr!28506 (Array (_ BitVec 32) ValueCell!10314)) (size!28985 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59275)

(declare-fun minValue!1342 () V!33771)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33771)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13932 0))(
  ( (tuple2!13933 (_1!6977 (_ BitVec 64)) (_2!6977 V!33771)) )
))
(declare-datatypes ((List!19783 0))(
  ( (Nil!19780) (Cons!19779 (h!20941 tuple2!13932) (t!28146 List!19783)) )
))
(declare-datatypes ((ListLongMap!12629 0))(
  ( (ListLongMap!12630 (toList!6330 List!19783)) )
))
(declare-fun contains!5433 (ListLongMap!12629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3563 (array!59273 array!59275 (_ BitVec 32) (_ BitVec 32) V!33771 V!33771 (_ BitVec 32) Int) ListLongMap!12629)

(assert (=> b!963592 (= res!644907 (contains!5433 (getCurrentListMap!3563 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28505 _keys!1686) i!803)))))

(declare-fun b!963593 () Bool)

(declare-fun res!644908 () Bool)

(assert (=> b!963593 (=> (not res!644908) (not e!543304))))

(assert (=> b!963593 (= res!644908 (and (= (size!28985 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28984 _keys!1686) (size!28985 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963594 () Bool)

(declare-fun res!644910 () Bool)

(assert (=> b!963594 (=> (not res!644910) (not e!543304))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963594 (= res!644910 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963595 () Bool)

(declare-fun e!543302 () Bool)

(declare-fun e!543303 () Bool)

(declare-fun mapRes!34381 () Bool)

(assert (=> b!963595 (= e!543302 (and e!543303 mapRes!34381))))

(declare-fun condMapEmpty!34381 () Bool)

(declare-fun mapDefault!34381 () ValueCell!10314)

(assert (=> b!963595 (= condMapEmpty!34381 (= (arr!28506 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10314)) mapDefault!34381)))))

(declare-fun b!963596 () Bool)

(declare-fun res!644909 () Bool)

(assert (=> b!963596 (=> (not res!644909) (not e!543304))))

(assert (=> b!963596 (= res!644909 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28984 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28984 _keys!1686))))))

(declare-fun b!963597 () Bool)

(declare-fun res!644904 () Bool)

(assert (=> b!963597 (=> (not res!644904) (not e!543304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59273 (_ BitVec 32)) Bool)

(assert (=> b!963597 (= res!644904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963598 () Bool)

(assert (=> b!963598 (= e!543304 (not true))))

(assert (=> b!963598 (contains!5433 (getCurrentListMap!3563 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28505 _keys!1686) i!803))))

(declare-datatypes ((Unit!32243 0))(
  ( (Unit!32244) )
))
(declare-fun lt!430987 () Unit!32243)

(declare-fun lemmaInListMapFromThenInFromMinusOne!16 (array!59273 array!59275 (_ BitVec 32) (_ BitVec 32) V!33771 V!33771 (_ BitVec 32) (_ BitVec 32) Int) Unit!32243)

(assert (=> b!963598 (= lt!430987 (lemmaInListMapFromThenInFromMinusOne!16 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34381 () Bool)

(assert (=> mapIsEmpty!34381 mapRes!34381))

(declare-fun b!963599 () Bool)

(declare-fun e!543301 () Bool)

(declare-fun tp_is_empty!21591 () Bool)

(assert (=> b!963599 (= e!543301 tp_is_empty!21591)))

(declare-fun mapNonEmpty!34381 () Bool)

(declare-fun tp!65487 () Bool)

(assert (=> mapNonEmpty!34381 (= mapRes!34381 (and tp!65487 e!543301))))

(declare-fun mapValue!34381 () ValueCell!10314)

(declare-fun mapKey!34381 () (_ BitVec 32))

(declare-fun mapRest!34381 () (Array (_ BitVec 32) ValueCell!10314))

(assert (=> mapNonEmpty!34381 (= (arr!28506 _values!1400) (store mapRest!34381 mapKey!34381 mapValue!34381))))

(declare-fun res!644911 () Bool)

(assert (=> start!82656 (=> (not res!644911) (not e!543304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82656 (= res!644911 (validMask!0 mask!2110))))

(assert (=> start!82656 e!543304))

(assert (=> start!82656 true))

(declare-fun array_inv!22083 (array!59275) Bool)

(assert (=> start!82656 (and (array_inv!22083 _values!1400) e!543302)))

(declare-fun array_inv!22084 (array!59273) Bool)

(assert (=> start!82656 (array_inv!22084 _keys!1686)))

(assert (=> start!82656 tp!65486))

(assert (=> start!82656 tp_is_empty!21591))

(declare-fun b!963600 () Bool)

(assert (=> b!963600 (= e!543303 tp_is_empty!21591)))

(declare-fun b!963601 () Bool)

(declare-fun res!644905 () Bool)

(assert (=> b!963601 (=> (not res!644905) (not e!543304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963601 (= res!644905 (validKeyInArray!0 (select (arr!28505 _keys!1686) i!803)))))

(assert (= (and start!82656 res!644911) b!963593))

(assert (= (and b!963593 res!644908) b!963597))

(assert (= (and b!963597 res!644904) b!963591))

(assert (= (and b!963591 res!644906) b!963596))

(assert (= (and b!963596 res!644909) b!963601))

(assert (= (and b!963601 res!644905) b!963592))

(assert (= (and b!963592 res!644907) b!963594))

(assert (= (and b!963594 res!644910) b!963598))

(assert (= (and b!963595 condMapEmpty!34381) mapIsEmpty!34381))

(assert (= (and b!963595 (not condMapEmpty!34381)) mapNonEmpty!34381))

(get-info :version)

(assert (= (and mapNonEmpty!34381 ((_ is ValueCellFull!10314) mapValue!34381)) b!963599))

(assert (= (and b!963595 ((_ is ValueCellFull!10314) mapDefault!34381)) b!963600))

(assert (= start!82656 b!963595))

(declare-fun m!892979 () Bool)

(assert (=> b!963591 m!892979))

(declare-fun m!892981 () Bool)

(assert (=> b!963601 m!892981))

(assert (=> b!963601 m!892981))

(declare-fun m!892983 () Bool)

(assert (=> b!963601 m!892983))

(declare-fun m!892985 () Bool)

(assert (=> b!963592 m!892985))

(assert (=> b!963592 m!892981))

(assert (=> b!963592 m!892985))

(assert (=> b!963592 m!892981))

(declare-fun m!892987 () Bool)

(assert (=> b!963592 m!892987))

(declare-fun m!892989 () Bool)

(assert (=> b!963598 m!892989))

(assert (=> b!963598 m!892981))

(assert (=> b!963598 m!892989))

(assert (=> b!963598 m!892981))

(declare-fun m!892991 () Bool)

(assert (=> b!963598 m!892991))

(declare-fun m!892993 () Bool)

(assert (=> b!963598 m!892993))

(declare-fun m!892995 () Bool)

(assert (=> mapNonEmpty!34381 m!892995))

(declare-fun m!892997 () Bool)

(assert (=> start!82656 m!892997))

(declare-fun m!892999 () Bool)

(assert (=> start!82656 m!892999))

(declare-fun m!893001 () Bool)

(assert (=> start!82656 m!893001))

(declare-fun m!893003 () Bool)

(assert (=> b!963597 m!893003))

(check-sat (not b!963591) (not b!963598) (not mapNonEmpty!34381) (not b!963601) tp_is_empty!21591 (not b!963592) (not start!82656) b_and!30277 (not b_next!18789) (not b!963597))
(check-sat b_and!30277 (not b_next!18789))
