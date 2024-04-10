; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82950 () Bool)

(assert start!82950)

(declare-fun b_free!19077 () Bool)

(declare-fun b_next!19077 () Bool)

(assert (=> start!82950 (= b_free!19077 (not b_next!19077))))

(declare-fun tp!66359 () Bool)

(declare-fun b_and!30565 () Bool)

(assert (=> start!82950 (= tp!66359 b_and!30565)))

(declare-fun b!968114 () Bool)

(declare-fun res!648106 () Bool)

(declare-fun e!545592 () Bool)

(assert (=> b!968114 (=> (not res!648106) (not e!545592))))

(declare-datatypes ((array!59843 0))(
  ( (array!59844 (arr!28790 (Array (_ BitVec 32) (_ BitVec 64))) (size!29269 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59843)

(declare-datatypes ((List!19991 0))(
  ( (Nil!19988) (Cons!19987 (h!21149 (_ BitVec 64)) (t!28354 List!19991)) )
))
(declare-fun arrayNoDuplicates!0 (array!59843 (_ BitVec 32) List!19991) Bool)

(assert (=> b!968114 (= res!648106 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19988))))

(declare-fun res!648111 () Bool)

(assert (=> start!82950 (=> (not res!648111) (not e!545592))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82950 (= res!648111 (validMask!0 mask!2110))))

(assert (=> start!82950 e!545592))

(assert (=> start!82950 true))

(declare-datatypes ((V!34163 0))(
  ( (V!34164 (val!10993 Int)) )
))
(declare-datatypes ((ValueCell!10461 0))(
  ( (ValueCellFull!10461 (v!13551 V!34163)) (EmptyCell!10461) )
))
(declare-datatypes ((array!59845 0))(
  ( (array!59846 (arr!28791 (Array (_ BitVec 32) ValueCell!10461)) (size!29270 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59845)

(declare-fun e!545595 () Bool)

(declare-fun array_inv!22289 (array!59845) Bool)

(assert (=> start!82950 (and (array_inv!22289 _values!1400) e!545595)))

(declare-fun array_inv!22290 (array!59843) Bool)

(assert (=> start!82950 (array_inv!22290 _keys!1686)))

(assert (=> start!82950 tp!66359))

(declare-fun tp_is_empty!21885 () Bool)

(assert (=> start!82950 tp_is_empty!21885))

(declare-fun b!968115 () Bool)

(declare-fun e!545594 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968115 (= e!545594 (bvsge i!803 #b00000000000000000000000000000000))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34163)

(declare-fun defaultEntry!1403 () Int)

(declare-fun minValue!1342 () V!34163)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-datatypes ((tuple2!14144 0))(
  ( (tuple2!14145 (_1!7083 (_ BitVec 64)) (_2!7083 V!34163)) )
))
(declare-datatypes ((List!19992 0))(
  ( (Nil!19989) (Cons!19988 (h!21150 tuple2!14144) (t!28355 List!19992)) )
))
(declare-datatypes ((ListLongMap!12841 0))(
  ( (ListLongMap!12842 (toList!6436 List!19992)) )
))
(declare-fun contains!5537 (ListLongMap!12841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3669 (array!59843 array!59845 (_ BitVec 32) (_ BitVec 32) V!34163 V!34163 (_ BitVec 32) Int) ListLongMap!12841)

(assert (=> b!968115 (contains!5537 (getCurrentListMap!3669 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28790 _keys!1686) i!803))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((Unit!32353 0))(
  ( (Unit!32354) )
))
(declare-fun lt!431488 () Unit!32353)

(declare-fun lemmaInListMapFromThenInFromSmaller!40 (array!59843 array!59845 (_ BitVec 32) (_ BitVec 32) V!34163 V!34163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32353)

(assert (=> b!968115 (= lt!431488 (lemmaInListMapFromThenInFromSmaller!40 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!968116 () Bool)

(declare-fun res!648110 () Bool)

(assert (=> b!968116 (=> (not res!648110) (not e!545592))))

(assert (=> b!968116 (= res!648110 (and (= (size!29270 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29269 _keys!1686) (size!29270 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968117 () Bool)

(declare-fun res!648108 () Bool)

(assert (=> b!968117 (=> (not res!648108) (not e!545592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968117 (= res!648108 (validKeyInArray!0 (select (arr!28790 _keys!1686) i!803)))))

(declare-fun b!968118 () Bool)

(declare-fun res!648104 () Bool)

(assert (=> b!968118 (=> (not res!648104) (not e!545592))))

(assert (=> b!968118 (= res!648104 (contains!5537 (getCurrentListMap!3669 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28790 _keys!1686) i!803)))))

(declare-fun b!968119 () Bool)

(declare-fun e!545593 () Bool)

(assert (=> b!968119 (= e!545593 tp_is_empty!21885)))

(declare-fun b!968120 () Bool)

(assert (=> b!968120 (= e!545592 (not e!545594))))

(declare-fun res!648112 () Bool)

(assert (=> b!968120 (=> res!648112 e!545594)))

(assert (=> b!968120 (= res!648112 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29269 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!968120 (contains!5537 (getCurrentListMap!3669 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28790 _keys!1686) i!803))))

(declare-fun lt!431487 () Unit!32353)

(declare-fun lemmaInListMapFromThenInFromMinusOne!71 (array!59843 array!59845 (_ BitVec 32) (_ BitVec 32) V!34163 V!34163 (_ BitVec 32) (_ BitVec 32) Int) Unit!32353)

(assert (=> b!968120 (= lt!431487 (lemmaInListMapFromThenInFromMinusOne!71 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34822 () Bool)

(declare-fun mapRes!34822 () Bool)

(assert (=> mapIsEmpty!34822 mapRes!34822))

(declare-fun mapNonEmpty!34822 () Bool)

(declare-fun tp!66360 () Bool)

(assert (=> mapNonEmpty!34822 (= mapRes!34822 (and tp!66360 e!545593))))

(declare-fun mapKey!34822 () (_ BitVec 32))

(declare-fun mapRest!34822 () (Array (_ BitVec 32) ValueCell!10461))

(declare-fun mapValue!34822 () ValueCell!10461)

(assert (=> mapNonEmpty!34822 (= (arr!28791 _values!1400) (store mapRest!34822 mapKey!34822 mapValue!34822))))

(declare-fun b!968121 () Bool)

(declare-fun res!648105 () Bool)

(assert (=> b!968121 (=> (not res!648105) (not e!545592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59843 (_ BitVec 32)) Bool)

(assert (=> b!968121 (= res!648105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968122 () Bool)

(declare-fun e!545596 () Bool)

(assert (=> b!968122 (= e!545596 tp_is_empty!21885)))

(declare-fun b!968123 () Bool)

(assert (=> b!968123 (= e!545595 (and e!545596 mapRes!34822))))

(declare-fun condMapEmpty!34822 () Bool)

(declare-fun mapDefault!34822 () ValueCell!10461)

(assert (=> b!968123 (= condMapEmpty!34822 (= (arr!28791 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10461)) mapDefault!34822)))))

(declare-fun b!968124 () Bool)

(declare-fun res!648107 () Bool)

(assert (=> b!968124 (=> (not res!648107) (not e!545592))))

(assert (=> b!968124 (= res!648107 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968125 () Bool)

(declare-fun res!648109 () Bool)

(assert (=> b!968125 (=> (not res!648109) (not e!545592))))

(assert (=> b!968125 (= res!648109 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29269 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29269 _keys!1686))))))

(assert (= (and start!82950 res!648111) b!968116))

(assert (= (and b!968116 res!648110) b!968121))

(assert (= (and b!968121 res!648105) b!968114))

(assert (= (and b!968114 res!648106) b!968125))

(assert (= (and b!968125 res!648109) b!968117))

(assert (= (and b!968117 res!648108) b!968118))

(assert (= (and b!968118 res!648104) b!968124))

(assert (= (and b!968124 res!648107) b!968120))

(assert (= (and b!968120 (not res!648112)) b!968115))

(assert (= (and b!968123 condMapEmpty!34822) mapIsEmpty!34822))

(assert (= (and b!968123 (not condMapEmpty!34822)) mapNonEmpty!34822))

(get-info :version)

(assert (= (and mapNonEmpty!34822 ((_ is ValueCellFull!10461) mapValue!34822)) b!968119))

(assert (= (and b!968123 ((_ is ValueCellFull!10461) mapDefault!34822)) b!968122))

(assert (= start!82950 b!968123))

(declare-fun m!896525 () Bool)

(assert (=> b!968120 m!896525))

(declare-fun m!896527 () Bool)

(assert (=> b!968120 m!896527))

(assert (=> b!968120 m!896525))

(assert (=> b!968120 m!896527))

(declare-fun m!896529 () Bool)

(assert (=> b!968120 m!896529))

(declare-fun m!896531 () Bool)

(assert (=> b!968120 m!896531))

(declare-fun m!896533 () Bool)

(assert (=> b!968121 m!896533))

(declare-fun m!896535 () Bool)

(assert (=> mapNonEmpty!34822 m!896535))

(declare-fun m!896537 () Bool)

(assert (=> start!82950 m!896537))

(declare-fun m!896539 () Bool)

(assert (=> start!82950 m!896539))

(declare-fun m!896541 () Bool)

(assert (=> start!82950 m!896541))

(declare-fun m!896543 () Bool)

(assert (=> b!968115 m!896543))

(assert (=> b!968115 m!896527))

(assert (=> b!968115 m!896543))

(assert (=> b!968115 m!896527))

(declare-fun m!896545 () Bool)

(assert (=> b!968115 m!896545))

(declare-fun m!896547 () Bool)

(assert (=> b!968115 m!896547))

(assert (=> b!968117 m!896527))

(assert (=> b!968117 m!896527))

(declare-fun m!896549 () Bool)

(assert (=> b!968117 m!896549))

(declare-fun m!896551 () Bool)

(assert (=> b!968114 m!896551))

(declare-fun m!896553 () Bool)

(assert (=> b!968118 m!896553))

(assert (=> b!968118 m!896527))

(assert (=> b!968118 m!896553))

(assert (=> b!968118 m!896527))

(declare-fun m!896555 () Bool)

(assert (=> b!968118 m!896555))

(check-sat (not b!968115) (not b!968120) (not start!82950) (not b!968114) (not mapNonEmpty!34822) (not b!968121) (not b!968118) tp_is_empty!21885 b_and!30565 (not b!968117) (not b_next!19077))
(check-sat b_and!30565 (not b_next!19077))
