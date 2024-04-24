; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20506 () Bool)

(assert start!20506)

(declare-fun b_free!5161 () Bool)

(declare-fun b_next!5161 () Bool)

(assert (=> start!20506 (= b_free!5161 (not b_next!5161))))

(declare-fun tp!18514 () Bool)

(declare-fun b_and!11921 () Bool)

(assert (=> start!20506 (= tp!18514 b_and!11921)))

(declare-fun b!203582 () Bool)

(declare-fun res!97852 () Bool)

(declare-fun e!133266 () Bool)

(assert (=> b!203582 (=> (not res!97852) (not e!133266))))

(declare-datatypes ((array!9245 0))(
  ( (array!9246 (arr!4373 (Array (_ BitVec 32) (_ BitVec 64))) (size!4698 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9245)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203582 (= res!97852 (= (select (arr!4373 _keys!825) i!601) k0!843))))

(declare-fun b!203583 () Bool)

(declare-fun e!133263 () Bool)

(assert (=> b!203583 (= e!133266 (not e!133263))))

(declare-fun res!97854 () Bool)

(assert (=> b!203583 (=> res!97854 e!133263)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203583 (= res!97854 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6337 0))(
  ( (V!6338 (val!2553 Int)) )
))
(declare-datatypes ((tuple2!3812 0))(
  ( (tuple2!3813 (_1!1917 (_ BitVec 64)) (_2!1917 V!6337)) )
))
(declare-datatypes ((List!2712 0))(
  ( (Nil!2709) (Cons!2708 (h!3350 tuple2!3812) (t!7635 List!2712)) )
))
(declare-datatypes ((ListLongMap!2727 0))(
  ( (ListLongMap!2728 (toList!1379 List!2712)) )
))
(declare-fun lt!102782 () ListLongMap!2727)

(declare-datatypes ((ValueCell!2165 0))(
  ( (ValueCellFull!2165 (v!4524 V!6337)) (EmptyCell!2165) )
))
(declare-datatypes ((array!9247 0))(
  ( (array!9248 (arr!4374 (Array (_ BitVec 32) ValueCell!2165)) (size!4699 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9247)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6337)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6337)

(declare-fun getCurrentListMap!958 (array!9245 array!9247 (_ BitVec 32) (_ BitVec 32) V!6337 V!6337 (_ BitVec 32) Int) ListLongMap!2727)

(assert (=> b!203583 (= lt!102782 (getCurrentListMap!958 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102776 () ListLongMap!2727)

(declare-fun lt!102777 () array!9247)

(assert (=> b!203583 (= lt!102776 (getCurrentListMap!958 _keys!825 lt!102777 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102772 () ListLongMap!2727)

(declare-fun lt!102779 () ListLongMap!2727)

(assert (=> b!203583 (and (= lt!102772 lt!102779) (= lt!102779 lt!102772))))

(declare-fun lt!102771 () ListLongMap!2727)

(declare-fun lt!102780 () tuple2!3812)

(declare-fun +!433 (ListLongMap!2727 tuple2!3812) ListLongMap!2727)

(assert (=> b!203583 (= lt!102779 (+!433 lt!102771 lt!102780))))

(declare-fun v!520 () V!6337)

(assert (=> b!203583 (= lt!102780 (tuple2!3813 k0!843 v!520))))

(declare-datatypes ((Unit!6148 0))(
  ( (Unit!6149) )
))
(declare-fun lt!102775 () Unit!6148)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!94 (array!9245 array!9247 (_ BitVec 32) (_ BitVec 32) V!6337 V!6337 (_ BitVec 32) (_ BitVec 64) V!6337 (_ BitVec 32) Int) Unit!6148)

(assert (=> b!203583 (= lt!102775 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!94 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!351 (array!9245 array!9247 (_ BitVec 32) (_ BitVec 32) V!6337 V!6337 (_ BitVec 32) Int) ListLongMap!2727)

(assert (=> b!203583 (= lt!102772 (getCurrentListMapNoExtraKeys!351 _keys!825 lt!102777 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203583 (= lt!102777 (array!9248 (store (arr!4374 _values!649) i!601 (ValueCellFull!2165 v!520)) (size!4699 _values!649)))))

(assert (=> b!203583 (= lt!102771 (getCurrentListMapNoExtraKeys!351 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203584 () Bool)

(declare-fun res!97847 () Bool)

(assert (=> b!203584 (=> (not res!97847) (not e!133266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203584 (= res!97847 (validKeyInArray!0 k0!843))))

(declare-fun b!203585 () Bool)

(declare-fun res!97848 () Bool)

(assert (=> b!203585 (=> (not res!97848) (not e!133266))))

(assert (=> b!203585 (= res!97848 (and (= (size!4699 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4698 _keys!825) (size!4699 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203586 () Bool)

(declare-fun res!97853 () Bool)

(assert (=> b!203586 (=> (not res!97853) (not e!133266))))

(assert (=> b!203586 (= res!97853 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4698 _keys!825))))))

(declare-fun res!97850 () Bool)

(assert (=> start!20506 (=> (not res!97850) (not e!133266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20506 (= res!97850 (validMask!0 mask!1149))))

(assert (=> start!20506 e!133266))

(declare-fun e!133265 () Bool)

(declare-fun array_inv!2857 (array!9247) Bool)

(assert (=> start!20506 (and (array_inv!2857 _values!649) e!133265)))

(assert (=> start!20506 true))

(declare-fun tp_is_empty!5017 () Bool)

(assert (=> start!20506 tp_is_empty!5017))

(declare-fun array_inv!2858 (array!9245) Bool)

(assert (=> start!20506 (array_inv!2858 _keys!825)))

(assert (=> start!20506 tp!18514))

(declare-fun b!203587 () Bool)

(declare-fun e!133268 () Bool)

(assert (=> b!203587 (= e!133268 tp_is_empty!5017)))

(declare-fun mapNonEmpty!8594 () Bool)

(declare-fun mapRes!8594 () Bool)

(declare-fun tp!18515 () Bool)

(assert (=> mapNonEmpty!8594 (= mapRes!8594 (and tp!18515 e!133268))))

(declare-fun mapValue!8594 () ValueCell!2165)

(declare-fun mapRest!8594 () (Array (_ BitVec 32) ValueCell!2165))

(declare-fun mapKey!8594 () (_ BitVec 32))

(assert (=> mapNonEmpty!8594 (= (arr!4374 _values!649) (store mapRest!8594 mapKey!8594 mapValue!8594))))

(declare-fun mapIsEmpty!8594 () Bool)

(assert (=> mapIsEmpty!8594 mapRes!8594))

(declare-fun b!203588 () Bool)

(declare-fun e!133264 () Bool)

(assert (=> b!203588 (= e!133263 e!133264)))

(declare-fun res!97849 () Bool)

(assert (=> b!203588 (=> res!97849 e!133264)))

(assert (=> b!203588 (= res!97849 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102774 () ListLongMap!2727)

(assert (=> b!203588 (= lt!102776 lt!102774)))

(declare-fun lt!102778 () tuple2!3812)

(assert (=> b!203588 (= lt!102774 (+!433 lt!102779 lt!102778))))

(declare-fun lt!102773 () ListLongMap!2727)

(assert (=> b!203588 (= lt!102782 lt!102773)))

(assert (=> b!203588 (= lt!102773 (+!433 lt!102771 lt!102778))))

(assert (=> b!203588 (= lt!102776 (+!433 lt!102772 lt!102778))))

(assert (=> b!203588 (= lt!102778 (tuple2!3813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203589 () Bool)

(declare-fun res!97855 () Bool)

(assert (=> b!203589 (=> (not res!97855) (not e!133266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9245 (_ BitVec 32)) Bool)

(assert (=> b!203589 (= res!97855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203590 () Bool)

(declare-fun e!133262 () Bool)

(assert (=> b!203590 (= e!133265 (and e!133262 mapRes!8594))))

(declare-fun condMapEmpty!8594 () Bool)

(declare-fun mapDefault!8594 () ValueCell!2165)

(assert (=> b!203590 (= condMapEmpty!8594 (= (arr!4374 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2165)) mapDefault!8594)))))

(declare-fun b!203591 () Bool)

(assert (=> b!203591 (= e!133264 true)))

(assert (=> b!203591 (= lt!102774 (+!433 lt!102773 lt!102780))))

(declare-fun lt!102781 () Unit!6148)

(declare-fun addCommutativeForDiffKeys!148 (ListLongMap!2727 (_ BitVec 64) V!6337 (_ BitVec 64) V!6337) Unit!6148)

(assert (=> b!203591 (= lt!102781 (addCommutativeForDiffKeys!148 lt!102771 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203592 () Bool)

(declare-fun res!97851 () Bool)

(assert (=> b!203592 (=> (not res!97851) (not e!133266))))

(declare-datatypes ((List!2713 0))(
  ( (Nil!2710) (Cons!2709 (h!3351 (_ BitVec 64)) (t!7636 List!2713)) )
))
(declare-fun arrayNoDuplicates!0 (array!9245 (_ BitVec 32) List!2713) Bool)

(assert (=> b!203592 (= res!97851 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2710))))

(declare-fun b!203593 () Bool)

(assert (=> b!203593 (= e!133262 tp_is_empty!5017)))

(assert (= (and start!20506 res!97850) b!203585))

(assert (= (and b!203585 res!97848) b!203589))

(assert (= (and b!203589 res!97855) b!203592))

(assert (= (and b!203592 res!97851) b!203586))

(assert (= (and b!203586 res!97853) b!203584))

(assert (= (and b!203584 res!97847) b!203582))

(assert (= (and b!203582 res!97852) b!203583))

(assert (= (and b!203583 (not res!97854)) b!203588))

(assert (= (and b!203588 (not res!97849)) b!203591))

(assert (= (and b!203590 condMapEmpty!8594) mapIsEmpty!8594))

(assert (= (and b!203590 (not condMapEmpty!8594)) mapNonEmpty!8594))

(get-info :version)

(assert (= (and mapNonEmpty!8594 ((_ is ValueCellFull!2165) mapValue!8594)) b!203587))

(assert (= (and b!203590 ((_ is ValueCellFull!2165) mapDefault!8594)) b!203593))

(assert (= start!20506 b!203590))

(declare-fun m!231153 () Bool)

(assert (=> b!203592 m!231153))

(declare-fun m!231155 () Bool)

(assert (=> b!203588 m!231155))

(declare-fun m!231157 () Bool)

(assert (=> b!203588 m!231157))

(declare-fun m!231159 () Bool)

(assert (=> b!203588 m!231159))

(declare-fun m!231161 () Bool)

(assert (=> start!20506 m!231161))

(declare-fun m!231163 () Bool)

(assert (=> start!20506 m!231163))

(declare-fun m!231165 () Bool)

(assert (=> start!20506 m!231165))

(declare-fun m!231167 () Bool)

(assert (=> mapNonEmpty!8594 m!231167))

(declare-fun m!231169 () Bool)

(assert (=> b!203589 m!231169))

(declare-fun m!231171 () Bool)

(assert (=> b!203584 m!231171))

(declare-fun m!231173 () Bool)

(assert (=> b!203583 m!231173))

(declare-fun m!231175 () Bool)

(assert (=> b!203583 m!231175))

(declare-fun m!231177 () Bool)

(assert (=> b!203583 m!231177))

(declare-fun m!231179 () Bool)

(assert (=> b!203583 m!231179))

(declare-fun m!231181 () Bool)

(assert (=> b!203583 m!231181))

(declare-fun m!231183 () Bool)

(assert (=> b!203583 m!231183))

(declare-fun m!231185 () Bool)

(assert (=> b!203583 m!231185))

(declare-fun m!231187 () Bool)

(assert (=> b!203591 m!231187))

(declare-fun m!231189 () Bool)

(assert (=> b!203591 m!231189))

(declare-fun m!231191 () Bool)

(assert (=> b!203582 m!231191))

(check-sat (not mapNonEmpty!8594) (not b!203591) b_and!11921 (not b_next!5161) tp_is_empty!5017 (not b!203584) (not b!203588) (not b!203592) (not start!20506) (not b!203589) (not b!203583))
(check-sat b_and!11921 (not b_next!5161))
