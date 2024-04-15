; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20518 () Bool)

(assert start!20518)

(declare-fun b_free!5173 () Bool)

(declare-fun b_next!5173 () Bool)

(assert (=> start!20518 (= b_free!5173 (not b_next!5173))))

(declare-fun tp!18550 () Bool)

(declare-fun b_and!11893 () Bool)

(assert (=> start!20518 (= tp!18550 b_and!11893)))

(declare-fun b!203604 () Bool)

(declare-fun e!133266 () Bool)

(declare-fun e!133267 () Bool)

(assert (=> b!203604 (= e!133266 e!133267)))

(declare-fun res!97899 () Bool)

(assert (=> b!203604 (=> res!97899 e!133267)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203604 (= res!97899 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6353 0))(
  ( (V!6354 (val!2559 Int)) )
))
(declare-datatypes ((tuple2!3860 0))(
  ( (tuple2!3861 (_1!1941 (_ BitVec 64)) (_2!1941 V!6353)) )
))
(declare-datatypes ((List!2769 0))(
  ( (Nil!2766) (Cons!2765 (h!3407 tuple2!3860) (t!7691 List!2769)) )
))
(declare-datatypes ((ListLongMap!2763 0))(
  ( (ListLongMap!2764 (toList!1397 List!2769)) )
))
(declare-fun lt!102751 () ListLongMap!2763)

(declare-fun lt!102752 () ListLongMap!2763)

(assert (=> b!203604 (= lt!102751 lt!102752)))

(declare-fun lt!102747 () ListLongMap!2763)

(declare-fun lt!102748 () tuple2!3860)

(declare-fun +!446 (ListLongMap!2763 tuple2!3860) ListLongMap!2763)

(assert (=> b!203604 (= lt!102752 (+!446 lt!102747 lt!102748))))

(declare-fun lt!102753 () ListLongMap!2763)

(declare-fun lt!102750 () ListLongMap!2763)

(assert (=> b!203604 (= lt!102753 lt!102750)))

(declare-fun lt!102758 () ListLongMap!2763)

(assert (=> b!203604 (= lt!102750 (+!446 lt!102758 lt!102748))))

(declare-fun lt!102756 () ListLongMap!2763)

(assert (=> b!203604 (= lt!102751 (+!446 lt!102756 lt!102748))))

(declare-fun zeroValue!615 () V!6353)

