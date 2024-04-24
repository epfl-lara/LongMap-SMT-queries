; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96162 () Bool)

(assert start!96162)

(declare-fun b_free!22579 () Bool)

(declare-fun b_next!22579 () Bool)

(assert (=> start!96162 (= b_free!22579 (not b_next!22579))))

(declare-fun tp!79586 () Bool)

(declare-fun b_and!35843 () Bool)

(assert (=> start!96162 (= tp!79586 b_and!35843)))

(declare-fun b!1087796 () Bool)

(declare-fun res!724991 () Bool)

(declare-fun e!621497 () Bool)

(assert (=> b!1087796 (=> (not res!724991) (not e!621497))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70131 0))(
  ( (array!70132 (arr!33733 (Array (_ BitVec 32) (_ BitVec 64))) (size!34270 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70131)

(declare-datatypes ((V!40569 0))(
  ( (V!40570 (val!13347 Int)) )
))
(declare-datatypes ((ValueCell!12581 0))(
  ( (ValueCellFull!12581 (v!15964 V!40569)) (EmptyCell!12581) )
))
(declare-datatypes ((array!70133 0))(
  ( (array!70134 (arr!33734 (Array (_ BitVec 32) ValueCell!12581)) (size!34271 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70133)

(assert (=> b!1087796 (= res!724991 (and (= (size!34271 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34270 _keys!1070) (size!34271 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087797 () Bool)

(declare-fun res!724993 () Bool)

(assert (=> b!1087797 (=> (not res!724993) (not e!621497))))

(declare-datatypes ((List!23535 0))(
  ( (Nil!23532) (Cons!23531 (h!24749 (_ BitVec 64)) (t!33164 List!23535)) )
))
(declare-fun arrayNoDuplicates!0 (array!70131 (_ BitVec 32) List!23535) Bool)

(assert (=> b!1087797 (= res!724993 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23532))))

(declare-fun b!1087798 () Bool)

(declare-fun e!621491 () Bool)

(declare-fun tp_is_empty!26581 () Bool)

(assert (=> b!1087798 (= e!621491 tp_is_empty!26581)))

(declare-fun b!1087799 () Bool)

(declare-fun e!621492 () Bool)

(declare-fun e!621494 () Bool)

(assert (=> b!1087799 (= e!621492 (not e!621494))))

(declare-fun res!724995 () Bool)

(assert (=> b!1087799 (=> res!724995 e!621494)))

(assert (=> b!1087799 (= res!724995 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40569)

(declare-fun zeroValue!831 () V!40569)

(declare-datatypes ((tuple2!16938 0))(
  ( (tuple2!16939 (_1!8480 (_ BitVec 64)) (_2!8480 V!40569)) )
))
(declare-datatypes ((List!23536 0))(
  ( (Nil!23533) (Cons!23532 (h!24750 tuple2!16938) (t!33165 List!23536)) )
))
(declare-datatypes ((ListLongMap!14915 0))(
  ( (ListLongMap!14916 (toList!7473 List!23536)) )
))
(declare-fun lt!483404 () ListLongMap!14915)

(declare-fun getCurrentListMap!4240 (array!70131 array!70133 (_ BitVec 32) (_ BitVec 32) V!40569 V!40569 (_ BitVec 32) Int) ListLongMap!14915)

(assert (=> b!1087799 (= lt!483404 (getCurrentListMap!4240 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483408 () array!70131)

(declare-fun lt!483403 () ListLongMap!14915)

(declare-fun lt!483393 () array!70133)

(assert (=> b!1087799 (= lt!483403 (getCurrentListMap!4240 lt!483408 lt!483393 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483401 () ListLongMap!14915)

(declare-fun lt!483392 () ListLongMap!14915)

(assert (=> b!1087799 (and (= lt!483401 lt!483392) (= lt!483392 lt!483401))))

(declare-fun lt!483407 () ListLongMap!14915)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!785 (ListLongMap!14915 (_ BitVec 64)) ListLongMap!14915)

(assert (=> b!1087799 (= lt!483392 (-!785 lt!483407 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35737 0))(
  ( (Unit!35738) )
))
(declare-fun lt!483406 () Unit!35737)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!69 (array!70131 array!70133 (_ BitVec 32) (_ BitVec 32) V!40569 V!40569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35737)

(assert (=> b!1087799 (= lt!483406 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!69 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4045 (array!70131 array!70133 (_ BitVec 32) (_ BitVec 32) V!40569 V!40569 (_ BitVec 32) Int) ListLongMap!14915)

(assert (=> b!1087799 (= lt!483401 (getCurrentListMapNoExtraKeys!4045 lt!483408 lt!483393 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2166 (Int (_ BitVec 64)) V!40569)

(assert (=> b!1087799 (= lt!483393 (array!70134 (store (arr!33734 _values!874) i!650 (ValueCellFull!12581 (dynLambda!2166 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34271 _values!874)))))

(assert (=> b!1087799 (= lt!483407 (getCurrentListMapNoExtraKeys!4045 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087799 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483395 () Unit!35737)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70131 (_ BitVec 64) (_ BitVec 32)) Unit!35737)

(assert (=> b!1087799 (= lt!483395 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087800 () Bool)

(declare-fun e!621493 () Bool)

(assert (=> b!1087800 (= e!621494 e!621493)))

(declare-fun res!725001 () Bool)

(assert (=> b!1087800 (=> res!725001 e!621493)))

(assert (=> b!1087800 (= res!725001 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483402 () ListLongMap!14915)

(declare-fun lt!483405 () ListLongMap!14915)

(assert (=> b!1087800 (= lt!483402 lt!483405)))

(declare-fun lt!483399 () ListLongMap!14915)

(assert (=> b!1087800 (= lt!483402 (-!785 lt!483399 k0!904))))

(declare-fun lt!483398 () Unit!35737)

(declare-fun addRemoveCommutativeForDiffKeys!31 (ListLongMap!14915 (_ BitVec 64) V!40569 (_ BitVec 64)) Unit!35737)

(assert (=> b!1087800 (= lt!483398 (addRemoveCommutativeForDiffKeys!31 lt!483407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483396 () tuple2!16938)

(declare-fun +!3297 (ListLongMap!14915 tuple2!16938) ListLongMap!14915)

(assert (=> b!1087800 (= lt!483403 (+!3297 lt!483405 lt!483396))))

(declare-fun lt!483397 () tuple2!16938)

(assert (=> b!1087800 (= lt!483405 (+!3297 lt!483392 lt!483397))))

(declare-fun lt!483394 () ListLongMap!14915)

(assert (=> b!1087800 (= lt!483404 lt!483394)))

(assert (=> b!1087800 (= lt!483394 (+!3297 lt!483399 lt!483396))))

(assert (=> b!1087800 (= lt!483399 (+!3297 lt!483407 lt!483397))))

(assert (=> b!1087800 (= lt!483403 (+!3297 (+!3297 lt!483401 lt!483397) lt!483396))))

(assert (=> b!1087800 (= lt!483396 (tuple2!16939 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087800 (= lt!483397 (tuple2!16939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087801 () Bool)

(assert (=> b!1087801 (= e!621497 e!621492)))

(declare-fun res!724994 () Bool)

(assert (=> b!1087801 (=> (not res!724994) (not e!621492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70131 (_ BitVec 32)) Bool)

(assert (=> b!1087801 (= res!724994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483408 mask!1414))))

(assert (=> b!1087801 (= lt!483408 (array!70132 (store (arr!33733 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34270 _keys!1070)))))

(declare-fun mapNonEmpty!41626 () Bool)

(declare-fun mapRes!41626 () Bool)

(declare-fun tp!79585 () Bool)

(assert (=> mapNonEmpty!41626 (= mapRes!41626 (and tp!79585 e!621491))))

(declare-fun mapKey!41626 () (_ BitVec 32))

(declare-fun mapValue!41626 () ValueCell!12581)

(declare-fun mapRest!41626 () (Array (_ BitVec 32) ValueCell!12581))

(assert (=> mapNonEmpty!41626 (= (arr!33734 _values!874) (store mapRest!41626 mapKey!41626 mapValue!41626))))

(declare-fun b!1087802 () Bool)

(declare-fun res!724996 () Bool)

(assert (=> b!1087802 (=> (not res!724996) (not e!621497))))

(assert (=> b!1087802 (= res!724996 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34270 _keys!1070))))))

(declare-fun b!1087803 () Bool)

(declare-fun res!724997 () Bool)

(assert (=> b!1087803 (=> (not res!724997) (not e!621497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087803 (= res!724997 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41626 () Bool)

(assert (=> mapIsEmpty!41626 mapRes!41626))

(declare-fun res!724999 () Bool)

(assert (=> start!96162 (=> (not res!724999) (not e!621497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96162 (= res!724999 (validMask!0 mask!1414))))

(assert (=> start!96162 e!621497))

(assert (=> start!96162 tp!79586))

(assert (=> start!96162 true))

(assert (=> start!96162 tp_is_empty!26581))

(declare-fun array_inv!26072 (array!70131) Bool)

(assert (=> start!96162 (array_inv!26072 _keys!1070)))

(declare-fun e!621496 () Bool)

(declare-fun array_inv!26073 (array!70133) Bool)

(assert (=> start!96162 (and (array_inv!26073 _values!874) e!621496)))

(declare-fun b!1087804 () Bool)

(assert (=> b!1087804 (= e!621493 true)))

(assert (=> b!1087804 (= (-!785 lt!483394 k0!904) (+!3297 lt!483402 lt!483396))))

(declare-fun lt!483400 () Unit!35737)

(assert (=> b!1087804 (= lt!483400 (addRemoveCommutativeForDiffKeys!31 lt!483399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1087805 () Bool)

(declare-fun res!724992 () Bool)

(assert (=> b!1087805 (=> (not res!724992) (not e!621497))))

(assert (=> b!1087805 (= res!724992 (= (select (arr!33733 _keys!1070) i!650) k0!904))))

(declare-fun b!1087806 () Bool)

(declare-fun res!725000 () Bool)

(assert (=> b!1087806 (=> (not res!725000) (not e!621497))))

(assert (=> b!1087806 (= res!725000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087807 () Bool)

(declare-fun e!621495 () Bool)

(assert (=> b!1087807 (= e!621495 tp_is_empty!26581)))

(declare-fun b!1087808 () Bool)

(declare-fun res!724998 () Bool)

(assert (=> b!1087808 (=> (not res!724998) (not e!621492))))

(assert (=> b!1087808 (= res!724998 (arrayNoDuplicates!0 lt!483408 #b00000000000000000000000000000000 Nil!23532))))

(declare-fun b!1087809 () Bool)

(assert (=> b!1087809 (= e!621496 (and e!621495 mapRes!41626))))

(declare-fun condMapEmpty!41626 () Bool)

(declare-fun mapDefault!41626 () ValueCell!12581)

(assert (=> b!1087809 (= condMapEmpty!41626 (= (arr!33734 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12581)) mapDefault!41626)))))

(assert (= (and start!96162 res!724999) b!1087796))

(assert (= (and b!1087796 res!724991) b!1087806))

(assert (= (and b!1087806 res!725000) b!1087797))

(assert (= (and b!1087797 res!724993) b!1087802))

(assert (= (and b!1087802 res!724996) b!1087803))

(assert (= (and b!1087803 res!724997) b!1087805))

(assert (= (and b!1087805 res!724992) b!1087801))

(assert (= (and b!1087801 res!724994) b!1087808))

(assert (= (and b!1087808 res!724998) b!1087799))

(assert (= (and b!1087799 (not res!724995)) b!1087800))

(assert (= (and b!1087800 (not res!725001)) b!1087804))

(assert (= (and b!1087809 condMapEmpty!41626) mapIsEmpty!41626))

(assert (= (and b!1087809 (not condMapEmpty!41626)) mapNonEmpty!41626))

(get-info :version)

(assert (= (and mapNonEmpty!41626 ((_ is ValueCellFull!12581) mapValue!41626)) b!1087798))

(assert (= (and b!1087809 ((_ is ValueCellFull!12581) mapDefault!41626)) b!1087807))

(assert (= start!96162 b!1087809))

(declare-fun b_lambda!17259 () Bool)

(assert (=> (not b_lambda!17259) (not b!1087799)))

(declare-fun t!33163 () Bool)

(declare-fun tb!7449 () Bool)

(assert (=> (and start!96162 (= defaultEntry!882 defaultEntry!882) t!33163) tb!7449))

(declare-fun result!15425 () Bool)

(assert (=> tb!7449 (= result!15425 tp_is_empty!26581)))

(assert (=> b!1087799 t!33163))

(declare-fun b_and!35845 () Bool)

(assert (= b_and!35843 (and (=> t!33163 result!15425) b_and!35845)))

(declare-fun m!1006655 () Bool)

(assert (=> b!1087804 m!1006655))

(declare-fun m!1006657 () Bool)

(assert (=> b!1087804 m!1006657))

(declare-fun m!1006659 () Bool)

(assert (=> b!1087804 m!1006659))

(declare-fun m!1006661 () Bool)

(assert (=> mapNonEmpty!41626 m!1006661))

(declare-fun m!1006663 () Bool)

(assert (=> start!96162 m!1006663))

(declare-fun m!1006665 () Bool)

(assert (=> start!96162 m!1006665))

(declare-fun m!1006667 () Bool)

(assert (=> start!96162 m!1006667))

(declare-fun m!1006669 () Bool)

(assert (=> b!1087806 m!1006669))

(declare-fun m!1006671 () Bool)

(assert (=> b!1087800 m!1006671))

(declare-fun m!1006673 () Bool)

(assert (=> b!1087800 m!1006673))

(declare-fun m!1006675 () Bool)

(assert (=> b!1087800 m!1006675))

(declare-fun m!1006677 () Bool)

(assert (=> b!1087800 m!1006677))

(assert (=> b!1087800 m!1006671))

(declare-fun m!1006679 () Bool)

(assert (=> b!1087800 m!1006679))

(declare-fun m!1006681 () Bool)

(assert (=> b!1087800 m!1006681))

(declare-fun m!1006683 () Bool)

(assert (=> b!1087800 m!1006683))

(declare-fun m!1006685 () Bool)

(assert (=> b!1087800 m!1006685))

(declare-fun m!1006687 () Bool)

(assert (=> b!1087797 m!1006687))

(declare-fun m!1006689 () Bool)

(assert (=> b!1087805 m!1006689))

(declare-fun m!1006691 () Bool)

(assert (=> b!1087803 m!1006691))

(declare-fun m!1006693 () Bool)

(assert (=> b!1087799 m!1006693))

(declare-fun m!1006695 () Bool)

(assert (=> b!1087799 m!1006695))

(declare-fun m!1006697 () Bool)

(assert (=> b!1087799 m!1006697))

(declare-fun m!1006699 () Bool)

(assert (=> b!1087799 m!1006699))

(declare-fun m!1006701 () Bool)

(assert (=> b!1087799 m!1006701))

(declare-fun m!1006703 () Bool)

(assert (=> b!1087799 m!1006703))

(declare-fun m!1006705 () Bool)

(assert (=> b!1087799 m!1006705))

(declare-fun m!1006707 () Bool)

(assert (=> b!1087799 m!1006707))

(declare-fun m!1006709 () Bool)

(assert (=> b!1087799 m!1006709))

(declare-fun m!1006711 () Bool)

(assert (=> b!1087799 m!1006711))

(declare-fun m!1006713 () Bool)

(assert (=> b!1087801 m!1006713))

(declare-fun m!1006715 () Bool)

(assert (=> b!1087801 m!1006715))

(declare-fun m!1006717 () Bool)

(assert (=> b!1087808 m!1006717))

(check-sat (not start!96162) (not b!1087801) (not b!1087803) (not b_next!22579) (not b!1087799) (not b!1087797) (not b!1087808) (not b_lambda!17259) tp_is_empty!26581 (not mapNonEmpty!41626) b_and!35845 (not b!1087804) (not b!1087806) (not b!1087800))
(check-sat b_and!35845 (not b_next!22579))
