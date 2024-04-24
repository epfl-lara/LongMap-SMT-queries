; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96192 () Bool)

(assert start!96192)

(declare-fun b_free!22609 () Bool)

(declare-fun b_next!22609 () Bool)

(assert (=> start!96192 (= b_free!22609 (not b_next!22609))))

(declare-fun tp!79675 () Bool)

(declare-fun b_and!35903 () Bool)

(assert (=> start!96192 (= tp!79675 b_and!35903)))

(declare-fun b!1088456 () Bool)

(declare-fun e!621854 () Bool)

(declare-fun e!621850 () Bool)

(assert (=> b!1088456 (= e!621854 (not e!621850))))

(declare-fun res!725495 () Bool)

(assert (=> b!1088456 (=> res!725495 e!621850)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088456 (= res!725495 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40609 0))(
  ( (V!40610 (val!13362 Int)) )
))
(declare-fun minValue!831 () V!40609)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16964 0))(
  ( (tuple2!16965 (_1!8493 (_ BitVec 64)) (_2!8493 V!40609)) )
))
(declare-datatypes ((List!23559 0))(
  ( (Nil!23556) (Cons!23555 (h!24773 tuple2!16964) (t!33218 List!23559)) )
))
(declare-datatypes ((ListLongMap!14941 0))(
  ( (ListLongMap!14942 (toList!7486 List!23559)) )
))
(declare-fun lt!484165 () ListLongMap!14941)

(declare-fun zeroValue!831 () V!40609)