(assert (=> b!203604 (= lt!102748 (tuple2!3861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203606 () Bool)

(declare-fun e!133269 () Bool)

(declare-fun e!133264 () Bool)

(declare-fun mapRes!8612 () Bool)

(assert (=> b!203606 (= e!133269 (and e!133264 mapRes!8612))))

(declare-fun condMapEmpty!8612 () Bool)

(declare-datatypes ((ValueCell!2171 0))(
  ( (ValueCellFull!2171 (v!4523 V!6353)) (EmptyCell!2171) )
))
(declare-datatypes ((array!9265 0))(
  ( (array!9266 (arr!4382 (Array (_ BitVec 32) ValueCell!2171)) (size!4708 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9265)

(declare-fun mapDefault!8612 () ValueCell!2171)

(assert (=> b!203606 (= condMapEmpty!8612 (= (arr!4382 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2171)) mapDefault!8612)))))

(declare-fun mapIsEmpty!8612 () Bool)

(assert (=> mapIsEmpty!8612 mapRes!8612))

(declare-fun b!203607 () Bool)

(declare-fun res!97900 () Bool)

(declare-fun e!133268 () Bool)

(assert (=> b!203607 (=> (not res!97900) (not e!133268))))

(declare-datatypes ((array!9267 0))(
  ( (array!9268 (arr!4383 (Array (_ BitVec 32) (_ BitVec 64))) (size!4709 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9267)

(declare-datatypes ((List!2770 0))(
  ( (Nil!2767) (Cons!2766 (h!3408 (_ BitVec 64)) (t!7692 List!2770)) )
))
(declare-fun arrayNoDuplicates!0 (array!9267 (_ BitVec 32) List!2770) Bool)

(assert (=> b!203607 (= res!97900 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2767))))

(declare-fun mapNonEmpty!8612 () Bool)

(declare-fun tp!18551 () Bool)

(declare-fun e!133263 () Bool)

(assert (=> mapNonEmpty!8612 (= mapRes!8612 (and tp!18551 e!133263))))

(declare-fun mapKey!8612 () (_ BitVec 32))

(declare-fun mapRest!8612 () (Array (_ BitVec 32) ValueCell!2171))

(declare-fun mapValue!8612 () ValueCell!2171)

(assert (=> mapNonEmpty!8612 (= (arr!4382 _values!649) (store mapRest!8612 mapKey!8612 mapValue!8612))))

(declare-fun b!203608 () Bool)

(assert (=> b!203608 (= e!133267 true)))

(declare-fun lt!102754 () tuple2!3860)

(assert (=> b!203608 (= lt!102752 (+!446 lt!102750 lt!102754))))

(declare-datatypes ((Unit!6138 0))(
  ( (Unit!6139) )
))
(declare-fun lt!102757 () Unit!6138)

(declare-fun v!520 () V!6353)

(declare-fun addCommutativeForDiffKeys!144 (ListLongMap!2763 (_ BitVec 64) V!6353 (_ BitVec 64) V!6353) Unit!6138)

(assert (=> b!203608 (= lt!102757 (addCommutativeForDiffKeys!144 lt!102758 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203609 () Bool)

(declare-fun res!97897 () Bool)

(assert (=> b!203609 (=> (not res!97897) (not e!133268))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203609 (= res!97897 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4709 _keys!825))))))

(declare-fun b!203605 () Bool)

(assert (=> b!203605 (= e!133268 (not e!133266))))

(declare-fun res!97896 () Bool)

(assert (=> b!203605 (=> res!97896 e!133266)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203605 (= res!97896 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6353)

(declare-fun getCurrentListMap!947 (array!9267 array!9265 (_ BitVec 32) (_ BitVec 32) V!6353 V!6353 (_ BitVec 32) Int) ListLongMap!2763)

(assert (=> b!203605 (= lt!102753 (getCurrentListMap!947 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102755 () array!9265)

(assert (=> b!203605 (= lt!102751 (getCurrentListMap!947 _keys!825 lt!102755 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203605 (and (= lt!102756 lt!102747) (= lt!102747 lt!102756))))

(assert (=> b!203605 (= lt!102747 (+!446 lt!102758 lt!102754))))

(assert (=> b!203605 (= lt!102754 (tuple2!3861 k0!843 v!520))))

(declare-fun lt!102749 () Unit!6138)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!106 (array!9267 array!9265 (_ BitVec 32) (_ BitVec 32) V!6353 V!6353 (_ BitVec 32) (_ BitVec 64) V!6353 (_ BitVec 32) Int) Unit!6138)

(assert (=> b!203605 (= lt!102749 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!106 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!357 (array!9267 array!9265 (_ BitVec 32) (_ BitVec 32) V!6353 V!6353 (_ BitVec 32) Int) ListLongMap!2763)

(assert (=> b!203605 (= lt!102756 (getCurrentListMapNoExtraKeys!357 _keys!825 lt!102755 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203605 (= lt!102755 (array!9266 (store (arr!4382 _values!649) i!601 (ValueCellFull!2171 v!520)) (size!4708 _values!649)))))

(assert (=> b!203605 (= lt!102758 (getCurrentListMapNoExtraKeys!357 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!97893 () Bool)

(assert (=> start!20518 (=> (not res!97893) (not e!133268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20518 (= res!97893 (validMask!0 mask!1149))))

(assert (=> start!20518 e!133268))

(declare-fun array_inv!2875 (array!9265) Bool)

(assert (=> start!20518 (and (array_inv!2875 _values!649) e!133269)))

(assert (=> start!20518 true))

(declare-fun tp_is_empty!5029 () Bool)

(assert (=> start!20518 tp_is_empty!5029))

(declare-fun array_inv!2876 (array!9267) Bool)

(assert (=> start!20518 (array_inv!2876 _keys!825)))

(assert (=> start!20518 tp!18550))

(declare-fun b!203610 () Bool)

(declare-fun res!97901 () Bool)

(assert (=> b!203610 (=> (not res!97901) (not e!133268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9267 (_ BitVec 32)) Bool)

(assert (=> b!203610 (= res!97901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203611 () Bool)

(assert (=> b!203611 (= e!133263 tp_is_empty!5029)))

(declare-fun b!203612 () Bool)

(declare-fun res!97895 () Bool)

(assert (=> b!203612 (=> (not res!97895) (not e!133268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203612 (= res!97895 (validKeyInArray!0 k0!843))))

(declare-fun b!203613 () Bool)

(declare-fun res!97898 () Bool)

(assert (=> b!203613 (=> (not res!97898) (not e!133268))))

(assert (=> b!203613 (= res!97898 (and (= (size!4708 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4709 _keys!825) (size!4708 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203614 () Bool)

(assert (=> b!203614 (= e!133264 tp_is_empty!5029)))

(declare-fun b!203615 () Bool)

(declare-fun res!97894 () Bool)

(assert (=> b!203615 (=> (not res!97894) (not e!133268))))

(assert (=> b!203615 (= res!97894 (= (select (arr!4383 _keys!825) i!601) k0!843))))

(assert (= (and start!20518 res!97893) b!203613))

(assert (= (and b!203613 res!97898) b!203610))

(assert (= (and b!203610 res!97901) b!203607))

(assert (= (and b!203607 res!97900) b!203609))

(assert (= (and b!203609 res!97897) b!203612))

(assert (= (and b!203612 res!97895) b!203615))

(assert (= (and b!203615 res!97894) b!203605))

(assert (= (and b!203605 (not res!97896)) b!203604))

(assert (= (and b!203604 (not res!97899)) b!203608))

(assert (= (and b!203606 condMapEmpty!8612) mapIsEmpty!8612))

(assert (= (and b!203606 (not condMapEmpty!8612)) mapNonEmpty!8612))

(get-info :version)

(assert (= (and mapNonEmpty!8612 ((_ is ValueCellFull!2171) mapValue!8612)) b!203611))

(assert (= (and b!203606 ((_ is ValueCellFull!2171) mapDefault!8612)) b!203614))

(assert (= start!20518 b!203606))

(declare-fun m!230595 () Bool)

(assert (=> b!203604 m!230595))

(declare-fun m!230597 () Bool)

(assert (=> b!203604 m!230597))

(declare-fun m!230599 () Bool)

(assert (=> b!203604 m!230599))

(declare-fun m!230601 () Bool)

(assert (=> b!203615 m!230601))

(declare-fun m!230603 () Bool)

(assert (=> mapNonEmpty!8612 m!230603))

(declare-fun m!230605 () Bool)

(assert (=> start!20518 m!230605))

(declare-fun m!230607 () Bool)

(assert (=> start!20518 m!230607))

(declare-fun m!230609 () Bool)

(assert (=> start!20518 m!230609))

(declare-fun m!230611 () Bool)

(assert (=> b!203610 m!230611))

(declare-fun m!230613 () Bool)

(assert (=> b!203608 m!230613))

(declare-fun m!230615 () Bool)

(assert (=> b!203608 m!230615))

(declare-fun m!230617 () Bool)

(assert (=> b!203605 m!230617))

(declare-fun m!230619 () Bool)

(assert (=> b!203605 m!230619))

(declare-fun m!230621 () Bool)

(assert (=> b!203605 m!230621))

(declare-fun m!230623 () Bool)

(assert (=> b!203605 m!230623))

(declare-fun m!230625 () Bool)

(assert (=> b!203605 m!230625))

(declare-fun m!230627 () Bool)

(assert (=> b!203605 m!230627))

(declare-fun m!230629 () Bool)

(assert (=> b!203605 m!230629))

(declare-fun m!230631 () Bool)

(assert (=> b!203607 m!230631))

(declare-fun m!230633 () Bool)

(assert (=> b!203612 m!230633))

(check-sat b_and!11893 (not start!20518) (not b!203604) tp_is_empty!5029 (not b!203610) (not b!203607) (not b!203608) (not b!203612) (not b!203605) (not mapNonEmpty!8612) (not b_next!5173))
(check-sat b_and!11893 (not b_next!5173))
