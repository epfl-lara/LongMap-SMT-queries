; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20324 () Bool)

(assert start!20324)

(declare-fun b_free!4983 () Bool)

(declare-fun b_next!4983 () Bool)

(assert (=> start!20324 (= b_free!4983 (not b_next!4983))))

(declare-fun tp!17980 () Bool)

(declare-fun b_and!11729 () Bool)

(assert (=> start!20324 (= tp!17980 b_and!11729)))

(declare-fun b!200326 () Bool)

(declare-fun e!131374 () Bool)

(assert (=> b!200326 (= e!131374 true)))

(declare-datatypes ((V!6099 0))(
  ( (V!6100 (val!2464 Int)) )
))
(declare-datatypes ((tuple2!3722 0))(
  ( (tuple2!3723 (_1!1872 (_ BitVec 64)) (_2!1872 V!6099)) )
))
(declare-datatypes ((List!2638 0))(
  ( (Nil!2635) (Cons!2634 (h!3276 tuple2!3722) (t!7569 List!2638)) )
))
(declare-datatypes ((ListLongMap!2635 0))(
  ( (ListLongMap!2636 (toList!1333 List!2638)) )
))
(declare-fun lt!98894 () ListLongMap!2635)

(declare-fun lt!98895 () ListLongMap!2635)

(declare-fun lt!98904 () tuple2!3722)

(declare-fun +!360 (ListLongMap!2635 tuple2!3722) ListLongMap!2635)

(assert (=> b!200326 (= lt!98894 (+!360 lt!98895 lt!98904))))

(declare-datatypes ((Unit!6020 0))(
  ( (Unit!6021) )
))
(declare-fun lt!98896 () Unit!6020)

(declare-fun lt!98898 () ListLongMap!2635)

(declare-fun v!520 () V!6099)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6099)

(declare-fun addCommutativeForDiffKeys!85 (ListLongMap!2635 (_ BitVec 64) V!6099 (_ BitVec 64) V!6099) Unit!6020)

