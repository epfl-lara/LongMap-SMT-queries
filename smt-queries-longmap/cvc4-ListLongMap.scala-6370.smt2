; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81960 () Bool)

(assert start!81960)

(declare-fun res!640192 () Bool)

(declare-fun e!538599 () Bool)

(assert (=> start!81960 (=> (not res!640192) (not e!538599))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81960 (= res!640192 (validMask!0 mask!1823))))

(assert (=> start!81960 e!538599))

(assert (=> start!81960 true))

(declare-datatypes ((V!32981 0))(
  ( (V!32982 (val!10550 Int)) )
))
(declare-datatypes ((ValueCell!10018 0))(
  ( (ValueCellFull!10018 (v!13105 V!32981)) (EmptyCell!10018) )
))
(declare-datatypes ((array!58097 0))(
  ( (array!58098 (arr!27928 (Array (_ BitVec 32) ValueCell!10018)) (size!28407 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58097)

(declare-fun e!538601 () Bool)

(declare-fun array_inv!21671 (array!58097) Bool)

(assert (=> start!81960 (and (array_inv!21671 _values!1197) e!538601)))

(declare-datatypes ((array!58099 0))(
  ( (array!58100 (arr!27929 (Array (_ BitVec 32) (_ BitVec 64))) (size!28408 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58099)

(declare-fun array_inv!21672 (array!58099) Bool)

(assert (=> start!81960 (array_inv!21672 _keys!1441)))

(declare-fun mapIsEmpty!33460 () Bool)

(declare-fun mapRes!33460 () Bool)

(assert (=> mapIsEmpty!33460 mapRes!33460))

(declare-fun mapNonEmpty!33460 () Bool)

(declare-fun tp!64038 () Bool)

(declare-fun e!538602 () Bool)

(assert (=> mapNonEmpty!33460 (= mapRes!33460 (and tp!64038 e!538602))))

(declare-fun mapValue!33460 () ValueCell!10018)

(declare-fun mapKey!33460 () (_ BitVec 32))

(declare-fun mapRest!33460 () (Array (_ BitVec 32) ValueCell!10018))

(assert (=> mapNonEmpty!33460 (= (arr!27928 _values!1197) (store mapRest!33460 mapKey!33460 mapValue!33460))))

(declare-fun b!956023 () Bool)

(declare-fun e!538600 () Bool)

(declare-fun tp_is_empty!20999 () Bool)

(assert (=> b!956023 (= e!538600 tp_is_empty!20999)))

(declare-fun b!956024 () Bool)

(assert (=> b!956024 (= e!538599 false)))

(declare-fun lt!430076 () Bool)

(declare-datatypes ((List!19464 0))(
  ( (Nil!19461) (Cons!19460 (h!20622 (_ BitVec 64)) (t!27825 List!19464)) )
))
(declare-fun arrayNoDuplicates!0 (array!58099 (_ BitVec 32) List!19464) Bool)

(assert (=> b!956024 (= lt!430076 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19461))))

(declare-fun b!956025 () Bool)

(declare-fun res!640193 () Bool)

(assert (=> b!956025 (=> (not res!640193) (not e!538599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58099 (_ BitVec 32)) Bool)

(assert (=> b!956025 (= res!640193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956026 () Bool)

(declare-fun res!640194 () Bool)

(assert (=> b!956026 (=> (not res!640194) (not e!538599))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956026 (= res!640194 (and (= (size!28407 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28408 _keys!1441) (size!28407 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956027 () Bool)

(assert (=> b!956027 (= e!538601 (and e!538600 mapRes!33460))))

(declare-fun condMapEmpty!33460 () Bool)

(declare-fun mapDefault!33460 () ValueCell!10018)

