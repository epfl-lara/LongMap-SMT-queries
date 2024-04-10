; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20762 () Bool)

(assert start!20762)

(declare-fun b_free!5421 () Bool)

(declare-fun b_next!5421 () Bool)

(assert (=> start!20762 (= b_free!5421 (not b_next!5421))))

(declare-fun tp!19294 () Bool)

(declare-fun b_and!12167 () Bool)

(assert (=> start!20762 (= tp!19294 b_and!12167)))

(declare-fun b!207926 () Bool)

(declare-fun e!135671 () Bool)

(declare-fun tp_is_empty!5277 () Bool)

(assert (=> b!207926 (= e!135671 tp_is_empty!5277)))

(declare-fun b!207927 () Bool)

(declare-fun e!135670 () Bool)

(assert (=> b!207927 (= e!135670 tp_is_empty!5277)))

(declare-fun b!207928 () Bool)

(declare-fun res!101047 () Bool)

(declare-fun e!135673 () Bool)

(assert (=> b!207928 (=> (not res!101047) (not e!135673))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207928 (= res!101047 (validKeyInArray!0 k0!843))))

(declare-fun b!207930 () Bool)

(declare-fun res!101052 () Bool)

(assert (=> b!207930 (=> (not res!101052) (not e!135673))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9759 0))(
  ( (array!9760 (arr!4630 (Array (_ BitVec 32) (_ BitVec 64))) (size!4955 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9759)

(assert (=> b!207930 (= res!101052 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4955 _keys!825))))))

(declare-fun b!207931 () Bool)

(declare-fun res!101048 () Bool)

(assert (=> b!207931 (=> (not res!101048) (not e!135673))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9759 (_ BitVec 32)) Bool)

