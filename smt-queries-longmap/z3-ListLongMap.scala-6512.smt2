; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83080 () Bool)

(assert start!83080)

(declare-fun b_free!19039 () Bool)

(declare-fun b_next!19039 () Bool)

(assert (=> start!83080 (= b_free!19039 (not b_next!19039))))

(declare-fun tp!66247 () Bool)

(declare-fun b_and!30537 () Bool)

(assert (=> start!83080 (= tp!66247 b_and!30537)))

(declare-fun b!968385 () Bool)

(declare-fun e!545884 () Bool)

(declare-fun tp_is_empty!21847 () Bool)

(assert (=> b!968385 (= e!545884 tp_is_empty!21847)))

(declare-fun b!968386 () Bool)

(declare-fun e!545886 () Bool)

(assert (=> b!968386 (= e!545886 tp_is_empty!21847)))

(declare-fun b!968387 () Bool)

(declare-fun res!647990 () Bool)

(declare-fun e!545888 () Bool)

(assert (=> b!968387 (=> (not res!647990) (not e!545888))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34113 0))(
  ( (V!34114 (val!10974 Int)) )
))
(declare-datatypes ((ValueCell!10442 0))(
  ( (ValueCellFull!10442 (v!13529 V!34113)) (EmptyCell!10442) )
))
(declare-datatypes ((array!59788 0))(
  ( (array!59789 (arr!28758 (Array (_ BitVec 32) ValueCell!10442)) (size!29238 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59788)

(declare-datatypes ((array!59790 0))(
  ( (array!59791 (arr!28759 (Array (_ BitVec 32) (_ BitVec 64))) (size!29239 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59790)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!968387 (= res!647990 (and (= (size!29238 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29239 _keys!1686) (size!29238 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34765 () Bool)

(declare-fun mapRes!34765 () Bool)

(assert (=> mapIsEmpty!34765 mapRes!34765))

(declare-fun b!968388 () Bool)

(declare-fun res!647994 () Bool)

(assert (=> b!968388 (=> (not res!647994) (not e!545888))))

(declare-datatypes ((List!19950 0))(
  ( (Nil!19947) (Cons!19946 (h!21114 (_ BitVec 64)) (t!28305 List!19950)) )
))
(declare-fun arrayNoDuplicates!0 (array!59790 (_ BitVec 32) List!19950) Bool)

(assert (=> b!968388 (= res!647994 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19947))))

(declare-fun mapNonEmpty!34765 () Bool)

(declare-fun tp!66246 () Bool)

(assert (=> mapNonEmpty!34765 (= mapRes!34765 (and tp!66246 e!545884))))

(declare-fun mapRest!34765 () (Array (_ BitVec 32) ValueCell!10442))

(declare-fun mapKey!34765 () (_ BitVec 32))

(declare-fun mapValue!34765 () ValueCell!10442)

(assert (=> mapNonEmpty!34765 (= (arr!28758 _values!1400) (store mapRest!34765 mapKey!34765 mapValue!34765))))

(declare-fun b!968390 () Bool)

(declare-fun res!647988 () Bool)

(assert (=> b!968390 (=> (not res!647988) (not e!545888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59790 (_ BitVec 32)) Bool)

(assert (=> b!968390 (= res!647988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968391 () Bool)

(declare-fun res!647987 () Bool)

(assert (=> b!968391 (=> (not res!647987) (not e!545888))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968391 (= res!647987 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29239 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29239 _keys!1686))))))

(declare-fun b!968392 () Bool)

(assert (=> b!968392 (= e!545888 (not true))))

(declare-fun minValue!1342 () V!34113)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34113)

(declare-datatypes ((tuple2!14104 0))(
  ( (tuple2!14105 (_1!7063 (_ BitVec 64)) (_2!7063 V!34113)) )
))
(declare-datatypes ((List!19951 0))(
  ( (Nil!19948) (Cons!19947 (h!21115 tuple2!14104) (t!28306 List!19951)) )
))
(declare-datatypes ((ListLongMap!12803 0))(
  ( (ListLongMap!12804 (toList!6417 List!19951)) )
))
(declare-fun contains!5529 (ListLongMap!12803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3650 (array!59790 array!59788 (_ BitVec 32) (_ BitVec 32) V!34113 V!34113 (_ BitVec 32) Int) ListLongMap!12803)

(assert (=> b!968392 (contains!5529 (getCurrentListMap!3650 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28759 _keys!1686) i!803))))

(declare-datatypes ((Unit!32288 0))(
  ( (Unit!32289) )
))
(declare-fun lt!431786 () Unit!32288)

(declare-fun lemmaInListMapFromThenInFromMinusOne!55 (array!59790 array!59788 (_ BitVec 32) (_ BitVec 32) V!34113 V!34113 (_ BitVec 32) (_ BitVec 32) Int) Unit!32288)

(assert (=> b!968392 (= lt!431786 (lemmaInListMapFromThenInFromMinusOne!55 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968393 () Bool)

(declare-fun e!545887 () Bool)

(assert (=> b!968393 (= e!545887 (and e!545886 mapRes!34765))))

(declare-fun condMapEmpty!34765 () Bool)

(declare-fun mapDefault!34765 () ValueCell!10442)

(assert (=> b!968393 (= condMapEmpty!34765 (= (arr!28758 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10442)) mapDefault!34765)))))

(declare-fun b!968389 () Bool)

(declare-fun res!647991 () Bool)

(assert (=> b!968389 (=> (not res!647991) (not e!545888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968389 (= res!647991 (validKeyInArray!0 (select (arr!28759 _keys!1686) i!803)))))

(declare-fun res!647992 () Bool)

(assert (=> start!83080 (=> (not res!647992) (not e!545888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83080 (= res!647992 (validMask!0 mask!2110))))

(assert (=> start!83080 e!545888))

(assert (=> start!83080 true))

(declare-fun array_inv!22325 (array!59788) Bool)

(assert (=> start!83080 (and (array_inv!22325 _values!1400) e!545887)))

(declare-fun array_inv!22326 (array!59790) Bool)

(assert (=> start!83080 (array_inv!22326 _keys!1686)))

(assert (=> start!83080 tp!66247))

(assert (=> start!83080 tp_is_empty!21847))

(declare-fun b!968394 () Bool)

(declare-fun res!647989 () Bool)

(assert (=> b!968394 (=> (not res!647989) (not e!545888))))

(assert (=> b!968394 (= res!647989 (bvsgt from!2084 newFrom!159))))

(declare-fun b!968395 () Bool)

(declare-fun res!647993 () Bool)

(assert (=> b!968395 (=> (not res!647993) (not e!545888))))

(assert (=> b!968395 (= res!647993 (contains!5529 (getCurrentListMap!3650 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28759 _keys!1686) i!803)))))

(assert (= (and start!83080 res!647992) b!968387))

(assert (= (and b!968387 res!647990) b!968390))

(assert (= (and b!968390 res!647988) b!968388))

(assert (= (and b!968388 res!647994) b!968391))

(assert (= (and b!968391 res!647987) b!968389))

(assert (= (and b!968389 res!647991) b!968395))

(assert (= (and b!968395 res!647993) b!968394))

(assert (= (and b!968394 res!647989) b!968392))

(assert (= (and b!968393 condMapEmpty!34765) mapIsEmpty!34765))

(assert (= (and b!968393 (not condMapEmpty!34765)) mapNonEmpty!34765))

(get-info :version)

(assert (= (and mapNonEmpty!34765 ((_ is ValueCellFull!10442) mapValue!34765)) b!968385))

(assert (= (and b!968393 ((_ is ValueCellFull!10442) mapDefault!34765)) b!968386))

(assert (= start!83080 b!968393))

(declare-fun m!897319 () Bool)

(assert (=> start!83080 m!897319))

(declare-fun m!897321 () Bool)

(assert (=> start!83080 m!897321))

(declare-fun m!897323 () Bool)

(assert (=> start!83080 m!897323))

(declare-fun m!897325 () Bool)

(assert (=> b!968388 m!897325))

(declare-fun m!897327 () Bool)

(assert (=> mapNonEmpty!34765 m!897327))

(declare-fun m!897329 () Bool)

(assert (=> b!968390 m!897329))

(declare-fun m!897331 () Bool)

(assert (=> b!968392 m!897331))

(declare-fun m!897333 () Bool)

(assert (=> b!968392 m!897333))

(assert (=> b!968392 m!897331))

(assert (=> b!968392 m!897333))

(declare-fun m!897335 () Bool)

(assert (=> b!968392 m!897335))

(declare-fun m!897337 () Bool)

(assert (=> b!968392 m!897337))

(declare-fun m!897339 () Bool)

(assert (=> b!968395 m!897339))

(assert (=> b!968395 m!897333))

(assert (=> b!968395 m!897339))

(assert (=> b!968395 m!897333))

(declare-fun m!897341 () Bool)

(assert (=> b!968395 m!897341))

(assert (=> b!968389 m!897333))

(assert (=> b!968389 m!897333))

(declare-fun m!897343 () Bool)

(assert (=> b!968389 m!897343))

(check-sat (not b!968390) (not b!968392) (not b_next!19039) (not start!83080) tp_is_empty!21847 b_and!30537 (not b!968395) (not mapNonEmpty!34765) (not b!968388) (not b!968389))
(check-sat b_and!30537 (not b_next!19039))
