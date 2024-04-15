; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82582 () Bool)

(assert start!82582)

(declare-fun b_free!18733 () Bool)

(declare-fun b_next!18733 () Bool)

(assert (=> start!82582 (= b_free!18733 (not b_next!18733))))

(declare-fun tp!65319 () Bool)

(declare-fun b_and!30195 () Bool)

(assert (=> start!82582 (= tp!65319 b_and!30195)))

(declare-fun mapIsEmpty!34297 () Bool)

(declare-fun mapRes!34297 () Bool)

(assert (=> mapIsEmpty!34297 mapRes!34297))

(declare-fun b!962442 () Bool)

(declare-fun res!644141 () Bool)

(declare-fun e!542737 () Bool)

(assert (=> b!962442 (=> (not res!644141) (not e!542737))))

(declare-datatypes ((array!59096 0))(
  ( (array!59097 (arr!28417 (Array (_ BitVec 32) (_ BitVec 64))) (size!28898 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59096)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962442 (= res!644141 (validKeyInArray!0 (select (arr!28417 _keys!1686) i!803)))))

(declare-fun b!962443 () Bool)

(assert (=> b!962443 (= e!542737 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33697 0))(
  ( (V!33698 (val!10818 Int)) )
))
(declare-datatypes ((ValueCell!10286 0))(
  ( (ValueCellFull!10286 (v!13375 V!33697)) (EmptyCell!10286) )
))
(declare-datatypes ((array!59098 0))(
  ( (array!59099 (arr!28418 (Array (_ BitVec 32) ValueCell!10286)) (size!28899 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59098)

(declare-fun minValue!1342 () V!33697)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33697)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lt!430667 () Bool)

(declare-datatypes ((tuple2!13952 0))(
  ( (tuple2!13953 (_1!6987 (_ BitVec 64)) (_2!6987 V!33697)) )
))
(declare-datatypes ((List!19762 0))(
  ( (Nil!19759) (Cons!19758 (h!20920 tuple2!13952) (t!28116 List!19762)) )
))
(declare-datatypes ((ListLongMap!12639 0))(
  ( (ListLongMap!12640 (toList!6335 List!19762)) )
))
(declare-fun contains!5382 (ListLongMap!12639 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3497 (array!59096 array!59098 (_ BitVec 32) (_ BitVec 32) V!33697 V!33697 (_ BitVec 32) Int) ListLongMap!12639)

(assert (=> b!962443 (= lt!430667 (contains!5382 (getCurrentListMap!3497 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28417 _keys!1686) i!803)))))

(declare-fun b!962444 () Bool)

(declare-fun res!644140 () Bool)

(assert (=> b!962444 (=> (not res!644140) (not e!542737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59096 (_ BitVec 32)) Bool)

(assert (=> b!962444 (= res!644140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962445 () Bool)

(declare-fun res!644136 () Bool)

(assert (=> b!962445 (=> (not res!644136) (not e!542737))))

(assert (=> b!962445 (= res!644136 (and (= (size!28899 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28898 _keys!1686) (size!28899 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962446 () Bool)

(declare-fun res!644137 () Bool)

(assert (=> b!962446 (=> (not res!644137) (not e!542737))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962446 (= res!644137 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28898 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28898 _keys!1686))))))

(declare-fun mapNonEmpty!34297 () Bool)

(declare-fun tp!65320 () Bool)

(declare-fun e!542734 () Bool)

(assert (=> mapNonEmpty!34297 (= mapRes!34297 (and tp!65320 e!542734))))

(declare-fun mapKey!34297 () (_ BitVec 32))

(declare-fun mapRest!34297 () (Array (_ BitVec 32) ValueCell!10286))

(declare-fun mapValue!34297 () ValueCell!10286)

(assert (=> mapNonEmpty!34297 (= (arr!28418 _values!1400) (store mapRest!34297 mapKey!34297 mapValue!34297))))

(declare-fun res!644139 () Bool)

(assert (=> start!82582 (=> (not res!644139) (not e!542737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82582 (= res!644139 (validMask!0 mask!2110))))

(assert (=> start!82582 e!542737))

(assert (=> start!82582 true))

(declare-fun e!542735 () Bool)

(declare-fun array_inv!22077 (array!59098) Bool)

(assert (=> start!82582 (and (array_inv!22077 _values!1400) e!542735)))

(declare-fun array_inv!22078 (array!59096) Bool)

(assert (=> start!82582 (array_inv!22078 _keys!1686)))

(assert (=> start!82582 tp!65319))

(declare-fun tp_is_empty!21535 () Bool)

(assert (=> start!82582 tp_is_empty!21535))

(declare-fun b!962447 () Bool)

(declare-fun e!542736 () Bool)

(assert (=> b!962447 (= e!542736 tp_is_empty!21535)))

(declare-fun b!962448 () Bool)

(assert (=> b!962448 (= e!542734 tp_is_empty!21535)))

(declare-fun b!962449 () Bool)

(declare-fun res!644138 () Bool)

(assert (=> b!962449 (=> (not res!644138) (not e!542737))))

(declare-datatypes ((List!19763 0))(
  ( (Nil!19760) (Cons!19759 (h!20921 (_ BitVec 64)) (t!28117 List!19763)) )
))
(declare-fun arrayNoDuplicates!0 (array!59096 (_ BitVec 32) List!19763) Bool)

(assert (=> b!962449 (= res!644138 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19760))))

(declare-fun b!962450 () Bool)

(assert (=> b!962450 (= e!542735 (and e!542736 mapRes!34297))))

(declare-fun condMapEmpty!34297 () Bool)

(declare-fun mapDefault!34297 () ValueCell!10286)

(assert (=> b!962450 (= condMapEmpty!34297 (= (arr!28418 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10286)) mapDefault!34297)))))

(assert (= (and start!82582 res!644139) b!962445))

(assert (= (and b!962445 res!644136) b!962444))

(assert (= (and b!962444 res!644140) b!962449))

(assert (= (and b!962449 res!644138) b!962446))

(assert (= (and b!962446 res!644137) b!962442))

(assert (= (and b!962442 res!644141) b!962443))

(assert (= (and b!962450 condMapEmpty!34297) mapIsEmpty!34297))

(assert (= (and b!962450 (not condMapEmpty!34297)) mapNonEmpty!34297))

(get-info :version)

(assert (= (and mapNonEmpty!34297 ((_ is ValueCellFull!10286) mapValue!34297)) b!962448))

(assert (= (and b!962450 ((_ is ValueCellFull!10286) mapDefault!34297)) b!962447))

(assert (= start!82582 b!962450))

(declare-fun m!891511 () Bool)

(assert (=> b!962449 m!891511))

(declare-fun m!891513 () Bool)

(assert (=> mapNonEmpty!34297 m!891513))

(declare-fun m!891515 () Bool)

(assert (=> b!962443 m!891515))

(declare-fun m!891517 () Bool)

(assert (=> b!962443 m!891517))

(assert (=> b!962443 m!891515))

(assert (=> b!962443 m!891517))

(declare-fun m!891519 () Bool)

(assert (=> b!962443 m!891519))

(assert (=> b!962442 m!891517))

(assert (=> b!962442 m!891517))

(declare-fun m!891521 () Bool)

(assert (=> b!962442 m!891521))

(declare-fun m!891523 () Bool)

(assert (=> b!962444 m!891523))

(declare-fun m!891525 () Bool)

(assert (=> start!82582 m!891525))

(declare-fun m!891527 () Bool)

(assert (=> start!82582 m!891527))

(declare-fun m!891529 () Bool)

(assert (=> start!82582 m!891529))

(check-sat (not b!962442) (not b!962443) (not b!962449) (not mapNonEmpty!34297) (not b_next!18733) tp_is_empty!21535 (not b!962444) b_and!30195 (not start!82582))
(check-sat b_and!30195 (not b_next!18733))
