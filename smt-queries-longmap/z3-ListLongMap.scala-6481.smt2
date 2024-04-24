; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82894 () Bool)

(assert start!82894)

(declare-fun b_free!18859 () Bool)

(declare-fun b_next!18859 () Bool)

(assert (=> start!82894 (= b_free!18859 (not b_next!18859))))

(declare-fun tp!65698 () Bool)

(declare-fun b_and!30357 () Bool)

(assert (=> start!82894 (= tp!65698 b_and!30357)))

(declare-fun b!965723 () Bool)

(declare-fun res!646167 () Bool)

(declare-fun e!544485 () Bool)

(assert (=> b!965723 (=> (not res!646167) (not e!544485))))

(declare-datatypes ((array!59428 0))(
  ( (array!59429 (arr!28578 (Array (_ BitVec 32) (_ BitVec 64))) (size!29058 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59428)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59428 (_ BitVec 32)) Bool)

(assert (=> b!965723 (= res!646167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34486 () Bool)

(declare-fun mapRes!34486 () Bool)

(assert (=> mapIsEmpty!34486 mapRes!34486))

(declare-fun b!965724 () Bool)

(declare-fun e!544487 () Bool)

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965724 (= e!544487 (bvsle newFrom!159 (size!29058 _keys!1686)))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33865 0))(
  ( (V!33866 (val!10881 Int)) )
))
(declare-datatypes ((ValueCell!10349 0))(
  ( (ValueCellFull!10349 (v!13436 V!33865)) (EmptyCell!10349) )
))
(declare-datatypes ((array!59430 0))(
  ( (array!59431 (arr!28579 (Array (_ BitVec 32) ValueCell!10349)) (size!29059 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59430)

(declare-fun zeroValue!1342 () V!33865)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33865)

(declare-datatypes ((tuple2!13974 0))(
  ( (tuple2!13975 (_1!6998 (_ BitVec 64)) (_2!6998 V!33865)) )
))
(declare-datatypes ((List!19820 0))(
  ( (Nil!19817) (Cons!19816 (h!20984 tuple2!13974) (t!28175 List!19820)) )
))
(declare-datatypes ((ListLongMap!12673 0))(
  ( (ListLongMap!12674 (toList!6352 List!19820)) )
))
(declare-fun contains!5467 (ListLongMap!12673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3585 (array!59428 array!59430 (_ BitVec 32) (_ BitVec 32) V!33865 V!33865 (_ BitVec 32) Int) ListLongMap!12673)

(assert (=> b!965724 (contains!5467 (getCurrentListMap!3585 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28578 _keys!1686) i!803))))

(declare-datatypes ((Unit!32258 0))(
  ( (Unit!32259) )
))
(declare-fun lt!431528 () Unit!32258)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!35 (array!59428 array!59430 (_ BitVec 32) (_ BitVec 32) V!33865 V!33865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32258)

(assert (=> b!965724 (= lt!431528 (lemmaInListMapFromThenInFromSmaller!35 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!965725 () Bool)

(declare-fun e!544484 () Bool)

(declare-fun e!544486 () Bool)

(assert (=> b!965725 (= e!544484 (and e!544486 mapRes!34486))))

(declare-fun condMapEmpty!34486 () Bool)

(declare-fun mapDefault!34486 () ValueCell!10349)

(assert (=> b!965725 (= condMapEmpty!34486 (= (arr!28579 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10349)) mapDefault!34486)))))

(declare-fun b!965727 () Bool)

(declare-fun res!646168 () Bool)

(assert (=> b!965727 (=> (not res!646168) (not e!544485))))

(assert (=> b!965727 (= res!646168 (bvsgt from!2084 newFrom!159))))

(declare-fun b!965728 () Bool)

(declare-fun res!646166 () Bool)

(assert (=> b!965728 (=> (not res!646166) (not e!544485))))

(assert (=> b!965728 (= res!646166 (and (= (size!29059 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29058 _keys!1686) (size!29059 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965729 () Bool)

(declare-fun res!646164 () Bool)

(assert (=> b!965729 (=> (not res!646164) (not e!544485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965729 (= res!646164 (validKeyInArray!0 (select (arr!28578 _keys!1686) i!803)))))

(declare-fun b!965730 () Bool)

(declare-fun tp_is_empty!21661 () Bool)

(assert (=> b!965730 (= e!544486 tp_is_empty!21661)))

(declare-fun b!965731 () Bool)

(declare-fun res!646169 () Bool)

(assert (=> b!965731 (=> (not res!646169) (not e!544485))))

(assert (=> b!965731 (= res!646169 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29058 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29058 _keys!1686))))))

(declare-fun b!965732 () Bool)

(declare-fun res!646163 () Bool)

(assert (=> b!965732 (=> (not res!646163) (not e!544485))))

(assert (=> b!965732 (= res!646163 (contains!5467 (getCurrentListMap!3585 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28578 _keys!1686) i!803)))))

(declare-fun b!965733 () Bool)

(assert (=> b!965733 (= e!544485 (not e!544487))))

(declare-fun res!646162 () Bool)

(assert (=> b!965733 (=> res!646162 e!544487)))

(assert (=> b!965733 (= res!646162 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29058 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!965733 (contains!5467 (getCurrentListMap!3585 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28578 _keys!1686) i!803))))

(declare-fun lt!431527 () Unit!32258)

(declare-fun lemmaInListMapFromThenInFromMinusOne!41 (array!59428 array!59430 (_ BitVec 32) (_ BitVec 32) V!33865 V!33865 (_ BitVec 32) (_ BitVec 32) Int) Unit!32258)

(assert (=> b!965733 (= lt!431527 (lemmaInListMapFromThenInFromMinusOne!41 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!646165 () Bool)

(assert (=> start!82894 (=> (not res!646165) (not e!544485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82894 (= res!646165 (validMask!0 mask!2110))))

(assert (=> start!82894 e!544485))

(assert (=> start!82894 true))

(declare-fun array_inv!22199 (array!59430) Bool)

(assert (=> start!82894 (and (array_inv!22199 _values!1400) e!544484)))

(declare-fun array_inv!22200 (array!59428) Bool)

(assert (=> start!82894 (array_inv!22200 _keys!1686)))

(assert (=> start!82894 tp!65698))

(assert (=> start!82894 tp_is_empty!21661))

(declare-fun b!965726 () Bool)

(declare-fun res!646170 () Bool)

(assert (=> b!965726 (=> (not res!646170) (not e!544485))))

(declare-datatypes ((List!19821 0))(
  ( (Nil!19818) (Cons!19817 (h!20985 (_ BitVec 64)) (t!28176 List!19821)) )
))
(declare-fun arrayNoDuplicates!0 (array!59428 (_ BitVec 32) List!19821) Bool)

(assert (=> b!965726 (= res!646170 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19818))))

(declare-fun mapNonEmpty!34486 () Bool)

(declare-fun tp!65697 () Bool)

(declare-fun e!544483 () Bool)

(assert (=> mapNonEmpty!34486 (= mapRes!34486 (and tp!65697 e!544483))))

(declare-fun mapValue!34486 () ValueCell!10349)

(declare-fun mapRest!34486 () (Array (_ BitVec 32) ValueCell!10349))

(declare-fun mapKey!34486 () (_ BitVec 32))

(assert (=> mapNonEmpty!34486 (= (arr!28579 _values!1400) (store mapRest!34486 mapKey!34486 mapValue!34486))))

(declare-fun b!965734 () Bool)

(assert (=> b!965734 (= e!544483 tp_is_empty!21661)))

(assert (= (and start!82894 res!646165) b!965728))

(assert (= (and b!965728 res!646166) b!965723))

(assert (= (and b!965723 res!646167) b!965726))

(assert (= (and b!965726 res!646170) b!965731))

(assert (= (and b!965731 res!646169) b!965729))

(assert (= (and b!965729 res!646164) b!965732))

(assert (= (and b!965732 res!646163) b!965727))

(assert (= (and b!965727 res!646168) b!965733))

(assert (= (and b!965733 (not res!646162)) b!965724))

(assert (= (and b!965725 condMapEmpty!34486) mapIsEmpty!34486))

(assert (= (and b!965725 (not condMapEmpty!34486)) mapNonEmpty!34486))

(get-info :version)

(assert (= (and mapNonEmpty!34486 ((_ is ValueCellFull!10349) mapValue!34486)) b!965734))

(assert (= (and b!965725 ((_ is ValueCellFull!10349) mapDefault!34486)) b!965730))

(assert (= start!82894 b!965725))

(declare-fun m!895327 () Bool)

(assert (=> b!965729 m!895327))

(assert (=> b!965729 m!895327))

(declare-fun m!895329 () Bool)

(assert (=> b!965729 m!895329))

(declare-fun m!895331 () Bool)

(assert (=> start!82894 m!895331))

(declare-fun m!895333 () Bool)

(assert (=> start!82894 m!895333))

(declare-fun m!895335 () Bool)

(assert (=> start!82894 m!895335))

(declare-fun m!895337 () Bool)

(assert (=> b!965733 m!895337))

(assert (=> b!965733 m!895327))

(assert (=> b!965733 m!895337))

(assert (=> b!965733 m!895327))

(declare-fun m!895339 () Bool)

(assert (=> b!965733 m!895339))

(declare-fun m!895341 () Bool)

(assert (=> b!965733 m!895341))

(declare-fun m!895343 () Bool)

(assert (=> mapNonEmpty!34486 m!895343))

(declare-fun m!895345 () Bool)

(assert (=> b!965726 m!895345))

(declare-fun m!895347 () Bool)

(assert (=> b!965724 m!895347))

(assert (=> b!965724 m!895327))

(assert (=> b!965724 m!895347))

(assert (=> b!965724 m!895327))

(declare-fun m!895349 () Bool)

(assert (=> b!965724 m!895349))

(declare-fun m!895351 () Bool)

(assert (=> b!965724 m!895351))

(declare-fun m!895353 () Bool)

(assert (=> b!965732 m!895353))

(assert (=> b!965732 m!895327))

(assert (=> b!965732 m!895353))

(assert (=> b!965732 m!895327))

(declare-fun m!895355 () Bool)

(assert (=> b!965732 m!895355))

(declare-fun m!895357 () Bool)

(assert (=> b!965723 m!895357))

(check-sat (not b_next!18859) (not start!82894) (not b!965732) (not b!965733) (not b!965729) b_and!30357 tp_is_empty!21661 (not mapNonEmpty!34486) (not b!965726) (not b!965723) (not b!965724))
(check-sat b_and!30357 (not b_next!18859))
