; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20764 () Bool)

(assert start!20764)

(declare-fun b_free!5419 () Bool)

(declare-fun b_next!5419 () Bool)

(assert (=> start!20764 (= b_free!5419 (not b_next!5419))))

(declare-fun tp!19289 () Bool)

(declare-fun b_and!12139 () Bool)

(assert (=> start!20764 (= tp!19289 b_and!12139)))

(declare-fun b!207749 () Bool)

(declare-fun e!135557 () Bool)

(assert (=> b!207749 (= e!135557 (not true))))

(declare-datatypes ((V!6681 0))(
  ( (V!6682 (val!2682 Int)) )
))
(declare-datatypes ((tuple2!4052 0))(
  ( (tuple2!4053 (_1!2037 (_ BitVec 64)) (_2!2037 V!6681)) )
))
(declare-datatypes ((List!2955 0))(
  ( (Nil!2952) (Cons!2951 (h!3593 tuple2!4052) (t!7877 List!2955)) )
))
(declare-datatypes ((ListLongMap!2955 0))(
  ( (ListLongMap!2956 (toList!1493 List!2955)) )
))
(declare-fun lt!106421 () ListLongMap!2955)

(declare-datatypes ((ValueCell!2294 0))(
  ( (ValueCellFull!2294 (v!4646 V!6681)) (EmptyCell!2294) )
))
(declare-datatypes ((array!9743 0))(
  ( (array!9744 (arr!4621 (Array (_ BitVec 32) ValueCell!2294)) (size!4947 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9743)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6681)

(declare-datatypes ((array!9745 0))(
  ( (array!9746 (arr!4622 (Array (_ BitVec 32) (_ BitVec 64))) (size!4948 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9745)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6681)

(declare-fun getCurrentListMap!1034 (array!9745 array!9743 (_ BitVec 32) (_ BitVec 32) V!6681 V!6681 (_ BitVec 32) Int) ListLongMap!2955)

(assert (=> b!207749 (= lt!106421 (getCurrentListMap!1034 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106420 () ListLongMap!2955)

(declare-fun lt!106424 () array!9743)

(assert (=> b!207749 (= lt!106420 (getCurrentListMap!1034 _keys!825 lt!106424 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106418 () ListLongMap!2955)

(declare-fun lt!106422 () ListLongMap!2955)

(assert (=> b!207749 (and (= lt!106418 lt!106422) (= lt!106422 lt!106418))))

(declare-fun v!520 () V!6681)

(declare-fun lt!106419 () ListLongMap!2955)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!542 (ListLongMap!2955 tuple2!4052) ListLongMap!2955)

(assert (=> b!207749 (= lt!106422 (+!542 lt!106419 (tuple2!4053 k0!843 v!520)))))

(declare-datatypes ((Unit!6324 0))(
  ( (Unit!6325) )
))
(declare-fun lt!106423 () Unit!6324)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!193 (array!9745 array!9743 (_ BitVec 32) (_ BitVec 32) V!6681 V!6681 (_ BitVec 32) (_ BitVec 64) V!6681 (_ BitVec 32) Int) Unit!6324)

(assert (=> b!207749 (= lt!106423 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!193 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!444 (array!9745 array!9743 (_ BitVec 32) (_ BitVec 32) V!6681 V!6681 (_ BitVec 32) Int) ListLongMap!2955)

(assert (=> b!207749 (= lt!106418 (getCurrentListMapNoExtraKeys!444 _keys!825 lt!106424 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207749 (= lt!106424 (array!9744 (store (arr!4621 _values!649) i!601 (ValueCellFull!2294 v!520)) (size!4947 _values!649)))))

(assert (=> b!207749 (= lt!106419 (getCurrentListMapNoExtraKeys!444 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8981 () Bool)

(declare-fun mapRes!8981 () Bool)

(assert (=> mapIsEmpty!8981 mapRes!8981))

(declare-fun b!207750 () Bool)

(declare-fun res!100936 () Bool)

(assert (=> b!207750 (=> (not res!100936) (not e!135557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207750 (= res!100936 (validKeyInArray!0 k0!843))))

(declare-fun b!207751 () Bool)

(declare-fun e!135558 () Bool)

(declare-fun e!135555 () Bool)

(assert (=> b!207751 (= e!135558 (and e!135555 mapRes!8981))))

(declare-fun condMapEmpty!8981 () Bool)

(declare-fun mapDefault!8981 () ValueCell!2294)

(assert (=> b!207751 (= condMapEmpty!8981 (= (arr!4621 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2294)) mapDefault!8981)))))

(declare-fun b!207752 () Bool)

(declare-fun res!100937 () Bool)

(assert (=> b!207752 (=> (not res!100937) (not e!135557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9745 (_ BitVec 32)) Bool)

(assert (=> b!207752 (= res!100937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!100934 () Bool)

(assert (=> start!20764 (=> (not res!100934) (not e!135557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20764 (= res!100934 (validMask!0 mask!1149))))

(assert (=> start!20764 e!135557))

(declare-fun array_inv!3039 (array!9743) Bool)

(assert (=> start!20764 (and (array_inv!3039 _values!649) e!135558)))

(assert (=> start!20764 true))

(declare-fun tp_is_empty!5275 () Bool)

(assert (=> start!20764 tp_is_empty!5275))

(declare-fun array_inv!3040 (array!9745) Bool)

(assert (=> start!20764 (array_inv!3040 _keys!825)))

(assert (=> start!20764 tp!19289))

(declare-fun b!207753 () Bool)

(declare-fun e!135554 () Bool)

(assert (=> b!207753 (= e!135554 tp_is_empty!5275)))

(declare-fun b!207754 () Bool)

(declare-fun res!100933 () Bool)

(assert (=> b!207754 (=> (not res!100933) (not e!135557))))

(assert (=> b!207754 (= res!100933 (and (= (size!4947 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4948 _keys!825) (size!4947 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8981 () Bool)

(declare-fun tp!19288 () Bool)

(assert (=> mapNonEmpty!8981 (= mapRes!8981 (and tp!19288 e!135554))))

(declare-fun mapKey!8981 () (_ BitVec 32))

(declare-fun mapRest!8981 () (Array (_ BitVec 32) ValueCell!2294))

(declare-fun mapValue!8981 () ValueCell!2294)

(assert (=> mapNonEmpty!8981 (= (arr!4621 _values!649) (store mapRest!8981 mapKey!8981 mapValue!8981))))

(declare-fun b!207755 () Bool)

(declare-fun res!100935 () Bool)

(assert (=> b!207755 (=> (not res!100935) (not e!135557))))

(declare-datatypes ((List!2956 0))(
  ( (Nil!2953) (Cons!2952 (h!3594 (_ BitVec 64)) (t!7878 List!2956)) )
))
(declare-fun arrayNoDuplicates!0 (array!9745 (_ BitVec 32) List!2956) Bool)

(assert (=> b!207755 (= res!100935 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2953))))

(declare-fun b!207756 () Bool)

(declare-fun res!100932 () Bool)

(assert (=> b!207756 (=> (not res!100932) (not e!135557))))

(assert (=> b!207756 (= res!100932 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4948 _keys!825))))))

(declare-fun b!207757 () Bool)

(declare-fun res!100931 () Bool)

(assert (=> b!207757 (=> (not res!100931) (not e!135557))))

(assert (=> b!207757 (= res!100931 (= (select (arr!4622 _keys!825) i!601) k0!843))))

(declare-fun b!207758 () Bool)

(assert (=> b!207758 (= e!135555 tp_is_empty!5275)))

(assert (= (and start!20764 res!100934) b!207754))

(assert (= (and b!207754 res!100933) b!207752))

(assert (= (and b!207752 res!100937) b!207755))

(assert (= (and b!207755 res!100935) b!207756))

(assert (= (and b!207756 res!100932) b!207750))

(assert (= (and b!207750 res!100936) b!207757))

(assert (= (and b!207757 res!100931) b!207749))

(assert (= (and b!207751 condMapEmpty!8981) mapIsEmpty!8981))

(assert (= (and b!207751 (not condMapEmpty!8981)) mapNonEmpty!8981))

(get-info :version)

(assert (= (and mapNonEmpty!8981 ((_ is ValueCellFull!2294) mapValue!8981)) b!207753))

(assert (= (and b!207751 ((_ is ValueCellFull!2294) mapDefault!8981)) b!207758))

(assert (= start!20764 b!207751))

(declare-fun m!235023 () Bool)

(assert (=> start!20764 m!235023))

(declare-fun m!235025 () Bool)

(assert (=> start!20764 m!235025))

(declare-fun m!235027 () Bool)

(assert (=> start!20764 m!235027))

(declare-fun m!235029 () Bool)

(assert (=> b!207757 m!235029))

(declare-fun m!235031 () Bool)

(assert (=> mapNonEmpty!8981 m!235031))

(declare-fun m!235033 () Bool)

(assert (=> b!207749 m!235033))

(declare-fun m!235035 () Bool)

(assert (=> b!207749 m!235035))

(declare-fun m!235037 () Bool)

(assert (=> b!207749 m!235037))

(declare-fun m!235039 () Bool)

(assert (=> b!207749 m!235039))

(declare-fun m!235041 () Bool)

(assert (=> b!207749 m!235041))

(declare-fun m!235043 () Bool)

(assert (=> b!207749 m!235043))

(declare-fun m!235045 () Bool)

(assert (=> b!207749 m!235045))

(declare-fun m!235047 () Bool)

(assert (=> b!207752 m!235047))

(declare-fun m!235049 () Bool)

(assert (=> b!207750 m!235049))

(declare-fun m!235051 () Bool)

(assert (=> b!207755 m!235051))

(check-sat tp_is_empty!5275 (not b!207750) (not b!207752) (not b!207755) (not start!20764) b_and!12139 (not b_next!5419) (not b!207749) (not mapNonEmpty!8981))
(check-sat b_and!12139 (not b_next!5419))
