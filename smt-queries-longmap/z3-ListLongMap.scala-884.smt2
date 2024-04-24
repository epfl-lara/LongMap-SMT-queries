; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20404 () Bool)

(assert start!20404)

(declare-fun b_free!5059 () Bool)

(declare-fun b_next!5059 () Bool)

(assert (=> start!20404 (= b_free!5059 (not b_next!5059))))

(declare-fun tp!18209 () Bool)

(declare-fun b_and!11819 () Bool)

(assert (=> start!20404 (= tp!18209 b_and!11819)))

(declare-fun b!201737 () Bool)

(declare-fun e!132197 () Bool)

(declare-fun e!132192 () Bool)

(assert (=> b!201737 (= e!132197 e!132192)))

(declare-fun res!96465 () Bool)

(assert (=> b!201737 (=> res!96465 e!132192)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!201737 (= res!96465 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6201 0))(
  ( (V!6202 (val!2502 Int)) )
))
(declare-datatypes ((tuple2!3726 0))(
  ( (tuple2!3727 (_1!1874 (_ BitVec 64)) (_2!1874 V!6201)) )
))
(declare-datatypes ((List!2636 0))(
  ( (Nil!2633) (Cons!2632 (h!3274 tuple2!3726) (t!7559 List!2636)) )
))
(declare-datatypes ((ListLongMap!2641 0))(
  ( (ListLongMap!2642 (toList!1336 List!2636)) )
))
(declare-fun lt!100778 () ListLongMap!2641)

(declare-fun lt!100764 () ListLongMap!2641)

(assert (=> b!201737 (= lt!100778 lt!100764)))

(declare-fun lt!100763 () ListLongMap!2641)

(declare-fun lt!100776 () tuple2!3726)

(declare-fun +!390 (ListLongMap!2641 tuple2!3726) ListLongMap!2641)

(assert (=> b!201737 (= lt!100764 (+!390 lt!100763 lt!100776))))

(declare-datatypes ((Unit!6064 0))(
  ( (Unit!6065) )
))
(declare-fun lt!100774 () Unit!6064)

(declare-fun v!520 () V!6201)

(declare-fun zeroValue!615 () V!6201)

(declare-fun lt!100770 () ListLongMap!2641)

(declare-fun addCommutativeForDiffKeys!113 (ListLongMap!2641 (_ BitVec 64) V!6201 (_ BitVec 64) V!6201) Unit!6064)

