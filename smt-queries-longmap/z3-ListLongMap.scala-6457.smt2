; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82564 () Bool)

(assert start!82564)

(declare-fun b_free!18715 () Bool)

(declare-fun b_next!18715 () Bool)

(assert (=> start!82564 (= b_free!18715 (not b_next!18715))))

(declare-fun tp!65265 () Bool)

(declare-fun b_and!30177 () Bool)

(assert (=> start!82564 (= tp!65265 b_and!30177)))

(declare-fun b!962199 () Bool)

(declare-fun res!643976 () Bool)

(declare-fun e!542600 () Bool)

(assert (=> b!962199 (=> (not res!643976) (not e!542600))))

(declare-datatypes ((array!59060 0))(
  ( (array!59061 (arr!28399 (Array (_ BitVec 32) (_ BitVec 64))) (size!28880 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59060)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962199 (= res!643976 (validKeyInArray!0 (select (arr!28399 _keys!1686) i!803)))))

(declare-fun b!962200 () Bool)

(declare-fun res!643979 () Bool)

(assert (=> b!962200 (=> (not res!643979) (not e!542600))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!962200 (= res!643979 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28880 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28880 _keys!1686))))))

(declare-fun mapNonEmpty!34270 () Bool)

(declare-fun mapRes!34270 () Bool)

(declare-fun tp!65266 () Bool)

(declare-fun e!542602 () Bool)

(assert (=> mapNonEmpty!34270 (= mapRes!34270 (and tp!65266 e!542602))))

(declare-fun mapKey!34270 () (_ BitVec 32))

