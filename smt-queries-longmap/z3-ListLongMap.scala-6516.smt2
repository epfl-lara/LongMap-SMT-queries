; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82938 () Bool)

(assert start!82938)

(declare-fun b_free!19065 () Bool)

(declare-fun b_next!19065 () Bool)

(assert (=> start!82938 (= b_free!19065 (not b_next!19065))))

(declare-fun tp!66323 () Bool)

(declare-fun b_and!30553 () Bool)

(assert (=> start!82938 (= tp!66323 b_and!30553)))

(declare-fun b!967911 () Bool)

(declare-fun res!647960 () Bool)

(declare-fun e!545499 () Bool)

(assert (=> b!967911 (=> (not res!647960) (not e!545499))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967911 (= res!647960 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967912 () Bool)

(declare-fun e!545498 () Bool)

(declare-fun tp_is_empty!21873 () Bool)

(assert (=> b!967912 (= e!545498 tp_is_empty!21873)))

(declare-fun b!967913 () Bool)

(declare-fun res!647958 () Bool)

(assert (=> b!967913 (=> (not res!647958) (not e!545499))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34147 0))(
  ( (V!34148 (val!10987 Int)) )
))
(declare-datatypes ((ValueCell!10455 0))(
  ( (ValueCellFull!10455 (v!13545 V!34147)) (EmptyCell!10455) )
))
(declare-datatypes ((array!59819 0))(
  ( (array!59820 (arr!28778 (Array (_ BitVec 32) ValueCell!10455)) (size!29257 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59819)

(declare-datatypes ((array!59821 0))(
  ( (array!59822 (arr!28779 (Array (_ BitVec 32) (_ BitVec 64))) (size!29258 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59821)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!967913 (= res!647958 (and (= (size!29257 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29258 _keys!1686) (size!29257 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967914 () Bool)

(declare-fun res!647959 () Bool)

(assert (=> b!967914 (=> (not res!647959) (not e!545499))))

(declare-fun minValue!1342 () V!34147)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34147)

(declare-datatypes ((tuple2!14132 0))(
  ( (tuple2!14133 (_1!7077 (_ BitVec 64)) (_2!7077 V!34147)) )
))
(declare-datatypes ((List!19980 0))(
  ( (Nil!19977) (Cons!19976 (h!21138 tuple2!14132) (t!28343 List!19980)) )
))
(declare-datatypes ((ListLongMap!12829 0))(
  ( (ListLongMap!12830 (toList!6430 List!19980)) )
))
(declare-fun contains!5531 (ListLongMap!12829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3663 (array!59821 array!59819 (_ BitVec 32) (_ BitVec 32) V!34147 V!34147 (_ BitVec 32) Int) ListLongMap!12829)

(assert (=> b!967914 (= res!647959 (contains!5531 (getCurrentListMap!3663 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28779 _keys!1686) i!803)))))

(declare-fun b!967915 () Bool)

(declare-fun res!647961 () Bool)

(assert (=> b!967915 (=> (not res!647961) (not e!545499))))

(assert (=> b!967915 (= res!647961 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29258 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29258 _keys!1686))))))

(declare-fun b!967916 () Bool)

(assert (=> b!967916 (= e!545499 (not true))))

(assert (=> b!967916 (contains!5531 (getCurrentListMap!3663 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28779 _keys!1686) i!803))))

(declare-datatypes ((Unit!32341 0))(
  ( (Unit!32342) )
))
(declare-fun lt!431464 () Unit!32341)

(declare-fun lemmaInListMapFromThenInFromMinusOne!65 (array!59821 array!59819 (_ BitVec 32) (_ BitVec 32) V!34147 V!34147 (_ BitVec 32) (_ BitVec 32) Int) Unit!32341)

(assert (=> b!967916 (= lt!431464 (lemmaInListMapFromThenInFromMinusOne!65 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967917 () Bool)

(declare-fun res!647957 () Bool)

(assert (=> b!967917 (=> (not res!647957) (not e!545499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967917 (= res!647957 (validKeyInArray!0 (select (arr!28779 _keys!1686) i!803)))))

(declare-fun res!647962 () Bool)

(assert (=> start!82938 (=> (not res!647962) (not e!545499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82938 (= res!647962 (validMask!0 mask!2110))))

(assert (=> start!82938 e!545499))

(assert (=> start!82938 true))

(declare-fun e!545500 () Bool)

(declare-fun array_inv!22279 (array!59819) Bool)

(assert (=> start!82938 (and (array_inv!22279 _values!1400) e!545500)))

(declare-fun array_inv!22280 (array!59821) Bool)

(assert (=> start!82938 (array_inv!22280 _keys!1686)))

(assert (=> start!82938 tp!66323))

(assert (=> start!82938 tp_is_empty!21873))

(declare-fun b!967918 () Bool)

(declare-fun e!545501 () Bool)

(assert (=> b!967918 (= e!545501 tp_is_empty!21873)))

(declare-fun mapNonEmpty!34804 () Bool)

(declare-fun mapRes!34804 () Bool)

(declare-fun tp!66324 () Bool)

(assert (=> mapNonEmpty!34804 (= mapRes!34804 (and tp!66324 e!545501))))

(declare-fun mapRest!34804 () (Array (_ BitVec 32) ValueCell!10455))

(declare-fun mapKey!34804 () (_ BitVec 32))

(declare-fun mapValue!34804 () ValueCell!10455)

(assert (=> mapNonEmpty!34804 (= (arr!28778 _values!1400) (store mapRest!34804 mapKey!34804 mapValue!34804))))

(declare-fun b!967919 () Bool)

(declare-fun res!647956 () Bool)

(assert (=> b!967919 (=> (not res!647956) (not e!545499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59821 (_ BitVec 32)) Bool)

(assert (=> b!967919 (= res!647956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34804 () Bool)

(assert (=> mapIsEmpty!34804 mapRes!34804))

(declare-fun b!967920 () Bool)

(assert (=> b!967920 (= e!545500 (and e!545498 mapRes!34804))))

(declare-fun condMapEmpty!34804 () Bool)

(declare-fun mapDefault!34804 () ValueCell!10455)

(assert (=> b!967920 (= condMapEmpty!34804 (= (arr!28778 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10455)) mapDefault!34804)))))

(declare-fun b!967921 () Bool)

(declare-fun res!647955 () Bool)

(assert (=> b!967921 (=> (not res!647955) (not e!545499))))

(declare-datatypes ((List!19981 0))(
  ( (Nil!19978) (Cons!19977 (h!21139 (_ BitVec 64)) (t!28344 List!19981)) )
))
(declare-fun arrayNoDuplicates!0 (array!59821 (_ BitVec 32) List!19981) Bool)

(assert (=> b!967921 (= res!647955 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19978))))

(assert (= (and start!82938 res!647962) b!967913))

(assert (= (and b!967913 res!647958) b!967919))

(assert (= (and b!967919 res!647956) b!967921))

(assert (= (and b!967921 res!647955) b!967915))

(assert (= (and b!967915 res!647961) b!967917))

(assert (= (and b!967917 res!647957) b!967914))

(assert (= (and b!967914 res!647959) b!967911))

(assert (= (and b!967911 res!647960) b!967916))

(assert (= (and b!967920 condMapEmpty!34804) mapIsEmpty!34804))

(assert (= (and b!967920 (not condMapEmpty!34804)) mapNonEmpty!34804))

(get-info :version)

(assert (= (and mapNonEmpty!34804 ((_ is ValueCellFull!10455) mapValue!34804)) b!967918))

(assert (= (and b!967920 ((_ is ValueCellFull!10455) mapDefault!34804)) b!967912))

(assert (= start!82938 b!967920))

(declare-fun m!896363 () Bool)

(assert (=> b!967916 m!896363))

(declare-fun m!896365 () Bool)

(assert (=> b!967916 m!896365))

(assert (=> b!967916 m!896363))

(assert (=> b!967916 m!896365))

(declare-fun m!896367 () Bool)

(assert (=> b!967916 m!896367))

(declare-fun m!896369 () Bool)

(assert (=> b!967916 m!896369))

(declare-fun m!896371 () Bool)

(assert (=> b!967914 m!896371))

(assert (=> b!967914 m!896365))

(assert (=> b!967914 m!896371))

(assert (=> b!967914 m!896365))

(declare-fun m!896373 () Bool)

(assert (=> b!967914 m!896373))

(declare-fun m!896375 () Bool)

(assert (=> b!967919 m!896375))

(declare-fun m!896377 () Bool)

(assert (=> mapNonEmpty!34804 m!896377))

(declare-fun m!896379 () Bool)

(assert (=> b!967921 m!896379))

(assert (=> b!967917 m!896365))

(assert (=> b!967917 m!896365))

(declare-fun m!896381 () Bool)

(assert (=> b!967917 m!896381))

(declare-fun m!896383 () Bool)

(assert (=> start!82938 m!896383))

(declare-fun m!896385 () Bool)

(assert (=> start!82938 m!896385))

(declare-fun m!896387 () Bool)

(assert (=> start!82938 m!896387))

(check-sat (not b!967921) (not b!967917) (not start!82938) (not mapNonEmpty!34804) (not b!967914) (not b!967919) (not b_next!19065) b_and!30553 (not b!967916) tp_is_empty!21873)
(check-sat b_and!30553 (not b_next!19065))
