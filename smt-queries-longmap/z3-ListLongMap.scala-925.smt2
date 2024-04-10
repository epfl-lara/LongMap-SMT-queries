; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20648 () Bool)

(assert start!20648)

(declare-fun b_free!5307 () Bool)

(declare-fun b_next!5307 () Bool)

(assert (=> start!20648 (= b_free!5307 (not b_next!5307))))

(declare-fun tp!18952 () Bool)

(declare-fun b_and!12053 () Bool)

(assert (=> start!20648 (= tp!18952 b_and!12053)))

(declare-fun b!206172 () Bool)

(declare-fun res!99807 () Bool)

(declare-fun e!134774 () Bool)

(assert (=> b!206172 (=> (not res!99807) (not e!134774))))

(declare-datatypes ((array!9537 0))(
  ( (array!9538 (arr!4519 (Array (_ BitVec 32) (_ BitVec 64))) (size!4844 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9537)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9537 (_ BitVec 32)) Bool)

(assert (=> b!206172 (= res!99807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206173 () Bool)

(declare-fun e!134775 () Bool)

(declare-fun tp_is_empty!5163 () Bool)

(assert (=> b!206173 (= e!134775 tp_is_empty!5163)))

(declare-fun b!206174 () Bool)

(declare-fun res!99809 () Bool)

(assert (=> b!206174 (=> (not res!99809) (not e!134774))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206174 (= res!99809 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4844 _keys!825))))))

(declare-fun b!206175 () Bool)

(declare-fun res!99810 () Bool)

(assert (=> b!206175 (=> (not res!99810) (not e!134774))))

(declare-datatypes ((List!2880 0))(
  ( (Nil!2877) (Cons!2876 (h!3518 (_ BitVec 64)) (t!7811 List!2880)) )
))
(declare-fun arrayNoDuplicates!0 (array!9537 (_ BitVec 32) List!2880) Bool)

(assert (=> b!206175 (= res!99810 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2877))))

(declare-fun res!99808 () Bool)

