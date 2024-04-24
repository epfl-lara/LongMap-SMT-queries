; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20554 () Bool)

(assert start!20554)

(declare-fun b_free!5209 () Bool)

(declare-fun b_next!5209 () Bool)

(assert (=> start!20554 (= b_free!5209 (not b_next!5209))))

(declare-fun tp!18659 () Bool)

(declare-fun b_and!11969 () Bool)

(assert (=> start!20554 (= tp!18659 b_and!11969)))

(declare-fun b!204448 () Bool)

(declare-fun res!98506 () Bool)

(declare-fun e!133772 () Bool)

(assert (=> b!204448 (=> (not res!98506) (not e!133772))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204448 (= res!98506 (validKeyInArray!0 k0!843))))

(declare-fun res!98505 () Bool)

(assert (=> start!20554 (=> (not res!98505) (not e!133772))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20554 (= res!98505 (validMask!0 mask!1149))))

(assert (=> start!20554 e!133772))

(declare-datatypes ((V!6401 0))(
  ( (V!6402 (val!2577 Int)) )
))
(declare-datatypes ((ValueCell!2189 0))(
  ( (ValueCellFull!2189 (v!4548 V!6401)) (EmptyCell!2189) )
))
(declare-datatypes ((array!9341 0))(
  ( (array!9342 (arr!4421 (Array (_ BitVec 32) ValueCell!2189)) (size!4746 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9341)

(declare-fun e!133766 () Bool)

(declare-fun array_inv!2893 (array!9341) Bool)

(assert (=> start!20554 (and (array_inv!2893 _values!649) e!133766)))

(assert (=> start!20554 true))

(declare-fun tp_is_empty!5065 () Bool)

(assert (=> start!20554 tp_is_empty!5065))

(declare-datatypes ((array!9343 0))(
  ( (array!9344 (arr!4422 (Array (_ BitVec 32) (_ BitVec 64))) (size!4747 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9343)

(declare-fun array_inv!2894 (array!9343) Bool)

(assert (=> start!20554 (array_inv!2894 _keys!825)))

(assert (=> start!20554 tp!18659))

(declare-fun b!204449 () Bool)

(declare-datatypes ((tuple2!3856 0))(
  ( (tuple2!3857 (_1!1939 (_ BitVec 64)) (_2!1939 V!6401)) )
))
(declare-datatypes ((List!2750 0))(
  ( (Nil!2747) (Cons!2746 (h!3388 tuple2!3856) (t!7673 List!2750)) )
))
(declare-datatypes ((ListLongMap!2771 0))(
  ( (ListLongMap!2772 (toList!1401 List!2750)) )
))
(declare-fun lt!103632 () ListLongMap!2771)

(declare-fun lt!103627 () tuple2!3856)

(declare-fun lt!103628 () ListLongMap!2771)

(declare-fun e!133767 () Bool)

(declare-fun +!455 (ListLongMap!2771 tuple2!3856) ListLongMap!2771)

(assert (=> b!204449 (= e!133767 (= lt!103628 (+!455 lt!103632 lt!103627)))))

(declare-fun b!204450 () Bool)

(declare-fun e!133771 () Bool)

(assert (=> b!204450 (= e!133771 tp_is_empty!5065)))

(declare-fun b!204451 () Bool)

(declare-fun res!98504 () Bool)

(assert (=> b!204451 (=> (not res!98504) (not e!133772))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204451 (= res!98504 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4747 _keys!825))))))

(declare-fun b!204452 () Bool)

(declare-fun res!98500 () Bool)

(assert (=> b!204452 (=> (not res!98500) (not e!133772))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204452 (= res!98500 (and (= (size!4746 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4747 _keys!825) (size!4746 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204453 () Bool)

(declare-fun mapRes!8666 () Bool)

(assert (=> b!204453 (= e!133766 (and e!133771 mapRes!8666))))

(declare-fun condMapEmpty!8666 () Bool)

(declare-fun mapDefault!8666 () ValueCell!2189)

(assert (=> b!204453 (= condMapEmpty!8666 (= (arr!4421 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2189)) mapDefault!8666)))))

(declare-fun b!204454 () Bool)

(declare-fun res!98503 () Bool)

(assert (=> b!204454 (=> (not res!98503) (not e!133772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9343 (_ BitVec 32)) Bool)

(assert (=> b!204454 (= res!98503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204455 () Bool)

(declare-fun res!98499 () Bool)

(assert (=> b!204455 (=> (not res!98499) (not e!133772))))

(assert (=> b!204455 (= res!98499 (= (select (arr!4422 _keys!825) i!601) k0!843))))

(declare-fun b!204456 () Bool)

(declare-fun res!98502 () Bool)

(assert (=> b!204456 (=> (not res!98502) (not e!133767))))

(declare-fun lt!103629 () ListLongMap!2771)

(declare-fun lt!103630 () ListLongMap!2771)

(assert (=> b!204456 (= res!98502 (= lt!103630 (+!455 lt!103629 lt!103627)))))

(declare-fun mapIsEmpty!8666 () Bool)

(assert (=> mapIsEmpty!8666 mapRes!8666))

(declare-fun b!204457 () Bool)

(declare-fun res!98497 () Bool)

(assert (=> b!204457 (=> (not res!98497) (not e!133772))))

(declare-datatypes ((List!2751 0))(
  ( (Nil!2748) (Cons!2747 (h!3389 (_ BitVec 64)) (t!7674 List!2751)) )
))
(declare-fun arrayNoDuplicates!0 (array!9343 (_ BitVec 32) List!2751) Bool)

(assert (=> b!204457 (= res!98497 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2748))))

(declare-fun b!204458 () Bool)

(declare-fun e!133770 () Bool)

(assert (=> b!204458 (= e!133770 true)))

(assert (=> b!204458 e!133767))

(declare-fun res!98498 () Bool)

(assert (=> b!204458 (=> (not res!98498) (not e!133767))))

(declare-fun lt!103634 () ListLongMap!2771)

(assert (=> b!204458 (= res!98498 (= lt!103630 (+!455 lt!103634 lt!103627)))))

(declare-fun minValue!615 () V!6401)

(assert (=> b!204458 (= lt!103627 (tuple2!3857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204459 () Bool)

(declare-fun e!133768 () Bool)

(assert (=> b!204459 (= e!133768 tp_is_empty!5065)))

(declare-fun mapNonEmpty!8666 () Bool)

(declare-fun tp!18658 () Bool)

(assert (=> mapNonEmpty!8666 (= mapRes!8666 (and tp!18658 e!133768))))

(declare-fun mapRest!8666 () (Array (_ BitVec 32) ValueCell!2189))

(declare-fun mapValue!8666 () ValueCell!2189)

(declare-fun mapKey!8666 () (_ BitVec 32))

(assert (=> mapNonEmpty!8666 (= (arr!4421 _values!649) (store mapRest!8666 mapKey!8666 mapValue!8666))))

(declare-fun b!204460 () Bool)

(assert (=> b!204460 (= e!133772 (not e!133770))))

(declare-fun res!98501 () Bool)

(assert (=> b!204460 (=> res!98501 e!133770)))

(assert (=> b!204460 (= res!98501 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6401)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!977 (array!9343 array!9341 (_ BitVec 32) (_ BitVec 32) V!6401 V!6401 (_ BitVec 32) Int) ListLongMap!2771)

(assert (=> b!204460 (= lt!103628 (getCurrentListMap!977 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103633 () array!9341)

(assert (=> b!204460 (= lt!103630 (getCurrentListMap!977 _keys!825 lt!103633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204460 (and (= lt!103634 lt!103629) (= lt!103629 lt!103634))))

(declare-fun v!520 () V!6401)

(assert (=> b!204460 (= lt!103629 (+!455 lt!103632 (tuple2!3857 k0!843 v!520)))))

(declare-datatypes ((Unit!6190 0))(
  ( (Unit!6191) )
))
(declare-fun lt!103631 () Unit!6190)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!113 (array!9343 array!9341 (_ BitVec 32) (_ BitVec 32) V!6401 V!6401 (_ BitVec 32) (_ BitVec 64) V!6401 (_ BitVec 32) Int) Unit!6190)

(assert (=> b!204460 (= lt!103631 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!113 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!370 (array!9343 array!9341 (_ BitVec 32) (_ BitVec 32) V!6401 V!6401 (_ BitVec 32) Int) ListLongMap!2771)

(assert (=> b!204460 (= lt!103634 (getCurrentListMapNoExtraKeys!370 _keys!825 lt!103633 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204460 (= lt!103633 (array!9342 (store (arr!4421 _values!649) i!601 (ValueCellFull!2189 v!520)) (size!4746 _values!649)))))

(assert (=> b!204460 (= lt!103632 (getCurrentListMapNoExtraKeys!370 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20554 res!98505) b!204452))

(assert (= (and b!204452 res!98500) b!204454))

(assert (= (and b!204454 res!98503) b!204457))

(assert (= (and b!204457 res!98497) b!204451))

(assert (= (and b!204451 res!98504) b!204448))

(assert (= (and b!204448 res!98506) b!204455))

(assert (= (and b!204455 res!98499) b!204460))

(assert (= (and b!204460 (not res!98501)) b!204458))

(assert (= (and b!204458 res!98498) b!204456))

(assert (= (and b!204456 res!98502) b!204449))

(assert (= (and b!204453 condMapEmpty!8666) mapIsEmpty!8666))

(assert (= (and b!204453 (not condMapEmpty!8666)) mapNonEmpty!8666))

(get-info :version)

(assert (= (and mapNonEmpty!8666 ((_ is ValueCellFull!2189) mapValue!8666)) b!204459))

(assert (= (and b!204453 ((_ is ValueCellFull!2189) mapDefault!8666)) b!204450))

(assert (= start!20554 b!204453))

(declare-fun m!232113 () Bool)

(assert (=> b!204455 m!232113))

(declare-fun m!232115 () Bool)

(assert (=> b!204460 m!232115))

(declare-fun m!232117 () Bool)

(assert (=> b!204460 m!232117))

(declare-fun m!232119 () Bool)

(assert (=> b!204460 m!232119))

(declare-fun m!232121 () Bool)

(assert (=> b!204460 m!232121))

(declare-fun m!232123 () Bool)

(assert (=> b!204460 m!232123))

(declare-fun m!232125 () Bool)

(assert (=> b!204460 m!232125))

(declare-fun m!232127 () Bool)

(assert (=> b!204460 m!232127))

(declare-fun m!232129 () Bool)

(assert (=> mapNonEmpty!8666 m!232129))

(declare-fun m!232131 () Bool)

(assert (=> b!204448 m!232131))

(declare-fun m!232133 () Bool)

(assert (=> start!20554 m!232133))

(declare-fun m!232135 () Bool)

(assert (=> start!20554 m!232135))

(declare-fun m!232137 () Bool)

(assert (=> start!20554 m!232137))

(declare-fun m!232139 () Bool)

(assert (=> b!204454 m!232139))

(declare-fun m!232141 () Bool)

(assert (=> b!204457 m!232141))

(declare-fun m!232143 () Bool)

(assert (=> b!204449 m!232143))

(declare-fun m!232145 () Bool)

(assert (=> b!204456 m!232145))

(declare-fun m!232147 () Bool)

(assert (=> b!204458 m!232147))

(check-sat (not mapNonEmpty!8666) b_and!11969 (not b!204448) (not b!204458) (not start!20554) (not b_next!5209) (not b!204449) (not b!204457) (not b!204454) (not b!204460) (not b!204456) tp_is_empty!5065)
(check-sat b_and!11969 (not b_next!5209))
