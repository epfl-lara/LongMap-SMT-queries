; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95948 () Bool)

(assert start!95948)

(declare-fun b_free!22601 () Bool)

(declare-fun b_next!22601 () Bool)

(assert (=> start!95948 (= b_free!22601 (not b_next!22601))))

(declare-fun tp!79652 () Bool)

(declare-fun b_and!35877 () Bool)

(assert (=> start!95948 (= tp!79652 b_and!35877)))

(declare-fun b!1086953 () Bool)

(declare-fun e!620903 () Bool)

(declare-fun tp_is_empty!26603 () Bool)

(assert (=> b!1086953 (= e!620903 tp_is_empty!26603)))

(declare-fun mapNonEmpty!41659 () Bool)

(declare-fun mapRes!41659 () Bool)

(declare-fun tp!79651 () Bool)

(declare-fun e!620902 () Bool)

(assert (=> mapNonEmpty!41659 (= mapRes!41659 (and tp!79651 e!620902))))

(declare-datatypes ((V!40597 0))(
  ( (V!40598 (val!13358 Int)) )
))
(declare-datatypes ((ValueCell!12592 0))(
  ( (ValueCellFull!12592 (v!15979 V!40597)) (EmptyCell!12592) )
))
(declare-datatypes ((array!70135 0))(
  ( (array!70136 (arr!33741 (Array (_ BitVec 32) ValueCell!12592)) (size!34277 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70135)

(declare-fun mapRest!41659 () (Array (_ BitVec 32) ValueCell!12592))

(declare-fun mapValue!41659 () ValueCell!12592)

(declare-fun mapKey!41659 () (_ BitVec 32))

(assert (=> mapNonEmpty!41659 (= (arr!33741 _values!874) (store mapRest!41659 mapKey!41659 mapValue!41659))))

(declare-fun b!1086954 () Bool)

(declare-fun res!724832 () Bool)

(declare-fun e!620906 () Bool)

(assert (=> b!1086954 (=> (not res!724832) (not e!620906))))

(declare-datatypes ((array!70137 0))(
  ( (array!70138 (arr!33742 (Array (_ BitVec 32) (_ BitVec 64))) (size!34278 (_ BitVec 32))) )
))
(declare-fun lt!483438 () array!70137)

(declare-datatypes ((List!23537 0))(
  ( (Nil!23534) (Cons!23533 (h!24742 (_ BitVec 64)) (t!33196 List!23537)) )
))
(declare-fun arrayNoDuplicates!0 (array!70137 (_ BitVec 32) List!23537) Bool)

(assert (=> b!1086954 (= res!724832 (arrayNoDuplicates!0 lt!483438 #b00000000000000000000000000000000 Nil!23534))))

(declare-fun b!1086955 () Bool)

(declare-fun e!620905 () Bool)

(declare-fun e!620901 () Bool)

(assert (=> b!1086955 (= e!620905 e!620901)))

(declare-fun res!724835 () Bool)

(assert (=> b!1086955 (=> res!724835 e!620901)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1086955 (= res!724835 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!16948 0))(
  ( (tuple2!16949 (_1!8485 (_ BitVec 64)) (_2!8485 V!40597)) )
))
(declare-datatypes ((List!23538 0))(
  ( (Nil!23535) (Cons!23534 (h!24743 tuple2!16948) (t!33197 List!23538)) )
))
(declare-datatypes ((ListLongMap!14917 0))(
  ( (ListLongMap!14918 (toList!7474 List!23538)) )
))
(declare-fun lt!483451 () ListLongMap!14917)

(declare-fun lt!483452 () ListLongMap!14917)

(assert (=> b!1086955 (= lt!483451 lt!483452)))

(declare-fun lt!483443 () ListLongMap!14917)

(declare-fun -!800 (ListLongMap!14917 (_ BitVec 64)) ListLongMap!14917)

(assert (=> b!1086955 (= lt!483451 (-!800 lt!483443 k!904))))

(declare-fun lt!483441 () ListLongMap!14917)

(declare-datatypes ((Unit!35766 0))(
  ( (Unit!35767) )
))
(declare-fun lt!483445 () Unit!35766)

(declare-fun zeroValue!831 () V!40597)

(declare-fun addRemoveCommutativeForDiffKeys!36 (ListLongMap!14917 (_ BitVec 64) V!40597 (_ BitVec 64)) Unit!35766)

(assert (=> b!1086955 (= lt!483445 (addRemoveCommutativeForDiffKeys!36 lt!483441 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!483454 () ListLongMap!14917)

(declare-fun lt!483444 () tuple2!16948)

(declare-fun +!3280 (ListLongMap!14917 tuple2!16948) ListLongMap!14917)

(assert (=> b!1086955 (= lt!483454 (+!3280 lt!483452 lt!483444))))

(declare-fun lt!483446 () ListLongMap!14917)

(declare-fun lt!483453 () tuple2!16948)

(assert (=> b!1086955 (= lt!483452 (+!3280 lt!483446 lt!483453))))

(declare-fun lt!483448 () ListLongMap!14917)

(declare-fun lt!483442 () ListLongMap!14917)

(assert (=> b!1086955 (= lt!483448 lt!483442)))

(assert (=> b!1086955 (= lt!483442 (+!3280 lt!483443 lt!483444))))

(assert (=> b!1086955 (= lt!483443 (+!3280 lt!483441 lt!483453))))

(declare-fun lt!483439 () ListLongMap!14917)

(assert (=> b!1086955 (= lt!483454 (+!3280 (+!3280 lt!483439 lt!483453) lt!483444))))

(declare-fun minValue!831 () V!40597)

(assert (=> b!1086955 (= lt!483444 (tuple2!16949 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086955 (= lt!483453 (tuple2!16949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086956 () Bool)

(declare-fun e!620899 () Bool)

(assert (=> b!1086956 (= e!620899 (and e!620903 mapRes!41659))))

(declare-fun condMapEmpty!41659 () Bool)

(declare-fun mapDefault!41659 () ValueCell!12592)

