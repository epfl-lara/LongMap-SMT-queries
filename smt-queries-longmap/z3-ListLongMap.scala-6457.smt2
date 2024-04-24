; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82750 () Bool)

(assert start!82750)

(declare-fun b_free!18715 () Bool)

(declare-fun b_next!18715 () Bool)

(assert (=> start!82750 (= b_free!18715 (not b_next!18715))))

(declare-fun tp!65265 () Bool)

(declare-fun b_and!30213 () Bool)

(assert (=> start!82750 (= tp!65265 b_and!30213)))

(declare-fun res!644433 () Bool)

(declare-fun e!543332 () Bool)

(assert (=> start!82750 (=> (not res!644433) (not e!543332))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82750 (= res!644433 (validMask!0 mask!2110))))

(assert (=> start!82750 e!543332))

(assert (=> start!82750 true))

(declare-datatypes ((V!33673 0))(
  ( (V!33674 (val!10809 Int)) )
))
(declare-datatypes ((ValueCell!10277 0))(
  ( (ValueCellFull!10277 (v!13364 V!33673)) (EmptyCell!10277) )
))
(declare-datatypes ((array!59148 0))(
  ( (array!59149 (arr!28438 (Array (_ BitVec 32) ValueCell!10277)) (size!28918 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59148)

(declare-fun e!543329 () Bool)

(declare-fun array_inv!22105 (array!59148) Bool)

(assert (=> start!82750 (and (array_inv!22105 _values!1400) e!543329)))

(declare-datatypes ((array!59150 0))(
  ( (array!59151 (arr!28439 (Array (_ BitVec 32) (_ BitVec 64))) (size!28919 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59150)

(declare-fun array_inv!22106 (array!59150) Bool)

(assert (=> start!82750 (array_inv!22106 _keys!1686)))

(assert (=> start!82750 tp!65265))

(declare-fun tp_is_empty!21517 () Bool)

(assert (=> start!82750 tp_is_empty!21517))

(declare-fun b!963341 () Bool)

(declare-fun e!543330 () Bool)

(assert (=> b!963341 (= e!543330 tp_is_empty!21517)))

(declare-fun b!963342 () Bool)

(declare-fun res!644428 () Bool)

(assert (=> b!963342 (=> (not res!644428) (not e!543332))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963342 (= res!644428 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28919 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28919 _keys!1686))))))

(declare-fun b!963343 () Bool)

(declare-fun res!644430 () Bool)

(assert (=> b!963343 (=> (not res!644430) (not e!543332))))

(declare-datatypes ((List!19714 0))(
  ( (Nil!19711) (Cons!19710 (h!20878 (_ BitVec 64)) (t!28069 List!19714)) )
))
(declare-fun arrayNoDuplicates!0 (array!59150 (_ BitVec 32) List!19714) Bool)

(assert (=> b!963343 (= res!644430 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19711))))

(declare-fun b!963344 () Bool)

(declare-fun e!543331 () Bool)

(assert (=> b!963344 (= e!543331 tp_is_empty!21517)))

(declare-fun mapNonEmpty!34270 () Bool)

(declare-fun mapRes!34270 () Bool)

(declare-fun tp!65266 () Bool)

(assert (=> mapNonEmpty!34270 (= mapRes!34270 (and tp!65266 e!543331))))

(declare-fun mapKey!34270 () (_ BitVec 32))

(declare-fun mapRest!34270 () (Array (_ BitVec 32) ValueCell!10277))

(declare-fun mapValue!34270 () ValueCell!10277)

(assert (=> mapNonEmpty!34270 (= (arr!28438 _values!1400) (store mapRest!34270 mapKey!34270 mapValue!34270))))

(declare-fun mapIsEmpty!34270 () Bool)

(assert (=> mapIsEmpty!34270 mapRes!34270))

(declare-fun b!963345 () Bool)

(assert (=> b!963345 (= e!543332 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431237 () Bool)

(declare-fun minValue!1342 () V!33673)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33673)

(declare-datatypes ((tuple2!13862 0))(
  ( (tuple2!13863 (_1!6942 (_ BitVec 64)) (_2!6942 V!33673)) )
))
(declare-datatypes ((List!19715 0))(
  ( (Nil!19712) (Cons!19711 (h!20879 tuple2!13862) (t!28070 List!19715)) )
))
(declare-datatypes ((ListLongMap!12561 0))(
  ( (ListLongMap!12562 (toList!6296 List!19715)) )
))
(declare-fun contains!5411 (ListLongMap!12561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3529 (array!59150 array!59148 (_ BitVec 32) (_ BitVec 32) V!33673 V!33673 (_ BitVec 32) Int) ListLongMap!12561)

(assert (=> b!963345 (= lt!431237 (contains!5411 (getCurrentListMap!3529 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28439 _keys!1686) i!803)))))

(declare-fun b!963346 () Bool)

(declare-fun res!644432 () Bool)

(assert (=> b!963346 (=> (not res!644432) (not e!543332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59150 (_ BitVec 32)) Bool)

(assert (=> b!963346 (= res!644432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963347 () Bool)

(assert (=> b!963347 (= e!543329 (and e!543330 mapRes!34270))))

(declare-fun condMapEmpty!34270 () Bool)

(declare-fun mapDefault!34270 () ValueCell!10277)

(assert (=> b!963347 (= condMapEmpty!34270 (= (arr!28438 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10277)) mapDefault!34270)))))

(declare-fun b!963348 () Bool)

(declare-fun res!644431 () Bool)

(assert (=> b!963348 (=> (not res!644431) (not e!543332))))

(assert (=> b!963348 (= res!644431 (and (= (size!28918 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28919 _keys!1686) (size!28918 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963349 () Bool)

(declare-fun res!644429 () Bool)

(assert (=> b!963349 (=> (not res!644429) (not e!543332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963349 (= res!644429 (validKeyInArray!0 (select (arr!28439 _keys!1686) i!803)))))

(assert (= (and start!82750 res!644433) b!963348))

(assert (= (and b!963348 res!644431) b!963346))

(assert (= (and b!963346 res!644432) b!963343))

(assert (= (and b!963343 res!644430) b!963342))

(assert (= (and b!963342 res!644428) b!963349))

(assert (= (and b!963349 res!644429) b!963345))

(assert (= (and b!963347 condMapEmpty!34270) mapIsEmpty!34270))

(assert (= (and b!963347 (not condMapEmpty!34270)) mapNonEmpty!34270))

(get-info :version)

(assert (= (and mapNonEmpty!34270 ((_ is ValueCellFull!10277) mapValue!34270)) b!963344))

(assert (= (and b!963347 ((_ is ValueCellFull!10277) mapDefault!34270)) b!963341))

(assert (= start!82750 b!963347))

(declare-fun m!893383 () Bool)

(assert (=> start!82750 m!893383))

(declare-fun m!893385 () Bool)

(assert (=> start!82750 m!893385))

(declare-fun m!893387 () Bool)

(assert (=> start!82750 m!893387))

(declare-fun m!893389 () Bool)

(assert (=> b!963345 m!893389))

(declare-fun m!893391 () Bool)

(assert (=> b!963345 m!893391))

(assert (=> b!963345 m!893389))

(assert (=> b!963345 m!893391))

(declare-fun m!893393 () Bool)

(assert (=> b!963345 m!893393))

(declare-fun m!893395 () Bool)

(assert (=> b!963346 m!893395))

(assert (=> b!963349 m!893391))

(assert (=> b!963349 m!893391))

(declare-fun m!893397 () Bool)

(assert (=> b!963349 m!893397))

(declare-fun m!893399 () Bool)

(assert (=> mapNonEmpty!34270 m!893399))

(declare-fun m!893401 () Bool)

(assert (=> b!963343 m!893401))

(check-sat b_and!30213 (not b!963345) (not mapNonEmpty!34270) (not b!963346) tp_is_empty!21517 (not start!82750) (not b!963343) (not b_next!18715) (not b!963349))
(check-sat b_and!30213 (not b_next!18715))
