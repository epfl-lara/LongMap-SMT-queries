; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82594 () Bool)

(assert start!82594)

(declare-fun b_free!18745 () Bool)

(declare-fun b_next!18745 () Bool)

(assert (=> start!82594 (= b_free!18745 (not b_next!18745))))

(declare-fun tp!65355 () Bool)

(declare-fun b_and!30207 () Bool)

(assert (=> start!82594 (= tp!65355 b_and!30207)))

(declare-fun b!962626 () Bool)

(declare-fun res!644270 () Bool)

(declare-fun e!542824 () Bool)

(assert (=> b!962626 (=> (not res!644270) (not e!542824))))

(declare-datatypes ((array!59120 0))(
  ( (array!59121 (arr!28429 (Array (_ BitVec 32) (_ BitVec 64))) (size!28910 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59120)

(declare-datatypes ((List!19774 0))(
  ( (Nil!19771) (Cons!19770 (h!20932 (_ BitVec 64)) (t!28128 List!19774)) )
))
(declare-fun arrayNoDuplicates!0 (array!59120 (_ BitVec 32) List!19774) Bool)

(assert (=> b!962626 (= res!644270 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19771))))

(declare-fun b!962627 () Bool)

(declare-fun res!644266 () Bool)

(assert (=> b!962627 (=> (not res!644266) (not e!542824))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962627 (= res!644266 (bvsgt from!2084 newFrom!159))))

(declare-fun b!962628 () Bool)

(declare-fun res!644269 () Bool)

(assert (=> b!962628 (=> (not res!644269) (not e!542824))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59120 (_ BitVec 32)) Bool)

(assert (=> b!962628 (= res!644269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962629 () Bool)

(declare-fun res!644273 () Bool)

(assert (=> b!962629 (=> (not res!644273) (not e!542824))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962629 (= res!644273 (validKeyInArray!0 (select (arr!28429 _keys!1686) i!803)))))

(declare-fun b!962630 () Bool)

(declare-fun res!644267 () Bool)

(assert (=> b!962630 (=> (not res!644267) (not e!542824))))

(assert (=> b!962630 (= res!644267 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28910 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28910 _keys!1686))))))

(declare-fun b!962631 () Bool)

(declare-fun e!542823 () Bool)

(declare-fun e!542826 () Bool)

(declare-fun mapRes!34315 () Bool)

(assert (=> b!962631 (= e!542823 (and e!542826 mapRes!34315))))

(declare-fun condMapEmpty!34315 () Bool)

(declare-datatypes ((V!33713 0))(
  ( (V!33714 (val!10824 Int)) )
))
(declare-datatypes ((ValueCell!10292 0))(
  ( (ValueCellFull!10292 (v!13381 V!33713)) (EmptyCell!10292) )
))
(declare-datatypes ((array!59122 0))(
  ( (array!59123 (arr!28430 (Array (_ BitVec 32) ValueCell!10292)) (size!28911 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59122)

(declare-fun mapDefault!34315 () ValueCell!10292)

(assert (=> b!962631 (= condMapEmpty!34315 (= (arr!28430 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10292)) mapDefault!34315)))))

(declare-fun res!644272 () Bool)

(assert (=> start!82594 (=> (not res!644272) (not e!542824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82594 (= res!644272 (validMask!0 mask!2110))))

(assert (=> start!82594 e!542824))

(assert (=> start!82594 true))

(declare-fun array_inv!22087 (array!59122) Bool)

(assert (=> start!82594 (and (array_inv!22087 _values!1400) e!542823)))

(declare-fun array_inv!22088 (array!59120) Bool)

(assert (=> start!82594 (array_inv!22088 _keys!1686)))

(assert (=> start!82594 tp!65355))

(declare-fun tp_is_empty!21547 () Bool)

(assert (=> start!82594 tp_is_empty!21547))

(declare-fun b!962632 () Bool)

(assert (=> b!962632 (= e!542824 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33713)

(declare-fun zeroValue!1342 () V!33713)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!13964 0))(
  ( (tuple2!13965 (_1!6993 (_ BitVec 64)) (_2!6993 V!33713)) )
))
(declare-datatypes ((List!19775 0))(
  ( (Nil!19772) (Cons!19771 (h!20933 tuple2!13964) (t!28129 List!19775)) )
))
(declare-datatypes ((ListLongMap!12651 0))(
  ( (ListLongMap!12652 (toList!6341 List!19775)) )
))
(declare-fun contains!5388 (ListLongMap!12651 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3503 (array!59120 array!59122 (_ BitVec 32) (_ BitVec 32) V!33713 V!33713 (_ BitVec 32) Int) ListLongMap!12651)

(assert (=> b!962632 (contains!5388 (getCurrentListMap!3503 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28429 _keys!1686) i!803))))

(declare-datatypes ((Unit!32074 0))(
  ( (Unit!32075) )
))
(declare-fun lt!430685 () Unit!32074)

(declare-fun lemmaInListMapFromThenInFromMinusOne!3 (array!59120 array!59122 (_ BitVec 32) (_ BitVec 32) V!33713 V!33713 (_ BitVec 32) (_ BitVec 32) Int) Unit!32074)

(assert (=> b!962632 (= lt!430685 (lemmaInListMapFromThenInFromMinusOne!3 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!962633 () Bool)

(declare-fun res!644271 () Bool)

(assert (=> b!962633 (=> (not res!644271) (not e!542824))))

(assert (=> b!962633 (= res!644271 (and (= (size!28911 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28910 _keys!1686) (size!28911 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962634 () Bool)

(declare-fun e!542825 () Bool)

(assert (=> b!962634 (= e!542825 tp_is_empty!21547)))

(declare-fun b!962635 () Bool)

(assert (=> b!962635 (= e!542826 tp_is_empty!21547)))

(declare-fun mapIsEmpty!34315 () Bool)

(assert (=> mapIsEmpty!34315 mapRes!34315))

(declare-fun mapNonEmpty!34315 () Bool)

(declare-fun tp!65356 () Bool)

(assert (=> mapNonEmpty!34315 (= mapRes!34315 (and tp!65356 e!542825))))

(declare-fun mapKey!34315 () (_ BitVec 32))

(declare-fun mapRest!34315 () (Array (_ BitVec 32) ValueCell!10292))

(declare-fun mapValue!34315 () ValueCell!10292)

(assert (=> mapNonEmpty!34315 (= (arr!28430 _values!1400) (store mapRest!34315 mapKey!34315 mapValue!34315))))

(declare-fun b!962636 () Bool)

(declare-fun res!644268 () Bool)

(assert (=> b!962636 (=> (not res!644268) (not e!542824))))

(assert (=> b!962636 (= res!644268 (contains!5388 (getCurrentListMap!3503 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28429 _keys!1686) i!803)))))

(assert (= (and start!82594 res!644272) b!962633))

(assert (= (and b!962633 res!644271) b!962628))

(assert (= (and b!962628 res!644269) b!962626))

(assert (= (and b!962626 res!644270) b!962630))

(assert (= (and b!962630 res!644267) b!962629))

(assert (= (and b!962629 res!644273) b!962636))

(assert (= (and b!962636 res!644268) b!962627))

(assert (= (and b!962627 res!644266) b!962632))

(assert (= (and b!962631 condMapEmpty!34315) mapIsEmpty!34315))

(assert (= (and b!962631 (not condMapEmpty!34315)) mapNonEmpty!34315))

(get-info :version)

(assert (= (and mapNonEmpty!34315 ((_ is ValueCellFull!10292) mapValue!34315)) b!962634))

(assert (= (and b!962631 ((_ is ValueCellFull!10292) mapDefault!34315)) b!962635))

(assert (= start!82594 b!962631))

(declare-fun m!891649 () Bool)

(assert (=> mapNonEmpty!34315 m!891649))

(declare-fun m!891651 () Bool)

(assert (=> b!962629 m!891651))

(assert (=> b!962629 m!891651))

(declare-fun m!891653 () Bool)

(assert (=> b!962629 m!891653))

(declare-fun m!891655 () Bool)

(assert (=> b!962636 m!891655))

(assert (=> b!962636 m!891651))

(assert (=> b!962636 m!891655))

(assert (=> b!962636 m!891651))

(declare-fun m!891657 () Bool)

(assert (=> b!962636 m!891657))

(declare-fun m!891659 () Bool)

(assert (=> b!962632 m!891659))

(assert (=> b!962632 m!891651))

(assert (=> b!962632 m!891659))

(assert (=> b!962632 m!891651))

(declare-fun m!891661 () Bool)

(assert (=> b!962632 m!891661))

(declare-fun m!891663 () Bool)

(assert (=> b!962632 m!891663))

(declare-fun m!891665 () Bool)

(assert (=> b!962626 m!891665))

(declare-fun m!891667 () Bool)

(assert (=> start!82594 m!891667))

(declare-fun m!891669 () Bool)

(assert (=> start!82594 m!891669))

(declare-fun m!891671 () Bool)

(assert (=> start!82594 m!891671))

(declare-fun m!891673 () Bool)

(assert (=> b!962628 m!891673))

(check-sat (not b!962632) (not b!962629) (not b!962628) tp_is_empty!21547 (not b!962626) b_and!30207 (not mapNonEmpty!34315) (not b!962636) (not b_next!18745) (not start!82594))
(check-sat b_and!30207 (not b_next!18745))
