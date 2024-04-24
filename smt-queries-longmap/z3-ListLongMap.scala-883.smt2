; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20398 () Bool)

(assert start!20398)

(declare-fun b_free!5053 () Bool)

(declare-fun b_next!5053 () Bool)

(assert (=> start!20398 (= b_free!5053 (not b_next!5053))))

(declare-fun tp!18191 () Bool)

(declare-fun b_and!11813 () Bool)

(assert (=> start!20398 (= tp!18191 b_and!11813)))

(declare-fun b!201629 () Bool)

(declare-fun e!132133 () Bool)

(declare-fun tp_is_empty!4909 () Bool)

(assert (=> b!201629 (= e!132133 tp_is_empty!4909)))

(declare-fun mapIsEmpty!8432 () Bool)

(declare-fun mapRes!8432 () Bool)

(assert (=> mapIsEmpty!8432 mapRes!8432))

(declare-fun b!201630 () Bool)

(declare-fun res!96383 () Bool)

(declare-fun e!132129 () Bool)

(assert (=> b!201630 (=> (not res!96383) (not e!132129))))

(declare-datatypes ((array!9041 0))(
  ( (array!9042 (arr!4271 (Array (_ BitVec 32) (_ BitVec 64))) (size!4596 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9041)

(declare-datatypes ((List!2631 0))(
  ( (Nil!2628) (Cons!2627 (h!3269 (_ BitVec 64)) (t!7554 List!2631)) )
))
(declare-fun arrayNoDuplicates!0 (array!9041 (_ BitVec 32) List!2631) Bool)

(assert (=> b!201630 (= res!96383 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2628))))

(declare-fun b!201631 () Bool)

(declare-fun res!96384 () Bool)

(assert (=> b!201631 (=> (not res!96384) (not e!132129))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9041 (_ BitVec 32)) Bool)

(assert (=> b!201631 (= res!96384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201632 () Bool)

(declare-fun e!132132 () Bool)

(assert (=> b!201632 (= e!132132 tp_is_empty!4909)))

(declare-fun b!201633 () Bool)

(declare-fun res!96388 () Bool)

(assert (=> b!201633 (=> (not res!96388) (not e!132129))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201633 (= res!96388 (validKeyInArray!0 k0!843))))

(declare-fun b!201634 () Bool)

(declare-fun e!132130 () Bool)

(declare-fun e!132131 () Bool)

(assert (=> b!201634 (= e!132130 e!132131)))

(declare-fun res!96381 () Bool)

(assert (=> b!201634 (=> res!96381 e!132131)))

(assert (=> b!201634 (= res!96381 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6193 0))(
  ( (V!6194 (val!2499 Int)) )
))
(declare-datatypes ((tuple2!3720 0))(
  ( (tuple2!3721 (_1!1871 (_ BitVec 64)) (_2!1871 V!6193)) )
))
(declare-datatypes ((List!2632 0))(
  ( (Nil!2629) (Cons!2628 (h!3270 tuple2!3720) (t!7555 List!2632)) )
))
(declare-datatypes ((ListLongMap!2635 0))(
  ( (ListLongMap!2636 (toList!1333 List!2632)) )
))
(declare-fun lt!100630 () ListLongMap!2635)

(declare-fun lt!100619 () ListLongMap!2635)

(assert (=> b!201634 (= lt!100630 lt!100619)))

(declare-fun lt!100634 () ListLongMap!2635)

(declare-fun lt!100631 () tuple2!3720)

(declare-fun +!387 (ListLongMap!2635 tuple2!3720) ListLongMap!2635)

(assert (=> b!201634 (= lt!100619 (+!387 lt!100634 lt!100631))))

(declare-datatypes ((Unit!6058 0))(
  ( (Unit!6059) )
))
(declare-fun lt!100625 () Unit!6058)

(declare-fun v!520 () V!6193)

(declare-fun zeroValue!615 () V!6193)

(declare-fun lt!100633 () ListLongMap!2635)

(declare-fun addCommutativeForDiffKeys!110 (ListLongMap!2635 (_ BitVec 64) V!6193 (_ BitVec 64) V!6193) Unit!6058)

(assert (=> b!201634 (= lt!100625 (addCommutativeForDiffKeys!110 lt!100633 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100632 () ListLongMap!2635)

(declare-fun lt!100629 () tuple2!3720)

(assert (=> b!201634 (= lt!100632 (+!387 lt!100630 lt!100629))))

(declare-fun lt!100622 () ListLongMap!2635)

(declare-fun lt!100627 () tuple2!3720)

(assert (=> b!201634 (= lt!100630 (+!387 lt!100622 lt!100627))))

(declare-fun lt!100623 () ListLongMap!2635)

(declare-fun lt!100620 () ListLongMap!2635)

(assert (=> b!201634 (= lt!100623 lt!100620)))

(assert (=> b!201634 (= lt!100620 (+!387 lt!100634 lt!100629))))

(assert (=> b!201634 (= lt!100634 (+!387 lt!100633 lt!100627))))

(declare-fun lt!100621 () ListLongMap!2635)

(assert (=> b!201634 (= lt!100632 (+!387 (+!387 lt!100621 lt!100627) lt!100629))))

(declare-fun minValue!615 () V!6193)

(assert (=> b!201634 (= lt!100629 (tuple2!3721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201634 (= lt!100627 (tuple2!3721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201635 () Bool)

(declare-fun res!96380 () Bool)

(assert (=> b!201635 (=> (not res!96380) (not e!132129))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2111 0))(
  ( (ValueCellFull!2111 (v!4470 V!6193)) (EmptyCell!2111) )
))
(declare-datatypes ((array!9043 0))(
  ( (array!9044 (arr!4272 (Array (_ BitVec 32) ValueCell!2111)) (size!4597 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9043)

(assert (=> b!201635 (= res!96380 (and (= (size!4597 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4596 _keys!825) (size!4597 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8432 () Bool)

(declare-fun tp!18190 () Bool)

(assert (=> mapNonEmpty!8432 (= mapRes!8432 (and tp!18190 e!132132))))

(declare-fun mapRest!8432 () (Array (_ BitVec 32) ValueCell!2111))

(declare-fun mapKey!8432 () (_ BitVec 32))

(declare-fun mapValue!8432 () ValueCell!2111)

(assert (=> mapNonEmpty!8432 (= (arr!4272 _values!649) (store mapRest!8432 mapKey!8432 mapValue!8432))))

(declare-fun b!201636 () Bool)

(assert (=> b!201636 (= e!132129 (not e!132130))))

(declare-fun res!96386 () Bool)

(assert (=> b!201636 (=> res!96386 e!132130)))

(assert (=> b!201636 (= res!96386 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!923 (array!9041 array!9043 (_ BitVec 32) (_ BitVec 32) V!6193 V!6193 (_ BitVec 32) Int) ListLongMap!2635)

(assert (=> b!201636 (= lt!100623 (getCurrentListMap!923 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100624 () array!9043)

(assert (=> b!201636 (= lt!100632 (getCurrentListMap!923 _keys!825 lt!100624 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201636 (and (= lt!100621 lt!100622) (= lt!100622 lt!100621))))

(assert (=> b!201636 (= lt!100622 (+!387 lt!100633 lt!100631))))

(assert (=> b!201636 (= lt!100631 (tuple2!3721 k0!843 v!520))))

(declare-fun lt!100628 () Unit!6058)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!59 (array!9041 array!9043 (_ BitVec 32) (_ BitVec 32) V!6193 V!6193 (_ BitVec 32) (_ BitVec 64) V!6193 (_ BitVec 32) Int) Unit!6058)

(assert (=> b!201636 (= lt!100628 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!59 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!316 (array!9041 array!9043 (_ BitVec 32) (_ BitVec 32) V!6193 V!6193 (_ BitVec 32) Int) ListLongMap!2635)

(assert (=> b!201636 (= lt!100621 (getCurrentListMapNoExtraKeys!316 _keys!825 lt!100624 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201636 (= lt!100624 (array!9044 (store (arr!4272 _values!649) i!601 (ValueCellFull!2111 v!520)) (size!4597 _values!649)))))

(assert (=> b!201636 (= lt!100633 (getCurrentListMapNoExtraKeys!316 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201637 () Bool)

(declare-fun res!96382 () Bool)

(assert (=> b!201637 (=> (not res!96382) (not e!132129))))

(assert (=> b!201637 (= res!96382 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4596 _keys!825))))))

(declare-fun res!96387 () Bool)

(assert (=> start!20398 (=> (not res!96387) (not e!132129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20398 (= res!96387 (validMask!0 mask!1149))))

(assert (=> start!20398 e!132129))

(declare-fun e!132128 () Bool)

(declare-fun array_inv!2781 (array!9043) Bool)

(assert (=> start!20398 (and (array_inv!2781 _values!649) e!132128)))

(assert (=> start!20398 true))

(assert (=> start!20398 tp_is_empty!4909))

(declare-fun array_inv!2782 (array!9041) Bool)

(assert (=> start!20398 (array_inv!2782 _keys!825)))

(assert (=> start!20398 tp!18191))

(declare-fun b!201638 () Bool)

(assert (=> b!201638 (= e!132128 (and e!132133 mapRes!8432))))

(declare-fun condMapEmpty!8432 () Bool)

(declare-fun mapDefault!8432 () ValueCell!2111)

(assert (=> b!201638 (= condMapEmpty!8432 (= (arr!4272 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2111)) mapDefault!8432)))))

(declare-fun b!201639 () Bool)

(assert (=> b!201639 (= e!132131 true)))

(assert (=> b!201639 (= (+!387 lt!100619 lt!100629) (+!387 lt!100620 lt!100631))))

(declare-fun lt!100626 () Unit!6058)

(assert (=> b!201639 (= lt!100626 (addCommutativeForDiffKeys!110 lt!100634 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201640 () Bool)

(declare-fun res!96385 () Bool)

(assert (=> b!201640 (=> (not res!96385) (not e!132129))))

(assert (=> b!201640 (= res!96385 (= (select (arr!4271 _keys!825) i!601) k0!843))))

(assert (= (and start!20398 res!96387) b!201635))

(assert (= (and b!201635 res!96380) b!201631))

(assert (= (and b!201631 res!96384) b!201630))

(assert (= (and b!201630 res!96383) b!201637))

(assert (= (and b!201637 res!96382) b!201633))

(assert (= (and b!201633 res!96388) b!201640))

(assert (= (and b!201640 res!96385) b!201636))

(assert (= (and b!201636 (not res!96386)) b!201634))

(assert (= (and b!201634 (not res!96381)) b!201639))

(assert (= (and b!201638 condMapEmpty!8432) mapIsEmpty!8432))

(assert (= (and b!201638 (not condMapEmpty!8432)) mapNonEmpty!8432))

(get-info :version)

(assert (= (and mapNonEmpty!8432 ((_ is ValueCellFull!2111) mapValue!8432)) b!201632))

(assert (= (and b!201638 ((_ is ValueCellFull!2111) mapDefault!8432)) b!201629))

(assert (= start!20398 b!201638))

(declare-fun m!228753 () Bool)

(assert (=> b!201633 m!228753))

(declare-fun m!228755 () Bool)

(assert (=> b!201634 m!228755))

(declare-fun m!228757 () Bool)

(assert (=> b!201634 m!228757))

(declare-fun m!228759 () Bool)

(assert (=> b!201634 m!228759))

(declare-fun m!228761 () Bool)

(assert (=> b!201634 m!228761))

(assert (=> b!201634 m!228759))

(declare-fun m!228763 () Bool)

(assert (=> b!201634 m!228763))

(declare-fun m!228765 () Bool)

(assert (=> b!201634 m!228765))

(declare-fun m!228767 () Bool)

(assert (=> b!201634 m!228767))

(declare-fun m!228769 () Bool)

(assert (=> b!201634 m!228769))

(declare-fun m!228771 () Bool)

(assert (=> start!20398 m!228771))

(declare-fun m!228773 () Bool)

(assert (=> start!20398 m!228773))

(declare-fun m!228775 () Bool)

(assert (=> start!20398 m!228775))

(declare-fun m!228777 () Bool)

(assert (=> b!201636 m!228777))

(declare-fun m!228779 () Bool)

(assert (=> b!201636 m!228779))

(declare-fun m!228781 () Bool)

(assert (=> b!201636 m!228781))

(declare-fun m!228783 () Bool)

(assert (=> b!201636 m!228783))

(declare-fun m!228785 () Bool)

(assert (=> b!201636 m!228785))

(declare-fun m!228787 () Bool)

(assert (=> b!201636 m!228787))

(declare-fun m!228789 () Bool)

(assert (=> b!201636 m!228789))

(declare-fun m!228791 () Bool)

(assert (=> b!201640 m!228791))

(declare-fun m!228793 () Bool)

(assert (=> b!201630 m!228793))

(declare-fun m!228795 () Bool)

(assert (=> mapNonEmpty!8432 m!228795))

(declare-fun m!228797 () Bool)

(assert (=> b!201631 m!228797))

(declare-fun m!228799 () Bool)

(assert (=> b!201639 m!228799))

(declare-fun m!228801 () Bool)

(assert (=> b!201639 m!228801))

(declare-fun m!228803 () Bool)

(assert (=> b!201639 m!228803))

(check-sat (not b!201634) (not b!201636) tp_is_empty!4909 (not b!201639) (not b_next!5053) b_and!11813 (not b!201633) (not b!201631) (not mapNonEmpty!8432) (not b!201630) (not start!20398))
(check-sat b_and!11813 (not b_next!5053))
