; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20326 () Bool)

(assert start!20326)

(declare-fun b_free!4981 () Bool)

(declare-fun b_next!4981 () Bool)

(assert (=> start!20326 (= b_free!4981 (not b_next!4981))))

(declare-fun tp!17975 () Bool)

(declare-fun b_and!11741 () Bool)

(assert (=> start!20326 (= tp!17975 b_and!11741)))

(declare-fun b!200340 () Bool)

(declare-fun e!131383 () Bool)

(declare-fun tp_is_empty!4837 () Bool)

(assert (=> b!200340 (= e!131383 tp_is_empty!4837)))

(declare-fun b!200341 () Bool)

(declare-fun res!95416 () Bool)

(declare-fun e!131381 () Bool)

(assert (=> b!200341 (=> (not res!95416) (not e!131381))))

(declare-datatypes ((array!8899 0))(
  ( (array!8900 (arr!4200 (Array (_ BitVec 32) (_ BitVec 64))) (size!4525 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8899)

(declare-datatypes ((List!2578 0))(
  ( (Nil!2575) (Cons!2574 (h!3216 (_ BitVec 64)) (t!7501 List!2578)) )
))
(declare-fun arrayNoDuplicates!0 (array!8899 (_ BitVec 32) List!2578) Bool)

(assert (=> b!200341 (= res!95416 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2575))))

(declare-fun b!200342 () Bool)

(declare-fun res!95419 () Bool)

(assert (=> b!200342 (=> (not res!95419) (not e!131381))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200342 (= res!95419 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4525 _keys!825))))))

(declare-fun b!200343 () Bool)

(declare-fun e!131384 () Bool)

(assert (=> b!200343 (= e!131384 true)))

(declare-datatypes ((V!6097 0))(
  ( (V!6098 (val!2463 Int)) )
))
(declare-datatypes ((tuple2!3656 0))(
  ( (tuple2!3657 (_1!1839 (_ BitVec 64)) (_2!1839 V!6097)) )
))
(declare-datatypes ((List!2579 0))(
  ( (Nil!2576) (Cons!2575 (h!3217 tuple2!3656) (t!7502 List!2579)) )
))
(declare-datatypes ((ListLongMap!2571 0))(
  ( (ListLongMap!2572 (toList!1301 List!2579)) )
))
(declare-fun lt!98912 () ListLongMap!2571)

(declare-fun lt!98921 () ListLongMap!2571)

(declare-fun lt!98913 () tuple2!3656)

(declare-fun +!355 (ListLongMap!2571 tuple2!3656) ListLongMap!2571)

(assert (=> b!200343 (= lt!98912 (+!355 lt!98921 lt!98913))))

(declare-datatypes ((Unit!5994 0))(
  ( (Unit!5995) )
))
(declare-fun lt!98917 () Unit!5994)

(declare-fun v!520 () V!6097)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6097)

(declare-fun lt!98918 () ListLongMap!2571)

(declare-fun addCommutativeForDiffKeys!83 (ListLongMap!2571 (_ BitVec 64) V!6097 (_ BitVec 64) V!6097) Unit!5994)