(declare-datatypes ((V!33673 0))(
  ( (V!33674 (val!10809 Int)) )
))
(declare-datatypes ((ValueCell!10277 0))(
  ( (ValueCellFull!10277 (v!13366 V!33673)) (EmptyCell!10277) )
))
(declare-datatypes ((array!59062 0))(
  ( (array!59063 (arr!28400 (Array (_ BitVec 32) ValueCell!10277)) (size!28881 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59062)

(declare-fun mapValue!34270 () ValueCell!10277)

(declare-fun mapRest!34270 () (Array (_ BitVec 32) ValueCell!10277))

(assert (=> mapNonEmpty!34270 (= (arr!28400 _values!1400) (store mapRest!34270 mapKey!34270 mapValue!34270))))

(declare-fun b!962201 () Bool)

(declare-fun res!643977 () Bool)

(assert (=> b!962201 (=> (not res!643977) (not e!542600))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962201 (= res!643977 (and (= (size!28881 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28880 _keys!1686) (size!28881 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962202 () Bool)

(declare-fun res!643975 () Bool)

(assert (=> b!962202 (=> (not res!643975) (not e!542600))))

(declare-datatypes ((List!19751 0))(
  ( (Nil!19748) (Cons!19747 (h!20909 (_ BitVec 64)) (t!28105 List!19751)) )
))
(declare-fun arrayNoDuplicates!0 (array!59060 (_ BitVec 32) List!19751) Bool)

(assert (=> b!962202 (= res!643975 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19748))))

(declare-fun mapIsEmpty!34270 () Bool)

(assert (=> mapIsEmpty!34270 mapRes!34270))

(declare-fun b!962203 () Bool)

(declare-fun res!643974 () Bool)

(assert (=> b!962203 (=> (not res!643974) (not e!542600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59060 (_ BitVec 32)) Bool)

(assert (=> b!962203 (= res!643974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!643978 () Bool)

(assert (=> start!82564 (=> (not res!643978) (not e!542600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82564 (= res!643978 (validMask!0 mask!2110))))

(assert (=> start!82564 e!542600))

(assert (=> start!82564 true))

(declare-fun e!542601 () Bool)

(declare-fun array_inv!22065 (array!59062) Bool)

(assert (=> start!82564 (and (array_inv!22065 _values!1400) e!542601)))

(declare-fun array_inv!22066 (array!59060) Bool)

(assert (=> start!82564 (array_inv!22066 _keys!1686)))

(assert (=> start!82564 tp!65265))

(declare-fun tp_is_empty!21517 () Bool)

(assert (=> start!82564 tp_is_empty!21517))

(declare-fun b!962204 () Bool)

(declare-fun e!542599 () Bool)

(assert (=> b!962204 (= e!542601 (and e!542599 mapRes!34270))))

(declare-fun condMapEmpty!34270 () Bool)

(declare-fun mapDefault!34270 () ValueCell!10277)

(assert (=> b!962204 (= condMapEmpty!34270 (= (arr!28400 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10277)) mapDefault!34270)))))

(declare-fun b!962205 () Bool)

(assert (=> b!962205 (= e!542602 tp_is_empty!21517)))

(declare-fun b!962206 () Bool)

(assert (=> b!962206 (= e!542599 tp_is_empty!21517)))

(declare-fun b!962207 () Bool)

(assert (=> b!962207 (= e!542600 false)))

(declare-fun minValue!1342 () V!33673)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430640 () Bool)

(declare-fun zeroValue!1342 () V!33673)

(declare-datatypes ((tuple2!13942 0))(
  ( (tuple2!13943 (_1!6982 (_ BitVec 64)) (_2!6982 V!33673)) )
))
(declare-datatypes ((List!19752 0))(
  ( (Nil!19749) (Cons!19748 (h!20910 tuple2!13942) (t!28106 List!19752)) )
))
(declare-datatypes ((ListLongMap!12629 0))(
  ( (ListLongMap!12630 (toList!6330 List!19752)) )
))
(declare-fun contains!5377 (ListLongMap!12629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3492 (array!59060 array!59062 (_ BitVec 32) (_ BitVec 32) V!33673 V!33673 (_ BitVec 32) Int) ListLongMap!12629)

(assert (=> b!962207 (= lt!430640 (contains!5377 (getCurrentListMap!3492 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28399 _keys!1686) i!803)))))

(assert (= (and start!82564 res!643978) b!962201))

(assert (= (and b!962201 res!643977) b!962203))

(assert (= (and b!962203 res!643974) b!962202))

(assert (= (and b!962202 res!643975) b!962200))

(assert (= (and b!962200 res!643979) b!962199))

(assert (= (and b!962199 res!643976) b!962207))

(assert (= (and b!962204 condMapEmpty!34270) mapIsEmpty!34270))

(assert (= (and b!962204 (not condMapEmpty!34270)) mapNonEmpty!34270))

(get-info :version)

(assert (= (and mapNonEmpty!34270 ((_ is ValueCellFull!10277) mapValue!34270)) b!962205))

(assert (= (and b!962204 ((_ is ValueCellFull!10277) mapDefault!34270)) b!962206))

(assert (= start!82564 b!962204))

(declare-fun m!891331 () Bool)

(assert (=> b!962199 m!891331))

(assert (=> b!962199 m!891331))

(declare-fun m!891333 () Bool)

(assert (=> b!962199 m!891333))

(declare-fun m!891335 () Bool)

(assert (=> b!962202 m!891335))

(declare-fun m!891337 () Bool)

(assert (=> b!962203 m!891337))

(declare-fun m!891339 () Bool)

(assert (=> b!962207 m!891339))

(assert (=> b!962207 m!891331))

(assert (=> b!962207 m!891339))

(assert (=> b!962207 m!891331))

(declare-fun m!891341 () Bool)

(assert (=> b!962207 m!891341))

(declare-fun m!891343 () Bool)

(assert (=> mapNonEmpty!34270 m!891343))

(declare-fun m!891345 () Bool)

(assert (=> start!82564 m!891345))

(declare-fun m!891347 () Bool)

(assert (=> start!82564 m!891347))

(declare-fun m!891349 () Bool)

(assert (=> start!82564 m!891349))

(check-sat (not mapNonEmpty!34270) b_and!30177 (not start!82564) (not b_next!18715) (not b!962199) (not b!962202) tp_is_empty!21517 (not b!962203) (not b!962207))
(check-sat b_and!30177 (not b_next!18715))