(assert (=> start!20648 (=> (not res!99808) (not e!134774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20648 (= res!99808 (validMask!0 mask!1149))))

(assert (=> start!20648 e!134774))

(declare-datatypes ((V!6531 0))(
  ( (V!6532 (val!2626 Int)) )
))
(declare-datatypes ((ValueCell!2238 0))(
  ( (ValueCellFull!2238 (v!4596 V!6531)) (EmptyCell!2238) )
))
(declare-datatypes ((array!9539 0))(
  ( (array!9540 (arr!4520 (Array (_ BitVec 32) ValueCell!2238)) (size!4845 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9539)

(declare-fun e!134776 () Bool)

(declare-fun array_inv!2987 (array!9539) Bool)

(assert (=> start!20648 (and (array_inv!2987 _values!649) e!134776)))

(assert (=> start!20648 true))

(assert (=> start!20648 tp_is_empty!5163))

(declare-fun array_inv!2988 (array!9537) Bool)

(assert (=> start!20648 (array_inv!2988 _keys!825)))

(assert (=> start!20648 tp!18952))

(declare-fun b!206176 () Bool)

(declare-fun res!99812 () Bool)

(assert (=> b!206176 (=> (not res!99812) (not e!134774))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206176 (= res!99812 (validKeyInArray!0 k0!843))))

(declare-fun b!206177 () Bool)

(declare-fun e!134773 () Bool)

(declare-fun mapRes!8813 () Bool)

(assert (=> b!206177 (= e!134776 (and e!134773 mapRes!8813))))

(declare-fun condMapEmpty!8813 () Bool)

(declare-fun mapDefault!8813 () ValueCell!2238)

(assert (=> b!206177 (= condMapEmpty!8813 (= (arr!4520 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2238)) mapDefault!8813)))))

(declare-fun b!206178 () Bool)

(declare-fun e!134771 () Bool)

(declare-fun e!134772 () Bool)

(assert (=> b!206178 (= e!134771 e!134772)))

(declare-fun res!99811 () Bool)

(assert (=> b!206178 (=> res!99811 e!134772)))

(assert (=> b!206178 (= res!99811 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3988 0))(
  ( (tuple2!3989 (_1!2005 (_ BitVec 64)) (_2!2005 V!6531)) )
))
(declare-datatypes ((List!2881 0))(
  ( (Nil!2878) (Cons!2877 (h!3519 tuple2!3988) (t!7812 List!2881)) )
))
(declare-datatypes ((ListLongMap!2901 0))(
  ( (ListLongMap!2902 (toList!1466 List!2881)) )
))
(declare-fun lt!105313 () ListLongMap!2901)

(declare-fun lt!105306 () ListLongMap!2901)

(assert (=> b!206178 (= lt!105313 lt!105306)))

(declare-fun lt!105315 () ListLongMap!2901)

(declare-fun lt!105314 () tuple2!3988)

(declare-fun +!493 (ListLongMap!2901 tuple2!3988) ListLongMap!2901)

(assert (=> b!206178 (= lt!105306 (+!493 lt!105315 lt!105314))))

(declare-fun lt!105311 () ListLongMap!2901)

(declare-fun lt!105309 () ListLongMap!2901)

(assert (=> b!206178 (= lt!105311 lt!105309)))

(declare-fun lt!105305 () ListLongMap!2901)

(assert (=> b!206178 (= lt!105309 (+!493 lt!105305 lt!105314))))

(declare-fun lt!105308 () ListLongMap!2901)

(assert (=> b!206178 (= lt!105311 (+!493 lt!105308 lt!105314))))

(declare-fun minValue!615 () V!6531)

(assert (=> b!206178 (= lt!105314 (tuple2!3989 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206179 () Bool)

(declare-fun res!99806 () Bool)

(assert (=> b!206179 (=> (not res!99806) (not e!134774))))

(assert (=> b!206179 (= res!99806 (= (select (arr!4519 _keys!825) i!601) k0!843))))

(declare-fun b!206180 () Bool)

(declare-fun res!99814 () Bool)

(assert (=> b!206180 (=> (not res!99814) (not e!134774))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206180 (= res!99814 (and (= (size!4845 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4844 _keys!825) (size!4845 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206181 () Bool)

(assert (=> b!206181 (= e!134774 (not e!134771))))

(declare-fun res!99813 () Bool)

(assert (=> b!206181 (=> res!99813 e!134771)))

(assert (=> b!206181 (= res!99813 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6531)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1034 (array!9537 array!9539 (_ BitVec 32) (_ BitVec 32) V!6531 V!6531 (_ BitVec 32) Int) ListLongMap!2901)

(assert (=> b!206181 (= lt!105313 (getCurrentListMap!1034 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105307 () array!9539)

(assert (=> b!206181 (= lt!105311 (getCurrentListMap!1034 _keys!825 lt!105307 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206181 (and (= lt!105308 lt!105305) (= lt!105305 lt!105308))))

(declare-fun lt!105310 () tuple2!3988)

(assert (=> b!206181 (= lt!105305 (+!493 lt!105315 lt!105310))))

(declare-fun v!520 () V!6531)

(assert (=> b!206181 (= lt!105310 (tuple2!3989 k0!843 v!520))))

(declare-datatypes ((Unit!6274 0))(
  ( (Unit!6275) )
))
(declare-fun lt!105304 () Unit!6274)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!147 (array!9537 array!9539 (_ BitVec 32) (_ BitVec 32) V!6531 V!6531 (_ BitVec 32) (_ BitVec 64) V!6531 (_ BitVec 32) Int) Unit!6274)

(assert (=> b!206181 (= lt!105304 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!147 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!408 (array!9537 array!9539 (_ BitVec 32) (_ BitVec 32) V!6531 V!6531 (_ BitVec 32) Int) ListLongMap!2901)

(assert (=> b!206181 (= lt!105308 (getCurrentListMapNoExtraKeys!408 _keys!825 lt!105307 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206181 (= lt!105307 (array!9540 (store (arr!4520 _values!649) i!601 (ValueCellFull!2238 v!520)) (size!4845 _values!649)))))

(assert (=> b!206181 (= lt!105315 (getCurrentListMapNoExtraKeys!408 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206182 () Bool)

(assert (=> b!206182 (= e!134773 tp_is_empty!5163)))

(declare-fun mapIsEmpty!8813 () Bool)

(assert (=> mapIsEmpty!8813 mapRes!8813))

(declare-fun b!206183 () Bool)

(assert (=> b!206183 (= e!134772 true)))

(assert (=> b!206183 (= lt!105309 (+!493 lt!105306 lt!105310))))

(declare-fun lt!105312 () Unit!6274)

(declare-fun addCommutativeForDiffKeys!191 (ListLongMap!2901 (_ BitVec 64) V!6531 (_ BitVec 64) V!6531) Unit!6274)

(assert (=> b!206183 (= lt!105312 (addCommutativeForDiffKeys!191 lt!105315 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8813 () Bool)

(declare-fun tp!18953 () Bool)

(assert (=> mapNonEmpty!8813 (= mapRes!8813 (and tp!18953 e!134775))))

(declare-fun mapRest!8813 () (Array (_ BitVec 32) ValueCell!2238))

(declare-fun mapKey!8813 () (_ BitVec 32))

(declare-fun mapValue!8813 () ValueCell!2238)

(assert (=> mapNonEmpty!8813 (= (arr!4520 _values!649) (store mapRest!8813 mapKey!8813 mapValue!8813))))

(assert (= (and start!20648 res!99808) b!206180))

(assert (= (and b!206180 res!99814) b!206172))

(assert (= (and b!206172 res!99807) b!206175))

(assert (= (and b!206175 res!99810) b!206174))

(assert (= (and b!206174 res!99809) b!206176))

(assert (= (and b!206176 res!99812) b!206179))

(assert (= (and b!206179 res!99806) b!206181))

(assert (= (and b!206181 (not res!99813)) b!206178))

(assert (= (and b!206178 (not res!99811)) b!206183))

(assert (= (and b!206177 condMapEmpty!8813) mapIsEmpty!8813))

(assert (= (and b!206177 (not condMapEmpty!8813)) mapNonEmpty!8813))

(get-info :version)

(assert (= (and mapNonEmpty!8813 ((_ is ValueCellFull!2238) mapValue!8813)) b!206173))

(assert (= (and b!206177 ((_ is ValueCellFull!2238) mapDefault!8813)) b!206182))

(assert (= start!20648 b!206177))

(declare-fun m!233879 () Bool)

(assert (=> b!206179 m!233879))

(declare-fun m!233881 () Bool)

(assert (=> b!206181 m!233881))

(declare-fun m!233883 () Bool)

(assert (=> b!206181 m!233883))

(declare-fun m!233885 () Bool)

(assert (=> b!206181 m!233885))

(declare-fun m!233887 () Bool)

(assert (=> b!206181 m!233887))

(declare-fun m!233889 () Bool)

(assert (=> b!206181 m!233889))

(declare-fun m!233891 () Bool)

(assert (=> b!206181 m!233891))

(declare-fun m!233893 () Bool)

(assert (=> b!206181 m!233893))

(declare-fun m!233895 () Bool)

(assert (=> b!206175 m!233895))

(declare-fun m!233897 () Bool)

(assert (=> b!206176 m!233897))

(declare-fun m!233899 () Bool)

(assert (=> mapNonEmpty!8813 m!233899))

(declare-fun m!233901 () Bool)

(assert (=> b!206172 m!233901))

(declare-fun m!233903 () Bool)

(assert (=> start!20648 m!233903))

(declare-fun m!233905 () Bool)

(assert (=> start!20648 m!233905))

(declare-fun m!233907 () Bool)

(assert (=> start!20648 m!233907))

(declare-fun m!233909 () Bool)

(assert (=> b!206178 m!233909))

(declare-fun m!233911 () Bool)

(assert (=> b!206178 m!233911))

(declare-fun m!233913 () Bool)

(assert (=> b!206178 m!233913))

(declare-fun m!233915 () Bool)

(assert (=> b!206183 m!233915))

(declare-fun m!233917 () Bool)

(assert (=> b!206183 m!233917))

(check-sat (not b!206176) (not b!206181) tp_is_empty!5163 (not mapNonEmpty!8813) b_and!12053 (not b_next!5307) (not b!206178) (not b!206175) (not b!206183) (not b!206172) (not start!20648))
(check-sat b_and!12053 (not b_next!5307))
