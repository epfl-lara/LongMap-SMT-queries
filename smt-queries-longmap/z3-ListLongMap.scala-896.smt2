; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20476 () Bool)

(assert start!20476)

(declare-fun b_free!5131 () Bool)

(declare-fun b_next!5131 () Bool)

(assert (=> start!20476 (= b_free!5131 (not b_next!5131))))

(declare-fun tp!18424 () Bool)

(declare-fun b_and!11851 () Bool)

(assert (=> start!20476 (= tp!18424 b_and!11851)))

(declare-fun mapIsEmpty!8549 () Bool)

(declare-fun mapRes!8549 () Bool)

(assert (=> mapIsEmpty!8549 mapRes!8549))

(declare-fun b!202848 () Bool)

(declare-fun e!132826 () Bool)

(declare-fun e!132823 () Bool)

(assert (=> b!202848 (= e!132826 (not e!132823))))

(declare-fun res!97331 () Bool)

(assert (=> b!202848 (=> res!97331 e!132823)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202848 (= res!97331 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6297 0))(
  ( (V!6298 (val!2538 Int)) )
))
(declare-datatypes ((ValueCell!2150 0))(
  ( (ValueCellFull!2150 (v!4502 V!6297)) (EmptyCell!2150) )
))
(declare-datatypes ((array!9185 0))(
  ( (array!9186 (arr!4342 (Array (_ BitVec 32) ValueCell!2150)) (size!4668 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9185)

(declare-fun zeroValue!615 () V!6297)

(declare-datatypes ((array!9187 0))(
  ( (array!9188 (arr!4343 (Array (_ BitVec 32) (_ BitVec 64))) (size!4669 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9187)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6297)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3828 0))(
  ( (tuple2!3829 (_1!1925 (_ BitVec 64)) (_2!1925 V!6297)) )
))
(declare-datatypes ((List!2739 0))(
  ( (Nil!2736) (Cons!2735 (h!3377 tuple2!3828) (t!7661 List!2739)) )
))
(declare-datatypes ((ListLongMap!2731 0))(
  ( (ListLongMap!2732 (toList!1381 List!2739)) )
))
(declare-fun lt!101994 () ListLongMap!2731)

(declare-fun getCurrentListMap!935 (array!9187 array!9185 (_ BitVec 32) (_ BitVec 32) V!6297 V!6297 (_ BitVec 32) Int) ListLongMap!2731)

(assert (=> b!202848 (= lt!101994 (getCurrentListMap!935 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101998 () array!9185)

(declare-fun lt!101996 () ListLongMap!2731)

(assert (=> b!202848 (= lt!101996 (getCurrentListMap!935 _keys!825 lt!101998 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101997 () ListLongMap!2731)

(declare-fun lt!102001 () ListLongMap!2731)

(assert (=> b!202848 (and (= lt!101997 lt!102001) (= lt!102001 lt!101997))))

(declare-fun lt!101999 () ListLongMap!2731)

(declare-fun lt!101993 () tuple2!3828)

(declare-fun +!430 (ListLongMap!2731 tuple2!3828) ListLongMap!2731)

(assert (=> b!202848 (= lt!102001 (+!430 lt!101999 lt!101993))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6297)

(assert (=> b!202848 (= lt!101993 (tuple2!3829 k0!843 v!520))))

(declare-datatypes ((Unit!6110 0))(
  ( (Unit!6111) )
))
(declare-fun lt!101991 () Unit!6110)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!94 (array!9187 array!9185 (_ BitVec 32) (_ BitVec 32) V!6297 V!6297 (_ BitVec 32) (_ BitVec 64) V!6297 (_ BitVec 32) Int) Unit!6110)

(assert (=> b!202848 (= lt!101991 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!94 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!345 (array!9187 array!9185 (_ BitVec 32) (_ BitVec 32) V!6297 V!6297 (_ BitVec 32) Int) ListLongMap!2731)

(assert (=> b!202848 (= lt!101997 (getCurrentListMapNoExtraKeys!345 _keys!825 lt!101998 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202848 (= lt!101998 (array!9186 (store (arr!4342 _values!649) i!601 (ValueCellFull!2150 v!520)) (size!4668 _values!649)))))

(assert (=> b!202848 (= lt!101999 (getCurrentListMapNoExtraKeys!345 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202849 () Bool)

(declare-fun res!97329 () Bool)

(assert (=> b!202849 (=> (not res!97329) (not e!132826))))

(declare-datatypes ((List!2740 0))(
  ( (Nil!2737) (Cons!2736 (h!3378 (_ BitVec 64)) (t!7662 List!2740)) )
))
(declare-fun arrayNoDuplicates!0 (array!9187 (_ BitVec 32) List!2740) Bool)

(assert (=> b!202849 (= res!97329 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2737))))

(declare-fun res!97330 () Bool)

(assert (=> start!20476 (=> (not res!97330) (not e!132826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20476 (= res!97330 (validMask!0 mask!1149))))

(assert (=> start!20476 e!132826))

(declare-fun e!132825 () Bool)

(declare-fun array_inv!2849 (array!9185) Bool)

(assert (=> start!20476 (and (array_inv!2849 _values!649) e!132825)))

(assert (=> start!20476 true))

(declare-fun tp_is_empty!4987 () Bool)

(assert (=> start!20476 tp_is_empty!4987))

(declare-fun array_inv!2850 (array!9187) Bool)

(assert (=> start!20476 (array_inv!2850 _keys!825)))

(assert (=> start!20476 tp!18424))

(declare-fun b!202850 () Bool)

(declare-fun e!132822 () Bool)

(assert (=> b!202850 (= e!132823 e!132822)))

(declare-fun res!97333 () Bool)

(assert (=> b!202850 (=> res!97333 e!132822)))

(assert (=> b!202850 (= res!97333 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101995 () ListLongMap!2731)

(assert (=> b!202850 (= lt!101996 lt!101995)))

(declare-fun lt!102000 () tuple2!3828)

(assert (=> b!202850 (= lt!101995 (+!430 lt!102001 lt!102000))))

(declare-fun lt!102002 () ListLongMap!2731)

(assert (=> b!202850 (= lt!101994 lt!102002)))

(assert (=> b!202850 (= lt!102002 (+!430 lt!101999 lt!102000))))

(assert (=> b!202850 (= lt!101996 (+!430 lt!101997 lt!102000))))

(assert (=> b!202850 (= lt!102000 (tuple2!3829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202851 () Bool)

(declare-fun res!97327 () Bool)

(assert (=> b!202851 (=> (not res!97327) (not e!132826))))

(assert (=> b!202851 (= res!97327 (= (select (arr!4343 _keys!825) i!601) k0!843))))

(declare-fun b!202852 () Bool)

(declare-fun e!132828 () Bool)

(assert (=> b!202852 (= e!132828 tp_is_empty!4987)))

(declare-fun b!202853 () Bool)

(declare-fun res!97334 () Bool)

(assert (=> b!202853 (=> (not res!97334) (not e!132826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202853 (= res!97334 (validKeyInArray!0 k0!843))))

(declare-fun b!202854 () Bool)

(assert (=> b!202854 (= e!132825 (and e!132828 mapRes!8549))))

(declare-fun condMapEmpty!8549 () Bool)

(declare-fun mapDefault!8549 () ValueCell!2150)

(assert (=> b!202854 (= condMapEmpty!8549 (= (arr!4342 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2150)) mapDefault!8549)))))

(declare-fun b!202855 () Bool)

(declare-fun res!97328 () Bool)

(assert (=> b!202855 (=> (not res!97328) (not e!132826))))

(assert (=> b!202855 (= res!97328 (and (= (size!4668 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4669 _keys!825) (size!4668 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202856 () Bool)

(declare-fun res!97332 () Bool)

(assert (=> b!202856 (=> (not res!97332) (not e!132826))))

(assert (=> b!202856 (= res!97332 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4669 _keys!825))))))

(declare-fun b!202857 () Bool)

(declare-fun e!132824 () Bool)

(assert (=> b!202857 (= e!132824 tp_is_empty!4987)))

(declare-fun b!202858 () Bool)

(declare-fun res!97326 () Bool)

(assert (=> b!202858 (=> (not res!97326) (not e!132826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9187 (_ BitVec 32)) Bool)

(assert (=> b!202858 (= res!97326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202859 () Bool)

(assert (=> b!202859 (= e!132822 true)))

(assert (=> b!202859 (= lt!101995 (+!430 lt!102002 lt!101993))))

(declare-fun lt!101992 () Unit!6110)

(declare-fun addCommutativeForDiffKeys!130 (ListLongMap!2731 (_ BitVec 64) V!6297 (_ BitVec 64) V!6297) Unit!6110)

(assert (=> b!202859 (= lt!101992 (addCommutativeForDiffKeys!130 lt!101999 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8549 () Bool)

(declare-fun tp!18425 () Bool)

(assert (=> mapNonEmpty!8549 (= mapRes!8549 (and tp!18425 e!132824))))

(declare-fun mapKey!8549 () (_ BitVec 32))

(declare-fun mapRest!8549 () (Array (_ BitVec 32) ValueCell!2150))

(declare-fun mapValue!8549 () ValueCell!2150)

(assert (=> mapNonEmpty!8549 (= (arr!4342 _values!649) (store mapRest!8549 mapKey!8549 mapValue!8549))))

(assert (= (and start!20476 res!97330) b!202855))

(assert (= (and b!202855 res!97328) b!202858))

(assert (= (and b!202858 res!97326) b!202849))

(assert (= (and b!202849 res!97329) b!202856))

(assert (= (and b!202856 res!97332) b!202853))

(assert (= (and b!202853 res!97334) b!202851))

(assert (= (and b!202851 res!97327) b!202848))

(assert (= (and b!202848 (not res!97331)) b!202850))

(assert (= (and b!202850 (not res!97333)) b!202859))

(assert (= (and b!202854 condMapEmpty!8549) mapIsEmpty!8549))

(assert (= (and b!202854 (not condMapEmpty!8549)) mapNonEmpty!8549))

(get-info :version)

(assert (= (and mapNonEmpty!8549 ((_ is ValueCellFull!2150) mapValue!8549)) b!202857))

(assert (= (and b!202854 ((_ is ValueCellFull!2150) mapDefault!8549)) b!202852))

(assert (= start!20476 b!202854))

(declare-fun m!229755 () Bool)

(assert (=> b!202849 m!229755))

(declare-fun m!229757 () Bool)

(assert (=> b!202859 m!229757))

(declare-fun m!229759 () Bool)

(assert (=> b!202859 m!229759))

(declare-fun m!229761 () Bool)

(assert (=> b!202858 m!229761))

(declare-fun m!229763 () Bool)

(assert (=> b!202853 m!229763))

(declare-fun m!229765 () Bool)

(assert (=> start!20476 m!229765))

(declare-fun m!229767 () Bool)

(assert (=> start!20476 m!229767))

(declare-fun m!229769 () Bool)

(assert (=> start!20476 m!229769))

(declare-fun m!229771 () Bool)

(assert (=> mapNonEmpty!8549 m!229771))

(declare-fun m!229773 () Bool)

(assert (=> b!202851 m!229773))

(declare-fun m!229775 () Bool)

(assert (=> b!202850 m!229775))

(declare-fun m!229777 () Bool)

(assert (=> b!202850 m!229777))

(declare-fun m!229779 () Bool)

(assert (=> b!202850 m!229779))

(declare-fun m!229781 () Bool)

(assert (=> b!202848 m!229781))

(declare-fun m!229783 () Bool)

(assert (=> b!202848 m!229783))

(declare-fun m!229785 () Bool)

(assert (=> b!202848 m!229785))

(declare-fun m!229787 () Bool)

(assert (=> b!202848 m!229787))

(declare-fun m!229789 () Bool)

(assert (=> b!202848 m!229789))

(declare-fun m!229791 () Bool)

(assert (=> b!202848 m!229791))

(declare-fun m!229793 () Bool)

(assert (=> b!202848 m!229793))

(check-sat (not start!20476) (not mapNonEmpty!8549) tp_is_empty!4987 (not b!202849) b_and!11851 (not b_next!5131) (not b!202858) (not b!202850) (not b!202853) (not b!202859) (not b!202848))
(check-sat b_and!11851 (not b_next!5131))
