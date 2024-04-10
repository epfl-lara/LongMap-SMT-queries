; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96106 () Bool)

(assert start!96106)

(declare-fun b_free!22759 () Bool)

(declare-fun b_next!22759 () Bool)

(assert (=> start!96106 (= b_free!22759 (not b_next!22759))))

(declare-fun tp!80126 () Bool)

(declare-fun b_and!36193 () Bool)

(assert (=> start!96106 (= tp!80126 b_and!36193)))

(declare-fun mapNonEmpty!41896 () Bool)

(declare-fun mapRes!41896 () Bool)

(declare-fun tp!80125 () Bool)

(declare-fun e!622800 () Bool)

(assert (=> mapNonEmpty!41896 (= mapRes!41896 (and tp!80125 e!622800))))

(declare-datatypes ((V!40809 0))(
  ( (V!40810 (val!13437 Int)) )
))
(declare-datatypes ((ValueCell!12671 0))(
  ( (ValueCellFull!12671 (v!16058 V!40809)) (EmptyCell!12671) )
))
(declare-datatypes ((array!70445 0))(
  ( (array!70446 (arr!33896 (Array (_ BitVec 32) ValueCell!12671)) (size!34432 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70445)

(declare-fun mapValue!41896 () ValueCell!12671)

(declare-fun mapKey!41896 () (_ BitVec 32))

(declare-fun mapRest!41896 () (Array (_ BitVec 32) ValueCell!12671))

(assert (=> mapNonEmpty!41896 (= (arr!33896 _values!874) (store mapRest!41896 mapKey!41896 mapValue!41896))))

(declare-fun b!1090447 () Bool)

(declare-fun e!622796 () Bool)

(declare-fun tp_is_empty!26761 () Bool)

(assert (=> b!1090447 (= e!622796 tp_is_empty!26761)))

(declare-fun b!1090448 () Bool)

(declare-fun res!727459 () Bool)

(declare-fun e!622798 () Bool)

(assert (=> b!1090448 (=> (not res!727459) (not e!622798))))

(declare-datatypes ((array!70447 0))(
  ( (array!70448 (arr!33897 (Array (_ BitVec 32) (_ BitVec 64))) (size!34433 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70447)

(declare-datatypes ((List!23668 0))(
  ( (Nil!23665) (Cons!23664 (h!24873 (_ BitVec 64)) (t!33485 List!23668)) )
))
(declare-fun arrayNoDuplicates!0 (array!70447 (_ BitVec 32) List!23668) Bool)

(assert (=> b!1090448 (= res!727459 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23665))))

(declare-fun b!1090449 () Bool)

(declare-fun e!622799 () Bool)

(declare-fun e!622801 () Bool)

(assert (=> b!1090449 (= e!622799 e!622801)))

(declare-fun res!727467 () Bool)

(assert (=> b!1090449 (=> res!727467 e!622801)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1090449 (= res!727467 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17080 0))(
  ( (tuple2!17081 (_1!8551 (_ BitVec 64)) (_2!8551 V!40809)) )
))
(declare-datatypes ((List!23669 0))(
  ( (Nil!23666) (Cons!23665 (h!24874 tuple2!17080) (t!33486 List!23669)) )
))
(declare-datatypes ((ListLongMap!15049 0))(
  ( (ListLongMap!15050 (toList!7540 List!23669)) )
))
(declare-fun lt!486543 () ListLongMap!15049)

(declare-fun lt!486541 () ListLongMap!15049)

(assert (=> b!1090449 (= lt!486543 lt!486541)))

(declare-fun lt!486549 () ListLongMap!15049)

(declare-fun lt!486542 () tuple2!17080)

(declare-fun +!3329 (ListLongMap!15049 tuple2!17080) ListLongMap!15049)

(assert (=> b!1090449 (= lt!486541 (+!3329 lt!486549 lt!486542))))

(declare-fun lt!486547 () ListLongMap!15049)

(declare-fun lt!486553 () ListLongMap!15049)

(assert (=> b!1090449 (= lt!486547 lt!486553)))

(declare-fun lt!486548 () ListLongMap!15049)

(assert (=> b!1090449 (= lt!486553 (+!3329 lt!486548 lt!486542))))

(declare-fun lt!486551 () ListLongMap!15049)

(assert (=> b!1090449 (= lt!486547 (+!3329 lt!486551 lt!486542))))

(declare-fun minValue!831 () V!40809)

(assert (=> b!1090449 (= lt!486542 (tuple2!17081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090450 () Bool)

(declare-fun res!727466 () Bool)

(assert (=> b!1090450 (=> (not res!727466) (not e!622798))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090450 (= res!727466 (= (select (arr!33897 _keys!1070) i!650) k!904))))

(declare-fun b!1090451 () Bool)

(declare-fun e!622797 () Bool)

(assert (=> b!1090451 (= e!622797 (and e!622796 mapRes!41896))))

(declare-fun condMapEmpty!41896 () Bool)

(declare-fun mapDefault!41896 () ValueCell!12671)

