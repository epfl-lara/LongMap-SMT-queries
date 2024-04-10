; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95940 () Bool)

(assert start!95940)

(declare-fun b_free!22593 () Bool)

(declare-fun b_next!22593 () Bool)

(assert (=> start!95940 (= b_free!22593 (not b_next!22593))))

(declare-fun tp!79627 () Bool)

(declare-fun b_and!35861 () Bool)

(assert (=> start!95940 (= tp!79627 b_and!35861)))

(declare-fun b!1086777 () Bool)

(declare-fun res!724707 () Bool)

(declare-fun e!620804 () Bool)

(assert (=> b!1086777 (=> (not res!724707) (not e!620804))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70121 0))(
  ( (array!70122 (arr!33734 (Array (_ BitVec 32) (_ BitVec 64))) (size!34270 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70121)

(assert (=> b!1086777 (= res!724707 (= (select (arr!33734 _keys!1070) i!650) k0!904))))

(declare-fun b!1086778 () Bool)

(declare-fun e!620808 () Bool)

(declare-fun e!620803 () Bool)

(declare-fun mapRes!41647 () Bool)

(assert (=> b!1086778 (= e!620808 (and e!620803 mapRes!41647))))

(declare-fun condMapEmpty!41647 () Bool)

(declare-datatypes ((V!40587 0))(
  ( (V!40588 (val!13354 Int)) )
))
(declare-datatypes ((ValueCell!12588 0))(
  ( (ValueCellFull!12588 (v!15975 V!40587)) (EmptyCell!12588) )
))
(declare-datatypes ((array!70123 0))(
  ( (array!70124 (arr!33735 (Array (_ BitVec 32) ValueCell!12588)) (size!34271 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70123)

(declare-fun mapDefault!41647 () ValueCell!12588)

(assert (=> b!1086778 (= condMapEmpty!41647 (= (arr!33735 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12588)) mapDefault!41647)))))

(declare-fun b!1086779 () Bool)

(declare-fun e!620810 () Bool)

(declare-fun e!620805 () Bool)

(assert (=> b!1086779 (= e!620810 (not e!620805))))

(declare-fun res!724706 () Bool)

(assert (=> b!1086779 (=> res!724706 e!620805)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086779 (= res!724706 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40587)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16942 0))(
  ( (tuple2!16943 (_1!8482 (_ BitVec 64)) (_2!8482 V!40587)) )
))
(declare-datatypes ((List!23531 0))(
  ( (Nil!23528) (Cons!23527 (h!24736 tuple2!16942) (t!33182 List!23531)) )
))
(declare-datatypes ((ListLongMap!14911 0))(
  ( (ListLongMap!14912 (toList!7471 List!23531)) )
))
(declare-fun lt!483240 () ListLongMap!14911)

(declare-fun zeroValue!831 () V!40587)

(declare-fun getCurrentListMap!4249 (array!70121 array!70123 (_ BitVec 32) (_ BitVec 32) V!40587 V!40587 (_ BitVec 32) Int) ListLongMap!14911)

(assert (=> b!1086779 (= lt!483240 (getCurrentListMap!4249 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483242 () array!70121)

(declare-fun lt!483247 () array!70123)

(declare-fun lt!483245 () ListLongMap!14911)

(assert (=> b!1086779 (= lt!483245 (getCurrentListMap!4249 lt!483242 lt!483247 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483248 () ListLongMap!14911)

(declare-fun lt!483241 () ListLongMap!14911)

(assert (=> b!1086779 (and (= lt!483248 lt!483241) (= lt!483241 lt!483248))))

(declare-fun lt!483249 () ListLongMap!14911)

(declare-fun -!797 (ListLongMap!14911 (_ BitVec 64)) ListLongMap!14911)

(assert (=> b!1086779 (= lt!483241 (-!797 lt!483249 k0!904))))

(declare-datatypes ((Unit!35760 0))(
  ( (Unit!35761) )
))
(declare-fun lt!483244 () Unit!35760)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!68 (array!70121 array!70123 (_ BitVec 32) (_ BitVec 32) V!40587 V!40587 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35760)

(assert (=> b!1086779 (= lt!483244 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!68 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4009 (array!70121 array!70123 (_ BitVec 32) (_ BitVec 32) V!40587 V!40587 (_ BitVec 32) Int) ListLongMap!14911)

(assert (=> b!1086779 (= lt!483248 (getCurrentListMapNoExtraKeys!4009 lt!483242 lt!483247 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2146 (Int (_ BitVec 64)) V!40587)

(assert (=> b!1086779 (= lt!483247 (array!70124 (store (arr!33735 _values!874) i!650 (ValueCellFull!12588 (dynLambda!2146 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34271 _values!874)))))

(assert (=> b!1086779 (= lt!483249 (getCurrentListMapNoExtraKeys!4009 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086779 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483238 () Unit!35760)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70121 (_ BitVec 64) (_ BitVec 32)) Unit!35760)

(assert (=> b!1086779 (= lt!483238 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086780 () Bool)

(declare-fun res!724708 () Bool)

(assert (=> b!1086780 (=> (not res!724708) (not e!620804))))

(declare-datatypes ((List!23532 0))(
  ( (Nil!23529) (Cons!23528 (h!24737 (_ BitVec 64)) (t!33183 List!23532)) )
))
(declare-fun arrayNoDuplicates!0 (array!70121 (_ BitVec 32) List!23532) Bool)

(assert (=> b!1086780 (= res!724708 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23529))))

(declare-fun b!1086781 () Bool)

(declare-fun res!724704 () Bool)

(assert (=> b!1086781 (=> (not res!724704) (not e!620804))))

(assert (=> b!1086781 (= res!724704 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34270 _keys!1070))))))

(declare-fun b!1086783 () Bool)

(declare-fun tp_is_empty!26595 () Bool)

(assert (=> b!1086783 (= e!620803 tp_is_empty!26595)))

(declare-fun b!1086784 () Bool)

(declare-fun res!724703 () Bool)

(assert (=> b!1086784 (=> (not res!724703) (not e!620804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086784 (= res!724703 (validKeyInArray!0 k0!904))))

(declare-fun b!1086785 () Bool)

(declare-fun res!724710 () Bool)

(assert (=> b!1086785 (=> (not res!724710) (not e!620810))))

(assert (=> b!1086785 (= res!724710 (arrayNoDuplicates!0 lt!483242 #b00000000000000000000000000000000 Nil!23529))))

(declare-fun mapIsEmpty!41647 () Bool)

(assert (=> mapIsEmpty!41647 mapRes!41647))

(declare-fun b!1086786 () Bool)

(declare-fun e!620807 () Bool)

(assert (=> b!1086786 (= e!620805 e!620807)))

(declare-fun res!724701 () Bool)

(assert (=> b!1086786 (=> res!724701 e!620807)))

(assert (=> b!1086786 (= res!724701 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483234 () ListLongMap!14911)

(declare-fun lt!483250 () ListLongMap!14911)

(assert (=> b!1086786 (= lt!483234 lt!483250)))

(declare-fun lt!483239 () ListLongMap!14911)

(assert (=> b!1086786 (= lt!483234 (-!797 lt!483239 k0!904))))

(declare-fun lt!483237 () Unit!35760)

(declare-fun addRemoveCommutativeForDiffKeys!34 (ListLongMap!14911 (_ BitVec 64) V!40587 (_ BitVec 64)) Unit!35760)

(assert (=> b!1086786 (= lt!483237 (addRemoveCommutativeForDiffKeys!34 lt!483249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483235 () tuple2!16942)

(declare-fun +!3278 (ListLongMap!14911 tuple2!16942) ListLongMap!14911)

(assert (=> b!1086786 (= lt!483245 (+!3278 lt!483250 lt!483235))))

(declare-fun lt!483246 () tuple2!16942)

(assert (=> b!1086786 (= lt!483250 (+!3278 lt!483241 lt!483246))))

(declare-fun lt!483243 () ListLongMap!14911)

(assert (=> b!1086786 (= lt!483240 lt!483243)))

(assert (=> b!1086786 (= lt!483243 (+!3278 lt!483239 lt!483235))))

(assert (=> b!1086786 (= lt!483239 (+!3278 lt!483249 lt!483246))))

(assert (=> b!1086786 (= lt!483245 (+!3278 (+!3278 lt!483248 lt!483246) lt!483235))))

(assert (=> b!1086786 (= lt!483235 (tuple2!16943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086786 (= lt!483246 (tuple2!16943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086787 () Bool)

(declare-fun res!724709 () Bool)

(assert (=> b!1086787 (=> (not res!724709) (not e!620804))))

(assert (=> b!1086787 (= res!724709 (and (= (size!34271 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34270 _keys!1070) (size!34271 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086788 () Bool)

(assert (=> b!1086788 (= e!620804 e!620810)))

(declare-fun res!724702 () Bool)

(assert (=> b!1086788 (=> (not res!724702) (not e!620810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70121 (_ BitVec 32)) Bool)

(assert (=> b!1086788 (= res!724702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483242 mask!1414))))

(assert (=> b!1086788 (= lt!483242 (array!70122 (store (arr!33734 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34270 _keys!1070)))))

(declare-fun mapNonEmpty!41647 () Bool)

(declare-fun tp!79628 () Bool)

(declare-fun e!620809 () Bool)

(assert (=> mapNonEmpty!41647 (= mapRes!41647 (and tp!79628 e!620809))))

(declare-fun mapKey!41647 () (_ BitVec 32))

(declare-fun mapRest!41647 () (Array (_ BitVec 32) ValueCell!12588))

(declare-fun mapValue!41647 () ValueCell!12588)

(assert (=> mapNonEmpty!41647 (= (arr!33735 _values!874) (store mapRest!41647 mapKey!41647 mapValue!41647))))

(declare-fun b!1086782 () Bool)

(assert (=> b!1086782 (= e!620809 tp_is_empty!26595)))

(declare-fun res!724705 () Bool)

(assert (=> start!95940 (=> (not res!724705) (not e!620804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95940 (= res!724705 (validMask!0 mask!1414))))

(assert (=> start!95940 e!620804))

(assert (=> start!95940 tp!79627))

(assert (=> start!95940 true))

(assert (=> start!95940 tp_is_empty!26595))

(declare-fun array_inv!26028 (array!70121) Bool)

(assert (=> start!95940 (array_inv!26028 _keys!1070)))

(declare-fun array_inv!26029 (array!70123) Bool)

(assert (=> start!95940 (and (array_inv!26029 _values!874) e!620808)))

(declare-fun b!1086789 () Bool)

(declare-fun res!724700 () Bool)

(assert (=> b!1086789 (=> (not res!724700) (not e!620804))))

(assert (=> b!1086789 (= res!724700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086790 () Bool)

(assert (=> b!1086790 (= e!620807 true)))

(assert (=> b!1086790 (= (-!797 lt!483243 k0!904) (+!3278 lt!483234 lt!483235))))

(declare-fun lt!483236 () Unit!35760)

(assert (=> b!1086790 (= lt!483236 (addRemoveCommutativeForDiffKeys!34 lt!483239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(assert (= (and start!95940 res!724705) b!1086787))

(assert (= (and b!1086787 res!724709) b!1086789))

(assert (= (and b!1086789 res!724700) b!1086780))

(assert (= (and b!1086780 res!724708) b!1086781))

(assert (= (and b!1086781 res!724704) b!1086784))

(assert (= (and b!1086784 res!724703) b!1086777))

(assert (= (and b!1086777 res!724707) b!1086788))

(assert (= (and b!1086788 res!724702) b!1086785))

(assert (= (and b!1086785 res!724710) b!1086779))

(assert (= (and b!1086779 (not res!724706)) b!1086786))

(assert (= (and b!1086786 (not res!724701)) b!1086790))

(assert (= (and b!1086778 condMapEmpty!41647) mapIsEmpty!41647))

(assert (= (and b!1086778 (not condMapEmpty!41647)) mapNonEmpty!41647))

(get-info :version)

(assert (= (and mapNonEmpty!41647 ((_ is ValueCellFull!12588) mapValue!41647)) b!1086782))

(assert (= (and b!1086778 ((_ is ValueCellFull!12588) mapDefault!41647)) b!1086783))

(assert (= start!95940 b!1086778))

(declare-fun b_lambda!17263 () Bool)

(assert (=> (not b_lambda!17263) (not b!1086779)))

(declare-fun t!33181 () Bool)

(declare-fun tb!7471 () Bool)

(assert (=> (and start!95940 (= defaultEntry!882 defaultEntry!882) t!33181) tb!7471))

(declare-fun result!15461 () Bool)

(assert (=> tb!7471 (= result!15461 tp_is_empty!26595)))

(assert (=> b!1086779 t!33181))

(declare-fun b_and!35863 () Bool)

(assert (= b_and!35861 (and (=> t!33181 result!15461) b_and!35863)))

(declare-fun m!1005431 () Bool)

(assert (=> b!1086777 m!1005431))

(declare-fun m!1005433 () Bool)

(assert (=> b!1086789 m!1005433))

(declare-fun m!1005435 () Bool)

(assert (=> b!1086779 m!1005435))

(declare-fun m!1005437 () Bool)

(assert (=> b!1086779 m!1005437))

(declare-fun m!1005439 () Bool)

(assert (=> b!1086779 m!1005439))

(declare-fun m!1005441 () Bool)

(assert (=> b!1086779 m!1005441))

(declare-fun m!1005443 () Bool)

(assert (=> b!1086779 m!1005443))

(declare-fun m!1005445 () Bool)

(assert (=> b!1086779 m!1005445))

(declare-fun m!1005447 () Bool)

(assert (=> b!1086779 m!1005447))

(declare-fun m!1005449 () Bool)

(assert (=> b!1086779 m!1005449))

(declare-fun m!1005451 () Bool)

(assert (=> b!1086779 m!1005451))

(declare-fun m!1005453 () Bool)

(assert (=> b!1086779 m!1005453))

(declare-fun m!1005455 () Bool)

(assert (=> b!1086788 m!1005455))

(declare-fun m!1005457 () Bool)

(assert (=> b!1086788 m!1005457))

(declare-fun m!1005459 () Bool)

(assert (=> start!95940 m!1005459))

(declare-fun m!1005461 () Bool)

(assert (=> start!95940 m!1005461))

(declare-fun m!1005463 () Bool)

(assert (=> start!95940 m!1005463))

(declare-fun m!1005465 () Bool)

(assert (=> b!1086790 m!1005465))

(declare-fun m!1005467 () Bool)

(assert (=> b!1086790 m!1005467))

(declare-fun m!1005469 () Bool)

(assert (=> b!1086790 m!1005469))

(declare-fun m!1005471 () Bool)

(assert (=> b!1086785 m!1005471))

(declare-fun m!1005473 () Bool)

(assert (=> mapNonEmpty!41647 m!1005473))

(declare-fun m!1005475 () Bool)

(assert (=> b!1086780 m!1005475))

(declare-fun m!1005477 () Bool)

(assert (=> b!1086786 m!1005477))

(declare-fun m!1005479 () Bool)

(assert (=> b!1086786 m!1005479))

(declare-fun m!1005481 () Bool)

(assert (=> b!1086786 m!1005481))

(declare-fun m!1005483 () Bool)

(assert (=> b!1086786 m!1005483))

(declare-fun m!1005485 () Bool)

(assert (=> b!1086786 m!1005485))

(assert (=> b!1086786 m!1005479))

(declare-fun m!1005487 () Bool)

(assert (=> b!1086786 m!1005487))

(declare-fun m!1005489 () Bool)

(assert (=> b!1086786 m!1005489))

(declare-fun m!1005491 () Bool)

(assert (=> b!1086786 m!1005491))

(declare-fun m!1005493 () Bool)

(assert (=> b!1086784 m!1005493))

(check-sat (not b!1086788) (not b!1086780) (not b!1086785) (not b!1086789) (not b!1086790) (not b!1086779) (not b!1086786) (not b_lambda!17263) (not start!95940) (not b!1086784) b_and!35863 tp_is_empty!26595 (not b_next!22593) (not mapNonEmpty!41647))
(check-sat b_and!35863 (not b_next!22593))