(assert (=> b!201737 (= lt!100774 (addCommutativeForDiffKeys!113 lt!100770 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100772 () ListLongMap!2641)

(declare-fun lt!100767 () tuple2!3726)

(assert (=> b!201737 (= lt!100772 (+!390 lt!100778 lt!100767))))

(declare-fun lt!100765 () ListLongMap!2641)

(declare-fun lt!100773 () tuple2!3726)

(assert (=> b!201737 (= lt!100778 (+!390 lt!100765 lt!100773))))

(declare-fun lt!100768 () ListLongMap!2641)

(declare-fun lt!100775 () ListLongMap!2641)

(assert (=> b!201737 (= lt!100768 lt!100775)))

(assert (=> b!201737 (= lt!100775 (+!390 lt!100763 lt!100767))))

(assert (=> b!201737 (= lt!100763 (+!390 lt!100770 lt!100773))))

(declare-fun lt!100769 () ListLongMap!2641)

(assert (=> b!201737 (= lt!100772 (+!390 (+!390 lt!100769 lt!100773) lt!100767))))

(declare-fun minValue!615 () V!6201)

(assert (=> b!201737 (= lt!100767 (tuple2!3727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201737 (= lt!100773 (tuple2!3727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8441 () Bool)

(declare-fun mapRes!8441 () Bool)

(declare-fun tp!18208 () Bool)

(declare-fun e!132195 () Bool)

(assert (=> mapNonEmpty!8441 (= mapRes!8441 (and tp!18208 e!132195))))

(declare-fun mapKey!8441 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2114 0))(
  ( (ValueCellFull!2114 (v!4473 V!6201)) (EmptyCell!2114) )
))
(declare-fun mapValue!8441 () ValueCell!2114)

(declare-datatypes ((array!9053 0))(
  ( (array!9054 (arr!4277 (Array (_ BitVec 32) ValueCell!2114)) (size!4602 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9053)

(declare-fun mapRest!8441 () (Array (_ BitVec 32) ValueCell!2114))

(assert (=> mapNonEmpty!8441 (= (arr!4277 _values!649) (store mapRest!8441 mapKey!8441 mapValue!8441))))

(declare-fun b!201738 () Bool)

(declare-fun e!132191 () Bool)

(declare-fun e!132193 () Bool)

(assert (=> b!201738 (= e!132191 (and e!132193 mapRes!8441))))

(declare-fun condMapEmpty!8441 () Bool)

(declare-fun mapDefault!8441 () ValueCell!2114)

(assert (=> b!201738 (= condMapEmpty!8441 (= (arr!4277 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2114)) mapDefault!8441)))))

(declare-fun b!201739 () Bool)

(declare-fun res!96466 () Bool)

(declare-fun e!132194 () Bool)

(assert (=> b!201739 (=> (not res!96466) (not e!132194))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9055 0))(
  ( (array!9056 (arr!4278 (Array (_ BitVec 32) (_ BitVec 64))) (size!4603 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9055)

(assert (=> b!201739 (= res!96466 (= (select (arr!4278 _keys!825) i!601) k0!843))))

(declare-fun b!201740 () Bool)

(declare-fun res!96467 () Bool)

(assert (=> b!201740 (=> (not res!96467) (not e!132194))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!201740 (= res!96467 (and (= (size!4602 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4603 _keys!825) (size!4602 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201741 () Bool)

(declare-fun tp_is_empty!4915 () Bool)

(assert (=> b!201741 (= e!132195 tp_is_empty!4915)))

(declare-fun b!201743 () Bool)

(assert (=> b!201743 (= e!132193 tp_is_empty!4915)))

(declare-fun b!201744 () Bool)

(declare-fun res!96462 () Bool)

(assert (=> b!201744 (=> (not res!96462) (not e!132194))))

(assert (=> b!201744 (= res!96462 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4603 _keys!825))))))

(declare-fun b!201745 () Bool)

(declare-fun res!96463 () Bool)

(assert (=> b!201745 (=> (not res!96463) (not e!132194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201745 (= res!96463 (validKeyInArray!0 k0!843))))

(declare-fun b!201746 () Bool)

(declare-fun res!96464 () Bool)

(assert (=> b!201746 (=> (not res!96464) (not e!132194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9055 (_ BitVec 32)) Bool)

(assert (=> b!201746 (= res!96464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201747 () Bool)

(declare-fun res!96461 () Bool)

(assert (=> b!201747 (=> (not res!96461) (not e!132194))))

(declare-datatypes ((List!2637 0))(
  ( (Nil!2634) (Cons!2633 (h!3275 (_ BitVec 64)) (t!7560 List!2637)) )
))
(declare-fun arrayNoDuplicates!0 (array!9055 (_ BitVec 32) List!2637) Bool)

(assert (=> b!201747 (= res!96461 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2634))))

(declare-fun b!201742 () Bool)

(assert (=> b!201742 (= e!132194 (not e!132197))))

(declare-fun res!96468 () Bool)

(assert (=> b!201742 (=> res!96468 e!132197)))

(assert (=> b!201742 (= res!96468 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!924 (array!9055 array!9053 (_ BitVec 32) (_ BitVec 32) V!6201 V!6201 (_ BitVec 32) Int) ListLongMap!2641)

(assert (=> b!201742 (= lt!100768 (getCurrentListMap!924 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100766 () array!9053)

(assert (=> b!201742 (= lt!100772 (getCurrentListMap!924 _keys!825 lt!100766 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201742 (and (= lt!100769 lt!100765) (= lt!100765 lt!100769))))

(assert (=> b!201742 (= lt!100765 (+!390 lt!100770 lt!100776))))

(assert (=> b!201742 (= lt!100776 (tuple2!3727 k0!843 v!520))))

(declare-fun lt!100771 () Unit!6064)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!60 (array!9055 array!9053 (_ BitVec 32) (_ BitVec 32) V!6201 V!6201 (_ BitVec 32) (_ BitVec 64) V!6201 (_ BitVec 32) Int) Unit!6064)

(assert (=> b!201742 (= lt!100771 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!60 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!317 (array!9055 array!9053 (_ BitVec 32) (_ BitVec 32) V!6201 V!6201 (_ BitVec 32) Int) ListLongMap!2641)

(assert (=> b!201742 (= lt!100769 (getCurrentListMapNoExtraKeys!317 _keys!825 lt!100766 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201742 (= lt!100766 (array!9054 (store (arr!4277 _values!649) i!601 (ValueCellFull!2114 v!520)) (size!4602 _values!649)))))

(assert (=> b!201742 (= lt!100770 (getCurrentListMapNoExtraKeys!317 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!96469 () Bool)

(assert (=> start!20404 (=> (not res!96469) (not e!132194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20404 (= res!96469 (validMask!0 mask!1149))))

(assert (=> start!20404 e!132194))

(declare-fun array_inv!2787 (array!9053) Bool)

(assert (=> start!20404 (and (array_inv!2787 _values!649) e!132191)))

(assert (=> start!20404 true))

(assert (=> start!20404 tp_is_empty!4915))

(declare-fun array_inv!2788 (array!9055) Bool)

(assert (=> start!20404 (array_inv!2788 _keys!825)))

(assert (=> start!20404 tp!18209))

(declare-fun b!201748 () Bool)

(assert (=> b!201748 (= e!132192 true)))

(assert (=> b!201748 (= (+!390 lt!100764 lt!100767) (+!390 lt!100775 lt!100776))))

(declare-fun lt!100777 () Unit!6064)

(assert (=> b!201748 (= lt!100777 (addCommutativeForDiffKeys!113 lt!100763 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8441 () Bool)

(assert (=> mapIsEmpty!8441 mapRes!8441))

(assert (= (and start!20404 res!96469) b!201740))

(assert (= (and b!201740 res!96467) b!201746))

(assert (= (and b!201746 res!96464) b!201747))

(assert (= (and b!201747 res!96461) b!201744))

(assert (= (and b!201744 res!96462) b!201745))

(assert (= (and b!201745 res!96463) b!201739))

(assert (= (and b!201739 res!96466) b!201742))

(assert (= (and b!201742 (not res!96468)) b!201737))

(assert (= (and b!201737 (not res!96465)) b!201748))

(assert (= (and b!201738 condMapEmpty!8441) mapIsEmpty!8441))

(assert (= (and b!201738 (not condMapEmpty!8441)) mapNonEmpty!8441))

(get-info :version)

(assert (= (and mapNonEmpty!8441 ((_ is ValueCellFull!2114) mapValue!8441)) b!201741))

(assert (= (and b!201738 ((_ is ValueCellFull!2114) mapDefault!8441)) b!201743))

(assert (= start!20404 b!201738))

(declare-fun m!228909 () Bool)

(assert (=> start!20404 m!228909))

(declare-fun m!228911 () Bool)

(assert (=> start!20404 m!228911))

(declare-fun m!228913 () Bool)

(assert (=> start!20404 m!228913))

(declare-fun m!228915 () Bool)

(assert (=> b!201745 m!228915))

(declare-fun m!228917 () Bool)

(assert (=> b!201737 m!228917))

(declare-fun m!228919 () Bool)

(assert (=> b!201737 m!228919))

(declare-fun m!228921 () Bool)

(assert (=> b!201737 m!228921))

(declare-fun m!228923 () Bool)

(assert (=> b!201737 m!228923))

(declare-fun m!228925 () Bool)

(assert (=> b!201737 m!228925))

(assert (=> b!201737 m!228919))

(declare-fun m!228927 () Bool)

(assert (=> b!201737 m!228927))

(declare-fun m!228929 () Bool)

(assert (=> b!201737 m!228929))

(declare-fun m!228931 () Bool)

(assert (=> b!201737 m!228931))

(declare-fun m!228933 () Bool)

(assert (=> b!201746 m!228933))

(declare-fun m!228935 () Bool)

(assert (=> mapNonEmpty!8441 m!228935))

(declare-fun m!228937 () Bool)

(assert (=> b!201747 m!228937))

(declare-fun m!228939 () Bool)

(assert (=> b!201742 m!228939))

(declare-fun m!228941 () Bool)

(assert (=> b!201742 m!228941))

(declare-fun m!228943 () Bool)

(assert (=> b!201742 m!228943))

(declare-fun m!228945 () Bool)

(assert (=> b!201742 m!228945))

(declare-fun m!228947 () Bool)

(assert (=> b!201742 m!228947))

(declare-fun m!228949 () Bool)

(assert (=> b!201742 m!228949))

(declare-fun m!228951 () Bool)

(assert (=> b!201742 m!228951))

(declare-fun m!228953 () Bool)

(assert (=> b!201748 m!228953))

(declare-fun m!228955 () Bool)

(assert (=> b!201748 m!228955))

(declare-fun m!228957 () Bool)

(assert (=> b!201748 m!228957))

(declare-fun m!228959 () Bool)

(assert (=> b!201739 m!228959))

(check-sat (not start!20404) (not b!201737) (not b!201745) tp_is_empty!4915 (not b!201746) (not mapNonEmpty!8441) (not b!201742) (not b!201747) (not b!201748) (not b_next!5059) b_and!11819)
(check-sat b_and!11819 (not b_next!5059))
