; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20230 () Bool)

(assert start!20230)

(declare-fun b_free!4885 () Bool)

(declare-fun b_next!4885 () Bool)

(assert (=> start!20230 (= b_free!4885 (not b_next!4885))))

(declare-fun tp!17686 () Bool)

(declare-fun b_and!11605 () Bool)

(assert (=> start!20230 (= tp!17686 b_and!11605)))

(declare-fun b!198677 () Bool)

(declare-fun res!94262 () Bool)

(declare-fun e!130518 () Bool)

(assert (=> b!198677 (=> (not res!94262) (not e!130518))))

(declare-datatypes ((array!8707 0))(
  ( (array!8708 (arr!4103 (Array (_ BitVec 32) (_ BitVec 64))) (size!4429 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8707)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5969 0))(
  ( (V!5970 (val!2415 Int)) )
))
(declare-datatypes ((ValueCell!2027 0))(
  ( (ValueCellFull!2027 (v!4379 V!5969)) (EmptyCell!2027) )
))
(declare-datatypes ((array!8709 0))(
  ( (array!8710 (arr!4104 (Array (_ BitVec 32) ValueCell!2027)) (size!4430 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8709)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198677 (= res!94262 (and (= (size!4430 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4429 _keys!825) (size!4430 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8180 () Bool)

(declare-fun mapRes!8180 () Bool)

(assert (=> mapIsEmpty!8180 mapRes!8180))

(declare-fun b!198678 () Bool)

(declare-fun e!130514 () Bool)

(declare-fun tp_is_empty!4741 () Bool)

(assert (=> b!198678 (= e!130514 tp_is_empty!4741)))

(declare-fun res!94263 () Bool)

(assert (=> start!20230 (=> (not res!94263) (not e!130518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20230 (= res!94263 (validMask!0 mask!1149))))

(assert (=> start!20230 e!130518))

(declare-fun e!130516 () Bool)

(declare-fun array_inv!2675 (array!8709) Bool)

(assert (=> start!20230 (and (array_inv!2675 _values!649) e!130516)))

(assert (=> start!20230 true))

(assert (=> start!20230 tp_is_empty!4741))

(declare-fun array_inv!2676 (array!8707) Bool)

(assert (=> start!20230 (array_inv!2676 _keys!825)))

(assert (=> start!20230 tp!17686))

(declare-fun b!198679 () Bool)

(declare-fun res!94267 () Bool)

(assert (=> b!198679 (=> (not res!94267) (not e!130518))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198679 (= res!94267 (= (select (arr!4103 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8180 () Bool)

(declare-fun tp!17687 () Bool)

(declare-fun e!130517 () Bool)

(assert (=> mapNonEmpty!8180 (= mapRes!8180 (and tp!17687 e!130517))))

(declare-fun mapValue!8180 () ValueCell!2027)

(declare-fun mapRest!8180 () (Array (_ BitVec 32) ValueCell!2027))

(declare-fun mapKey!8180 () (_ BitVec 32))

(assert (=> mapNonEmpty!8180 (= (arr!4104 _values!649) (store mapRest!8180 mapKey!8180 mapValue!8180))))

(declare-fun b!198680 () Bool)

(declare-fun res!94266 () Bool)

(assert (=> b!198680 (=> (not res!94266) (not e!130518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8707 (_ BitVec 32)) Bool)

(assert (=> b!198680 (= res!94266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198681 () Bool)

(assert (=> b!198681 (= e!130517 tp_is_empty!4741)))

(declare-fun b!198682 () Bool)

(assert (=> b!198682 (= e!130516 (and e!130514 mapRes!8180))))

(declare-fun condMapEmpty!8180 () Bool)

(declare-fun mapDefault!8180 () ValueCell!2027)

(assert (=> b!198682 (= condMapEmpty!8180 (= (arr!4104 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2027)) mapDefault!8180)))))

(declare-fun b!198683 () Bool)

(assert (=> b!198683 (= e!130518 (not true))))

(declare-datatypes ((tuple2!3622 0))(
  ( (tuple2!3623 (_1!1822 (_ BitVec 64)) (_2!1822 V!5969)) )
))
(declare-datatypes ((List!2554 0))(
  ( (Nil!2551) (Cons!2550 (h!3192 tuple2!3622) (t!7476 List!2554)) )
))
(declare-datatypes ((ListLongMap!2525 0))(
  ( (ListLongMap!2526 (toList!1278 List!2554)) )
))
(declare-fun lt!97871 () ListLongMap!2525)

(declare-fun lt!97874 () ListLongMap!2525)

(assert (=> b!198683 (and (= lt!97871 lt!97874) (= lt!97874 lt!97871))))

(declare-fun lt!97873 () ListLongMap!2525)

(declare-fun v!520 () V!5969)

(declare-fun +!327 (ListLongMap!2525 tuple2!3622) ListLongMap!2525)

(assert (=> b!198683 (= lt!97874 (+!327 lt!97873 (tuple2!3623 k0!843 v!520)))))

(declare-datatypes ((Unit!5906 0))(
  ( (Unit!5907) )
))
(declare-fun lt!97872 () Unit!5906)

(declare-fun zeroValue!615 () V!5969)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5969)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!7 (array!8707 array!8709 (_ BitVec 32) (_ BitVec 32) V!5969 V!5969 (_ BitVec 32) (_ BitVec 64) V!5969 (_ BitVec 32) Int) Unit!5906)

(assert (=> b!198683 (= lt!97872 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!7 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!258 (array!8707 array!8709 (_ BitVec 32) (_ BitVec 32) V!5969 V!5969 (_ BitVec 32) Int) ListLongMap!2525)

(assert (=> b!198683 (= lt!97871 (getCurrentListMapNoExtraKeys!258 _keys!825 (array!8710 (store (arr!4104 _values!649) i!601 (ValueCellFull!2027 v!520)) (size!4430 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198683 (= lt!97873 (getCurrentListMapNoExtraKeys!258 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198684 () Bool)

(declare-fun res!94264 () Bool)

(assert (=> b!198684 (=> (not res!94264) (not e!130518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198684 (= res!94264 (validKeyInArray!0 k0!843))))

(declare-fun b!198685 () Bool)

(declare-fun res!94268 () Bool)

(assert (=> b!198685 (=> (not res!94268) (not e!130518))))

(declare-datatypes ((List!2555 0))(
  ( (Nil!2552) (Cons!2551 (h!3193 (_ BitVec 64)) (t!7477 List!2555)) )
))
(declare-fun arrayNoDuplicates!0 (array!8707 (_ BitVec 32) List!2555) Bool)

(assert (=> b!198685 (= res!94268 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2552))))

(declare-fun b!198686 () Bool)

(declare-fun res!94265 () Bool)

(assert (=> b!198686 (=> (not res!94265) (not e!130518))))

(assert (=> b!198686 (= res!94265 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4429 _keys!825))))))

(assert (= (and start!20230 res!94263) b!198677))

(assert (= (and b!198677 res!94262) b!198680))

(assert (= (and b!198680 res!94266) b!198685))

(assert (= (and b!198685 res!94268) b!198686))

(assert (= (and b!198686 res!94265) b!198684))

(assert (= (and b!198684 res!94264) b!198679))

(assert (= (and b!198679 res!94267) b!198683))

(assert (= (and b!198682 condMapEmpty!8180) mapIsEmpty!8180))

(assert (= (and b!198682 (not condMapEmpty!8180)) mapNonEmpty!8180))

(get-info :version)

(assert (= (and mapNonEmpty!8180 ((_ is ValueCellFull!2027) mapValue!8180)) b!198681))

(assert (= (and b!198682 ((_ is ValueCellFull!2027) mapDefault!8180)) b!198678))

(assert (= start!20230 b!198682))

(declare-fun m!224751 () Bool)

(assert (=> b!198679 m!224751))

(declare-fun m!224753 () Bool)

(assert (=> b!198685 m!224753))

(declare-fun m!224755 () Bool)

(assert (=> b!198684 m!224755))

(declare-fun m!224757 () Bool)

(assert (=> start!20230 m!224757))

(declare-fun m!224759 () Bool)

(assert (=> start!20230 m!224759))

(declare-fun m!224761 () Bool)

(assert (=> start!20230 m!224761))

(declare-fun m!224763 () Bool)

(assert (=> b!198680 m!224763))

(declare-fun m!224765 () Bool)

(assert (=> mapNonEmpty!8180 m!224765))

(declare-fun m!224767 () Bool)

(assert (=> b!198683 m!224767))

(declare-fun m!224769 () Bool)

(assert (=> b!198683 m!224769))

(declare-fun m!224771 () Bool)

(assert (=> b!198683 m!224771))

(declare-fun m!224773 () Bool)

(assert (=> b!198683 m!224773))

(declare-fun m!224775 () Bool)

(assert (=> b!198683 m!224775))

(check-sat (not b!198685) (not start!20230) tp_is_empty!4741 (not b_next!4885) (not mapNonEmpty!8180) (not b!198680) (not b!198684) b_and!11605 (not b!198683))
(check-sat b_and!11605 (not b_next!4885))
