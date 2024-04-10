; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82614 () Bool)

(assert start!82614)

(declare-fun b_free!18747 () Bool)

(declare-fun b_next!18747 () Bool)

(assert (=> start!82614 (= b_free!18747 (not b_next!18747))))

(declare-fun tp!65360 () Bool)

(declare-fun b_and!30235 () Bool)

(assert (=> start!82614 (= tp!65360 b_and!30235)))

(declare-fun b!962898 () Bool)

(declare-fun res!644406 () Bool)

(declare-fun e!542989 () Bool)

(assert (=> b!962898 (=> (not res!644406) (not e!542989))))

(declare-datatypes ((array!59193 0))(
  ( (array!59194 (arr!28465 (Array (_ BitVec 32) (_ BitVec 64))) (size!28944 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59193)

(declare-datatypes ((List!19757 0))(
  ( (Nil!19754) (Cons!19753 (h!20915 (_ BitVec 64)) (t!28120 List!19757)) )
))
(declare-fun arrayNoDuplicates!0 (array!59193 (_ BitVec 32) List!19757) Bool)

(assert (=> b!962898 (= res!644406 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19754))))

(declare-fun b!962899 () Bool)

(declare-fun res!644407 () Bool)

(assert (=> b!962899 (=> (not res!644407) (not e!542989))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962899 (= res!644407 (bvsgt from!2084 newFrom!159))))

(declare-fun b!962900 () Bool)

(declare-fun e!542990 () Bool)

(declare-fun tp_is_empty!21549 () Bool)

(assert (=> b!962900 (= e!542990 tp_is_empty!21549)))

(declare-fun mapNonEmpty!34318 () Bool)

(declare-fun mapRes!34318 () Bool)

(declare-fun tp!65361 () Bool)

(declare-fun e!542986 () Bool)

(assert (=> mapNonEmpty!34318 (= mapRes!34318 (and tp!65361 e!542986))))

(declare-fun mapKey!34318 () (_ BitVec 32))

(declare-datatypes ((V!33715 0))(
  ( (V!33716 (val!10825 Int)) )
))
(declare-datatypes ((ValueCell!10293 0))(
  ( (ValueCellFull!10293 (v!13383 V!33715)) (EmptyCell!10293) )
))
(declare-fun mapRest!34318 () (Array (_ BitVec 32) ValueCell!10293))

(declare-datatypes ((array!59195 0))(
  ( (array!59196 (arr!28466 (Array (_ BitVec 32) ValueCell!10293)) (size!28945 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59195)

(declare-fun mapValue!34318 () ValueCell!10293)

(assert (=> mapNonEmpty!34318 (= (arr!28466 _values!1400) (store mapRest!34318 mapKey!34318 mapValue!34318))))

(declare-fun b!962901 () Bool)

(assert (=> b!962901 (= e!542989 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33715)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33715)

(declare-datatypes ((tuple2!13908 0))(
  ( (tuple2!13909 (_1!6965 (_ BitVec 64)) (_2!6965 V!33715)) )
))
(declare-datatypes ((List!19758 0))(
  ( (Nil!19755) (Cons!19754 (h!20916 tuple2!13908) (t!28121 List!19758)) )
))
(declare-datatypes ((ListLongMap!12605 0))(
  ( (ListLongMap!12606 (toList!6318 List!19758)) )
))
(declare-fun contains!5421 (ListLongMap!12605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3551 (array!59193 array!59195 (_ BitVec 32) (_ BitVec 32) V!33715 V!33715 (_ BitVec 32) Int) ListLongMap!12605)

(assert (=> b!962901 (contains!5421 (getCurrentListMap!3551 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28465 _keys!1686) i!803))))

(declare-datatypes ((Unit!32221 0))(
  ( (Unit!32222) )
))
(declare-fun lt!430924 () Unit!32221)

(declare-fun lemmaInListMapFromThenInFromMinusOne!5 (array!59193 array!59195 (_ BitVec 32) (_ BitVec 32) V!33715 V!33715 (_ BitVec 32) (_ BitVec 32) Int) Unit!32221)

(assert (=> b!962901 (= lt!430924 (lemmaInListMapFromThenInFromMinusOne!5 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!962902 () Bool)

(declare-fun res!644405 () Bool)

(assert (=> b!962902 (=> (not res!644405) (not e!542989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962902 (= res!644405 (validKeyInArray!0 (select (arr!28465 _keys!1686) i!803)))))

(declare-fun b!962904 () Bool)

(declare-fun e!542987 () Bool)

(assert (=> b!962904 (= e!542987 (and e!542990 mapRes!34318))))

(declare-fun condMapEmpty!34318 () Bool)

(declare-fun mapDefault!34318 () ValueCell!10293)

(assert (=> b!962904 (= condMapEmpty!34318 (= (arr!28466 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10293)) mapDefault!34318)))))

(declare-fun b!962905 () Bool)

(assert (=> b!962905 (= e!542986 tp_is_empty!21549)))

(declare-fun b!962906 () Bool)

(declare-fun res!644403 () Bool)

(assert (=> b!962906 (=> (not res!644403) (not e!542989))))

(assert (=> b!962906 (= res!644403 (and (= (size!28945 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28944 _keys!1686) (size!28945 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962907 () Bool)

(declare-fun res!644400 () Bool)

(assert (=> b!962907 (=> (not res!644400) (not e!542989))))

(assert (=> b!962907 (= res!644400 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28944 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28944 _keys!1686))))))

(declare-fun res!644402 () Bool)

(assert (=> start!82614 (=> (not res!644402) (not e!542989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82614 (= res!644402 (validMask!0 mask!2110))))

(assert (=> start!82614 e!542989))

(assert (=> start!82614 true))

(declare-fun array_inv!22057 (array!59195) Bool)

(assert (=> start!82614 (and (array_inv!22057 _values!1400) e!542987)))

(declare-fun array_inv!22058 (array!59193) Bool)

(assert (=> start!82614 (array_inv!22058 _keys!1686)))

(assert (=> start!82614 tp!65360))

(assert (=> start!82614 tp_is_empty!21549))

(declare-fun b!962903 () Bool)

(declare-fun res!644404 () Bool)

(assert (=> b!962903 (=> (not res!644404) (not e!542989))))

(assert (=> b!962903 (= res!644404 (contains!5421 (getCurrentListMap!3551 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28465 _keys!1686) i!803)))))

(declare-fun b!962908 () Bool)

(declare-fun res!644401 () Bool)

(assert (=> b!962908 (=> (not res!644401) (not e!542989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59193 (_ BitVec 32)) Bool)

(assert (=> b!962908 (= res!644401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34318 () Bool)

(assert (=> mapIsEmpty!34318 mapRes!34318))

(assert (= (and start!82614 res!644402) b!962906))

(assert (= (and b!962906 res!644403) b!962908))

(assert (= (and b!962908 res!644401) b!962898))

(assert (= (and b!962898 res!644406) b!962907))

(assert (= (and b!962907 res!644400) b!962902))

(assert (= (and b!962902 res!644405) b!962903))

(assert (= (and b!962903 res!644404) b!962899))

(assert (= (and b!962899 res!644407) b!962901))

(assert (= (and b!962904 condMapEmpty!34318) mapIsEmpty!34318))

(assert (= (and b!962904 (not condMapEmpty!34318)) mapNonEmpty!34318))

(get-info :version)

(assert (= (and mapNonEmpty!34318 ((_ is ValueCellFull!10293) mapValue!34318)) b!962905))

(assert (= (and b!962904 ((_ is ValueCellFull!10293) mapDefault!34318)) b!962900))

(assert (= start!82614 b!962904))

(declare-fun m!892433 () Bool)

(assert (=> b!962898 m!892433))

(declare-fun m!892435 () Bool)

(assert (=> b!962901 m!892435))

(declare-fun m!892437 () Bool)

(assert (=> b!962901 m!892437))

(assert (=> b!962901 m!892435))

(assert (=> b!962901 m!892437))

(declare-fun m!892439 () Bool)

(assert (=> b!962901 m!892439))

(declare-fun m!892441 () Bool)

(assert (=> b!962901 m!892441))

(declare-fun m!892443 () Bool)

(assert (=> start!82614 m!892443))

(declare-fun m!892445 () Bool)

(assert (=> start!82614 m!892445))

(declare-fun m!892447 () Bool)

(assert (=> start!82614 m!892447))

(assert (=> b!962902 m!892437))

(assert (=> b!962902 m!892437))

(declare-fun m!892449 () Bool)

(assert (=> b!962902 m!892449))

(declare-fun m!892451 () Bool)

(assert (=> mapNonEmpty!34318 m!892451))

(declare-fun m!892453 () Bool)

(assert (=> b!962908 m!892453))

(declare-fun m!892455 () Bool)

(assert (=> b!962903 m!892455))

(assert (=> b!962903 m!892437))

(assert (=> b!962903 m!892455))

(assert (=> b!962903 m!892437))

(declare-fun m!892457 () Bool)

(assert (=> b!962903 m!892457))

(check-sat (not b!962903) (not mapNonEmpty!34318) tp_is_empty!21549 (not b!962902) (not b!962908) (not b!962901) b_and!30235 (not b_next!18747) (not start!82614) (not b!962898))
(check-sat b_and!30235 (not b_next!18747))
