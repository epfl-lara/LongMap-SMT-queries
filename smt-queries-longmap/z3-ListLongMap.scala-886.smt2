; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20416 () Bool)

(assert start!20416)

(declare-fun b_free!5071 () Bool)

(declare-fun b_next!5071 () Bool)

(assert (=> start!20416 (= b_free!5071 (not b_next!5071))))

(declare-fun tp!18244 () Bool)

(declare-fun b_and!11831 () Bool)

(assert (=> start!20416 (= tp!18244 b_and!11831)))

(declare-fun mapNonEmpty!8459 () Bool)

(declare-fun mapRes!8459 () Bool)

(declare-fun tp!18245 () Bool)

(declare-fun e!132317 () Bool)

(assert (=> mapNonEmpty!8459 (= mapRes!8459 (and tp!18245 e!132317))))

(declare-datatypes ((V!6217 0))(
  ( (V!6218 (val!2508 Int)) )
))
(declare-datatypes ((ValueCell!2120 0))(
  ( (ValueCellFull!2120 (v!4479 V!6217)) (EmptyCell!2120) )
))
(declare-fun mapRest!8459 () (Array (_ BitVec 32) ValueCell!2120))

(declare-fun mapKey!8459 () (_ BitVec 32))

(declare-fun mapValue!8459 () ValueCell!2120)

