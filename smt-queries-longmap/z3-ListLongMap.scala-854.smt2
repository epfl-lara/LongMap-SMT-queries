; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20224 () Bool)

(assert start!20224)

(declare-fun b_free!4879 () Bool)

(declare-fun b_next!4879 () Bool)

(assert (=> start!20224 (= b_free!4879 (not b_next!4879))))

(declare-fun tp!17669 () Bool)

(declare-fun b_and!11639 () Bool)

(assert (=> start!20224 (= tp!17669 b_and!11639)))

(declare-fun b!198781 () Bool)

(declare-fun e!130595 () Bool)

(declare-fun e!130597 () Bool)

(declare-fun mapRes!8171 () Bool)

(assert (=> b!198781 (= e!130595 (and e!130597 mapRes!8171))))

(declare-fun condMapEmpty!8171 () Bool)

(declare-datatypes ((V!5961 0))(
  ( (V!5962 (val!2412 Int)) )
))
(declare-datatypes ((ValueCell!2024 0))(
  ( (ValueCellFull!2024 (v!4383 V!5961)) (EmptyCell!2024) )
))
(declare-datatypes ((array!8703 0))(
  ( (array!8704 (arr!4102 (Array (_ BitVec 32) ValueCell!2024)) (size!4427 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8703)

(declare-fun mapDefault!8171 () ValueCell!2024)

(assert (=> b!198781 (= condMapEmpty!8171 (= (arr!4102 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2024)) mapDefault!8171)))))

(declare-fun b!198782 () Bool)

(declare-fun e!130594 () Bool)

(declare-fun tp_is_empty!4735 () Bool)

(assert (=> b!198782 (= e!130594 tp_is_empty!4735)))

(declare-fun b!198783 () Bool)

(declare-fun res!94321 () Bool)

(declare-fun e!130598 () Bool)

(assert (=> b!198783 (=> (not res!94321) (not e!130598))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198783 (= res!94321 (validKeyInArray!0 k0!843))))

(declare-fun b!198784 () Bool)

(assert (=> b!198784 (= e!130598 (not true))))

(declare-datatypes ((tuple2!3594 0))(
  ( (tuple2!3595 (_1!1808 (_ BitVec 64)) (_2!1808 V!5961)) )
))
(declare-datatypes ((List!2516 0))(
  ( (Nil!2513) (Cons!2512 (h!3154 tuple2!3594) (t!7439 List!2516)) )
))
(declare-datatypes ((ListLongMap!2509 0))(
  ( (ListLongMap!2510 (toList!1270 List!2516)) )
))
(declare-fun lt!98078 () ListLongMap!2509)

(declare-fun lt!98077 () ListLongMap!2509)

(assert (=> b!198784 (and (= lt!98078 lt!98077) (= lt!98077 lt!98078))))

(declare-fun lt!98075 () ListLongMap!2509)

(declare-fun v!520 () V!5961)

(declare-fun +!324 (ListLongMap!2509 tuple2!3594) ListLongMap!2509)

(assert (=> b!198784 (= lt!98077 (+!324 lt!98075 (tuple2!3595 k0!843 v!520)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((Unit!5934 0))(
  ( (Unit!5935) )
))
(declare-fun lt!98076 () Unit!5934)

(declare-fun zeroValue!615 () V!5961)

(declare-datatypes ((array!8705 0))(
  ( (array!8706 (arr!4103 (Array (_ BitVec 32) (_ BitVec 64))) (size!4428 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8705)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5961)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!3 (array!8705 array!8703 (_ BitVec 32) (_ BitVec 32) V!5961 V!5961 (_ BitVec 32) (_ BitVec 64) V!5961 (_ BitVec 32) Int) Unit!5934)

(assert (=> b!198784 (= lt!98076 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!3 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!260 (array!8705 array!8703 (_ BitVec 32) (_ BitVec 32) V!5961 V!5961 (_ BitVec 32) Int) ListLongMap!2509)

(assert (=> b!198784 (= lt!98078 (getCurrentListMapNoExtraKeys!260 _keys!825 (array!8704 (store (arr!4102 _values!649) i!601 (ValueCellFull!2024 v!520)) (size!4427 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198784 (= lt!98075 (getCurrentListMapNoExtraKeys!260 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198785 () Bool)

(declare-fun res!94316 () Bool)

(assert (=> b!198785 (=> (not res!94316) (not e!130598))))

(assert (=> b!198785 (= res!94316 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4428 _keys!825))))))

(declare-fun res!94320 () Bool)

(assert (=> start!20224 (=> (not res!94320) (not e!130598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20224 (= res!94320 (validMask!0 mask!1149))))

(assert (=> start!20224 e!130598))

(declare-fun array_inv!2675 (array!8703) Bool)

(assert (=> start!20224 (and (array_inv!2675 _values!649) e!130595)))

(assert (=> start!20224 true))

(assert (=> start!20224 tp_is_empty!4735))

(declare-fun array_inv!2676 (array!8705) Bool)

(assert (=> start!20224 (array_inv!2676 _keys!825)))

(assert (=> start!20224 tp!17669))

(declare-fun b!198786 () Bool)

(declare-fun res!94318 () Bool)

(assert (=> b!198786 (=> (not res!94318) (not e!130598))))

(declare-datatypes ((List!2517 0))(
  ( (Nil!2514) (Cons!2513 (h!3155 (_ BitVec 64)) (t!7440 List!2517)) )
))
(declare-fun arrayNoDuplicates!0 (array!8705 (_ BitVec 32) List!2517) Bool)

(assert (=> b!198786 (= res!94318 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2514))))

(declare-fun b!198787 () Bool)

(declare-fun res!94319 () Bool)

(assert (=> b!198787 (=> (not res!94319) (not e!130598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8705 (_ BitVec 32)) Bool)

(assert (=> b!198787 (= res!94319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198788 () Bool)

(assert (=> b!198788 (= e!130597 tp_is_empty!4735)))

(declare-fun mapIsEmpty!8171 () Bool)

(assert (=> mapIsEmpty!8171 mapRes!8171))

(declare-fun b!198789 () Bool)

(declare-fun res!94317 () Bool)

(assert (=> b!198789 (=> (not res!94317) (not e!130598))))

(assert (=> b!198789 (= res!94317 (= (select (arr!4103 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8171 () Bool)

(declare-fun tp!17668 () Bool)

(assert (=> mapNonEmpty!8171 (= mapRes!8171 (and tp!17668 e!130594))))

(declare-fun mapValue!8171 () ValueCell!2024)

(declare-fun mapKey!8171 () (_ BitVec 32))

(declare-fun mapRest!8171 () (Array (_ BitVec 32) ValueCell!2024))

(assert (=> mapNonEmpty!8171 (= (arr!4102 _values!649) (store mapRest!8171 mapKey!8171 mapValue!8171))))

(declare-fun b!198790 () Bool)

(declare-fun res!94315 () Bool)

(assert (=> b!198790 (=> (not res!94315) (not e!130598))))

(assert (=> b!198790 (= res!94315 (and (= (size!4427 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4428 _keys!825) (size!4427 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20224 res!94320) b!198790))

(assert (= (and b!198790 res!94315) b!198787))

(assert (= (and b!198787 res!94319) b!198786))

(assert (= (and b!198786 res!94318) b!198785))

(assert (= (and b!198785 res!94316) b!198783))

(assert (= (and b!198783 res!94321) b!198789))

(assert (= (and b!198789 res!94317) b!198784))

(assert (= (and b!198781 condMapEmpty!8171) mapIsEmpty!8171))

(assert (= (and b!198781 (not condMapEmpty!8171)) mapNonEmpty!8171))

(get-info :version)

(assert (= (and mapNonEmpty!8171 ((_ is ValueCellFull!2024) mapValue!8171)) b!198782))

(assert (= (and b!198781 ((_ is ValueCellFull!2024) mapDefault!8171)) b!198788))

(assert (= start!20224 b!198781))

(declare-fun m!225471 () Bool)

(assert (=> b!198786 m!225471))

(declare-fun m!225473 () Bool)

(assert (=> b!198784 m!225473))

(declare-fun m!225475 () Bool)

(assert (=> b!198784 m!225475))

(declare-fun m!225477 () Bool)

(assert (=> b!198784 m!225477))

(declare-fun m!225479 () Bool)

(assert (=> b!198784 m!225479))

(declare-fun m!225481 () Bool)

(assert (=> b!198784 m!225481))

(declare-fun m!225483 () Bool)

(assert (=> mapNonEmpty!8171 m!225483))

(declare-fun m!225485 () Bool)

(assert (=> b!198787 m!225485))

(declare-fun m!225487 () Bool)

(assert (=> b!198789 m!225487))

(declare-fun m!225489 () Bool)

(assert (=> b!198783 m!225489))

(declare-fun m!225491 () Bool)

(assert (=> start!20224 m!225491))

(declare-fun m!225493 () Bool)

(assert (=> start!20224 m!225493))

(declare-fun m!225495 () Bool)

(assert (=> start!20224 m!225495))

(check-sat (not b!198786) (not b!198783) (not b_next!4879) (not b!198787) tp_is_empty!4735 (not mapNonEmpty!8171) (not b!198784) b_and!11639 (not start!20224))
(check-sat b_and!11639 (not b_next!4879))
