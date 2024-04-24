; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20092 () Bool)

(assert start!20092)

(declare-fun b_free!4747 () Bool)

(declare-fun b_next!4747 () Bool)

(assert (=> start!20092 (= b_free!4747 (not b_next!4747))))

(declare-fun tp!17273 () Bool)

(declare-fun b_and!11507 () Bool)

(assert (=> start!20092 (= tp!17273 b_and!11507)))

(declare-fun b!196801 () Bool)

(declare-fun res!92930 () Bool)

(declare-fun e!129604 () Bool)

(assert (=> b!196801 (=> (not res!92930) (not e!129604))))

(declare-datatypes ((array!8451 0))(
  ( (array!8452 (arr!3976 (Array (_ BitVec 32) (_ BitVec 64))) (size!4301 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8451)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8451 (_ BitVec 32)) Bool)

(assert (=> b!196801 (= res!92930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196802 () Bool)

(declare-fun res!92935 () Bool)

(assert (=> b!196802 (=> (not res!92935) (not e!129604))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196802 (= res!92935 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4301 _keys!825))))))

(declare-fun b!196803 () Bool)

(declare-fun e!129607 () Bool)

(declare-fun tp_is_empty!4603 () Bool)

(assert (=> b!196803 (= e!129607 tp_is_empty!4603)))

(declare-fun res!92932 () Bool)

(assert (=> start!20092 (=> (not res!92932) (not e!129604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20092 (= res!92932 (validMask!0 mask!1149))))

(assert (=> start!20092 e!129604))

(declare-datatypes ((V!5785 0))(
  ( (V!5786 (val!2346 Int)) )
))
(declare-datatypes ((ValueCell!1958 0))(
  ( (ValueCellFull!1958 (v!4317 V!5785)) (EmptyCell!1958) )
))
(declare-datatypes ((array!8453 0))(
  ( (array!8454 (arr!3977 (Array (_ BitVec 32) ValueCell!1958)) (size!4302 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8453)

(declare-fun e!129605 () Bool)

(declare-fun array_inv!2581 (array!8453) Bool)

(assert (=> start!20092 (and (array_inv!2581 _values!649) e!129605)))

(assert (=> start!20092 true))

(assert (=> start!20092 tp_is_empty!4603))

(declare-fun array_inv!2582 (array!8451) Bool)

(assert (=> start!20092 (array_inv!2582 _keys!825)))

(assert (=> start!20092 tp!17273))

(declare-fun b!196804 () Bool)

(declare-fun e!129608 () Bool)

(declare-fun mapRes!7973 () Bool)

(assert (=> b!196804 (= e!129605 (and e!129608 mapRes!7973))))

(declare-fun condMapEmpty!7973 () Bool)

(declare-fun mapDefault!7973 () ValueCell!1958)

(assert (=> b!196804 (= condMapEmpty!7973 (= (arr!3977 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1958)) mapDefault!7973)))))

(declare-fun b!196805 () Bool)

(declare-fun res!92929 () Bool)

(assert (=> b!196805 (=> (not res!92929) (not e!129604))))

(declare-datatypes ((List!2435 0))(
  ( (Nil!2432) (Cons!2431 (h!3073 (_ BitVec 64)) (t!7358 List!2435)) )
))
(declare-fun arrayNoDuplicates!0 (array!8451 (_ BitVec 32) List!2435) Bool)

(assert (=> b!196805 (= res!92929 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2432))))

(declare-fun b!196806 () Bool)

(declare-fun res!92934 () Bool)

(assert (=> b!196806 (=> (not res!92934) (not e!129604))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196806 (= res!92934 (validKeyInArray!0 k0!843))))

(declare-fun b!196807 () Bool)

(declare-fun res!92933 () Bool)

(assert (=> b!196807 (=> (not res!92933) (not e!129604))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196807 (= res!92933 (and (= (size!4302 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4301 _keys!825) (size!4302 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196808 () Bool)

(assert (=> b!196808 (= e!129604 false)))

(declare-fun zeroValue!615 () V!5785)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5785)

(declare-datatypes ((tuple2!3516 0))(
  ( (tuple2!3517 (_1!1769 (_ BitVec 64)) (_2!1769 V!5785)) )
))
(declare-datatypes ((List!2436 0))(
  ( (Nil!2433) (Cons!2432 (h!3074 tuple2!3516) (t!7359 List!2436)) )
))
(declare-datatypes ((ListLongMap!2431 0))(
  ( (ListLongMap!2432 (toList!1231 List!2436)) )
))
(declare-fun lt!97709 () ListLongMap!2431)

(declare-fun getCurrentListMapNoExtraKeys!221 (array!8451 array!8453 (_ BitVec 32) (_ BitVec 32) V!5785 V!5785 (_ BitVec 32) Int) ListLongMap!2431)

(assert (=> b!196808 (= lt!97709 (getCurrentListMapNoExtraKeys!221 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196809 () Bool)

(assert (=> b!196809 (= e!129608 tp_is_empty!4603)))

(declare-fun b!196810 () Bool)

(declare-fun res!92931 () Bool)

(assert (=> b!196810 (=> (not res!92931) (not e!129604))))

(assert (=> b!196810 (= res!92931 (= (select (arr!3976 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!7973 () Bool)

(declare-fun tp!17272 () Bool)

(assert (=> mapNonEmpty!7973 (= mapRes!7973 (and tp!17272 e!129607))))

(declare-fun mapValue!7973 () ValueCell!1958)

(declare-fun mapRest!7973 () (Array (_ BitVec 32) ValueCell!1958))

(declare-fun mapKey!7973 () (_ BitVec 32))

(assert (=> mapNonEmpty!7973 (= (arr!3977 _values!649) (store mapRest!7973 mapKey!7973 mapValue!7973))))

(declare-fun mapIsEmpty!7973 () Bool)

(assert (=> mapIsEmpty!7973 mapRes!7973))

(assert (= (and start!20092 res!92932) b!196807))

(assert (= (and b!196807 res!92933) b!196801))

(assert (= (and b!196801 res!92930) b!196805))

(assert (= (and b!196805 res!92929) b!196802))

(assert (= (and b!196802 res!92935) b!196806))

(assert (= (and b!196806 res!92934) b!196810))

(assert (= (and b!196810 res!92931) b!196808))

(assert (= (and b!196804 condMapEmpty!7973) mapIsEmpty!7973))

(assert (= (and b!196804 (not condMapEmpty!7973)) mapNonEmpty!7973))

(get-info :version)

(assert (= (and mapNonEmpty!7973 ((_ is ValueCellFull!1958) mapValue!7973)) b!196803))

(assert (= (and b!196804 ((_ is ValueCellFull!1958) mapDefault!7973)) b!196809))

(assert (= start!20092 b!196804))

(declare-fun m!224091 () Bool)

(assert (=> b!196801 m!224091))

(declare-fun m!224093 () Bool)

(assert (=> b!196805 m!224093))

(declare-fun m!224095 () Bool)

(assert (=> b!196806 m!224095))

(declare-fun m!224097 () Bool)

(assert (=> start!20092 m!224097))

(declare-fun m!224099 () Bool)

(assert (=> start!20092 m!224099))

(declare-fun m!224101 () Bool)

(assert (=> start!20092 m!224101))

(declare-fun m!224103 () Bool)

(assert (=> mapNonEmpty!7973 m!224103))

(declare-fun m!224105 () Bool)

(assert (=> b!196810 m!224105))

(declare-fun m!224107 () Bool)

(assert (=> b!196808 m!224107))

(check-sat (not b_next!4747) (not b!196808) (not start!20092) b_and!11507 tp_is_empty!4603 (not mapNonEmpty!7973) (not b!196806) (not b!196805) (not b!196801))
(check-sat b_and!11507 (not b_next!4747))
