; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20416 () Bool)

(assert start!20416)

(declare-fun b_free!5071 () Bool)

(declare-fun b_next!5071 () Bool)

(assert (=> start!20416 (= b_free!5071 (not b_next!5071))))

(declare-fun tp!18245 () Bool)

(declare-fun b_and!11791 () Bool)

(assert (=> start!20416 (= tp!18245 b_and!11791)))

(declare-fun b!201759 () Bool)

(declare-fun e!132194 () Bool)

(declare-fun tp_is_empty!4927 () Bool)

(assert (=> b!201759 (= e!132194 tp_is_empty!4927)))

(declare-fun b!201760 () Bool)

(declare-fun res!96514 () Bool)

(declare-fun e!132192 () Bool)

(assert (=> b!201760 (=> (not res!96514) (not e!132192))))

(declare-datatypes ((array!9067 0))(
  ( (array!9068 (arr!4283 (Array (_ BitVec 32) (_ BitVec 64))) (size!4609 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9067)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9067 (_ BitVec 32)) Bool)

(assert (=> b!201760 (= res!96514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201761 () Bool)

(declare-fun res!96507 () Bool)

(assert (=> b!201761 (=> (not res!96507) (not e!132192))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201761 (= res!96507 (validKeyInArray!0 k0!843))))

(declare-fun b!201762 () Bool)

(declare-fun e!132197 () Bool)

(assert (=> b!201762 (= e!132197 tp_is_empty!4927)))

(declare-fun b!201763 () Bool)

(declare-fun res!96511 () Bool)

(assert (=> b!201763 (=> (not res!96511) (not e!132192))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6217 0))(
  ( (V!6218 (val!2508 Int)) )
))
(declare-datatypes ((ValueCell!2120 0))(
  ( (ValueCellFull!2120 (v!4472 V!6217)) (EmptyCell!2120) )
))
(declare-datatypes ((array!9069 0))(
  ( (array!9070 (arr!4284 (Array (_ BitVec 32) ValueCell!2120)) (size!4610 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9069)

(assert (=> b!201763 (= res!96511 (and (= (size!4610 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4609 _keys!825) (size!4610 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201764 () Bool)

(declare-fun res!96509 () Bool)

(assert (=> b!201764 (=> (not res!96509) (not e!132192))))

(declare-datatypes ((List!2692 0))(
  ( (Nil!2689) (Cons!2688 (h!3330 (_ BitVec 64)) (t!7614 List!2692)) )
))
(declare-fun arrayNoDuplicates!0 (array!9067 (_ BitVec 32) List!2692) Bool)

(assert (=> b!201764 (= res!96509 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2689))))

(declare-fun b!201765 () Bool)

(declare-fun e!132196 () Bool)

(declare-fun mapRes!8459 () Bool)

(assert (=> b!201765 (= e!132196 (and e!132197 mapRes!8459))))

(declare-fun condMapEmpty!8459 () Bool)

(declare-fun mapDefault!8459 () ValueCell!2120)

(assert (=> b!201765 (= condMapEmpty!8459 (= (arr!4284 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2120)) mapDefault!8459)))))

(declare-fun mapNonEmpty!8459 () Bool)

(declare-fun tp!18244 () Bool)

(assert (=> mapNonEmpty!8459 (= mapRes!8459 (and tp!18244 e!132194))))

(declare-fun mapRest!8459 () (Array (_ BitVec 32) ValueCell!2120))

(declare-fun mapKey!8459 () (_ BitVec 32))

(declare-fun mapValue!8459 () ValueCell!2120)

(assert (=> mapNonEmpty!8459 (= (arr!4284 _values!649) (store mapRest!8459 mapKey!8459 mapValue!8459))))

(declare-fun b!201766 () Bool)

(declare-fun res!96515 () Bool)

(assert (=> b!201766 (=> (not res!96515) (not e!132192))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201766 (= res!96515 (= (select (arr!4283 _keys!825) i!601) k0!843))))

(declare-fun res!96512 () Bool)

(assert (=> start!20416 (=> (not res!96512) (not e!132192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20416 (= res!96512 (validMask!0 mask!1149))))

(assert (=> start!20416 e!132192))

(declare-fun array_inv!2809 (array!9069) Bool)

(assert (=> start!20416 (and (array_inv!2809 _values!649) e!132196)))

(assert (=> start!20416 true))

(assert (=> start!20416 tp_is_empty!4927))

(declare-fun array_inv!2810 (array!9067) Bool)

(assert (=> start!20416 (array_inv!2810 _keys!825)))

(assert (=> start!20416 tp!18245))

(declare-fun b!201767 () Bool)

(declare-fun e!132193 () Bool)

(assert (=> b!201767 (= e!132193 true)))

(declare-datatypes ((tuple2!3774 0))(
  ( (tuple2!3775 (_1!1898 (_ BitVec 64)) (_2!1898 V!6217)) )
))
(declare-fun lt!100815 () tuple2!3774)

(declare-datatypes ((List!2693 0))(
  ( (Nil!2690) (Cons!2689 (h!3331 tuple2!3774) (t!7615 List!2693)) )
))
(declare-datatypes ((ListLongMap!2677 0))(
  ( (ListLongMap!2678 (toList!1354 List!2693)) )
))
(declare-fun lt!100821 () ListLongMap!2677)

(declare-fun lt!100822 () ListLongMap!2677)

(declare-fun lt!100819 () tuple2!3774)

(declare-fun +!403 (ListLongMap!2677 tuple2!3774) ListLongMap!2677)

(assert (=> b!201767 (= (+!403 lt!100822 lt!100819) (+!403 lt!100821 lt!100815))))

(declare-fun minValue!615 () V!6217)

(declare-fun v!520 () V!6217)

(declare-fun lt!100817 () ListLongMap!2677)

(declare-datatypes ((Unit!6058 0))(
  ( (Unit!6059) )
))
(declare-fun lt!100824 () Unit!6058)

(declare-fun addCommutativeForDiffKeys!112 (ListLongMap!2677 (_ BitVec 64) V!6217 (_ BitVec 64) V!6217) Unit!6058)

(assert (=> b!201767 (= lt!100824 (addCommutativeForDiffKeys!112 lt!100817 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8459 () Bool)

(assert (=> mapIsEmpty!8459 mapRes!8459))

(declare-fun b!201768 () Bool)

(declare-fun e!132198 () Bool)

(assert (=> b!201768 (= e!132198 e!132193)))

(declare-fun res!96508 () Bool)

(assert (=> b!201768 (=> res!96508 e!132193)))

(assert (=> b!201768 (= res!96508 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100812 () ListLongMap!2677)

(assert (=> b!201768 (= lt!100812 lt!100822)))

(assert (=> b!201768 (= lt!100822 (+!403 lt!100817 lt!100815))))

(declare-fun lt!100816 () ListLongMap!2677)

(declare-fun zeroValue!615 () V!6217)

(declare-fun lt!100820 () Unit!6058)

(assert (=> b!201768 (= lt!100820 (addCommutativeForDiffKeys!112 lt!100816 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100818 () ListLongMap!2677)

(assert (=> b!201768 (= lt!100818 (+!403 lt!100812 lt!100819))))

(declare-fun lt!100811 () ListLongMap!2677)

(declare-fun lt!100813 () tuple2!3774)

(assert (=> b!201768 (= lt!100812 (+!403 lt!100811 lt!100813))))

(declare-fun lt!100823 () ListLongMap!2677)

(assert (=> b!201768 (= lt!100823 lt!100821)))

(assert (=> b!201768 (= lt!100821 (+!403 lt!100817 lt!100819))))

(assert (=> b!201768 (= lt!100817 (+!403 lt!100816 lt!100813))))

(declare-fun lt!100826 () ListLongMap!2677)

(assert (=> b!201768 (= lt!100818 (+!403 (+!403 lt!100826 lt!100813) lt!100819))))

(assert (=> b!201768 (= lt!100819 (tuple2!3775 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201768 (= lt!100813 (tuple2!3775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201769 () Bool)

(assert (=> b!201769 (= e!132192 (not e!132198))))

(declare-fun res!96513 () Bool)

(assert (=> b!201769 (=> res!96513 e!132198)))

(assert (=> b!201769 (= res!96513 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!913 (array!9067 array!9069 (_ BitVec 32) (_ BitVec 32) V!6217 V!6217 (_ BitVec 32) Int) ListLongMap!2677)

(assert (=> b!201769 (= lt!100823 (getCurrentListMap!913 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100825 () array!9069)

(assert (=> b!201769 (= lt!100818 (getCurrentListMap!913 _keys!825 lt!100825 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201769 (and (= lt!100826 lt!100811) (= lt!100811 lt!100826))))

(assert (=> b!201769 (= lt!100811 (+!403 lt!100816 lt!100815))))

(assert (=> b!201769 (= lt!100815 (tuple2!3775 k0!843 v!520))))

(declare-fun lt!100814 () Unit!6058)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!72 (array!9067 array!9069 (_ BitVec 32) (_ BitVec 32) V!6217 V!6217 (_ BitVec 32) (_ BitVec 64) V!6217 (_ BitVec 32) Int) Unit!6058)

(assert (=> b!201769 (= lt!100814 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!72 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!323 (array!9067 array!9069 (_ BitVec 32) (_ BitVec 32) V!6217 V!6217 (_ BitVec 32) Int) ListLongMap!2677)

(assert (=> b!201769 (= lt!100826 (getCurrentListMapNoExtraKeys!323 _keys!825 lt!100825 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201769 (= lt!100825 (array!9070 (store (arr!4284 _values!649) i!601 (ValueCellFull!2120 v!520)) (size!4610 _values!649)))))

(assert (=> b!201769 (= lt!100816 (getCurrentListMapNoExtraKeys!323 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201770 () Bool)

(declare-fun res!96510 () Bool)

(assert (=> b!201770 (=> (not res!96510) (not e!132192))))

(assert (=> b!201770 (= res!96510 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4609 _keys!825))))))

(assert (= (and start!20416 res!96512) b!201763))

(assert (= (and b!201763 res!96511) b!201760))

(assert (= (and b!201760 res!96514) b!201764))

(assert (= (and b!201764 res!96509) b!201770))

(assert (= (and b!201770 res!96510) b!201761))

(assert (= (and b!201761 res!96507) b!201766))

(assert (= (and b!201766 res!96515) b!201769))

(assert (= (and b!201769 (not res!96513)) b!201768))

(assert (= (and b!201768 (not res!96508)) b!201767))

(assert (= (and b!201765 condMapEmpty!8459) mapIsEmpty!8459))

(assert (= (and b!201765 (not condMapEmpty!8459)) mapNonEmpty!8459))

(get-info :version)

(assert (= (and mapNonEmpty!8459 ((_ is ValueCellFull!2120) mapValue!8459)) b!201759))

(assert (= (and b!201765 ((_ is ValueCellFull!2120) mapDefault!8459)) b!201762))

(assert (= start!20416 b!201765))

(declare-fun m!228423 () Bool)

(assert (=> b!201761 m!228423))

(declare-fun m!228425 () Bool)

(assert (=> mapNonEmpty!8459 m!228425))

(declare-fun m!228427 () Bool)

(assert (=> b!201760 m!228427))

(declare-fun m!228429 () Bool)

(assert (=> b!201769 m!228429))

(declare-fun m!228431 () Bool)

(assert (=> b!201769 m!228431))

(declare-fun m!228433 () Bool)

(assert (=> b!201769 m!228433))

(declare-fun m!228435 () Bool)

(assert (=> b!201769 m!228435))

(declare-fun m!228437 () Bool)

(assert (=> b!201769 m!228437))

(declare-fun m!228439 () Bool)

(assert (=> b!201769 m!228439))

(declare-fun m!228441 () Bool)

(assert (=> b!201769 m!228441))

(declare-fun m!228443 () Bool)

(assert (=> b!201768 m!228443))

(declare-fun m!228445 () Bool)

(assert (=> b!201768 m!228445))

(declare-fun m!228447 () Bool)

(assert (=> b!201768 m!228447))

(declare-fun m!228449 () Bool)

(assert (=> b!201768 m!228449))

(declare-fun m!228451 () Bool)

(assert (=> b!201768 m!228451))

(declare-fun m!228453 () Bool)

(assert (=> b!201768 m!228453))

(declare-fun m!228455 () Bool)

(assert (=> b!201768 m!228455))

(assert (=> b!201768 m!228449))

(declare-fun m!228457 () Bool)

(assert (=> b!201768 m!228457))

(declare-fun m!228459 () Bool)

(assert (=> start!20416 m!228459))

(declare-fun m!228461 () Bool)

(assert (=> start!20416 m!228461))

(declare-fun m!228463 () Bool)

(assert (=> start!20416 m!228463))

(declare-fun m!228465 () Bool)

(assert (=> b!201764 m!228465))

(declare-fun m!228467 () Bool)

(assert (=> b!201767 m!228467))

(declare-fun m!228469 () Bool)

(assert (=> b!201767 m!228469))

(declare-fun m!228471 () Bool)

(assert (=> b!201767 m!228471))

(declare-fun m!228473 () Bool)

(assert (=> b!201766 m!228473))

(check-sat (not start!20416) (not b!201768) (not b!201767) (not b!201760) (not b_next!5071) (not mapNonEmpty!8459) tp_is_empty!4927 b_and!11791 (not b!201764) (not b!201769) (not b!201761))
(check-sat b_and!11791 (not b_next!5071))
