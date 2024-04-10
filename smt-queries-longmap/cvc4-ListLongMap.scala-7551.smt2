; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95630 () Bool)

(assert start!95630)

(declare-fun b_free!22283 () Bool)

(declare-fun b_next!22283 () Bool)

(assert (=> start!95630 (= b_free!22283 (not b_next!22283))))

(declare-fun tp!78697 () Bool)

(declare-fun b_and!35261 () Bool)

(assert (=> start!95630 (= tp!78697 b_and!35261)))

(declare-fun b!1080609 () Bool)

(declare-fun e!617729 () Bool)

(declare-fun tp_is_empty!26285 () Bool)

(assert (=> b!1080609 (= e!617729 tp_is_empty!26285)))

(declare-fun b!1080610 () Bool)

(declare-fun res!720221 () Bool)

(declare-fun e!617724 () Bool)

(assert (=> b!1080610 (=> (not res!720221) (not e!617724))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69521 0))(
  ( (array!69522 (arr!33434 (Array (_ BitVec 32) (_ BitVec 64))) (size!33970 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69521)

(assert (=> b!1080610 (= res!720221 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33970 _keys!1070))))))

(declare-fun b!1080611 () Bool)

(declare-fun e!617727 () Bool)

(assert (=> b!1080611 (= e!617724 e!617727)))

(declare-fun res!720225 () Bool)

(assert (=> b!1080611 (=> (not res!720225) (not e!617727))))

(declare-fun lt!479062 () array!69521)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69521 (_ BitVec 32)) Bool)

(assert (=> b!1080611 (= res!720225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479062 mask!1414))))

(assert (=> b!1080611 (= lt!479062 (array!69522 (store (arr!33434 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33970 _keys!1070)))))

(declare-fun b!1080612 () Bool)

(declare-fun res!720220 () Bool)

(assert (=> b!1080612 (=> (not res!720220) (not e!617724))))

(declare-datatypes ((List!23299 0))(
  ( (Nil!23296) (Cons!23295 (h!24504 (_ BitVec 64)) (t!32658 List!23299)) )
))
(declare-fun arrayNoDuplicates!0 (array!69521 (_ BitVec 32) List!23299) Bool)

(assert (=> b!1080612 (= res!720220 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23296))))

(declare-fun mapIsEmpty!41182 () Bool)

(declare-fun mapRes!41182 () Bool)

(assert (=> mapIsEmpty!41182 mapRes!41182))

(declare-fun b!1080613 () Bool)

(declare-fun res!720222 () Bool)

(assert (=> b!1080613 (=> (not res!720222) (not e!617724))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1080613 (= res!720222 (= (select (arr!33434 _keys!1070) i!650) k!904))))

(declare-fun res!720224 () Bool)

(assert (=> start!95630 (=> (not res!720224) (not e!617724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95630 (= res!720224 (validMask!0 mask!1414))))

(assert (=> start!95630 e!617724))

(assert (=> start!95630 tp!78697))

(assert (=> start!95630 true))

(assert (=> start!95630 tp_is_empty!26285))

(declare-fun array_inv!25814 (array!69521) Bool)

(assert (=> start!95630 (array_inv!25814 _keys!1070)))

(declare-datatypes ((V!40173 0))(
  ( (V!40174 (val!13199 Int)) )
))
(declare-datatypes ((ValueCell!12433 0))(
  ( (ValueCellFull!12433 (v!15820 V!40173)) (EmptyCell!12433) )
))
(declare-datatypes ((array!69523 0))(
  ( (array!69524 (arr!33435 (Array (_ BitVec 32) ValueCell!12433)) (size!33971 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69523)

(declare-fun e!617728 () Bool)

(declare-fun array_inv!25815 (array!69523) Bool)

(assert (=> start!95630 (and (array_inv!25815 _values!874) e!617728)))

(declare-fun b!1080614 () Bool)

(declare-fun res!720219 () Bool)

(assert (=> b!1080614 (=> (not res!720219) (not e!617727))))

(assert (=> b!1080614 (= res!720219 (arrayNoDuplicates!0 lt!479062 #b00000000000000000000000000000000 Nil!23296))))

(declare-fun mapNonEmpty!41182 () Bool)

(declare-fun tp!78698 () Bool)

(declare-fun e!617725 () Bool)

(assert (=> mapNonEmpty!41182 (= mapRes!41182 (and tp!78698 e!617725))))

(declare-fun mapValue!41182 () ValueCell!12433)

(declare-fun mapRest!41182 () (Array (_ BitVec 32) ValueCell!12433))

(declare-fun mapKey!41182 () (_ BitVec 32))

(assert (=> mapNonEmpty!41182 (= (arr!33435 _values!874) (store mapRest!41182 mapKey!41182 mapValue!41182))))

(declare-fun b!1080615 () Bool)

(assert (=> b!1080615 (= e!617727 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40173)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16718 0))(
  ( (tuple2!16719 (_1!8370 (_ BitVec 64)) (_2!8370 V!40173)) )
))
(declare-datatypes ((List!23300 0))(
  ( (Nil!23297) (Cons!23296 (h!24505 tuple2!16718) (t!32659 List!23300)) )
))
(declare-datatypes ((ListLongMap!14687 0))(
  ( (ListLongMap!14688 (toList!7359 List!23300)) )
))
(declare-fun lt!479061 () ListLongMap!14687)

(declare-fun zeroValue!831 () V!40173)

(declare-fun getCurrentListMapNoExtraKeys!3907 (array!69521 array!69523 (_ BitVec 32) (_ BitVec 32) V!40173 V!40173 (_ BitVec 32) Int) ListLongMap!14687)

(assert (=> b!1080615 (= lt!479061 (getCurrentListMapNoExtraKeys!3907 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080615 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35538 0))(
  ( (Unit!35539) )
))
(declare-fun lt!479060 () Unit!35538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69521 (_ BitVec 64) (_ BitVec 32)) Unit!35538)

(assert (=> b!1080615 (= lt!479060 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1080616 () Bool)

(declare-fun res!720223 () Bool)

(assert (=> b!1080616 (=> (not res!720223) (not e!617724))))

(assert (=> b!1080616 (= res!720223 (and (= (size!33971 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33970 _keys!1070) (size!33971 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080617 () Bool)

(assert (=> b!1080617 (= e!617725 tp_is_empty!26285)))

(declare-fun b!1080618 () Bool)

(declare-fun res!720217 () Bool)

(assert (=> b!1080618 (=> (not res!720217) (not e!617724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080618 (= res!720217 (validKeyInArray!0 k!904))))

(declare-fun b!1080619 () Bool)

(assert (=> b!1080619 (= e!617728 (and e!617729 mapRes!41182))))

(declare-fun condMapEmpty!41182 () Bool)

(declare-fun mapDefault!41182 () ValueCell!12433)