(assert (=> b!200343 (= lt!98917 (addCommutativeForDiffKeys!83 lt!98918 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!98923 () ListLongMap!2571)

(declare-fun lt!98916 () tuple2!3656)

(assert (=> b!200343 (= lt!98923 (+!355 lt!98912 lt!98916))))

(declare-fun lt!98919 () ListLongMap!2571)

(declare-fun lt!98924 () tuple2!3656)

(assert (=> b!200343 (= lt!98912 (+!355 lt!98919 lt!98924))))

(declare-fun lt!98914 () ListLongMap!2571)

(assert (=> b!200343 (= lt!98914 (+!355 lt!98921 lt!98916))))

(assert (=> b!200343 (= lt!98921 (+!355 lt!98918 lt!98924))))

(declare-fun lt!98922 () ListLongMap!2571)

(assert (=> b!200343 (= lt!98923 (+!355 (+!355 lt!98922 lt!98924) lt!98916))))

(declare-fun minValue!615 () V!6097)

(assert (=> b!200343 (= lt!98916 (tuple2!3657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200343 (= lt!98924 (tuple2!3657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200344 () Bool)

(assert (=> b!200344 (= e!131381 (not e!131384))))

(declare-fun res!95420 () Bool)

(assert (=> b!200344 (=> res!95420 e!131384)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200344 (= res!95420 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2075 0))(
  ( (ValueCellFull!2075 (v!4434 V!6097)) (EmptyCell!2075) )
))
(declare-datatypes ((array!8901 0))(
  ( (array!8902 (arr!4201 (Array (_ BitVec 32) ValueCell!2075)) (size!4526 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8901)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!897 (array!8899 array!8901 (_ BitVec 32) (_ BitVec 32) V!6097 V!6097 (_ BitVec 32) Int) ListLongMap!2571)

(assert (=> b!200344 (= lt!98914 (getCurrentListMap!897 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98915 () array!8901)

(assert (=> b!200344 (= lt!98923 (getCurrentListMap!897 _keys!825 lt!98915 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200344 (and (= lt!98922 lt!98919) (= lt!98919 lt!98922))))

(assert (=> b!200344 (= lt!98919 (+!355 lt!98918 lt!98913))))

(assert (=> b!200344 (= lt!98913 (tuple2!3657 k0!843 v!520))))

(declare-fun lt!98920 () Unit!5994)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!33 (array!8899 array!8901 (_ BitVec 32) (_ BitVec 32) V!6097 V!6097 (_ BitVec 32) (_ BitVec 64) V!6097 (_ BitVec 32) Int) Unit!5994)

(assert (=> b!200344 (= lt!98920 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!33 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!290 (array!8899 array!8901 (_ BitVec 32) (_ BitVec 32) V!6097 V!6097 (_ BitVec 32) Int) ListLongMap!2571)

(assert (=> b!200344 (= lt!98922 (getCurrentListMapNoExtraKeys!290 _keys!825 lt!98915 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200344 (= lt!98915 (array!8902 (store (arr!4201 _values!649) i!601 (ValueCellFull!2075 v!520)) (size!4526 _values!649)))))

(assert (=> b!200344 (= lt!98918 (getCurrentListMapNoExtraKeys!290 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200345 () Bool)

(declare-fun res!95418 () Bool)

(assert (=> b!200345 (=> (not res!95418) (not e!131381))))

(assert (=> b!200345 (= res!95418 (= (select (arr!4200 _keys!825) i!601) k0!843))))

(declare-fun b!200347 () Bool)

(declare-fun res!95421 () Bool)

(assert (=> b!200347 (=> (not res!95421) (not e!131381))))

(assert (=> b!200347 (= res!95421 (and (= (size!4526 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4525 _keys!825) (size!4526 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200348 () Bool)

(declare-fun e!131380 () Bool)

(declare-fun e!131382 () Bool)

(declare-fun mapRes!8324 () Bool)

(assert (=> b!200348 (= e!131380 (and e!131382 mapRes!8324))))

(declare-fun condMapEmpty!8324 () Bool)

(declare-fun mapDefault!8324 () ValueCell!2075)

(assert (=> b!200348 (= condMapEmpty!8324 (= (arr!4201 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2075)) mapDefault!8324)))))

(declare-fun mapIsEmpty!8324 () Bool)

(assert (=> mapIsEmpty!8324 mapRes!8324))

(declare-fun mapNonEmpty!8324 () Bool)

(declare-fun tp!17974 () Bool)

(assert (=> mapNonEmpty!8324 (= mapRes!8324 (and tp!17974 e!131383))))

(declare-fun mapRest!8324 () (Array (_ BitVec 32) ValueCell!2075))

(declare-fun mapKey!8324 () (_ BitVec 32))

(declare-fun mapValue!8324 () ValueCell!2075)

(assert (=> mapNonEmpty!8324 (= (arr!4201 _values!649) (store mapRest!8324 mapKey!8324 mapValue!8324))))

(declare-fun b!200349 () Bool)

(assert (=> b!200349 (= e!131382 tp_is_empty!4837)))

(declare-fun b!200350 () Bool)

(declare-fun res!95417 () Bool)

(assert (=> b!200350 (=> (not res!95417) (not e!131381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8899 (_ BitVec 32)) Bool)

(assert (=> b!200350 (= res!95417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!95415 () Bool)

(assert (=> start!20326 (=> (not res!95415) (not e!131381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20326 (= res!95415 (validMask!0 mask!1149))))

(assert (=> start!20326 e!131381))

(declare-fun array_inv!2739 (array!8901) Bool)

(assert (=> start!20326 (and (array_inv!2739 _values!649) e!131380)))

(assert (=> start!20326 true))

(assert (=> start!20326 tp_is_empty!4837))

(declare-fun array_inv!2740 (array!8899) Bool)

(assert (=> start!20326 (array_inv!2740 _keys!825)))

(assert (=> start!20326 tp!17975))

(declare-fun b!200346 () Bool)

(declare-fun res!95422 () Bool)

(assert (=> b!200346 (=> (not res!95422) (not e!131381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200346 (= res!95422 (validKeyInArray!0 k0!843))))

(assert (= (and start!20326 res!95415) b!200347))

(assert (= (and b!200347 res!95421) b!200350))

(assert (= (and b!200350 res!95417) b!200341))

(assert (= (and b!200341 res!95416) b!200342))

(assert (= (and b!200342 res!95419) b!200346))

(assert (= (and b!200346 res!95422) b!200345))

(assert (= (and b!200345 res!95418) b!200344))

(assert (= (and b!200344 (not res!95420)) b!200343))

(assert (= (and b!200348 condMapEmpty!8324) mapIsEmpty!8324))

(assert (= (and b!200348 (not condMapEmpty!8324)) mapNonEmpty!8324))

(get-info :version)

(assert (= (and mapNonEmpty!8324 ((_ is ValueCellFull!2075) mapValue!8324)) b!200340))

(assert (= (and b!200348 ((_ is ValueCellFull!2075) mapDefault!8324)) b!200349))

(assert (= start!20326 b!200348))

(declare-fun m!226899 () Bool)

(assert (=> b!200350 m!226899))

(declare-fun m!226901 () Bool)

(assert (=> b!200346 m!226901))

(declare-fun m!226903 () Bool)

(assert (=> b!200341 m!226903))

(declare-fun m!226905 () Bool)

(assert (=> mapNonEmpty!8324 m!226905))

(declare-fun m!226907 () Bool)

(assert (=> b!200343 m!226907))

(declare-fun m!226909 () Bool)

(assert (=> b!200343 m!226909))

(declare-fun m!226911 () Bool)

(assert (=> b!200343 m!226911))

(assert (=> b!200343 m!226907))

(declare-fun m!226913 () Bool)

(assert (=> b!200343 m!226913))

(declare-fun m!226915 () Bool)

(assert (=> b!200343 m!226915))

(declare-fun m!226917 () Bool)

(assert (=> b!200343 m!226917))

(declare-fun m!226919 () Bool)

(assert (=> b!200343 m!226919))

(declare-fun m!226921 () Bool)

(assert (=> b!200343 m!226921))

(declare-fun m!226923 () Bool)

(assert (=> start!20326 m!226923))

(declare-fun m!226925 () Bool)

(assert (=> start!20326 m!226925))

(declare-fun m!226927 () Bool)

(assert (=> start!20326 m!226927))

(declare-fun m!226929 () Bool)

(assert (=> b!200345 m!226929))

(declare-fun m!226931 () Bool)

(assert (=> b!200344 m!226931))

(declare-fun m!226933 () Bool)

(assert (=> b!200344 m!226933))

(declare-fun m!226935 () Bool)

(assert (=> b!200344 m!226935))

(declare-fun m!226937 () Bool)

(assert (=> b!200344 m!226937))

(declare-fun m!226939 () Bool)

(assert (=> b!200344 m!226939))

(declare-fun m!226941 () Bool)

(assert (=> b!200344 m!226941))

(declare-fun m!226943 () Bool)

(assert (=> b!200344 m!226943))

(check-sat (not start!20326) (not mapNonEmpty!8324) (not b!200343) (not b!200346) b_and!11741 (not b!200344) (not b_next!4981) tp_is_empty!4837 (not b!200341) (not b!200350))
(check-sat b_and!11741 (not b_next!4981))