(declare-datatypes ((array!9075 0))(
  ( (array!9076 (arr!4288 (Array (_ BitVec 32) ValueCell!2120)) (size!4613 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9075)

(assert (=> mapNonEmpty!8459 (= (arr!4288 _values!649) (store mapRest!8459 mapKey!8459 mapValue!8459))))

(declare-fun b!201953 () Bool)

(declare-fun res!96623 () Bool)

(declare-fun e!132321 () Bool)

(assert (=> b!201953 (=> (not res!96623) (not e!132321))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9077 0))(
  ( (array!9078 (arr!4289 (Array (_ BitVec 32) (_ BitVec 64))) (size!4614 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9077)

(assert (=> b!201953 (= res!96623 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4614 _keys!825))))))

(declare-fun mapIsEmpty!8459 () Bool)

(assert (=> mapIsEmpty!8459 mapRes!8459))

(declare-fun res!96630 () Bool)

(assert (=> start!20416 (=> (not res!96630) (not e!132321))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20416 (= res!96630 (validMask!0 mask!1149))))

(assert (=> start!20416 e!132321))

(declare-fun e!132323 () Bool)

(declare-fun array_inv!2797 (array!9075) Bool)

(assert (=> start!20416 (and (array_inv!2797 _values!649) e!132323)))

(assert (=> start!20416 true))

(declare-fun tp_is_empty!4927 () Bool)

(assert (=> start!20416 tp_is_empty!4927))

(declare-fun array_inv!2798 (array!9077) Bool)

(assert (=> start!20416 (array_inv!2798 _keys!825)))

(assert (=> start!20416 tp!18244))

(declare-fun b!201954 () Bool)

(declare-fun res!96625 () Bool)

(assert (=> b!201954 (=> (not res!96625) (not e!132321))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201954 (= res!96625 (and (= (size!4613 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4614 _keys!825) (size!4613 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201955 () Bool)

(declare-fun e!132318 () Bool)

(declare-fun e!132319 () Bool)

(assert (=> b!201955 (= e!132318 e!132319)))

(declare-fun res!96631 () Bool)

(assert (=> b!201955 (=> res!96631 e!132319)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!201955 (= res!96631 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3738 0))(
  ( (tuple2!3739 (_1!1880 (_ BitVec 64)) (_2!1880 V!6217)) )
))
(declare-datatypes ((List!2646 0))(
  ( (Nil!2643) (Cons!2642 (h!3284 tuple2!3738) (t!7569 List!2646)) )
))
(declare-datatypes ((ListLongMap!2653 0))(
  ( (ListLongMap!2654 (toList!1342 List!2646)) )
))
(declare-fun lt!101058 () ListLongMap!2653)

(declare-fun lt!101051 () ListLongMap!2653)

(assert (=> b!201955 (= lt!101058 lt!101051)))

(declare-fun lt!101052 () ListLongMap!2653)

(declare-fun lt!101066 () tuple2!3738)

(declare-fun +!396 (ListLongMap!2653 tuple2!3738) ListLongMap!2653)

(assert (=> b!201955 (= lt!101051 (+!396 lt!101052 lt!101066))))

(declare-fun lt!101059 () ListLongMap!2653)

(declare-fun v!520 () V!6217)

(declare-fun zeroValue!615 () V!6217)

(declare-datatypes ((Unit!6076 0))(
  ( (Unit!6077) )
))
(declare-fun lt!101065 () Unit!6076)

(declare-fun addCommutativeForDiffKeys!119 (ListLongMap!2653 (_ BitVec 64) V!6217 (_ BitVec 64) V!6217) Unit!6076)

(assert (=> b!201955 (= lt!101065 (addCommutativeForDiffKeys!119 lt!101059 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!101056 () ListLongMap!2653)

(declare-fun lt!101055 () tuple2!3738)

(assert (=> b!201955 (= lt!101056 (+!396 lt!101058 lt!101055))))

(declare-fun lt!101064 () ListLongMap!2653)

(declare-fun lt!101057 () tuple2!3738)

(assert (=> b!201955 (= lt!101058 (+!396 lt!101064 lt!101057))))

(declare-fun lt!101063 () ListLongMap!2653)

(declare-fun lt!101054 () ListLongMap!2653)

(assert (=> b!201955 (= lt!101063 lt!101054)))

(assert (=> b!201955 (= lt!101054 (+!396 lt!101052 lt!101055))))

(assert (=> b!201955 (= lt!101052 (+!396 lt!101059 lt!101057))))

(declare-fun lt!101053 () ListLongMap!2653)

(assert (=> b!201955 (= lt!101056 (+!396 (+!396 lt!101053 lt!101057) lt!101055))))

(declare-fun minValue!615 () V!6217)

(assert (=> b!201955 (= lt!101055 (tuple2!3739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201955 (= lt!101057 (tuple2!3739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201956 () Bool)

(assert (=> b!201956 (= e!132321 (not e!132318))))

(declare-fun res!96628 () Bool)

(assert (=> b!201956 (=> res!96628 e!132318)))

(assert (=> b!201956 (= res!96628 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!928 (array!9077 array!9075 (_ BitVec 32) (_ BitVec 32) V!6217 V!6217 (_ BitVec 32) Int) ListLongMap!2653)

(assert (=> b!201956 (= lt!101063 (getCurrentListMap!928 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101061 () array!9075)

(assert (=> b!201956 (= lt!101056 (getCurrentListMap!928 _keys!825 lt!101061 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201956 (and (= lt!101053 lt!101064) (= lt!101064 lt!101053))))

(assert (=> b!201956 (= lt!101064 (+!396 lt!101059 lt!101066))))

(assert (=> b!201956 (= lt!101066 (tuple2!3739 k0!843 v!520))))

(declare-fun lt!101062 () Unit!6076)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!64 (array!9077 array!9075 (_ BitVec 32) (_ BitVec 32) V!6217 V!6217 (_ BitVec 32) (_ BitVec 64) V!6217 (_ BitVec 32) Int) Unit!6076)

(assert (=> b!201956 (= lt!101062 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!64 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!321 (array!9077 array!9075 (_ BitVec 32) (_ BitVec 32) V!6217 V!6217 (_ BitVec 32) Int) ListLongMap!2653)

(assert (=> b!201956 (= lt!101053 (getCurrentListMapNoExtraKeys!321 _keys!825 lt!101061 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201956 (= lt!101061 (array!9076 (store (arr!4288 _values!649) i!601 (ValueCellFull!2120 v!520)) (size!4613 _values!649)))))

(assert (=> b!201956 (= lt!101059 (getCurrentListMapNoExtraKeys!321 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201957 () Bool)

(declare-fun res!96624 () Bool)

(assert (=> b!201957 (=> (not res!96624) (not e!132321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9077 (_ BitVec 32)) Bool)

(assert (=> b!201957 (= res!96624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201958 () Bool)

(declare-fun e!132322 () Bool)

(assert (=> b!201958 (= e!132322 tp_is_empty!4927)))

(declare-fun b!201959 () Bool)

(declare-fun res!96626 () Bool)

(assert (=> b!201959 (=> (not res!96626) (not e!132321))))

(assert (=> b!201959 (= res!96626 (= (select (arr!4289 _keys!825) i!601) k0!843))))

(declare-fun b!201960 () Bool)

(assert (=> b!201960 (= e!132319 true)))

(assert (=> b!201960 (= (+!396 lt!101051 lt!101055) (+!396 lt!101054 lt!101066))))

(declare-fun lt!101060 () Unit!6076)

(assert (=> b!201960 (= lt!101060 (addCommutativeForDiffKeys!119 lt!101052 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201961 () Bool)

(declare-fun res!96627 () Bool)

(assert (=> b!201961 (=> (not res!96627) (not e!132321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201961 (= res!96627 (validKeyInArray!0 k0!843))))

(declare-fun b!201962 () Bool)

(declare-fun res!96629 () Bool)

(assert (=> b!201962 (=> (not res!96629) (not e!132321))))

(declare-datatypes ((List!2647 0))(
  ( (Nil!2644) (Cons!2643 (h!3285 (_ BitVec 64)) (t!7570 List!2647)) )
))
(declare-fun arrayNoDuplicates!0 (array!9077 (_ BitVec 32) List!2647) Bool)

(assert (=> b!201962 (= res!96629 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2644))))

(declare-fun b!201963 () Bool)

(assert (=> b!201963 (= e!132323 (and e!132322 mapRes!8459))))

(declare-fun condMapEmpty!8459 () Bool)

(declare-fun mapDefault!8459 () ValueCell!2120)

(assert (=> b!201963 (= condMapEmpty!8459 (= (arr!4288 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2120)) mapDefault!8459)))))

(declare-fun b!201964 () Bool)

(assert (=> b!201964 (= e!132317 tp_is_empty!4927)))

(assert (= (and start!20416 res!96630) b!201954))

(assert (= (and b!201954 res!96625) b!201957))

(assert (= (and b!201957 res!96624) b!201962))

(assert (= (and b!201962 res!96629) b!201953))

(assert (= (and b!201953 res!96623) b!201961))

(assert (= (and b!201961 res!96627) b!201959))

(assert (= (and b!201959 res!96626) b!201956))

(assert (= (and b!201956 (not res!96628)) b!201955))

(assert (= (and b!201955 (not res!96631)) b!201960))

(assert (= (and b!201963 condMapEmpty!8459) mapIsEmpty!8459))

(assert (= (and b!201963 (not condMapEmpty!8459)) mapNonEmpty!8459))

(get-info :version)

(assert (= (and mapNonEmpty!8459 ((_ is ValueCellFull!2120) mapValue!8459)) b!201964))

(assert (= (and b!201963 ((_ is ValueCellFull!2120) mapDefault!8459)) b!201958))

(assert (= start!20416 b!201963))

(declare-fun m!229221 () Bool)

(assert (=> b!201957 m!229221))

(declare-fun m!229223 () Bool)

(assert (=> b!201956 m!229223))

(declare-fun m!229225 () Bool)

(assert (=> b!201956 m!229225))

(declare-fun m!229227 () Bool)

(assert (=> b!201956 m!229227))

(declare-fun m!229229 () Bool)

(assert (=> b!201956 m!229229))

(declare-fun m!229231 () Bool)

(assert (=> b!201956 m!229231))

(declare-fun m!229233 () Bool)

(assert (=> b!201956 m!229233))

(declare-fun m!229235 () Bool)

(assert (=> b!201956 m!229235))

(declare-fun m!229237 () Bool)

(assert (=> start!20416 m!229237))

(declare-fun m!229239 () Bool)

(assert (=> start!20416 m!229239))

(declare-fun m!229241 () Bool)

(assert (=> start!20416 m!229241))

(declare-fun m!229243 () Bool)

(assert (=> b!201962 m!229243))

(declare-fun m!229245 () Bool)

(assert (=> b!201960 m!229245))

(declare-fun m!229247 () Bool)

(assert (=> b!201960 m!229247))

(declare-fun m!229249 () Bool)

(assert (=> b!201960 m!229249))

(declare-fun m!229251 () Bool)

(assert (=> mapNonEmpty!8459 m!229251))

(declare-fun m!229253 () Bool)

(assert (=> b!201959 m!229253))

(declare-fun m!229255 () Bool)

(assert (=> b!201961 m!229255))

(declare-fun m!229257 () Bool)

(assert (=> b!201955 m!229257))

(declare-fun m!229259 () Bool)

(assert (=> b!201955 m!229259))

(declare-fun m!229261 () Bool)

(assert (=> b!201955 m!229261))

(declare-fun m!229263 () Bool)

(assert (=> b!201955 m!229263))

(declare-fun m!229265 () Bool)

(assert (=> b!201955 m!229265))

(declare-fun m!229267 () Bool)

(assert (=> b!201955 m!229267))

(assert (=> b!201955 m!229263))

(declare-fun m!229269 () Bool)

(assert (=> b!201955 m!229269))

(declare-fun m!229271 () Bool)

(assert (=> b!201955 m!229271))

(check-sat (not b!201957) (not mapNonEmpty!8459) tp_is_empty!4927 (not b!201955) (not start!20416) (not b!201961) b_and!11831 (not b!201960) (not b!201962) (not b_next!5071) (not b!201956))
(check-sat b_and!11831 (not b_next!5071))
