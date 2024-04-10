; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96170 () Bool)

(assert start!96170)

(declare-fun b_free!22823 () Bool)

(declare-fun b_next!22823 () Bool)

(assert (=> start!96170 (= b_free!22823 (not b_next!22823))))

(declare-fun tp!80317 () Bool)

(declare-fun b_and!36321 () Bool)

(assert (=> start!96170 (= tp!80317 b_and!36321)))

(declare-fun res!728516 () Bool)

(declare-fun e!623566 () Bool)

(assert (=> start!96170 (=> (not res!728516) (not e!623566))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96170 (= res!728516 (validMask!0 mask!1414))))

(assert (=> start!96170 e!623566))

(assert (=> start!96170 tp!80317))

(assert (=> start!96170 true))

(declare-fun tp_is_empty!26825 () Bool)

(assert (=> start!96170 tp_is_empty!26825))

(declare-datatypes ((array!70569 0))(
  ( (array!70570 (arr!33958 (Array (_ BitVec 32) (_ BitVec 64))) (size!34494 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70569)

(declare-fun array_inv!26180 (array!70569) Bool)

(assert (=> start!96170 (array_inv!26180 _keys!1070)))

(declare-datatypes ((V!40893 0))(
  ( (V!40894 (val!13469 Int)) )
))
(declare-datatypes ((ValueCell!12703 0))(
  ( (ValueCellFull!12703 (v!16090 V!40893)) (EmptyCell!12703) )
))
(declare-datatypes ((array!70571 0))(
  ( (array!70572 (arr!33959 (Array (_ BitVec 32) ValueCell!12703)) (size!34495 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70571)

(declare-fun e!623565 () Bool)

(declare-fun array_inv!26181 (array!70571) Bool)

(assert (=> start!96170 (and (array_inv!26181 _values!874) e!623565)))

(declare-fun b!1091855 () Bool)

(declare-fun res!728520 () Bool)

(declare-fun e!623563 () Bool)

(assert (=> b!1091855 (=> (not res!728520) (not e!623563))))

(declare-fun lt!487793 () array!70569)

(declare-datatypes ((List!23720 0))(
  ( (Nil!23717) (Cons!23716 (h!24925 (_ BitVec 64)) (t!33601 List!23720)) )
))
(declare-fun arrayNoDuplicates!0 (array!70569 (_ BitVec 32) List!23720) Bool)

(assert (=> b!1091855 (= res!728520 (arrayNoDuplicates!0 lt!487793 #b00000000000000000000000000000000 Nil!23717))))

(declare-fun b!1091856 () Bool)

(assert (=> b!1091856 (= e!623566 e!623563)))

(declare-fun res!728518 () Bool)

(assert (=> b!1091856 (=> (not res!728518) (not e!623563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70569 (_ BitVec 32)) Bool)

(assert (=> b!1091856 (= res!728518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487793 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091856 (= lt!487793 (array!70570 (store (arr!33958 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34494 _keys!1070)))))

(declare-fun b!1091857 () Bool)

(declare-fun res!728514 () Bool)

(assert (=> b!1091857 (=> (not res!728514) (not e!623566))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091857 (= res!728514 (and (= (size!34495 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34494 _keys!1070) (size!34495 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091858 () Bool)

(declare-fun res!728521 () Bool)

(assert (=> b!1091858 (=> (not res!728521) (not e!623566))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1091858 (= res!728521 (= (select (arr!33958 _keys!1070) i!650) k!904))))

(declare-fun b!1091859 () Bool)

(declare-fun res!728515 () Bool)

(assert (=> b!1091859 (=> (not res!728515) (not e!623566))))

(assert (=> b!1091859 (= res!728515 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34494 _keys!1070))))))

(declare-fun b!1091860 () Bool)

(declare-fun e!623569 () Bool)

(assert (=> b!1091860 (= e!623569 true)))

(declare-datatypes ((tuple2!17136 0))(
  ( (tuple2!17137 (_1!8579 (_ BitVec 64)) (_2!8579 V!40893)) )
))
(declare-datatypes ((List!23721 0))(
  ( (Nil!23718) (Cons!23717 (h!24926 tuple2!17136) (t!33602 List!23721)) )
))
(declare-datatypes ((ListLongMap!15105 0))(
  ( (ListLongMap!15106 (toList!7568 List!23721)) )
))
(declare-fun lt!487795 () ListLongMap!15105)

(declare-fun lt!487797 () ListLongMap!15105)

(declare-fun -!888 (ListLongMap!15105 (_ BitVec 64)) ListLongMap!15105)

(assert (=> b!1091860 (= (-!888 lt!487795 k!904) lt!487797)))

(declare-datatypes ((Unit!35942 0))(
  ( (Unit!35943) )
))
(declare-fun lt!487792 () Unit!35942)

(declare-fun minValue!831 () V!40893)

(declare-fun lt!487801 () ListLongMap!15105)

(declare-fun addRemoveCommutativeForDiffKeys!109 (ListLongMap!15105 (_ BitVec 64) V!40893 (_ BitVec 64)) Unit!35942)

(assert (=> b!1091860 (= lt!487792 (addRemoveCommutativeForDiffKeys!109 lt!487801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1091861 () Bool)

(declare-fun res!728523 () Bool)

(assert (=> b!1091861 (=> (not res!728523) (not e!623566))))

(assert (=> b!1091861 (= res!728523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091862 () Bool)

(declare-fun e!623570 () Bool)

(assert (=> b!1091862 (= e!623570 tp_is_empty!26825)))

(declare-fun mapNonEmpty!41992 () Bool)

(declare-fun mapRes!41992 () Bool)

(declare-fun tp!80318 () Bool)

(declare-fun e!623568 () Bool)

(assert (=> mapNonEmpty!41992 (= mapRes!41992 (and tp!80318 e!623568))))

(declare-fun mapKey!41992 () (_ BitVec 32))

(declare-fun mapRest!41992 () (Array (_ BitVec 32) ValueCell!12703))

(declare-fun mapValue!41992 () ValueCell!12703)

(assert (=> mapNonEmpty!41992 (= (arr!33959 _values!874) (store mapRest!41992 mapKey!41992 mapValue!41992))))

(declare-fun b!1091863 () Bool)

(assert (=> b!1091863 (= e!623565 (and e!623570 mapRes!41992))))

(declare-fun condMapEmpty!41992 () Bool)

(declare-fun mapDefault!41992 () ValueCell!12703)

