; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4138 () Bool)

(assert start!4138)

(declare-fun b_free!1043 () Bool)

(declare-fun b_next!1043 () Bool)

(assert (=> start!4138 (= b_free!1043 (not b_next!1043))))

(declare-fun tp!4549 () Bool)

(declare-fun b_and!1853 () Bool)

(assert (=> start!4138 (= tp!4549 b_and!1853)))

(declare-fun b!31062 () Bool)

(declare-fun res!18787 () Bool)

(declare-fun e!19888 () Bool)

(assert (=> b!31062 (=> (not res!18787) (not e!19888))))

(declare-datatypes ((array!2017 0))(
  ( (array!2018 (arr!962 (Array (_ BitVec 32) (_ BitVec 64))) (size!1063 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2017)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2017 (_ BitVec 32)) Bool)

(assert (=> b!31062 (= res!18787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31063 () Bool)

(declare-fun res!18788 () Bool)

(assert (=> b!31063 (=> (not res!18788) (not e!19888))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31063 (= res!18788 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!31064 () Bool)

(declare-fun res!18789 () Bool)

(assert (=> b!31064 (=> (not res!18789) (not e!19888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31064 (= res!18789 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1624 () Bool)

(declare-fun mapRes!1624 () Bool)

(declare-fun tp!4548 () Bool)

(declare-fun e!19889 () Bool)

(assert (=> mapNonEmpty!1624 (= mapRes!1624 (and tp!4548 e!19889))))

(declare-datatypes ((V!1687 0))(
  ( (V!1688 (val!725 Int)) )
))
(declare-datatypes ((ValueCell!499 0))(
  ( (ValueCellFull!499 (v!1814 V!1687)) (EmptyCell!499) )
))
(declare-datatypes ((array!2019 0))(
  ( (array!2020 (arr!963 (Array (_ BitVec 32) ValueCell!499)) (size!1064 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2019)

(declare-fun mapRest!1624 () (Array (_ BitVec 32) ValueCell!499))

(declare-fun mapKey!1624 () (_ BitVec 32))

(declare-fun mapValue!1624 () ValueCell!499)

(assert (=> mapNonEmpty!1624 (= (arr!963 _values!1501) (store mapRest!1624 mapKey!1624 mapValue!1624))))

(declare-fun b!31065 () Bool)

(declare-fun tp_is_empty!1397 () Bool)

(assert (=> b!31065 (= e!19889 tp_is_empty!1397)))

(declare-fun b!31066 () Bool)

(declare-fun res!18790 () Bool)

(assert (=> b!31066 (=> (not res!18790) (not e!19888))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31066 (= res!18790 (and (= (size!1064 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1063 _keys!1833) (size!1064 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31067 () Bool)

(declare-fun e!19886 () Bool)

(declare-fun e!19885 () Bool)

(assert (=> b!31067 (= e!19886 (and e!19885 mapRes!1624))))

(declare-fun condMapEmpty!1624 () Bool)

(declare-fun mapDefault!1624 () ValueCell!499)