(declare-datatypes ((array!70187 0))(
  ( (array!70188 (arr!33761 (Array (_ BitVec 32) (_ BitVec 64))) (size!34298 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70187)

(declare-datatypes ((ValueCell!12596 0))(
  ( (ValueCellFull!12596 (v!15979 V!40609)) (EmptyCell!12596) )
))
(declare-datatypes ((array!70189 0))(
  ( (array!70190 (arr!33762 (Array (_ BitVec 32) ValueCell!12596)) (size!34299 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70189)

(declare-fun getCurrentListMap!4250 (array!70187 array!70189 (_ BitVec 32) (_ BitVec 32) V!40609 V!40609 (_ BitVec 32) Int) ListLongMap!14941)

(assert (=> b!1088456 (= lt!484165 (getCurrentListMap!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484170 () array!70189)

(declare-fun lt!484168 () ListLongMap!14941)

(declare-fun lt!484172 () array!70187)

(assert (=> b!1088456 (= lt!484168 (getCurrentListMap!4250 lt!484172 lt!484170 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484160 () ListLongMap!14941)

(declare-fun lt!484161 () ListLongMap!14941)

(assert (=> b!1088456 (and (= lt!484160 lt!484161) (= lt!484161 lt!484160))))

(declare-fun lt!484164 () ListLongMap!14941)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!798 (ListLongMap!14941 (_ BitVec 64)) ListLongMap!14941)

(assert (=> b!1088456 (= lt!484161 (-!798 lt!484164 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35763 0))(
  ( (Unit!35764) )
))
(declare-fun lt!484171 () Unit!35763)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!79 (array!70187 array!70189 (_ BitVec 32) (_ BitVec 32) V!40609 V!40609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35763)

(assert (=> b!1088456 (= lt!484171 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!79 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4055 (array!70187 array!70189 (_ BitVec 32) (_ BitVec 32) V!40609 V!40609 (_ BitVec 32) Int) ListLongMap!14941)

(assert (=> b!1088456 (= lt!484160 (getCurrentListMapNoExtraKeys!4055 lt!484172 lt!484170 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2176 (Int (_ BitVec 64)) V!40609)

(assert (=> b!1088456 (= lt!484170 (array!70190 (store (arr!33762 _values!874) i!650 (ValueCellFull!12596 (dynLambda!2176 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34299 _values!874)))))

(assert (=> b!1088456 (= lt!484164 (getCurrentListMapNoExtraKeys!4055 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088456 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484166 () Unit!35763)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70187 (_ BitVec 64) (_ BitVec 32)) Unit!35763)

(assert (=> b!1088456 (= lt!484166 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088457 () Bool)

(declare-fun res!725492 () Bool)

(declare-fun e!621857 () Bool)

(assert (=> b!1088457 (=> (not res!725492) (not e!621857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088457 (= res!725492 (validKeyInArray!0 k0!904))))

(declare-fun b!1088458 () Bool)

(declare-fun res!725490 () Bool)

(assert (=> b!1088458 (=> (not res!725490) (not e!621857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70187 (_ BitVec 32)) Bool)

(assert (=> b!1088458 (= res!725490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088460 () Bool)

(declare-fun e!621853 () Bool)

(assert (=> b!1088460 (= e!621850 e!621853)))

(declare-fun res!725496 () Bool)

(assert (=> b!1088460 (=> res!725496 e!621853)))

(assert (=> b!1088460 (= res!725496 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484163 () ListLongMap!14941)

(declare-fun lt!484169 () ListLongMap!14941)

(assert (=> b!1088460 (= lt!484163 lt!484169)))

(declare-fun lt!484159 () ListLongMap!14941)

(assert (=> b!1088460 (= lt!484163 (-!798 lt!484159 k0!904))))

(declare-fun lt!484158 () Unit!35763)

(declare-fun addRemoveCommutativeForDiffKeys!43 (ListLongMap!14941 (_ BitVec 64) V!40609 (_ BitVec 64)) Unit!35763)

(assert (=> b!1088460 (= lt!484158 (addRemoveCommutativeForDiffKeys!43 lt!484164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!484173 () tuple2!16964)

(declare-fun +!3309 (ListLongMap!14941 tuple2!16964) ListLongMap!14941)

(assert (=> b!1088460 (= lt!484168 (+!3309 lt!484169 lt!484173))))

(declare-fun lt!484167 () tuple2!16964)

(assert (=> b!1088460 (= lt!484169 (+!3309 lt!484161 lt!484167))))

(declare-fun lt!484162 () ListLongMap!14941)

(assert (=> b!1088460 (= lt!484165 lt!484162)))

(assert (=> b!1088460 (= lt!484162 (+!3309 lt!484159 lt!484173))))

(assert (=> b!1088460 (= lt!484159 (+!3309 lt!484164 lt!484167))))

(assert (=> b!1088460 (= lt!484168 (+!3309 (+!3309 lt!484160 lt!484167) lt!484173))))

(assert (=> b!1088460 (= lt!484173 (tuple2!16965 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1088460 (= lt!484167 (tuple2!16965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088461 () Bool)

(declare-fun res!725494 () Bool)

(assert (=> b!1088461 (=> (not res!725494) (not e!621854))))

(declare-datatypes ((List!23560 0))(
  ( (Nil!23557) (Cons!23556 (h!24774 (_ BitVec 64)) (t!33219 List!23560)) )
))
(declare-fun arrayNoDuplicates!0 (array!70187 (_ BitVec 32) List!23560) Bool)

(assert (=> b!1088461 (= res!725494 (arrayNoDuplicates!0 lt!484172 #b00000000000000000000000000000000 Nil!23557))))

(declare-fun b!1088462 () Bool)

(declare-fun e!621855 () Bool)

(declare-fun e!621851 () Bool)

(declare-fun mapRes!41671 () Bool)

(assert (=> b!1088462 (= e!621855 (and e!621851 mapRes!41671))))

(declare-fun condMapEmpty!41671 () Bool)

(declare-fun mapDefault!41671 () ValueCell!12596)

(assert (=> b!1088462 (= condMapEmpty!41671 (= (arr!33762 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12596)) mapDefault!41671)))))

(declare-fun b!1088463 () Bool)

(declare-fun e!621856 () Bool)

(declare-fun tp_is_empty!26611 () Bool)

(assert (=> b!1088463 (= e!621856 tp_is_empty!26611)))

(declare-fun b!1088464 () Bool)

(declare-fun res!725487 () Bool)

(assert (=> b!1088464 (=> (not res!725487) (not e!621857))))

(assert (=> b!1088464 (= res!725487 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34298 _keys!1070))))))

(declare-fun mapIsEmpty!41671 () Bool)

(assert (=> mapIsEmpty!41671 mapRes!41671))

(declare-fun b!1088465 () Bool)

(assert (=> b!1088465 (= e!621853 (bvsle #b00000000000000000000000000000000 (size!34298 _keys!1070)))))

(assert (=> b!1088465 (= (-!798 lt!484162 k0!904) (+!3309 lt!484163 lt!484173))))

(declare-fun lt!484157 () Unit!35763)

(assert (=> b!1088465 (= lt!484157 (addRemoveCommutativeForDiffKeys!43 lt!484159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1088459 () Bool)

(assert (=> b!1088459 (= e!621851 tp_is_empty!26611)))

(declare-fun res!725493 () Bool)

(assert (=> start!96192 (=> (not res!725493) (not e!621857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96192 (= res!725493 (validMask!0 mask!1414))))

(assert (=> start!96192 e!621857))

(assert (=> start!96192 tp!79675))

(assert (=> start!96192 true))

(assert (=> start!96192 tp_is_empty!26611))

(declare-fun array_inv!26096 (array!70187) Bool)

(assert (=> start!96192 (array_inv!26096 _keys!1070)))

(declare-fun array_inv!26097 (array!70189) Bool)

(assert (=> start!96192 (and (array_inv!26097 _values!874) e!621855)))

(declare-fun b!1088466 () Bool)

(declare-fun res!725491 () Bool)

(assert (=> b!1088466 (=> (not res!725491) (not e!621857))))

(assert (=> b!1088466 (= res!725491 (= (select (arr!33761 _keys!1070) i!650) k0!904))))

(declare-fun b!1088467 () Bool)

(assert (=> b!1088467 (= e!621857 e!621854)))

(declare-fun res!725486 () Bool)

(assert (=> b!1088467 (=> (not res!725486) (not e!621854))))

(assert (=> b!1088467 (= res!725486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484172 mask!1414))))

(assert (=> b!1088467 (= lt!484172 (array!70188 (store (arr!33761 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34298 _keys!1070)))))

(declare-fun b!1088468 () Bool)

(declare-fun res!725489 () Bool)

(assert (=> b!1088468 (=> (not res!725489) (not e!621857))))

(assert (=> b!1088468 (= res!725489 (and (= (size!34299 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34298 _keys!1070) (size!34299 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088469 () Bool)

(declare-fun res!725488 () Bool)

(assert (=> b!1088469 (=> (not res!725488) (not e!621857))))

(assert (=> b!1088469 (= res!725488 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23557))))

(declare-fun mapNonEmpty!41671 () Bool)

(declare-fun tp!79676 () Bool)

(assert (=> mapNonEmpty!41671 (= mapRes!41671 (and tp!79676 e!621856))))

(declare-fun mapRest!41671 () (Array (_ BitVec 32) ValueCell!12596))

(declare-fun mapValue!41671 () ValueCell!12596)

(declare-fun mapKey!41671 () (_ BitVec 32))

(assert (=> mapNonEmpty!41671 (= (arr!33762 _values!874) (store mapRest!41671 mapKey!41671 mapValue!41671))))

(assert (= (and start!96192 res!725493) b!1088468))

(assert (= (and b!1088468 res!725489) b!1088458))

(assert (= (and b!1088458 res!725490) b!1088469))

(assert (= (and b!1088469 res!725488) b!1088464))

(assert (= (and b!1088464 res!725487) b!1088457))

(assert (= (and b!1088457 res!725492) b!1088466))

(assert (= (and b!1088466 res!725491) b!1088467))

(assert (= (and b!1088467 res!725486) b!1088461))

(assert (= (and b!1088461 res!725494) b!1088456))

(assert (= (and b!1088456 (not res!725495)) b!1088460))

(assert (= (and b!1088460 (not res!725496)) b!1088465))

(assert (= (and b!1088462 condMapEmpty!41671) mapIsEmpty!41671))

(assert (= (and b!1088462 (not condMapEmpty!41671)) mapNonEmpty!41671))

(get-info :version)

(assert (= (and mapNonEmpty!41671 ((_ is ValueCellFull!12596) mapValue!41671)) b!1088463))

(assert (= (and b!1088462 ((_ is ValueCellFull!12596) mapDefault!41671)) b!1088459))

(assert (= start!96192 b!1088462))

(declare-fun b_lambda!17289 () Bool)

(assert (=> (not b_lambda!17289) (not b!1088456)))

(declare-fun t!33217 () Bool)

(declare-fun tb!7479 () Bool)

(assert (=> (and start!96192 (= defaultEntry!882 defaultEntry!882) t!33217) tb!7479))

(declare-fun result!15485 () Bool)

(assert (=> tb!7479 (= result!15485 tp_is_empty!26611)))

(assert (=> b!1088456 t!33217))

(declare-fun b_and!35905 () Bool)

(assert (= b_and!35903 (and (=> t!33217 result!15485) b_and!35905)))

(declare-fun m!1007615 () Bool)

(assert (=> b!1088457 m!1007615))

(declare-fun m!1007617 () Bool)

(assert (=> mapNonEmpty!41671 m!1007617))

(declare-fun m!1007619 () Bool)

(assert (=> b!1088467 m!1007619))

(declare-fun m!1007621 () Bool)

(assert (=> b!1088467 m!1007621))

(declare-fun m!1007623 () Bool)

(assert (=> start!96192 m!1007623))

(declare-fun m!1007625 () Bool)

(assert (=> start!96192 m!1007625))

(declare-fun m!1007627 () Bool)

(assert (=> start!96192 m!1007627))

(declare-fun m!1007629 () Bool)

(assert (=> b!1088458 m!1007629))

(declare-fun m!1007631 () Bool)

(assert (=> b!1088460 m!1007631))

(declare-fun m!1007633 () Bool)

(assert (=> b!1088460 m!1007633))

(declare-fun m!1007635 () Bool)

(assert (=> b!1088460 m!1007635))

(declare-fun m!1007637 () Bool)

(assert (=> b!1088460 m!1007637))

(assert (=> b!1088460 m!1007631))

(declare-fun m!1007639 () Bool)

(assert (=> b!1088460 m!1007639))

(declare-fun m!1007641 () Bool)

(assert (=> b!1088460 m!1007641))

(declare-fun m!1007643 () Bool)

(assert (=> b!1088460 m!1007643))

(declare-fun m!1007645 () Bool)

(assert (=> b!1088460 m!1007645))

(declare-fun m!1007647 () Bool)

(assert (=> b!1088466 m!1007647))

(declare-fun m!1007649 () Bool)

(assert (=> b!1088461 m!1007649))

(declare-fun m!1007651 () Bool)

(assert (=> b!1088456 m!1007651))

(declare-fun m!1007653 () Bool)

(assert (=> b!1088456 m!1007653))

(declare-fun m!1007655 () Bool)

(assert (=> b!1088456 m!1007655))

(declare-fun m!1007657 () Bool)

(assert (=> b!1088456 m!1007657))

(declare-fun m!1007659 () Bool)

(assert (=> b!1088456 m!1007659))

(declare-fun m!1007661 () Bool)

(assert (=> b!1088456 m!1007661))

(declare-fun m!1007663 () Bool)

(assert (=> b!1088456 m!1007663))

(declare-fun m!1007665 () Bool)

(assert (=> b!1088456 m!1007665))

(declare-fun m!1007667 () Bool)

(assert (=> b!1088456 m!1007667))

(declare-fun m!1007669 () Bool)

(assert (=> b!1088456 m!1007669))

(declare-fun m!1007671 () Bool)

(assert (=> b!1088469 m!1007671))

(declare-fun m!1007673 () Bool)

(assert (=> b!1088465 m!1007673))

(declare-fun m!1007675 () Bool)

(assert (=> b!1088465 m!1007675))

(declare-fun m!1007677 () Bool)

(assert (=> b!1088465 m!1007677))

(check-sat (not b_next!22609) (not start!96192) (not b!1088460) b_and!35905 (not b!1088458) (not b!1088469) (not b!1088457) (not b!1088461) tp_is_empty!26611 (not mapNonEmpty!41671) (not b!1088456) (not b_lambda!17289) (not b!1088467) (not b!1088465))
(check-sat b_and!35905 (not b_next!22609))
