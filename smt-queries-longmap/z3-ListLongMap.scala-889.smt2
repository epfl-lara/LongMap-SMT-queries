; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20434 () Bool)

(assert start!20434)

(declare-fun b_free!5089 () Bool)

(declare-fun b_next!5089 () Bool)

(assert (=> start!20434 (= b_free!5089 (not b_next!5089))))

(declare-fun tp!18298 () Bool)

(declare-fun b_and!11809 () Bool)

(assert (=> start!20434 (= tp!18298 b_and!11809)))

(declare-fun b!202083 () Bool)

(declare-fun res!96754 () Bool)

(declare-fun e!132385 () Bool)

(assert (=> b!202083 (=> (not res!96754) (not e!132385))))

(declare-datatypes ((array!9103 0))(
  ( (array!9104 (arr!4301 (Array (_ BitVec 32) (_ BitVec 64))) (size!4627 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9103)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202083 (= res!96754 (= (select (arr!4301 _keys!825) i!601) k0!843))))

(declare-fun b!202084 () Bool)

(declare-fun e!132384 () Bool)

(declare-fun tp_is_empty!4945 () Bool)

(assert (=> b!202084 (= e!132384 tp_is_empty!4945)))

(declare-fun b!202085 () Bool)

(declare-fun res!96752 () Bool)

(assert (=> b!202085 (=> (not res!96752) (not e!132385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202085 (= res!96752 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8486 () Bool)

(declare-fun mapRes!8486 () Bool)

(declare-fun tp!18299 () Bool)

(assert (=> mapNonEmpty!8486 (= mapRes!8486 (and tp!18299 e!132384))))

(declare-datatypes ((V!6241 0))(
  ( (V!6242 (val!2517 Int)) )
))
(declare-datatypes ((ValueCell!2129 0))(
  ( (ValueCellFull!2129 (v!4481 V!6241)) (EmptyCell!2129) )
))
(declare-fun mapValue!8486 () ValueCell!2129)

(declare-datatypes ((array!9105 0))(
  ( (array!9106 (arr!4302 (Array (_ BitVec 32) ValueCell!2129)) (size!4628 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9105)

(declare-fun mapKey!8486 () (_ BitVec 32))

(declare-fun mapRest!8486 () (Array (_ BitVec 32) ValueCell!2129))

(assert (=> mapNonEmpty!8486 (= (arr!4302 _values!649) (store mapRest!8486 mapKey!8486 mapValue!8486))))

(declare-fun b!202087 () Bool)

(declare-fun e!132386 () Bool)

(assert (=> b!202087 (= e!132386 (bvsle #b00000000000000000000000000000000 (size!4627 _keys!825)))))

(declare-datatypes ((tuple2!3790 0))(
  ( (tuple2!3791 (_1!1906 (_ BitVec 64)) (_2!1906 V!6241)) )
))
(declare-datatypes ((List!2706 0))(
  ( (Nil!2703) (Cons!2702 (h!3344 tuple2!3790) (t!7628 List!2706)) )
))
(declare-datatypes ((ListLongMap!2693 0))(
  ( (ListLongMap!2694 (toList!1362 List!2706)) )
))
(declare-fun lt!101245 () ListLongMap!2693)

(declare-fun lt!101254 () tuple2!3790)

(declare-fun lt!101255 () ListLongMap!2693)

(declare-fun lt!101252 () tuple2!3790)

(declare-fun +!411 (ListLongMap!2693 tuple2!3790) ListLongMap!2693)

(assert (=> b!202087 (= (+!411 lt!101255 lt!101252) (+!411 lt!101245 lt!101254))))

(declare-datatypes ((Unit!6074 0))(
  ( (Unit!6075) )
))
(declare-fun lt!101251 () Unit!6074)

(declare-fun minValue!615 () V!6241)

(declare-fun v!520 () V!6241)

(declare-fun lt!101249 () ListLongMap!2693)

(declare-fun addCommutativeForDiffKeys!120 (ListLongMap!2693 (_ BitVec 64) V!6241 (_ BitVec 64) V!6241) Unit!6074)

(assert (=> b!202087 (= lt!101251 (addCommutativeForDiffKeys!120 lt!101249 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!202088 () Bool)

(declare-fun res!96753 () Bool)

(assert (=> b!202088 (=> (not res!96753) (not e!132385))))

(assert (=> b!202088 (= res!96753 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4627 _keys!825))))))

(declare-fun b!202089 () Bool)

(declare-fun e!132387 () Bool)

(assert (=> b!202089 (= e!132387 tp_is_empty!4945)))

(declare-fun b!202090 () Bool)

(declare-fun e!132381 () Bool)

(assert (=> b!202090 (= e!132381 (and e!132387 mapRes!8486))))

(declare-fun condMapEmpty!8486 () Bool)

(declare-fun mapDefault!8486 () ValueCell!2129)

(assert (=> b!202090 (= condMapEmpty!8486 (= (arr!4302 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2129)) mapDefault!8486)))))

(declare-fun b!202091 () Bool)

(declare-fun res!96757 () Bool)

(assert (=> b!202091 (=> (not res!96757) (not e!132385))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9103 (_ BitVec 32)) Bool)

(assert (=> b!202091 (= res!96757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202086 () Bool)

(declare-fun res!96751 () Bool)

(assert (=> b!202086 (=> (not res!96751) (not e!132385))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202086 (= res!96751 (and (= (size!4628 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4627 _keys!825) (size!4628 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!96758 () Bool)

(assert (=> start!20434 (=> (not res!96758) (not e!132385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20434 (= res!96758 (validMask!0 mask!1149))))

(assert (=> start!20434 e!132385))

(declare-fun array_inv!2821 (array!9105) Bool)

(assert (=> start!20434 (and (array_inv!2821 _values!649) e!132381)))

(assert (=> start!20434 true))

(assert (=> start!20434 tp_is_empty!4945))

(declare-fun array_inv!2822 (array!9103) Bool)

(assert (=> start!20434 (array_inv!2822 _keys!825)))

(assert (=> start!20434 tp!18298))

(declare-fun b!202092 () Bool)

(declare-fun e!132382 () Bool)

(assert (=> b!202092 (= e!132382 e!132386)))

(declare-fun res!96756 () Bool)

(assert (=> b!202092 (=> res!96756 e!132386)))

(assert (=> b!202092 (= res!96756 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101250 () ListLongMap!2693)

(assert (=> b!202092 (= lt!101250 lt!101255)))

(assert (=> b!202092 (= lt!101255 (+!411 lt!101249 lt!101254))))

(declare-fun lt!101253 () ListLongMap!2693)

(declare-fun lt!101244 () Unit!6074)

(declare-fun zeroValue!615 () V!6241)

(assert (=> b!202092 (= lt!101244 (addCommutativeForDiffKeys!120 lt!101253 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!101243 () ListLongMap!2693)

(assert (=> b!202092 (= lt!101243 (+!411 lt!101250 lt!101252))))

(declare-fun lt!101256 () ListLongMap!2693)

(declare-fun lt!101246 () tuple2!3790)

(assert (=> b!202092 (= lt!101250 (+!411 lt!101256 lt!101246))))

(declare-fun lt!101247 () ListLongMap!2693)

(assert (=> b!202092 (= lt!101247 lt!101245)))

(assert (=> b!202092 (= lt!101245 (+!411 lt!101249 lt!101252))))

(assert (=> b!202092 (= lt!101249 (+!411 lt!101253 lt!101246))))

(declare-fun lt!101248 () ListLongMap!2693)

(assert (=> b!202092 (= lt!101243 (+!411 (+!411 lt!101248 lt!101246) lt!101252))))

(assert (=> b!202092 (= lt!101252 (tuple2!3791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202092 (= lt!101246 (tuple2!3791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202093 () Bool)

(assert (=> b!202093 (= e!132385 (not e!132382))))

(declare-fun res!96755 () Bool)

(assert (=> b!202093 (=> res!96755 e!132382)))

(assert (=> b!202093 (= res!96755 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!918 (array!9103 array!9105 (_ BitVec 32) (_ BitVec 32) V!6241 V!6241 (_ BitVec 32) Int) ListLongMap!2693)

(assert (=> b!202093 (= lt!101247 (getCurrentListMap!918 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101257 () array!9105)

(assert (=> b!202093 (= lt!101243 (getCurrentListMap!918 _keys!825 lt!101257 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202093 (and (= lt!101248 lt!101256) (= lt!101256 lt!101248))))

(assert (=> b!202093 (= lt!101256 (+!411 lt!101253 lt!101254))))

(assert (=> b!202093 (= lt!101254 (tuple2!3791 k0!843 v!520))))

(declare-fun lt!101258 () Unit!6074)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!77 (array!9103 array!9105 (_ BitVec 32) (_ BitVec 32) V!6241 V!6241 (_ BitVec 32) (_ BitVec 64) V!6241 (_ BitVec 32) Int) Unit!6074)

(assert (=> b!202093 (= lt!101258 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!77 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!328 (array!9103 array!9105 (_ BitVec 32) (_ BitVec 32) V!6241 V!6241 (_ BitVec 32) Int) ListLongMap!2693)

(assert (=> b!202093 (= lt!101248 (getCurrentListMapNoExtraKeys!328 _keys!825 lt!101257 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202093 (= lt!101257 (array!9106 (store (arr!4302 _values!649) i!601 (ValueCellFull!2129 v!520)) (size!4628 _values!649)))))

(assert (=> b!202093 (= lt!101253 (getCurrentListMapNoExtraKeys!328 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202094 () Bool)

(declare-fun res!96750 () Bool)

(assert (=> b!202094 (=> (not res!96750) (not e!132385))))

(declare-datatypes ((List!2707 0))(
  ( (Nil!2704) (Cons!2703 (h!3345 (_ BitVec 64)) (t!7629 List!2707)) )
))
(declare-fun arrayNoDuplicates!0 (array!9103 (_ BitVec 32) List!2707) Bool)

(assert (=> b!202094 (= res!96750 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2704))))

(declare-fun mapIsEmpty!8486 () Bool)

(assert (=> mapIsEmpty!8486 mapRes!8486))

(assert (= (and start!20434 res!96758) b!202086))

(assert (= (and b!202086 res!96751) b!202091))

(assert (= (and b!202091 res!96757) b!202094))

(assert (= (and b!202094 res!96750) b!202088))

(assert (= (and b!202088 res!96753) b!202085))

(assert (= (and b!202085 res!96752) b!202083))

(assert (= (and b!202083 res!96754) b!202093))

(assert (= (and b!202093 (not res!96755)) b!202092))

(assert (= (and b!202092 (not res!96756)) b!202087))

(assert (= (and b!202090 condMapEmpty!8486) mapIsEmpty!8486))

(assert (= (and b!202090 (not condMapEmpty!8486)) mapNonEmpty!8486))

(get-info :version)

(assert (= (and mapNonEmpty!8486 ((_ is ValueCellFull!2129) mapValue!8486)) b!202084))

(assert (= (and b!202090 ((_ is ValueCellFull!2129) mapDefault!8486)) b!202089))

(assert (= start!20434 b!202090))

(declare-fun m!228891 () Bool)

(assert (=> b!202091 m!228891))

(declare-fun m!228893 () Bool)

(assert (=> b!202085 m!228893))

(declare-fun m!228895 () Bool)

(assert (=> mapNonEmpty!8486 m!228895))

(declare-fun m!228897 () Bool)

(assert (=> start!20434 m!228897))

(declare-fun m!228899 () Bool)

(assert (=> start!20434 m!228899))

(declare-fun m!228901 () Bool)

(assert (=> start!20434 m!228901))

(declare-fun m!228903 () Bool)

(assert (=> b!202083 m!228903))

(declare-fun m!228905 () Bool)

(assert (=> b!202092 m!228905))

(declare-fun m!228907 () Bool)

(assert (=> b!202092 m!228907))

(declare-fun m!228909 () Bool)

(assert (=> b!202092 m!228909))

(declare-fun m!228911 () Bool)

(assert (=> b!202092 m!228911))

(declare-fun m!228913 () Bool)

(assert (=> b!202092 m!228913))

(declare-fun m!228915 () Bool)

(assert (=> b!202092 m!228915))

(declare-fun m!228917 () Bool)

(assert (=> b!202092 m!228917))

(assert (=> b!202092 m!228907))

(declare-fun m!228919 () Bool)

(assert (=> b!202092 m!228919))

(declare-fun m!228921 () Bool)

(assert (=> b!202094 m!228921))

(declare-fun m!228923 () Bool)

(assert (=> b!202093 m!228923))

(declare-fun m!228925 () Bool)

(assert (=> b!202093 m!228925))

(declare-fun m!228927 () Bool)

(assert (=> b!202093 m!228927))

(declare-fun m!228929 () Bool)

(assert (=> b!202093 m!228929))

(declare-fun m!228931 () Bool)

(assert (=> b!202093 m!228931))

(declare-fun m!228933 () Bool)

(assert (=> b!202093 m!228933))

(declare-fun m!228935 () Bool)

(assert (=> b!202093 m!228935))

(declare-fun m!228937 () Bool)

(assert (=> b!202087 m!228937))

(declare-fun m!228939 () Bool)

(assert (=> b!202087 m!228939))

(declare-fun m!228941 () Bool)

(assert (=> b!202087 m!228941))

(check-sat (not start!20434) (not b_next!5089) b_and!11809 tp_is_empty!4945 (not b!202087) (not b!202092) (not b!202093) (not b!202091) (not b!202085) (not mapNonEmpty!8486) (not b!202094))
(check-sat b_and!11809 (not b_next!5089))
