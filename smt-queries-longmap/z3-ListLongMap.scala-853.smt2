; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20216 () Bool)

(assert start!20216)

(declare-fun b_free!4875 () Bool)

(declare-fun b_next!4875 () Bool)

(assert (=> start!20216 (= b_free!4875 (not b_next!4875))))

(declare-fun tp!17657 () Bool)

(declare-fun b_and!11621 () Bool)

(assert (=> start!20216 (= tp!17657 b_and!11621)))

(declare-fun b!198674 () Bool)

(declare-fun res!94257 () Bool)

(declare-fun e!130543 () Bool)

(assert (=> b!198674 (=> (not res!94257) (not e!130543))))

(declare-datatypes ((array!8707 0))(
  ( (array!8708 (arr!4104 (Array (_ BitVec 32) (_ BitVec 64))) (size!4429 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8707)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198674 (= res!94257 (= (select (arr!4104 _keys!825) i!601) k0!843))))

(declare-fun b!198675 () Bool)

(declare-fun res!94255 () Bool)

(assert (=> b!198675 (=> (not res!94255) (not e!130543))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5955 0))(
  ( (V!5956 (val!2410 Int)) )
))
(declare-datatypes ((ValueCell!2022 0))(
  ( (ValueCellFull!2022 (v!4380 V!5955)) (EmptyCell!2022) )
))
(declare-datatypes ((array!8709 0))(
  ( (array!8710 (arr!4105 (Array (_ BitVec 32) ValueCell!2022)) (size!4430 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8709)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198675 (= res!94255 (and (= (size!4430 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4429 _keys!825) (size!4430 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198676 () Bool)

(declare-fun res!94253 () Bool)

(assert (=> b!198676 (=> (not res!94253) (not e!130543))))

(assert (=> b!198676 (= res!94253 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4429 _keys!825))))))

(declare-fun res!94252 () Bool)

(assert (=> start!20216 (=> (not res!94252) (not e!130543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20216 (= res!94252 (validMask!0 mask!1149))))

(assert (=> start!20216 e!130543))

(declare-fun e!130540 () Bool)

(declare-fun array_inv!2689 (array!8709) Bool)

(assert (=> start!20216 (and (array_inv!2689 _values!649) e!130540)))

(assert (=> start!20216 true))

(declare-fun tp_is_empty!4731 () Bool)

(assert (=> start!20216 tp_is_empty!4731))

(declare-fun array_inv!2690 (array!8707) Bool)

(assert (=> start!20216 (array_inv!2690 _keys!825)))

(assert (=> start!20216 tp!17657))

(declare-fun b!198677 () Bool)

(declare-fun res!94258 () Bool)

(assert (=> b!198677 (=> (not res!94258) (not e!130543))))

(declare-datatypes ((List!2568 0))(
  ( (Nil!2565) (Cons!2564 (h!3206 (_ BitVec 64)) (t!7499 List!2568)) )
))
(declare-fun arrayNoDuplicates!0 (array!8707 (_ BitVec 32) List!2568) Bool)

(assert (=> b!198677 (= res!94258 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2565))))

(declare-fun b!198678 () Bool)

(declare-fun e!130542 () Bool)

(declare-fun mapRes!8165 () Bool)

(assert (=> b!198678 (= e!130540 (and e!130542 mapRes!8165))))

(declare-fun condMapEmpty!8165 () Bool)

(declare-fun mapDefault!8165 () ValueCell!2022)

(assert (=> b!198678 (= condMapEmpty!8165 (= (arr!4105 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2022)) mapDefault!8165)))))

(declare-fun b!198679 () Bool)

(declare-fun e!130541 () Bool)

(assert (=> b!198679 (= e!130541 tp_is_empty!4731)))

(declare-fun b!198680 () Bool)

(assert (=> b!198680 (= e!130542 tp_is_empty!4731)))

(declare-fun mapIsEmpty!8165 () Bool)

(assert (=> mapIsEmpty!8165 mapRes!8165))

(declare-fun mapNonEmpty!8165 () Bool)

(declare-fun tp!17656 () Bool)

(assert (=> mapNonEmpty!8165 (= mapRes!8165 (and tp!17656 e!130541))))

(declare-fun mapKey!8165 () (_ BitVec 32))

(declare-fun mapValue!8165 () ValueCell!2022)

(declare-fun mapRest!8165 () (Array (_ BitVec 32) ValueCell!2022))

(assert (=> mapNonEmpty!8165 (= (arr!4105 _values!649) (store mapRest!8165 mapKey!8165 mapValue!8165))))

(declare-fun b!198681 () Bool)

(declare-fun res!94254 () Bool)

(assert (=> b!198681 (=> (not res!94254) (not e!130543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198681 (= res!94254 (validKeyInArray!0 k0!843))))

(declare-fun b!198682 () Bool)

(declare-fun res!94256 () Bool)

(assert (=> b!198682 (=> (not res!94256) (not e!130543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8707 (_ BitVec 32)) Bool)

(assert (=> b!198682 (= res!94256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198683 () Bool)

(assert (=> b!198683 (= e!130543 (not true))))

(declare-datatypes ((tuple2!3654 0))(
  ( (tuple2!3655 (_1!1838 (_ BitVec 64)) (_2!1838 V!5955)) )
))
(declare-datatypes ((List!2569 0))(
  ( (Nil!2566) (Cons!2565 (h!3207 tuple2!3654) (t!7500 List!2569)) )
))
(declare-datatypes ((ListLongMap!2567 0))(
  ( (ListLongMap!2568 (toList!1299 List!2569)) )
))
(declare-fun lt!97992 () ListLongMap!2567)

(declare-fun lt!97993 () ListLongMap!2567)

(assert (=> b!198683 (and (= lt!97992 lt!97993) (= lt!97993 lt!97992))))

(declare-fun v!520 () V!5955)

(declare-fun lt!97994 () ListLongMap!2567)

(declare-fun +!326 (ListLongMap!2567 tuple2!3654) ListLongMap!2567)

(assert (=> b!198683 (= lt!97993 (+!326 lt!97994 (tuple2!3655 k0!843 v!520)))))

(declare-datatypes ((Unit!5954 0))(
  ( (Unit!5955) )
))
(declare-fun lt!97995 () Unit!5954)

(declare-fun zeroValue!615 () V!5955)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5955)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!3 (array!8707 array!8709 (_ BitVec 32) (_ BitVec 32) V!5955 V!5955 (_ BitVec 32) (_ BitVec 64) V!5955 (_ BitVec 32) Int) Unit!5954)

(assert (=> b!198683 (= lt!97995 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!3 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!264 (array!8707 array!8709 (_ BitVec 32) (_ BitVec 32) V!5955 V!5955 (_ BitVec 32) Int) ListLongMap!2567)

(assert (=> b!198683 (= lt!97992 (getCurrentListMapNoExtraKeys!264 _keys!825 (array!8710 (store (arr!4105 _values!649) i!601 (ValueCellFull!2022 v!520)) (size!4430 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198683 (= lt!97994 (getCurrentListMapNoExtraKeys!264 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20216 res!94252) b!198675))

(assert (= (and b!198675 res!94255) b!198682))

(assert (= (and b!198682 res!94256) b!198677))

(assert (= (and b!198677 res!94258) b!198676))

(assert (= (and b!198676 res!94253) b!198681))

(assert (= (and b!198681 res!94254) b!198674))

(assert (= (and b!198674 res!94257) b!198683))

(assert (= (and b!198678 condMapEmpty!8165) mapIsEmpty!8165))

(assert (= (and b!198678 (not condMapEmpty!8165)) mapNonEmpty!8165))

(get-info :version)

(assert (= (and mapNonEmpty!8165 ((_ is ValueCellFull!2022) mapValue!8165)) b!198679))

(assert (= (and b!198678 ((_ is ValueCellFull!2022) mapDefault!8165)) b!198680))

(assert (= start!20216 b!198678))

(declare-fun m!225237 () Bool)

(assert (=> b!198674 m!225237))

(declare-fun m!225239 () Bool)

(assert (=> b!198677 m!225239))

(declare-fun m!225241 () Bool)

(assert (=> b!198682 m!225241))

(declare-fun m!225243 () Bool)

(assert (=> b!198683 m!225243))

(declare-fun m!225245 () Bool)

(assert (=> b!198683 m!225245))

(declare-fun m!225247 () Bool)

(assert (=> b!198683 m!225247))

(declare-fun m!225249 () Bool)

(assert (=> b!198683 m!225249))

(declare-fun m!225251 () Bool)

(assert (=> b!198683 m!225251))

(declare-fun m!225253 () Bool)

(assert (=> start!20216 m!225253))

(declare-fun m!225255 () Bool)

(assert (=> start!20216 m!225255))

(declare-fun m!225257 () Bool)

(assert (=> start!20216 m!225257))

(declare-fun m!225259 () Bool)

(assert (=> b!198681 m!225259))

(declare-fun m!225261 () Bool)

(assert (=> mapNonEmpty!8165 m!225261))

(check-sat (not mapNonEmpty!8165) b_and!11621 tp_is_empty!4731 (not b!198682) (not start!20216) (not b!198683) (not b_next!4875) (not b!198677) (not b!198681))
(check-sat b_and!11621 (not b_next!4875))
