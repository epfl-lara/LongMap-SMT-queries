; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108842 () Bool)

(assert start!108842)

(declare-fun b_free!28355 () Bool)

(declare-fun b_next!28355 () Bool)

(assert (=> start!108842 (= b_free!28355 (not b_next!28355))))

(declare-fun tp!100180 () Bool)

(declare-fun b_and!46421 () Bool)

(assert (=> start!108842 (= tp!100180 b_and!46421)))

(declare-fun b!1285391 () Bool)

(declare-fun res!853902 () Bool)

(declare-fun e!734224 () Bool)

(assert (=> b!1285391 (=> (not res!853902) (not e!734224))))

(declare-datatypes ((array!85048 0))(
  ( (array!85049 (arr!41026 (Array (_ BitVec 32) (_ BitVec 64))) (size!41576 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85048)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85048 (_ BitVec 32)) Bool)

(assert (=> b!1285391 (= res!853902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285392 () Bool)

(declare-fun e!734221 () Bool)

(declare-fun tp_is_empty!33995 () Bool)

(assert (=> b!1285392 (= e!734221 tp_is_empty!33995)))

(declare-fun b!1285393 () Bool)

(declare-fun res!853904 () Bool)

(assert (=> b!1285393 (=> (not res!853904) (not e!734224))))

(declare-datatypes ((V!50429 0))(
  ( (V!50430 (val!17072 Int)) )
))
(declare-datatypes ((ValueCell!16099 0))(
  ( (ValueCellFull!16099 (v!19674 V!50429)) (EmptyCell!16099) )
))
(declare-datatypes ((array!85050 0))(
  ( (array!85051 (arr!41027 (Array (_ BitVec 32) ValueCell!16099)) (size!41577 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85050)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285393 (= res!853904 (and (= (size!41577 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41576 _keys!1741) (size!41577 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52550 () Bool)

(declare-fun mapRes!52550 () Bool)

(declare-fun tp!100181 () Bool)

(declare-fun e!734222 () Bool)

(assert (=> mapNonEmpty!52550 (= mapRes!52550 (and tp!100181 e!734222))))

(declare-fun mapRest!52550 () (Array (_ BitVec 32) ValueCell!16099))

(declare-fun mapKey!52550 () (_ BitVec 32))

(declare-fun mapValue!52550 () ValueCell!16099)

(assert (=> mapNonEmpty!52550 (= (arr!41027 _values!1445) (store mapRest!52550 mapKey!52550 mapValue!52550))))

(declare-fun b!1285394 () Bool)

(declare-fun e!734223 () Bool)

(assert (=> b!1285394 (= e!734223 (and e!734221 mapRes!52550))))

(declare-fun condMapEmpty!52550 () Bool)

(declare-fun mapDefault!52550 () ValueCell!16099)