(assert (=> b!200326 (= lt!98896 (addCommutativeForDiffKeys!85 lt!98898 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!98893 () ListLongMap!2635)

(declare-fun lt!98900 () tuple2!3722)

(assert (=> b!200326 (= lt!98893 (+!360 lt!98894 lt!98900))))

(declare-fun lt!98902 () ListLongMap!2635)

(declare-fun lt!98899 () tuple2!3722)

(assert (=> b!200326 (= lt!98894 (+!360 lt!98902 lt!98899))))

(declare-fun lt!98901 () ListLongMap!2635)

(assert (=> b!200326 (= lt!98901 (+!360 lt!98895 lt!98900))))

(assert (=> b!200326 (= lt!98895 (+!360 lt!98898 lt!98899))))

(declare-fun lt!98897 () ListLongMap!2635)

(assert (=> b!200326 (= lt!98893 (+!360 (+!360 lt!98897 lt!98899) lt!98900))))

(declare-fun minValue!615 () V!6099)

(assert (=> b!200326 (= lt!98900 (tuple2!3723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200326 (= lt!98899 (tuple2!3723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8327 () Bool)

(declare-fun mapRes!8327 () Bool)

(assert (=> mapIsEmpty!8327 mapRes!8327))

(declare-fun b!200327 () Bool)

(declare-fun e!131376 () Bool)

(assert (=> b!200327 (= e!131376 (not e!131374))))

(declare-fun res!95423 () Bool)

(assert (=> b!200327 (=> res!95423 e!131374)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200327 (= res!95423 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2076 0))(
  ( (ValueCellFull!2076 (v!4434 V!6099)) (EmptyCell!2076) )
))
(declare-datatypes ((array!8909 0))(
  ( (array!8910 (arr!4205 (Array (_ BitVec 32) ValueCell!2076)) (size!4530 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8909)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!8911 0))(
  ( (array!8912 (arr!4206 (Array (_ BitVec 32) (_ BitVec 64))) (size!4531 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8911)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!923 (array!8911 array!8909 (_ BitVec 32) (_ BitVec 32) V!6099 V!6099 (_ BitVec 32) Int) ListLongMap!2635)

(assert (=> b!200327 (= lt!98901 (getCurrentListMap!923 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98903 () array!8909)

(assert (=> b!200327 (= lt!98893 (getCurrentListMap!923 _keys!825 lt!98903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200327 (and (= lt!98897 lt!98902) (= lt!98902 lt!98897))))

(assert (=> b!200327 (= lt!98902 (+!360 lt!98898 lt!98904))))

(assert (=> b!200327 (= lt!98904 (tuple2!3723 k0!843 v!520))))

(declare-fun lt!98892 () Unit!6020)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!36 (array!8911 array!8909 (_ BitVec 32) (_ BitVec 32) V!6099 V!6099 (_ BitVec 32) (_ BitVec 64) V!6099 (_ BitVec 32) Int) Unit!6020)

(assert (=> b!200327 (= lt!98892 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!36 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!297 (array!8911 array!8909 (_ BitVec 32) (_ BitVec 32) V!6099 V!6099 (_ BitVec 32) Int) ListLongMap!2635)

(assert (=> b!200327 (= lt!98897 (getCurrentListMapNoExtraKeys!297 _keys!825 lt!98903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200327 (= lt!98903 (array!8910 (store (arr!4205 _values!649) i!601 (ValueCellFull!2076 v!520)) (size!4530 _values!649)))))

(assert (=> b!200327 (= lt!98898 (getCurrentListMapNoExtraKeys!297 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8327 () Bool)

(declare-fun tp!17981 () Bool)

(declare-fun e!131375 () Bool)

(assert (=> mapNonEmpty!8327 (= mapRes!8327 (and tp!17981 e!131375))))

(declare-fun mapRest!8327 () (Array (_ BitVec 32) ValueCell!2076))

(declare-fun mapValue!8327 () ValueCell!2076)

(declare-fun mapKey!8327 () (_ BitVec 32))

(assert (=> mapNonEmpty!8327 (= (arr!4205 _values!649) (store mapRest!8327 mapKey!8327 mapValue!8327))))

(declare-fun res!95424 () Bool)

(assert (=> start!20324 (=> (not res!95424) (not e!131376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20324 (= res!95424 (validMask!0 mask!1149))))

(assert (=> start!20324 e!131376))

(declare-fun e!131373 () Bool)

(declare-fun array_inv!2767 (array!8909) Bool)

(assert (=> start!20324 (and (array_inv!2767 _values!649) e!131373)))

(assert (=> start!20324 true))

(declare-fun tp_is_empty!4839 () Bool)

(assert (=> start!20324 tp_is_empty!4839))

(declare-fun array_inv!2768 (array!8911) Bool)

(assert (=> start!20324 (array_inv!2768 _keys!825)))

(assert (=> start!20324 tp!17980))

(declare-fun b!200328 () Bool)

(declare-fun res!95425 () Bool)

(assert (=> b!200328 (=> (not res!95425) (not e!131376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200328 (= res!95425 (validKeyInArray!0 k0!843))))

(declare-fun b!200329 () Bool)

(assert (=> b!200329 (= e!131375 tp_is_empty!4839)))

(declare-fun b!200330 () Bool)

(declare-fun res!95419 () Bool)

(assert (=> b!200330 (=> (not res!95419) (not e!131376))))

(declare-datatypes ((List!2639 0))(
  ( (Nil!2636) (Cons!2635 (h!3277 (_ BitVec 64)) (t!7570 List!2639)) )
))
(declare-fun arrayNoDuplicates!0 (array!8911 (_ BitVec 32) List!2639) Bool)

(assert (=> b!200330 (= res!95419 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2636))))

(declare-fun b!200331 () Bool)

(declare-fun res!95420 () Bool)

(assert (=> b!200331 (=> (not res!95420) (not e!131376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8911 (_ BitVec 32)) Bool)

(assert (=> b!200331 (= res!95420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200332 () Bool)

(declare-fun res!95418 () Bool)

(assert (=> b!200332 (=> (not res!95418) (not e!131376))))

(assert (=> b!200332 (= res!95418 (and (= (size!4530 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4531 _keys!825) (size!4530 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200333 () Bool)

(declare-fun res!95421 () Bool)

(assert (=> b!200333 (=> (not res!95421) (not e!131376))))

(assert (=> b!200333 (= res!95421 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4531 _keys!825))))))

(declare-fun b!200334 () Bool)

(declare-fun e!131377 () Bool)

(assert (=> b!200334 (= e!131373 (and e!131377 mapRes!8327))))

(declare-fun condMapEmpty!8327 () Bool)

(declare-fun mapDefault!8327 () ValueCell!2076)

(assert (=> b!200334 (= condMapEmpty!8327 (= (arr!4205 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2076)) mapDefault!8327)))))

(declare-fun b!200335 () Bool)

(declare-fun res!95422 () Bool)

(assert (=> b!200335 (=> (not res!95422) (not e!131376))))

(assert (=> b!200335 (= res!95422 (= (select (arr!4206 _keys!825) i!601) k0!843))))

(declare-fun b!200336 () Bool)

(assert (=> b!200336 (= e!131377 tp_is_empty!4839)))

(assert (= (and start!20324 res!95424) b!200332))

(assert (= (and b!200332 res!95418) b!200331))

(assert (= (and b!200331 res!95420) b!200330))

(assert (= (and b!200330 res!95419) b!200333))

(assert (= (and b!200333 res!95421) b!200328))

(assert (= (and b!200328 res!95425) b!200335))

(assert (= (and b!200335 res!95422) b!200327))

(assert (= (and b!200327 (not res!95423)) b!200326))

(assert (= (and b!200334 condMapEmpty!8327) mapIsEmpty!8327))

(assert (= (and b!200334 (not condMapEmpty!8327)) mapNonEmpty!8327))

(get-info :version)

(assert (= (and mapNonEmpty!8327 ((_ is ValueCellFull!2076) mapValue!8327)) b!200329))

(assert (= (and b!200334 ((_ is ValueCellFull!2076) mapDefault!8327)) b!200336))

(assert (= start!20324 b!200334))

(declare-fun m!226763 () Bool)

(assert (=> mapNonEmpty!8327 m!226763))

(declare-fun m!226765 () Bool)

(assert (=> b!200326 m!226765))

(declare-fun m!226767 () Bool)

(assert (=> b!200326 m!226767))

(declare-fun m!226769 () Bool)

(assert (=> b!200326 m!226769))

(declare-fun m!226771 () Bool)

(assert (=> b!200326 m!226771))

(declare-fun m!226773 () Bool)

(assert (=> b!200326 m!226773))

(assert (=> b!200326 m!226769))

(declare-fun m!226775 () Bool)

(assert (=> b!200326 m!226775))

(declare-fun m!226777 () Bool)

(assert (=> b!200326 m!226777))

(declare-fun m!226779 () Bool)

(assert (=> b!200326 m!226779))

(declare-fun m!226781 () Bool)

(assert (=> b!200330 m!226781))

(declare-fun m!226783 () Bool)

(assert (=> b!200328 m!226783))

(declare-fun m!226785 () Bool)

(assert (=> b!200327 m!226785))

(declare-fun m!226787 () Bool)

(assert (=> b!200327 m!226787))

(declare-fun m!226789 () Bool)

(assert (=> b!200327 m!226789))

(declare-fun m!226791 () Bool)

(assert (=> b!200327 m!226791))

(declare-fun m!226793 () Bool)

(assert (=> b!200327 m!226793))

(declare-fun m!226795 () Bool)

(assert (=> b!200327 m!226795))

(declare-fun m!226797 () Bool)

(assert (=> b!200327 m!226797))

(declare-fun m!226799 () Bool)

(assert (=> start!20324 m!226799))

(declare-fun m!226801 () Bool)

(assert (=> start!20324 m!226801))

(declare-fun m!226803 () Bool)

(assert (=> start!20324 m!226803))

(declare-fun m!226805 () Bool)

(assert (=> b!200335 m!226805))

(declare-fun m!226807 () Bool)

(assert (=> b!200331 m!226807))

(check-sat (not b!200330) (not b!200328) (not b!200326) tp_is_empty!4839 b_and!11729 (not b_next!4983) (not b!200327) (not b!200331) (not mapNonEmpty!8327) (not start!20324))
(check-sat b_and!11729 (not b_next!4983))
