; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20566 () Bool)

(assert start!20566)

(declare-fun b_free!5221 () Bool)

(declare-fun b_next!5221 () Bool)

(assert (=> start!20566 (= b_free!5221 (not b_next!5221))))

(declare-fun tp!18694 () Bool)

(declare-fun b_and!11981 () Bool)

(assert (=> start!20566 (= tp!18694 b_and!11981)))

(declare-fun mapNonEmpty!8684 () Bool)

(declare-fun mapRes!8684 () Bool)

(declare-fun tp!18695 () Bool)

(declare-fun e!133895 () Bool)

(assert (=> mapNonEmpty!8684 (= mapRes!8684 (and tp!18695 e!133895))))

(declare-datatypes ((V!6417 0))(
  ( (V!6418 (val!2583 Int)) )
))
(declare-datatypes ((ValueCell!2195 0))(
  ( (ValueCellFull!2195 (v!4554 V!6417)) (EmptyCell!2195) )
))
(declare-fun mapValue!8684 () ValueCell!2195)

(declare-fun mapKey!8684 () (_ BitVec 32))

(declare-fun mapRest!8684 () (Array (_ BitVec 32) ValueCell!2195))

(declare-datatypes ((array!9363 0))(
  ( (array!9364 (arr!4432 (Array (_ BitVec 32) ValueCell!2195)) (size!4757 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9363)

(assert (=> mapNonEmpty!8684 (= (arr!4432 _values!649) (store mapRest!8684 mapKey!8684 mapValue!8684))))

(declare-fun res!98673 () Bool)

(declare-fun e!133897 () Bool)

(assert (=> start!20566 (=> (not res!98673) (not e!133897))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20566 (= res!98673 (validMask!0 mask!1149))))

(assert (=> start!20566 e!133897))

(declare-fun e!133892 () Bool)

(declare-fun array_inv!2899 (array!9363) Bool)

(assert (=> start!20566 (and (array_inv!2899 _values!649) e!133892)))

(assert (=> start!20566 true))

(declare-fun tp_is_empty!5077 () Bool)

(assert (=> start!20566 tp_is_empty!5077))

(declare-datatypes ((array!9365 0))(
  ( (array!9366 (arr!4433 (Array (_ BitVec 32) (_ BitVec 64))) (size!4758 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9365)

(declare-fun array_inv!2900 (array!9365) Bool)

(assert (=> start!20566 (array_inv!2900 _keys!825)))

(assert (=> start!20566 tp!18694))

(declare-fun b!204671 () Bool)

(declare-fun e!133893 () Bool)

(assert (=> b!204671 (= e!133897 (not e!133893))))

(declare-fun res!98667 () Bool)

(assert (=> b!204671 (=> res!98667 e!133893)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204671 (= res!98667 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3864 0))(
  ( (tuple2!3865 (_1!1943 (_ BitVec 64)) (_2!1943 V!6417)) )
))
(declare-datatypes ((List!2758 0))(
  ( (Nil!2755) (Cons!2754 (h!3396 tuple2!3864) (t!7681 List!2758)) )
))
(declare-datatypes ((ListLongMap!2779 0))(
  ( (ListLongMap!2780 (toList!1405 List!2758)) )
))
(declare-fun lt!103824 () ListLongMap!2779)

(declare-fun zeroValue!615 () V!6417)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6417)

(declare-fun getCurrentListMap!980 (array!9365 array!9363 (_ BitVec 32) (_ BitVec 32) V!6417 V!6417 (_ BitVec 32) Int) ListLongMap!2779)

(assert (=> b!204671 (= lt!103824 (getCurrentListMap!980 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103815 () array!9363)

(declare-fun lt!103822 () ListLongMap!2779)

(assert (=> b!204671 (= lt!103822 (getCurrentListMap!980 _keys!825 lt!103815 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103825 () ListLongMap!2779)

(declare-fun lt!103819 () ListLongMap!2779)

(assert (=> b!204671 (and (= lt!103825 lt!103819) (= lt!103819 lt!103825))))

(declare-fun lt!103823 () ListLongMap!2779)

(declare-fun lt!103820 () tuple2!3864)

(declare-fun +!459 (ListLongMap!2779 tuple2!3864) ListLongMap!2779)

(assert (=> b!204671 (= lt!103819 (+!459 lt!103823 lt!103820))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6417)

(assert (=> b!204671 (= lt!103820 (tuple2!3865 k0!843 v!520))))

(declare-datatypes ((Unit!6196 0))(
  ( (Unit!6197) )
))
(declare-fun lt!103818 () Unit!6196)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!116 (array!9365 array!9363 (_ BitVec 32) (_ BitVec 32) V!6417 V!6417 (_ BitVec 32) (_ BitVec 64) V!6417 (_ BitVec 32) Int) Unit!6196)

(assert (=> b!204671 (= lt!103818 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!116 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!373 (array!9365 array!9363 (_ BitVec 32) (_ BitVec 32) V!6417 V!6417 (_ BitVec 32) Int) ListLongMap!2779)

(assert (=> b!204671 (= lt!103825 (getCurrentListMapNoExtraKeys!373 _keys!825 lt!103815 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204671 (= lt!103815 (array!9364 (store (arr!4432 _values!649) i!601 (ValueCellFull!2195 v!520)) (size!4757 _values!649)))))

(assert (=> b!204671 (= lt!103823 (getCurrentListMapNoExtraKeys!373 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204672 () Bool)

(declare-fun e!133896 () Bool)

(assert (=> b!204672 (= e!133893 e!133896)))

(declare-fun res!98666 () Bool)

(assert (=> b!204672 (=> res!98666 e!133896)))

(assert (=> b!204672 (= res!98666 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103821 () ListLongMap!2779)

(assert (=> b!204672 (= lt!103824 lt!103821)))

(declare-fun lt!103826 () tuple2!3864)

(assert (=> b!204672 (= lt!103821 (+!459 lt!103823 lt!103826))))

(declare-fun lt!103816 () ListLongMap!2779)

(assert (=> b!204672 (= lt!103822 lt!103816)))

(assert (=> b!204672 (= lt!103816 (+!459 lt!103819 lt!103826))))

(assert (=> b!204672 (= lt!103822 (+!459 lt!103825 lt!103826))))

(assert (=> b!204672 (= lt!103826 (tuple2!3865 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204673 () Bool)

(declare-fun res!98670 () Bool)

(assert (=> b!204673 (=> (not res!98670) (not e!133897))))

(assert (=> b!204673 (= res!98670 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4758 _keys!825))))))

(declare-fun b!204674 () Bool)

(declare-fun e!133894 () Bool)

(assert (=> b!204674 (= e!133894 tp_is_empty!5077)))

(declare-fun b!204675 () Bool)

(assert (=> b!204675 (= e!133896 true)))

(assert (=> b!204675 (= lt!103816 (+!459 lt!103821 lt!103820))))

(declare-fun lt!103817 () Unit!6196)

(declare-fun addCommutativeForDiffKeys!167 (ListLongMap!2779 (_ BitVec 64) V!6417 (_ BitVec 64) V!6417) Unit!6196)

(assert (=> b!204675 (= lt!103817 (addCommutativeForDiffKeys!167 lt!103823 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204676 () Bool)

(declare-fun res!98668 () Bool)

(assert (=> b!204676 (=> (not res!98668) (not e!133897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9365 (_ BitVec 32)) Bool)

(assert (=> b!204676 (= res!98668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204677 () Bool)

(declare-fun res!98669 () Bool)

(assert (=> b!204677 (=> (not res!98669) (not e!133897))))

(declare-datatypes ((List!2759 0))(
  ( (Nil!2756) (Cons!2755 (h!3397 (_ BitVec 64)) (t!7682 List!2759)) )
))
(declare-fun arrayNoDuplicates!0 (array!9365 (_ BitVec 32) List!2759) Bool)

(assert (=> b!204677 (= res!98669 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2756))))

(declare-fun mapIsEmpty!8684 () Bool)

(assert (=> mapIsEmpty!8684 mapRes!8684))

(declare-fun b!204678 () Bool)

(assert (=> b!204678 (= e!133892 (and e!133894 mapRes!8684))))

(declare-fun condMapEmpty!8684 () Bool)

(declare-fun mapDefault!8684 () ValueCell!2195)

(assert (=> b!204678 (= condMapEmpty!8684 (= (arr!4432 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2195)) mapDefault!8684)))))

(declare-fun b!204679 () Bool)

(assert (=> b!204679 (= e!133895 tp_is_empty!5077)))

(declare-fun b!204680 () Bool)

(declare-fun res!98674 () Bool)

(assert (=> b!204680 (=> (not res!98674) (not e!133897))))

(assert (=> b!204680 (= res!98674 (and (= (size!4757 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4758 _keys!825) (size!4757 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204681 () Bool)

(declare-fun res!98672 () Bool)

(assert (=> b!204681 (=> (not res!98672) (not e!133897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204681 (= res!98672 (validKeyInArray!0 k0!843))))

(declare-fun b!204682 () Bool)

(declare-fun res!98671 () Bool)

(assert (=> b!204682 (=> (not res!98671) (not e!133897))))

(assert (=> b!204682 (= res!98671 (= (select (arr!4433 _keys!825) i!601) k0!843))))

(assert (= (and start!20566 res!98673) b!204680))

(assert (= (and b!204680 res!98674) b!204676))

(assert (= (and b!204676 res!98668) b!204677))

(assert (= (and b!204677 res!98669) b!204673))

(assert (= (and b!204673 res!98670) b!204681))

(assert (= (and b!204681 res!98672) b!204682))

(assert (= (and b!204682 res!98671) b!204671))

(assert (= (and b!204671 (not res!98667)) b!204672))

(assert (= (and b!204672 (not res!98666)) b!204675))

(assert (= (and b!204678 condMapEmpty!8684) mapIsEmpty!8684))

(assert (= (and b!204678 (not condMapEmpty!8684)) mapNonEmpty!8684))

(get-info :version)

(assert (= (and mapNonEmpty!8684 ((_ is ValueCellFull!2195) mapValue!8684)) b!204679))

(assert (= (and b!204678 ((_ is ValueCellFull!2195) mapDefault!8684)) b!204674))

(assert (= start!20566 b!204678))

(declare-fun m!232341 () Bool)

(assert (=> b!204675 m!232341))

(declare-fun m!232343 () Bool)

(assert (=> b!204675 m!232343))

(declare-fun m!232345 () Bool)

(assert (=> b!204682 m!232345))

(declare-fun m!232347 () Bool)

(assert (=> b!204671 m!232347))

(declare-fun m!232349 () Bool)

(assert (=> b!204671 m!232349))

(declare-fun m!232351 () Bool)

(assert (=> b!204671 m!232351))

(declare-fun m!232353 () Bool)

(assert (=> b!204671 m!232353))

(declare-fun m!232355 () Bool)

(assert (=> b!204671 m!232355))

(declare-fun m!232357 () Bool)

(assert (=> b!204671 m!232357))

(declare-fun m!232359 () Bool)

(assert (=> b!204671 m!232359))

(declare-fun m!232361 () Bool)

(assert (=> start!20566 m!232361))

(declare-fun m!232363 () Bool)

(assert (=> start!20566 m!232363))

(declare-fun m!232365 () Bool)

(assert (=> start!20566 m!232365))

(declare-fun m!232367 () Bool)

(assert (=> mapNonEmpty!8684 m!232367))

(declare-fun m!232369 () Bool)

(assert (=> b!204677 m!232369))

(declare-fun m!232371 () Bool)

(assert (=> b!204676 m!232371))

(declare-fun m!232373 () Bool)

(assert (=> b!204672 m!232373))

(declare-fun m!232375 () Bool)

(assert (=> b!204672 m!232375))

(declare-fun m!232377 () Bool)

(assert (=> b!204672 m!232377))

(declare-fun m!232379 () Bool)

(assert (=> b!204681 m!232379))

(check-sat (not b!204672) (not b!204671) (not b!204675) (not b!204681) (not b!204676) b_and!11981 (not b_next!5221) (not start!20566) (not b!204677) tp_is_empty!5077 (not mapNonEmpty!8684))
(check-sat b_and!11981 (not b_next!5221))
