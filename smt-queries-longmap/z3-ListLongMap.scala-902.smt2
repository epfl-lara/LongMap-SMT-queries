; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20510 () Bool)

(assert start!20510)

(declare-fun b_free!5169 () Bool)

(declare-fun b_next!5169 () Bool)

(assert (=> start!20510 (= b_free!5169 (not b_next!5169))))

(declare-fun tp!18538 () Bool)

(declare-fun b_and!11915 () Bool)

(assert (=> start!20510 (= tp!18538 b_and!11915)))

(declare-fun b!203679 () Bool)

(declare-fun res!97937 () Bool)

(declare-fun e!133325 () Bool)

(assert (=> b!203679 (=> (not res!97937) (not e!133325))))

(declare-datatypes ((array!9273 0))(
  ( (array!9274 (arr!4387 (Array (_ BitVec 32) (_ BitVec 64))) (size!4712 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9273)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203679 (= res!97937 (= (select (arr!4387 _keys!825) i!601) k0!843))))

(declare-fun b!203680 () Bool)

(declare-fun e!133328 () Bool)

(assert (=> b!203680 (= e!133328 true)))

(declare-datatypes ((V!6347 0))(
  ( (V!6348 (val!2557 Int)) )
))
(declare-datatypes ((tuple2!3880 0))(
  ( (tuple2!3881 (_1!1951 (_ BitVec 64)) (_2!1951 V!6347)) )
))
(declare-datatypes ((List!2781 0))(
  ( (Nil!2778) (Cons!2777 (h!3419 tuple2!3880) (t!7712 List!2781)) )
))
(declare-datatypes ((ListLongMap!2793 0))(
  ( (ListLongMap!2794 (toList!1412 List!2781)) )
))
(declare-fun lt!102865 () ListLongMap!2793)

(declare-fun lt!102857 () ListLongMap!2793)

(declare-fun lt!102862 () tuple2!3880)

(declare-fun +!439 (ListLongMap!2793 tuple2!3880) ListLongMap!2793)

(assert (=> b!203680 (= lt!102865 (+!439 lt!102857 lt!102862))))

(declare-fun lt!102856 () ListLongMap!2793)

(declare-datatypes ((Unit!6172 0))(
  ( (Unit!6173) )
))
(declare-fun lt!102864 () Unit!6172)

(declare-fun v!520 () V!6347)

(declare-fun zeroValue!615 () V!6347)

(declare-fun addCommutativeForDiffKeys!150 (ListLongMap!2793 (_ BitVec 64) V!6347 (_ BitVec 64) V!6347) Unit!6172)

(assert (=> b!203680 (= lt!102864 (addCommutativeForDiffKeys!150 lt!102856 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203681 () Bool)

(declare-fun res!97936 () Bool)

(assert (=> b!203681 (=> (not res!97936) (not e!133325))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2169 0))(
  ( (ValueCellFull!2169 (v!4527 V!6347)) (EmptyCell!2169) )
))
(declare-datatypes ((array!9275 0))(
  ( (array!9276 (arr!4388 (Array (_ BitVec 32) ValueCell!2169)) (size!4713 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9275)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203681 (= res!97936 (and (= (size!4713 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4712 _keys!825) (size!4713 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203682 () Bool)

(declare-fun e!133322 () Bool)

(declare-fun tp_is_empty!5025 () Bool)

(assert (=> b!203682 (= e!133322 tp_is_empty!5025)))

(declare-fun b!203683 () Bool)

(declare-fun e!133323 () Bool)

(assert (=> b!203683 (= e!133323 tp_is_empty!5025)))

(declare-fun b!203684 () Bool)

(declare-fun res!97942 () Bool)

(assert (=> b!203684 (=> (not res!97942) (not e!133325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9273 (_ BitVec 32)) Bool)

(assert (=> b!203684 (= res!97942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203685 () Bool)

(declare-fun e!133326 () Bool)

(declare-fun mapRes!8606 () Bool)

(assert (=> b!203685 (= e!133326 (and e!133323 mapRes!8606))))

(declare-fun condMapEmpty!8606 () Bool)

(declare-fun mapDefault!8606 () ValueCell!2169)

(assert (=> b!203685 (= condMapEmpty!8606 (= (arr!4388 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2169)) mapDefault!8606)))))

(declare-fun mapNonEmpty!8606 () Bool)

(declare-fun tp!18539 () Bool)

(assert (=> mapNonEmpty!8606 (= mapRes!8606 (and tp!18539 e!133322))))

(declare-fun mapKey!8606 () (_ BitVec 32))

(declare-fun mapRest!8606 () (Array (_ BitVec 32) ValueCell!2169))

(declare-fun mapValue!8606 () ValueCell!2169)

(assert (=> mapNonEmpty!8606 (= (arr!4388 _values!649) (store mapRest!8606 mapKey!8606 mapValue!8606))))

(declare-fun b!203686 () Bool)

(declare-fun e!133324 () Bool)

(assert (=> b!203686 (= e!133324 e!133328)))

(declare-fun res!97939 () Bool)

(assert (=> b!203686 (=> res!97939 e!133328)))

(assert (=> b!203686 (= res!97939 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102859 () ListLongMap!2793)

(assert (=> b!203686 (= lt!102859 lt!102865)))

(declare-fun lt!102858 () ListLongMap!2793)

(declare-fun lt!102867 () tuple2!3880)

(assert (=> b!203686 (= lt!102865 (+!439 lt!102858 lt!102867))))

(declare-fun lt!102860 () ListLongMap!2793)

(assert (=> b!203686 (= lt!102860 lt!102857)))

(assert (=> b!203686 (= lt!102857 (+!439 lt!102856 lt!102867))))

(declare-fun lt!102866 () ListLongMap!2793)

(assert (=> b!203686 (= lt!102859 (+!439 lt!102866 lt!102867))))

(assert (=> b!203686 (= lt!102867 (tuple2!3881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97941 () Bool)

(assert (=> start!20510 (=> (not res!97941) (not e!133325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20510 (= res!97941 (validMask!0 mask!1149))))

(assert (=> start!20510 e!133325))

(declare-fun array_inv!2899 (array!9275) Bool)

(assert (=> start!20510 (and (array_inv!2899 _values!649) e!133326)))

(assert (=> start!20510 true))

(assert (=> start!20510 tp_is_empty!5025))

(declare-fun array_inv!2900 (array!9273) Bool)

(assert (=> start!20510 (array_inv!2900 _keys!825)))

(assert (=> start!20510 tp!18538))

(declare-fun b!203687 () Bool)

(declare-fun res!97940 () Bool)

(assert (=> b!203687 (=> (not res!97940) (not e!133325))))

(declare-datatypes ((List!2782 0))(
  ( (Nil!2779) (Cons!2778 (h!3420 (_ BitVec 64)) (t!7713 List!2782)) )
))
(declare-fun arrayNoDuplicates!0 (array!9273 (_ BitVec 32) List!2782) Bool)

(assert (=> b!203687 (= res!97940 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2779))))

(declare-fun mapIsEmpty!8606 () Bool)

(assert (=> mapIsEmpty!8606 mapRes!8606))

(declare-fun b!203688 () Bool)

(assert (=> b!203688 (= e!133325 (not e!133324))))

(declare-fun res!97934 () Bool)

(assert (=> b!203688 (=> res!97934 e!133324)))

(assert (=> b!203688 (= res!97934 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6347)

(declare-fun getCurrentListMap!987 (array!9273 array!9275 (_ BitVec 32) (_ BitVec 32) V!6347 V!6347 (_ BitVec 32) Int) ListLongMap!2793)

(assert (=> b!203688 (= lt!102860 (getCurrentListMap!987 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102863 () array!9275)

(assert (=> b!203688 (= lt!102859 (getCurrentListMap!987 _keys!825 lt!102863 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203688 (and (= lt!102866 lt!102858) (= lt!102858 lt!102866))))

(assert (=> b!203688 (= lt!102858 (+!439 lt!102856 lt!102862))))

(assert (=> b!203688 (= lt!102862 (tuple2!3881 k0!843 v!520))))

(declare-fun lt!102861 () Unit!6172)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!100 (array!9273 array!9275 (_ BitVec 32) (_ BitVec 32) V!6347 V!6347 (_ BitVec 32) (_ BitVec 64) V!6347 (_ BitVec 32) Int) Unit!6172)

(assert (=> b!203688 (= lt!102861 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!100 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!361 (array!9273 array!9275 (_ BitVec 32) (_ BitVec 32) V!6347 V!6347 (_ BitVec 32) Int) ListLongMap!2793)

(assert (=> b!203688 (= lt!102866 (getCurrentListMapNoExtraKeys!361 _keys!825 lt!102863 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203688 (= lt!102863 (array!9276 (store (arr!4388 _values!649) i!601 (ValueCellFull!2169 v!520)) (size!4713 _values!649)))))

(assert (=> b!203688 (= lt!102856 (getCurrentListMapNoExtraKeys!361 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203689 () Bool)

(declare-fun res!97938 () Bool)

(assert (=> b!203689 (=> (not res!97938) (not e!133325))))

(assert (=> b!203689 (= res!97938 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4712 _keys!825))))))

(declare-fun b!203690 () Bool)

(declare-fun res!97935 () Bool)

(assert (=> b!203690 (=> (not res!97935) (not e!133325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203690 (= res!97935 (validKeyInArray!0 k0!843))))

(assert (= (and start!20510 res!97941) b!203681))

(assert (= (and b!203681 res!97936) b!203684))

(assert (= (and b!203684 res!97942) b!203687))

(assert (= (and b!203687 res!97940) b!203689))

(assert (= (and b!203689 res!97938) b!203690))

(assert (= (and b!203690 res!97935) b!203679))

(assert (= (and b!203679 res!97937) b!203688))

(assert (= (and b!203688 (not res!97934)) b!203686))

(assert (= (and b!203686 (not res!97939)) b!203680))

(assert (= (and b!203685 condMapEmpty!8606) mapIsEmpty!8606))

(assert (= (and b!203685 (not condMapEmpty!8606)) mapNonEmpty!8606))

(get-info :version)

(assert (= (and mapNonEmpty!8606 ((_ is ValueCellFull!2169) mapValue!8606)) b!203682))

(assert (= (and b!203685 ((_ is ValueCellFull!2169) mapDefault!8606)) b!203683))

(assert (= start!20510 b!203685))

(declare-fun m!231131 () Bool)

(assert (=> start!20510 m!231131))

(declare-fun m!231133 () Bool)

(assert (=> start!20510 m!231133))

(declare-fun m!231135 () Bool)

(assert (=> start!20510 m!231135))

(declare-fun m!231137 () Bool)

(assert (=> b!203684 m!231137))

(declare-fun m!231139 () Bool)

(assert (=> b!203687 m!231139))

(declare-fun m!231141 () Bool)

(assert (=> b!203686 m!231141))

(declare-fun m!231143 () Bool)

(assert (=> b!203686 m!231143))

(declare-fun m!231145 () Bool)

(assert (=> b!203686 m!231145))

(declare-fun m!231147 () Bool)

(assert (=> mapNonEmpty!8606 m!231147))

(declare-fun m!231149 () Bool)

(assert (=> b!203680 m!231149))

(declare-fun m!231151 () Bool)

(assert (=> b!203680 m!231151))

(declare-fun m!231153 () Bool)

(assert (=> b!203688 m!231153))

(declare-fun m!231155 () Bool)

(assert (=> b!203688 m!231155))

(declare-fun m!231157 () Bool)

(assert (=> b!203688 m!231157))

(declare-fun m!231159 () Bool)

(assert (=> b!203688 m!231159))

(declare-fun m!231161 () Bool)

(assert (=> b!203688 m!231161))

(declare-fun m!231163 () Bool)

(assert (=> b!203688 m!231163))

(declare-fun m!231165 () Bool)

(assert (=> b!203688 m!231165))

(declare-fun m!231167 () Bool)

(assert (=> b!203690 m!231167))

(declare-fun m!231169 () Bool)

(assert (=> b!203679 m!231169))

(check-sat (not b!203684) (not b!203687) (not mapNonEmpty!8606) (not start!20510) tp_is_empty!5025 (not b!203688) (not b!203680) (not b!203686) (not b_next!5169) (not b!203690) b_and!11915)
(check-sat b_and!11915 (not b_next!5169))