(assert (=> b!207931 (= res!101048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207932 () Bool)

(assert (=> b!207932 (= e!135673 (not true))))

(declare-datatypes ((V!6683 0))(
  ( (V!6684 (val!2683 Int)) )
))
(declare-datatypes ((tuple2!4072 0))(
  ( (tuple2!4073 (_1!2047 (_ BitVec 64)) (_2!2047 V!6683)) )
))
(declare-datatypes ((List!2964 0))(
  ( (Nil!2961) (Cons!2960 (h!3602 tuple2!4072) (t!7895 List!2964)) )
))
(declare-datatypes ((ListLongMap!2985 0))(
  ( (ListLongMap!2986 (toList!1508 List!2964)) )
))
(declare-fun lt!106623 () ListLongMap!2985)

(declare-datatypes ((ValueCell!2295 0))(
  ( (ValueCellFull!2295 (v!4653 V!6683)) (EmptyCell!2295) )
))
(declare-datatypes ((array!9761 0))(
  ( (array!9762 (arr!4631 (Array (_ BitVec 32) ValueCell!2295)) (size!4956 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9761)

(declare-fun zeroValue!615 () V!6683)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6683)

(declare-fun getCurrentListMap!1075 (array!9759 array!9761 (_ BitVec 32) (_ BitVec 32) V!6683 V!6683 (_ BitVec 32) Int) ListLongMap!2985)

(assert (=> b!207932 (= lt!106623 (getCurrentListMap!1075 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106624 () ListLongMap!2985)

(declare-fun lt!106626 () array!9761)

(assert (=> b!207932 (= lt!106624 (getCurrentListMap!1075 _keys!825 lt!106626 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106620 () ListLongMap!2985)

(declare-fun lt!106622 () ListLongMap!2985)

(assert (=> b!207932 (and (= lt!106620 lt!106622) (= lt!106622 lt!106620))))

(declare-fun lt!106625 () ListLongMap!2985)

(declare-fun v!520 () V!6683)

(declare-fun +!535 (ListLongMap!2985 tuple2!4072) ListLongMap!2985)

(assert (=> b!207932 (= lt!106622 (+!535 lt!106625 (tuple2!4073 k0!843 v!520)))))

(declare-datatypes ((Unit!6358 0))(
  ( (Unit!6359) )
))
(declare-fun lt!106621 () Unit!6358)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!188 (array!9759 array!9761 (_ BitVec 32) (_ BitVec 32) V!6683 V!6683 (_ BitVec 32) (_ BitVec 64) V!6683 (_ BitVec 32) Int) Unit!6358)

(assert (=> b!207932 (= lt!106621 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!188 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!449 (array!9759 array!9761 (_ BitVec 32) (_ BitVec 32) V!6683 V!6683 (_ BitVec 32) Int) ListLongMap!2985)

(assert (=> b!207932 (= lt!106620 (getCurrentListMapNoExtraKeys!449 _keys!825 lt!106626 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207932 (= lt!106626 (array!9762 (store (arr!4631 _values!649) i!601 (ValueCellFull!2295 v!520)) (size!4956 _values!649)))))

(assert (=> b!207932 (= lt!106625 (getCurrentListMapNoExtraKeys!449 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8984 () Bool)

(declare-fun mapRes!8984 () Bool)

(declare-fun tp!19295 () Bool)

(assert (=> mapNonEmpty!8984 (= mapRes!8984 (and tp!19295 e!135670))))

(declare-fun mapRest!8984 () (Array (_ BitVec 32) ValueCell!2295))

(declare-fun mapValue!8984 () ValueCell!2295)

(declare-fun mapKey!8984 () (_ BitVec 32))

(assert (=> mapNonEmpty!8984 (= (arr!4631 _values!649) (store mapRest!8984 mapKey!8984 mapValue!8984))))

(declare-fun b!207933 () Bool)

(declare-fun res!101049 () Bool)

(assert (=> b!207933 (=> (not res!101049) (not e!135673))))

(assert (=> b!207933 (= res!101049 (= (select (arr!4630 _keys!825) i!601) k0!843))))

(declare-fun b!207934 () Bool)

(declare-fun e!135672 () Bool)

(assert (=> b!207934 (= e!135672 (and e!135671 mapRes!8984))))

(declare-fun condMapEmpty!8984 () Bool)

(declare-fun mapDefault!8984 () ValueCell!2295)

(assert (=> b!207934 (= condMapEmpty!8984 (= (arr!4631 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2295)) mapDefault!8984)))))

(declare-fun b!207929 () Bool)

(declare-fun res!101050 () Bool)

(assert (=> b!207929 (=> (not res!101050) (not e!135673))))

(assert (=> b!207929 (= res!101050 (and (= (size!4956 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4955 _keys!825) (size!4956 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!101051 () Bool)

(assert (=> start!20762 (=> (not res!101051) (not e!135673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20762 (= res!101051 (validMask!0 mask!1149))))

(assert (=> start!20762 e!135673))

(declare-fun array_inv!3067 (array!9761) Bool)

(assert (=> start!20762 (and (array_inv!3067 _values!649) e!135672)))

(assert (=> start!20762 true))

(assert (=> start!20762 tp_is_empty!5277))

(declare-fun array_inv!3068 (array!9759) Bool)

(assert (=> start!20762 (array_inv!3068 _keys!825)))

(assert (=> start!20762 tp!19294))

(declare-fun b!207935 () Bool)

(declare-fun res!101053 () Bool)

(assert (=> b!207935 (=> (not res!101053) (not e!135673))))

(declare-datatypes ((List!2965 0))(
  ( (Nil!2962) (Cons!2961 (h!3603 (_ BitVec 64)) (t!7896 List!2965)) )
))
(declare-fun arrayNoDuplicates!0 (array!9759 (_ BitVec 32) List!2965) Bool)

(assert (=> b!207935 (= res!101053 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2962))))

(declare-fun mapIsEmpty!8984 () Bool)

(assert (=> mapIsEmpty!8984 mapRes!8984))

(assert (= (and start!20762 res!101051) b!207929))

(assert (= (and b!207929 res!101050) b!207931))

(assert (= (and b!207931 res!101048) b!207935))

(assert (= (and b!207935 res!101053) b!207930))

(assert (= (and b!207930 res!101052) b!207928))

(assert (= (and b!207928 res!101047) b!207933))

(assert (= (and b!207933 res!101049) b!207932))

(assert (= (and b!207934 condMapEmpty!8984) mapIsEmpty!8984))

(assert (= (and b!207934 (not condMapEmpty!8984)) mapNonEmpty!8984))

(get-info :version)

(assert (= (and mapNonEmpty!8984 ((_ is ValueCellFull!2295) mapValue!8984)) b!207927))

(assert (= (and b!207934 ((_ is ValueCellFull!2295) mapDefault!8984)) b!207926))

(assert (= start!20762 b!207934))

(declare-fun m!235669 () Bool)

(assert (=> b!207935 m!235669))

(declare-fun m!235671 () Bool)

(assert (=> b!207932 m!235671))

(declare-fun m!235673 () Bool)

(assert (=> b!207932 m!235673))

(declare-fun m!235675 () Bool)

(assert (=> b!207932 m!235675))

(declare-fun m!235677 () Bool)

(assert (=> b!207932 m!235677))

(declare-fun m!235679 () Bool)

(assert (=> b!207932 m!235679))

(declare-fun m!235681 () Bool)

(assert (=> b!207932 m!235681))

(declare-fun m!235683 () Bool)

(assert (=> b!207932 m!235683))

(declare-fun m!235685 () Bool)

(assert (=> b!207931 m!235685))

(declare-fun m!235687 () Bool)

(assert (=> mapNonEmpty!8984 m!235687))

(declare-fun m!235689 () Bool)

(assert (=> b!207933 m!235689))

(declare-fun m!235691 () Bool)

(assert (=> b!207928 m!235691))

(declare-fun m!235693 () Bool)

(assert (=> start!20762 m!235693))

(declare-fun m!235695 () Bool)

(assert (=> start!20762 m!235695))

(declare-fun m!235697 () Bool)

(assert (=> start!20762 m!235697))

(check-sat (not b!207935) (not b_next!5421) (not start!20762) (not b!207931) tp_is_empty!5277 (not b!207928) (not mapNonEmpty!8984) b_and!12167 (not b!207932))
(check-sat b_and!12167 (not b_next!5421))
