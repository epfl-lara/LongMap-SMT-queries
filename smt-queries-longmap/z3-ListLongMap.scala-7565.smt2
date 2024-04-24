; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95946 () Bool)

(assert start!95946)

(declare-fun b_free!22363 () Bool)

(declare-fun b_next!22363 () Bool)

(assert (=> start!95946 (= b_free!22363 (not b_next!22363))))

(declare-fun tp!78938 () Bool)

(declare-fun b_and!35411 () Bool)

(assert (=> start!95946 (= tp!78938 b_and!35411)))

(declare-fun b!1083436 () Bool)

(declare-fun e!619302 () Bool)

(declare-fun tp_is_empty!26365 () Bool)

(assert (=> b!1083436 (= e!619302 tp_is_empty!26365)))

(declare-fun res!721827 () Bool)

(declare-fun e!619301 () Bool)

(assert (=> start!95946 (=> (not res!721827) (not e!619301))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95946 (= res!721827 (validMask!0 mask!1414))))

(assert (=> start!95946 e!619301))

(assert (=> start!95946 tp!78938))

(assert (=> start!95946 true))

(assert (=> start!95946 tp_is_empty!26365))

(declare-datatypes ((array!69713 0))(
  ( (array!69714 (arr!33524 (Array (_ BitVec 32) (_ BitVec 64))) (size!34061 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69713)

(declare-fun array_inv!25920 (array!69713) Bool)

(assert (=> start!95946 (array_inv!25920 _keys!1070)))

(declare-datatypes ((V!40281 0))(
  ( (V!40282 (val!13239 Int)) )
))
(declare-datatypes ((ValueCell!12473 0))(
  ( (ValueCellFull!12473 (v!15856 V!40281)) (EmptyCell!12473) )
))
(declare-datatypes ((array!69715 0))(
  ( (array!69716 (arr!33525 (Array (_ BitVec 32) ValueCell!12473)) (size!34062 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69715)

(declare-fun e!619299 () Bool)

(declare-fun array_inv!25921 (array!69715) Bool)

(assert (=> start!95946 (and (array_inv!25921 _values!874) e!619299)))

(declare-fun b!1083437 () Bool)

(declare-fun res!721821 () Bool)

(assert (=> b!1083437 (=> (not res!721821) (not e!619301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69713 (_ BitVec 32)) Bool)

(assert (=> b!1083437 (= res!721821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083438 () Bool)

(declare-fun res!721825 () Bool)

(declare-fun e!619304 () Bool)

(assert (=> b!1083438 (=> (not res!721825) (not e!619304))))

(declare-fun lt!480027 () array!69713)

(declare-datatypes ((List!23366 0))(
  ( (Nil!23363) (Cons!23362 (h!24580 (_ BitVec 64)) (t!32779 List!23366)) )
))
(declare-fun arrayNoDuplicates!0 (array!69713 (_ BitVec 32) List!23366) Bool)

(assert (=> b!1083438 (= res!721825 (arrayNoDuplicates!0 lt!480027 #b00000000000000000000000000000000 Nil!23363))))

(declare-fun b!1083439 () Bool)

(declare-fun res!721826 () Bool)

(assert (=> b!1083439 (=> (not res!721826) (not e!619301))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083439 (= res!721826 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41302 () Bool)

(declare-fun mapRes!41302 () Bool)

(declare-fun tp!78937 () Bool)

(assert (=> mapNonEmpty!41302 (= mapRes!41302 (and tp!78937 e!619302))))

(declare-fun mapRest!41302 () (Array (_ BitVec 32) ValueCell!12473))

(declare-fun mapValue!41302 () ValueCell!12473)

(declare-fun mapKey!41302 () (_ BitVec 32))

(assert (=> mapNonEmpty!41302 (= (arr!33525 _values!874) (store mapRest!41302 mapKey!41302 mapValue!41302))))

(declare-fun b!1083440 () Bool)

(declare-fun res!721819 () Bool)

(assert (=> b!1083440 (=> (not res!721819) (not e!619301))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083440 (= res!721819 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34061 _keys!1070))))))

(declare-fun b!1083441 () Bool)

(assert (=> b!1083441 (= e!619301 e!619304)))

(declare-fun res!721822 () Bool)

(assert (=> b!1083441 (=> (not res!721822) (not e!619304))))

(assert (=> b!1083441 (= res!721822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480027 mask!1414))))

(assert (=> b!1083441 (= lt!480027 (array!69714 (store (arr!33524 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34061 _keys!1070)))))

(declare-fun b!1083442 () Bool)

(declare-fun res!721823 () Bool)

(assert (=> b!1083442 (=> (not res!721823) (not e!619301))))

(assert (=> b!1083442 (= res!721823 (= (select (arr!33524 _keys!1070) i!650) k0!904))))

(declare-fun b!1083443 () Bool)

(declare-fun res!721824 () Bool)

(assert (=> b!1083443 (=> (not res!721824) (not e!619301))))

(assert (=> b!1083443 (= res!721824 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23363))))

(declare-fun b!1083444 () Bool)

(assert (=> b!1083444 (= e!619304 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40281)

(declare-fun minValue!831 () V!40281)

(declare-datatypes ((tuple2!16776 0))(
  ( (tuple2!16777 (_1!8399 (_ BitVec 64)) (_2!8399 V!40281)) )
))
(declare-datatypes ((List!23367 0))(
  ( (Nil!23364) (Cons!23363 (h!24581 tuple2!16776) (t!32780 List!23367)) )
))
(declare-datatypes ((ListLongMap!14753 0))(
  ( (ListLongMap!14754 (toList!7392 List!23367)) )
))
(declare-fun lt!480028 () ListLongMap!14753)

(declare-fun getCurrentListMapNoExtraKeys!3969 (array!69713 array!69715 (_ BitVec 32) (_ BitVec 32) V!40281 V!40281 (_ BitVec 32) Int) ListLongMap!14753)

(declare-fun dynLambda!2090 (Int (_ BitVec 64)) V!40281)

(assert (=> b!1083444 (= lt!480028 (getCurrentListMapNoExtraKeys!3969 lt!480027 (array!69716 (store (arr!33525 _values!874) i!650 (ValueCellFull!12473 (dynLambda!2090 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34062 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480030 () ListLongMap!14753)

(assert (=> b!1083444 (= lt!480030 (getCurrentListMapNoExtraKeys!3969 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083444 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35575 0))(
  ( (Unit!35576) )
))
(declare-fun lt!480029 () Unit!35575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69713 (_ BitVec 64) (_ BitVec 32)) Unit!35575)

(assert (=> b!1083444 (= lt!480029 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083445 () Bool)

(declare-fun e!619303 () Bool)

(assert (=> b!1083445 (= e!619303 tp_is_empty!26365)))

(declare-fun b!1083446 () Bool)

(declare-fun res!721820 () Bool)

(assert (=> b!1083446 (=> (not res!721820) (not e!619301))))

(assert (=> b!1083446 (= res!721820 (and (= (size!34062 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34061 _keys!1070) (size!34062 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41302 () Bool)

(assert (=> mapIsEmpty!41302 mapRes!41302))

(declare-fun b!1083447 () Bool)

(assert (=> b!1083447 (= e!619299 (and e!619303 mapRes!41302))))

(declare-fun condMapEmpty!41302 () Bool)

(declare-fun mapDefault!41302 () ValueCell!12473)

(assert (=> b!1083447 (= condMapEmpty!41302 (= (arr!33525 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12473)) mapDefault!41302)))))

(assert (= (and start!95946 res!721827) b!1083446))

(assert (= (and b!1083446 res!721820) b!1083437))

(assert (= (and b!1083437 res!721821) b!1083443))

(assert (= (and b!1083443 res!721824) b!1083440))

(assert (= (and b!1083440 res!721819) b!1083439))

(assert (= (and b!1083439 res!721826) b!1083442))

(assert (= (and b!1083442 res!721823) b!1083441))

(assert (= (and b!1083441 res!721822) b!1083438))

(assert (= (and b!1083438 res!721825) b!1083444))

(assert (= (and b!1083447 condMapEmpty!41302) mapIsEmpty!41302))

(assert (= (and b!1083447 (not condMapEmpty!41302)) mapNonEmpty!41302))

(get-info :version)

(assert (= (and mapNonEmpty!41302 ((_ is ValueCellFull!12473) mapValue!41302)) b!1083436))

(assert (= (and b!1083447 ((_ is ValueCellFull!12473) mapDefault!41302)) b!1083445))

(assert (= start!95946 b!1083447))

(declare-fun b_lambda!17043 () Bool)

(assert (=> (not b_lambda!17043) (not b!1083444)))

(declare-fun t!32778 () Bool)

(declare-fun tb!7233 () Bool)

(assert (=> (and start!95946 (= defaultEntry!882 defaultEntry!882) t!32778) tb!7233))

(declare-fun result!14993 () Bool)

(assert (=> tb!7233 (= result!14993 tp_is_empty!26365)))

(assert (=> b!1083444 t!32778))

(declare-fun b_and!35413 () Bool)

(assert (= b_and!35411 (and (=> t!32778 result!14993) b_and!35413)))

(declare-fun m!1001501 () Bool)

(assert (=> start!95946 m!1001501))

(declare-fun m!1001503 () Bool)

(assert (=> start!95946 m!1001503))

(declare-fun m!1001505 () Bool)

(assert (=> start!95946 m!1001505))

(declare-fun m!1001507 () Bool)

(assert (=> mapNonEmpty!41302 m!1001507))

(declare-fun m!1001509 () Bool)

(assert (=> b!1083443 m!1001509))

(declare-fun m!1001511 () Bool)

(assert (=> b!1083437 m!1001511))

(declare-fun m!1001513 () Bool)

(assert (=> b!1083439 m!1001513))

(declare-fun m!1001515 () Bool)

(assert (=> b!1083438 m!1001515))

(declare-fun m!1001517 () Bool)

(assert (=> b!1083444 m!1001517))

(declare-fun m!1001519 () Bool)

(assert (=> b!1083444 m!1001519))

(declare-fun m!1001521 () Bool)

(assert (=> b!1083444 m!1001521))

(declare-fun m!1001523 () Bool)

(assert (=> b!1083444 m!1001523))

(declare-fun m!1001525 () Bool)

(assert (=> b!1083444 m!1001525))

(declare-fun m!1001527 () Bool)

(assert (=> b!1083444 m!1001527))

(declare-fun m!1001529 () Bool)

(assert (=> b!1083442 m!1001529))

(declare-fun m!1001531 () Bool)

(assert (=> b!1083441 m!1001531))

(declare-fun m!1001533 () Bool)

(assert (=> b!1083441 m!1001533))

(check-sat tp_is_empty!26365 (not b!1083443) (not b!1083438) b_and!35413 (not b!1083439) (not b!1083441) (not b_lambda!17043) (not mapNonEmpty!41302) (not b_next!22363) (not b!1083437) (not b!1083444) (not start!95946))
(check-sat b_and!35413 (not b_next!22363))
